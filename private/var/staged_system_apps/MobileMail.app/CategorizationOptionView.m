@interface CategorizationOptionView
- (CategorizationOptionDelegate)delegate;
- (CategorizationOptionView)initWithDelegate:(id)a3;
- (void)_setupView;
- (void)handleCategoriesTapped:(id)a3;
- (void)handleListViewTapped:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CategorizationOptionView

- (CategorizationOptionView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CategorizationOptionView;
  v5 = -[CategorizationOptionView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(CategorizationOptionView *)v6 _setupView];
  }

  return v6;
}

- (void)handleListViewTapped:(id)a3
{
  id v4 = [(CategorizationOptionView *)self delegate];
  [v4 handleListViewTappedForOptionView:self];
}

- (void)handleCategoriesTapped:(id)a3
{
  id v4 = [(CategorizationOptionView *)self delegate];
  [v4 handleCategoriesTappedForOptionView:self];
}

- (void)_setupView
{
  id v31 = [(CategorizationOptionView *)self delegate];
  v25 = +[UIImage imageNamed:@"PhoneWithBuckets"];
  v26 = +[UIImage imageNamed:@"PhoneWithNoBuckets"];
  v29 = +[UIImage systemImageNamed:MFImageGlyphCategorizationCheckmark];
  v28 = +[UIImage systemImageNamed:MFImageGlyphCategorizationEmptyCheckmark];
  id v3 = objc_alloc_init((Class)UIStackView);
  [v3 setAxis:1];
  [v3 setAlignment:3];
  id v4 = objc_alloc_init((Class)UIImageView);
  v30 = v4;
  [v4 setContentMode:1];
  [v4 setImage:v25];
  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    +[UIColor mailMessageListPrimarySelectionColor];
  }
  else {
  v5 = +[UIColor secondaryLabelColor];
  }
  [v4 setTintColor:v5];

  id v27 = objc_alloc_init((Class)UILabel);
  v6 = _EFLocalizedStringFromTable();
  [v27 setText:v6];

  v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v27 setFont:v7];

  [v27 setNumberOfLines:0];
  id v8 = objc_alloc_init((Class)UIImageView);
  [v8 setContentMode:1];
  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    v9 = v29;
  }
  else {
    v9 = v28;
  }
  [v8 setImage:v9];
  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    +[UIColor mailMessageListPrimarySelectionColor];
  }
  else {
  v10 = +[UIColor secondaryLabelColor];
  }
  [v8 setTintColor:v10];

  v11 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle2];
  [v8 setPreferredSymbolConfiguration:v11];

  [v3 addArrangedSubview:v4];
  [v3 addArrangedSubview:v27];
  [v3 addArrangedSubview:v8];
  [v3 setCustomSpacing:v4 afterView:10.0];
  [v3 setCustomSpacing:v27 afterView:14.0];
  id v24 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleCategoriesTapped:"];
  [v3 addGestureRecognizer:v24];
  [v3 setUserInteractionEnabled:1];
  id v12 = objc_alloc_init((Class)UIStackView);
  [v12 setAxis:1];
  [v12 setAlignment:3];
  id v13 = objc_alloc_init((Class)UIImageView);
  [v13 setContentMode:1];
  [v13 setImage:v26];
  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v14 = +[UIColor mailMessageListPrimarySelectionColor];
  }
  [v13 setTintColor:v14];

  id v15 = objc_alloc_init((Class)UILabel);
  v16 = _EFLocalizedStringFromTable();
  [v15 setText:v16];

  v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v15 setFont:v17];

  [v15 setNumberOfLines:0];
  id v18 = objc_alloc_init((Class)UIImageView);
  [v18 setContentMode:1];
  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v19 = +[UIColor mailMessageListPrimarySelectionColor];
  }
  [v18 setTintColor:v19];

  if ([v31 isCategorizationEnabledForOptionsView:self]) {
    v20 = v28;
  }
  else {
    v20 = v29;
  }
  [v18 setImage:v20];
  v21 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle2];
  [v18 setPreferredSymbolConfiguration:v21];

  [v12 addArrangedSubview:v13];
  [v12 addArrangedSubview:v15];
  [v12 addArrangedSubview:v18];
  [v12 setCustomSpacing:v13 afterView:10.0];
  [v12 setCustomSpacing:v15 afterView:14.0];
  id v22 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleListViewTapped:"];
  [v12 addGestureRecognizer:v22];
  [v12 setUserInteractionEnabled:1];
  id v23 = objc_alloc_init((Class)UIStackView);
  [v23 setAxis:0];
  [v23 setLayoutMargins:30.0, 30.0, 16.0, 30.0];
  [v23 setLayoutMarginsRelativeArrangement:1];
  [v23 setAlignment:1];
  [v23 setDistribution:1];
  [v23 addArrangedSubview:v3];
  [v23 addArrangedSubview:v12];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CategorizationOptionView *)self addSubview:v23];
  [(CategorizationOptionView *)self mf_pinToView:v23 usingLayoutMargins:0];
}

- (CategorizationOptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CategorizationOptionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end