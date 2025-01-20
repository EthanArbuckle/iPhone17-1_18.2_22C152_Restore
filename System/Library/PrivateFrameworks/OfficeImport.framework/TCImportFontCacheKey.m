@interface TCImportFontCacheKey
+ (id)createFontCacheKeyForName:(id)a3 size:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (int)size;
- (unint64_t)hash;
- (void)setName:(id)a3;
- (void)setSize:(int)a3;
@end

@implementation TCImportFontCacheKey

+ (id)createFontCacheKeyForName:(id)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = objc_alloc_init(TCImportFontCacheKey);
  [(TCImportFontCacheKey *)v6 setName:v5];
  [(TCImportFontCacheKey *)v6 setSize:v4];

  return v6;
}

- (unint64_t)hash
{
  uint64_t size = self->_size;
  return [(NSString *)self->_name hash] ^ size;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_size == v4[2]
    && [(NSString *)self->_name isEqualToString:*((void *)v4 + 2)];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  self->_uint64_t size = a3;
}

- (void).cxx_destruct
{
}

@end