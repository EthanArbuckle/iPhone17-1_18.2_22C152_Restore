@interface FTEngagementURLProvider
- (FCNewsAvailabilityMonitor)availabilityMonitor;
- (FTEngagementURLProvider)init;
- (FTEngagementURLProvider)initWithAvailabilityMonitor:(id)a3;
- (id)URLForEngagement:(id)a3 event:(id)a4 trackableWidgetState:(id)a5 prefetchAssetsByRemoteURL:(id)a6 sharedDirectoryFileURL:(id)a7;
@end

@implementation FTEngagementURLProvider

- (FTEngagementURLProvider)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTEngagementURLProvider init]";
    __int16 v7 = 2080;
    v8 = "FTEngagementURLProvider.m";
    __int16 v9 = 1024;
    int v10 = 30;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTEngagementURLProvider init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTEngagementURLProvider)initWithAvailabilityMonitor:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E71C0();
  }
  v9.receiver = self;
  v9.super_class = (Class)FTEngagementURLProvider;
  v6 = [(FTEngagementURLProvider *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_availabilityMonitor, a3);
  }

  return v7;
}

- (id)URLForEngagement:(id)a3 event:(id)a4 trackableWidgetState:(id)a5 prefetchAssetsByRemoteURL:(id)a6 sharedDirectoryFileURL:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E72A0();
  }
  v17 = [(FTEngagementURLProvider *)self availabilityMonitor];
  unsigned int v18 = [v17 isNewsAvailable];

  uint64_t v19 = [v12 baseNewsURL];
  v20 = (void *)v19;
  v21 = 0;
  if (v18 && v19)
  {
    uint64_t v22 = [v12 openInNewsReferralItemWithTrackableWidgetState:v14 assetHandlesByRemoteURL:v15];
    v34 = (void *)v22;
    id v35 = v15;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = [v12 openInNewsReferralItemQueryItemName];
      v25 = (void *)v24;
      v26 = &__NSArray0__struct;
      if (!v16 || !v24)
      {
        id v28 = (id)v24;
LABEL_15:

LABEL_17:
        v29 = [v14 fetchInfoForVisibleResults];
        v30 = [v29 todaySourceIdentifier];
        v31 = [v29 appConfigTreatmentID];
        v21 = [v20 ft_referralURLWithSourceIdentifier:v30 appConfigTreatmentID:v31 widgetEngagement:v13 otherQueryItems:v26 sharedDirectoryFileURL:v16];

        id v15 = v35;
        goto LABEL_18;
      }
      v33 = [[FRNewsReferralItemEncoder alloc] initWithReferralItem:v23 sharedDirectoryFileURL:v16];
      v27 = [(FRNewsReferralItemEncoder *)v33 encodeQueryValueWithError:0];
      if (v27) {
        id v28 = [objc_alloc((Class)NSURLQueryItem) initWithName:v25 value:v27];
      }
      else {
        id v28 = 0;
      }

      if (v28)
      {
        id v36 = v28;
        v26 = +[NSArray arrayWithObjects:&v36 count:1];
        goto LABEL_15;
      }
    }
    v26 = &__NSArray0__struct;
    goto LABEL_17;
  }
LABEL_18:

  return v21;
}

- (FCNewsAvailabilityMonitor)availabilityMonitor
{
  return self->_availabilityMonitor;
}

- (void).cxx_destruct
{
}

@end