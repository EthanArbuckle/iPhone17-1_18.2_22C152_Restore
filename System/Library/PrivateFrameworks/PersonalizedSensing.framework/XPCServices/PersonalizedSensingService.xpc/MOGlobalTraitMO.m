@interface MOGlobalTraitMO
+ (id)fetchRequest;
+ (id)managedObjectWithGlobalTrait:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 globalTrait:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOGlobalTraitMO

+ (id)managedObjectWithGlobalTrait:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOGlobalTraitMO alloc] initWithContext:v5];
  +[MOGlobalTraitMO updateManagedObject:v7 globalTrait:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 globalTrait:(id)a4 inManagedObjectContext:(id)a5
{
  id v6 = a3;
  id v7 = [a4 title];
  [v6 setTitle:v7];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOGlobalTraitMO"];
}

@end