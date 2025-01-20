@interface SBFMagnifyMode
+ (id)currentMagnifyMode;
+ (id)magnifyModeWithSize:(CGSize)a3 name:(id)a4;
+ (void)currentMagnifyMode;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSString)description;
- (NSString)name;
- (SBFMagnifyMode)init;
- (float)zoomFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setName:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setZoomFactor:(float)a3;
@end

@implementation SBFMagnifyMode

+ (id)currentMagnifyMode
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  v3 = [v2 displayConfiguration];

  uint64_t v9 = 0;
  [v3 deviceName];
  int v4 = IOMobileFramebufferOpenByName();
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[SBFMagnifyMode currentMagnifyMode];
  }

  v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[SBFMagnifyMode currentMagnifyMode](v8);
  }

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

+ (id)magnifyModeWithSize:(CGSize)a3 name:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setSize:", width, height);
  [v8 setName:v7];

  LODWORD(v9) = 1.0;
  [v8 setZoomFactor:v9];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSize:", self->_size.width, self->_size.height);
  [v4 setName:self->_name];
  *(float *)&double v5 = self->_zoomFactor;
  [v4 setZoomFactor:v5];
  return v4;
}

- (SBFMagnifyMode)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBFMagnifyMode;
  result = [(SBFMagnifyMode *)&v3 init];
  if (result) {
    result->_zoomFactor = 1.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 size];
    double v7 = v6;
    double v9 = v8;
    [(SBFMagnifyMode *)self size];
    if (v7 == v11 && v9 == v10)
    {
      v14 = [(SBFMagnifyMode *)self name];
      id v15 = [v5 name];
      if ([v14 isEqualToString:v15])
      {
        [(SBFMagnifyMode *)self zoomFactor];
        float v17 = v16;
        [v5 zoomFactor];
        BOOL v13 = v17 == v18;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", self->_size.width, self->_size.height);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBFMagnifyMode *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBFMagnifyMode *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(SBFMagnifyMode *)self name];
  id v6 = (id)[v4 appendObject:v5 withName:@"name"];

  [(SBFMagnifyMode *)self zoomFactor];
  id v8 = (id)[v4 appendFloat:@"zoomFactor" withName:v7];
  [(SBFMagnifyMode *)self size];
  id v9 = (id)objc_msgSend(v4, "appendSize:withName:", @"size");
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBFMagnifyMode *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(float)a3
{
  self->_zoomFactor = a3;
}

- (void).cxx_destruct
{
}

+ (void)currentMagnifyMode
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  id v4 = "IOMobileFramebufferRef SBFCreateMobileFrameBuffer()";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "%s Returning NULL framebuffer because IOMobileFramebufferOpenByName() gave us a NULL framebuffer. display: %{public}@, ioResult: %x", (uint8_t *)&v3, 0x1Cu);
}

@end