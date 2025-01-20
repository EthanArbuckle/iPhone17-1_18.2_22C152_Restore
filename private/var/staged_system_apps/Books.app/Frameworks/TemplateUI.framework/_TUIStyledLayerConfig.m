@interface _TUIStyledLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (_TUIStyledBoxStyler)styler;
- (_TUIStyledLayerConfig)initWithStyler:(id)a3;
- (void)configureLayer:(id)a3;
- (void)configureSublayers:(id)a3 forLayer:(id)a4;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _TUIStyledLayerConfig

- (_TUIStyledLayerConfig)initWithStyler:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIStyledLayerConfig;
  v6 = [(_TUIStyledLayerConfig *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_styler, a3);
  }

  return v7;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
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
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7 == self)
  {
    BOOL v9 = 1;
  }
  else if (v7)
  {
    BOOL v9 = [(_TUIStyledBoxStyler *)self->_styler isEqualToStyle:v7->_styler];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (_TUIStyledBoxStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
}

@end