@interface PXVisualDiagnosticsTable
- (NSArray)columnIdentifiers;
- (NSDictionary)columns;
- (NSString)title;
- (PXVisualDiagnosticsTable)init;
- (UIEdgeInsets)margins;
- (double)defaultRowFontSize;
- (double)defaultRowHeight;
- (void)_insertPageBreak;
- (void)_renderRow:(id)a3;
- (void)_renderTitleIfNeeded;
- (void)addColumnWithIdentifier:(id)a3 configuration:(id)a4;
- (void)addRowWithConfiguration:(id)a3;
- (void)configureColumnsWithConfiguration:(id)a3;
- (void)renderInContext:(id)a3 withRowsConfiguration:(id)a4;
- (void)setDefaultRowFontSize:(double)a3;
- (void)setDefaultRowHeight:(double)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXVisualDiagnosticsTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_columnIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerRow, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mutableColumnIdentifiers, 0);

  objc_storeStrong((id *)&self->_mutableColumns, 0);
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (NSArray)columnIdentifiers
{
  return self->_columnIdentifiers;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDefaultRowFontSize:(double)a3
{
  self->_defaultRowFontSize = a3;
}

- (double)defaultRowFontSize
{
  return self->_defaultRowFontSize;
}

- (void)setDefaultRowHeight:(double)a3
{
  self->_defaultRowHeight = a3;
}

- (double)defaultRowHeight
{
  return self->_defaultRowHeight;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)_renderRow:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_context)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 164, @"Invalid parameter not satisfying: %@", @"_context != nil" object file lineNumber description];
  }
  memset(&slice, 0, sizeof(slice));
  [v4 height];
  CGRectDivide(self->_nextRowAvailableFrame, &slice, &self->_nextRowAvailableFrame, v5, CGRectMinYEdge);
  v6 = [(PXVisualDiagnosticsContext *)self->_context CGContext];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(PXVisualDiagnosticsTable *)self columnIdentifiers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        v12 = [(PXVisualDiagnosticsTable *)self columns];
        v13 = [v12 objectForKeyedSubscript:v11];

        if (!v13)
        {
          v19 = [MEMORY[0x263F08690] currentHandler];
          [v19 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 170, @"Invalid parameter not satisfying: %@", @"column != nil" object file lineNumber description];
        }
        memset(&v23, 0, sizeof(v23));
        [v13 width];
        CGRectDivide(slice, &v23, &slice, v14, CGRectMinXEdge);
        v15 = [v4 cellsByColumnIdentifier];
        v16 = [v15 objectForKeyedSubscript:v11];

        if (v16)
        {
          CGContextSaveGState(v6);
          CGContextClipToRect(v6, v23);
          v17 = [v16 renderingBlock];
          ((void (**)(void, PXVisualDiagnosticsContext *, double, double, double, double))v17)[2](v17, self->_context, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);

          CGContextRestoreGState(v6);
        }
        CGContextSetLineWidth(v6, 1.0);
        id v18 = [MEMORY[0x263F825C8] colorWithWhite:0.9 alpha:1.0];
        CGContextSetStrokeColorWithColor(v6, (CGColorRef)[v18 CGColor]);

        CGContextStrokeRect(v6, v23);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)_renderTitleIfNeeded
{
  if (!self->_context)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 145, @"Invalid parameter not satisfying: %@", @"_context != nil" object file lineNumber description];
  }
  if (CGRectIsNull(self->_nextRowAvailableFrame))
  {
    [(PXVisualDiagnosticsContext *)self->_context currentPageBounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(PXVisualDiagnosticsTable *)self margins];
    double v12 = v4 + v11;
    double v14 = v6 + v13;
    double v16 = v8 - (v11 + v15);
    double v18 = v10 - (v13 + v17);
    v19 = [(PXVisualDiagnosticsTable *)self title];
    if ([v19 length])
    {
      memset(&slice, 0, sizeof(slice));
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      CGRectDivide(v26, &slice, &self->_nextRowAvailableFrame, 40.0, CGRectMinYEdge);
      context = self->_context;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __48__PXVisualDiagnosticsTable__renderTitleIfNeeded__block_invoke;
      v23[3] = &unk_26545ABA0;
      v23[4] = self;
      id v24 = v19;
      -[PXVisualDiagnosticsContext drawTextInRect:configuration:](context, "drawTextInRect:configuration:", v23, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
    else
    {
      self->_nextRowAvailableFrame.origin.x = v12;
      self->_nextRowAvailableFrame.origin.y = v14;
      self->_nextRowAvailableFrame.size.width = v16;
      self->_nextRowAvailableFrame.size.height = v18;
    }
    [(PXVisualDiagnosticsTable *)self _renderRow:self->_headerRow];
  }
}

void __48__PXVisualDiagnosticsTable__renderTitleIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    double v3 = [NSString stringWithFormat:@"%@ (continued)", *(void *)(a1 + 40)];
    [v5 setText:v3];
  }
  else
  {
    [v5 setText:*(void *)(a1 + 40)];
  }
  double v4 = [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:*MEMORY[0x263F81800]];
  [v5 setFont:v4];
}

- (void)_insertPageBreak
{
  context = self->_context;
  if (!context)
  {
    double v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 137, @"Invalid parameter not satisfying: %@", @"_context != nil" object file lineNumber description];

    context = self->_context;
  }
  [(PXVisualDiagnosticsContext *)context endPage];
  [(PXVisualDiagnosticsContext *)self->_context beginPage];
  ++self->_pageIndex;
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_nextRowAvailableFrame.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_nextRowAvailableFrame.size = v4;
}

- (void)addRowWithConfiguration:(id)a3
{
  double v10 = (void (**)(id, _PXVisualDiagnosticsTableRow *))a3;
  CGSize v4 = (void *)MEMORY[0x25A2EA3A0]();
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  double v6 = [(PXVisualDiagnosticsTable *)self columnIdentifiers];
  double v7 = (void *)[v5 initWithArray:v6];

  double v8 = [[_PXVisualDiagnosticsTableRow alloc] initWithTable:self availableColumnIdentifiers:v7];
  v10[2](v10, v8);
  if (!CGRectIsNull(self->_nextRowAvailableFrame))
  {
    [(_PXVisualDiagnosticsTableRow *)v8 height];
    if (v9 > CGRectGetHeight(self->_nextRowAvailableFrame)) {
      [(PXVisualDiagnosticsTable *)self _insertPageBreak];
    }
  }
  [(PXVisualDiagnosticsTable *)self _renderTitleIfNeeded];
  [(PXVisualDiagnosticsTable *)self _renderRow:v8];
}

- (void)addColumnWithIdentifier:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  double v8 = (void (**)(id, _PXVisualDiagnosticsTableColumn *))a4;
  mutableColumns = self->_mutableColumns;
  if (!mutableColumns)
  {
    double v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 99, @"Invalid parameter not satisfying: %@", @"_mutableColumns != nil" object file lineNumber description];

    mutableColumns = self->_mutableColumns;
  }
  double v10 = [(NSMutableDictionary *)mutableColumns objectForKeyedSubscript:v7];

  if (v10)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 100, @"Invalid parameter not satisfying: %@", @"_mutableColumns[columnIdentifier] == nil" object file lineNumber description];
  }
  [(NSMutableArray *)self->_mutableColumnIdentifiers addObject:v7];
  double v11 = objc_alloc_init(_PXVisualDiagnosticsTableColumn);
  v8[2](v8, v11);
  [(NSMutableDictionary *)self->_mutableColumns setObject:v11 forKeyedSubscript:v7];
  headerRow = self->_headerRow;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke;
  v16[3] = &unk_26545AB78;
  double v17 = v11;
  double v13 = v11;
  [(_PXVisualDiagnosticsTableRow *)headerRow addCellForColumnWithIdentifier:v7 rendering:v16];
}

void __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  double v12 = (CGContext *)[v11 CGContext];
  id v13 = [MEMORY[0x263F825C8] colorWithWhite:0.95 alpha:1.0];
  CGContextSetFillColorWithColor(v12, (CGColorRef)[v13 CGColor]);

  double v14 = (CGContext *)[v11 CGContext];
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGContextFillRect(v14, v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke_2;
  v15[3] = &unk_26545AB50;
  id v16 = *(id *)(a1 + 32);
  objc_msgSend(v11, "drawTextInRect:configuration:", v15, a3, a4, a5, a6);
}

void __66__PXVisualDiagnosticsTable_addColumnWithIdentifier_configuration___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v5 = a2;
  double v3 = [v2 title];
  [v5 setText:v3];

  CGSize v4 = [MEMORY[0x263F81708] systemFontOfSize:0.0 weight:*MEMORY[0x263F81840]];
  [v5 setFont:v4];

  objc_msgSend(v5, "setRelativePosition:", 0.5, 0.5);
}

- (void)renderInContext:(id)a3 withRowsConfiguration:(id)a4
{
  id v7 = (PXVisualDiagnosticsContext *)a3;
  double v12 = (void (**)(id, PXVisualDiagnosticsTable *))a4;
  if (self->_context)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 82, @"Invalid parameter not satisfying: %@", @"_context == nil" object file lineNumber description];

    context = self->_context;
  }
  else
  {
    context = 0;
  }
  self->_context = v7;
  CGFloat v9 = v7;

  [(PXVisualDiagnosticsContext *)self->_context beginPage];
  v12[2](v12, self);
  [(PXVisualDiagnosticsContext *)self->_context endPage];
  double v10 = self->_context;
  self->_context = 0;
}

- (void)configureColumnsWithConfiguration:(id)a3
{
  id v16 = (void (**)(id, PXVisualDiagnosticsTable *))a3;
  if (self->_mutableColumns)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 70, @"Invalid parameter not satisfying: %@", @"_mutableColumns == nil" object file lineNumber description];
  }
  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  mutableColumns = self->_mutableColumns;
  self->_mutableColumns = v5;

  id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  mutableColumnIdentifiers = self->_mutableColumnIdentifiers;
  self->_mutableColumnIdentifiers = v7;

  CGFloat v9 = [[_PXVisualDiagnosticsTableRow alloc] initWithTable:self availableColumnIdentifiers:0];
  headerRow = self->_headerRow;
  self->_headerRow = v9;

  v16[2](v16, self);
  id v11 = (NSDictionary *)[(NSMutableDictionary *)self->_mutableColumns copy];
  columns = self->_columns;
  self->_columns = v11;

  objc_storeStrong((id *)&self->_columnIdentifiers, self->_mutableColumnIdentifiers);
  id v13 = self->_mutableColumns;
  self->_mutableColumns = 0;

  double v14 = self->_mutableColumnIdentifiers;
  self->_mutableColumnIdentifiers = 0;
}

- (PXVisualDiagnosticsTable)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXVisualDiagnosticsTable;
  UIEdgeInsets result = [(PXVisualDiagnosticsTable *)&v4 init];
  if (result)
  {
    result->_defaultRowHeight = 30.0;
    CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    result->_nextRowAvailableFrame.origin = (CGPoint)*MEMORY[0x263F001A0];
    result->_nextRowAvailableFrame.size = v3;
  }
  return result;
}

@end