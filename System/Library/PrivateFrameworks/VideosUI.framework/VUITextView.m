@interface VUITextView
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (id)_defaultParagraphStyle;
- (void)setVuiAttributedText:(id)a3;
@end

@implementation VUITextView

- (void)setVuiAttributedText:(id)a3
{
  id v4 = a3;
  v5 = +[VUIInterfaceFactory sharedInstance];
  id v8 = [v5 languageStringHandler];

  v6 = [(VUITextView *)self _defaultParagraphStyle];
  v7 = [v8 makeLanguageAwareAttributedString:v4 defaultParagraphStyle:v6];

  [(VUITextView *)self setAttributedText:v7];
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUITextView;
  -[VUITextView sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_defaultParagraphStyle
{
  double v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  double v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "setAlignment:", -[VUITextView vuiTextAlignment](self, "vuiTextAlignment"));
  [v4 setLineBreakMode:0];
  objc_super v5 = (void *)[v4 copy];

  return v5;
}

@end