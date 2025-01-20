@interface DMDAssetRemoveOperation
- (void)main;
- (void)removeOperationDidFinish:(id)a3 asset:(id)a4;
@end

@implementation DMDAssetRemoveOperation

- (void)main
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002850C;
  v2[3] = &unk_1000CA580;
  v2[4] = self;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v2];
}

- (void)removeOperationDidFinish:(id)a3 asset:(id)a4
{
  [a3 error];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028988;
  v6[3] = &unk_1000CA5D0;
  v6[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v7;
  [(DMDPayloadActionOperation *)self performBackgroundContextBlock:v6];
}

@end