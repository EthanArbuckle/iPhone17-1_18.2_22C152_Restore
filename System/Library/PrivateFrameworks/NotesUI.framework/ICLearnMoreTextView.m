@interface ICLearnMoreTextView
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isShowingLearnMore;
- (NSString)helpTopic;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIViewController)parentViewController;
- (id)accessibilityHint;
- (id)attributedString:(id)a3 withColor:(id)a4 font:(id)a5;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)dealloc;
- (void)didTapLearnMore;
- (void)resetTextView;
- (void)setAttributedText:(id)a3 addLearnMore:(BOOL)a4;
- (void)setAttributedText:(id)a3 font:(id)a4 lineSpacing:(double)a5 addLearnMore:(BOOL)a6;
- (void)setHelpTopic:(id)a3;
- (void)setIsShowingLearnMore:(BOOL)a3;
- (void)setParentViewController:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setText:(id)a3 font:(id)a4 color:(id)a5 lineSpacing:(double)a6 addLearnMore:(BOOL)a7;
- (void)sizeToFitWidthUsingHeightConstraint:(id)a3;
- (void)tapGesture:(id)a3;
- (void)updateForAccessibilityDarkerSystemColors;
@end

@implementation ICLearnMoreTextView

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)ICLearnMoreTextView;
  [(ICLearnMoreTextView *)&v4 awakeFromNib];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_updateForAccessibilityDarkerSystemColors name:*MEMORY[0x1E4FB2438] object:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = [(ICLearnMoreTextView *)self tapGestureRecognizer];

  if (v4)
  {
    v5 = [(ICLearnMoreTextView *)self tapGestureRecognizer];
    [(ICLearnMoreTextView *)self removeGestureRecognizer:v5];

    [(ICLearnMoreTextView *)self setTapGestureRecognizer:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICLearnMoreTextView;
  [(ICLearnMoreTextView *)&v6 dealloc];
}

- (void)resetTextView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  [(ICLearnMoreTextView *)self setAttributedText:v3];

  objc_super v4 = [(ICLearnMoreTextView *)self tapGestureRecognizer];

  if (v4)
  {
    v5 = [(ICLearnMoreTextView *)self tapGestureRecognizer];
    [(ICLearnMoreTextView *)self removeGestureRecognizer:v5];

    [(ICLearnMoreTextView *)self setTapGestureRecognizer:0];
  }
  [(ICLearnMoreTextView *)self setIsShowingLearnMore:0];
}

- (void)setText:(id)a3 font:(id)a4 color:(id)a5 lineSpacing:(double)a6 addLearnMore:(BOOL)a7
{
  BOOL v7 = a7;
  id v15 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v15 length])
  {
    v14 = [(ICLearnMoreTextView *)self attributedString:v15 withColor:v13 font:v12];
    [(ICLearnMoreTextView *)self setAttributedText:v14 font:v12 lineSpacing:v7 addLearnMore:a6];
  }
  else
  {
    [(ICLearnMoreTextView *)self resetTextView];
  }
  [(ICLearnMoreTextView *)self setIsShowingLearnMore:v7];
}

- (void)setAttributedText:(id)a3 addLearnMore:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  if ([v17 length])
  {
    objc_super v6 = [v17 attributesAtIndex:0 effectiveRange:0];
    BOOL v7 = (void *)[v6 mutableCopy];

    if (v4)
    {
      v8 = [MEMORY[0x1E4FB1618] ICLearnMoreLinkColor];
      if (!v8)
      {
        v8 = [(ICLearnMoreTextView *)self tintColor];
      }
      v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@" Learn more…" value:@" Learn more…" table:0 allowSiri:1];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9 attributes:v7];
      uint64_t v11 = [v10 length];
      objc_msgSend(v10, "addAttribute:value:range:", @"ICLearnMoreTag", MEMORY[0x1E4F1CC38], 0, v11);
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v8, 0, objc_msgSend(v10, "length"));
      id v12 = (void *)[v17 mutableCopy];
      [v12 appendAttributedString:v10];
      uint64_t v13 = [v12 copy];

      v14 = [(ICLearnMoreTextView *)self tapGestureRecognizer];

      if (!v14)
      {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapGesture_];
        [(ICLearnMoreTextView *)self setTapGestureRecognizer:v15];

        v16 = [(ICLearnMoreTextView *)self tapGestureRecognizer];
        [(ICLearnMoreTextView *)self addGestureRecognizer:v16];
      }
      id v17 = (id)v13;
    }
  }
  [(ICLearnMoreTextView *)self setIsShowingLearnMore:v4];
  [(ICLearnMoreTextView *)self setAttributedText:v17];
}

- (void)setAttributedText:(id)a3 font:(id)a4 lineSpacing:(double)a5 addLearnMore:(BOOL)a6
{
  BOOL v6 = a6;
  id v21 = a3;
  id v10 = a4;
  [(ICLearnMoreTextView *)self resetTextView];
  if ([v21 length])
  {
    uint64_t v11 = (void *)[v21 mutableCopy];
    if (v6)
    {
      id v12 = [MEMORY[0x1E4FB1618] ICLearnMoreLinkColor];
      uint64_t v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@" Learn more…" value:@" Learn more…" table:0 allowSiri:1];
      v14 = [(ICLearnMoreTextView *)self attributedString:v13 withColor:v12 font:v10];
      id v15 = (void *)[v14 mutableCopy];

      uint64_t v16 = [v15 length];
      objc_msgSend(v15, "addAttribute:value:range:", @"ICLearnMoreTag", MEMORY[0x1E4F1CC38], 0, v16);
      [v11 appendAttributedString:v15];
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    [v17 setAlignment:1];
    [v17 setLineSpacing:a5];
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v17, 0, objc_msgSend(v11, "length"));
    [(ICLearnMoreTextView *)self setAttributedText:v11];
    if (v6)
    {
      v18 = [(ICLearnMoreTextView *)self tapGestureRecognizer];

      if (!v18)
      {
        v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapGesture_];
        [(ICLearnMoreTextView *)self setTapGestureRecognizer:v19];

        v20 = [(ICLearnMoreTextView *)self tapGestureRecognizer];
        [(ICLearnMoreTextView *)self addGestureRecognizer:v20];
      }
    }
  }
  [(ICLearnMoreTextView *)self setIsShowingLearnMore:v6];
}

- (void)tapGesture:(id)a3
{
  id v4 = a3;
  v5 = [(ICLearnMoreTextView *)self layoutManager];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  [(ICLearnMoreTextView *)self textContainerInset];
  double v11 = v7 - v10;
  [(ICLearnMoreTextView *)self textContainerInset];
  double v13 = v9 - v12;
  v14 = [(ICLearnMoreTextView *)self textContainer];
  unint64_t v15 = objc_msgSend(v5, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v11, v13);

  uint64_t v16 = [(ICLearnMoreTextView *)self textStorage];
  unint64_t v17 = [v16 length];

  if (v15 < v17)
  {
    v18 = [(ICLearnMoreTextView *)self textStorage];
    v19 = [v18 attribute:@"ICLearnMoreTag" atIndex:v15 effectiveRange:&v20];

    if (v19) {
      [(ICLearnMoreTextView *)self didTapLearnMore];
    }
  }
}

- (void)didTapLearnMore
{
  id v3 = [(ICLearnMoreTextView *)self helpTopic];

  if (!v3) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.helpTopic) != nil)", "-[ICLearnMoreTextView didTapLearnMore]", 1, 0, @"Expected non-nil value for '%s'", "self.helpTopic");
  }
  id v4 = [(ICLearnMoreTextView *)self parentViewController];
  v5 = [v4 view];
  double v6 = [v5 window];

  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.parentViewController.view.window) != nil)", "-[ICLearnMoreTextView didTapLearnMore]", 1, 0, @"Expected non-nil value for '%s'", "self.parentViewController.view.window");
  }
  id v8 = [(ICLearnMoreTextView *)self helpTopic];
  double v7 = [(ICLearnMoreTextView *)self parentViewController];
  +[ICHelp presentWithTopic:v8 presentingViewController:v7];
}

- (id)attributedString:(id)a3 withColor:(id)a4 font:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = (void *)MEMORY[0x1E4F1CA60];
  double v10 = (__CFString *)a3;
  double v11 = [v9 dictionary];
  double v12 = v11;
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  }
  if (v7) {
    [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v10) {
    v14 = v10;
  }
  else {
    v14 = &stru_1F0973378;
  }
  unint64_t v15 = (void *)[v13 initWithString:v14 attributes:v12];

  return v15;
}

- (void)sizeToFitWidthUsingHeightConstraint:(id)a3
{
  id v6 = a3;
  [(ICLearnMoreTextView *)self frame];
  -[ICLearnMoreTextView sizeThatFits:](self, "sizeThatFits:", v4, 3.40282347e38);
  [v6 setConstant:v5];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = [(ICLearnMoreTextView *)self isShowingLearnMore];
  if (v3) {
    [(ICLearnMoreTextView *)self didTapLearnMore];
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return *MEMORY[0x1E4FB25A0];
  }
  unint64_t v3 = *MEMORY[0x1E4FB2570];
  if (UIAccessibilityIsSwitchControlRunning()) {
    return *MEMORY[0x1E4FB2540];
  }
  else {
    return v3;
  }
}

- (id)accessibilityHint
{
  unint64_t v3 = [(ICLearnMoreTextView *)self accessibilityUserDefinedHint];
  if (![v3 length] && -[ICLearnMoreTextView isShowingLearnMore](self, "isShowingLearnMore"))
  {
    uint64_t v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Double tap to learn more." value:@"Double tap to learn more." table:0 allowSiri:1];

    unint64_t v3 = (void *)v4;
  }
  return v3;
}

- (BOOL)_accessibilityHasTextOperations
{
  return 0;
}

- (void)updateForAccessibilityDarkerSystemColors
{
  unint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@" Learn more…" value:@" Learn more…" table:0 allowSiri:1];
  uint64_t v4 = [(ICLearnMoreTextView *)self text];
  uint64_t v5 = [v4 rangeOfString:v3];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(ICLearnMoreTextView *)self attributedText];
    id v7 = (void *)[v6 mutableCopy];

    uint64_t v12 = 0;
    uint64_t v13 = 0;
    id v8 = [v7 attributesAtIndex:v5 effectiveRange:&v12];
    double v9 = (void *)[v8 mutableCopy];

    double v10 = [MEMORY[0x1E4FB1618] ICLearnMoreLinkColor];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    objc_msgSend(v7, "setAttributes:range:", v9, v12, v13);
    double v11 = (void *)[v7 copy];
    [(ICLearnMoreTextView *)self setAttributedText:v11];
  }
}

- (NSString)helpTopic
{
  return self->_helpTopic;
}

- (void)setHelpTopic:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (BOOL)isShowingLearnMore
{
  return self->_isShowingLearnMore;
}

- (void)setIsShowingLearnMore:(BOOL)a3
{
  self->_isShowingLearnMore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_helpTopic, 0);
}

@end