@interface NTKCFaceDetailComplicationSectionController
+ (BOOL)hasComplicationsForFace:(id)a3;
- (BOOL)_canSelectRow:(int64_t)a3;
- (NSSet)richComplicationSlots;
- (NTKCFaceDetailComplicationSectionController)initWithTableViewController:(id)a3 face:(id)a4 faceView:(id)a5 inGallery:(BOOL)a6;
- (NTKCFaceDetailComplicationSectionDelegate)delegate;
- (NTKCFaceDetailComplicationsHiddenCell)hiddenCell;
- (NTKFaceView)faceView;
- (id)titleForHeader;
- (void)_addComplication:(id)a3;
- (void)_commonInit;
- (void)didSelectRow:(int64_t)a3;
- (void)faceDidChange;
- (void)setDelegate:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setHiddenCell:(id)a3;
- (void)setRichComplicationSlots:(id)a3;
@end

@implementation NTKCFaceDetailComplicationSectionController

+ (BOOL)hasComplicationsForFace:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v4 = objc_opt_class();
  v5 = [v3 device];
  v6 = [v4 fixedComplicationSlotsForDevice:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NTKCFaceDetailComplicationSectionController_hasComplicationsForFace___block_invoke;
  v10[3] = &unk_1E62C2F60;
  id v7 = v6;
  id v11 = v7;
  id v8 = v3;
  id v12 = v8;
  v13 = &v14;
  [v8 enumerateComplicationSlotsWithBlock:v10];
  LOBYTE(v5) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v5;
}

void __71__NTKCFaceDetailComplicationSectionController_hasComplicationsForFace___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    v5 = objc_opt_class();
    v6 = [*(id *)(a1 + 40) device];
    id v7 = [v5 monogramSlotForDevice:v6];
    char v8 = [v9 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

- (NTKCFaceDetailComplicationSectionController)initWithTableViewController:(id)a3 face:(id)a4 faceView:(id)a5 inGallery:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKCFaceDetailComplicationSectionController;
  id v12 = [(NTKCFaceDetailSectionController *)&v15 initWithTableViewController:a3 face:a4 inGallery:v6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_faceView, a5);
  }

  return v13;
}

- (void)_commonInit
{
  id v3 = [(NTKCFaceDetailSectionController *)self face];
  v4 = objc_opt_class();
  v5 = [(NTKCFaceDetailSectionController *)self face];
  BOOL v6 = [v5 device];
  id v7 = [v4 fixedComplicationSlotsForDevice:v6];

  char v8 = [(NTKCFaceDetailSectionController *)self face];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NTKCFaceDetailComplicationSectionController__commonInit__block_invoke;
  v10[3] = &unk_1E62C18C8;
  id v11 = v7;
  id v12 = self;
  id v9 = v7;
  [v8 enumerateComplicationSlotsWithBlock:v10];
}

void __58__NTKCFaceDetailComplicationSectionController__commonInit__block_invoke(uint64_t a1, void *a2)
{
  id v30 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 40) face];
    v4 = [v3 complicationForSlot:v30];

    v5 = [*(id *)(a1 + 40) face];
    BOOL v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 40) face];
    char v8 = [v7 device];
    id v9 = [v6 monogramSlotForDevice:v8];
    char v10 = [v30 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v4;
        id v12 = [v11 clientIdentifier];
        int v13 = [v12 isEqualToString:@"com.nike.nikeplus-gps.watchkitapp.watchkitextension"];

        v4 = v11;
        if (v13)
        {
          uint64_t v14 = NTKSharedRemoteComplicationProvider();
          objc_super v15 = [v11 clientIdentifier];
          uint64_t v16 = [v11 appBundleIdentifier];
          char v17 = [v14 vendorExistsWithClientIdentifier:v15 appBundleIdentifier:v16];

          v4 = v11;
          if ((v17 & 1) == 0)
          {
            v4 = +[NTKComplication nullComplication];

            v18 = [*(id *)(a1 + 40) face];
            [v18 setComplication:v4 forSlot:v30];
          }
        }
      }
      v19 = [*(id *)(a1 + 40) face];
      v20 = objc_opt_class();
      v21 = [*(id *)(a1 + 40) face];
      v22 = [v21 device];
      v23 = [v20 dateSlotForDevice:v22];
      uint64_t v24 = [v30 isEqualToString:v23];

      v25 = [*(id *)(a1 + 40) richComplicationSlots];
      uint64_t v26 = [v25 containsObject:v30];

      v27 = [NTKCFaceDetailComplicationCell alloc];
      v28 = [*(id *)(a1 + 40) face];
      v29 = [(NTKCFaceDetailComplicationCell *)v27 initWithSlot:v30 dateSlot:v24 isRichSlot:v26 inFace:v28];

      [(NTKCFaceDetailComplicationCell *)v29 setComplication:v4];
      [*(id *)(a1 + 40) _addComplication:v29];
    }
  }
}

- (void)_addComplication:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCFaceDetailSectionController *)self rows];

  if (!v5)
  {
    BOOL v6 = objc_opt_new();
    [(NTKCFaceDetailSectionController *)self setRows:v6];
  }
  id v7 = [(NTKCFaceDetailSectionController *)self rows];
  [v7 addObject:v4];
}

- (id)titleForHeader
{
  return NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_COMPLICATIONS_COMPANION", @"Complications");
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v6 = [v5 indexOfObject:self->_hiddenCell];

  if (v6 == a3) {
    return 0;
  }
  char v8 = [(NTKCFaceDetailSectionController *)self rows];
  id v9 = [v8 objectAtIndexedSubscript:a3];
  char v10 = [v9 enabled];

  return v10;
}

- (void)didSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailSectionController *)self rows];
  id v9 = [v5 objectAtIndexedSubscript:a3];

  uint64_t v6 = [v9 slot];
  id v7 = [v9 complication];
  char v8 = [(NTKCFaceDetailComplicationSectionController *)self delegate];
  [v8 complicationSection:self wantsToPresentPickerForSlot:v6 selectedComplication:v7];
}

- (void)faceDidChange
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v3 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v56 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(NTKCFaceDetailComplicationsHiddenCell **)(*((void *)&v55 + 1) + 8 * i);
        if (v8 != self->_hiddenCell)
        {
          id v9 = [(NTKCFaceDetailSectionController *)self face];
          char v10 = [(NTKCFaceDetailComplicationsHiddenCell *)v8 slot];
          id v11 = [v9 complicationForSlot:v10];
          [(NTKCFaceDetailComplicationsHiddenCell *)v8 setComplication:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v5);
  }

  id v12 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v13 = [v12 indexOfObject:self->_hiddenCell];

  uint64_t v14 = [(NTKFaceView *)self->_faceView allVisibleComplicationsForCurrentConfiguration];
  uint64_t v15 = [v14 count];

  if (!v15 && !self->_hiddenCell)
  {
    uint64_t v16 = objc_alloc_init(NTKCFaceDetailComplicationsHiddenCell);
    [(NTKCFaceDetailComplicationSectionController *)self setHiddenCell:v16];
  }
  char v17 = [(NTKFaceView *)self->_faceView _complicationSlotsHiddenByCurrentConfiguration];
  if ([v17 count])
  {
    long long v53 = 0uLL;
    long long v54 = 0uLL;
    long long v51 = 0uLL;
    long long v52 = 0uLL;
    v18 = [(NTKCFaceDetailSectionController *)self rows];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v46 = v13;
      uint64_t v21 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v52 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(NTKCFaceDetailComplicationsHiddenCell **)(*((void *)&v51 + 1) + 8 * j);
          if (v23 != self->_hiddenCell)
          {
            uint64_t v24 = [*(id *)(*((void *)&v51 + 1) + 8 * j) slot];
            -[NTKCFaceDetailComplicationsHiddenCell setEnabled:](v23, "setEnabled:", [v17 containsObject:v24] ^ 1);
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v62 count:16];
      }
      while (v20);
      uint64_t v13 = v46;
    }
  }
  else
  {
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    v18 = [(NTKCFaceDetailSectionController *)self rows];
    uint64_t v25 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v48 != v27) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v47 + 1) + 8 * k) setEnabled:1];
        }
        uint64_t v26 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
      }
      while (v26);
    }
  }
  BOOL v29 = v15 == 0;

  id v30 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v31 = [v30 indexOfObject:self->_hiddenCell];

  BOOL v32 = v31 == 0x7FFFFFFFFFFFFFFFLL && v29;
  char v33 = v13 == 0x7FFFFFFFFFFFFFFFLL || v29;
  if (v31 != v13 || v32 || (v33 & 1) == 0)
  {
    v34 = [(NTKCFaceDetailSectionController *)self tableView];
    [v34 beginUpdates];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v35 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v13, -[NTKCFaceDetailSectionController section](self, "section"));
      v36 = [(NTKCFaceDetailSectionController *)self tableView];
      v60 = v35;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      [v36 deleteRowsAtIndexPaths:v37 withRowAnimation:100];

      v38 = [(NTKCFaceDetailSectionController *)self rows];
      [v38 removeObject:self->_hiddenCell];
    }
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = [(NTKCFaceDetailSectionController *)self rows];
      uint64_t v40 = [v39 count];

      v41 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v40, -[NTKCFaceDetailSectionController section](self, "section"));
      v42 = [(NTKCFaceDetailSectionController *)self tableView];
      v59 = v41;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v42 insertRowsAtIndexPaths:v43 withRowAnimation:100];

      v44 = [(NTKCFaceDetailSectionController *)self rows];
      [v44 addObject:self->_hiddenCell];
    }
    v45 = [(NTKCFaceDetailSectionController *)self tableView];
    [v45 endUpdates];
  }
}

- (NSSet)richComplicationSlots
{
  richComplicationSlots = self->_richComplicationSlots;
  if (!richComplicationSlots)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [(NTKCFaceDetailSectionController *)self face];
    uint64_t v6 = objc_opt_class();
    id v7 = [(NTKCFaceDetailSectionController *)self face];
    char v8 = [v7 device];
    id v9 = [v6 richComplicationSlotsForDevice:v8];
    char v10 = [v4 setWithArray:v9];
    id v11 = self->_richComplicationSlots;
    self->_richComplicationSlots = v10;

    richComplicationSlots = self->_richComplicationSlots;
  }
  return richComplicationSlots;
}

- (NTKCFaceDetailComplicationSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailComplicationSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKFaceView)faceView
{
  return self->_faceView;
}

- (void)setFaceView:(id)a3
{
}

- (NTKCFaceDetailComplicationsHiddenCell)hiddenCell
{
  return self->_hiddenCell;
}

- (void)setHiddenCell:(id)a3
{
}

- (void)setRichComplicationSlots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richComplicationSlots, 0);
  objc_storeStrong((id *)&self->_hiddenCell, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end