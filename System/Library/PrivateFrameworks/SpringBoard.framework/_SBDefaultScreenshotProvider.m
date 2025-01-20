@interface _SBDefaultScreenshotProvider
- (SBScreenFlash)flasher;
- (UIScreen)screen;
- (_SBDefaultScreenshotProvider)initWithScreen:(id)a3;
- (id)captureScreenshot;
@end

@implementation _SBDefaultScreenshotProvider

- (_SBDefaultScreenshotProvider)initWithScreen:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBDefaultScreenshotProvider;
  v6 = [(_SBDefaultScreenshotProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_screen, a3);
    v8 = [[SBScreenFlash alloc] initWithScreen:v5];
    flasher = v7->_flasher;
    v7->_flasher = v8;
  }
  return v7;
}

- (id)captureScreenshot
{
  uint64_t v3 = [MEMORY[0x1E4F43058] createIOSurfaceFromScreen:self->_screen];
  if (v3)
  {
    v4 = (const void *)v3;
    uint64_t v5 = _UICreateCGImageFromIOSurfaceWithOptions();
    if (v5)
    {
      v6 = (CGImage *)v5;
      v7 = (void *)MEMORY[0x1E4F42A80];
      [(UIScreen *)self->_screen scale];
      v8 = objc_msgSend(v7, "imageWithCGImage:scale:orientation:", v6, 0);
      CGImageRelease(v6);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (SBScreenFlash)flasher
{
  return self->_flasher;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flasher, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end