@interface DMDConfigurationReplaceOperation
- (void)installationOperationDidFinish:(id)a3 userInfo:(id)a4;
- (void)main;
@end

@implementation DMDConfigurationReplaceOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100034324;
  v2[3] = &unk_1000CA580;
  v2[4] = self;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v2];
}

- (void)installationOperationDidFinish:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 error];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000348D8;
  v11[3] = &unk_1000CA650;
  v11[4] = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = v12;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v11];
}

@end