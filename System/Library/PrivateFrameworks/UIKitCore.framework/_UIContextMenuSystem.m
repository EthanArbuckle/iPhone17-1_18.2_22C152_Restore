@interface _UIContextMenuSystem
+ (_UIContextMenuSystem)_sharedSystem;
- (id)_defaultRootMenuChildren;
- (id)_init;
@end

@implementation _UIContextMenuSystem

+ (_UIContextMenuSystem)_sharedSystem
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___UIContextMenuSystem__sharedSystem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1158 != -1) {
    dispatch_once(&_MergedGlobals_1158, block);
  }
  v2 = (void *)qword_1EB261DF0;
  return (_UIContextMenuSystem *)v2;
}

- (id)_init
{
  v3 = [(_UIContextMenuSystem *)self _defaultRootMenuChildren];
  v6.receiver = self;
  v6.super_class = (Class)_UIContextMenuSystem;
  v4 = [(UIMenuSystem *)&v6 initWithRootMenuChildren:v3];

  return v4;
}

- (id)_defaultRootMenuChildren
{
  v68[6] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _supportsMenuActions])
  {
    v2 = +[UIDevice currentDevice];
    uint64_t v3 = [v2 userInterfaceIdiom];

    if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ([(id)UIApp _appAdoptsUICanvasLifecycle]) {
        int v56 = 1;
      }
      else {
        int v56 = [(id)UIApp _appAdoptsUISceneLifecycle];
      }
    }
    else
    {
      int v56 = 0;
    }
    v5 = +[UICommand _defaultCommandForAction:sel_cut_];
    v68[0] = v5;
    objc_super v6 = +[UICommand _defaultCommandForAction:sel_copy_];
    v68[1] = v6;
    v7 = +[UICommand _defaultCommandForAction:sel_paste_];
    v68[2] = v7;
    v8 = +[UICommand _defaultCommandForAction:sel_delete_];
    v68[3] = v8;
    v9 = +[UICommand _defaultCommandForAction:sel_select_];
    v68[4] = v9;
    v10 = +[UICommand _defaultCommandForAction:sel_selectAll_];
    v68[5] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:6];
    v12 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.standard-edit" children:v11];

    [v12 setPreferredElementSize:1];
    v55 = v12;
    v67[0] = v12;
    v54 = +[UICommand _defaultCommandForAction:sel_promptForReplace_];
    v66[0] = v54;
    v53 = +[UICommand _defaultCommandForAction:sel_transliterateChinese_];
    v66[1] = v53;
    v52 = +[UICommand _defaultCommandForAction:sel__insertDrawing_];
    v66[2] = v52;
    v51 = +[UICommand _defaultCommandForAction:sel_showWritingTools_];
    v66[3] = v51;
    v13 = (void *)MEMORY[0x1E4F1CBF0];
    v50 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.insert-from-external-sources" children:MEMORY[0x1E4F1CBF0]];
    v65[0] = v50;
    v49 = +[UICommand _defaultCommandForAction:sel_captureTextFromCamera_];
    v65[1] = v49;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    v47 = +[UIMenu _defaultMenuWithIdentifier:children:](UIMenu, "_defaultMenuWithIdentifier:children:", @"com.apple.menu.autofill");
    v66[4] = v47;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:5];
    v45 = +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", @"com.apple.menu.replace");
    v67[1] = v45;
    if (v56)
    {
      v23 = +[UICommand _defaultCommandForAction:sel__openInNewCanvas_];
      v64 = v23;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    }
    v44 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.open" children:v13];
    v67[2] = v44;
    v43 = +[UICommand _defaultCommandForAction:sel_toggleBoldface_];
    v62[0] = v43;
    v42 = +[UICommand _defaultCommandForAction:sel_toggleItalics_];
    v62[1] = v42;
    v41 = +[UICommand _defaultCommandForAction:sel_toggleUnderline_];
    v62[2] = v41;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
    v39 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.text-style" children:v40];
    v63[0] = v39;
    v38 = +[UICommand _defaultCommandForAction:sel_makeTextWritingDirectionRightToLeft_];
    v61[0] = v38;
    v37 = +[UICommand _defaultCommandForAction:sel_makeTextWritingDirectionLeftToRight_];
    v61[1] = v37;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    v35 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.writing-direction" children:v36];
    v63[1] = v35;
    v34 = +[UICommand _defaultCommandForAction:sel__showTextFormattingOptions_];
    v63[2] = v34;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
    v32 = +[UIMenu _defaultMenuWithIdentifier:@"com.apple.menu.format" children:v33];
    v67[3] = v32;
    v31 = +[UICommand _defaultCommandForAction:sel_findSelected_];
    v60[0] = v31;
    v30 = +[UICommand _defaultCommandForAction:sel__define_];
    v60[1] = v30;
    v29 = +[UICommand _defaultCommandForAction:sel__translate_];
    v60[2] = v29;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    v27 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.lookup" children:v28];
    v67[4] = v27;
    v26 = +[UICommand _defaultCommandForAction:sel_addShortcut_];
    v59 = v26;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    v24 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.learn" children:v25];
    v67[5] = v24;
    v14 = +[UICommand _defaultCommandForAction:sel__accessibilitySpeak_];
    v58[0] = v14;
    v15 = +[UICommand _defaultCommandForAction:sel__accessibilitySpeakLanguageSelection_];
    v58[1] = v15;
    v16 = +[UICommand _defaultCommandForAction:sel__accessibilityPauseSpeaking_];
    v58[2] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
    v18 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.command.speech" children:v17];
    v67[6] = v18;
    v19 = +[UICommand _defaultCommandForAction:sel_share_];
    v57 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    v21 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.share" children:v20];
    v67[7] = v21;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:8];

    if (v56)
    {
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

@end