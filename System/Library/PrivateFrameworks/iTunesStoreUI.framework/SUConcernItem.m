@interface SUConcernItem
- (BOOL)isDefaultConcern;
- (NSString)identifier;
- (NSString)title;
- (SUConcernItem)initWithDictionary:(id)a3;
- (void)dealloc;
- (void)setDefaultConcern:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUConcernItem

- (SUConcernItem)initWithDictionary:(id)a3
{
  v4 = [(SUConcernItem *)self init];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = (void *)[a3 objectForKey:@"default"];
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = [v5 BOOLValue];
      }
      else {
        uint64_t v6 = 0;
      }
      [(SUConcernItem *)v4 setDefaultConcern:v6];
      uint64_t v7 = [a3 objectForKey:@"problem-id"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      [(SUConcernItem *)v4 setIdentifier:v8];
      uint64_t v9 = [a3 objectForKey:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      [(SUConcernItem *)v4 setTitle:v10];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_identifier = 0;
  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUConcernItem;
  [(SUConcernItem *)&v3 dealloc];
}

- (BOOL)isDefaultConcern
{
  return self->_default;
}

- (void)setDefaultConcern:(BOOL)a3
{
  self->_default = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

@end