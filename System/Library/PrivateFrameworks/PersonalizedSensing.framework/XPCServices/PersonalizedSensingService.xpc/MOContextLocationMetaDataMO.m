@interface MOContextLocationMetaDataMO
+ (id)fetchRequest;
+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation MOContextLocationMetaDataMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextLocationMetaDataMO"];
}

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOContextLocationMetaDataMO alloc] initWithContext:v5];

  v8 = [v6 place];
  [(MOContextLocationMetaDataMO *)v7 setPlace:v8];

  v9 = [v6 city];

  [(MOContextLocationMetaDataMO *)v7 setCity:v9];
  return v7;
}

@end