@interface SUUIStarRatingControl
- (BOOL)_isRTL;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)emptyStarsImage;
- (UIImage)filledStarsImage;
- (double)_unfilledStarsMinX;
- (double)_unfilledStarsWidth;
- (float)starSpacing;
- (float)starWidth;
- (int64_t)userRating;
- (unint64_t)_firstStar;
- (unint64_t)_lastStar;
- (unint64_t)_ratingForUIDirection:(unint64_t)a3;
- (void)_updateUserRatingWithTouch:(id)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setEmptyStarsImage:(id)a3;
- (void)setFilledStarsImage:(id)a3;
- (void)setStarSpacing:(float)a3;
- (void)setStarWidth:(float)a3;
- (void)setUserRating:(int64_t)a3;
@end

@implementation SUUIStarRatingControl

- (float)starSpacing
{
  float result = self->_starSpacing;
  if (result == 0.0) {
    return 10.0;
  }
  return result;
}

- (float)starWidth
{
  float result = self->_starWidth;
  if (result == 0.0) {
    return 19.0;
  }
  return result;
}

- (UIImage)emptyStarsImage
{
  return [(UIImageView *)self->_emptyStarsImageView image];
}

- (UIImage)filledStarsImage
{
  return [(UIImageView *)self->_filledStarsImageView image];
}

- (void)setEmptyStarsImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_emptyStarsImageView image];

  id v6 = v12;
  if (v4 != v12)
  {
    emptyStarsImageView = self->_emptyStarsImageView;
    if (!emptyStarsImageView)
    {
      v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      v9 = self->_emptyStarsImageView;
      self->_emptyStarsImageView = v8;

      [(UIImageView *)self->_emptyStarsImageView setContentMode:4];
      v10 = self->_emptyStarsImageView;
      v11 = [(SUUIStarRatingControl *)self backgroundColor];
      [(UIImageView *)v10 setBackgroundColor:v11];

      [(SUUIStarRatingControl *)self addSubview:self->_emptyStarsImageView];
      emptyStarsImageView = self->_emptyStarsImageView;
    }
    uint64_t v5 = [(UIImageView *)emptyStarsImageView setImage:v12];
    id v6 = v12;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setFilledStarsImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_filledStarsImageView image];

  id v6 = v12;
  if (v4 != v12)
  {
    filledStarsImageView = self->_filledStarsImageView;
    if (!filledStarsImageView)
    {
      v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      v9 = self->_filledStarsImageView;
      self->_filledStarsImageView = v8;

      v10 = self->_filledStarsImageView;
      v11 = [(SUUIStarRatingControl *)self backgroundColor];
      [(UIImageView *)v10 setBackgroundColor:v11];

      [(UIImageView *)self->_filledStarsImageView setContentMode:7];
      [(UIImageView *)self->_filledStarsImageView setClipsToBounds:1];
      [(SUUIStarRatingControl *)self addSubview:self->_filledStarsImageView];
      filledStarsImageView = self->_filledStarsImageView;
    }
    uint64_t v5 = [(UIImageView *)filledStarsImageView setImage:v12];
    id v6 = v12;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setUserRating:(int64_t)a3
{
  if (self->_userRating != a3)
  {
    self->_userRating = a3;
    [(SUUIStarRatingControl *)self setNeedsLayout];
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_previousUserRating = self->_userRating;
  -[SUUIStarRatingControl _updateUserRatingWithTouch:](self, "_updateUserRatingWithTouch:", a3, a4);
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[SUUIStarRatingControl _updateUserRatingWithTouch:](self, "_updateUserRatingWithTouch:", a3, a4);
  [(SUUIStarRatingControl *)self sendActionsForControlEvents:4096];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  if (a3)
  {
    self->_userRating = self->_previousUserRating;
    [(SUUIStarRatingControl *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIStarRatingControl *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_emptyStarsImageView, "setFrame:");
  [(SUUIStarRatingControl *)self _unfilledStarsMinX];
  double v12 = v11;
  float userRating = (float)self->_userRating;
  [(SUUIStarRatingControl *)self starWidth];
  double v15 = (float)(v14 * userRating);
  int64_t v16 = self->_userRating;
  BOOL v17 = v16 < 1;
  uint64_t v18 = v16 - 1;
  if (!v17)
  {
    float v19 = (float)v18;
    [(SUUIStarRatingControl *)self starSpacing];
    double v15 = v15 + (float)(v20 * v19);
  }
  if ([(SUUIStarRatingControl *)self _isRTL])
  {
    double v12 = CGRectWithFlippedOriginRelativeToBoundingRect(v12, v6, v15, v10, v4, v6, v8, v10);
    double v6 = v21;
    double v15 = v22;
    double v10 = v23;
  }
  filledStarsImageView = self->_filledStarsImageView;
  -[UIImageView setFrame:](filledStarsImageView, "setFrame:", v12, v6, v15, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SUUIStarRatingControl *)self bounds];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)setBackgroundColor:(id)a3
{
  emptyStarsImageView = self->_emptyStarsImageView;
  id v5 = a3;
  [(UIImageView *)emptyStarsImageView setBackgroundColor:v5];
  [(UIImageView *)self->_filledStarsImageView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIStarRatingControl;
  [(SUUIStarRatingControl *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(UIImageView *)self->_emptyStarsImageView image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)_isRTL
{
  return [(SUUIStarRatingControl *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (unint64_t)_lastStar
{
  return [(SUUIStarRatingControl *)self _ratingForUIDirection:5];
}

- (unint64_t)_firstStar
{
  return [(SUUIStarRatingControl *)self _ratingForUIDirection:1];
}

- (unint64_t)_ratingForUIDirection:(unint64_t)a3
{
  if ([(SUUIStarRatingControl *)self _isRTL]) {
    return 6 - a3;
  }
  else {
    return a3;
  }
}

- (double)_unfilledStarsWidth
{
  [(SUUIStarRatingControl *)self starWidth];
  float v4 = v3;
  [(SUUIStarRatingControl *)self starSpacing];
  return (float)((float)(v5 * 4.0) + (float)(v4 * 5.0));
}

- (double)_unfilledStarsMinX
{
  [(SUUIStarRatingControl *)self bounds];
  double v4 = v3;
  [(SUUIStarRatingControl *)self _unfilledStarsWidth];
  return (v4 - v5) * 0.5;
}

- (void)_updateUserRatingWithTouch:(id)a3
{
  int64_t userRating = self->_userRating;
  [a3 locationInView:self];
  double v6 = v5;
  [(SUUIStarRatingControl *)self _unfilledStarsMinX];
  double v8 = v7;
  [(SUUIStarRatingControl *)self starSpacing];
  if (v6 >= v8 - v9)
  {
    [(SUUIStarRatingControl *)self _unfilledStarsMinX];
    double v12 = v11;
    [(SUUIStarRatingControl *)self _unfilledStarsWidth];
    if (v6 >= v12 + v13)
    {
      unint64_t v10 = [(SUUIStarRatingControl *)self _lastStar];
    }
    else
    {
      [(SUUIStarRatingControl *)self _unfilledStarsMinX];
      double v15 = v14;
      [(SUUIStarRatingControl *)self starWidth];
      double v17 = v15 + v16;
      uint64_t v18 = 1;
      while (v6 >= v17)
      {
        [(SUUIStarRatingControl *)self starWidth];
        float v20 = v19;
        [(SUUIStarRatingControl *)self starSpacing];
        double v17 = v17 + (float)(v20 + v21);
        if (++v18 == 6) {
          goto LABEL_11;
        }
      }
      unint64_t v10 = [(SUUIStarRatingControl *)self _ratingForUIDirection:v18];
    }
  }
  else
  {
    unint64_t v10 = [(SUUIStarRatingControl *)self _firstStar];
  }
  int64_t userRating = v10;
LABEL_11:
  [(SUUIStarRatingControl *)self setUserRating:userRating];
}

- (void)setStarSpacing:(float)a3
{
  self->_starSpacing = a3;
}

- (void)setStarWidth:(float)a3
{
  self->_starWidth = a3;
}

- (int64_t)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledStarsImageView, 0);
  objc_storeStrong((id *)&self->_emptyStarsImageView, 0);
}

@end