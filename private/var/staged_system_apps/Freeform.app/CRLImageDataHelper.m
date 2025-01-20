@interface CRLImageDataHelper
- (CGSize)naturalSize;
- (CRLAssetOwning)assetOwner;
- (CRLImageDataHelper)initWithImageData:(id)a3 assetOwner:(id)a4;
- (_TtC8Freeform8CRLAsset)imageData;
- (void)generateThumbnailImageDataWithCompletionHandler:(id)a3;
@end

@implementation CRLImageDataHelper

- (CRLImageDataHelper)initWithImageData:(id)a3 assetOwner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLImageDataHelper;
  v9 = [(CRLImageDataHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageData, a3);
    objc_storeStrong((id *)&v10->_assetOwner, a4);
  }

  return v10;
}

- (CGSize)naturalSize
{
  v2 = [(CRLImageDataHelper *)self imageData];
  v3 = +[CRLImageProviderPool sharedPool];
  v4 = [v3 providerForAsset:v2 shouldValidate:1];

  [v4 naturalSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)generateThumbnailImageDataWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  double v5 = [(CRLImageDataHelper *)self imageData];
  if ([v5 needsDownload])
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2B98);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101073C28(v6, v7);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2BB8);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v8, v6);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageDataHelper generateThumbnailImageDataWithCompletionHandler:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageDataHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:52 isFatal:0 description:"Needs to implement download-handling thumbnail creation!"];

    v4[2](v4, 0);
  }
  else
  {
    v11 = sub_100454D5C(v5, 3, self->_assetOwner, 256.0, 256.0);
    if (v11)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000BBD74;
      v12[3] = &unk_1014D0B58;
      id v13 = v5;
      v14 = v4;
      [v11 createAssetWithCompletionHandler:v12];
    }
    else
    {
      v4[2](v4, 0);
    }
  }
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->_imageData;
}

- (CRLAssetOwning)assetOwner
{
  return self->_assetOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOwner, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end