@interface BKSeriesItem
+ (id)fetchRequest;
+ (id)insertSeriesContainerWithSeriesAdamId:(id)a3 intoManagedObjectContext:(id)a4;
+ (id)insertSeriesItemWithAdamId:(id)a3 seriesAdamId:(id)a4 intoManagedObjectContext:(id)a5;
+ (id)insertStoreItemWithAdamId:(id)a3 intoManagedObjectContext:(id)a4;
+ (id)predicateForAllBookItems;
+ (id)predicateForAllItemsAndContainerWithAdamIdInList:(id)a3;
+ (id)predicateForAllItemsAndContainersInSeries:(id)a3;
+ (id)predicateForAllNonSeriesBookItems;
+ (id)predicateForAllSeriesContainerItems;
+ (id)predicateForContainerWithSeriesId:(id)a3;
+ (id)predicateForItemWithAdamId:(id)a3;
@end

@implementation BKSeriesItem

+ (id)insertSeriesItemWithAdamId:(id)a3 seriesAdamId:(id)a4 intoManagedObjectContext:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKSeriesItem" inManagedObjectContext:a5];
  [v9 setAdamId:v8];

  [v9 setSeriesAdamId:v7];

  return v9;
}

+ (id)insertSeriesContainerWithSeriesAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  v4 = [a1 insertSeriesItemWithAdamId:a3 seriesAdamId:a3 intoManagedObjectContext:a4];
  [v4 setIsContainer:&__kCFBooleanTrue];

  return v4;
}

+ (id)insertStoreItemWithAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  id v5 = a3;
  v6 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKSeriesItem" inManagedObjectContext:a4];
  [v6 setAdamId:v5];

  return v6;
}

+ (id)fetchRequest
{
  v2 = NSStringFromClass((Class)a1);
  v3 = +[NSFetchRequest fetchRequestWithEntityName:v2];

  return v3;
}

+ (id)predicateForItemWithAdamId:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", @"adamId", a3];
}

+ (id)predicateForAllSeriesContainerItems
{
  return +[NSPredicate predicateWithFormat:@"%K == %@", @"isContainer", &__kCFBooleanTrue];
}

+ (id)predicateForContainerWithSeriesId:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(%K = %@) AND (%K == %@)", @"seriesAdamId", a3, @"isContainer", &__kCFBooleanTrue];
}

+ (id)predicateForAllBookItems
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ || %K == NULL", @"isContainer", &__kCFBooleanFalse, @"isContainer"];
}

+ (id)predicateForAllItemsAndContainersInSeries:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"seriesAdamId", a3];
}

+ (id)predicateForAllItemsAndContainerWithAdamIdInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"adamId", a3];
}

+ (id)predicateForAllNonSeriesBookItems
{
  return +[NSPredicate predicateWithFormat:@"%K == %@ || %K == NULL", @"seriesAdamId", &stru_2CE418, @"seriesAdamId"];
}

@end