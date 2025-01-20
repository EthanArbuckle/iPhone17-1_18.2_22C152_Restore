@interface SearchUICompletionStringView
+ (BOOL)supportsImages;
- (BOOL)completionResultIsPotentiallyPunchout;
- (BOOL)focusIsOnFirstResult;
- (BOOL)hasContent;
- (BOOL)hasPrefix;
- (NSString)completionText;
- (NSString)copyableString;
- (SFCardSection)cardSection;
- (SFSearchResult)result;
- (SearchUICompletion)completion;
- (SearchUICompletionStringModel)searchFieldModel;
- (SearchUICompletionStringView)init;
- (SearchUIImageView)imageView;
- (SearchUIMaskedLabelsStackView)labelsStackView;
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
- (void)updateLabelStackVisibility;
- (void)updateWithResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5;
@end

@implementation SearchUICompletionStringView

- (SearchUICompletionStringView)init
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SearchUICompletionStringView;
  v2 = [(SearchUICompletionStringView *)&v20 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SearchUICompletionStringView *)v2 setLabelsStackView:v3];

    v4 = [(SearchUICompletionStringView *)v2 labelsStackView];
    [v4 setHidden:1];

    v5 = [(SearchUICompletionStringView *)v2 completionLabel];
    [v5 setAlpha:0.0];

    v6 = [(SearchUICompletionStringView *)v2 labelsStackView];
    LODWORD(v7) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v7];

    [(NUIContainerStackView *)v2 setAlignment:3];
    [(NUIContainerStackView *)v2 setSpacing:11.0];
    v8 = [(SearchUICompletionStringView *)v2 labelsStackView];
    v21[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    if ([(id)objc_opt_class() supportsImages])
    {
      v10 = objc_opt_new();
      [(SearchUICompletionStringView *)v2 setImageView:v10];

      v11 = [(SearchUICompletionStringView *)v2 imageView];
      [v11 setDelegate:v2];

      v12 = [(SearchUICompletionStringView *)v2 imageView];
      +[SearchUIAutoLayout requireIntrinsicSizeForView:v12];

      v13 = [(SearchUICompletionStringView *)v2 imageView];
      uint64_t v14 = [v9 arrayByAddingObject:v13];

      v15 = [(SearchUICompletionStringView *)v2 imageView];
      LODWORD(v16) = 1148846080;
      objc_msgSend(v15, "setLayoutSize:withContentPriority:", 32.0, 32.0, v16);

      v17 = [(SearchUICompletionStringView *)v2 imageView];
      objc_msgSend(v17, "setCustomAlignmentRectInsets:", 1.0, 1.0, 3.0, 1.0);

      v9 = (void *)v14;
    }
    [(SearchUICompletionStringView *)v2 setArrangedSubviews:v9];
    [(SearchUICompletionStringView *)v2 setUserInteractionEnabled:0];
    v18 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(SearchUICompletionStringView *)v2 setSelectionHighlightColor:v18];
  }
  return v2;
}

+ (BOOL)supportsImages
{
  if (+[SearchUIUtilities isIpad]) {
    return 1;
  }
  return +[SearchUIUtilities isLargeIpad];
}

- (id)extensionLabel
{
  v2 = [(SearchUICompletionStringView *)self labelsStackView];
  v3 = [v2 extensionLabel];

  return v3;
}

- (id)bridgeLabel
{
  v2 = [(SearchUICompletionStringView *)self labelsStackView];
  v3 = [v2 bridgeLabel];

  return v3;
}

- (id)completionLabel
{
  v2 = [(SearchUICompletionStringView *)self labelsStackView];
  v3 = [v2 completionLabel];

  return v3;
}

- (void)setTextColorForCompletionLabel:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUICompletionStringView *)self completionLabel];
  [v5 setTextColor:v4];

  [(SearchUICompletionStringView *)self updateFields];
}

- (UIColor)textColorForCompletionLabel
{
  v2 = [(SearchUICompletionStringView *)self completionLabel];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setFontForCompletionLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICompletionStringView *)self labelsStackView];
  [v5 setFont:v4];
}

- (UIFont)fontForCompletionLabel
{
  v2 = [(SearchUICompletionStringView *)self completionLabel];
  v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setSearchFieldModel:(id)a3
{
  id v5 = (SearchUICompletionStringModel *)a3;
  p_searchFieldModel = &self->_searchFieldModel;
  if (self->_searchFieldModel != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_searchFieldModel, a3);
    p_searchFieldModel = (SearchUICompletionStringModel **)[(SearchUICompletionStringView *)self updateFields];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_searchFieldModel, v5);
}

- (void)setSelectionHighlightColor:(id)a3
{
  p_selectionHighlightColor = (UIColor **)a3;
  v6 = (UIColor *)p_selectionHighlightColor;
  if (p_selectionHighlightColor)
  {
    p_selectionHighlightColor = &self->_selectionHighlightColor;
    if (self->_selectionHighlightColor != v6)
    {
      double v7 = v6;
      objc_storeStrong((id *)p_selectionHighlightColor, a3);
      p_selectionHighlightColor = (UIColor **)[(SearchUICompletionStringView *)self updateFields];
      v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](p_selectionHighlightColor, v6);
}

- (void)updateWithResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(SearchUICompletionStringView *)self result];
  if (v9 != v11 || [(SearchUICompletionStringView *)self focusIsOnFirstResult] != v5)
  {

LABEL_4:
    [(SearchUICompletionStringView *)self setResult:v11];
    [(SearchUICompletionStringView *)self setCardSection:v8];
    [(SearchUICompletionStringView *)self setFocusIsOnFirstResult:v5];
    [(SearchUICompletionStringView *)self updateFields];
    goto LABEL_5;
  }
  id v10 = [(SearchUICompletionStringView *)self cardSection];

  if (v10 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)updateFields
{
  v3 = [(SearchUICompletionStringView *)self searchFieldModel];
  if (([v3 searchFieldHasTokens] & 1) != 0
    || ([(SearchUICompletionStringView *)self result], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_7;
  }
  BOOL v5 = (void *)v4;
  v6 = [(SearchUICompletionStringView *)self searchFieldModel];
  char v7 = [v6 hasMarkedText];

  if (v7)
  {
LABEL_7:
    v18 = [(SearchUICompletionStringView *)self labelsStackView];
    [v18 setHidden:1];

    v19 = [(SearchUICompletionStringView *)self imageView];
    [v19 setHidden:1];

    objc_super v20 = [(SearchUICompletionStringView *)self extensionLabel];
    [v20 setText:0];

    v21 = [(SearchUICompletionStringView *)self completionLabel];
    [v21 setText:0];

    v22 = [(SearchUICompletionStringView *)self imageView];
    [v22 updateWithImage:0];

    id v23 = 0;
    goto LABEL_8;
  }
  id v8 = [(SearchUICompletionStringView *)self extensionLabel];
  [v8 setAttributedText:0];

  id v9 = [(SearchUICompletionStringView *)self labelsStackView];
  id v10 = [(SearchUICompletionStringView *)self searchFieldModel];
  id v11 = [v10 displayedText];
  [v9 setTypedString:v11];

  v12 = [(SearchUICompletionStringView *)self searchFieldModel];
  v13 = [v12 displayedText];
  uint64_t v14 = [(SearchUICompletionStringView *)self result];
  v15 = [(SearchUICompletionStringView *)self cardSection];
  id v48 = +[SearchUICompletion initWithTypedString:v13 result:v14 cardSection:v15];

  double v16 = [v48 completionString];
  if (v16)
  {
    BOOL v17 = 0;
  }
  else
  {
    v25 = [v48 extensionString];
    BOOL v17 = v25 != 0;
  }
  v26 = [v48 completionString];
  v27 = [(SearchUICompletionStringView *)self completionLabel];
  [v27 setAttributedText:v26];

  if (v17)
  {
    v28 = [(SearchUICompletionStringView *)self searchFieldModel];
    v29 = [v28 displayedText];
    v30 = [(SearchUICompletionStringView *)self completionLabel];
    [v30 setText:v29];
  }
  v31 = [v48 completionString];
  if ([v31 length]) {
    unsigned int v32 = 1;
  }
  else {
    unsigned int v32 = v17;
  }
  double v33 = (double)v32;
  v34 = [(SearchUICompletionStringView *)self completionLabel];
  [v34 setAlpha:v33];

  v35 = [v48 completionString];
  if ([v35 length]) {
    int v36 = 1;
  }
  else {
    int v36 = v17;
  }

  if (v36 == 1)
  {
    v37 = [v48 extensionString];
    v38 = [(SearchUICompletionStringView *)self extensionLabel];
    [v38 setText:v37];

    v39 = [v48 bridgeString];
    v40 = [(SearchUICompletionStringView *)self bridgeLabel];
    [v40 setText:v39];
  }
  else
  {
    v41 = [(SearchUICompletionStringView *)self extensionLabel];
    [v41 setText:0];

    v39 = [(SearchUICompletionStringView *)self bridgeLabel];
    [v39 setText:0];
  }

  v42 = [(SearchUICompletionStringView *)self extensionLabel];
  [v42 setHidden:v36 ^ 1u];

  v43 = [(SearchUICompletionStringView *)self bridgeLabel];
  [v43 setHidden:v36 ^ 1u];

  if ([(id)objc_opt_class() supportsImages])
  {
    v44 = [v48 image];
    v45 = +[SearchUIImage imageWithSFImage:v44 variantForAppIcon:2];

    v46 = [(SearchUICompletionStringView *)self imageView];
    v47 = v46;
    if (v45)
    {
      [v46 updateWithImage:v45];
    }
    else
    {
      [v46 updateWithImage:0];

      v47 = [(SearchUICompletionStringView *)self imageView];
      [v47 setHidden:1];
    }
  }
  [(SearchUICompletionStringView *)self updateLabelStackVisibility];
  id v23 = v48;
LABEL_8:
  id v49 = v23;
  [(SearchUICompletionStringView *)self setCompletion:v23];
  v24 = [(SearchUICompletionStringView *)self superview];
  [v24 setNeedsLayout];
}

- (void)didUpdateWithImage:(id)a3
{
  uint64_t v4 = [(SearchUICompletionStringView *)self imageView];
  [v4 setHidden:0];

  [(SearchUICompletionStringView *)self updateLabelStackVisibility];
}

- (void)didFailToLoadImage
{
  v3 = [(SearchUICompletionStringView *)self imageView];
  [v3 setHidden:1];

  [(SearchUICompletionStringView *)self updateLabelStackVisibility];
}

- (NSString)copyableString
{
  v2 = [(SearchUICompletionStringView *)self completion];
  v3 = [v2 copyableString];

  return (NSString *)v3;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  v2 = [(SearchUICompletionStringView *)self completion];
  char v3 = [v2 completionResultIsPotentiallyPunchout];

  return v3;
}

- (void)updateLabelStackVisibility
{
  char v3 = [(SearchUICompletionStringView *)self imageView];
  if (v3)
  {
    uint64_t v4 = [(SearchUICompletionStringView *)self imageView];
    BOOL v5 = [v4 currentImage];
    if (v5)
    {
      v6 = [(SearchUICompletionStringView *)self imageView];
      int v7 = [v6 isHidden];
    }
    else
    {
      int v7 = 1;
    }
  }
  else
  {
    int v7 = 1;
  }

  id v12 = [(SearchUICompletionStringView *)self completionLabel];
  [v12 alpha];
  double v9 = v8;
  if (v8 == 0.0)
  {
    char v3 = [(SearchUICompletionStringView *)self extensionLabel];
    uint64_t v10 = [v3 isHidden] & v7;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [(SearchUICompletionStringView *)self labelsStackView];
  [v11 setHidden:v10];

  if (v9 == 0.0) {
}
  }

- (BOOL)hasContent
{
  BOOL v4 = [(SearchUICompletionStringView *)self hasPrefix];
  if (!v4)
  {
    v2 = [(SearchUICompletionStringView *)self extensionLabel];
    if ([v2 isHidden])
    {
      LOBYTE(v5) = 0;
LABEL_5:

      return v5;
    }
  }
  v6 = [(SearchUICompletionStringView *)self labelsStackView];
  int v5 = [v6 isHidden] ^ 1;

  if (!v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)hasPrefix
{
  char v3 = [(SearchUICompletionStringView *)self completionLabel];
  [v3 alpha];
  if (v4 == 0.0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v5 = [(SearchUICompletionStringView *)self labelsStackView];
    int v6 = [v5 isHidden] ^ 1;
  }
  return v6;
}

- (NSString)completionText
{
  if ([(SearchUICompletionStringView *)self hasPrefix])
  {
    char v3 = [(SearchUICompletionStringView *)self completionLabel];
    double v4 = [v3 text];
  }
  else
  {
    double v4 = 0;
  }
  return (NSString *)v4;
}

- (double)trailingPaddingForFieldEditor
{
  char v3 = [(SearchUICompletionStringView *)self imageView];
  double v4 = [v3 currentImage];

  if (!v4) {
    return 0.0;
  }
  [(NUIContainerStackView *)self spacing];
  double v6 = v5;
  int v7 = [(SearchUICompletionStringView *)self imageView];
  double v8 = [v7 currentImage];
  [v8 size];
  double v10 = v6 + v9;

  return v10;
}

- (SearchUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (BOOL)focusIsOnFirstResult
{
  return self->_focusIsOnFirstResult;
}

- (void)setFocusIsOnFirstResult:(BOOL)a3
{
  self->_focusIsOnFirstResult = a3;
}

- (SFSearchResult)result
{
  return (SFSearchResult *)objc_getProperty(self, a2, 728, 1);
}

- (void)setResult:(id)a3
{
}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 736, 1);
}

- (void)setImageView:(id)a3
{
}

- (SearchUIMaskedLabelsStackView)labelsStackView
{
  return (SearchUIMaskedLabelsStackView *)objc_getProperty(self, a2, 744, 1);
}

- (void)setLabelsStackView:(id)a3
{
}

- (SFCardSection)cardSection
{
  return (SFCardSection *)objc_getProperty(self, a2, 752, 1);
}

- (void)setCardSection:(id)a3
{
}

- (SearchUICompletion)completion
{
  return (SearchUICompletion *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCompletion:(id)a3
{
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