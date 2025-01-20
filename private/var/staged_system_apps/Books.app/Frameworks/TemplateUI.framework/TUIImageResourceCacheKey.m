@interface TUIImageResourceCacheKey
- (BOOL)isEqual:(id)a3;
- (NSArray)children;
- (NSString)id;
- (NSValue)size;
- (TUIImageResourceCacheKey)cacheKeyWithColor:(id)a3;
- (TUIImageResourceCacheKey)cacheKeyWithFilterInfo:(id)a3;
- (TUIImageResourceCacheKey)cacheKeyWithSize:(CGSize)a3;
- (TUIImageResourceCacheKey)initWithChildren:(id)a3;
- (TUIImageResourceCacheKey)initWithID:(id)a3;
- (TUIImageResourceCacheKey)initWithURL:(id)a3;
- (UIColor)color;
- (_TUICachedImageFilterInfo)filterInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setChildren:(id)a3;
- (void)setColor:(id)a3;
- (void)setFilterInfo:(id)a3;
- (void)setId:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation TUIImageResourceCacheKey

- (TUIImageResourceCacheKey)initWithID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImageResourceCacheKey;
  v6 = [(TUIImageResourceCacheKey *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_id, a3);
  }

  return v7;
}

- (TUIImageResourceCacheKey)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIImageResourceCacheKey;
  id v5 = [(TUIImageResourceCacheKey *)&v10 init];
  if (v5)
  {
    v6 = [v4 standardizedURL];
    uint64_t v7 = [v6 absoluteString];
    id = v5->_id;
    v5->_id = (NSString *)v7;
  }
  return v5;
}

- (TUIImageResourceCacheKey)initWithChildren:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImageResourceCacheKey;
  v6 = [(TUIImageResourceCacheKey *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_children, a3);
  }

  return v7;
}

- (TUIImageResourceCacheKey)cacheKeyWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(TUIImageResourceCacheKey *)self copy];
  v6 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", width, height);
  [v5 setSize:v6];

  return (TUIImageResourceCacheKey *)v5;
}

- (TUIImageResourceCacheKey)cacheKeyWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIImageResourceCacheKey *)self copy];
  [v5 setColor:v4];

  return (TUIImageResourceCacheKey *)v5;
}

- (TUIImageResourceCacheKey)cacheKeyWithFilterInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIImageResourceCacheKey *)self copy];
  [v5 setFilterInfo:v4];

  return (TUIImageResourceCacheKey *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(TUIImageResourceCacheKey *)self id];
    objc_super v9 = [v7 id];
    if (v8 != v9)
    {
      objc_super v10 = [(TUIImageResourceCacheKey *)self id];
      [v7 id];
      v38 = v37 = v10;
      if (!objc_msgSend(v10, "isEqual:"))
      {
        unsigned __int8 v11 = 0;
        goto LABEL_29;
      }
    }
    v12 = [(TUIImageResourceCacheKey *)self size];
    v13 = [v7 size];
    if (v12 != v13)
    {
      id v5 = [(TUIImageResourceCacheKey *)self size];
      v3 = [v7 size];
      if (![v5 isEqual:v3])
      {
        unsigned __int8 v11 = 0;
LABEL_27:

LABEL_28:
        if (v8 == v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    uint64_t v14 = [(TUIImageResourceCacheKey *)self color];
    uint64_t v35 = [v7 color];
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      v15 = [(TUIImageResourceCacheKey *)self color];
      v33 = [v7 color];
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        unsigned __int8 v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      v32 = v3;
    }
    v16 = [(TUIImageResourceCacheKey *)self filterInfo];
    v17 = [v7 filterInfo];
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      id v4 = [(TUIImageResourceCacheKey *)self filterInfo];
      v31 = [v7 filterInfo];
      if (!objc_msgSend(v4, "isEqual:"))
      {
        unsigned __int8 v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    v20 = [(TUIImageResourceCacheKey *)self children];
    uint64_t v21 = [v7 children];
    if (v20 == (void *)v21)
    {

      unsigned __int8 v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      [(TUIImageResourceCacheKey *)self children];
      v23 = v27 = v4;
      [v7 children];
      v28 = v12;
      v25 = v24 = v16;
      unsigned __int8 v11 = [v23 isEqual:v25];

      v16 = v24;
      v12 = v28;

      id v4 = v27;
    }
    id v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  unsigned __int8 v11 = 0;
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_id hash];
  unint64_t v4 = (unint64_t)[(NSValue *)self->_size hash] ^ v3;
  unint64_t v5 = (unint64_t)[(UIColor *)self->_color hash];
  unint64_t v6 = v4 ^ v5 ^ [(_TUICachedImageFilterInfo *)self->_filterInfo hash];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_children;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      unsigned __int8 v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v6 ^= (unint64_t)[*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) hash:v13];
        unsigned __int8 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(TUIImageResourceCacheKey);
  unint64_t v5 = [(TUIImageResourceCacheKey *)self id];
  [(TUIImageResourceCacheKey *)v4 setId:v5];

  unint64_t v6 = [(TUIImageResourceCacheKey *)self size];
  [(TUIImageResourceCacheKey *)v4 setSize:v6];

  id v7 = [(TUIImageResourceCacheKey *)self color];
  [(TUIImageResourceCacheKey *)v4 setColor:v7];

  id v8 = [(TUIImageResourceCacheKey *)self filterInfo];
  [(TUIImageResourceCacheKey *)v4 setFilterInfo:v8];

  id v9 = [(TUIImageResourceCacheKey *)self children];
  [(TUIImageResourceCacheKey *)v4 setChildren:v9];

  return v4;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSValue)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (_TUICachedImageFilterInfo)filterInfo
{
  return self->_filterInfo;
}

- (void)setFilterInfo:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_filterInfo, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_size, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end