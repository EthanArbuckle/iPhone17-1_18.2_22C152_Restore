@interface FCBaseURLConfiguration
+ (BOOL)hasOverrideCAPIURL;
+ (id)CAPIBaseURLForConfiguration:(id)a3;
+ (id)appAnalyticsSportsEventsBaseURLForConfiguration:(id)a3;
+ (id)authTokenBaseURLForConfiguration:(id)a3;
+ (id)ckEdgeCachedMultiFetchBaseURLForConfiguration:(id)a3;
+ (id)ckEdgeCachedOrderFeedBaseURLForConfiguration:(id)a3;
+ (id)ckMultiFetchBaseURLForConfiguration:(id)a3;
+ (id)ckOrderFeedBaseURLForConfiguration:(id)a3;
+ (id)ckRecordFetchBaseURLForConfiguration:(id)a3;
+ (id)fairPlayBaseURLForConfiguration:(id)a3;
+ (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration:(id)a3;
+ (id)liveActivityBaseURLForConfiguration:(id)a3;
+ (id)newsletterBaseURLForConfiguration:(id)a3;
+ (id)notificationsBaseURLForConfiguration:(id)a3;
+ (id)overrideCAPIURLString;
+ (id)puzzlesArchiveBaseURLForConfiguration:(id)a3;
+ (id)searchBaseURLForConfiguration:(id)a3;
+ (id)sportsDataVisualizationBaseURLForConfiguration:(id)a3;
- (FCBaseURLConfiguration)initWithCoreConfiguration:(id)a3;
- (FCCoreConfiguration)coreConfiguration;
- (id)CAPIBaseURL;
- (id)appAnalyticsSportsEventsBaseURLForConfiguration;
- (id)authTokenBaseURLForConfiguration;
- (id)baseURL:(id)a3 fallback:(void *)a4;
- (id)baseURLString:(id)a3 fallback:(void *)a4;
- (id)ckEdgeCachedMultiFetchBaseURLForConfiguration;
- (id)ckEdgeCachedOrderFeedBaseURLForConfiguration;
- (id)ckMultiFetchBaseURLForConfiguration;
- (id)ckOrderFeedBaseURLForConfiguration;
- (id)ckRecordFetchBaseURLForConfiguration;
- (id)fairPlayBaseURL;
- (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration;
- (id)newsletterBaseURL;
- (id)notificationsBaseURL;
- (id)puzzlesArchiveBaseURLForConfiguration;
- (id)searchBaseURLForConfiguration;
- (id)sportsDataVisualizationBaseURLForConfiguration;
- (void)setCoreConfiguration:(id)a3;
@end

@implementation FCBaseURLConfiguration

- (void).cxx_destruct
{
}

+ (id)ckEdgeCachedMultiFetchBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 ckEdgeCachedMultiFetchBaseURLForConfiguration];

  return v5;
}

- (id)ckEdgeCachedMultiFetchBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_138 fallback:FCDefaultCKEdgeCacheURLStringForEnvironment];
}

- (id)baseURL:(id)a3 fallback:(void *)a4
{
  v4 = [(FCBaseURLConfiguration *)self baseURLString:a3 fallback:a4];
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return v5;
}

- (id)baseURLString:(id)a3 fallback:(void *)a4
{
  v6 = (void (**)(id, void *))a3;
  uint64_t EndpointEnvironment = FCDefaultsReadEndpointEnvironment();
  v8 = [(FCBaseURLConfiguration *)self coreConfiguration];
  v9 = [v8 endpointConfigsByEnvironment];
  v10 = [NSNumber numberWithUnsignedInteger:EndpointEnvironment];
  v11 = [v9 objectForKey:v10];

  v12 = v6[2](v6, v11);

  if (!v12)
  {
    v12 = ((void (*)(uint64_t))a4)(EndpointEnvironment);
  }

  return v12;
}

- (FCCoreConfiguration)coreConfiguration
{
  return self->_coreConfiguration;
}

uint64_t __37__FCBaseURLConfiguration_CAPIBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clientAPIBaseURLString];
}

uint64_t __62__FCBaseURLConfiguration_ckRecordFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ckRecordFetchBaseURLString];
}

uint64_t __46__FCBaseURLConfiguration_notificationsBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 notificationsBaseURLString];
}

uint64_t __43__FCBaseURLConfiguration_newsletterBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 newsletterAPIBaseURLString];
}

uint64_t __41__FCBaseURLConfiguration_fairPlayBaseURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 fairPlayBaseURLString];
}

uint64_t __71__FCBaseURLConfiguration_ckEdgeCachedMultiFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ckEdgeCachedMultiFetchBaseURLString];
}

+ (id)fairPlayBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 fairPlayBaseURL];

  return v5;
}

- (id)fairPlayBaseURL
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_182 fallback:FCDefaultFairPlayBaseURLStringForEnvironment];
}

+ (id)newsletterBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 newsletterBaseURL];

  return v5;
}

- (id)newsletterBaseURL
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_113 fallback:FCDefaultNewsletterAPIBaseURLStringForEnvironment];
}

+ (id)ckRecordFetchBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 ckRecordFetchBaseURLForConfiguration];

  return v5;
}

- (id)ckRecordFetchBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_134 fallback:FCDefaultCKFetchURLStringForEnvironment];
}

+ (id)notificationsBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 notificationsBaseURL];

  return v5;
}

+ (id)CAPIBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  v5 = [(FCBaseURLConfiguration *)v4 CAPIBaseURL];

  return v5;
}

- (FCBaseURLConfiguration)initWithCoreConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCBaseURLConfiguration;
  v6 = [(FCBaseURLConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coreConfiguration, a3);
  }

  return v7;
}

- (id)CAPIBaseURL
{
  v2 = [(FCBaseURLConfiguration *)self baseURLString:&__block_literal_global_115_0 fallback:FCDefaultClientAPIBaseURLStringForEnvironment];
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];

  return v3;
}

- (id)notificationsBaseURL
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_111_1 fallback:FCDefaultNotificationsBaseURLStringForEnvironment];
}

uint64_t __73__FCBaseURLConfiguration_appAnalyticsSportsEventsBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 appAnalyticsSportsEventsBaseURLString];
}

- (id)appAnalyticsSportsEventsBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_126_0 fallback:FCDefaultAppAnalyticsSportsEventsBaseURLStringForEnvironment];
}

+ (id)appAnalyticsSportsEventsBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 appAnalyticsSportsEventsBaseURLForConfiguration];

  return v5;
}

+ (id)searchBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 searchBaseURLForConfiguration];

  return v5;
}

+ (id)puzzlesArchiveBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 puzzlesArchiveBaseURLForConfiguration];

  return v5;
}

+ (id)authTokenBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 authTokenBaseURLForConfiguration];

  return v5;
}

+ (id)sportsDataVisualizationBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 sportsDataVisualizationBaseURLForConfiguration];

  return v5;
}

+ (id)liveActivityBaseURLForConfiguration:(id)a3
{
  id v3 = [a1 sportsDataVisualizationBaseURLForConfiguration:a3];
  v4 = [v3 URLByAppendingPathComponent:@"/liveactivity/v1/"];

  return v4;
}

+ (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 fineGrainedNewsletterSubscriptionBaseURLForConfiguration];

  return v5;
}

+ (id)ckOrderFeedBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 ckOrderFeedBaseURLForConfiguration];

  return v5;
}

+ (id)ckMultiFetchBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 ckMultiFetchBaseURLForConfiguration];

  return v5;
}

+ (id)ckEdgeCachedOrderFeedBaseURLForConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[FCBaseURLConfiguration alloc] initWithCoreConfiguration:v3];

  id v5 = [(FCBaseURLConfiguration *)v4 ckEdgeCachedOrderFeedBaseURLForConfiguration];

  return v5;
}

- (id)searchBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_118 fallback:FCDefaultSearchBaseURLStringForEnvironment];
}

uint64_t __55__FCBaseURLConfiguration_searchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 searchAPIBaseURLString];
}

- (id)puzzlesArchiveBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_120_0 fallback:FCDefaultPuzzlesArchiveBaseURLStringForEnvironment];
}

uint64_t __63__FCBaseURLConfiguration_puzzlesArchiveBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 puzzlesArchiveAPIBaseURLString];
}

- (id)authTokenBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_122 fallback:FCDefaultAuthTokenAPIBaseURLStringForEnvironment];
}

uint64_t __58__FCBaseURLConfiguration_authTokenBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 authTokenAPIBaseURLString];
}

- (id)sportsDataVisualizationBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_124 fallback:FCDefaultSportsDataVisualizationAPIBaseURLStringForEnvironment];
}

uint64_t __72__FCBaseURLConfiguration_sportsDataVisualizationBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sportsDataVisualizationAPIBaseURLString];
}

- (id)fineGrainedNewsletterSubscriptionBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_128 fallback:FCDefaultFineGrainedNewsletterSubscriptionBaseURLStringForEnvironment];
}

uint64_t __82__FCBaseURLConfiguration_fineGrainedNewsletterSubscriptionBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 fineGrainedNewsletterSubscriptionBaseURLString];
}

- (id)ckOrderFeedBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_130 fallback:FCDefaultCKQueryURLStringForEnvironment];
}

uint64_t __60__FCBaseURLConfiguration_ckOrderFeedBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ckOrderFeedBaseURLString];
}

- (id)ckMultiFetchBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_132 fallback:FCDefaultCKQueryURLStringForEnvironment];
}

uint64_t __61__FCBaseURLConfiguration_ckMultiFetchBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ckMultiFetchBaseURLString];
}

- (id)ckEdgeCachedOrderFeedBaseURLForConfiguration
{
  return [(FCBaseURLConfiguration *)self baseURL:&__block_literal_global_136 fallback:FCDefaultCKEdgeCacheURLStringForEnvironment];
}

uint64_t __70__FCBaseURLConfiguration_ckEdgeCachedOrderFeedBaseURLForConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ckEdgeCachedOrderFeedBaseURLString];
}

+ (BOOL)hasOverrideCAPIURL
{
  v2 = +[FCBaseURLConfiguration overrideCAPIURLString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (id)overrideCAPIURLString
{
  v2 = NewsCoreUserDefaults();
  BOOL v3 = [v2 stringForKey:@"capi_base_url"];

  return v3;
}

- (void)setCoreConfiguration:(id)a3
{
}

@end