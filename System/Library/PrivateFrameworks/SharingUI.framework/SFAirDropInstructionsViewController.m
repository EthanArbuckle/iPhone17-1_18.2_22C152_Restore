@interface SFAirDropInstructionsViewController
- (CGSize)_cachedPreferredItemSize;
- (SFAirDropActiveIconView)airDropActiveIconView;
- (UITextView)instructionsTextView;
- (double)_titleLabelHeight;
- (id)_airDropText;
- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5;
- (id)_instructionsBaseFormatString;
- (id)_instructionsText;
- (id)attributedStringWithTitle:(id)a3 content:(id)a4;
- (void)_layoutiOSSubviews;
- (void)_updateFontSizes;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredContentSize;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SFAirDropInstructionsViewController

- (id)_instructionsText
{
  return (id)SFLocalizedStringForKey();
}

- (id)_airDropText
{
  return (id)SFLocalizedStringForKey();
}

- (id)_instructionsBaseFormatString
{
  return (id)SFLocalizedStringForKey();
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)SFAirDropInstructionsViewController;
  [(SFAirDropInstructionsViewController *)&v23 viewDidLoad];
  v3 = [(SFAirDropInstructionsViewController *)self _airDropText];
  [(SFAirDropInstructionsViewController *)self setTitle:v3];

  v4 = [(SFAirDropInstructionsViewController *)self view];
  v5 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v5];

  [v4 setOpaque:0];
  v6 = objc_alloc_init(SFCollectionViewLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v6;

  [(SFCollectionViewLayout *)self->_collectionViewLayout setFallbackDelegate:self];
  v8 = [SFAirDropActiveIconView alloc];
  double v9 = *MEMORY[0x263F001A8];
  double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
  v13 = -[SFAirDropActiveIconView initWithFrame:grayscale:](v8, "initWithFrame:grayscale:", 0, *MEMORY[0x263F001A8], v10, v11, v12);
  airDropActiveIconView = self->_airDropActiveIconView;
  self->_airDropActiveIconView = v13;

  [(SFAirDropActiveIconView *)self->_airDropActiveIconView setAlpha:1.0];
  v15 = [MEMORY[0x263F825C8] clearColor];
  [(SFAirDropActiveIconView *)self->_airDropActiveIconView setBackgroundColor:v15];

  v16 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initReadonlyAndUnselectableWithFrame:textContainer:", 0, v9, v10, v11, v12);
  instructionsTextView = self->_instructionsTextView;
  self->_instructionsTextView = v16;

  [(UITextView *)self->_instructionsTextView setScrollingEnabled:0];
  v18 = [(UITextView *)self->_instructionsTextView textContainer];
  [v18 setLineFragmentPadding:0.0];

  -[UITextView setTextContainerInset:](self->_instructionsTextView, "setTextContainerInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  v19 = [(UITextView *)self->_instructionsTextView textContainer];
  [v19 setMaximumNumberOfLines:0];

  v20 = [(UITextView *)self->_instructionsTextView textContainer];
  [v20 setLineBreakMode:4];

  [(UITextView *)self->_instructionsTextView setTextAlignment:4];
  v21 = [MEMORY[0x263F825C8] colorWithWhite:0.05 alpha:1.0];
  [(UITextView *)self->_instructionsTextView setTextColor:v21];

  v22 = [MEMORY[0x263F825C8] clearColor];
  [(UITextView *)self->_instructionsTextView setBackgroundColor:v22];

  [(UITextView *)self->_instructionsTextView setAlpha:1.0];
  [(UITextView *)self->_instructionsTextView setTextAlignment:4];
  [v4 addSubview:self->_airDropActiveIconView];
  [v4 addSubview:self->_instructionsTextView];
  [(SFAirDropInstructionsViewController *)self _updateFontSizes];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropInstructionsViewController;
  [(SFAirDropInstructionsViewController *)&v3 viewDidLayoutSubviews];
  [(SFAirDropInstructionsViewController *)self _layoutiOSSubviews];
  [(SFAirDropInstructionsViewController *)self updatePreferredContentSize];
}

- (double)_titleLabelHeight
{
  objc_super v3 = [(SFAirDropInstructionsViewController *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {

LABEL_5:
    uint64_t v12 = *MEMORY[0x263F83590];
    double v10 = [(SFAirDropInstructionsViewController *)self _screen];
    v13 = _SFPersonCollectionViewMaximumSizeCategory(v10);
    double v11 = [(SFAirDropInstructionsViewController *)self _fontWithStyle:v12 maxSizeCategory:v13 traits:0];

    goto LABEL_6;
  }
  v5 = (NSString *)*MEMORY[0x263F83440];
  v6 = [(SFAirDropInstructionsViewController *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8 == NSOrderedAscending) {
    goto LABEL_5;
  }
  double v9 = (void *)MEMORY[0x263F81708];
  double v10 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v10 _scaledValueForValue:11.0];
  double v11 = objc_msgSend(v9, "systemFontOfSize:");
LABEL_6:

  [v11 lineHeight];
  v14 = [(SFAirDropInstructionsViewController *)self view];
  UICeilToViewScale();
  double v16 = v15;

  return v16;
}

- (void)_layoutiOSSubviews
{
  objc_super v3 = [(SFAirDropInstructionsViewController *)self view];
  v4 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v6 = 76.0;
  }
  else {
    double v6 = 60.0;
  }
  v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  CGFloat v9 = dbl_21DBB2230[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  self->_minimumPreferredContentSize.width = 0.0;
  self->_minimumPreferredContentSize.height = v9;
  UIRoundToViewScale();
  double v10 = [(SFAirDropInstructionsViewController *)self traitCollection];
  double v11 = [v10 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);
  NSComparisonResult v13 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v11);
  int v14 = v13 == NSOrderedAscending || IsAccessibilityCategory;
  if (v14 == 1)
  {
    char v15 = v13 != NSOrderedAscending || IsAccessibilityCategory;
    if ((v15 & 1) == 0)
    {
      collectionViewLayout = self->_collectionViewLayout;
      [v3 bounds];
      [(SFCollectionViewLayout *)collectionViewLayout firstItemCenterForContainerWidth:CGRectGetWidth(v44)];
    }
  }
  else
  {
    v17 = self->_collectionViewLayout;
    [v3 bounds];
    [(SFCollectionViewLayout *)v17 firstItemCenterForContainerWidth:CGRectGetWidth(v45)];
  }
  [(SFAirDropInstructionsViewController *)self _titleLabelHeight];
  [v3 safeAreaInsets];
  id v18 = v3;
  char v19 = [v18 _shouldReverseLayoutDirection];
  if (v14)
  {
    v20 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
    [v20 lineHeight];
    UIRoundToViewScale();

    [v18 safeAreaInsets];
  }
  UIRoundToViewScale();
  double v22 = v21;
  if (v19)
  {
    [v18 bounds];
    CGRectGetMaxX(v46);
  }
  [v18 safeAreaInsets];
  UIRoundToViewScale();
  double v24 = v23;

  -[SFAirDropActiveIconView setFrame:](self->_airDropActiveIconView, "setFrame:", v24, v22, v6, v6);
  instructionsTextView = self->_instructionsTextView;
  id v42 = v18;
  v26 = instructionsTextView;
  if ([v42 _shouldReverseLayoutDirection])
  {
    [v42 safeAreaInsets];
    UIRoundToViewScale();
    double v28 = v27;
    v47.origin.x = v24;
    v47.origin.y = v22;
    v47.size.width = v6;
    v47.size.height = v6;
    CGRectGetMinX(v47);
  }
  else
  {
    v48.origin.x = v24;
    v48.origin.y = v22;
    v48.size.width = v6;
    v48.size.height = v6;
    CGRectGetMaxX(v48);
    UIRoundToViewScale();
    double v28 = v29;
    [v42 bounds];
    CGRectGetMaxX(v49);
    [v42 safeAreaInsets];
  }
  UIFloorToViewScale();
  double v31 = v30;
  -[UITextView sizeThatFits:](v26, "sizeThatFits:");

  UICeilToViewScale();
  double v33 = v32;
  double v34 = v24;
  double v35 = v22;
  double v36 = v6;
  double v37 = v6;
  if (v14) {
    CGRectGetMinY(*(CGRect *)&v34);
  }
  else {
    CGRectGetMidY(*(CGRect *)&v34);
  }
  UIRoundToViewScale();
  double v39 = v38;
  [v42 bounds];
  CGRectGetHeight(v50);
  [v42 safeAreaInsets];
  UIFloorToViewScale();
  if (v33 >= v40) {
    double v41 = v40;
  }
  else {
    double v41 = v33;
  }

  -[UITextView setFrame:](self->_instructionsTextView, "setFrame:", v28, v39, v31, v41);
}

- (void)updatePreferredContentSize
{
  p_minimumPreferredContentSize = &self->_minimumPreferredContentSize;
  double width = self->_minimumPreferredContentSize.width;
  double height = self->_minimumPreferredContentSize.height;
  double v6 = [(SFAirDropInstructionsViewController *)self traitCollection];
  lhs = [v6 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory(lhs, (UIContentSizeCategory)*MEMORY[0x263F83450]) != NSOrderedAscending)
  {
    [(SFAirDropInstructionsViewController *)self _cachedPreferredItemSize];
    double v8 = v7;
    [(SFAirDropInstructionsViewController *)self _titleLabelHeight];
    double v10 = v8 + v9 + 20.0;
    if (v10 >= p_minimumPreferredContentSize->height) {
      double height = v10;
    }
    else {
      double height = p_minimumPreferredContentSize->height;
    }
    double width = 0.0;
  }
  -[SFAirDropInstructionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFAirDropInstructionsViewController;
  id v4 = a3;
  [(SFAirDropInstructionsViewController *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(SFAirDropInstructionsViewController *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    [(SFAirDropInstructionsViewController *)self _updateFontSizes];
    double v8 = [(SFAirDropInstructionsViewController *)self view];
    [v8 setNeedsUpdateConstraints];

    double v9 = [(SFAirDropInstructionsViewController *)self view];
    [v9 setNeedsLayout];
  }
}

- (void)_updateFontSizes
{
  id v5 = [(SFAirDropInstructionsViewController *)self title];
  objc_super v3 = [(SFAirDropInstructionsViewController *)self _instructionsText];
  id v4 = [(SFAirDropInstructionsViewController *)self attributedStringWithTitle:v5 content:v3];
  [(UITextView *)self->_instructionsTextView setAttributedText:v4];
}

- (id)_fontWithStyle:(id)a3 maxSizeCategory:(id)a4 traits:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [(SFAirDropInstructionsViewController *)self traitCollection];
  double v11 = [v10 preferredContentSizeCategory];

  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v11, (UIContentSizeCategory)v9) != NSOrderedAscending)
  {
    id v12 = v9;

    double v11 = v12;
  }
  NSComparisonResult v13 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v11];
  if (v5)
  {
    int v14 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:v13];
    char v15 = [v14 fontDescriptorWithSymbolicTraits:v5];

    double v16 = [MEMORY[0x263F81708] fontWithDescriptor:v15 size:0.0];
  }
  else
  {
    double v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:v8 compatibleWithTraitCollection:v13];
  }

  return v16;
}

- (id)attributedStringWithTitle:(id)a3 content:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = NSString;
  id v8 = a4;
  id v9 = [(SFAirDropInstructionsViewController *)self _instructionsBaseFormatString];
  objc_super v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6, v8);

  double v11 = [(SFAirDropInstructionsViewController *)self traitCollection];
  id v12 = [v11 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v12))
  {
  }
  else
  {
    NSComparisonResult v13 = (NSString *)*MEMORY[0x263F83440];
    int v14 = [(SFAirDropInstructionsViewController *)self traitCollection];
    char v15 = [v14 preferredContentSizeCategory];
    NSComparisonResult v16 = UIContentSizeCategoryCompareToCategory(v13, v15);

    if (v16 != NSOrderedAscending)
    {
      v17 = (void *)MEMORY[0x263F81708];
      uint64_t v18 = *MEMORY[0x263F83570];
      char v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v19 _scaledValueForValue:11.0];
      v20 = objc_msgSend(v17, "boldSystemFontOfSize:");

      double v21 = (void *)MEMORY[0x263F81708];
      double v22 = [MEMORY[0x263F81708] preferredFontForTextStyle:v18];
      [v22 _scaledValueForValue:11.0];
      double v23 = objc_msgSend(v21, "systemFontOfSize:");
      goto LABEL_6;
    }
  }
  uint64_t v24 = *MEMORY[0x263F83590];
  v25 = [(SFAirDropInstructionsViewController *)self _screen];
  v26 = _SFPersonCollectionViewMaximumSizeCategory(v25);
  v20 = [(SFAirDropInstructionsViewController *)self _fontWithStyle:v24 maxSizeCategory:v26 traits:2];

  double v22 = [(SFAirDropInstructionsViewController *)self _screen];
  double v27 = _SFPersonCollectionViewMaximumSizeCategory(v22);
  double v23 = [(SFAirDropInstructionsViewController *)self _fontWithStyle:v24 maxSizeCategory:v27 traits:0];

LABEL_6:
  uint64_t v28 = [v10 rangeOfString:v6];
  uint64_t v30 = v29;
  uint64_t v38 = *MEMORY[0x263F814F0];
  uint64_t v31 = v38;
  v39[0] = v20;
  double v32 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v36 = v31;
  double v37 = v23;
  double v33 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  double v34 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v10 attributes:v33];
  objc_msgSend(v34, "setAttributes:range:", v32, v28, v30);

  return v34;
}

- (CGSize)_cachedPreferredItemSize
{
  objc_super v3 = [(SFAirDropInstructionsViewController *)self view];
  [v3 bounds];
  double Width = CGRectGetWidth(v14);
  uint64_t v5 = [(SFAirDropInstructionsViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  +[SFPersonCollectionViewCell _cachedPreferredItemSizeForViewWidth:v6 sizeCategory:Width];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UITextView)instructionsTextView
{
  return self->_instructionsTextView;
}

- (SFAirDropActiveIconView)airDropActiveIconView
{
  return self->_airDropActiveIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airDropActiveIconView, 0);
  objc_storeStrong((id *)&self->_instructionsTextView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end