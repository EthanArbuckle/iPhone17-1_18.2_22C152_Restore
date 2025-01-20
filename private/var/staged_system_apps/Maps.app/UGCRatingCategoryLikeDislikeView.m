@interface UGCRatingCategoryLikeDislikeView
- (BOOL)enabled;
- (NSString)uniqueIdentifier;
- (UGCRatingCategoryLikeDislikeView)initWithCurrentState:(int64_t)a3;
- (UGCRatingCategoryLikeDislikeViewDelegate)delegate;
- (int64_t)currentState;
- (void)_dislikeButtonPressed;
- (void)_likeButtonPressed;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance:(BOOL)a3;
- (void)didTapOnGlyphView:(id)a3;
- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation UGCRatingCategoryLikeDislikeView

- (UGCRatingCategoryLikeDislikeView)initWithCurrentState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UGCRatingCategoryLikeDislikeView;
  v4 = -[UGCRatingCategoryLikeDislikeView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(UGCRatingCategoryLikeDislikeView *)v4 setAccessibilityIdentifier:v6];

    [(UGCRatingCategoryLikeDislikeView *)v4 _setupSubviews];
    [(UGCRatingCategoryLikeDislikeView *)v4 _setupConstraints];
    [(UGCRatingCategoryLikeDislikeView *)v4 setCurrentState:a3 animated:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[UGCGlyphButtonView likeButtonView];
  likeButton = self->_likeButton;
  self->_likeButton = v3;

  [(UGCGlyphButtonView *)self->_likeButton setAccessibilityIdentifier:@"LikeButton"];
  [(UGCGlyphButtonView *)self->_likeButton setDelegate:self];
  v5 = +[UGCGlyphButtonView dislikeButtonView];
  dislikeButton = self->_dislikeButton;
  self->_dislikeButton = v5;

  [(UGCGlyphButtonView *)self->_dislikeButton setAccessibilityIdentifier:@"DislikeButton"];
  [(UGCGlyphButtonView *)self->_dislikeButton setDelegate:self];
  v7 = self->_likeButton;
  objc_super v8 = self;
  [(UGCRatingCategoryLikeDislikeView *)v8 addSubview:v7];
  [(UGCRatingCategoryLikeDislikeView *)v8 addSubview:self->_dislikeButton];
}

- (void)_setupConstraints
{
  id v3 = [objc_alloc((Class)MUStackLayout) initWithContainer:self axis:0];
  dislikeButton = self->_dislikeButton;
  v6[0] = self->_likeButton;
  v6[1] = dislikeButton;
  v5 = +[NSArray arrayWithObjects:v6 count:2];
  [v3 setArrangedLayoutItems:v5];

  [v3 setSpacing:8.0];
  [v3 activate];
}

- (void)_likeButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained likeDislikeViewDidSelectLike:self];
}

- (void)_dislikeButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained likeDislikeViewDidSelectDislike:self];
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    [(UGCRatingCategoryLikeDislikeView *)self _updateAppearance:a4];
  }
}

- (BOOL)enabled
{
  return [(UGCGlyphButtonView *)self->_likeButton isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UGCRatingCategoryLikeDislikeView *)self enabled] != a3)
  {
    [(UGCGlyphButtonView *)self->_likeButton setEnabled:v3];
    dislikeButton = self->_dislikeButton;
    [(UGCGlyphButtonView *)dislikeButton setEnabled:v3];
  }
}

- (void)_updateAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t currentState = self->_currentState;
  [(UGCGlyphButtonView *)self->_likeButton setMuted:currentState == 1];
  [(UGCGlyphButtonView *)self->_dislikeButton setMuted:currentState == 2];
  if ((currentState == 2) != [(UGCGlyphButtonView *)self->_likeButton isSelected]) {
    [(UGCGlyphButtonView *)self->_likeButton setSelected:currentState == 2 animated:v3];
  }
  if ((currentState == 1) != [(UGCGlyphButtonView *)self->_dislikeButton isSelected])
  {
    dislikeButton = self->_dislikeButton;
    [(UGCGlyphButtonView *)dislikeButton setSelected:currentState == 1 animated:v3];
  }
}

- (void)didTapOnGlyphView:(id)a3
{
  v4 = (UGCGlyphButtonView *)a3;
  if (self->_likeButton == v4)
  {
    v5 = v4;
    [(UGCRatingCategoryLikeDislikeView *)self _likeButtonPressed];
  }
  else
  {
    if (self->_dislikeButton != v4) {
      goto LABEL_6;
    }
    v5 = v4;
    [(UGCRatingCategoryLikeDislikeView *)self _dislikeButtonPressed];
  }
  v4 = v5;
LABEL_6:
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (UGCRatingCategoryLikeDislikeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCRatingCategoryLikeDislikeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_likeDislikeHorizontalSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_dislikeButton, 0);

  objc_storeStrong((id *)&self->_likeButton, 0);
}

@end