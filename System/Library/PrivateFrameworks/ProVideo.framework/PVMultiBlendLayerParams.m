@interface PVMultiBlendLayerParams
+ (BOOL)supportsSecureCoding;
- (PVMultiBlendLayerParams)init;
- (PVMultiBlendLayerParams)initWithCoder:(id)a3;
- (PVMultiBlendLayerParams)initWithOpacity:(float)a3 mode:(int)a4;
- (float)opacity;
- (id)blendModeName;
- (id)copyWithZone:(_NSZone *)a3;
- (int)hgBlendMode;
- (int)mode;
- (void)_sharedInitWithOpacity:(float)a3 mode:(int)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(int)a3;
- (void)setOpacity:(float)a3;
@end

@implementation PVMultiBlendLayerParams

- (PVMultiBlendLayerParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVMultiBlendLayerParams;
  v5 = [(PVMultiBlendLayerParams *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"opacity"];
    [v6 floatValue];
    int v8 = v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    uint64_t v10 = [v9 integerValue];

    LODWORD(v11) = v8;
    [(PVMultiBlendLayerParams *)v5 _sharedInitWithOpacity:v10 mode:v11];
  }

  return v5;
}

- (PVMultiBlendLayerParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)PVMultiBlendLayerParams;
  v2 = [(PVMultiBlendLayerParams *)&v6 init];
  id v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    [(PVMultiBlendLayerParams *)v2 _sharedInitWithOpacity:0 mode:v3];
  }
  return v4;
}

- (PVMultiBlendLayerParams)initWithOpacity:(float)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v10.receiver = self;
  v10.super_class = (Class)PVMultiBlendLayerParams;
  objc_super v6 = [(PVMultiBlendLayerParams *)&v10 init];
  int v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = a3;
    [(PVMultiBlendLayerParams *)v6 _sharedInitWithOpacity:v4 mode:v7];
  }
  return v8;
}

- (void)_sharedInitWithOpacity:(float)a3 mode:(int)a4
{
  self->_opacity = a3;
  self->_mode = a4;
}

- (id)blendModeName
{
  return -[PVMultiBlendLayerParams blendModeName]::s_nameMap[self->_mode];
}

- (int)hgBlendMode
{
  return -[PVMultiBlendLayerParams hgBlendMode]::s_pvToHGBlendMap[self->_mode];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:self->_mode];
  [v7 encodeObject:v4 forKey:@"mode"];

  *(float *)&double v5 = self->_opacity;
  objc_super v6 = [NSNumber numberWithFloat:v5];
  [v7 encodeObject:v6 forKey:@"opacity"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->_opacity;
  uint64_t mode = self->_mode;

  return (id)[v4 initWithOpacity:mode mode:v5];
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_uint64_t mode = a3;
}

@end