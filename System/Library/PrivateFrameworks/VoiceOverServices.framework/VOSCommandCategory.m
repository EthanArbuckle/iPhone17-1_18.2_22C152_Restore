@interface VOSCommandCategory
+ (BOOL)categories:(id)a3 containsCommand:(id)a4;
+ (NSArray)allCategories;
+ (VOSCommandCategory)advancedNavigation;
+ (VOSCommandCategory)basicNavigation;
+ (VOSCommandCategory)braille;
+ (VOSCommandCategory)brailleScreenInput;
+ (VOSCommandCategory)editing;
+ (VOSCommandCategory)handwriting;
+ (VOSCommandCategory)interaction;
+ (VOSCommandCategory)internalOnly;
+ (VOSCommandCategory)other;
+ (VOSCommandCategory)output;
+ (VOSCommandCategory)rotor;
+ (VOSCommandCategory)scrolling;
+ (VOSCommandCategory)speechAndAudio;
+ (VOSCommandCategory)system;
+ (VOSCommandCategory)textNavigation;
+ (VOSCommandCategory)voiceOverFeatures;
- (BOOL)containsCommand:(id)a3;
- (NSArray)commands;
- (NSString)localizedCategoryName;
- (VOSCommandCategory)init;
- (VOSCommandCategory)initWithCommands:(id)a3 localizedCategoryName:(id)a4;
- (void)setCommands:(id)a3;
- (void)setLocalizedCategoryName:(id)a3;
@end

@implementation VOSCommandCategory

+ (VOSCommandCategory)interaction
{
  v12[5] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand PrimaryActivate];
  v3 = +[VOSCommand SecondaryActivate];
  v12[1] = v3;
  v4 = +[VOSCommand MagicTap];
  v12[2] = v4;
  v5 = +[VOSCommand Escape];
  v12[3] = v5;
  v6 = +[VOSCommand PerformLongPress];
  v12[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];

  v8 = [VOSCommandCategory alloc];
  v9 = VOSLocString(@"VOSCommandCategory.Interaction");
  v10 = [(VOSCommandCategory *)v8 initWithCommands:v7 localizedCategoryName:v9];

  return v10;
}

+ (VOSCommandCategory)basicNavigation
{
  v27[17] = *MEMORY[0x263EF8340];
  v26 = +[VOSCommand MoveToPreviousElement];
  v27[0] = v26;
  v25 = +[VOSCommand MoveToNextElement];
  v27[1] = v25;
  v24 = +[VOSCommand MoveToFirstElement];
  v27[2] = v24;
  v23 = +[VOSCommand MoveToElementAbove];
  v27[3] = v23;
  v22 = +[VOSCommand MoveToElementBelow];
  v27[4] = v22;
  v21 = +[VOSCommand MoveToLastElement];
  v27[5] = v21;
  v20 = +[VOSCommand MoveToCenterElement];
  v27[6] = v20;
  v19 = +[VOSCommand MoveToPreviousContainer];
  v27[7] = v19;
  v18 = +[VOSCommand MoveToNextContainer];
  v27[8] = v18;
  v2 = +[VOSCommand MoveToTopOfCurrentContainer];
  v27[9] = v2;
  v3 = +[VOSCommand MoveToBottomOfCurrentContainer];
  v27[10] = v3;
  v4 = +[VOSCommand MoveToTopOfCurrentDocument];
  v27[11] = v4;
  v5 = +[VOSCommand MoveToBottomOfCurrentDocument];
  v27[12] = v5;
  v6 = +[VOSCommand MoveToLinkedUI];
  v27[13] = v6;
  v7 = +[VOSCommand MoveToStatusBar];
  v27[14] = v7;
  v8 = +[VOSCommand MoveToPreviousElementCommunity];
  v27[15] = v8;
  v9 = +[VOSCommand MoveToNextElementCommunity];
  v27[16] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:17];

  if (_os_feature_enabled_impl())
  {
    v11 = +[VOSCommand MoveIn];
    v12 = [v10 arrayByAddingObject:v11];

    v13 = +[VOSCommand MoveOut];
    v10 = [v12 arrayByAddingObject:v13];
  }
  v14 = [VOSCommandCategory alloc];
  v15 = VOSLocString(@"VOSCommandCategory.BasicNavigation");
  v16 = [(VOSCommandCategory *)v14 initWithCommands:v10 localizedCategoryName:v15];

  return v16;
}

+ (VOSCommandCategory)textNavigation
{
  v35[28] = *MEMORY[0x263EF8340];
  v34 = +[VOSCommand MoveToPreviousCharacter];
  v35[0] = v34;
  v33 = +[VOSCommand MoveToNextCharacter];
  v35[1] = v33;
  v32 = +[VOSCommand MoveToPreviousWord];
  v35[2] = v32;
  v31 = +[VOSCommand MoveToNextWord];
  v35[3] = v31;
  v30 = +[VOSCommand MoveToPreviousSentence];
  v35[4] = v30;
  v29 = +[VOSCommand MoveToNextSentence];
  v35[5] = v29;
  v28 = +[VOSCommand MoveToPreviousParagraph];
  v35[6] = v28;
  v27 = +[VOSCommand MoveToNextParagraph];
  v35[7] = v27;
  v26 = +[VOSCommand MoveToPreviousStyleChange];
  v35[8] = v26;
  v25 = +[VOSCommand MoveToNextStyleChange];
  v35[9] = v25;
  v24 = +[VOSCommand MoveToPreviousFontChange];
  v35[10] = v24;
  v23 = +[VOSCommand MoveToNextFontChange];
  v35[11] = v23;
  v22 = +[VOSCommand MoveToPreviousUnderlineText];
  v35[12] = v22;
  v21 = +[VOSCommand MoveToNextUnderlineText];
  v35[13] = v21;
  v20 = +[VOSCommand MoveToPreviousItalicText];
  v35[14] = v20;
  v19 = +[VOSCommand MoveToNextItalicText];
  v35[15] = v19;
  v18 = +[VOSCommand MoveToPreviousBoldText];
  v35[16] = v18;
  v16 = +[VOSCommand MoveToNextBoldText];
  v35[17] = v16;
  v2 = +[VOSCommand MoveToPreviousColorChange];
  v35[18] = v2;
  v3 = +[VOSCommand MoveToNextColorChange];
  v35[19] = v3;
  v4 = +[VOSCommand MoveToPreviousPlainText];
  v35[20] = v4;
  v5 = +[VOSCommand MoveToNextPlainText];
  v35[21] = v5;
  v6 = +[VOSCommand MoveToPreviousMisspelledWord];
  v35[22] = v6;
  v7 = +[VOSCommand MoveToNextMisspelledWord];
  v35[23] = v7;
  v8 = +[VOSCommand MoveToPreviousBlockquote];
  v35[24] = v8;
  v9 = +[VOSCommand MoveToNextBlockquote];
  v35[25] = v9;
  v10 = +[VOSCommand MoveToPreviousSameBlockquote];
  v35[26] = v10;
  v11 = +[VOSCommand MoveToNextSameBlockquote];
  v35[27] = v11;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:28];

  v12 = [VOSCommandCategory alloc];
  v13 = VOSLocString(@"VOSCommandCategory.TextNavigation");
  v14 = [(VOSCommandCategory *)v12 initWithCommands:v17 localizedCategoryName:v13];

  return v14;
}

+ (VOSCommandCategory)editing
{
  v12[5] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand Cut];
  v3 = +[VOSCommand Copy];
  v12[1] = v3;
  v4 = +[VOSCommand Paste];
  v12[2] = v4;
  v5 = +[VOSCommand Undo];
  v12[3] = v5;
  v6 = +[VOSCommand Redo];
  v12[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];

  v8 = [VOSCommandCategory alloc];
  v9 = VOSLocString(@"VOSCommandCategory.Editing");
  v10 = [(VOSCommandCategory *)v8 initWithCommands:v7 localizedCategoryName:v9];

  return v10;
}

+ (VOSCommandCategory)advancedNavigation
{
  v35[28] = *MEMORY[0x263EF8340];
  v34 = +[VOSCommand MoveToPreviousFrame];
  v35[0] = v34;
  v33 = +[VOSCommand MoveToNextFrame];
  v35[1] = v33;
  v32 = +[VOSCommand MoveToPreviousTable];
  v35[2] = v32;
  v31 = +[VOSCommand MoveToNextTable];
  v35[3] = v31;
  v30 = +[VOSCommand MoveToPreviousColumn];
  v35[4] = v30;
  v29 = +[VOSCommand MoveToNextColumn];
  v35[5] = v29;
  v28 = +[VOSCommand MoveToPreviousList];
  v35[6] = v28;
  v27 = +[VOSCommand MoveToNextList];
  v35[7] = v27;
  v26 = +[VOSCommand MoveToPreviousSameElement];
  v35[8] = v26;
  v25 = +[VOSCommand MoveToNextSameElement];
  v35[9] = v25;
  v24 = +[VOSCommand MoveToPreviousDifferentElement];
  v35[10] = v24;
  v23 = +[VOSCommand MoveToNextDifferentElement];
  v35[11] = v23;
  v22 = +[VOSCommand MoveToPreviousHeading];
  v35[12] = v22;
  v21 = +[VOSCommand MoveToNextHeading];
  v35[13] = v21;
  v20 = +[VOSCommand MoveToPreviousSameHeading];
  v35[14] = v20;
  v19 = +[VOSCommand MoveToNextSameHeading];
  v35[15] = v19;
  v18 = +[VOSCommand MoveToPreviousLink];
  v35[16] = v18;
  v16 = +[VOSCommand MoveToNextLink];
  v35[17] = v16;
  v2 = +[VOSCommand MoveToPreviousVisitedLink];
  v35[18] = v2;
  v3 = +[VOSCommand MoveToNextVisitedLink];
  v35[19] = v3;
  v4 = +[VOSCommand MoveToPreviousControl];
  v35[20] = v4;
  v5 = +[VOSCommand MoveToNextControl];
  v35[21] = v5;
  v6 = +[VOSCommand MoveToPreviousGraphic];
  v35[22] = v6;
  v7 = +[VOSCommand MoveToNextGraphic];
  v35[23] = v7;
  v8 = +[VOSCommand MoveToSystemFocusedElement];
  v35[24] = v8;
  v9 = +[VOSCommand FindElementWithTextSearch];
  v35[25] = v9;
  v10 = +[VOSCommand PreviousSearchResult];
  v35[26] = v10;
  v11 = +[VOSCommand NextSearchResult];
  v35[27] = v11;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:28];

  v12 = [VOSCommandCategory alloc];
  v13 = VOSLocString(@"VOSCommandCategory.AdvancedNavigation");
  v14 = [(VOSCommandCategory *)v12 initWithCommands:v17 localizedCategoryName:v13];

  return v14;
}

+ (VOSCommandCategory)braille
{
  v20[13] = *MEMORY[0x263EF8340];
  v19 = +[VOSCommand BraillePanLeft];
  v20[0] = v19;
  v18 = +[VOSCommand BraillePanRight];
  v20[1] = v18;
  v17 = +[VOSCommand BrailleNextInputTable];
  v20[2] = v17;
  v16 = +[VOSCommand BrailleNextOutputTable];
  v20[3] = v16;
  v2 = +[VOSCommand BrailleAnnouncementMode];
  v20[4] = v2;
  v3 = +[VOSCommand BrailleTranslate];
  v20[5] = v3;
  v4 = +[VOSCommand BrailleToggleWordWrap];
  v20[6] = v4;
  v5 = +[VOSCommand BrailleTranslateToClipboard];
  v20[7] = v5;
  v6 = +[VOSCommand BrailleEnableAutoAdvance];
  v20[8] = v6;
  v7 = +[VOSCommand BrailleIncreaseAutoAdvance];
  v20[9] = v7;
  v8 = +[VOSCommand BrailleDecreaseAutoAdvance];
  v20[10] = v8;
  v9 = +[VOSCommand BrailleReconnectBrailleDisplays];
  v20[11] = v9;
  v10 = +[VOSCommand BrailleTogglePerkinsKeyboardInput];
  v20[12] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:13];

  v12 = [VOSCommandCategory alloc];
  v13 = VOSLocString(@"VOSCommandCategory.Braille");
  v14 = [(VOSCommandCategory *)v12 initWithCommands:v11 localizedCategoryName:v13];

  return v14;
}

+ (VOSCommandCategory)speechAndAudio
{
  v12[5] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand ToggleMute];
  v3 = +[VOSCommand ToggleSpeech];
  v12[1] = v3;
  v4 = +[VOSCommand ChangeAudioDuckingMode];
  v12[2] = v4;
  v5 = +[VOSCommand VolumeUp];
  v12[3] = v5;
  v6 = +[VOSCommand VolumeDown];
  v12[4] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];

  v8 = [VOSCommandCategory alloc];
  v9 = VOSLocString(@"VOSCommandCategory.SpeechAndAudio");
  v10 = [(VOSCommandCategory *)v8 initWithCommands:v7 localizedCategoryName:v9];

  return v10;
}

+ (VOSCommandCategory)output
{
  v30[21] = *MEMORY[0x263EF8340];
  v29 = +[VOSCommand SummarizeElement];
  v30[0] = v29;
  v28 = +[VOSCommand AnalyzeElement];
  v30[1] = v28;
  v27 = +[VOSCommand ReadAll];
  v30[2] = v27;
  v26 = +[VOSCommand ReadFromTop];
  v30[3] = v26;
  v25 = +[VOSCommand ReadLine];
  v30[4] = v25;
  v24 = +[VOSCommand ReadWord];
  v30[5] = v24;
  v23 = +[VOSCommand ReadURL];
  v30[6] = v23;
  v22 = +[VOSCommand ReadSelectedText];
  v30[7] = v22;
  v21 = +[VOSCommand ReadTextStyle];
  v30[8] = v21;
  v20 = +[VOSCommand ReadHint];
  v30[9] = v20;
  v19 = +[VOSCommand ReadCharacter];
  v30[10] = v19;
  v18 = +[VOSCommand ReadCharacterPhonetically];
  v30[11] = v18;
  v17 = +[VOSCommand ReadRowHeader];
  v30[12] = v17;
  v2 = +[VOSCommand ReadRowContents];
  v30[13] = v2;
  v3 = +[VOSCommand ReadTableRowColumn];
  v30[14] = v3;
  v4 = +[VOSCommand ReadTableRowColumnCell];
  v30[15] = v4;
  v5 = +[VOSCommand ReadColumnHeader];
  v30[16] = v5;
  v6 = +[VOSCommand ReadColumnContents];
  v30[17] = v6;
  v7 = +[VOSCommand ReadLineCount];
  v30[18] = v7;
  v8 = +[VOSCommand SummarizeSystemFocusedElement];
  v30[19] = v8;
  v9 = +[VOSCommand ReadSystemFocusedElementDetails];
  v30[20] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:21];

  if (AXDeviceHasForcePress3dTouch())
  {
    v11 = +[VOSCommand PreviewElementWith3DTouch];
    uint64_t v12 = [v10 arrayByAddingObject:v11];

    v10 = (void *)v12;
  }
  v13 = [VOSCommandCategory alloc];
  v14 = VOSLocString(@"VOSCommandCategory.Output");
  v15 = [(VOSCommandCategory *)v13 initWithCommands:v10 localizedCategoryName:v14];

  return v15;
}

+ (VOSCommandCategory)rotor
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand PreviousRotor];
  v11[0] = v2;
  v3 = +[VOSCommand NextRotor];
  v11[1] = v3;
  v4 = +[VOSCommand PreviousRotorItem];
  v11[2] = v4;
  v5 = +[VOSCommand NextRotorItem];
  v11[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];

  v7 = [VOSCommandCategory alloc];
  v8 = VOSLocString(@"VOSCommandCategory.Rotor");
  v9 = [(VOSCommandCategory *)v7 initWithCommands:v6 localizedCategoryName:v8];

  return v9;
}

+ (VOSCommandCategory)scrolling
{
  v13[6] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand ScrollLeft];
  v13[0] = v2;
  v3 = +[VOSCommand ScrollRight];
  v13[1] = v3;
  v4 = +[VOSCommand ScrollUp];
  v13[2] = v4;
  v5 = +[VOSCommand ScrollDown];
  v13[3] = v5;
  v6 = +[VOSCommand ScrollToTop];
  v13[4] = v6;
  v7 = +[VOSCommand ScrollToBottom];
  v13[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:6];

  v9 = [VOSCommandCategory alloc];
  v10 = VOSLocString(@"VOSCommandCategory.Scrolling");
  v11 = [(VOSCommandCategory *)v9 initWithCommands:v8 localizedCategoryName:v10];

  return v11;
}

+ (VOSCommandCategory)voiceOverFeatures
{
  v31[15] = *MEMORY[0x263EF8340];
  v29 = +[VOSCommand ShowItemChooser];
  v31[0] = v29;
  v28 = +[VOSCommand OpenVoiceOverSettings];
  v31[1] = v28;
  v27 = +[VOSCommand ToggleScreenCurtain];
  v31[2] = v27;
  v26 = +[VOSCommand ToggleSoundCurtain];
  v31[3] = v26;
  v25 = +[VOSCommand StartHelp];
  v31[4] = v25;
  v24 = +[VOSCommand ToggleCaptionPanel];
  v31[5] = v24;
  v2 = +[VOSCommand LabelElement];
  v31[6] = v2;
  v3 = +[VOSCommand MonitorElement];
  v31[7] = v3;
  v4 = +[VOSCommand ToggleSingleLetterQuickNav];
  v31[8] = v4;
  v5 = +[VOSCommand ToggleQuickNav];
  v31[9] = v5;
  v6 = +[VOSCommand ToggleLockModifierKeys];
  v31[10] = v6;
  v7 = +[VOSCommand ToggleLiveRegions];
  v31[11] = v7;
  v8 = +[VOSCommand ActivateBrailleScreenInput];
  v31[12] = v8;
  v9 = +[VOSCommand ActivateBrailleScreenInputCommand];
  v31[13] = v9;
  v10 = +[VOSCommand LaunchPeopleDetection];
  v31[14] = v10;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:15];

  v11 = [MEMORY[0x263F08AB0] processInfo];
  if ((unint64_t)[v11 physicalMemory] <= 0x773593FF)
  {
    v14 = v30;
    goto LABEL_5;
  }
  int v12 = AXRuntimeCheck_HasANE();

  if (v12)
  {
    v11 = +[VOSCommand DescribeImage];
    uint64_t v13 = [v30 arrayByAddingObject:v11];

    v14 = (void *)v13;
LABEL_5:

    goto LABEL_7;
  }
  v14 = v30;
LABEL_7:
  if (_os_feature_enabled_impl())
  {
    v15 = +[VOSCommand ToggleSettingsHUD];
    uint64_t v16 = [v14 arrayByAddingObject:v15];

    v14 = (void *)v16;
  }
  v17 = [MEMORY[0x263F08AB0] processInfo];
  if ((unint64_t)[v17 physicalMemory] > 0x773593FF)
  {
    int v18 = AXRuntimeCheck_HasANE();

    if (!v18) {
      goto LABEL_13;
    }
    v17 = +[VOSCommand ToggleAutomaticAccessibility];
    uint64_t v19 = [v14 arrayByAddingObject:v17];

    v14 = (void *)v19;
  }

LABEL_13:
  v20 = [VOSCommandCategory alloc];
  v21 = VOSLocString(@"VOSCommandCategory.VoiceOverFeatures");
  v22 = [(VOSCommandCategory *)v20 initWithCommands:v14 localizedCategoryName:v21];

  return v22;
}

+ (VOSCommandCategory)system
{
  v23[14] = *MEMORY[0x263EF8340];
  v22 = +[VOSCommand ShowNotificationCenter];
  v23[0] = v22;
  v21 = +[VOSCommand ShowControlCenter];
  v23[1] = v21;
  v20 = +[VOSCommand ActivateSpeakScreen];
  v23[2] = v20;
  uint64_t v19 = +[VOSCommand ActivateHomeButton];
  v23[3] = v19;
  int v18 = +[VOSCommand ToggleDock];
  v23[4] = v18;
  v17 = +[VOSCommand ToggleAppSwitcher];
  v23[5] = v17;
  v2 = +[VOSCommand ActivateLockButton];
  v23[6] = v2;
  v3 = +[VOSCommand ShowSpotlight];
  v23[7] = v3;
  v4 = +[VOSCommand ActivateAccessibilityShortcut];
  v23[8] = v4;
  v5 = +[VOSCommand ToggleReachability];
  v23[9] = v5;
  v6 = +[VOSCommand TakeScreenshot];
  v23[10] = v6;
  v7 = +[VOSCommand ToggleTypeToSiri];
  v23[11] = v7;
  v8 = +[VOSCommand SwitchToPreviousApp];
  v23[12] = v8;
  v9 = +[VOSCommand SwitchToNextApp];
  v23[13] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:14];

  if (AXDeviceIsPad())
  {
    v11 = +[VOSCommand ToggleQuickNote];
    uint64_t v12 = [v10 arrayByAddingObject:v11];

    v10 = (void *)v12;
  }
  uint64_t v13 = [VOSCommandCategory alloc];
  v14 = VOSLocString(@"VOSCommandCategory.System");
  v15 = [(VOSCommandCategory *)v13 initWithCommands:v10 localizedCategoryName:v14];

  return v15;
}

+ (VOSCommandCategory)other
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = +[VOSCommand ToggleTextSelection];
  v9[0] = v2;
  v3 = +[VOSCommand CopySpeechToClipboard];
  v9[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v5 = [VOSCommandCategory alloc];
  v6 = VOSLocString(@"VOSCommandCategory.Other");
  v7 = [(VOSCommandCategory *)v5 initWithCommands:v4 localizedCategoryName:v6];

  return v7;
}

+ (VOSCommandCategory)internalOnly
{
  v2 = [VOSCommandCategory alloc];
  if (AXIsInternalInstall()) {
    v3 = @"Internal Only";
  }
  else {
    v3 = &stru_26CC86DC0;
  }
  v4 = [(VOSCommandCategory *)v2 initWithCommands:MEMORY[0x263EFFA68] localizedCategoryName:v3];

  return v4;
}

+ (NSArray)allCategories
{
  v19[13] = *MEMORY[0x263EF8340];
  int v18 = +[VOSCommandCategory interaction];
  v19[0] = v18;
  v17 = +[VOSCommandCategory basicNavigation];
  v19[1] = v17;
  uint64_t v16 = +[VOSCommandCategory textNavigation];
  v19[2] = v16;
  v15 = +[VOSCommandCategory advancedNavigation];
  v19[3] = v15;
  v14 = +[VOSCommandCategory editing];
  v19[4] = v14;
  v2 = +[VOSCommandCategory rotor];
  v19[5] = v2;
  v3 = +[VOSCommandCategory scrolling];
  v19[6] = v3;
  v4 = +[VOSCommandCategory speechAndAudio];
  v19[7] = v4;
  v5 = +[VOSCommandCategory output];
  v19[8] = v5;
  v6 = +[VOSCommandCategory braille];
  v19[9] = v6;
  v7 = +[VOSCommandCategory voiceOverFeatures];
  v19[10] = v7;
  v8 = +[VOSCommandCategory system];
  v19[11] = v8;
  v9 = +[VOSCommandCategory other];
  v19[12] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:13];

  if (AXIsInternalInstall())
  {
    v11 = (void *)[v10 mutableCopy];
    uint64_t v12 = +[VOSCommandCategory internalOnly];
    [v11 addObject:v12];

    v10 = v11;
  }

  return (NSArray *)v10;
}

+ (VOSCommandCategory)handwriting
{
  v18[11] = *MEMORY[0x263EF8340];
  v17 = +[VOSCommand PreviousHandwritingCharacterMode];
  v18[0] = v17;
  uint64_t v16 = +[VOSCommand NextHandwritingCharacterMode];
  v18[1] = v16;
  v2 = +[VOSCommand AnnounceHandwritingCharacterMode];
  v18[2] = v2;
  v3 = +[VOSCommand GesturedTextInputInsertSpace];
  v18[3] = v3;
  v4 = +[VOSCommand GesturedTextInputBackspace];
  v18[4] = v4;
  v5 = +[VOSCommand GesturedTextInputDeleteWord];
  v18[5] = v5;
  v6 = +[VOSCommand GesturedTextInputPerformReturnEquivalent];
  v18[6] = v6;
  v7 = +[VOSCommand GesturedTextInputPreviousSuggestion];
  v18[7] = v7;
  v8 = +[VOSCommand GesturedTextInputNextSuggestion];
  v18[8] = v8;
  v9 = +[VOSCommand GesturedTextInputLaunchApp];
  v18[9] = v9;
  v10 = +[VOSCommand GesturedTextInputNextKeyboardLanguage];
  v18[10] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:11];

  uint64_t v12 = [VOSCommandCategory alloc];
  uint64_t v13 = VOSLocString(@"VOSCommandCategory.Handwriting");
  v14 = [(VOSCommandCategory *)v12 initWithCommands:v11 localizedCategoryName:v13];

  return v14;
}

+ (VOSCommandCategory)brailleScreenInput
{
  v27[20] = *MEMORY[0x263EF8340];
  v26 = +[VOSCommand BSIExit];
  v27[0] = v26;
  v25 = +[VOSCommand BSIPreviousBrailleMode];
  v27[1] = v25;
  v24 = +[VOSCommand BSINextBrailleMode];
  v27[2] = v24;
  v23 = +[VOSCommand BSITranslateImmediately];
  v27[3] = v23;
  v22 = +[VOSCommand BSIOrientationLock];
  v27[4] = v22;
  v21 = +[VOSCommand BSIQuickAction];
  v27[5] = v21;
  v20 = +[VOSCommand GesturedTextInputInsertSpace];
  v27[6] = v20;
  uint64_t v19 = +[VOSCommand GesturedTextInputBackspace];
  v27[7] = v19;
  int v18 = +[VOSCommand GesturedTextInputDeleteWord];
  v27[8] = v18;
  v17 = +[VOSCommand GesturedTextInputPerformReturnEquivalent];
  v27[9] = v17;
  uint64_t v16 = +[VOSCommand GesturedTextInputPreviousSuggestion];
  v27[10] = v16;
  v2 = +[VOSCommand GesturedTextInputNextSuggestion];
  v27[11] = v2;
  v3 = +[VOSCommand GesturedTextInputLaunchApp];
  v27[12] = v3;
  v4 = +[VOSCommand GesturedTextInputNextKeyboardLanguage];
  v27[13] = v4;
  v5 = +[VOSCommand GesturedTextInputNextBrailleTable];
  v27[14] = v5;
  v6 = +[VOSCommand Cut];
  v27[15] = v6;
  v7 = +[VOSCommand Copy];
  v27[16] = v7;
  v8 = +[VOSCommand Paste];
  v27[17] = v8;
  v9 = +[VOSCommand Undo];
  v27[18] = v9;
  v10 = +[VOSCommand Redo];
  void v27[19] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:20];

  uint64_t v12 = [VOSCommandCategory alloc];
  uint64_t v13 = VOSLocString(@"VOSCommandCategory.BSI");
  v14 = [(VOSCommandCategory *)v12 initWithCommands:v11 localizedCategoryName:v13];

  return v14;
}

- (VOSCommandCategory)initWithCommands:(id)a3 localizedCategoryName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSCommandCategory;
  v8 = [(VOSCommandCategory *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(VOSCommandCategory *)v8 setLocalizedCategoryName:v7];
    v10 = [v6 sortedArrayUsingComparator:&__block_literal_global_8];
    [(VOSCommandCategory *)v9 setCommands:v10];
  }
  return v9;
}

uint64_t __61__VOSCommandCategory_initWithCommands_localizedCategoryName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 localizedName];
  id v6 = [v4 localizedName];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

- (VOSCommandCategory)init
{
  v3 = [MEMORY[0x263EFF8C0] array];
  id v4 = [(VOSCommandCategory *)self initWithCommands:v3 localizedCategoryName:&stru_26CC86DC0];

  return v4;
}

- (BOOL)containsCommand:(id)a3
{
  id v4 = a3;
  v5 = [(VOSCommandCategory *)self commands];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)categories:(id)a3 containsCommand:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "containsCommand:", v6, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);

  objc_storeStrong((id *)&self->_commands, 0);
}

@end