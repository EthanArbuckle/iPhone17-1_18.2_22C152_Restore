@interface APPCAppStoreSupplementalContext
- (APPCAppStoreSupplementalContext)init;
- (NSDate)requestTime;
- (NSDictionary)additionalClickCaps;
- (NSDictionary)additionalImpressionCaps;
- (NSDictionary)appMetadataFields;
- (NSDictionary)clickCap;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)impressionCap;
- (NSString)adamId;
- (NSString)storeFront;
- (NSString)storeFrontLocale;
- (id)copyWithZone:(void *)a3;
- (void)setAdamId:(id)a3;
- (void)setAdditionalClickCaps:(id)a3;
- (void)setAdditionalImpressionCaps:(id)a3;
- (void)setAppMetadataFields:(id)a3;
- (void)setClickCap:(id)a3;
- (void)setImpressionCap:(id)a3;
- (void)setRequestTime:(id)a3;
@end

@implementation APPCAppStoreSupplementalContext

- (NSString)storeFront
{
  return (NSString *)sub_1B5C248F8();
}

- (NSString)storeFrontLocale
{
  return (NSString *)sub_1B5C248F8();
}

- (NSDictionary)impressionCap
{
  return (NSDictionary *)sub_1B5C653BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCAppStoreSupplementalContext_impressionCap);
}

- (void)setImpressionCap:(id)a3
{
}

- (NSDictionary)clickCap
{
  return (NSDictionary *)sub_1B5C653BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCAppStoreSupplementalContext_clickCap);
}

- (void)setClickCap:(id)a3
{
}

- (NSDictionary)additionalImpressionCaps
{
  return (NSDictionary *)sub_1B5C65534();
}

- (void)setAdditionalImpressionCaps:(id)a3
{
}

- (NSDictionary)additionalClickCaps
{
  return (NSDictionary *)sub_1B5C65534();
}

- (void)setAdditionalClickCaps:(id)a3
{
}

- (NSString)adamId
{
  v2 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_adamId;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1B5CB33B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAdamId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1B5CB33C0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_adamId);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)appMetadataFields
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCAppStoreSupplementalContext_appMetadataFields);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1B5CB3310();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setAppMetadataFields:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1B5CB3320();
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_appMetadataFields);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDate)requestTime
{
  uint64_t v3 = sub_1B5BFE044((uint64_t *)&unk_1EB851B10);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_requestTime;
  swift_beginAccess();
  sub_1B5C18F6C((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_1B5CB3090();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B5CB3040();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setRequestTime:(id)a3
{
  uint64_t v5 = sub_1B5BFE044((uint64_t *)&unk_1EB851B10);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B5CB3060();
    uint64_t v8 = sub_1B5CB3090();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1B5CB3090();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___APPCAppStoreSupplementalContext_requestTime;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1B5BFDFDC((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = self;
  sub_1B5C65D60();

  sub_1B5BFE044(&qword_1EB851640);
  uint64_t v3 = (void *)sub_1B5CB3310();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1B5C664B4(v6);

  sub_1B5BF6B08(v6, v6[3]);
  uint64_t v4 = (void *)sub_1B5CB3CB0();
  sub_1B5BF6B4C((uint64_t)v6);
  return v4;
}

- (APPCAppStoreSupplementalContext)init
{
}

- (void).cxx_destruct
{
}

@end