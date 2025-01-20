@interface FCSingleTagFeedDescriptor
- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3;
- (BOOL)hideAccessoryText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubscribable;
- (BOOL)isSubscribedToWithSubscriptionController:(id)a3;
- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5;
- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5 referringFeedItemIdentifier:(id)a6;
- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8;
- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8 referringFeedItemIdentifier:(id)a9;
- (FCSingleTagFeedDescriptor)initWithIdentifier:(id)a3;
- (FCTagProviding)masterTag;
- (FCTagProviding)tag;
- (id)backingChannel;
- (id)backingChannelID;
- (id)backingSectionID;
- (id)backingTopicID;
- (id)iAdCategories;
- (id)iAdFeedID;
- (id)iAdKeywords;
- (id)iAdPrimaryAudience;
- (id)name;
- (id)referringFeedItemIdentifier;
- (id)theme;
- (int64_t)feedPersonalizationConfigurationSet;
- (int64_t)feedSortMethod;
- (int64_t)feedType;
- (int64_t)iAdContentProvider;
- (unint64_t)feedConfiguration;
- (unint64_t)feedFilterOptions;
- (void)setReferringFeedItemIdentifier:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation FCSingleTagFeedDescriptor

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8
{
  return [(FCSingleTagFeedDescriptor *)self initWithContext:a3 tag:a4 sortMethod:a5 filterOptions:a6 personalizationConfigurationSet:a7 feedConfiguration:a8 referringFeedItemIdentifier:0];
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 sortMethod:(int64_t)a5 filterOptions:(unint64_t)a6 personalizationConfigurationSet:(int64_t)a7 feedConfiguration:(unint64_t)a8 referringFeedItemIdentifier:(id)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a9;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    v38 = "-[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet:feedC"
          "onfiguration:referringFeedItemIdentifier:]";
    __int16 v39 = 2080;
    v40 = "FCSingleTagFeedDescriptor.m";
    __int16 v41 = 1024;
    int v42 = 69;
    __int16 v43 = 2114;
    v44 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v18 = [v16 identifier];
  v36.receiver = self;
  v36.super_class = (Class)FCSingleTagFeedDescriptor;
  v19 = [(FCFeedDescriptor *)&v36 initWithIdentifier:v18];

  if (v19)
  {
    if (v16)
    {
      int64_t v34 = a7;
      unint64_t v35 = a8;
      uint64_t v20 = [v16 copy];
      tag = v19->_tag;
      v19->_tag = (FCTagProviding *)v20;

      p_masterTag = (void **)&v19->_masterTag;
      objc_storeStrong((id *)&v19->_masterTag, v19->_tag);
      uint64_t v23 = [v17 copy];
      referringFeedItemIdentifier = v19->_referringFeedItemIdentifier;
      v19->_referringFeedItemIdentifier = (NSString *)v23;

      v25 = [(FCTagProviding *)v19->_tag asSection];
      if (v25)
      {
        v26 = [v15 tagController];
        v27 = [v25 parentID];
        uint64_t v28 = [v26 expectedFastCachedTagForID:v27];
        v29 = *p_masterTag;
        *p_masterTag = (void *)v28;

        if (!*p_masterTag && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)[[NSString alloc] initWithFormat:@"failed to lookup parent channel in cache"];
          *(_DWORD *)buf = 136315906;
          v38 = "-[FCSingleTagFeedDescriptor initWithContext:tag:sortMethod:filterOptions:personalizationConfigurationSet"
                ":feedConfiguration:referringFeedItemIdentifier:]";
          __int16 v39 = 2080;
          v40 = "FCSingleTagFeedDescriptor.m";
          __int16 v41 = 1024;
          int v42 = 85;
          __int16 v43 = 2114;
          v44 = v33;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
      v19->_feedSortMethod = a5;
      v19->_feedFilterOptions = a6;
      v19->_feedPersonalizationConfigurationSet = v34;
      v19->_feedConfiguration = v35;
      unint64_t v30 = [v16 tagType];
      if (v30 <= 5) {
        v19->_feedType = qword_1A4973858[v30];
      }
    }
    else
    {
      v25 = v19;
      v19 = 0;
    }
  }
  return v19;
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5
{
  return [(FCSingleTagFeedDescriptor *)self initWithContext:a3 tag:a4 feedConfiguration:a5 referringFeedItemIdentifier:0];
}

- (FCSingleTagFeedDescriptor)initWithContext:(id)a3 tag:(id)a4 feedConfiguration:(unint64_t)a5 referringFeedItemIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v11 asSection];
  if (v13)
  {
    v14 = [v10 tagController];
    id v15 = [v13 parentID];
    id v16 = [v14 expectedFastCachedTagForID:v15];
  }
  else
  {
    id v16 = 0;
  }
  if (([v11 isLocal] & 1) != 0 || objc_msgSend(v16, "isLocal")) {
    uint64_t v17 = 0x60000011ALL;
  }
  else {
    uint64_t v17 = 0x20000011ALL;
  }
  uint64_t v18 = [v11 tagType];
  if ((unint64_t)(v18 - 2) < 2)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 2;
  }
  else if ((unint64_t)(v18 - 4) >= 2)
  {
    if (v18 == 1)
    {
      unint64_t v29 = a5;
      v21 = [v10 configurationManager];
      v22 = [v21 configuration];
      uint64_t v23 = [v22 personalizationTreatment];
      [v23 topicFeedFilterMutedTopics];
      double v25 = v24;

      if (v25 == 0.0) {
        uint64_t v26 = 36;
      }
      else {
        uint64_t v26 = 262180;
      }
      v17 |= v26;
      uint64_t v19 = 1;
      uint64_t v20 = 3;
      a5 = v29;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 1;
  }
  v27 = [(FCSingleTagFeedDescriptor *)self initWithContext:v10 tag:v11 sortMethod:v20 filterOptions:v17 personalizationConfigurationSet:v19 feedConfiguration:a5 referringFeedItemIdentifier:v12];

  return v27;
}

- (FCSingleTagFeedDescriptor)initWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCSingleTagFeedDescriptor initWithIdentifier:]";
    __int16 v11 = 2080;
    id v12 = "FCSingleTagFeedDescriptor.m";
    __int16 v13 = 1024;
    int v14 = 196;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCSingleTagFeedDescriptor initWithIdentifier:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v13.receiver = self;
  v13.super_class = (Class)FCSingleTagFeedDescriptor;
  unsigned int v7 = [(FCFeedDescriptor *)&v13 isEqual:v4];

  if (v7)
  {
    id v8 = [(FCSingleTagFeedDescriptor *)self tag];
    v9 = [v6 tag];
    if ([v8 isEqualToTag:v9])
    {
      unint64_t v10 = [(FCSingleTagFeedDescriptor *)self feedConfiguration];
      BOOL v11 = v10 == [v6 feedConfiguration];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)name
{
  if ([(FCSingleTagFeedDescriptor *)self feedConfiguration] == 1)
  {
    id v3 = FCBundle();
    [v3 localizedStringForKey:@"Home" value:&stru_1EF8299B8 table:0];
  }
  else
  {
    id v3 = [(FCSingleTagFeedDescriptor *)self tag];
    [v3 displayName];
  id v4 = };

  return v4;
}

- (BOOL)hideAccessoryText
{
  v2 = [(FCSingleTagFeedDescriptor *)self masterTag];
  char v3 = [v2 hideAccessoryText];

  return v3;
}

- (id)theme
{
  if (self->_masterTag) {
    [(FCSingleTagFeedDescriptor *)self masterTag];
  }
  else {
  v2 = [(FCSingleTagFeedDescriptor *)self tag];
  }
  char v3 = [v2 theme];

  return v3;
}

- (BOOL)isSubscribable
{
  v2 = [(FCSingleTagFeedDescriptor *)self masterTag];
  char v3 = [v2 isSubscribable];

  return v3;
}

- (BOOL)isSubscribedToWithSubscriptionController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionController");
    *(_DWORD *)buf = 136315906;
    BOOL v11 = "-[FCSingleTagFeedDescriptor isSubscribedToWithSubscriptionController:]";
    __int16 v12 = 2080;
    objc_super v13 = "FCSingleTagFeedDescriptor.m";
    __int16 v14 = 1024;
    int v15 = 250;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCSingleTagFeedDescriptor *)self masterTag];
  if ([v4 hasSubscriptionToTag:v5])
  {
    char v6 = 1;
  }
  else
  {
    unsigned int v7 = [(FCSingleTagFeedDescriptor *)self tag];
    char v6 = [v4 hasSubscriptionToTag:v7];
  }
  return v6;
}

- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionController");
    *(_DWORD *)buf = 136315906;
    BOOL v11 = "-[FCSingleTagFeedDescriptor hasNotificationsEnabledWithSubscriptionController:]";
    __int16 v12 = 2080;
    objc_super v13 = "FCSingleTagFeedDescriptor.m";
    __int16 v14 = 1024;
    int v15 = 258;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = [(FCSingleTagFeedDescriptor *)self masterTag];
  if ([v4 hasNotificationsEnabledForTag:v5])
  {
    char v6 = 1;
  }
  else
  {
    unsigned int v7 = [(FCSingleTagFeedDescriptor *)self tag];
    char v6 = [v4 hasNotificationsEnabledForTag:v7];
  }
  return v6;
}

- (id)backingChannel
{
  v2 = [(FCSingleTagFeedDescriptor *)self masterTag];
  char v3 = [v2 asChannel];

  return v3;
}

- (id)backingChannelID
{
  char v3 = [(FCSingleTagFeedDescriptor *)self tag];
  uint64_t v4 = [v3 tagType];

  if ((unint64_t)(v4 - 3) < 3)
  {
    v5 = [(FCSingleTagFeedDescriptor *)self tag];
    char v6 = [v5 asSection];
    unsigned int v7 = [v6 parentID];

LABEL_5:
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    v5 = [(FCSingleTagFeedDescriptor *)self tag];
    unsigned int v7 = [v5 identifier];
    goto LABEL_5;
  }
  unsigned int v7 = 0;
LABEL_7:
  return v7;
}

- (id)backingSectionID
{
  char v3 = [(FCSingleTagFeedDescriptor *)self tag];
  uint64_t v4 = [v3 tagType];

  if ((unint64_t)(v4 - 3) > 2)
  {
    char v6 = 0;
  }
  else
  {
    v5 = [(FCSingleTagFeedDescriptor *)self tag];
    char v6 = [v5 identifier];
  }
  return v6;
}

- (id)backingTopicID
{
  char v3 = [(FCSingleTagFeedDescriptor *)self tag];
  uint64_t v4 = [v3 tagType];

  if (v4 == 1)
  {
    v5 = [(FCSingleTagFeedDescriptor *)self tag];
    char v6 = [v5 identifier];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (id)iAdCategories
{
  v2 = [(FCSingleTagFeedDescriptor *)self tag];
  char v3 = [v2 iAdCategories];
  uint64_t v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)iAdKeywords
{
  v2 = [(FCSingleTagFeedDescriptor *)self tag];
  char v3 = [v2 iAdKeywords];
  uint64_t v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (int64_t)iAdContentProvider
{
  char v3 = [(FCSingleTagFeedDescriptor *)self tag];
  uint64_t v4 = [v3 tagType];

  if ((unint64_t)(v4 - 2) > 3) {
    return 1;
  }
  id v5 = [(FCSingleTagFeedDescriptor *)self tag];
  int64_t v6 = [v5 contentProvider];

  return v6;
}

- (id)iAdPrimaryAudience
{
  v2 = [(FCSingleTagFeedDescriptor *)self tag];
  char v3 = [v2 primaryAudience];

  return v3;
}

- (id)iAdFeedID
{
  char v3 = [(FCSingleTagFeedDescriptor *)self backingChannelID];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int64_t v6 = [(FCSingleTagFeedDescriptor *)self tag];
    id v5 = [v6 identifier];
  }
  return v5;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (int64_t)feedSortMethod
{
  return self->_feedSortMethod;
}

- (unint64_t)feedFilterOptions
{
  return self->_feedFilterOptions;
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return self->_feedPersonalizationConfigurationSet;
}

- (unint64_t)feedConfiguration
{
  return self->_feedConfiguration;
}

- (id)referringFeedItemIdentifier
{
  return self->_referringFeedItemIdentifier;
}

- (void)setReferringFeedItemIdentifier:(id)a3
{
}

- (FCTagProviding)masterTag
{
  return self->_masterTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterTag, 0);
  objc_storeStrong((id *)&self->_referringFeedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end