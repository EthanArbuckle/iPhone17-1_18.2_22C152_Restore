@interface PKTrailingAccessoryLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedText;
- (PKTrailingAccessoryLabel)initWithCoder:(id)a3;
- (PKTrailingAccessoryLabel)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (int64_t)maximumNumberOfLines;
- (void)layoutSubviews;
- (void)registerAccessoryWithLayer:(id)a3 withSize:(CGSize)a4 for:(id)a5;
- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5;
- (void)setAttributedText:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setMaximumNumberOfLines:(int64_t)a3;
- (void)unregisterAccessories;
@end

@implementation PKTrailingAccessoryLabel

- (NSAttributedString)attributedText
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView), sel_attributedText);

  return (NSAttributedString *)v2;
}

- (void)setAttributedText:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  id v6 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setAttributedText_, v6);
  [(PKTrailingAccessoryLabel *)v5 setNeedsLayout];
}

- (int64_t)maximumNumberOfLines
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_textContainer);
  id v5 = objc_msgSend(v4, sel_maximumNumberOfLines);

  return (int64_t)v5;
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_textView);
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_textContainer);
  objc_msgSend(v6, sel_setMaximumNumberOfLines_, a3);
}

- (UIEdgeInsets)contentInsets
{
  id v2 = (double *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v8 = (CGFloat *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  swift_beginAccess();
  CGFloat *v8 = top;
  v8[1] = left;
  v8[2] = bottom;
  v8[3] = right;
  [(PKTrailingAccessoryLabel *)self setNeedsLayout];
}

- (PKTrailingAccessoryLabel)initWithFrame:(CGRect)a3
{
  return (PKTrailingAccessoryLabel *)TrailingAccessoryLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKTrailingAccessoryLabel)initWithCoder:(id)a3
{
  double v4 = (_OWORD *)((char *)self + OBJC_IVAR___PKTrailingAccessoryLabel_contentInsets);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  _OWORD *v4 = *MEMORY[0x1E4FB2848];
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR___PKTrailingAccessoryLabel_registeredAccessories;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_19FADADD8(MEMORY[0x1E4FBC860]);
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKTrailingAccessoryLabel_maxAccessorySize);
  void *v8 = 0;
  v8[1] = 0;

  UIEdgeInsets result = (PKTrailingAccessoryLabel *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = self;
  double v5 = sub_19FAA60D4(1, 0.0, 0.0, width, 1.79769313e308);

  double v6 = width;
  double v7 = v5;
  result.height = v7;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  [(PKTrailingAccessoryLabel *)&v7 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  sub_19FAA60D4(0, v3, v4, v5, v6);
}

- (void)registerAccessoryWithView:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
}

- (void)registerAccessoryWithLayer:(id)a3 withSize:(CGSize)a4 for:(id)a5
{
}

- (void)unregisterAccessories
{
  id v2 = self;
  TrailingAccessoryLabel.unregisterAccessories()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end