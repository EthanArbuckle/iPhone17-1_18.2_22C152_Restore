@interface TVApplicationControllerContext
- (BOOL)isSupplementary;
- (BOOL)supportsPictureInPicturePlayback;
- (NSDictionary)launchOptions;
- (NSString)bagBootURLKey;
- (NSString)storageIdentifier;
- (NSURL)appJSCachePath;
- (NSURL)appLocalJSURL;
- (NSURL)javaScriptApplicationURL;
- (NSURL)offlineJSURL;
- (TVApplicationControllerContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAppJSCachePath:(id)a3;
- (void)setAppLocalJSURL:(id)a3;
- (void)setBagBootURLKey:(id)a3;
- (void)setJavaScriptApplicationURL:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setOfflineJSURL:(id)a3;
- (void)setStorageIdentifier:(id)a3;
- (void)setSupplementary:(BOOL)a3;
- (void)setSupportsPictureInPicturePlayback:(BOOL)a3;
@end

@implementation TVApplicationControllerContext

- (TVApplicationControllerContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVApplicationControllerContext;
  v2 = [(TVApplicationControllerContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    launchOptions = v2->_launchOptions;
    v2->_launchOptions = (NSDictionary *)v3;

    v2->_supportsPictureInPicturePlayback = 1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TVApplicationControllerContext allocWithZone:a3] init];
  v5 = [(TVApplicationControllerContext *)self javaScriptApplicationURL];
  [(TVApplicationControllerContext *)v4 setJavaScriptApplicationURL:v5];

  objc_super v6 = [(TVApplicationControllerContext *)self storageIdentifier];
  [(TVApplicationControllerContext *)v4 setStorageIdentifier:v6];

  v7 = [(TVApplicationControllerContext *)self launchOptions];
  [(TVApplicationControllerContext *)v4 setLaunchOptions:v7];

  [(TVApplicationControllerContext *)v4 setSupplementary:[(TVApplicationControllerContext *)self isSupplementary]];
  v8 = [(TVApplicationControllerContext *)self appLocalJSURL];
  [(TVApplicationControllerContext *)v4 setAppLocalJSURL:v8];

  v9 = [(TVApplicationControllerContext *)self appJSCachePath];
  [(TVApplicationControllerContext *)v4 setAppJSCachePath:v9];

  v10 = [(TVApplicationControllerContext *)self bagBootURLKey];
  [(TVApplicationControllerContext *)v4 setBagBootURLKey:v10];

  v11 = [(TVApplicationControllerContext *)self offlineJSURL];
  [(TVApplicationControllerContext *)v4 setOfflineJSURL:v11];

  [(TVApplicationControllerContext *)v4 setSupportsPictureInPicturePlayback:[(TVApplicationControllerContext *)self supportsPictureInPicturePlayback]];
  return v4;
}

- (NSURL)javaScriptApplicationURL
{
  return self->_javaScriptApplicationURL;
}

- (void)setJavaScriptApplicationURL:(id)a3
{
}

- (NSString)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
}

- (BOOL)supportsPictureInPicturePlayback
{
  return self->_supportsPictureInPicturePlayback;
}

- (void)setSupportsPictureInPicturePlayback:(BOOL)a3
{
  self->_supportsPictureInPicturePlayback = a3;
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
}

- (BOOL)isSupplementary
{
  return self->_supplementary;
}

- (void)setSupplementary:(BOOL)a3
{
  self->_supplementary = a3;
}

- (NSURL)appLocalJSURL
{
  return self->_appLocalJSURL;
}

- (void)setAppLocalJSURL:(id)a3
{
}

- (NSURL)appJSCachePath
{
  return self->_appJSCachePath;
}

- (void)setAppJSCachePath:(id)a3
{
}

- (NSString)bagBootURLKey
{
  return self->_bagBootURLKey;
}

- (void)setBagBootURLKey:(id)a3
{
}

- (NSURL)offlineJSURL
{
  return self->_offlineJSURL;
}

- (void)setOfflineJSURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineJSURL, 0);
  objc_storeStrong((id *)&self->_bagBootURLKey, 0);
  objc_storeStrong((id *)&self->_appJSCachePath, 0);
  objc_storeStrong((id *)&self->_appLocalJSURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_javaScriptApplicationURL, 0);
}

@end