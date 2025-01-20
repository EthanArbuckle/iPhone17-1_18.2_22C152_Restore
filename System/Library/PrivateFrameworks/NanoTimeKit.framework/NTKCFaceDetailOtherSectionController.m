@interface NTKCFaceDetailOtherSectionController
- (BOOL)_canSelectRow:(int64_t)a3;
- (NTKCFaceDetailMonogramComplicationCell)monogramCell;
- (NTKCFaceDetailMonogramEditCell)monogramEditCell;
- (NTKCFaceDetailOtherSectionDelegate)delegate;
- (NTKCFaceDetailShowSecondsCell)showSecondsCell;
- (id)titleForHeader;
- (void)_addMonogramEditRow;
- (void)_commonInit;
- (void)_removeMonogramEditRow;
- (void)addMonogramRowForSlot:(id)a3;
- (void)addShowSecondsRow:(id)a3;
- (void)didSelectRow:(int64_t)a3;
- (void)faceDidChange;
- (void)removeMonogramRow;
- (void)removeShowSecondsRow;
- (void)setDelegate:(id)a3;
- (void)setMonogramCell:(id)a3;
- (void)setMonogramEditCell:(id)a3;
- (void)setShowSecondsCell:(id)a3;
- (void)toggleCell:(id)a3 didToggle:(BOOL)a4;
@end

@implementation NTKCFaceDetailOtherSectionController

- (void)_commonInit
{
  id v3 = (id)objc_opt_new();
  [(NTKCFaceDetailSectionController *)self setRows:v3];
}

- (id)titleForHeader
{
  return NTKCCustomizationLocalizedString(@"OTHER_TITLE", @"Other", v2);
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailSectionController *)self rows];
  v6 = [v5 objectAtIndexedSubscript:a3];
  LOBYTE(a3) = v6 == self->_monogramEditCell;

  return a3;
}

- (void)didSelectRow:(int64_t)a3
{
  id v4 = [(NTKCFaceDetailOtherSectionController *)self delegate];
  [v4 otherSectionDidSelectMonogramEdit:self];
}

- (void)faceDidChange
{
  if (self->_showSecondsCell)
  {
    id v3 = [(NTKCFaceDetailSectionController *)self face];
    id v4 = [v3 selectedOptionsForCustomEditModes];
    v5 = NSNumber;
    v6 = [(NTKCFaceDetailShowSecondsCell *)self->_showSecondsCell collection];
    v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "mode"));
    v8 = [v4 objectForKeyedSubscript:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NTKCFaceDetailToggleCell setOn:](self->_showSecondsCell, "setOn:", [v8 accuracy] == 0);
    }
  }
  monogramCell = self->_monogramCell;
  if (monogramCell)
  {
    int v10 = [(NTKCFaceDetailToggleCell *)monogramCell on];
    v11 = [(NTKCFaceDetailSectionController *)self face];
    v12 = [(NTKCFaceDetailMonogramComplicationCell *)self->_monogramCell slot];
    v13 = [v11 complicationForSlot:v12];
    v14 = +[NTKComplication nullComplication];
    int v15 = [v13 isEqual:v14];

    [(NTKCFaceDetailToggleCell *)self->_monogramCell setOn:v15 ^ 1u];
    if ((v15 & 1) == 0 && ![(NTKCFaceDetailSectionController *)self inGallery]) {
      [(NTKCFaceDetailOtherSectionController *)self _addMonogramEditRow];
    }
    if (v10 == v15)
    {
      v16 = self->_monogramCell;
      [(NTKCFaceDetailOtherSectionController *)self toggleCell:v16 didToggle:v15 ^ 1u];
    }
  }
}

- (void)addMonogramRowForSlot:(id)a3
{
  id v4 = a3;
  [(NTKCFaceDetailOtherSectionController *)self removeMonogramRow];
  v5 = [NTKCFaceDetailMonogramComplicationCell alloc];
  v6 = [(NTKCFaceDetailSectionController *)self face];
  v7 = [(NTKCFaceDetailMonogramComplicationCell *)v5 initWithSlot:v4 inFace:v6];

  [(NTKCFaceDetailOtherSectionController *)self setMonogramCell:v7];
  [(NTKCFaceDetailToggleCell *)self->_monogramCell setDelegate:self];
  id v8 = [(NTKCFaceDetailSectionController *)self rows];
  [v8 addObject:self->_monogramCell];
}

- (void)removeMonogramRow
{
  if (self->_monogramCell)
  {
    id v3 = [(NTKCFaceDetailSectionController *)self rows];
    [v3 removeObject:self->_monogramCell];

    [(NTKCFaceDetailToggleCell *)self->_monogramCell setDelegate:0];
    monogramCell = self->_monogramCell;
    self->_monogramCell = 0;
  }
  if (self->_monogramEditCell)
  {
    v5 = [(NTKCFaceDetailSectionController *)self rows];
    [v5 removeObject:self->_monogramEditCell];

    monogramEditCell = self->_monogramEditCell;
    self->_monogramEditCell = 0;
  }
}

- (void)_addMonogramEditRow
{
  if (!self->_monogramEditCell)
  {
    id v3 = objc_alloc_init(NTKCFaceDetailMonogramEditCell);
    [(NTKCFaceDetailOtherSectionController *)self setMonogramEditCell:v3];
  }
  id v4 = [(NTKCFaceDetailSectionController *)self rows];
  char v5 = [v4 containsObject:self->_monogramEditCell];

  if ((v5 & 1) == 0)
  {
    id v6 = [(NTKCFaceDetailSectionController *)self rows];
    [v6 addObject:self->_monogramEditCell];
  }
}

- (void)_removeMonogramEditRow
{
  id v3 = [(NTKCFaceDetailSectionController *)self rows];
  [v3 removeObject:self->_monogramEditCell];
}

- (void)addShowSecondsRow:(id)a3
{
  id v4 = a3;
  [(NTKCFaceDetailOtherSectionController *)self removeShowSecondsRow];
  char v5 = [[NTKCFaceDetailShowSecondsCell alloc] initWithCollection:v4];

  [(NTKCFaceDetailOtherSectionController *)self setShowSecondsCell:v5];
  [(NTKCFaceDetailToggleCell *)self->_showSecondsCell setDelegate:self];
  id v6 = [(NTKCFaceDetailSectionController *)self rows];
  [v6 insertObject:self->_showSecondsCell atIndex:0];
}

- (void)removeShowSecondsRow
{
  if (self->_showSecondsCell)
  {
    id v3 = [(NTKCFaceDetailSectionController *)self rows];
    [v3 removeObject:self->_showSecondsCell];

    [(NTKCFaceDetailToggleCell *)self->_showSecondsCell setDelegate:0];
    showSecondsCell = self->_showSecondsCell;
    self->_showSecondsCell = 0;
  }
}

- (void)toggleCell:(id)a3 didToggle:(BOOL)a4
{
  BOOL v4 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = (NTKCFaceDetailMonogramComplicationCell *)a3;
  v7 = v6;
  if (self->_monogramCell == v6)
  {
    if (v4)
    {
      id v16 = +[NTKComplication anyComplicationOfType:14];
      if ([(NTKCFaceDetailSectionController *)self inGallery])
      {
LABEL_22:
        v24 = [(NTKCFaceDetailOtherSectionController *)self delegate];
        v25 = [(NTKCFaceDetailMonogramComplicationCell *)self->_monogramCell slot];
        [v24 otherSection:self didToggleMonogram:v16 forSlot:v25];
LABEL_25:

        goto LABEL_26;
      }
      [(NTKCFaceDetailOtherSectionController *)self _addMonogramEditRow];
      v17 = (void *)MEMORY[0x1E4F28D58];
      v18 = [(NTKCFaceDetailSectionController *)self rows];
      v19 = objc_msgSend(v17, "indexPathForRow:inSection:", objc_msgSend(v18, "indexOfObject:", self->_monogramEditCell), -[NTKCFaceDetailSectionController section](self, "section"));

      v20 = [(NTKCFaceDetailSectionController *)self tableView];
      v31 = v19;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v20 insertRowsAtIndexPaths:v21 withRowAnimation:100];
    }
    else
    {
      id v16 = +[NTKComplication nullComplication];
      if ([(NTKCFaceDetailSectionController *)self inGallery] || !self->_monogramEditCell) {
        goto LABEL_22;
      }
      v22 = (void *)MEMORY[0x1E4F28D58];
      v23 = [(NTKCFaceDetailSectionController *)self rows];
      v19 = objc_msgSend(v22, "indexPathForRow:inSection:", objc_msgSend(v23, "indexOfObject:", self->_monogramEditCell), -[NTKCFaceDetailSectionController section](self, "section"));

      [(NTKCFaceDetailOtherSectionController *)self _removeMonogramEditRow];
      v20 = [(NTKCFaceDetailSectionController *)self tableView];
      v32[0] = v19;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      [v20 deleteRowsAtIndexPaths:v21 withRowAnimation:100];
    }

    goto LABEL_22;
  }
  if ((NTKCFaceDetailMonogramComplicationCell *)self->_showSecondsCell == v6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = [(NTKCFaceDetailMonogramComplicationCell *)v6 collection];
    v9 = [v8 options];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [v14 accuracy];
          if (v4)
          {
            if (!v15) {
              goto LABEL_23;
            }
          }
          else if (v15 == 1)
          {
LABEL_23:
            id v16 = v14;
            goto LABEL_24;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_24:

    v24 = [(NTKCFaceDetailOtherSectionController *)self delegate];
    v25 = [(NTKCFaceDetailShowSecondsCell *)self->_showSecondsCell collection];
    objc_msgSend(v24, "otherSection:didChangeShowSeconds:forMode:", self, v16, objc_msgSend(v25, "mode"));
    goto LABEL_25;
  }
LABEL_26:
}

- (NTKCFaceDetailOtherSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailOtherSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKCFaceDetailMonogramComplicationCell)monogramCell
{
  return self->_monogramCell;
}

- (void)setMonogramCell:(id)a3
{
}

- (NTKCFaceDetailMonogramEditCell)monogramEditCell
{
  return self->_monogramEditCell;
}

- (void)setMonogramEditCell:(id)a3
{
}

- (NTKCFaceDetailShowSecondsCell)showSecondsCell
{
  return self->_showSecondsCell;
}

- (void)setShowSecondsCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showSecondsCell, 0);
  objc_storeStrong((id *)&self->_monogramEditCell, 0);
  objc_storeStrong((id *)&self->_monogramCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end