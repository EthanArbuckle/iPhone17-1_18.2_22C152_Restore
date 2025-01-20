@interface DOCItemStatusView
- (UIColor)tintColor;
- (_TtC5Files17DOCItemStatusView)initWithCoder:(id)a3;
- (_TtC5Files17DOCItemStatusView)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation DOCItemStatusView

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemStatusView();
  v2 = [(DOCItemStatusView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemStatusView();
  [(DOCItemStatusView *)&v4 setTintColor:a3];
}

- (_TtC5Files17DOCItemStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files17DOCItemStatusView *)sub_1004A2968(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files17DOCItemStatusView)initWithCoder:(id)a3
{
  return (_TtC5Files17DOCItemStatusView *)sub_1004A2B14(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_statusImageFontStyle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_progressCompletedColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_progressBackgroundRingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView____lazy_storage___statusButton));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files17DOCItemStatusView_observedProgress);
}

@end