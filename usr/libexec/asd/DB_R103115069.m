@interface DB_R103115069
+ (id)entityName;
+ (id)fetchRequest;
+ (id)insertNewObjectInManagedObjectContext:(id)a3;
@end

@implementation DB_R103115069

+ (id)entityName
{
  return @"DB_R103115069";
}

+ (id)insertNewObjectInManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [a1 entityName];
  v6 = +[NSEntityDescription insertNewObjectForEntityForName:v5 inManagedObjectContext:v4];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_R103115069"];
}

@end