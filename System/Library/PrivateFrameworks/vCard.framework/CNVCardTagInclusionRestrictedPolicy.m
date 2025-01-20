@interface CNVCardTagInclusionRestrictedPolicy
- (BOOL)shouldCaptureUnknownTags;
- (BOOL)shouldParseTag:(id)a3;
- (_TtC5vCard35CNVCardTagInclusionRestrictedPolicy)init;
- (void)setShouldCaptureUnknownTags:(BOOL)a3;
@end

@implementation CNVCardTagInclusionRestrictedPolicy

- (BOOL)shouldParseTag:(id)a3
{
  uint64_t v5 = sub_1DC1B4908();
  uint64_t v6 = v4;
  if (v5 == 0x4E4F4953524556 && v4 == 0xE700000000000000 || (sub_1DC1B4988() & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_tags);
    v9 = self;
    char v7 = sub_1DC1B3328(v5, v6, v8);
  }
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)shouldCaptureUnknownTags
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags);
}

- (void)setShouldCaptureUnknownTags:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5vCard35CNVCardTagInclusionRestrictedPolicy_shouldCaptureUnknownTags) = a3;
}

- (_TtC5vCard35CNVCardTagInclusionRestrictedPolicy)init
{
  result = (_TtC5vCard35CNVCardTagInclusionRestrictedPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end