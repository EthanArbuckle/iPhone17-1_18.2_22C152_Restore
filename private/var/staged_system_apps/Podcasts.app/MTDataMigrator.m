@interface MTDataMigrator
+ (BOOL)requiresMigration;
- (MTDataMigrator)init;
@end

@implementation MTDataMigrator

+ (BOOL)requiresMigration
{
  if (qword_1005F5B00 != -1) {
    swift_once();
  }
  uint64_t v2 = swift_bridgeObjectRetain();
  char v3 = sub_100007230(v2);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (MTDataMigrator)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MTDataMigrator *)&v3 init];
}

@end