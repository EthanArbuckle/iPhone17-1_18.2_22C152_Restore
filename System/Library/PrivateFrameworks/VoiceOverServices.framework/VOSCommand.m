@interface VOSCommand
+ (NSSet)allBuiltInCommands;
+ (VOSCommand)ActivateAccessibilityShortcut;
+ (VOSCommand)ActivateBrailleScreenInput;
+ (VOSCommand)ActivateBrailleScreenInputCommand;
+ (VOSCommand)ActivateHomeButton;
+ (VOSCommand)ActivateLockButton;
+ (VOSCommand)ActivateSpeakScreen;
+ (VOSCommand)AnalyzeElement;
+ (VOSCommand)AnnounceHandwritingCharacterMode;
+ (VOSCommand)BSIEscape;
+ (VOSCommand)BSIExit;
+ (VOSCommand)BSINextBrailleMode;
+ (VOSCommand)BSINextRotor;
+ (VOSCommand)BSINextTextSegment;
+ (VOSCommand)BSINextTextSegmentType;
+ (VOSCommand)BSINextUsage;
+ (VOSCommand)BSIOrientationLock;
+ (VOSCommand)BSIPreviousBrailleMode;
+ (VOSCommand)BSIPreviousRotor;
+ (VOSCommand)BSIPreviousTextSegment;
+ (VOSCommand)BSIPreviousTextSegmentType;
+ (VOSCommand)BSIPreviousUsage;
+ (VOSCommand)BSIQuickAction;
+ (VOSCommand)BSISelectNextTextSegment;
+ (VOSCommand)BSISelectPreviousTextSegment;
+ (VOSCommand)BSITranslateImmediately;
+ (VOSCommand)BrailleAnnouncementMode;
+ (VOSCommand)BrailleDecreaseAutoAdvance;
+ (VOSCommand)BrailleEnableAutoAdvance;
+ (VOSCommand)BrailleIncreaseAutoAdvance;
+ (VOSCommand)BrailleNextInputTable;
+ (VOSCommand)BrailleNextOutputTable;
+ (VOSCommand)BraillePanLeft;
+ (VOSCommand)BraillePanRight;
+ (VOSCommand)BrailleReconnectBrailleDisplays;
+ (VOSCommand)BrailleTogglePerkinsKeyboardInput;
+ (VOSCommand)BrailleToggleWordWrap;
+ (VOSCommand)BrailleTranslate;
+ (VOSCommand)BrailleTranslateToClipboard;
+ (VOSCommand)ChangeAudioDuckingMode;
+ (VOSCommand)Copy;
+ (VOSCommand)CopySpeechToClipboard;
+ (VOSCommand)Cut;
+ (VOSCommand)DescribeCameraScene;
+ (VOSCommand)DescribeImage;
+ (VOSCommand)Escape;
+ (VOSCommand)FindElementWithTextSearch;
+ (VOSCommand)GesturedTextInputBackspace;
+ (VOSCommand)GesturedTextInputDeleteWord;
+ (VOSCommand)GesturedTextInputInsertSpace;
+ (VOSCommand)GesturedTextInputLaunchApp;
+ (VOSCommand)GesturedTextInputNextBrailleTable;
+ (VOSCommand)GesturedTextInputNextKeyboardLanguage;
+ (VOSCommand)GesturedTextInputNextSuggestion;
+ (VOSCommand)GesturedTextInputPerformReturnEquivalent;
+ (VOSCommand)GesturedTextInputPreviousSuggestion;
+ (VOSCommand)Invalid;
+ (VOSCommand)LabelElement;
+ (VOSCommand)LaunchPeopleDetection;
+ (VOSCommand)MagicTap;
+ (VOSCommand)MonitorElement;
+ (VOSCommand)MoveIn;
+ (VOSCommand)MoveOut;
+ (VOSCommand)MoveToBottomOfCurrentContainer;
+ (VOSCommand)MoveToBottomOfCurrentDocument;
+ (VOSCommand)MoveToCenterElement;
+ (VOSCommand)MoveToElementAbove;
+ (VOSCommand)MoveToElementBelow;
+ (VOSCommand)MoveToFirstElement;
+ (VOSCommand)MoveToFirstWord;
+ (VOSCommand)MoveToLastElement;
+ (VOSCommand)MoveToLastWord;
+ (VOSCommand)MoveToLinkedUI;
+ (VOSCommand)MoveToNextBlockquote;
+ (VOSCommand)MoveToNextBoldText;
+ (VOSCommand)MoveToNextCharacter;
+ (VOSCommand)MoveToNextColorChange;
+ (VOSCommand)MoveToNextColumn;
+ (VOSCommand)MoveToNextContainer;
+ (VOSCommand)MoveToNextControl;
+ (VOSCommand)MoveToNextDifferentElement;
+ (VOSCommand)MoveToNextElement;
+ (VOSCommand)MoveToNextElementCommunity;
+ (VOSCommand)MoveToNextFontChange;
+ (VOSCommand)MoveToNextFrame;
+ (VOSCommand)MoveToNextGraphic;
+ (VOSCommand)MoveToNextHeading;
+ (VOSCommand)MoveToNextItalicText;
+ (VOSCommand)MoveToNextLink;
+ (VOSCommand)MoveToNextList;
+ (VOSCommand)MoveToNextMisspelledWord;
+ (VOSCommand)MoveToNextParagraph;
+ (VOSCommand)MoveToNextPlainText;
+ (VOSCommand)MoveToNextSameBlockquote;
+ (VOSCommand)MoveToNextSameElement;
+ (VOSCommand)MoveToNextSameHeading;
+ (VOSCommand)MoveToNextSentence;
+ (VOSCommand)MoveToNextStyleChange;
+ (VOSCommand)MoveToNextTable;
+ (VOSCommand)MoveToNextUnderlineText;
+ (VOSCommand)MoveToNextVisitedLink;
+ (VOSCommand)MoveToNextWord;
+ (VOSCommand)MoveToPreviousBlockquote;
+ (VOSCommand)MoveToPreviousBoldText;
+ (VOSCommand)MoveToPreviousCharacter;
+ (VOSCommand)MoveToPreviousColorChange;
+ (VOSCommand)MoveToPreviousColumn;
+ (VOSCommand)MoveToPreviousContainer;
+ (VOSCommand)MoveToPreviousControl;
+ (VOSCommand)MoveToPreviousDifferentElement;
+ (VOSCommand)MoveToPreviousElement;
+ (VOSCommand)MoveToPreviousElementCommunity;
+ (VOSCommand)MoveToPreviousFontChange;
+ (VOSCommand)MoveToPreviousFrame;
+ (VOSCommand)MoveToPreviousGraphic;
+ (VOSCommand)MoveToPreviousHeading;
+ (VOSCommand)MoveToPreviousItalicText;
+ (VOSCommand)MoveToPreviousLink;
+ (VOSCommand)MoveToPreviousList;
+ (VOSCommand)MoveToPreviousMisspelledWord;
+ (VOSCommand)MoveToPreviousParagraph;
+ (VOSCommand)MoveToPreviousPlainText;
+ (VOSCommand)MoveToPreviousSameBlockquote;
+ (VOSCommand)MoveToPreviousSameElement;
+ (VOSCommand)MoveToPreviousSameHeading;
+ (VOSCommand)MoveToPreviousSentence;
+ (VOSCommand)MoveToPreviousStyleChange;
+ (VOSCommand)MoveToPreviousTable;
+ (VOSCommand)MoveToPreviousUnderlineText;
+ (VOSCommand)MoveToPreviousVisitedLink;
+ (VOSCommand)MoveToPreviousWord;
+ (VOSCommand)MoveToStatusBar;
+ (VOSCommand)MoveToSystemFocusedElement;
+ (VOSCommand)MoveToTopOfCurrentContainer;
+ (VOSCommand)MoveToTopOfCurrentDocument;
+ (VOSCommand)NextHandwritingCharacterMode;
+ (VOSCommand)NextRotor;
+ (VOSCommand)NextRotorItem;
+ (VOSCommand)NextSearchResult;
+ (VOSCommand)None;
+ (VOSCommand)OpenVoiceOverSettings;
+ (VOSCommand)Paste;
+ (VOSCommand)PerformLongPress;
+ (VOSCommand)PreviewElementWith3DTouch;
+ (VOSCommand)PreviousHandwritingCharacterMode;
+ (VOSCommand)PreviousRotor;
+ (VOSCommand)PreviousRotorItem;
+ (VOSCommand)PreviousSearchResult;
+ (VOSCommand)PrimaryActivate;
+ (VOSCommand)ReadAll;
+ (VOSCommand)ReadCharacter;
+ (VOSCommand)ReadCharacterPhonetically;
+ (VOSCommand)ReadColumnContents;
+ (VOSCommand)ReadColumnHeader;
+ (VOSCommand)ReadFromTop;
+ (VOSCommand)ReadHint;
+ (VOSCommand)ReadLine;
+ (VOSCommand)ReadLineCount;
+ (VOSCommand)ReadRowContents;
+ (VOSCommand)ReadRowHeader;
+ (VOSCommand)ReadSelectedText;
+ (VOSCommand)ReadSystemFocusedElementDetails;
+ (VOSCommand)ReadTableRowColumn;
+ (VOSCommand)ReadTableRowColumnCell;
+ (VOSCommand)ReadTextStyle;
+ (VOSCommand)ReadURL;
+ (VOSCommand)ReadWord;
+ (VOSCommand)Redo;
+ (VOSCommand)ScrollDown;
+ (VOSCommand)ScrollLeft;
+ (VOSCommand)ScrollRight;
+ (VOSCommand)ScrollToBottom;
+ (VOSCommand)ScrollToTop;
+ (VOSCommand)ScrollUp;
+ (VOSCommand)SecondaryActivate;
+ (VOSCommand)ShowControlCenter;
+ (VOSCommand)ShowItemChooser;
+ (VOSCommand)ShowNotificationCenter;
+ (VOSCommand)ShowSpotlight;
+ (VOSCommand)StartHelp;
+ (VOSCommand)SummarizeElement;
+ (VOSCommand)SummarizeSystemFocusedElement;
+ (VOSCommand)SwitchToNextApp;
+ (VOSCommand)SwitchToPreviousApp;
+ (VOSCommand)TakeScreenshot;
+ (VOSCommand)ToggleAppSwitcher;
+ (VOSCommand)ToggleAutomaticAccessibility;
+ (VOSCommand)ToggleCaptionPanel;
+ (VOSCommand)ToggleDock;
+ (VOSCommand)ToggleLiveRegions;
+ (VOSCommand)ToggleLockModifierKeys;
+ (VOSCommand)ToggleMute;
+ (VOSCommand)ToggleNavigationStyle;
+ (VOSCommand)ToggleQuickNav;
+ (VOSCommand)ToggleQuickNote;
+ (VOSCommand)ToggleReachability;
+ (VOSCommand)ToggleScreenCurtain;
+ (VOSCommand)ToggleSettingsHUD;
+ (VOSCommand)ToggleSingleLetterQuickNav;
+ (VOSCommand)ToggleSoundCurtain;
+ (VOSCommand)ToggleSpeech;
+ (VOSCommand)ToggleSyncNativeAndExploreFocus;
+ (VOSCommand)ToggleTextSelection;
+ (VOSCommand)ToggleTypeToSiri;
+ (VOSCommand)Undo;
+ (VOSCommand)VolumeDown;
+ (VOSCommand)VolumeUp;
+ (VOSCommand)commandWithSiriShortcut:(id)a3;
+ (id)builtInCommandWithStringValue:(id)a3;
+ (id)commandForVOSEventCommand:(id)a3;
- (AXSiriShortcut)siriShortcut;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedName;
- (NSString)rawValue;
- (NSString)votEventCommandName;
- (id)_initBuiltInCommandWithRawValue:(id)a3 votEventCommandName:(id)a4;
- (id)_initWithSiriShortcut:(id)a3;
- (id)description;
- (int64_t)commandType;
- (unint64_t)hash;
- (void)setCommandType:(int64_t)a3;
- (void)setVotEventCommandName:(id)a3;
@end

@implementation VOSCommand

+ (VOSCommand)commandWithSiriShortcut:(id)a3
{
  id v3 = a3;
  id v4 = [[VOSCommand alloc] _initWithSiriShortcut:v3];

  return (VOSCommand *)v4;
}

- (id)_initWithSiriShortcut:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VOSCommand;
  v6 = [(VOSCommand *)&v9 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    v6->_commandType = 1;
    objc_storeStrong((id *)&v6->_siriShortcut, a3);
    objc_storeStrong(p_isa + 3, kVOTEventCommandRunSiriShortcut);
  }

  return p_isa;
}

- (id)_initBuiltInCommandWithRawValue:(id)a3 votEventCommandName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VOSCommand;
  objc_super v9 = [(VOSCommand *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    v9->_commandType = 0;
    objc_storeStrong((id *)&v9->_rawValue, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)description
{
  int64_t v3 = [(VOSCommand *)self commandType];
  id v4 = @"Shortcut";
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    id v5 = v4;
  }
  else {
    id v5 = @"Built-in";
  }
  v6 = NSString;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  objc_super v9 = [(VOSCommand *)self localizedName];
  v10 = [v6 stringWithFormat:@"%@<%p>: %@: %@", v8, self, v5, v9];

  return v10;
}

+ (VOSCommand)None
{
  if (None_onceToken != -1) {
    dispatch_once(&None_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)None__Command;

  return (VOSCommand *)v2;
}

uint64_t __18__VOSCommand_None__block_invoke()
{
  v0 = [VOSCommand alloc];
  None__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"None" votEventCommandName:kVOTEventCommandNone];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PrimaryActivate
{
  if (PrimaryActivate_onceToken != -1) {
    dispatch_once(&PrimaryActivate_onceToken, &__block_literal_global_280_0);
  }
  v2 = (void *)PrimaryActivate__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_PrimaryActivate__block_invoke()
{
  v0 = [VOSCommand alloc];
  PrimaryActivate__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PrimaryActivate" votEventCommandName:kVOTEventCommandSimpleTap];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)SecondaryActivate
{
  if (SecondaryActivate_onceToken != -1) {
    dispatch_once(&SecondaryActivate_onceToken, &__block_literal_global_285_0);
  }
  v2 = (void *)SecondaryActivate__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_SecondaryActivate__block_invoke()
{
  v0 = [VOSCommand alloc];
  SecondaryActivate__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"SecondaryActivate" votEventCommandName:kVOTEventCommandDoubleTap];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PerformLongPress
{
  if (PerformLongPress_onceToken != -1) {
    dispatch_once(&PerformLongPress_onceToken, &__block_literal_global_290_0);
  }
  v2 = (void *)PerformLongPress__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_PerformLongPress__block_invoke()
{
  v0 = [VOSCommand alloc];
  PerformLongPress__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PerformLongPress" votEventCommandName:kVOTEventCommandSimulatedLongPress];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousElement
{
  if (MoveToPreviousElement_onceToken != -1) {
    dispatch_once(&MoveToPreviousElement_onceToken, &__block_literal_global_295_0);
  }
  v2 = (void *)MoveToPreviousElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToPreviousElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousElement" votEventCommandName:kVOTEventCommandPreviousElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextElement
{
  if (MoveToNextElement_onceToken != -1) {
    dispatch_once(&MoveToNextElement_onceToken, &__block_literal_global_300_0);
  }
  v2 = (void *)MoveToNextElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_MoveToNextElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextElement" votEventCommandName:kVOTEventCommandNextElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToFirstElement
{
  if (MoveToFirstElement_onceToken != -1) {
    dispatch_once(&MoveToFirstElement_onceToken, &__block_literal_global_305_0);
  }
  v2 = (void *)MoveToFirstElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToFirstElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToFirstElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToFirstElement" votEventCommandName:kVOTEventCommandFirstElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToFirstWord
{
  if (MoveToFirstWord_onceToken != -1) {
    dispatch_once(&MoveToFirstWord_onceToken, &__block_literal_global_310_0);
  }
  v2 = (void *)MoveToFirstWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_MoveToFirstWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToFirstWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToFirstWord" votEventCommandName:kVOTEventCommandFirstWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToLastElement
{
  if (MoveToLastElement_onceToken != -1) {
    dispatch_once(&MoveToLastElement_onceToken, &__block_literal_global_315_1);
  }
  v2 = (void *)MoveToLastElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_MoveToLastElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToLastElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToLastElement" votEventCommandName:kVOTEventCommandLastElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToCenterElement
{
  if (MoveToCenterElement_onceToken != -1) {
    dispatch_once(&MoveToCenterElement_onceToken, &__block_literal_global_320_0);
  }
  v2 = (void *)MoveToCenterElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToCenterElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToCenterElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToCenterElement" votEventCommandName:kVOTEventCommandCenterElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToLastWord
{
  if (MoveToLastWord_onceToken != -1) {
    dispatch_once(&MoveToLastWord_onceToken, &__block_literal_global_325_0);
  }
  v2 = (void *)MoveToLastWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MoveToLastWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToLastWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToLastWord" votEventCommandName:kVOTEventCommandLastWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToElementAbove
{
  if (MoveToElementAbove_onceToken != -1) {
    dispatch_once(&MoveToElementAbove_onceToken, &__block_literal_global_330_0);
  }
  v2 = (void *)MoveToElementAbove__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToElementAbove__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToElementAbove__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToElementAbove" votEventCommandName:kVOTEventCommandElementAbove];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToElementBelow
{
  if (MoveToElementBelow_onceToken != -1) {
    dispatch_once(&MoveToElementBelow_onceToken, &__block_literal_global_335_0);
  }
  v2 = (void *)MoveToElementBelow__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToElementBelow__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToElementBelow__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToElementBelow" votEventCommandName:kVOTEventCommandElementBelow];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousElementCommunity
{
  if (MoveToPreviousElementCommunity_onceToken != -1) {
    dispatch_once(&MoveToPreviousElementCommunity_onceToken, &__block_literal_global_340_0);
  }
  v2 = (void *)MoveToPreviousElementCommunity__Command;

  return (VOSCommand *)v2;
}

uint64_t __44__VOSCommand_MoveToPreviousElementCommunity__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousElementCommunity__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousElementCommunity" votEventCommandName:kVOTEventCommandLeftElementCommunity];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextElementCommunity
{
  if (MoveToNextElementCommunity_onceToken != -1) {
    dispatch_once(&MoveToNextElementCommunity_onceToken, &__block_literal_global_345_0);
  }
  v2 = (void *)MoveToNextElementCommunity__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_MoveToNextElementCommunity__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextElementCommunity__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextElementCommunity" votEventCommandName:kVOTEventCommandRightElementCommunity];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousContainer
{
  if (MoveToPreviousContainer_onceToken != -1) {
    dispatch_once(&MoveToPreviousContainer_onceToken, &__block_literal_global_350_0);
  }
  v2 = (void *)MoveToPreviousContainer__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_MoveToPreviousContainer__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousContainer__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousContainer" votEventCommandName:kVOTEventCommandPreviousContainer];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextContainer
{
  if (MoveToNextContainer_onceToken != -1) {
    dispatch_once(&MoveToNextContainer_onceToken, &__block_literal_global_355_0);
  }
  v2 = (void *)MoveToNextContainer__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToNextContainer__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextContainer__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextContainer" votEventCommandName:kVOTEventCommandNextContainer];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToTopOfCurrentContainer
{
  if (MoveToTopOfCurrentContainer_onceToken != -1) {
    dispatch_once(&MoveToTopOfCurrentContainer_onceToken, &__block_literal_global_360_0);
  }
  v2 = (void *)MoveToTopOfCurrentContainer__Command;

  return (VOSCommand *)v2;
}

uint64_t __41__VOSCommand_MoveToTopOfCurrentContainer__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToTopOfCurrentContainer__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToTopOfCurrentContainer" votEventCommandName:kVOTEventCommandContainerTop];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToBottomOfCurrentContainer
{
  if (MoveToBottomOfCurrentContainer_onceToken != -1) {
    dispatch_once(&MoveToBottomOfCurrentContainer_onceToken, &__block_literal_global_365_0);
  }
  v2 = (void *)MoveToBottomOfCurrentContainer__Command;

  return (VOSCommand *)v2;
}

uint64_t __44__VOSCommand_MoveToBottomOfCurrentContainer__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToBottomOfCurrentContainer__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToBottomOfCurrentContainer" votEventCommandName:kVOTEventCommandContainerBottom];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToTopOfCurrentDocument
{
  if (MoveToTopOfCurrentDocument_onceToken != -1) {
    dispatch_once(&MoveToTopOfCurrentDocument_onceToken, &__block_literal_global_370_0);
  }
  v2 = (void *)MoveToTopOfCurrentDocument__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_MoveToTopOfCurrentDocument__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToTopOfCurrentDocument__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToTopOfCurrentDocument" votEventCommandName:kVOTEventCommandDocumentTop];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToBottomOfCurrentDocument
{
  if (MoveToBottomOfCurrentDocument_onceToken != -1) {
    dispatch_once(&MoveToBottomOfCurrentDocument_onceToken, &__block_literal_global_375_0);
  }
  v2 = (void *)MoveToBottomOfCurrentDocument__Command;

  return (VOSCommand *)v2;
}

uint64_t __43__VOSCommand_MoveToBottomOfCurrentDocument__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToBottomOfCurrentDocument__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToBottomOfCurrentDocument" votEventCommandName:kVOTEventCommandDocumentBottom];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousCharacter
{
  if (MoveToPreviousCharacter_onceToken != -1) {
    dispatch_once(&MoveToPreviousCharacter_onceToken, &__block_literal_global_380_0);
  }
  v2 = (void *)MoveToPreviousCharacter__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_MoveToPreviousCharacter__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousCharacter__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousCharacter" votEventCommandName:kVOTEventCommandPreviousCharacter];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextCharacter
{
  if (MoveToNextCharacter_onceToken != -1) {
    dispatch_once(&MoveToNextCharacter_onceToken, &__block_literal_global_385_0);
  }
  v2 = (void *)MoveToNextCharacter__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToNextCharacter__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextCharacter__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextCharacter" votEventCommandName:kVOTEventCommandNextCharacter];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousWord
{
  if (MoveToPreviousWord_onceToken != -1) {
    dispatch_once(&MoveToPreviousWord_onceToken, &__block_literal_global_390_0);
  }
  v2 = (void *)MoveToPreviousWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToPreviousWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousWord" votEventCommandName:kVOTEventCommandPreviousWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextWord
{
  if (MoveToNextWord_onceToken != -1) {
    dispatch_once(&MoveToNextWord_onceToken, &__block_literal_global_395_0);
  }
  v2 = (void *)MoveToNextWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MoveToNextWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextWord" votEventCommandName:kVOTEventCommandNextWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousSentence
{
  if (MoveToPreviousSentence_onceToken != -1) {
    dispatch_once(&MoveToPreviousSentence_onceToken, &__block_literal_global_400_0);
  }
  v2 = (void *)MoveToPreviousSentence__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_MoveToPreviousSentence__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousSentence__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousSentence" votEventCommandName:kVOTEventCommandPreviousSentence];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextSentence
{
  if (MoveToNextSentence_onceToken != -1) {
    dispatch_once(&MoveToNextSentence_onceToken, &__block_literal_global_405_0);
  }
  v2 = (void *)MoveToNextSentence__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToNextSentence__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextSentence__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextSentence" votEventCommandName:kVOTEventCommandNextSentence];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousParagraph
{
  if (MoveToPreviousParagraph_onceToken != -1) {
    dispatch_once(&MoveToPreviousParagraph_onceToken, &__block_literal_global_410_0);
  }
  v2 = (void *)MoveToPreviousParagraph__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_MoveToPreviousParagraph__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousParagraph__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousParagraph" votEventCommandName:kVOTEventCommandPreviousParagraph];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextParagraph
{
  if (MoveToNextParagraph_onceToken != -1) {
    dispatch_once(&MoveToNextParagraph_onceToken, &__block_literal_global_415_0);
  }
  v2 = (void *)MoveToNextParagraph__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToNextParagraph__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextParagraph__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextParagraph" votEventCommandName:kVOTEventCommandNextParagraph];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToStatusBar
{
  if (MoveToStatusBar_onceToken != -1) {
    dispatch_once(&MoveToStatusBar_onceToken, &__block_literal_global_420_0);
  }
  v2 = (void *)MoveToStatusBar__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_MoveToStatusBar__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToStatusBar__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToStatusBar" votEventCommandName:kVOTEventCommandMoveToStatusBar];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToLinkedUI
{
  if (MoveToLinkedUI_onceToken != -1) {
    dispatch_once(&MoveToLinkedUI_onceToken, &__block_literal_global_425_0);
  }
  v2 = (void *)MoveToLinkedUI__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MoveToLinkedUI__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToLinkedUI__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToLinkedUI" votEventCommandName:kVOTEventCommandMoveToLinkedUI];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToSystemFocusedElement
{
  if (MoveToSystemFocusedElement_onceToken != -1) {
    dispatch_once(&MoveToSystemFocusedElement_onceToken, &__block_literal_global_430_0);
  }
  v2 = (void *)MoveToSystemFocusedElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_MoveToSystemFocusedElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToSystemFocusedElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToSystemFocusedElement" votEventCommandName:kVOTEventCommandMoveToNativeFocusedElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextGraphic
{
  if (MoveToNextGraphic_onceToken != -1) {
    dispatch_once(&MoveToNextGraphic_onceToken, &__block_literal_global_435_0);
  }
  v2 = (void *)MoveToNextGraphic__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_MoveToNextGraphic__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextGraphic__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextGraphic" votEventCommandName:kVOTEventCommandNextGraphic];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousGraphic
{
  if (MoveToPreviousGraphic_onceToken != -1) {
    dispatch_once(&MoveToPreviousGraphic_onceToken, &__block_literal_global_440_0);
  }
  v2 = (void *)MoveToPreviousGraphic__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToPreviousGraphic__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousGraphic__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousGraphic" votEventCommandName:kVOTEventCommandPreviousGraphic];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextHeading
{
  if (MoveToNextHeading_onceToken != -1) {
    dispatch_once(&MoveToNextHeading_onceToken, &__block_literal_global_445_0);
  }
  v2 = (void *)MoveToNextHeading__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_MoveToNextHeading__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextHeading__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextHeading" votEventCommandName:kVOTEventCommandNextHeading];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousHeading
{
  if (MoveToPreviousHeading_onceToken != -1) {
    dispatch_once(&MoveToPreviousHeading_onceToken, &__block_literal_global_450_0);
  }
  v2 = (void *)MoveToPreviousHeading__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToPreviousHeading__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousHeading__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousHeading" votEventCommandName:kVOTEventCommandPreviousHeading];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextTable
{
  if (MoveToNextTable_onceToken != -1) {
    dispatch_once(&MoveToNextTable_onceToken, &__block_literal_global_455_0);
  }
  v2 = (void *)MoveToNextTable__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_MoveToNextTable__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextTable__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextTable" votEventCommandName:kVOTEventCommandNextTable];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousTable
{
  if (MoveToPreviousTable_onceToken != -1) {
    dispatch_once(&MoveToPreviousTable_onceToken, &__block_literal_global_460_0);
  }
  v2 = (void *)MoveToPreviousTable__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToPreviousTable__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousTable__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousTable" votEventCommandName:kVOTEventCommandPreviousTable];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextList
{
  if (MoveToNextList_onceToken != -1) {
    dispatch_once(&MoveToNextList_onceToken, &__block_literal_global_465_0);
  }
  v2 = (void *)MoveToNextList__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MoveToNextList__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextList__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextList" votEventCommandName:kVOTEventCommandNextList];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousList
{
  if (MoveToPreviousList_onceToken != -1) {
    dispatch_once(&MoveToPreviousList_onceToken, &__block_literal_global_470_0);
  }
  v2 = (void *)MoveToPreviousList__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToPreviousList__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousList__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousList" votEventCommandName:kVOTEventCommandPreviousList];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextSameElement
{
  if (MoveToNextSameElement_onceToken != -1) {
    dispatch_once(&MoveToNextSameElement_onceToken, &__block_literal_global_475_0);
  }
  v2 = (void *)MoveToNextSameElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToNextSameElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextSameElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextSameElement" votEventCommandName:kVOTEventCommandNextSameElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousSameElement
{
  if (MoveToPreviousSameElement_onceToken != -1) {
    dispatch_once(&MoveToPreviousSameElement_onceToken, &__block_literal_global_480_0);
  }
  v2 = (void *)MoveToPreviousSameElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_MoveToPreviousSameElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousSameElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousSameElement" votEventCommandName:kVOTEventCommandPreviousSameElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextControl
{
  if (MoveToNextControl_onceToken != -1) {
    dispatch_once(&MoveToNextControl_onceToken, &__block_literal_global_485_0);
  }
  v2 = (void *)MoveToNextControl__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_MoveToNextControl__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextControl__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextControl" votEventCommandName:kVOTEventCommandNextControl];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousControl
{
  if (MoveToPreviousControl_onceToken != -1) {
    dispatch_once(&MoveToPreviousControl_onceToken, &__block_literal_global_490_0);
  }
  v2 = (void *)MoveToPreviousControl__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToPreviousControl__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousControl__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousControl" votEventCommandName:kVOTEventCommandPreviousControl];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextLink
{
  if (MoveToNextLink_onceToken != -1) {
    dispatch_once(&MoveToNextLink_onceToken, &__block_literal_global_495_0);
  }
  v2 = (void *)MoveToNextLink__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MoveToNextLink__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextLink__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextLink" votEventCommandName:kVOTEventCommandNextLink];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousLink
{
  if (MoveToPreviousLink_onceToken != -1) {
    dispatch_once(&MoveToPreviousLink_onceToken, &__block_literal_global_500_0);
  }
  v2 = (void *)MoveToPreviousLink__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToPreviousLink__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousLink__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousLink" votEventCommandName:kVOTEventCommandPreviousLink];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextBlockquote
{
  if (MoveToNextBlockquote_onceToken != -1) {
    dispatch_once(&MoveToNextBlockquote_onceToken, &__block_literal_global_505_0);
  }
  v2 = (void *)MoveToNextBlockquote__Command;

  return (VOSCommand *)v2;
}

uint64_t __34__VOSCommand_MoveToNextBlockquote__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextBlockquote__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextBlockquote" votEventCommandName:kVOTEventCommandNextBlockquote];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousBlockquote
{
  if (MoveToPreviousBlockquote_onceToken != -1) {
    dispatch_once(&MoveToPreviousBlockquote_onceToken, &__block_literal_global_510_0);
  }
  v2 = (void *)MoveToPreviousBlockquote__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_MoveToPreviousBlockquote__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousBlockquote__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousBlockquote" votEventCommandName:kVOTEventCommandPreviousBlockquote];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextSameBlockquote
{
  if (MoveToNextSameBlockquote_onceToken != -1) {
    dispatch_once(&MoveToNextSameBlockquote_onceToken, &__block_literal_global_515_0);
  }
  v2 = (void *)MoveToNextSameBlockquote__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_MoveToNextSameBlockquote__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextSameBlockquote__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextSameBlockquote" votEventCommandName:kVOTEventCommandNextSameBlockquote];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousSameBlockquote
{
  if (MoveToPreviousSameBlockquote_onceToken != -1) {
    dispatch_once(&MoveToPreviousSameBlockquote_onceToken, &__block_literal_global_520_0);
  }
  v2 = (void *)MoveToPreviousSameBlockquote__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_MoveToPreviousSameBlockquote__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousSameBlockquote__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousSameBlockquote" votEventCommandName:kVOTEventCommandPreviousSameBlockquote];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextVisitedLink
{
  if (MoveToNextVisitedLink_onceToken != -1) {
    dispatch_once(&MoveToNextVisitedLink_onceToken, &__block_literal_global_525_0);
  }
  v2 = (void *)MoveToNextVisitedLink__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToNextVisitedLink__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextVisitedLink__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextVisitedLink" votEventCommandName:kVOTEventCommandNextVisitedLink];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousVisitedLink
{
  if (MoveToPreviousVisitedLink_onceToken != -1) {
    dispatch_once(&MoveToPreviousVisitedLink_onceToken, &__block_literal_global_530_0);
  }
  v2 = (void *)MoveToPreviousVisitedLink__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_MoveToPreviousVisitedLink__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousVisitedLink__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousVisitedLink" votEventCommandName:kVOTEventCommandPreviousVisitedLink];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextSameHeading
{
  if (MoveToNextSameHeading_onceToken != -1) {
    dispatch_once(&MoveToNextSameHeading_onceToken, &__block_literal_global_535_0);
  }
  v2 = (void *)MoveToNextSameHeading__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToNextSameHeading__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextSameHeading__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextSameHeading" votEventCommandName:kVOTEventCommandNextSameHeading];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousSameHeading
{
  if (MoveToPreviousSameHeading_onceToken != -1) {
    dispatch_once(&MoveToPreviousSameHeading_onceToken, &__block_literal_global_540_0);
  }
  v2 = (void *)MoveToPreviousSameHeading__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_MoveToPreviousSameHeading__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousSameHeading__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousSameHeading" votEventCommandName:kVOTEventCommandPreviousSameHeading];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextBoldText
{
  if (MoveToNextBoldText_onceToken != -1) {
    dispatch_once(&MoveToNextBoldText_onceToken, &__block_literal_global_545_0);
  }
  v2 = (void *)MoveToNextBoldText__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_MoveToNextBoldText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextBoldText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextBoldText" votEventCommandName:kVOTEventCommandNextBoldText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousBoldText
{
  if (MoveToPreviousBoldText_onceToken != -1) {
    dispatch_once(&MoveToPreviousBoldText_onceToken, &__block_literal_global_550_0);
  }
  v2 = (void *)MoveToPreviousBoldText__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_MoveToPreviousBoldText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousBoldText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousBoldText" votEventCommandName:kVOTEventCommandPreviousBoldText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextMisspelledWord
{
  if (MoveToNextMisspelledWord_onceToken != -1) {
    dispatch_once(&MoveToNextMisspelledWord_onceToken, &__block_literal_global_555_0);
  }
  v2 = (void *)MoveToNextMisspelledWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_MoveToNextMisspelledWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextMisspelledWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextMisspelledWord" votEventCommandName:kVOTEventCommandNextMisspelledWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousMisspelledWord
{
  if (MoveToPreviousMisspelledWord_onceToken != -1) {
    dispatch_once(&MoveToPreviousMisspelledWord_onceToken, &__block_literal_global_560_0);
  }
  v2 = (void *)MoveToPreviousMisspelledWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_MoveToPreviousMisspelledWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousMisspelledWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousMisspelledWord" votEventCommandName:kVOTEventCommandPreviousMisspelledWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextPlainText
{
  if (MoveToNextPlainText_onceToken != -1) {
    dispatch_once(&MoveToNextPlainText_onceToken, &__block_literal_global_565_0);
  }
  v2 = (void *)MoveToNextPlainText__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToNextPlainText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextPlainText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextPlainText" votEventCommandName:kVOTEventCommandNextPlainText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousPlainText
{
  if (MoveToPreviousPlainText_onceToken != -1) {
    dispatch_once(&MoveToPreviousPlainText_onceToken, &__block_literal_global_570_0);
  }
  v2 = (void *)MoveToPreviousPlainText__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_MoveToPreviousPlainText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousPlainText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousPlainText" votEventCommandName:kVOTEventCommandPreviousPlainText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextColorChange
{
  if (MoveToNextColorChange_onceToken != -1) {
    dispatch_once(&MoveToNextColorChange_onceToken, &__block_literal_global_575_0);
  }
  v2 = (void *)MoveToNextColorChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToNextColorChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextColorChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextColorChange" votEventCommandName:kVOTEventCommandNextColorChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousColorChange
{
  if (MoveToPreviousColorChange_onceToken != -1) {
    dispatch_once(&MoveToPreviousColorChange_onceToken, &__block_literal_global_580_0);
  }
  v2 = (void *)MoveToPreviousColorChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_MoveToPreviousColorChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousColorChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousColorChange" votEventCommandName:kVOTEventCommandPreviousColorChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextItalicText
{
  if (MoveToNextItalicText_onceToken != -1) {
    dispatch_once(&MoveToNextItalicText_onceToken, &__block_literal_global_585_0);
  }
  v2 = (void *)MoveToNextItalicText__Command;

  return (VOSCommand *)v2;
}

uint64_t __34__VOSCommand_MoveToNextItalicText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextItalicText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextItalicText" votEventCommandName:kVOTEventCommandNextItalicText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousItalicText
{
  if (MoveToPreviousItalicText_onceToken != -1) {
    dispatch_once(&MoveToPreviousItalicText_onceToken, &__block_literal_global_590_0);
  }
  v2 = (void *)MoveToPreviousItalicText__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_MoveToPreviousItalicText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousItalicText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousItalicText" votEventCommandName:kVOTEventCommandPreviousItalicText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextUnderlineText
{
  if (MoveToNextUnderlineText_onceToken != -1) {
    dispatch_once(&MoveToNextUnderlineText_onceToken, &__block_literal_global_595_1);
  }
  v2 = (void *)MoveToNextUnderlineText__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_MoveToNextUnderlineText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextUnderlineText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextUnderlineText" votEventCommandName:kVOTEventCommandNextUnderlineText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousUnderlineText
{
  if (MoveToPreviousUnderlineText_onceToken != -1) {
    dispatch_once(&MoveToPreviousUnderlineText_onceToken, &__block_literal_global_600_0);
  }
  v2 = (void *)MoveToPreviousUnderlineText__Command;

  return (VOSCommand *)v2;
}

uint64_t __41__VOSCommand_MoveToPreviousUnderlineText__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousUnderlineText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousUnderlineText" votEventCommandName:kVOTEventCommandPreviousUnderlineText];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextDifferentElement
{
  if (MoveToNextDifferentElement_onceToken != -1) {
    dispatch_once(&MoveToNextDifferentElement_onceToken, &__block_literal_global_605_0);
  }
  v2 = (void *)MoveToNextDifferentElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_MoveToNextDifferentElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextDifferentElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextDifferentElement" votEventCommandName:kVOTEventCommandNextDifferentElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousDifferentElement
{
  if (MoveToPreviousDifferentElement_onceToken != -1) {
    dispatch_once(&MoveToPreviousDifferentElement_onceToken, &__block_literal_global_610_0);
  }
  v2 = (void *)MoveToPreviousDifferentElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __44__VOSCommand_MoveToPreviousDifferentElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousDifferentElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousDifferentElement" votEventCommandName:kVOTEventCommandPreviousDifferentElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextColumn
{
  if (MoveToNextColumn_onceToken != -1) {
    dispatch_once(&MoveToNextColumn_onceToken, &__block_literal_global_615_0);
  }
  v2 = (void *)MoveToNextColumn__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_MoveToNextColumn__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextColumn__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextColumn" votEventCommandName:kVOTEventCommandNextColumn];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousColumn
{
  if (MoveToPreviousColumn_onceToken != -1) {
    dispatch_once(&MoveToPreviousColumn_onceToken, &__block_literal_global_620_0);
  }
  v2 = (void *)MoveToPreviousColumn__Command;

  return (VOSCommand *)v2;
}

uint64_t __34__VOSCommand_MoveToPreviousColumn__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousColumn__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousColumn" votEventCommandName:kVOTEventCommandPreviousColumn];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextFontChange
{
  if (MoveToNextFontChange_onceToken != -1) {
    dispatch_once(&MoveToNextFontChange_onceToken, &__block_literal_global_625_0);
  }
  v2 = (void *)MoveToNextFontChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __34__VOSCommand_MoveToNextFontChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextFontChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextFontChange" votEventCommandName:kVOTEventCommandNextFontChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousFontChange
{
  if (MoveToPreviousFontChange_onceToken != -1) {
    dispatch_once(&MoveToPreviousFontChange_onceToken, &__block_literal_global_630_0);
  }
  v2 = (void *)MoveToPreviousFontChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_MoveToPreviousFontChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousFontChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousFontChange" votEventCommandName:kVOTEventCommandPreviousFontChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextFrame
{
  if (MoveToNextFrame_onceToken != -1) {
    dispatch_once(&MoveToNextFrame_onceToken, &__block_literal_global_635_0);
  }
  v2 = (void *)MoveToNextFrame__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_MoveToNextFrame__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextFrame__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextFrame" votEventCommandName:kVOTEventCommandNextFrame];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousFrame
{
  if (MoveToPreviousFrame_onceToken != -1) {
    dispatch_once(&MoveToPreviousFrame_onceToken, &__block_literal_global_640);
  }
  v2 = (void *)MoveToPreviousFrame__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_MoveToPreviousFrame__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousFrame__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousFrame" votEventCommandName:kVOTEventCommandPreviousFrame];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToNextStyleChange
{
  if (MoveToNextStyleChange_onceToken != -1) {
    dispatch_once(&MoveToNextStyleChange_onceToken, &__block_literal_global_645);
  }
  v2 = (void *)MoveToNextStyleChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_MoveToNextStyleChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToNextStyleChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToNextStyleChange" votEventCommandName:kVOTEventCommandNextStyleChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveToPreviousStyleChange
{
  if (MoveToPreviousStyleChange_onceToken != -1) {
    dispatch_once(&MoveToPreviousStyleChange_onceToken, &__block_literal_global_650);
  }
  v2 = (void *)MoveToPreviousStyleChange__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_MoveToPreviousStyleChange__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveToPreviousStyleChange__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveToPreviousStyleChange" votEventCommandName:kVOTEventCommandPreviousStyleChange];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)FindElementWithTextSearch
{
  if (FindElementWithTextSearch_onceToken != -1) {
    dispatch_once(&FindElementWithTextSearch_onceToken, &__block_literal_global_655);
  }
  v2 = (void *)FindElementWithTextSearch__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_FindElementWithTextSearch__block_invoke()
{
  v0 = [VOSCommand alloc];
  FindElementWithTextSearch__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"FindElementWithTextSearch" votEventCommandName:kVOTEventCommandStartTextSearch];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PreviousSearchResult
{
  if (PreviousSearchResult_onceToken != -1) {
    dispatch_once(&PreviousSearchResult_onceToken, &__block_literal_global_660);
  }
  v2 = (void *)PreviousSearchResult__Command;

  return (VOSCommand *)v2;
}

uint64_t __34__VOSCommand_PreviousSearchResult__block_invoke()
{
  v0 = [VOSCommand alloc];
  PreviousSearchResult__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PreviousSearchResult" votEventCommandName:kVOTEventCommandTextSearchBackward];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)NextSearchResult
{
  if (NextSearchResult_onceToken != -1) {
    dispatch_once(&NextSearchResult_onceToken, &__block_literal_global_665);
  }
  v2 = (void *)NextSearchResult__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_NextSearchResult__block_invoke()
{
  v0 = [VOSCommand alloc];
  NextSearchResult__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"NextSearchResult" votEventCommandName:kVOTEventCommandTextSearchForward];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Copy
{
  if (Copy_onceToken != -1) {
    dispatch_once(&Copy_onceToken, &__block_literal_global_670);
  }
  v2 = (void *)Copy__Command;

  return (VOSCommand *)v2;
}

uint64_t __18__VOSCommand_Copy__block_invoke()
{
  v0 = [VOSCommand alloc];
  Copy__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Copy" votEventCommandName:kVOTEventCommandCopy];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Cut
{
  if (Cut_onceToken != -1) {
    dispatch_once(&Cut_onceToken, &__block_literal_global_675);
  }
  v2 = (void *)Cut__Command;

  return (VOSCommand *)v2;
}

uint64_t __17__VOSCommand_Cut__block_invoke()
{
  v0 = [VOSCommand alloc];
  Cut__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Cut" votEventCommandName:kVOTEventCommandCut];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Paste
{
  if (Paste_onceToken != -1) {
    dispatch_once(&Paste_onceToken, &__block_literal_global_680);
  }
  v2 = (void *)Paste__Command;

  return (VOSCommand *)v2;
}

uint64_t __19__VOSCommand_Paste__block_invoke()
{
  v0 = [VOSCommand alloc];
  Paste__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Paste" votEventCommandName:kVOTEventCommandPaste];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Undo
{
  if (Undo_onceToken != -1) {
    dispatch_once(&Undo_onceToken, &__block_literal_global_685);
  }
  v2 = (void *)Undo__Command;

  return (VOSCommand *)v2;
}

uint64_t __18__VOSCommand_Undo__block_invoke()
{
  v0 = [VOSCommand alloc];
  Undo__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Undo" votEventCommandName:kVOTEventCommandUndo];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Redo
{
  if (Redo_onceToken != -1) {
    dispatch_once(&Redo_onceToken, &__block_literal_global_690);
  }
  v2 = (void *)Redo__Command;

  return (VOSCommand *)v2;
}

uint64_t __18__VOSCommand_Redo__block_invoke()
{
  v0 = [VOSCommand alloc];
  Redo__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Redo" votEventCommandName:kVOTEventCommandRedo];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleTextSelection
{
  if (ToggleTextSelection_onceToken != -1) {
    dispatch_once(&ToggleTextSelection_onceToken, &__block_literal_global_695);
  }
  v2 = (void *)ToggleTextSelection__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_ToggleTextSelection__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleTextSelection__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleTextSelection" votEventCommandName:kVOTEventCommandStartStopTextSelection];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)SummarizeElement
{
  if (SummarizeElement_onceToken != -1) {
    dispatch_once(&SummarizeElement_onceToken, &__block_literal_global_700);
  }
  v2 = (void *)SummarizeElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_SummarizeElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  SummarizeElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"SummarizeElement" votEventCommandName:kVOTEventCommandOutputElementSummary];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)SummarizeSystemFocusedElement
{
  if (SummarizeSystemFocusedElement_onceToken != -1) {
    dispatch_once(&SummarizeSystemFocusedElement_onceToken, &__block_literal_global_705);
  }
  v2 = (void *)SummarizeSystemFocusedElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __43__VOSCommand_SummarizeSystemFocusedElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  SummarizeSystemFocusedElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"SummarizeSystemFocusedElement" votEventCommandName:kVOTEventCommandOutputFocusedElementSummary];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadSystemFocusedElementDetails
{
  if (ReadSystemFocusedElementDetails_onceToken != -1) {
    dispatch_once(&ReadSystemFocusedElementDetails_onceToken, &__block_literal_global_710);
  }
  v2 = (void *)ReadSystemFocusedElementDetails__Command;

  return (VOSCommand *)v2;
}

uint64_t __45__VOSCommand_ReadSystemFocusedElementDetails__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadSystemFocusedElementDetails__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadSystemFocusedElementDetails" votEventCommandName:kVOTEventCommandOutputDetailedFocusedElementSummary];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PreviewElementWith3DTouch
{
  if (PreviewElementWith3DTouch_onceToken != -1) {
    dispatch_once(&PreviewElementWith3DTouch_onceToken, &__block_literal_global_715);
  }
  v2 = (void *)PreviewElementWith3DTouch__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_PreviewElementWith3DTouch__block_invoke()
{
  v0 = [VOSCommand alloc];
  PreviewElementWith3DTouch__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PreviewElementWith3DTouch" votEventCommandName:kVOTEventCommandSimulatedForceTouch];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)AnalyzeElement
{
  if (AnalyzeElement_onceToken != -1) {
    dispatch_once(&AnalyzeElement_onceToken, &__block_literal_global_720);
  }
  v2 = (void *)AnalyzeElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_AnalyzeElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  AnalyzeElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"AnalyzeElement" votEventCommandName:kVOTEventCommandOutputElementComputerVisionAnalysisSummary];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadAll
{
  if (ReadAll_onceToken != -1) {
    dispatch_once(&ReadAll_onceToken, &__block_literal_global_725);
  }
  v2 = (void *)ReadAll__Command;

  return (VOSCommand *)v2;
}

uint64_t __21__VOSCommand_ReadAll__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadAll__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadAll" votEventCommandName:kVOTEventCommandReadAll];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadFromTop
{
  if (ReadFromTop_onceToken != -1) {
    dispatch_once(&ReadFromTop_onceToken, &__block_literal_global_730);
  }
  v2 = (void *)ReadFromTop__Command;

  return (VOSCommand *)v2;
}

uint64_t __25__VOSCommand_ReadFromTop__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadFromTop__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadFromTop" votEventCommandName:kVOTEventCommandReadFromTop];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadLine
{
  if (ReadLine_onceToken != -1) {
    dispatch_once(&ReadLine_onceToken, &__block_literal_global_735);
  }
  v2 = (void *)ReadLine__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_ReadLine__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadLine__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadLine" votEventCommandName:kVOTEventCommandReadLine];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadWord
{
  if (ReadWord_onceToken != -1) {
    dispatch_once(&ReadWord_onceToken, &__block_literal_global_740);
  }
  v2 = (void *)ReadWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_ReadWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadWord" votEventCommandName:kVOTEventCommandReadWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadHint
{
  if (ReadHint_onceToken != -1) {
    dispatch_once(&ReadHint_onceToken, &__block_literal_global_745);
  }
  v2 = (void *)ReadHint__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_ReadHint__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadHint__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadHint" votEventCommandName:kVOTEventCommandReadHint];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadTextStyle
{
  if (ReadTextStyle_onceToken != -1) {
    dispatch_once(&ReadTextStyle_onceToken, &__block_literal_global_750);
  }
  v2 = (void *)ReadTextStyle__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_ReadTextStyle__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadTextStyle__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadTextStyle" votEventCommandName:kVOTEventCommandOutputTextStyle];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadURL
{
  if (ReadURL_onceToken != -1) {
    dispatch_once(&ReadURL_onceToken, &__block_literal_global_755);
  }
  v2 = (void *)ReadURL__Command;

  return (VOSCommand *)v2;
}

uint64_t __21__VOSCommand_ReadURL__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadURL__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadURL" votEventCommandName:kVOTEventCommandReadURL];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadSelectedText
{
  if (ReadSelectedText_onceToken != -1) {
    dispatch_once(&ReadSelectedText_onceToken, &__block_literal_global_760);
  }
  v2 = (void *)ReadSelectedText__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_ReadSelectedText__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadSelectedText__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadSelectedText" votEventCommandName:kVOTEventCommandOutputSelectedInformation];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadCharacter
{
  if (ReadCharacter_onceToken != -1) {
    dispatch_once(&ReadCharacter_onceToken, &__block_literal_global_765);
  }
  v2 = (void *)ReadCharacter__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_ReadCharacter__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadCharacter__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadCharacter" votEventCommandName:kVOTEventCommandOutputCharacter];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadCharacterPhonetically
{
  if (ReadCharacterPhonetically_onceToken != -1) {
    dispatch_once(&ReadCharacterPhonetically_onceToken, &__block_literal_global_770);
  }
  v2 = (void *)ReadCharacterPhonetically__Command;

  return (VOSCommand *)v2;
}

uint64_t __39__VOSCommand_ReadCharacterPhonetically__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadCharacterPhonetically__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadCharacterPhonetically" votEventCommandName:kVOTEventCommandOutputCharacterPhonetically];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadRowHeader
{
  if (ReadRowHeader_onceToken != -1) {
    dispatch_once(&ReadRowHeader_onceToken, &__block_literal_global_775);
  }
  v2 = (void *)ReadRowHeader__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_ReadRowHeader__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadRowHeader__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadRowHeader" votEventCommandName:kVOTEventCommandOutputRowHeader];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadRowContents
{
  if (ReadRowContents_onceToken != -1) {
    dispatch_once(&ReadRowContents_onceToken, &__block_literal_global_780);
  }
  v2 = (void *)ReadRowContents__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_ReadRowContents__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadRowContents__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadRowContents" votEventCommandName:kVOTEventCommandOutputContentsOfRow];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadTableRowColumn
{
  if (ReadTableRowColumn_onceToken != -1) {
    dispatch_once(&ReadTableRowColumn_onceToken, &__block_literal_global_785);
  }
  v2 = (void *)ReadTableRowColumn__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ReadTableRowColumn__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadTableRowColumn__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadTableRowColumn" votEventCommandName:kVOTEventCommandOutputTableRowColumnInfo];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadColumnHeader
{
  if (ReadColumnHeader_onceToken != -1) {
    dispatch_once(&ReadColumnHeader_onceToken, &__block_literal_global_790);
  }
  v2 = (void *)ReadColumnHeader__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_ReadColumnHeader__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadColumnHeader__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadColumnHeader" votEventCommandName:kVOTEventCommandOutputColumnHeader];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadColumnContents
{
  if (ReadColumnContents_onceToken != -1) {
    dispatch_once(&ReadColumnContents_onceToken, &__block_literal_global_795);
  }
  v2 = (void *)ReadColumnContents__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ReadColumnContents__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadColumnContents__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadColumnContents" votEventCommandName:kVOTEventCommandOutputContentsOfColumn];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadTableRowColumnCell
{
  if (ReadTableRowColumnCell_onceToken != -1) {
    dispatch_once(&ReadTableRowColumnCell_onceToken, &__block_literal_global_800);
  }
  v2 = (void *)ReadTableRowColumnCell__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_ReadTableRowColumnCell__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadTableRowColumnCell__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadTableRowColumnCell" votEventCommandName:kVOTEventCommandOutputCellRowColumnInfo];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ReadLineCount
{
  if (ReadLineCount_onceToken != -1) {
    dispatch_once(&ReadLineCount_onceToken, &__block_literal_global_805);
  }
  v2 = (void *)ReadLineCount__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_ReadLineCount__block_invoke()
{
  v0 = [VOSCommand alloc];
  ReadLineCount__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ReadLineCount" votEventCommandName:kVOTEventCommandOutputLineCount];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleSpeech
{
  if (ToggleSpeech_onceToken != -1) {
    dispatch_once(&ToggleSpeech_onceToken, &__block_literal_global_810);
  }
  v2 = (void *)ToggleSpeech__Command;

  return (VOSCommand *)v2;
}

uint64_t __26__VOSCommand_ToggleSpeech__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleSpeech__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleSpeech" votEventCommandName:kVOTEventCommandToggleSpeaking];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleMute
{
  if (ToggleMute_onceToken != -1) {
    dispatch_once(&ToggleMute_onceToken, &__block_literal_global_815);
  }
  v2 = (void *)ToggleMute__Command;

  return (VOSCommand *)v2;
}

uint64_t __24__VOSCommand_ToggleMute__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleMute__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleMute" votEventCommandName:kVOTEventCommandToggleMute];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleScreenCurtain
{
  if (ToggleScreenCurtain_onceToken != -1) {
    dispatch_once(&ToggleScreenCurtain_onceToken, &__block_literal_global_820);
  }
  v2 = (void *)ToggleScreenCurtain__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_ToggleScreenCurtain__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleScreenCurtain__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleScreenCurtain" votEventCommandName:kVOTEventCommandToggleScreenCurtain];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleSoundCurtain
{
  if (ToggleSoundCurtain_onceToken != -1) {
    dispatch_once(&ToggleSoundCurtain_onceToken, &__block_literal_global_825);
  }
  v2 = (void *)ToggleSoundCurtain__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ToggleSoundCurtain__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleSoundCurtain__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleSoundCurtain" votEventCommandName:kVOTEventCommandToggleSoundCurtain];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ShowItemChooser
{
  if (ShowItemChooser_onceToken != -1) {
    dispatch_once(&ShowItemChooser_onceToken, &__block_literal_global_830);
  }
  v2 = (void *)ShowItemChooser__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_ShowItemChooser__block_invoke()
{
  v0 = [VOSCommand alloc];
  ShowItemChooser__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ShowItemChooser" votEventCommandName:kVOTEventCommandItemChooser];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)OpenVoiceOverSettings
{
  if (OpenVoiceOverSettings_onceToken != -1) {
    dispatch_once(&OpenVoiceOverSettings_onceToken, &__block_literal_global_835);
  }
  v2 = (void *)OpenVoiceOverSettings__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_OpenVoiceOverSettings__block_invoke()
{
  v0 = [VOSCommand alloc];
  OpenVoiceOverSettings__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"OpenVoiceOverSettings" votEventCommandName:kVOTEventCommandOpenVoiceOverSettings];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)StartHelp
{
  if (StartHelp_onceToken != -1) {
    dispatch_once(&StartHelp_onceToken, &__block_literal_global_840);
  }
  v2 = (void *)StartHelp__Command;

  return (VOSCommand *)v2;
}

uint64_t __23__VOSCommand_StartHelp__block_invoke()
{
  v0 = [VOSCommand alloc];
  StartHelp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"StartHelp" votEventCommandName:kVOTEventCommandStartHelp];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MagicTap
{
  if (MagicTap_onceToken != -1) {
    dispatch_once(&MagicTap_onceToken, &__block_literal_global_845);
  }
  v2 = (void *)MagicTap__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_MagicTap__block_invoke()
{
  v0 = [VOSCommand alloc];
  MagicTap__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MagicTap" votEventCommandName:kVOTEventCommandStartStopToggle];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Escape
{
  if (Escape_onceToken != -1) {
    dispatch_once(&Escape_onceToken, &__block_literal_global_850);
  }
  v2 = (void *)Escape__Command;

  return (VOSCommand *)v2;
}

uint64_t __20__VOSCommand_Escape__block_invoke()
{
  v0 = [VOSCommand alloc];
  Escape__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"Escape" votEventCommandName:kVOTEventCommandEscape];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollUp
{
  if (ScrollUp_onceToken != -1) {
    dispatch_once(&ScrollUp_onceToken, &__block_literal_global_855);
  }
  v2 = (void *)ScrollUp__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_ScrollUp__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollUp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollUp" votEventCommandName:kVOTEventCommandScrollUpPage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollDown
{
  if (ScrollDown_onceToken != -1) {
    dispatch_once(&ScrollDown_onceToken, &__block_literal_global_860);
  }
  v2 = (void *)ScrollDown__Command;

  return (VOSCommand *)v2;
}

uint64_t __24__VOSCommand_ScrollDown__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollDown__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollDown" votEventCommandName:kVOTEventCommandScrollDownPage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollLeft
{
  if (ScrollLeft_onceToken != -1) {
    dispatch_once(&ScrollLeft_onceToken, &__block_literal_global_865);
  }
  v2 = (void *)ScrollLeft__Command;

  return (VOSCommand *)v2;
}

uint64_t __24__VOSCommand_ScrollLeft__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollLeft__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollLeft" votEventCommandName:kVOTEventCommandScrollLeftPage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollRight
{
  if (ScrollRight_onceToken != -1) {
    dispatch_once(&ScrollRight_onceToken, &__block_literal_global_870);
  }
  v2 = (void *)ScrollRight__Command;

  return (VOSCommand *)v2;
}

uint64_t __25__VOSCommand_ScrollRight__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollRight__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollRight" votEventCommandName:kVOTEventCommandScrollRightPage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollToTop
{
  if (ScrollToTop_onceToken != -1) {
    dispatch_once(&ScrollToTop_onceToken, &__block_literal_global_875);
  }
  v2 = (void *)ScrollToTop__Command;

  return (VOSCommand *)v2;
}

uint64_t __25__VOSCommand_ScrollToTop__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollToTop__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollToTop" votEventCommandName:kVOTEventCommandScrollToTop];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ScrollToBottom
{
  if (ScrollToBottom_onceToken != -1) {
    dispatch_once(&ScrollToBottom_onceToken, &__block_literal_global_880);
  }
  v2 = (void *)ScrollToBottom__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_ScrollToBottom__block_invoke()
{
  v0 = [VOSCommand alloc];
  ScrollToBottom__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ScrollToBottom" votEventCommandName:kVOTEventCommandScrollToBottom];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PreviousRotor
{
  if (PreviousRotor_onceToken != -1) {
    dispatch_once(&PreviousRotor_onceToken, &__block_literal_global_885);
  }
  v2 = (void *)PreviousRotor__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_PreviousRotor__block_invoke()
{
  v0 = [VOSCommand alloc];
  PreviousRotor__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PreviousRotor" votEventCommandName:kVOTEventCommandSearchRotorLeft];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)NextRotor
{
  if (NextRotor_onceToken != -1) {
    dispatch_once(&NextRotor_onceToken, &__block_literal_global_890);
  }
  v2 = (void *)NextRotor__Command;

  return (VOSCommand *)v2;
}

uint64_t __23__VOSCommand_NextRotor__block_invoke()
{
  v0 = [VOSCommand alloc];
  NextRotor__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"NextRotor" votEventCommandName:kVOTEventCommandSearchRotorRight];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PreviousRotorItem
{
  if (PreviousRotorItem_onceToken != -1) {
    dispatch_once(&PreviousRotorItem_onceToken, &__block_literal_global_895);
  }
  v2 = (void *)PreviousRotorItem__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_PreviousRotorItem__block_invoke()
{
  v0 = [VOSCommand alloc];
  PreviousRotorItem__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PreviousRotorItem" votEventCommandName:kVOTEventCommandSearchRotorUp];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)NextRotorItem
{
  if (NextRotorItem_onceToken != -1) {
    dispatch_once(&NextRotorItem_onceToken, &__block_literal_global_900);
  }
  v2 = (void *)NextRotorItem__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_NextRotorItem__block_invoke()
{
  v0 = [VOSCommand alloc];
  NextRotorItem__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"NextRotorItem" votEventCommandName:kVOTEventCommandSearchRotorDown];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)CopySpeechToClipboard
{
  if (CopySpeechToClipboard_onceToken != -1) {
    dispatch_once(&CopySpeechToClipboard_onceToken, &__block_literal_global_905);
  }
  v2 = (void *)CopySpeechToClipboard__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_CopySpeechToClipboard__block_invoke()
{
  v0 = [VOSCommand alloc];
  CopySpeechToClipboard__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"CopySpeechToClipboard" votEventCommandName:kVOTEventCommandCopySpeechToClipboard];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleCaptionPanel
{
  if (ToggleCaptionPanel_onceToken != -1) {
    dispatch_once(&ToggleCaptionPanel_onceToken, &__block_literal_global_910);
  }
  v2 = (void *)ToggleCaptionPanel__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ToggleCaptionPanel__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleCaptionPanel__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleCaptionPanel" votEventCommandName:kVOTEventCommandToggleCaptionPanel];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)LabelElement
{
  if (LabelElement_onceToken != -1) {
    dispatch_once(&LabelElement_onceToken, &__block_literal_global_915);
  }
  v2 = (void *)LabelElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __26__VOSCommand_LabelElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  LabelElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"LabelElement" votEventCommandName:kVOTEventCommandLabelElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)DescribeImage
{
  if (DescribeImage_onceToken != -1) {
    dispatch_once(&DescribeImage_onceToken, &__block_literal_global_920);
  }
  v2 = (void *)DescribeImage__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_DescribeImage__block_invoke()
{
  v0 = [VOSCommand alloc];
  DescribeImage__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"DescribeImage" votEventCommandName:kVOTEventCommandDescribeImage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)LaunchPeopleDetection
{
  if (LaunchPeopleDetection_onceToken != -1) {
    dispatch_once(&LaunchPeopleDetection_onceToken, &__block_literal_global_925);
  }
  v2 = (void *)LaunchPeopleDetection__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_LaunchPeopleDetection__block_invoke()
{
  v0 = [VOSCommand alloc];
  LaunchPeopleDetection__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"LaunchPeopleDetection" votEventCommandName:kVOTEventCommandLaunchDetectionMode];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MonitorElement
{
  if (MonitorElement_onceToken != -1) {
    dispatch_once(&MonitorElement_onceToken, &__block_literal_global_930);
  }
  v2 = (void *)MonitorElement__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_MonitorElement__block_invoke()
{
  v0 = [VOSCommand alloc];
  MonitorElement__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MonitorElement" votEventCommandName:kVOTEventCommandMonitorElement];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateBrailleScreenInput
{
  if (ActivateBrailleScreenInput_onceToken != -1) {
    dispatch_once(&ActivateBrailleScreenInput_onceToken, &__block_literal_global_935);
  }
  v2 = (void *)ActivateBrailleScreenInput__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_ActivateBrailleScreenInput__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateBrailleScreenInput__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateBrailleScreenInput" votEventCommandName:kVOTEventCommandActivateBrailleScreenInput];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateBrailleScreenInputCommand
{
  if (ActivateBrailleScreenInputCommand_onceToken != -1) {
    dispatch_once(&ActivateBrailleScreenInputCommand_onceToken, &__block_literal_global_940);
  }
  v2 = (void *)ActivateBrailleScreenInputCommand__Command;

  return (VOSCommand *)v2;
}

uint64_t __47__VOSCommand_ActivateBrailleScreenInputCommand__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateBrailleScreenInputCommand__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateBrailleScreenInputCommand" votEventCommandName:kVOTEventCommandActivateBrailleScreenInputCommand];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleSingleLetterQuickNav
{
  if (ToggleSingleLetterQuickNav_onceToken != -1) {
    dispatch_once(&ToggleSingleLetterQuickNav_onceToken, &__block_literal_global_945);
  }
  v2 = (void *)ToggleSingleLetterQuickNav__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_ToggleSingleLetterQuickNav__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleSingleLetterQuickNav__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleSingleLetterQuickNav" votEventCommandName:kVOTEventCommandToggleSingleLetterQuickNav];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleQuickNav
{
  if (ToggleQuickNav_onceToken != -1) {
    dispatch_once(&ToggleQuickNav_onceToken, &__block_literal_global_950);
  }
  v2 = (void *)ToggleQuickNav__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_ToggleQuickNav__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleQuickNav__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleQuickNav" votEventCommandName:kVOTEventCommandToggleQuickNav];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleLockModifierKeys
{
  if (ToggleLockModifierKeys_onceToken != -1) {
    dispatch_once(&ToggleLockModifierKeys_onceToken, &__block_literal_global_955);
  }
  v2 = (void *)ToggleLockModifierKeys__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_ToggleLockModifierKeys__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleLockModifierKeys__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleLockModifierKeys" votEventCommandName:kVOTEventCommandLockVOKeyboardKeys];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ChangeAudioDuckingMode
{
  if (ChangeAudioDuckingMode_onceToken != -1) {
    dispatch_once(&ChangeAudioDuckingMode_onceToken, &__block_literal_global_960);
  }
  v2 = (void *)ChangeAudioDuckingMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_ChangeAudioDuckingMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  ChangeAudioDuckingMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ChangeAudioDuckingMode" votEventCommandName:kVOTEventCommandChangeAudioDuckingMode];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleNavigationStyle
{
  if (ToggleNavigationStyle_onceToken != -1) {
    dispatch_once(&ToggleNavigationStyle_onceToken, &__block_literal_global_965);
  }
  v2 = (void *)ToggleNavigationStyle__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_ToggleNavigationStyle__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleNavigationStyle__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleNavigationStyle" votEventCommandName:kVOTEventCommandToggleNavigationStyle];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleSyncNativeAndExploreFocus
{
  if (ToggleSyncNativeAndExploreFocus_onceToken != -1) {
    dispatch_once(&ToggleSyncNativeAndExploreFocus_onceToken, &__block_literal_global_970);
  }
  v2 = (void *)ToggleSyncNativeAndExploreFocus__Command;

  return (VOSCommand *)v2;
}

uint64_t __45__VOSCommand_ToggleSyncNativeAndExploreFocus__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleSyncNativeAndExploreFocus__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleSyncNativeAndExploreFocus" votEventCommandName:kVOTEventCommandToggleSyncNativeAndExploreFocus];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleAutomaticAccessibility
{
  if (ToggleAutomaticAccessibility_onceToken != -1) {
    dispatch_once(&ToggleAutomaticAccessibility_onceToken, &__block_literal_global_975);
  }
  v2 = (void *)ToggleAutomaticAccessibility__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_ToggleAutomaticAccessibility__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleAutomaticAccessibility__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleAutomaticAccessibility" votEventCommandName:kVOTEventCommandToggleAutomaticAccessibility];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)VolumeUp
{
  if (VolumeUp_onceToken != -1) {
    dispatch_once(&VolumeUp_onceToken, &__block_literal_global_980);
  }
  v2 = (void *)VolumeUp__Command;

  return (VOSCommand *)v2;
}

uint64_t __22__VOSCommand_VolumeUp__block_invoke()
{
  v0 = [VOSCommand alloc];
  VolumeUp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"VolumeUp" votEventCommandName:kVOTEventCommandVolumeUpButtonPress];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)VolumeDown
{
  if (VolumeDown_onceToken != -1) {
    dispatch_once(&VolumeDown_onceToken, &__block_literal_global_985);
  }
  v2 = (void *)VolumeDown__Command;

  return (VOSCommand *)v2;
}

uint64_t __24__VOSCommand_VolumeDown__block_invoke()
{
  v0 = [VOSCommand alloc];
  VolumeDown__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"VolumeDown" votEventCommandName:kVOTEventCommandVolumeDownButtonPress];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleLiveRegions
{
  if (ToggleLiveRegions_onceToken != -1) {
    dispatch_once(&ToggleLiveRegions_onceToken, &__block_literal_global_990);
  }
  v2 = (void *)ToggleLiveRegions__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_ToggleLiveRegions__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleLiveRegions__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleLiveRegions" votEventCommandName:kVOTEventCommandToggleLiveRegions];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ShowNotificationCenter
{
  if (ShowNotificationCenter_onceToken != -1) {
    dispatch_once(&ShowNotificationCenter_onceToken, &__block_literal_global_995);
  }
  v2 = (void *)ShowNotificationCenter__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_ShowNotificationCenter__block_invoke()
{
  v0 = [VOSCommand alloc];
  ShowNotificationCenter__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ShowNotificationCenter" votEventCommandName:kVOTEventCommandSystemShowNotificationCenter];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleTypeToSiri
{
  if (ToggleTypeToSiri_onceToken != -1) {
    dispatch_once(&ToggleTypeToSiri_onceToken, &__block_literal_global_1000);
  }
  v2 = (void *)ToggleTypeToSiri__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_ToggleTypeToSiri__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleTypeToSiri__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleTypeToSiri" votEventCommandName:kVOTEventCommandSystemToggleTypeToSiri];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ShowControlCenter
{
  if (ShowControlCenter_onceToken != -1) {
    dispatch_once(&ShowControlCenter_onceToken, &__block_literal_global_1005);
  }
  v2 = (void *)ShowControlCenter__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_ShowControlCenter__block_invoke()
{
  v0 = [VOSCommand alloc];
  ShowControlCenter__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ShowControlCenter" votEventCommandName:kVOTEventCommandSystemShowControlCenter];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateSpeakScreen
{
  if (ActivateSpeakScreen_onceToken != -1) {
    dispatch_once(&ActivateSpeakScreen_onceToken, &__block_literal_global_1010);
  }
  v2 = (void *)ActivateSpeakScreen__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_ActivateSpeakScreen__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateSpeakScreen__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateSpeakScreen" votEventCommandName:kVOTEventCommandSystemActivateSpeakScreen];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateHomeButton
{
  if (ActivateHomeButton_onceToken != -1) {
    dispatch_once(&ActivateHomeButton_onceToken, &__block_literal_global_1015);
  }
  v2 = (void *)ActivateHomeButton__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ActivateHomeButton__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateHomeButton__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateHomeButton" votEventCommandName:kVOTEventCommandHomeButtonPress];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleDock
{
  if (ToggleDock_onceToken != -1) {
    dispatch_once(&ToggleDock_onceToken, &__block_literal_global_1020);
  }
  v2 = (void *)ToggleDock__Command;

  return (VOSCommand *)v2;
}

uint64_t __24__VOSCommand_ToggleDock__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleDock__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleDock" votEventCommandName:kVOTEventCommandSystemToggleDock];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleAppSwitcher
{
  if (ToggleAppSwitcher_onceToken != -1) {
    dispatch_once(&ToggleAppSwitcher_onceToken, &__block_literal_global_1025);
  }
  v2 = (void *)ToggleAppSwitcher__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_ToggleAppSwitcher__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleAppSwitcher__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleAppSwitcher" votEventCommandName:kVOTEventCommandSystemToggleAppSwitcher];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateLockButton
{
  if (ActivateLockButton_onceToken != -1) {
    dispatch_once(&ActivateLockButton_onceToken, &__block_literal_global_1030);
  }
  v2 = (void *)ActivateLockButton__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ActivateLockButton__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateLockButton__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateLockButton" votEventCommandName:kVOTEventCommandSystemActivateLockButton];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ShowSpotlight
{
  if (ShowSpotlight_onceToken != -1) {
    dispatch_once(&ShowSpotlight_onceToken, &__block_literal_global_1035);
  }
  v2 = (void *)ShowSpotlight__Command;

  return (VOSCommand *)v2;
}

uint64_t __27__VOSCommand_ShowSpotlight__block_invoke()
{
  v0 = [VOSCommand alloc];
  ShowSpotlight__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ShowSpotlight" votEventCommandName:kVOTEventCommandSystemShowSpotlight];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ActivateAccessibilityShortcut
{
  if (ActivateAccessibilityShortcut_onceToken != -1) {
    dispatch_once(&ActivateAccessibilityShortcut_onceToken, &__block_literal_global_1040);
  }
  v2 = (void *)ActivateAccessibilityShortcut__Command;

  return (VOSCommand *)v2;
}

uint64_t __43__VOSCommand_ActivateAccessibilityShortcut__block_invoke()
{
  v0 = [VOSCommand alloc];
  ActivateAccessibilityShortcut__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ActivateAccessibilityShortcut" votEventCommandName:kVOTEventCommandSystemActivateAccessibilityShortcut];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleReachability
{
  if (ToggleReachability_onceToken != -1) {
    dispatch_once(&ToggleReachability_onceToken, &__block_literal_global_1045);
  }
  v2 = (void *)ToggleReachability__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_ToggleReachability__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleReachability__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleReachability" votEventCommandName:kVOTEventCommandSystemToggleReachability];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)TakeScreenshot
{
  if (TakeScreenshot_onceToken != -1) {
    dispatch_once(&TakeScreenshot_onceToken, &__block_literal_global_1050);
  }
  v2 = (void *)TakeScreenshot__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_TakeScreenshot__block_invoke()
{
  v0 = [VOSCommand alloc];
  TakeScreenshot__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"TakeScreenshot" votEventCommandName:kVOTEventCommandSystemTakeScreenshot];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)SwitchToPreviousApp
{
  if (SwitchToPreviousApp_onceToken != -1) {
    dispatch_once(&SwitchToPreviousApp_onceToken, &__block_literal_global_1055);
  }
  v2 = (void *)SwitchToPreviousApp__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_SwitchToPreviousApp__block_invoke()
{
  v0 = [VOSCommand alloc];
  SwitchToPreviousApp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"SwitchToPreviousApp" votEventCommandName:kVOTEventCommandSystemSwitchToPreviousApp];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)SwitchToNextApp
{
  if (SwitchToNextApp_onceToken != -1) {
    dispatch_once(&SwitchToNextApp_onceToken, &__block_literal_global_1060);
  }
  v2 = (void *)SwitchToNextApp__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_SwitchToNextApp__block_invoke()
{
  v0 = [VOSCommand alloc];
  SwitchToNextApp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"SwitchToNextApp" votEventCommandName:kVOTEventCommandSystemSwitchToNextApp];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleQuickNote
{
  if (ToggleQuickNote_onceToken != -1) {
    dispatch_once(&ToggleQuickNote_onceToken, &__block_literal_global_1065);
  }
  v2 = (void *)ToggleQuickNote__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_ToggleQuickNote__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleQuickNote__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleQuickNote" votEventCommandName:kVOTEventCommandSystemToggleQuickNote];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)PreviousHandwritingCharacterMode
{
  if (PreviousHandwritingCharacterMode_onceToken != -1) {
    dispatch_once(&PreviousHandwritingCharacterMode_onceToken, &__block_literal_global_1070);
  }
  v2 = (void *)PreviousHandwritingCharacterMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __46__VOSCommand_PreviousHandwritingCharacterMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  PreviousHandwritingCharacterMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"PreviousHandwritingCharacterMode" votEventCommandName:kVOTEventCommandHandwritingPreviousActiveCharacterSet];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)NextHandwritingCharacterMode
{
  if (NextHandwritingCharacterMode_onceToken != -1) {
    dispatch_once(&NextHandwritingCharacterMode_onceToken, &__block_literal_global_1075);
  }
  v2 = (void *)NextHandwritingCharacterMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_NextHandwritingCharacterMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  NextHandwritingCharacterMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"NextHandwritingCharacterMode" votEventCommandName:kVOTEventCommandHandwritingNextActiveCharacterSet];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)AnnounceHandwritingCharacterMode
{
  if (AnnounceHandwritingCharacterMode_onceToken != -1) {
    dispatch_once(&AnnounceHandwritingCharacterMode_onceToken, &__block_literal_global_1080);
  }
  v2 = (void *)AnnounceHandwritingCharacterMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __46__VOSCommand_AnnounceHandwritingCharacterMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  AnnounceHandwritingCharacterMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"AnnounceHandwritingCharacterMode" votEventCommandName:kVOTEventCommandHandwritingAnnounceActiveCharacterSet];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIPreviousBrailleMode
{
  if (BSIPreviousBrailleMode_onceToken != -1) {
    dispatch_once(&BSIPreviousBrailleMode_onceToken, &__block_literal_global_1085);
  }
  v2 = (void *)BSIPreviousBrailleMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_BSIPreviousBrailleMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIPreviousBrailleMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIPreviousBrailleMode" votEventCommandName:kVOTEventCommandBSIPreviousBrailleMode];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSINextBrailleMode
{
  if (BSINextBrailleMode_onceToken != -1) {
    dispatch_once(&BSINextBrailleMode_onceToken, &__block_literal_global_1090);
  }
  v2 = (void *)BSINextBrailleMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_BSINextBrailleMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSINextBrailleMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSINextBrailleMode" votEventCommandName:kVOTEventCommandBSINextBrailleMode];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIPreviousUsage
{
  if (BSIPreviousUsage_onceToken != -1) {
    dispatch_once(&BSIPreviousUsage_onceToken, &__block_literal_global_1095);
  }
  v2 = (void *)BSIPreviousUsage__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_BSIPreviousUsage__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIPreviousUsage__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIPreviousUsage" votEventCommandName:kVOTEventCommandBSIPreviousUsage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSINextUsage
{
  if (BSINextUsage_onceToken != -1) {
    dispatch_once(&BSINextUsage_onceToken, &__block_literal_global_1100);
  }
  v2 = (void *)BSINextUsage__Command;

  return (VOSCommand *)v2;
}

uint64_t __26__VOSCommand_BSINextUsage__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSINextUsage__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSINextUsage" votEventCommandName:kVOTEventCommandBSINextUsage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSITranslateImmediately
{
  if (BSITranslateImmediately_onceToken != -1) {
    dispatch_once(&BSITranslateImmediately_onceToken, &__block_literal_global_1105);
  }
  v2 = (void *)BSITranslateImmediately__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_BSITranslateImmediately__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSITranslateImmediately__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSITranslateImmediately" votEventCommandName:kVOTEventCommandBSITranslateImmediately];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIOrientationLock
{
  if (BSIOrientationLock_onceToken != -1) {
    dispatch_once(&BSIOrientationLock_onceToken, &__block_literal_global_1110);
  }
  v2 = (void *)BSIOrientationLock__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_BSIOrientationLock__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIOrientationLock__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIOrientationLock" votEventCommandName:kVOTEventCommandBSIOrientationLock];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIQuickAction
{
  if (BSIQuickAction_onceToken != -1) {
    dispatch_once(&BSIQuickAction_onceToken, &__block_literal_global_1115);
  }
  v2 = (void *)BSIQuickAction__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_BSIQuickAction__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIQuickAction__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIQuickAction" votEventCommandName:kVOTEventCommandBSIQuickAction];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIExit
{
  if (BSIExit_onceToken != -1) {
    dispatch_once(&BSIExit_onceToken, &__block_literal_global_1120);
  }
  v2 = (void *)BSIExit__Command;

  return (VOSCommand *)v2;
}

uint64_t __21__VOSCommand_BSIExit__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIExit__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIExit" votEventCommandName:kVOTEventCommandBSIExit];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIPreviousRotor
{
  if (BSIPreviousRotor_onceToken != -1) {
    dispatch_once(&BSIPreviousRotor_onceToken, &__block_literal_global_1125);
  }
  v2 = (void *)BSIPreviousRotor__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_BSIPreviousRotor__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIPreviousRotor__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIPreviousRotor" votEventCommandName:kVOTEventCommandBSIPreviousRotor];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSINextRotor
{
  if (BSINextRotor_onceToken != -1) {
    dispatch_once(&BSINextRotor_onceToken, &__block_literal_global_1130);
  }
  v2 = (void *)BSINextRotor__Command;

  return (VOSCommand *)v2;
}

uint64_t __26__VOSCommand_BSINextRotor__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSINextRotor__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSINextRotor" votEventCommandName:kVOTEventCommandBSINextRotor];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIEscape
{
  if (BSIEscape_onceToken != -1) {
    dispatch_once(&BSIEscape_onceToken, &__block_literal_global_1135);
  }
  v2 = (void *)BSIEscape__Command;

  return (VOSCommand *)v2;
}

uint64_t __23__VOSCommand_BSIEscape__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIEscape__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIEscape" votEventCommandName:kVOTEventCommandBSIEscape];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIPreviousTextSegment
{
  if (BSIPreviousTextSegment_onceToken != -1) {
    dispatch_once(&BSIPreviousTextSegment_onceToken, &__block_literal_global_1140);
  }
  v2 = (void *)BSIPreviousTextSegment__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_BSIPreviousTextSegment__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIPreviousTextSegment__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIPreviousTextSegment" votEventCommandName:kVOTEventCommandPreviousTextSegment];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSINextTextSegment
{
  if (BSINextTextSegment_onceToken != -1) {
    dispatch_once(&BSINextTextSegment_onceToken, &__block_literal_global_1145);
  }
  v2 = (void *)BSINextTextSegment__Command;

  return (VOSCommand *)v2;
}

uint64_t __32__VOSCommand_BSINextTextSegment__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSINextTextSegment__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSINextTextSegment" votEventCommandName:kVOTEventCommandNextTextSegment];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSISelectPreviousTextSegment
{
  if (BSISelectPreviousTextSegment_onceToken != -1) {
    dispatch_once(&BSISelectPreviousTextSegment_onceToken, &__block_literal_global_1150);
  }
  v2 = (void *)BSISelectPreviousTextSegment__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_BSISelectPreviousTextSegment__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSISelectPreviousTextSegment__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSISelectPreviousTextSegment" votEventCommandName:kVOTEventCommandSelectLeft];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSISelectNextTextSegment
{
  if (BSISelectNextTextSegment_onceToken != -1) {
    dispatch_once(&BSISelectNextTextSegment_onceToken, &__block_literal_global_1155);
  }
  v2 = (void *)BSISelectNextTextSegment__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_BSISelectNextTextSegment__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSISelectNextTextSegment__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSISelectNextTextSegment" votEventCommandName:kVOTEventCommandSelectRight];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSIPreviousTextSegmentType
{
  if (BSIPreviousTextSegmentType_onceToken != -1) {
    dispatch_once(&BSIPreviousTextSegmentType_onceToken, &__block_literal_global_1160);
  }
  v2 = (void *)BSIPreviousTextSegmentType__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_BSIPreviousTextSegmentType__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSIPreviousTextSegmentType__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSIPreviousTextSegmentType" votEventCommandName:kVOTEventCommandPreviousTextSegmentType];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BSINextTextSegmentType
{
  if (BSINextTextSegmentType_onceToken != -1) {
    dispatch_once(&BSINextTextSegmentType_onceToken, &__block_literal_global_1165);
  }
  v2 = (void *)BSINextTextSegmentType__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_BSINextTextSegmentType__block_invoke()
{
  v0 = [VOSCommand alloc];
  BSINextTextSegmentType__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BSINextTextSegmentType" votEventCommandName:kVOTEventCommandNextTextSegmentType];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BraillePanLeft
{
  if (BraillePanLeft_onceToken != -1) {
    dispatch_once(&BraillePanLeft_onceToken, &__block_literal_global_1170);
  }
  v2 = (void *)BraillePanLeft__Command;

  return (VOSCommand *)v2;
}

uint64_t __28__VOSCommand_BraillePanLeft__block_invoke()
{
  v0 = [VOSCommand alloc];
  BraillePanLeft__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BraillePanLeft" votEventCommandName:kVOTEventCommandBraillePanLeft];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BraillePanRight
{
  if (BraillePanRight_onceToken != -1) {
    dispatch_once(&BraillePanRight_onceToken, &__block_literal_global_1175);
  }
  v2 = (void *)BraillePanRight__Command;

  return (VOSCommand *)v2;
}

uint64_t __29__VOSCommand_BraillePanRight__block_invoke()
{
  v0 = [VOSCommand alloc];
  BraillePanRight__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BraillePanRight" votEventCommandName:kVOTEventCommandBraillePanRight];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleNextInputTable
{
  if (BrailleNextInputTable_onceToken != -1) {
    dispatch_once(&BrailleNextInputTable_onceToken, &__block_literal_global_1180);
  }
  v2 = (void *)BrailleNextInputTable__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_BrailleNextInputTable__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleNextInputTable__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleNextInputTable" votEventCommandName:kVOTEventCommandBrailleNextInputTable];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleNextOutputTable
{
  if (BrailleNextOutputTable_onceToken != -1) {
    dispatch_once(&BrailleNextOutputTable_onceToken, &__block_literal_global_1185);
  }
  v2 = (void *)BrailleNextOutputTable__Command;

  return (VOSCommand *)v2;
}

uint64_t __36__VOSCommand_BrailleNextOutputTable__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleNextOutputTable__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleNextOutputTable" votEventCommandName:kVOTEventCommandBrailleNextOutputTable];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleAnnouncementMode
{
  if (BrailleAnnouncementMode_onceToken != -1) {
    dispatch_once(&BrailleAnnouncementMode_onceToken, &__block_literal_global_1190);
  }
  v2 = (void *)BrailleAnnouncementMode__Command;

  return (VOSCommand *)v2;
}

uint64_t __37__VOSCommand_BrailleAnnouncementMode__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleAnnouncementMode__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleAnnouncementMode" votEventCommandName:kVOTEventCommandBrailleAnnouncementModeOn];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleTranslate
{
  if (BrailleTranslate_onceToken != -1) {
    dispatch_once(&BrailleTranslate_onceToken, &__block_literal_global_1195);
  }
  v2 = (void *)BrailleTranslate__Command;

  return (VOSCommand *)v2;
}

uint64_t __30__VOSCommand_BrailleTranslate__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleTranslate__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleTranslate" votEventCommandName:kVOTEventCommandBrailleTranslate];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleToggleWordWrap
{
  if (BrailleToggleWordWrap_onceToken != -1) {
    dispatch_once(&BrailleToggleWordWrap_onceToken, &__block_literal_global_1200);
  }
  v2 = (void *)BrailleToggleWordWrap__Command;

  return (VOSCommand *)v2;
}

uint64_t __35__VOSCommand_BrailleToggleWordWrap__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleToggleWordWrap__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleToggleWordWrap" votEventCommandName:kVOTEventCommandBrailleToggleWordWrap];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleTranslateToClipboard
{
  if (BrailleTranslateToClipboard_onceToken != -1) {
    dispatch_once(&BrailleTranslateToClipboard_onceToken, &__block_literal_global_1205);
  }
  v2 = (void *)BrailleTranslateToClipboard__Command;

  return (VOSCommand *)v2;
}

uint64_t __41__VOSCommand_BrailleTranslateToClipboard__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleTranslateToClipboard__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleTranslateToClipboard" votEventCommandName:kVOTEventCommandBrailleTranslateBrailleToClipboard];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleEnableAutoAdvance
{
  if (BrailleEnableAutoAdvance_onceToken != -1) {
    dispatch_once(&BrailleEnableAutoAdvance_onceToken, &__block_literal_global_1210);
  }
  v2 = (void *)BrailleEnableAutoAdvance__Command;

  return (VOSCommand *)v2;
}

uint64_t __38__VOSCommand_BrailleEnableAutoAdvance__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleEnableAutoAdvance__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleEnableAutoAdvance" votEventCommandName:kVOTEventCommandBrailleEnableAutoAdvance];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleIncreaseAutoAdvance
{
  if (BrailleIncreaseAutoAdvance_onceToken != -1) {
    dispatch_once(&BrailleIncreaseAutoAdvance_onceToken, &__block_literal_global_1215);
  }
  v2 = (void *)BrailleIncreaseAutoAdvance__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_BrailleIncreaseAutoAdvance__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleIncreaseAutoAdvance__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleIncreaseAutoAdvance" votEventCommandName:kVOTEventCommandBrailleIncreaseAutoAdvanceSpeed];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleDecreaseAutoAdvance
{
  if (BrailleDecreaseAutoAdvance_onceToken != -1) {
    dispatch_once(&BrailleDecreaseAutoAdvance_onceToken, &__block_literal_global_1220);
  }
  v2 = (void *)BrailleDecreaseAutoAdvance__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_BrailleDecreaseAutoAdvance__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleDecreaseAutoAdvance__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleDecreaseAutoAdvance" votEventCommandName:kVOTEventCommandBrailleDecreaseAutoAdvanceSpeed];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleReconnectBrailleDisplays
{
  if (BrailleReconnectBrailleDisplays_onceToken != -1) {
    dispatch_once(&BrailleReconnectBrailleDisplays_onceToken, &__block_literal_global_1225);
  }
  v2 = (void *)BrailleReconnectBrailleDisplays__Command;

  return (VOSCommand *)v2;
}

uint64_t __45__VOSCommand_BrailleReconnectBrailleDisplays__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleReconnectBrailleDisplays__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleReconnectBrailleDisplays" votEventCommandName:kVOTEventCommandReconnectBrailleDisplays];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)BrailleTogglePerkinsKeyboardInput
{
  if (BrailleTogglePerkinsKeyboardInput_onceToken != -1) {
    dispatch_once(&BrailleTogglePerkinsKeyboardInput_onceToken, &__block_literal_global_1230);
  }
  v2 = (void *)BrailleTogglePerkinsKeyboardInput__Command;

  return (VOSCommand *)v2;
}

uint64_t __47__VOSCommand_BrailleTogglePerkinsKeyboardInput__block_invoke()
{
  v0 = [VOSCommand alloc];
  BrailleTogglePerkinsKeyboardInput__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"BrailleTogglePerkinsKeyboardInput" votEventCommandName:kVOTEventCommandTogglePerkinsKeyboardInput];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputInsertSpace
{
  if (GesturedTextInputInsertSpace_onceToken != -1) {
    dispatch_once(&GesturedTextInputInsertSpace_onceToken, &__block_literal_global_1235);
  }
  v2 = (void *)GesturedTextInputInsertSpace__Command;

  return (VOSCommand *)v2;
}

uint64_t __42__VOSCommand_GesturedTextInputInsertSpace__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputInsertSpace__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputInsertSpace" votEventCommandName:kVOTEventCommandGesturedTextInputInsertSpace];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputBackspace
{
  if (GesturedTextInputBackspace_onceToken != -1) {
    dispatch_once(&GesturedTextInputBackspace_onceToken, &__block_literal_global_1240);
  }
  v2 = (void *)GesturedTextInputBackspace__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_GesturedTextInputBackspace__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputBackspace__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputBackspace" votEventCommandName:kVOTEventCommandGesturedTextInputBackspace];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputDeleteWord
{
  if (GesturedTextInputDeleteWord_onceToken != -1) {
    dispatch_once(&GesturedTextInputDeleteWord_onceToken, &__block_literal_global_1245);
  }
  v2 = (void *)GesturedTextInputDeleteWord__Command;

  return (VOSCommand *)v2;
}

uint64_t __41__VOSCommand_GesturedTextInputDeleteWord__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputDeleteWord__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputDeleteWord" votEventCommandName:kVOTEventCommandGesturedTextInputDeleteWord];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputPerformReturnEquivalent
{
  if (GesturedTextInputPerformReturnEquivalent_onceToken != -1) {
    dispatch_once(&GesturedTextInputPerformReturnEquivalent_onceToken, &__block_literal_global_1250);
  }
  v2 = (void *)GesturedTextInputPerformReturnEquivalent__Command;

  return (VOSCommand *)v2;
}

uint64_t __54__VOSCommand_GesturedTextInputPerformReturnEquivalent__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputPerformReturnEquivalent__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputPerformReturnEquivalent" votEventCommandName:kVOTEventCommandGesturedTextInputPerformReturnEquivalent];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputPreviousSuggestion
{
  if (GesturedTextInputPreviousSuggestion_onceToken != -1) {
    dispatch_once(&GesturedTextInputPreviousSuggestion_onceToken, &__block_literal_global_1255);
  }
  v2 = (void *)GesturedTextInputPreviousSuggestion__Command;

  return (VOSCommand *)v2;
}

uint64_t __49__VOSCommand_GesturedTextInputPreviousSuggestion__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputPreviousSuggestion__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputPreviousSuggestion" votEventCommandName:kVOTEventCommandGesturedTextInputPreviousSuggestion];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputNextSuggestion
{
  if (GesturedTextInputNextSuggestion_onceToken != -1) {
    dispatch_once(&GesturedTextInputNextSuggestion_onceToken, &__block_literal_global_1260);
  }
  v2 = (void *)GesturedTextInputNextSuggestion__Command;

  return (VOSCommand *)v2;
}

uint64_t __45__VOSCommand_GesturedTextInputNextSuggestion__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputNextSuggestion__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputNextSuggestion" votEventCommandName:kVOTEventCommandGesturedTextInputNextSuggestion];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputLaunchApp
{
  if (GesturedTextInputLaunchApp_onceToken != -1) {
    dispatch_once(&GesturedTextInputLaunchApp_onceToken, &__block_literal_global_1265);
  }
  v2 = (void *)GesturedTextInputLaunchApp__Command;

  return (VOSCommand *)v2;
}

uint64_t __40__VOSCommand_GesturedTextInputLaunchApp__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputLaunchApp__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputLaunchApp" votEventCommandName:kVOTEventCommandGesturedTextInputLaunchApp];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputNextKeyboardLanguage
{
  if (GesturedTextInputNextKeyboardLanguage_onceToken != -1) {
    dispatch_once(&GesturedTextInputNextKeyboardLanguage_onceToken, &__block_literal_global_1270);
  }
  v2 = (void *)GesturedTextInputNextKeyboardLanguage__Command;

  return (VOSCommand *)v2;
}

uint64_t __51__VOSCommand_GesturedTextInputNextKeyboardLanguage__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputNextKeyboardLanguage__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputNextKeyboardLanguage" votEventCommandName:kVOTEventCommandGesturedTextInputNextKeyboardLanguage];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)GesturedTextInputNextBrailleTable
{
  if (GesturedTextInputNextBrailleTable_onceToken != -1) {
    dispatch_once(&GesturedTextInputNextBrailleTable_onceToken, &__block_literal_global_1275);
  }
  v2 = (void *)GesturedTextInputNextBrailleTable__Command;

  return (VOSCommand *)v2;
}

uint64_t __47__VOSCommand_GesturedTextInputNextBrailleTable__block_invoke()
{
  v0 = [VOSCommand alloc];
  GesturedTextInputNextBrailleTable__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"GesturedTextInputNextBrailleTable" votEventCommandName:kVOTEventCommandGesturedTextInputNextBrailleTable];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)DescribeCameraScene
{
  if (DescribeCameraScene_onceToken != -1) {
    dispatch_once(&DescribeCameraScene_onceToken, &__block_literal_global_1280);
  }
  v2 = (void *)DescribeCameraScene__Command;

  return (VOSCommand *)v2;
}

uint64_t __33__VOSCommand_DescribeCameraScene__block_invoke()
{
  v0 = [VOSCommand alloc];
  DescribeCameraScene__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"DescribeCameraScene" votEventCommandName:kVOTEventCommandDescribeCameraScene];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveIn
{
  if (MoveIn_onceToken != -1) {
    dispatch_once(&MoveIn_onceToken, &__block_literal_global_1285);
  }
  v2 = (void *)MoveIn__Command;

  return (VOSCommand *)v2;
}

uint64_t __20__VOSCommand_MoveIn__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveIn__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveIn" votEventCommandName:kVOTEventCommandMoveIn];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)MoveOut
{
  if (MoveOut_onceToken != -1) {
    dispatch_once(&MoveOut_onceToken, &__block_literal_global_1290);
  }
  v2 = (void *)MoveOut__Command;

  return (VOSCommand *)v2;
}

uint64_t __21__VOSCommand_MoveOut__block_invoke()
{
  v0 = [VOSCommand alloc];
  MoveOut__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"MoveOut" votEventCommandName:kVOTEventCommandMoveOut];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)ToggleSettingsHUD
{
  if (ToggleSettingsHUD_onceToken != -1) {
    dispatch_once(&ToggleSettingsHUD_onceToken, &__block_literal_global_1295);
  }
  v2 = (void *)ToggleSettingsHUD__Command;

  return (VOSCommand *)v2;
}

uint64_t __31__VOSCommand_ToggleSettingsHUD__block_invoke()
{
  v0 = [VOSCommand alloc];
  ToggleSettingsHUD__Command = [(VOSCommand *)v0 _initBuiltInCommandWithRawValue:@"ToggleSettingsHUD" votEventCommandName:kVOTEventCommandToggleSettingsHUD];

  return MEMORY[0x270F9A758]();
}

+ (VOSCommand)Invalid
{
  if (Invalid_onceToken_1 != -1) {
    dispatch_once(&Invalid_onceToken_1, &__block_literal_global_1300);
  }
  v2 = (void *)Invalid__Command;

  return (VOSCommand *)v2;
}

uint64_t __21__VOSCommand_Invalid__block_invoke()
{
  Invalid__Command = [[VOSCommand alloc] _initBuiltInCommandWithRawValue:@"Invalid" votEventCommandName:0];

  return MEMORY[0x270F9A758]();
}

+ (NSSet)allBuiltInCommands
{
  if (allBuiltInCommands_onceToken != -1) {
    dispatch_once(&allBuiltInCommands_onceToken, &__block_literal_global_1305);
  }
  v2 = (void *)allBuiltInCommands__AllCommands;

  return (NSSet *)v2;
}

void __32__VOSCommand_allBuiltInCommands__block_invoke()
{
  objc_super v12 = (void *)MEMORY[0x263EFFA08];
  v207 = +[VOSCommand None];
  v206 = +[VOSCommand PrimaryActivate];
  v205 = +[VOSCommand SecondaryActivate];
  v204 = +[VOSCommand PerformLongPress];
  v203 = +[VOSCommand MoveToPreviousElement];
  v202 = +[VOSCommand MoveToNextElement];
  v201 = +[VOSCommand MoveToFirstElement];
  v200 = +[VOSCommand MoveToFirstWord];
  v199 = +[VOSCommand MoveToLastElement];
  v198 = +[VOSCommand MoveToCenterElement];
  v197 = +[VOSCommand MoveToLastWord];
  v196 = +[VOSCommand MoveToElementAbove];
  v195 = +[VOSCommand MoveToElementBelow];
  v194 = +[VOSCommand MoveToPreviousElementCommunity];
  v193 = +[VOSCommand MoveToNextElementCommunity];
  v192 = +[VOSCommand MoveToPreviousContainer];
  v191 = +[VOSCommand MoveToNextContainer];
  v190 = +[VOSCommand MoveToTopOfCurrentContainer];
  v189 = +[VOSCommand MoveToBottomOfCurrentContainer];
  v188 = +[VOSCommand MoveToTopOfCurrentDocument];
  v187 = +[VOSCommand MoveToBottomOfCurrentDocument];
  v186 = +[VOSCommand MoveToPreviousCharacter];
  v185 = +[VOSCommand MoveToNextCharacter];
  v184 = +[VOSCommand MoveToPreviousWord];
  v183 = +[VOSCommand MoveToNextWord];
  v182 = +[VOSCommand MoveToPreviousSentence];
  v181 = +[VOSCommand MoveToNextSentence];
  v180 = +[VOSCommand MoveToPreviousParagraph];
  v179 = +[VOSCommand MoveToNextParagraph];
  v178 = +[VOSCommand MoveToStatusBar];
  v177 = +[VOSCommand MoveToLinkedUI];
  v176 = +[VOSCommand MoveToSystemFocusedElement];
  v175 = +[VOSCommand MoveToNextGraphic];
  v174 = +[VOSCommand MoveToPreviousGraphic];
  v173 = +[VOSCommand MoveToNextHeading];
  v172 = +[VOSCommand MoveToPreviousHeading];
  v171 = +[VOSCommand MoveToNextTable];
  v170 = +[VOSCommand MoveToPreviousTable];
  v169 = +[VOSCommand MoveToNextList];
  v168 = +[VOSCommand MoveToPreviousList];
  v167 = +[VOSCommand MoveToNextSameElement];
  v166 = +[VOSCommand MoveToPreviousSameElement];
  v165 = +[VOSCommand MoveToNextControl];
  v164 = +[VOSCommand MoveToPreviousControl];
  v163 = +[VOSCommand MoveToNextLink];
  v162 = +[VOSCommand MoveToPreviousLink];
  v161 = +[VOSCommand MoveToNextBlockquote];
  v160 = +[VOSCommand MoveToPreviousBlockquote];
  v159 = +[VOSCommand MoveToNextSameBlockquote];
  v158 = +[VOSCommand MoveToPreviousSameBlockquote];
  v157 = +[VOSCommand MoveToNextVisitedLink];
  v156 = +[VOSCommand MoveToPreviousVisitedLink];
  v155 = +[VOSCommand MoveToNextSameHeading];
  v154 = +[VOSCommand MoveToPreviousSameHeading];
  v153 = +[VOSCommand MoveToNextBoldText];
  v152 = +[VOSCommand MoveToPreviousBoldText];
  v151 = +[VOSCommand MoveToNextMisspelledWord];
  v150 = +[VOSCommand MoveToPreviousMisspelledWord];
  v149 = +[VOSCommand MoveToNextPlainText];
  v148 = +[VOSCommand MoveToPreviousPlainText];
  v147 = +[VOSCommand MoveToNextColorChange];
  v146 = +[VOSCommand MoveToPreviousColorChange];
  v145 = +[VOSCommand MoveToNextItalicText];
  v144 = +[VOSCommand MoveToPreviousItalicText];
  v143 = +[VOSCommand MoveToNextUnderlineText];
  v142 = +[VOSCommand MoveToPreviousUnderlineText];
  v141 = +[VOSCommand MoveToNextDifferentElement];
  v140 = +[VOSCommand MoveToPreviousDifferentElement];
  v139 = +[VOSCommand MoveToNextColumn];
  v138 = +[VOSCommand MoveToPreviousColumn];
  v137 = +[VOSCommand MoveToNextFontChange];
  v136 = +[VOSCommand MoveToPreviousFontChange];
  v135 = +[VOSCommand MoveToNextFrame];
  v134 = +[VOSCommand MoveToPreviousFrame];
  v133 = +[VOSCommand MoveToNextStyleChange];
  v132 = +[VOSCommand MoveToPreviousStyleChange];
  v131 = +[VOSCommand FindElementWithTextSearch];
  v130 = +[VOSCommand PreviousSearchResult];
  v129 = +[VOSCommand NextSearchResult];
  v128 = +[VOSCommand Copy];
  v127 = +[VOSCommand Cut];
  v126 = +[VOSCommand Paste];
  v125 = +[VOSCommand Undo];
  v124 = +[VOSCommand Redo];
  v123 = +[VOSCommand ToggleTextSelection];
  v122 = +[VOSCommand SummarizeElement];
  v121 = +[VOSCommand SummarizeSystemFocusedElement];
  v120 = +[VOSCommand ReadSystemFocusedElementDetails];
  v119 = +[VOSCommand PreviewElementWith3DTouch];
  v118 = +[VOSCommand AnalyzeElement];
  v117 = +[VOSCommand ReadAll];
  v116 = +[VOSCommand ReadFromTop];
  v115 = +[VOSCommand ReadLine];
  v114 = +[VOSCommand ReadWord];
  v113 = +[VOSCommand ReadHint];
  v112 = +[VOSCommand ReadTextStyle];
  v111 = +[VOSCommand ReadURL];
  v110 = +[VOSCommand ReadSelectedText];
  v109 = +[VOSCommand ReadCharacter];
  v108 = +[VOSCommand ReadCharacterPhonetically];
  v107 = +[VOSCommand ReadRowHeader];
  v106 = +[VOSCommand ReadRowContents];
  v105 = +[VOSCommand ReadTableRowColumn];
  v104 = +[VOSCommand ReadColumnHeader];
  v103 = +[VOSCommand ReadColumnContents];
  v102 = +[VOSCommand ReadTableRowColumnCell];
  v101 = +[VOSCommand ReadLineCount];
  v100 = +[VOSCommand ToggleSpeech];
  v99 = +[VOSCommand ToggleMute];
  v98 = +[VOSCommand ToggleScreenCurtain];
  v97 = +[VOSCommand ToggleSoundCurtain];
  v96 = +[VOSCommand ShowItemChooser];
  v95 = +[VOSCommand OpenVoiceOverSettings];
  v94 = +[VOSCommand StartHelp];
  v93 = +[VOSCommand MagicTap];
  v92 = +[VOSCommand Escape];
  v91 = +[VOSCommand ScrollUp];
  v90 = +[VOSCommand ScrollDown];
  v89 = +[VOSCommand ScrollLeft];
  v88 = +[VOSCommand ScrollRight];
  v87 = +[VOSCommand ScrollToTop];
  v86 = +[VOSCommand ScrollToBottom];
  v85 = +[VOSCommand PreviousRotor];
  v84 = +[VOSCommand NextRotor];
  v83 = +[VOSCommand PreviousRotorItem];
  v82 = +[VOSCommand NextRotorItem];
  v81 = +[VOSCommand CopySpeechToClipboard];
  v80 = +[VOSCommand ToggleCaptionPanel];
  v79 = +[VOSCommand LabelElement];
  v78 = +[VOSCommand DescribeImage];
  v77 = +[VOSCommand LaunchPeopleDetection];
  v76 = +[VOSCommand MonitorElement];
  v75 = +[VOSCommand ActivateBrailleScreenInput];
  v74 = +[VOSCommand ActivateBrailleScreenInputCommand];
  v73 = +[VOSCommand ToggleSingleLetterQuickNav];
  v72 = +[VOSCommand ToggleQuickNav];
  v71 = +[VOSCommand ToggleLockModifierKeys];
  v70 = +[VOSCommand ChangeAudioDuckingMode];
  v69 = +[VOSCommand ToggleNavigationStyle];
  v68 = +[VOSCommand ToggleSyncNativeAndExploreFocus];
  v67 = +[VOSCommand ToggleAutomaticAccessibility];
  v66 = +[VOSCommand VolumeUp];
  v65 = +[VOSCommand VolumeDown];
  v64 = +[VOSCommand ToggleLiveRegions];
  v63 = +[VOSCommand ShowNotificationCenter];
  v62 = +[VOSCommand ToggleTypeToSiri];
  v61 = +[VOSCommand ShowControlCenter];
  v60 = +[VOSCommand ActivateSpeakScreen];
  v59 = +[VOSCommand ActivateHomeButton];
  v58 = +[VOSCommand ToggleDock];
  v57 = +[VOSCommand ToggleAppSwitcher];
  v56 = +[VOSCommand ActivateLockButton];
  v55 = +[VOSCommand ShowSpotlight];
  v54 = +[VOSCommand ActivateAccessibilityShortcut];
  v53 = +[VOSCommand ToggleReachability];
  v52 = +[VOSCommand TakeScreenshot];
  v51 = +[VOSCommand SwitchToPreviousApp];
  v50 = +[VOSCommand SwitchToNextApp];
  v49 = +[VOSCommand ToggleQuickNote];
  v48 = +[VOSCommand PreviousHandwritingCharacterMode];
  v47 = +[VOSCommand NextHandwritingCharacterMode];
  v46 = +[VOSCommand AnnounceHandwritingCharacterMode];
  v45 = +[VOSCommand BSIPreviousBrailleMode];
  v44 = +[VOSCommand BSINextBrailleMode];
  v43 = +[VOSCommand BSIPreviousUsage];
  v42 = +[VOSCommand BSINextUsage];
  v41 = +[VOSCommand BSITranslateImmediately];
  v40 = +[VOSCommand BSIOrientationLock];
  v39 = +[VOSCommand BSIQuickAction];
  v38 = +[VOSCommand BSIExit];
  v37 = +[VOSCommand BSIPreviousRotor];
  v36 = +[VOSCommand BSINextRotor];
  v35 = +[VOSCommand BSIEscape];
  v34 = +[VOSCommand BSIPreviousTextSegment];
  v33 = +[VOSCommand BSINextTextSegment];
  v32 = +[VOSCommand BSISelectPreviousTextSegment];
  v31 = +[VOSCommand BSISelectNextTextSegment];
  v30 = +[VOSCommand BSIPreviousTextSegmentType];
  v29 = +[VOSCommand BSINextTextSegmentType];
  v28 = +[VOSCommand BraillePanLeft];
  v27 = +[VOSCommand BraillePanRight];
  v26 = +[VOSCommand BrailleNextInputTable];
  v25 = +[VOSCommand BrailleNextOutputTable];
  v24 = +[VOSCommand BrailleAnnouncementMode];
  v23 = +[VOSCommand BrailleTranslate];
  v22 = +[VOSCommand BrailleToggleWordWrap];
  v21 = +[VOSCommand BrailleTranslateToClipboard];
  v20 = +[VOSCommand BrailleEnableAutoAdvance];
  v19 = +[VOSCommand BrailleIncreaseAutoAdvance];
  v18 = +[VOSCommand BrailleDecreaseAutoAdvance];
  v17 = +[VOSCommand BrailleReconnectBrailleDisplays];
  v16 = +[VOSCommand BrailleTogglePerkinsKeyboardInput];
  v15 = +[VOSCommand GesturedTextInputInsertSpace];
  v14 = +[VOSCommand GesturedTextInputBackspace];
  v13 = +[VOSCommand GesturedTextInputDeleteWord];
  v0 = +[VOSCommand GesturedTextInputPerformReturnEquivalent];
  v1 = +[VOSCommand GesturedTextInputPreviousSuggestion];
  v2 = +[VOSCommand GesturedTextInputNextSuggestion];
  int64_t v3 = +[VOSCommand GesturedTextInputLaunchApp];
  id v4 = +[VOSCommand GesturedTextInputNextKeyboardLanguage];
  id v5 = +[VOSCommand GesturedTextInputNextBrailleTable];
  v6 = +[VOSCommand DescribeCameraScene];
  id v7 = +[VOSCommand ToggleSettingsHUD];
  id v8 = +[VOSCommand MoveIn];
  v11 = +[VOSCommand MoveOut];
  objc_msgSend(v12, "setWithObjects:", v207, v206, v205, v204, v203, v202, v201, v200, v199, v198, v197, v196, v195, v194, v193, v192, v191,
    v190,
    v189,
    v188,
    v187,
    v186,
    v185,
    v184,
    v183,
    v182,
    v181,
    v180,
    v179,
    v178,
    v177,
    v176,
    v175,
    v174,
    v173,
    v172,
    v171,
    v170,
    v169,
    v168,
    v167,
    v166,
    v165,
    v164,
    v163,
    v162,
    v161,
    v160,
    v159,
    v158,
    v157,
    v156,
    v155,
    v154,
    v153,
    v152,
    v151,
    v150,
    v149,
    v148,
  uint64_t v9 = v147);
  v10 = (void *)allBuiltInCommands__AllCommands;
  allBuiltInCommands__AllCommands = v9;
}

+ (id)builtInCommandWithStringValue:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(a1, "allBuiltInCommands", 0);
  v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9[1] isEqualToString:v4])
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)commandForVOSEventCommand:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = +[VOSCommand allBuiltInCommands];
    id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = [v8 votEventCommandName];
          char v10 = [v9 isEqualToString:v3];

          if (v10)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (-[VOSCommand commandType](self, "commandType") || [v5 commandType])
    {
      if (-[VOSCommand commandType](self, "commandType") != 1 || [v5 commandType] != 1)
      {
        char v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v6 = [(VOSCommand *)self siriShortcut];
      uint64_t v7 = [v6 identifier];
      id v8 = [v5 siriShortcut];
      uint64_t v9 = [v8 identifier];
      char v10 = [v7 isEqual:v9];
    }
    else
    {
      uint64_t v6 = [(VOSCommand *)self rawValue];
      uint64_t v7 = [v5 rawValue];
      char v10 = [v6 isEqualToString:v7];
    }

    goto LABEL_11;
  }
  char v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(VOSCommand *)self commandType];
  if (v3 == 1)
  {
    id v4 = [(VOSCommand *)self siriShortcut];
    uint64_t v6 = [v4 identifier];
    unint64_t v5 = [v6 hash];
  }
  else
  {
    if (v3) {
      return 0;
    }
    id v4 = [(VOSCommand *)self rawValue];
    unint64_t v5 = [v4 hash];
  }

  return v5;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (AXSiriShortcut)siriShortcut
{
  return self->_siriShortcut;
}

- (NSString)localizedName
{
  if (![(NSString *)self->_rawValue hasPrefix:@"Braille"]
    || (int64_t v3 = objc_opt_new(),
        [(VOSCommand *)self votEventCommandName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 localizedNameForCommand:v4],
        unint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    int64_t commandType = self->_commandType;
    if (commandType == 1)
    {
      unint64_t v5 = [(AXSiriShortcut *)self->_siriShortcut shortcutName];
    }
    else if (commandType)
    {
      unint64_t v5 = 0;
    }
    else
    {
      uint64_t v7 = [NSString stringWithFormat:@"VOSCommand.%@", self->_rawValue];
      unint64_t v5 = VOSLocString(v7);
    }
  }

  return (NSString *)v5;
}

- (NSString)votEventCommandName
{
  return self->_votEventCommandName;
}

- (void)setVotEventCommandName:(id)a3
{
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(int64_t)a3
{
  self->_int64_t commandType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_votEventCommandName, 0);
  objc_storeStrong((id *)&self->_siriShortcut, 0);

  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end