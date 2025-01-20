@interface PKApplyActionContentActionItemRow
- (BOOL)shouldHighlightItem;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyActionContentActionItemRow)initWithApplyActionContentActionItem:(id)a3 selectionHandler:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureCell:(id)a3;
- (void)handleCellSelection;
@end

@implementation PKApplyActionContentActionItemRow

- (PKApplyActionContentActionItemRow)initWithApplyActionContentActionItem:(id)a3 selectionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyActionContentActionItemRow;
  v9 = [(PKApplyActionContentActionItemRow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionItem, a3);
    uint64_t v11 = [v8 copy];
    id selectionHandler = v10->_selectionHandler;
    v10->_id selectionHandler = (id)v11;
  }
  return v10;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  actionItem = self->_actionItem;
  if (actionItem)
  {
    id v7 = [(PKApplyActionContentActionItem *)actionItem identifier];
    [v3 appendString:v7];
  }
  id v8 = (void *)[v3 copy];

  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  [(PKApplyActionContentActionItemRow *)self cellClass];
  if (objc_opt_isKindOfClass()) {
    [v4 setActionItem:self->_actionItem];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[PKApplyActionContentActionItemRow allocWithZone:](PKApplyActionContentActionItemRow, "allocWithZone:");
  uint64_t v6 = [(PKApplyActionContentActionItem *)self->_actionItem copyWithZone:a3];
  actionItem = v5->_actionItem;
  v5->_actionItem = (PKApplyActionContentActionItem *)v6;

  uint64_t v8 = [self->_selectionHandler copyWithZone:a3];
  id selectionHandler = v5->_selectionHandler;
  v5->_id selectionHandler = (id)v8;

  return v5;
}

- (void)handleCellSelection
{
  id selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2]();
  }
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end