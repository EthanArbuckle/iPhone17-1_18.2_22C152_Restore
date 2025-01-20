@interface _UIVisualEffectTintLayerConfig
+ (id)layerWithTintColor:(id)a3;
+ (id)layerWithTintColor:(id)a3 filterType:(id)a4;
- (UIColor)tintColor;
- (id)description;
- (void)configureLayerView:(id)a3;
- (void)deconfigureLayerView:(id)a3;
@end

@implementation _UIVisualEffectTintLayerConfig

+ (id)layerWithTintColor:(id)a3
{
  return (id)[a1 layerWithTintColor:a3 filterType:0];
}

+ (id)layerWithTintColor:(id)a3 filterType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 layerWithFillColor:0 opacity:v7 filterType:1.0];
  v9 = (void *)v8[4];
  v8[4] = v6;
  id v10 = v6;

  v11 = (void *)v8[1];
  v8[1] = v7;

  return v8;
}

- (void)configureLayerView:(id)a3
{
  id v9 = a3;
  v4 = [(_UIVisualEffectTintLayerConfig *)self tintColor];
  [v9 setTintColor:v4];

  v5 = [(_UIVisualEffectLayerConfig *)self filterType];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F39BC0];
    self = [(_UIVisualEffectLayerConfig *)self filterType];
    id v7 = [v6 filterWithType:self];
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v9 layer];
  [v8 setCompositingFilter:v7];

  if (v5)
  {
  }
}

- (void)deconfigureLayerView:(id)a3
{
  id v3 = a3;
  [v3 setTintColor:0];
  id v4 = [v3 layer];

  [v4 setCompositingFilter:0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectTintLayerConfig;
  id v3 = [(_UIVisualEffectLayerConfig *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" tintColor=%@", self->_tintColor];

  return v4;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

@end