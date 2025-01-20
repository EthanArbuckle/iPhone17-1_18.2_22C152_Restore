@interface MicaView
- (_TtC5TeaUI8MicaView)initWithCoder:(id)a3;
- (_TtC5TeaUI8MicaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MicaView

- (void)layoutSubviews
{
  v2 = self;
  MicaView.layoutSubviews()();
}

- (_TtC5TeaUI8MicaView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI8MicaView *)MicaView.init(frame:)();
}

- (_TtC5TeaUI8MicaView)initWithCoder:(id)a3
{
  return (_TtC5TeaUI8MicaView *)MicaView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI8MicaView_onScreenClosure));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI8MicaView_packageLayer);
}

@end