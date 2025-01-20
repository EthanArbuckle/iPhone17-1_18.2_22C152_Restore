@interface Action
- (BOOL)isDefault;
- (BOOL)isDestructive;
- (BOOL)isUpsellAction;
- (NSDictionary)actionParameters;
- (NSDictionary)buyParameters;
- (NSString)description;
- (NSString)title;
- (NSString)type;
- (NSString)urlString;
- (_TtC14iCloudSettings18ActionConfirmation)actionConfirmation;
- (_TtC14iCloudSettings6Action)init;
- (id)init:(id)a3;
@end

@implementation Action

- (NSString)type
{
  return (NSString *)sub_2629FD268();
}

- (NSString)title
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_title);
}

- (NSString)urlString
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_urlString);
}

- (NSDictionary)actionParameters
{
  return (NSDictionary *)sub_262AD9424((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_actionParameters);
}

- (NSDictionary)buyParameters
{
  return (NSDictionary *)sub_262AD9424((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings6Action_buyParameters);
}

- (_TtC14iCloudSettings18ActionConfirmation)actionConfirmation
{
  return (_TtC14iCloudSettings18ActionConfirmation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC14iCloudSettings6Action_actionConfirmation));
}

- (BOOL)isDefault
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_isDefault);
}

- (BOOL)isDestructive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_isDestructive);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return Action.init(_:)(v3);
}

- (NSString)description
{
  v2 = self;
  sub_262AD6300();

  uint64_t v3 = (void *)sub_262B04448();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isUpsellAction
{
  v2 = self;
  uint64_t v3 = (void *)sub_262B04448();
  uint64_t v4 = _ICQActionForString();

  return ((unint64_t)(v4 - 114) < 0xE) & (0x20F1u >> (v4 - 114));
}

- (_TtC14iCloudSettings6Action)init
{
  result = (_TtC14iCloudSettings6Action *)_swift_stdlib_reportUnimplementedInitializer();
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
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings6Action_actionConfirmation);
}

@end