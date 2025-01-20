@interface BSUIReportIssueNetworkManager
- (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)reportConcern:(id)a3 completion:(id)a4;
@end

@implementation BSUIReportIssueNetworkManager

- (void)reportConcern:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_56540;
  v7[3] = &unk_390070;
  id v8 = a4;
  id v6 = v8;
  [(BSUIReportIssueNetworkManager *)self _callOnJSBridge:@"reportConcern" options:a3 completionHandler:v7];
}

- (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[JSABridge sharedInstance];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_56730;
  v14[3] = &unk_38F138;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 enqueueBlock:v14 file:@"BSUIReportIssueNetworkManager.m" line:48];
}

@end