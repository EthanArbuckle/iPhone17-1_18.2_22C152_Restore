@interface FRCardConfigurationCache
- (FCThreadSafeMutableDictionary)fontCache;
- (FRCardConfigurationCache)init;
- (NSMutableDictionary)imageCache;
- (id)cacheFontItemForFontSize:(double)a3;
- (id)cacheImageItemForCardSize:(CGSize)a3;
- (void)setFontCache:(id)a3;
- (void)setImageCache:(id)a3;
@end

@implementation FRCardConfigurationCache

- (FRCardConfigurationCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)FRCardConfigurationCache;
  v2 = [(FRCardConfigurationCache *)&v8 init];
  if (v2)
  {
    v3 = (FCThreadSafeMutableDictionary *)objc_alloc_init((Class)FCThreadSafeMutableDictionary);
    fontCache = v2->_fontCache;
    v2->_fontCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;
  }
  return v2;
}

- (id)cacheFontItemForFontSize:(double)a3
{
  v4 = +[NSString stringWithFormat:@"%f", *(void *)&a3];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100018B10;
  v16 = sub_100018A10;
  id v17 = 0;
  v5 = [(FRCardConfigurationCache *)self fontCache];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004F7A4;
  v9[3] = &unk_1000C8CA8;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 readWriteWithAccessor:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cacheImageItemForCardSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  +[NSThread isMainThread];
  v13.CGFloat width = width;
  v13.CGFloat height = height;
  id v6 = NSStringFromCGSize(v13);
  id v7 = +[NSString stringWithFormat:@"%@", v6];

  objc_super v8 = [(FRCardConfigurationCache *)self imageCache];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v9 = objc_alloc_init(FRCardConfigurationCacheImageItem);
    id v10 = [(FRCardConfigurationCache *)self imageCache];
    [v10 setObject:v9 forKey:v7];
  }

  return v9;
}

- (FCThreadSafeMutableDictionary)fontCache
{
  return (FCThreadSafeMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFontCache:(id)a3
{
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_fontCache, 0);
}

@end