@interface SBHFolderIconVisualConfiguration
- (BOOL)isEqual:(id)a3;
- (CGSize)gridCellSize;
- (CGSize)gridCellSpacing;
- (NSString)description;
- (SBHFolderIconVisualConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setGridCellSize:(CGSize)a3;
- (void)setGridCellSpacing:(CGSize)a3;
@end

@implementation SBHFolderIconVisualConfiguration

- (CGSize)gridCellSpacing
{
  double width = self->_gridCellSpacing.width;
  double height = self->_gridCellSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)gridCellSize
{
  double width = self->_gridCellSize.width;
  double height = self->_gridCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SBHFolderIconVisualConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBHFolderIconVisualConfiguration;
  CGSize result = [(SBHFolderIconVisualConfiguration *)&v9 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #8.0 }
    result->_gridCellSize = _Q0;
    __asm { FMOV            V0.2D, #2.0 }
    result->_gridCellSpacing = _Q0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *(CGSize *)((char *)result + 8) = self->_gridCellSize;
    *(CGSize *)((char *)result + 24) = self->_gridCellSpacing;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHFolderIconVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v8 = (isKindOfClass & 1) != 0
      && (self->_gridCellSize.width == v4->_gridCellSize.width
        ? (BOOL v7 = self->_gridCellSize.height == v4->_gridCellSize.height)
        : (BOOL v7 = 0),
          v7)
      && self->_gridCellSpacing.height == v4->_gridCellSpacing.height
      && self->_gridCellSpacing.width == v4->_gridCellSpacing.width;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_gridCellSize.width
                          + self->_gridCellSize.height
                          + self->_gridCellSpacing.width
                          + self->_gridCellSpacing.height);
}

- (NSString)description
{
  return (NSString *)[(SBHFolderIconVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHFolderIconVisualConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHFolderIconVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHFolderIconVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHFolderIconVisualConfiguration *)self gridCellSize];
  id v5 = (id)objc_msgSend(v4, "appendSize:withName:", @"gridCellSize");
  [(SBHFolderIconVisualConfiguration *)self gridCellSpacing];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"gridCellSpacing");
  return v4;
}

- (void)setGridCellSize:(CGSize)a3
{
  self->_gridCellSize = a3;
}

- (void)setGridCellSpacing:(CGSize)a3
{
  self->_gridCellSpacing = a3;
}

@end