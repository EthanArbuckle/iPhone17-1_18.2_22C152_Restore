@interface PaletteContainerView
- (NSArray)interactions;
- (_TtC5Books20PaletteContainerView)initWithCoder:(id)a3;
- (_TtC5Books20PaletteContainerView)initWithFrame:(CGRect)a3;
- (void)addInteraction:(id)a3;
- (void)layoutSubviews;
- (void)removeInteraction:(id)a3;
- (void)setInteractions:(id)a3;
@end

@implementation PaletteContainerView

- (_TtC5Books20PaletteContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002AF2E8();
}

- (void)addInteraction:(id)a3
{
}

- (void)removeInteraction:(id)a3
{
}

- (NSArray)interactions
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView);
  id v3 = self;
  id v4 = [v2 interactions];
  sub_100058D18((uint64_t *)&unk_100B2C6D0);
  sub_1007FDFF0();

  v5.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (void)setInteractions:(id)a3
{
  sub_100058D18((uint64_t *)&unk_100B2C6D0);
  sub_1007FDFF0();
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books20PaletteContainerView_containerView);
  NSArray v5 = self;
  Class isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();
  [v4 setInteractions:isa];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002AE558();
}

- (_TtC5Books20PaletteContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Books20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books20PaletteContainerView____lazy_storage___separator);
}

@end