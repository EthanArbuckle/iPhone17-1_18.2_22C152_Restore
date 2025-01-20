Swift::Int32 __swiftcall fork()()
{
  Swift::Int32 result;

  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall vfork()()
{
  return _assertionFailure(_:_:file:line:flags:)();
}