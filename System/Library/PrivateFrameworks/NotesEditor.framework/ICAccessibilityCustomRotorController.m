@interface ICAccessibilityCustomRotorController
+ (id)sharedInstance;
- (ICNoteEditorViewController)noteEditorViewController;
- (NSArray)sharedTextViewRotors;
- (UIAccessibilityCustomRotor)attachmentsRotor;
- (UIAccessibilityCustomRotor)calculationErrorsRotor;
- (UIAccessibilityCustomRotor)calculationResultsRotor;
- (UIAccessibilityCustomRotor)checklistRotor;
- (UIAccessibilityCustomRotor)linksRotor;
- (UIAccessibilityCustomRotor)mentionsRotor;
- (UIAccessibilityCustomRotor)storedAttachmentsRotor;
- (UIAccessibilityCustomRotor)storedCalculationErrorsRotor;
- (UIAccessibilityCustomRotor)storedCalculationResultRotor;
- (UIAccessibilityCustomRotor)storedChecklistRotor;
- (UIAccessibilityCustomRotor)storedLinksRotor;
- (UIAccessibilityCustomRotor)storedMentionsRotor;
- (UIAccessibilityCustomRotor)storedTablesRotor;
- (UIAccessibilityCustomRotor)storedTagsRotor;
- (UIAccessibilityCustomRotor)tablesRotor;
- (UIAccessibilityCustomRotor)tagsRotor;
- (id)searchForAXElementWithPredicate:(id)a3 rotorType:(id)a4;
- (void)setNoteEditorViewController:(id)a3;
- (void)setStoredAttachmentsRotor:(id)a3;
- (void)setStoredCalculationErrorsRotor:(id)a3;
- (void)setStoredCalculationResultRotor:(id)a3;
- (void)setStoredChecklistRotor:(id)a3;
- (void)setStoredLinksRotor:(id)a3;
- (void)setStoredMentionsRotor:(id)a3;
- (void)setStoredTablesRotor:(id)a3;
- (void)setStoredTagsRotor:(id)a3;
@end

@implementation ICAccessibilityCustomRotorController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICAccessibilityCustomRotorController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __54__ICAccessibilityCustomRotorController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (UIAccessibilityCustomRotor)linksRotor
{
  v3 = [(ICAccessibilityCustomRotorController *)self storedLinksRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Links" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __50__ICAccessibilityCustomRotorController_linksRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredLinksRotor:](self, "setStoredLinksRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __50__ICAccessibilityCustomRotorController_linksRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeLinks"];

  return v5;
}

- (UIAccessibilityCustomRotor)checklistRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedChecklistRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Checklist items" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __54__ICAccessibilityCustomRotorController_checklistRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredChecklistRotor:](self, "setStoredChecklistRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __54__ICAccessibilityCustomRotorController_checklistRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeChecklist"];

  return v5;
}

- (UIAccessibilityCustomRotor)attachmentsRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedAttachmentsRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Attachments" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __56__ICAccessibilityCustomRotorController_attachmentsRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredAttachmentsRotor:](self, "setStoredAttachmentsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __56__ICAccessibilityCustomRotorController_attachmentsRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeAttachments"];

  return v5;
}

- (UIAccessibilityCustomRotor)tagsRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedTagsRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Tags" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __49__ICAccessibilityCustomRotorController_tagsRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredTagsRotor:](self, "setStoredTagsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __49__ICAccessibilityCustomRotorController_tagsRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeTags"];

  return v5;
}

- (UIAccessibilityCustomRotor)mentionsRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedMentionsRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Mentions" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __53__ICAccessibilityCustomRotorController_mentionsRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredMentionsRotor:](self, "setStoredMentionsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __53__ICAccessibilityCustomRotorController_mentionsRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeMentions"];

  return v5;
}

- (UIAccessibilityCustomRotor)tablesRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedTablesRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Tables" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __51__ICAccessibilityCustomRotorController_tablesRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredTablesRotor:](self, "setStoredTablesRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __51__ICAccessibilityCustomRotorController_tablesRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeTables"];

  return v5;
}

- (UIAccessibilityCustomRotor)calculationResultsRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedCalculationResultRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Calculation Results" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __63__ICAccessibilityCustomRotorController_calculationResultsRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredCalculationResultRotor:](self, "setStoredCalculationResultRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __63__ICAccessibilityCustomRotorController_calculationResultsRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeCalculationResults"];

  return v5;
}

- (UIAccessibilityCustomRotor)calculationErrorsRotor
{
  id v3 = [(ICAccessibilityCustomRotorController *)self storedCalculationErrorsRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F823A8]);
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Calculation Errors" value:&stru_26C10E100 table:0];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __62__ICAccessibilityCustomRotorController_calculationErrorsRotor__block_invoke;
    v11 = &unk_2640BAAE8;
    objc_copyWeak(&v12, &location);
    id v3 = (void *)[v4 initWithName:v6 itemSearchBlock:&v8];

    -[ICAccessibilityCustomRotorController setStoredCalculationErrorsRotor:](self, "setStoredCalculationErrorsRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return (UIAccessibilityCustomRotor *)v3;
}

id __62__ICAccessibilityCustomRotorController_calculationErrorsRotor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained searchForAXElementWithPredicate:v3 rotorType:@"ICAccessibilityRotorTypeCalculationErrors"];

  return v5;
}

- (NSArray)sharedTextViewRotors
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(ICAccessibilityCustomRotorController *)self noteEditorViewController];
  v5 = [v4 textView];

  v6 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeLinks"];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(ICAccessibilityCustomRotorController *)self linksRotor];
    [v3 addObject:v8];
  }
  uint64_t v9 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeChecklist"];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [(ICAccessibilityCustomRotorController *)self checklistRotor];
    [v3 addObject:v11];
  }
  id v12 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeAttachments"];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = [(ICAccessibilityCustomRotorController *)self attachmentsRotor];
    [v3 addObject:v14];
  }
  v15 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeTags"];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    v17 = [(ICAccessibilityCustomRotorController *)self tagsRotor];
    [v3 addObject:v17];
  }
  v18 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeMentions"];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    v20 = [(ICAccessibilityCustomRotorController *)self mentionsRotor];
    [v3 addObject:v20];
  }
  v21 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeTables"];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = [(ICAccessibilityCustomRotorController *)self tablesRotor];
    [v3 addObject:v23];
  }
  v24 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeCalculationResults"];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = [(ICAccessibilityCustomRotorController *)self calculationResultsRotor];
    [v3 addObject:v26];

    v27 = [v5 elementsForAccessibilityRotorType:@"ICAccessibilityRotorTypeCalculationErrors"];
    uint64_t v28 = [v27 count];

    if (v28)
    {
      v29 = [(ICAccessibilityCustomRotorController *)self calculationErrorsRotor];
      [v3 addObject:v29];
    }
  }
  v30 = (void *)[v3 copy];

  return (NSArray *)v30;
}

- (id)searchForAXElementWithPredicate:(id)a3 rotorType:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  uint64_t v8 = [(ICAccessibilityCustomRotorController *)self noteEditorViewController];
  uint64_t v9 = [v8 textView];
  uint64_t v10 = ICDynamicCast();

  v11 = [v6 currentItem];
  id v12 = [v11 targetElement];

  uint64_t v13 = [(ICAccessibilityCustomRotorController *)self noteEditorViewController];
  v14 = [v13 textView];

  v45 = v10;
  if (v12 == v14)
  {
    if ([v10 isFirstResponder])
    {
      uint64_t v16 = [v10 selectedRange];
      uint64_t v18 = v19;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v18 = 0;
    }
  }
  else
  {
    v15 = ICCheckedProtocolCast();
    uint64_t v16 = [v15 textRangeInNote];
    uint64_t v18 = v17;
  }
  uint64_t v20 = [v6 searchDirection];
  v21 = [(ICAccessibilityCustomRotorController *)self noteEditorViewController];
  uint64_t v22 = [v21 textView];
  v23 = [v22 elementsForAccessibilityRotorType:v7];

  v24 = [v23 sortedArrayUsingComparator:&__block_literal_global_19];

  if (v20 == 1) {
    uint64_t v25 = v18;
  }
  else {
    uint64_t v25 = 0;
  }
  unint64_t v26 = v16 + v25;
  if (v20 == 1)
  {
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    id v32 = v24;
    uint64_t v27 = [v32 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      v41 = v24;
      v42 = v12;
      id v43 = v7;
      id v44 = v6;
      uint64_t v29 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v32);
          }
          v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if ([v31 textRangeInNote] >= v26)
            {
LABEL_35:
              id v37 = v31;
              goto LABEL_36;
            }
          }
          else
          {
            [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]", 1, 0, @"%@ does not respond to 'textRangeInNote'", v31 functionName simulateCrash showAlert format];
          }
        }
        uint64_t v28 = [v32 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v28) {
          continue;
        }
        goto LABEL_34;
      }
    }
LABEL_37:
    id v37 = 0;
    v38 = v45;
    goto LABEL_38;
  }
  long long v48 = 0uLL;
  long long v49 = 0uLL;
  long long v46 = 0uLL;
  long long v47 = 0uLL;
  id v32 = [v24 reverseObjectEnumerator];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (!v33) {
    goto LABEL_37;
  }
  uint64_t v34 = v33;
  v41 = v24;
  v42 = v12;
  id v43 = v7;
  id v44 = v6;
  uint64_t v35 = *(void *)v47;
  do
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v47 != v35) {
        objc_enumerationMutation(v32);
      }
      v31 = *(void **)(*((void *)&v46 + 1) + 8 * j);
      if (objc_opt_respondsToSelector())
      {
        if ([v31 textRangeInNote] < v26) {
          goto LABEL_35;
        }
      }
      else
      {
        [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]", 1, 0, @"%@ does not respond to 'textRangeInNote'", v31 functionName simulateCrash showAlert format];
      }
    }
    uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
  }
  while (v34);
LABEL_34:
  id v37 = 0;
LABEL_36:
  id v7 = v43;
  id v6 = v44;
  v38 = v45;
  v24 = v41;
  id v12 = v42;
LABEL_38:

  if (v37) {
    v39 = (void *)[objc_alloc(MEMORY[0x263F823B0]) initWithTargetElement:v37 targetRange:0];
  }
  else {
    v39 = 0;
  }

  return v39;
}

uint64_t __82__ICAccessibilityCustomRotorController_searchForAXElementWithPredicate_rotorType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 textRangeInNote];
  if (v6 >= [v5 textRangeInNote])
  {
    unint64_t v8 = [v4 textRangeInNote];
    if (v8 <= [v5 textRangeInNote])
    {
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICAccessibilityCustomRotorController searchForAXElementWithPredicate:rotorType:]_block_invoke" simulateCrash:1 showAlert:0 format:@"We really should never have two rotor search elements at the same text position"];
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteEditorViewController);

  return (ICNoteEditorViewController *)WeakRetained;
}

- (void)setNoteEditorViewController:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedLinksRotor
{
  return self->_storedLinksRotor;
}

- (void)setStoredLinksRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedChecklistRotor
{
  return self->_storedChecklistRotor;
}

- (void)setStoredChecklistRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedAttachmentsRotor
{
  return self->_storedAttachmentsRotor;
}

- (void)setStoredAttachmentsRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedTablesRotor
{
  return self->_storedTablesRotor;
}

- (void)setStoredTablesRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedTagsRotor
{
  return self->_storedTagsRotor;
}

- (void)setStoredTagsRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedMentionsRotor
{
  return self->_storedMentionsRotor;
}

- (void)setStoredMentionsRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedCalculationResultRotor
{
  return self->_storedCalculationResultRotor;
}

- (void)setStoredCalculationResultRotor:(id)a3
{
}

- (UIAccessibilityCustomRotor)storedCalculationErrorsRotor
{
  return self->_storedCalculationErrorsRotor;
}

- (void)setStoredCalculationErrorsRotor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedCalculationErrorsRotor, 0);
  objc_storeStrong((id *)&self->_storedCalculationResultRotor, 0);
  objc_storeStrong((id *)&self->_storedMentionsRotor, 0);
  objc_storeStrong((id *)&self->_storedTagsRotor, 0);
  objc_storeStrong((id *)&self->_storedTablesRotor, 0);
  objc_storeStrong((id *)&self->_storedAttachmentsRotor, 0);
  objc_storeStrong((id *)&self->_storedChecklistRotor, 0);
  objc_storeStrong((id *)&self->_storedLinksRotor, 0);

  objc_destroyWeak((id *)&self->_noteEditorViewController);
}

@end