@interface DeprecatedText.StackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithCoder:(id)a3;
- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DeprecatedText.StackView

- (void)layoutSubviews
{
  v2 = self;
  sub_52A6C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  id v6 = [(DeprecatedText.StackView *)v5 traitCollection];
  sub_129F30();
  double v8 = v7;

  if (height <= 5.99231045e307) {
    double v9 = height;
  }
  else {
    double v9 = 5.99231045e307;
  }
  sub_538A4(v12, 0.0, 0.0, width, v9, v8);
  sub_5724C((uint64_t)v12);

  double v10 = v12[3];
  double v11 = v12[4];
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_s9StackViewCMa();
  id v4 = a3;
  id v5 = v7.receiver;
  [(DeprecatedText.StackView *)&v7 traitCollectionDidChange:v4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_19ED38);
  sub_12A1C0();
  id v6 = [v5 traitCollection];
  sub_129F30();

  if ((sub_127B20() & 1) == 0) {
    [v5 setNeedsLayout];
  }
}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithFrame:(CGRect)a3
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)sub_5526C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithCoder:(id)a3
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)sub_553B0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end