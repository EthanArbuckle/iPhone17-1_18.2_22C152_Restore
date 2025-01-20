@interface VUIVideoAdvisoryImageInfo
- (NSString)format;
- (NSString)imageURL;
- (unint64_t)height;
- (unint64_t)width;
- (void)setFormat:(id)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setImageURL:(id)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation VUIVideoAdvisoryImageInfo

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end