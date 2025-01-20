@interface SearchIndexPersistence.Message
- (id)initWithEntity:(uint64_t)a3 insertIntoManagedObjectContext:(uint64_t)a4;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation SearchIndexPersistence.Message

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v4 = sub_1005E1C00();
  uint64_t v6 = v5;
  v7 = self;
  sub_10057A6B8(v4, v6);

  swift_bridgeObjectRelease();
}

- (id)initWithEntity:(uint64_t)a3 insertIntoManagedObjectContext:(uint64_t)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a3, a4);
}

@end