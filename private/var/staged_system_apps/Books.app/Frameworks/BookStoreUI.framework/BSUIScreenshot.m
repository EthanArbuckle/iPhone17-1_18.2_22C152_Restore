@interface BSUIScreenshot
- (BSUIScreenshot)initWithDictionary:(id)a3;
- (CGSize)size;
- (NSURL)url;
- (id)description;
@end

@implementation BSUIScreenshot

- (BSUIScreenshot)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(BSUIScreenshot *)self init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"height"];
    v7 = [v4 objectForKeyedSubscript:@"width"];
    double v8 = 0.0;
    double v9 = 0.0;
    if (objc_opt_respondsToSelector()) {
      double v9 = (double)(uint64_t)[v6 integerValue];
    }
    if (objc_opt_respondsToSelector()) {
      double v8 = (double)(uint64_t)[v7 integerValue];
    }
    v5->_size.width = v8;
    v5->_size.height = v9;
    v10 = [v4 objectForKeyedSubscript:@"artworkUrl"];
    v11 = [v10 jsa_normalizedArtworkURLOfSize:@"jpg" withFormat:v5->_size.width, v5->_size.height];
    uint64_t v12 = +[NSURL URLWithString:v11];
    url = v5->_url;
    v5->_url = (NSURL *)v12;
  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p size={%g, %g} url=%@>", objc_opt_class(), self, *(void *)&self->_size.width, *(void *)&self->_size.height, self->_url];
}

- (NSURL)url
{
  return self->_url;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end