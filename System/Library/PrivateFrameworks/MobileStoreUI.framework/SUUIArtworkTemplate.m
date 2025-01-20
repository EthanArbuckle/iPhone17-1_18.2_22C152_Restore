@interface SUUIArtworkTemplate
+ (BOOL)canHandleArtworkFormat:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArtwork;
- (BOOL)isEqual:(id)a3;
- (CGSize)_sizeForWidth:(int64_t)a3;
- (NSMutableDictionary)cacheRepresentation;
- (NSMutableSet)servedArtworks;
- (NSString)description;
- (NSString)urlTemplateString;
- (SUUIArtwork)largestArtwork;
- (SUUIArtwork)smallestArtwork;
- (SUUIArtworkTemplate)initWithCacheRepresentation:(id)a3;
- (SUUIArtworkTemplate)initWithCoder:(id)a3;
- (SUUIArtworkTemplate)initWithTemplateDictionary:(id)a3;
- (id)_artworkURLWithWidth:(int64_t)a3;
- (id)_artworkWithWidth:(int64_t)a3;
- (id)_lookupDictionary;
- (id)_urlStringWithTargetSize:(CGSize)a3;
- (id)artworkForSize:(int64_t)a3;
- (id)artworkURLForSize:(int64_t)a3;
- (id)artworkWithWidth:(int64_t)a3;
- (id)bestArtworkForScaledSize:(CGSize)a3;
- (id)bestArtworkForSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)preferredExactArtworkForSize:(CGSize)a3;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUUIArtworkTemplate

- (SUUIArtworkTemplate)initWithTemplateDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIArtworkTemplate;
  v5 = [(SUUIArtworkTemplate *)&v12 init];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    servedArtworks = v5->_servedArtworks;
    v5->_servedArtworks = v6;

    v8 = [v4 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_urlTemplateString, v8);
    }
    v9 = [v4 objectForKey:@"width"];

    if (objc_opt_respondsToSelector()) {
      v5->_width = [v9 integerValue];
    }
    v10 = [v4 objectForKey:@"height"];

    if (objc_opt_respondsToSelector()) {
      v5->_height = [v10 integerValue];
    }
  }
  return v5;
}

- (id)artworkForSize:(int64_t)a3
{
  id v4 = [(SUUIArtworkTemplate *)self artworkWithWidth:a3];
  v5 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v5 addObject:v4];

  return v4;
}

- (id)artworkURLForSize:(int64_t)a3
{
  id v4 = [(SUUIArtworkTemplate *)self artworkForSize:a3];
  v5 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v5 addObject:v4];

  v6 = [v4 URL];

  return v6;
}

- (id)artworkWithWidth:(int64_t)a3
{
  id v4 = [(SUUIArtworkTemplate *)self _artworkWithWidth:a3];
  v5 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v5 addObject:v4];

  return v4;
}

- (id)bestArtworkForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  v7 = [SUUIArtwork alloc];
  v8 = (void *)[objc_alloc(NSURL) initWithString:v6];
  v9 = -[SUUIArtwork initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  v10 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v10 addObject:v9];

  return v9;
}

- (id)bestArtworkForScaledSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = v7;

  v9 = -[SUUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", ceil(width * v8), ceil(height * v8));
  v10 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v10 addObject:v9];

  return v9;
}

- (id)preferredExactArtworkForSize:(CGSize)a3
{
  id v4 = -[SUUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", a3.width, a3.height);
  v5 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v5 addObject:v4];

  return v4;
}

- (BOOL)hasArtwork
{
  return self->_urlTemplateString != 0;
}

+ (BOOL)canHandleArtworkFormat:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SUUIArtwork)largestArtwork
{
  double width = (double)self->_width;
  double height = (double)self->_height;
  v5 = -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", width, height);
  v6 = [SUUIArtwork alloc];
  double v7 = [NSURL URLWithString:v5];
  double v8 = -[SUUIArtwork initWithURL:size:](v6, "initWithURL:size:", v7, width, height);

  v9 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v9 addObject:v8];

  return v8;
}

- (SUUIArtwork)smallestArtwork
{
  id v3 = -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", 65.0, 65.0);
  id v4 = [SUUIArtwork alloc];
  v5 = [NSURL URLWithString:v3];
  v6 = -[SUUIArtwork initWithURL:size:](v4, "initWithURL:size:", v5, 65.0, 65.0);

  double v7 = [(SUUIArtworkTemplate *)self servedArtworks];
  [v7 addObject:v6];

  return v6;
}

- (id)_artworkWithWidth:(int64_t)a3
{
  -[SUUIArtworkTemplate _sizeForWidth:](self, "_sizeForWidth:");
  double v6 = v5;
  double v8 = v7;
  v9 = [(SUUIArtworkTemplate *)self _artworkURLWithWidth:a3];
  v10 = -[SUUIArtwork initWithURL:size:]([SUUIArtwork alloc], "initWithURL:size:", v9, v6, v8);

  return v10;
}

- (id)_artworkURLWithWidth:(int64_t)a3
{
  [(SUUIArtworkTemplate *)self _sizeForWidth:a3];
  id v4 = -[SUUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  double v5 = [NSURL URLWithString:v4];

  return v5;
}

- (CGSize)_sizeForWidth:(int64_t)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  int64_t height = self->_height;
  if (height >= 1)
  {
    int64_t width = self->_width;
    if (width >= 1)
    {
      double v3 = (double)a3;
      double v4 = ceil((double)height / (double)width * (double)a3);
    }
  }
  result.int64_t height = v4;
  result.int64_t width = v3;
  return result;
}

- (id)_urlStringWithTargetSize:(CGSize)a3
{
  double v3 = 0;
  if (self->_urlTemplateString)
  {
    if (a3.width > 0.0)
    {
      double height = a3.height;
      if (a3.height > 0.0)
      {
        double v6 = objc_msgSend(NSString, "stringWithFormat:", @"%li", (uint64_t)a3.width);
        double v7 = objc_msgSend(NSString, "stringWithFormat:", @"%li", (uint64_t)height);
        double v8 = [(NSString *)self->_urlTemplateString stringByReplacingOccurrencesOfString:@"{w}" withString:v6];
        v9 = [v8 stringByReplacingOccurrencesOfString:@"{h}" withString:v7];

        v10 = [v9 stringByReplacingOccurrencesOfString:@"{f}" withString:@"jpg"];

        double v3 = [v10 stringByReplacingOccurrencesOfString:@"{c}" withString:@"bb"];
      }
    }
  }

  return v3;
}

- (id)_lookupDictionary
{
  v2 = [(SUUIArtworkTemplate *)self largestArtwork];
  double v3 = [v2 _lookupDictionary];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    urlTemplateString = self->_urlTemplateString;
    double v6 = [v4 urlTemplateString];
    BOOL v7 = [(NSString *)urlTemplateString isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_urlTemplateString hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_urlTemplateString copyWithZone:a3];
  BOOL v7 = (void *)v5[3];
  v5[3] = v6;

  v5[2] = self->_width;
  v5[1] = self->_height;
  return v5;
}

- (NSString)description
{
  double v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUUIArtworkTemplate;
  id v4 = [(SUUIArtworkTemplate *)&v8 description];
  double v5 = [(SUUIArtworkTemplate *)self largestArtwork];
  uint64_t v6 = [v3 stringWithFormat:@"%@: Artwork: %@", v4, v5];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIArtworkTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIArtworkTemplate;
  double v5 = [(SUUIArtworkTemplate *)&v9 init];
  if (v5)
  {
    v5->_double height = [v4 decodeIntegerForKey:@"height"];
    v5->_int64_t width = [v4 decodeIntegerForKey:@"width"];
    uint64_t v6 = [v4 decodeObjectForKey:@"urlTemplateString"];
    urlTemplateString = v5->_urlTemplateString;
    v5->_urlTemplateString = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t height = self->_height;
  id v5 = a3;
  [v5 encodeInteger:height forKey:@"height"];
  [v5 encodeInteger:self->_width forKey:@"width"];
  [v5 encodeObject:self->_urlTemplateString forKey:@"urlTemplateString"];
}

- (SUUIArtworkTemplate)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUIArtworkTemplate;
    id v5 = [(SUUIArtworkTemplate *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKey:@"urlTemplateString"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_urlTemplateString, v6);
      }
      BOOL v7 = [v4 objectForKey:@"width"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_int64_t width = [v7 integerValue];
      }
      objc_super v8 = [v4 objectForKey:@"height"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5->_int64_t height = [v8 integerValue];
      }
    }
  }
  else
  {

    id v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_urlTemplateString forKey:@"urlTemplateString"];
  id v4 = [NSNumber numberWithInteger:self->_width];
  [v3 setObject:v4 forKey:@"width"];

  id v5 = [NSNumber numberWithInteger:self->_height];
  [v3 setObject:v5 forKey:@"height"];

  return (NSMutableDictionary *)v3;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (NSString)urlTemplateString
{
  return self->_urlTemplateString;
}

- (NSMutableSet)servedArtworks
{
  return self->_servedArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servedArtworks, 0);

  objc_storeStrong((id *)&self->_urlTemplateString, 0);
}

@end