@interface UGCSuggestionView
- (UGCSuggestionView)initWithFrame:(CGRect)a3;
- (UGCSuggestionViewDelegate)delegate;
- (UGCSuggestionViewModel)viewModel;
- (id)_contentLayoutGroup;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_suggestionTapped;
- (void)_updateConstraints;
- (void)_updateFromViewModel;
- (void)likeDislikeViewDidSelectDislike:(id)a3;
- (void)likeDislikeViewDidSelectLike:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UGCSuggestionView

- (UGCSuggestionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UGCSuggestionView;
  v3 = -[UGCSuggestionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UGCSuggestionView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_suggestionTapped"];
    [(UGCSuggestionView *)v4 addGestureRecognizer:v5];
    [(UGCSuggestionView *)v4 _setupSubviews];
    [(UGCSuggestionView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  if (sub_1000BBB44(self) == 5)
  {
    id v3 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    objc_super v7 = (UIImageView *)[v3 initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = self->_imageView;
    self->_imageView = v7;

    v9 = [(UIImageView *)self->_imageView layer];
    [v9 setCornerRadius:16.0];

    [(UGCSuggestionView *)self addSubview:self->_imageView];
    v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v10;

    v12 = +[UIColor labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v12];

    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)self->_titleLabel setFont:v13];

    [(UGCSuggestionView *)self addSubview:self->_titleLabel];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    p_subtitleLabel = (uint64_t *)&self->_subtitleLabel;
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v14;

    v17 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v17];

    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)self->_subtitleLabel setFont:v18];
  }
  else
  {
    v19 = -[TwoLinesContentView initWithFrame:]([TwoLinesContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    p_subtitleLabel = (uint64_t *)&self->_twoLinesContentView;
    twoLinesContentView = self->_twoLinesContentView;
    self->_twoLinesContentView = v19;

    [(TwoLinesContentView *)self->_twoLinesContentView setUserInteractionEnabled:0];
  }
  uint64_t v21 = *p_subtitleLabel;

  [(UGCSuggestionView *)self addSubview:v21];
}

- (void)_setupConstraints
{
  id v10 = +[NSMutableArray array];
  if (sub_1000BBB44(self) == 5)
  {
    id v3 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_imageView size:32.0, 32.0];
    imageSizeLayout = self->_imageSizeLayout;
    self->_imageSizeLayout = v3;

    [v10 addObject:self->_imageSizeLayout];
  }
  id v5 = objc_alloc((Class)MUCompositionalStackLayout);
  v6 = [(UGCSuggestionView *)self layoutMarginsGuide];
  objc_super v7 = [(UGCSuggestionView *)self _contentLayoutGroup];
  v8 = (MUCompositionalStackLayout *)[v5 initWithContainer:v6 group:v7];
  compositionalStackLayout = self->_compositionalStackLayout;
  self->_compositionalStackLayout = v8;

  [v10 addObject:self->_compositionalStackLayout];
  +[NSLayoutConstraint _mapsui_activateLayouts:v10];
}

- (void)_updateConstraints
{
  id v3 = [(UGCSuggestionView *)self _contentLayoutGroup];
  [(MUCompositionalStackLayout *)self->_compositionalStackLayout setGroup:v3];
}

- (id)_contentLayoutGroup
{
  id v3 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithIdentifier:@"content" axis:0];
  [v3 setAlignment:2];
  [v3 setAlignmentBoundsContent:1];
  LODWORD(v4) = 1112276992;
  [v3 setAlignmentFittingSizePriority:v4];
  if (sub_1000BBB44(self) == 5)
  {
    [v3 addArrangedLayoutItem:self->_imageView];
    id v5 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithIdentifier:@"titles" axis:1];
    subtitleLabel = self->_subtitleLabel;
    v9[0] = self->_titleLabel;
    v9[1] = subtitleLabel;
    objc_super v7 = +[NSArray arrayWithObjects:v9 count:2];
    [v5 setArrangedLayoutItems:v7];

    [v3 addArrangedLayoutItem:v5];
    [v3 setPadding:v5 forArrangedLayoutItem:0.0, 8.0, 0.0, 0.0];
  }
  else
  {
    [v3 addArrangedLayoutItem:self->_twoLinesContentView];
  }
  if (self->_likeDislikeView)
  {
    [v3 addArrangedLayoutItem:];
    [v3 setPadding:self->_likeDislikeView forArrangedLayoutItem:0.0, 8.0, 0.0, 0.0];
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UGCSuggestionView;
  [(UGCSuggestionView *)&v10 traitCollectionDidChange:v4];
  if (sub_1000BBB44(self) == 5)
  {
    id v5 = [(UGCSuggestionView *)self traitCollection];
    [v5 _maps_displayScaleOrMainScreenScale];
    double v7 = v6;
    [v4 _maps_displayScaleOrMainScreenScale];
    double v9 = v8;

    if (v7 != v9) {
      [(UGCSuggestionView *)self _updateFromViewModel];
    }
  }
}

- (void)setViewModel:(id)a3
{
  id v5 = (UGCSuggestionViewModel *)a3;
  double v6 = v5;
  if (self->_viewModel != v5)
  {
    double v8 = v5;
    unsigned __int8 v7 = -[UGCSuggestionViewModel isEqual:](v5, "isEqual:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(UGCSuggestionView *)self _updateFromViewModel];
      double v6 = v8;
    }
  }
}

- (void)_updateFromViewModel
{
  int64_t v3 = [(UGCSuggestionViewModel *)self->_viewModel contentType];
  id v4 = [(UGCSuggestionViewModel *)self->_viewModel visitDate];
  id v5 = +[TwoLinesContentViewModelComposer cellModelForUGCSuggestionContentType:v3 visitDate:v4];

  if (sub_1000BBB44(self) == 5)
  {
    double v6 = [v5 titleText];
    [(UILabel *)self->_titleLabel setText:v6];

    unsigned __int8 v7 = [v5 subtitleText];
    [(UILabel *)self->_subtitleLabel setText:v7];

    double v8 = (void *)(self->_imageFetchCount + 1);
    self->_imageFetchCount = (unint64_t)v8;
    objc_initWeak(&location, self);
    double v9 = [(UGCSuggestionView *)self traitCollection];
    [v9 _maps_displayScaleOrMainScreenScale];
    double v11 = v10;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1008CC3A4;
    v17[3] = &unk_1012FFA20;
    objc_copyWeak(v18, &location);
    v18[1] = v8;
    [v5 fetchImageForScreenScale:v17 withCompletionHandler:v11];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    [(TwoLinesContentView *)self->_twoLinesContentView setViewModel:v5];
  }
  v12 = (char *)[(UGCSuggestionViewModel *)self->_viewModel contentType] - 2;
  likeDislikeView = self->_likeDislikeView;
  if ((unint64_t)v12 > 3)
  {
    if (likeDislikeView)
    {
      [(UGCRatingCategoryLikeDislikeView *)likeDislikeView removeFromSuperview];
      v16 = self->_likeDislikeView;
      self->_likeDislikeView = 0;
    }
  }
  else if (!likeDislikeView)
  {
    v14 = [[UGCRatingCategoryLikeDislikeView alloc] initWithCurrentState:0];
    v15 = self->_likeDislikeView;
    self->_likeDislikeView = v14;

    [(UGCRatingCategoryLikeDislikeView *)self->_likeDislikeView setDelegate:self];
    [(UGCSuggestionView *)self addSubview:self->_likeDislikeView];
  }
  [(UGCSuggestionView *)self _updateConstraints];
}

- (void)_suggestionTapped
{
  id v3 = [(UGCSuggestionView *)self delegate];
  [v3 didTapSuggestionView:self];
}

- (void)likeDislikeViewDidSelectLike:(id)a3
{
  id v4 = [(UGCSuggestionView *)self delegate];
  [v4 suggestionViewDidTapLike:self];
}

- (void)likeDislikeViewDidSelectDislike:(id)a3
{
  id v4 = [(UGCSuggestionView *)self delegate];
  [v4 suggestionViewDidTapDislike:self];
}

- (UGCSuggestionViewModel)viewModel
{
  return self->_viewModel;
}

- (UGCSuggestionViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_compositionalStackLayout, 0);
  objc_storeStrong((id *)&self->_likeDislikeView, 0);
  objc_storeStrong((id *)&self->_imageSizeLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end