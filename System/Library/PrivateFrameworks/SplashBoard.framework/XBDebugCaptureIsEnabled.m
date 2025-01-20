@interface XBDebugCaptureIsEnabled
@end

@implementation XBDebugCaptureIsEnabled

void ___XBDebugCaptureIsEnabled_block_invoke()
{
  CFPreferencesSynchronize(@"com.apple.splashboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v1 = (id)CFPreferencesCopyAppValue(@"_XBEncodeGeneratedInterfaces", @"com.apple.splashboard");
  if (objc_opt_respondsToSelector()) {
    char v0 = [v1 BOOLValue];
  }
  else {
    char v0 = 0;
  }
  _XBDebugCaptureIsEnabled_sEncodingEnabled = v0;
}

@end