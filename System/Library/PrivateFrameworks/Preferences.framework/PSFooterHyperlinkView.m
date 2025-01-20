@interface PSFooterHyperlinkView
- (BOOL)isValidLinkRange;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (NSString)text;
- (NSURL)URL;
- (PSFooterHyperlinkView)initWithSpecifier:(id)a3;
- (SEL)action;
- (UITextView)textView;
- (_NSRange)linkRange;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (id)target;
- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3;
- (void)_linkify;
- (void)refreshContentsWithSpecifier:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setTarget:(id)a3;
- (void)setText:(id)a3;
- (void)setTextView:(id)a3;
- (void)setURL:(id)a3;
- (void)setupSubviewsAndContstraints;
@end

@implementation PSFooterHyperlinkView

- (PSFooterHyperlinkView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[PSFooterHyperlinkView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(PSFooterHyperlinkView *)v5 setupSubviewsAndContstraints];
    [(PSFooterHyperlinkView *)v6 refreshContentsWithSpecifier:v4];
  }

  return v6;
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v14 = a3;
  [(PSFooterHyperlinkView *)self setText:0];
  [(PSFooterHyperlinkView *)self setURL:0];
  id v4 = [v14 propertyForKey:@"headerFooterHyperlinkButtonTitle"];
  if (v4)
  {
    [(PSFooterHyperlinkView *)self setText:v4];
  }
  else
  {
    v5 = [v14 propertyForKey:@"footerText"];
    [(PSFooterHyperlinkView *)self setText:v5];
  }
  v6 = [v14 propertyForKey:@"headerFooterHyperlinkButtonURL"];
  [(PSFooterHyperlinkView *)self setURL:v6];

  v7 = [v14 propertyForKey:@"footerHyperlinkRange"];
  v8 = v7;
  if (v7)
  {
    NSRange v9 = NSRangeFromString(v7);
    -[PSFooterHyperlinkView setLinkRange:](self, "setLinkRange:", v9.location, v9.length);
  }
  v10 = [v14 propertyForKey:@"footerHyperlinkAction"];
  v11 = v10;
  if (v10)
  {
    [(PSFooterHyperlinkView *)self setAction:NSSelectorFromString(v10)];
    v12 = [v14 propertyForKey:@"footerHyperlinkTarget"];
    v13 = [v12 nonretainedObjectValue];
    [(PSFooterHyperlinkView *)self setTarget:v13];
  }
  [(PSFooterHyperlinkView *)self _linkify];
}

- (void)setupSubviewsAndContstraints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42F58]);
  [(PSFooterHyperlinkView *)self setTextView:v3];

  id v4 = [(PSFooterHyperlinkView *)self textView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x1E4F428B8] clearColor];
  v6 = [(PSFooterHyperlinkView *)self textView];
  [v6 setBackgroundColor:v5];

  v7 = [(PSFooterHyperlinkView *)self textView];
  [v7 setShowsVerticalScrollIndicator:0];

  v8 = [(PSFooterHyperlinkView *)self textView];
  [v8 setEditable:0];

  NSRange v9 = [(PSFooterHyperlinkView *)self textView];
  [v9 setSelectable:1];

  v10 = [(PSFooterHyperlinkView *)self textView];
  [v10 setScrollEnabled:0];

  v11 = [(PSFooterHyperlinkView *)self textView];
  v12 = [v11 textContainer];
  [v12 setLineFragmentPadding:0.0];

  double v13 = *MEMORY[0x1E4F437F8];
  double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  v17 = [(PSFooterHyperlinkView *)self textView];
  objc_msgSend(v17, "setTextContainerInset:", v13, v14, v15, v16);

  v18 = [(PSFooterHyperlinkView *)self textView];
  [v18 _setInteractiveTextSelectionDisabled:1];

  v19 = [(PSFooterHyperlinkView *)self textView];
  [v19 setDelegate:self];

  v20 = [(PSFooterHyperlinkView *)self contentView];
  v21 = [(PSFooterHyperlinkView *)self textView];
  [v20 addSubview:v21];

  id v46 = [MEMORY[0x1E4F1CA48] array];
  v22 = [(PSFooterHyperlinkView *)self textView];
  v23 = [v22 leadingAnchor];
  v24 = [(PSFooterHyperlinkView *)self contentView];
  v25 = [v24 layoutMarginsGuide];
  v26 = [v25 leadingAnchor];
  v27 = [v23 constraintEqualToAnchor:v26];
  [v46 addObject:v27];

  v28 = [(PSFooterHyperlinkView *)self textView];
  v29 = [v28 trailingAnchor];
  v30 = [(PSFooterHyperlinkView *)self contentView];
  v31 = [v30 layoutMarginsGuide];
  v32 = [v31 trailingAnchor];
  v33 = [v29 constraintEqualToAnchor:v32];
  [v46 addObject:v33];

  v34 = [(PSFooterHyperlinkView *)self textView];
  v35 = [v34 topAnchor];
  v36 = [(PSFooterHyperlinkView *)self contentView];
  v37 = [v36 layoutMarginsGuide];
  v38 = [v37 topAnchor];
  v39 = [v35 constraintEqualToAnchor:v38];
  [v46 addObject:v39];

  v40 = [(PSFooterHyperlinkView *)self textView];
  v41 = [v40 bottomAnchor];
  v42 = [(PSFooterHyperlinkView *)self contentView];
  v43 = [v42 layoutMarginsGuide];
  v44 = [v43 bottomAnchor];
  v45 = [v41 constraintEqualToAnchor:v44];
  [v46 addObject:v45];

  [MEMORY[0x1E4F28DC8] activateConstraints:v46];
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
    v8 = [(PSFooterHyperlinkView *)self textView];
    [v8 setText:text];

    [(PSFooterHyperlinkView *)self linkRange];
    if (v9) {
      [(PSFooterHyperlinkView *)self _linkify];
    }
    uint64_t v5 = [(PSFooterHyperlinkView *)self setNeedsUpdateConstraints];
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
    [(PSFooterHyperlinkView *)self setNeedsUpdateConstraints];
    [(PSFooterHyperlinkView *)self _linkify];
  }
}

- (void)setLinkRange:(_NSRange)a3
{
  if (self->_linkRange.location != a3.location || self->_linkRange.length != a3.length)
  {
    self->_linkRange = a3;
    id v5 = [(PSFooterHyperlinkView *)self text];

    if (v5)
    {
      [(PSFooterHyperlinkView *)self _linkify];
    }
  }
}

- (void)_linkify
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PSFooterHyperlinkView *)self text];
  if (v3)
  {
    id v4 = (void *)v3;
    [(PSFooterHyperlinkView *)self linkRange];
    uint64_t v6 = v5;

    if (v6)
    {
      v7 = +[PSListController appearance];
      v8 = [v7 altTextColor];
      if (v8)
      {
        uint64_t v9 = +[PSListController appearance];
        id v10 = [v9 altTextColor];
      }
      else
      {
        id v10 = PreferencesTableViewFooterColor();
      }

      v11 = +[PSListController appearance];
      v12 = [v11 footerHyperlinkColor];
      if (v12)
      {
        double v13 = +[PSListController appearance];
        double v14 = [v13 footerHyperlinkColor];
      }
      else
      {
        double v14 = [MEMORY[0x1E4F428B8] systemBlueColor];
      }

      double v15 = [(PSFooterHyperlinkView *)self text];
      uint64_t v16 = [v15 length];

      id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
      v18 = [(PSFooterHyperlinkView *)self text];
      v19 = (void *)[v17 initWithString:v18];

      v20 = [MEMORY[0x1E4F42738] sharedApplication];
      v21 = [v20 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);

      if (IsAccessibilityCategory)
      {
        v23 = objc_opt_new();
        LODWORD(v24) = 1055286886;
        [v23 setHyphenationFactor:v24];
        objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x1E4F42540], v23, 0, v16);
      }
      uint64_t v25 = *MEMORY[0x1E4F42508];
      v26 = PreferencesTableViewFooterFont();
      objc_msgSend(v19, "addAttribute:value:range:", v25, v26, 0, v16);

      uint64_t v27 = *MEMORY[0x1E4F42510];
      v28 = [(PSFooterHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v10];
      objc_msgSend(v19, "addAttribute:value:range:", v27, v28, 0, v16);

      if ([(PSFooterHyperlinkView *)self isValidLinkRange])
      {
        v29 = [(PSFooterHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v14];
        uint64_t v30 = [(PSFooterHyperlinkView *)self linkRange];
        objc_msgSend(v19, "addAttribute:value:range:", v27, v29, v30, v31);

        uint64_t v32 = *MEMORY[0x1E4F42530];
        v33 = [(PSFooterHyperlinkView *)self URL];
        if (v33) {
          [(PSFooterHyperlinkView *)self URL];
        }
        else {
        v34 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EFB51FD0];
        }
        uint64_t v35 = [(PSFooterHyperlinkView *)self linkRange];
        objc_msgSend(v19, "addAttribute:value:range:", v32, v34, v35, v36);

        uint64_t v37 = *MEMORY[0x1E4F425C8];
        uint64_t v38 = [(PSFooterHyperlinkView *)self linkRange];
        objc_msgSend(v19, "addAttribute:value:range:", v37, MEMORY[0x1E4F1CC28], v38, v39);
      }
      v40 = [(PSFooterHyperlinkView *)self textView];
      [v40 setAttributedText:v19];

      if (v14)
      {
        uint64_t v44 = v27;
        v41 = [(PSFooterHyperlinkView *)self _accessibilityHigherContrastTintColorForColor:v14];
        v45[0] = v41;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
        v43 = [(PSFooterHyperlinkView *)self textView];
        [v43 setLinkTextAttributes:v42];
      }
    }
  }
}

- (BOOL)isValidLinkRange
{
  if ([(PSFooterHyperlinkView *)self linkRange] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v4 = [(PSFooterHyperlinkView *)self linkRange];
  [(PSFooterHyperlinkView *)self linkRange];
  unint64_t v6 = v5 + v4;
  v7 = [(PSFooterHyperlinkView *)self text];
  BOOL v3 = v6 <= [v7 length];

  return v3;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  unint64_t v6 = [(PSFooterHyperlinkView *)self target];

  if (v6)
  {
    [(PSFooterHyperlinkView *)self action];
    v7 = [(PSFooterHyperlinkView *)self target];
    id v8 = (id)SFPerformSelector();
  }
  return v6 == 0;
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSFooterHyperlinkView;
  [(PSFooterHyperlinkView *)&v4 _accessibilitySetInterfaceStyleIntent:a3];
  [(PSFooterHyperlinkView *)self _linkify];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end