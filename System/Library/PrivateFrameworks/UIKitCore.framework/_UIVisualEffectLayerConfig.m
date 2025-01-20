@interface _UIVisualEffectLayerConfig
+ (id)layerWithFillColor:(id)a3 opacity:(double)a4 filterType:(id)a5;
- (NSString)filterType;
- (UIColor)fillColor;
- (double)opacity;
- (id)description;
- (void)configureLayerView:(id)a3;
- (void)deconfigureLayerView:(id)a3;
@end

@implementation _UIVisualEffectLayerConfig

+ (id)layerWithFillColor:(id)a3 opacity:(double)a4 filterType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (double *)objc_alloc_init((Class)a1);
  v11 = (void *)*((void *)v10 + 1);
  *((void *)v10 + 1) = v9;
  id v12 = v9;

  v10[2] = a4;
  v13 = (void *)*((void *)v10 + 3);
  *((void *)v10 + 3) = v8;

  return v10;
}

- (void)configureLayerView:(id)a3
{
  id v9 = a3;
  v4 = [(_UIVisualEffectLayerConfig *)self fillColor];
  [v9 setBackgroundColor:v4];

  [(_UIVisualEffectLayerConfig *)self opacity];
  objc_msgSend(v9, "setAlpha:");
  v5 = [(_UIVisualEffectLayerConfig *)self filterType];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F39BC0];
    self = [(_UIVisualEffectLayerConfig *)self filterType];
    v7 = [v6 filterWithType:self];
  }
  else
  {
    v7 = 0;
  }
  id v8 = [v9 layer];
  [v8 setCompositingFilter:v7];

  if (v5)
  {
  }
}

- (void)deconfigureLayerView:(id)a3
{
  id v3 = a3;
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setAlpha:1.0];
  id v5 = [v3 layer];

  [v5 setCompositingFilter:0];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectLayerConfig;
  id v3 = [(_UIVisualEffectLayerConfig *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" opacity=%f filterType=%@ fillColor=%@", *(void *)&self->_opacity, self->_filterType, self->_fillColor];

  return v4;
}

- (double)opacity
{
  return self->_opacity;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end