@interface PTEffectDescriptor
- (BOOL)allowSkipOutColorBufferWrite;
- (BOOL)externalCamera;
- (BOOL)externalHandDetectionsEnabled;
- (BOOL)laguna;
- (BOOL)prewarmOnly;
- (BOOL)syncInitialization;
- (CGSize)colorSize;
- (CGSize)externalDisparitySize;
- (MTLCommandQueue)metalCommandQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)effectQuality;
- (unint64_t)activeEffectType;
- (unint64_t)availableEffectTypes;
- (void)setActiveEffectType:(unint64_t)a3;
- (void)setAllowSkipOutColorBufferWrite:(BOOL)a3;
- (void)setAvailableEffectTypes:(unint64_t)a3;
- (void)setColorSize:(CGSize)a3;
- (void)setEffectQuality:(int64_t)a3;
- (void)setExternalCamera:(BOOL)a3;
- (void)setExternalDisparitySize:(CGSize)a3;
- (void)setExternalHandDetectionsEnabled:(BOOL)a3;
- (void)setLaguna:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setPrewarmOnly:(BOOL)a3;
- (void)setSyncInitialization:(BOOL)a3;
@end

@implementation PTEffectDescriptor

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(PTEffectDescriptor *)self metalCommandQueue];
  [v4 setMetalCommandQueue:v5];

  [(PTEffectDescriptor *)self colorSize];
  objc_msgSend(v4, "setColorSize:");
  [(PTEffectDescriptor *)self externalDisparitySize];
  objc_msgSend(v4, "setExternalDisparitySize:");
  objc_msgSend(v4, "setAvailableEffectTypes:", -[PTEffectDescriptor availableEffectTypes](self, "availableEffectTypes"));
  objc_msgSend(v4, "setActiveEffectType:", -[PTEffectDescriptor activeEffectType](self, "activeEffectType"));
  objc_msgSend(v4, "setEffectQuality:", -[PTEffectDescriptor effectQuality](self, "effectQuality"));
  objc_msgSend(v4, "setPrewarmOnly:", -[PTEffectDescriptor prewarmOnly](self, "prewarmOnly"));
  objc_msgSend(v4, "setLaguna:", -[PTEffectDescriptor laguna](self, "laguna"));
  objc_msgSend(v4, "setExternalHandDetectionsEnabled:", -[PTEffectDescriptor externalHandDetectionsEnabled](self, "externalHandDetectionsEnabled"));
  objc_msgSend(v4, "setAllowSkipOutColorBufferWrite:", -[PTEffectDescriptor allowSkipOutColorBufferWrite](self, "allowSkipOutColorBufferWrite"));
  objc_msgSend(v4, "setSyncInitialization:", -[PTEffectDescriptor syncInitialization](self, "syncInitialization"));
  objc_msgSend(v4, "setExternalCamera:", -[PTEffectDescriptor externalCamera](self, "externalCamera"));
  return v4;
}

- (unint64_t)activeEffectType
{
  return self->_activeEffectType;
}

- (BOOL)prewarmOnly
{
  return self->_prewarmOnly;
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (BOOL)allowSkipOutColorBufferWrite
{
  return self->_allowSkipOutColorBufferWrite;
}

- (BOOL)syncInitialization
{
  return self->_syncInitialization;
}

- (void)setAvailableEffectTypes:(unint64_t)a3
{
  self->_availableEffectTypes = a3;
}

- (void)setSyncInitialization:(BOOL)a3
{
  self->_syncInitialization = a3;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (void)setLaguna:(BOOL)a3
{
  self->_laguna = a3;
}

- (void)setExternalDisparitySize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_externalDisparitySize, &v3, 16, 1, 0);
}

- (void)setExternalCamera:(BOOL)a3
{
  self->_externalCamera = a3;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->_effectQuality = a3;
}

- (void)setColorSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_colorSize, &v3, 16, 1, 0);
}

- (void)setAllowSkipOutColorBufferWrite:(BOOL)a3
{
  self->_allowSkipOutColorBufferWrite = a3;
}

- (void)setActiveEffectType:(unint64_t)a3
{
  self->_activeEffectType = a3;
}

- (BOOL)laguna
{
  return self->_laguna;
}

- (void)setPrewarmOnly:(BOOL)a3
{
  self->_prewarmOnly = a3;
}

- (void)setExternalHandDetectionsEnabled:(BOOL)a3
{
  self->_externalHandDetectionsEnabled = a3;
}

- (BOOL)externalHandDetectionsEnabled
{
  return self->_externalHandDetectionsEnabled;
}

- (CGSize)externalDisparitySize
{
  objc_copyStruct(v4, &self->_externalDisparitySize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)externalCamera
{
  return self->_externalCamera;
}

- (CGSize)colorSize
{
  objc_copyStruct(v4, &self->_colorSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)availableEffectTypes
{
  return self->_availableEffectTypes;
}

@end