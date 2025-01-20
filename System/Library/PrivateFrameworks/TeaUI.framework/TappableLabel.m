@interface TappableLabel
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC5TeaUI13TappableLabel)initWithCoder:(id)a3;
- (_TtC5TeaUI13TappableLabel)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation TappableLabel

- (_TtC5TeaUI13TappableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI13TappableLabel *)TappableLabel.init(frame:)();
}

- (_TtC5TeaUI13TappableLabel)initWithCoder:(id)a3
{
  return (_TtC5TeaUI13TappableLabel *)TappableLabel.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return TappableLabel.accessibilityTraits.getter();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  TappableLabel.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B61B20C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_1B61B20F0();
  }
  uint64_t v4 = self;
  TappableLabel.accessibilityLabel.setter();
}

@end