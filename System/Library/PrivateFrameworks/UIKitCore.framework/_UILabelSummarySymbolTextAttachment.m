@interface _UILabelSummarySymbolTextAttachment
- (BOOL)isOn;
- (UIColor)foregroundColor;
- (UIFont)font;
- (_UILabelSummarySymbolTextAttachment)initWithSummarySymbolOn:(BOOL)a3 font:(id)a4 foregroundColor:(id)a5;
- (double)baseline;
- (void)setBounds;
- (void)setFont:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setIsOn:(BOOL)a3;
- (void)setSummarySymbolView:(id)a3;
@end

@implementation _UILabelSummarySymbolTextAttachment

- (BOOL)isOn
{
  v2 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  char v3 = [v2 isOn];

  return v3;
}

- (void)setIsOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  [v4 setIsOn:v3];
}

- (UIFont)font
{
  v2 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  BOOL v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  [v5 setFont:v4];

  [(_UILabelSummarySymbolTextAttachment *)self setBounds];
}

- (UIColor)foregroundColor
{
  v2 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  BOOL v3 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v2 foregroundColor]);

  return (UIColor *)v3;
}

- (void)setForegroundColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  id v5 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  [v5 setForegroundColor:v4];
}

- (double)baseline
{
  v2 = [(_UILabelSummarySymbolTextAttachment *)self summarySymbolView];
  [v2 baseline];
  double v4 = v3;

  return v4;
}

- (_UILabelSummarySymbolTextAttachment)initWithSummarySymbolOn:(BOOL)a3 font:(id)a4 foregroundColor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84___UILabelSummarySymbolTextAttachment_initWithSummarySymbolOn_font_foregroundColor___block_invoke;
  v16[3] = &unk_1E5305030;
  BOOL v19 = a3;
  id v17 = v8;
  id v18 = v9;
  v15.receiver = self;
  v15.super_class = (Class)_UILabelSummarySymbolTextAttachment;
  id v10 = v9;
  id v11 = v8;
  v12 = [(_UILabelViewTextAttachment *)&v15 initWithViewProvider:v16];
  v13 = v12;
  if (v12) {
    [(_UILabelSummarySymbolTextAttachment *)v12 setBounds];
  }

  return v13;
}

- (void)setBounds
{
  double v3 = [(_UILabelViewTextAttachment *)self view];
  [v3 sizeToFit];

  [(_UILabelSummarySymbolTextAttachment *)self baseline];
  double v5 = v4;
  id v10 = [(_UILabelViewTextAttachment *)self view];
  [v10 bounds];
  double v6 = v5 - CGRectGetHeight(v12);
  v7 = [(_UILabelViewTextAttachment *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v13);
  id v9 = [(_UILabelViewTextAttachment *)self view];
  [v9 bounds];
  -[_UILabelSummarySymbolTextAttachment setBounds:](self, "setBounds:", 0.0, v6, Width, CGRectGetHeight(v14));
}

- (void)setSummarySymbolView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end