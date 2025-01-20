@interface CollectionTableViewCell
- (_TtC8AppStore23CollectionTableViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore23CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CollectionTableViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  id v2 = v3.receiver;
  [(CollectionTableViewCell *)&v3 prepareForReuse];
  [v2 setSelectionStyle:0];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  id v2 = (char *)v14.receiver;
  [(CollectionTableViewCell *)&v14 layoutSubviews];
  objc_super v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView];
  if (v3)
  {
    v4 = v3;
    id v5 = [v2 contentView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v4 setFrame:v7, v9, v11, v13];
    id v2 = v4;
  }
}

- (_TtC8AppStore23CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8AppStore23CollectionTableViewCell *)sub_100385D88(a3, (uint64_t)a4, v6);
}

- (_TtC8AppStore23CollectionTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_dataSource) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionTableViewCell();
  return [(CollectionTableViewCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore23CollectionTableViewCell_collectionView);
}

@end