@interface PXScrollInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isPagingEnabled;
- (CGPoint)pagingOrigin;
- (CGSize)interpageSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)axis;
- (unint64_t)hash;
- (void)setAxis:(unint64_t)a3;
- (void)setInterpageSpacing:(CGSize)a3;
- (void)setPagingEnabled:(BOOL)a3;
- (void)setPagingOrigin:(CGPoint)a3;
@end

@implementation PXScrollInfo

- (void)setPagingOrigin:(CGPoint)a3
{
  self->_pagingOrigin = a3;
}

- (CGPoint)pagingOrigin
{
  double x = self->_pagingOrigin.x;
  double y = self->_pagingOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (CGSize)interpageSpacing
{
  double width = self->_interpageSpacing.width;
  double height = self->_interpageSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPagingEnabled:(BOOL)a3
{
  self->_pagingEnabled = a3;
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)result + 2) = self->_axis;
  *((unsigned char *)result + 8) = self->_pagingEnabled;
  *(CGSize *)((char *)result + 24) = self->_interpageSpacing;
  *(CGPoint *)((char *)result + 40) = self->_pagingOrigin;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(PXScrollInfo *)self axis];
    if (v6 == [v5 axis]
      && (int v7 = [(PXScrollInfo *)self isPagingEnabled],
          v7 == [v5 isPagingEnabled]))
    {
      [(PXScrollInfo *)self interpageSpacing];
      double v11 = v10;
      double v13 = v12;
      [v5 interpageSpacing];
      BOOL v8 = 0;
      if (v11 == v15 && v13 == v14)
      {
        [(PXScrollInfo *)self pagingOrigin];
        double v17 = v16;
        double v19 = v18;
        [v5 pagingOrigin];
        BOOL v8 = v19 == v21 && v17 == v20;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PXScrollInfo *)self axis];
  BOOL v4 = [(PXScrollInfo *)self isPagingEnabled];
  uint64_t v5 = 4;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 ^ v3;
}

@end