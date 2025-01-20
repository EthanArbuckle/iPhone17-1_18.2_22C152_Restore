@interface UIScreenMode
+ (id)_screenModeForDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5;
- (CGFloat)pixelAspectRatio;
- (CGSize)_sizeWithLevel:(unint64_t)a3;
- (CGSize)size;
- (UIScreenMode)initWithDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5;
- (id)_displayMode;
- (id)description;
@end

@implementation UIScreenMode

- (CGSize)size
{
  -[UIScreenMode _sizeWithLevel:](self, "_sizeWithLevel:", 2, 0, 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeWithLevel:(unint64_t)a3
{
  [(FBSDisplayMode *)self->_mode pixelSize];
  double v6 = v5;
  double v8 = v7;
  if (self->_isMainScreen) {
    double v9 = _UIScreenForcedMainScreenScale(a3) / self->_scale;
  }
  else {
    double v9 = 1.0;
  }
  double v10 = v6 * v9;
  double v11 = v8 * v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)_screenModeForDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  CFDictionaryRef Mutable = (const __CFDictionary *)sScreenModes;
  if (!sScreenModes)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    sScreenModes = (uint64_t)Mutable;
  }
  CFDictionaryGetValue(Mutable, v7);
  double v9 = (UIScreenMode *)(id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    double v9 = [[UIScreenMode alloc] initWithDisplayMode:v7 mainScreen:v6 actualDisplayScale:a5];
    CFDictionarySetValue((CFMutableDictionaryRef)sScreenModes, v7, v9);
  }
  double v10 = v9;

  return v10;
}

- (UIScreenMode)initWithDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIScreenMode;
  double v10 = [(UIScreenMode *)&v13 init];
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mode, a3);
    v11->_isMainScreen = a4;
    v11->_scale = a5;
  }

  return v11;
}

- (CGFloat)pixelAspectRatio
{
  return 1.0;
}

- (id)_displayMode
{
  return self->_mode;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (void *)MEMORY[0x18C108260]();
  [v3 appendFormat:@"<%@: %p", objc_opt_class(), self];
  [(UIScreenMode *)self _sizeWithLevel:0];
  objc_msgSend(v3, "appendFormat:", @"; size = %f x %f", v5, v6);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end