@interface UIKitImageView
- (CGSize)intrinsicContentSize;
- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithCoder:(id)a3;
- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithFrame:(CGRect)a3;
- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3;
- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation UIKitImageView

- (CGSize)intrinsicContentSize
{
  double v2 = sub_23535A64C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3
{
  id v4 = a3;
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_23535A658(a3);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_23535A6DC(a3, a4);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_23535A78C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView)initWithCoder:(id)a3
{
  return (_TtC14WorkflowUICoreP33_05C30733584E7BCE9234AF268964879814UIKitImageView *)sub_23535A818(a3);
}

@end