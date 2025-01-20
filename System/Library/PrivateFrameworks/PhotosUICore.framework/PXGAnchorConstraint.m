@interface PXGAnchorConstraint
- (BOOL)visiblePortionOnly;
- (PXGSpriteReference)spriteReference;
- (UIEdgeInsets)padding;
- (double)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inequality;
- (int64_t)spriteAttribute;
- (unint64_t)referencingOptions;
- (unsigned)spriteEdge;
- (unsigned)visibleRectEdge;
- (void)setInequality:(int64_t)a3;
- (void)setOffset:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setReferencingOptions:(unint64_t)a3;
- (void)setSpriteAttribute:(int64_t)a3;
- (void)setSpriteEdge:(unsigned int)a3;
- (void)setSpriteReference:(id)a3;
- (void)setVisiblePortionOnly:(BOOL)a3;
- (void)setVisibleRectEdge:(unsigned int)a3;
@end

@implementation PXGAnchorConstraint

- (void).cxx_destruct
{
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setVisibleRectEdge:(unsigned int)a3
{
  self->_visibleRectEdge = a3;
}

- (unsigned)visibleRectEdge
{
  return self->_visibleRectEdge;
}

- (void)setSpriteEdge:(unsigned int)a3
{
  self->_spriteEdge = a3;
}

- (unsigned)spriteEdge
{
  return self->_spriteEdge;
}

- (void)setInequality:(int64_t)a3
{
  self->_inequality = a3;
}

- (int64_t)inequality
{
  return self->_inequality;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisiblePortionOnly:(BOOL)a3
{
  self->_visiblePortionOnly = a3;
}

- (BOOL)visiblePortionOnly
{
  return self->_visiblePortionOnly;
}

- (void)setSpriteAttribute:(int64_t)a3
{
  self->_spriteAttribute = a3;
}

- (int64_t)spriteAttribute
{
  return self->_spriteAttribute;
}

- (void)setReferencingOptions:(unint64_t)a3
{
  self->_referencingOptions = a3;
}

- (unint64_t)referencingOptions
{
  return self->_referencingOptions;
}

- (void)setSpriteReference:(id)a3
{
}

- (PXGSpriteReference)spriteReference
{
  return self->_spriteReference;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(PXGAnchorConstraint *)self inequality];
  v7 = [(PXGAnchorConstraint *)self spriteReference];
  v8 = [v3 stringWithFormat:@"<%@: %p inequality = %li, spriteReference = %@>", v5, self, v6, v7];;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 3, self->_spriteReference);
  v4[4] = self->_referencingOptions;
  v4[5] = self->_spriteAttribute;
  *((unsigned char *)v4 + 8) = self->_visiblePortionOnly;
  long long v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v4 + 4) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v4 + 5) = v5;
  v4[6] = self->_inequality;
  *((_DWORD *)v4 + 3) = self->_spriteEdge;
  *((_DWORD *)v4 + 4) = self->_visibleRectEdge;
  v4[7] = *(id *)&self->_offset;
  return v4;
}

@end