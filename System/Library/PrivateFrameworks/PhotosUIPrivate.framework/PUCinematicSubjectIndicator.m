@interface PUCinematicSubjectIndicator
- (BOOL)isPulsing;
- (PUCinematicSubjectIndicator)initWithFrame:(CGRect)a3;
- (int64_t)shape;
- (void)_startPulseAnimation;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setIsPulsing:(BOOL)a3;
- (void)setShape:(int64_t)a3;
- (void)setShape:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PUCinematicSubjectIndicator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_fixedFocusView, 0);
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (int64_t)shape
{
  return self->_shape;
}

- (void)_startPulseAnimation
{
  v3 = [(PUCinematicSubjectIndicator *)self superview];

  if (v3)
  {
    id v8 = [(PUCinematicSubjectIndicator *)self layer];
    v4 = [v8 animationForKey:@"pulse"];
    if (!v4)
    {
      [v8 removeAllAnimations];
      v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
      [v5 setDuration:0.75];
      v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v5 setTimingFunction:v6];

      [v5 setToValue:&unk_1F078D190];
      LODWORD(v7) = 2139095040;
      [v5 setRepeatCount:v7];
      [v5 setAutoreverses:1];
      [v8 addAnimation:v5 forKey:@"pulse"];
    }
  }
}

- (void)setIsPulsing:(BOOL)a3
{
  if (self->_isPulsing != a3)
  {
    self->_isPulsing = a3;
    if (a3)
    {
      [(PUCinematicSubjectIndicator *)self _startPulseAnimation];
    }
    else
    {
      id v3 = [(PUCinematicSubjectIndicator *)self layer];
      [v3 removeAllAnimations];
    }
  }
}

- (void)setShape:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_shape = a3;
  BOOL v7 = a3 == 3;
  -[CEKSubjectIndicatorView setHidden:animated:](self->_fixedFocusView, "setHidden:animated:", a3 != 3);
  [(CEKCinematicSubjectIndicatorView *)self->_subjectView setHidden:v7];
  if ((unint64_t)a3 <= 2)
  {
    subjectView = self->_subjectView;
    [(CEKCinematicSubjectIndicatorView *)subjectView setShape:a3 animated:v4];
  }
}

- (void)setShape:(int64_t)a3
{
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PUCinematicSubjectIndicator;
  [(PUCinematicSubjectIndicator *)&v11 layoutSubviews];
  [(PUCinematicSubjectIndicator *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (!CGRectIsNull(v12))
  {
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    if (!CGRectIsInfinite(v13))
    {
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.double width = width;
      v14.size.double height = height;
      if (!CGRectIsEmpty(v14))
      {
        v15.origin.CGFloat x = x;
        v15.origin.CGFloat y = y;
        v15.size.double width = width;
        v15.size.double height = height;
        double MidX = CGRectGetMidX(v15);
        v16.origin.CGFloat x = x;
        v16.origin.CGFloat y = y;
        v16.size.double width = width;
        v16.size.double height = height;
        double MidY = CGRectGetMidY(v16);
        [MEMORY[0x1E4F57D40] minimumSuggestedBounds];
        if (width >= v9) {
          double v9 = width;
        }
        if (height >= v10) {
          double v10 = height;
        }
        -[CEKCinematicSubjectIndicatorView setBounds:](self->_subjectView, "setBounds:", 0.0, 0.0, v9, v10);
        -[CEKCinematicSubjectIndicatorView setCenter:](self->_subjectView, "setCenter:", MidX, MidY);
        -[CEKSubjectIndicatorView setBounds:](self->_fixedFocusView, "setBounds:", 0.0, 0.0, self->_fixedFocusSize.width, self->_fixedFocusSize.height);
        -[CEKSubjectIndicatorView setCenter:](self->_fixedFocusView, "setCenter:", MidX, MidY);
        if ([(PUCinematicSubjectIndicator *)self isPulsing]) {
          [(PUCinematicSubjectIndicator *)self _startPulseAnimation];
        }
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCinematicSubjectIndicator;
  -[PUCinematicSubjectIndicator setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUCinematicSubjectIndicator *)self setNeedsLayout];
}

- (PUCinematicSubjectIndicator)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PUCinematicSubjectIndicator;
  id v3 = -[PUCinematicSubjectIndicator initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F57D70]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    double v10 = (void *)*((void *)v3 + 51);
    *((void *)v3 + 51) = v9;

    [*((id *)v3 + 51) setShape:3];
    [v3 addSubview:*((void *)v3 + 51)];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F57D40]), "initWithFrame:", v5, v6, v7, v8);
    CGRect v12 = (void *)*((void *)v3 + 52);
    *((void *)v3 + 52) = v11;

    [v3 addSubview:*((void *)v3 + 52)];
    [v3 setShape:0];
    *(int64x2_t *)(v3 + 424) = vdupq_n_s64(0x4052C00000000000uLL);
    v3[440] = 0;
  }
  return (PUCinematicSubjectIndicator *)v3;
}

@end