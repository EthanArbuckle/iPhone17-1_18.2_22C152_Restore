@interface UGCRatingCategoryCell
- (BOOL)enabled;
- (MURatingPercentageViewModel)appleRatingViewModel;
- (NSString)key;
- (UGCRatingCategoryCell)initWithCurrentState:(int64_t)a3;
- (UGCRatingCategoryCellDelegate)delegate;
- (UIFont)ratingLabelFont;
- (int64_t)currentState;
- (void)_setupConstraints;
- (void)_setupSubviewsWithState:(int64_t)a3;
- (void)_updateState:(int64_t)a3;
- (void)likeDislikeViewDidSelectDislike:(id)a3;
- (void)likeDislikeViewDidSelectLike:(id)a3;
- (void)setAppleRatingViewModel:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation UGCRatingCategoryCell

- (UGCRatingCategoryCell)initWithCurrentState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UGCRatingCategoryCell;
  v4 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(UGCRatingCategoryCell *)v4 setAccessibilityIdentifier:v6];

    [(UGCRatingCategoryCell *)v4 _setupSubviewsWithState:a3];
    [(UGCRatingCategoryCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviewsWithState:(int64_t)a3
{
  self->_currentState = a3;
  uint64_t v5 = sub_1000BBB44(self);
  double v6 = MUAppleRatingRowViewVerticalPadding;
  if (v5 == 5) {
    double v6 = 10.0;
  }
  -[UGCRatingCategoryCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v6, 0.0, v6, 0.0);
  v7 = [objc_alloc((Class)MUAppleRatingRowView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  categoryView = self->_categoryView;
  self->_categoryView = v7;

  [(MUAppleRatingRowView *)self->_categoryView setBottomHairlineHidden:1];
  v9 = [[UGCRatingCategoryLikeDislikeView alloc] initWithCurrentState:a3];
  likeDislikeView = self->_likeDislikeView;
  self->_likeDislikeView = v9;

  [(UGCRatingCategoryLikeDislikeView *)self->_likeDislikeView setDelegate:self];
  [(UGCRatingCategoryCell *)self addSubview:self->_categoryView];
  v11 = self->_likeDislikeView;

  [(UGCRatingCategoryCell *)self addSubview:v11];
}

- (void)_setupConstraints
{
  id v3 = objc_alloc((Class)MUStackLayout);
  v4 = [(UGCRatingCategoryCell *)self layoutMarginsGuide];
  id v5 = [v3 initWithContainer:v4 axis:0];

  likeDislikeView = self->_likeDislikeView;
  v9[0] = self->_categoryView;
  v9[1] = likeDislikeView;
  v7 = +[NSArray arrayWithObjects:v9 count:2];
  [v5 setArrangedLayoutItems:v7];

  [v5 setSpacing:12.0];
  [v5 setAlignment:2];
  [v5 setAlignmentBoundsContent:1];
  LODWORD(v8) = 1112276992;
  [v5 setAlignmentFittingSizePriority:v8];
  [v5 activate];
}

- (void)likeDislikeViewDidSelectLike:(id)a3
{
  id v4 = a3;
  int64_t currentState = self->_currentState;
  objc_initWeak(&location, self);
  double v6 = [(UGCRatingCategoryCell *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AE8F0C;
  v7[3] = &unk_1012EB0A0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)(2 * (currentState != 2));
  [v6 ratingCategoryCell:self presentInformedConsentIfNeededWithCompletion:v7];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)likeDislikeViewDidSelectDislike:(id)a3
{
  id v4 = a3;
  int64_t currentState = self->_currentState;
  objc_initWeak(&location, self);
  double v6 = [(UGCRatingCategoryCell *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AE9078;
  v7[3] = &unk_1012EB0A0;
  objc_copyWeak(v8, &location);
  v8[1] = (id)(currentState != 1);
  [v6 ratingCategoryCell:self presentInformedConsentIfNeededWithCompletion:v7];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_updateState:(int64_t)a3
{
  if (self->_currentState != a3)
  {
    -[UGCRatingCategoryCell setCurrentState:animated:](self, "setCurrentState:animated:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained ratingCategoryCellChangedState:a3 forKey:self->_key];
  }
}

- (void)setCurrentState:(int64_t)a3
{
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_currentState != a3)
  {
    self->_int64_t currentState = a3;
    -[UGCRatingCategoryLikeDislikeView setCurrentState:animated:](self->_likeDislikeView, "setCurrentState:animated:");
  }
}

- (void)setAppleRatingViewModel:(id)a3
{
  id v5 = (MURatingPercentageViewModel *)a3;
  appleRatingViewModel = self->_appleRatingViewModel;
  if (appleRatingViewModel != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = [(MURatingPercentageViewModel *)appleRatingViewModel isEqual:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appleRatingViewModel, a3);
      [(MUAppleRatingRowView *)self->_categoryView setViewModel:self->_appleRatingViewModel];
      id v5 = v8;
    }
  }
}

- (BOOL)enabled
{
  return [(UGCRatingCategoryLikeDislikeView *)self->_likeDislikeView enabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (MURatingPercentageViewModel)appleRatingViewModel
{
  return self->_appleRatingViewModel;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (UGCRatingCategoryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCRatingCategoryCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)ratingLabelFont
{
  return self->_ratingLabelFont;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingLabelFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appleRatingViewModel, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_likeDislikeView, 0);

  objc_storeStrong((id *)&self->_categoryView, 0);
}

@end