@interface FTHeadlineRowOpenURLEngagementDescriptor
- (FTHeadlineRowOpenURLEngagementDescriptor)init;
- (FTHeadlineRowOpenURLEngagementDescriptor)initWithHeadline:(id)a3;
- (NSString)openInNewsReferralItemQueryItemName;
- (NSURL)baseNewsURL;
- (NTHeadlineProviding)headline;
- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4;
- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4;
@end

@implementation FTHeadlineRowOpenURLEngagementDescriptor

- (FTHeadlineRowOpenURLEngagementDescriptor)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTHeadlineRowOpenURLEngagementDescriptor init]";
    __int16 v7 = 2080;
    v8 = "FTHeadlineRowOpenURLEngagementDescriptor.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTHeadlineRowOpenURLEngagementDescriptor init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTHeadlineRowOpenURLEngagementDescriptor)initWithHeadline:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E42C4();
  }
  v9.receiver = self;
  v9.super_class = (Class)FTHeadlineRowOpenURLEngagementDescriptor;
  v5 = [(FTHeadlineRowOpenURLEngagementDescriptor *)&v9 init];
  if (v5)
  {
    v6 = (NTHeadlineProviding *)[v4 copy];
    headline = v5->_headline;
    v5->_headline = v6;
  }
  return v5;
}

- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E444C();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E4388();
  }
LABEL_6:
  v8 = +[NSDate date];
  objc_super v9 = [(FTHeadlineRowOpenURLEngagementDescriptor *)self headline];
  int v10 = [v6 engagementWithRowAtDate:v8 forHeadline:v9 withTrackableWidgetState:v7];

  return v10;
}

- (NSURL)baseNewsURL
{
  id v2 = [(FTHeadlineRowOpenURLEngagementDescriptor *)self headline];
  v3 = [v2 NewsURL];

  return (NSURL *)v3;
}

- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000E45D4();
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E4510();
  }
LABEL_6:
  id v7 = objc_opt_new();
  v35 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v8 = [v5 todayResults];
  objc_super v9 = [v8 sections];

  id obj = v9;
  id v32 = [v9 countByEnumeratingWithState:&v41 objects:v54 count:16];
  v28 = v6;
  v29 = v5;
  if (v32)
  {
    uint64_t v31 = *(void *)v42;
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v10;
        __int16 v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v12 = [v11 items];
        id v13 = [v12 countByEnumeratingWithState:&v37 objects:v53 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v38;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              if (![v17 itemType])
              {
                id v18 = v17;
                v19 = [v18 analyticsElement];
                v20 = [v19 articleID];

                v21 = [(FTHeadlineRowOpenURLEngagementDescriptor *)self headline];
                unsigned int v22 = [v18 isEqual:v21];

                if (v22)
                {
                  if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"invalid nil value for '%s'", "articleID"];
                    *(_DWORD *)buf = 136315906;
                    v46 = "-[FTHeadlineRowOpenURLEngagementDescriptor openInNewsReferralItemWithTrackableWidgetState:asse"
                          "tHandlesByRemoteURL:]";
                    __int16 v47 = 2080;
                    v48 = "FTHeadlineRowOpenURLEngagementDescriptor.m";
                    __int16 v49 = 1024;
                    int v50 = 86;
                    __int16 v51 = 2114;
                    id v52 = v23;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
                  }
                  uint64_t v34 = (uint64_t)[v7 count];
                }
                if (v20)
                {
                  [v7 addObject:v18];
                  [v35 setObject:v11 forKeyedSubscript:v18];
                }
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v37 objects:v53 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v32);
  }
  else
  {
    uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v24 = [v7 fc_arrayOfObjectsPassingTest:&stru_100123B60];
  v25 = [v24 fc_rotateElementsFromTheIndexOfSelectedItem:v34];
  v26 = +[FRNewsReferralItemWidgetArticleList ft_itemWithHeadlines:v25 sectionsByHeadline:v35 assetHandlesByRemoteURL:v28];

  return v26;
}

- (NSString)openInNewsReferralItemQueryItemName
{
  return (NSString *)FCWidgetArticleListReferralItemQueryItemName;
}

- (NTHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
}

@end