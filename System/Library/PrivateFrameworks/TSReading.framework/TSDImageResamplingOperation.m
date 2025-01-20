@interface TSDImageResamplingOperation
- (CGPath)maskingPath;
- (CGSize)desiredSize;
- (NSString)displayName;
- (TSDImageProvider)imageProvider;
- (TSDImageResamplingOperation)init;
- (TSDImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4;
- (TSPObjectContext)objectContext;
- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4;
- (void)dealloc;
- (void)setDesiredSize:(CGSize)a3;
- (void)setDisplayName:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setMaskingPath:(CGPath *)a3;
- (void)setObjectContext:(id)a3;
@end

@implementation TSDImageResamplingOperation

- (TSDImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDImageResamplingOperation initWithImageProvider:desiredSize:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 47, @"Invalid parameter not satisfying: %s", "imageProvider != nil");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDImageResamplingOperation;
  v10 = [(TSDImageResamplingOperation *)&v12 init];
  if (v10)
  {
    v10->mImageProvider = (TSDImageProvider *)a3;
    v10->mDesiredSize.CGFloat width = width;
    v10->mDesiredSize.CGFloat height = height;
  }
  return v10;
}

- (TSDImageResamplingOperation)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDImageResamplingOperation init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 58, @"Do not call method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[TSDImageResamplingOperation init]"), 0 reason userInfo]);
}

- (void)dealloc
{
  mMaskingPath = self->mMaskingPath;
  if (mMaskingPath) {
    CFRelease(mMaskingPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDImageResamplingOperation;
  [(TSDImageResamplingOperation *)&v4 dealloc];
}

- (void)setMaskingPath:(CGPath *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  mMaskingPath = self->mMaskingPath;
  if (mMaskingPath) {
    CFRelease(mMaskingPath);
  }
  self->mMaskingPath = a3;
}

- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4
{
  char v4 = a4;
  char v5 = a3;
  [(TSDImageProvider *)[(TSDImageResamplingOperation *)self imageProvider] naturalSize];
  double v8 = v7;
  double v10 = v9;
  if ([(TSDImageResamplingOperation *)self maskingPath])
  {
    [+[TSDBezierPath bezierPathWithCGPath:[(TSDImageResamplingOperation *)self maskingPath]] bounds];
    double v116 = v12;
    double v117 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = v15;
    double v18 = v13;
  }
  else
  {
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v116 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v117 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v17 = v10;
    double v18 = v8;
  }
  uint64_t v19 = v5 & 1;
  [(TSDImageResamplingOperation *)self desiredSize];
  double v22 = v20;
  double v23 = v21;
  double v119 = v17;
  double v120 = v10;
  double v118 = v18;
  if ((v5 & 8) == 0)
  {
    double v22 = TSDFitOrFillSizeInSize(0, v18, v17, v20, v21);
    double v23 = v24;
  }
  double v25 = TSDCeilSize(v22);
  double v27 = v26;
  if (v5) {
    double v28 = 0.5;
  }
  else {
    double v28 = 0.699999988;
  }
  objc_opt_class();
  [(TSDImageResamplingOperation *)self imageProvider];
  v29 = (void *)TSUDynamicCast();
  if (!v29)
  {
    v36 = [(TSDImageResamplingOperation *)self maskingPath];
    if ((v5 & 2) == 0 && !v36)
    {
      v37 = [(TSDImageResamplingOperation *)self imageProvider];
      return [(TSDImageProvider *)v37 imageData];
    }
  }
  v30 = (CGImageSource *)[v29 CGImageSource];
  v31 = v30;
  char v121 = v4;
  if (!v30)
  {
    v33 = [(TSDImageResamplingOperation *)self maskingPath];
    BOOL v123 = 0;
    goto LABEL_21;
  }
  CGImageSourceStatus Status = CGImageSourceGetStatus(v30);
  BOOL v123 = Status == kCGImageStatusComplete;
  v33 = [(TSDImageResamplingOperation *)self maskingPath];
  if (v33 || Status)
  {
LABEL_21:
    if (v33)
    {
      CFDictionaryRef cf = 0;
      int v35 = 1;
      goto LABEL_25;
    }
LABEL_24:
    CFDictionaryRef cf = 0;
    int v35 = [v29 isOpaque] ^ 1;
    goto LABEL_25;
  }
  CFDictionaryRef v34 = CGImageSourceCopyPropertiesAtIndex(v31, 0, 0);
  if (!v34)
  {
    BOOL v123 = 1;
    goto LABEL_24;
  }
  CFDictionaryRef cf = v34;
  int v35 = CFDictionaryGetValue(v34, (const void *)*MEMORY[0x263F0F458]) == (const void *)*MEMORY[0x263EFFB40];
  BOOL v123 = 1;
LABEL_25:
  v39 = [(NSString *)[(TSDImageResamplingOperation *)self displayName] stringByDeletingPathExtension];
  if (!v39 || (v40 = (__CFString *)v39, ![(NSString *)v39 length]))
  {
    v41 = (__CFString *)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageData"), "filename"), "stringByDeletingPathExtension");
    if (!v41 || (v40 = v41, ![(__CFString *)v41 length])) {
      v40 = @"image";
    }
  }
  v42 = [(NSString *)[(TSDImageResamplingOperation *)self displayName] pathExtension];
  if (!v42 || (CFStringRef v43 = (const __CFString *)v42, ![(NSString *)v42 length])) {
    CFStringRef v43 = (const __CFString *)objc_msgSend((id)objc_msgSend(-[TSDImageProvider imageData](-[TSDImageResamplingOperation imageProvider](self, "imageProvider"), "imageData"), "filename"), "pathExtension");
  }
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], v43, 0);
  CFStringRef v45 = (const __CFString *)*MEMORY[0x263F01A80];
  int v46 = UTTypeConformsTo(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x263F01A80]);
  CFRelease(PreferredIdentifierForTag);
  if (v46) {
    int v47 = v35;
  }
  else {
    int v47 = 1;
  }
  if (v47) {
    v48 = @"png";
  }
  else {
    v48 = @"jpg";
  }
  uint64_t v115 = [(__CFString *)v40 stringByAppendingPathExtension:v48];
  v49 = v31;
  if (v123)
  {
    v50 = [(TSDImageResamplingOperation *)self maskingPath];
    if ((v5 & 0x18) == 0 && !v50)
    {
      [(TSDImageResamplingOperation *)self desiredSize];
      if (v51 < v8)
      {
        [(TSDImageResamplingOperation *)self desiredSize];
        if (v52 < v120)
        {
          v113 = NSDictionary;
          uint64_t v53 = *MEMORY[0x263F0F5A8];
          uint64_t v54 = *MEMORY[0x263F0F5B8];
          v55 = NSNumber;
          [(TSDImageResamplingOperation *)self desiredSize];
          double v112 = v56;
          [(TSDImageResamplingOperation *)self desiredSize];
          double v114 = v8;
          double v57 = v28;
          double v59 = v58;
          [(TSDImageResamplingOperation *)self desiredSize];
          BOOL v62 = v112 <= v59;
          double v28 = v57;
          double v8 = v114;
          if (v62) {
            double v60 = v61;
          }
          float v63 = v60;
          v64 = v55;
          v49 = v31;
          uint64_t v65 = [v64 numberWithUnsignedInteger:vcvtps_u32_f32(v63)];
          ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v31, 0, (CFDictionaryRef)objc_msgSend(v113, "dictionaryWithObjectsAndKeys:", v53, MEMORY[0x263EFFA88], v54, v65, *MEMORY[0x263F0F638], 0));
          if (ThumbnailAtIndex) {
            goto LABEL_79;
          }
        }
      }
    }
  }
  char v67 = v121 | 2;
  if (!v35) {
    char v67 = v121;
  }
  char v68 = v67 | (4 * v19);
  char v69 = [(TSDImageProvider *)[(TSDImageResamplingOperation *)self imageProvider] imageGamut] == 2? v68: v68 | 0x20;
  v70 = TSDBitmapContextCreate(v69, v25);
  if (!v70) {
    goto LABEL_93;
  }
  v71 = v70;
  if (v19) {
    CGInterpolationQuality v72 = kCGInterpolationNone;
  }
  else {
    CGInterpolationQuality v72 = kCGInterpolationLow;
  }
  CGContextSetInterpolationQuality(v70, v72);
  if (v35)
  {
    double v25 = v22;
    double v27 = v23;
  }
  if ([(TSDImageResamplingOperation *)self maskingPath])
  {
    if (v14 <= 0.0) {
      double v73 = 1.0;
    }
    else {
      double v73 = v25 / v14;
    }
    memset(&v130.c, 0, 32);
    if (v16 <= 0.0) {
      double v74 = 1.0;
    }
    else {
      double v74 = v27 / v16;
    }
    *(_OWORD *)&v130.a = 0uLL;
    CGAffineTransformMakeScale(&v130, v73, v74);
    v75 = [(TSDImageResamplingOperation *)self maskingPath];
    CGAffineTransform v129 = v130;
    v76 = TSDCreateTransformedPath(v75, &v129);
    CGContextTranslateCTM(v71, -(v117 * v73), -(v116 * v74));
    CGContextAddPath(v71, v76);
    CGContextClip(v71);
    CGPathRelease(v76);
    double v25 = v8 * v73;
    double v27 = v120 * v74;
  }
  if (v49
    && ((CFStringRef Type = CGImageSourceGetType(v49), v118 / v25 <= v119 / v27) ? (v78 = v119 / v27) : (v78 = v118 / v25),
        [v29 isValid]
     && ((int v79 = CFEqual(Type, v45), v78 >= 2.0) ? (v80 = v79 == 0) : (v80 = 1), !v80)))
  {
    if (v78 >= 8.0)
    {
      double v100 = v28;
      uint64_t v101 = 8;
    }
    else
    {
      double v100 = v28;
      uint64_t v101 = v78 >= 4.0 ? 4 : 2;
    }
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v49, 0, (CFDictionaryRef)objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v101), @"kCGImageSourceSubsampleFactor", 0));
    double v103 = TSDRectWithSize();
    CGFloat v105 = v104;
    CGFloat v107 = v106;
    CGFloat v109 = v108;
    CGContextSaveGState(v71);
    v132.origin.x = v103;
    v132.origin.y = v105;
    v132.size.CGFloat width = v107;
    v132.size.CGFloat height = v109;
    double MinY = CGRectGetMinY(v132);
    v133.origin.x = v103;
    v133.origin.y = v105;
    v133.size.CGFloat width = v107;
    v133.size.CGFloat height = v109;
    CGFloat MaxY = CGRectGetMaxY(v133);
    CGContextTranslateCTM(v71, 0.0, MinY + MaxY);
    CGContextScaleCTM(v71, 1.0, -1.0);
    [v29 orientation];
    TSUImageOrientationTransform();
    CGContextConcatCTM(v71, &transform);
    v134.origin.x = v103;
    v134.origin.y = v105;
    v134.size.CGFloat width = v107;
    v134.size.CGFloat height = v109;
    CGContextDrawImage(v71, v134, ImageAtIndex);
    CFRelease(ImageAtIndex);
    CGContextRestoreGState(v71);
    double v28 = v100;
  }
  else
  {
    [(TSDImageProvider *)[(TSDImageResamplingOperation *)self imageProvider] drawImageInContext:v71 rect:TSDRectWithSize()];
  }
  ThumbnailAtIndex = CGBitmapContextCreateImage(v71);
  CGContextRelease(v71);
  if (ThumbnailAtIndex)
  {
LABEL_79:
    v81 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
    if (v47) {
      CFStringRef v45 = (const __CFString *)[(id)*MEMORY[0x263F1DC08] identifier];
    }
    CGImageDestinationRef v82 = CGImageDestinationCreateWithData(v81, v45, 1uLL, 0);
    if (v82)
    {
      v83 = v82;
      v84 = NSDictionary;
      uint64_t v85 = [NSNumber numberWithDouble:v28];
      CGImageDestinationSetProperties(v83, (CFDictionaryRef)objc_msgSend(v84, "dictionaryWithObjectsAndKeys:", v85, *MEMORY[0x263F0EFE8], 0));
      CFDictionaryRef v86 = 0;
      v130.a = 0.0;
      *(void *)&v130.b = &v130;
      *(void *)&v130.c = 0x2020000000;
      v130.d = 0.0;
      if (v123)
      {
        CFDictionaryRef v86 = CGImageSourceCopyPropertiesAtIndex(v49, 0, 0);
        v124[0] = MEMORY[0x263EF8330];
        v124[1] = 3221225472;
        v125 = __96__TSDImageResamplingOperation_performResampleOperationWithResampleOptions_bitmapContextOptions___block_invoke;
        v126 = &unk_2646B1270;
        v127 = &v130;
        v87 = (const void *)*MEMORY[0x263F0F1A0];
        if (CFDictionaryContainsKey(v86, (const void *)*MEMORY[0x263F0F1A0]))
        {
          v125((CFMutableDictionaryRef)v124);
          v88 = *(__CFDictionary **)(*(void *)&v130.b + 24);
          Value = CFDictionaryGetValue(v86, v87);
          CFDictionaryAddValue(v88, v87, Value);
        }
        v90 = (const void *)*MEMORY[0x263F0F198];
        if (CFDictionaryContainsKey(v86, (const void *)*MEMORY[0x263F0F198]))
        {
          v125((CFMutableDictionaryRef)v124);
          v91 = *(__CFDictionary **)(*(void *)&v130.b + 24);
          v92 = CFDictionaryGetValue(v86, v90);
          CFDictionaryAddValue(v91, v90, v92);
        }
      }
      CGImageDestinationAddImage(v83, ThumbnailAtIndex, *(CFDictionaryRef *)(*(void *)&v130.b + 24));
      if (v86) {
        CFRelease(v86);
      }
      v93 = *(const void **)(*(void *)&v130.b + 24);
      if (v93) {
        CFRelease(v93);
      }
      CGImageDestinationFinalize(v83);
      CFRelease(v83);
      if ([(TSDImageResamplingOperation *)self objectContext]) {
        id v94 = +[TSPData dataFromNSData:v81 filename:v115 context:[(TSDImageResamplingOperation *)self objectContext]];
      }
      else {
        id v94 = +[TSPData readOnlyDataFromNSData:v81 filename:v115 context:0];
      }
      v97 = v94;
      CFRelease(ThumbnailAtIndex);
      _Block_object_dispose(&v130, 8);
    }
    else
    {
      v98 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v99 = [NSString stringWithUTF8String:"-[TSDImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"];
      objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 282, @"invalid nil value for '%s'", "destination");
      v97 = 0;
    }
  }
  else
  {
LABEL_93:
    v95 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v96 = [NSString stringWithUTF8String:"-[TSDImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"];
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageResamplingOperation.m"), 276, @"invalid nil value for '%s'", "resampledImage");
    v97 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v97;
}

CFMutableDictionaryRef __96__TSDImageResamplingOperation_performResampleOperationWithResampleOptions_bitmapContextOptions___block_invoke(CFMutableDictionaryRef result)
{
  if (!*(void *)(*(void *)(*((void *)result + 4) + 8) + 24))
  {
    CFMutableDictionaryRef v1 = result;
    result = CFDictionaryCreateMutable(0, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(*(void *)(*((void *)v1 + 4) + 8) + 24) = result;
  }
  return result;
}

- (TSDImageProvider)imageProvider
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

- (TSPObjectContext)objectContext
{
  return self->mObjectContext;
}

- (void)setObjectContext:(id)a3
{
}

- (CGPath)maskingPath
{
  return self->mMaskingPath;
}

@end