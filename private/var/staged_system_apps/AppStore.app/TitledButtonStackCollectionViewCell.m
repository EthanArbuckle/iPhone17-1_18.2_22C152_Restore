@interface TitledButtonStackCollectionViewCell
- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TitledButtonStackCollectionViewCell

- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35TitledButtonStackCollectionViewCell *)sub_100757880(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35TitledButtonStackCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = sub_100082C28(&qword_1009A9818);
  __chkstk_darwin(v5);
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_itemLayoutContext;
  uint64_t v7 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_lineBreaks;
  uint64_t v9 = sub_100082C28(&qword_100985B88);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_buttons) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for RoundedTitledButton();
  id v10 = a3;
  ViewRecycler.init()();
  sub_100758EFC();
  ReusePool.init(recycler:limit:)();

  result = (_TtC8AppStore35TitledButtonStackCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1007587BC();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitledButtonStackCollectionViewCell();
  id v2 = v3.receiver;
  [(TitledButtonStackCollectionViewCell *)&v3 prepareForReuse];
  sub_100757C74();
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_lineBreaks, &qword_100985B78);
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8AppStore35TitledButtonStackCollectionViewCell_reusePool;
  uint64_t v4 = sub_100082C28(&qword_1009A9838);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end