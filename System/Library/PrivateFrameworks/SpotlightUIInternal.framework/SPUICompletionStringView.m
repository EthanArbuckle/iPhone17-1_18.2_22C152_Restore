@interface SPUICompletionStringView
- (BOOL)completionResultIsPotentiallyPunchout;
- (BOOL)focusIsOnFirstResult;
- (BOOL)hasContent;
- (BOOL)hasPrefix;
- (NSString)completionText;
- (NSString)copyableString;
- (SFCardSection)cardSection;
- (SFSearchResult)result;
- (SPUICompletionStringModel)searchFieldModel;
- (SPUICompletionStringView)init;
- (SPUIMaskedLabelsStackView)labelsStackView;
- (SearchUICompletion)completion;
- (SearchUIImageView)imageView;
- (UIColor)selectionHighlightColor;
- (UIColor)textColorForCompletionLabel;
- (UIFont)fontForCompletionLabel;
- (double)trailingPaddingForFieldEditor;
- (id)bridgeLabel;
- (id)completionLabel;
- (id)extensionLabel;
- (void)didFailToLoadImage;
- (void)didUpdateWithImage:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setFocusIsOnFirstResult:(BOOL)a3;
- (void)setFontForCompletionLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabelsStackView:(id)a3;
- (void)setResult:(id)a3;
- (void)setSearchFieldModel:(id)a3;
- (void)setSelectionHighlightColor:(id)a3;
- (void)setTextColorForCompletionLabel:(id)a3;
- (void)updateFields;
- (void)updateLayoutMargins;
- (void)updateWithResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5;
@end

@implementation SPUICompletionStringView

- (void)setTextColorForCompletionLabel:(id)a3
{
  id v4 = a3;
  v5 = [(SPUICompletionStringView *)self completionLabel];
  [v5 setTextColor:v4];

  [(SPUICompletionStringView *)self updateFields];
}

- (void)updateWithResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(SPUICompletionStringView *)self result];
  if (v9 != v11 || [(SPUICompletionStringView *)self focusIsOnFirstResult] != v5)
  {

LABEL_4:
    [(SPUICompletionStringView *)self setResult:v11];
    [(SPUICompletionStringView *)self setCardSection:v8];
    [(SPUICompletionStringView *)self setFocusIsOnFirstResult:v5];
    [(SPUICompletionStringView *)self updateFields];
    goto LABEL_5;
  }
  id v10 = [(SPUICompletionStringView *)self cardSection];

  if (v10 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (BOOL)focusIsOnFirstResult
{
  return self->_focusIsOnFirstResult;
}

- (BOOL)hasContent
{
  BOOL v4 = [(SPUICompletionStringView *)self hasPrefix];
  if (!v4)
  {
    v2 = [(SPUICompletionStringView *)self extensionLabel];
    if ([v2 isHidden])
    {
      LOBYTE(v5) = 0;
LABEL_5:

      return v5;
    }
  }
  v6 = [(SPUICompletionStringView *)self labelsStackView];
  int v5 = [v6 isHidden] ^ 1;

  if (!v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)hasPrefix
{
  v3 = [(SPUICompletionStringView *)self completionLabel];
  [v3 alpha];
  if (v4 == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v5 = [(SPUICompletionStringView *)self labelsStackView];
    int v6 = [v5 isHidden] ^ 1;
  }
  return v6;
}

- (id)completionLabel
{
  v2 = [(SPUICompletionStringView *)self labelsStackView];
  v3 = [v2 completionLabel];

  return v3;
}

- (SPUIMaskedLabelsStackView)labelsStackView
{
  return (SPUIMaskedLabelsStackView *)objc_getProperty(self, a2, 744, 1);
}

- (id)extensionLabel
{
  v2 = [(SPUICompletionStringView *)self labelsStackView];
  v3 = [v2 extensionLabel];

  return v3;
}

- (void)updateFields
{
  v3 = [(SPUICompletionStringView *)self searchFieldModel];
  if (([v3 searchFieldHasTokens] & 1) != 0
    || ([(SPUICompletionStringView *)self result], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  int v5 = (void *)v4;
  int v6 = [(SPUICompletionStringView *)self searchFieldModel];
  char v7 = [v6 hasMarkedText];

  if (v7)
  {
LABEL_7:
    v19 = [(SPUICompletionStringView *)self labelsStackView];
    [v19 setHidden:1];

    v20 = [(SPUICompletionStringView *)self imageView];
    [v20 setHidden:1];

    v21 = [(SPUICompletionStringView *)self imageView];
    [v21 updateWithImage:0];

    id v22 = 0;
    goto LABEL_8;
  }
  id v8 = [(SPUICompletionStringView *)self extensionLabel];
  [v8 setAttributedText:0];

  id v9 = [(SPUICompletionStringView *)self labelsStackView];
  id v10 = [(SPUICompletionStringView *)self searchFieldModel];
  id v11 = [v10 displayedText];
  [v9 setTypedString:v11];

  v12 = (void *)MEMORY[0x263F67C40];
  v13 = [(SPUICompletionStringView *)self searchFieldModel];
  v14 = [v13 displayedText];
  v15 = [(SPUICompletionStringView *)self result];
  v16 = [(SPUICompletionStringView *)self cardSection];
  id v49 = [v12 initWithTypedString:v14 result:v15 cardSection:v16];

  v17 = [v49 completionString];
  if (v17)
  {
    BOOL v18 = 0;
  }
  else
  {
    v24 = [v49 extensionString];
    if (v24)
    {
      v25 = [(SPUICompletionStringView *)self searchFieldModel];
      uint64_t v26 = [v25 queryId];
      v27 = [(SPUICompletionStringView *)self result];
      BOOL v18 = v26 == [v27 queryId];
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  v28 = [v49 completionString];
  v29 = [(SPUICompletionStringView *)self completionLabel];
  [v29 setAttributedText:v28];

  if (v18)
  {
    v30 = [(SPUICompletionStringView *)self searchFieldModel];
    v31 = [v30 displayedText];
    v32 = [(SPUICompletionStringView *)self completionLabel];
    [v32 setText:v31];
  }
  v33 = [v49 completionString];
  if (v33) {
    double v34 = 1.0;
  }
  else {
    double v34 = 0.0;
  }
  v35 = [(SPUICompletionStringView *)self completionLabel];
  [v35 setAlpha:v34];

  v36 = [v49 completionString];
  if (v36) {
    int v37 = 1;
  }
  else {
    int v37 = v18;
  }

  if (v37 == 1)
  {
    v38 = [v49 extensionString];
    v39 = [(SPUICompletionStringView *)self extensionLabel];
    [v39 setText:v38];

    v40 = [v49 bridgeString];
    v41 = [(SPUICompletionStringView *)self bridgeLabel];
    [v41 setText:v40];
  }
  v42 = [(SPUICompletionStringView *)self extensionLabel];
  [v42 setHidden:v37 ^ 1u];

  v43 = [(SPUICompletionStringView *)self bridgeLabel];
  [v43 setHidden:v37 ^ 1u];

  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    v44 = (void *)MEMORY[0x263F67C48];
    v45 = [v49 image];
    v46 = [v44 imageWithSFImage:v45 variantForAppIcon:2];

    v47 = [(SPUICompletionStringView *)self imageView];
    v48 = v47;
    if (v46) {
      [v47 updateWithImage:v46];
    }
    else {
      [v47 setHidden:1];
    }
  }
  [(SPUICompletionStringView *)self updateLayoutMargins];
  id v22 = v49;
LABEL_8:
  id v50 = v22;
  [(SPUICompletionStringView *)self setCompletion:v22];
  v23 = [(SPUICompletionStringView *)self superview];
  [v23 setNeedsLayout];
}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 736, 1);
}

- (SFSearchResult)result
{
  return (SFSearchResult *)objc_getProperty(self, a2, 728, 1);
}

- (void)setCompletion:(id)a3
{
}

- (SPUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (void)setResult:(id)a3
{
}

- (void)setFocusIsOnFirstResult:(BOOL)a3
{
  self->_focusIsOnFirstResult = a3;
}

- (void)setCardSection:(id)a3
{
}

- (void)setFontForCompletionLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUICompletionStringView *)self labelsStackView];
  [v5 setFont:v4];
}

- (SPUICompletionStringView)init
{
  v21[1] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)SPUICompletionStringView;
  v2 = [(SPUICompletionStringView *)&v20 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SPUICompletionStringView *)v2 setLabelsStackView:v3];

    id v4 = [(SPUICompletionStringView *)v2 labelsStackView];
    [v4 setHidden:1];

    id v5 = [(SPUICompletionStringView *)v2 completionLabel];
    [v5 setAlpha:0.0];

    int v6 = [(SPUICompletionStringView *)v2 labelsStackView];
    LODWORD(v7) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v7];

    [(SPUICompletionStringView *)v2 setUserInteractionEnabled:0];
    [(SPUICompletionStringView *)v2 setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerStackView *)v2 setAlignment:3];
    [(NUIContainerStackView *)v2 setSpacing:0.0];
    id v8 = [(SPUICompletionStringView *)v2 labelsStackView];
    v21[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];

    if ([MEMORY[0x263F79140] enableFloatingWindow])
    {
      id v10 = objc_opt_new();
      [(SPUICompletionStringView *)v2 setImageView:v10];

      id v11 = [(SPUICompletionStringView *)v2 imageView];
      [v11 setDelegate:v2];

      v12 = (void *)MEMORY[0x263F67C10];
      v13 = [(SPUICompletionStringView *)v2 imageView];
      [v12 requireIntrinsicSizeForView:v13];

      v14 = [(SPUICompletionStringView *)v2 imageView];
      uint64_t v15 = [v9 arrayByAddingObject:v14];

      v16 = [(SPUICompletionStringView *)v2 imageView];
      objc_msgSend(v16, "setMaximumLayoutSize:", 33.0, 33.0);

      v17 = [(SPUICompletionStringView *)v2 imageView];
      objc_msgSend(v17, "setMinimumLayoutSize:", 33.0, 33.0);

      id v9 = (void *)v15;
    }
    [(SPUICompletionStringView *)v2 setArrangedSubviews:v9];
    BOOL v18 = [MEMORY[0x263F825C8] systemFillColor];
    [(SPUICompletionStringView *)v2 setSelectionHighlightColor:v18];
  }
  return v2;
}

- (void)setSelectionHighlightColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (v5 && self->_selectionHighlightColor != v5)
  {
    objc_storeStrong((id *)&self->_selectionHighlightColor, a3);
    [(SPUICompletionStringView *)self updateFields];
  }
  MEMORY[0x270F9A758]();
}

- (void)setLabelsStackView:(id)a3
{
}

- (id)bridgeLabel
{
  v2 = [(SPUICompletionStringView *)self labelsStackView];
  v3 = [v2 bridgeLabel];

  return v3;
}

- (UIColor)textColorForCompletionLabel
{
  v2 = [(SPUICompletionStringView *)self completionLabel];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (UIFont)fontForCompletionLabel
{
  v2 = [(SPUICompletionStringView *)self completionLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setSearchFieldModel:(id)a3
{
  id v5 = (SPUICompletionStringModel *)a3;
  p_searchFieldModel = &self->_searchFieldModel;
  if (self->_searchFieldModel != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_searchFieldModel, a3);
    p_searchFieldModel = (SPUICompletionStringModel **)[(SPUICompletionStringView *)self updateFields];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_searchFieldModel, v5);
}

- (void)didUpdateWithImage:(id)a3
{
  id v4 = [(SPUICompletionStringView *)self imageView];
  [v4 setHidden:0];

  [(SPUICompletionStringView *)self updateLayoutMargins];
}

- (void)didFailToLoadImage
{
  v3 = [(SPUICompletionStringView *)self imageView];
  [v3 setHidden:1];

  [(SPUICompletionStringView *)self updateLayoutMargins];
}

- (NSString)copyableString
{
  v2 = [(SPUICompletionStringView *)self completion];
  v3 = [v2 copyableString];

  return (NSString *)v3;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  v2 = [(SPUICompletionStringView *)self completion];
  char v3 = [v2 completionResultIsPotentiallyPunchout];

  return v3;
}

- (void)updateLayoutMargins
{
  id v4 = [(SPUICompletionStringView *)self imageView];
  if (v4)
  {
    v2 = [(SPUICompletionStringView *)self imageView];
    id v5 = [v2 currentImage];
    if (v5)
    {
      int v6 = [(SPUICompletionStringView *)self imageView];
      int v7 = [v6 isHidden] ^ 1;
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  id v8 = [(SPUICompletionStringView *)self completionLabel];
  [v8 alpha];
  double v10 = v9;
  if (v9 == 0.0)
  {
    v2 = [(SPUICompletionStringView *)self extensionLabel];
    uint64_t v11 = [v2 isHidden] & (v7 ^ 1);
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [(SPUICompletionStringView *)self labelsStackView];
  [v12 setHidden:v11];

  if (v10 == 0.0) {
  if (v7)
  }
    double v13 = 8.0;
  else {
    double v13 = 0.0;
  }
  -[SPUICompletionStringView setLayoutMargins:](self, "setLayoutMargins:", 0.0, 0.0, 0.0, v13);
}

- (NSString)completionText
{
  if ([(SPUICompletionStringView *)self hasPrefix])
  {
    char v3 = [(SPUICompletionStringView *)self completionLabel];
    id v4 = [v3 text];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (double)trailingPaddingForFieldEditor
{
  char v3 = [(SPUICompletionStringView *)self imageView];
  id v4 = [v3 currentImage];

  if (!v4) {
    return 0.0;
  }
  [(NUIContainerStackView *)self spacing];
  double v6 = v5;
  int v7 = [(SPUICompletionStringView *)self imageView];
  id v8 = [v7 currentImage];
  [v8 size];
  double v10 = v6 + v9;

  return v10;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (void)setImageView:(id)a3
{
}

- (SFCardSection)cardSection
{
  return (SFCardSection *)objc_getProperty(self, a2, 752, 1);
}

- (SearchUICompletion)completion
{
  return (SearchUICompletion *)objc_getProperty(self, a2, 760, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_searchFieldModel, 0);
}

@end