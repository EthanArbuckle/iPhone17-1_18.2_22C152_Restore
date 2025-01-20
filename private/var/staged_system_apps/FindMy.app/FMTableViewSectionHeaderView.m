@interface FMTableViewSectionHeaderView
- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FMTableViewSectionHeaderView

- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView;
  id v7 = objc_allocWithZone((Class)UIView);
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)[v7 init];

  if (v5)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for FMTableViewSectionHeaderView();
  v10 = [(FMTableViewSectionHeaderView *)&v12 initWithReuseIdentifier:v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView));
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UIViewConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIViewConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  Class isa = UIViewConfigurationState._bridgeToObjectiveC()().super.isa;
  v10 = (objc_class *)type metadata accessor for FMTableViewSectionHeaderView();
  v11.receiver = v8;
  v11.super_class = v10;
  [(FMTableViewSectionHeaderView *)&v11 _bridgedUpdateConfigurationUsingState:isa];

  sub_100413C30();
  [*(id *)((char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView) setHidden:UIViewConfigurationState.isPinned.getter() & 1];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMTableViewSectionHeaderView();
  NSString v9 = [(FMTableViewSectionHeaderView *)&v11 initWithCoder:v7];

  return v9;
}

@end