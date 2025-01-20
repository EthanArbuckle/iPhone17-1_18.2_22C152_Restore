@interface TVPExternalImageConfig
- (BOOL)usesOneBasedImageIndexes;
- (NSString)imageNameFormatString;
- (NSString)version;
- (NSURL)baseURL;
- (double)imageInterval;
- (int64_t)imageCount;
- (void)setBaseURL:(id)a3;
- (void)setImageCount:(int64_t)a3;
- (void)setImageInterval:(double)a3;
- (void)setImageNameFormatString:(id)a3;
- (void)setUsesOneBasedImageIndexes:(BOOL)a3;
- (void)setVersion:(id)a3;
@end

@implementation TVPExternalImageConfig

- (double)imageInterval
{
  return self->_imageInterval;
}

- (void)setImageInterval:(double)a3
{
  self->_imageInterval = a3;
}

- (int64_t)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(int64_t)a3
{
  self->_imageCount = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (BOOL)usesOneBasedImageIndexes
{
  return self->_usesOneBasedImageIndexes;
}

- (void)setUsesOneBasedImageIndexes:(BOOL)a3
{
  self->_usesOneBasedImageIndexes = a3;
}

- (NSString)imageNameFormatString
{
  return self->_imageNameFormatString;
}

- (void)setImageNameFormatString:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_imageNameFormatString, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end