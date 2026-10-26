# an exec statement at a lowercase type variable is written `_ : a <- m`:
# a bare lowercase name before `<-` reads as a bind that lost its type
# (do_exec_type_var_bare), unless it names a declared type (#1787)
import Base

def f(-a: Type, x: a) -> IO(Unit):
  do IO<Unit>:
    _ : a <- IO.pure(a, x)
    IO.print("ok")

def main() -> IO(Unit):
  f(U32, 1)

#|ok
