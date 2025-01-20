@interface CRLImageCompatibilityConverter
+ (void)initialize;
- (CRLImageCompatibilityConverter)initWithImageData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5;
- (CRLProgress)progress;
- (NSError)error;
- (_TtC8Freeform8CRLAsset)convertedMediaData;
- (int64_t)mediaType;
- (void)cancel;
- (void)convertMediaWithCompletionHandler:(id)a3;
- (void)p_completeConversionWithCompletionHandler:(id)a3;
- (void)p_performAsyncMediaConversionWorkWithCompletionHandler:(id)a3;
@end

@implementation CRLImageCompatibilityConverter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[CRLWidthLimitedQueue alloc] initWithLimit:10];
    v3 = (void *)qword_1016A8F78;
    qword_1016A8F78 = (uint64_t)v2;
  }
}

- (CRLImageCompatibilityConverter)initWithImageData:(id)a3 desiredCompatibilityLevel:(int64_t)a4 assetOwner:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D09E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106FD94();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0A08);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 56, 0, "Invalid parameter not satisfying: %{public}s", "imageData != nil");
  }
  v23.receiver = self;
  v23.super_class = (Class)CRLImageCompatibilityConverter;
  v14 = [(CRLImageCompatibilityConverter *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mImageData, a3);
    v16 = [[CRLBasicProgress alloc] initWithMaxValue:1.0];
    mProgress = v15->mProgress;
    v15->mProgress = v16;

    v15->mDesiredCompatibilityLevel = a4;
    objc_storeStrong((id *)&v15->mAssetOwner, a5);
    if (v15->mDesiredCompatibilityLevel <= 2)
    {
      int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0A28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106FCDC((uint64_t)&v15->mDesiredCompatibilityLevel, v18);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D0A48);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter initWithImageData:desiredCompatibilityLevel:assetOwner:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 63, 0, "Image converter created without need for conversion (level %zd)", v15->mDesiredCompatibilityLevel);
    }
  }

  return v15;
}

- (void)convertMediaWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!self->mImageData)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0A68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106FE2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0A88);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter convertMediaWithCompletionHandler:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 73, 0, "invalid nil value for '%{public}s'", "mImageData");
  }
  v8 = (void *)qword_1016A8F78;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000877D4;
  v10[3] = &unk_1014D0AB0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 performAsync:v10];
}

- (void)p_performAsyncMediaConversionWorkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CRLAsset *)self->mImageData type];
  v6 = +[CRLIngestionTypes imageUTTypesThatRequireConversion];
  if (objc_msgSend(v5, "crl_conformsToAnyUTType:", v6))
  {

    goto LABEL_4;
  }
  v7 = [(CRLAsset *)self->mImageData type];
  v8 = +[CRLIngestionTypes highEfficiencyImageUTTypes];
  unsigned int v9 = [v7 crl_conformsToAnyUTType:v8];

  if (v9)
  {
LABEL_4:
    int64_t mDesiredCompatibilityLevel = self->mDesiredCompatibilityLevel;
    id v11 = +[CRLImageProviderPool sharedPool];
    v12 = [v11 temporaryProviderForAsset:self->mImageData shouldValidate:1];

    if (mDesiredCompatibilityLevel == 3)
    {
      uint64_t v13 = objc_opt_class();
      v14 = sub_1002469D0(v13, v12);
      v15 = [CRLImageResamplingOperation alloc];
      [v14 naturalSize];
      v16 = -[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:](v15, "initWithImageProvider:desiredSize:assetOwner:", v14, self->mAssetOwner);
      v17 = [(CRLAsset *)self->mImageData filename];
      [(CRLImageResamplingOperation *)v16 setDisplayName:v17];

      int v18 = [(CRLImageResamplingOperation *)v16 performResampleOperationWithResampleOptions:16 bitmapContextOptions:9];
      if (!v18)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0AD0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106FEC4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D0AF0);
        }
        v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v19);
        }
        v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageCompatibilityConverter p_performAsyncMediaConversionWorkWithCompletionHandler:]");
        v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageCompatibilityConverter.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 112, 0, "invalid nil value for '%{public}s'", "convertedImageDataWrapper");
      }
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100087CD4;
      v28[3] = &unk_1014D0B58;
      v28[4] = self;
      id v29 = v4;
      [v18 createAssetWithCompletionHandler:v28];

      goto LABEL_22;
    }
    if (([v12 isError] & 1) == 0)
    {
      v14 = sub_100456598(self->mImageData, self->mAssetOwner);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100087F40;
      v26[3] = &unk_1014D0B58;
      v26[4] = self;
      id v27 = v4;
      [v14 createAssetWithCompletionHandler:v26];
      v22 = v27;
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v23 = +[CRLImageProviderPool sharedPool];
  v12 = [v23 temporaryProviderForAsset:self->mImageData shouldValidate:1];

  if (([v12 isError] & 1) == 0)
  {
    v14 = sub_10045658C(self->mImageData, self->mAssetOwner);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000881AC;
    v24[3] = &unk_1014D0B58;
    v24[4] = self;
    id v25 = v4;
    [v14 createAssetWithCompletionHandler:v24];
    v22 = v25;
    goto LABEL_21;
  }
LABEL_19:
  [(CRLImageCompatibilityConverter *)self p_completeConversionWithCompletionHandler:v4];
LABEL_23:
}

- (int64_t)mediaType
{
  return 2;
}

- (void)p_completeConversionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!self->mConvertedImageData)
  {
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->mIsCancelled);
    if ((v5 & 1) == 0)
    {
      id v6 = objc_alloc((Class)NSError);
      v14[0] = NSLocalizedDescriptionKey;
      v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"This image can’t be added." value:0 table:0];
      v15[0] = v8;
      v14[1] = NSLocalizedFailureReasonErrorKey;
      unsigned int v9 = +[NSBundle mainBundle];
      id v10 = [v9 localizedStringForKey:@"The file couldn’t be converted into a compatible format." value:0 table:0];
      v15[1] = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      v12 = (NSError *)[v6 initWithDomain:@"com.apple.freeform.CRLErrorDomainMediaCompatibility" code:100 userInfo:v11];
      mError = self->mError;
      self->mError = v12;
    }
  }
  [(CRLBasicProgress *)self->mProgress setValue:1.0];
  if (v4) {
    v4[2](v4);
  }
}

- (void)cancel
{
}

- (NSError)error
{
  return self->mError;
}

- (_TtC8Freeform8CRLAsset)convertedMediaData
{
  return self->mConvertedImageData;
}

- (CRLProgress)progress
{
  return &self->mProgress->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);
  objc_storeStrong((id *)&self->mConvertedImageData, 0);
  objc_storeStrong((id *)&self->mProgress, 0);

  objc_storeStrong((id *)&self->mImageData, 0);
}

@end