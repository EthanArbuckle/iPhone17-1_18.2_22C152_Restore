@interface RideBookingImageCache
+ (id)sharedCache;
- (NSMutableDictionary)imageCache;
- (id)imageForKey:(id)a3;
- (void)cacheINImageData:(id)a3 withKey:(id)a4;
- (void)setImageCache:(id)a3;
@end

@implementation RideBookingImageCache

+ (id)sharedCache
{
  if (qword_10160EAF8 != -1) {
    dispatch_once(&qword_10160EAF8, &stru_1012E82B0);
  }
  v2 = (void *)qword_10160EAF0;

  return v2;
}

- (void)cacheINImageData:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    imageCache = v8->_imageCache;
    if (!imageCache)
    {
      uint64_t v10 = objc_opt_new();
      v11 = v8->_imageCache;
      v8->_imageCache = (NSMutableDictionary *)v10;

      imageCache = v8->_imageCache;
    }
    v12 = [(NSMutableDictionary *)imageCache objectForKeyedSubscript:v7];

    if (!v12)
    {
      if (qword_10160EB08 != -1) {
        dispatch_once(&qword_10160EB08, &stru_1012E82D0);
      }
      v13 = +[UIImage imageWithData:v6 scale:*(double *)&qword_10160EB00];
      if (v13)
      {
        GEOFindOrCreateLog();
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/Utils/RideBookingImageCache.m");
          id v16 = objc_alloc((Class)NSString);
          [v13 size];
          v17 = NSStringFromCGSize(v23);
          id v18 = [v16 initWithFormat:@"Caching image for key %@. Size: %@, Scale: %g", v7, v17, qword_10160EB00];
          *(_DWORD *)buf = 136315394;
          v20 = v15;
          __int16 v21 = 2112;
          id v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
        }
        [(NSMutableDictionary *)v8->_imageCache setObject:v13 forKeyedSubscript:v7];
      }
    }
    objc_sync_exit(v8);
  }
}

- (id)imageForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    imageCache = v5->_imageCache;
    if (imageCache)
    {
      id v7 = [(NSMutableDictionary *)imageCache objectForKey:v4];
      v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        GEOFindOrCreateLog();
        uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/Utils/RideBookingImageCache.m");
          id v12 = [objc_alloc((Class)NSString) initWithFormat:@"image in the cache is nil."];
          int v14 = 136315394;
          v15 = v11;
          __int16 v16 = 2112;
          id v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    else
    {
      v8 = 0;
    }
    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
}

@end