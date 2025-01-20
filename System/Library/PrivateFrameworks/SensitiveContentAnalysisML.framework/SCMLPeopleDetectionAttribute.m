@interface SCMLPeopleDetectionAttribute
- (BOOL)isEqual:(id)a3;
- (NSString)term;
- (_TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute)init;
- (unsigned)gender;
- (void)setGender:(unsigned int)a3;
- (void)setTerm:(id)a3;
@end

@implementation SCMLPeopleDetectionAttribute

- (NSString)term
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25BFF0370();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTerm:(id)a3
{
  uint64_t v4 = sub_25BFF0380();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_term);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (unsigned)gender
{
  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_gender);
  swift_beginAccess();
  return *v2;
}

- (void)setGender:(unsigned int)a3
{
  uint64_t v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute_gender);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25BF9D414(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25BF9B180);
}

- (_TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute)init
{
  result = (_TtC26SensitiveContentAnalysisML28SCMLPeopleDetectionAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end