@interface GKContactsIntegrationMetricsHandler
- (GKAMPController)ampController;
- (GKContactsIntegrationMetricsHandler)init;
- (GKContactsIntegrationMetricsHandler)initWithAMPController:(id)a3;
- (void)recordContactInfoMatchCount:(unint64_t)a3;
- (void)recordContactRelationshipsFromResults:(id)a3;
- (void)setAmpController:(id)a3;
@end

@implementation GKContactsIntegrationMetricsHandler

- (GKContactsIntegrationMetricsHandler)init
{
  v3 = +[GKAMPController controller];
  v4 = [(GKContactsIntegrationMetricsHandler *)self initWithAMPController:v3];

  return v4;
}

- (GKContactsIntegrationMetricsHandler)initWithAMPController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsIntegrationMetricsHandler;
  v6 = [(GKContactsIntegrationMetricsHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ampController, a3);
  }

  return v7;
}

- (void)recordContactInfoMatchCount:(unint64_t)a3
{
  v7[0] = GKMetricsEventType;
  v7[1] = @"contactInfoMatchCount";
  v8[0] = @"contactsIntegration";
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  v6 = [(GKContactsIntegrationMetricsHandler *)self ampController];
  [v6 reportPerformanceEventWithHostAppBundleId:GKDaemonIdentifier metricsFields:v5];
}

- (void)recordContactRelationshipsFromResults:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v21[0] = GKMetricsEventType;
    v21[1] = @"contactContainsFriendHandle";
    v22[0] = @"contactsIntegration";
    v22[1] = &__kCFBooleanFalse;
    v21[2] = @"contactContainsNonFriendHandle";
    v21[3] = @"contactContainsUnknownHandle";
    v22[2] = &__kCFBooleanFalse;
    v22[3] = &__kCFBooleanFalse;
    id v5 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    id v6 = [v5 mutableCopy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) relationship:(void)v16];
          if (v12 <= 2) {
            [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:off_1002D9420[v12]];
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = [(GKContactsIntegrationMetricsHandler *)self ampController];
    uint64_t v14 = GKDaemonIdentifier;
    id v15 = [v6 copy];
    [v13 reportPerformanceEventWithHostAppBundleId:v14 metricsFields:v15];
  }
}

- (GKAMPController)ampController
{
  return self->_ampController;
}

- (void)setAmpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end