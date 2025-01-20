@interface RAPEntryPointViewControllerFactory
+ (void)createViewControllerWithEntryPointProvider:(id)a3 appStateCreator:(id)a4 completion:(id)a5 wasCancelled:(id)a6 willSend:(id)a7 wasSent:(id)a8;
@end

@implementation RAPEntryPointViewControllerFactory

+ (void)createViewControllerWithEntryPointProvider:(id)a3 appStateCreator:(id)a4 completion:(id)a5 wasCancelled:(id)a6 willSend:(id)a7 wasSent:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v13)
  {
    id v18 = a4;
    +[UIApplication sharedMapsDelegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1004B4660;
    v20[3] = &unk_1012EC538;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v15;
    id v22 = v13;
    id v24 = v16;
    id v25 = v17;
    id v26 = v14;
    id v19 = v21;
    [v18 createReportAProblemAppStateWithCompletion:v20];
  }
}

@end