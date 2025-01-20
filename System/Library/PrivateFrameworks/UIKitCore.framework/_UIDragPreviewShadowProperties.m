@interface _UIDragPreviewShadowProperties
+ (BOOL)supportsSecureCoding;
- (CGAffineTransform)liftedTransform;
- (_UIDragPreviewShadowProperties)init;
- (_UIDragPreviewShadowProperties)initWithCoder:(id)a3;
- (double)liftedAlpha;
- (double)radiosityBlurRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)shadowType;
- (void)encodeWithCoder:(id)a3;
- (void)setLiftedAlpha:(double)a3;
- (void)setLiftedTransform:(CGAffineTransform *)a3;
- (void)setRadiosityBlurRadius:(double)a3;
- (void)setShadowType:(int64_t)a3;
@end

@implementation _UIDragPreviewShadowProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIDragPreviewShadowProperties)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragPreviewShadowProperties;
  result = [(_UIDragPreviewShadowProperties *)&v5 init];
  if (result)
  {
    result->_shadowType = 0;
    long long v3 = *MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&result->_liftedTransform.c = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_liftedTransform.tx = v4;
    *(_OWORD *)&result->_liftedAlpha = xmmword_186B9D370;
    *(_OWORD *)&result->_liftedTransform.a = v3;
  }
  return result;
}

- (_UIDragPreviewShadowProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragPreviewShadowProperties;
  objc_super v5 = [(_UIDragPreviewShadowProperties *)&v12 init];
  if (v5)
  {
    v5->_shadowType = [v4 decodeIntegerForKey:@"shadowType"];
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"liftedTransform"];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v9 = 0u;
    }
    *(_OWORD *)&v5->_liftedTransform.a = v9;
    *(_OWORD *)&v5->_liftedTransform.c = v10;
    *(_OWORD *)&v5->_liftedTransform.tx = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", @"liftedAlpha", v9, v10, v11);
    v5->_liftedAlpha = v6;
    [v4 decodeDoubleForKey:@"radiosityBlurRadius"];
    v5->_radiosityBlurRadius = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t shadowType = self->_shadowType;
  id v5 = a3;
  [v5 encodeInteger:shadowType forKey:@"shadowType"];
  long long v6 = *(_OWORD *)&self->_liftedTransform.c;
  v7[0] = *(_OWORD *)&self->_liftedTransform.a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_liftedTransform.tx;
  [v5 encodeCGAffineTransform:v7 forKey:@"liftedTransform"];
  [v5 encodeDouble:@"liftedAlpha" forKey:self->_liftedAlpha];
  [v5 encodeDouble:@"radiosityBlurRadius" forKey:self->_radiosityBlurRadius];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_UIDragPreviewShadowProperties);
  [(_UIDragPreviewShadowProperties *)v4 setShadowType:[(_UIDragPreviewShadowProperties *)self shadowType]];
  [(_UIDragPreviewShadowProperties *)self liftedTransform];
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [(_UIDragPreviewShadowProperties *)v4 setLiftedTransform:v6];
  [(_UIDragPreviewShadowProperties *)self liftedAlpha];
  -[_UIDragPreviewShadowProperties setLiftedAlpha:](v4, "setLiftedAlpha:");
  [(_UIDragPreviewShadowProperties *)self radiosityBlurRadius];
  -[_UIDragPreviewShadowProperties setRadiosityBlurRadius:](v4, "setRadiosityBlurRadius:");
  return v4;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (void)setShadowType:(int64_t)a3
{
  self->_int64_t shadowType = a3;
}

- (CGAffineTransform)liftedTransform
{
  long long v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void)setLiftedTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_liftedTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_liftedTransform.tx = v4;
  *(_OWORD *)&self->_liftedTransform.a = v3;
}

- (double)liftedAlpha
{
  return self->_liftedAlpha;
}

- (void)setLiftedAlpha:(double)a3
{
  self->_liftedAlpha = a3;
}

- (double)radiosityBlurRadius
{
  return self->_radiosityBlurRadius;
}

- (void)setRadiosityBlurRadius:(double)a3
{
  self->_radiosityBlurRadius = a3;
}

@end