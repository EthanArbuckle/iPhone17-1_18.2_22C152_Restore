void *_MXSignpostMetricsSnapshot(void)
{
  if (_MXSignpostMetricsSnapshot_onceToken != -1) {
    dispatch_once(&_MXSignpostMetricsSnapshot_onceToken, &__block_literal_global_5);
  }
  return (void *)_MXSignpostMetricsSnapshot_snapshotter;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x270F9ABB0]();
}

uint64_t pc_session_create_snapshot_buf()
{
  return MEMORY[0x270F9ABB8]();
}