@interface SiriUIPlatterSectionHeaderView
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (id)_font;
- (SiriUIPlatterSectionHeaderView)initWithText:(id)a3 visualEffect:(id)a4;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation SiriUIPlatterSectionHeaderView

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [a1 _font];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___SiriUIPlatterSectionHeaderView;
  v15[0] = xmmword_22323E920;
  v15[1] = unk_22323E930;
  v15[2] = xmmword_22323E940;
  uint64_t v16 = 0x4030000000000000;
  objc_msgSendSuper2(&v17, sel_sizeThatFits_text_font_textContainerStyle_, v7, v8, v15, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (SiriUIPlatterSectionHeaderView)initWithText:(id)a3 visualEffect:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUIPlatterSectionHeaderView;
  v4 = [(SiriUITextContainerView *)&v10 initWithText:a3 visualEffect:a4];
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x263F1C550], "siriui_keylineColor");
    [(SiriUIPlatterSectionHeaderView *)v4 setBackgroundColor:v5];

    [(SiriUIPlatterSectionHeaderView *)v4 setTextAlignment:4];
    v8[0] = xmmword_22323E920;
    v8[1] = unk_22323E930;
    v8[2] = xmmword_22323E940;
    uint64_t v9 = 0x4030000000000000;
    [(SiriUITextContainerView *)v4 setTextContainerStyle:v8];
    v6 = [(id)objc_opt_class() _font];
    [(SiriUITextContainerView *)v4 setFont:v6];
  }
  return v4;
}

- (void)setTextAlignment:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIPlatterSectionHeaderView;
  [(SiriUITextContainerView *)&v4 setTextAlignment:a3];
  [(UIView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
}

+ (id)_font
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
}

@end