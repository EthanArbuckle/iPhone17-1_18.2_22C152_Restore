@interface HighlightsTitleView
- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithCoder:(id)a3;
- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithFrame:(CGRect)a3;
- (void)_updateTextAttributes;
- (void)providedStylesDidChangeForProvider:(id)a3;
@end

@implementation HighlightsTitleView

- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC22UserNotificationsUIKit19HighlightsTitleView *)sub_1D7D2961C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22UserNotificationsUIKit19HighlightsTitleView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_image) = 0;
  id v4 = a3;

  result = (_TtC22UserNotificationsUIKit19HighlightsTitleView *)sub_1D7D7FBD0();
  __break(1u);
  return result;
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
  if (a3)
  {
    id v4 = self;
    id v5 = a3;
    id v6 = objc_msgSend(v5, sel__visualStylingForStyle_, 0);
    objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_label), sel_mt_applyVisualStyling_, v6);
    objc_msgSend(*(id *)((char *)&v4->super.super.super.super.isa+ OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageView), sel_mt_applyVisualStyling_, v6);
  }
  else
  {
    __break(1u);
  }
}

- (void)_updateTextAttributes
{
  v2 = self;
  sub_1D7D29FC8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_imageWidthConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22UserNotificationsUIKit19HighlightsTitleView_image);
}

@end