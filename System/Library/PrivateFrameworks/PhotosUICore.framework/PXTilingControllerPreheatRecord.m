@interface PXTilingControllerPreheatRecord
- (NSIndexSet)preheatedTileIndexes;
- (PXTilingControllerPreheatHandler)preheatHandler;
- (PXTilingControllerPreheatRecord)initWithPreheatHandler:(id)a3 context:(void *)a4;
- (UIEdgeInsets)padding;
- (unint64_t)tileGroup;
- (void)context;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreheatedTileIndexes:(id)a3;
- (void)setTileGroup:(unint64_t)a3;
@end

@implementation PXTilingControllerPreheatRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preheatedTileIndexes, 0);
  objc_destroyWeak((id *)&self->_preheatHandler);
}

- (void)setPreheatedTileIndexes:(id)a3
{
}

- (NSIndexSet)preheatedTileIndexes
{
  return self->_preheatedTileIndexes;
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

- (void)setTileGroup:(unint64_t)a3
{
  self->_tileGroup = a3;
}

- (unint64_t)tileGroup
{
  return self->_tileGroup;
}

- (void)context
{
  return self->_context;
}

- (PXTilingControllerPreheatHandler)preheatHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preheatHandler);
  return (PXTilingControllerPreheatHandler *)WeakRetained;
}

- (PXTilingControllerPreheatRecord)initWithPreheatHandler:(id)a3 context:(void *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXTilingControllerPreheatRecord;
  v7 = [(PXTilingControllerPreheatRecord *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_preheatHandler, v6);
    v8->_context = a4;
    uint64_t v9 = [MEMORY[0x1E4F28D60] indexSet];
    preheatedTileIndexes = v8->_preheatedTileIndexes;
    v8->_preheatedTileIndexes = (NSIndexSet *)v9;
  }
  return v8;
}

@end