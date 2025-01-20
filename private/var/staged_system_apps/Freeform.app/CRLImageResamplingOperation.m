@interface CRLImageResamplingOperation
- (CGSize)desiredAlternateSizeIfConvertedToPNG;
- (CGSize)desiredSize;
- (CRLImageProvider)imageProvider;
- (CRLImageResamplingOperation)init;
- (CRLImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4 assetOwner:(id)a5;
- (NSString)displayName;
- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4;
- (void)setDesiredAlternateSizeIfConvertedToPNG:(CGSize)a3;
- (void)setDesiredSize:(CGSize)a3;
- (void)setDisplayName:(id)a3;
- (void)setImageProvider:(id)a3;
@end

@implementation CRLImageResamplingOperation

- (CRLImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4 assetOwner:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E08D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088A08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E08F8);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 41, 0, "Invalid parameter not satisfying: %{public}s", "imageProvider != nil");
  }
  v24.receiver = self;
  v24.super_class = (Class)CRLImageResamplingOperation;
  v15 = [(CRLImageResamplingOperation *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mImageProvider, a3);
    v16->mDesiredSize.double width = width;
    v16->mDesiredSize.double height = height;
    objc_storeStrong((id *)&v16->mAssetOwner, a5);
    if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
    {
      if (width * height > (double)sub_1004549A8())
      {
        int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E0918);
        }
        v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108890C(v18, v17, width, height);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E0938);
        }
        v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v19);
        }
        v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:]");
        v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
        v25.double width = width;
        v25.double height = height;
        v22 = NSStringFromCGSize(v25);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 47, 0, "Should not be resampling an image to this size %{public}@ on a platform with memory limits!", v22);
      }
    }
  }

  return v16;
}

- (CRLImageResamplingOperation)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0958);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLImageResamplingOperation init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m";
    __int16 v17 = 1024;
    int v18 = 55;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0978);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:55 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLImageResamplingOperation init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setDesiredAlternateSizeIfConvertedToPNG:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLImageResamplingOperation *)self desiredSize];
  if (width <= v6 && ([(CRLImageResamplingOperation *)self desiredSize], height <= v7))
  {
    self->mDesiredAlternateSizeIfConvertedToPNG.double width = width;
    self->mDesiredAlternateSizeIfConvertedToPNG.double height = height;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0998);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088A9C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E09B8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation setDesiredAlternateSizeIfConvertedToPNG:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:66 isFatal:0 description:"Should not provide a size that is larger than our default size!"];
  }
}

- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4
{
  char v4 = a4;
  char v5 = a3;
  double v7 = [(CRLImageResamplingOperation *)self imageProvider];
  [v7 naturalSize];
  double v9 = v8;
  double v11 = v10;

  if ((v5 & 8) != 0)
  {
    [(CRLImageResamplingOperation *)self desiredAlternateSizeIfConvertedToPNG];
    if (v13 != CGSizeZero.width || v12 != CGSizeZero.height)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E09D8);
      }
      __int16 v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_101088E50();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E09F8);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
        sub_101088C60();
      }

      __int16 v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
      int v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:81 isFatal:0 description:"Should not specify an alternate size if a precise size is required!"];
    }
  }
  uint64_t v19 = v5 & 1;
  [(CRLImageResamplingOperation *)self desiredSize];
  double v23 = sub_100064F14(v20, v21, 1.0);
  double v24 = v22;
  if ((v5 & 8) == 0)
  {
    double v23 = sub_10006729C(0, v9, v11, v23, v22);
    double v24 = v25;
  }
  if (v5) {
    double v26 = 0.5;
  }
  else {
    double v26 = 0.699999988;
  }
  uint64_t v27 = objc_opt_class();
  v28 = [(CRLImageResamplingOperation *)self imageProvider];
  v29 = sub_1002469D0(v27, v28);

  if ((v5 & 2) == 0 && !v29)
  {
    v30 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    v31 = [(CRLImageResamplingOperation *)self imageProvider];
    v32 = [(__CFString *)v31 imageData];
    v33 = [(CRLPreinsertionAssetWrapper *)v30 initWithAlreadyInsertedAsset:v32 owner:self->mAssetOwner];
    goto LABEL_141;
  }
  v34 = (CGImageSource *)[v29 CGImageSource];
  isrc = v34;
  if (v34 && (v35 = v34, CGImageSourceGetStatus(v34) == kCGImageStatusComplete))
  {
    CFDictionaryRef v104 = CGImageSourceCopyPropertiesAtIndex(v35, 0, 0);
    if (v104)
    {
      CFDictionaryRef cf = v104;
      char v131 = 1;
      unsigned int v133 = CFDictionaryGetValue(v104, kCGImagePropertyHasAlpha) == kCFBooleanTrue;
      goto LABEL_27;
    }
    char v131 = 1;
  }
  else
  {
    char v131 = 0;
  }
  CFDictionaryRef cf = 0;
  unsigned int v133 = [v29 isOpaque] ^ 1;
LABEL_27:
  v36 = [(CRLImageResamplingOperation *)self displayName];
  v31 = [v36 stringByDeletingPathExtension];

  if (!v31 || ![(__CFString *)v31 length])
  {
    v37 = [(CRLImageResamplingOperation *)self imageProvider];
    v38 = [v37 imageData];
    v39 = [v38 filename];
    v40 = [v39 stringByDeletingPathExtension];

    if (v40 && [(__CFString *)v40 length])
    {
      v31 = v40;
    }
    else
    {

      v31 = @"image";
    }
  }
  v129 = v29;
  v41 = [(CRLImageResamplingOperation *)self displayName];
  v32 = [v41 pathExtension];

  if (!v32 || ![v32 length])
  {
    v42 = [(CRLImageResamplingOperation *)self imageProvider];
    v43 = [v42 imageData];
    v44 = [v43 filename];
    uint64_t v45 = [v44 pathExtension];

    v32 = (void *)v45;
  }
  v46 = +[UTType typeWithTag:v32 tagClass:UTTagClassFilenameExtension conformingToType:0];
  v126 = v46;
  if (!v46)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0A18);
    }
    v47 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR)) {
      sub_101088DBC();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0A38);
    }
    v48 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR)) {
      sub_101088C60();
    }

    v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
    v50 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 129, 0, "invalid nil value for '%{public}s'", "utTypeForOriginalFile");

    v46 = 0;
  }
  if ([v46 conformsToType:UTTypeJPEG])
  {
    unsigned int v51 = 1;
  }
  else
  {
    v52 = +[CRLIngestionTypes highEfficiencyImageUTTypes];
    if (objc_msgSend(v46, "crl_conformsToAnyUTType:", v52)) {
      unsigned int v51 = 1;
    }
    else {
      unsigned int v51 = [v46 conformsToType:UTTypeWebP];
    }
  }
  if (v133 | v51 ^ 1) {
    v53 = UTTypePNG;
  }
  else {
    v53 = UTTypeJPEG;
  }
  v54 = v53;
  if ([(UTType *)v54 isEqual:UTTypePNG])
  {
    [(CRLImageResamplingOperation *)self desiredAlternateSizeIfConvertedToPNG];
    if (v56 != CGSizeZero.width || v55 != CGSizeZero.height)
    {
      [(CRLImageResamplingOperation *)self desiredAlternateSizeIfConvertedToPNG];
      double v23 = sub_10006729C(0, v9, v11, v57, v58);
      double v24 = v59;
    }
  }
  uint64_t v124 = [(UTType *)v54 preferredFilenameExtension];
  v127 = -[__CFString stringByAppendingPathExtension:](v31, "stringByAppendingPathExtension:");
  v128 = v54;
  char v60 = v131 ^ 1;
  if ((v5 & 0x18) != 0) {
    char v60 = 1;
  }
  if ((v60 & 1) != 0 || v23 >= v9 || v24 >= v11) {
    goto LABEL_150;
  }
  v141[0] = kCGImageSourceCreateThumbnailFromImageAlways;
  v141[1] = kCGImageSourceCreateThumbnailWithTransform;
  v142[0] = &__kCFBooleanTrue;
  v142[1] = &__kCFBooleanTrue;
  v141[2] = kCGImageSourceThumbnailMaxPixelSize;
  double v61 = v23 >= v24 ? v23 : v24;
  v62 = +[NSNumber numberWithDouble:v61];
  v142[2] = v62;
  CFDictionaryRef v63 = +[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:3];

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(isrc, 0, v63);
  if (!ThumbnailAtIndex)
  {
LABEL_150:
    char v65 = v4 | 2;
    if (!v133) {
      char v65 = v4;
    }
    char v66 = v65 | (4 * v19);
    double v67 = sub_1000674B8(v23);
    double v69 = v68;
    if ((v131 & 1) == 0) {
      goto LABEL_151;
    }
    v70 = [(CRLImageResamplingOperation *)self imageProvider];
    v71 = [v70 imageData];
    v72 = (CGImage *)[v71 newCGImage];

    v73 = sub_100455F9C(v72, v66, v67, v69);
    v74 = v72;
    v54 = v128;
    CGImageRelease(v74);
    if (!v73)
    {
LABEL_151:
      v75 = [(CRLImageResamplingOperation *)self imageProvider];
      id v76 = [v75 imageGamut];

      char v77 = v76 == (id)2 ? v66 : v66 | 0x20;
      v73 = sub_100455AA8(v77, v67, v69);
      if (!v73) {
        goto LABEL_104;
      }
    }
    CGInterpolationQuality v78 = v19 ? kCGInterpolationNone : kCGInterpolationLow;
    CGContextSetInterpolationQuality(v73, v78);
    if (v133)
    {
      double v67 = v23;
      double v79 = v24;
    }
    else
    {
      double v79 = v69;
    }
    if (isrc
      && ((CFStringRef Type = CGImageSourceGetType(isrc), v9 / v67 >= v11 / v79) ? (v81 = v9 / v67) : (v81 = v11 / v79),
          [v129 isValid]
       && ([UTTypeJPEG identifier],
           v82 = objc_claimAutoreleasedReturnValue(),
           int v83 = CFEqual(Type, v82),
           v82,
           v83)
       && v81 >= 2.0))
    {
      if (v81 >= 8.0)
      {
        uint64_t v85 = 8;
        v84 = v129;
      }
      else
      {
        v84 = v129;
        if (v81 >= 4.0) {
          uint64_t v85 = 4;
        }
        else {
          uint64_t v85 = 2;
        }
      }
      CFStringRef v139 = @"kCGImageSourceSubsampleFactor";
      v113 = +[NSNumber numberWithInt:v85];
      v140 = v113;
      CFDictionaryRef v86 = +[NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];

      ImageAtIndex = CGImageSourceCreateImageAtIndex(isrc, 0, v86);
      double v115 = sub_100064070();
      CGFloat v117 = v116;
      CGFloat v119 = v118;
      CGFloat v121 = v120;
      CGContextSaveGState(v73);
      v143.origin.x = v115;
      v143.origin.y = v117;
      v143.size.double width = v119;
      v143.size.double height = v121;
      double MinY = CGRectGetMinY(v143);
      v144.origin.x = v115;
      v144.origin.y = v117;
      v144.size.double width = v119;
      v144.size.double height = v121;
      CGFloat MaxY = CGRectGetMaxY(v144);
      CGContextTranslateCTM(v73, 0.0, MinY + MaxY);
      CGContextScaleCTM(v73, 1.0, -1.0);
      sub_10043A6BC((CGAffineTransform *)[v84 orientation], 1, (uint64_t)&transform, v115, v117, v119, v121);
      CGContextConcatCTM(v73, &transform);
      v145.origin.x = v115;
      v145.origin.y = v117;
      v145.size.double width = v119;
      v145.size.double height = v121;
      CGContextDrawImage(v73, v145, ImageAtIndex);
      if (ImageAtIndex) {
        CFRelease(ImageAtIndex);
      }
      CGContextRestoreGState(v73);
      v54 = v128;
    }
    else
    {
      CFDictionaryRef v86 = [(CRLImageResamplingOperation *)self imageProvider];
      [(__CFDictionary *)v86 drawImageInContext:v73 rect:sub_100064070()];
    }

    ThumbnailAtIndex = CGBitmapContextCreateImage(v73);
    CGContextRelease(v73);
    if (!ThumbnailAtIndex)
    {
LABEL_104:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0A58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101088B38();
      }
      v29 = v129;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0A78);
      }
      v97 = (void *)v124;
      v98 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v98);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
      v87 = (__CFData *)objc_claimAutoreleasedReturnValue();
      v99 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v87, v99, 239, 0, "invalid nil value for '%{public}s'", "resampledImage");

      v33 = 0;
      v100 = v126;
      goto LABEL_138;
    }
  }
  v87 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  v88 = [(UTType *)v54 identifier];
  v89 = CGImageDestinationCreateWithData(v87, v88, 1uLL, 0);

  if (v89)
  {
    CFStringRef v137 = kCGImageDestinationLossyCompressionQuality;
    v90 = +[NSNumber numberWithDouble:v26];
    v138 = v90;
    CFDictionaryRef v91 = +[NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];

    v92 = v91;
    CGImageDestinationSetProperties(v89, v91);
    if (v131)
    {
      CFDictionaryRef v134 = v91;
      Mutable = CFDictionaryCreateMutable(0, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, kCGImageDestinationLossyCompressionQuality, +[NSNumber numberWithDouble:v26]);
      CFDictionaryRef v94 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, 0);
      if (CFDictionaryContainsKey(v94, kCGImagePropertyDPIWidth))
      {
        Value = CFDictionaryGetValue(v94, kCGImagePropertyDPIWidth);
        CFDictionaryAddValue(Mutable, kCGImagePropertyDPIWidth, Value);
      }
      v29 = v129;
      if (CFDictionaryContainsKey(v94, kCGImagePropertyDPIHeight))
      {
        v96 = CFDictionaryGetValue(v94, kCGImagePropertyDPIHeight);
        CFDictionaryAddValue(Mutable, kCGImagePropertyDPIHeight, v96);
      }
      CGImageDestinationAddImage(v89, ThumbnailAtIndex, Mutable);
      if (v94) {
        CFRelease(v94);
      }
      v92 = v134;
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      CGImageDestinationAddImage(v89, ThumbnailAtIndex, 0);
      v29 = v129;
    }
    CGImageDestinationFinalize(v89);
    CFRelease(v89);
    v105 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    mAssetOwner = self->mAssetOwner;
    id v135 = 0;
    v33 = [(CRLPreinsertionAssetWrapper *)v105 initWithData:v87 filename:v127 owner:mAssetOwner error:&v135];
    id v103 = v135;
    if (!v33)
    {
      int v132 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0AD8);
      }
      v107 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v107, OS_LOG_TYPE_ERROR)) {
        sub_101088D08((uint64_t)v103, v132);
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0AF8);
      }
      v29 = v129;
      v108 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_ERROR)) {
        sub_101088C60();
      }

      v109 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
      v110 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
      +[CRLAssertionHandler handleFailureInFunction:v109, v110, 282, 0, "Error %@ creating pre-insertion asset wrapper for data.", v103 file lineNumber isFatal description];

      v100 = v126;
      v97 = (void *)v124;
      goto LABEL_137;
    }
    v100 = v126;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0A98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101088BCC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0AB8);
    }
    v100 = v126;
    v101 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v101);
    }
    uint64_t v102 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]");
    id v103 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"];
    v92 = (void *)v102;
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v102, v103, 244, 0, "invalid nil value for '%{public}s'", "destination");
    v33 = 0;
    v29 = v129;
  }
  v97 = (void *)v124;
LABEL_137:

  CFRelease(ThumbnailAtIndex);
LABEL_138:

  if (cf) {
    CFRelease(cf);
  }

LABEL_141:
  v111 = v33;

  return v111;
}

- (CRLImageProvider)imageProvider
{
  return self->mImageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (CGSize)desiredSize
{
  double width = self->mDesiredSize.width;
  double height = self->mDesiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->mDesiredSize = a3;
}

- (NSString)displayName
{
  return self->mDisplayName;
}

- (void)setDisplayName:(id)a3
{
}

- (CGSize)desiredAlternateSizeIfConvertedToPNG
{
  double width = self->mDesiredAlternateSizeIfConvertedToPNG.width;
  double height = self->mDesiredAlternateSizeIfConvertedToPNG.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDisplayName, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);

  objc_storeStrong((id *)&self->mImageProvider, 0);
}

@end