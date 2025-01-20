@interface QLDiskCacheEnumerator
+ (BOOL)cachedThumbnailDataIsLowQuality:(id)a3 forThumbnailRequest:(id)a4;
+ (double)_expectedThumbnailSizeForRequest:(id)a3;
- (QLDiskCacheEnumerator)initWithDiskCache:(id)a3;
@end

@implementation QLDiskCacheEnumerator

+ (BOOL)cachedThumbnailDataIsLowQuality:(id)a3 forThumbnailRequest:(id)a4
{
  id v5 = a4;
  [a3 size];
  double v7 = v6;
  [(id)objc_opt_class() _expectedThumbnailSizeForRequest:v5];
  double v9 = v8;

  return vabdd_f64(v7, v9) > 0.001;
}

+ (double)_expectedThumbnailSizeForRequest:(id)a3
{
  [a3 maximumPixelSize];
  return v3;
}

- (void).cxx_destruct
{
}

- (QLDiskCacheEnumerator)initWithDiskCache:(id)a3
{
  id v5 = a3;
  float v6 = [(QLDiskCacheEnumerator *)self init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_diskCache, a3);
  }

  return v7;
}

@end