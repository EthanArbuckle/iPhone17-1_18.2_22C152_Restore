@interface Legacy.JSUserObject
- (NSString)accountIdentifier;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (_TtCO10PodcastsUI6Legacy12JSUserObject)init;
@end

@implementation Legacy.JSUserObject

- (NSString)accountIdentifier
{
  return (NSString *)sub_1E3D1C67C(self, (uint64_t)a2, (SEL *)&selRef_username);
}

- (NSString)dsid
{
  v2 = self;
  sub_1E3D1C59C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)firstName
{
  return (NSString *)sub_1E3D1C67C(self, (uint64_t)a2, (SEL *)&selRef_ams_firstName);
}

- (NSString)lastName
{
  return (NSString *)sub_1E3D1C67C(self, (uint64_t)a2, (SEL *)&selRef_ams_lastName);
}

- (_TtCO10PodcastsUI6Legacy12JSUserObject)init
{
  result = (_TtCO10PodcastsUI6Legacy12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end