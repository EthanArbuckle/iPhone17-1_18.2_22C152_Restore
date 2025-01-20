@interface AllRefinementsMultiSelectElementCell
+ (NSString)reuseIdentifier;
- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithCoder:(id)a3;
- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setDisplayName:(id)a3 isSelected:(BOOL)a4 labelWidth:(double)a5 maxWidth:(double)a6 allowSelection:(id)a7 tapHandler:(id)a8;
@end

@implementation AllRefinementsMultiSelectElementCell

+ (NSString)reuseIdentifier
{
  swift_getObjCClassMetadata();
  sub_1000FF33C(&qword_1015D4298);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setDisplayName:(id)a3 isSelected:(BOOL)a4 labelWidth:(double)a5 maxWidth:(double)a6 allowSelection:(id)a7 tapHandler:(id)a8
{
  BOOL v11 = a4;
  v13 = _Block_copy(a7);
  v14 = _Block_copy(a8);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v13;
  if (v14)
  {
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v14;
    v14 = sub_100135AFC;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v20 = self;
  sub_1001D3428(v15, v17, a5, a6, v11, (uint64_t)sub_1001D3ECC, v18, (uint64_t)v14, v19);
  sub_10006C5D8((uint64_t)v14);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1001D37F4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps36AllRefinementsMultiSelectElementCell_viewModel) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AllRefinementsMultiSelectElementCell();
  return -[AllRefinementsMultiSelectElementCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps36AllRefinementsMultiSelectElementCell_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AllRefinementsMultiSelectElementCell();
  return [(AllRefinementsMultiSelectElementCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end