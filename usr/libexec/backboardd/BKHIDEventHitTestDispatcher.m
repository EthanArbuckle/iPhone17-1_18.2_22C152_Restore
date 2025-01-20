@interface BKHIDEventHitTestDispatcher
- (void)sendEvent:(__IOHIDEvent *)a3 toClientTaskPort:(unsigned int)a4;
@end

@implementation BKHIDEventHitTestDispatcher

- (void)sendEvent:(__IOHIDEvent *)a3 toClientTaskPort:(unsigned int)a4
{
  if (a4 - 1 > 0xFFFFFFFD)
  {
    v5 = BKLogMousePointer();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "can't dispatch pointer event to invalid client port 0x%X", (uint8_t *)v6, 8u);
    }
  }
  else
  {
    _BKSendHIDEventToClientWithTaskPort(a3, *(void *)&a4);
  }
}

@end