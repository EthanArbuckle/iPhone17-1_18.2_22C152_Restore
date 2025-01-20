@interface ACMImageLoader
+ (id)sharedInstance;
- (NSMutableDictionary)imagesCache;
- (id)imageNamed:(id)a3;
- (void)dealloc;
@end

@implementation ACMImageLoader

+ (id)sharedInstance
{
  id result = (id)sLoader;
  if (!sLoader)
  {
    id result = (id)objc_opt_new();
    sLoader = (uint64_t)result;
  }
  return result;
}

- (NSMutableDictionary)imagesCache
{
  id result = self->_imagesCache;
  if (!result)
  {
    id result = (NSMutableDictionary *)objc_opt_new();
    self->_imagesCache = result;
  }
  return result;
}

- (void)dealloc
{
  self->_imagesCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACMImageLoader;
  [(ACMImageLoader *)&v3 dealloc];
}

- (id)imageNamed:(id)a3
{
  v5 = (void *)[(NSMutableDictionary *)[(ACMImageLoader *)self imagesCache] objectForKeyedSubscript:a3];
  if (!v5)
  {
    [[MEMORY[0x263F1C920] mainScreen] scale];
    double v7 = v6;
    uint64_t v8 = +[ACMUIImageUtilities imageResolutionFactor];
    if ((int)v8 < 1)
    {
LABEL_8:
      if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLogNS(3, (uint64_t)"-[ACMImageLoader imageNamed:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMImages.m", 116, 0, @"No data for image \"%@\"", v13, v14, (uint64_t)a3);
      }
      return 0;
    }
    else
    {
      uint64_t v9 = v8;
      while (1)
      {
        v10 = &stru_26F261788;
        if (v9 != 1) {
          v10 = (__CFString *)[NSString stringWithFormat:@"_%dx", v9];
        }
        NSClassFromString([NSString stringWithFormat:@"ACM_%@%@_%@", [a3 stringByDeletingPathExtension], v10, [[a3 pathExtension] uppercaseString]]);
        uint64_t v11 = [(id)objc_opt_new() data];
        if (v11) {
          break;
        }
        double v7 = v7 + -1.0;
        BOOL v12 = v9 != 0;
        uint64_t v9 = (v9 - 1);
        if (v9 == 0 || !v12) {
          goto LABEL_8;
        }
      }
      CFDataRef v15 = (const __CFData *)v11;
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      {
        uint64_t v16 = objc_opt_class();
        ACFLog(7, (uint64_t)"-[ACMImageLoader imageNamed:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMImages.m", 107, 0, "Loaded image: %@", v16);
      }
      v17 = CGDataProviderCreateWithCFData(v15);
      CGImageRef v18 = CGImageCreateWithPNGDataProvider(v17, 0, 0, kCGRenderingIntentDefault);
      v5 = (void *)[MEMORY[0x263F1C6B0] imageWithCGImage:v18 scale:0 orientation:v7];
      if (v18) {
        CFRelease(v18);
      }
      if (v17) {
        CFRelease(v17);
      }
      if (v5) {
        [(NSMutableDictionary *)[(ACMImageLoader *)self imagesCache] setObject:v5 forKey:a3];
      }
    }
  }
  return v5;
}

@end