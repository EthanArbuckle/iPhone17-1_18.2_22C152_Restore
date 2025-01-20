@interface FMDURLSessionFactory
+ (id)sessionWithConfiguration:(id)a3;
+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
@end

@implementation FMDURLSessionFactory

+ (id)sessionWithConfiguration:(id)a3
{
  return +[FMDURLSessionFactory sessionWithConfiguration:a3 delegate:0 delegateQueue:0];
}

+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[FMSystemInfo sharedInstance];
  unsigned int v11 = [v10 isInternalBuild];

  if (v11
    && (unsigned int v12 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", @"RedirectServerToFile", kFMDNotBackedUpPrefDomain), v13 = +[FMPreferencesUtil integerForKey:inDomain:](FMPreferencesUtil, "integerForKey:inDomain:", @"RequestTimeoutSeconds", kFMDNotBackedUpPrefDomain), v14 = +[FMPreferencesUtil integerForKey:@"UseSimpleFilePath" inDomain:kFMDNotBackedUpPrefDomain], v12))
  {
    BOOL v15 = v14 != 0;
    double v16 = (double)(uint64_t)v13;
    v17 = +[FMDAutomationHelperFactory sharedFactory];
    v18 = (objc_class *)[v17 automationHelperClassWithName:@"FMDFileURLSession"];

    id v19 = [v18 alloc];
    v20 = [v9 underlyingQueue];
    v21 = (FMDNSURLSession *)[v19 initWithConfiguration:v7 delegate:v8 delegateQueue:v20];

    [(FMDNSURLSession *)v21 setRequestTimeout:v16];
    [(FMDNSURLSession *)v21 setUseSimpleFilePath:v15];
  }
  else
  {
    v21 = objc_alloc_init(FMDNSURLSession);
    v22 = +[NSURLSession sessionWithConfiguration:v7 delegate:v21 delegateQueue:v9];
    [(FMDNSURLSession *)v21 setSession:v22];
    [(FMDNSURLSession *)v21 setDelegate:v8];
  }

  return v21;
}

@end