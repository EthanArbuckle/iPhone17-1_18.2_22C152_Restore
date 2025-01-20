@interface BMBasePropertyConfiguration
- (BMBasePropertyConfiguration)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBeSynced;
- (NSString)eventName;
- (NSString)identifier;
- (int64_t)ageToExpire;
- (int64_t)countLimit;
- (int64_t)recordType;
@end

@implementation BMBasePropertyConfiguration

- (NSString)eventName
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_380A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)recordType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_recordType);
}

- (int64_t)ageToExpire
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_ageToExpire);
}

- (int64_t)countLimit
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_countLimit);
}

- (NSString)identifier
{
  if (*(void *)&self->eventName[OBJC_IVAR___BMBasePropertyConfiguration_identifier])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_380A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (BOOL)shouldBeSynced
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BMBasePropertyConfiguration_shouldBeSynced);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_38440();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_5398((uint64_t)v8);

  sub_55AC((uint64_t)v8);
  return v6 & 1;
}

- (BMBasePropertyConfiguration)init
{
  result = (BMBasePropertyConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end