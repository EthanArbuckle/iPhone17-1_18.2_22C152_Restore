@interface VUIJSDevice
+ (BOOL)isSearchEnabled;
+ (id)getMobileGestaltString:(__CFString *)a3;
- (BOOL)isInRetailDemoMode;
- (BOOL)isSeedBuild;
- (BOOL)nativeDisplaysPlaybackModePrompt;
- (BOOL)runningAnInternalBuild;
- (BOOL)supportsSharedWatchPostPlayBinge;
- (NSString)model;
- (NSString)osBuildNumber;
- (NSString)productType;
- (NSString)systemVersion;
- (VUIJSDevice)initWithAppContext:(id)a3;
- (void)dealloc;
@end

@implementation VUIJSDevice

+ (BOOL)isSearchEnabled
{
  return MEMORY[0x1F4168290](0, a2);
}

- (BOOL)supportsSharedWatchPostPlayBinge
{
  return 1;
}

- (BOOL)nativeDisplaysPlaybackModePrompt
{
  return 1;
}

- (BOOL)isSeedBuild
{
  return 0;
}

- (NSString)systemVersion
{
  return (NSString *)[MEMORY[0x1E4FB3C90] systemVersion];
}

- (BOOL)runningAnInternalBuild
{
  return [MEMORY[0x1E4FB3C70] runningAnInternalBuild];
}

- (NSString)osBuildNumber
{
  return (NSString *)@"unknown";
}

- (NSString)model
{
  return (NSString *)[MEMORY[0x1E4FB3C90] model];
}

- (BOOL)isInRetailDemoMode
{
  return +[VUIUtilities isInRetailDemoMode];
}

- (NSString)productType
{
  v2 = objc_opt_class();
  return (NSString *)[v2 getMobileGestaltString:@"ProductType"];
}

- (VUIJSDevice)initWithAppContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIJSDevice;
  return [(VUIJSObject *)&v4 initWithAppContext:a3];
}

+ (id)getMobileGestaltString:(__CFString *)a3
{
  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    objc_super v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      v6 = [NSString stringWithString:v4];
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_networkPropertiesChangedToken];

  v4.receiver = self;
  v4.super_class = (Class)VUIJSDevice;
  [(VUIJSDevice *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end