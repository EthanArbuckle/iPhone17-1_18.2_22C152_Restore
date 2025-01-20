@interface SiriAnalyticsPreprocessor
- (SiriAnalyticsPreprocessor)init;
- (SiriAnalyticsPreprocessor)initWithMetastore:(id)a3 metastoreQueue:(id)a4 fbf:(id)a5 telemetry:(id)a6 messageTailing:(id)a7 messageStaging:(id)a8 localStorage:(id)a9 uspUploadQueue:(id)a10;
- (void)triggerWithReason:(int64_t)a3 completion:(id)a4;
@end

@implementation SiriAnalyticsPreprocessor

- (SiriAnalyticsPreprocessor)initWithMetastore:(id)a3 metastoreQueue:(id)a4 fbf:(id)a5 telemetry:(id)a6 messageTailing:(id)a7 messageStaging:(id)a8 localStorage:(id)a9 uspUploadQueue:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  return (SiriAnalyticsPreprocessor *)PreprocessorShim.init(metastore:metastoreQueue:fbf:telemetry:messageTailing:messageStaging:localStorage:uspUploadQueue:)(v15, v16, v17, a6, a7, a8, (uint64_t *)a9, (char *)a10);
}

- (void)triggerWithReason:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1A2B588E4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1A2B5798C(a3, (uint64_t)v6, v7);
  sub_1A2B5889C((uint64_t)v6);
}

- (SiriAnalyticsPreprocessor)init
{
}

- (void).cxx_destruct
{
}

@end