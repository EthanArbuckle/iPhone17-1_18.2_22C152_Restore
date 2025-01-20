@interface RadioArtwork
- (BOOL)isEqual:(id)a3;
- (CGSize)pixelSize;
- (CGSize)pointSize;
- (NSURL)URL;
- (RadioArtwork)initWithArtworkDictionary:(id)a3;
- (RadioArtwork)initWithArtworkURL:(id)a3 pixelSize:(CGSize)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation RadioArtwork

- (void).cxx_destruct
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)pointSize
{
  if (pointSize___onceToken != -1) {
    dispatch_once(&pointSize___onceToken, &__block_literal_global_1223);
  }
  double v3 = self->_pixelSize.width / *(float *)&pointSize___screenScale;
  double v4 = self->_pixelSize.height / *(float *)&pointSize___screenScale;
  result.double height = v4;
  result.double width = v3;
  return result;
}

uint64_t __25__RadioArtwork_pointSize__block_invoke()
{
  uint64_t result = GSMainScreenScaleFactor();
  pointSize___screenScale = v1;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (RadioArtwork *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(RadioArtwork *)v4 URL];
      [(RadioArtwork *)v4 pixelSize];
      if (v7 == self->_pixelSize.width && v6 == self->_pixelSize.height)
      {
        if ((uint64_t)self->_URL | v5) {
          char v9 = objc_msgSend((id)v5, "isEqual:");
        }
        else {
          char v9 = 1;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self->_pixelSize.height ^ (unint64_t)self->_pixelSize.width;
  return v2 ^ [(NSURL *)self->_URL hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p pixelSize:(%g, %g) URL: '%@'>", objc_opt_class(), self, *(void *)&self->_pixelSize.width, *(void *)&self->_pixelSize.height, self->_URL];
}

- (RadioArtwork)initWithArtworkURL:(id)a3 pixelSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)RadioArtwork;
    char v9 = [(RadioArtwork *)&v13 init];
    v10 = v9;
    if (v9)
    {
      v9->_pixelSize.CGFloat width = width;
      v9->_pixelSize.CGFloat height = height;
      objc_storeStrong((id *)&v9->_URL, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (RadioArtwork)initWithArtworkDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"height"];
  double v6 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v5 doubleValue];
    double v6 = v7;
  }
  id v8 = [v4 objectForKey:@"width"];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (([v8 doubleValue], double v10 = v9, v9 >= 0.00000011920929) ? (v11 = v6 < 0.00000011920929) : (v11 = 1),
        v11))
  {
    v12 = 0;
  }
  else
  {
    objc_super v13 = [v4 objectForKey:@"url"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      v12 = [NSURL URLWithString:v13];
      if (v12)
      {
        v18.receiver = self;
        v18.super_class = (Class)RadioArtwork;
        v15 = [(RadioArtwork *)&v18 init];
        v16 = v15;
        if (v15)
        {
          v15->_pixelSize.CGFloat width = v6;
          v15->_pixelSize.CGFloat height = v10;
          objc_storeStrong((id *)&v15->_URL, v12);
        }
        self = v16;

        v12 = self;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  return v12;
}

@end