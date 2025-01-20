@interface TFLinkableHeaderFooterView
+ (CGSize)itemSizeWithText:(id)a3 isHeader:(BOOL)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6;
+ (NSString)reuseIdentifier;
+ (double)_heightForTextViewWithText:(id)a3 font:(id)a4 isHeader:(BOOL)a5 fittingWidth:(double)a6 inTraitEnvironment:(id)a7;
- (BOOL)isHeader;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TFLinkableHeaderFooterView)init;
- (TFLinkableHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (UITextView)textView;
- (void)_prepareForDisplayWithTraitCollection:(id)a3;
- (void)_updateTextViewWithLinkMap:(id)a3;
- (void)applyText:(id)a3 withTextLinkMap:(id)a4 isHeader:(BOOL)a5;
- (void)layoutSubviews;
- (void)setIsHeader:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TFLinkableHeaderFooterView

- (TFLinkableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)TFLinkableHeaderFooterView;
  v3 = [(TFLinkableHeaderFooterView *)&v19 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CAC8]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = v3->_textView;
    v3->_textView = (UITextView *)v5;

    [(UITextView *)v3->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = v3->_textView;
    v8 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v7 setBackgroundColor:v8];

    [(UITextView *)v3->_textView setEditable:0];
    [(UITextView *)v3->_textView setSelectable:1];
    [(UITextView *)v3->_textView setScrollEnabled:0];
    -[UITextView setTextContainerInset:](v3->_textView, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    v9 = [(UITextView *)v3->_textView textContainer];
    [v9 setLineFragmentPadding:0.0];

    [(UITextView *)v3->_textView setInsetsLayoutMarginsFromSafeArea:0];
    v10 = [(UITextView *)v3->_textView textContainer];
    [v10 setLineBreakMode:0];

    v11 = v3->_textView;
    v12 = +[TFLinkableHeaderFooterViewSpecification textViewFontColor];
    [(UITextView *)v11 setTextColor:v12];

    v13 = v3->_textView;
    v14 = [(TFLinkableHeaderFooterView *)v3 traitCollection];
    v15 = +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:v14];
    [(UITextView *)v13 setFont:v15];

    [(UITextView *)v3->_textView _setInteractiveTextSelectionDisabled:1];
    v16 = [(UITextView *)v3->_textView textDragInteraction];
    [v16 setEnabled:0];

    v17 = [(TFLinkableHeaderFooterView *)v3 contentView];
    [v17 addSubview:v3->_textView];
  }
  return v3;
}

- (TFLinkableHeaderFooterView)init
{
  return [(TFLinkableHeaderFooterView *)self initWithReuseIdentifier:@"TFLinkableHeaderFooterView"];
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)TFLinkableHeaderFooterView;
  [(TFLinkableHeaderFooterView *)&v34 layoutSubviews];
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:self];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TFLinkableHeaderFooterView *)self contentView];
  [v11 bounds];
  CGFloat v13 = v6 + v12;
  CGFloat v15 = v4 + v14;
  CGFloat v17 = v16 - (v6 + v10);
  CGFloat v19 = v18 - (v4 + v8);

  v20 = [(TFLinkableHeaderFooterView *)self textView];
  v21 = [v20 font];
  +[TFLinkableHeaderFooterViewSpecification topPaddingFromFirstBaselineForShowingHeader:[(TFLinkableHeaderFooterView *)self isHeader]];
  objc_msgSend(v21, "_scaledValueForValue:");
  double v23 = v22;

  v24 = [(TFLinkableHeaderFooterView *)self textView];
  objc_msgSend(v24, "tf_estimatedFirstBaseline");
  double v26 = v25;

  v35.origin.x = v13;
  v35.origin.y = v15;
  v35.size.width = v17;
  v35.size.height = v19;
  double v27 = v23 - v26 + CGRectGetMinY(v35);
  v28 = [(TFLinkableHeaderFooterView *)self textView];
  objc_msgSend(v28, "sizeThatFits:", v17, v19);
  double v30 = v29;

  v36.origin.x = v13;
  v36.origin.y = v15;
  v36.size.width = v17;
  v36.size.height = v19;
  double MinX = CGRectGetMinX(v36);
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  double Width = CGRectGetWidth(v37);
  v33 = [(TFLinkableHeaderFooterView *)self textView];
  objc_msgSend(v33, "setFrame:", MinX, v27, Width, v30);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(TFLinkableHeaderFooterView *)self textView];
  double v7 = [v6 text];
  +[TFLinkableHeaderFooterView itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:](TFLinkableHeaderFooterView, "itemSizeWithText:isHeader:fittingSize:inTraitEnvironment:", v7, [(TFLinkableHeaderFooterView *)self isHeader], self, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFLinkableHeaderFooterView;
  [(TFLinkableHeaderFooterView *)&v5 traitCollectionDidChange:a3];
  double v4 = [(TFLinkableHeaderFooterView *)self traitCollection];
  [(TFLinkableHeaderFooterView *)self _prepareForDisplayWithTraitCollection:v4];

  [(TFLinkableHeaderFooterView *)self setNeedsLayout];
}

- (void)applyText:(id)a3 withTextLinkMap:(id)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(TFLinkableHeaderFooterView *)self textView];
  [v10 setText:v9];

  [(TFLinkableHeaderFooterView *)self _updateTextViewWithLinkMap:v8];
  [(TFLinkableHeaderFooterView *)self setIsHeader:v5];

  [(TFLinkableHeaderFooterView *)self setNeedsLayout];
}

+ (CGSize)itemSizeWithText:(id)a3 isHeader:(BOOL)a4 fittingSize:(CGSize)a5 inTraitEnvironment:(id)a6
{
  double width = a5.width;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  +[TFFeedbackFormViewSpecification formCellInsetsInTraitEnvironment:v10];
  double v14 = width - v12 - v13;
  CGFloat v15 = [v10 traitCollection];
  double v16 = +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:v15];

  [a1 _heightForTextViewWithText:v11 font:v16 isHeader:v7 fittingWidth:v10 inTraitEnvironment:v14];
  double v18 = v17;

  +[TFLinkableHeaderFooterViewSpecification topPaddingFromFirstBaselineForShowingHeader:v7];
  objc_msgSend(v16, "_scaledValueForValue:");
  double v20 = v19;
  +[TFLinkableHeaderFooterViewSpecification bottomPaddingForShowingHeader:v7];
  objc_msgSend(v16, "_scaledValueForValue:");
  double v22 = v21;
  objc_msgSend(v16, "tf_estimatedFirstBaseline");
  double v24 = v22 + v18 + v20 - v23;

  double v25 = width;
  double v26 = v24;
  result.double height = v26;
  result.double width = v25;
  return result;
}

+ (double)_heightForTextViewWithText:(id)a3 font:(id)a4 isHeader:(BOOL)a5 fittingWidth:(double)a6 inTraitEnvironment:(id)a7
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = *MEMORY[0x263F1C238];
  v23[0] = a4;
  id v9 = NSDictionary;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v9 dictionaryWithObjects:v23 forKeys:&v22 count:1];

  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 3, v12, 0, a6, 1.79769313e308);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v24.origin.x = v14;
  v24.origin.y = v16;
  v24.size.double width = v18;
  v24.size.double height = v20;
  return CGRectGetHeight(v24);
}

- (void)_updateTextViewWithLinkMap:(id)a3
{
  v34[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(TFLinkableHeaderFooterView *)self textView];
    double v6 = [v5 text];

    if (v6)
    {
      v33[0] = *MEMORY[0x263F1C238];
      BOOL v7 = [(TFLinkableHeaderFooterView *)self textView];
      id v8 = [v7 font];
      v34[0] = v8;
      v33[1] = *MEMORY[0x263F1C240];
      id v9 = [(TFLinkableHeaderFooterView *)self textView];
      id v10 = [v9 textColor];
      v34[1] = v10;
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

      id v12 = objc_alloc(MEMORY[0x263F089B8]);
      double v13 = [(TFLinkableHeaderFooterView *)self textView];
      CGFloat v14 = [v13 text];
      double v27 = (void *)v11;
      double v15 = (void *)[v12 initWithString:v14 attributes:v11];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v4;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        uint64_t v20 = *MEMORY[0x263F1C258];
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            double v23 = [v16 objectForKeyedSubscript:v22];
            uint64_t v24 = [v22 rangeValue];
            objc_msgSend(v15, "addAttribute:value:range:", v20, v23, v24, v25);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v18);
      }

      double v26 = [(TFLinkableHeaderFooterView *)self textView];
      [v26 setAttributedText:v15];

      [(TFLinkableHeaderFooterView *)self setNeedsLayout];
    }
  }
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  id v4 = a3;
  id v6 = [(TFLinkableHeaderFooterView *)self textView];
  BOOL v5 = +[TFLinkableHeaderFooterViewSpecification createTextViewFontForTraitCollection:v4];

  [v6 setFont:v5];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"TFLinkableHeaderFooterView";
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)isHeader
{
  return self->_isHeader;
}

- (void)setIsHeader:(BOOL)a3
{
  self->_isHeader = a3;
}

- (void).cxx_destruct
{
}

@end