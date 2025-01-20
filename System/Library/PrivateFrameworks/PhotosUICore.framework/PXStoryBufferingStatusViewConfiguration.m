@interface PXStoryBufferingStatusViewConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsBackground;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setWantsBackground:(BOOL)a3;
@end

@implementation PXStoryBufferingStatusViewConfiguration

- (void)setWantsBackground:(BOOL)a3
{
  self->_wantsBackground = a3;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXStoryBufferingStatusViewConfiguration);
  [(PXStoryBufferingStatusViewConfiguration *)v4 setWantsBackground:[(PXStoryBufferingStatusViewConfiguration *)self wantsBackground]];
  return v4;
}

- (unint64_t)hash
{
  return [(PXStoryBufferingStatusViewConfiguration *)self wantsBackground];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryBufferingStatusViewConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(PXStoryBufferingStatusViewConfiguration *)v4 wantsBackground];
      int v6 = v5 ^ [(PXStoryBufferingStatusViewConfiguration *)self wantsBackground] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

@end