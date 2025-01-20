@interface CRLMoviePosterImageGenerator
- (CGImage)copyAssetCoverArtMetadataWithError:(id *)a3;
- (CGImage)copyCGImageAtTime:(id *)a3 error:(id *)a4;
- (CGImage)p_applyPreferredTransform:(CGAffineTransform *)a3 toImage:(CGImage *)a4;
- (CGImage)p_copyCGImageForTime:(id *)a3 error:(id *)a4;
- (CGImage)p_copyCGImageUsingAssetImageGeneratorForTime:(id *)a3 error:(id *)a4;
- (CGImage)p_copyCGImageUsingAssetReaderForTime:(id *)a3;
- (CGSize)maximumSize;
- (CGSize)p_scaledSizeForRenderSize:(CGSize)result;
- (CRLMoviePosterImageGenerator)initWithAsset:(id)a3;
- (id)p_coverArtDataWith:(id)a3;
- (void)cancelAllCGImageGeneration;
- (void)dealloc;
- (void)generateCGImageAsynchronouslyForTime:(id *)a3 completionHandler:(id)a4;
- (void)setMaximumSize:(CGSize)a3;
@end

@implementation CRLMoviePosterImageGenerator

- (CRLMoviePosterImageGenerator)initWithAsset:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLMoviePosterImageGenerator;
  v6 = [(CRLMoviePosterImageGenerator *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v8 = (AVAssetImageGenerator *)[objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v5];
    assetImageGenerator = v7->_assetImageGenerator;
    v7->_assetImageGenerator = v8;

    v10 = v7->_assetImageGenerator;
    long long v17 = *(_OWORD *)&kCMTimeZero.value;
    long long v14 = v17;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    CMTimeEpoch v11 = epoch;
    [(AVAssetImageGenerator *)v10 setRequestedTimeToleranceAfter:&v17];
    v12 = v7->_assetImageGenerator;
    long long v15 = v14;
    CMTimeEpoch v16 = v11;
    [(AVAssetImageGenerator *)v12 setRequestedTimeToleranceBefore:&v15];
    [(AVAssetImageGenerator *)v7->_assetImageGenerator setAppliesPreferredTrackTransform:1];
    v7->_maximumSize = CGSizeZero;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CRLMoviePosterImageGenerator;
  [(CRLMoviePosterImageGenerator *)&v2 dealloc];
}

- (CGSize)p_scaledSizeForRenderSize:(CGSize)result
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  if (width != CGSizeZero.width || height != CGSizeZero.height)
  {
    if (width <= 0.0) {
      double width = result.width;
    }
    if (height <= 0.0) {
      double height = result.height;
    }
    if (width < result.width || height < result.height)
    {
      float v7 = width / result.width;
      float v8 = height / result.height;
      result.double height = result.height * v7;
      result.double width = result.width * v8;
      if (v7 >= v8) {
        result.double height = height;
      }
      else {
        result.double width = width;
      }
    }
  }
  return result;
}

- (CGImage)p_copyCGImageUsingAssetReaderForTime:(id *)a3
{
  id v6 = objc_alloc((Class)AVAssetReader);
  asset = self->_asset;
  id v32 = 0;
  id v8 = [v6 initWithAsset:asset error:&v32];
  id v9 = v32;
  if (v8)
  {
    CMTime start = (CMTime)*a3;
    CMTime duration = kCMTimePositiveInfinity;
    CMTimeRangeMake(&v31, &start, &duration);
    CMTimeRange v28 = v31;
    [v8 setTimeRange:&v28];
    v10 = [(AVAsset *)self->_asset crl_firstTrackWithMediaType:AVMediaTypeVideo];
    CMTimeEpoch v11 = v10;
    if (v10)
    {
      [v10 naturalSize];
      -[CRLMoviePosterImageGenerator p_scaledSizeForRenderSize:](self, "p_scaledSizeForRenderSize:");
      double v13 = v12;
      v33[0] = kCVPixelBufferWidthKey;
      long long v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v34[0] = v14;
      v33[1] = kCVPixelBufferHeightKey;
      long long v15 = +[NSNumber numberWithDouble:v13];
      v34[1] = v15;
      v34[2] = &off_10155D0E8;
      v33[2] = kCVPixelBufferPixelFormatTypeKey;
      v33[3] = kCVPixelBufferMetalCompatibilityKey;
      v34[3] = &__kCFBooleanTrue;
      CMTimeEpoch v16 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];

      id v17 = [objc_alloc((Class)AVAssetReaderTrackOutput) initWithTrack:v11 outputSettings:v16];
      [v8 addOutput:v17];
      [v8 startReading];
      v18 = (opaqueCMSampleBuffer *)[v17 copyNextSampleBuffer];
      if (v18)
      {
        objc_super v19 = v18;
        unsigned int v20 = atomic_load((unsigned int *)&self->_isCancelled);
        if (!v20 && CMSampleBufferGetImageBuffer(v18)) {
          atomic_load((unsigned int *)&self->_isCancelled);
        }
        CFRelease(v19);
      }
      else
      {
        int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE2A8);
        }
        v21 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106B090(v21, (uint64_t)v8, v27);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE2C8);
        }
        v22 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v22);
        }
        v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator p_copyCGImageUsingAssetReaderForTime:]");
        v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"];
        v25 = [v8 error];
        +[CRLAssertionHandler handleFailureInFunction:v23, v24, 111, 0, "Failed to copy buffer when generating poster frame using AVAssetReader (error: %@). Falling back to AVAssetImageGenerator.", v25 file lineNumber isFatal description];
      }
      [v8 cancelReading];
    }
  }

  return 0;
}

- (CGImage)p_applyPreferredTransform:(CGAffineTransform *)a3 toImage:(CGImage *)a4
{
  CGImageGetWidth(a4);
  CGImageGetHeight(a4);
  double v6 = sub_100064070();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  long long v14 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v25.c = v14;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a3->tx;
  *(CGFloat *)&long long v14 = v9;
  CGRect v26 = CGRectApplyAffineTransform(*(CGRect *)&v6, &v25);
  double width = v26.size.width;
  double height = v26.size.height;
  unint64_t BitsPerComponent = CGImageGetBitsPerComponent(a4);
  ColorSpace = CGImageGetColorSpace(a4);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a4);
  unsigned int v20 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, BitsPerComponent, (unint64_t)(width * (double)BitsPerComponent), ColorSpace, BitmapInfo);
  if (!v20) {
    return 0;
  }
  v21 = v20;
  CGContextScaleCTM(v20, -1.0, -1.0);
  CGContextTranslateCTM(v21, -width, -height);
  long long v22 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a3->tx;
  CGContextConcatCTM(v21, &v25);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.double width = v11;
  v27.size.double height = v13;
  CGContextDrawImage(v21, v27, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

- (CGImage)p_copyCGImageUsingAssetImageGeneratorForTime:(id *)a3 error:(id *)a4
{
  assetImageGenerator = self->_assetImageGenerator;
  if (!assetImageGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE2E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B180();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE308);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    CGFloat v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator p_copyCGImageUsingAssetImageGeneratorForTime:error:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 165, 0, "invalid nil value for '%{public}s'", "_assetImageGenerator");

    assetImageGenerator = self->_assetImageGenerator;
  }
  -[AVAssetImageGenerator setMaximumSize:](assetImageGenerator, "setMaximumSize:", self->_maximumSize.width, self->_maximumSize.height);
  CGFloat v11 = self->_assetImageGenerator;
  long long v13 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  return [(AVAssetImageGenerator *)v11 copyCGImageAtTime:&v13 actualTime:0 error:a4];
}

- (CGImage)p_copyCGImageForTime:(id *)a3 error:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(CRLMoviePosterImageGenerator *)self p_copyCGImageUsingAssetImageGeneratorForTime:&v5 error:a4];
}

- (CGImage)copyCGImageAtTime:(id *)a3 error:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(CRLMoviePosterImageGenerator *)self p_copyCGImageForTime:&v5 error:a4];
}

- (id)p_coverArtDataWith:(id)a3
{
  id v3 = a3;
  v4 = +[AVMetadataItem metadataItemsFromArray:v3 filteredByIdentifier:AVMetadataCommonIdentifierArtwork];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v4 firstObject];

  if (!v5)
  {
    double v6 = +[AVMetadataItem metadataItemsFromArray:v3 filteredByIdentifier:@"caaf/aart"];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [v6 firstObject];
  }
  CGFloat v7 = [v5 dataValue];

  return v7;
}

- (CGImage)copyAssetCoverArtMetadataWithError:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(AVAsset *)self->_asset commonMetadata];
  double v6 = [(CRLMoviePosterImageGenerator *)self p_coverArtDataWith:v5];
  if (v6
    && (+[CRLImage imageWithData:v6],
        (CGFloat v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v8 = v7;
    CGFloat v9 = CGImageRetain((CGImageRef)[v7 CGImage]);
  }
  else if (a3)
  {
    +[NSError errorWithDomain:AVFoundationErrorDomain code:-11832 userInfo:0];
    CGFloat v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGFloat v9 = 0;
  }

  return v9;
}

- (void)generateCGImageAsynchronouslyForTime:(id *)a3 completionHandler:(id)a4
{
  double v6 = (void (**)(id, CGImage *, BOOL, id))a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE328);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106B230();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE348);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator generateCGImageAsynchronouslyForTime:completionHandler:]");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 214, 0, "invalid nil value for '%{public}s'", "handler");

    goto LABEL_14;
  }
  if (![(AVAsset *)self->_asset crl_containsVideoTracks])
  {
    id v12 = 0;
    CGFloat v11 = [(CRLMoviePosterImageGenerator *)self copyAssetCoverArtMetadataWithError:&v12];
    id v9 = v12;
    v6[2](v6, v11, v11 == 0, v9);
LABEL_14:

    goto LABEL_15;
  }
  CGFloat v7 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054C4C;
  block[3] = &unk_1014CE370;
  block[4] = self;
  long long v15 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  long long v14 = v6;
  dispatch_async(v7, block);

LABEL_15:
}

- (void)cancelAllCGImageGeneration
{
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->_maximumSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImageGenerator, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

@end