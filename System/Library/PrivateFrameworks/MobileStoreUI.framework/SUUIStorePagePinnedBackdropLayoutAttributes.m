@interface SUUIStorePagePinnedBackdropLayoutAttributes
- (BOOL)hidesBackdropView;
- (BOOL)isEqual:(id)a3;
- (NSString)backdropGroupName;
- (UIColor)backdropColor;
- (double)transitionProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)backdropStyle;
- (unint64_t)hash;
- (void)setBackdropColor:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setHidesBackdropView:(BOOL)a3;
- (void)setTransitionProgress:(double)a3;
@end

@implementation SUUIStorePagePinnedBackdropLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [v4 setBackdropColor:self->_backdropColor];
  [v4 setBackdropGroupName:self->_backdropGroupName];
  [v4 setBackdropStyle:self->_backdropStyle];
  [v4 setHidesBackdropView:self->_hidesBackdropView];
  [v4 setTransitionProgress:self->_transitionProgress];
  return v4;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
  unint64_t v3 = [(UICollectionViewLayoutAttributes *)&v8 hash];
  uint64_t v4 = [(UIColor *)self->_backdropColor hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_backdropGroupName hash];
  uint64_t v6 = 10000;
  if (!self->_hidesBackdropView) {
    uint64_t v6 = 0;
  }
  return v4 ^ v5 ^ self->_backdropStyle ^ v6 ^ llround(self->_transitionProgress * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SUUIStorePagePinnedBackdropLayoutAttributes *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)SUUIStorePagePinnedBackdropLayoutAttributes;
      BOOL v8 = [(UICollectionViewLayoutAttributes *)&v10 isEqual:v5]
        && ((backdropColor = self->_backdropColor, backdropColor == v5->_backdropColor)
         || -[UIColor isEqual:](backdropColor, "isEqual:"))
        && ((backdropGroupName = self->_backdropGroupName, backdropGroupName == v5->_backdropGroupName)
         || -[NSString isEqualToString:](backdropGroupName, "isEqualToString:"))
        && self->_backdropStyle == v5->_backdropStyle
        && self->_hidesBackdropView == v5->_hidesBackdropView
        && self->_transitionProgress != v5->_transitionProgress;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
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

@end