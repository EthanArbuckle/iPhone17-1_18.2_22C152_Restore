@interface SearchIndexPersistence.ManagedObject
- (_TtCC17IMAPSearchIndexer22SearchIndexPersistence13ManagedObject)initWithContext:(id)a3;
- (_TtCC17IMAPSearchIndexer22SearchIndexPersistence13ManagedObject)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation SearchIndexPersistence.ManagedObject

- (_TtCC17IMAPSearchIndexer22SearchIndexPersistence13ManagedObject)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_s14descr1006B9AE9V13ManagedObjectCMa();
  return [(SearchIndexPersistence.ManagedObject *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (_TtCC17IMAPSearchIndexer22SearchIndexPersistence13ManagedObject)initWithContext:(id)a3
{
  id v3 = a3;
  v4 = (_TtCC17IMAPSearchIndexer22SearchIndexPersistence13ManagedObject *)sub_10057DB20(v3);

  return v4;
}

@end