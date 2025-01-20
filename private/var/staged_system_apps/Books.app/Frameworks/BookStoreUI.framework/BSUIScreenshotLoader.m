@interface BSUIScreenshotLoader
- (BSUIScreenshotLoader)initWithScreenshots:(id)a3;
- (BSUIScreenshotLoaderDelegate)delegate;
- (NSArray)screenshotURLs;
- (NSMutableDictionary)screenshotsCache;
- (id)imageForScreenshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setScreenshotURLs:(id)a3;
- (void)setScreenshotsCache:(id)a3;
- (void)startLoading;
@end

@implementation BSUIScreenshotLoader

- (BSUIScreenshotLoader)initWithScreenshots:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BSUIScreenshotLoader;
  v5 = [(BSUIScreenshotLoader *)&v22 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    screenshotsCache = v5->_screenshotsCache;
    v5->_screenshotsCache = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v13) url:(void)v18];
          [v8 addObject:v14];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    v15 = (NSArray *)[v8 copy];
    screenshotURLs = v5->_screenshotURLs;
    v5->_screenshotURLs = v15;
  }
  return v5;
}

- (void)startLoading
{
  objc_initWeak(&location, self);
  for (i = 0; ; ++i)
  {
    id v4 = [(BSUIScreenshotLoader *)self screenshotURLs];
    v5 = (char *)[v4 count];

    if (i >= v5) {
      break;
    }
    uint64_t v6 = [(BSUIScreenshotLoader *)self screenshotURLs];
    v7 = [v6 objectAtIndexedSubscript:i];

    v8 = [(BSUIScreenshotLoader *)self delegate];
    [v8 screenshotLoader:self willLoadImageAtIndex:i fromURL:v7];

    id v9 = +[NSURLSession sharedSession];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1D8D8;
    v12[3] = &unk_38EAA0;
    objc_copyWeak(v14, &location);
    id v10 = v7;
    id v13 = v10;
    v14[1] = i;
    id v11 = [v9 dataTaskWithURL:v10 completionHandler:v12];

    [v11 resume];
    objc_destroyWeak(v14);
  }
  objc_destroyWeak(&location);
}

- (id)imageForScreenshot:(id)a3
{
  id v4 = a3;
  v5 = [(BSUIScreenshotLoader *)self screenshotsCache];
  uint64_t v6 = [v4 url];

  v7 = [v5 objectForKey:v6];

  return v7;
}

- (BSUIScreenshotLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BSUIScreenshotLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)screenshotURLs
{
  return self->_screenshotURLs;
}

- (void)setScreenshotURLs:(id)a3
{
}

- (NSMutableDictionary)screenshotsCache
{
  return self->_screenshotsCache;
}

- (void)setScreenshotsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotsCache, 0);
  objc_storeStrong((id *)&self->_screenshotURLs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end