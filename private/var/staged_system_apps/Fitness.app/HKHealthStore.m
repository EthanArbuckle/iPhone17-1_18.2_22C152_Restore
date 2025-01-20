@interface HKHealthStore
- (void)ch_calculateBMRForDate:(id)a3 useEndOfDay:(BOOL)a4 completion:(id)a5;
- (void)ch_fetchBodyMassBeforeDate:(id)a3 completion:(id)a4;
- (void)ch_mostRecentQuantityOfType:(id)a3 beforeDate:(id)a4 completion:(id)a5;
@end

@implementation HKHealthStore

- (void)ch_calculateBMRForDate:(id)a3 useEndOfDay:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    v10 = +[NSCalendar currentCalendar];
    v11 = [v10 dateByAddingUnit:16 value:1 toDate:v8 options:0];

    v12 = +[NSCalendar currentCalendar];
    uint64_t v13 = [v12 startOfDayForDate:v11];

    id v8 = (id)v13;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F9B70;
  v15[3] = &unk_1008ABBE8;
  id v16 = v9;
  id v14 = v9;
  [(HKHealthStore *)self ch_fetchBodyMassBeforeDate:v8 completion:v15];
}

- (void)ch_fetchBodyMassBeforeDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000F9DD8;
  v10[3] = &unk_1008ABC10;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(HKHealthStore *)self ch_mostRecentQuantityOfType:v8 beforeDate:v7 completion:v10];
}

- (void)ch_mostRecentQuantityOfType:(id)a3 beforeDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSPredicate predicateWithFormat:@"%K <= %@", HKPredicateKeyPathStartDate, a4];
  id v11 = +[NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:0];
  id v12 = objc_alloc((Class)HKSampleQuery);
  v18 = v11;
  uint64_t v13 = +[NSArray arrayWithObjects:&v18 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FA008;
  v16[3] = &unk_1008ABC38;
  id v17 = v8;
  id v14 = v8;
  id v15 = [v12 initWithSampleType:v9 predicate:v10 limit:1 sortDescriptors:v13 resultsHandler:v16];

  [(HKHealthStore *)self executeQuery:v15];
}

@end