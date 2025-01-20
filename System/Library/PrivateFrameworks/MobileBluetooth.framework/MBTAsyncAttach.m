@interface MBTAsyncAttach
@end

@implementation MBTAsyncAttach

uint64_t ___MBTAsyncAttach_block_invoke(uint64_t a1)
{
  if (MBFLogInitOnce != -1) {
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  }
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG)) {
    ___MBTAsyncAttach_block_invoke_cold_1();
  }
  uint64_t result = _MBTSignalSessionEvent(*(void *)(a1 + 32), 0, 0);
  gSessionAttachTries = 0;
  return result;
}

void ___MBTAsyncAttach_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1BBE7C000, v0, v1, "MBFXPC LOG Signalling BT_SESSION_ATTACHED SUCCESS", v2, v3, v4, v5, v6);
}

@end