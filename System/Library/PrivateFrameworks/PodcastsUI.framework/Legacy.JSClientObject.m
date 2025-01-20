@interface Legacy.JSClientObject
- (BOOL)isPersonalizationDisabled;
- (BOOL)isThinClient;
- (NSArray)displayKinds;
- (NSString)buildType;
- (NSString)deviceType;
- (NSString)guid;
- (NSString)storefrontIdentifier;
- (_TtCO10PodcastsUI6Legacy14JSClientObject)init;
- (id)analyticsIdentifiers;
- (id)getDefaultForKeyName:(id)a3;
- (void)setDefaultForKeyName:(id)a3 :(id)a4;
@end

@implementation Legacy.JSClientObject

- (BOOL)isPersonalizationDisabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtCO10PodcastsUI6Legacy14JSClientObject_isPersonalizationDisabled);
}

- (NSString)buildType
{
  v3 = self;
  v4 = self;
  objc_msgSend(v3, sel_isRunningOnInternalOS);

  v5 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSString)deviceType
{
  sub_1E3E76C00();
  v2 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSArray)displayKinds
{
  v2 = self;
  uint64_t v3 = sub_1E3E7A140();
  sub_1E3E76474(v3);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1E3E7D050();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (NSString)guid
{
  uint64_t v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_deviceGUID);
  sub_1E3E7CD30();

  v6 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (NSString)storefrontIdentifier
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCO10PodcastsUI6Legacy14JSClientObject_accountStore);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_ams_activeiTunesAccount);
  if (v4
    && (id v5 = v4, v6 = objc_msgSend(v4, sel_ams_storefront), v5, v6))
  {
    sub_1E3E7CD30();

    v7 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isThinClient
{
  return objc_msgSend(self, sel_supportsLocalLibrary) ^ 1;
}

- (id)analyticsIdentifiers
{
  sub_1E3C7F668(MEMORY[0x1E4FBC860]);
  v2 = (void *)sub_1E3E7CB50();
  swift_bridgeObjectRelease();

  return v2;
}

- (id)getDefaultForKeyName:(id)a3
{
  sub_1E3E7CD30();
  id v4 = self;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel__applePodcastsFoundationSharedUserDefaults);
  v7 = (void *)sub_1E3E7CCF0();
  id v8 = objc_msgSend(v6, sel_stringForKey_, v7);

  if (v8)
  {
    sub_1E3E7CD30();

    swift_bridgeObjectRelease();
    v9 = (void *)sub_1E3E7CCF0();
  }
  else
  {

    v9 = 0;
  }
  swift_bridgeObjectRelease();

  return v9;
}

- (void)setDefaultForKeyName:(id)a3 :(id)a4
{
  uint64_t v5 = sub_1E3E7CD30();
  uint64_t v7 = v6;
  sub_1E3E7CD30();
  id v8 = self;
  sub_1E3E76CBC(v5, v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCO10PodcastsUI6Legacy14JSClientObject)init
{
  result = (_TtCO10PodcastsUI6Legacy14JSClientObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end