@interface ICPaperImageInsertionController
- (BOOL)shouldAddImagesToPaper;
- (ICNoteEditorViewController)noteEditor;
- (ICPaperImageInsertionController)initWithNoteEditorViewController:(id)a3;
- (void)addImagesToPaperWithItemProviders:(id)a3;
- (void)setNoteEditor:(id)a3;
@end

@implementation ICPaperImageInsertionController

- (ICPaperImageInsertionController)initWithNoteEditorViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICPaperImageInsertionController;
  v5 = [(ICPaperImageInsertionController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICPaperImageInsertionController *)v5 setNoteEditor:v4];
  }

  return v6;
}

- (void)setNoteEditor:(id)a3
{
}

- (BOOL)shouldAddImagesToPaper
{
  if (!objc_msgSend(MEMORY[0x263F82670], "ic_isiPad")) {
    return 0;
  }
  v3 = [(ICPaperImageInsertionController *)self noteEditor];
  id v4 = [v3 note];
  v5 = [v4 textStorage];
  NSUInteger v6 = objc_msgSend(v5, "ic_range");
  NSUInteger v8 = v7;

  v9 = [(ICPaperImageInsertionController *)self noteEditor];
  uint64_t v10 = [v9 textViewVisibleRange];
  uint64_t v12 = v11;

  if (v10 == v6 + v8 && v12 == 0) {
    v13.length = 2;
  }
  else {
    v13.length = v12 + 1;
  }
  v13.location = v10 - ((v10 == v6 + v8) & (v12 == 0));
  v40.location = v6;
  v40.length = v8;
  NSRange v14 = NSIntersectionRange(v13, v40);
  v15 = [(ICPaperImageInsertionController *)self noteEditor];
  v16 = [v15 textView];
  [v16 bounds];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  uint64_t v36 = 0;
  v37 = (double *)&v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = (double *)&v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = v24;
  v25 = [(ICPaperImageInsertionController *)self noteEditor];
  v26 = [v25 note];
  v27 = [v26 textStorage];
  uint64_t v28 = *MEMORY[0x263F814A0];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__ICPaperImageInsertionController_shouldAddImagesToPaper__block_invoke;
  v31[3] = &unk_2640BB3A0;
  v31[6] = v6;
  v31[7] = v8;
  v31[4] = &v36;
  v31[5] = &v32;
  v31[8] = v18;
  v31[9] = v20;
  v31[10] = v22;
  v31[11] = v24;
  objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v28, v14.location, v14.length, 0, v31);

  BOOL v29 = v37[3] / v33[3] > 0.7;
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v29;
}

uint64_t __57__ICPaperImageInsertionController_shouldAddImagesToPaper__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t isKindOfClass = a2;
  uint64_t v8 = isKindOfClass;
  if (isKindOfClass)
  {
    uint64_t v16 = isKindOfClass;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v8 = v16;
    if (isKindOfClass)
    {
      objc_opt_class();
      v9 = ICDynamicCast();
      [v9 bounds];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
      if (a3 + a4 == *(void *)(a1 + 56))
      {
        double v11 = *(double *)(a1 + 88);
        [v9 bounds];
        double v13 = v11 - v12;
        [v9 bounds];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 24)
                                                                    - (v13
                                                                     - v14);
      }

      uint64_t v8 = v16;
    }
  }

  return MEMORY[0x270F9A758](isKindOfClass, v8);
}

- (void)addImagesToPaperWithItemProviders:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(ICPaperImageInsertionController *)self noteEditor];
    NSUInteger v6 = [v5 note];
    NSUInteger v7 = [v6 textStorage];
    NSUInteger v8 = objc_msgSend(v7, "ic_range");
    NSUInteger v10 = v9;

    double v11 = [(ICPaperImageInsertionController *)self noteEditor];
    uint64_t v12 = [v11 textViewVisibleRange];
    uint64_t v14 = v13;

    if (v12 == v8 + v10 && v14 == 0) {
      v15.length = 2;
    }
    else {
      v15.length = v14 + 1;
    }
    v15.location = v12 - ((v12 == v8 + v10) & (v14 == 0));
    v62.location = v8;
    v62.length = v10;
    NSRange v16 = NSIntersectionRange(v15, v62);
    uint64_t v17 = [(ICPaperImageInsertionController *)self noteEditor];
    uint64_t v18 = [v17 textView];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    uint64_t v57 = 0;
    v58[0] = &v57;
    v58[1] = 0x3032000000;
    v58[2] = __Block_byref_object_copy__19;
    v58[3] = __Block_byref_object_dispose__19;
    id v59 = 0;
    v27 = [(ICPaperImageInsertionController *)self noteEditor];
    uint64_t v28 = [v27 note];
    BOOL v29 = [v28 textStorage];
    uint64_t v30 = *MEMORY[0x263F814A0];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke;
    v56[3] = &unk_2640BB3C8;
    v56[4] = self;
    v56[5] = &v57;
    *(double *)&v56[6] = v20 + v24 * 0.5;
    *(double *)&v56[7] = v22 + v26 * 0.5;
    objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v30, v16.location, v16.length, 0, v56);

    if (*(void *)(v58[0] + 40))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [(ICPaperImageInsertionController *)self noteEditor];
        uint64_t v32 = [v31 note];
        v33 = [v32 managedObjectContext];

        if (v33)
        {
          uint64_t v34 = [_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc];
          uint64_t v35 = [(ICPaperImageInsertionController *)self noteEditor];
          uint64_t v36 = [v35 note];
          v37 = [(ICPaperImageInsertionController *)self noteEditor];
          uint64_t v38 = [v37 textView];
          os_log_t v39 = [(ICInlineDrawingUpgradeHelper *)v34 initWithNote:v36 managedObjectContext:v33 textView:v38];

          NSRange v40 = [*(id *)(v58[0] + 40) attachment];
          v41 = [v39 upgradeWithAttachment:v40 itemProviders:v4 itemsAnchor:4];

          if (v41)
          {
            [MEMORY[0x263F158F8] begin];
            v42 = (void *)MEMORY[0x263F158F8];
            uint64_t v50 = MEMORY[0x263EF8330];
            uint64_t v51 = 3221225472;
            v52 = __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke_17;
            v53 = &unk_2640B82D8;
            v54 = self;
            v55 = v39;
            [v42 setCompletionBlock:&v50];
            objc_msgSend(MEMORY[0x263F158F8], "commit", v50, v51, v52, v53, v54);
          }
          else
          {
            v47 = os_log_create("com.apple.notes", "SystemPaper");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = [*(id *)(v58[0] + 40) attachment];
              v49 = [v48 loggingDescription];
              -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:](v49, buf, v47, v48);
            }
          }
        }
        else
        {
          os_log_t v39 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:](v39);
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = [ICSystemPaperDocumentHelper alloc];
          v44 = [*(id *)(v58[0] + 40) attachment];
          v45 = [(ICPaperImageInsertionController *)self noteEditor];
          v46 = [v45 textView];
          v33 = [(ICSystemPaperDocumentHelper *)v43 initWithPaperAttachment:v44 textView:v46];

          [v33 addWithItemProviders:v4 itemsAnchor:4];
        }
        else
        {
          v33 = os_log_create("com.apple.notes", "SystemPaper");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[ICPaperImageInsertionController addImagesToPaperWithItemProviders:]((uint64_t)v58, v33);
          }
        }
      }
    }
    else
    {
      v33 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20BE60000, v33, OS_LOG_TYPE_DEFAULT, "Unable to find paper attachment to add image to", buf, 2u);
      }
    }

    _Block_object_dispose(&v57, 8);
  }
}

void __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  objc_opt_class();
  ICDynamicCast();
  id obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void *)(v10 + 40);
    double v11 = (id *)(v10 + 40);
    if (!v12) {
      objc_storeStrong(v11, obj);
    }
    int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    uint64_t v14 = [*(id *)(a1 + 32) noteEditor];
    NSRange v15 = [v14 textView];
    NSRange v16 = v15;
    if (IsTextKit2Enabled)
    {
      uint64_t v17 = [v15 icTextLayoutManager];
      objc_msgSend(v17, "ic_rectForRange:", a3, a4);
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
    }
    else
    {
      double v26 = [v15 layoutManager];
      uint64_t v27 = objc_msgSend(v26, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      uint64_t v29 = v28;

      uint64_t v30 = [*(id *)(a1 + 32) noteEditor];
      v31 = [v30 textView];
      uint64_t v32 = [v31 layoutManager];
      v33 = [*(id *)(a1 + 32) noteEditor];
      uint64_t v34 = [v33 textView];
      uint64_t v35 = [v34 textContainer];
      objc_msgSend(v32, "boundingRectForGlyphRange:inTextContainer:", v27, v29, v35);
      CGFloat v19 = v36;
      CGFloat v21 = v37;
      CGFloat v23 = v38;
      CGFloat v25 = v39;
    }
    v42.origin.x = v19;
    v42.origin.y = v21;
    v42.size.width = v23;
    v42.size.height = v25;
    if (CGRectGetMinY(v42) <= *(double *)(a1 + 56))
    {
      v43.origin.x = v19;
      v43.origin.y = v21;
      v43.size.width = v23;
      v43.size.height = v25;
      if (CGRectGetMaxY(v43) >= *(double *)(a1 + 56))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
        *a5 = 1;
      }
    }
  }
}

void __69__ICPaperImageInsertionController_addImagesToPaperWithItemProviders___block_invoke_17(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) noteEditor];
  [v2 upgradeAllAttachmentsInNoteWithUpgradeHelper:*(void *)(a1 + 40)];
}

- (ICNoteEditorViewController)noteEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteEditor);

  return (ICNoteEditorViewController *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)addImagesToPaperWithItemProviders:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Unable to upgrade drawing since note didn't have a MOC", v1, 2u);
}

- (void)addImagesToPaperWithItemProviders:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Upgrading drawing failed for: %@", buf, 0xCu);
}

- (void)addImagesToPaperWithItemProviders:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Tried to insert image into %@, but couldn't find a matching type.", (uint8_t *)&v3, 0xCu);
}

@end