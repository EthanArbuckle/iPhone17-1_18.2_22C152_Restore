@interface _UICollectionLayoutVisibleItem
- (BOOL)isHidden;
- (CATransform3D)transform3D;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (NSIndexPath)indexPath;
- (NSString)description;
- (NSString)name;
- (NSString)representedElementKind;
- (double)alpha;
- (id)initWithLayoutAttributes:(void *)a3 layoutItem:;
- (int64_t)zIndex;
- (unint64_t)representedElementCategory;
- (void)setAlpha:(double)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setHidden:(BOOL)a3;
- (void)setTransform3D:(CATransform3D *)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setZIndex:(int64_t)a3;
@end

@implementation _UICollectionLayoutVisibleItem

- (id)initWithLayoutAttributes:(void *)a3 layoutItem:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UICollectionLayoutVisibleItem;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 2, a2);
    objc_storeStrong(v6 + 3, a3);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutItem, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [NSNumber numberWithBool:self->_dirty];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: isDirty:%@; layoutAttributes:%@; layoutItem:%@>",
    v5,
    self,
    v6,
    self->_layoutAttributes,
  v7 = self->_layoutItem);

  return (NSString *)v7;
}

- (CATransform3D)transform3D
{
  result = (CATransform3D *)self->_layoutAttributes;
  if (result) {
    return (CATransform3D *)[(CATransform3D *)result transform3D];
  }
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (void)setTransform3D:(CATransform3D *)a3
{
  self->_dirty = 1;
  long long v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  long long v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  long long v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  long long v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes setTransform3D:v7];
}

- (CGAffineTransform)transform
{
  result = (CGAffineTransform *)self->_layoutAttributes;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  self->_dirty = 1;
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes setTransform:v4];
}

- (double)alpha
{
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  self->_dirty = 1;
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes setAlpha:a3];
}

- (int64_t)zIndex
{
  return [(UICollectionViewLayoutAttributes *)self->_layoutAttributes zIndex];
}

- (void)setZIndex:(int64_t)a3
{
  self->_dirty = 1;
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes setZIndex:a3];
}

- (NSIndexPath)indexPath
{
  return [(UICollectionViewLayoutAttributes *)self->_layoutAttributes indexPath];
}

- (BOOL)isHidden
{
  return [(UICollectionViewLayoutAttributes *)self->_layoutAttributes isHidden];
}

- (void)setHidden:(BOOL)a3
{
  self->_dirty = 1;
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes setHidden:a3];
}

- (NSString)name
{
  return (NSString *)[(NSCollectionLayoutItem *)self->_layoutItem name];
}

- (unint64_t)representedElementCategory
{
  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes) {
    return 0;
  }
  __int16 layoutFlags = (__int16)layoutAttributes->_layoutFlags;
  unint64_t v4 = 1;
  if ((layoutFlags & 2) != 0) {
    unint64_t v4 = 2;
  }
  if (layoutFlags) {
    return 0;
  }
  else {
    return v4;
  }
}

- (NSString)representedElementKind
{
  return [(UICollectionViewLayoutAttributes *)self->_layoutAttributes representedElementKind];
}

- (CGRect)frame
{
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)center
{
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_dirty = 1;
  -[UICollectionViewLayoutAttributes setCenter:](self->_layoutAttributes, "setCenter:", a3.x, a3.y);
}

- (CGRect)bounds
{
  [(UICollectionViewLayoutAttributes *)self->_layoutAttributes bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end