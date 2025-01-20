@interface RDImageDeduplicationActivityObjC
+ (NSString)SentinelFileName;
- (id)init;
@end

@implementation RDImageDeduplicationActivityObjC

+ (NSString)SentinelFileName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (id)init
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return [super init];
}

@end