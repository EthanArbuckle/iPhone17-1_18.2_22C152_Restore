@interface BrowseCategoryTableViewCell
+ (NSString)identifier;
- (NSString)uniqueIdentifier;
- (_TtC4Maps27BrowseCategoryTableViewCell)initWithCoder:(id)a3;
- (_TtC4Maps27BrowseCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setThumbnailImage:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)updateContents:(id)a3 uniqueID:(id)a4;
@end

@implementation BrowseCategoryTableViewCell

- (NSString)uniqueIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setUniqueIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

+ (NSString)identifier
{
  swift_getObjCClassMetadata();
  sub_1000FF33C(qword_1015CE640);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC4Maps27BrowseCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC4Maps27BrowseCategoryTableViewCell *)sub_100123F7C(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps27BrowseCategoryTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100124A8C();
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BrowseCategoryTableViewCell();
  id v2 = v6.receiver;
  [(BrowseCategoryTableViewCell *)&v6 prepareForReuse];
  id v3 = sub_100123E88();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setText:v4];

  id v5 = sub_100123DBC();
  [v5 setImage:0];
}

- (void)updateContents:(id)a3 uniqueID:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  v8 = self;
  id v9 = sub_100123E88();
  NSString v10 = String._bridgeToObjectiveC()();
  [v9 setText:v10];

  v11 = (uint64_t *)((char *)v8 + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell_uniqueIdentifier);
  uint64_t *v11 = v5;
  v11[1] = v7;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setThumbnailImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100123DBC();
  [v6 setImage:v4];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell____lazy_storage___cellImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27BrowseCategoryTableViewCell____lazy_storage___cellTitleLabel);
}

@end