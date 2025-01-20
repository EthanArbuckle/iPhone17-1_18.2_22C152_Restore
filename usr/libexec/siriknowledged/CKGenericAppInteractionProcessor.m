@interface CKGenericAppInteractionProcessor
- (BOOL)processInteraction:(id)a3 bundleId:(id)a4;
- (BOOL)supportsSiriDonations;
- (id)bundleIdPredicate;
- (id)supportedTypes;
@end

@implementation CKGenericAppInteractionProcessor

- (BOOL)processInteraction:(id)a3 bundleId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 intent];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);

  v10 = +[NSString stringWithFormat:@"%@%@:%@", @"duet:app/intents:", v9, v5];

  v11 = [v6 dateInterval];
  v12 = [v11 startDate];

  v13 = [v6 dateInterval];

  v14 = [v13 endDate];

  v15 = +[CKDaemon sharedDaemon];
  [v15 recordEventWithIdentifier:v10 startDate:v12 endDate:v14 metadata:&__NSDictionary0__struct toStoreWithIdentifier:@"history" completionHandler:&stru_100018D30];

  return 1;
}

- (id)supportedTypes
{
  return +[NSSet setWithArray:&__NSArray0__struct];
}

- (id)bundleIdPredicate
{
  return +[NSPredicate predicateWithValue:1];
}

- (BOOL)supportsSiriDonations
{
  return 0;
}

@end