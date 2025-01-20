@interface SOSUIAnimatingSpriteImageView
+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6;
- (BOOL)isAnimating;
- (CGSize)_spriteFrameSize;
- (SOSUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3;
- (UIImage)spriteImage;
- (id)_centerPointValues;
- (int64_t)spriteColumnCount;
- (int64_t)spriteFrameCount;
- (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4;
- (unint64_t)framesPerSecond;
- (void)animateOnce;
- (void)layoutSubviews;
- (void)setFramesPerSecond:(unint64_t)a3;
- (void)setSpriteColumnCount:(int64_t)a3;
- (void)setSpriteFrameCount:(int64_t)a3;
- (void)setSpriteImage:(id)a3;
- (void)setTintColor:(id)a3;
- (void)startAnimating;
- (void)stopAnimatingFinishingCycle:(BOOL)a3;
- (void)updateLayerWithTintColor;
@end

@implementation SOSUIAnimatingSpriteImageView

- (SOSUIAnimatingSpriteImageView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SOSUIAnimatingSpriteImageView;
  v3 = -[SOSUIAnimatingSpriteImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SOSUIAnimatingSpriteImageView *)v3 setClipsToBounds:1];
    v4->_framesPerSecond = 60;
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    imageLayer = v4->_imageLayer;
    v4->_imageLayer = v5;

    v7 = [(SOSUIAnimatingSpriteImageView *)v4 layer];
    [v7 addSublayer:v4->_imageLayer];
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(UIImage *)self->_spriteImage size];
  double v6 = v5;
  double v8 = v7;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  -[CALayer setFrame:](self->_imageLayer, "setFrame:", v3, v4, v6, v8);
  objc_super v9 = (void *)MEMORY[0x263F158F8];
  [v9 commit];
}

- (CGSize)_spriteFrameSize
{
  spriteImage = self->_spriteImage;
  if (spriteImage)
  {
    int64_t spriteFrameCount = self->_spriteFrameCount;
    int64_t spriteColumnCount = self->_spriteColumnCount;
    if (spriteFrameCount % spriteColumnCount) {
      uint64_t v6 = spriteFrameCount / spriteColumnCount + 1;
    }
    else {
      uint64_t v6 = spriteFrameCount / spriteColumnCount;
    }
    [(UIImage *)spriteImage size];
    double v8 = v7 / (double)self->_spriteColumnCount;
    [(UIImage *)self->_spriteImage size];
    double v10 = v9 / (double)v6;
  }
  else
  {
    double v8 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)setSpriteImage:(id)a3
{
  id v4 = a3;
  [(SOSUIAnimatingSpriteImageView *)self stopAnimatingFinishingCycle:0];
  double v5 = [(SOSUIAnimatingSpriteImageView *)self tintColor];
  uint64_t v6 = [v4 imageWithTintColor:v5 renderingMode:2];

  spriteImage = self->_spriteImage;
  self->_spriteImage = v6;

  [(CALayer *)self->_imageLayer setContents:[(UIImage *)self->_spriteImage CGImage]];
  [(SOSUIAnimatingSpriteImageView *)self updateLayerWithTintColor];
  [(SOSUIAnimatingSpriteImageView *)self setNeedsLayout];
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SOSUIAnimatingSpriteImageView;
  [(SOSUIAnimatingSpriteImageView *)&v4 setTintColor:a3];
  if (self->_spriteImage) {
    -[SOSUIAnimatingSpriteImageView setSpriteImage:](self, "setSpriteImage:");
  }
}

- (void)updateLayerWithTintColor
{
  imageLayer = self->_imageLayer;
  objc_super v4 = [(SOSUIAnimatingSpriteImageView *)self layer];
  [v4 setMask:imageLayer];

  id v7 = [(SOSUIAnimatingSpriteImageView *)self tintColor];
  uint64_t v5 = [v7 CGColor];
  uint64_t v6 = [(SOSUIAnimatingSpriteImageView *)self layer];
  [v6 setBackgroundColor:v5];
}

- (id)_centerPointValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(SOSUIAnimatingSpriteImageView *)self _spriteFrameSize];
  [(UIImage *)self->_spriteImage size];
  if (self->_spriteFrameCount >= 1)
  {
    int64_t v4 = 0;
    do
    {
      uint64_t v5 = (void *)MEMORY[0x263F08D40];
      UIRectGetCenter();
      uint64_t v6 = objc_msgSend(v5, "valueWithCGPoint:");
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 < self->_spriteFrameCount);
  }
  return v3;
}

- (unint64_t)_findSpriteIndex:(CGPoint)a3 centerPoints:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = (void *)MEMORY[0x263F08D40];
  id v7 = a4;
  double v8 = objc_msgSend(v6, "valueWithCGPoint:", x, y);
  unint64_t v9 = [v7 indexOfObject:v8];

  return v9;
}

+ (id)_createNewSpriteArray:(id)a3 currentFrame:(unint64_t)a4 arraySize:(unint64_t)a5 interrupted:(BOOL)a6
{
  id v9 = a3;
  double v10 = v9;
  if (a5 - 1 == a4)
  {
    id v11 = v9;
  }
  else
  {
    unint64_t v12 = ~a4 + a5;
    unint64_t v13 = a4 + 1;
    v14 = objc_msgSend(v9, "subarrayWithRange:", a4 + 1, v12);
    v15 = v14;
    if (a6)
    {
      v16 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      id v11 = [v15 arrayByAddingObjectsFromArray:v16];
    }
    else
    {
      id v11 = v14;
    }
  }
  return v11;
}

- (void)startAnimating
{
  if (self->_spriteImage)
  {
    [(SOSUIAnimatingSpriteImageView *)self frame];
    if (!CGRectIsEmpty(v17))
    {
      if ([(SOSUIAnimatingSpriteImageView *)self isAnimating])
      {
        id v3 = [(CALayer *)self->_imageLayer presentationLayer];
        [v3 position];
        double v5 = v4;
        double v7 = v6;

        double v8 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
        unint64_t v9 = -[SOSUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](self, "_findSpriteIndex:centerPoints:", v8, v5, v7);

        double v10 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
        uint64_t v11 = [v10 count];

        [(CALayer *)self->_imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
        unint64_t v12 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
        id v15 = +[SOSUIAnimatingSpriteImageView _createNewSpriteArray:v12 currentFrame:v9 arraySize:v11 interrupted:1];
      }
      else
      {
        id v15 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
      }
      imageLayer = self->_imageLayer;
      v14 = _PositionAnimation(v15, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 3.4028e38);
      [(CALayer *)imageLayer addAnimation:v14 forKey:@"PositionKeyframeAnimation"];
    }
  }
}

- (void)stopAnimatingFinishingCycle:(BOOL)a3
{
  imageLayer = self->_imageLayer;
  if (a3)
  {
    double v5 = [(CALayer *)imageLayer presentationLayer];
    [v5 position];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
    unint64_t v11 = -[SOSUIAnimatingSpriteImageView _findSpriteIndex:centerPoints:](self, "_findSpriteIndex:centerPoints:", v10, v7, v9);

    unint64_t v12 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
    uint64_t v13 = [v12 count];

    [(CALayer *)self->_imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
    if (v11 != v13 - 1)
    {
      v14 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
      id v18 = +[SOSUIAnimatingSpriteImageView _createNewSpriteArray:v14 currentFrame:v11 arraySize:v13 interrupted:0];

      unint64_t v15 = [v18 count];
      v16 = self->_imageLayer;
      CGRect v17 = _PositionAnimation(v18, (double)v15 / (double)self->_framesPerSecond, 0.0);
      [(CALayer *)v16 addAnimation:v17 forKey:@"PositionKeyframeAnimation"];
    }
  }
  else
  {
    [(CALayer *)imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
  }
}

- (BOOL)isAnimating
{
  v2 = [(CALayer *)self->_imageLayer animationForKey:@"PositionKeyframeAnimation"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)animateOnce
{
  if ([(SOSUIAnimatingSpriteImageView *)self isAnimating]) {
    [(CALayer *)self->_imageLayer removeAnimationForKey:@"PositionKeyframeAnimation"];
  }
  id v6 = [(SOSUIAnimatingSpriteImageView *)self _centerPointValues];
  imageLayer = self->_imageLayer;
  double v4 = _PositionAnimation(v6, (double)self->_spriteFrameCount / (double)self->_framesPerSecond, 1.0);
  [(CALayer *)imageLayer addAnimation:v4 forKey:@"PositionKeyframeAnimation"];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v5 = [v6 lastObject];
  [v5 CGPointValue];
  -[CALayer setPosition:](self->_imageLayer, "setPosition:");

  [MEMORY[0x263F158F8] commit];
}

- (UIImage)spriteImage
{
  return self->_spriteImage;
}

- (int64_t)spriteFrameCount
{
  return self->_spriteFrameCount;
}

- (void)setSpriteFrameCount:(int64_t)a3
{
  self->_int64_t spriteFrameCount = a3;
}

- (int64_t)spriteColumnCount
{
  return self->_spriteColumnCount;
}

- (void)setSpriteColumnCount:(int64_t)a3
{
  self->_int64_t spriteColumnCount = a3;
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteImage, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end