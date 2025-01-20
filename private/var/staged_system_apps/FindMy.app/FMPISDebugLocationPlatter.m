@interface FMPISDebugLocationPlatter
- (_TtC6FindMy25FMPISDebugLocationPlatter)initWithCoder:(id)a3;
- (void)fidelitySegmentChanged;
- (void)handleAction;
- (void)setupSubviews;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation FMPISDebugLocationPlatter

- (_TtC6FindMy25FMPISDebugLocationPlatter)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005120BC();
}

- (void)setupSubviews
{
  v2 = self;
  sub_100511188();
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100511828();
}

- (void)fidelitySegmentChanged
{
  v2 = self;
  sub_100511488();
}

- (void)handleAction
{
  v2 = self;
  sub_100511728();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPISDebugLocationPlatter_locationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMPISDebugLocationPlatter_fidelitySegment));

  swift_bridgeObjectRelease();
}

@end