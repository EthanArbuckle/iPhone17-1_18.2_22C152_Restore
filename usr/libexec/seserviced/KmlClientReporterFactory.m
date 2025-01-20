@interface KmlClientReporterFactory
+ (id)getReporter;
+ (id)getTestReporter;
+ (void)removeTestReporter;
@end

@implementation KmlClientReporterFactory

+ (id)getReporter
{
  v2 = (void *)qword_100468398;
  if (!qword_100468398)
  {
    v2 = (void *)qword_100468390;
    if (!qword_100468390)
    {
      v3 = objc_alloc_init(KmlWalletReporter);
      v4 = (void *)qword_100468390;
      qword_100468390 = (uint64_t)v3;

      v2 = (void *)qword_100468390;
    }
  }
  id v5 = v2;

  return v5;
}

+ (id)getTestReporter
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlClientReporterFactory getTestReporter]", 53, &stru_100421848, v2, v3, v4, v5, v10);
  v6 = (void *)qword_100468398;
  if (!qword_100468398)
  {
    v7 = objc_alloc_init(KmlTestClientReporter);
    v8 = (void *)qword_100468398;
    qword_100468398 = (uint64_t)v7;

    v6 = (void *)qword_100468398;
  }

  return v6;
}

+ (void)removeTestReporter
{
  uint64_t v2 = qword_100468398;
  if (qword_100468398)
  {
    ++*(_DWORD *)(qword_100468398 + 64);
    if (![*(id *)(v2 + 8) count] || *(_DWORD *)(v2 + 64) >= *(_DWORD *)(v2 + 68))
    {
      [(id)qword_100468398 cleanup];
      uint64_t v3 = (void *)qword_100468398;
      qword_100468398 = 0;
    }
  }
}

@end