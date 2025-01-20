@interface _PXVisualDiagnosticsTableCell
- (_PXVisualDiagnosticsTableCell)initWithRenderingBlock:(id)a3;
- (id)renderingBlock;
@end

@implementation _PXVisualDiagnosticsTableCell

- (void).cxx_destruct
{
}

- (id)renderingBlock
{
  return self->_renderingBlock;
}

- (_PXVisualDiagnosticsTableCell)initWithRenderingBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXVisualDiagnosticsTableCell;
  v5 = [(_PXVisualDiagnosticsTableCell *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id renderingBlock = v5->_renderingBlock;
    v5->_id renderingBlock = (id)v6;
  }
  return v5;
}

@end