@interface SteppingSignSizeAttributesCache
- (SteppingSignSizeAttributesCache)init;
- (id)sizeAttributesForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (void)invalidateSizeAttributes;
- (void)invalidateSizeAttributesForSignAtIndex:(int64_t)a3;
- (void)setSizeAttributes:(id)a3 forSignAtIndex:(int64_t)a4 fittingSize:(CGSize)a5;
@end

@implementation SteppingSignSizeAttributesCache

- (SteppingSignSizeAttributesCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)SteppingSignSizeAttributesCache;
  v2 = [(SteppingSignSizeAttributesCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attributesCache = v2->_attributesCache;
    v2->_attributesCache = v3;
  }
  return v2;
}

- (id)sizeAttributesForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  attributesCache = self->_attributesCache;
  v7 = +[NSNumber numberWithInteger:a3];
  v8 = [(NSMutableDictionary *)attributesCache objectForKey:v7];

  v13.CGFloat width = width;
  v13.CGFloat height = height;
  v9 = NSStringFromCGSize(v13);
  v10 = [v8 objectForKey:v9];

  return v10;
}

- (void)setSizeAttributes:(id)a3 forSignAtIndex:(int64_t)a4 fittingSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  attributesCache = self->_attributesCache;
  id v10 = a3;
  v11 = +[NSNumber numberWithInteger:a4];
  id v15 = [(NSMutableDictionary *)attributesCache objectForKey:v11];

  if (!v15)
  {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = self->_attributesCache;
    CGSize v13 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v15 forKey:v13];
  }
  v17.CGFloat width = width;
  v17.CGFloat height = height;
  v14 = NSStringFromCGSize(v17);
  [v15 setObject:v10 forKey:v14];
}

- (void)invalidateSizeAttributes
{
}

- (void)invalidateSizeAttributesForSignAtIndex:(int64_t)a3
{
  attributesCache = self->_attributesCache;
  id v4 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)attributesCache removeObjectForKey:v4];
}

- (void).cxx_destruct
{
}

@end