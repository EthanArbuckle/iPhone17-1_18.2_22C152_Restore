@interface NSPersistentStoreCoordinator
- (BOOL)bkspi_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5;
- (BOOL)hasStoreInCommonWith:(id)a3;
@end

@implementation NSPersistentStoreCoordinator

- (BOOL)bkspi_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5
{
  return [(NSPersistentStoreCoordinator *)self _destroyPersistentStoreAtURL:a3 withType:a4 options:0 error:a5];
}

- (BOOL)hasStoreInCommonWith:(id)a3
{
  id v4 = a3;
  v5 = [(NSPersistentStoreCoordinator *)self persistentStores];
  v6 = [v5 valueForKey:@"URL"];
  v7 = +[NSSet setWithArray:v6];

  v8 = [v4 persistentStores];

  v9 = [v8 valueForKey:@"URL"];
  v10 = +[NSSet setWithArray:v9];

  LOBYTE(v9) = [v7 intersectsSet:v10];
  return (char)v9;
}

@end