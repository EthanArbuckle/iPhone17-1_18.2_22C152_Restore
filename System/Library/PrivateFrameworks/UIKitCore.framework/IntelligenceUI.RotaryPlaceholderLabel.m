@interface IntelligenceUI.RotaryPlaceholderLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithCoder:(id)a3;
- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IntelligenceUI.RotaryPlaceholderLabel

- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithFrame:(CGRect)a3
{
  return (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *)IntelligenceUI.RotaryPlaceholderLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel)initWithCoder:(id)a3
{
  return (_TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel *)IntelligenceUI.RotaryPlaceholderLabel.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCO5UIKit14IntelligenceUI22RotaryPlaceholderLabel__attributedText;
  uint64_t v4 = sub_186A1D36C();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  swift_retain();
  CGFloat v3 = sub_185A92F28();
  double v5 = v4;

  swift_release();
  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(IntelligenceUI.RotaryPlaceholderLabel *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  IntelligenceUI.RotaryPlaceholderLabel.layoutSubviews()();
}

@end