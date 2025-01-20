@interface IMDebugDownloadReportDataProvider
- (IMDebugDownloadReportDataProvider)init;
- (void)createDebugDataWithCompletion:(id)a3;
@end

@implementation IMDebugDownloadReportDataProvider

- (IMDebugDownloadReportDataProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDebugDownloadReportDataProvider;
  v2 = [(IMDebugDownloadReportDataProvider *)&v11 init];
  if (v2)
  {
    v3 = +[MTDB sharedInstance];
    v4 = [v3 privateQueueContext];

    id v5 = objc_alloc((Class)PFDownloadsStateReportCollector);
    v13[0] = kEpisodeUuid;
    v13[1] = kEpisodeDownloadBehavior;
    v13[2] = kEpisodeTitle;
    v6 = +[NSArray arrayWithObjects:v13 count:3];
    v12[0] = kPodcastUuid;
    v12[1] = kPodcastEpisodeLimit;
    v12[2] = kPodcastTitle;
    v12[3] = kPodcastDownloadedEpisodesCount;
    v7 = +[NSArray arrayWithObjects:v12 count:4];
    v8 = (PFDownloadsStateReportCollector *)[v5 initWithManagedObjectContext:v4 episodePropertiesToReport:v6 showPropertiesToReport:v7 allEpisodes:0];
    collector = v2->_collector;
    v2->_collector = v8;
  }
  return v2;
}

- (void)createDebugDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  collector = self->_collector;
  if (collector)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke;
    v8[3] = &unk_105A0;
    v9 = @"download-state-report.json";
    id v10 = v4;
    [(PFDownloadsStateReportCollector *)collector generateReportWithCompletionHandler:v8];
  }
  else
  {
    v7 = [@"Cannot open database" dataUsingEncoding:4];
    ((void (**)(void, void *, const __CFString *))v5)[2](v5, v7, @"download-state-report.json");
  }
}

uint64_t __67__IMDebugDownloadReportDataProvider_createDebugDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end