@interface TabOverview.ItemView
- (_TtCC12MobileSafari11TabOverview8ItemView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabOverview8ItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TabOverview.ItemView

- (_TtCC12MobileSafari11TabOverview8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview8ItemView *)sub_18C5431A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabOverview8ItemView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC12MobileSafari11TabOverview8ItemView_closeHandler);
  void *v4 = CGRectMake;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC12MobileSafari11TabOverview8ItemView_unpinHandler);
  void *v5 = CGRectMake;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TabOverview.ItemView();
  return [(SFFluidTabOverviewReusableView *)&v7 initWithCoder:a3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabOverview.ItemView();
  id v2 = v3.receiver;
  [(TabOverview.ItemView *)&v3 layoutSubviews];
  sub_18C5436B8();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end