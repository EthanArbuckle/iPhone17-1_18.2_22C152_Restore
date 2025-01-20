@interface UIMovieScrubberEditingView
- (BOOL)isEditing;
- (BOOL)isEnabled;
- (BOOL)pointInsideLeftHandle:(CGPoint)a3;
- (BOOL)pointInsideRightHandle:(CGPoint)a3;
- (CGRect)_leftHandleRect;
- (CGRect)_rightHandleRect;
- (UIMovieScrubberEditingView)initWithFrame:(CGRect)a3;
- (double)_bounceValueForFraction:(double)a3;
- (double)edgeInset;
- (id)_handleImages;
- (int)handleForPoint:(CGPoint)a3 hitOffset:(double *)a4;
- (void)_updateHandleImages;
- (void)bounce;
- (void)layoutSubviews;
- (void)setEdgeInset:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UIMovieScrubberEditingView

- (UIMovieScrubberEditingView)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)UIMovieScrubberEditingView;
  v3 = -[UIView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C978]);
    v5 = _UIImageWithName(@"UIMovieScrubberEditingGlassLeft.png");
    v6 = _UIImageWithName(@"UIMovieScrubberEditingGlassFill.png");
    v7 = _UIImageWithName(@"UIMovieScrubberEditingGlassRight.png");
    uint64_t v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, 0);
    inactiveImages = v3->_inactiveImages;
    v3->_inactiveImages = (NSArray *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    v11 = _UIImageWithName(@"UIMovieScrubberNoEditGlassLeft.png");
    v12 = _UIImageWithName(@"UIMovieScrubberNoEditGlassFill.png");
    v13 = _UIImageWithName(@"UIMovieScrubberNoEditGlassRight.png");
    uint64_t v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, 0);
    activeNoEditImages = v3->_activeNoEditImages;
    v3->_activeNoEditImages = (NSArray *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
    v17 = _UIImageWithName(@"UIMovieScrubberEditingLeft.png");
    v18 = _UIImageWithName(@"UIMovieScrubberEditingFill.png");
    v19 = _UIImageWithName(@"UIMovieScrubberEditingRight.png");
    uint64_t v20 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, 0);
    activeImages = v3->_activeImages;
    v3->_activeImages = (NSArray *)v20;

    v22 = [UIImageView alloc];
    v23 = [(NSArray *)v3->_inactiveImages objectAtIndex:0];
    uint64_t v24 = [(UIImageView *)v22 initWithImage:v23];
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = (UIImageView *)v24;

    [(UIView *)v3 addSubview:v3->_leftImageView];
    v26 = [UIImageView alloc];
    v27 = [(NSArray *)v3->_inactiveImages objectAtIndex:1];
    uint64_t v28 = [(UIImageView *)v26 initWithImage:v27];
    middleImageView = v3->_middleImageView;
    v3->_middleImageView = (UIImageView *)v28;

    [(UIImageView *)v3->_middleImageView setContentMode:0];
    [(UIView *)v3 addSubview:v3->_middleImageView];
    v30 = [UIImageView alloc];
    v31 = [(NSArray *)v3->_inactiveImages objectAtIndex:2];
    uint64_t v32 = [(UIImageView *)v30 initWithImage:v31];
    rightImageView = v3->_rightImageView;
    v3->_rightImageView = (UIImageView *)v32;

    [(UIView *)v3 addSubview:v3->_rightImageView];
    v3->_enabled = 1;
    v3->_editing = 0;
    [(UIMovieScrubberEditingView *)v3 _updateHandleImages];
  }
  return v3;
}

- (void)setEdgeInset:(double)a3
{
  self->_edgeInset = a3;
  [(UIMovieScrubberEditingView *)self layoutSubviews];
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double edgeInset = self->_edgeInset;
  CGFloat v9 = v8 + edgeInset;
  remainder.origin.x = v8 + edgeInset;
  remainder.origin.y = v4;
  CGFloat v11 = v10 - (edgeInset + edgeInset);
  remainder.size.width = v11;
  remainder.size.height = v5;
  v12 = [(UIMovieScrubberEditingView *)self _handleImages];
  CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v19.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v19.size = v13;
  uint64_t v14 = [v12 objectAtIndexedSubscript:0];
  [v14 size];
  CGFloat v16 = v15;
  v21.origin.x = v9;
  v21.origin.y = v4;
  v21.size.width = v11;
  v21.size.height = v6;
  CGRectDivide(v21, &v19, &remainder, v16, CGRectMinXEdge);
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
  v17 = [v12 objectAtIndexedSubscript:2];

  [v17 size];
  CGRectDivide(remainder, &v19, &remainder, v18, CGRectMaxXEdge);
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
  -[UIImageView setFrame:](self->_middleImageView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
}

- (CGRect)_leftHandleRect
{
  [(UIView *)self bounds];
  double v6 = self->_edgeInset + 48.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInsideLeftHandle:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIMovieScrubberEditingView *)self _leftHandleRect];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (CGRect)_rightHandleRect
{
  [(UIView *)self bounds];
  double v6 = v5 + -48.0;
  double edgeInset = self->_edgeInset;
  double v8 = v6 - edgeInset;
  double v9 = edgeInset + 48.0;
  result.size.height = v4;
  result.size.width = v9;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)pointInsideRightHandle:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIMovieScrubberEditingView *)self _rightHandleRect];
  CGFloat v9 = x;
  CGFloat v10 = y;
  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (int)handleForPoint:(CGPoint)a3 hitOffset:(double *)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  [(UIMovieScrubberEditingView *)self _leftHandleRect];
  CGFloat v8 = v7;
  CGFloat v28 = v9;
  CGFloat v29 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v27 = v13;
  [(UIMovieScrubberEditingView *)self _rightHandleRect];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat rect = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v34.origin.double x = v8;
  v34.origin.CGFloat y = v10;
  v34.size.width = v12;
  v34.size.height = v27;
  v32.double x = x;
  v32.CGFloat y = y;
  BOOL v22 = CGRectContainsPoint(v34, v32);
  v35.origin.double x = v15;
  v35.origin.CGFloat y = v17;
  v35.size.width = v19;
  v35.size.height = v21;
  v33.double x = x;
  v33.CGFloat y = y;
  BOOL v23 = CGRectContainsPoint(v35, v33);
  v36.origin.CGFloat y = v28;
  v36.origin.double x = v29;
  v36.size.width = v12;
  v36.size.height = v27;
  double v24 = CGRectGetMaxX(v36) + -36.0 - x;
  v37.origin.double x = v15;
  v37.origin.CGFloat y = rect;
  v37.size.width = v19;
  v37.size.height = v21;
  CGFloat v25 = CGRectGetMinX(v37) + 36.0 - x;
  if (v22 && v23)
  {
    if (fabs(v24) > fabs(v25))
    {
      int result = 2;
    }
    else
    {
      CGFloat v25 = v24;
      int result = 1;
    }
  }
  else
  {
    if (v22)
    {
      CGFloat v25 = v24;
      int result = 1;
    }
    else
    {
      int result = 2;
    }
    if (!v22 && !v23)
    {
      [(UIView *)self bounds];
      CGFloat v25 = CGRectGetMidX(v38) - x;
      int result = 3;
    }
  }
  *a4 = v25;
  return result;
}

- (id)_handleImages
{
  v2 = &OBJC_IVAR___UIMovieScrubberEditingView__activeNoEditImages;
  if (self->_enabled)
  {
    v2 = &OBJC_IVAR___UIMovieScrubberEditingView__inactiveImages;
    if (self->_editing) {
      v2 = &OBJC_IVAR___UIMovieScrubberEditingView__activeImages;
    }
  }
  id v3 = *(id *)((char *)&self->super.super.super.isa + *v2);
  return v3;
}

- (void)_updateHandleImages
{
  id v9 = [(UIMovieScrubberEditingView *)self _handleImages];
  leftImageView = self->_leftImageView;
  double v4 = [v9 objectAtIndexedSubscript:0];
  [(UIImageView *)leftImageView setImage:v4];

  middleImageView = self->_middleImageView;
  double v6 = [v9 objectAtIndexedSubscript:1];
  [(UIImageView *)middleImageView setImage:v6];

  rightImageView = self->_rightImageView;
  CGFloat v8 = [v9 objectAtIndexedSubscript:2];
  [(UIImageView *)rightImageView setImage:v8];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(UIMovieScrubberEditingView *)self _updateHandleImages];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_enabled && self->_editing != a3)
  {
    self->_editing = a3;
    [(UIMovieScrubberEditingView *)self _updateHandleImages];
  }
}

- (void)bounce
{
  id v36 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  uint64_t v3 = *MEMORY[0x1E4F3A4A0];
  double v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v36 setTimingFunction:v4];

  [v36 setDuration:0.75];
  uint64_t v5 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  double v6 = [MEMORY[0x1E4F39C10] functionWithName:v3];
  [v5 setTimingFunction:v6];

  [v5 setDuration:0.75];
  double v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
  CGFloat v8 = [MEMORY[0x1E4F39C10] functionWithName:v3];
  [v7 setTimingFunction:v8];

  [v7 setDuration:0.75];
  id v9 = [(UIView *)self->_leftImageView layer];
  [v9 position];
  double v11 = v10;

  CGFloat v12 = [(UIView *)self->_rightImageView layer];
  [v12 position];
  double v14 = v13;

  CGFloat v15 = [(UIView *)self->_middleImageView layer];
  [v15 bounds];
  double v17 = v16;

  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:24];
  CGFloat v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:24];
  double v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:24];
  CGFloat v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:24];
  for (unint64_t i = 0; i != 25; ++i)
  {
    double v23 = (double)i;
    *(float *)&double v23 = (double)i / 24.0;
    double v24 = [NSNumber numberWithFloat:v23];
    [v18 addObject:v24];

    [(UIMovieScrubberEditingView *)self _bounceValueForFraction:(double)i / 24.0];
    double v26 = v25;
    double v27 = v11 - v25;
    *(float *)&double v27 = v27;
    CGFloat v28 = [NSNumber numberWithFloat:v27];
    [v19 addObject:v28];

    double v29 = v14 + v26;
    *(float *)&double v29 = v14 + v26;
    v30 = [NSNumber numberWithFloat:v29];
    [v20 addObject:v30];

    double v31 = ceil(v17 + v26 + v26);
    *(float *)&double v31 = v31;
    CGPoint v32 = [NSNumber numberWithFloat:v31];
    [v21 addObject:v32];
  }
  [v36 setKeyTimes:v18];
  [v36 setValues:v19];
  CGPoint v33 = [(UIView *)self->_leftImageView layer];
  [v33 addAnimation:v36 forKey:0];

  [v5 setKeyTimes:v18];
  [v5 setValues:v20];
  CGRect v34 = [(UIView *)self->_rightImageView layer];
  [v34 addAnimation:v5 forKey:0];

  [v7 setKeyTimes:v18];
  [v7 setValues:v21];
  CGRect v35 = [(UIView *)self->_middleImageView layer];
  [v35 addAnimation:v7 forKey:0];
}

- (double)_bounceValueForFraction:(double)a3
{
  double result = 0.0;
  if (a3 > 0.0 && a3 < 1.0)
  {
    double v6 = a3 + a3;
    double v7 = cos((a3 + a3 + -0.145) * 11.0);
    return v7 * exp((v6 + 0.4) * -3.0) * 120.0;
  }
  return result;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (double)edgeInset
{
  return self->_edgeInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveImages, 0);
  objc_storeStrong((id *)&self->_activeNoEditImages, 0);
  objc_storeStrong((id *)&self->_activeImages, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_middleImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
}

@end