@interface PXSortOrderState
- (PXSortOrderState)initWithSortOrder:(unint64_t)a3;
- (unint64_t)sortOrder;
- (void)enumeratePossibleSortOrdersUsingBlock:(id)a3;
- (void)setSortOrder:(unint64_t)a3;
@end

@implementation PXSortOrderState

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (PXSortOrderState)initWithSortOrder:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSortOrderState;
  result = [(PXSortOrderState *)&v5 init];
  if (result) {
    result->_sortOrder = a3;
  }
  return result;
}

- (void)enumeratePossibleSortOrdersUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXSortOrderState *)self sortOrder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PXSortOrderState_enumeratePossibleSortOrdersUsingBlock___block_invoke;
  v8[3] = &unk_1E5DC3710;
  id v9 = v4;
  unint64_t v10 = v5;
  id v6 = v4;
  v7 = (void (**)(void *, uint64_t))_Block_copy(v8);
  v7[2](v7, 2);
  v7[2](v7, 1);
}

uint64_t __58__PXSortOrderState_enumeratePossibleSortOrdersUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40) == a2);
}

- (void)setSortOrder:(unint64_t)a3
{
  if (self->_sortOrder != a3)
  {
    self->_sortOrder = a3;
    [(PXSortOrderState *)self signalChange:1];
  }
}

@end