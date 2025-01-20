@interface MultiCornerGradientView
- (_TtC8AppStore23MultiCornerGradientView)initWithCoder:(id)a3;
- (_TtC8AppStore23MultiCornerGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MultiCornerGradientView

- (_TtC8AppStore23MultiCornerGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23MultiCornerGradientView *)sub_1000FE388(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23MultiCornerGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FF974();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FE658();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_baseGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_secondaryGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_secondaryGradientMaskView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore23MultiCornerGradientView_bottomRightOverlayView);
}

@end