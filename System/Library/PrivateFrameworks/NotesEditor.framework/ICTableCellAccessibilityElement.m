@interface ICTableCellAccessibilityElement
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)addColumnAfter;
- (BOOL)addRowBelow;
- (BOOL)deleteColumn;
- (BOOL)deleteRow;
- (BOOL)isAccessibilityElement;
- (BOOL)isEditing;
- (BOOL)selectCellRange;
- (BOOL)selectCurrentColumn;
- (BOOL)selectCurrentRow;
- (BOOL)selectTable;
- (CGRect)boundingRect;
- (CGRect)frameInScreenSpace;
- (ICTableAccessibilityController)tableAXController;
- (ICTableCellAccessibilityElement)initWithTableAccessibilityController:(id)a3 columnID:(id)a4 rowID:(id)a5;
- (NSArray)supportedRotorTypes;
- (NSAttributedString)attributedContentString;
- (NSString)description;
- (NSUUID)columnID;
- (NSUUID)rowID;
- (_NSRange)accessibilityColumnRange;
- (_NSRange)accessibilityRowRange;
- (_NSRange)textRangeInNote;
- (id)_accessibilityTextInputElement;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityContainer;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityElementForRow:(int64_t)a3 andColumn:(int64_t)a4;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)noteEditorController;
- (unint64_t)accessibilityTraits;
- (unint64_t)columnIndex;
- (unint64_t)rowIndex;
- (void)accessibilityElementDidBecomeFocused;
- (void)moveFocusToFirstSelectedCell;
- (void)reverseTableDirection;
- (void)setTableAXController:(id)a3;
@end

@implementation ICTableCellAccessibilityElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  v2 = [(ICTableCellAccessibilityElement *)self tableAXController];
  v3 = [v2 tableElement];

  return v3;
}

- (id)accessibilityLabel
{
  v3 = [(ICTableCellAccessibilityElement *)self accessibilityValue];
  uint64_t v4 = [v3 length];
  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = v5;
  if (v4) {
    v7 = @"cell";
  }
  else {
    v7 = @"empty cell";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26C10E100 table:0];

  v9 = [MEMORY[0x263F086E0] mainBundle];
  v10 = [v9 localizedStringForKey:@"column %lu, row %lu", &stru_26C10E100, 0 value table];

  v13 = objc_msgSend(NSString, "localizedStringWithFormat:", v10, -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex") + 1, -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex") + 1);
  v11 = __ICAccessibilityStringForVariables();

  return v11;
}

- (id)accessibilityValue
{
  id v3 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self attributedContentString];
  v5 = (void *)[v3 initWithAttributedString:v4];

  uint64_t v6 = *MEMORY[0x263F814A0];
  uint64_t v7 = [v5 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__ICTableCellAccessibilityElement_iOS__accessibilityValue__block_invoke;
  v11[3] = &unk_2640B89D0;
  id v12 = v5;
  id v8 = v5;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v11);
  v9 = (void *)[v8 copy];

  return v9;
}

void __58__ICTableCellAccessibilityElement_iOS__accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [MEMORY[0x263F5ACA0] sharedContext];
  v9 = [v8 managedObjectContext];
  v10 = [v13 inlineAttachmentInContext:v9];

  if (v10)
  {
    v11 = [v10 altText];
    id v12 = [v11 icaxLowPitchAttributedString];

    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a3, a4, v12);
  }
}

- (id)accessibilityHint
{
  if ([(ICTableCellAccessibilityElement *)self isEditing]
    || ([(ICTableCellAccessibilityElement *)self tableAXController],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEditable],
        v3,
        !v4))
  {
    uint64_t v6 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"Double tap to edit cell." value:&stru_26C10E100 table:0];
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  int v4 = [v3 localizedStringForKey:@"column %lu, row %lu", &stru_26C10E100, 0 value table];

  v5 = objc_msgSend(NSString, "localizedStringWithFormat:", v4, -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex") + 1, -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex") + 1);
  uint64_t v6 = [(ICTableCellAccessibilityElement *)self attributedContentString];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v12[0] = v5;
    id v8 = [(ICTableCellAccessibilityElement *)self attributedContentString];
    v9 = [v8 string];
    v12[1] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  }
  else
  {
    v13[0] = v5;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  return v10;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)ICTableCellAccessibilityElement;
  unint64_t v3 = [(ICTableCellAccessibilityElement *)&v8 accessibilityTraits];
  int v4 = [(ICTableCellAccessibilityElement *)self tableAXController];
  v5 = [v4 selectedCells];
  int v6 = [v5 containsObject:self];

  if (v6)
  {
    v3 |= *MEMORY[0x263F832A8];
    if ([(ICTableCellAccessibilityElement *)self isEditing]) {
      v3 |= *MEMORY[0x263F81398];
    }
  }
  return v3;
}

- (_NSRange)accessibilityRowRange
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [(ICTableCellAccessibilityElement *)self rowID];
  uint64_t v5 = [v3 rowIndexForRowID:v4];

  NSUInteger v6 = v5;
  NSUInteger v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)accessibilityColumnRange
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [(ICTableCellAccessibilityElement *)self columnID];
  uint64_t v5 = [v3 columnIndexForColumnID:v4];

  NSUInteger v6 = v5;
  NSUInteger v7 = 1;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)accessibilityElementForRow:(int64_t)a3 andColumn:(int64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  v9 = [(ICTableCellAccessibilityElement *)self tableAXController];
  if ([v9 rowCount] <= (unint64_t)a3)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  v10 = [(ICTableCellAccessibilityElement *)self tableAXController];
  unint64_t v11 = [v10 columnCount];

  if (v11 <= a4)
  {
LABEL_6:
    uint64_t v5 = 0;
    goto LABEL_12;
  }
  v9 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v5 = [v9 cellElementForColumnIndex:a4 rowIndex:a3];
LABEL_11:

LABEL_12:

  return v5;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [v3 isEditable];

  if (v4)
  {
    uint64_t v5 = [(ICTableCellAccessibilityElement *)self tableAXController];
    NSUInteger v6 = [(ICTableCellAccessibilityElement *)self columnID];
    NSUInteger v7 = [(ICTableCellAccessibilityElement *)self rowID];
    [v5 beginEditingCellWithColumnID:v6 rowID:v7];

    objc_super v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 localizedStringForKey:@"Editing %@" value:&stru_26C10E100 table:0];

    v10 = NSString;
    unint64_t v11 = [(ICTableCellAccessibilityElement *)self accessibilityLabel];
    id v12 = objc_msgSend(v10, "localizedStringWithFormat:", v9, v11);

    UIAccessibilityPostNotification(*MEMORY[0x263F83188], v12);
  }
  return v4;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [v3 isEditable];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    NSUInteger v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"ADD_COLUMN_MENU_ACTION" value:@"Add Column" table:@"Localizable"];

    v48 = (void *)v7;
    v47 = (void *)[objc_alloc(MEMORY[0x263F823A0]) initWithName:v7 target:self selector:sel_addColumnAfter];
    objc_msgSend(v5, "addObject:");
    id v8 = objc_alloc(MEMORY[0x263F823A0]);
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedStringForKey:@"Add Row" value:&stru_26C10E100 table:0];
    uint64_t v11 = [v8 initWithName:v10 target:self selector:sel_addRowBelow];

    v46 = (void *)v11;
    [v5 addObject:v11];
    id v12 = [(ICTableCellAccessibilityElement *)self tableAXController];
    unint64_t v13 = [v12 columnCount];

    if (v13 >= 2)
    {
      v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 localizedStringForKey:@"Delete %lu Column" value:&stru_26C10E100 table:0];

      v16 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, 1);
      v17 = (void *)[objc_alloc(MEMORY[0x263F823A0]) initWithName:v16 target:self selector:sel_deleteColumn];
      [v5 addObject:v17];
    }
    v18 = [(ICTableCellAccessibilityElement *)self tableAXController];
    unint64_t v19 = [v18 rowCount];

    if (v19 >= 2)
    {
      v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:@"Delete %lu Row" value:&stru_26C10E100 table:0];

      v22 = objc_msgSend(NSString, "localizedStringWithFormat:", v21, 1);
      v23 = (void *)[objc_alloc(MEMORY[0x263F823A0]) initWithName:v22 target:self selector:sel_deleteRow];
      [v5 addObject:v23];
    }
    id v24 = objc_alloc(MEMORY[0x263F823A0]);
    v25 = [MEMORY[0x263F086E0] mainBundle];
    v26 = [v25 localizedStringForKey:@"Select Column" value:&stru_26C10E100 table:0];
    v27 = (void *)[v24 initWithName:v26 target:self selector:sel_selectCurrentColumn];

    [v5 addObject:v27];
    id v28 = objc_alloc(MEMORY[0x263F823A0]);
    v29 = [MEMORY[0x263F086E0] mainBundle];
    v30 = [v29 localizedStringForKey:@"Select Row" value:&stru_26C10E100 table:0];
    v31 = (void *)[v28 initWithName:v30 target:self selector:sel_selectCurrentRow];

    [v5 addObject:v31];
    id v32 = objc_alloc(MEMORY[0x263F823A0]);
    v33 = [MEMORY[0x263F086E0] mainBundle];
    v34 = [v33 localizedStringForKey:@"Select cell range" value:&stru_26C10E100 table:0];
    v35 = (void *)[v32 initWithName:v34 target:self selector:sel_selectCellRange];

    [v5 addObject:v35];
    id v36 = objc_alloc(MEMORY[0x263F823A0]);
    v37 = [MEMORY[0x263F086E0] mainBundle];
    v38 = [v37 localizedStringForKey:@"Select table" value:&stru_26C10E100 table:0];
    v39 = (void *)[v36 initWithName:v38 target:self selector:sel_selectTable];

    [v5 addObject:v39];
    if ([MEMORY[0x263F5B3A8] supportsRTL])
    {
      id v40 = objc_alloc(MEMORY[0x263F823A0]);
      v41 = [MEMORY[0x263F086E0] mainBundle];
      v42 = [v41 localizedStringForKey:@"Reverse Table Direction" value:&stru_26C10E100 table:0];
      v43 = (void *)[v40 initWithName:v42 target:self selector:sel_reverseTableDirection];

      [v5 addObject:v43];
    }
    v44 = (void *)[v5 copy];
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v6 = [v5 tableScrollView];

  switch(a3)
  {
    case 1:
      char v7 = [v6 accessibilityScrollRightPage];
      goto LABEL_5;
    case 2:
      char v7 = [v6 accessibilityScrollLeftPage];
LABEL_5:
      BOOL v8 = v7;
      break;
    case 3:
      v9 = [(ICTableCellAccessibilityElement *)self tableAXController];
      v10 = [v9 noteScrollView];
      char v11 = [v10 accessibilityScrollUpPage];
      goto LABEL_8;
    case 4:
      v9 = [(ICTableCellAccessibilityElement *)self tableAXController];
      v10 = [v9 noteScrollView];
      char v11 = [v10 accessibilityScrollDownPage];
LABEL_8:
      BOOL v8 = v11;

      break;
    default:
      BOOL v8 = 0;
      break;
  }

  return v8;
}

- (void)accessibilityElementDidBecomeFocused
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableCellAccessibilityElement;
  [(ICTableCellAccessibilityElement *)&v6 accessibilityElementDidBecomeFocused];
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [(ICTableCellAccessibilityElement *)self columnID];
  uint64_t v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 scrollColumnIDToVisible:v4 rowID:v5];
}

- (id)_accessibilityTextInputElement
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [(ICTableCellAccessibilityElement *)self columnID];
  uint64_t v5 = [v3 textViewForColumnID:v4];

  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [(ICTableCellAccessibilityElement *)self columnID];
  uint64_t v5 = [v3 textViewForColumnID:v4];

  return v5;
}

- (id)accessibilityCustomRotors
{
  v2 = [(ICTableCellAccessibilityElement *)self noteEditorController];
  unint64_t v3 = +[ICAccessibilityCustomRotorController sharedInstance];
  [v3 setNoteEditorViewController:v2];

  int v4 = +[ICAccessibilityCustomRotorController sharedInstance];
  uint64_t v5 = [v4 sharedTextViewRotors];

  return v5;
}

- (id)accessibilityDragSourceDescriptors
{
  unint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  int v4 = [v3 isTableTextRangeSelected];

  if (v4)
  {
    uint64_t v5 = [(ICTableCellAccessibilityElement *)self tableAXController];
    objc_super v6 = [v5 dragProviderView];
    char v7 = [v6 accessibilityDragSourceDescriptors];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSArray)supportedRotorTypes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"ICAccessibilityRotorTypeTables";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (_NSRange)textRangeInNote
{
  v2 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v3 = [v2 attachmentRangeInNote];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)addColumnAfter
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
  [v3 selectColumnWithID:v4];

  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v5 addColumnAfter];

  [(ICTableCellAccessibilityElement *)self moveFocusToFirstSelectedCell];
  return 1;
}

- (BOOL)addRowBelow
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 selectRowWithID:v4];

  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v5 addRowBelow];

  [(ICTableCellAccessibilityElement *)self moveFocusToFirstSelectedCell];
  return 1;
}

- (BOOL)deleteColumn
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 beginEditingCellWithColumnID:v4 rowID:v5];

  NSUInteger v6 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v7 = [(ICTableCellAccessibilityElement *)self columnID];
  [v6 selectColumnWithID:v7];

  BOOL v8 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v8 deleteSelectedColumns];

  [(ICTableCellAccessibilityElement *)self moveFocusToFirstSelectedCell];
  return 1;
}

- (BOOL)deleteRow
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 beginEditingCellWithColumnID:v4 rowID:v5];

  NSUInteger v6 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v7 = [(ICTableCellAccessibilityElement *)self rowID];
  [v6 selectRowWithID:v7];

  BOOL v8 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v8 deleteSelectedRows];

  [(ICTableCellAccessibilityElement *)self moveFocusToFirstSelectedCell];
  return 1;
}

- (BOOL)selectCurrentColumn
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 beginEditingCellWithColumnID:v4 rowID:v5];

  NSUInteger v6 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v6 selectCurrentColumn];

  return 1;
}

- (BOOL)selectCurrentRow
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
  NSUInteger v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 beginEditingCellWithColumnID:v4 rowID:v5];

  NSUInteger v6 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v6 selectCurrentRow];

  return 1;
}

- (BOOL)selectCellRange
{
  if (![(ICTableCellAccessibilityElement *)self isEditing])
  {
    uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
    NSUInteger v4 = [(ICTableCellAccessibilityElement *)self columnID];
    NSUInteger v5 = [(ICTableCellAccessibilityElement *)self rowID];
    [v3 beginEditingCellWithColumnID:v4 rowID:v5];
  }
  NSUInteger v6 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v6 selectCellRangeForCurrentCell];

  LODWORD(v6) = *MEMORY[0x263F812F8];
  NSUInteger v7 = [(ICTableCellAccessibilityElement *)self tableAXController];
  BOOL v8 = [v7 endSelectionKnob];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v8);

  return 1;
}

- (BOOL)selectTable
{
  v2 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v2 selectTableTextRange:1];

  return 1;
}

- (void)moveFocusToFirstSelectedCell
{
  v2 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v3 = [v2 selectedCells];
  id argument = [v3 firstObject];

  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], argument);
}

- (void)reverseTableDirection
{
  uint64_t v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  [v3 reverseTableDirection];

  NSUInteger v4 = [(ICTableCellAccessibilityElement *)self tableAXController];
  LODWORD(v3) = [v4 isTableRightToLeft];

  UIAccessibilityNotifications v5 = *MEMORY[0x263F83188];
  NSUInteger v6 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = v6;
  if (v3) {
    NSUInteger v7 = @"Right to left";
  }
  else {
    NSUInteger v7 = @"Left to right";
  }
  BOOL v8 = [v6 localizedStringForKey:v7 value:&stru_26C10E100 table:0];
  UIAccessibilityPostNotification(v5, v8);
}

- (id)noteEditorController
{
  v2 = [(ICTableCellAccessibilityElement *)self tableAXController];
  id v3 = [v2 noteScrollView];

  if (v3)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 nextResponder];

      id v3 = (id)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    id v3 = v3;
  }
LABEL_6:

  return v3;
}

- (ICTableCellAccessibilityElement)initWithTableAccessibilityController:(id)a3 columnID:(id)a4 rowID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v8 tableElement];
  v18.receiver = self;
  v18.super_class = (Class)ICTableCellAccessibilityElement;
  id v12 = [(ICTableCellAccessibilityElement *)&v18 initWithAccessibilityContainer:v11];

  if (v12)
  {
    objc_storeWeak((id *)&v12->_tableAXController, v8);
    uint64_t v13 = [v10 copy];
    rowID = v12->_rowID;
    v12->_rowID = (NSUUID *)v13;

    uint64_t v15 = [v9 copy];
    columnID = v12->_columnID;
    v12->_columnID = (NSUUID *)v15;
  }
  return v12;
}

- (unint64_t)rowIndex
{
  id v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self rowID];
  unint64_t v5 = [v3 rowIndexForRowID:v4];

  return v5;
}

- (unint64_t)columnIndex
{
  id v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self columnID];
  unint64_t v5 = [v3 columnIndexForColumnID:v4];

  return v5;
}

- (NSAttributedString)attributedContentString
{
  id v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self columnID];
  unint64_t v5 = [(ICTableCellAccessibilityElement *)self rowID];
  NSUInteger v6 = [v3 attributedContentStringForColumnID:v4 rowID:v5];

  return (NSAttributedString *)v6;
}

- (CGRect)frameInScreenSpace
{
  id v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self columnID];
  unint64_t v5 = [(ICTableCellAccessibilityElement *)self rowID];
  [v3 frameInScreenSpaceForCellWithColumnID:v4 rowID:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)isEditing
{
  id v3 = [(ICTableCellAccessibilityElement *)self tableAXController];
  uint64_t v4 = [(ICTableCellAccessibilityElement *)self columnID];
  unint64_t v5 = [(ICTableCellAccessibilityElement *)self rowID];
  char v6 = [v3 cellIsEditingAtColumnID:v4 rowID:v5];

  return v6;
}

- (NSString)description
{
  [(ICTableCellAccessibilityElement *)self frameInScreenSpace];
  id v3 = NSStringFromCGRect(v13);
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  char v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICTableCellAccessibilityElement rowIndex](self, "rowIndex"));
  double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICTableCellAccessibilityElement columnIndex](self, "columnIndex"));
  double v8 = [(ICTableCellAccessibilityElement *)self attributedContentString];
  double v9 = [v8 string];
  double v10 = [v4 stringWithFormat:@"<%@ %p row=%@ col=%@ axframe=%@ content=\"%@\">", v5, self, v6, v7, v3, v9];

  return (NSString *)v10;
}

- (ICTableAccessibilityController)tableAXController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAXController);

  return (ICTableAccessibilityController *)WeakRetained;
}

- (void)setTableAXController:(id)a3
{
}

- (NSUUID)rowID
{
  return self->_rowID;
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnID, 0);
  objc_storeStrong((id *)&self->_rowID, 0);

  objc_destroyWeak((id *)&self->_tableAXController);
}

@end