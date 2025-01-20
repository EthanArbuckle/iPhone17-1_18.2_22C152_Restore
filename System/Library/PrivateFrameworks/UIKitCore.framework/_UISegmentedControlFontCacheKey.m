@interface _UISegmentedControlFontCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UISegmentedControlFontCacheKey)initWithStyleProvider:(id)a3 size:(int)a4 selected:(BOOL)a5 bold:(BOOL)a6;
- (unint64_t)hash;
@end

@implementation _UISegmentedControlFontCacheKey

- (unint64_t)hash
{
  return [(NSString *)self->_styleProviderName hash] ^ self->_size ^ (unint64_t)self->_selected ^ self->_bold;
}

- (void).cxx_destruct
{
}

- (_UISegmentedControlFontCacheKey)initWithStyleProvider:(id)a3 size:(int)a4 selected:(BOOL)a5 bold:(BOOL)a6
{
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UISegmentedControlFontCacheKey;
  v11 = [(_UISegmentedControlFontCacheKey *)&v16 init];
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    styleProviderName = v11->_styleProviderName;
    v11->_styleProviderName = (NSString *)v13;

    v11->_size = a4;
    v11->_selected = a5;
    v11->_bold = a6;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UISegmentedControlFontCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UISegmentedControlFontCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  v4 = a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  v6 = (void *)v4[1];
  v7 = self->_styleProviderName;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      BOOL v11 = 0;
      goto LABEL_13;
    }
    int v10 = [(NSString *)v7 isEqual:v8];

    if (!v10) {
      goto LABEL_12;
    }
  }
  if (self->_size != v5[4] || self->_selected != *((unsigned __int8 *)v5 + 20)) {
    goto LABEL_12;
  }
  BOOL v11 = self->_bold == *((unsigned __int8 *)v5 + 21);
LABEL_13:

  return v11;
}

@end