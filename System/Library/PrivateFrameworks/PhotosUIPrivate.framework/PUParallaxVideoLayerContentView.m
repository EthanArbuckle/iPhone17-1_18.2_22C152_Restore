@interface PUParallaxVideoLayerContentView
+ (Class)layerClass;
- (PUParallaxVideoLayerContentView)initWithFrame:(CGRect)a3;
@end

@implementation PUParallaxVideoLayerContentView

- (PUParallaxVideoLayerContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUParallaxVideoLayerContentView;
  v3 = -[PUParallaxVideoLayerContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F15AF8];
    v6 = [(PUParallaxVideoLayerContentView *)v3 _playerLayer];
    [v6 setVideoGravity:v5];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end