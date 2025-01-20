@interface CLWifiAssociatedApCentroidStore
- (BOOL)addRecord:(id)a3;
- (BOOL)deleteAllRecords;
- (BOOL)deleteRecordsByMac:(id)a3;
- (BOOL)deleteRecordsLastUpdatedEarlierThan:(double)a3;
- (BOOL)isEmpty;
- (id)fetchAllRecords;
- (id)fetchAllRecordsForMac:(id)a3;
- (id)fetchRecord:(id)a3;
- (id)getSampleMacs:(int)a3;
- (int)count;
@end

@implementation CLWifiAssociatedApCentroidStore

- (BOOL)addRecord:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D492EC;
  v5[3] = &unk_10229FEB0;
  v5[4] = self;
  v5[5] = a3;
  [(NSManagedObjectContext *)[(CLStore *)self managedObjectContext] performBlockAndWait:v5];
  return [(CLStore *)self commitChangesToStore];
}

- (BOOL)deleteAllRecords
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);

  return [(CLStore *)self deleteRecordsWithEntityName:v4 byAndPredicates:&__NSArray0__struct];
}

- (BOOL)deleteRecordsByMac:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"mac = %@", a3];
  v5 = (objc_class *)objc_opt_class();
  v7 = v4;
  return [(CLStore *)self deleteRecordsWithEntityName:NSStringFromClass(v5) byAndPredicates:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (BOOL)deleteRecordsLastUpdatedEarlierThan:(double)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"lastUpdated < %f", *(void *)&a3];
  v5 = (objc_class *)objc_opt_class();
  v7 = v4;
  return [(CLStore *)self deleteRecordsWithEntityName:NSStringFromClass(v5) byAndPredicates:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (id)fetchAllRecords
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);

  return [(CLStore *)self fetchRecordsWithEntityName:v4 byAndPredicates:&__NSArray0__struct];
}

- (id)fetchAllRecordsForMac:(id)a3
{
  v4 = +[NSPredicate predicateWithFormat:@"mac = %@", a3];
  v5 = (objc_class *)objc_opt_class();
  v7 = v4;
  return [(CLStore *)self fetchRecordsWithEntityName:NSStringFromClass(v5) byAndPredicates:+[NSArray arrayWithObjects:&v7 count:1]];
}

- (id)fetchRecord:(id)a3
{
  id v3 = [(CLWifiAssociatedApCentroidStore *)self fetchAllRecordsForMac:a3];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  if (![v3 count]) {
    return 0;
  }
  int v5 = [v4 count];
  uint64_t v6 = (v5 - 1);
  if (v5 >= 2)
  {
    uint64_t v7 = 0;
    do

    while (v6 != v7);
  }

  return [v4 objectAtIndex:(int)v6];
}

- (int)count
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);

  return [(CLStore *)self countRecordsWithEntityName:v4 predicates:&__NSArray0__struct];
}

- (BOOL)isEmpty
{
  return [(CLWifiAssociatedApCentroidStore *)self count] == 0;
}

- (id)getSampleMacs:(int)a3
{
  if (a3 < 1) {
    return &stru_10234F018;
  }
  id v4 = [(CLWifiAssociatedApCentroidStore *)self fetchAllRecords];
  if (!v4) {
    return &stru_10234F018;
  }
  int v5 = v4;
  if (![v4 count]) {
    return &stru_10234F018;
  }
  int v6 = [v5 count];
  if (v6 <= a3) {
    LODWORD(v7) = 0;
  }
  else {
    LODWORD(v7) = arc4random_uniform(v6 - a3);
  }
  id v9 = +[NSMutableArray array];
  if ((int)v7 < v6)
  {
    uint64_t v7 = (int)v7;
    do
    {
      if ((unint64_t)[v9 count] >= a3) {
        break;
      }
      [v9 addObject:[objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v7++), "mac")]];
    }
    while (v6 != v7);
  }
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; [v5 objectAtIndex:i++])
      ;
  }

  return [v9 componentsJoinedByString:@", "];
}

@end