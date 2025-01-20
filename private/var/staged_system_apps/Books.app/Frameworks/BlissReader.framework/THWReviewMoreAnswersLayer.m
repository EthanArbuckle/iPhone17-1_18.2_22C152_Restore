@interface THWReviewMoreAnswersLayer
- (CATextLayer)textLayer;
- (CGSize)layerSize;
- (THWReviewMoreAnswersLayer)init;
- (double)scale;
- (id)p_pathWithDirection:(int)a3 origin:(CGPoint)a4 size:(CGSize)a5 scale:(double)a6 includeWedge:(BOOL)a7;
- (void)dealloc;
- (void)p_updateTextLayerFrame;
- (void)setContentsScale:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation THWReviewMoreAnswersLayer

- (THWReviewMoreAnswersLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)THWReviewMoreAnswersLayer;
  v2 = [(THWReviewMoreAnswersLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    p_width = &v2->_layerSize.width;
    v2->_layerSize = (CGSize)xmmword_344990;
    -[THWReviewMoreAnswersLayer setBackgroundColor:[TSUColor clearColor] CGColor]];
    -[THWReviewMoreAnswersLayer setFillColor:[TSUColor whiteColor].CGColor];
    [(THWReviewMoreAnswersLayer *)v3 setLineWidth:1.0];
    [(THWReviewMoreAnswersLayer *)v3 setStrokeColor:[+[TSUColor colorWithWhite:0.0 alpha:0.1] CGColor]];
    -[THWReviewMoreAnswersLayer setShadowColor:[TSUColor blackColor].CGColor];
    LODWORD(v5) = 0.25;
    [(THWReviewMoreAnswersLayer *)v3 setShadowOpacity:v5];
    -[THWReviewMoreAnswersLayer setShadowOffset:](v3, "setShadowOffset:", 0.0, 3.0);
    [(THWReviewMoreAnswersLayer *)v3 setShadowRadius:3.0];
    -[THWReviewMoreAnswersLayer setPath:](v3, "setPath:", objc_msgSend(-[THWReviewMoreAnswersLayer p_pathWithDirection:origin:size:scale:includeWedge:](v3, "p_pathWithDirection:origin:size:scale:includeWedge:", 3, 1, CGPointZero.x, CGPointZero.y, *p_width, v3->_layerSize.height, v3->_scale), "CGPath"));
    v3->_textLayer = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
    [(CATextLayer *)v3->_textLayer setDelegate:+[THNoAnimationLayerDelegate sharedInstance]];
    [(CATextLayer *)v3->_textLayer setContentsGravity:kCAGravityCenter];
    [(CATextLayer *)v3->_textLayer setAlignmentMode:kCAAlignmentCenter];
    [(CATextLayer *)v3->_textLayer setTruncationMode:kCATruncationEnd];
    -[CATextLayer setString:](v3->_textLayer, "setString:", [(id)THBundle() localizedStringForKey:@"Select more answers." value:&stru_46D7E8 table:0]);
    [v3->_textLayer setFont:[+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", v3->_scale * 14.0) fontName]];
    [(CATextLayer *)v3->_textLayer setFontSize:v3->_scale * 14.0];
    [(CATextLayer *)v3->_textLayer setForegroundColor:[+[TSUColor colorWithWhite:0.300000012 alpha:1.0] CGColor]];
    -[v3->_textLayer setBackgroundColor:[TSUColor clearColor] CGColor]];
    [(THWReviewMoreAnswersLayer *)v3 p_updateTextLayerFrame];
    [(THWReviewMoreAnswersLayer *)v3 addSublayer:v3->_textLayer];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewMoreAnswersLayer;
  [(THWReviewMoreAnswersLayer *)&v3 dealloc];
}

- (void)p_updateTextLayerFrame
{
  TSDRectWithSize();
  CGRectInset(v5, 10.0, 10.0);
  TSDMultiplyRectScalar();
  [(CATextLayer *)self->_textLayer contentsScale];
  TSDRoundedRectForScale();
  textLayer = self->_textLayer;

  -[CATextLayer setFrame:](textLayer, "setFrame:");
}

- (void)setContentsScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewMoreAnswersLayer;
  -[THWReviewMoreAnswersLayer setContentsScale:](&v5, "setContentsScale:");
  [(CATextLayer *)self->_textLayer setContentsScale:a3];
  [(THWReviewMoreAnswersLayer *)self p_updateTextLayerFrame];
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(CATextLayer *)self->_textLayer setFontSize:a3 * 14.0];
    -[THWReviewMoreAnswersLayer setPath:](self, "setPath:", objc_msgSend(-[THWReviewMoreAnswersLayer p_pathWithDirection:origin:size:scale:includeWedge:](self, "p_pathWithDirection:origin:size:scale:includeWedge:", 3, 1, CGPointZero.x, CGPointZero.y, self->_layerSize.width, self->_layerSize.height, self->_scale), "CGPath"));
    [(THWReviewMoreAnswersLayer *)self p_updateTextLayerFrame];
  }
}

- (id)p_pathWithDirection:(int)a3 origin:(CGPoint)a4 size:(CGSize)a5 scale:(double)a6 includeWedge:(BOOL)a7
{
  TSURound();
  double v11 = v10;
  TSURound();
  if (a3 != 0 && a7) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  TSDMultiplyPointScalar();
  TSDRoundedPoint();
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  TSDMultiplySizeScalar();
  TSDRoundedSize();
  double v19 = v18;
  double v21 = v20;
  double v22 = a6 * 3.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v15, v17);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, v22, 0.0);
  double v33 = (v19 - v11) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v33, 0.0);
  double v24 = 0.0;
  if (a3 == 1) {
    double v24 = -v13;
  }
  CGPathAddLineToPoint(Mutable, &m, v19 * 0.5, v24);
  double v25 = (v11 + v19) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v25, 0.0);
  CGPathAddLineToPoint(Mutable, &m, v19 - v22, 0.0);
  CGPathAddArcToPoint(Mutable, &m, v19, 0.0, v19, v22, v22);
  double v32 = (v21 - v11) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v19, v32);
  double v26 = 0.0;
  if (a3 == 2) {
    double v26 = v13;
  }
  CGPathAddLineToPoint(Mutable, &m, v26 + v19, v21 * 0.5);
  double v27 = (v11 + v21) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v19, v27);
  CGPathAddLineToPoint(Mutable, &m, v19, v21 - v22);
  CGPathAddArcToPoint(Mutable, &m, v19, v21, v19 - v22, v21, v22);
  CGPathAddLineToPoint(Mutable, &m, v25, v21);
  if (a3 == 3) {
    double v28 = v13;
  }
  else {
    double v28 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, &m, v19 * 0.5, v28 + v21);
  CGPathAddLineToPoint(Mutable, &m, v33, v21);
  CGPathAddLineToPoint(Mutable, &m, v22, v21);
  CGPathAddArcToPoint(Mutable, &m, 0.0, v21, 0.0, v21 - v22, v22);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v27);
  double v29 = -v13;
  if (a3 != 4) {
    double v29 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, &m, v29, v21 * 0.5);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v32);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v22);
  CGPathAddArcToPoint(Mutable, &m, 0.0, 0.0, v22, 0.0, v22);
  CGPathCloseSubpath(Mutable);
  v30 = +[TSDBezierPath bezierPathWithCGPath:Mutable];
  CGPathRelease(Mutable);
  return v30;
}

- (CGSize)layerSize
{
  double width = self->_layerSize.width;
  double height = self->_layerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CATextLayer)textLayer
{
  return self->_textLayer;
}

@end