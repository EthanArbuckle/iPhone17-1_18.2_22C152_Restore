@interface SUOverlayConfiguration
- (BOOL)matchesURL:(id)a3;
- (BOOL)matchesURLBagKey:(id)a3;
- (BOOL)shouldShowNavigationBar;
- (CGSize)size;
- (NSString)transitionName;
- (SUOverlayConfiguration)init;
- (SUOverlayConfiguration)initWithDictionary:(id)a3;
- (int64_t)cornerRadius;
- (void)dealloc;
@end

@implementation SUOverlayConfiguration

- (SUOverlayConfiguration)init
{
  return [(SUOverlayConfiguration *)self initWithDictionary:0];
}

- (SUOverlayConfiguration)initWithDictionary:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUOverlayConfiguration.m", 42, @"Must have a dictionary");
  }
  v14.receiver = self;
  v14.super_class = (Class)SUOverlayConfiguration;
  v5 = [(SUOverlayConfiguration *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [a3 objectForKey:@"bag-key-pattern"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_bagKeyPattern = (NSRegularExpression *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v6 options:1 error:0];
    }
    v7 = (void *)[a3 objectForKey:@"corner-radius"];
    if (objc_opt_respondsToSelector()) {
      v5->_cornerRadius = (int)[v7 intValue];
    }
    v8 = (void *)[a3 objectForKey:@"height"];
    if (objc_opt_respondsToSelector()) {
      v5->_size.height = (double)(int)[v8 intValue];
    }
    v9 = (void *)[a3 objectForKey:@"show-navigation-bar"];
    if (objc_opt_respondsToSelector()) {
      v5->_shouldShowNavigationBar = [v9 BOOLValue];
    }
    v10 = (void *)[a3 objectForKey:@"transition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_transitionName = (NSString *)v10;
    }
    uint64_t v11 = [a3 objectForKey:@"url-pattern"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_urlPattern = (NSRegularExpression *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v11 options:1 error:0];
    }
    v12 = (void *)[a3 objectForKey:@"width"];
    if (objc_opt_respondsToSelector()) {
      v5->_size.width = (double)(int)[v12 intValue];
    }
    if (!v5->_bagKeyPattern && !v5->_urlPattern)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayConfiguration;
  [(SUOverlayConfiguration *)&v3 dealloc];
}

- (BOOL)matchesURL:(id)a3
{
  if (!self->_urlPattern) {
    return 0;
  }
  v4 = (void *)[a3 absoluteString];
  return -[NSRegularExpression rangeOfFirstMatchInString:options:range:](self->_urlPattern, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, [v4 length]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)matchesURLBagKey:(id)a3
{
  bagKeyPattern = self->_bagKeyPattern;
  return bagKeyPattern
      && -[NSRegularExpression rangeOfFirstMatchInString:options:range:](bagKeyPattern, "rangeOfFirstMatchInString:options:range:", a3, 0, 0, [a3 length]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)shouldShowNavigationBar
{
  return self->_shouldShowNavigationBar;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)transitionName
{
  return self->_transitionName;
}

@end