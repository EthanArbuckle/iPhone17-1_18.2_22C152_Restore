@interface _TUISymbolImageLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (_TUISymbolImageLayerConfig)initWithContentsScale:(double)a3 image:(id)a4 color:(id)a5 hflip:(BOOL)a6 blendMode:(id)a7;
- (id)compositingFilter;
- (void)configureBounds:(id)a3;
- (void)configureLayer:(id)a3;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _TUISymbolImageLayerConfig

- (_TUISymbolImageLayerConfig)initWithContentsScale:(double)a3 image:(id)a4 color:(id)a5 hflip:(BOOL)a6 blendMode:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_TUISymbolImageLayerConfig;
  v16 = [(_TUISymbolImageLayerConfig *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->_contentsScale = a3;
    objc_storeStrong((id *)&v16->_image, a4);
    objc_storeStrong((id *)&v17->_color, a5);
    v17->_hflip = a6;
    v18 = (NSString *)[v15 copy];
    blendMode = v17->_blendMode;
    v17->_blendMode = v18;
  }
  return v17;
}

- (BOOL)isEqualToConfig:(id)a3
{
  v4 = (_TUISymbolImageLayerConfig *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = TUIDynamicCast(v9, v4);
    v6 = (void *)v10;
    if (v10)
    {
      if (self->_contentsScale == *(double *)(v10 + 8) && self->_hflip == *(unsigned __int8 *)(v10 + 32))
      {
        image = self->_image;
        if (image == (TUISymbolImage *)v6[2] || -[TUISymbolImage isEqual:](image, "isEqual:"))
        {
          color = self->_color;
          if (color == (UIColor *)v6[3] || -[UIColor isEqual:](color, "isEqual:"))
          {
            blendMode = self->_blendMode;
            if (blendMode == (NSString *)v6[5]) {
              unsigned __int8 v7 = 1;
            }
            else {
              unsigned __int8 v7 = -[NSString isEqual:](blendMode, "isEqual:");
            }
            goto LABEL_5;
          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }
  unsigned __int8 v7 = 0;
LABEL_5:

LABEL_7:
  return v7;
}

- (void)configureLayer:(id)a3
{
  double contentsScale = self->_contentsScale;
  id v5 = a3;
  [v5 setContentsScale:contentsScale];
  [v5 setFlipsHorizontalAxis:self->_hflip];
  [v5 updateContentAndBoundsWithImage:self->_image color:self->_color];
  id v6 = [(_TUISymbolImageLayerConfig *)self compositingFilter];
  [v5 setContentCompositingFilter:v6];
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
}

- (void)configureBounds:(id)a3
{
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)compositingFilter
{
  if (self->_blendMode)
  {
    v2 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end