# a bare lowercase name before `<-` that names no declared type is a bind
# that lost its type, even when it is a type variable: the exec form at a
# itself is written `_ : a <- m` (do_exec_type_var) (#1787)
import Base

def f(-a: Type, x: a) -> IO(Unit):
  do IO<Unit>:
    a <- IO.pure(a, x)
    IO.print("ok")

def main() -> IO(Unit):
  f(U32, 1)

#|SOME PROOFS FAIL
#|Error:
#|- expected : a typed bind (x : A <- m) or let (x : A = v)
#|- observed : 'a <- IO.pure(a, x)'
#|Location:
#|7 |   do IO<Unit>:
#|8>|     a <- IO.pure(a, x)
#|  |     ^^^^^^^^^^^^^^^^^^
#|9 |     IO.print("ok")
#|exit 1
