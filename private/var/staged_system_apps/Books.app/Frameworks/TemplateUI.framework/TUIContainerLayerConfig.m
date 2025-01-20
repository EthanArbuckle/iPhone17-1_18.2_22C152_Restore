@interface TUIContainerLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (TUIContainerLayerConfig)initWithSize:(CGSize)a3;
- (void)configureLayer:(id)a3;
- (void)configureSublayers:(id)a3 forLayer:(id)a4;
@end

@implementation TUIContainerLayerConfig

- (TUIContainerLayerConfig)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TUIContainerLayerConfig;
  result = [(TUIContainerLayerConfig *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (void)configureLayer:(id)a3
{
  if (self->_size.width != CGSizeZero.width || self->_size.height != CGSizeZero.height)
  {
    id v5 = a3;
    [v5 setAnchorPoint:0.5, 0.5];
    [v5 setFrame:CGRectMake(0.0, 0.0, self->_size.width, self->_size.height)];
  }
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  TUIDynamicCast(v5, v4);
  objc_super v6 = (TUIContainerLayerConfig *)objc_claimAutoreleasedReturnValue();

  return v6 == self;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

@end