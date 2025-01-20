@interface IMRenderingCacheWriteOperation
+ (id)mimeForIMRenderingCacheSerializeFormat:(int)a3;
- (IMRenderingCacheWriteOperation)initWithImage:(id)a3 key:(id)a4 format:(int)a5 persistentCachePath:(id)a6;
- (NSString)key;
- (UIImage)image;
- (double)compressionQuality;
- (id)description;
- (int)serializeFormat;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setCompressionQuality:(double)a3;
- (void)setImage:(id)a3;
@end

@implementation IMRenderingCacheWriteOperation

- (IMRenderingCacheWriteOperation)initWithImage:(id)a3 key:(id)a4 format:(int)a5 persistentCachePath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(IMRenderingCacheWriteOperation *)self init];
  v14 = v13;
  if (v13)
  {
    [(IMRenderingCacheWriteOperation *)v13 setImage:v10];
    objc_storeStrong((id *)&v14->_key, a4);
    v15 = (NSString *)[v12 copy];
    path = v14->_path;
    v14->_path = v15;

    v14->_serializeFormat = a5;
    if (![(NSString *)v14->_key length]) {
      +[NSException raise:@"NSIllegalState" format:@"IMRenderingCacheWriteOperation does not have _key"];
    }
    if (!v14->_image) {
      +[NSException raise:@"NSIllegalState" format:@"IMRenderingCacheWriteOperation does not have _image"];
    }
    if (!v14->_path) {
      +[NSException raise:@"NSIllegalState" format:@"IMRenderingCacheWriteOperation does not have _persistentCachePath"];
    }
    [(IMRenderingCacheWriteOperation *)v14 setCompressionQuality:0.699999988];
  }

  return v14;
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)IMRenderingCacheWriteOperation;
  [(IMRenderingCacheWriteOperation *)&v2 cancel];
}

- (void)dealloc
{
  path = self->_path;
  self->_path = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMRenderingCacheWriteOperation;
  [(IMRenderingCacheWriteOperation *)&v4 dealloc];
}

- (void)main
{
  if (([(IMRenderingCacheWriteOperation *)self isCancelled] & 1) == 0
    && [(IMRenderingCacheWriteOperation *)self serializeFormat] != -1)
  {
    [(IMRenderingCacheWriteOperation *)self setThreadPriority:0.1];
    v3 = +[IMRenderingCacheWriteOperation mimeForIMRenderingCacheSerializeFormat:[(IMRenderingCacheWriteOperation *)self serializeFormat]];
    objc_super v4 = +[IMPersistentCacheManager sharedInstance];
    v5 = [v4 cacheForPath:self->_path maxSize:0];

    [(IMRenderingCacheWriteOperation *)self serializeFormat];
    if ([(IMRenderingCacheWriteOperation *)self isCancelled]) {
      goto LABEL_10;
    }
    v6 = [(IMRenderingCacheWriteOperation *)self key];
    unsigned __int8 v7 = [v5 hasItemForKey:v6];

    if (v7) {
      goto LABEL_10;
    }
    id v8 = [(IMRenderingCacheWriteOperation *)self image];
    if ([v8 CGImage] && objc_msgSend(v3, "length"))
    {
      unsigned __int8 v9 = [(IMRenderingCacheWriteOperation *)self isCancelled];

      if (v9)
      {
LABEL_10:
        v13 = +[IMPersistentCacheManager sharedInstance];
        [v13 purgeFromCache:self->_path];

        [(IMRenderingCacheWriteOperation *)self setImage:0];
        return;
      }
      id v8 = [(IMRenderingCacheWriteOperation *)self image];
      id v10 = [v8 CGImage];
      id v11 = [(IMRenderingCacheWriteOperation *)self key];
      CFStringRef v14 = kCGImageDestinationLossyCompressionQuality;
      v15 = &off_2EAFB8;
      id v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      [v5 insertCGImage:v10 forKey:v11 mimeType:v3 properties:v12];
    }
    goto LABEL_10;
  }
}

+ (id)mimeForIMRenderingCacheSerializeFormat:(int)a3
{
  if (a3 > 2)
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v4 = *off_2C60A8[a3];
  }
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p> [Image: %p] [AssetID: %@] [Key: %@]", objc_opt_class(), self, self->_image, self->_assetID, self->_key];
}

- (NSString)key
{
  return self->_key;
}

- (int)serializeFormat
{
  return self->_serializeFormat;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void)setCompressionQuality:(double)a3
{
  self->_compressionQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end