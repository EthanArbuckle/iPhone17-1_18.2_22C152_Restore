@interface SUNavigationMenuItem
- (NSString)title;
- (NSURL)URL;
- (SUItemContentRating)contentRating;
- (SUNavigationMenuItem)init;
- (SUNavigationMenuItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation SUNavigationMenuItem

- (SUNavigationMenuItem)init
{
  return [(SUNavigationMenuItem *)self initWithDictionary:0];
}

- (SUNavigationMenuItem)initWithDictionary:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUNavigationMenuItem;
  v4 = [(SUNavigationMenuItem *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [a3 objectForKey:@"rating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      v4->_contentRating = [[SUItemContentRating alloc] initWithDictionary:v5];
    }
    v6 = (void *)[a3 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_title = (NSString *)v6;
    }
    uint64_t v7 = [a3 objectForKey:@"url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_url = (NSURL *)[objc_alloc(NSURL) initWithString:v7];
    }
    if (![(NSString *)v4->_title length] || !v4->_url)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenuItem;
  [(SUNavigationMenuItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(SUItemContentRating *)self->_contentRating copyWithZone:a3];
  v5[2] = [(NSString *)self->_title copyWithZone:a3];
  v5[3] = [(NSURL *)self->_url copyWithZone:a3];
  return v5;
}

- (SUItemContentRating)contentRating
{
  return self->_contentRating;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

@end