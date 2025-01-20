@interface _TUIGradientContainerLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (_TUIGradientContainerLayerConfig)initWithStyle:(id)a3;
- (_TUIGradientStyler)style;
- (void)configureLayer:(id)a3;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _TUIGradientContainerLayerConfig

- (_TUIGradientContainerLayerConfig)initWithStyle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIGradientContainerLayerConfig;
  v6 = [(_TUIGradientContainerLayerConfig *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_style, a3);
  }

  return v7;
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
}

- (void)configureLayer:(id)a3
{
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  if (v6)
  {
    style = self->_style;
    v8 = [v6 style];
    unsigned __int8 v9 = [(_TUIGradientStyler *)style isEqualToStyle:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (Class)layerClass
{
  v3 = [(_TUIGradientStyler *)self->_style blendMode];
  if (![v3 isEqualToString:kCAFilterVariableBlur])
  {
    id v4 = [(_TUIGradientStyler *)self->_style blendMode];
    [v4 isEqualToString:kCAFilterGaussianBlur];
  }
  uint64_t v5 = objc_opt_class();

  return (Class)v5;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (_TUIGradientStyler)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end