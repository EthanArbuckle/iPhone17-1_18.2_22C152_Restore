@interface FMAccessoryDiscoverySearchingCell
- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithCoder:(id)a3;
- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FMAccessoryDiscoverySearchingCell

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator;
  id v9 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];

  if (v7)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for FMAccessoryDiscoverySearchingCell();
  v12 = [(FMAccessoryDiscoverySearchingCell *)&v14 initWithStyle:a3 reuseIdentifier:v11];

  return v12;
}

- (_TtC6FindMy33FMAccessoryDiscoverySearchingCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator;
  id v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy33FMAccessoryDiscoverySearchingCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  Class isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  v10 = (objc_class *)type metadata accessor for FMAccessoryDiscoverySearchingCell();
  v11.receiver = v8;
  v11.super_class = v10;
  [(FMAccessoryDiscoverySearchingCell *)&v11 _bridgedUpdateConfigurationUsingState:isa];

  sub_10013B5FC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMAccessoryDiscoverySearchingCell_activityIndicator));
}

@end