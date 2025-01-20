@interface RidesharingAppPreferenceManager
+ (id)_lastSelectionDates;
+ (id)mostRecentSelectedAppIdentifers;
+ (id)preferredRideChoiceNamesByAppIdentifier;
+ (id)sortedRideOptionStatuses:(id)a3 withStoreOrdering:(id)a4;
+ (void)recordAppSelection:(id)a3;
+ (void)recordRideChoice:(id)a3;
+ (void)removeRecordedAppSelectionForAppIdentifiers:(id)a3;
@end

@implementation RidesharingAppPreferenceManager

+ (id)sortedRideOptionStatuses:(id)a3 withStoreOrdering:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 _lastSelectionDates];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10063BB94;
  v18[3] = &unk_1012F29A8;
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  id v20 = v6;
  id v9 = v6;
  id v10 = v19;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10063BD40;
  v15[3] = &unk_1012F29D0;
  id v16 = v8;
  v17 = objc_retainBlock(v18);
  v11 = v17;
  id v12 = v8;
  v13 = [v7 sortedArrayUsingComparator:v15];

  return v13;
}

+ (void)recordAppSelection:(id)a3
{
  id v8 = [a3 identifier];
  if (v8)
  {
    v4 = [a1 _lastSelectionDates];
    id v5 = [v4 mutableCopy];

    id v6 = +[NSDate date];
    [v5 setObject:v6 forKeyedSubscript:v8];

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:v5 forKey:@"kLastRidesharingAppSelectionKey"];
  }
}

+ (void)recordRideChoice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 application];
  id v10 = [v5 identifier];

  id v6 = [v4 name];

  if (v10 && [v6 length])
  {
    id v7 = [a1 preferredRideChoiceNamesByAppIdentifier];
    id v8 = [v7 mutableCopy];

    [v8 setObject:v6 forKeyedSubscript:v10];
    id v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setObject:v8 forKey:@"kRidesharingAppPreferenceRideChoiceKey"];
  }
}

+ (id)preferredRideChoiceNamesByAppIdentifier
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"kRidesharingAppPreferenceRideChoiceKey"];
  id v4 = v3;
  if (!v3) {
    v3 = &__NSDictionary0__struct;
  }
  id v5 = v3;

  return v5;
}

+ (void)removeRecordedAppSelectionForAppIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _lastSelectionDates];
  id v6 = [v5 mutableCopy];

  id v7 = [a1 preferredRideChoiceNamesByAppIdentifier];
  id v8 = [v7 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [v6 removeObjectForKey:v14];
        [v8 removeObjectForKey:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15 = +[NSUserDefaults standardUserDefaults];
  [v15 setObject:v6 forKey:@"kLastRidesharingAppSelectionKey"];
}

+ (id)mostRecentSelectedAppIdentifers
{
  v2 = [a1 _lastSelectionDates];
  v3 = [v2 allKeys];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10063C398;
  v7[3] = &unk_1012F29F8;
  id v8 = v2;
  id v4 = v2;
  id v5 = [v3 sortedArrayUsingComparator:v7];

  return v5;
}

+ (id)_lastSelectionDates
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"kLastRidesharingAppSelectionKey"];
  id v4 = v3;
  if (!v3) {
    v3 = &__NSDictionary0__struct;
  }
  id v5 = v3;

  return v5;
}

@end