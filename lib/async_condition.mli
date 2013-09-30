(** Async's implementation of the standard notion of a "condition" variable.

    This is analogous to OCaml's [Condition] module.  The main guarantee that a condition
    variable provides is that a call to [signal] (or [broadcast]) after a call to [wait]
    will be seen by the waiter.

    Unlike the use of condition variables in ordinary threaded programs, async condition
    variables do not require a mutex, since async programs are cooperatively threaded. *)

open Core.Std

type 'a t with sexp_of

val create : unit -> _ t
val signal : 'a t -> 'a -> unit
val broadcast : 'a t -> 'a -> unit
val wait : 'a t -> 'a Deferred.t
