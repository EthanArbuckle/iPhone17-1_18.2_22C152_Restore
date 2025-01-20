@interface _UIFlowLayoutItem
- (id)copy;
@end

@implementation _UIFlowLayoutItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowObject);
  objc_destroyWeak((id *)&self->_section);
}

- (id)copy
{
  id result = objc_alloc_init(_UIFlowLayoutItem);
  CGSize size = self->_itemFrame.size;
  *((_OWORD *)result + 2) = self->_itemFrame.origin;
  *((CGSize *)result + 3) = size;
  int v5 = *((unsigned char *)result + 8) & 0xFE | *(unsigned char *)&self->_itemFlags & 1;
  *((unsigned char *)result + 8) = v5;
  unsigned int v6 = v5 & 0xFFFFFFFD | (2 * ((*(unsigned char *)&self->_itemFlags >> 1) & 1));
  *((unsigned char *)result + 8) = v6;
  *((unsigned char *)result + 8) = v6 & 0xFB | *(unsigned char *)&self->_itemFlags & 4;
  return result;
}

@end