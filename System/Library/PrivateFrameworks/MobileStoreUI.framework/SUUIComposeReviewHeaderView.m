@interface SUUIComposeReviewHeaderView
- (NSString)title;
- (SUUIComposeReviewHeaderDelegate)delegate;
- (SUUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (SUUIReviewMetadata)review;
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
- (void)textFieldListValidityDidChange:(id)a3;
- (void)textFieldListValuesDidChange:(id)a3;
@end

@implementation SUUIComposeReviewHeaderView

- (SUUIComposeReviewHeaderView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v22.receiver = self;
  v22.super_class = (Class)SUUIComposeReviewHeaderView;
  v5 = -[SUUIComposeReviewHeaderView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"star"];
    v8 = [MEMORY[0x263F827E8] systemImageNamed:@"star.fill"];
    v9 = SKGetRatingStarsImage();
    v10 = SKGetRatingStarsImage();
    v11 = [v9 imageWithRenderingMode:2];

    v12 = [v10 imageWithRenderingMode:2];

    uint64_t v13 = [objc_alloc(MEMORY[0x263F17FB8]) initWithBackgroundImage:v11 foregroundImage:v12];
    ratingControl = v6->_ratingControl;
    v6->_ratingControl = (SKStarRatingControl *)v13;

    v15 = v6->_ratingControl;
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"RATING_EXPLANATION" value:&stru_2704F8130 table:0];
    [(SKStarRatingControl *)v15 setExplanationText:v17];

    [(SKStarRatingControl *)v6->_ratingControl setStarWidth:27.5];
    -[SKStarRatingControl setHitPadding:](v6->_ratingControl, "setHitPadding:", 70.0, 3.0);
    [(SKStarRatingControl *)v6->_ratingControl sizeToFit];
    [(SUUIComposeReviewHeaderView *)v6 addSubview:v6->_ratingControl];
    v18 = [SUUIComposeTextFieldListView alloc];
    uint64_t v19 = -[SUUIComposeTextFieldListView initWithFrame:style:](v18, "initWithFrame:style:", v6->_style, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textFieldListView = v6->_textFieldListView;
    v6->_textFieldListView = (SUUIComposeTextFieldListView *)v19;

    [(SUUIComposeTextFieldListView *)v6->_textFieldListView setDelegate:v6];
    [(SUUIComposeTextFieldListView *)v6->_textFieldListView reloadData];
    [(SUUIComposeReviewHeaderView *)v6 addSubview:v6->_textFieldListView];
  }
  return v6;
}

- (void)dealloc
{
  [(SUUIComposeTextFieldListView *)self->_textFieldListView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeReviewHeaderView;
  [(SUUIComposeReviewHeaderView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(SUUIComposeReviewHeaderView *)self bounds];
  double v4 = v3;
  [(SKStarRatingControl *)self->_ratingControl frame];
  float v6 = (v4 - v5) * 0.5;
  -[SKStarRatingControl setFrame:](self->_ratingControl, "setFrame:", floorf(v6), 5.0);
  [(SUUIComposeTextFieldListView *)self->_textFieldListView frame];
  double v8 = v7;
  [(SUUIComposeTextFieldListView *)self->_textFieldListView height];
  textFieldListView = self->_textFieldListView;
  -[SUUIComposeTextFieldListView setFrame:](textFieldListView, "setFrame:", v8, 44.0, v4, v9);
}

- (void)sizeToFit
{
  [(SUUIComposeReviewHeaderView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(SUUIComposeTextFieldListView *)self->_textFieldListView height];
  -[SUUIComposeReviewHeaderView setFrame:](self, "setFrame:", v4, v6, v8, v9 + 44.0);
}

- (UIResponder)initialFirstResponder
{
  return [(SUUIComposeTextFieldListView *)self->_textFieldListView initialFirstResponder];
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
  review = (SUUIReviewMetadata *)a3;
  double v7 = review;
  if (self->_review != review)
  {
    objc_storeStrong((id *)&self->_review, a3);
    review = self->_review;
  }
  ratingControl = self->_ratingControl;
  [(SUUIReviewMetadata *)review rating];
  -[SKStarRatingControl setValue:](ratingControl, "setValue:");
  [(SUUIComposeTextFieldListView *)self->_textFieldListView reloadData];
}

- (NSString)title
{
  return (NSString *)[(SUUIComposeTextFieldListView *)self->_textFieldListView textForFieldAtIndex:0];
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
  double v6 = objc_alloc_init(SUUIComposeTextFieldConfiguration);
  if (!a4)
  {
    int64_t style = self->_style;
    double v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v9 = v8;
    if (style == 1)
    {
      v10 = [v8 localizedStringForKey:@"SUBJECT_LABEL" value:&stru_2704F8130 table:0];
      [(SUUIComposeTextFieldConfiguration *)v6 setLabel:v10];
    }
    else
    {
      v10 = [v8 localizedStringForKey:@"SUBJECT_PLACEHOLDER" value:&stru_2704F8130 table:0];
      [(SUUIComposeTextFieldConfiguration *)v6 setPlaceholder:v10];
    }

    [(SUUIComposeTextFieldConfiguration *)v6 setMaxLength:[(SUUIReviewMetadata *)self->_review titleMaxLength]];
    v11 = [(SUUIReviewMetadata *)self->_review title];
    [(SUUIComposeTextFieldConfiguration *)v6 setValue:v11];
  }
  return v6;
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

- (SUUIComposeReviewHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIComposeReviewHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIReviewMetadata)review
{
  return self->_review;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldListView, 0);
  objc_storeStrong((id *)&self->_review, 0);
  objc_storeStrong((id *)&self->_ratingControlBackground, 0);
  objc_storeStrong((id *)&self->_ratingControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end