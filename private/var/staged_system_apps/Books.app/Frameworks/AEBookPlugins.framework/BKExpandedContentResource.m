@interface BKExpandedContentResource
+ (id)resourceForURL:(id)a3;
- (BEProtocolCacheItem)cacheItem;
- (CGSize)contentSize;
- (NSObject)resource;
- (NSString)bookID;
- (NSString)contentType;
- (NSString)title;
- (NSURL)sourceURL;
- (double)zoomScale;
- (void)setCacheItem:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentType:(id)a3;
- (void)setResource:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setZoomScale:(double)a3;
@end

@implementation BKExpandedContentResource

+ (id)resourceForURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setResource:v4];

  return v5;
}

- (NSString)bookID
{
  return (NSString *)[(BEProtocolCacheItem *)self->_cacheItem bookID];
}

- (BEProtocolCacheItem)cacheItem
{
  return self->_cacheItem;
}

- (void)setCacheItem:(id)a3
{
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSObject)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_cacheItem, 0);
}

@end