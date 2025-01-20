@interface CRLBrushStrokeLoader
+ (double)p_brushPixelScaleAt100Percent;
+ (id)p_allLoadableBrushStrokeNames;
+ (id)p_allStorageCaches;
+ (id)p_brushStrokeLoadQueue;
+ (id)p_cacheDirectory;
+ (id)p_storageCacheForCurrentThread;
+ (id)p_storagesByBrushName;
+ (id)storageForBrushStrokeNamed:(id)a3;
+ (void)backgroundLoadAllBrushStrokes;
+ (void)p_clearOnDiskCache;
+ (void)p_loadBrushIfNeeded:(id)a3;
+ (void)p_loadImageForBrush:(id)a3 intoStorage:(id)a4;
+ (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6;
+ (void)p_loadLineEndsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5;
+ (void)p_loadSectionsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5;
@end

@implementation CRLBrushStrokeLoader

+ (id)storageForBrushStrokeNamed:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10006B740;
  v21 = sub_10006B750;
  id v22 = 0;
  v5 = [a1 p_storageCacheForCurrentThread];
  uint64_t v6 = [v5 objectForKey:v4];
  v7 = (void *)v18[5];
  v18[5] = v6;

  v8 = (void *)v18[5];
  if (!v8)
  {
    v9 = +[CRLBrushStrokeLoader p_brushStrokeLoadQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B758;
    block[3] = &unk_1014CC790;
    id v16 = a1;
    id v10 = v4;
    id v14 = v10;
    v15 = &v17;
    dispatch_sync(v9, block);

    [v5 setObject:v18[5] forKey:v10];
    v8 = (void *)v18[5];
  }
  id v11 = v8;

  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (void)backgroundLoadAllBrushStrokes
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  [a1 p_allLoadableBrushStrokeNames];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v6);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006B96C;
        block[3] = &unk_1014CC768;
        void block[4] = v7;
        block[5] = a1;
        dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
        v9 = +[CRLBrushStrokeLoader p_brushStrokeLoadQueue];
        dispatch_async(v9, v8);

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

+ (id)p_allLoadableBrushStrokeNames
{
  if (qword_1016A8F18 != -1) {
    dispatch_once(&qword_1016A8F18, &stru_1014CF650);
  }
  v2 = (void *)qword_1016A8F10;

  return v2;
}

+ (id)p_storageCacheForCurrentThread
{
  id v3 = +[NSThread currentThread];
  id v4 = [v3 threadDictionary];

  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_10006B740;
  long long v14 = sub_10006B750;
  id v15 = [v4 objectForKeyedSubscript:@"CRLBrushStrokeLoaderStorageCache"];
  uint64_t v5 = (void *)v11[5];
  if (!v5)
  {
    uint64_t v6 = +[CRLBrushStrokeLoader p_brushStrokeLoadQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006BC34;
    block[3] = &unk_1014CC6B8;
    void block[4] = v4;
    block[5] = &v10;
    void block[6] = a1;
    dispatch_sync(v6, block);

    uint64_t v5 = (void *)v11[5];
  }
  id v7 = v5;
  _Block_object_dispose(&v10, 8);

  return v7;
}

+ (id)p_allStorageCaches
{
  if (qword_1016A8F28 != -1) {
    dispatch_once(&qword_1016A8F28, &stru_1014CF670);
  }
  v2 = (void *)qword_1016A8F20;

  return v2;
}

+ (id)p_brushStrokeLoadQueue
{
  if (qword_1016A8F38 != -1) {
    dispatch_once(&qword_1016A8F38, &stru_1014CF690);
  }
  v2 = (void *)qword_1016A8F30;

  return v2;
}

+ (id)p_storagesByBrushName
{
  if (qword_1016A8F48 != -1) {
    dispatch_once(&qword_1016A8F48, &stru_1014CF6B0);
  }
  v2 = (void *)qword_1016A8F40;

  return v2;
}

+ (id)p_cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"Brushes"];

  uint64_t v5 = +[NSFileManager defaultManager];
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  return v4;
}

+ (double)p_brushPixelScaleAt100Percent
{
  +[UIScreen crl_screenScale];
  double v3 = v2;
  id v4 = +[UIScreen mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  return fmax(v3 * sqrt(v6 * v8 / 786432.0), 1.0);
}

+ (void)p_loadBrushIfNeeded:(id)a3
{
  id v4 = a3;
  double v5 = [a1 p_storagesByBrushName];
  if (![v5 count])
  {
    double v6 = +[CRLBrushStrokeLoader p_cacheDirectory];
    double v7 = [v6 stringByAppendingString:@"/CRLBrushCacheVersion.txt"];
    double v8 = +[NSString stringWithContentsOfFile:v7 encoding:4 error:0];
    v9 = +[NSString stringWithFormat:@"%ld", 17];
    if (!v8 || ([v8 isEqualToString:v9] & 1) == 0)
    {
      [a1 p_clearOnDiskCache];
      [v9 writeToFile:v7 atomically:0 encoding:4 error:0];
    }
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:v4];

  if (!v10)
  {
    id v11 = objc_alloc_init(CRLMutableBrushStrokeStorage);
    uint64_t v12 = [@"CRLBrush_" stringByAppendingString:v4];
    long long v13 = +[NSBundle mainBundle];
    long long v14 = [v13 pathForResource:v12 ofType:@"svg"];

    id v15 = objc_alloc((Class)NSData);
    id v16 = +[NSURL crl_fileURLWithPath:v14];
    id v17 = [v15 initWithContentsOfURL:v16 options:0 error:0];

    unint64_t v18 = (unint64_t)[v17 length];
    if (v18 >> 31)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CF6D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106D6D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CF6F0);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadBrushIfNeeded:]");
      v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
      +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:203 isFatal:0 description:"Out-of-bounds type assignment failed"];
    }
    else
    {
      int v19 = v18;
      id v20 = v17;
      Memory = xmlReadMemory((const char *)[v20 bytes], v19, "", 0, 1);
      +[NSString stringWithFormat:@"//svg:%@[1]", @"split-at-sharp-angles"];
      id v22 = v30 = v12;
      v23 = sub_10006C474(Memory, v22);
      BOOL v24 = [v23 count] != 0;

      v25 = +[NSNumber numberWithBool:v24];
      [(CRLMutableBrushStrokeStorage *)v11 setOption:v25 forKey:@"split-at-sharp-angles"];

      [a1 p_loadLineEndsForBrush:v4 fromSVGDoc:Memory intoStorage:v11];
      [a1 p_loadSectionsForBrush:v4 fromSVGDoc:Memory intoStorage:v11];
      xmlFreeDoc(Memory);
      v26 = [(CRLMutableBrushStrokeStorage *)v11 deepCopy];
      [v5 setObject:v26 forKeyedSubscript:v4];
    }
  }
}

+ (void)p_clearOnDiskCache
{
  uint64_t v2 = +[CRLBrushStrokeLoader p_cacheDirectory];
  double v3 = +[NSFileManager defaultManager];
  id v38 = 0;
  v32 = (void *)v2;
  id v4 = [v3 contentsOfDirectoryAtPath:v2 error:&v38];
  id v5 = v38;

  if (!v4)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF710);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106D75C(v7, (uint64_t)v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF730);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_clearOnDiskCache]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
    id v11 = [v5 description];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 231, 0, "%{public}@", v11);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v16);
        if ([v17 hasPrefix:@"CRLBrush"])
        {
          unint64_t v18 = +[NSFileManager defaultManager];
          int v19 = [v32 stringByAppendingPathComponent:v17];
          id v33 = v5;
          unsigned __int8 v20 = [v18 removeItemAtPath:v19 error:&v33];
          id v21 = v33;

          if ((v20 & 1) == 0)
          {
            unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CF750);
            }
            v23 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v28 = v23;
              v29 = [v21 description];
              *(_DWORD *)buf = 67110146;
              unsigned int v40 = v22;
              __int16 v41 = 2082;
              v42 = "+[CRLBrushStrokeLoader p_clearOnDiskCache]";
              __int16 v43 = 2082;
              v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
              __int16 v45 = 1024;
              int v46 = 234;
              __int16 v47 = 2112;
              v48 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %@", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014CF770);
            }
            BOOL v24 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v30 = v24;
              v31 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v40 = v22;
              __int16 v41 = 2114;
              v42 = v31;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_clearOnDiskCache]");
            v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
            v27 = [v21 description];
            +[CRLAssertionHandler handleFailureInFunction:v25, v26, 234, 0, "%@", v27 file lineNumber isFatal description];
          }
          id v5 = v21;
        }
        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v14);
  }
}

+ (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[CRLBrushStrokeLoader p_cacheDirectory];
  uint64_t v15 = [v14 stringByAppendingFormat:@"/CRLBrushEnd_%@_%@.png", v13, v12];

  id v16 = +[CRLImage imageWithContentsOfFile:v15];
  id v17 = v16;
  if (v16)
  {
    Image = CGImageRetain((CGImageRef)[v16 CGImage]);
  }
  else
  {
    +[CRLBrushStrokeLoader p_brushPixelScaleAt100Percent];
    CGFloat v20 = v19 * 100.0 / height;
    double v21 = width * v20;
    double v22 = height * v20;
    v23 = sub_100455AA8(3, v21, v22);
    CGContextSetRGBFillColor(v23, 1.0, 1.0, 1.0, 1.0);
    float v24 = v21;
    v31.size.double width = ceilf(v24);
    float v25 = v22;
    v31.size.double height = ceilf(v25);
    v31.origin.double x = 0.0;
    v31.origin.double y = 0.0;
    CGContextFillRect(v23, v31);
    CGContextSetRGBFillColor(v23, 0.0, 0.0, 0.0, 1.0);
    CGAffineTransformMakeScale(&transform, v20, v20);
    CGContextConcatCTM(v23, &transform);
    CGAffineTransformMakeTranslation(&v29, -x, -y);
    CGContextConcatCTM(v23, &v29);
    CGContextAddPath(v23, a5);
    CGContextFillPath(v23);
    Image = CGBitmapContextCreateImage(v23);
    v26 = +[CRLImage imageWithCGImage:Image];
    v27 = [v26 PNGRepresentation];

    v28 = +[NSURL crl_fileURLWithPath:v15];
    [v27 writeToURL:v28 atomically:1];
    CGContextRelease(v23);
  }
  CGImageRelease(Image);
}

+ (void)p_loadLineEndsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5
{
  id v72 = a3;
  id v71 = a5;
  sub_10006C474(a4, @"//svg:path['_wrap'=substring(@id,string-length(@id)-4)]");
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v73 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
  if (v73)
  {
    CFStringRef v7 = @"d";
    uint64_t v68 = *(void *)v84;
    CGFloat b = CGAffineTransformIdentity.b;
    CGFloat d = CGAffineTransformIdentity.d;
    CGFloat c = CGAffineTransformIdentity.c;
    tdouble y = CGAffineTransformIdentity.ty;
    tdouble x = CGAffineTransformIdentity.tx;
    double v8 = &off_1014C1000;
    v69 = a4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v84 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v79 = v9;
        uint64_t v10 = [*(id *)(*((void *)&v83 + 1) + 8 * v9) objectForKey:@"nodeAttributes"];
        v81 = [v10 objectForKey:v7];
        id v11 = [v10 objectForKey:@"id"];
        id v12 = [v11 substringToIndex:[v11 length] - 5];

        id v13 = [(__objc2_class *)v8[107] stringWithFormat:@"//svg:path[@id='%@_end']", v12];
        id v14 = sub_10006C474(a4, v13);

        if ([v14 count] != (id)1)
        {
          unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF790);
          }
          id v16 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v87.a) = 67109890;
            HIDWORD(v87.a) = v15;
            LOWORD(v87.b) = 2082;
            *(void *)((char *)&v87.b + 2) = "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v87.c) = 2082;
            *(void *)((char *)&v87.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v87.d) = 1024;
            *(_DWORD *)((char *)&v87.d + 6) = 290;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Arrow head needs path", (uint8_t *)&v87, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF7B0);
          }
          id v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v58 = v17;
            v59 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(v87.a) = 67109378;
            HIDWORD(v87.a) = v15;
            LOWORD(v87.b) = 2114;
            *(void *)((char *)&v87.b + 2) = v59;
            _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v87, 0x12u);

            double v8 = &off_1014C1000;
          }
          unint64_t v18 = [(__objc2_class *)v8[107] stringWithUTF8String:"+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]"];
          double v19 = [(__objc2_class *)v8[107] stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
          +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:290 isFatal:0 description:"Arrow head needs path"];

          double v8 = &off_1014C1000;
        }
        v80 = v14;
        CGFloat v20 = [v14 lastObject];
        double v21 = [v20 objectForKey:@"nodeAttributes"];

        uint64_t v22 = [v21 objectForKey:v7];
        v23 = [(__objc2_class *)v8[107] stringWithFormat:@"//svg:rect[@id='%@_end_bounds']", v12];
        float v24 = sub_10006C474(a4, v23);

        if ([v24 count] != (id)1)
        {
          unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF7D0);
          }
          v26 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v87.a) = 67109890;
            HIDWORD(v87.a) = v25;
            LOWORD(v87.b) = 2082;
            *(void *)((char *)&v87.b + 2) = "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v87.c) = 2082;
            *(void *)((char *)&v87.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v87.d) = 1024;
            *(_DWORD *)((char *)&v87.d + 6) = 297;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Arrow head needs bounding rect", (uint8_t *)&v87, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF7F0);
          }
          v27 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v60 = v27;
            v61 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(v87.a) = 67109378;
            HIDWORD(v87.a) = v25;
            LOWORD(v87.b) = 2114;
            *(void *)((char *)&v87.b + 2) = v61;
            _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v87, 0x12u);
          }
          v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadLineEndsForBrush:fromSVGDoc:intoStorage:]");
          CGAffineTransform v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
          +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:297 isFatal:0 description:"Arrow head needs bounding rect"];
        }
        v78 = (void *)v22;
        v30 = [v24 lastObject];
        CGRect v31 = [v30 objectForKey:@"nodeAttributes"];

        v32 = [v31 objectForKey:@"x"];
        [v32 doubleValue];
        double v34 = v33;
        CGFloat v75 = v33;

        long long v35 = [v31 objectForKey:@"y"];
        [v35 doubleValue];
        double v37 = v36;

        id v38 = [v31 objectForKey:@"width"];
        [v38 doubleValue];
        CGFloat v77 = v39;

        unsigned int v40 = [v31 objectForKey:@"height"];
        [v40 doubleValue];
        double v42 = v41;
        CGFloat v76 = v41;

        __int16 v43 = [v12 stringByReplacingOccurrencesOfString:@"_" withString:@" "];

        v82.double a = CGAffineTransformIdentity.a;
        v82.CGFloat b = b;
        v82.CGFloat c = c;
        v82.CGFloat d = d;
        v82.tdouble x = tx;
        v82.tdouble y = ty;
        CGAffineTransformTranslate(&v87, &v82, 0.0, -0.5);
        CGAffineTransform v82 = v87;
        CGAffineTransformScale(&v87, &v82, 2.0 / v42, 2.0 / v42);
        CGAffineTransform v82 = v87;
        CGAffineTransformTranslate(&v87, &v82, -v34, -v37);
        CGAffineTransform v82 = v87;
        CGAffineTransformRotate(&v87, &v82, -1.57079633);
        double a = v87.a;
        CGFloat v44 = v87.b;
        double v46 = v87.c;
        double v47 = v87.d;
        double v48 = v87.tx;
        double v49 = v87.ty;
        v50 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:v81];
        v87.double a = a;
        v87.CGFloat b = v44;
        double v74 = v44;
        v87.CGFloat c = v46;
        v87.CGFloat d = v47;
        v87.tdouble x = v48;
        v87.tdouble y = v49;
        v51 = sub_1000D5540(v50, &v87);
        v52 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:v22];
        v87.double a = a;
        v87.CGFloat b = v44;
        v87.CGFloat c = v46;
        v87.CGFloat d = v47;
        v87.tdouble x = v48;
        v87.tdouble y = v49;
        v53 = sub_1000D5540(v52, &v87);
        CFStringRef v54 = v7;
        v89.origin.double x = v75;
        v89.origin.double y = v37;
        v89.size.double width = v77;
        v89.size.double height = v76;
        double MaxX = CGRectGetMaxX(v89);
        v90.origin.double x = v75;
        v90.origin.double y = v37;
        v90.size.double width = v77;
        v90.size.double height = v76;
        CGFloat MidY = CGRectGetMidY(v90);
        v57 = +[CRLLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](CRLLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v53, v51, 1, v43, v48 + v46 * MidY + a * MaxX, v49 + v47 * MidY + v74 * MaxX);
        [v71 setLineEnd:v57 forKey:v43];
        BoundingBodouble x = CGPathGetBoundingBox(v51);
        [a1 p_loadLineEndTextureForBrush:v72 lineEnd:v43 path:v53 andBounds:BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height];
        CGPathRelease(v52);
        CGPathRelease(v53);
        CGPathRelease(v50);
        CGPathRelease(v51);

        CFStringRef v7 = v54;
        uint64_t v9 = v79 + 1;
        a4 = v69;
        double v8 = &off_1014C1000;
      }
      while (v73 != (id)(v79 + 1));
      id v73 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
    }
    while (v73);
  }
}

+ (void)p_loadImageForBrush:(id)a3 intoStorage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v55 = +[CRLBrushStrokeLoader p_cacheDirectory];
  v56 = v5;
  uint64_t v7 = [v55 stringByAppendingFormat:@"/CRLBrush_%@.png", v5];
  v63 = [v6 paths];
  if (!v63)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF810);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106D8FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF830);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadImageForBrush:intoStorage:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 340, 0, "invalid nil value for '%{public}s'", "paths");
  }
  v57 = (void *)v7;
  uint64_t v11 = +[CRLImage imageWithContentsOfFile:v7];
  if (v11)
  {
    id v12 = (void *)v11;
  }
  else
  {
    v60 = [v6 bounds];
    if (!v60)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CF850);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106D84C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CF870);
      }
      id v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v13);
      }
      id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadImageForBrush:intoStorage:]");
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 346, 0, "invalid nil value for '%{public}s'", "bounds");
    }
    id v16 = [v6 totalSectionCount];
    if (v16 == (id)1) {
      double v17 = 2048.0;
    }
    else {
      double v17 = 512.0;
    }
    unint64_t v18 = sub_100455AA8(3, v17, (double)(unint64_t)v16 * 80.0);
    CGContextSetRGBFillColor(v18, 0.0, 0.0, 0.0, 1.0);
    ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(v18);
    CGContextFillRect(v18, ClipBoundingBox);
    CGContextSetRGBFillColor(v18, 1.0, 1.0, 1.0, 1.0);
    double v19 = [v63 allKeys];
    CGFloat v20 = [v19 sortedArrayUsingSelector:];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v20;
    id v61 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v61)
    {
      unint64_t v21 = 0;
      uint64_t v59 = *(void *)v72;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v72 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v62 = v22;
          uint64_t v23 = *(void *)(*((void *)&v71 + 1) + 8 * v22);
          float v24 = [v63 objectForKeyedSubscript:v23];
          unsigned int v25 = [v60 objectForKeyedSubscript:v23];
          if ([v24 count])
          {
            unint64_t v26 = 0;
            do
            {
              v27 = [v24 objectAtIndexedSubscript:v26];
              v28 = [v27 originalPath];

              CGAffineTransform v29 = [v25 objectAtIndexedSubscript:v26];
              [v29 CGRectValue];

              [v28 bounds];
              CGFloat x = v78.origin.x;
              CGFloat y = v78.origin.y;
              CGFloat width = v78.size.width;
              CGFloat height = v78.size.height;
              double v34 = fmin(CGRectGetMinX(v78), 0.0);
              v79.origin.CGFloat x = x;
              v79.origin.CGFloat y = y;
              v79.size.CGFloat width = width;
              v79.size.CGFloat height = height;
              double v35 = (double)v21 * 80.0;
              double v36 = v17 / (fmax(CGRectGetMaxX(v79), 1.0) - v34);
              unint64_t v37 = 32;
              do
              {
                CGContextSaveGState(v18);
                CGAffineTransformMakeTranslation(&transform, 0.0, (double)(unint64_t)v35);
                CGContextConcatCTM(v18, &transform);
                CGAffineTransformMakeScale(&v69, v36, (double)v37);
                CGContextConcatCTM(v18, &v69);
                CGAffineTransformMakeTranslation(&v68, -v34, 0.5);
                CGContextConcatCTM(v18, &v68);
                id v38 = v28;
                CGContextAddPath(v18, (CGPathRef)[v38 CGPath]);
                CGContextFillPath(v18);
                double v35 = (double)(v37 + (unint64_t)v35) + 4.0;
                CGContextRestoreGState(v18);
                BOOL v39 = v37 > 3;
                v37 >>= 1;
              }
              while (v39);
              ++v21;

              ++v26;
            }
            while (v26 < (unint64_t)[v24 count]);
          }

          uint64_t v22 = v62 + 1;
        }
        while ((id)(v62 + 1) != v61);
        id v61 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v61);
    }

    Image = CGBitmapContextCreateImage(v18);
    id v12 = +[CRLImage imageWithCGImage:Image];
    double v41 = [v12 PNGRepresentation];
    double v42 = +[NSURL crl_fileURLWithPath:v57];
    [v41 writeToURL:v42 atomically:1];
    CGImageRelease(Image);
    CGContextRelease(v18);
  }
  __int16 v43 = [v63 allKeys];
  CGFloat v44 = [v43 sortedArrayUsingSelector:"compare:"];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v45 = v44;
  id v46 = [v45 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v46)
  {
    id v47 = v46;
    double v48 = 0;
    uint64_t v49 = *(void *)v65;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v65 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        v52 = [v63 objectForKeyedSubscript:v51];
        id v53 = [v52 count];

        if (v53)
        {
          CFStringRef v54 = &v48[(void)v53];
          do
          {
            [v6 addTextureIndex:v48++ forKey:v51];
            id v53 = (char *)v53 - 1;
          }
          while (v53);
          double v48 = v54;
        }
      }
      id v47 = [v45 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v47);
  }

  [v6 setImage:v12];
}

+ (void)p_loadSectionsForBrush:(id)a3 fromSVGDoc:(_xmlDoc *)a4 intoStorage:(id)a5
{
  id v51 = a3;
  id v50 = a5;
  uint64_t v7 = sub_10006C474(a4, @"//svg:path['_section'=substring(@id,string-length(@id)-7)]");
  if (![v7 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF890);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106D9AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CF8B0);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:472 isFatal:0 description:"No sections"];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v49 = *(void *)v55;
    long long v47 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v48 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v46 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(obj);
        }
        id v14 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)v13) objectForKey:@"nodeAttributes"];
        unsigned int v15 = [v14 objectForKey:@"d"];
        id v16 = [v14 objectForKey:@"id"];
        double v17 = +[NSString stringWithFormat:@"//svg:rect[@id='%@_bounds']", v16];
        unint64_t v18 = sub_10006C474(a4, v17);

        if ([v18 count] != (id)1)
        {
          unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF8D0);
          }
          CGFloat v20 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v58.a) = 67109890;
            HIDWORD(v58.a) = v19;
            LOWORD(v58.b) = 2082;
            *(void *)((char *)&v58.b + 2) = "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]";
            WORD1(v58.c) = 2082;
            *(void *)((char *)&v58.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m";
            WORD2(v58.d) = 1024;
            *(_DWORD *)((char *)&v58.d + 6) = 481;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Section needs bounding rect", (uint8_t *)&v58, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014CF8F0);
          }
          unint64_t v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v42 = v21;
            __int16 v43 = +[CRLAssertionHandler packedBacktraceString];
            LODWORD(v58.a) = 67109378;
            HIDWORD(v58.a) = v19;
            LOWORD(v58.b) = 2114;
            *(void *)((char *)&v58.b + 2) = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v58, 0x12u);
          }
          uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBrushStrokeLoader p_loadSectionsForBrush:fromSVGDoc:intoStorage:]");
          uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStrokeLoader.m"];
          +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:481 isFatal:0 description:"Section needs bounding rect"];
        }
        float v24 = [v18 lastObject];
        unsigned int v25 = [v24 objectForKey:@"nodeAttributes"];

        unint64_t v26 = [v25 objectForKey:@"x"];
        [v26 doubleValue];
        double v28 = v27;

        CGAffineTransform v29 = [v25 objectForKey:@"y"];
        [v29 doubleValue];
        double v31 = v30;

        v32 = [v25 objectForKey:@"width"];
        [v32 doubleValue];
        double v34 = v33;

        double v35 = [v25 objectForKey:@"height"];
        [v35 doubleValue];
        double v37 = v36;

        id v38 = +[CRLSVGToBezierPathConverter newPathFromSVGPathString:v15];
        BOOL v39 = +[CRLBezierPath bezierPathWithCGPath:v38];
        *(_OWORD *)&v58.double a = v48;
        *(_OWORD *)&v58.CGFloat c = v47;
        *(_OWORD *)&v58.tCGFloat x = v46;
        *(_OWORD *)&v53.double a = v48;
        *(_OWORD *)&v53.CGFloat c = v47;
        *(_OWORD *)&v53.tCGFloat x = v46;
        CGAffineTransformTranslate(&v58, &v53, 0.0, -0.5);
        CGAffineTransform v52 = v58;
        CGAffineTransformScale(&v53, &v52, 1.0 / v34, 1.0 / v37);
        CGAffineTransform v58 = v53;
        CGAffineTransform v52 = v53;
        CGAffineTransformTranslate(&v53, &v52, -v28, -v31);
        CGAffineTransform v58 = v53;
        [v39 transformUsingAffineTransform:&v53];
        unsigned int v40 = [v16 substringToIndex:[v16 rangeOfString:@"_"]];
        if ([v51 isEqualToString:@"Chalk2"]) {
          uint64_t v41 = [v40 isEqualToString:@"small"] ^ 1;
        }
        else {
          uint64_t v41 = 0;
        }
        [v50 addPath:v39 withBounds:v41 shouldSmooth:v40 forKey:v28];
        CGPathRelease(v38);

        id v13 = (char *)v13 + 1;
      }
      while (v12 != v13);
      id v12 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v12);
  }

  [a1 p_loadImageForBrush:v51 intoStorage:v50];
}

@end