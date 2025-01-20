@interface MOPhotoTraitMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
- (id)clonedObjectWithContext:(id)a3;
@end

@implementation MOPhotoTraitMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOPhotoTraitMO"];
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOPhotoTraitMO alloc] initWithContext:v5];

  v8 = [v6 identifier];
  [(MOPhotoTraitMO *)v7 setIdentifier:v8];

  v9 = [v6 name];
  [(MOPhotoTraitMO *)v7 setName:v9];

  v10 = [v6 relevantAssetUUIDs];

  [(MOPhotoTraitMO *)v7 setRelevantAssetUUIDs:v10];

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[MOPhotoTrait alloc] initWithPhotoTraitMO:self];
  id v6 = +[MOPhotoTraitMO managedObjectWithObject:v5 inManagedObjectContext:v4];

  return v6;
}

@end