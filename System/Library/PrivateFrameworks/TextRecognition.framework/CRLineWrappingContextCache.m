@interface CRLineWrappingContextCache
- (CRLineWrappingContextCache)init;
- (id)contextForLocale:(id)a3;
@end

@implementation CRLineWrappingContextCache

- (CRLineWrappingContextCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLineWrappingContextCache;
  v2 = [(CRLineWrappingContextCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)contextForLocale:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v4];

  if (!v5)
  {
    objc_super v6 = [[CRLineWrappingContext alloc] initWithLocale:v4];
    [(NSMutableDictionary *)self->_cache setObject:v6 forKeyedSubscript:v4];
  }
  v7 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v4];

  return v7;
}

- (void).cxx_destruct
{
}

@end