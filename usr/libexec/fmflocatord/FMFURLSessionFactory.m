@interface FMFURLSessionFactory
+ (id)sessionWithConfiguration:(id)a3;
+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
@end

@implementation FMFURLSessionFactory

+ (id)sessionWithConfiguration:(id)a3
{
  return +[FMFURLSessionFactory sessionWithConfiguration:a3 delegate:0 delegateQueue:0];
}

+ (id)sessionWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[FMSystemInfo sharedInstance];
  unsigned int v11 = [v10 isInternalBuild];

  if (v11
    && (unsigned int v12 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", @"RedirectServerToFile", @"com.apple.icloud.fmflocatord.notbackedup"), v13 = +[FMPreferencesUtil integerForKey:@"RequestTimeoutSeconds" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"], v12))
  {
    double v14 = (double)(uint64_t)v13;
    v15 = +[FMFAutomationHelperFactory sharedFactory];
    v16 = (objc_class *)[v15 automationHelperClassWithName:@"FMDFileURLSession"];

    id v17 = [v16 alloc];
    v18 = [v9 underlyingQueue];
    v19 = (FMFNSURLSession *)[v17 initWithConfiguration:v7 delegate:v8 delegateQueue:v18];

    [(FMFNSURLSession *)v19 setRequestTimeout:v14];
  }
  else
  {
    v19 = objc_alloc_init(FMFNSURLSession);
    v20 = +[NSURLSession sessionWithConfiguration:v7 delegate:0 delegateQueue:v9];
    [(FMFNSURLSession *)v19 setSession:v20];
    [(FMFNSURLSession *)v19 setDelegate:v8];
  }

  return v19;
}

@end