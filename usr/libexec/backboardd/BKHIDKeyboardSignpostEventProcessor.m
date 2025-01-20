@interface BKHIDKeyboardSignpostEventProcessor
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
@end

@implementation BKHIDKeyboardSignpostEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (*a3)
  {
    IOHIDEventGetTimeStamp();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
  }
  kdebug_trace();
  int IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
  if (IntegerValue != 7 && IntegerValue != 65289)
  {
    v11 = sub_10005FA78();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v7 eventSource];
      v12 = _BKSHIDEventGetConciseDescriptionKeyboard();
      int v15 = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  v13 = [v7 displayUUID];
  _BKHIDNoteUserEventOccurredOnDisplay();

  return 0;
}

@end