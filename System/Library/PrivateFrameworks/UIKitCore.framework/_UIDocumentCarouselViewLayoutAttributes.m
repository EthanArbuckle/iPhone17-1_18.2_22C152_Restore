@interface _UIDocumentCarouselViewLayoutAttributes
- (_UIDocumentCarouselViewLayoutAttributes)init;
- (id)description;
@end

@implementation _UIDocumentCarouselViewLayoutAttributes

- (_UIDocumentCarouselViewLayoutAttributes)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentCarouselViewLayoutAttributes;
  result = [(_UIDocumentCarouselViewLayoutAttributes *)&v5 init];
  if (result)
  {
    result->_alpha = 1.0;
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGPoint(self->_center);
  v7 = NSStringFromCGSize(self->_size);
  double zIndex = self->_zIndex;
  double alpha = self->_alpha;
  long long v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v10;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  v11 = NSStringFromCGAffineTransform(&transform);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p center = %@; size = %@; double zIndex = %g; alpha = %g; transform = %@",
    v5,
    self,
    v6,
    v7,
    *(void *)&zIndex,
    *(void *)&alpha,
  v12 = v11);

  return v12;
}

@end