@interface SearchBar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (NSArray)keyCommands;
- (_TtC8AppStore9SearchBar)initWithCoder:(id)a3;
- (_TtC8AppStore9SearchBar)initWithFrame:(CGRect)a3;
- (void)handleCancelKeyCommand;
- (void)layoutSubviews;
@end

@implementation SearchBar

- (_TtC8AppStore9SearchBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchBar();
  return -[SearchBar initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStore9SearchBar)initWithCoder:(id)a3
{
  result = (_TtC8AppStore9SearchBar *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  v3 = sub_100641DF0();

  if (v3)
  {
    sub_100084CF0(0, (unint64_t *)&qword_100989350);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleCancelKeyCommand
{
  NSArray v4 = self;
  id v2 = [(SearchBar *)v4 delegate];
  if (v2)
  {
    v3 = v2;
    if ([v2 respondsToSelector:"searchBarCancelButtonClicked:"]) {
      [v3 searchBarCancelButtonClicked:v4];
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchBar();
  id v2 = v3.receiver;
  [(SearchBar *)&v3 layoutSubviews];
  sub_10064209C();
}

@end