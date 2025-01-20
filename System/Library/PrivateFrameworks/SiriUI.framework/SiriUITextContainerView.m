@interface SiriUITextContainerView
+ (CGRect)_textBoundingRectWithSize:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6;
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6;
+ (double)_distanceFromBaselineToBottomWithFont:(id)a3 textContainerStyle:(id *)a4;
+ (double)_distanceFromTopToBaselineWithFont:(id)a3 textContainerStyle:(id *)a4;
- ($131113AABFBD927EF350151908AA1243)textContainerStyle;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SiriUITextContainerView)initWithText:(id)a3;
- (SiriUITextContainerView)initWithText:(id)a3 visualEffect:(id)a4;
- (UIColor)textColor;
- (UIFont)font;
- (int64_t)textAlignment;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextContainerStyle:(id *)a3;
@end

@implementation SiriUITextContainerView

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6
{
  double height = a3.height;
  double width = a3.width;
  long long v11 = *(_OWORD *)&a6->var2;
  long long v19 = *(_OWORD *)&a6->var0;
  long long v20 = v11;
  long long v21 = *(_OWORD *)&a6->var3.left;
  CGFloat right = a6->var3.right;
  id v12 = a5;
  objc_msgSend(a1, "_textBoundingRectWithSize:text:font:textContainerStyle:", a4, v12, &v19, width, height);
  double MaxY = CGRectGetMaxY(v24);
  long long v14 = *(_OWORD *)&a6->var2;
  long long v19 = *(_OWORD *)&a6->var0;
  long long v20 = v14;
  long long v21 = *(_OWORD *)&a6->var3.left;
  CGFloat right = a6->var3.right;
  [a1 _distanceFromBaselineToBottomWithFont:v12 textContainerStyle:&v19];
  double v16 = v15;

  double v17 = MaxY + v16 + a6->var3.top + a6->var3.bottom;
  double v18 = width;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (SiriUITextContainerView)initWithText:(id)a3 visualEffect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SiriUITextContainerView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v12 = -[SiriUITextContainerView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F74480] label];
    label = v12->_label;
    v12->_label = (SiriSharedUIContentLabel *)v13;

    if (v7)
    {
      double v15 = [[SiriUIVisualEffectView alloc] initWithEffect:v7];
      [(SiriUIVisualEffectView *)v15 setCustomView:v12->_label];
      containerView = v12->_containerView;
      v12->_containerView = &v15->super.super;
    }
    else
    {
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v8, v9, v10, v11);
      double v18 = v12->_containerView;
      v12->_containerView = (UIView *)v17;

      [(UIView *)v12->_containerView addSubview:v12->_label];
    }
    [(SiriUITextContainerView *)v12 addSubview:v12->_containerView];
    [(SiriUITextContainerView *)v12 setText:v6];
  }

  return v12;
}

- (SiriUITextContainerView)initWithText:(id)a3
{
  return [(SiriUITextContainerView *)self initWithText:a3 visualEffect:0];
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)SiriUITextContainerView;
  [(SiriUITextContainerView *)&v35 layoutSubviews];
  v3 = [(SiriSharedUIContentLabel *)self->_label font];
  v4 = [(SiriSharedUIContentLabel *)self->_label text];
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  [(SiriUITextContainerView *)self textContainerStyle];
  [(SiriUITextContainerView *)self frame];
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  double v9 = CGRectGetWidth(v36);
  UICeilToViewScale();
  double v11 = v10;
  UICeilToViewScale();
  double v26 = v9 - (v11 + v12);
  uint64_t v13 = objc_opt_class();
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat v14 = CGRectGetWidth(v37);
  long long v27 = v31;
  long long v28 = v32;
  long long v29 = v33;
  uint64_t v30 = v34;
  objc_msgSend(v13, "_textBoundingRectWithSize:text:font:textContainerStyle:", v4, v3, &v27, v14, 1.79769313e308);
  double v15 = CGRectGetHeight(v38);
  UICeilToViewScale();
  double v17 = v16;
  double v18 = *((double *)&v32 + 1);
  long long v19 = objc_opt_class();
  long long v27 = v31;
  long long v28 = v32;
  long long v29 = v33;
  uint64_t v30 = v34;
  [v19 _distanceFromBaselineToBottomWithFont:v3 textContainerStyle:&v27];
  double v21 = v15 + v20;
  -[SiriSharedUIContentLabel setFrame:](self->_label, "setFrame:", v17, v18, v26, v15);
  label = self->_label;
  v23 = objc_opt_class();
  long long v27 = v31;
  long long v28 = v32;
  long long v29 = v33;
  uint64_t v30 = v34;
  [v23 _distanceFromTopToBaselineWithFont:v3 textContainerStyle:&v27];
  -[SiriSharedUIContentLabel _setFirstLineBaselineFrameOriginY:](label, "_setFirstLineBaselineFrameOriginY:");
  containerView = self->_containerView;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v25 = *((double *)&v32 + 1) + (CGRectGetHeight(v39) - *((double *)&v32 + 1) - *((double *)&v33 + 1) - v21) * 0.5;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  -[UIView setFrame:](containerView, "setFrame:", 0.0, v25, CGRectGetWidth(v40), v21);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_opt_class();
  id v7 = [(SiriSharedUIContentLabel *)self->_label text];
  double v8 = [(SiriSharedUIContentLabel *)self->_label font];
  [(SiriUITextContainerView *)self textContainerStyle];
  objc_msgSend(v6, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v15, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)setText:(id)a3
{
  [(SiriSharedUIContentLabel *)self->_label setText:a3];
  [(SiriUITextContainerView *)self setNeedsLayout];
}

- (NSString)text
{
  return (NSString *)[(SiriSharedUIContentLabel *)self->_label text];
}

- (void)setFont:(id)a3
{
  [(SiriSharedUIContentLabel *)self->_label setFont:a3];
  [(SiriUITextContainerView *)self setNeedsLayout];
}

- (UIFont)font
{
  return (UIFont *)[(SiriSharedUIContentLabel *)self->_label font];
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(SiriSharedUIContentLabel *)self->_label textAlignment] != a3)
  {
    label = self->_label;
    [(SiriSharedUIContentLabel *)label setTextAlignment:a3];
  }
}

- (int64_t)textAlignment
{
  return [(SiriSharedUIContentLabel *)self->_label textAlignment];
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return (UIColor *)[(SiriSharedUIContentLabel *)self->_label textColor];
}

- (void)setTextContainerStyle:(id *)a3
{
  long long v6 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var3.left;
  long long v7 = *(_OWORD *)&a3->var0;
  self->_textContainerStyle.edgeInsets.CGFloat right = a3->var3.right;
  *(_OWORD *)&self->_textContainerStyle.distanceFromBaselineToBottom = v6;
  *(_OWORD *)&self->_textContainerStyle.edgeInsets.left = v5;
  *(_OWORD *)&self->_textContainerStyle.numberOfLines = v7;
  [(SiriSharedUIContentLabel *)self->_label setNumberOfLines:a3->var0];
  [(SiriSharedUIContentLabel *)self->_label setLineBreakMode:4 * (a3->var0 == 1)];
  [(SiriUITextContainerView *)self setNeedsLayout];
}

+ (CGRect)_textBoundingRectWithSize:(CGSize)a3 text:(id)a4 font:(id)a5 textContainerStyle:(id *)a6
{
  double width = a3.width;
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v26 = *MEMORY[0x263F1C238];
  v27[0] = a5;
  double v9 = NSDictionary;
  id v10 = a5;
  id v11 = a4;
  double v12 = [v9 dictionaryWithObjects:v27 forKeys:&v26 count:1];

  if (a6->var0 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 3;
  }
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", v13, v12, 0, width - (a6->var3.left + a6->var3.right), 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

+ (double)_distanceFromBaselineToBottomWithFont:(id)a3 textContainerStyle:(id *)a4
{
  [a3 _scaledValueForValue:a4->var2];
  UIRoundToViewScale();
  return result;
}

+ (double)_distanceFromTopToBaselineWithFont:(id)a3 textContainerStyle:(id *)a4
{
  [a3 _scaledValueForValue:a4->var1];
  UIRoundToViewScale();
  return result;
}

- ($131113AABFBD927EF350151908AA1243)textContainerStyle
{
  long long v3 = *(_OWORD *)&self[7].var3.right;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var3.left;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var3.left = *(_OWORD *)&self[8].var1;
  retstr->var3.CGFloat right = self[8].var3.top;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end