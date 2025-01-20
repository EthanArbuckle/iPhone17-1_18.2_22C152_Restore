@interface BannerDebugViewController
- (_TtC17proximitycontrold25BannerDebugViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation BannerDebugViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000E9408();
}

- (_TtC17proximitycontrold25BannerDebugViewController)initWithCoder:(id)a3
{
  *(void *)&self->super.requestID[OBJC_IVAR____TtC17proximitycontrold25BannerDebugViewController_debugDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17proximitycontrold25BannerDebugViewController____lazy_storage___debugView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BannerDebugViewController();
  return [(BannerViewControllerBase *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100024144((uint64_t)self + OBJC_IVAR____TtC17proximitycontrold25BannerDebugViewController_debugDelegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17proximitycontrold25BannerDebugViewController____lazy_storage___debugView);
}

@end