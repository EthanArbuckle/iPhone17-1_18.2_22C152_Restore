@interface ICiOSTableAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (ICTableAccessibilityController)tableAXController;
- (ICiOSTableAccessibilityElement)initWithTableAccessibilityController:(id)a3 parentAttachmentView:(id)a4;
- (ICiOSTableAttachmentView)parentAttachmentView;
- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4;
- (id)accessibilityElements;
- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3;
- (id)accessibilityHeaderElementsForRow:(unint64_t)a3;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityColumnCount;
- (unint64_t)accessibilityRowCount;
- (void)setParentAttachmentView:(id)a3;
- (void)setTableAXController:(id)a3;
@end

@implementation ICiOSTableAccessibilityElement

- (int64_t)accessibilityContainerType
{
  return 1;
}

- (ICiOSTableAccessibilityElement)initWithTableAccessibilityController:(id)a3 parentAttachmentView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICiOSTableAccessibilityElement;
  v8 = [(ICiOSTableAccessibilityElement *)&v11 initWithAccessibilityContainer:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tableAXController, v6);
    objc_storeWeak((id *)&v9->_parentAttachmentView, v7);
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  v2 = [(ICiOSTableAccessibilityElement *)self parentAttachmentView];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityElements
{
  double v3 = [MEMORY[0x263EFF980] array];
  double v4 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  double v5 = [v4 selectedColumnIDs];

  double v6 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  double v7 = [v6 selectedRowIDs];

  if ([v7 count]) {
    BOOL v8 = [v5 count] == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if ([v7 count]) {
    BOOL v53 = 0;
  }
  else {
    BOOL v53 = [v5 count] != 0;
  }
  double v9 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  double v10 = [v5 firstObject];
  uint64_t v58 = [v9 columnIndexForColumnID:v10];

  double v11 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  double v12 = [v7 firstObject];
  uint64_t v56 = [v11 rowIndexForRowID:v12];

  double v13 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  v52 = v5;
  double v14 = [v5 lastObject];
  uint64_t v57 = [v13 columnIndexForColumnID:v14];

  v15 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  v51 = v7;
  v16 = [v7 lastObject];
  uint64_t v55 = [v15 rowIndexForRowID:v16];

  v17 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  uint64_t v18 = [v17 rowCount];

  if (v18)
  {
    unint64_t v19 = 0;
    BOOL v54 = v8;
    do
    {
      if (v19 == v56 && v8)
      {
        v21 = [(ICiOSTableAccessibilityElement *)self tableAXController];
        v22 = [v21 startSelectionKnob];
        objc_msgSend(v3, "ic_addNonNilObject:", v22);
      }
      v23 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      uint64_t v24 = [v23 columnCount];

      if (v24)
      {
        unint64_t v25 = 0;
        int v26 = v19 == v56 || v53;
        int v27 = v19 == v55 || v53;
        do
        {
          if (v58 == v25) {
            int v28 = v26;
          }
          else {
            int v28 = 0;
          }
          if (v28 == 1)
          {
            v29 = [(ICiOSTableAccessibilityElement *)self tableAXController];
            v30 = [v29 startSelectionKnob];
            char v31 = [v3 containsObject:v30];

            if ((v31 & 1) == 0)
            {
              v32 = [(ICiOSTableAccessibilityElement *)self tableAXController];
              v33 = [v32 startSelectionKnob];
              objc_msgSend(v3, "ic_addNonNilObject:", v33);
            }
          }
          v34 = [(ICiOSTableAccessibilityElement *)self tableAXController];
          v35 = [v34 cellElementForColumnIndex:v25 rowIndex:v19];

          [v3 addObject:v35];
          if (v57 == v25) {
            int v36 = v27;
          }
          else {
            int v36 = 0;
          }
          if (v36 == 1)
          {
            v37 = [(ICiOSTableAccessibilityElement *)self tableAXController];
            v38 = [v37 endSelectionKnob];
            char v39 = [v3 containsObject:v38];

            if ((v39 & 1) == 0)
            {
              v40 = [(ICiOSTableAccessibilityElement *)self tableAXController];
              v41 = [v40 endSelectionKnob];
              objc_msgSend(v3, "ic_addNonNilObject:", v41);
            }
          }

          ++v25;
          v42 = [(ICiOSTableAccessibilityElement *)self tableAXController];
          unint64_t v43 = [v42 columnCount];
        }
        while (v25 < v43);
      }
      BOOL v8 = v54;
      if (v19 == v55 && v54)
      {
        v45 = [(ICiOSTableAccessibilityElement *)self tableAXController];
        v46 = [v45 endSelectionKnob];
        objc_msgSend(v3, "ic_addNonNilObject:", v46);
      }
      ++v19;
      v47 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      unint64_t v48 = [v47 rowCount];
    }
    while (v19 < v48);
  }
  v49 = (void *)[v3 copy];

  return v49;
}

- (id)accessibilityDataTableCellElementForRow:(unint64_t)a3 column:(unint64_t)a4
{
  double v6 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  double v7 = [v6 cellElementForColumnIndex:a4 rowIndex:a3];

  return v7;
}

- (unint64_t)accessibilityRowCount
{
  v2 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  unint64_t v3 = [v2 rowCount];

  return v3;
}

- (unint64_t)accessibilityColumnCount
{
  v2 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  unint64_t v3 = [v2 columnCount];

  return v3;
}

- (id)accessibilityHeaderElementsForRow:(unint64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  double v5 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  if ([v5 rowCount] <= a3)
  {

    double v7 = 0;
  }
  else
  {
    double v6 = [(ICiOSTableAccessibilityElement *)self tableAXController];
    double v7 = (void *)[v6 columnCount];

    if (v7)
    {
      BOOL v8 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      double v9 = [v8 columnIDForColumnIndex:0];

      double v10 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      double v11 = [v10 rowIDForRowIndex:a3];

      double v12 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      int v13 = [v12 isHeaderCellAtColumnID:v9 rowID:v11];

      double v7 = 0;
      if (v13)
      {
        double v14 = [(ICiOSTableAccessibilityElement *)self tableAXController];
        v15 = [v14 cellElementForColumnIndex:0 rowIndex:a3];
        v17[0] = v15;
        double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      }
    }
  }

  return v7;
}

- (id)accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  double v5 = [(ICiOSTableAccessibilityElement *)self tableAXController];
  if ([v5 columnCount] <= a3)
  {

    double v7 = 0;
  }
  else
  {
    double v6 = [(ICiOSTableAccessibilityElement *)self tableAXController];
    double v7 = (void *)[v6 rowCount];

    if (v7)
    {
      BOOL v8 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      double v9 = [v8 rowIDForRowIndex:0];

      double v10 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      double v11 = [v10 columnIDForColumnIndex:a3];

      double v12 = [(ICiOSTableAccessibilityElement *)self tableAXController];
      int v13 = [v12 isHeaderCellAtColumnID:v11 rowID:v9];

      double v7 = 0;
      if (v13)
      {
        double v14 = [(ICiOSTableAccessibilityElement *)self tableAXController];
        v15 = [v14 cellElementForColumnIndex:a3 rowIndex:0];
        v17[0] = v15;
        double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      }
    }
  }

  return v7;
}

- (ICTableAccessibilityController)tableAXController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAXController);

  return (ICTableAccessibilityController *)WeakRetained;
}

- (void)setTableAXController:(id)a3
{
}

- (ICiOSTableAttachmentView)parentAttachmentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAttachmentView);

  return (ICiOSTableAttachmentView *)WeakRetained;
}

- (void)setParentAttachmentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentAttachmentView);

  objc_destroyWeak((id *)&self->_tableAXController);
}

@end