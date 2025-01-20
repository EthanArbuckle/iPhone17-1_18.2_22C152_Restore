@interface ManageStorageTip
- (BOOL)containsFamilyAction;
- (BOOL)containsUpsellAction;
- (NSArray)actions;
- (NSString)anchor;
- (NSString)dismissURL;
- (NSString)identifier;
- (NSString)sfSymbol;
- (NSString)sfSymbolColor;
- (NSString)subTitle;
- (NSString)title;
- (_TtC14iCloudSettings16ManageStorageTip)init;
- (id)init:(id)a3;
@end

@implementation ManageStorageTip

- (NSString)identifier
{
  return (NSString *)sub_2629FD268();
}

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subTitle
{
  return (NSString *)sub_2629FD268();
}

- (NSString)dismissURL
{
  return (NSString *)sub_2629FD268();
}

- (NSString)anchor
{
  return (NSString *)sub_2629FD268();
}

- (NSString)sfSymbol
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_sfSymbol);
}

- (NSString)sfSymbolColor
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_sfSymbolColor);
}

- (NSArray)actions
{
  return (NSArray *)sub_2629FD2E4((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC14iCloudSettings16ManageStorageTip_actions, (void (*)(void))type metadata accessor for ManageStorageAction);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageTip.init(_:)(v3);
}

- (BOOL)containsUpsellAction
{
  v2 = self;
  char v3 = sub_2629FC354();

  return v3 & 1;
}

- (BOOL)containsFamilyAction
{
  v2 = self;
  char v3 = sub_2629FC50C();

  return v3 & 1;
}

- (_TtC14iCloudSettings16ManageStorageTip)init
{
  result = (_TtC14iCloudSettings16ManageStorageTip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end