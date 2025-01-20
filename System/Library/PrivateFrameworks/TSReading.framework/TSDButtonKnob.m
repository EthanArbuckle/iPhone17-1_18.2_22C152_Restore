@interface TSDButtonKnob
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5;
- (TSDButtonKnob)initWithImage:(id)a3 tag:(unint64_t)a4 onRep:(id)a5;
- (TSDButtonKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (TSUImage)image;
- (id)knobImage;
- (void)dealloc;
- (void)p_updateLayerImage;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
@end

@implementation TSDButtonKnob

- (TSDButtonKnob)initWithImage:(id)a3 tag:(unint64_t)a4 onRep:(id)a5
{
  if (a3)
  {
    [a3 size];
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDButtonKnob;
  v11 = -[TSDKnob initWithType:position:radius:tag:onRep:](&v13, sel_initWithType_position_radius_tag_onRep_, 0, a4, a5, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), fmax(v9, v10) * 0.5);
  if (v11)
  {
    v11->mImage = (TSUImage *)a3;
    v11->mEnabled = 1;
  }
  return v11;
}

- (TSDButtonKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  return -[TSDButtonKnob initWithImage:tag:onRep:](self, "initWithImage:tag:onRep:", 0, a6, a7, a4.x, a4.y, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDButtonKnob;
  [(TSDKnob *)&v3 dealloc];
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  double v10 = [(TSDKnob *)self layer];
  if ([(CALayer *)v10 isHidden]) {
    return 0;
  }
  [(CALayer *)v10 opacity];
  if (v11 <= 0.0) {
    return 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDButtonKnob;
  return -[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:](&v13, sel_isHitByUnscaledPoint_andRep_returningDistance_, a4, a5, x, y);
}

- (id)knobImage
{
  if ([(TSDButtonKnob *)self isEnabled])
  {
    if (![(TSDButtonKnob *)self isHighlighted]) {
      return self->mImage;
    }
    objc_super v3 = (void *)[MEMORY[0x263F7C808] blackColor];
    mImage = self->mImage;
    CGFloat v5 = 0.466666669;
    CGBlendMode v6 = kCGBlendModeSourceAtop;
  }
  else
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C808] lightGrayColor];
    mImage = self->mImage;
    CGFloat v5 = 0.5;
    CGBlendMode v6 = kCGBlendModeDestinationOut;
  }

  return TSUCompositeImageWithColor(mImage, v3, v6, v5);
}

- (void)setImage:(id)a3
{
  mImage = self->mImage;
  if (mImage != a3)
  {

    self->mImage = (TSUImage *)a3;
    [(TSDButtonKnob *)self p_updateLayerImage];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->mEnabled != a3)
  {
    self->mEnabled = a3;
    [(TSDButtonKnob *)self p_updateLayerImage];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->mHighlighted != a3)
  {
    self->mHighlighted = a3;
    [(TSDButtonKnob *)self p_updateLayerImage];
  }
}

- (void)p_updateLayerImage
{
  id v3 = [(TSDButtonKnob *)self knobImage];
  [(TSDCanvas *)[(TSDRep *)[(TSDKnob *)self rep] canvas] contentsScale];
  uint64_t v4 = objc_msgSend(v3, "CGImageForContentsScale:");
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CALayer *)[(TSDKnob *)self layer] setContents:v4];
  CGFloat v5 = (void *)MEMORY[0x263F158F8];

  [v5 commit];
}

- (TSUImage)image
{
  return self->mImage;
}

- (BOOL)isEnabled
{
  return self->mEnabled;
}

- (BOOL)isHighlighted
{
  return self->mHighlighted;
}

@end