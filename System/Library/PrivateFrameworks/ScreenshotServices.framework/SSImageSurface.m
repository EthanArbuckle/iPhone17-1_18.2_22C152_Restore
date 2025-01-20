@interface SSImageSurface
+ (BOOL)supportsBSXPCSecureCoding;
- (SSImageSurface)init;
- (SSImageSurface)initWithBSXPCCoder:(id)a3;
- (__IOSurface)backingSurface;
- (double)scale;
- (int64_t)orientation;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setBackingSurface:(__IOSurface *)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setScale:(double)a3;
@end

@implementation SSImageSurface

- (SSImageSurface)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSImageSurface;
  v2 = [(SSImageSurface *)&v5 init];
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  -[SSImageSurface setScale:](v2, "setScale:");

  [(SSImageSurface *)v2 setOrientation:0];
  return v2;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id XPCObject = IOSurfaceCreateXPCObject([(SSImageSurface *)self backingSurface]);
  [v4 encodeXPCObject:XPCObject forKey:@"SSImageSurfaceBackingSurfaceKey"];
  [(SSImageSurface *)self scale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SSImageSurfaceImageScaleKey");
  objc_msgSend(v4, "encodeInt64:forKey:", -[SSImageSurface orientation](self, "orientation"), @"SSImageSurfaceImageOrientationKey");
}

- (SSImageSurface)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SSImageSurface *)self init];
  v6 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8748] forKey:@"SSImageSurfaceBackingSurfaceKey"];
  IOSurfaceRef v7 = IOSurfaceLookupFromXPCObject(v6);
  v5->_backingSurface = v7;
  [v4 decodeDoubleForKey:@"SSImageSurfaceImageScaleKey"];
  v5->_scale = v8;
  uint64_t v9 = [v4 decodeInt64ForKey:@"SSImageSurfaceImageOrientationKey"];

  v5->_orientation = v9;
  if (v7 && IOSurfaceSetOwnership())
  {
    v10 = os_log_create("com.apple.screenshotservices", "Surface");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SSImageSurface initWithBSXPCCoder:](v10);
    }
  }
  return v5;
}

- (void)setBackingSurface:(__IOSurface *)a3
{
  backingSurface = self->_backingSurface;
  if (backingSurface != a3)
  {
    if (backingSurface) {
      CFRelease(backingSurface);
    }
    self->_backingSurface = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)dealloc
{
  backingSurface = self->_backingSurface;
  if (backingSurface) {
    CFRelease(backingSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSImageSurface;
  [(SSImageSurface *)&v4 dealloc];
}

- (__IOSurface)backingSurface
{
  return self->_backingSurface;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)initWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *MEMORY[0x263EF8960];
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_21ECED000, log, OS_LOG_TYPE_FAULT, "Failed to assign surface ownership to task %d", (uint8_t *)v2, 8u);
}

@end