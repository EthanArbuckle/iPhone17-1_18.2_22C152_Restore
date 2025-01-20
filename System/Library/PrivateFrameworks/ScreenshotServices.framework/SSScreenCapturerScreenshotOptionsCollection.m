@interface SSScreenCapturerScreenshotOptionsCollection
- (id)screenshotOptionsForScreen:(id)a3;
- (void)setScreenshotOptions:(id)a3 forScreen:(id)a4;
@end

@implementation SSScreenCapturerScreenshotOptionsCollection

- (void)setScreenshotOptions:(id)a3 forScreen:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v13;
  id v8 = v6;
  screenToScreenshotOptions = self->_screenToScreenshotOptions;
  if (v13)
  {
    if (!screenToScreenshotOptions)
    {
      v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
      v11 = self->_screenToScreenshotOptions;
      self->_screenToScreenshotOptions = v10;

      id v7 = v13;
      screenToScreenshotOptions = self->_screenToScreenshotOptions;
    }
    [(NSMapTable *)screenToScreenshotOptions setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMapTable *)screenToScreenshotOptions removeObjectForKey:v8];
    if (![(NSMapTable *)self->_screenToScreenshotOptions count])
    {
      v12 = self->_screenToScreenshotOptions;
      self->_screenToScreenshotOptions = 0;
    }
  }
}

- (id)screenshotOptionsForScreen:(id)a3
{
  return [(NSMapTable *)self->_screenToScreenshotOptions objectForKey:a3];
}

- (void).cxx_destruct
{
}

@end