@interface SKUIStorePagePinnedBackdropLayoutAttributes
- (BOOL)hidesBackdropView;
- (BOOL)isEqual:(id)a3;
- (NSString)backdropGroupName;
- (UIColor)backdropColor;
- (double)transitionProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)backdropStyle;
- (unint64_t)hash;
- (void)hash;
- (void)setBackdropColor:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setHidesBackdropView:(BOOL)a3;
- (void)setTransitionProgress:(double)a3;
@end

@implementation SKUIStorePagePinnedBackdropLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePagePinnedBackdropLayoutAttributes copyWithZone:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
  id v13 = [(UICollectionViewLayoutAttributes *)&v15 copyWithZone:a3];
  [v13 setBackdropColor:self->_backdropColor];
  [v13 setBackdropGroupName:self->_backdropGroupName];
  [v13 setBackdropStyle:self->_backdropStyle];
  [v13 setHidesBackdropView:self->_hidesBackdropView];
  [v13 setTransitionProgress:self->_transitionProgress];
  return v13;
}

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIStorePagePinnedBackdropLayoutAttributes *)v3 hash];
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
  unint64_t v11 = [(UICollectionViewLayoutAttributes *)&v16 hash];
  uint64_t v12 = [(UIColor *)self->_backdropColor hash] ^ v11;
  NSUInteger v13 = [(NSString *)self->_backdropGroupName hash];
  uint64_t v14 = 10000;
  if (!self->_hidesBackdropView) {
    uint64_t v14 = 0;
  }
  return v12 ^ v13 ^ self->_backdropStyle ^ v14 ^ llround(self->_transitionProgress * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SKUIStorePagePinnedBackdropLayoutAttributes *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStorePagePinnedBackdropLayoutAttributes isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v13 = v4;
      v18.receiver = self;
      v18.super_class = (Class)SKUIStorePagePinnedBackdropLayoutAttributes;
      BOOL v16 = [(UICollectionViewLayoutAttributes *)&v18 isEqual:v13]
         && ((backdropColor = self->_backdropColor, backdropColor == v13->_backdropColor)
          || -[UIColor isEqual:](backdropColor, "isEqual:"))
         && ((backdropGroupName = self->_backdropGroupName, backdropGroupName == v13->_backdropGroupName)
          || -[NSString isEqualToString:](backdropGroupName, "isEqualToString:"))
         && self->_backdropStyle == v13->_backdropStyle
         && self->_hidesBackdropView == v13->_hidesBackdropView
         && self->_transitionProgress != v13->_transitionProgress;
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (UIColor)backdropColor
{
  return self->_backdropColor;
}

- (void)setBackdropColor:(id)a3
{
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (void)setBackdropStyle:(int64_t)a3
{
  self->_backdropStyle = a3;
}

- (BOOL)hidesBackdropView
{
  return self->_hidesBackdropView;
}

- (void)setHidesBackdropView:(BOOL)a3
{
  self->_hidesBackdropView = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);

  objc_storeStrong((id *)&self->_backdropColor, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end