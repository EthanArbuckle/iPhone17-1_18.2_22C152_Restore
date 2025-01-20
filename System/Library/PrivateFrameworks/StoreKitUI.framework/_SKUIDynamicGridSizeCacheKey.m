@interface _SKUIDynamicGridSizeCacheKey
- (BOOL)__isSKUIDynamicGridSizeCacheKey;
- (BOOL)isEqual:(id)a3;
- (SKUIViewElement)viewElement;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)position;
- (unint64_t)hash;
- (void)setPosition:(int64_t)a3;
- (void)setViewElement:(id)a3;
@end

@implementation _SKUIDynamicGridSizeCacheKey

- (BOOL)__isSKUIDynamicGridSizeCacheKey
{
  return 1;
}

- (unint64_t)hash
{
  int64_t position = self->_position;
  return [(SKUIViewElement *)self->_viewElement elementType] + 155 * position;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_8;
  }
  int v5 = objc_msgSend(a3, "__isSKUIDynamicGridSizeCacheKey");
  if (!v5) {
    return v5;
  }
  if (*((void *)a3 + 1) != self->_position)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  v6 = (SKUIViewElement *)*((void *)a3 + 2);
  if (v6 == self->_viewElement)
  {
LABEL_8:
    LOBYTE(v5) = 1;
    return v5;
  }

  LOBYTE(v5) = -[SKUIViewElement isEqual:](v6, "isEqual:");
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setViewElement:self->_viewElement];
  [v4 setPosition:self->_position];
  return v4;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_int64_t position = a3;
}

- (SKUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end