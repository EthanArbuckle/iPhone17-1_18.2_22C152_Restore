@interface SCMLPersonAttributes
- (BOOL)hasAge;
- (BOOL)hasEthnicity;
- (BOOL)hasGender;
- (BOOL)hasImplicitCategoryRequiringPersonalization;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)specific;
- (NSArray)age;
- (NSArray)ethnicity;
- (NSArray)gender;
- (_TtC26SensitiveContentAnalysisML20SCMLPersonAttributes)init;
- (void)setAge:(id)a3;
- (void)setEthnicity:(id)a3;
- (void)setGender:(id)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasEthnicity:(BOOL)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setHasImplicitCategoryRequiringPersonalization:(BOOL)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setSpecific:(BOOL)a3;
@end

@implementation SCMLPersonAttributes

- (BOOL)specific
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_specific;
  swift_beginAccess();
  return *v2;
}

- (void)setSpecific:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_specific;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isGroup
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_isGroup;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGroup:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_isGroup;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasAge
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasAge;
  swift_beginAccess();
  return *v2;
}

- (void)setHasAge:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasAge;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasGender
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasGender;
  swift_beginAccess();
  return *v2;
}

- (void)setHasGender:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasGender;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)hasEthnicity
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasEthnicity;
  swift_beginAccess();
  return *v2;
}

- (void)setHasEthnicity:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasEthnicity;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSArray)age
{
  return (NSArray *)sub_25BF9C2EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_age);
}

- (void)setAge:(id)a3
{
}

- (NSArray)gender
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_gender);
  swift_beginAccess();
  if (*v2)
  {
    type metadata accessor for SCMLPeopleDetectionAttribute();
    swift_bridgeObjectRetain();
    v3 = (void *)sub_25BFF04B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setGender:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for SCMLPeopleDetectionAttribute();
    uint64_t v3 = sub_25BFF04C0();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_gender);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)ethnicity
{
  return (NSArray *)sub_25BF9C2EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_ethnicity);
}

- (void)setEthnicity:(id)a3
{
}

- (BOOL)hasImplicitCategoryRequiringPersonalization
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasImplicitCategoryRequiringPersonalization;
  swift_beginAccess();
  return *v2;
}

- (void)setHasImplicitCategoryRequiringPersonalization:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC26SensitiveContentAnalysisML20SCMLPersonAttributes_hasImplicitCategoryRequiringPersonalization;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25BF9D414(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25BF9CEB0);
}

- (_TtC26SensitiveContentAnalysisML20SCMLPersonAttributes)init
{
  result = (_TtC26SensitiveContentAnalysisML20SCMLPersonAttributes *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end