@interface TFCapabilities
+ (BOOL)hasExtendedColorDisplay;
+ (BOOL)isHardwareKeyboardAttached;
+ (BOOL)isInternalBuild;
- (TFCapabilities)init;
@end

@implementation TFCapabilities

+ (BOOL)isInternalBuild
{
  return static Capabilities.isInternalBuild()() & 1;
}

+ (BOOL)hasExtendedColorDisplay
{
  return static Capabilities.hasExtendedColorDisplay()() & 1;
}

+ (BOOL)isHardwareKeyboardAttached
{
  return static Capabilities.isHardwareKeyboardAttached()();
}

- (TFCapabilities)init
{
  return (TFCapabilities *)Capabilities.init()();
}

@end