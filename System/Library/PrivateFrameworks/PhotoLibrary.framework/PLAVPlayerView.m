@interface PLAVPlayerView
+ (Class)layerClass;
- (AVPlayer)player;
- (CGRect)videoRect;
- (PLAVPlayerView)initWithFrame:(CGRect)a3;
- (int64_t)scaleMode;
- (void)setPlayer:(id)a3;
- (void)setScaleMode:(int64_t)a3;
- (void)setScaleMode:(int64_t)a3 duration:(double)a4;
@end

@implementation PLAVPlayerView

- (int64_t)scaleMode
{
  return self->_scaleMode;
}

- (CGRect)videoRect
{
  v2 = (void *)[(PLAVPlayerView *)self layer];
  [v2 videoRect];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setScaleMode:(int64_t)a3 duration:(double)a4
{
  uint64_t v7 = [(PLAVPlayerView *)self layer];
  if (v7)
  {
    v8 = (void *)v7;
    if (a4 > 0.0) {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:a4];
    }
    v9 = (void *)MEMORY[0x1E4F15AF8];
    v10 = (void *)MEMORY[0x1E4F15AE8];
    if (a3 != 3) {
      v10 = (void *)MEMORY[0x1E4F15AF0];
    }
    if (a3 != 2) {
      v9 = v10;
    }
    [v8 setVideoGravity:*v9];
  }
  self->_scaleMode = a3;
}

- (void)setScaleMode:(int64_t)a3
{
}

- (void)setPlayer:(id)a3
{
  double v4 = (void *)[(PLAVPlayerView *)self layer];
  [v4 setPlayer:a3];
}

- (AVPlayer)player
{
  v2 = (void *)[(PLAVPlayerView *)self layer];
  return (AVPlayer *)[v2 player];
}

- (PLAVPlayerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLAVPlayerView;
  double v3 = -[PLAVPlayerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    objc_msgSend((id)-[PLAVPlayerView layer](v3, "layer"), "setContentsOpaque:", 1);
    [(PLAVPlayerView *)v4 setScaleMode:1];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end