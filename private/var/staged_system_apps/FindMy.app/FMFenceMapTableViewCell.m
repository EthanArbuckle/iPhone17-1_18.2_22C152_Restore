@interface FMFenceMapTableViewCell
- (_TtC6FindMy23FMFenceMapTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy23FMFenceMapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation FMFenceMapTableViewCell

- (void)prepareForReuse
{
  v2 = self;
  sub_1003D913C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003D9274();
}

- (_TtC6FindMy23FMFenceMapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMFenceMapTableViewCell();
  v7 = [(FMFenceMapTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC6FindMy23FMFenceMapTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFenceMapTableViewCell();
  return [(FMFenceMapTableViewCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMFenceMapTableViewCell_record));
}

@end