@interface MOContextDimensionMO
+ (id)fetchRequest;
+ (id)managedObjectWithContextDimension:(id)a3 inManagedObjectContext:(id)a4;
+ (void)updateManagedObject:(id)a3 withContextDimension:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation MOContextDimensionMO

+ (id)managedObjectWithContextDimension:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MOContextDimensionMO alloc] initWithContext:v5];
  +[MOContextDimensionMO updateManagedObject:v7 withContextDimension:v6 inManagedObjectContext:v5];

  return v7;
}

+ (void)updateManagedObject:(id)a3 withContextDimension:(id)a4 inManagedObjectContext:(id)a5
{
  id v6 = a3;
  id v7 = [a4 name];
  [v6 setName:v7];
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MOContextDimensionMO"];
}

@end