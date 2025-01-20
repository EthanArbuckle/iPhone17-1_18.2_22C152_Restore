@interface GKCDContactInfoList
+ (id)_gkPrimaryListWithContext:(id)a3;
+ (id)fetchRequest;
@end

@implementation GKCDContactInfoList

+ (id)_gkPrimaryListWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[GKCDContactInfoList _gkObjectsMatchingPredicate:0 withContext:v4];
  v6 = [v5 firstObject];

  if (!v6)
  {
    v7 = [GKCDContactInfoList alloc];
    v8 = [a1 entity];
    v6 = [(GKCDContactInfoList *)v7 initWithEntity:v8 insertIntoManagedObjectContext:v4];

    [(GKCDContactInfoList *)v6 setVersion:&off_1002F23A8];
  }

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ContactInfoList"];
}

@end