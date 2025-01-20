@interface PKIdentityDataReleaseConfiguration
- (NSSet)recognizedElements;
- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)init;
- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 relyingPartyName:(id)a5 relyingPartyLogo:(CGImage *)a6;
@end

@implementation PKIdentityDataReleaseConfiguration

- (NSSet)recognizedElements
{
  v2 = self;
  PKIdentityDataReleaseConfiguration.recognizedElements.getter();

  sub_19FAE87CC();
  sub_19FAE897C(&qword_1E94B14E8, (void (*)(uint64_t))sub_19FAE87CC);
  v3 = (void *)sub_1A03B4EF8();
  swift_bridgeObjectRelease();

  return (NSSet *)v3;
}

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 relyingPartyName:(id)a5 relyingPartyLogo:(CGImage *)a6
{
  uint64_t v8 = sub_1A03B4988();
  uint64_t v10 = v9;
  sub_19FAE87CC();
  sub_19FAE897C(&qword_1E94B14E8, (void (*)(uint64_t))sub_19FAE87CC);
  uint64_t v11 = sub_1A03B4F08();
  if (a5)
  {
    a5 = (id)sub_1A03B4988();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = a6;
  return (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)PKIdentityDataReleaseConfiguration.init(documentType:elements:relyingPartyName:relyingPartyLogo:)(v8, v10, v11, (uint64_t)a5, v13, a6);
}

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)init
{
  result = (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI34PKIdentityDataReleaseConfiguration_elementCategoryGroups;
  uint64_t v4 = sub_1A03B1218();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_19F48B93C((uint64_t)self + OBJC_IVAR____TtC9PassKitUI34PKIdentityDataReleaseConfiguration_relyingParty, &qword_1E94B14A0);
}

@end