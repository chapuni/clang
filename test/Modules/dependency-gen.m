// RUN: rm -rf %t-mcp
// RUN: mkdir -p %t-mcp

// RUN: %clang_cc1 -x objective-c -dependency-file %t.d.1 -MT %s.o -I %S/Inputs -fsyntax-only -fmodules -fmodules-cache-path=%t-mcp %s
// RUN: FileCheck %s < %t.d.1
// CHECK: dependency-gen.m
// CHECK: Inputs/diamond_top.h
// CHECK: Inputs/module.map
// CHECK-NOT: string.h


// RUN: %clang_cc1 -x objective-c -dependency-file %t.d.2 -MT %s.o -I %S/Inputs -sys-header-deps -fsyntax-only -fmodules -fmodules-cache-path=%t-mcp %s
// RUN: FileCheck %s -check-prefix=CHECK-SYS < %t.d.2
// CHECK-SYS: dependency-gen.m
// CHECK-SYS: Inputs/diamond_top.h
// CHECK-SYS: Inputs/module.map
// CHECK-SYS: string.h

#import "diamond_top.h"
#import "string.h"