@interface WFHandoffSimulator
+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6;
+ (id)temporaryFileURLBySerializingUserInfo:(id)a3;
+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4;
+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4;
+ (void)registerHandoffURLRequestHandler:(id)a3;
@end

@implementation WFHandoffSimulator

+ (void)registerHandoffURLRequestHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 27, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = +[ICManager sharedManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B30F8;
  v9[3] = &unk_1000E7F58;
  id v10 = v5;
  id v11 = a1;
  id v7 = v5;
  [v6 registerHandler:v9 forIncomingRequestsWithAction:@"continue-user-activity" scheme:0];
}

+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = [v6 objectForKey:WFHandoffSourceKey];
  v9 = (void *)v8;
  id v10 = (void *)WFWorkflowRunSourceHandoff;
  if (v8) {
    id v10 = (void *)v8;
  }
  id v11 = v10;

  v12 = [v6 objectForKey:WFHandoffWorkflowControllerStateKey];
  uint64_t v13 = [v6 objectForKey:WFHandoffWorkflowControllerStateDataKey];
  v14 = (void *)v13;
  if (v12)
  {
    v7[2](v7, v12, v11);
  }
  else if (v13)
  {
    v15 = +[NSSet setWithObject:objc_opt_class()];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000B27A8;
    v21[3] = &unk_1000E7F80;
    v23 = v7;
    id v22 = v11;
    id v16 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:v14 allowedClasses:v15 completionHandler:v21];
  }
  else
  {
    v17 = [v6 objectForKey:@"userInfoURL"];
    v18 = +[NSURL URLWithString:v17];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B27BC;
    v19[3] = &unk_1000E7FA8;
    v20 = v7;
    [a1 deserializeUserInfoAtURL:v18 completionHandler:v19];
  }
}

+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = WFHandoffWorkflowControllerStateKey;
  v17[1] = WFHandoffSourceKey;
  v18[0] = v6;
  v18[1] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v9 = [a1 temporaryFileURLBySerializingUserInfo:v8];
  if (v9)
  {
    id v10 = objc_alloc((Class)NSUserActivity);
    id v11 = [v10 initWithActivityType:WFHandoffContinueWorkflowActivityType];
    CFStringRef v15 = @"userInfoURL";
    v12 = [v9 absoluteString];
    id v16 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v11 setUserInfo:v13];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  id v5 = (void (**)(id, void))a4;
  if ([v19 isFileURL]
    && (+[WFTemporaryFileManager sharedAppGroupDirectoryURL](WFTemporaryFileManager, "sharedAppGroupDirectoryURL"), v6 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v7 = objc_msgSend(v19, "wf_isContainedByDirectoryAtURL:", v6), v6, (v7 & 1) != 0))
  {
    uint64_t v8 = +[WFFileType typeWithUTType:UTTypePropertyList];
    v9 = +[WFFileRepresentation fileWithURL:v19 options:1 ofType:v8];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    CFStringRef v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    id v16 = [v15 mutableCopy];

    [v16 addObject:objc_opt_class()];
    [v16 addObject:objc_opt_class()];
    v17 = [v9 mappedData];
    id v18 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:v17 allowedClasses:v16 completionHandler:v5];
  }
  else
  {
    v5[2](v5, 0);
  }
}

+ (id)temporaryFileURLBySerializingUserInfo:(id)a3
{
  v3 = +[NSKeyedArchiver wf_securelyArchivedDataWithRootObject:a3 deletionResponsibility:1];
  v4 = +[WFTemporaryFileManager proposedSharedTemporaryFileURLForFilename:@"URLHandoffUserInfo.plist"];
  id v5 = [v4 URLByDeletingLastPathComponent];
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v5 path];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = +[NSFileManager defaultManager];
    id v16 = 0;
    [v10 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v9 = v16;
  }
  id v15 = v9;
  unsigned int v11 = [v3 writeToURL:v4 options:0 error:&v15];
  id v12 = v15;

  id v13 = 0;
  if (v11) {
    id v13 = v4;
  }

  return v13;
}

+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !v8)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 70, @"Invalid parameter not satisfying: %@", @"state && handoffSource" object file lineNumber description];
  }
  v14[0] = WFHandoffWorkflowControllerStateKey;
  v14[1] = WFHandoffSourceKey;
  v15[0] = v7;
  v15[1] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  unsigned int v11 = [a1 URLForSimulatingHandoffWithActivityType:WFHandoffContinueWorkflowActivityType userInfo:v10 webpageURL:0 fromSource:v9];

  return v11;
}

+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v14;
  if (!v12 || !v14)
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 41, @"Invalid parameter not satisfying: %@", @"userInfo && handoffSource" object file lineNumber description];
  }
  unsigned int v16 = [v11 isEqualToString:NSUserActivityTypeBrowsingWeb];
  if (v13 && v16)
  {
    id v17 = v13;
    goto LABEL_13;
  }
  id v18 = objc_opt_new();
  id v19 = +[NSURLQueryItem queryItemWithName:@"type" value:v11];
  [v18 addObject:v19];

  if (!v12) {
    goto LABEL_9;
  }
  v20 = [a1 temporaryFileURLBySerializingUserInfo:v12];
  id v17 = v20;
  if (v20)
  {
    v21 = [v20 absoluteString];
    id v22 = +[NSURLQueryItem queryItemWithName:@"userInfoURL" value:v21];
    [v18 addObject:v22];

LABEL_9:
    if (v13)
    {
      v23 = [v13 absoluteString];
      v24 = +[NSURLQueryItem queryItemWithName:@"webpageURL" value:v23];
      [v18 addObject:v24];
    }
    v25 = objc_opt_new();
    [v25 setScheme:WFWorkflowActiveURLScheme];
    [v25 setHost:@"continue-user-activity"];
    [v25 setQueryItems:v18];
    id v17 = [v25 URL];
  }
LABEL_13:

  return v17;
}

@end