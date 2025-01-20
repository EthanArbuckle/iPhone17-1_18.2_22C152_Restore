@interface PLQuestion
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4;
- (void)delete;
@end

@implementation PLQuestion

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4
{
  id v6 = a4;
  v7 = [a3 managedObjectContext];
  v8 = [a1 entityName];
  v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  if (v9) {
    [v9 setUuid:v6];
  }

  return v9;
}

+ (id)entityName
{
  return @"Question";
}

- (void)delete
{
  id v3 = [(PLQuestion *)self managedObjectContext];
  [v3 deleteObject:self];
}

@end