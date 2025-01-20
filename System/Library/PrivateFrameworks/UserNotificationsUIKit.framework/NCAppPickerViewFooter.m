@interface NCAppPickerViewFooter
+ (double)preferredHeightForWidth:(double)a3 showMoreButton:(BOOL)a4;
+ (id)_footnoteFont;
+ (id)_footnoteText;
+ (id)_showMoreButtonFont;
+ (id)_showMoreButtonText;
+ (id)reuseIdentifier;
- (NCAppPickerViewFooter)initWithFrame:(CGRect)a3;
- (NCAppPickerViewFooterDelegate)delegate;
- (void)_showMoreButtonPressed:(id)a3;
- (void)configureWithShowMoreButton:(BOOL)a3 delegate:(id)a4;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
@end

@implementation NCAppPickerViewFooter

- (NCAppPickerViewFooter)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)NCAppPickerViewFooter;
  v3 = -[NCAppPickerViewFooter initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    showMoreButton = v3->_showMoreButton;
    v3->_showMoreButton = (UIButton *)v9;

    [(UIButton *)v3->_showMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_showMoreButton addTarget:v3 action:sel__showMoreButtonPressed_ forControlEvents:64];
    v11 = v3->_showMoreButton;
    v12 = [(id)objc_opt_class() _showMoreButtonText];
    [(UIButton *)v11 setTitle:v12 forState:0];

    v13 = [(UIButton *)v3->_showMoreButton titleLabel];
    v14 = [(id)objc_opt_class() _showMoreButtonFont];
    [v13 setFont:v14];

    v15 = v3->_showMoreButton;
    v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIButton *)v15 setTitleColor:v16 forState:0];

    [(NCAppPickerViewFooter *)v3 addSubview:v3->_showMoreButton];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    footnoteLabel = v3->_footnoteLabel;
    v3->_footnoteLabel = (UILabel *)v17;

    [(UILabel *)v3->_footnoteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v3->_footnoteLabel;
    v20 = [(id)objc_opt_class() _footnoteText];
    [(UILabel *)v19 setText:v20];

    v21 = v3->_footnoteLabel;
    v22 = [(id)objc_opt_class() _footnoteFont];
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v3->_footnoteLabel setNumberOfLines:0];
    v23 = v3->_footnoteLabel;
    v24 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v23 setTextColor:v24];

    [(UILabel *)v3->_footnoteLabel setTextAlignment:1];
    [(NCAppPickerViewFooter *)v3 addSubview:v3->_footnoteLabel];
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v26 = [(UIButton *)v3->_showMoreButton topAnchor];
    v27 = [(NCAppPickerViewFooter *)v3 topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:8.0];
    [v25 addObject:v28];

    v29 = [(UIButton *)v3->_showMoreButton leadingAnchor];
    v30 = [(NCAppPickerViewFooter *)v3 leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v25 addObject:v31];

    v32 = [(NCAppPickerViewFooter *)v3 trailingAnchor];
    v33 = [(UIButton *)v3->_showMoreButton trailingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v25 addObject:v34];

    v35 = [(UILabel *)v3->_footnoteLabel leadingAnchor];
    v36 = [(NCAppPickerViewFooter *)v3 leadingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v25 addObject:v37];

    v38 = [(NCAppPickerViewFooter *)v3 trailingAnchor];
    v39 = [(UILabel *)v3->_footnoteLabel trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v25 addObject:v40];

    v41 = [(NCAppPickerViewFooter *)v3 bottomAnchor];
    v42 = [(UILabel *)v3->_footnoteLabel bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:4.0];
    [v25 addObject:v43];

    [MEMORY[0x1E4F28DC8] activateConstraints:v25];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewFooter;
  [(NCAppPickerViewFooter *)&v3 prepareForReuse];
  [(NCAppPickerViewFooter *)self setDelegate:0];
}

+ (id)reuseIdentifier
{
  return @"NCAppPickerViewFooter";
}

+ (double)preferredHeightForWidth:(double)a3 showMoreButton:(BOOL)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!preferredHeightForWidth_showMoreButton____drawingContext)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    double v7 = (void *)preferredHeightForWidth_showMoreButton____drawingContext;
    preferredHeightForWidth_showMoreButton____drawingContext = (uint64_t)v6;

    [(id)preferredHeightForWidth_showMoreButton____drawingContext setWantsNumberOfLineFragments:1];
  }
  if (a4)
  {
    double v8 = [(id)objc_opt_class() _showMoreButtonText];
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    uint64_t v20 = *MEMORY[0x1E4FB06F8];
    v10 = [(id)objc_opt_class() _showMoreButtonFont];
    v21[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v11, preferredHeightForWidth_showMoreButton____drawingContext, a3, 0.0);
    double v12 = CGRectGetHeight(v22) + 8.0;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    double v12 = 0.0;
  }
  v13 = [(id)objc_opt_class() _footnoteText];
  uint64_t v18 = v9;
  v14 = [(id)objc_opt_class() _footnoteFont];
  v19 = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 1, v15, preferredHeightForWidth_showMoreButton____drawingContext, a3, 0.0);
  double Height = CGRectGetHeight(v23);

  return v12 + Height + 16.0 + 4.0;
}

- (void)configureWithShowMoreButton:(BOOL)a3 delegate:(id)a4
{
  showMoreButton = self->_showMoreButton;
  BOOL v6 = !a3;
  id v7 = a4;
  [(UIButton *)showMoreButton setHidden:v6];
  [(NCAppPickerViewFooter *)self setDelegate:v7];
}

+ (id)_footnoteText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_SETTINGS_CHANGES" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_footnoteFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)_showMoreButtonText
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  objc_super v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_SETTINGS_SHOW_MORE" value:&stru_1F2F516F8 table:0];

  return v3;
}

+ (id)_showMoreButtonFont
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  objc_super v3 = (void *)MEMORY[0x1E4FB08E0];
  [v2 pointSize];
  id v4 = objc_msgSend(v3, "systemFontOfSize:weight:");

  return v4;
}

- (void)_showMoreButtonPressed:(id)a3
{
  id v4 = [(NCAppPickerViewFooter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appPickViewFooterShowMoreButtonPressed:self];
  }
}

- (NCAppPickerViewFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCAppPickerViewFooterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);

  objc_storeStrong((id *)&self->_captionLabel, 0);
}

@end