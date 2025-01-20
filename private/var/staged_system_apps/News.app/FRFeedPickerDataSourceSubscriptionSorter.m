@interface FRFeedPickerDataSourceSubscriptionSorter
+ (void)initialize;
- (FRFeedPickerDataSourceSubscriptionSorter)init;
- (NSArray)fallbackSortOrder;
- (NSMutableDictionary)tagOpenedDate;
- (id)comparatorForSubscriptions;
- (id)sortSubscriptionsAlphabetically:(id)a3;
- (id)sortSubscriptionsByRecency:(id)a3 sortedPopularTagIDs:(id)a4;
- (id)trimTheArticle:(id)a3;
- (void)recordSubscriptionAsRecentlyOpened:(id)a3;
- (void)setFallbackSortOrder:(id)a3;
- (void)setTagOpenedDate:(id)a3;
@end

@implementation FRFeedPickerDataSourceSubscriptionSorter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = @"FRFeedPickerDataSourceOpenedLookup";
    v5 = &__NSDictionary0__struct;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

- (FRFeedPickerDataSourceSubscriptionSorter)init
{
  +[NSThread isMainThread];
  v25.receiver = self;
  v25.super_class = (Class)FRFeedPickerDataSourceSubscriptionSorter;
  v3 = [(FRFeedPickerDataSourceSubscriptionSorter *)&v25 init];
  CFStringRef v4 = v3;
  if (v3)
  {
    v19 = v3;
    v5 = +[NSUserDefaults standardUserDefaults];
    v6 = [v5 dictionaryForKey:@"FRFeedPickerDataSourceOpenedLookup"];

    v20 = +[NSMutableDictionary dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v11);
          objc_opt_class();
          v13 = FCDynamicCast();
          objc_opt_class();
          v14 = [v7 objectForKeyedSubscript:v12];
          v15 = FCDynamicCast();

          if (v13) {
            BOOL v16 = v15 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16) {
            [(NSMutableDictionary *)v20 setObject:v15 forKeyedSubscript:v13];
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    CFStringRef v4 = v19;
    tagOpenedDate = v19->_tagOpenedDate;
    v19->_tagOpenedDate = v20;
  }
  return v4;
}

- (id)comparatorForSubscriptions
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DB4C;
  v4[3] = &unk_1000C58C0;
  v4[4] = self;
  v2 = objc_retainBlock(v4);

  return v2;
}

- (id)sortSubscriptionsAlphabetically:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  v5 = [(FRFeedPickerDataSourceSubscriptionSorter *)self comparatorForSubscriptions];
  v6 = [v4 sortedArrayWithOptions:1 usingComparator:v5];

  return v6;
}

- (id)trimTheArticle:(id)a3
{
  id v3 = a3;
  if ([v3 rangeOfString:@"the " options:9] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 substringFromIndex:v4];
  }
  v6 = v5;

  return v6;
}

- (id)sortSubscriptionsByRecency:(id)a3 sortedPopularTagIDs:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E078;
  v8[3] = &unk_1000C58E8;
  v8[4] = self;
  id v9 = a4;
  id v5 = v9;
  v6 = [a3 sortedArrayUsingComparator:v8];

  return v6;
}

- (void)recordSubscriptionAsRecentlyOpened:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = +[NSDate date];
  v6 = [(FRFeedPickerDataSourceSubscriptionSorter *)self tagOpenedDate];
  id v7 = [v4 identifier];

  [v6 setObject:v5 forKeyedSubscript:v7];
  id v10 = +[NSUserDefaults standardUserDefaults];
  id v8 = [(FRFeedPickerDataSourceSubscriptionSorter *)self tagOpenedDate];
  id v9 = [v8 copy];
  [v10 setObject:v9 forKey:@"FRFeedPickerDataSourceOpenedLookup"];
}

- (NSMutableDictionary)tagOpenedDate
{
  return self->_tagOpenedDate;
}

- (void)setTagOpenedDate:(id)a3
{
}

- (NSArray)fallbackSortOrder
{
  return self->_fallbackSortOrder;
}

- (void)setFallbackSortOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSortOrder, 0);

  objc_storeStrong((id *)&self->_tagOpenedDate, 0);
}

@end