@interface CRLImageFaceAnalyzer
+ (CGPoint)maskCenterForFacesInImageData:(id)a3 imageSize:(CGSize)a4 maskSize:(CGSize)a5 defaultCenter:(CGPoint)a6 assetOwner:(id)a7;
- (CRLImageFaceAnalyzer)initWithImageData:(id)a3 assetOwner:(id)a4;
- (_TtC8Freeform26CRLImageFaceAnalyzerResult)faceAnalyzerResult;
- (double)contentsScale;
- (double)p_largestAreaFromFaceRects:(id)a3;
- (id)p_faceRectsForResults:(id)a3;
- (id)p_interestingfaceRectsFromFaceRects:(id)a3;
- (void)p_analyzeFaceRectsIfNeeded;
- (void)p_analyzeFaceRectsWithProvider:(id)a3;
@end

@implementation CRLImageFaceAnalyzer

- (CRLImageFaceAnalyzer)initWithImageData:(id)a3 assetOwner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5480);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090C74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E54A0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFaceAnalyzer initWithImageData:assetOwner:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageFaceAnalyzer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 38, 0, "invalid nil value for '%{public}s'", "imageData");
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLImageFaceAnalyzer;
  v12 = [(CRLImageFaceAnalyzer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageData, a3);
    objc_storeStrong((id *)&v13->_assetOwner, a4);
  }

  return v13;
}

+ (CGPoint)maskCenterForFacesInImageData:(id)a3 imageSize:(CGSize)a4 maskSize:(CGSize)a5 defaultCenter:(CGPoint)a6 assetOwner:(id)a7
{
  double y = a6.y;
  double x = a6.x;
  double height = a5.height;
  double width = a5.width;
  double v11 = a4.height;
  double v12 = a4.width;
  id v14 = a7;
  id v15 = a3;
  v16 = [[CRLImageFaceAnalyzer alloc] initWithImageData:v15 assetOwner:v14];

  v17 = [(CRLImageFaceAnalyzer *)v16 faceAnalyzerResult];
  v18 = v17;
  if (v17)
  {
    [v17 maskCenterForFacesWithImageSize:v12 maskSize:v11 defaultCenter:CGPointMake(width, height, x, y)];
    double x = v19;
    double y = v20;
  }

  double v21 = x;
  double v22 = y;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)faceAnalyzerResult
{
  [(CRLImageFaceAnalyzer *)self p_analyzeFaceRectsIfNeeded];
  faceAnalyzerResult = self->_faceAnalyzerResult;

  return faceAnalyzerResult;
}

- (void)p_analyzeFaceRectsIfNeeded
{
  if (!self->_hasAnalyzedData)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_10024E5E8;
    double v19 = sub_10024E5F8;
    v3 = +[CRLImageProviderPool sharedPool];
    id v20 = [v3 providerForAsset:self->_imageData shouldValidate:1];

    if ([(id)v16[5] isValid]
      && ([(id)v16[5] isError] & 1) == 0)
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x3032000000;
      double v12 = sub_10024E5E8;
      v13 = sub_10024E5F8;
      uint64_t v4 = objc_opt_class();
      sub_1002469D0(v4, (void *)v16[5]);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v10[5])
      {
        -[CRLImageFaceAnalyzer p_analyzeFaceRectsWithProvider:](self, "p_analyzeFaceRectsWithProvider:");
      }
      else
      {
        v5 = [CRLImageResamplingOperation alloc];
        v6 = -[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:](v5, "initWithImageProvider:desiredSize:assetOwner:", v16[5], self->_assetOwner, CGSizeZero.width, CGSizeZero.height);
        id v7 = [(CRLImageResamplingOperation *)v6 performResampleOperationWithResampleOptions:2 bitmapContextOptions:3];
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10024E600;
        v8[3] = &unk_1014E5508;
        v8[5] = &v15;
        v8[6] = &v9;
        v8[4] = self;
        [v7 createAssetWithCompletionHandler:v8];
      }
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      [(CRLImageFaceAnalyzer *)self p_analyzeFaceRectsWithProvider:0];
    }
    _Block_object_dispose(&v15, 8);
  }
}

- (void)p_analyzeFaceRectsWithProvider:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 naturalSize];
    if (v6 >= v7) {
      double v8 = v6;
    }
    else {
      double v8 = v7;
    }
    if (v8 <= 5000.0)
    {
      id v9 = [v5 CGImageOfLargestSafeSize];
    }
    else
    {
      do
        double v8 = v8 * 0.5;
      while (v8 > 5000.0);
      id v9 = [v5 CGImageForSize:0 inContext:self orContentsScaleProvider:sub_100067200(v6, v7, v8, v8)];
    }
    id v10 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCGImage:orientation:options:", v9, sub_10043A698((uint64_t)objc_msgSend(v5, "orientation")), &__NSDictionary0__struct);
    id v11 = objc_alloc_init((Class)VNDetectFaceRectanglesRequest);
    id v21 = v11;
    double v12 = +[NSArray arrayWithObjects:&v21 count:1];
    id v20 = 0;
    [v10 performRequests:v12 error:&v20];
    id v13 = v20;

    if (v13)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014E5528);
      }
      id v14 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_101090DD4((uint64_t)v13, v14);
      }
    }
    else
    {
      uint64_t v15 = [v11 results];
      v16 = [(CRLImageFaceAnalyzer *)self p_faceRectsForResults:v15];

      if ([v16 count])
      {
        uint64_t v17 = [(CRLImageFaceAnalyzer *)self p_interestingfaceRectsFromFaceRects:v16];
        if ([v17 count])
        {
          v18 = [[_TtC8Freeform26CRLImageFaceAnalyzerResult alloc] initWithFaceRectValues:v17];
          faceAnalyzerResult = self->_faceAnalyzerResult;
          self->_faceAnalyzerResult = v18;
        }
      }
    }
  }
  self->_hasAnalyzedData = 1;
}

- (id)p_interestingfaceRectsFromFaceRects:(id)a3
{
  id v4 = a3;
  [(CRLImageFaceAnalyzer *)self p_largestAreaFromFaceRects:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10024EC10;
  v9[3] = &unk_1014E5548;
  v9[4] = v5;
  double v6 = [v4 indexesOfObjectsPassingTest:v9];
  double v7 = [v4 objectsAtIndexes:v6];

  return v7;
}

- (id)p_faceRectsForResults:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) boundingBox];
        if (v12 > 0.0199999996 && v13 > 0.0199999996)
        {
          v16[0] = v10;
          *(double *)&v16[1] = 1.0 - v11 - v13;
          *(double *)&v16[2] = v12;
          *(double *)&v16[3] = v13;
          id v14 = +[NSValue valueWithBytes:v16 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          [v4 addObject:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (double)p_largestAreaFromFaceRects:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) CGRectValue];
        if (v9 * v10 > v7) {
          double v7 = v9 * v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)contentsScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyzerResult, 0);
  objc_storeStrong((id *)&self->_assetOwner, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end