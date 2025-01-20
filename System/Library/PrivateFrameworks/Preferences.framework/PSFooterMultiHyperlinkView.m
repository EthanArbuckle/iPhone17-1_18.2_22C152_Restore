@interface PSFooterMultiHyperlinkView
- (BOOL)isValidLinkRange:(_NSRange)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)linkSpecs;
- (NSString)text;
- (NSURL)URL;
- (PSFooterMultiHyperlinkView)initWithSpecifier:(id)a3;
- (SEL)action;
- (UITextView)textView;
- (_NSRange)linkRange;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (id)target;
- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3;
- (void)_addLinkSpec:(id)a3 toAttrStr:(id)a4;
- (void)_linkify;
- (void)refreshContentsWithSpecifier:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setLinkSpecs:(id)a3;
- (void)setTarget:(id)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
- (void)setURL:(id)a3;
- (void)setupSubviewsAndContstraints;
@end

@implementation PSFooterMultiHyperlinkView

- (PSFooterMultiHyperlinkView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[PSFooterMultiHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(PSFooterMultiHyperlinkView *)v5 refreshContentsWithSpecifier:v4];
  }

  return v6;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v15 = a3;
  [(PSFooterMultiHyperlinkView *)self setupSubviewsAndContstraints];
  id v4 = [v15 propertyForKey:@"headerFooterHyperlinkButtonTitle"];
  if (v4)
  {
    [(PSFooterMultiHyperlinkView *)self setText:v4];
  }
  else
  {
    v5 = [v15 propertyForKey:@"footerText"];
    [(PSFooterMultiHyperlinkView *)self setText:v5];
  }
  v6 = [v15 propertyForKey:@"headerFooterHyperlinkButtonURL"];
  [(PSFooterMultiHyperlinkView *)self setURL:v6];

  v7 = [v15 propertyForKey:@"footerHyperlinkRange"];
  v8 = v7;
  if (v7)
  {
    NSRange v9 = NSRangeFromString(v7);
    -[PSFooterMultiHyperlinkView setLinkRange:](self, "setLinkRange:", v9.location, v9.length);
  }
  v10 = [v15 propertyForKey:@"footerHyperlinkAction"];
  v11 = v10;
  if (v10)
  {
    [(PSFooterMultiHyperlinkView *)self setAction:NSSelectorFromString(v10)];
    v12 = [v15 propertyForKey:@"footerHyperlinkTarget"];
    v13 = [v12 nonretainedObjectValue];
    [(PSFooterMultiHyperlinkView *)self setTarget:v13];
  }
  v14 = [v15 propertyForKey:@"footerHyperlinkLinkSpecs"];
  if (v14) {
    [(PSFooterMultiHyperlinkView *)self setLinkSpecs:v14];
  }
  [(PSFooterMultiHyperlinkView *)self _linkify];
}

- (void)setupSubviewsAndContstraints
{
  v3 = [(PSFooterMultiHyperlinkView *)self textView];
  [v3 removeFromSuperview];

  id v4 = objc_alloc_init(MEMORY[0x1E4F42F58]);
  [(PSFooterMultiHyperlinkView *)self setTextView:v4];

  v5 = [(PSFooterMultiHyperlinkView *)self textView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [MEMORY[0x1E4F428B8] clearColor];
  v7 = [(PSFooterMultiHyperlinkView *)self textView];
  [v7 setBackgroundColor:v6];

  v8 = [(PSFooterMultiHyperlinkView *)self textView];
  [v8 setShowsVerticalScrollIndicator:0];

  NSRange v9 = [(PSFooterMultiHyperlinkView *)self textView];
  [v9 setEditable:0];

  v10 = [(PSFooterMultiHyperlinkView *)self textView];
  [v10 setSelectable:1];

  v11 = [(PSFooterMultiHyperlinkView *)self textView];
  [v11 setScrollEnabled:0];

  v12 = [(PSFooterMultiHyperlinkView *)self textView];
  v13 = [v12 textContainer];
  [v13 setLineFragmentPadding:0.0];

  double v14 = *MEMORY[0x1E4F437F8];
  double v15 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  v18 = [(PSFooterMultiHyperlinkView *)self textView];
  objc_msgSend(v18, "setTextContainerInset:", v14, v15, v16, v17);

  v19 = [(PSFooterMultiHyperlinkView *)self textView];
  [v19 _setInteractiveTextSelectionDisabled:1];

  v20 = [(PSFooterMultiHyperlinkView *)self textView];
  [v20 setDelegate:self];

  v21 = [(PSFooterMultiHyperlinkView *)self contentView];
  v22 = [(PSFooterMultiHyperlinkView *)self textView];
  [v21 addSubview:v22];

  id v47 = [MEMORY[0x1E4F1CA48] array];
  v23 = [(PSFooterMultiHyperlinkView *)self textView];
  v24 = [v23 leadingAnchor];
  v25 = [(PSFooterMultiHyperlinkView *)self contentView];
  v26 = [v25 layoutMarginsGuide];
  v27 = [v26 leadingAnchor];
  v28 = [v24 constraintEqualToAnchor:v27];
  [v47 addObject:v28];

  v29 = [(PSFooterMultiHyperlinkView *)self textView];
  v30 = [v29 trailingAnchor];
  v31 = [(PSFooterMultiHyperlinkView *)self contentView];
  v32 = [v31 layoutMarginsGuide];
  v33 = [v32 trailingAnchor];
  v34 = [v30 constraintEqualToAnchor:v33];
  [v47 addObject:v34];

  v35 = [(PSFooterMultiHyperlinkView *)self textView];
  v36 = [v35 topAnchor];
  v37 = [(PSFooterMultiHyperlinkView *)self contentView];
  v38 = [v37 layoutMarginsGuide];
  v39 = [v38 topAnchor];
  v40 = [v36 constraintEqualToAnchor:v39];
  [v47 addObject:v40];

  v41 = [(PSFooterMultiHyperlinkView *)self textView];
  v42 = [v41 bottomAnchor];
  v43 = [(PSFooterMultiHyperlinkView *)self contentView];
  v44 = [v43 layoutMarginsGuide];
  v45 = [v44 bottomAnchor];
  v46 = [v42 constraintEqualToAnchor:v45];
  [v47 addObject:v46];

  [MEMORY[0x1E4F28DC8] activateConstraints:v47];
}

- (void)setText:(id)a3
{
  id v10 = a3;
  uint64_t v5 = [(NSString *)self->_text isEqualToString:v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_text, a3);
    text = self->_text;
    v8 = [(PSFooterMultiHyperlinkView *)self textView];
    [v8 setText:text];

    [(PSFooterMultiHyperlinkView *)self linkRange];
    if (v9) {
      [(PSFooterMultiHyperlinkView *)self _linkify];
    }
    uint64_t v5 = [(PSFooterMultiHyperlinkView *)self setNeedsUpdateConstraints];
    id v6 = v10;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setURL:(id)a3
{
  id v5 = a3;
  if ((-[NSURL isEqual:](self->_URL, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_URL, a3);
    [(PSFooterMultiHyperlinkView *)self setNeedsUpdateConstraints];
    [(PSFooterMultiHyperlinkView *)self _linkify];
  }
}

- (void)setLinkSpecs:(id)a3
{
  id v7 = a3;
  id v5 = [(PSFooterMultiHyperlinkView *)self linkSpecs];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_linkSpecs, a3);
    [(PSFooterMultiHyperlinkView *)self setNeedsUpdateConstraints];
    [(PSFooterMultiHyperlinkView *)self _linkify];
  }
}

- (void)setLinkRange:(_NSRange)a3
{
  if (self->_linkRange.location != a3.location || self->_linkRange.length != a3.length)
  {
    self->_linkRange = a3;
    id v5 = [(PSFooterMultiHyperlinkView *)self text];

    if (v5)
    {
      [(PSFooterMultiHyperlinkView *)self _linkify];
    }
  }
}

- (void)_linkify
{
  v43[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PSFooterMultiHyperlinkView *)self text];

  if (!v3) {
    return;
  }
  [(PSFooterMultiHyperlinkView *)self linkRange];
  if (v4
    && ([(PSFooterMultiHyperlinkView *)self URL],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(PSFooterMultiHyperlinkView *)self linkRange];
    uint64_t v8 = v7;
    uint64_t v9 = [(PSFooterMultiHyperlinkView *)self URL];
    id v10 = +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:url:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:url:", v6, v8, v9);

    linkSpecs = self->_linkSpecs;
    if (!linkSpecs)
    {
      v43[0] = v10;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = (void **)v43;
LABEL_12:
      v22 = [v12 arrayWithObjects:v13 count:1];
      goto LABEL_13;
    }
  }
  else
  {
    [(PSFooterMultiHyperlinkView *)self linkRange];
    if (!v14) {
      goto LABEL_14;
    }
    uint64_t v15 = [(PSFooterMultiHyperlinkView *)self target];
    if (!v15) {
      goto LABEL_14;
    }
    double v16 = (void *)v15;
    double v17 = [(PSFooterMultiHyperlinkView *)self action];

    if (!v17) {
      goto LABEL_14;
    }
    uint64_t v18 = [(PSFooterMultiHyperlinkView *)self linkRange];
    uint64_t v20 = v19;
    v21 = [(PSFooterMultiHyperlinkView *)self target];
    id v10 = +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:target:action:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:target:action:", v18, v20, v21, [(PSFooterMultiHyperlinkView *)self action]);

    linkSpecs = self->_linkSpecs;
    if (!linkSpecs)
    {
      v42 = v10;
      v12 = (void *)MEMORY[0x1E4F1C978];
      v13 = &v42;
      goto LABEL_12;
    }
  }
  v22 = [(NSArray *)linkSpecs arrayByAddingObject:v10];
LABEL_13:
  v23 = self->_linkSpecs;
  self->_linkSpecs = v22;

LABEL_14:
  v24 = [MEMORY[0x1E4F1CA60] dictionary];
  rangeLinkSpecMap = self->_rangeLinkSpecMap;
  self->_rangeLinkSpecMap = v24;

  id v26 = objc_alloc(MEMORY[0x1E4F28E48]);
  v27 = [(PSFooterMultiHyperlinkView *)self text];
  v28 = (void *)[v26 initWithString:v27];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v29 = [(PSFooterMultiHyperlinkView *)self linkSpecs];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v35 = self->_rangeLinkSpecMap;
        v44.location = [v34 linkRange];
        v36 = NSStringFromRange(v44);
        [(NSMutableDictionary *)v35 setValue:v34 forKey:v36];

        [(PSFooterMultiHyperlinkView *)self _addLinkSpec:v34 toAttrStr:v28];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v31);
  }
}

- (void)_addLinkSpec:(id)a3 toAttrStr:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PSListController appearance];
  uint64_t v9 = [v8 altTextColor];
  if (v9)
  {
    id v10 = +[PSListController appearance];
    v11 = [v10 altTextColor];
  }
  else
  {
    v11 = PreferencesTableViewFooterColor();
  }

  v12 = +[PSListController appearance];
  v13 = [v12 footerHyperlinkColor];
  if (v13)
  {
    uint64_t v14 = +[PSListController appearance];
    uint64_t v15 = [v14 footerHyperlinkColor];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }

  double v16 = [(PSFooterMultiHyperlinkView *)self text];
  uint64_t v17 = [v16 length];

  uint64_t v18 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v19 = [v18 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  if (IsAccessibilityCategory)
  {
    v21 = objc_opt_new();
    LODWORD(v22) = 1055286886;
    [v21 setHyphenationFactor:v22];
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v21, 0, v17);
  }
  uint64_t v23 = *MEMORY[0x1E4F42508];
  v24 = PreferencesTableViewFooterFont();
  objc_msgSend(v7, "addAttribute:value:range:", v23, v24, 0, v17);

  uint64_t v25 = *MEMORY[0x1E4F42510];
  id v26 = [(PSFooterMultiHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v11];
  objc_msgSend(v7, "addAttribute:value:range:", v25, v26, 0, v17);

  uint64_t v27 = [v6 linkRange];
  if (-[PSFooterMultiHyperlinkView isValidLinkRange:](self, "isValidLinkRange:", v27, v28))
  {
    v29 = [(PSFooterMultiHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v15];
    uint64_t v30 = [v6 linkRange];
    objc_msgSend(v7, "addAttribute:value:range:", v25, v29, v30, v31);

    uint64_t v32 = *MEMORY[0x1E4F42530];
    v33 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EFB51FD0];
    uint64_t v34 = [v6 linkRange];
    objc_msgSend(v7, "addAttribute:value:range:", v32, v33, v34, v35);

    uint64_t v36 = *MEMORY[0x1E4F425C8];
    uint64_t v37 = [v6 linkRange];
    objc_msgSend(v7, "addAttribute:value:range:", v36, MEMORY[0x1E4F1CC28], v37, v38);
  }
  long long v39 = [(PSFooterMultiHyperlinkView *)self textView];
  [v39 setAttributedText:v7];

  if (v15)
  {
    uint64_t v43 = v25;
    long long v40 = [(PSFooterMultiHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v15];
    v44[0] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    v42 = [(PSFooterMultiHyperlinkView *)self textView];
    [v42 setLinkTextAttributes:v41];
  }
}

- (BOOL)isValidLinkRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger v4 = a3.location + a3.length;
  id v5 = [(PSFooterMultiHyperlinkView *)self text];
  BOOL v3 = v4 <= [v5 length];

  return v3;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  rangeLinkSpecMap = self->_rangeLinkSpecMap;
  id v7 = NSStringFromRange(a5);
  uint64_t v8 = [(NSMutableDictionary *)rangeLinkSpecMap valueForKey:v7];

  uint64_t v9 = [v8 target];

  if (v9)
  {
    [v8 action];
    id v10 = [v8 target];
    id v11 = (id)SFPerformSelector();
  }
  return v9 == 0;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSFooterMultiHyperlinkView;
  [(PSFooterMultiHyperlinkView *)&v4 _accessibilitySetInterfaceStyleIntent:a3];
  [(PSFooterMultiHyperlinkView *)self _linkify];
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)URL
{
  return self->_URL;
}

- (_NSRange)linkRange
{
  p_linkRange = &self->_linkRange;
  NSUInteger location = self->_linkRange.location;
  NSUInteger length = p_linkRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_action = v3;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSArray)linkSpecs
{
  return self->_linkSpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkSpecs, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_rangeLinkSpecMap, 0);
}

@end