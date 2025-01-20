@interface NTQueueConfigSectionQueueDescriptor
- (NSArray)sectionDescriptors;
- (NTQueueConfigSectionQueueDescriptor)init;
- (NTQueueConfigSectionQueueDescriptor)initWithQueueConfig:(id)a3 appConfiguration:(id)a4 todayData:(id)a5 inFavoritesOnlyMode:(BOOL)a6 respectsWidgetVisibleSectionsLimit:(BOOL)a7;
- (unint64_t)visibleSectionConfigsLimit;
@end

@implementation NTQueueConfigSectionQueueDescriptor

- (NTQueueConfigSectionQueueDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTQueueConfigSectionQueueDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTQueueConfigSectionQueueDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 20;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTQueueConfigSectionQueueDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTQueueConfigSectionQueueDescriptor)initWithQueueConfig:(id)a3 appConfiguration:(id)a4 todayData:(id)a5 inFavoritesOnlyMode:(BOOL)a6 respectsWidgetVisibleSectionsLimit:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:]();
    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:]();
  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)NTQueueConfigSectionQueueDescriptor;
  uint64_t v15 = [(NTQueueConfigSectionQueueDescriptor *)&v25 init];
  if (v15)
  {
    v16 = [v12 todaySectionConfigs];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __141__NTQueueConfigSectionQueueDescriptor_initWithQueueConfig_appConfiguration_todayData_inFavoritesOnlyMode_respectsWidgetVisibleSectionsLimit___block_invoke;
    v21[3] = &unk_26475D390;
    BOOL v24 = a6;
    id v22 = v13;
    id v23 = v14;
    uint64_t v17 = objc_msgSend(v16, "fc_arrayByTransformingWithBlock:", v21);
    sectionDescriptors = v15->_sectionDescriptors;
    v15->_sectionDescriptors = (NSArray *)v17;

    if (v7) {
      uint64_t v19 = [v12 widgetVisibleSectionsLimit];
    }
    else {
      uint64_t v19 = -1;
    }
    v15->_visibleSectionConfigsLimit = v19;
  }
  return v15;
}

NTSectionConfigSectionDescriptor *__141__NTQueueConfigSectionQueueDescriptor_initWithQueueConfig_appConfiguration_todayData_inFavoritesOnlyMode_respectsWidgetVisibleSectionsLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if ([v3 filterNonSubscribedInFavoritesOnlyMode]) {
      uint64_t v5 = 0x20000000;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  id v6 = [NTSectionConfigSectionDescriptor alloc];
  BOOL v7 = *(void **)(a1 + 32);
  v8 = [v7 topStoriesConfig];
  __int16 v9 = [v8 channelID];
  v10 = [*(id *)(a1 + 32) hiddenFeedIDs];
  __int16 v11 = [(NTSectionConfigSectionDescriptor *)v6 initWithSectionConfig:v4 appConfiguration:v7 topStoriesChannelID:v9 hiddenFeedIDs:v10 allowPaidBundleFeed:1 todayData:*(void *)(a1 + 40) supplementalFeedFilterOptions:v5];

  return v11;
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (unint64_t)visibleSectionConfigsLimit
{
  return self->_visibleSectionConfigsLimit;
}

- (void).cxx_destruct
{
}

- (void)initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respects"
       "WidgetVisibleSectionsLimit:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTQueueConfigSectionQueueDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respectsWidgetVisibleSectionsLimit:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queueConfig");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NTQueueConfigSectionQueueDescriptor initWithQueueConfig:appConfiguration:todayData:inFavoritesOnlyMode:respects"
       "WidgetVisibleSectionsLimit:]";
  __int16 v3 = 2080;
  uint64_t v4 = "NTQueueConfigSectionQueueDescriptor.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end