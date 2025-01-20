@interface _UIImageAssetRenditionCacheKey
+ (id)keyWithSize:(CGSize)a3 unresolvedTintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _UIImageAssetRenditionCacheKey

+ (id)keyWithSize:(CGSize)a3 unresolvedTintColor:(id)a4 traitCollection:(id)a5 bold:(BOOL)a6 drawMode:(unsigned int)a7
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12 = (__CFString *)a5;
  id v13 = a4;
  v14 = objc_alloc_init(_UIImageAssetRenditionCacheKey);
  uint64_t v15 = [v13 resolvedColorWithTraitCollection:v12];

  resolvedTintColor = v14->resolvedTintColor;
  v14->resolvedTintColor = (UIColor *)v15;

  uint64_t v17 = -[UITraitCollection _styleEffectAppearanceName](v12);

  appearanceName = v14->appearanceName;
  v14->appearanceName = (NSString *)v17;

  v14->_size.CGFloat width = width;
  v14->_size.CGFloat height = height;
  v14->_drawMode = a7;
  *(unsigned char *)&v14->_flags = *(unsigned char *)&v14->_flags & 0xFE | a6;
  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)self->_size.height ^ (unint64_t)self->_size.width;
  NSUInteger v4 = [(NSString *)self->appearanceName hash];
  return v3 ^ v4 ^ [(UIColor *)self->resolvedTintColor hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  resolvedTintColor = self->resolvedTintColor;
  v6 = (UIColor *)v4[1];
  v7 = resolvedTintColor;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_15;
    }
    BOOL v10 = [(UIColor *)v6 isEqual:v7];

    if (!v10) {
      goto LABEL_16;
    }
  }
  appearanceName = self->appearanceName;
  v6 = (UIColor *)v4[2];
  v12 = appearanceName;
  if (v6 != (UIColor *)v12)
  {
    v8 = (UIColor *)v12;
    if (v6 && v12)
    {
      BOOL v13 = [(UIColor *)v6 isEqual:v12];

      if (v13) {
        goto LABEL_19;
      }
LABEL_16:
      BOOL v14 = 0;
      goto LABEL_17;
    }
LABEL_15:

    goto LABEL_16;
  }

LABEL_19:
  BOOL v14 = 0;
  if (*((double *)v4 + 3) == self->_size.width && *((double *)v4 + 4) == self->_size.height)
  {
    if (*((_DWORD *)v4 + 10) == self->_drawMode)
    {
      BOOL v14 = ((*(unsigned char *)&self->_flags ^ *((unsigned __int8 *)v4 + 44)) & 1) == 0;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->appearanceName, 0);
  objc_storeStrong((id *)&self->resolvedTintColor, 0);
}

@end