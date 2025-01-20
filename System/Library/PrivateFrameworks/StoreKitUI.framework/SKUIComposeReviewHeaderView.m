@interface SKUIComposeReviewHeaderView
- (NSString)title;
- (SKUIComposeReviewHeaderDelegate)delegate;
- (SKUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (SKUIReviewMetadata)review;
- (UIResponder)initialFirstResponder;
- (float)rating;
- (id)textFieldList:(id)a3 configurationForFieldAtIndex:(unint64_t)a4;
- (int64_t)composeReviewStyle;
- (int64_t)numberOfColumnsInTextFieldList:(id)a3;
- (int64_t)numberOfFieldsInTextFieldList:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setRating:(float)a3;
- (void)setReview:(id)a3;
- (void)sizeToFit;
- (void)starRatingButtonControlDidUpdateValues;
- (void)starRatingControlDidUpdateValues:(id)a3;
- (void)textFieldListValidityDidChange:(id)a3;
- (void)textFieldListValuesDidChange:(id)a3;
@end

@implementation SKUIComposeReviewHeaderView

- (SKUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v24.receiver = self;
  v24.super_class = (Class)SKUIComposeReviewHeaderView;
  v5 = -[SKUIComposeReviewHeaderView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
    v9 = SKGetRatingStarsImage();
    v10 = SKGetRatingStarsImage();
    v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v12 = [v9 imageWithTintColor:v11];

    v13 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v14 = [v10 imageWithTintColor:v13];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F3C2F8]) initWithBackgroundImage:v12 foregroundImage:v14];
    ratingControl = v6->_ratingControl;
    v6->_ratingControl = (SKStarRatingControl *)v15;

    v17 = v6->_ratingControl;
    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"RATING_EXPLANATION" value:&stru_1F1C879E8 table:0];
    [(SKStarRatingControl *)v17 setExplanationText:v19];

    [(SKStarRatingControl *)v6->_ratingControl setStarWidth:27.5];
    -[SKStarRatingControl setHitPadding:](v6->_ratingControl, "setHitPadding:", 70.0, 3.0);
    [(SKStarRatingControl *)v6->_ratingControl sizeToFit];
    [(SKUIComposeReviewHeaderView *)v6 addSubview:v6->_ratingControl];
    [(SKStarRatingControl *)v6->_ratingControl addTarget:v6 action:sel_starRatingControlDidUpdateValues_ forControlEvents:4096];
    v20 = [SKUIComposeTextFieldListView alloc];
    uint64_t v21 = -[SKUIComposeTextFieldListView initWithFrame:style:](v20, "initWithFrame:style:", v6->_style, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textFieldListView = v6->_textFieldListView;
    v6->_textFieldListView = (SKUIComposeTextFieldListView *)v21;

    [(SKUIComposeTextFieldListView *)v6->_textFieldListView setDelegate:v6];
    [(SKUIComposeTextFieldListView *)v6->_textFieldListView reloadData];
    [(SKUIComposeReviewHeaderView *)v6 addSubview:v6->_textFieldListView];
  }
  return v6;
}

- (void)dealloc
{
  [(SKUIComposeTextFieldListView *)self->_textFieldListView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewHeaderView;
  [(SKUIComposeReviewHeaderView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(SKUIComposeReviewHeaderView *)self bounds];
  double v4 = v3;
  [(SKStarRatingControl *)self->_ratingControl frame];
  float v6 = (v4 - v5) * 0.5;
  -[SKStarRatingControl setFrame:](self->_ratingControl, "setFrame:", floorf(v6), 5.0);
  [(SKUIComposeTextFieldListView *)self->_textFieldListView frame];
  double v8 = v7;
  [(SKUIComposeTextFieldListView *)self->_textFieldListView height];
  textFieldListView = self->_textFieldListView;

  -[SKUIComposeTextFieldListView setFrame:](textFieldListView, "setFrame:", v8, 44.0, v4, v9);
}

- (void)sizeToFit
{
  [(SKUIComposeReviewHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(SKUIComposeTextFieldListView *)self->_textFieldListView height];

  -[SKUIComposeReviewHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v9 + 44.0);
}

- (UIResponder)initialFirstResponder
{
  return [(SKUIComposeTextFieldListView *)self->_textFieldListView initialFirstResponder];
}

- (float)rating
{
  [(SKStarRatingControl *)self->_ratingControl value];
  return result;
}

- (void)setRating:(float)a3
{
}

- (void)setReview:(id)a3
{
  review = (SKUIReviewMetadata *)a3;
  double v7 = review;
  if (self->_review != review)
  {
    objc_storeStrong((id *)&self->_review, a3);
    review = self->_review;
  }
  ratingControl = self->_ratingControl;
  [(SKUIReviewMetadata *)review rating];
  -[SKStarRatingControl setValue:](ratingControl, "setValue:");
  [(SKUIComposeTextFieldListView *)self->_textFieldListView reloadData];
}

- (NSString)title
{
  return (NSString *)[(SKUIComposeTextFieldListView *)self->_textFieldListView textForFieldAtIndex:0];
}

- (int64_t)numberOfColumnsInTextFieldList:(id)a3
{
  return 1;
}

- (int64_t)numberOfFieldsInTextFieldList:(id)a3
{
  return 1;
}

- (id)textFieldList:(id)a3 configurationForFieldAtIndex:(unint64_t)a4
{
  double v6 = objc_alloc_init(SKUIComposeTextFieldConfiguration);
  if (!a4)
  {
    int64_t style = self->_style;
    double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v9 = v8;
    if (style == 1)
    {
      v10 = [v8 localizedStringForKey:@"SUBJECT_LABEL" value:&stru_1F1C879E8 table:0];
      [(SKUIComposeTextFieldConfiguration *)v6 setLabel:v10];
    }
    else
    {
      v10 = [v8 localizedStringForKey:@"SUBJECT_PLACEHOLDER" value:&stru_1F1C879E8 table:0];
      [(SKUIComposeTextFieldConfiguration *)v6 setPlaceholder:v10];
    }

    [(SKUIComposeTextFieldConfiguration *)v6 setMaxLength:[(SKUIReviewMetadata *)self->_review titleMaxLength]];
    v11 = [(SKUIReviewMetadata *)self->_review title];
    [(SKUIComposeTextFieldConfiguration *)v6 setValue:v11];
  }

  return v6;
}

- (void)starRatingControlDidUpdateValues:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeHeaderViewValidityDidChange:self];
}

- (void)starRatingButtonControlDidUpdateValues
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeHeaderViewValidityDidChange:self];
}

- (void)textFieldListValidityDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeHeaderViewValidityDidChange:self];
}

- (void)textFieldListValuesDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeHeaderViewValuesDidChange:self];
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SKUIComposeReviewHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIComposeReviewHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIReviewMetadata)review
{
  return self->_review;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldListView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_buttonRatingControl, 0);
  objc_storeStrong((id *)&self->_ratingControl, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end