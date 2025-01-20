@interface FMContentUnavailableView
- (_TtC6FindMy24FMContentUnavailableView)initWithCoder:(id)a3;
- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3;
- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5;
- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6;
- (id)_buttonFont;
- (id)_titleFont;
- (void)_updateViewHierarchy;
@end

@implementation FMContentUnavailableView

- (id)_titleFont
{
  v3 = self;
  v4 = self;
  id v5 = [v3 preferredFontForTextStyle:UIFontTextStyleTitle2];
  v6 = (void *)sub_100042318(0x8000);

  v7 = (void *)sub_100042318(2);

  return v7;
}

- (id)_buttonFont
{
  v3 = self;
  v4 = self;
  id v5 = [v3 preferredFontForTextStyle:UIFontTextStyleBody];
  v6 = (void *)sub_100042318(0x8000);

  return v6;
}

- (void)_updateViewHierarchy
{
  v2 = self;
  sub_1001380B0();
}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  v12 = -[FMContentUnavailableView initWithFrame:title:style:](&v14, "initWithFrame:title:style:", v11, a5, x, y, width, height);

  if (v12) {
  return v12;
  }
}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  objc_super v14 = -[FMContentUnavailableView initWithFrame:title:style:includeBackdrop:](&v16, "initWithFrame:title:style:includeBackdrop:", v13, a5, v6, x, y, width, height);

  if (v14) {
  return v14;
  }
}

- (_TtC6FindMy24FMContentUnavailableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  return -[FMContentUnavailableView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy24FMContentUnavailableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMContentUnavailableView();
  return [(FMContentUnavailableView *)&v5 initWithCoder:a3];
}

@end