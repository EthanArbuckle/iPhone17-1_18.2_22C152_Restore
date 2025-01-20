@interface RidesharingRatingView
- (RidesharingRatingView)initWithCoder:(id)a3;
- (RidesharingRatingView)initWithSelectedStars:(unint64_t)a3 updateBlock:(id)a4;
- (id)description;
- (void)_commonInitWithStars:(unint64_t)a3;
- (void)handleStarTouches:(id)a3 withEvent:(id)a4;
- (void)performCallBackWithStarValue;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateTheme;
@end

@implementation RidesharingRatingView

- (RidesharingRatingView)initWithSelectedStars:(unint64_t)a3 updateBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RidesharingRatingView;
  v7 = -[RidesharingRatingView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v8 = v7;
  if (v7)
  {
    [(RidesharingRatingView *)v7 _commonInitWithStars:a3];
    v8->_stars = a3;
    id v9 = [v6 copy];
    id updateBlock = v8->_updateBlock;
    v8->_id updateBlock = v9;
  }
  return v8;
}

- (RidesharingRatingView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RidesharingRatingView;
  v3 = [(RidesharingRatingView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RidesharingRatingView *)v3 _commonInitWithStars:0];
  }
  return v4;
}

- (void)_commonInitWithStars:(unint64_t)a3
{
  v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAxis:0];
  [(UIStackView *)self->_stackView setSpacing:5.0];
  [(UIStackView *)self->_stackView setDistribution:1];
  [(UIStackView *)self->_stackView setAlignment:3];
  for (uint64_t i = 0; i != 5; ++i)
  {
    v7 = +[UIImage imageNamed:@"ridesharing_rating_star"];
    v8 = [v7 imageWithRenderingMode:2];

    id v9 = [objc_alloc((Class)UIImageView) initWithImage:v8];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setTag:i];
    [v9 setContentMode:1];
    [(UIStackView *)self->_stackView addArrangedSubview:v9];
  }
  [(RidesharingRatingView *)self addSubview:self->_stackView];
  v10 = [(UIStackView *)self->_stackView topAnchor];
  v11 = [(RidesharingRatingView *)self topAnchor];
  objc_super v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [(UIStackView *)self->_stackView bottomAnchor];
  v14 = [(RidesharingRatingView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(UIStackView *)self->_stackView centerXAnchor];
  v17 = [(RidesharingRatingView *)self centerXAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  id v21 = [(UIStackView *)self->_stackView widthAnchor];
  v19 = [(RidesharingRatingView *)self widthAnchor];
  v20 = [v21 constraintLessThanOrEqualToAnchor:v19 multiplier:1.0];
  [v20 setActive:1];
}

- (void)updateTheme
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v9 = ((unint64_t)[v8 tag] & 0x8000000000000000) == 0
          && (unint64_t)[v8 tag] < self->_stars;
        v10 = [(RidesharingRatingView *)self theme];
        v11 = [v10 ridesharingRatingStarColorOn:v9];
        [v8 setTintColor:v11];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  [(RidesharingRatingView *)self handleStarTouches:a3 withEvent:a4];

  [(RidesharingRatingView *)self performCallBackWithStarValue];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(RidesharingRatingView *)self updateTheme];

  [(RidesharingRatingView *)self performCallBackWithStarValue];
}

- (void)handleStarTouches:(id)a3 withEvent:(id)a4
{
  id v23 = a3;
  [(UIStackView *)self->_stackView bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v13 = [v23 allObjects];
  long long v14 = [v13 lastObject];
  [v14 locationInView:self->_stackView];
  v25.x = v15;
  v25.y = v16;
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  BOOL v17 = CGRectContainsPoint(v26, v25);

  if (v17)
  {
    v18 = [v23 allObjects];
    v19 = [v18 lastObject];
    [v19 locationInView:self->_stackView];
    double v21 = v20;

    [(UIStackView *)self->_stackView bounds];
    self->_stars = (unint64_t)(v21 / (v22 / 5.0) + 1.0);
    [(RidesharingRatingView *)self updateTheme];
  }
}

- (void)performCallBackWithStarValue
{
  id updateBlock = (void (**)(id, unint64_t))self->_updateBlock;
  if (updateBlock) {
    updateBlock[2](updateBlock, self->_stars);
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"RidesharingRatingView\nStars:%lu", self->_stars];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end