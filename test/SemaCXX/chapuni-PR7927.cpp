// RUN: %clang_cc1 -fsyntax-only %s 
// XFAIL: *
enum T {E};

extern "C" void f(int);

namespace {
  extern "C" void f(int);

  void foo()
  {
    f(E);    // err
    f(0);
    ::f(E);
    ::f(0);
  }
}

void bar()
{
  f(E);    // err
  f(0);    // err
  ::f(E);
  ::f(0);
}
