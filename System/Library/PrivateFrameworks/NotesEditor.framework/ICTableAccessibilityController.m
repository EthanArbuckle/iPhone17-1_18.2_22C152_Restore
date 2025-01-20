@interface ICTableAccessibilityController
- (BOOL)cellIsEditingAtColumnID:(id)a3 rowID:(id)a4;
- (BOOL)isEditable;
- (BOOL)isHeaderCellAtColumnID:(id)a3 rowID:(id)a4;
- (BOOL)isTableRightToLeft;
- (BOOL)isTableTextRangeSelected;
- (CGRect)boundingRectForCellWithColumnID:(id)a3 rowID:(id)a4;
- (CGRect)frameInScreenSpaceForCellWithColumnID:(id)a3 rowID:(id)a4;
- (ICTableAccessibilityController)initWithTableAttachmentViewController:(id)a3;
- (ICTableAccessibilityElementProvider)elementProvider;
- (ICTableAttachmentView)hostingTableAttachmentView;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (ICTableSelectionKnob)endSelectionKnob;
- (ICTableSelectionKnob)startSelectionKnob;
- (ICiOSTableAccessibilityElement)tableElement;
- (UIScrollView)noteScrollView;
- (UIScrollView)tableScrollView;
- (UIView)dragProviderView;
- (_NSRange)attachmentRangeInNote;
- (id)attributedContentStringForColumnID:(id)a3 rowID:(id)a4;
- (id)cellElementForColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4;
- (id)cellElementsForColumnID:(id)a3;
- (id)cellElementsForRowID:(id)a3;
- (id)columnIDForColumnIndex:(unint64_t)a3;
- (id)rowIDForRowIndex:(unint64_t)a3;
- (id)selectedCells;
- (id)selectedColumnIDs;
- (id)selectedRowIDs;
- (id)table;
- (id)textViewForColumnID:(id)a3;
- (id)titleForColumnID:(id)a3;
- (id)titleForRowID:(id)a3;
- (unint64_t)columnCount;
- (unint64_t)columnIndexForColumnID:(id)a3;
- (unint64_t)rowCount;
- (unint64_t)rowIndexForRowID:(id)a3;
- (void)addColumnAfter;
- (void)addColumnBefore;
- (void)addRowAbove;
- (void)addRowBelow;
- (void)beginEditingCellWithColumnID:(id)a3 rowID:(id)a4;
- (void)convertTableToText;
- (void)deleteSelectedColumns;
- (void)deleteSelectedRows;
- (void)invalidateAXElementsForColumnID:(id)a3;
- (void)invalidateAXElementsForRowID:(id)a3;
- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4;
- (void)reverseTableDirection;
- (void)scrollColumnIDToVisible:(id)a3 rowID:(id)a4;
- (void)selectCellForColumnID:(id)a3 rowID:(id)a4;
- (void)selectCellRangeForCurrentCell;
- (void)selectColumnWithID:(id)a3;
- (void)selectCurrentColumn;
- (void)selectCurrentRow;
- (void)selectRowWithID:(id)a3;
- (void)selectTableTextRange:(BOOL)a3;
- (void)setTableAttachmentViewController:(id)a3;
- (void)setTableElement:(id)a3;
- (void)speakCellRangeSelection:(id)a3;
- (void)tableRowOrColumnSelectionDidChange;
@end

@implementation ICTableAccessibilityController

- (ICTableAccessibilityController)initWithTableAttachmentViewController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICTableAccessibilityController;
  v5 = [(ICTableAccessibilityController *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableAttachmentViewController, v4);
    v7 = [[ICTableAccessibilityElementProvider alloc] initWithTableAccessibilityController:v6];
    elementProvider = v6->_elementProvider;
    v6->_elementProvider = v7;

    objc_opt_class();
    v9 = [(ICTableAccessibilityController *)v6 tableAttachmentViewController];
    v10 = [v9 view];
    v11 = ICDynamicCast();

    if (v11)
    {
      v12 = [[ICiOSTableAccessibilityElement alloc] initWithTableAccessibilityController:v6 parentAttachmentView:v11];
      tableElement = v6->_tableElement;
      v6->_tableElement = v12;
    }
  }

  return v6;
}

- (void)beginEditingCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v8 beginEditingCellWithColumnID:v7 andRowID:v6 location:2];
}

- (unint64_t)rowCount
{
  v2 = [(ICTableAccessibilityController *)self table];
  unint64_t v3 = [v2 rowCount];

  return v3;
}

- (unint64_t)columnCount
{
  v2 = [(ICTableAccessibilityController *)self table];
  unint64_t v3 = [v2 columnCount];

  return v3;
}

- (UIView)dragProviderView
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  unint64_t v3 = [v2 noteTextView];

  return (UIView *)v3;
}

- (ICTableAttachmentView)hostingTableAttachmentView
{
  objc_opt_class();
  unint64_t v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v4 = [v3 view];
  v5 = ICDynamicCast();

  return (ICTableAttachmentView *)v5;
}

- (UIScrollView)tableScrollView
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  unint64_t v3 = [v2 scrollView];

  return (UIScrollView *)v3;
}

- (UIScrollView)noteScrollView
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  unint64_t v3 = [v2 noteScrollView];

  return (UIScrollView *)v3;
}

- (BOOL)isTableRightToLeft
{
  v2 = [(ICTableAccessibilityController *)self table];
  char v3 = [v2 isRightToLeft];

  return v3;
}

- (_NSRange)attachmentRangeInNote
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 attachment];
  uint64_t v4 = [v3 rangeInNote];
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (ICTableSelectionKnob)startSelectionKnob
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 startKnob];

  return (ICTableSelectionKnob *)v3;
}

- (ICTableSelectionKnob)endSelectionKnob
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 endKnob];

  return (ICTableSelectionKnob *)v3;
}

- (id)cellElementForColumnIndex:(unint64_t)a3 rowIndex:(unint64_t)a4
{
  NSUInteger v6 = [(ICTableAccessibilityController *)self columnIDForColumnIndex:a3];
  NSUInteger v7 = [(ICTableAccessibilityController *)self rowIDForRowIndex:a4];
  NSUInteger v8 = [(ICTableAccessibilityController *)self elementProvider];
  v9 = [v8 cellElementForColumnID:v6 rowID:v7];

  return v9;
}

- (id)cellElementsForColumnID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self elementProvider];
  NSUInteger v6 = [v5 cellElementsForColumnID:v4];

  return v6;
}

- (id)cellElementsForRowID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self elementProvider];
  NSUInteger v6 = [v5 cellElementsForRowID:v4];

  return v6;
}

- (id)textViewForColumnID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  NSUInteger v6 = [v5 textViewManager];
  NSUInteger v7 = [v6 textViewForColumn:v4];

  return v7;
}

- (unint64_t)rowIndexForRowID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self table];
  unint64_t v6 = [v5 rowIndexForIdentifier:v4];

  return v6;
}

- (unint64_t)columnIndexForColumnID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self table];
  unint64_t v6 = [v5 columnIndexForIdentifier:v4];

  return v6;
}

- (id)columnIDForColumnIndex:(unint64_t)a3
{
  id v4 = [(ICTableAccessibilityController *)self table];
  NSUInteger v5 = [v4 identifierForColumnAtIndex:a3];

  return v5;
}

- (id)rowIDForRowIndex:(unint64_t)a3
{
  id v4 = [(ICTableAccessibilityController *)self table];
  NSUInteger v5 = [v4 identifierForRowAtIndex:a3];

  return v5;
}

- (id)attributedContentStringForColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [(ICTableAccessibilityController *)self table];
  v9 = [v8 stringForColumnID:v7 rowID:v6];

  return v9;
}

- (CGRect)boundingRectForCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  v9 = [v8 textViewManager];
  [v9 frameOfCellAtColumn:v7 row:v6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)frameInScreenSpaceForCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([(ICTableAccessibilityController *)self columnIndexForColumnID:v6] != 0x7FFFFFFFFFFFFFFFLL
    && [(ICTableAccessibilityController *)self rowIndexForRowID:v7] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(ICTableAccessibilityController *)self boundingRectForCellWithColumnID:v6 rowID:v7];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
    double v21 = [v20 scrollView];
    objc_msgSend(v21, "convertRect:toView:", 0, v13, v15, v17, v19);
    double v8 = v22;
    double v9 = v23;
    double v10 = v24;
    double v11 = v25;
  }
  double v26 = v8;
  double v27 = v9;
  double v28 = v10;
  double v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)titleForColumnID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self rowIDForRowIndex:0];
  if ([(ICTableAccessibilityController *)self isHeaderCellAtColumnID:v4 rowID:v5])
  {
    id v6 = [(ICTableAccessibilityController *)self attributedContentStringForColumnID:v4 rowID:v5];

    [v6 string];
  }
  else
  {
    unint64_t v7 = [(ICTableAccessibilityController *)self columnIndexForColumnID:v4];

    double v8 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v8 localizedStringForKey:@"column %lu" value:&stru_26C10E100 table:0];

    objc_msgSend(NSString, "localizedStringWithFormat:", v6, v7 + 1);
  double v9 = };

  return v9;
}

- (id)titleForRowID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableAccessibilityController *)self columnIDForColumnIndex:0];
  if ([(ICTableAccessibilityController *)self isHeaderCellAtColumnID:v5 rowID:v4])
  {
    id v6 = [(ICTableAccessibilityController *)self attributedContentStringForColumnID:v5 rowID:v4];

    [v6 string];
  }
  else
  {
    unint64_t v7 = [(ICTableAccessibilityController *)self rowIndexForRowID:v4];

    double v8 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v8 localizedStringForKey:@"row %lu" value:&stru_26C10E100 table:0];

    objc_msgSend(NSString, "localizedStringWithFormat:", v6, v7 + 1);
  double v9 = };

  return v9;
}

- (BOOL)isEditable
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 attachment];
  id v4 = [v3 note];
  char v5 = [v4 isEditable];

  return v5;
}

- (BOOL)cellIsEditingAtColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  double v9 = [v8 tableSelection];

  uint64_t v10 = [v9 type];
  double v11 = [v9 columns];
  double v12 = [v11 firstObject];

  double v13 = [v9 rows];
  double v14 = [v13 firstObject];

  if (v10 == 1 && [v6 isEqual:v12]) {
    char v15 = [v7 isEqual:v14];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)isHeaderCellAtColumnID:(id)a3 rowID:(id)a4
{
  id v4 = [(ICTableAccessibilityController *)self attributedContentStringForColumnID:a3 rowID:a4];
  uint64_t v13 = 0;
  if (objc_msgSend(v4, "length", 0))
  {
    char v5 = [v4 attribute:*MEMORY[0x263F5AB28] atIndex:0 effectiveRange:&v12];
    id v6 = v5;
    if (v5
      && (![v5 style]
       || [v6 style] == 1
       || [v6 style] == 2))
    {
      int v7 = 1;
    }
    else
    {
      double v9 = [v4 attribute:*MEMORY[0x263F5AB18] atIndex:0 effectiveRange:&v12];
      if (v9 && (uint64_t v10 = v13, v10 == [v4 length])) {
        int v7 = [v9 integerValue] & 1;
      }
      else {
        int v7 = 0;
      }
    }
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)scrollColumnIDToVisible:(id)a3 rowID:(id)a4
{
  [(ICTableAccessibilityController *)self frameInScreenSpaceForCellWithColumnID:a3 rowID:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  double v14 = [v13 tableContentView];
  objc_msgSend(v14, "convertRect:fromView:", 0, v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  double v23 = [(ICTableAccessibilityController *)self noteScrollView];
  objc_msgSend(v23, "convertRect:fromView:", 0, v6, v8, v10, v12);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  v33 = [v32 scrollView];
  objc_msgSend(v33, "scrollRectToVisible:animated:", 1, v16, v18, v20, v22);

  id v34 = [(ICTableAccessibilityController *)self noteScrollView];
  objc_msgSend(v34, "scrollRectToVisible:animated:", 1, v25, v27, v29, v31);
}

- (void)moveCurrentColumnOrRow:(BOOL)a3 toIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v6 moveCurrentColumnOrRow:v5 toIndex:a4];
}

- (id)selectedCells
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v4 = [v3 tableSelection];

  if ([v4 type] == 1 || objc_msgSend(v4, "type") == 4)
  {
    BOOL v5 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = [v4 columns];
    uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v16 = *(void *)v24;
      double v17 = v4;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          double v8 = [v4 rows];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = [(ICTableAccessibilityController *)self cellElementForColumnIndex:[(ICTableAccessibilityController *)self columnIndexForColumnID:v7] rowIndex:[(ICTableAccessibilityController *)self rowIndexForRowID:*(void *)(*((void *)&v19 + 1) + 8 * j)]];
                objc_msgSend(v5, "ic_addNonNilObject:", v13);
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v10);
          }

          id v4 = v17;
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v18);
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)selectedColumnIDs
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 tableSelection];
  id v4 = [v3 columns];

  return v4;
}

- (id)selectedRowIDs
{
  v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  char v3 = [v2 tableSelection];
  id v4 = [v3 rows];

  return v4;
}

- (void)selectCurrentColumn
{
  id v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v2 selectCurrentColumnForAccessibility];
}

- (void)selectCurrentRow
{
  id v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v2 selectCurrentRowForAccessibility];
}

- (void)selectColumnWithID:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
    id v6 = [v5 tableSelection];
    v8[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

    [v6 selectColumns:v7];
  }
}

- (void)selectRowWithID:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
    id v6 = [v5 tableSelection];
    v8[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

    [v6 selectRows:v7];
  }
}

- (void)selectCellForColumnID:(id)a3 rowID:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v9 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
    double v8 = [v9 tableSelection];
    [v8 selectCellAtColumn:v7 row:v6];
  }
}

- (void)selectCellRangeForCurrentCell
{
  id v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v2 selectCell];
}

- (BOOL)isTableTextRangeSelected
{
  char v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v4 = [v3 noteTextView];
  uint64_t v5 = [v4 selectedRange];
  uint64_t v7 = v6;
  double v8 = [(ICTableAccessibilityController *)self hostingTableAttachmentView];
  BOOL v11 = v5 == [v8 textRangeInNote] && v7 == v9;

  return v11;
}

- (void)selectTableTextRange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v16 = [v5 noteTextView];

  uint64_t v6 = [(ICTableAccessibilityController *)self hostingTableAttachmentView];
  uint64_t v7 = [v6 textRangeInNote];
  uint64_t v9 = v8;

  _UIAccessibilityBlockPostingOfAllNotifications();
  [v16 select:v16];
  objc_msgSend(v16, "setSelectedRange:", v7, v9);
  objc_msgSend(v16, "scrollRangeToVisible:", v7, v9);
  _UIAccessibilityUnblockPostingOfAllNotifications();
  if (v3)
  {
    uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v11 = [v10 localizedStringForKey:@"Selected %@. Use the actions rotor to start dragging." value:&stru_26C10E100 table:0];

    double v12 = NSString;
    uint64_t v13 = [(ICTableAccessibilityController *)self hostingTableAttachmentView];
    double v14 = [v13 accessibilityLabel];
    double v15 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v14);

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v15);
  }
}

- (void)speakCellRangeSelection:(id)a3
{
  id v30 = a3;
  if ([v30 type] == 4)
  {
    id v4 = [(ICTableAccessibilityController *)self table];
    uint64_t v5 = [v30 columns];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v4 columnIndexForIdentifier:v6];

    uint64_t v8 = [(ICTableAccessibilityController *)self table];
    uint64_t v9 = [v30 rows];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v8 rowIndexForIdentifier:v10];

    double v12 = [(ICTableAccessibilityController *)self table];
    uint64_t v13 = [v30 columns];
    double v14 = [v13 lastObject];
    uint64_t v15 = [v12 columnIndexForIdentifier:v14];

    id v16 = [(ICTableAccessibilityController *)self table];
    double v17 = [v30 rows];
    uint64_t v18 = [v17 lastObject];
    uint64_t v19 = [v16 rowIndexForIdentifier:v18];

    long long v20 = [MEMORY[0x263F086E0] mainBundle];
    long long v21 = v20;
    if (v7 == v15 && v11 == v19)
    {
      long long v22 = [v20 localizedStringForKey:@"Selected column %lu, row %lu", &stru_26C10E100, 0 value table];

      long long v23 = NSString;
      uint64_t v24 = v7 + 1;
      uint64_t v25 = v11 + 1;
    }
    else
    {
      if (v7 == v15)
      {
        long long v22 = [v20 localizedStringForKey:@"Selected column %lu, rows %lu to %lu", &stru_26C10E100, 0 value table];

        objc_msgSend(NSString, "localizedStringWithFormat:", v22, v7 + 1, v11 + 1, v19 + 1, v29);
        double v27 = LABEL_12:;

        UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
        UIAccessibilityPostNotification(*MEMORY[0x263F83188], v27);

        goto LABEL_13;
      }
      uint64_t v26 = v15 + 1;
      if (v11 == v19)
      {
        long long v22 = [v20 localizedStringForKey:@"Selected row %lu, columns %lu to %lu", &stru_26C10E100, 0 value table];

        long long v23 = NSString;
        uint64_t v24 = v11 + 1;
        uint64_t v25 = v7 + 1;
      }
      else
      {
        long long v22 = [v20 localizedStringForKey:@"Selected column %lu, row %lu, to column %lu, row %lu", &stru_26C10E100, 0 value table];

        long long v23 = NSString;
        uint64_t v24 = v7 + 1;
        uint64_t v25 = v11 + 1;
        uint64_t v29 = v19 + 1;
      }
      uint64_t v28 = v26;
    }
    objc_msgSend(v23, "localizedStringWithFormat:", v22, v24, v25, v28, v29);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)tableRowOrColumnSelectionDidChange
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v2 = [v3 noteTextView];
  [v2 icaxClearCachedChildrenForReparenting];
}

- (void)addColumnBefore
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 addColumnBeforeSelection:self];
}

- (void)addColumnAfter
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 addColumnAfterSelection:self];
}

- (void)deleteSelectedColumns
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 deleteSelectedColumns:self];
}

- (void)addRowAbove
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 addRowAboveSelection:self];
}

- (void)addRowBelow
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 addRowBelowSelection:self];
}

- (void)deleteSelectedRows
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 deleteSelectedRows:self];
}

- (void)reverseTableDirection
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 reverseTableColumnDirection:self];
}

- (void)convertTableToText
{
  id v3 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  [v3 convertTableToText:self];
}

- (void)invalidateAXElementsForColumnID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAccessibilityController *)self elementProvider];
  [v5 removeElementsForColumnID:v4];
}

- (void)invalidateAXElementsForRowID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAccessibilityController *)self elementProvider];
  [v5 removeElementsForRowID:v4];
}

- (id)table
{
  id v2 = [(ICTableAccessibilityController *)self tableAttachmentViewController];
  id v3 = [v2 table];

  return v3;
}

- (ICTableAccessibilityElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (ICiOSTableAccessibilityElement)tableElement
{
  return self->_tableElement;
}

- (void)setTableElement:(id)a3
{
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAttachmentViewController);

  return (ICTableAttachmentViewController *)WeakRetained;
}

- (void)setTableAttachmentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableAttachmentViewController);
  objc_storeStrong((id *)&self->_tableElement, 0);

  objc_storeStrong((id *)&self->_elementProvider, 0);
}

@end