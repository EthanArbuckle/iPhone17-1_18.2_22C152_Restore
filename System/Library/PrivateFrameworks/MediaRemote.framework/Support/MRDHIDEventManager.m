@interface MRDHIDEventManager
- (void)_dispatchKeypressEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (void)dispatchHIDEvent:(__IOHIDEvent *)a3;
- (void)dispatchHomeButton;
- (void)dispatchKeypressEvent:(unint64_t)a3;
- (void)dispatchUnicodeEventWithText:(id)a3;
@end

@implementation MRDHIDEventManager

- (void)dispatchHIDEvent:(__IOHIDEvent *)a3
{
}

- (void)dispatchHomeButton
{
}

- (void)dispatchKeypressEvent:(unint64_t)a3
{
  if (a3 - 1 <= 2) {
    [(MRDHIDEventManager *)self _dispatchKeypressEventWithUsagePage:7 usage:dword_1003C53B0[a3 - 1]];
  }
}

- (void)dispatchUnicodeEventWithText:(id)a3
{
  id v4 = a3;
  mach_absolute_time();
  v5 = [v4 dataUsingEncoding:4];

  id v7 = v5;
  [v7 bytes];
  [v7 length];
  UnicodeEvent = (const void *)IOHIDEventCreateUnicodeEvent();
  [(MRDHIDEventManager *)self dispatchHIDEvent:UnicodeEvent];
  CFRelease(UnicodeEvent);
}

- (void)_dispatchKeypressEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  [(MRDHIDEventManager *)self dispatchHIDEvent:KeyboardEvent];
  CFRelease(KeyboardEvent);
  mach_absolute_time();
  v6 = (const void *)IOHIDEventCreateKeyboardEvent();
  [(MRDHIDEventManager *)self dispatchHIDEvent:v6];

  CFRelease(v6);
}

@end