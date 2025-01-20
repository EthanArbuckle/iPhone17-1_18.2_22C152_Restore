@interface TSDBrushStrokeLoader
+ (TSDBrushStrokeLoader)brushStrokeLoaderForCurrentThread;
+ (double)p_brushPixelScaleAt100Percent;
+ (id)p_brushStrokeLoadQueue;
+ (id)p_cacheDirectory;
- (id)boundsForStroke:(id)a3;
- (id)imageForStroke:(id)a3;
- (id)lineEnd:(id)a3 forStroke:(id)a4;
- (id)optionsForStroke:(id)a3;
- (id)p_loadImageForBrush:(id)a3;
- (id)pathsForStroke:(id)a3;
- (id)textureIndexForStroke:(id)a3;
- (void)p_loadBrushIfNeeded:(id)a3;
- (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6;
- (void)p_loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4;
- (void)p_loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4;
@end

@implementation TSDBrushStrokeLoader

+ (TSDBrushStrokeLoader)brushStrokeLoaderForCurrentThread
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"TSDBrushStrokeLoader"];
  if (!v4)
  {
    v4 = objc_alloc_init(TSDBrushStrokeLoader);
    [v3 setObject:v4 forKeyedSubscript:@"TSDBrushStrokeLoader"];
  }

  return v4;
}

- (id)lineEnd:(id)a3 forStroke:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v6];
  v8 = [NSString stringWithFormat:@"%@:%@", v6, v7];

  v9 = [(NSMutableDictionary *)self->_lineEnds objectForKeyedSubscript:v8];

  return v9;
}

- (id)imageForStroke:(id)a3
{
  id v4 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v4];
  v5 = [(NSMutableDictionary *)self->_images objectForKeyedSubscript:v4];

  return v5;
}

- (id)textureIndexForStroke:(id)a3
{
  id v4 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v4];
  v5 = [(NSMutableDictionary *)self->_textureIndex objectForKeyedSubscript:v4];

  return v5;
}

- (id)optionsForStroke:(id)a3
{
  id v4 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v4];
  v5 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:v4];

  return v5;
}

- (id)pathsForStroke:(id)a3
{
  id v4 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v4];
  v5 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v4];

  return v5;
}

- (id)boundsForStroke:(id)a3
{
  id v4 = a3;
  [(TSDBrushStrokeLoader *)self p_loadBrushIfNeeded:v4];
  v5 = [(NSMutableDictionary *)self->_bounds objectForKeyedSubscript:v4];

  return v5;
}

+ (id)p_brushStrokeLoadQueue
{
  if (p_brushStrokeLoadQueue_onceToken != -1) {
    dispatch_once(&p_brushStrokeLoadQueue_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)p_brushStrokeLoadQueue_queue;

  return v2;
}

uint64_t __46__TSDBrushStrokeLoader_p_brushStrokeLoadQueue__block_invoke()
{
  p_brushStrokeLoadQueue_queue = (uint64_t)dispatch_queue_create("com.apple.iwork.TSDBrushStrokeLoadQueue", 0);

  return MEMORY[0x270F9A758]();
}

+ (id)p_cacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  id v4 = [v3 stringByAppendingPathComponent:@"Brushes"];

  v5 = [MEMORY[0x263F08850] defaultManager];
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  return v4;
}

+ (double)p_brushPixelScaleAt100Percent
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  return fmax(v4 * sqrt(v7 * v9 / 786432.0), 1.0);
}

- (void)p_loadBrushIfNeeded:(id)a3
{
  id v4 = a3;
  options = self->_options;
  if (!options
    || ([(NSMutableDictionary *)options objectForKey:v4],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    double v7 = +[TSDBrushStrokeLoader p_brushStrokeLoadQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__TSDBrushStrokeLoader_p_loadBrushIfNeeded___block_invoke;
    v8[3] = &unk_2646B05A0;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(v7, v8);
  }
}

void __44__TSDBrushStrokeLoader_p_loadBrushIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v65 = +[TSDBrushStrokeLoader p_cacheDirectory];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 8))
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    *(void *)(v16 + 48) = v15;

    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = *(void **)(v19 + 24);
    *(void *)(v19 + 24) = v18;

    v21 = [v65 stringByAppendingString:@"/TSDBrushCacheVersion.txt"];
    v22 = [NSString stringWithContentsOfFile:v21 encoding:4 error:0];
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 14);
    if (!v22 || ([v22 isEqualToString:v23] & 1) == 0)
    {
      v61 = v23;
      uint64_t v64 = a1;
      v24 = [MEMORY[0x263F08850] defaultManager];
      id v71 = 0;
      v25 = [v24 contentsOfDirectoryAtPath:v65 error:&v71];
      id v26 = v71;

      if (!v25)
      {
        v27 = [MEMORY[0x263F7C7F0] currentHandler];
        v28 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke"];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
        v30 = [v26 description];
        [v27 handleFailureInFunction:v28, v29, 195, @"%@", v30 file lineNumber description];
      }
      v62 = v22;
      v63 = v21;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = v25;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v68 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if ([v36 hasPrefix:@"TSDBrush"])
            {
              v37 = [MEMORY[0x263F08850] defaultManager];
              v38 = [v65 stringByAppendingPathComponent:v36];
              id v66 = v26;
              char v39 = [v37 removeItemAtPath:v38 error:&v66];
              id v40 = v66;

              if ((v39 & 1) == 0)
              {
                v41 = [MEMORY[0x263F7C7F0] currentHandler];
                v42 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke"];
                v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
                v44 = [v40 description];
                [v41 handleFailureInFunction:v42, v43, 198, @"%@", v44 file lineNumber description];
              }
              id v26 = v40;
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v67 objects:v74 count:16];
        }
        while (v33);
      }

      v23 = v61;
      v21 = v63;
      [v61 writeToFile:v63 atomically:0 encoding:4 error:0];

      a1 = v64;
      v22 = v62;
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  v45 = [*(id *)(v2 + 32) objectForKey:*(void *)(a1 + 40)];

  if (!v45)
  {
    v46 = [@"TSDBrush_" stringByAppendingString:*(void *)(a1 + 40)];
    v47 = TSDBundle();
    v48 = [v47 pathForResource:v46 ofType:@"svg"];

    id v49 = objc_alloc(MEMORY[0x263EFF8F8]);
    v50 = objc_msgSend(NSURL, "tsu_fileURLWithPath:", v48);
    v51 = (void *)[v49 initWithContentsOfURL:v50 options:0 error:0];

    unint64_t v52 = [v51 length];
    if (v52 >> 31)
    {
      v58 = [MEMORY[0x263F7C7F0] currentHandler];
      v59 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke"];
      v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
      [v58 handleFailureInFunction:v59 file:v60 lineNumber:214 description:@"Out-of-bounds type assignment failed"];
    }
    else
    {
      Memory = xmlReadMemory((const char *)[v51 bytes], v52, "", 0, 1);
      v54 = PerformXPathQuery(Memory, @"//svg:split-at-sharp-angles[1]");
      BOOL v55 = [v54 count] != 0;

      v72 = @"split-at-sharp-angles";
      v56 = [NSNumber numberWithBool:v55];
      v73 = v56;
      v57 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      [*(id *)(*(void *)(a1 + 32) + 32) setObject:v57 forKeyedSubscript:*(void *)(a1 + 40)];

      objc_msgSend(*(id *)(a1 + 32), "p_loadLineEndsForBrush:inSVGDoc:", *(void *)(a1 + 40), Memory);
      objc_msgSend(*(id *)(a1 + 32), "p_loadSectionsForBrush:inSVGDoc:", *(void *)(a1 + 40), Memory);
      xmlFreeDoc(Memory);
    }
  }
}

- (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a4;
  id v13 = a3;
  v14 = +[TSDBrushStrokeLoader p_cacheDirectory];
  id v15 = [v14 stringByAppendingFormat:@"/TSDBrushEnd_%@_%@.png", v13, v12];

  uint64_t v16 = [MEMORY[0x263F7C858] imageWithContentsOfFile:v15];
  v17 = v16;
  if (v16)
  {
    Image = CGImageRetain((CGImageRef)[v16 CGImage]);
  }
  else
  {
    +[TSDBrushStrokeLoader p_brushPixelScaleAt100Percent];
    CGFloat v20 = v19 * 100.0 / height;
    double v21 = width * v20;
    v22 = TSDBitmapContextCreate(3, v21);
    CGContextSetRGBFillColor(v22, 1.0, 1.0, 1.0, 1.0);
    float v23 = v21;
    v30.size.double width = ceilf(v23);
    float v24 = height * v20;
    v30.size.double height = ceilf(v24);
    v30.origin.double x = 0.0;
    v30.origin.double y = 0.0;
    CGContextFillRect(v22, v30);
    CGContextSetRGBFillColor(v22, 0.0, 0.0, 0.0, 1.0);
    CGAffineTransformMakeScale(&transform, v20, v20);
    CGContextConcatCTM(v22, &transform);
    CGAffineTransformMakeTranslation(&v28, -x, -y);
    CGContextConcatCTM(v22, &v28);
    CGContextAddPath(v22, a5);
    CGContextFillPath(v22);
    Image = CGBitmapContextCreateImage(v22);
    v25 = [MEMORY[0x263F7C858] imageWithCGImage:Image];
    id v26 = [v25 PNGRepresentation];

    v27 = objc_msgSend(NSURL, "tsu_fileURLWithPath:", v15);
    [v26 writeToURL:v27 atomically:1];
    CGContextRelease(v22);
  }
  CGImageRelease(Image);
}

- (void)p_loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v61 = a3;
  PerformXPathQuery(a4, @"//svg:path['_wrap'=substring(@id,string-length(@id)-4)]");
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (v62)
  {
    uint64_t v58 = *(void *)v75;
    unint64_t v5 = 0x263F08000uLL;
    CGFloat v56 = *(double *)(MEMORY[0x263F000D0] + 8);
    CGFloat v57 = *MEMORY[0x263F000D0];
    CGFloat v54 = *(double *)(MEMORY[0x263F000D0] + 24);
    CGFloat v55 = *(double *)(MEMORY[0x263F000D0] + 16);
    CGFloat v52 = *(double *)(MEMORY[0x263F000D0] + 40);
    CGFloat v53 = *(double *)(MEMORY[0x263F000D0] + 32);
    v59 = a4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v75 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v70 = v6;
        uint64_t v7 = [*(id *)(*((void *)&v74 + 1) + 8 * v6) objectForKey:@"nodeAttributes"];
        id v71 = [v7 objectForKey:@"d"];
        double v8 = [v7 objectForKey:@"id"];
        id v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 5);

        uint64_t v10 = [*(id *)(v5 + 2880) stringWithFormat:@"//svg:path[@id='%@_end']", v9];
        v11 = PerformXPathQuery(a4, v10);

        if ([v11 count] != 1)
        {
          id v12 = [MEMORY[0x263F7C7F0] currentHandler];
          id v13 = [*(id *)(v5 + 2880) stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadLineEndsForBrush:inSVGDoc:]"];
          v14 = [*(id *)(v5 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
          [v12 handleFailureInFunction:v13 file:v14 lineNumber:288 description:@"Arrow head needs path"];
        }
        long long v69 = v11;
        id v15 = [v11 lastObject];
        uint64_t v16 = [v15 objectForKey:@"nodeAttributes"];

        v17 = [v16 objectForKey:@"d"];
        id v18 = [*(id *)(v5 + 2880) stringWithFormat:@"//svg:rect[@id='%@_end_bounds']", v9];
        double v19 = PerformXPathQuery(a4, v18);

        if ([v19 count] != 1)
        {
          CGFloat v20 = [MEMORY[0x263F7C7F0] currentHandler];
          double v21 = [*(id *)(v5 + 2880) stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadLineEndsForBrush:inSVGDoc:]"];
          v22 = [*(id *)(v5 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
          [v20 handleFailureInFunction:v21 file:v22 lineNumber:295 description:@"Arrow head needs bounding rect"];
        }
        float v23 = [v19 lastObject];
        float v24 = [v23 objectForKey:@"nodeAttributes"];

        v25 = [v24 objectForKey:@"x"];
        [v25 doubleValue];
        double v27 = v26;
        CGFloat v64 = v26;

        CGAffineTransform v28 = [v24 objectForKey:@"y"];
        [v28 doubleValue];
        double v30 = v29;

        long long v68 = v24;
        id v31 = [v24 objectForKey:@"width"];
        [v31 doubleValue];
        CGFloat v66 = v32;

        uint64_t v33 = [v24 objectForKey:@"height"];
        [v33 doubleValue];
        double v35 = v34;
        CGFloat v65 = v34;

        v36 = [v9 stringByReplacingOccurrencesOfString:@"_" withString:@" "];

        v37 = [*(id *)(v5 + 2880) stringWithFormat:@"%@:%@", v61, v36];

        v72.double a = v57;
        v72.CGFloat b = v56;
        v72.double c = v55;
        v72.double d = v54;
        v72.tdouble x = v53;
        v72.tdouble y = v52;
        CGAffineTransformTranslate(&v73, &v72, 0.0, -0.5);
        CGAffineTransform v72 = v73;
        CGAffineTransformScale(&v73, &v72, 2.0 / v35, 2.0 / v35);
        CGAffineTransform v72 = v73;
        CGAffineTransformTranslate(&v73, &v72, -v27, -v30);
        CGAffineTransform v72 = v73;
        CGAffineTransformRotate(&v73, &v72, -1.57079633);
        double a = v73.a;
        CGFloat b = v73.b;
        double c = v73.c;
        double d = v73.d;
        tdouble x = v73.tx;
        tdouble y = v73.ty;
        v44 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:v71];
        v73.double a = a;
        v73.CGFloat b = b;
        double v63 = b;
        v73.double c = c;
        v73.double d = d;
        v73.tdouble x = tx;
        v73.tdouble y = ty;
        v45 = TSDCreateTransformedPath(v44, &v73);
        v46 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:v17];
        v73.double a = a;
        v73.CGFloat b = b;
        v73.double c = c;
        v73.double d = d;
        v73.tdouble x = tx;
        v73.tdouble y = ty;
        v47 = TSDCreateTransformedPath(v46, &v73);
        long long v67 = v19;
        v80.origin.double x = v64;
        v80.origin.double y = v30;
        v80.size.double width = v66;
        v80.size.double height = v65;
        double MaxX = CGRectGetMaxX(v80);
        v81.origin.double x = v64;
        v81.origin.double y = v30;
        v81.size.double width = v66;
        v81.size.double height = v65;
        CGFloat MidY = CGRectGetMidY(v81);
        v50 = +[TSDLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v47, v45, 1, v37, tx + c * MidY + a * MaxX, ty + d * MidY + v63 * MaxX);
        [(NSMutableDictionary *)self->_lineEnds setObject:v50 forKey:v37];
        BoundingBodouble x = CGPathGetBoundingBox(v45);
        unint64_t v5 = 0x263F08000;
        -[TSDBrushStrokeLoader p_loadLineEndTextureForBrush:lineEnd:path:andBounds:](self, "p_loadLineEndTextureForBrush:lineEnd:path:andBounds:", v61, v37, v47, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
        CGPathRelease(v46);
        CGPathRelease(v47);
        CGPathRelease(v44);
        CGPathRelease(v45);

        uint64_t v6 = v70 + 1;
        a4 = v59;
      }
      while (v62 != v70 + 1);
      uint64_t v62 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    }
    while (v62);
  }
}

- (id)p_loadImageForBrush:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v62 = +[TSDBrushStrokeLoader p_cacheDirectory];
  double v63 = [v62 stringByAppendingFormat:@"/TSDBrush_%@.png", v4];
  uint64_t v5 = objc_msgSend(MEMORY[0x263F7C858], "imageWithContentsOfFile:");
  id v71 = v4;
  CGAffineTransform v72 = self;
  if (v5)
  {
    id v65 = (id)v5;
    goto LABEL_35;
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v84 objects:v90 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v85 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 += [*(id *)(*((void *)&v84 + 1) + 8 * i) count];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v84 objects:v90 count:16];
    }
    while (v9);

    if (v10 == 1) {
      double v13 = 2048.0;
    }
    else {
      double v13 = 512.0;
    }
  }
  else
  {

    double v13 = 512.0;
  }
  v14 = TSDBitmapContextCreate(3, v13);
  CGContextSetRGBFillColor(v14, 0.0, 0.0, 0.0, 1.0);
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(v14);
  CGContextFillRect(v14, ClipBoundingBox);
  CGContextSetRGBFillColor(v14, 1.0, 1.0, 1.0, 1.0);
  id v15 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v71];
  uint64_t v16 = [v15 allKeys];

  v17 = objc_msgSend(v16, "sortedArrayUsingSelector:");

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v17;
  id v67 = (id)[obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v67)
  {
    unint64_t v18 = 0;
    id v66 = *(id *)v81;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(id *)v81 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v19;
        uint64_t v20 = *(void *)(*((void *)&v80 + 1) + 8 * v19);
        double v21 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v71];
        v22 = [v21 objectForKeyedSubscript:v20];

        float v23 = [(NSMutableDictionary *)self->_bounds objectForKeyedSubscript:v71];
        float v24 = [v23 objectForKeyedSubscript:v20];

        if ([v22 count])
        {
          uint64_t v25 = 0;
          while (1)
          {
            double v26 = [v22 objectAtIndexedSubscript:v25];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v30 = v26;
LABEL_27:
              id v31 = v30;
              goto LABEL_29;
            }
            id v31 = 0;
LABEL_29:
            double v32 = [v24 objectAtIndexedSubscript:v25];
            [v32 CGRectValue];

            [v31 bounds];
            CGFloat x = v94.origin.x;
            CGFloat y = v94.origin.y;
            CGFloat width = v94.size.width;
            CGFloat height = v94.size.height;
            double v37 = fmin(CGRectGetMinX(v94), 0.0);
            v95.origin.CGFloat x = x;
            v95.origin.CGFloat y = y;
            v95.size.CGFloat width = width;
            v95.size.CGFloat height = height;
            double v38 = (double)v18 * 80.0;
            double v39 = v13 / (fmax(CGRectGetMaxX(v95), 1.0) - v37);
            unint64_t v40 = 32;
            do
            {
              CGContextSaveGState(v14);
              CGAffineTransformMakeTranslation(&transform, 0.0, (double)(unint64_t)v38);
              CGContextConcatCTM(v14, &transform);
              CGAffineTransformMakeScale(&v78, v39, (double)v40);
              CGContextConcatCTM(v14, &v78);
              CGAffineTransformMakeTranslation(&v77, -v37, 0.5);
              CGContextConcatCTM(v14, &v77);
              CGContextAddPath(v14, (CGPathRef)[v31 CGPath]);
              CGContextFillPath(v14);
              double v38 = (double)(v40 + (unint64_t)v38) + 4.0;
              CGContextRestoreGState(v14);
              BOOL v41 = v40 > 3;
              v40 >>= 1;
            }
            while (v41);
            ++v18;

            if (++v25 >= (unint64_t)[v22 count]) {
              goto LABEL_32;
            }
          }
          if (![v26 count])
          {
            double v27 = [MEMORY[0x263F7C7F0] currentHandler];
            CGAffineTransform v28 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadImageForBrush:]"];
            double v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
            [v27 handleFailureInFunction:v28 file:v29 lineNumber:377 description:@"got empty array in _paths"];
          }
          id v30 = [v26 firstObject];
          goto LABEL_27;
        }
LABEL_32:

        uint64_t v19 = v69 + 1;
        self = v72;
      }
      while ((id)(v69 + 1) != v67);
      id v67 = (id)[obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v67);
  }

  Image = CGBitmapContextCreateImage(v14);
  id v65 = [MEMORY[0x263F7C858] imageWithCGImage:Image];
  v43 = [v65 PNGRepresentation];
  v44 = objc_msgSend(NSURL, "tsu_fileURLWithPath:", v63);
  [v43 writeToURL:v44 atomically:1];
  CGImageRelease(Image);
  CGContextRelease(v14);

  id v4 = v71;
LABEL_35:
  v45 = [MEMORY[0x263EFF9A0] dictionary];
  [(NSMutableDictionary *)self->_textureIndex setObject:v45 forKey:v4];
  v46 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v4];
  v47 = [v46 allKeys];

  v48 = [v47 sortedArrayUsingSelector:sel_compare_];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v68 = v48;
  uint64_t v49 = [v68 countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = 0;
    uint64_t v70 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v74 != v70) {
          objc_enumerationMutation(v68);
        }
        uint64_t v53 = *(void *)(*((void *)&v73 + 1) + 8 * j);
        CGFloat v54 = [(NSMutableDictionary *)self->_paths objectForKeyedSubscript:v4];
        CGFloat v55 = [v54 objectForKeyedSubscript:v53];

        CGFloat v56 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v55, "count"));
        [v45 setObject:v56 forKeyedSubscript:v53];

        if ([v55 count])
        {
          unint64_t v57 = 0;
          do
          {
            uint64_t v58 = [v45 objectForKeyedSubscript:v53];
            v59 = [NSNumber numberWithUnsignedInteger:v51 + v57];
            [v58 addObject:v59];

            ++v57;
          }
          while (v57 < [v55 count]);
          v51 += v57;
          id v4 = v71;
        }

        self = v72;
      }
      uint64_t v50 = [v68 countByEnumeratingWithState:&v73 objects:v88 count:16];
    }
    while (v50);
  }
  else
  {
    uint64_t v51 = 0;
  }

  v60 = [NSNumber numberWithUnsignedInteger:v51];
  [v45 setObject:v60 forKeyedSubscript:@"section-count"];

  return v65;
}

- (void)p_loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v53 = [(NSMutableDictionary *)self->_paths objectForKey:v5];
  if (!v53)
  {
    uint64_t v53 = [MEMORY[0x263EFF9A0] dictionary];
    -[NSMutableDictionary setObject:forKey:](self->_paths, "setObject:forKey:");
  }
  CGFloat v52 = [(NSMutableDictionary *)self->_bounds objectForKey:v5];
  if (!v52)
  {
    CGFloat v52 = [MEMORY[0x263EFF9A0] dictionary];
    -[NSMutableDictionary setObject:forKey:](self->_bounds, "setObject:forKey:");
  }
  v44 = self;
  uint64_t v6 = PerformXPathQuery(a4, @"//svg:path['_section'=substring(@id,string-length(@id)-7)]");
  if (![v6 count])
  {
    uint64_t v7 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadSectionsForBrush:inSVGDoc:]"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:496 description:@"No sections"];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v6;
  uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v51)
  {
    uint64_t v49 = *(void *)v61;
    long long v47 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v48 = *MEMORY[0x263F000D0];
    long long v46 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v61 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = [*(id *)(*((void *)&v60 + 1) + 8 * i) objectForKey:@"nodeAttributes"];
        uint64_t v12 = [v11 objectForKey:@"d"];
        double v13 = [v11 objectForKey:@"id"];
        v14 = [NSString stringWithFormat:@"//svg:rect[@id='%@_bounds']", v13];
        id v15 = PerformXPathQuery(a4, v14);

        if ([v15 count] != 1)
        {
          uint64_t v16 = [MEMORY[0x263F7C7F0] currentHandler];
          v17 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLoader p_loadSectionsForBrush:inSVGDoc:]"];
          unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m"];
          [v16 handleFailureInFunction:v17 file:v18 lineNumber:505 description:@"Section needs bounding rect"];
        }
        uint64_t v19 = [v15 lastObject];
        uint64_t v20 = [v19 objectForKey:@"nodeAttributes"];

        double v21 = [v20 objectForKey:@"x"];
        [v21 doubleValue];
        double v23 = v22;

        float v24 = [v20 objectForKey:@"y"];
        [v24 doubleValue];
        double v26 = v25;

        double v27 = [v20 objectForKey:@"width"];
        [v27 doubleValue];
        double v29 = v28;

        id v30 = [v20 objectForKey:@"height"];
        [v30 doubleValue];
        double v32 = v31;

        uint64_t v33 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:v12];
        double v34 = +[TSDBezierPath bezierPathWithCGPath:v33];
        *(_OWORD *)&v59.double a = v48;
        *(_OWORD *)&v59.double c = v47;
        *(_OWORD *)&v59.tCGFloat x = v46;
        *(_OWORD *)&v58.double a = v48;
        *(_OWORD *)&v58.double c = v47;
        *(_OWORD *)&v58.tCGFloat x = v46;
        CGAffineTransformTranslate(&v59, &v58, 0.0, -0.5);
        CGAffineTransform v57 = v59;
        CGAffineTransformScale(&v58, &v57, 1.0 / v29, 1.0 / v32);
        CGAffineTransform v59 = v58;
        CGAffineTransform v57 = v58;
        CGAffineTransformTranslate(&v58, &v57, -v23, -v26);
        CGAffineTransform v59 = v58;
        [v34 transformUsingAffineTransform:&v58];
        CGFloat v56 = v13;
        double v35 = objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "rangeOfString:", @"_"));
        path = v33;
        if ([v5 isEqualToString:@"Chalk2"]
          && ([v35 isEqualToString:@"small"] & 1) == 0)
        {
          id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v36 addObject:v34];
          double v37 = +[TSDBezierPath smoothBezierPath:v34 withThreshold:0.05];
          [v36 addObject:v37];
        }
        else
        {
          id v36 = v34;
        }
        double v38 = v15;
        CGFloat v55 = (void *)v12;
        double v39 = [v53 objectForKey:v35];
        if (!v39)
        {
          double v39 = [MEMORY[0x263EFF980] array];
          [v53 setObject:v39 forKey:v35];
        }
        id v40 = v5;
        BOOL v41 = [v52 objectForKey:v35];
        if (!v41)
        {
          BOOL v41 = [MEMORY[0x263EFF980] array];
          [v52 setObject:v41 forKey:v35];
        }
        [v39 addObject:v36];
        v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v23, v26, v29, v32);
        [v41 addObject:v42];

        CGPathRelease(path);
        id v5 = v40;
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v51);
  }

  v43 = [(TSDBrushStrokeLoader *)v44 p_loadImageForBrush:v5];
  [(NSMutableDictionary *)v44->_images setObject:v43 forKey:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndex, 0);
  objc_storeStrong((id *)&self->_images, 0);

  objc_storeStrong((id *)&self->_lineEnds, 0);
}

@end