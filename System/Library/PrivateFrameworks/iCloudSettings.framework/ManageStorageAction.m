@interface ManageStorageAction
- (BOOL)isDefault;
- (BOOL)isDestructive;
- (BOOL)isFamilyAction;
- (BOOL)isUpsellAction;
- (NSDictionary)actionParameters;
- (NSDictionary)buyParameters;
- (NSString)actionString;
- (NSString)actionURL;
- (NSString)title;
- (_TtC14iCloudSettings19ManageStorageAction)init;
- (_TtC14iCloudSettings25ManageStorageConfirmation)confirmation;
- (_TtC14iCloudSettings6Action)homeAction;
- (id)init:(id)a3;
- (int64_t)actionType;
- (void)setActionType:(int64_t)a3;
- (void)setActionURL:(id)a3;
@end

@implementation ManageStorageAction

- (BOOL)isDefault
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_isDefault);
}

- (BOOL)isDestructive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_isDestructive);
}

- (NSString)title
{
  return (NSString *)sub_2629FD268();
}

- (int64_t)actionType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType);
}

- (void)setActionType:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType) = (Class)a3;
}

- (NSString)actionString
{
  return (NSString *)sub_2629FD268();
}

- (NSString)actionURL
{
  return (NSString *)sub_2629FD268();
}

- (void)setActionURL:(id)a3
{
  uint64_t v4 = sub_262B04488();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionURL);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSDictionary)actionParameters
{
  return (NSDictionary *)sub_2629FC8E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionParameters);
}

- (NSDictionary)buyParameters
{
  return (NSDictionary *)sub_2629FC8E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_buyParameters);
}

- (_TtC14iCloudSettings25ManageStorageConfirmation)confirmation
{
  return (_TtC14iCloudSettings25ManageStorageConfirmation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_confirmation);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageAction.init(_:)(v3);
}

- (_TtC14iCloudSettings6Action)homeAction
{
  v2 = self;
  id v3 = sub_2629FCF28();

  return (_TtC14iCloudSettings6Action *)v3;
}

- (BOOL)isUpsellAction
{
  return (*(unint64_t *)((char *)&self->super.isa
                              + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
        - 114 < 0xE) & (0x20F1u >> (*((unsigned char *)&self->super.isa
                                    + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
                                  - 114));
}

- (BOOL)isFamilyAction
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_actionType)
       - 109 < 3;
}

- (_TtC14iCloudSettings19ManageStorageAction)init
{
  result = (_TtC14iCloudSettings19ManageStorageAction *)_swift_stdlib_reportUnimplementedInitializer();
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
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings19ManageStorageAction_confirmation);
}

@end