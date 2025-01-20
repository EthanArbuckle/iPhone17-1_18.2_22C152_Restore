@interface _UIMainMenuSystem
+ (_UIMainMenuSystem)_sharedSystem;
- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6;
- (NSArray)_keyCommands;
- (UIMenu)_rootMenu;
- (id)_defaultRootMenuChildren;
- (id)_init;
- (void)_automaticallyRebuildIfNeeded;
- (void)_setInitialBuildingResponder:(id)a3;
- (void)dealloc;
- (void)setNeedsRebuild;
@end

@implementation _UIMainMenuSystem

- (id)_init
{
  v3 = [(_UIMainMenuSystem *)self _defaultRootMenuChildren];
  v6.receiver = self;
  v6.super_class = (Class)_UIMainMenuSystem;
  v4 = [(UIMenuSystem *)&v6 initWithRootMenuChildren:v3];

  return v4;
}

- (id)_defaultRootMenuChildren
{
  v120[7] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _supportsMenuActions])
  {
    uint64_t v2 = MEMORY[0x1E4F1CBF0];
    v99 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.about" children:MEMORY[0x1E4F1CBF0]];
    v119[0] = v99;
    v98 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.preferences" children:v2];
    v119[1] = v98;
    v97 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.services" children:v2];
    v119[2] = v97;
    v96 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.hide" children:v2];
    v119[3] = v96;
    v94 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.quit" children:v2];
    v119[4] = v94;
    v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:5];
    v92 = +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", @"com.apple.menu.application");
    v120[0] = v92;
    v91 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.new-scene" children:v2];
    v118[0] = v91;
    int v90 = [(id)UIApp _supportsOpenCommand];
    if (v90)
    {
      v19 = +[UICommand _defaultCommandForAction:sel_open_];
      v117 = v19;
      uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
    }
    v89 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.open" children:v2];
    v118[1] = v89;
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    v88 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.close" children:MEMORY[0x1E4F1CBF0]];
    v118[2] = v88;
    int v87 = [(id)UIApp _supportsPrintCommand];
    v95 = (void *)v2;
    if (v87)
    {
      v18 = +[UICommand _defaultCommandForAction:sel_print_];
      v116 = v18;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    }
    else
    {
      uint64_t v5 = v4;
    }
    v20 = (void *)v5;
    v86 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.print" children:v5];
    v118[3] = v86;
    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:4];
    v84 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.file" children:v85];
    v120[1] = v84;
    v83 = +[UICommand _defaultCommandForAction:sel_undo_];
    v114[0] = v83;
    v82 = +[UICommand _defaultCommandForAction:sel_redo_];
    v114[1] = v82;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
    v80 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.undo-redo" children:v81];
    v115[0] = v80;
    v79 = +[UICommand _defaultCommandForAction:sel_cut_];
    v113[0] = v79;
    v78 = +[UICommand _defaultCommandForAction:sel_copy_];
    v113[1] = v78;
    v77 = +[UICommand _defaultCommandForAction:sel_paste_];
    v113[2] = v77;
    v76 = +[UICommand _defaultCommandForAction:sel_pasteAndMatchStyle_];
    v113[3] = v76;
    v75 = +[UICommand _defaultCommandForAction:sel_delete_];
    v113[4] = v75;
    v74 = +[UICommand _defaultCommandForAction:sel_selectAll_];
    v113[5] = v74;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:6];
    v72 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.standard-edit" children:v73];
    v115[1] = v72;
    int v6 = dyld_program_sdk_at_least();
    v71 = +[UICommand _defaultCommandForAction:sel_find_];
    v112[0] = v71;
    v70 = +[UICommand _defaultCommandForAction:sel_findAndReplace_];
    v112[1] = v70;
    v69 = +[UICommand _defaultCommandForAction:sel_findNext_];
    v112[2] = v69;
    v68 = +[UICommand _defaultCommandForAction:sel_findPrevious_];
    v112[3] = v68;
    v67 = +[UICommand _defaultCommandForAction:sel_useSelectionForFind_];
    v112[4] = v67;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:5];
    v66 = (void *)v7;
    if (v6) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v4;
    }
    v65 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.find" children:v8];
    v115[2] = v65;
    v64 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.spelling-panel" children:v4];
    v111[0] = v64;
    v63 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.spelling-options" children:v4];
    v111[1] = v63;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
    v61 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.spelling" children:v62];
    v115[3] = v61;
    v60 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.substitutions-panel" children:v4];
    v110[0] = v60;
    v59 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.substitution-options" children:v4];
    v110[1] = v59;
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
    v57 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.substitutions" children:v58];
    v115[4] = v57;
    v56 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.transformations" children:v4];
    v115[5] = v56;
    v55 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.command.speech" children:v4];
    v115[6] = v55;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:7];
    v53 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.edit" children:v54];
    v120[2] = v53;
    v52 = +[UICommand _defaultCommandForAction:sel_toggleBoldface_];
    v107[0] = v52;
    v51 = +[UICommand _defaultCommandForAction:sel_toggleItalics_];
    v107[1] = v51;
    v50 = +[UICommand _defaultCommandForAction:sel_toggleUnderline_];
    v107[2] = v50;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
    v48 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.text-style" children:v49];
    v108[0] = v48;
    v47 = +[UICommand _defaultCommandForAction:sel_increaseSize_];
    v106[0] = v47;
    v46 = +[UICommand _defaultCommandForAction:sel_decreaseSize_];
    v106[1] = v46;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
    v44 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.text-size" children:v45];
    v108[1] = v44;
    v43 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.text-color" children:v4];
    v108[2] = v43;
    v42 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.text-style-pasteboard" children:v4];
    v108[3] = v42;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:4];
    v40 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.font" children:v41];
    v109[0] = v40;
    v39 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.alignment" children:v4];
    v105[0] = v39;
    v38 = +[UICommand _defaultCommandForAction:sel_makeTextWritingDirectionNatural_];
    v104[0] = v38;
    v37 = +[UICommand _defaultCommandForAction:sel_makeTextWritingDirectionRightToLeft_];
    v104[1] = v37;
    v36 = +[UICommand _defaultCommandForAction:sel_makeTextWritingDirectionLeftToRight_];
    v104[2] = v36;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];
    v34 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.writing-direction" children:v35];
    v105[1] = v34;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
    v32 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.text" children:v33];
    v109[1] = v32;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
    v30 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.format" children:v31];
    v120[3] = v30;
    v29 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.toolbar" children:v4];
    v103[0] = v29;
    v28 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.view-orientation" children:v4];
    v103[1] = v28;
    v27 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.view-sizing" children:v4];
    v103[2] = v27;
    v26 = +[UICommand _defaultCommandForAction:sel_toggleSidebar_];
    v102 = v26;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    v24 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.sidebar" children:v25];
    v103[3] = v24;
    v23 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.fullscreen" children:v4];
    v103[4] = v23;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:5];
    v21 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.view" children:v22];
    v120[4] = v21;
    v9 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.minimize-and-zoom" children:v4];
    v101[0] = v9;
    v10 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.bring-all-to-front" children:v4];
    v101[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
    v12 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.window" children:v11];
    v120[5] = v12;
    v13 = +[UICommand _defaultCommandForAction:sel_showHelp_];
    v14 = [v13 _nonRepeatableKeyCommand];
    v100 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    v16 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.help" children:v15];
    v120[6] = v16;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:7];

    if (v87)
    {
    }
    if (v90)
    {
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)setNeedsRebuild
{
  automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
  self->_automaticallyRebuildingBuilder = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIMainMenuSystem;
  [(UIMenuSystem *)&v4 setNeedsRebuild];
}

+ (_UIMainMenuSystem)_sharedSystem
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___UIMainMenuSystem__sharedSystem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_3_1 != -1) {
    dispatch_once(&_MergedGlobals_3_1, block);
  }
  uint64_t v2 = (void *)qword_1EB25CB18;
  return (_UIMainMenuSystem *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_UIMainMenuSystem;
  [(_UIMainMenuSystem *)&v2 dealloc];
}

- (void)_automaticallyRebuildIfNeeded
{
  if (!self->_automaticallyRebuildingBuilder)
  {
    id v8 = (id)UIApp;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initialBuildingResponderOverride);

    if (WeakRetained)
    {
      id v4 = objc_loadWeakRetained((id *)&self->_initialBuildingResponderOverride);

      id v5 = v4;
    }
    else
    {
      id v5 = v8;
    }
    id v9 = v5;
    int v6 = -[UIMenuSystem _newBuilderFromResponderChain:atLocation:inCoordinateSpace:](self, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v5, 0, NAN, NAN);
    automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
    self->_automaticallyRebuildingBuilder = v6;
  }
}

- (NSArray)_keyCommands
{
  [(_UIMainMenuSystem *)self _automaticallyRebuildIfNeeded];
  automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
  return [(_UIMenuBuilder *)automaticallyRebuildingBuilder _keyCommands];
}

- (UIMenu)_rootMenu
{
  [(_UIMainMenuSystem *)self _automaticallyRebuildIfNeeded];
  automaticallyRebuildingBuilder = self->_automaticallyRebuildingBuilder;
  return (UIMenu *)[(_UIMenuBuilder *)automaticallyRebuildingBuilder menuForIdentifier:@"com.apple.menu.root"];
}

- (void)_setInitialBuildingResponder:(id)a3
{
  objc_storeWeak((id *)&self->_initialBuildingResponderOverride, a3);
  [(_UIMainMenuSystem *)self setNeedsRebuild];
}

- (BOOL)_buildMenuWithBuilder:(id)a3 fromResponderChain:(id)a4 atLocation:(CGPoint)a5 inCoordinateSpace:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_UIMainMenuSystem;
  LODWORD(v12) = -[UIMenuSystem _buildMenuWithBuilder:fromResponderChain:atLocation:inCoordinateSpace:](&v62, sel__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace_, v11, a4, a6, x, y);
  v13 = [v11 menuForIdentifier:@"com.apple.menu.sidebar"];
  v14 = [v11 menuForIdentifier:@"com.apple.menu.fullscreen"];
  if (!v12) {
    goto LABEL_17;
  }
  if (v13)
  {
    v15 = [v13 children];
    if ([v15 count] == 1)
    {
      char v58 = (char)v12;
      v16 = [v13 children];
      v17 = [v16 firstObject];
      v12 = self;
      if (objc_opt_isKindOfClass())
      {
        [v13 children];
        v54 = v13;
        v18 = v56 = v14;
        [v18 firstObject];
        v20 = v19 = v16;
        BOOL v21 = [v20 action] == (void)sel_toggleSidebar_;

        v16 = v19;
        v13 = v54;
        v14 = v56;
      }
      else
      {
        BOOL v21 = 0;
      }

      LOBYTE(v12) = v58;
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }
  v22 = v13;
  if (v14)
  {
    v23 = v14;
    v24 = [v14 children];
    BOOL v25 = [v24 count] == 0;
  }
  else
  {
    v23 = 0;
    BOOL v25 = 0;
  }
  BOOL v26 = v21;
  v27 = [v11 _parentOfMenuForIdentifier:@"com.apple.menu.sidebar" commandForIdentifier:0];
  v28 = [v11 _parentOfMenuForIdentifier:@"com.apple.menu.fullscreen" commandForIdentifier:0];
  int v29 = [v27 isEqualToString:v28];
  if (!v26)
  {

    v14 = v23;
    v13 = v22;
    goto LABEL_19;
  }
  int v30 = v25 & v29;

  BOOL v31 = v30 == 1;
  v14 = v23;
  v13 = v22;
  if (v31)
  {
LABEL_17:
    [v11 removeMenuForIdentifier:@"com.apple.menu.sidebar"];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __91___UIMainMenuSystem__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace___block_invoke;
    v60[3] = &unk_1E52DAF40;
    id v61 = v13;
    [v11 replaceChildrenOfMenuForIdentifier:@"com.apple.menu.fullscreen" fromChildrenBlock:v60];
    v27 = v61;
LABEL_19:
  }
  v32 = [v11 menuForIdentifier:@"com.apple.menu.edit"];
  if (v32)
  {
    v33 = [v11 _parentOfMenuForIdentifier:@"com.apple.menu.edit" commandForIdentifier:0];
    if (![v33 isEqualToString:@"com.apple.menu.root"])
    {
LABEL_33:

      goto LABEL_34;
    }
    v57 = v14;
    char v59 = (char)v12;
    v34 = (void *)MEMORY[0x1E4F1CAD0];
    v35 = [v11 _keyCommands];
    v36 = [v34 setWithArray:v35];

    v53 = [MEMORY[0x1E4F1CA48] array];
    v12 = +[UICommand _defaultCommandForAction:sel_startDictation_];
    v37 = +[UICommand _defaultCommandForAction:sel_orderFrontCharacterPalette_];
    v55 = +[UICommand _defaultCommandForAction:sel__handleLegacyEmojiKeyboardShortcut_];
    uint64_t v38 = [v12 action];
    v39 = [v12 propertyList];
    v40 = [v11 commandForAction:v38 propertyList:v39];
    v52 = v36;
    if (v40)
    {
    }
    else
    {
      char v41 = [v36 containsObject:v12];

      if ((v41 & 1) == 0) {
        [v53 addObject:v12];
      }
    }
    uint64_t v42 = [v37 action];
    v43 = [v37 propertyList];
    v44 = [v11 commandForAction:v42 propertyList:v43];
    if (v44)
    {
    }
    else
    {
      uint64_t v45 = [v55 action];
      v46 = [v55 propertyList];
      v47 = [v11 commandForAction:v45 propertyList:v46];
      if (!v47 && ([v52 containsObject:v37] & 1) == 0)
      {
        char v51 = [v52 containsObject:v55];

        v48 = v52;
        if ((v51 & 1) == 0)
        {
          [v53 addObject:v37];
          [v53 addObject:v55];
        }
        goto LABEL_32;
      }
    }
    v48 = v52;
LABEL_32:
    v49 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.dictation-emoji" children:v53];
    [v11 insertChildMenu:v49 atEndOfMenuForIdentifier:@"com.apple.menu.edit"];

    LOBYTE(v12) = v59;
    v14 = v57;
    goto LABEL_33;
  }
LABEL_34:

  return (char)v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_initialBuildingResponderOverride);
  objc_storeStrong((id *)&self->_automaticallyRebuildingBuilder, 0);
}

@end