@interface SKUIReviewInAppRatingButtonViewController
- (BOOL)isEnabled;
- (NSString)titleString;
- (SKUIReviewInAppRatingButtonViewController)initWithTitle:(id)a3 style:(unint64_t)a4;
- (UILabel)titleLabel;
- (unint64_t)style;
- (void)setEnabled:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)viewDidLoad;
@end

@implementation SKUIReviewInAppRatingButtonViewController

- (SKUIReviewInAppRatingButtonViewController)initWithTitle:(id)a3 style:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKUIReviewInAppRatingButtonViewController;
  v8 = [(SKUIReviewInAppRatingButtonViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_titleString, a3);
    v9->_style = a4;
    v9->_enabled = 1;
  }

  return v9;
}

- (void)viewDidLoad
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SKUIReviewInAppRatingButtonViewController;
  [(SKUIReviewInAppRatingButtonViewController *)&v28 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(SKUIReviewInAppRatingButtonViewController *)self titleString];
  [v6 setText:v7];

  v8 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  v9 = [v8 tintColor];
  [v6 setTextColor:v9];

  if ([(SKUIReviewInAppRatingButtonViewController *)self style] == 1)
  {
    v10 = (void *)MEMORY[0x1E4FB08E0];
    objc_super v11 = [v6 font];
    [v11 pointSize];
    v12 = objc_msgSend(v10, "boldSystemFontOfSize:");
    [v6 setFont:v12];
  }
  [v6 setTextAlignment:1];
  v13 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  [v13 addSubview:v6];

  [(SKUIReviewInAppRatingButtonViewController *)self setTitleLabel:v6];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [v6 leadingAnchor];
  v27 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v14 = [v6 trailingAnchor];
  v15 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v29[1] = v17;
  v18 = [v6 centerYAnchor];
  v19 = [(SKUIReviewInAppRatingButtonViewController *)self view];
  v20 = [v19 centerYAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v29[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  [v23 activateConstraints:v22];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  self->_enabled = a3;
  if (a3)
  {
    v3 = [(SKUIReviewInAppRatingButtonViewController *)self view];
    [v3 tintColor];
  }
  else
  {
    [MEMORY[0x1E4FB1618] grayColor];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(SKUIReviewInAppRatingButtonViewController *)self titleLabel];
  [v6 setTextColor:v7];

  if (v4)
  {

    id v7 = v3;
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end