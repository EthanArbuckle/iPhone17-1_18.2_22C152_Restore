@interface _PXVisualDiagnosticsTableRow
- (NSMutableDictionary)cellsByColumnIdentifier;
- (PXVisualDiagnosticsTable)table;
- (_PXVisualDiagnosticsTableRow)initWithTable:(id)a3 availableColumnIdentifiers:(id)a4;
- (double)height;
- (void)addCellForColumnWithIdentifier:(id)a3 format:(id)a4;
- (void)addCellForColumnWithIdentifier:(id)a3 rendering:(id)a4;
- (void)addCellForColumnWithIdentifier:(id)a3 text:(id)a4;
- (void)setHeight:(double)a3;
@end

@implementation _PXVisualDiagnosticsTableRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellsByColumnIdentifier, 0);
  objc_destroyWeak((id *)&self->_table);

  objc_storeStrong((id *)&self->_availableColumnIdentifiers, 0);
}

- (NSMutableDictionary)cellsByColumnIdentifier
{
  return self->_cellsByColumnIdentifier;
}

- (PXVisualDiagnosticsTable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);

  return (PXVisualDiagnosticsTable *)WeakRetained;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)height
{
  return self->_height;
}

- (void)addCellForColumnWithIdentifier:(id)a3 rendering:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  availableColumnIdentifiers = self->_availableColumnIdentifiers;
  if (availableColumnIdentifiers && ![(NSSet *)availableColumnIdentifiers containsObject:v15])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 255, @"Invalid parameter not satisfying: %@", @"[_availableColumnIdentifiers containsObject:columnIdentifier]" object file lineNumber description];
  }
  v9 = [(_PXVisualDiagnosticsTableRow *)self cellsByColumnIdentifier];
  v10 = [v9 objectForKeyedSubscript:v15];

  if (v10)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXVisualDiagnosticsTable.m", 257, @"Invalid parameter not satisfying: %@", @"self.cellsByColumnIdentifier[columnIdentifier] == nil" object file lineNumber description];
  }
  v11 = [[_PXVisualDiagnosticsTableCell alloc] initWithRenderingBlock:v7];
  v12 = [(_PXVisualDiagnosticsTableRow *)self cellsByColumnIdentifier];
  [v12 setObject:v11 forKeyedSubscript:v15];
}

- (void)addCellForColumnWithIdentifier:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_PXVisualDiagnosticsTableRow *)self table];
  [v8 defaultRowFontSize];
  uint64_t v10 = v9;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68___PXVisualDiagnosticsTableRow_addCellForColumnWithIdentifier_text___block_invoke;
  v12[3] = &unk_26545ABF0;
  id v13 = v6;
  uint64_t v14 = v10;
  id v11 = v6;
  [(_PXVisualDiagnosticsTableRow *)self addCellForColumnWithIdentifier:v7 rendering:v12];
}

- (void)addCellForColumnWithIdentifier:(id)a3 format:(id)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v10];

  [(_PXVisualDiagnosticsTableRow *)self addCellForColumnWithIdentifier:v8 text:v9];
}

- (_PXVisualDiagnosticsTableRow)initWithTable:(id)a3 availableColumnIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_PXVisualDiagnosticsTableRow;
  id v8 = [(_PXVisualDiagnosticsTableRow *)&v18 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    v9->_height = 30.0;
    uint64_t v10 = [v7 copy];
    availableColumnIdentifiers = v9->_availableColumnIdentifiers;
    v9->_availableColumnIdentifiers = (NSSet *)v10;

    id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
    unint64_t v13 = [(NSSet *)v9->_availableColumnIdentifiers count];
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v15 = [v12 initWithCapacity:v14];
    cellsByColumnIdentifier = v9->_cellsByColumnIdentifier;
    v9->_cellsByColumnIdentifier = (NSMutableDictionary *)v15;
  }
  return v9;
}

@end