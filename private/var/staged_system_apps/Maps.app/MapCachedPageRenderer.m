@interface MapCachedPageRenderer
- (MapCachedPageRenderer)init;
- (NSCache)printAreaToPrintInfoCache;
- (NSString)currentCacheKey;
- (id)computeCurrentPrintInfo;
- (id)currentPrintInfo;
@end

@implementation MapCachedPageRenderer

- (MapCachedPageRenderer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapCachedPageRenderer;
  v2 = [(MapPageRenderer *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    printAreaToPrintInfoCache = v2->_printAreaToPrintInfoCache;
    v2->_printAreaToPrintInfoCache = v3;
  }
  return v2;
}

- (NSString)currentCacheKey
{
  [(MapCachedPageRenderer *)self headerHeight];
  uint64_t v4 = v3;
  [(MapCachedPageRenderer *)self footerHeight];
  uint64_t v6 = v5;
  [(MapCachedPageRenderer *)self paperRect];
  v7 = NSStringFromCGRect(v12);
  [(MapCachedPageRenderer *)self printableRect];
  v8 = NSStringFromCGRect(v13);
  v9 = +[NSString stringWithFormat:@"%.2f_%.2f_%@_%@", v4, v6, v7, v8];

  return (NSString *)v9;
}

- (id)currentPrintInfo
{
  uint64_t v3 = [(MapCachedPageRenderer *)self currentCacheKey];
  uint64_t v4 = [(NSCache *)self->_printAreaToPrintInfoCache objectForKey:v3];
  if (!v4)
  {
    uint64_t v5 = [(MapCachedPageRenderer *)self computeCurrentPrintInfo];
    if (v5)
    {
      uint64_t v4 = (void *)v5;
      [(NSCache *)self->_printAreaToPrintInfoCache setObject:v5 forKey:v3];
    }
    else
    {
      v7 = sub_1005762E4();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = +[NSString stringWithFormat:@"Unexpectedly could not generate print info for key: %@", v3];
        *(_DWORD *)buf = 136316162;
        CGRect v12 = "-[MapCachedPageRenderer currentPrintInfo]";
        __int16 v13 = 2080;
        v14 = "MapCachedPageRenderer.m";
        __int16 v15 = 1024;
        int v16 = 37;
        __int16 v17 = 2080;
        v18 = "printingInfo != nil";
        __int16 v19 = 2112;
        v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v9 = sub_1005762E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          CGRect v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (id)computeCurrentPrintInfo
{
  return 0;
}

- (NSCache)printAreaToPrintInfoCache
{
  return self->_printAreaToPrintInfoCache;
}

- (void).cxx_destruct
{
}

@end