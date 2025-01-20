@interface _UIFocusHardwareKeyboardObserver
- (BOOL)isActive;
- (_UIFocusHardwareKeyboardObserver)init;
- (void)dealloc;
@end

@implementation _UIFocusHardwareKeyboardObserver

- (_UIFocusHardwareKeyboardObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusHardwareKeyboardObserver;
  v2 = [(_UIFocusStateObserver *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__hardwareKeyboardAvailabilityChanged_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusHardwareKeyboardObserver;
  [(_UIFocusHardwareKeyboardObserver *)&v4 dealloc];
}

- (BOOL)isActive
{
  v2 = +[UIDevice currentDevice];
  char v3 = [v2 _isHardwareKeyboardAvailable];

  return v3;
}

@end