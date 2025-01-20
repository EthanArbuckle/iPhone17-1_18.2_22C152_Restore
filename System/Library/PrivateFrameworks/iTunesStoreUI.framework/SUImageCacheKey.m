@interface SUImageCacheKey
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SUImageCacheKey

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUImageCacheKey;
  [(SUImageCacheKey *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(SUImageCacheKey);
  v5->_dataProvider = (SUImageDataProvider *)[(SUImageDataProvider *)self->_dataProvider copyWithZone:a3];
  v5->_url = (NSURL *)[(NSURL *)self->_url copyWithZone:a3];
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SUImageDataProvider *)self->_dataProvider hash];
  return [(NSURL *)self->_url hash] + v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ![(SUImageDataProvider *)self->_dataProvider isEqual:*((void *)a3 + 1)])
  {
    return 0;
  }
  url = self->_url;
  uint64_t v6 = *((void *)a3 + 2);

  return [(NSURL *)url isEqual:v6];
}

@end