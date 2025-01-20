@interface AttributionTextViewUIKit
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI24AttributionTextViewUIKit)init;
- (_TtC8VideosUI24AttributionTextViewUIKit)initWithCoder:(id)a3;
- (_TtC8VideosUI24AttributionTextViewUIKit)initWithFrame:(CGRect)a3;
- (void)handleSelected:(id)a3;
- (void)layoutSubviews;
@end

@implementation AttributionTextViewUIKit

- (void)handleSelected:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3661048(v4);
}

- (_TtC8VideosUI24AttributionTextViewUIKit)init
{
  return (_TtC8VideosUI24AttributionTextViewUIKit *)sub_1E36611E8();
}

- (_TtC8VideosUI24AttributionTextViewUIKit)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3661284();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = self;
  double v5 = sub_1E3661340(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E36613E8();
}

- (_TtC8VideosUI24AttributionTextViewUIKit)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end