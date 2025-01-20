@interface CatalogTipActivityTile
- (_TtC10FitnessApp22CatalogTipActivityTile)initWithCoder:(id)a3;
- (_TtC10FitnessApp22CatalogTipActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation CatalogTipActivityTile

- (_TtC10FitnessApp22CatalogTipActivityTile)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC10FitnessApp22CatalogTipActivityTile *)sub_10037F344(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp22CatalogTipActivityTile)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10038002C();
}

- (void)prepareForReuse
{
  uint64_t v3 = sub_1000AFA94(&qword_1009556A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for CatalogTipActivityTile();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(CatalogTipActivityTile *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for CatalogTipSectionItem();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_tipSectionItem;
  swift_beginAccess();
  sub_1002D57B0((uint64_t)v5, v9);
  swift_endAccess();
  dispatch thunk of CatalogTipPlainView.prepareForReuse()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_catalogTipView));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp22CatalogTipActivityTile_tipSectionItem;

  sub_10037FFCC((uint64_t)v3);
}

@end