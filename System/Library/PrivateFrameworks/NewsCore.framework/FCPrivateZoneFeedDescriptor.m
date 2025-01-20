@interface FCPrivateZoneFeedDescriptor
- (FCPrivateDataController)privateDataController;
- (FCPrivateZoneFeedDescriptor)initWithIdentifier:(id)a3;
- (FCPrivateZoneFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5;
- (id)backingHeadlineIDs;
- (id)streamOfLatestHeadlinesWithContext:(id)a3;
- (int64_t)feedType;
- (void)setPrivateDataController:(id)a3;
@end

@implementation FCPrivateZoneFeedDescriptor

- (id)streamOfLatestHeadlinesWithContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 networkReachability];
  int v6 = [v5 isCloudKitReachable];

  if (v6)
  {
    v7 = NewsCoreUserDefaults();
    if ([v7 BOOLForKey:@"update_headlines_immediately"]) {
      double v8 = 0.0;
    }
    else {
      double v8 = 86400.0;
    }
  }
  else
  {
    double v8 = 1.79769313e308;
  }
  v9 = [(FCPrivateZoneFeedDescriptor *)self backingHeadlineIDs];
  v10 = [(FCFeedDescriptor *)self streamOfHeadlinesWithIDs:v9 context:v4 cachedOnly:v6 ^ 1u maxCachedAge:v8];

  return v10;
}

- (FCPrivateDataController)privateDataController
{
  return self->_privateDataController;
}

- (FCPrivateZoneFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataController");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPrivateZoneFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    __int16 v19 = 2080;
    v20 = "FCPrivateZoneFeedDescriptor.m";
    __int16 v21 = 1024;
    int v22 = 55;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPrivateZoneFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    __int16 v19 = 2080;
    v20 = "FCPrivateZoneFeedDescriptor.m";
    __int16 v21 = 1024;
    int v22 = 56;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCPrivateZoneFeedDescriptor;
  v11 = [(FCFeedDescriptor *)&v16 initWithIdentifier:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateDataController, a3);
    v12->_feedType = a5;
  }

  return v12;
}

- (FCPrivateZoneFeedDescriptor)initWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCPrivateZoneFeedDescriptor initWithIdentifier:]";
    __int16 v11 = 2080;
    v12 = "FCPrivateZoneFeedDescriptor.m";
    __int16 v13 = 1024;
    int v14 = 50;
    __int16 v15 = 2114;
    objc_super v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPrivateZoneFeedDescriptor initWithIdentifier:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)backingHeadlineIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPrivateZoneFeedDescriptor backingHeadlineIDs]";
    __int16 v9 = 2080;
    id v10 = "FCPrivateZoneFeedDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 88;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCPrivateZoneFeedDescriptor backingHeadlineIDs]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (void)setPrivateDataController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end