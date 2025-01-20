@interface SKUIArtwork
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSMutableDictionary)cacheRepresentation;
- (NSString)description;
- (NSURL)URL;
- (SKUIArtwork)initWithArtworkDictionary:(id)a3;
- (SKUIArtwork)initWithCacheRepresentation:(id)a3;
- (SKUIArtwork)initWithCoder:(id)a3;
- (SKUIArtwork)initWithURL:(id)a3 size:(CGSize)a4;
- (id)_lookupDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKUIArtwork

- (SKUIArtwork)initWithArtworkDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIArtwork initWithArtworkDictionary:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIArtwork;
  v5 = [(SKUIArtwork *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_urlString, v6);
    }
    v7 = [v4 objectForKey:@"width"];

    if (objc_opt_respondsToSelector()) {
      v5->_width = [v7 integerValue];
    }
    v8 = [v4 objectForKey:@"height"];

    if (objc_opt_respondsToSelector()) {
      v5->_height = [v8 integerValue];
    }
  }
  return v5;
}

- (SKUIArtwork)initWithURL:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIArtwork initWithURL:size:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIArtwork;
  v8 = [(SKUIArtwork *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_double height = (uint64_t)height;
    uint64_t v10 = [v7 copy];
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    v9->_double width = (uint64_t)width;
  }

  return v9;
}

- (CGSize)size
{
  double width = (double)self->_width;
  double height = (double)self->_height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)URL
{
  url = self->_url;
  if (!url)
  {
    if (self->_urlString)
    {
      id v4 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:self->_urlString];
      v5 = self->_url;
      self->_url = v4;

      urlString = self->_urlString;
      self->_urlString = 0;

      url = self->_url;
    }
    else
    {
      url = 0;
    }
  }

  return url;
}

- (id)_lookupDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSURL *)self->_url absoluteString];
  if (v4 || (id v4 = self->_urlString) != 0)
  {
    [v3 setObject:v4 forKey:@"url"];
  }
  v5 = (void *)[objc_alloc(NSNumber) initWithInteger:self->_height];
  [v3 setObject:v5 forKey:@"height"];
  v6 = (void *)[objc_alloc(NSNumber) initWithInteger:self->_width];
  [v3 setObject:v6 forKey:@"width"];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SKUIArtwork;
  id v4 = [(SKUIArtwork *)&v10 description];
  int64_t width = self->_width;
  int64_t height = self->_height;
  id v7 = [(SKUIArtwork *)self URL];
  v8 = [v3 stringWithFormat:@"%@: [%ld, %ld]; %@", v4, width, height, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (int64_t width = self->_width, width == [v4 width])
    && (int64_t height = self->_height, height == [v4 height]))
  {
    v8 = [(SKUIArtwork *)self URL];
    v9 = [v4 URL];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_height;
  objc_storeStrong((id *)(v4 + 24), self->_urlString);
  uint64_t v5 = [(NSURL *)self->_url copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(void *)(v4 + 32) = self->_width;
  return (id)v4;
}

- (SKUIArtwork)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)SKUIArtwork;
    uint64_t v5 = [(SKUIArtwork *)&v12 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_int64_t height = (int)[v6 intValue];
      }
      id v7 = [v4 objectForKey:@"width"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_int64_t width = (int)[v7 intValue];
      }
      v8 = [v4 objectForKey:@"url"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
        url = v5->_url;
        v5->_url = (NSURL *)v9;
      }
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithInteger:self->_height];
  [v3 setObject:v4 forKey:@"height"];

  uint64_t v5 = [NSNumber numberWithInteger:self->_width];
  [v3 setObject:v5 forKey:@"width"];

  v6 = [(SKUIArtwork *)self URL];
  id v7 = [v6 absoluteString];

  if (v7) {
    [v3 setObject:v7 forKey:@"url"];
  }

  return (NSMutableDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIArtwork)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIArtwork;
  uint64_t v5 = [(SKUIArtwork *)&v9 init];
  if (v5)
  {
    v5->_int64_t height = [v4 decodeIntegerForKey:@"height"];
    v5->_int64_t width = [v4 decodeIntegerForKey:@"width"];
    uint64_t v6 = [v4 decodeObjectForKey:@"URL"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t height = self->_height;
  id v5 = a3;
  [v5 encodeInteger:height forKey:@"height"];
  [v5 encodeInteger:self->_width forKey:@"width"];
  [v5 encodeObject:self->_url forKey:@"URL"];
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithArtworkDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtwork initWithArtworkDictionary:]";
}

- (void)initWithURL:size:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtwork initWithURL:size:]";
}

@end