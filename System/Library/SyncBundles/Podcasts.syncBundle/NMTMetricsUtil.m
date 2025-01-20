@interface NMTMetricsUtil
+ (id)_downloadableEpisodeUUIDsURL;
+ (id)downloadableEpisodeUUIDs;
+ (void)setDownloadableEpisodeUUIDs:(id)a3;
@end

@implementation NMTMetricsUtil

+ (void)setDownloadableEpisodeUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [a1 _downloadableEpisodeUUIDsURL];
  [v4 writeToURL:v5 atomically:1];

  v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = [v4 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Did set %lu metrics downloadable episode UUIDs", (uint8_t *)&v7, 0xCu);
  }
}

+ (id)downloadableEpisodeUUIDs
{
  id v3 = objc_alloc((Class)NSArray);
  id v4 = [a1 _downloadableEpisodeUUIDsURL];
  id v5 = [v3 initWithContentsOfURL:v4];

  v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Did fetch %lu metrics downloadable episode UUIDs", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

+ (id)_downloadableEpisodeUUIDsURL
{
  v2 = +[MTConstants sharedDocumentsDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"metricsDownloadableEpisodeUUIDs"];

  return v3;
}

@end