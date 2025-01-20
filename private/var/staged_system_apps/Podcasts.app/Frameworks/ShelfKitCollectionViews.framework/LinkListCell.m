@interface LinkListCell
- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation LinkListCell

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(LinkListCell *)&v6 traitCollectionDidChange:v4];
  sub_246644();
  [v5 setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v2 = self;
  sub_247ED8();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_37D3B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37D380();
  v8 = self;
  sub_248370();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews12LinkListCell *)sub_248728(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews12LinkListCell *)sub_248890(a3);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_config;
  uint64_t v4 = sub_37D600();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_leadingSeparatorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_trailingSeparatorConstraint));

  swift_release();
}

@end