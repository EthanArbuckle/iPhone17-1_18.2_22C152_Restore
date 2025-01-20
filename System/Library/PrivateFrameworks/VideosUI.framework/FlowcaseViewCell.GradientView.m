@interface FlowcaseViewCell.GradientView
+ (Class)layerClass;
- (CAGradientLayer)layer;
- (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView)initWithCoder:(id)a3;
- (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView)initWithFrame:(CGRect)a3;
@end

@implementation FlowcaseViewCell.GradientView

+ (Class)layerClass
{
  sub_1E3131A3C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (CAGradientLayer)layer
{
  v2 = self;
  id v3 = sub_1E3229E34();

  return (CAGradientLayer *)v3;
}

- (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView *)sub_1E3229E7C();
}

- (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI16FlowcaseViewCellP33_FBAB717E7E30D69FDDD7D1B4C16BFCA712GradientView *)sub_1E3229EE8(a3);
}

@end