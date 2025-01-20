@interface UIKBTreeLocalizedKeylistEnumerator
- (UIKBTreeLocalizedKeylistEnumerator)initWithKeyplaneCache:(id)a3;
- (id)nextObject;
@end

@implementation UIKBTreeLocalizedKeylistEnumerator

- (UIKBTreeLocalizedKeylistEnumerator)initWithKeyplaneCache:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBTreeLocalizedKeylistEnumerator;
  v6 = [(UIKBTreeLocalizedKeylistEnumerator *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyplaneCache, a3);
    uint64_t v8 = [(NSDictionary *)v7->_keyplaneCache keyEnumerator];
    nameEnum = v7->_nameEnum;
    v7->_nameEnum = (NSEnumerator *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  uint64_t v3 = [(NSEnumerator *)self->_nameEnum nextObject];
  if (v3)
  {
    v4 = (void *)v3;
    while (1)
    {
      if (!+[UIKBTree shouldSkipCacheString:v4])
      {
        id v5 = [(NSDictionary *)self->_keyplaneCache objectForKey:v4];
        v6 = [v5 lastObject];
        v7 = [v6 localizationKey];

        if (v7) {
          break;
        }
      }
      uint64_t v8 = [(NSEnumerator *)self->_nameEnum nextObject];

      v4 = (void *)v8;
      if (!v8) {
        goto LABEL_6;
      }
    }
    v9 = [(NSDictionary *)self->_keyplaneCache objectForKey:v4];
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameEnum, 0);
  objc_storeStrong((id *)&self->_keyplaneCache, 0);
}

@end