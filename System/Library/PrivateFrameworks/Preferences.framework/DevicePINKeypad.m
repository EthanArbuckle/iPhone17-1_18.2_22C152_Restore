@interface DevicePINKeypad
- (BOOL)isMinimized;
- (DevicePINKeypad)init;
@end

@implementation DevicePINKeypad

- (DevicePINKeypad)init
{
  v7.receiver = self;
  v7.super_class = (Class)DevicePINKeypad;
  v2 = [(DevicePINKeypad *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(UIKeyboard *)v2 defaultTextInputTraits];
    [v4 setDevicePasscodeEntry:1];
    [(UIKeyboard *)v3 setDefaultTextInputTraits:v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6597000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "set devicePasscodeEntry (DevicePINKeypad)", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)isMinimized
{
  return 0;
}

@end