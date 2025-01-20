@interface TVPExternalImageLoader
- (BOOL)imageIsLoadedForTime:(double)a3;
- (NSMutableDictionary)imageProxyMappings;
- (NSMutableSet)imageProxies;
- (NSMutableSet)loadedImageActualTimes;
- (TVPExternalImageConfig)config;
- (TVPExternalImageLoader)initWithConfig:(id)a3;
- (double)closestImageTimeForTime:(double)a3;
- (double)closestImageTimeForTime:(double)a3 imageInterval:(double)a4;
- (double)firstImageTime;
- (double)lastImageTime;
- (id)_closestURLForImageTime:(double)a3 actualTime:(double *)a4;
- (id)loadImagesForTimes:(id)a3 maxSize:(CGSize)a4 withHandler:(id)a5;
- (id)loadedImageForTime:(double)a3;
- (unint64_t)_closestImageIndexForTime:(double)a3 actualTime:(double *)a4 imageInterval:(double)a5;
- (void)invalidate;
- (void)setConfig:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setImageProxyMappings:(id)a3;
- (void)setLoadedImageActualTimes:(id)a3;
@end

@implementation TVPExternalImageLoader

- (TVPExternalImageLoader)initWithConfig:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TVPExternalImageLoader;
  v6 = [(TVPExternalImageLoader *)&v17 init];
  if (v6)
  {
    v7 = [v5 imageNameFormatString];
    v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^[^%]*%[.0-9]*d[^%]*$" options:1 error:0];
    uint64_t v9 = [v7 length];
    if (v7 && objc_msgSend(v8, "numberOfMatchesInString:options:range:", v7, 0, 0, v9) == 1)
    {
      objc_storeStrong((id *)&v6->_config, a3);
      v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      imageProxies = v6->_imageProxies;
      v6->_imageProxies = v10;

      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      imageProxyMappings = v6->_imageProxyMappings;
      v6->_imageProxyMappings = v12;

      v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      loadedImageActualTimes = v6->_loadedImageActualTimes;
      v6->_loadedImageActualTimes = v14;
    }
    else
    {
      loadedImageActualTimes = v6;
      v6 = 0;
    }
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(TVPExternalImageLoader *)self imageProxies];
  [v3 removeAllObjects];

  id v4 = [(TVPExternalImageLoader *)self imageProxyMappings];
  [v4 removeAllObjects];
}

- (double)closestImageTimeForTime:(double)a3
{
  id v5 = [(TVPExternalImageLoader *)self config];
  [v5 imageInterval];
  [(TVPExternalImageLoader *)self closestImageTimeForTime:a3 imageInterval:v6];
  double v8 = v7;

  return v8;
}

- (double)closestImageTimeForTime:(double)a3 imageInterval:(double)a4
{
  double v5 = 0.0;
  [(TVPExternalImageLoader *)self _closestImageIndexForTime:&v5 actualTime:a3 imageInterval:a4];
  return v5;
}

- (id)loadImagesForTimes:(id)a3 maxSize:(CGSize)a4 withHandler:(id)a5
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  return v5;
}

- (double)firstImageTime
{
  double v6 = 0.0;
  v3 = [(TVPExternalImageLoader *)self config];
  [v3 imageInterval];
  [(TVPExternalImageLoader *)self _closestImageIndexForTime:&v6 actualTime:0.0 imageInterval:v4];

  return v6;
}

- (double)lastImageTime
{
  double v6 = 0.0;
  v3 = [(TVPExternalImageLoader *)self config];
  [v3 imageInterval];
  [(TVPExternalImageLoader *)self _closestImageIndexForTime:&v6 actualTime:1000000.0 imageInterval:v4];

  return v6;
}

- (BOOL)imageIsLoadedForTime:(double)a3
{
  return 0;
}

- (id)loadedImageForTime:(double)a3
{
  return 0;
}

- (unint64_t)_closestImageIndexForTime:(double)a3 actualTime:(double *)a4 imageInterval:(double)a5
{
  if (a3 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v9 = [(TVPExternalImageLoader *)self config];
  double v10 = (double)[v9 imageCount];
  double v11 = round(a3 / a5) * a5;
  unint64_t v12 = vcvtad_u64_f64(v11) / (unint64_t)a5;
  double v13 = (double)v12;
  double v14 = v10 + -1.0;
  if ((double)v12 >= v10) {
    unint64_t v15 = (unint64_t)v14;
  }
  else {
    unint64_t v15 = v12;
  }
  unint64_t v5 = v15 + [v9 usesOneBasedImageIndexes];
  if (a4)
  {
    double v16 = round(v11);
    if (v13 >= v10) {
      double v16 = v14 * a5;
    }
    *a4 = v16;
  }

  return v5;
}

- (id)_closestURLForImageTime:(double)a3 actualTime:(double *)a4
{
  double v7 = [(TVPExternalImageLoader *)self config];
  [v7 imageInterval];
  unint64_t v9 = [(TVPExternalImageLoader *)self _closestImageIndexForTime:a4 actualTime:a3 imageInterval:v8];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = 0;
  }
  else
  {
    double v11 = [(TVPExternalImageLoader *)self config];
    unint64_t v12 = NSString;
    double v13 = [v11 imageNameFormatString];
    double v14 = objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, @"%d", 0, v9);

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x263F08BA0]);
      double v16 = [v11 baseURL];
      objc_super v17 = (void *)[v15 initWithURL:v16 resolvingAgainstBaseURL:0];

      if (v17)
      {
        v18 = [v17 path];
        if (([v18 hasSuffix:@"/"] & 1) == 0)
        {
          uint64_t v19 = [v18 stringByAppendingString:@"/"];

          v18 = (void *)v19;
        }
        v20 = [v18 stringByAppendingString:v14];

        [v17 setPath:v20];
        double v10 = [v17 URL];
      }
      else
      {
        double v10 = 0;
      }
    }
    else
    {
      double v10 = 0;
    }
  }
  return v10;
}

- (TVPExternalImageConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (NSMutableSet)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
}

- (NSMutableDictionary)imageProxyMappings
{
  return self->_imageProxyMappings;
}

- (void)setImageProxyMappings:(id)a3
{
}

- (NSMutableSet)loadedImageActualTimes
{
  return self->_loadedImageActualTimes;
}

- (void)setLoadedImageActualTimes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedImageActualTimes, 0);
  objc_storeStrong((id *)&self->_imageProxyMappings, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end