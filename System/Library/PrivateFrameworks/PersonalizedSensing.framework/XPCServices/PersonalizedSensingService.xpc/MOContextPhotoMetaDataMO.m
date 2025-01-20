@interface MOContextPhotoMetaDataMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation MOContextPhotoMetaDataMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextPhotoMetaDataMO"];
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOContextPhotoMetaDataMO alloc] initWithContext:v5];

  v8 = [v6 photoAssetIdentifier];

  [(MOContextPhotoMetaDataMO *)v7 setPhotoAssetIdentifier:v8];
  return v7;
}

@end