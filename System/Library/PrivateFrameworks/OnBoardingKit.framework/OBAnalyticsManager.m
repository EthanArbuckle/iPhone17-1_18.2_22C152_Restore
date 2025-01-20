@interface OBAnalyticsManager
+ (id)sharedManager;
- (BOOL)shouldStashMetrics;
- (NSMutableArray)events;
- (OBAnalyticsManager)init;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 withPayload:(id)a4;
- (void)commit;
- (void)logPresentationOfPrivacyLinkWithIdentifier:(id)a3;
- (void)logPresentationOfPrivacySplashWithIdentifier:(id)a3;
- (void)logPresentationOfPrivacyUnifiedAbout;
- (void)logTapOnPrivacyLinkWithIdentifier:(id)a3;
- (void)setEvents:(id)a3;
- (void)setShouldStashMetrics:(BOOL)a3;
@end

@implementation OBAnalyticsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __35__OBAnalyticsManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(OBAnalyticsManager);
  return MEMORY[0x1F41817F8]();
}

- (OBAnalyticsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)OBAnalyticsManager;
  v2 = [(OBAnalyticsManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v2->_events;
    v2->_events = v3;
  }
  return v2;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(OBAnalyticsManager *)self events];
  [v5 addObject:v4];
}

- (void)addEvent:(id)a3 withPayload:(id)a4
{
  id v7 = +[OBAnalyticsEvent eventWithName:a3 withPayload:a4];
  if ([(OBAnalyticsManager *)self shouldStashMetrics])
  {
    [(OBAnalyticsManager *)self addEvent:v7];
  }
  else
  {
    id v5 = [v7 name];
    objc_super v6 = [v7 payload];
    AnalyticsSendEvent();
  }
}

- (void)commit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = _OBLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BF0F000, v3, OS_LOG_TYPE_DEFAULT, "Commiting analytics...", buf, 2u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(OBAnalyticsManager *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 name];
        v11 = [v9 payload];
        AnalyticsSendEvent();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)logPresentationOfPrivacyUnifiedAbout
{
  v3 = _OBLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19BF0F000, v3, OS_LOG_TYPE_DEFAULT, "presentation of unified about", v4, 2u);
  }

  [(OBAnalyticsManager *)self logPresentationOfPrivacySplashWithIdentifier:@"com.apple.onboardingkit.unifiedAbout"];
}

- (void)logPresentationOfPrivacySplashWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _OBLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = @"gdprAboutShown";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19BF0F000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  uint64_t v7 = @"bundleid";
  id v8 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(OBAnalyticsManager *)self addEvent:@"gdprAboutShown" withPayload:v6];
}

- (void)logPresentationOfPrivacyLinkWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _OBLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = @"gdprLinkShown";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19BF0F000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  uint64_t v7 = @"bundleid";
  id v8 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(OBAnalyticsManager *)self addEvent:@"gdprLinkShown" withPayload:v6];
}

- (void)logTapOnPrivacyLinkWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _OBLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = @"gdprLinkClicked";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_19BF0F000, v5, OS_LOG_TYPE_DEFAULT, "presentation of about event: %@ identifier: %@", buf, 0x16u);
  }

  uint64_t v7 = @"bundleid";
  id v8 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [(OBAnalyticsManager *)self addEvent:@"gdprLinkClicked" withPayload:v6];
}

- (BOOL)shouldStashMetrics
{
  return self->_shouldStashMetrics;
}

- (void)setShouldStashMetrics:(BOOL)a3
{
  self->_shouldStashMetrics = a3;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end