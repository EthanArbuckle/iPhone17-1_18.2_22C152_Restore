@interface _TUIRuleLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (UIColor)color;
- (_TUIRuleLayerConfig)initWithColor:(id)a3;
- (void)configureLayer:(id)a3;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _TUIRuleLayerConfig

- (_TUIRuleLayerConfig)initWithColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIRuleLayerConfig;
  v6 = [(_TUIRuleLayerConfig *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  return (Class)objc_opt_class();
}

- (void)configureLayer:(id)a3
{
  color = self->_color;
  id v4 = a3;
  [v4 setBackgroundColor:[color CGColor]];
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
  color = self->_color;
  id v4 = a3;
  [v4 setBackgroundColor:[color CGColor]];
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = (_TUIRuleLayerConfig *)a3;
  if (self == v4)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(_TUIRuleLayerConfig *)v4 color];
      color = self->_color;
      if (color == v7) {
        unsigned __int8 v6 = 1;
      }
      else {
        unsigned __int8 v6 = [(UIColor *)color isEqual:v7];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end