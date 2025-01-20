@interface GKPreferences
- (BOOL)hasConsumedArcadeSubscription:(id)a3 arcadeFamilyId:(id)a4;
- (int64_t)arcadeSubscriptionState;
- (void)setArcadeSubscriptionState:(int64_t)a3;
- (void)updateArcadeSubscriptionState:(id)a3 completionHandler:(id)a4;
@end

@implementation GKPreferences

- (int64_t)arcadeSubscriptionState
{
  return (int64_t)[(GKPreferences *)self integerValueForKey:@"GKArcadeSubscriptionState" defaultValue:0];
}

- (void)setArcadeSubscriptionState:(int64_t)a3
{
}

- (BOOL)hasConsumedArcadeSubscription:(id)a3 arcadeFamilyId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) stringValue:v14];
        unsigned __int8 v12 = [v11 isEqualToString:v6];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)updateArcadeSubscriptionState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ASDSubscriptionEntitlements sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DD304;
  v11[3] = &unk_1002D9AD8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:v11];
}

@end