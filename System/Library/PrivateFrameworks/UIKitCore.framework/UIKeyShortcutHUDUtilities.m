@interface UIKeyShortcutHUDUtilities
@end

@implementation UIKeyShortcutHUDUtilities

void __40___UIKeyShortcutHUDUtilities_searchIcon__block_invoke()
{
  v0 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleBody"];
  v1 = [off_1E52D39B8 systemFontOfSize:14.0 weight:*(double *)off_1E52D6BF0];
  id v5 = [v0 scaledFontForFont:v1];

  v2 = +[UIImageSymbolConfiguration configurationWithFont:v5 scale:3];
  uint64_t v3 = +[UIImage systemImageNamed:@"magnifyingglass" withConfiguration:v2];
  v4 = (void *)_MergedGlobals_1336[0];
  _MergedGlobals_1336[0] = v3;
}

void __56___UIKeyShortcutHUDUtilities_searchIconAttributedString__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28B18];
  +[_UIKeyShortcutHUDUtilities searchIcon]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [off_1E52D2EB0 textAttachmentWithImage:v4];
  uint64_t v2 = [v0 attributedStringWithAttachment:v1];
  uint64_t v3 = (void *)qword_1EB265480;
  qword_1EB265480 = v2;
}

void __67___UIKeyShortcutHUDUtilities_modifiersAttributedStringForShortcut___block_invoke()
{
  v0 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v1 = [v0 keyShortcutModifiersFont];
  id v32 = +[UIImageSymbolConfiguration configurationWithFont:v1 scale:1];

  v31 = +[UIImage systemImageNamed:@"control" withConfiguration:v32];
  uint64_t v2 = +[UIImage systemImageNamed:@"option" withConfiguration:v32];
  uint64_t v3 = +[UIImage systemImageNamed:@"shift" withConfiguration:v32];
  id v4 = +[UIImage systemImageNamed:@"command" withConfiguration:v32];
  id v5 = +[UIImage systemImageNamed:@"globe" withConfiguration:v32];
  v6 = +[UIImage systemImageNamed:@"fn" withConfiguration:v32];
  v7 = (void *)MEMORY[0x1E4F28B18];
  v8 = [off_1E52D2EB0 textAttachmentWithImage:v31];
  uint64_t v9 = [v7 attributedStringWithAttachment:v8];
  v10 = (void *)qword_1EB265490;
  qword_1EB265490 = v9;

  v11 = (void *)MEMORY[0x1E4F28B18];
  v12 = [off_1E52D2EB0 textAttachmentWithImage:v2];
  uint64_t v13 = [v11 attributedStringWithAttachment:v12];
  v14 = (void *)qword_1EB265498;
  qword_1EB265498 = v13;

  v15 = (void *)MEMORY[0x1E4F28B18];
  v16 = [off_1E52D2EB0 textAttachmentWithImage:v3];
  uint64_t v17 = [v15 attributedStringWithAttachment:v16];
  v18 = (void *)qword_1EB2654A0;
  qword_1EB2654A0 = v17;

  v19 = (void *)MEMORY[0x1E4F28B18];
  v20 = [off_1E52D2EB0 textAttachmentWithImage:v4];
  uint64_t v21 = [v19 attributedStringWithAttachment:v20];
  v22 = (void *)qword_1EB2654A8;
  qword_1EB2654A8 = v21;

  v23 = (void *)MEMORY[0x1E4F28B18];
  v24 = [off_1E52D2EB0 textAttachmentWithImage:v5];
  uint64_t v25 = [v23 attributedStringWithAttachment:v24];
  v26 = (void *)qword_1EB2654B0;
  qword_1EB2654B0 = v25;

  v27 = (void *)MEMORY[0x1E4F28B18];
  v28 = [off_1E52D2EB0 textAttachmentWithImage:v6];
  uint64_t v29 = [v27 attributedStringWithAttachment:v28];
  v30 = (void *)qword_1EB2654B8;
  qword_1EB2654B8 = v29;
}

void __103___UIKeyShortcutHUDUtilities_inputAttributedStringForShortcut_outShouldStyleAsSingleCharacterOrSymbol___block_invoke()
{
  v12[10] = *MEMORY[0x1E4F143B8];
  v0 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v1 = [v0 keyShortcutInputSymbolFont];
  uint64_t v2 = +[UIImageSymbolConfiguration configurationWithFont:v1 scale:1];
  uint64_t v3 = (void *)qword_1EB2654C8;
  qword_1EB2654C8 = v2;

  v11[0] = @"UIKeyInputUpArrow";
  v11[1] = @"UIKeyInputDownArrow";
  v12[0] = @"arrow.up";
  v12[1] = @"arrow.down";
  v11[2] = @"UIKeyInputLeftArrow";
  v11[3] = @"UIKeyInputRightArrow";
  v12[2] = @"arrow.left";
  v12[3] = @"arrow.right";
  v11[4] = @"UIKeyInputEscape";
  v11[5] = @"\b";
  v12[4] = @"escape";
  v12[5] = @"delete.left";
  v11[6] = @"\t";
  v11[7] = @"\n";
  v12[6] = @"arrow.right.to.line";
  v12[7] = @"return.left";
  v11[8] = @"\r";
  v11[9] = @"⌅";
  v12[8] = @"return.left";
  v12[9] = @"projective";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:10];
  id v5 = (void *)qword_1EB2654D0;
  qword_1EB2654D0 = v4;

  v9[0] = @"\b";
  v9[1] = @"\t";
  v10[0] = @"delete.right";
  v10[1] = @"arrow.left.to.line";
  v9[2] = @"\n";
  v9[3] = @"\r";
  v10[2] = @"return.right";
  v10[3] = @"return.right";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v7 = (void *)qword_1EB2654D8;
  qword_1EB2654D8 = v6;

  v8 = (void *)qword_1EB2654E0;
  qword_1EB2654E0 = (uint64_t)&unk_1ED3F7CF8;
}

@end