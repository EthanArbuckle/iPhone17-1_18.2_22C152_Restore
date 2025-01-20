id _log()
{
  void *v0;
  uint64_t vars8;

  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global);
  }
  v0 = (void *)_log_sLog;
  return v0;
}

uint64_t ___log_block_invoke()
{
  _log_sLog = (uint64_t)os_log_create("com.apple.siri.NonverbalCues", "NonverbalCues");
  return MEMORY[0x270F9A758]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}