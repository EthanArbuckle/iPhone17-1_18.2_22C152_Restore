@interface _BSUIDailyReadingLayerConfig
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (_BSUIDailyReadingLayerConfig)initWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5;
- (void)configureLayer:(id)a3;
- (void)configureSublayers:(id)a3 forLayer:(id)a4;
- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3;
@end

@implementation _BSUIDailyReadingLayerConfig

- (_BSUIDailyReadingLayerConfig)initWithMetrics:(id)a3 timeTextYOffset:(double)a4 micaFileProvider:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_BSUIDailyReadingLayerConfig;
  v11 = [(_BSUIDailyReadingLayerConfig *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metrics, a3);
    v12->_timeTextYOffset = a4;
    objc_storeStrong((id *)&v12->_micaFileProvider, a5);
  }

  return v12;
}

- (void)dynamicUserInterfaceTraitDidChangeForLayer:(id)a3
{
}

- (void)configureLayer:(id)a3
{
}

- (void)configureSublayers:(id)a3 forLayer:(id)a4
{
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  TUIDynamicCast();
  v5 = (_BSUIDailyReadingLayerConfig *)objc_claimAutoreleasedReturnValue();

  return v5 == self;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  return [(_BSUIDailyReadingLayerConfig *)self layerClass];
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaFileProvider, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end