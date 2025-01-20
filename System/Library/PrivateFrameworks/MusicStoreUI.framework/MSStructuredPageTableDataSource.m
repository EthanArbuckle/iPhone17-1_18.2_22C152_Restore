@interface MSStructuredPageTableDataSource
- (BOOL)canDoubleTapIndexPath:(id)a3;
- (BOOL)canShowPreviewForItem:(id)a3;
- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
@end

@implementation MSStructuredPageTableDataSource

- (BOOL)canShowPreviewForItem:(id)a3
{
  uint64_t v4 = [a3 itemType];
  BOOL v5 = (unint64_t)(v4 - 1005) > 6 || ((1 << (v4 + 19)) & 0x4D) == 0;
  if (v5 || [a3 itemDisplayType] == 2) {
    return 0;
  }
  v7 = (void *)[a3 itemMediaKind];
  return [v7 isEqualToString:*MEMORY[0x263F7B958]] ^ 1;
}

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F89718]), "itemList"), "itemAtIndexPath:", a3);
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "defaultStoreOffer"), "offerMedia"), "URL");
  if (v5)
  {
    LOBYTE(v5) = [(MSStructuredPageTableDataSource *)self canShowPreviewForItem:v4];
  }
  return v5;
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSStructuredPageTableDataSource;
  v8 = 0;
  uint64_t v5 = [(SUStructuredPageGroupedTableDataSource *)&v7 cellClassForItem:a3 reuseIdentifier:&v8];
  if (v5 == (objc_class *)objc_opt_class())
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    if (!a4) {
      return v5;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    *a4 = v8;
  return v5;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MSStructuredPageTableDataSource;
  -[SUStructuredPageGroupedTableDataSource configureCell:forIndexPath:](&v9, sel_configureCell_forIndexPath_);
  objc_super v7 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F89718]), "itemList"), "itemAtIndexPath:", a4);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "defaultStoreOffer"), "offerMedia"), "URL"))
  {
    BOOL v8 = [(MSStructuredPageTableDataSource *)self canShowPreviewForItem:v7];
    [a3 setHighlightsOnlyContentView:v8];
    if (v8 && [a3 accessoryType] == 1) {
      [a3 setAccessoryType:0];
    }
  }
  else
  {
    [a3 setHighlightsOnlyContentView:0];
  }
}

@end