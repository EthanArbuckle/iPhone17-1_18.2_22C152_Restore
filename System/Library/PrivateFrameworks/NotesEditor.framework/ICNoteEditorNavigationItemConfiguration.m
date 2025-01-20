@interface ICNoteEditorNavigationItemConfiguration
- (BOOL)canAddChecklist;
- (BOOL)canAddMedia;
- (BOOL)canAddNote;
- (BOOL)canAddTable;
- (BOOL)canChangeStyle;
- (BOOL)canCustomizeCenterItems;
- (BOOL)canInlineSketch;
- (BOOL)canRedo;
- (BOOL)canSaveQuickNote;
- (BOOL)canShare;
- (BOOL)canShowPillOrnament;
- (BOOL)canShowToolbar;
- (BOOL)canShowUndoRedo;
- (BOOL)canShowWritingTools;
- (BOOL)canUndo;
- (BOOL)canUseWritingTools;
- (BOOL)hidesBackButton;
- (BOOL)hidesDefaultCenterItems;
- (BOOL)isAccessibilityTextSizeEnabled;
- (BOOL)isCompact;
- (BOOL)isDeleted;
- (BOOL)isEditing;
- (BOOL)isEditingTable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInSecureScreen;
- (BOOL)isInTripleColumnSplitView;
- (BOOL)isLandscape;
- (BOOL)isTableSelected;
- (BOOL)showsDoneWhileEditing;
- (BOOL)showsSidebarButton;
- (BOOL)updateAnimated:(BOOL)a3;
- (BOOL)usesCustomBackButton;
- (BOOL)usesMediaMenu;
- (BOOL)usesOnlyTrailingInputAssistantItems;
- (BOOL)usesPillOrnament;
- (BOOL)usesSidecarMenu;
- (BOOL)usesStyleMenu;
- (BOOL)usesUndoRedoMenu;
- (ICMediaActionMenu)mediaActionMenu;
- (ICNoteEditorNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4;
- (ICNoteEditorNavigationItemConfigurationDataSource)dataSource;
- (ICNoteEditorNavigationItemConfigurationDelegate)delegate;
- (ICNoteEditorPillOrnamentBarButtonItem)checklistBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)inlineSketchBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)mediaBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)redoBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)styleBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)tableBarButtonItem;
- (ICNoteEditorPillOrnamentBarButtonItem)undoBarButtonItem;
- (ICNoteEditorPillOrnamentViewController)pillOrnamentViewController;
- (ICSelectorDelayer)inlineSketchAnimationSelectorDelayer;
- (ICSidecarInsertMenuController)sidecarMenuController;
- (ICStyleSelectorViewController)styleSelectorViewController;
- (ICTableActionMenu)tableActionMenu;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (NSString)checklistAccessibilityValue;
- (UIAction)redoMenuItem;
- (UIAction)undoMenuItem;
- (UIBarButtonItem)addNoteBarButtonItem;
- (UIBarButtonItem)closeAuxiliaryWindowBarButtonItem;
- (UIBarButtonItem)collaborationBarButtonItem;
- (UIBarButtonItem)customBackBarButtonItem;
- (UIBarButtonItem)deleteBarButtonItem;
- (UIBarButtonItem)doneBarButtonItem;
- (UIBarButtonItem)lockBarButtonItem;
- (UIBarButtonItem)moveBarButtonItem;
- (UIBarButtonItem)quickNoteAllNotesBarButtonItem;
- (UIBarButtonItem)quickNoteCancelBarButtonItem;
- (UIBarButtonItem)quickNoteSaveBarButtonItem;
- (UIBarButtonItem)shareBarButtonItem;
- (UIBarButtonItem)sidebarButtonItem;
- (UIBarButtonItem)verticalSeparatorBarButtonItem;
- (UIBarButtonItem)writingToolsBarButtonItem;
- (UIBarButtonItemGroup)checklistBarButtonItemGroup;
- (UIBarButtonItemGroup)inputAssistantLeadingBarButtonItemGroup;
- (UIBarButtonItemGroup)inputAssistantTrailingBarButtonItemGroup;
- (UIBarButtonItemGroup)mediaBarButtonItemGroup;
- (UIBarButtonItemGroup)pinnedTrailingBarButtonItemGroup;
- (UIBarButtonItemGroup)styleBarButtonItemGroup;
- (UIBarButtonItemGroup)tableBarButtonItemGroup;
- (UIBarButtonItemGroup)writingToolsButtonItemGroup;
- (UIMenu)mediaBarButtonItemMenu;
- (UIMenu)tableBarButtonItemMenu;
- (UIMenu)undoRedoMenu;
- (UINavigationController)navigationController;
- (UINavigationItem)navigationItem;
- (UITextInputAssistantItem)inputAssistantItem;
- (UIToolbar)inputAccessoryToolbar;
- (UIToolbar)toolbar;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (UIWindowScene)presentingWindowScene;
- (id)undoRedoButtonWithImageName:(id)a3 title:(id)a4 selector:(SEL)a5;
- (unint64_t)auxiliaryWindowType;
- (unint64_t)hash;
- (unint64_t)inlineSketchEditingState;
- (unint64_t)lockState;
- (unint64_t)quickNoteType;
- (void)addNoteAction:(id)a3 event:(id)a4;
- (void)applicationWillEnterForeground:(id)a3;
- (void)backAction:(id)a3;
- (void)checklistAction:(id)a3;
- (void)closeAuxiliaryWindowAction:(id)a3;
- (void)deleteAction:(id)a3;
- (void)doneAction:(id)a3;
- (void)inlineSketchAction:(id)a3;
- (void)lockAction:(id)a3;
- (void)moveAction:(id)a3;
- (void)performInlineSketchAnimation:(id)a3;
- (void)photoLibraryAction:(id)a3;
- (void)quickNoteAllNotesAction:(id)a3;
- (void)quickNoteCancelAction:(id)a3;
- (void)quickNoteSaveAction:(id)a3;
- (void)redoAction:(id)a3;
- (void)reset;
- (void)setAccessibilityTextSizeEnabled:(BOOL)a3;
- (void)setAddNoteBarButtonItem:(id)a3;
- (void)setAuxiliaryWindowType:(unint64_t)a3;
- (void)setCanAddChecklist:(BOOL)a3;
- (void)setCanAddMedia:(BOOL)a3;
- (void)setCanAddNote:(BOOL)a3;
- (void)setCanAddTable:(BOOL)a3;
- (void)setCanChangeStyle:(BOOL)a3;
- (void)setCanCustomizeCenterItems:(BOOL)a3;
- (void)setCanInlineSketch:(BOOL)a3;
- (void)setCanRedo:(BOOL)a3;
- (void)setCanSaveQuickNote:(BOOL)a3;
- (void)setCanShare:(BOOL)a3;
- (void)setCanShowPillOrnament:(BOOL)a3;
- (void)setCanShowUndoRedo:(BOOL)a3;
- (void)setCanShowWritingTools:(BOOL)a3;
- (void)setCanUndo:(BOOL)a3;
- (void)setCanUseWritingTools:(BOOL)a3;
- (void)setChecklistBarButtonItem:(id)a3;
- (void)setChecklistBarButtonItemGroup:(id)a3;
- (void)setCloseAuxiliaryWindowBarButtonItem:(id)a3;
- (void)setCompact:(BOOL)a3;
- (void)setCustomBackBarButtonItem:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteBarButtonItem:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDoneBarButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditingTable:(BOOL)a3;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setHidesDefaultCenterItems:(BOOL)a3;
- (void)setInSecureScreen:(BOOL)a3;
- (void)setInTripleColumnSplitView:(BOOL)a3;
- (void)setInlineSketchAnimationSelectorDelayer:(id)a3;
- (void)setInlineSketchBarButtonItem:(id)a3;
- (void)setInlineSketchEditingState:(unint64_t)a3;
- (void)setInputAssistantLeadingBarButtonItemGroup:(id)a3;
- (void)setInputAssistantTrailingBarButtonItemGroup:(id)a3;
- (void)setLandscape:(BOOL)a3;
- (void)setLockBarButtonItem:(id)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setMediaActionMenu:(id)a3;
- (void)setMediaBarButtonItem:(id)a3;
- (void)setMediaBarButtonItemGroup:(id)a3;
- (void)setMoveBarButtonItem:(id)a3;
- (void)setPillOrnamentViewController:(id)a3;
- (void)setPinnedTrailingBarButtonItemGroup:(id)a3;
- (void)setQuickNoteAllNotesBarButtonItem:(id)a3;
- (void)setQuickNoteCancelBarButtonItem:(id)a3;
- (void)setQuickNoteSaveBarButtonItem:(id)a3;
- (void)setQuickNoteType:(unint64_t)a3;
- (void)setRedoBarButtonItem:(id)a3;
- (void)setRedoMenuItem:(id)a3;
- (void)setShareBarButtonItem:(id)a3;
- (void)setShowsDoneWhileEditing:(BOOL)a3;
- (void)setShowsSidebarButton:(BOOL)a3;
- (void)setSidebarButtonItem:(id)a3;
- (void)setSidecarMenuController:(id)a3;
- (void)setStyleBarButtonItem:(id)a3;
- (void)setStyleBarButtonItemGroup:(id)a3;
- (void)setTableActionMenu:(id)a3;
- (void)setTableBarButtonItem:(id)a3;
- (void)setTableBarButtonItemGroup:(id)a3;
- (void)setTableSelected:(BOOL)a3;
- (void)setUndoBarButtonItem:(id)a3;
- (void)setUndoMenuItem:(id)a3;
- (void)setUndoRedoMenu:(id)a3;
- (void)setUsesCustomBackButton:(BOOL)a3;
- (void)setUsesMediaMenu:(BOOL)a3;
- (void)setUsesOnlyTrailingInputAssistantItems:(BOOL)a3;
- (void)setUsesPillOrnament:(BOOL)a3;
- (void)setUsesSidecarMenu:(BOOL)a3;
- (void)setUsesStyleMenu:(BOOL)a3;
- (void)setVerticalSeparatorBarButtonItem:(id)a3;
- (void)setWritingToolsBarButtonItem:(id)a3;
- (void)setWritingToolsButtonItemGroup:(id)a3;
- (void)shareAction:(id)a3;
- (void)sidebarAction:(id)a3;
- (void)styleAction:(id)a3;
- (void)tableAction:(id)a3;
- (void)undoAction:(id)a3;
- (void)updateCompactAnimated:(BOOL)a3;
- (void)updateEnabled;
- (void)updateMenus;
- (void)updateRegularAnimated:(BOOL)a3;
- (void)updateTitlesAndImages;
- (void)updateToolbarVisibilityAnimated:(BOOL)a3;
- (void)writingToolsAction:(id)a3;
@end

@implementation ICNoteEditorNavigationItemConfiguration

- (void)applicationWillEnterForeground:(id)a3
{
  id v4 = [(ICNoteEditorNavigationItemConfiguration *)self navigationController];
  v3 = [v4 navigationBar];
  [v3 layoutSubviews];
}

- (void)updateToolbarVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICNoteEditorNavigationItemConfiguration *)self navigationController];
  int v6 = [v5 isToolbarHidden];

  int v7 = [(ICNoteEditorNavigationItemConfiguration *)self canShowToolbar];
  if (v6 == v7)
  {
    int v8 = v7;
    id v9 = [(ICNoteEditorNavigationItemConfiguration *)self navigationController];
    [v9 setToolbarHidden:v8 ^ 1u animated:v3];
  }
}

- (UINavigationController)navigationController
{
  v2 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
  BOOL v3 = [v2 navigationController];

  return (UINavigationController *)v3;
}

- (void)updateCompactAnimated:(BOOL)a3
{
  uint64_t v4 = a3;
  v168[1] = *MEMORY[0x263EF8340];
  unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchEditingState];
  if ([(ICNoteEditorNavigationItemConfiguration *)self quickNoteType] == 2 && v6 != 3)
  {
    BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
    int v8 = [v3 localizedStringForKey:@"New Quick Note" value:&stru_26C10E100 table:0];
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    int v8 = 0;
  }
  id v9 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v9 setTitle:v8];

  if (v7)
  {
  }
  uint64_t v10 = [(ICNoteEditorNavigationItemConfiguration *)self isDeleted];
  v11 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v11 setStyle:v10];

  BOOL v12 = [(ICNoteEditorNavigationItemConfiguration *)self hidesBackButton]
     || [(ICNoteEditorNavigationItemConfiguration *)self auxiliaryWindowType] != 0;
  v13 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v13 setHidesBackButton:v12];

  v14 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v14 setLeftItemsSupplementBackButton:1];

  v15 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v15 setLeadingItemGroups:MEMORY[0x263EFFA68]];

  v16 = [MEMORY[0x263EFF980] array];
  if ([(ICNoteEditorNavigationItemConfiguration *)self quickNoteType] != 2 || v6 == 3)
  {
    if ([(ICNoteEditorNavigationItemConfiguration *)self isInSecureScreen])
    {
      uint64_t v17 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteAllNotesBarButtonItem];
    }
    else
    {
      if ([(ICNoteEditorNavigationItemConfiguration *)self auxiliaryWindowType] != 1) {
        goto LABEL_18;
      }
      uint64_t v17 = [(ICNoteEditorNavigationItemConfiguration *)self closeAuxiliaryWindowBarButtonItem];
    }
  }
  else
  {
    uint64_t v17 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteCancelBarButtonItem];
  }
  v18 = (void *)v17;
  [v16 addObject:v17];

LABEL_18:
  if ([(ICNoteEditorNavigationItemConfiguration *)self showsSidebarButton])
  {
    v19 = [(ICNoteEditorNavigationItemConfiguration *)self sidebarButtonItem];
    [v16 addObject:v19];
  }
  v20 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  v21 = (void *)[v16 copy];
  [v20 setLeftBarButtonItems:v21 animated:v4];

  v22 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v22 setCenterItemGroups:MEMORY[0x263EFFA68]];

  v23 = [MEMORY[0x263EFF980] array];
  if ([(ICNoteEditorNavigationItemConfiguration *)self canShowUndoRedo])
  {
    v24 = [MEMORY[0x263EFF980] array];
    v25 = [(ICNoteEditorNavigationItemConfiguration *)self undoBarButtonItem];
    [v24 addObject:v25];

    if (![(ICNoteEditorNavigationItemConfiguration *)self usesUndoRedoMenu])
    {
      v26 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:20.0];
      [v24 addObject:v26];

      v27 = [(ICNoteEditorNavigationItemConfiguration *)self redoBarButtonItem];
      [v24 addObject:v27];
    }
    v28 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:20.0];
    [v24 addObject:v28];

    id v29 = objc_alloc(MEMORY[0x263F824B8]);
    v30 = (void *)[v24 copy];
    v31 = (void *)[v29 initWithBarButtonItems:v30 representativeItem:0];

    [v23 addObject:v31];
  }
  v32 = [MEMORY[0x263EFF980] array];
  if ([(ICNoteEditorNavigationItemConfiguration *)self quickNoteType] == 2 && v6 != 3)
  {
    uint64_t v33 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteSaveBarButtonItem];
LABEL_35:
    v37 = (void *)v33;
    [v32 addObject:v33];

    goto LABEL_36;
  }
  if ([(ICNoteEditorNavigationItemConfiguration *)self lockState] && v6 != 3)
  {
    v34 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v32 addObject:v34];
  }
  if (![(ICNoteEditorNavigationItemConfiguration *)self isDeleted] && v6 != 3)
  {
    v35 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];

    if (v35)
    {
      v36 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];
      [v32 addObject:v36];
    }
    uint64_t v33 = [(ICNoteEditorNavigationItemConfiguration *)self shareBarButtonItem];
    goto LABEL_35;
  }
LABEL_36:
  if ([v32 count])
  {
    id v38 = objc_alloc(MEMORY[0x263F824B8]);
    v39 = (void *)[v32 copy];
    v40 = (void *)[v38 initWithBarButtonItems:v39 representativeItem:0];

    [v23 addObject:v40];
  }
  v41 = (void *)[v23 copy];
  v42 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v42 setTrailingItemGroups:v41];

  v43 = [MEMORY[0x263EFF980] array];
  if ([(ICNoteEditorNavigationItemConfiguration *)self isEditing]
    && [(ICNoteEditorNavigationItemConfiguration *)self showsDoneWhileEditing]
    || v6 == 3)
  {
    v44 = [(ICNoteEditorNavigationItemConfiguration *)self doneBarButtonItem];
    [v43 addObject:v44];
  }
  v45 = (void *)[v43 copy];
  v46 = [(ICNoteEditorNavigationItemConfiguration *)self pinnedTrailingBarButtonItemGroup];
  [v46 setBarButtonItems:v45];

  v47 = [(ICNoteEditorNavigationItemConfiguration *)self pinnedTrailingBarButtonItemGroup];
  v48 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v48 setPinnedTrailingGroup:v47];

  uint64_t v49 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
  if (v49)
  {
    v50 = (void *)v49;
    if ([(ICNoteEditorNavigationItemConfiguration *)self isEditing])
    {
    }
    else
    {
      unint64_t v51 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteType];

      if (v51 != 1) {
        goto LABEL_58;
      }
    }
    unsigned int v160 = v4;
    v52 = objc_msgSend(MEMORY[0x263EFF980], "array", v16);
    if (![(ICNoteEditorNavigationItemConfiguration *)self usesOnlyTrailingInputAssistantItems])
    {
      v53 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
      [v52 addObject:v53];

      v54 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
      [v52 addObject:v54];
    }
    v161 = v43;
    v55 = (void *)[v52 copy];
    v56 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
    [v56 setBarButtonItems:v55];

    v57 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
    v58 = [v57 leadingBarButtonGroups];
    v59 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
    char v60 = [v58 containsObject:v59];

    if ((v60 & 1) == 0)
    {
      v61 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v61 _setMarginOverride:11.0];

      v62 = NSStringFromSelector(sel_leadingBarButtonGroups);
      v63 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v63 willChangeValueForKey:v62];

      v64 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      v65 = [v64 leadingBarButtonGroups];
      v66 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
      v67 = [v65 arrayByAddingObject:v66];
      [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      v69 = v68 = v23;
      [v69 setLeadingBarButtonGroups:v67];

      v23 = v68;
      v70 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v70 didChangeValueForKey:v62];
    }
    v71 = [MEMORY[0x263EFF980] array];
    v72 = v23;
    if ([(ICNoteEditorNavigationItemConfiguration *)self usesOnlyTrailingInputAssistantItems])
    {
      v73 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
      [v71 addObject:v73];

      v74 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
      [v71 addObject:v74];

      v75 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
      [v71 addObject:v75];

      v76 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
      [v71 addObject:v76];

      v77 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
      [v71 addObject:v77];

      v16 = v159;
      if (![(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools]) {
        goto LABEL_55;
      }
    }
    else
    {
      v78 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
      [v71 addObject:v78];

      v79 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
      [v71 addObject:v79];

      v80 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
      [v71 addObject:v80];

      v16 = v159;
      if (![(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools])
      {
LABEL_55:
        v82 = (void *)[v71 copy];
        v83 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
        [v83 setBarButtonItems:v82];

        v84 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
        v85 = [v84 trailingBarButtonGroups];
        v86 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
        char v87 = [v85 containsObject:v86];

        if ((v87 & 1) == 0)
        {
          v88 = NSStringFromSelector(sel_trailingBarButtonGroups);
          v89 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
          [v89 willChangeValueForKey:v88];

          v90 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
          v168[0] = v90;
          v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:1];
          v92 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
          [v92 setTrailingBarButtonGroups:v91];

          v93 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
          [v93 didChangeValueForKey:v88];
        }
        uint64_t v4 = v160;
        v23 = v72;
        v43 = v161;
        goto LABEL_58;
      }
    }
    v81 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
    [v71 addObject:v81];

    goto LABEL_55;
  }
LABEL_58:
  v94 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];

  if (v94)
  {
    if ([(ICNoteEditorNavigationItemConfiguration *)self isEditing]
      && ![(ICNoteEditorNavigationItemConfiguration *)self isTableSelected])
    {
      if ([(ICNoteEditorNavigationItemConfiguration *)self quickNoteType] == 2)
      {
        v162 = v43;
        v96 = v23;
        uint64_t v97 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
        if (v97)
        {
          v98 = (void *)v97;
          v99 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
          v100 = [v99 items];
          v101 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
          int v102 = [v100 containsObject:v101];

          if (v102)
          {
            writingToolsBarButtonItem = self->_writingToolsBarButtonItem;
            self->_writingToolsBarButtonItem = 0;
          }
        }
        v104 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
        v105 = [v104 items];
        v106 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
        int v107 = [v105 containsObject:v106];

        if (v107)
        {
          checklistBarButtonItem = self->_checklistBarButtonItem;
          self->_checklistBarButtonItem = 0;
        }
        v109 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
        v110 = [v109 items];
        v111 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
        int v112 = [v110 containsObject:v111];

        if (v112)
        {
          mediaBarButtonItem = self->_mediaBarButtonItem;
          self->_mediaBarButtonItem = 0;
        }
        v114 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
        v115 = [v114 items];
        v116 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
        int v117 = [v115 containsObject:v116];

        v23 = v96;
        v43 = v162;
        if (v117)
        {
          inlineSketchBarButtonItem = self->_inlineSketchBarButtonItem;
          self->_inlineSketchBarButtonItem = 0;
        }
      }
      v95 = [MEMORY[0x263EFF980] array];
      v119 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v119];

      v120 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
      [v95 addObject:v120];

      v121 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v121];

      v122 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
      [v95 addObject:v122];

      v123 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v123];

      v124 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
      [v95 addObject:v124];

      v125 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v125];

      v126 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
      [v95 addObject:v126];

      v127 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v127];

      v128 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
      [v95 addObject:v128];

      if ([(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools])
      {
        v129 = [MEMORY[0x263F824A8] flexibleSpaceItem];
        [v95 addObject:v129];

        v130 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
        [v95 addObject:v130];
      }
      v131 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:42.0];
      [v95 addObject:v131];

      v132 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v95 addObject:v132];

      v133 = [MEMORY[0x263EFF8C0] arrayWithArray:v95];
      v134 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];
      [v134 setItems:v133];
    }
    else
    {
      v95 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];
      [v95 setItems:MEMORY[0x263EFFA68]];
    }
  }
  v135 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];

  if (v135)
  {
    v136 = [MEMORY[0x263EFF980] array];
    if ([(ICNoteEditorNavigationItemConfiguration *)self isDeleted])
    {
      v137 = [(ICNoteEditorNavigationItemConfiguration *)self deleteBarButtonItem];
      [v136 addObject:v137];

      v138 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v136 addObject:v138];

      uint64_t v139 = [(ICNoteEditorNavigationItemConfiguration *)self moveBarButtonItem];
    }
    else
    {
      if ([(ICNoteEditorNavigationItemConfiguration *)self isEditing]
        && ![(ICNoteEditorNavigationItemConfiguration *)self isTableSelected])
      {
        goto LABEL_85;
      }
      v140 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
      [v136 addObject:v140];

      v141 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v136 addObject:v141];

      v142 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
      [v136 addObject:v142];

      v143 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v136 addObject:v143];

      v144 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
      [v136 addObject:v144];

      v145 = [MEMORY[0x263F824A8] flexibleSpaceItem];
      [v136 addObject:v145];

      if (![(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools])
      {
LABEL_84:
        v148 = [(ICNoteEditorNavigationItemConfiguration *)self addNoteBarButtonItem];
        [v136 addObject:v148];

LABEL_85:
        long long v165 = 0u;
        long long v166 = 0u;
        long long v163 = 0u;
        long long v164 = 0u;
        id v149 = v136;
        uint64_t v150 = [v149 countByEnumeratingWithState:&v163 objects:v167 count:16];
        if (v150)
        {
          uint64_t v151 = v150;
          uint64_t v152 = *(void *)v164;
          do
          {
            for (uint64_t i = 0; i != v151; ++i)
            {
              if (*(void *)v164 != v152) {
                objc_enumerationMutation(v149);
              }
              [*(id *)(*((void *)&v163 + 1) + 8 * i) setTintColor:0];
            }
            uint64_t v151 = [v149 countByEnumeratingWithState:&v163 objects:v167 count:16];
          }
          while (v151);
        }

        v154 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
        [v154 setHidden:0];

        v155 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
        v156 = (void *)[v149 copy];
        [v155 setItems:v156 animated:v4];

        goto LABEL_93;
      }
      uint64_t v139 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
    }
    v146 = (void *)v139;
    [v136 addObject:v139];

    v147 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    [v136 addObject:v147];

    goto LABEL_84;
  }
LABEL_93:
  v157 = [(ICNoteEditorNavigationItemConfiguration *)self pillOrnamentViewController];
  [v157 setToolbarItems:MEMORY[0x263EFFA68]];

  v158 = [(ICNoteEditorNavigationItemConfiguration *)self pillOrnamentViewController];
  [v158 hide];
}

- (UINavigationItem)navigationItem
{
  v2 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
  BOOL v3 = [v2 navigationItem];

  return (UINavigationItem *)v3;
}

- (UIToolbar)inputAccessoryToolbar
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationInputAccessoryToolbar:self];

  return (UIToolbar *)v4;
}

- (UIToolbar)toolbar
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationToolbar:self];

  return (UIToolbar *)v4;
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationCollaborationBarButtonItem:self];

  return (UIBarButtonItem *)v4;
}

- (UIViewController)presentingViewController
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationPresentingViewController:self];

  return (UIViewController *)v4;
}

- (ICNoteEditorNavigationItemConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (ICNoteEditorNavigationItemConfigurationDataSource *)WeakRetained;
}

- (unint64_t)hash
{
  v64[34] = *MEMORY[0x263EF8340];
  v62 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddChecklist](self, "canAddChecklist"));
  v64[0] = v62;
  char v60 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddMedia](self, "canAddMedia"));
  v64[1] = v60;
  v59 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddNote](self, "canAddNote"));
  v64[2] = v59;
  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canAddTable](self, "canAddTable"));
  v64[3] = v58;
  v57 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canChangeStyle](self, "canChangeStyle"));
  v64[4] = v57;
  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canInlineSketch](self, "canInlineSketch"));
  v64[5] = v56;
  v55 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canRedo](self, "canRedo"));
  v64[6] = v55;
  v54 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canSaveQuickNote](self, "canSaveQuickNote"));
  v64[7] = v54;
  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShare](self, "canShare"));
  v64[8] = v53;
  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShowPillOrnament](self, "canShowPillOrnament"));
  v64[9] = v52;
  unint64_t v51 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShowUndoRedo](self, "canShowUndoRedo"));
  v64[10] = v51;
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canUndo](self, "canUndo"));
  v64[11] = v50;
  uint64_t v49 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canShowWritingTools](self, "canShowWritingTools"));
  v64[12] = v49;
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration canUseWritingTools](self, "canUseWritingTools"));
  v64[13] = v48;
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration hidesBackButton](self, "hidesBackButton"));
  v64[14] = v47;
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration hidesDefaultCenterItems](self, "hidesDefaultCenterItems"));
  v64[15] = v46;
  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isCompact](self, "isCompact"));
  v64[16] = v45;
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isDeleted](self, "isDeleted"));
  v64[17] = v44;
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isEditing](self, "isEditing"));
  v64[18] = v43;
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isInTripleColumnSplitView](self, "isInTripleColumnSplitView"));
  v64[19] = v42;
  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isTableSelected](self, "isTableSelected"));
  v64[20] = v41;
  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration inlineSketchEditingState](self, "inlineSketchEditingState"));
  v64[21] = v40;
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isEditingTable](self, "isEditingTable"));
  v64[22] = v39;
  id v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration auxiliaryWindowType](self, "auxiliaryWindowType"));
  v64[23] = v38;
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration isInSecureScreen](self, "isInSecureScreen"));
  v64[24] = v37;
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration lockState](self, "lockState"));
  v64[25] = v36;
  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICNoteEditorNavigationItemConfiguration quickNoteType](self, "quickNoteType"));
  v64[26] = v35;
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration showsDoneWhileEditing](self, "showsDoneWhileEditing"));
  v64[27] = v34;
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesCustomBackButton](self, "usesCustomBackButton"));
  v64[28] = v33;
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesMediaMenu](self, "usesMediaMenu"));
  v64[29] = v32;
  BOOL v3 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesPillOrnament](self, "usesPillOrnament"));
  v64[30] = v3;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesSidecarMenu](self, "usesSidecarMenu"));
  v64[31] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesStyleMenu](self, "usesStyleMenu"));
  v64[32] = v5;
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ICNoteEditorNavigationItemConfiguration usesOnlyTrailingInputAssistantItems](self, "usesOnlyTrailingInputAssistantItems"));
  v64[33] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:34];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 31;
    while (1)
    {
      v11 = [v7 objectAtIndexedSubscript:v8];
      if ([v11 integerValue] < 0) {
        break;
      }
      v9 += v10 + v10 * [v11 unsignedIntegerValue];

      ++v8;
      v10 += 31;
      if (v8 >= [v7 count]) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_8:

  BOOL v12 = [(ICNoteEditorNavigationItemConfiguration *)self checklistAccessibilityValue];
  uint64_t v13 = [v12 hash];
  if (!v13)
  {
    v14 = [MEMORY[0x263EFF9D0] null];
    uint64_t v13 = [v14 hash];
  }
  v15 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];
  if (![v15 hash])
  {
    v16 = [MEMORY[0x263EFF9D0] null];
    [v16 hash];
  }
  v63 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
  if (![v63 hash])
  {
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    [v17 hash];
  }
  v18 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];
  if (![v18 hash])
  {
    v19 = [MEMORY[0x263EFF9D0] null];
    [v19 hash];
  }
  v20 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
  if (![v20 hash])
  {
    [MEMORY[0x263EFF9D0] null];
    char v61 = v13;
    uint64_t v13 = (uint64_t)v15;
    id v29 = v28 = v12;
    [v29 hash];

    BOOL v12 = v28;
    v15 = (void *)v13;
    LOBYTE(v13) = v61;
  }
  unint64_t v30 = ICHashWithHashKeys(v9, v21, v22, v23, v24, v25, v26, v27, v13);

  return v30;
}

- (BOOL)usesPillOrnament
{
  return self->_usesPillOrnament;
}

- (BOOL)usesSidecarMenu
{
  return self->_usesSidecarMenu;
}

- (BOOL)isCompact
{
  return self->_compact;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (BOOL)isInSecureScreen
{
  return self->_inSecureScreen;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)usesMediaMenu
{
  return self->_usesMediaMenu;
}

- (unint64_t)quickNoteType
{
  return self->_quickNoteType;
}

- (BOOL)isInTripleColumnSplitView
{
  return self->_inTripleColumnSplitView;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (BOOL)isEditingTable
{
  return self->_editingTable;
}

- (BOOL)canUndo
{
  return self->_canUndo;
}

- (BOOL)canRedo
{
  return self->_canRedo;
}

- (unint64_t)auxiliaryWindowType
{
  return self->_auxiliaryWindowType;
}

- (unint64_t)inlineSketchEditingState
{
  return self->_inlineSketchEditingState;
}

- (BOOL)usesStyleMenu
{
  return self->_usesStyleMenu;
}

- (BOOL)canShowWritingTools
{
  return self->_canShowWritingTools;
}

- (BOOL)isTableSelected
{
  return self->_tableSelected;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationInputAssistantItem:self];

  return (UITextInputAssistantItem *)v4;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (NSString)checklistAccessibilityValue
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  uint64_t v4 = [v3 noteEditorNavigationItemConfigurationChecklistAccessibilityValue:self];

  return (NSString *)v4;
}

- (BOOL)canUseWritingTools
{
  return self->_canUseWritingTools;
}

- (BOOL)canShowUndoRedo
{
  return self->_canShowUndoRedo;
}

- (BOOL)canShare
{
  return self->_canShare;
}

- (BOOL)canSaveQuickNote
{
  return self->_canSaveQuickNote;
}

- (BOOL)canInlineSketch
{
  return self->_canInlineSketch;
}

- (BOOL)canChangeStyle
{
  return self->_canChangeStyle;
}

- (BOOL)canAddTable
{
  return self->_canAddTable;
}

- (BOOL)canAddNote
{
  return self->_canAddNote;
}

- (BOOL)canAddMedia
{
  return self->_canAddMedia;
}

- (BOOL)canAddChecklist
{
  return self->_canAddChecklist;
}

- (BOOL)usesOnlyTrailingInputAssistantItems
{
  return self->_usesOnlyTrailingInputAssistantItems;
}

- (BOOL)usesCustomBackButton
{
  return self->_usesCustomBackButton;
}

- (BOOL)showsDoneWhileEditing
{
  return self->_showsDoneWhileEditing;
}

- (BOOL)hidesDefaultCenterItems
{
  return self->_hidesDefaultCenterItems;
}

- (BOOL)canShowPillOrnament
{
  return self->_canShowPillOrnament;
}

- (UIBarButtonItemGroup)pinnedTrailingBarButtonItemGroup
{
  pinnedTrailingBarButtonItemGroup = self->_pinnedTrailingBarButtonItemGroup;
  if (!pinnedTrailingBarButtonItemGroup)
  {
    id v4 = objc_alloc(MEMORY[0x263F824B8]);
    v5 = (UIBarButtonItemGroup *)[v4 initWithBarButtonItems:MEMORY[0x263EFFA68] representativeItem:0];
    unint64_t v6 = self->_pinnedTrailingBarButtonItemGroup;
    self->_pinnedTrailingBarButtonItemGroup = v5;

    pinnedTrailingBarButtonItemGroup = self->_pinnedTrailingBarButtonItemGroup;
  }
  id v7 = pinnedTrailingBarButtonItemGroup;

  return v7;
}

- (ICNoteEditorPillOrnamentViewController)pillOrnamentViewController
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]
    && ([(ICNoteEditorNavigationItemConfiguration *)self presentingWindowScene],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    pillOrnamentViewController = self->_pillOrnamentViewController;
    if (!pillOrnamentViewController)
    {
      v5 = [ICNoteEditorPillOrnamentViewController alloc];
      unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
      id v7 = [(ICNoteEditorPillOrnamentViewController *)v5 initWithRootViewController:v6];
      unint64_t v8 = self->_pillOrnamentViewController;
      self->_pillOrnamentViewController = v7;

      pillOrnamentViewController = self->_pillOrnamentViewController;
    }
    uint64_t v9 = pillOrnamentViewController;
  }
  else
  {
    [(ICPillOrnamentViewController *)self->_pillOrnamentViewController hide];
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
  [(ICNavigationItemConfiguration *)&v5 reset];
  undoBarButtonItem = self->_undoBarButtonItem;
  self->_undoBarButtonItem = 0;

  redoBarButtonItem = self->_redoBarButtonItem;
  self->_redoBarButtonItem = 0;
}

- (BOOL)showsSidebarButton
{
  return self->_showsSidebarButton;
}

- (BOOL)canShowToolbar
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self isCompact]
    && [(ICNoteEditorNavigationItemConfiguration *)self isTableSelected])
  {
    return 1;
  }
  if ([(ICNoteEditorNavigationItemConfiguration *)self inlineSketchEditingState] == 3) {
    return 0;
  }

  return [(ICNoteEditorNavigationItemConfiguration *)self isCompact];
}

- (BOOL)updateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(ICNavigationItemConfiguration *)self needsUpdate];
  if (v5)
  {
    [(ICNoteEditorNavigationItemConfiguration *)self updateToolbarVisibilityAnimated:v3];
    if ([(ICNoteEditorNavigationItemConfiguration *)self isCompact]) {
      [(ICNoteEditorNavigationItemConfiguration *)self updateCompactAnimated:v3];
    }
    else {
      [(ICNoteEditorNavigationItemConfiguration *)self updateRegularAnimated:v3];
    }
    [(ICNoteEditorNavigationItemConfiguration *)self updateEnabled];
    [(ICNoteEditorNavigationItemConfiguration *)self updateMenus];
    [(ICNoteEditorNavigationItemConfiguration *)self updateTitlesAndImages];
    v7.receiver = self;
    v7.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
    LOBYTE(v5) = [(ICNavigationItemConfiguration *)&v7 updateAnimated:v3];
  }
  return v5;
}

- (void)setUsesStyleMenu:(BOOL)a3
{
  self->_usesStyleMenu = a3;
}

- (void)setUsesSidecarMenu:(BOOL)a3
{
  self->_usesSidecarMenu = a3;
}

- (void)setUsesPillOrnament:(BOOL)a3
{
  self->_usesPillOrnament = a3;
}

- (void)setUsesOnlyTrailingInputAssistantItems:(BOOL)a3
{
  self->_usesOnlyTrailingInputAssistantItems = a3;
}

- (void)setUsesCustomBackButton:(BOOL)a3
{
  self->_usesCustomBackButton = a3;
}

- (void)setTableSelected:(BOOL)a3
{
  self->_tableSelected = a3;
}

- (void)setShowsSidebarButton:(BOOL)a3
{
  self->_showsSidebarButton = a3;
}

- (void)setShowsDoneWhileEditing:(BOOL)a3
{
  self->_showsDoneWhileEditing = a3;
}

- (void)setQuickNoteType:(unint64_t)a3
{
  self->_quickNoteType = a3;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (void)setLandscape:(BOOL)a3
{
  self->_landscape = a3;
}

- (void)setInlineSketchEditingState:(unint64_t)a3
{
  self->_inlineSketchEditingState = a3;
}

- (void)setInTripleColumnSplitView:(BOOL)a3
{
  self->_inTripleColumnSplitView = a3;
}

- (void)setInSecureScreen:(BOOL)a3
{
  self->_inSecureScreen = a3;
}

- (void)setHidesDefaultCenterItems:(BOOL)a3
{
  self->_hidesDefaultCenterItems = a3;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (void)setEditingTable:(BOOL)a3
{
  self->_editingTable = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)setCompact:(BOOL)a3
{
  self->_compact = a3;
}

- (void)setCanUseWritingTools:(BOOL)a3
{
  self->_canUseWritingTools = a3;
}

- (void)setCanUndo:(BOOL)a3
{
  self->_canUndo = a3;
}

- (void)setCanShowWritingTools:(BOOL)a3
{
  self->_canShowWritingTools = a3;
}

- (void)setCanShowUndoRedo:(BOOL)a3
{
  self->_canShowUndoRedo = a3;
}

- (void)setCanShowPillOrnament:(BOOL)a3
{
  self->_canShowPillOrnament = a3;
}

- (void)setCanShare:(BOOL)a3
{
  self->_canShare = a3;
}

- (void)setCanSaveQuickNote:(BOOL)a3
{
  self->_canSaveQuickNote = a3;
}

- (void)setCanRedo:(BOOL)a3
{
  self->_canRedo = a3;
}

- (void)setCanInlineSketch:(BOOL)a3
{
  self->_canInlineSketch = a3;
}

- (void)setCanCustomizeCenterItems:(BOOL)a3
{
  self->_canCustomizeCenterItems = a3;
}

- (void)setCanChangeStyle:(BOOL)a3
{
  self->_canChangeStyle = a3;
}

- (void)setCanAddTable:(BOOL)a3
{
  self->_canAddTable = a3;
}

- (void)setCanAddNote:(BOOL)a3
{
  self->_canAddNote = a3;
}

- (void)setCanAddMedia:(BOOL)a3
{
  self->_canAddMedia = a3;
}

- (void)setCanAddChecklist:(BOOL)a3
{
  self->_canAddChecklist = a3;
}

- (void)setAuxiliaryWindowType:(unint64_t)a3
{
  self->_auxiliaryWindowType = a3;
}

- (void)setAccessibilityTextSizeEnabled:(BOOL)a3
{
  self->_accessibilityTextSizeEnabled = a3;
}

- (ICNoteEditorPillOrnamentBarButtonItem)redoBarButtonItem
{
  redoBarButtonItem = self->_redoBarButtonItem;
  if (redoBarButtonItem)
  {
    BOOL v3 = redoBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v6 = [v5 localizedStringForKey:@"Redo" value:&stru_26C10E100 table:0];

    if ([(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament])
    {
      objc_super v7 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
      unint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.uturn.forward"];
      uint64_t v9 = [(ICNoteEditorPillOrnamentBarButtonItem *)v7 initWithTitle:v6 image:v8 target:self action:sel_redoAction_ menu:0];
      uint64_t v10 = self->_redoBarButtonItem;
      self->_redoBarButtonItem = v9;

      [(ICNoteEditorPillOrnamentBarButtonItem *)self->_redoBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    }
    else
    {
      v11 = [(ICNoteEditorNavigationItemConfiguration *)self undoRedoButtonWithImageName:@"arrow.uturn.forward.circle" title:v6 selector:sel_redoAction_];
      BOOL v12 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithCustomView:v11];
      uint64_t v13 = self->_redoBarButtonItem;
      self->_redoBarButtonItem = v12;
    }
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_redoBarButtonItem setTitle:v6];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_redoBarButtonItem setAccessibilityLabel:v6];
    BOOL v3 = self->_redoBarButtonItem;
  }

  return v3;
}

- (id)undoRedoButtonWithImageName:(id)a3 title:(id)a4 selector:(SEL)a5
{
  unint64_t v8 = (void *)MEMORY[0x263F824F0];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 plainButtonConfiguration];
  objc_msgSend(v11, "setContentInsets:", *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
  BOOL v12 = [MEMORY[0x263F827E8] systemImageNamed:v10];

  [v11 setImage:v12];
  uint64_t v13 = [MEMORY[0x263F824E8] buttonWithConfiguration:v11 primaryAction:0];
  [v13 setShowsLargeContentViewer:1];
  [v13 setLargeContentTitle:v9];

  [v13 setPointerInteractionEnabled:1];
  [v13 addTarget:self action:a5 forControlEvents:0x2000];

  return v13;
}

- (void)updateEnabled
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self canAddNote];
  id v4 = [(ICNoteEditorNavigationItemConfiguration *)self addNoteBarButtonItem];
  [v4 setEnabled:v3];

  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self canUseWritingTools];
  unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
  [v6 setEnabled:v5];

  BOOL v7 = [(ICNoteEditorNavigationItemConfiguration *)self canAddChecklist];
  unint64_t v8 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
  [v8 setEnabled:v7];

  BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self canInlineSketch];
  id v10 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
  [v10 setEnabled:v9];

  BOOL v11 = [(ICNoteEditorNavigationItemConfiguration *)self canAddMedia];
  BOOL v12 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
  [v12 setEnabled:v11];

  BOOL v13 = [(ICNoteEditorNavigationItemConfiguration *)self canSaveQuickNote];
  v14 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteSaveBarButtonItem];
  [v14 setEnabled:v13];

  BOOL v15 = [(ICNoteEditorNavigationItemConfiguration *)self canRedo];
  v16 = [(ICNoteEditorNavigationItemConfiguration *)self redoBarButtonItem];
  [v16 setEnabled:v15];

  BOOL v17 = [(ICNoteEditorNavigationItemConfiguration *)self canShare];
  v18 = [(ICNoteEditorNavigationItemConfiguration *)self shareBarButtonItem];
  [v18 setEnabled:v17];

  BOOL v19 = [(ICNoteEditorNavigationItemConfiguration *)self canChangeStyle];
  v20 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
  [v20 setEnabled:v19];

  BOOL v21 = [(ICNoteEditorNavigationItemConfiguration *)self canAddTable];
  uint64_t v22 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
  [v22 setEnabled:v21];

  BOOL v23 = [(ICNoteEditorNavigationItemConfiguration *)self canUndo]
     || [(ICNoteEditorNavigationItemConfiguration *)self usesUndoRedoMenu];
  uint64_t v24 = [(ICNoteEditorNavigationItemConfiguration *)self undoBarButtonItem];
  [v24 setEnabled:v23];

  uint64_t v25 = [(ICNoteEditorNavigationItemConfiguration *)self canUndo] ^ 1;
  uint64_t v26 = [(ICNoteEditorNavigationItemConfiguration *)self undoMenuItem];
  objc_msgSend(v26, "setIc_disabled:", v25);

  uint64_t v27 = [(ICNoteEditorNavigationItemConfiguration *)self canRedo] ^ 1;
  id v28 = [(ICNoteEditorNavigationItemConfiguration *)self redoMenuItem];
  objc_msgSend(v28, "setIc_disabled:", v27);
}

- (UIBarButtonItem)shareBarButtonItem
{
  shareBarButtonItem = self->_shareBarButtonItem;
  if (shareBarButtonItem)
  {
    BOOL v3 = shareBarButtonItem;
  }
  else
  {
    BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    unint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v7 = v6;
    if (v5) {
      unint64_t v8 = @"Share this note";
    }
    else {
      unint64_t v8 = @"Share";
    }
    BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_26C10E100 table:0];

    id v10 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v11 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.up"];
    BOOL v12 = (UIBarButtonItem *)[v10 initWithTitle:v9 image:v11 target:self action:sel_shareAction_ menu:0];
    BOOL v13 = self->_shareBarButtonItem;
    self->_shareBarButtonItem = v12;

    v14 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v15 = [v14 localizedStringForKey:@"Share" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_shareBarButtonItem setAccessibilityLabel:v15];

    v16 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v17 = [v16 localizedStringForKey:@"Double tap to add people to the current note" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_shareBarButtonItem setAccessibilityHint:v17];

    BOOL v3 = self->_shareBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)addNoteBarButtonItem
{
  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  if (addNoteBarButtonItem)
  {
    BOOL v3 = addNoteBarButtonItem;
  }
  else
  {
    BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    unint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v7 = v6;
    if (v5) {
      unint64_t v8 = @"Create a note";
    }
    else {
      unint64_t v8 = @"New Note";
    }
    BOOL v9 = [v6 localizedStringForKey:v8 value:&stru_26C10E100 table:0];

    id v10 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v11 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.pencil"];
    BOOL v12 = (UIBarButtonItem *)[v10 initWithTitle:v9 image:v11 target:self action:sel_addNoteAction_event_ menu:0];
    BOOL v13 = self->_addNoteBarButtonItem;
    self->_addNoteBarButtonItem = v12;

    [(UIBarButtonItem *)self->_addNoteBarButtonItem setSpringLoaded:1];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v15 = [v14 localizedStringForKey:@"New note" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_addNoteBarButtonItem setAccessibilityLabel:v15];

    v16 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v17 = [v16 localizedStringForKey:@"Double tap to compose a new note." value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_addNoteBarButtonItem setAccessibilityHint:v17];

    BOOL v3 = self->_addNoteBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)writingToolsBarButtonItem
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools])
  {
    writingToolsBarButtonItem = self->_writingToolsBarButtonItem;
    if (writingToolsBarButtonItem)
    {
      id v4 = writingToolsBarButtonItem;
    }
    else
    {
      BOOL v5 = objc_msgSend(MEMORY[0x263F827E8], "ic_systemImageNamed:", @"apple.writing.tools");
      unint64_t v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x263F827E8], "ic_systemImageNamed:", @"_gm");
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      unint64_t v8 = v7;

      BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
      id v10 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v11 = v10;
      if (v9) {
        BOOL v12 = @"Use Writing Tools";
      }
      else {
        BOOL v12 = @"Writing Tools";
      }
      BOOL v13 = [v10 localizedStringForKey:v12 value:&stru_26C10E100 table:0];

      v14 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v13 image:v8 target:self action:sel_writingToolsAction_ menu:0];
      BOOL v15 = self->_writingToolsBarButtonItem;
      self->_writingToolsBarButtonItem = v14;

      v16 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v17 = [v16 localizedStringForKey:@"Writing Tools" value:&stru_26C10E100 table:0];
      [(UIBarButtonItem *)self->_writingToolsBarButtonItem setAccessibilityLabel:v17];

      v18 = [MEMORY[0x263F086E0] mainBundle];
      BOOL v19 = [v18 localizedStringForKey:@"Double tap to open the Writing Tools popover." value:&stru_26C10E100 table:0];
      [(UIBarButtonItem *)self->_writingToolsBarButtonItem setAccessibilityHint:v19];

      id v4 = self->_writingToolsBarButtonItem;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateMenus
{
  BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItemMenu];
  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = sel_photoLibraryAction_;
  }
  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
  [v5 setAction:v4];

  unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItemMenu];
  id v7 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
  [v7 setMenu:v6];

  if ([(ICNoteEditorNavigationItemConfiguration *)self isEditingTable]) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = sel_tableAction_;
  }
  BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
  [v9 setAction:v8];

  BOOL v10 = [(ICNoteEditorNavigationItemConfiguration *)self isEditingTable];
  if (v10)
  {
    BOOL v11 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItemMenu];
  }
  else
  {
    BOOL v11 = 0;
  }
  BOOL v12 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
  [v12 setMenu:v11];

  if (v10) {
  BOOL v13 = [(ICNoteEditorNavigationItemConfiguration *)self usesStyleMenu];
  }
  v14 = [(ICNoteEditorNavigationItemConfiguration *)self styleSelectorViewController];
  BOOL v15 = v14;
  if (v13) {
    [v14 makeInlineMenu];
  }
  else {
  id v22 = [v14 makeShortcutMenu];
  }

  v16 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
  [v16 setMenu:v22];

  objc_opt_class();
  BOOL v17 = [(ICNoteEditorNavigationItemConfiguration *)self undoBarButtonItem];
  v18 = [v17 customView];
  BOOL v19 = ICDynamicCast();

  if ([(ICNoteEditorNavigationItemConfiguration *)self usesUndoRedoMenu])
  {
    v20 = [(ICNoteEditorNavigationItemConfiguration *)self undoRedoMenu];
    [v19 setMenu:v20];
  }
  else
  {
    [v19 setMenu:0];
  }
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesUndoRedoMenu]) {
    uint64_t v21 = [(ICNoteEditorNavigationItemConfiguration *)self canUndo] ^ 1;
  }
  else {
    uint64_t v21 = 0;
  }
  [v19 setShowsMenuAsPrimaryAction:v21];
}

- (BOOL)usesUndoRedoMenu
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self isCompact]
    && ![(ICNoteEditorNavigationItemConfiguration *)self isLandscape])
  {
    id v4 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];
    BOOL v5 = v4
      || [(ICNoteEditorNavigationItemConfiguration *)self isAccessibilityTextSizeEnabled]|| [(ICNoteEditorNavigationItemConfiguration *)self isInTripleColumnSplitView];

    return v5;
  }
  else
  {
    return [(ICNoteEditorNavigationItemConfiguration *)self isInTripleColumnSplitView];
  }
}

- (BOOL)isLandscape
{
  return self->_landscape;
}

- (BOOL)isAccessibilityTextSizeEnabled
{
  return self->_accessibilityTextSizeEnabled;
}

- (UIMenu)mediaBarButtonItemMenu
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesMediaMenu])
  {
    if (![(ICNoteEditorNavigationItemConfiguration *)self usesSidecarMenu])
    {
LABEL_6:
      BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self mediaActionMenu];
      unint64_t v6 = [v5 makeMenu];

      goto LABEL_8;
    }
    BOOL v3 = [(ICNoteEditorNavigationItemConfiguration *)self mediaActionMenu];
    if ([v3 hasSidecarMenuItems])
    {

      goto LABEL_6;
    }
    int IsAudioTranscriptionEnabled = ICInternalSettingsIsAudioTranscriptionEnabled();

    if (IsAudioTranscriptionEnabled) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
LABEL_8:

  return (UIMenu *)v6;
}

- (ICMediaActionMenu)mediaActionMenu
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self lockState];
  id v4 = [ICMediaActionMenu alloc];
  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self isInSecureScreen];
  unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
  id v7 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
  unint64_t v8 = [(ICNoteEditorNavigationItemConfiguration *)self presentingSourceView];
  BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self sidecarMenuController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__ICNoteEditorNavigationItemConfiguration_mediaActionMenu__block_invoke;
  v12[3] = &unk_2640B9D80;
  objc_copyWeak(&v13, &location);
  BOOL v10 = [(ICMediaActionMenu *)v4 initWithIsPasswordProtected:v3 != 0 isInSecureScreen:v5 presentingViewController:v6 presentingBarButtonItem:v7 presentingSourceView:v8 sidecarMenuController:v9 completion:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

- (ICSidecarInsertMenuController)sidecarMenuController
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesSidecarMenu]
    && !self->_sidecarMenuController)
  {
    unint64_t v3 = objc_alloc_init(ICSidecarInsertMenuController);
    sidecarMenuController = self->_sidecarMenuController;
    self->_sidecarMenuController = v3;

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke;
    v11[3] = &unk_2640B7F90;
    objc_copyWeak(&v12, &location);
    [(ICSidecarInsertMenuController *)self->_sidecarMenuController setMenuDidChange:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke_2;
    v9[3] = &unk_2640B9DA8;
    objc_copyWeak(&v10, &location);
    [(ICSidecarInsertMenuController *)self->_sidecarMenuController setDidReceiveItems:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
  [(ICSidecarInsertMenuController *)self->_sidecarMenuController setPresentingViewController:v5];

  unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self presentingSourceView];
  [(ICSidecarInsertMenuController *)self->_sidecarMenuController setPresentingSourceView:v6];

  id v7 = self->_sidecarMenuController;

  return v7;
}

- (UIView)presentingSourceView
{
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  id v4 = [v3 noteEditorNavigationItemConfigurationPresentingSourceView:self];

  return (UIView *)v4;
}

- (ICNoteEditorPillOrnamentBarButtonItem)undoBarButtonItem
{
  undoBarButtonItem = self->_undoBarButtonItem;
  if (undoBarButtonItem)
  {
    unint64_t v3 = undoBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v6 = [v5 localizedStringForKey:@"Undo" value:&stru_26C10E100 table:0];

    if ([(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament])
    {
      id v7 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
      unint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.uturn.backward"];
      BOOL v9 = [(ICNoteEditorPillOrnamentBarButtonItem *)v7 initWithTitle:v6 image:v8 target:self action:sel_undoAction_ menu:0];
      id v10 = self->_undoBarButtonItem;
      self->_undoBarButtonItem = v9;

      [(ICNoteEditorPillOrnamentBarButtonItem *)self->_undoBarButtonItem setUsedInPillOrnament:1];
    }
    else
    {
      BOOL v11 = [(ICNoteEditorNavigationItemConfiguration *)self undoRedoButtonWithImageName:@"arrow.uturn.backward.circle" title:v6 selector:sel_undoAction_];
      id v12 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithCustomView:v11];
      id v13 = self->_undoBarButtonItem;
      self->_undoBarButtonItem = v12;
    }
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_undoBarButtonItem setTitle:v6];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_undoBarButtonItem setAccessibilityLabel:v6];
    unint64_t v3 = self->_undoBarButtonItem;
  }

  return v3;
}

- (ICNoteEditorPillOrnamentBarButtonItem)styleBarButtonItem
{
  styleBarButtonItem = self->_styleBarButtonItem;
  if (styleBarButtonItem)
  {
    unint64_t v3 = styleBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F827E8] systemImageNamed:@"textformat.alt"];
    BOOL v6 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v8 = v7;
    if (v6) {
      BOOL v9 = @"Choose a style to apply to text";
    }
    else {
      BOOL v9 = @"Format";
    }
    id v10 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

    BOOL v11 = [ICNoteEditorPillOrnamentBarButtonItem alloc];
    if ([(ICNoteEditorNavigationItemConfiguration *)self usesStyleMenu]) {
      id v12 = 0;
    }
    else {
      id v12 = sel_styleAction_;
    }
    id v13 = [(ICNoteEditorPillOrnamentBarButtonItem *)v11 initWithTitle:v10 image:v5 target:self action:v12 menu:0];
    v14 = self->_styleBarButtonItem;
    self->_styleBarButtonItem = v13;

    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_styleBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    BOOL v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:@"Format" value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_styleBarButtonItem setAccessibilityLabel:v16];

    BOOL v17 = [MEMORY[0x263F086E0] mainBundle];
    v18 = [v17 localizedStringForKey:@"Double tap to choose a style to apply to text." value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_styleBarButtonItem setAccessibilityHint:v18];

    unint64_t v3 = self->_styleBarButtonItem;
  }

  return v3;
}

- (void)updateTitlesAndImages
{
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self checklistAccessibilityValue];
  id v4 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
  [v4 setAccessibilityValue:v3];

  switch([(ICNoteEditorNavigationItemConfiguration *)self inlineSketchEditingState])
  {
    case 0uLL:
      BOOL v5 = (void *)MEMORY[0x263F827E8];
      goto LABEL_6;
    case 1uLL:
      id v12 = (void *)MEMORY[0x263F827E8];
      id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = [MEMORY[0x263F82818] configurationWithScale:3];
      id v92 = [v12 imageNamed:@"pencil.tip.crop.circle.fill" inBundle:v13 withConfiguration:v14];

      BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchAnimationSelectorDelayer];
      [v9 cancelPreviousFireRequests];
      goto LABEL_9;
    case 2uLL:
      BOOL v6 = (void *)MEMORY[0x263F827E8];
      id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v8 = [MEMORY[0x263F82818] configurationWithScale:3];
      id v92 = [v6 imageNamed:@"pencil.tip.crop.circle.fill" inBundle:v7 withConfiguration:v8];

      BOOL v9 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchAnimationSelectorDelayer];
      [v9 requestFire];
LABEL_9:

      break;
    case 3uLL:
      BOOL v10 = [(ICNoteEditorNavigationItemConfiguration *)self isCompact];
      BOOL v11 = (void *)MEMORY[0x263F827E8];
      if (v10)
      {
        BOOL v5 = (void *)MEMORY[0x263F827E8];
LABEL_6:
        id v92 = [v5 systemImageNamed:@"pencil.tip.crop.circle"];
      }
      else
      {
        BOOL v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v16 = [MEMORY[0x263F82818] configurationWithScale:3];
        id v92 = [v11 imageNamed:@"pencil.tip.crop.circle.on" inBundle:v15 withConfiguration:v16];
      }
      break;
    default:
      id v92 = 0;
      break;
  }
  BOOL v17 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
  [v17 setImage:v92];

  v18 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItemMenu];

  BOOL v19 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
  v20 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v21 = v20;
  if (v18)
  {
    if (v19) {
      id v22 = @"Add files, media, and more";
    }
    else {
      id v22 = @"Attachments";
    }
    BOOL v23 = [v20 localizedStringForKey:v22 value:&stru_26C10E100 table:0];

    uint64_t v24 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v24 setTitle:v23];

    uint64_t v25 = [MEMORY[0x263F827E8] systemImageNamed:@"paperclip"];
    uint64_t v26 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v26 setImage:v25];

    uint64_t v27 = [MEMORY[0x263F086E0] mainBundle];
    id v28 = [v27 localizedStringForKey:@"Attachments" value:&stru_26C10E100 table:0];
    id v29 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v29 setAccessibilityLabel:v28];

    unint64_t v30 = [MEMORY[0x263F086E0] mainBundle];
    v31 = v30;
    v32 = @"Double tap to add a photo or scan a document into the current note.";
  }
  else
  {
    if (v19) {
      uint64_t v33 = @"Open the photo library";
    }
    else {
      uint64_t v33 = @"Photo Library";
    }
    BOOL v23 = [v20 localizedStringForKey:v33 value:&stru_26C10E100 table:0];

    v34 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v34 setTitle:v23];

    v35 = [MEMORY[0x263F827E8] systemImageNamed:@"photo.on.rectangle"];
    v36 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v36 setImage:v35];

    v37 = [MEMORY[0x263F086E0] mainBundle];
    id v38 = [v37 localizedStringForKey:@"Photo Library" value:&stru_26C10E100 table:0];
    v39 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    [v39 setAccessibilityLabel:v38];

    unint64_t v30 = [MEMORY[0x263F086E0] mainBundle];
    v31 = v30;
    v32 = @"Double tap to add a photo into the current note.";
  }
  v40 = [v30 localizedStringForKey:v32 value:&stru_26C10E100 table:0];
  v41 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
  [v41 setAccessibilityHint:v40];

  if ([(ICNoteEditorNavigationItemConfiguration *)self isEditingTable])
  {
    v42 = [MEMORY[0x263F086E0] mainBundle];
    v43 = [v42 localizedStringForKey:@"Table Actions" value:&stru_26C10E100 table:0];
    v44 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v44 setTitle:v43];

    v45 = [MEMORY[0x263F827E8] systemImageNamed:@"table.badge.more"];
    v46 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v46 setImage:v45];

    v47 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    objc_msgSend(v47, "setImageInsets:", 0.0, -5.0, 0.0, -5.0);

    v48 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v49 = [v48 localizedStringForKey:@"Table Actions" value:&stru_26C10E100 table:0];
    v50 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v50 setAccessibilityLabel:v49];

    unint64_t v51 = [MEMORY[0x263F086E0] mainBundle];
    v52 = [v51 localizedStringForKey:@"Double tap to show the table actions menu." value:&stru_26C10E100 table:0];
    v53 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v53 setAccessibilityHint:v52];
  }
  else
  {
    BOOL v54 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    v55 = [MEMORY[0x263F086E0] mainBundle];
    v56 = v55;
    if (v54) {
      v57 = @"Add a table";
    }
    else {
      v57 = @"Table";
    }
    unint64_t v51 = [v55 localizedStringForKey:v57 value:&stru_26C10E100 table:0];

    v58 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v58 setTitle:v51];

    v59 = [MEMORY[0x263F827E8] systemImageNamed:@"table"];
    char v60 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v60 setImage:v59];

    double v61 = *MEMORY[0x263F834E8];
    double v62 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v63 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v64 = *(double *)(MEMORY[0x263F834E8] + 24);
    v65 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    objc_msgSend(v65, "setImageInsets:", v61, v62, v63, v64);

    v66 = [MEMORY[0x263F086E0] mainBundle];
    v67 = [v66 localizedStringForKey:@"Table" value:&stru_26C10E100 table:0];
    v68 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v68 setAccessibilityLabel:v67];

    v52 = [MEMORY[0x263F086E0] mainBundle];
    v53 = [v52 localizedStringForKey:@"Double tap to add a table to the current note." value:&stru_26C10E100 table:0];
    v69 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    [v69 setAccessibilityHint:v53];
  }
  unint64_t v70 = [(ICNoteEditorNavigationItemConfiguration *)self lockState];
  if (v70 >= 2)
  {
    if (v70 != 2) {
      goto LABEL_31;
    }
    v82 = [MEMORY[0x263F827E8] systemImageNamed:@"lock.open"];
    v83 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v83 setImage:v82];

    v84 = [MEMORY[0x263F086E0] mainBundle];
    v85 = [v84 localizedStringForKey:@"Unlock Note" value:&stru_26C10E100 table:0];
    v86 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v86 setTitle:v85];

    char v87 = [MEMORY[0x263F086E0] mainBundle];
    v88 = [v87 localizedStringForKey:@"Unlocked" value:&stru_26C10E100 table:0];
    v89 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v89 setAccessibilityLabel:v88];

    v79 = [MEMORY[0x263F086E0] mainBundle];
    v80 = v79;
    v81 = @"Double tap to close your locked notes";
  }
  else
  {
    v71 = [MEMORY[0x263F827E8] systemImageNamed:@"lock"];
    v72 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v72 setImage:v71];

    v73 = [MEMORY[0x263F086E0] mainBundle];
    v74 = [v73 localizedStringForKey:@"Lock Note" value:&stru_26C10E100 table:0];
    v75 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v75 setTitle:v74];

    v76 = [MEMORY[0x263F086E0] mainBundle];
    v77 = [v76 localizedStringForKey:@"Locked" value:&stru_26C10E100 table:0];
    v78 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
    [v78 setAccessibilityLabel:v77];

    v79 = [MEMORY[0x263F086E0] mainBundle];
    v80 = v79;
    v81 = @"Double tap to open your locked notes";
  }
  v90 = [v79 localizedStringForKey:v81 value:&stru_26C10E100 table:0];
  v91 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
  [v91 setAccessibilityHint:v90];

LABEL_31:
}

- (ICNoteEditorPillOrnamentBarButtonItem)mediaBarButtonItem
{
  mediaBarButtonItem = self->_mediaBarButtonItem;
  if (!mediaBarButtonItem)
  {
    id v4 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithTitle:0 image:0 target:self action:0 menu:0];
    BOOL v5 = self->_mediaBarButtonItem;
    self->_mediaBarButtonItem = v4;

    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_mediaBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    mediaBarButtonItem = self->_mediaBarButtonItem;
  }
  BOOL v6 = mediaBarButtonItem;

  return v6;
}

- (ICNoteEditorPillOrnamentBarButtonItem)tableBarButtonItem
{
  tableBarButtonItem = self->_tableBarButtonItem;
  if (tableBarButtonItem)
  {
    unint64_t v3 = tableBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F827E8] systemImageNamed:@"table"];
    BOOL v6 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v8 = v7;
    if (v6) {
      BOOL v9 = @"Add a table";
    }
    else {
      BOOL v9 = @"Table";
    }
    BOOL v10 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

    BOOL v11 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithTitle:v10 image:v5 target:self action:sel_tableAction_ menu:0];
    id v12 = self->_tableBarButtonItem;
    self->_tableBarButtonItem = v11;

    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_tableBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    unint64_t v3 = self->_tableBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)lockBarButtonItem
{
  lockBarButtonItem = self->_lockBarButtonItem;
  if (!lockBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:0 image:0 target:self action:sel_lockAction_ menu:0];
    BOOL v5 = self->_lockBarButtonItem;
    self->_lockBarButtonItem = v4;

    BOOL v6 = [MEMORY[0x263F086E0] mainBundle];
    id v7 = [v6 localizedStringForKey:@"Locked" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_lockBarButtonItem setAccessibilityLabel:v7];

    unint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    BOOL v9 = [v8 localizedStringForKey:@"Double tap to open your locked notes" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_lockBarButtonItem setAccessibilityHint:v9];

    lockBarButtonItem = self->_lockBarButtonItem;
  }
  BOOL v10 = lockBarButtonItem;

  return v10;
}

- (ICNoteEditorPillOrnamentBarButtonItem)inlineSketchBarButtonItem
{
  inlineSketchBarButtonItem = self->_inlineSketchBarButtonItem;
  if (inlineSketchBarButtonItem)
  {
    unint64_t v3 = inlineSketchBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F827E8] systemImageNamed:@"pencil.tip.crop.circle"];
    BOOL v6 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v8 = v7;
    if (v6) {
      BOOL v9 = @"Drawing tools";
    }
    else {
      BOOL v9 = @"Handwriting";
    }
    BOOL v10 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

    BOOL v11 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithTitle:v10 image:v5 target:self action:sel_inlineSketchAction_ menu:0];
    id v12 = self->_inlineSketchBarButtonItem;
    self->_inlineSketchBarButtonItem = v11;

    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_inlineSketchBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    id v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 localizedStringForKey:@"Handwriting" value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_inlineSketchBarButtonItem setAccessibilityLabel:v14];

    BOOL v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:@"Double tap to toggle the ink picker" value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_inlineSketchBarButtonItem setAccessibilityHint:v16];

    unint64_t v3 = self->_inlineSketchBarButtonItem;
  }

  return v3;
}

- (ICNoteEditorPillOrnamentBarButtonItem)checklistBarButtonItem
{
  checklistBarButtonItem = self->_checklistBarButtonItem;
  if (checklistBarButtonItem)
  {
    unint64_t v3 = checklistBarButtonItem;
  }
  else
  {
    BOOL v5 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist"];
    BOOL v6 = [(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament];
    id v7 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v8 = v7;
    if (v6) {
      BOOL v9 = @"Make a checklist";
    }
    else {
      BOOL v9 = @"Checklist";
    }
    BOOL v10 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

    BOOL v11 = [[ICNoteEditorPillOrnamentBarButtonItem alloc] initWithTitle:v10 image:v5 target:self action:sel_checklistAction_ menu:0];
    id v12 = self->_checklistBarButtonItem;
    self->_checklistBarButtonItem = v11;

    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_checklistBarButtonItem setUsedInPillOrnament:[(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]];
    id v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 localizedStringForKey:@"Checklist" value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_checklistBarButtonItem setAccessibilityLabel:v14];

    BOOL v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:@"Double tap to add a checklist to the current note." value:&stru_26C10E100 table:0];
    [(ICNoteEditorPillOrnamentBarButtonItem *)self->_checklistBarButtonItem setAccessibilityHint:v16];

    unint64_t v3 = self->_checklistBarButtonItem;
  }

  return v3;
}

- (UIAction)undoMenuItem
{
  return self->_undoMenuItem;
}

- (ICStyleSelectorViewController)styleSelectorViewController
{
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  id v4 = [v3 noteEditorNavigationItemConfigurationStyleSelectorViewController:self];

  return (ICStyleSelectorViewController *)v4;
}

- (UIAction)redoMenuItem
{
  return self->_redoMenuItem;
}

- (UIBarButtonItem)quickNoteSaveBarButtonItem
{
  quickNoteSaveBarButtonItem = self->_quickNoteSaveBarButtonItem;
  if (!quickNoteSaveBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:self action:sel_quickNoteSaveAction_];
    BOOL v5 = self->_quickNoteSaveBarButtonItem;
    self->_quickNoteSaveBarButtonItem = v4;

    [(UIBarButtonItem *)self->_quickNoteSaveBarButtonItem setStyle:2];
    quickNoteSaveBarButtonItem = self->_quickNoteSaveBarButtonItem;
  }
  BOOL v6 = quickNoteSaveBarButtonItem;

  return v6;
}

- (ICNoteEditorNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteEditorNavigationItemConfiguration;
  unint64_t v8 = [(ICNavigationItemConfiguration *)&v12 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_showsDoneWhileEditing = 1;
    v9->_usesMediaMenu = 1;
    BOOL v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v9 selector:sel_applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v9;
}

- (UIWindowScene)presentingWindowScene
{
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  id v4 = [v3 noteEditorNavigationItemConfigurationPresentingWindowScene:self];

  return (UIWindowScene *)v4;
}

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  unint64_t v3 = [(ICNoteEditorNavigationItemConfiguration *)self dataSource];
  id v4 = [v3 noteEditorNavigationItemConfigurationTableAttachmentViewController:self];

  return (ICTableAttachmentViewController *)v4;
}

- (ICSelectorDelayer)inlineSketchAnimationSelectorDelayer
{
  inlineSketchAnimationSelectorDelayer = self->_inlineSketchAnimationSelectorDelayer;
  if (!inlineSketchAnimationSelectorDelayer)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F5AEA8]) initWithTarget:self selector:sel_performInlineSketchAnimation_ delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:1.5];
    [(ICNoteEditorNavigationItemConfiguration *)self setInlineSketchAnimationSelectorDelayer:v4];

    inlineSketchAnimationSelectorDelayer = self->_inlineSketchAnimationSelectorDelayer;
  }
  BOOL v5 = inlineSketchAnimationSelectorDelayer;

  return v5;
}

- (void)performInlineSketchAnimation:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82E00];
  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
  id v6 = objc_msgSend(v5, "ic_view");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__ICNoteEditorNavigationItemConfiguration_performInlineSketchAnimation___block_invoke;
  v7[3] = &unk_2640B8140;
  v7[4] = self;
  [v4 transitionWithView:v6 duration:5242880 options:v7 animations:0 completion:0.5];
}

void __72__ICNoteEditorNavigationItemConfiguration_performInlineSketchAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInlineSketchEditingState:0];
  [*(id *)(a1 + 32) updateAnimated:1];
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [v2 inlineSketchBarButtonItem];
  [v4 noteEditorNavigationItemConfiguration:v2 didCompleteAnimationFromInlineSketchBarButtonItem:v3];
}

- (void)updateRegularAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  v140[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v5 setTitle:0];

  id v6 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v6 setTitleView:0];

  id v7 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  BOOL v8 = 1;
  [v7 setStyle:1];

  BOOL v9 = [MEMORY[0x263EFF980] array];
  if (![(ICNoteEditorNavigationItemConfiguration *)self hidesBackButton])
  {
    if ([(ICNoteEditorNavigationItemConfiguration *)self auxiliaryWindowType]) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = [(ICNoteEditorNavigationItemConfiguration *)self usesCustomBackButton];
    }
  }
  BOOL v10 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v10 setHidesBackButton:v8];

  if ([(ICNoteEditorNavigationItemConfiguration *)self usesCustomBackButton]
    && ![(ICNoteEditorNavigationItemConfiguration *)self auxiliaryWindowType])
  {
    id v11 = objc_alloc(MEMORY[0x263F824B8]);
    objc_super v12 = [(ICNoteEditorNavigationItemConfiguration *)self customBackBarButtonItem];
    v140[0] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:1];
    v14 = (void *)[v11 initWithBarButtonItems:v13 representativeItem:0];

    [v9 addObject:v14];
  }
  BOOL v15 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v15 setLeftItemsSupplementBackButton:1];

  if ([(ICNoteEditorNavigationItemConfiguration *)self showsSidebarButton])
  {
    id v16 = objc_alloc(MEMORY[0x263F824B8]);
    BOOL v17 = [(ICNoteEditorNavigationItemConfiguration *)self sidebarButtonItem];
    uint64_t v139 = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v139 count:1];
    BOOL v19 = (void *)[v16 initWithBarButtonItems:v18 representativeItem:0];

    [v9 addObject:v19];
  }
  if (![(ICNoteEditorNavigationItemConfiguration *)self quickNoteType])
  {
    v20 = [MEMORY[0x263EFF980] array];
    if ([(ICNoteEditorNavigationItemConfiguration *)self isInSecureScreen])
    {
      uint64_t v21 = [(ICNoteEditorNavigationItemConfiguration *)self quickNoteAllNotesBarButtonItem];
    }
    else
    {
      if ([(ICNoteEditorNavigationItemConfiguration *)self auxiliaryWindowType] != 1)
      {
LABEL_16:
        if ([v20 count])
        {
          id v23 = objc_alloc(MEMORY[0x263F824B8]);
          uint64_t v24 = (void *)[v20 copy];
          uint64_t v25 = (void *)[v23 initWithBarButtonItems:v24 representativeItem:0];

          [v9 addObject:v25];
        }

        goto LABEL_19;
      }
      uint64_t v21 = [(ICNoteEditorNavigationItemConfiguration *)self closeAuxiliaryWindowBarButtonItem];
    }
    id v22 = (void *)v21;
    [v20 addObject:v21];

    goto LABEL_16;
  }
LABEL_19:
  if (![(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]
    && [(ICNoteEditorNavigationItemConfiguration *)self canShowUndoRedo])
  {
    uint64_t v26 = [MEMORY[0x263EFF980] array];
    uint64_t v27 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:20.0];
    [v26 addObject:v27];

    id v28 = [(ICNoteEditorNavigationItemConfiguration *)self undoBarButtonItem];
    [v26 addObject:v28];

    if (![(ICNoteEditorNavigationItemConfiguration *)self usesUndoRedoMenu])
    {
      id v29 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:20.0];
      [v26 addObject:v29];

      unint64_t v30 = [(ICNoteEditorNavigationItemConfiguration *)self redoBarButtonItem];
      [v26 addObject:v30];
    }
    id v31 = objc_alloc(MEMORY[0x263F824B8]);
    v32 = (void *)[v26 copy];
    uint64_t v33 = (void *)[v31 initWithBarButtonItems:v32 representativeItem:0];

    [v9 addObject:v33];
  }
  v34 = (void *)[v9 copy];
  v35 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v35 setLeadingItemGroups:v34];

  if ([(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament])
  {
    v36 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
    [v36 setCenterItemGroups:MEMORY[0x263EFFA68]];

    v37 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
    [v37 setCustomizationIdentifier:0];
  }
  else
  {
    id v38 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
    v138 = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v138 count:1];
    v40 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItemGroup];
    [v40 setBarButtonItems:v39];

    v41 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
    v137 = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
    v43 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItemGroup];
    [v43 setBarButtonItems:v42];

    v44 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    v136 = v44;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
    v46 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItemGroup];
    [v46 setBarButtonItems:v45];

    v47 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    v135 = v47;
    v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v135 count:1];
    uint64_t v49 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItemGroup];
    [v49 setBarButtonItems:v48];

    v50 = (void *)MEMORY[0x263EFF980];
    unint64_t v51 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItemGroup];
    v52 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItemGroup];
    v53 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItemGroup];
    BOOL v54 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItemGroup];
    v37 = objc_msgSend(v50, "arrayWithObjects:", v51, v52, v53, v54, 0);

    if ([(ICNoteEditorNavigationItemConfiguration *)self canShowWritingTools])
    {
      v55 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
      v134 = v55;
      v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v134 count:1];
      v57 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsButtonItemGroup];
      [v57 setBarButtonItems:v56];

      v58 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsButtonItemGroup];
      [v37 addObject:v58];
    }
    v59 = (void *)[v37 copy];
    char v60 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
    [v60 setCenterItemGroups:v59];

    if ([(ICNoteEditorNavigationItemConfiguration *)self canCustomizeCenterItems]) {
      double v61 = @"ICNoteEditorViewControllerNavigationBarCustomizationID";
    }
    else {
      double v61 = 0;
    }
    double v62 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
    [v62 setCustomizationIdentifier:v61];
  }
  double v63 = [MEMORY[0x263EFF980] array];
  if (![(ICNoteEditorNavigationItemConfiguration *)self quickNoteType])
  {
    if ([(ICNoteEditorNavigationItemConfiguration *)self lockState])
    {
      double v64 = [(ICNoteEditorNavigationItemConfiguration *)self lockBarButtonItem];
      [v63 addObject:v64];
    }
    if ([(ICNoteEditorNavigationItemConfiguration *)self isDeleted])
    {
      v65 = [(ICNoteEditorNavigationItemConfiguration *)self moveBarButtonItem];
      [v63 addObject:v65];

      uint64_t v66 = [(ICNoteEditorNavigationItemConfiguration *)self deleteBarButtonItem];
LABEL_41:
      unint64_t v70 = (void *)v66;
      [v63 addObject:v66];

      goto LABEL_42;
    }
    if (![(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament])
    {
      v67 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
      [v63 addObject:v67];
    }
    v68 = [(ICNoteEditorNavigationItemConfiguration *)self shareBarButtonItem];
    [v63 addObject:v68];

    v69 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];

    if (v69)
    {
      uint64_t v66 = [(ICNoteEditorNavigationItemConfiguration *)self collaborationBarButtonItem];
      goto LABEL_41;
    }
  }
LABEL_42:
  v71 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  v72 = (void *)[v63 copy];
  [v71 setRightBarButtonItems:v72 animated:v3];

  v73 = [MEMORY[0x263EFF980] array];
  v74 = [(ICNoteEditorNavigationItemConfiguration *)self addNoteBarButtonItem];
  [v73 addObject:v74];

  if ([(ICNoteEditorNavigationItemConfiguration *)self isEditing]
    && [(ICNoteEditorNavigationItemConfiguration *)self showsDoneWhileEditing])
  {
    v75 = [(ICNoteEditorNavigationItemConfiguration *)self doneBarButtonItem];
    [v73 addObject:v75];
  }
  v76 = (void *)[v73 copy];
  v77 = [(ICNoteEditorNavigationItemConfiguration *)self pinnedTrailingBarButtonItemGroup];
  [v77 setBarButtonItems:v76];

  v78 = [(ICNoteEditorNavigationItemConfiguration *)self pinnedTrailingBarButtonItemGroup];
  v79 = [(ICNoteEditorNavigationItemConfiguration *)self navigationItem];
  [v79 setPinnedTrailingGroup:v78];

  v80 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];

  if (v80)
  {
    unsigned int v130 = v3;
    v81 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
    [v81 setBarButtonItems:MEMORY[0x263EFFA68]];

    v82 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
    v83 = [v82 leadingBarButtonGroups];
    v84 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
    char v85 = [v83 containsObject:v84];

    if ((v85 & 1) == 0)
    {
      v86 = NSStringFromSelector(sel_leadingBarButtonGroups);
      char v87 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v87 willChangeValueForKey:v86];

      v88 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      v89 = [v88 leadingBarButtonGroups];
      v90 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantLeadingBarButtonItemGroup];
      [v89 arrayByAddingObject:v90];
      id v92 = v91 = v9;
      v93 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v93 setLeadingBarButtonGroups:v92];

      BOOL v9 = v91;
      v94 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v94 didChangeValueForKey:v86];
    }
    v95 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
    [v95 setBarButtonItems:MEMORY[0x263EFFA68]];

    v96 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
    uint64_t v97 = [v96 trailingBarButtonGroups];
    v98 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
    char v99 = [v97 containsObject:v98];

    uint64_t v3 = v130;
    if ((v99 & 1) == 0)
    {
      v100 = NSStringFromSelector(sel_trailingBarButtonGroups);
      v101 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v101 willChangeValueForKey:v100];

      int v102 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantTrailingBarButtonItemGroup];
      v133 = v102;
      v103 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v133 count:1];
      v104 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v104 setTrailingBarButtonGroups:v103];

      v105 = [(ICNoteEditorNavigationItemConfiguration *)self inputAssistantItem];
      [v105 didChangeValueForKey:v100];
    }
  }
  v106 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];

  if (v106)
  {
    int v107 = [(ICNoteEditorNavigationItemConfiguration *)self inputAccessoryToolbar];
    [v107 setItems:MEMORY[0x263EFFA68]];
  }
  v108 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];

  if (v108)
  {
    v109 = [(ICNoteEditorNavigationItemConfiguration *)self toolbar];
    [v109 setItems:MEMORY[0x263EFFA68] animated:v3];
  }
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesPillOrnament]
    && [(ICNoteEditorNavigationItemConfiguration *)self canShowPillOrnament]
    && ![(ICNoteEditorNavigationItemConfiguration *)self inlineSketchEditingState])
  {
    v131 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    v132[0] = v131;
    v129 = [(ICNoteEditorNavigationItemConfiguration *)self undoBarButtonItem];
    v132[1] = v129;
    v128 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[2] = v128;
    v127 = [(ICNoteEditorNavigationItemConfiguration *)self redoBarButtonItem];
    v132[3] = v127;
    v126 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[4] = v126;
    v125 = [(ICNoteEditorNavigationItemConfiguration *)self verticalSeparatorBarButtonItem];
    v132[5] = v125;
    v124 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[6] = v124;
    v123 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
    v132[7] = v123;
    v122 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[8] = v122;
    v121 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
    v132[9] = v121;
    v120 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[10] = v120;
    v119 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    v132[11] = v119;
    v118 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[12] = v118;
    v111 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    v132[13] = v111;
    int v112 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:16.0];
    v132[14] = v112;
    v113 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchBarButtonItem];
    v132[15] = v113;
    v114 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    v132[16] = v114;
    v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:17];
    [(ICNoteEditorNavigationItemConfiguration *)self pillOrnamentViewController];
    int v117 = v116 = v9;
    [v117 setToolbarItems:v115];

    BOOL v9 = v116;
    v110 = [(ICNoteEditorNavigationItemConfiguration *)self pillOrnamentViewController];
    [v110 show];
  }
  else
  {
    v110 = [(ICNoteEditorNavigationItemConfiguration *)self pillOrnamentViewController];
    [v110 hide];
  }
}

- (UIBarButtonItem)closeAuxiliaryWindowBarButtonItem
{
  closeAuxiliaryWindowBarButtonItem = self->_closeAuxiliaryWindowBarButtonItem;
  if (!closeAuxiliaryWindowBarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 localizedStringForKey:@"Close" value:&stru_26C10E100 table:0];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 image:0 target:self action:sel_closeAuxiliaryWindowAction_ menu:0];
    BOOL v8 = self->_closeAuxiliaryWindowBarButtonItem;
    self->_closeAuxiliaryWindowBarButtonItem = v7;

    closeAuxiliaryWindowBarButtonItem = self->_closeAuxiliaryWindowBarButtonItem;
  }
  BOOL v9 = closeAuxiliaryWindowBarButtonItem;

  return v9;
}

- (UIBarButtonItem)customBackBarButtonItem
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self usesCustomBackButton])
  {
    customBackBarButtonItem = self->_customBackBarButtonItem;
    if (!customBackBarButtonItem)
    {
      id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:101 target:self action:sel_backAction_];
      BOOL v5 = self->_customBackBarButtonItem;
      self->_customBackBarButtonItem = v4;

      customBackBarButtonItem = self->_customBackBarButtonItem;
    }
    id v6 = customBackBarButtonItem;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  deleteBarButtonItem = self->_deleteBarButtonItem;
  if (!deleteBarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 localizedStringForKey:@"Delete Note" value:&stru_26C10E100 table:0];
    id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];
    BOOL v8 = (UIBarButtonItem *)[v4 initWithTitle:v6 image:v7 target:self action:sel_deleteAction_ menu:0];
    BOOL v9 = self->_deleteBarButtonItem;
    self->_deleteBarButtonItem = v8;

    BOOL v10 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v10 localizedStringForKey:@"Delete Note" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_deleteBarButtonItem setAccessibilityLabel:v11];

    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = [v12 localizedStringForKey:@"Double tap to delete the current note." value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_deleteBarButtonItem setAccessibilityHint:v13];

    deleteBarButtonItem = self->_deleteBarButtonItem;
  }
  v14 = deleteBarButtonItem;

  return v14;
}

- (UIBarButtonItem)doneBarButtonItem
{
  doneBarButtonItem = self->_doneBarButtonItem;
  if (!doneBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneAction_];
    BOOL v5 = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v4;

    doneBarButtonItem = self->_doneBarButtonItem;
  }
  id v6 = doneBarButtonItem;

  return v6;
}

- (UIBarButtonItem)moveBarButtonItem
{
  moveBarButtonItem = self->_moveBarButtonItem;
  if (!moveBarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 localizedStringForKey:@"Move Note" value:&stru_26C10E100 table:0];
    id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"folder"];
    BOOL v8 = (UIBarButtonItem *)[v4 initWithTitle:v6 image:v7 target:self action:sel_moveAction_ menu:0];
    BOOL v9 = self->_moveBarButtonItem;
    self->_moveBarButtonItem = v8;

    BOOL v10 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v10 localizedStringForKey:@"Move Note" value:&stru_26C10E100 table:0];
    objc_super v12 = [(ICNoteEditorNavigationItemConfiguration *)self moveBarButtonItem];
    [v12 setAccessibilityLabel:v11];

    id v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 localizedStringForKey:@"Double tap to move the current note." value:&stru_26C10E100 table:0];
    BOOL v15 = [(ICNoteEditorNavigationItemConfiguration *)self moveBarButtonItem];
    [v15 setAccessibilityHint:v14];

    moveBarButtonItem = self->_moveBarButtonItem;
  }
  id v16 = moveBarButtonItem;

  return v16;
}

- (UIBarButtonItem)quickNoteAllNotesBarButtonItem
{
  quickNoteAllNotesBarButtonItem = self->_quickNoteAllNotesBarButtonItem;
  if (!quickNoteAllNotesBarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 localizedStringForKey:@"All Notes" value:&stru_26C10E100 table:0];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 image:0 target:self action:sel_quickNoteAllNotesAction_ menu:0];
    BOOL v8 = self->_quickNoteAllNotesBarButtonItem;
    self->_quickNoteAllNotesBarButtonItem = v7;

    quickNoteAllNotesBarButtonItem = self->_quickNoteAllNotesBarButtonItem;
  }
  BOOL v9 = quickNoteAllNotesBarButtonItem;

  return v9;
}

- (UIBarButtonItem)quickNoteCancelBarButtonItem
{
  quickNoteCancelBarButtonItem = self->_quickNoteCancelBarButtonItem;
  if (!quickNoteCancelBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_quickNoteCancelAction_];
    BOOL v5 = self->_quickNoteCancelBarButtonItem;
    self->_quickNoteCancelBarButtonItem = v4;

    quickNoteCancelBarButtonItem = self->_quickNoteCancelBarButtonItem;
  }
  id v6 = quickNoteCancelBarButtonItem;

  return v6;
}

- (UIBarButtonItem)sidebarButtonItem
{
  sidebarButtonItem = self->_sidebarButtonItem;
  if (!sidebarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x263F824A8]);
    BOOL v5 = [MEMORY[0x263F086E0] mainBundle];
    id v6 = [v5 localizedStringForKey:@"Sidebar" value:&stru_26C10E100 table:0];
    id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"sidebar.leading"];
    BOOL v8 = (UIBarButtonItem *)[v4 initWithTitle:v6 image:v7 target:self action:sel_sidebarAction_ menu:0];
    BOOL v9 = self->_sidebarButtonItem;
    self->_sidebarButtonItem = v8;

    BOOL v10 = [MEMORY[0x263F086E0] mainBundle];
    id v11 = [v10 localizedStringForKey:@"Sidebar" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_sidebarButtonItem setAccessibilityLabel:v11];

    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = [v12 localizedStringForKey:@"Double tap to toggle the sidebar" value:&stru_26C10E100 table:0];
    [(UIBarButtonItem *)self->_sidebarButtonItem setAccessibilityHint:v13];

    sidebarButtonItem = self->_sidebarButtonItem;
  }
  v14 = sidebarButtonItem;

  return v14;
}

- (UIBarButtonItem)verticalSeparatorBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  id v4 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
  BOOL v5 = [v4 view];
  objc_msgSend(v5, "ic_hairlineWidth");
  id v7 = objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v6, 12.0 * -2.0 + 44.0);

  BOOL v8 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  [v7 setBackgroundColor:v8];

  BOOL v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v7];
  verticalSeparatorBarButtonItem = self->_verticalSeparatorBarButtonItem;
  self->_verticalSeparatorBarButtonItem = v9;

  id v11 = self->_verticalSeparatorBarButtonItem;
  return v11;
}

void __58__ICNoteEditorNavigationItemConfiguration_mediaActionMenu__block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v3 = (id *)(a1 + 32);
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained(v3);
    BOOL v5 = [WeakRetained delegate];
    id v6 = objc_loadWeakRetained(v3);
    uint64_t v7 = ICMediaSourceTypeFromString(v4);

    id v8 = objc_loadWeakRetained(v3);
    BOOL v9 = [v8 mediaBarButtonItem];
    [v5 noteEditorNavigationItemConfiguration:v6 insertMediaWithSourceType:v7 mediaBarButtonItem:v9];
  }
}

void __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMenus];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = objc_loadWeakRetained(v1);
    id v6 = [v9 delegate];
    id v7 = objc_loadWeakRetained(v1);
    id v8 = [v7 mediaBarButtonItem];
    [v6 noteEditorNavigationItemConfiguration:v7 updateSidecarMenuFromMediaBarButtonItem:v8];
  }
}

void __64__ICNoteEditorNavigationItemConfiguration_sidecarMenuController__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained delegate];
  id v7 = objc_loadWeakRetained(v4);
  id v8 = [v7 mediaBarButtonItem];
  [v6 noteEditorNavigationItemConfiguration:v7 insertSidecarItemWithMenuItems:v5 service:a3 mediaBarButtonItem:v8];
}

- (ICTableActionMenu)tableActionMenu
{
  if ([(ICNoteEditorNavigationItemConfiguration *)self isEditingTable])
  {
    objc_initWeak(&location, self);
    id v3 = [ICTableActionMenu alloc];
    id v4 = [(ICNoteEditorNavigationItemConfiguration *)self tableAttachmentViewController];
    id v5 = [(ICNoteEditorNavigationItemConfiguration *)self presentingViewController];
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__ICNoteEditorNavigationItemConfiguration_tableActionMenu__block_invoke;
    v9[3] = &unk_2640B9D80;
    objc_copyWeak(&v10, &location);
    id v7 = [(ICTableActionMenu *)v3 initWithTableAttachmentViewController:v4 presentingViewController:v5 presentingBarButtonItem:v6 completion:v9];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __58__ICNoteEditorNavigationItemConfiguration_tableActionMenu__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v3 = [WeakRetained delegate];
    id v4 = objc_loadWeakRetained(v2);
    id v5 = [v4 tableBarButtonItem];
    [v3 noteEditorNavigationItemConfiguration:v4 startEditingFromBarButtonItem:v5];
  }
}

- (UIMenu)tableBarButtonItemMenu
{
  v2 = [(ICNoteEditorNavigationItemConfiguration *)self tableActionMenu];
  id v3 = [v2 makeMenu];

  return (UIMenu *)v3;
}

- (UIMenu)undoRedoMenu
{
  v24[2] = *MEMORY[0x263EF8340];
  undoRedoMenu = self->_undoRedoMenu;
  if (undoRedoMenu)
  {
    id v3 = undoRedoMenu;
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F823D0];
    id v6 = (void *)MEMORY[0x263F086E0];
    id v7 = self;
    id v8 = [v6 mainBundle];
    id v9 = [v8 localizedStringForKey:@"Undo" value:&stru_26C10E100 table:0];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke;
    v23[3] = &unk_2640B8BA8;
    v23[4] = v7;
    id v10 = objc_msgSend(v5, "ic_actionWithTitle:imageName:handler:", v9, @"arrow.uturn.backward.circle", v23);
    [(ICNoteEditorNavigationItemConfiguration *)v7 setUndoMenuItem:v10];

    id v11 = (void *)MEMORY[0x263F823D0];
    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    id v13 = [v12 localizedStringForKey:@"Redo" value:&stru_26C10E100 table:0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke_2;
    v22[3] = &unk_2640B8BA8;
    v22[4] = v7;
    v14 = objc_msgSend(v11, "ic_actionWithTitle:imageName:handler:", v13, @"arrow.uturn.forward.circle", v22);
    [(ICNoteEditorNavigationItemConfiguration *)v7 setRedoMenuItem:v14];

    BOOL v15 = (void *)MEMORY[0x263F82940];
    id v16 = [(ICNoteEditorNavigationItemConfiguration *)v7 undoMenuItem];
    v24[0] = v16;
    BOOL v17 = [(ICNoteEditorNavigationItemConfiguration *)v7 redoMenuItem];
    v24[1] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    BOOL v19 = [v15 menuWithChildren:v18];
    v20 = self->_undoRedoMenu;
    self->_undoRedoMenu = v19;

    id v3 = self->_undoRedoMenu;
  }

  return v3;
}

void __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 undoBarButtonItem];
  [v1 undoAction:v2];
}

void __55__ICNoteEditorNavigationItemConfiguration_undoRedoMenu__block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 redoBarButtonItem];
  [v1 redoAction:v2];
}

- (UIBarButtonItemGroup)inputAssistantLeadingBarButtonItemGroup
{
  inputAssistantLeadingBarButtonItemGroup = self->_inputAssistantLeadingBarButtonItemGroup;
  if (!inputAssistantLeadingBarButtonItemGroup)
  {
    id v4 = objc_alloc(MEMORY[0x263F824B8]);
    id v5 = (UIBarButtonItemGroup *)[v4 initWithBarButtonItems:MEMORY[0x263EFFA68] representativeItem:0];
    id v6 = self->_inputAssistantLeadingBarButtonItemGroup;
    self->_inputAssistantLeadingBarButtonItemGroup = v5;

    inputAssistantLeadingBarButtonItemGroup = self->_inputAssistantLeadingBarButtonItemGroup;
  }
  id v7 = inputAssistantLeadingBarButtonItemGroup;

  return v7;
}

- (UIBarButtonItemGroup)inputAssistantTrailingBarButtonItemGroup
{
  inputAssistantTrailingBarButtonItemGroup = self->_inputAssistantTrailingBarButtonItemGroup;
  if (!inputAssistantTrailingBarButtonItemGroup)
  {
    id v4 = objc_alloc(MEMORY[0x263F824B8]);
    id v5 = (UIBarButtonItemGroup *)[v4 initWithBarButtonItems:MEMORY[0x263EFFA68] representativeItem:0];
    id v6 = self->_inputAssistantTrailingBarButtonItemGroup;
    self->_inputAssistantTrailingBarButtonItemGroup = v5;

    inputAssistantTrailingBarButtonItemGroup = self->_inputAssistantTrailingBarButtonItemGroup;
  }
  id v7 = inputAssistantTrailingBarButtonItemGroup;

  return v7;
}

- (UIBarButtonItemGroup)styleBarButtonItemGroup
{
  v12[1] = *MEMORY[0x263EF8340];
  styleBarButtonItemGroup = self->_styleBarButtonItemGroup;
  if (!styleBarButtonItemGroup)
  {
    id v4 = (void *)MEMORY[0x263F824B8];
    uint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self hidesDefaultCenterItems] ^ 1;
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self styleBarButtonItem];
    v12[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v8 = [v4 optionalGroupWithCustomizationIdentifier:@"ICNoteEditorViewControllerNavigationBarCustomizationIDChangeStyle" inDefaultCustomization:v5 representativeItem:0 items:v7];
    id v9 = self->_styleBarButtonItemGroup;
    self->_styleBarButtonItemGroup = v8;

    styleBarButtonItemGroup = self->_styleBarButtonItemGroup;
  }
  id v10 = styleBarButtonItemGroup;

  return v10;
}

- (UIBarButtonItemGroup)checklistBarButtonItemGroup
{
  v12[1] = *MEMORY[0x263EF8340];
  checklistBarButtonItemGroup = self->_checklistBarButtonItemGroup;
  if (!checklistBarButtonItemGroup)
  {
    id v4 = (void *)MEMORY[0x263F824B8];
    uint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self hidesDefaultCenterItems] ^ 1;
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self checklistBarButtonItem];
    v12[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v8 = [v4 optionalGroupWithCustomizationIdentifier:@"ICNoteEditorViewControllerNavigationBarCustomizationIDTodo" inDefaultCustomization:v5 representativeItem:0 items:v7];
    id v9 = self->_checklistBarButtonItemGroup;
    self->_checklistBarButtonItemGroup = v8;

    checklistBarButtonItemGroup = self->_checklistBarButtonItemGroup;
  }
  id v10 = checklistBarButtonItemGroup;

  return v10;
}

- (UIBarButtonItemGroup)tableBarButtonItemGroup
{
  v12[1] = *MEMORY[0x263EF8340];
  tableBarButtonItemGroup = self->_tableBarButtonItemGroup;
  if (!tableBarButtonItemGroup)
  {
    id v4 = (void *)MEMORY[0x263F824B8];
    uint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self hidesDefaultCenterItems] ^ 1;
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self tableBarButtonItem];
    v12[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v8 = [v4 optionalGroupWithCustomizationIdentifier:@"ICNoteEditorViewControllerNavigationBarCustomizationIDTable" inDefaultCustomization:v5 representativeItem:0 items:v7];
    id v9 = self->_tableBarButtonItemGroup;
    self->_tableBarButtonItemGroup = v8;

    tableBarButtonItemGroup = self->_tableBarButtonItemGroup;
  }
  id v10 = tableBarButtonItemGroup;

  return v10;
}

- (UIBarButtonItemGroup)mediaBarButtonItemGroup
{
  v12[1] = *MEMORY[0x263EF8340];
  mediaBarButtonItemGroup = self->_mediaBarButtonItemGroup;
  if (!mediaBarButtonItemGroup)
  {
    id v4 = (void *)MEMORY[0x263F824B8];
    uint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self hidesDefaultCenterItems] ^ 1;
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self mediaBarButtonItem];
    v12[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v8 = [v4 optionalGroupWithCustomizationIdentifier:@"ICNoteEditorViewControllerNavigationBarCustomizationIDInsert" inDefaultCustomization:v5 representativeItem:0 items:v7];
    id v9 = self->_mediaBarButtonItemGroup;
    self->_mediaBarButtonItemGroup = v8;

    mediaBarButtonItemGroup = self->_mediaBarButtonItemGroup;
  }
  id v10 = mediaBarButtonItemGroup;

  return v10;
}

- (UIBarButtonItemGroup)writingToolsButtonItemGroup
{
  v12[1] = *MEMORY[0x263EF8340];
  writingToolsButtonItemGroup = self->_writingToolsButtonItemGroup;
  if (!writingToolsButtonItemGroup)
  {
    id v4 = (void *)MEMORY[0x263F824B8];
    uint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self hidesDefaultCenterItems] ^ 1;
    id v6 = [(ICNoteEditorNavigationItemConfiguration *)self writingToolsBarButtonItem];
    v12[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    id v8 = [v4 optionalGroupWithCustomizationIdentifier:@"ICNoteEditorViewControllerNavigationBarCustomizationIDWritingTools" inDefaultCustomization:v5 representativeItem:0 items:v7];
    id v9 = self->_writingToolsButtonItemGroup;
    self->_writingToolsButtonItemGroup = v8;

    writingToolsButtonItemGroup = self->_writingToolsButtonItemGroup;
  }
  id v10 = writingToolsButtonItemGroup;

  return v10;
}

- (void)addNoteAction:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v8 noteEditorNavigationItemConfiguration:self addNoteFromBarButtonItem:v7 event:v6];
}

- (void)backAction:(id)a3
{
  id v4 = [(ICNoteEditorNavigationItemConfiguration *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)writingToolsAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self showWritingToolsFromBarButtonItem:v4];
}

- (void)checklistAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self addChecklistFromBarButtonItem:v4];
}

- (void)closeAuxiliaryWindowAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self closeAuxiliaryWindowFromBarButtonItem:v4];
}

- (void)deleteAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self deleteFromBarButtonItem:v4];
}

- (void)doneAction:(id)a3
{
  id v4 = a3;
  [(ICNoteEditorNavigationItemConfiguration *)self setInlineSketchEditingState:0];
  [(ICNoteEditorNavigationItemConfiguration *)self setEditing:0];
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self doneEditingFromBarButtonItem:v4];
}

- (void)inlineSketchAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICNoteEditorNavigationItemConfiguration *)self inlineSketchEditingState];
  BOOL v6 = v5 != 3;
  if (v5 == 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 3;
  }
  [(ICNoteEditorNavigationItemConfiguration *)self setInlineSketchEditingState:v7];
  [(ICNoteEditorNavigationItemConfiguration *)self setEditing:v6];
  id v8 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v8 noteEditorNavigationItemConfiguration:self inlineSketchFromBarButtonItem:v4];
}

- (void)lockAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self toggleLockFromBarButtonItem:v4];
}

- (void)moveAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self moveFromBarButtonItem:v4];
}

- (void)photoLibraryAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self showPhotoLibraryFromBarButtonItem:v4];
}

- (void)quickNoteAllNotesAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self quickNoteShowAllNotesFromBarButtonItem:v4];
}

- (void)quickNoteCancelAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self quickNoteDidCancelFromBarButtonItem:v4];
}

- (void)quickNoteSaveAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self quickNoteDidSaveFromBarButtonItem:v4];
}

- (void)redoAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self redoFromBarButtonItem:v4];
}

- (void)shareAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self shareFromBarButtonItem:v4];
}

- (void)sidebarAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self toggleSidebarFromBarButtonItem:v4];
}

- (void)styleAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self changeStyleFromBarButtonItem:v4];
}

- (void)tableAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self addTableFromBarButtonItem:v4];
}

- (void)undoAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorNavigationItemConfiguration *)self delegate];
  [v5 noteEditorNavigationItemConfiguration:self undoFromBarButtonItem:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICNoteEditorNavigationItemConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = [(ICNoteEditorNavigationItemConfiguration *)self hash];
    BOOL v7 = v6 == [(ICNoteEditorNavigationItemConfiguration *)v5 hash];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setDataSource:(id)a3
{
}

- (ICNoteEditorNavigationItemConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteEditorNavigationItemConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canCustomizeCenterItems
{
  return self->_canCustomizeCenterItems;
}

- (void)setUsesMediaMenu:(BOOL)a3
{
  self->_usesMediaMenu = a3;
}

- (void)setMediaActionMenu:(id)a3
{
}

- (void)setSidecarMenuController:(id)a3
{
}

- (void)setPillOrnamentViewController:(id)a3
{
}

- (void)setTableActionMenu:(id)a3
{
}

- (void)setCustomBackBarButtonItem:(id)a3
{
}

- (void)setMediaBarButtonItem:(id)a3
{
}

- (void)setShareBarButtonItem:(id)a3
{
}

- (void)setStyleBarButtonItem:(id)a3
{
}

- (void)setAddNoteBarButtonItem:(id)a3
{
}

- (void)setWritingToolsBarButtonItem:(id)a3
{
}

- (void)setChecklistBarButtonItem:(id)a3
{
}

- (void)setCloseAuxiliaryWindowBarButtonItem:(id)a3
{
}

- (void)setDeleteBarButtonItem:(id)a3
{
}

- (void)setDoneBarButtonItem:(id)a3
{
}

- (void)setInlineSketchBarButtonItem:(id)a3
{
}

- (void)setLockBarButtonItem:(id)a3
{
}

- (void)setMoveBarButtonItem:(id)a3
{
}

- (void)setQuickNoteAllNotesBarButtonItem:(id)a3
{
}

- (void)setQuickNoteCancelBarButtonItem:(id)a3
{
}

- (void)setQuickNoteSaveBarButtonItem:(id)a3
{
}

- (void)setRedoBarButtonItem:(id)a3
{
}

- (void)setSidebarButtonItem:(id)a3
{
}

- (void)setTableBarButtonItem:(id)a3
{
}

- (void)setUndoBarButtonItem:(id)a3
{
}

- (void)setVerticalSeparatorBarButtonItem:(id)a3
{
}

- (void)setInputAssistantLeadingBarButtonItemGroup:(id)a3
{
}

- (void)setInputAssistantTrailingBarButtonItemGroup:(id)a3
{
}

- (void)setPinnedTrailingBarButtonItemGroup:(id)a3
{
}

- (void)setStyleBarButtonItemGroup:(id)a3
{
}

- (void)setChecklistBarButtonItemGroup:(id)a3
{
}

- (void)setTableBarButtonItemGroup:(id)a3
{
}

- (void)setMediaBarButtonItemGroup:(id)a3
{
}

- (void)setWritingToolsButtonItemGroup:(id)a3
{
}

- (void)setInlineSketchAnimationSelectorDelayer:(id)a3
{
}

- (void)setUndoRedoMenu:(id)a3
{
}

- (void)setUndoMenuItem:(id)a3
{
}

- (void)setRedoMenuItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoMenuItem, 0);
  objc_storeStrong((id *)&self->_undoMenuItem, 0);
  objc_storeStrong((id *)&self->_undoRedoMenu, 0);
  objc_storeStrong((id *)&self->_inlineSketchAnimationSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_writingToolsButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_mediaBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_tableBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_checklistBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_styleBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_pinnedTrailingBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_inputAssistantTrailingBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_inputAssistantLeadingBarButtonItemGroup, 0);
  objc_storeStrong((id *)&self->_verticalSeparatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_undoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarButtonItem, 0);
  objc_storeStrong((id *)&self->_redoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteSaveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteCancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_quickNoteAllNotesBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_lockBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inlineSketchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_closeAuxiliaryWindowBarButtonItem, 0);
  objc_storeStrong((id *)&self->_checklistBarButtonItem, 0);
  objc_storeStrong((id *)&self->_writingToolsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_styleBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_mediaBarButtonItem, 0);
  objc_storeStrong((id *)&self->_customBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tableActionMenu, 0);
  objc_storeStrong((id *)&self->_pillOrnamentViewController, 0);
  objc_storeStrong((id *)&self->_sidecarMenuController, 0);
  objc_storeStrong((id *)&self->_mediaActionMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end