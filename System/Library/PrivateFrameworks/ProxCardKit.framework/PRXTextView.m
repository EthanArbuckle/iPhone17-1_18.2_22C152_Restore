@interface PRXTextView
+ (PRXTextView)textViewWithStyle:(int64_t)a3;
- (PRXTextView)initWithStyle:(int64_t)a3;
- (int64_t)style;
- (void)setTitleText:(id)a3;
@end

@implementation PRXTextView

- (PRXTextView)initWithStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PRXTextView;
  v4 = [(PRXTextView *)&v16 init];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = [[PRXTextStyleDefinition alloc] initWithStyle:a3];
    v7 = [(PRXTextStyleDefinition *)v6 textColor];
    [(PRXTextView *)v5 setTextColor:v7];

    v8 = [(PRXTextStyleDefinition *)v6 font];
    [(PRXTextView *)v5 setFont:v8];

    [(PRXTextView *)v5 setTextAlignment:[(PRXTextStyleDefinition *)v6 textAlignment]];
    [(PRXTextView *)v5 setAccessibilityTraits:[(PRXTextStyleDefinition *)v6 accessibilityTraits]];
    uint64_t v9 = [(PRXTextStyleDefinition *)v6 numberOfLines];
    v10 = [(PRXTextView *)v5 textContainer];
    [v10 setMaximumNumberOfLines:v9];

    [(PRXTextView *)v5 setScrollEnabled:0];
    [(PRXTextView *)v5 setShowsVerticalScrollIndicator:0];
    [(PRXTextView *)v5 setShowsHorizontalScrollIndicator:0];
    [(PRXTextView *)v5 setAutomaticallyAdjustsScrollIndicatorInsets:0];
    [(PRXTextView *)v5 setEditable:0];
    [(PRXTextView *)v5 setSelectable:0];
    [(PRXTextView *)v5 setAdjustsFontForContentSizeCategory:1];
    v11 = [MEMORY[0x263F1C550] clearColor];
    [(PRXTextView *)v5 setBackgroundColor:v11];

    -[PRXTextView setTextContainerInset:](v5, "setTextContainerInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    v12 = [(PRXTextView *)v5 textContainer];
    [v12 setLineFragmentPadding:0.0];

    v13 = [(PRXTextView *)v5 layoutManager];
    [v13 setUsesFontLeading:0];

    v14 = v5;
  }

  return v5;
}

+ (PRXTextView)textViewWithStyle:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithStyle:a3];
  return (PRXTextView *)v3;
}

- (void)setTitleText:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  if (self->_style)
  {
    v4 = (PRXTextStyleDefinition *)a3;
    [(PRXTextView *)self setText:v4];
  }
  else
  {
    id v5 = a3;
    v4 = [[PRXTextStyleDefinition alloc] initWithStyle:self->_style];
    id v6 = objc_alloc_init(MEMORY[0x263F1C350]);
    LODWORD(v7) = 1045220557;
    [v6 setHyphenationFactor:v7];
    objc_msgSend(v6, "setAlignment:", -[PRXTextStyleDefinition textAlignment](v4, "textAlignment"));
    [v6 setLineBreakStrategy:0xFFFFLL];
    uint64_t v8 = *MEMORY[0x263F1C268];
    v15[0] = v6;
    uint64_t v9 = *MEMORY[0x263F1C238];
    v14[0] = v8;
    v14[1] = v9;
    v10 = [(PRXTextStyleDefinition *)v4 font];
    v15[1] = v10;
    v14[2] = *MEMORY[0x263F1C240];
    v11 = [(PRXTextStyleDefinition *)v4 textColor];
    v15[2] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

    v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v12];
    [(PRXTextView *)self setAttributedText:v13];
  }
}

- (int64_t)style
{
  return self->_style;
}

@end