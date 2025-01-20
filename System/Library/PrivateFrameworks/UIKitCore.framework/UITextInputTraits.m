@interface UITextInputTraits
+ (BOOL)keyboardTypeRequiresASCIICapable:(int64_t)a3;
+ (id)defaultTextInputTraits;
+ (id)traitEnvironmentFromTraits:(id)a3;
+ (id)traitsByAdoptingTraits:(id)a3;
+ (id)traitsByAdoptingTraits:(id)a3 lightweight:(BOOL)a4;
+ (int64_t)accessibleAppearanceForAppearance:(int64_t)a3;
+ (int64_t)configuredAppearanceForAppearance:(int64_t)a3 withTraitEnvironment:(id)a4;
+ (int64_t)translateToPublicUIKeyboardAppearance:(unint64_t)a3;
+ (int64_t)translateToUIAutocapitalizationType:(unint64_t)a3;
+ (int64_t)translateToUIAutocorrectionType:(unint64_t)a3;
+ (int64_t)translateToUIInlinePredictionType:(unint64_t)a3;
+ (int64_t)translateToUIKeyboardAppearance:(unint64_t)a3;
+ (int64_t)translateToUIKeyboardType:(unint64_t)a3;
+ (int64_t)translateToUIReturnKeyType:(unint64_t)a3;
+ (int64_t)translateToUISmartDashesType:(unint64_t)a3;
+ (int64_t)translateToUISmartInsertDeleteEnabled:(BOOL)a3;
+ (int64_t)translateToUISmartQuotesType:(unint64_t)a3;
+ (int64_t)translateToUISpellCheckingType:(unint64_t)a3;
+ (int64_t)translateToUITextAllowsTextAnimationsType:(int64_t)a3;
+ (int64_t)translateToUITextMathExpressionCompletionType:(int64_t)a3;
+ (int64_t)translateToUITextScriptType:(unint64_t)a3;
- (BOOL)acceptsDictationSearchResults;
- (BOOL)acceptsEmoji;
- (BOOL)acceptsFloatingKeyboard;
- (BOOL)acceptsInitialEmojiKeyboard;
- (BOOL)acceptsPayloads;
- (BOOL)acceptsSplitKeyboard;
- (BOOL)allowsSuggestionsOnlyMode;
- (BOOL)contentsIsSingleValue;
- (BOOL)deferBecomingResponder;
- (BOOL)disableHandwritingKeyboard;
- (BOOL)disableInputBars;
- (BOOL)disablePrediction;
- (BOOL)displaySecureEditsUsingPlainText;
- (BOOL)displaySecureTextUsingPlainText;
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)enablesReturnKeyOnNonWhiteSpaceContent;
- (BOOL)forceDefaultDictationInfo;
- (BOOL)forceDisableDictation;
- (BOOL)forceEnableDictation;
- (BOOL)forceFloatingKeyboard;
- (BOOL)forceSpellingDictation;
- (BOOL)hasDefaultContents;
- (BOOL)hidePrediction;
- (BOOL)isCarPlayIdiom;
- (BOOL)isDevicePasscodeEntry;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecureTextEntry;
- (BOOL)isSingleLineDocument;
- (BOOL)learnsCorrections;
- (BOOL)loadKeyboardsForSiriLanguage;
- (BOOL)manageRecentInputs;
- (BOOL)preferOnlineDictation;
- (BOOL)publicTraitsMatchTraits:(id)a3;
- (BOOL)returnKeyGoesToNextResponder;
- (BOOL)showDictationButton;
- (BOOL)suppressReturnKeyStyling;
- (BOOL)useAutomaticEndpointing;
- (BOOL)useInterfaceLanguageForLocalization;
- (BOOL)wasEverSecureTextEntry;
- (NSIndexSet)PINEntrySeparatorIndexes;
- (NSString)autocorrectionContext;
- (NSString)description;
- (NSString)recentInputIdentifier;
- (NSString)responseContext;
- (NSString)textContentType;
- (UIColor)insertionPointColor;
- (UIColor)matchHighlightColor;
- (UIColor)selectionBarColor;
- (UIColor)selectionBorderColor;
- (UIColor)selectionHighlightColor;
- (UIEdgeInsets)floatingKeyboardEdgeInsets;
- (UIEdgeInsets)selectionEdgeInsets;
- (UIImage)selectionDragDotImage;
- (UIImage)supplementalLexiconAmbiguousItemIcon;
- (UIInputContextHistory)inputContextHistory;
- (UITextInputPasswordRules)passwordRules;
- (UITextInputTraits)init;
- (_NSRange)validTextRange;
- (_UISupplementalLexicon)supplementalLexicon;
- (__CFCharacterSet)textTrimmingSet;
- (double)selectionBorderWidth;
- (double)selectionCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)textSuggestionDelegate;
- (int)emptyContentReturnKeyType;
- (int)shortcutConversionType;
- (int)textLoupeVisibility;
- (int)textSelectionBehavior;
- (int64_t)allowsTextAnimationsType;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)dictationInfoKeyboardType;
- (int64_t)dictationKeyboardType;
- (int64_t)forceDictationKeyboardType;
- (int64_t)inlineCompletionType;
- (int64_t)inlinePredictionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)mathExpressionCompletionType;
- (int64_t)preferredKeyboardStyle;
- (int64_t)returnKeyType;
- (int64_t)smartDashesType;
- (int64_t)smartInsertDeleteType;
- (int64_t)smartQuotesType;
- (int64_t)spellCheckingType;
- (int64_t)textScriptType;
- (int64_t)updateResultComparedToTraits:(id)a3;
- (int64_t)writingToolsBehavior;
- (unint64_t)allowedWritingToolsResultOptions;
- (unint64_t)insertionPointWidth;
- (void)_setColorsToMatchTintColor:(id)a3;
- (void)dealloc;
- (void)extendedPathToObtainTraitsFrom:(id)a3 lightweight:(BOOL)a4;
- (void)fastPathToObtainTraitsFrom:(id)a3;
- (void)overlayWithTITextInputTraits:(id)a3;
- (void)overrideWithPrivateTraits:(id)a3;
- (void)overrideWithTraits:(id)a3;
- (void)setAcceptsDictationSearchResults:(BOOL)a3;
- (void)setAcceptsEmoji:(BOOL)a3;
- (void)setAcceptsFloatingKeyboard:(BOOL)a3;
- (void)setAcceptsInitialEmojiKeyboard:(BOOL)a3;
- (void)setAcceptsPayloads:(BOOL)a3;
- (void)setAcceptsSplitKeyboard:(BOOL)a3;
- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3;
- (void)setAllowsTextAnimationsType:(int64_t)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionContext:(id)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setContentsIsSingleValue:(BOOL)a3;
- (void)setDeferBecomingResponder:(BOOL)a3;
- (void)setDevicePasscodeEntry:(BOOL)a3;
- (void)setDisableHandwritingKeyboard:(BOOL)a3;
- (void)setDisableInputBars:(BOOL)a3;
- (void)setDisablePrediction:(BOOL)a3;
- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3;
- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3;
- (void)setEmptyContentReturnKeyType:(int)a3;
- (void)setEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)setEnablesReturnKeyOnNonWhiteSpaceContent:(BOOL)a3;
- (void)setFloatingKeyboardEdgeInsets:(UIEdgeInsets)a3;
- (void)setForceDefaultDictationInfo:(BOOL)a3;
- (void)setForceDictationKeyboardType:(int64_t)a3;
- (void)setForceDisableDictation:(BOOL)a3;
- (void)setForceEnableDictation:(BOOL)a3;
- (void)setForceFloatingKeyboard:(BOOL)a3;
- (void)setForceSpellingDictation:(BOOL)a3;
- (void)setHasDefaultContents:(BOOL)a3;
- (void)setHidePrediction:(BOOL)a3;
- (void)setInlineCompletionType:(int64_t)a3;
- (void)setInlinePredictionType:(int64_t)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInsertionPointColor:(id)a3;
- (void)setInsertionPointWidth:(unint64_t)a3;
- (void)setIsCarPlayIdiom:(BOOL)a3;
- (void)setIsSingleLineDocument:(BOOL)a3;
- (void)setKeyboardAppearance:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setLearnsCorrections:(BOOL)a3;
- (void)setLoadKeyboardsForSiriLanguage:(BOOL)a3;
- (void)setManageRecentInputs:(BOOL)a3;
- (void)setMatchHighlightColor:(id)a3;
- (void)setMathExpressionCompletionType:(int64_t)a3;
- (void)setPINEntrySeparatorIndexes:(id)a3;
- (void)setPasswordRules:(id)a3;
- (void)setPreferOnlineDictation:(BOOL)a3;
- (void)setPreferredKeyboardStyle:(int64_t)a3;
- (void)setRecentInputIdentifier:(id)a3;
- (void)setResponseContext:(id)a3;
- (void)setReturnKeyGoesToNextResponder:(BOOL)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectionBarColor:(id)a3;
- (void)setSelectionBorderColor:(id)a3;
- (void)setSelectionBorderWidth:(double)a3;
- (void)setSelectionCornerRadius:(double)a3;
- (void)setSelectionDragDotImage:(id)a3;
- (void)setSelectionEdgeInsets:(UIEdgeInsets)a3;
- (void)setSelectionHighlightColor:(id)a3;
- (void)setShortcutConversionType:(int)a3;
- (void)setShowDictationButton:(BOOL)a3;
- (void)setSmartDashesType:(int64_t)a3;
- (void)setSmartInsertDeleteType:(int64_t)a3;
- (void)setSmartQuotesType:(int64_t)a3;
- (void)setSpellCheckingType:(int64_t)a3;
- (void)setSupplementalLexicon:(id)a3;
- (void)setSupplementalLexiconAmbiguousItemIcon:(id)a3;
- (void)setSuppressReturnKeyStyling:(BOOL)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextLoupeVisibility:(int)a3;
- (void)setTextScriptType:(int64_t)a3;
- (void)setTextSelectionBehavior:(int)a3;
- (void)setTextSuggestionDelegate:(id)a3;
- (void)setTextTrimmingSet:(__CFCharacterSet *)a3;
- (void)setToDefaultValues;
- (void)setToSecureValues;
- (void)setUseAutomaticEndpointing:(BOOL)a3;
- (void)setUseInterfaceLanguageForLocalization:(BOOL)a3;
- (void)setValidTextRange:(_NSRange)a3;
- (void)setWritingToolsBehavior:(int64_t)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)takeTraitsFrom:(id)a3 lightweight:(BOOL)a4;
@end

@implementation UITextInputTraits

- (BOOL)isSecureTextEntry
{
  return self->secureTextEntry;
}

- (void)dealloc
{
  textTrimmingSet = self->textTrimmingSet;
  if (textTrimmingSet) {
    CFRelease(textTrimmingSet);
  }
  v4.receiver = self;
  v4.super_class = (Class)UITextInputTraits;
  [(UITextInputTraits *)&v4 dealloc];
}

- (void)setKeyboardType:(int64_t)a3
{
  *((unsigned char *)self + 32) = a3;
}

- (void)fastPathToObtainTraitsFrom:(id)a3
{
  objc_super v4 = a3;
  self->autocapitalizationType = [v4 autocapitalizationType];
  self->autocorrectionType = [v4 autocorrectionType];
  self->spellCheckingType = [v4 spellCheckingType];
  *((unsigned char *)self + 32) = [v4 keyboardType];
  *((unsigned char *)self + 33) = [v4 keyboardAppearance];
  self->returnKeyType = [v4 returnKeyType];
  self->enablesReturnKeyAutomatically = [v4 enablesReturnKeyAutomatically];
  self->secureTextEntry = [v4 isSecureTextEntry];
  if (v4) {
    *(unsigned char *)&self->_privateInputTraitFlags = *(unsigned char *)&self->_privateInputTraitFlags & 0xF7 | v4[340] & 8;
  }
  self->devicePasscodeEntry = [v4 isDevicePasscodeEntry];
  v5 = [v4 passwordRules];
  passwordRules = self->passwordRules;
  self->passwordRules = v5;

  v7 = [v4 textContentType];
  textContentType = self->textContentType;
  self->textContentType = v7;

  self->smartInsertDeleteType = [v4 smartInsertDeleteType];
  self->smartQuotesType = [v4 smartQuotesType];
  self->smartDashesType = [v4 smartDashesType];
  v9 = [v4 recentInputIdentifier];
  [(UITextInputTraits *)self setRecentInputIdentifier:v9];

  -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", [v4 writingToolsBehavior]);
  -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", [v4 allowedWritingToolsResultOptions]);
  v42 = v4;
  -[UITextInputTraits setManageRecentInputs:](self, "setManageRecentInputs:", [v42 manageRecentInputs]);
  uint64_t v10 = [v42 validTextRange];
  -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", v10, v11);
  v12 = [v42 PINEntrySeparatorIndexes];
  [(UITextInputTraits *)self setPINEntrySeparatorIndexes:v12];

  -[UITextInputTraits setTextTrimmingSet:](self, "setTextTrimmingSet:", [v42 textTrimmingSet]);
  v13 = [v42 insertionPointColor];
  insertionPointColor = self->_insertionPointColor;
  self->_insertionPointColor = v13;

  v15 = [v42 selectionBarColor];
  selectionBarColor = self->_selectionBarColor;
  self->_selectionBarColor = v15;

  v17 = [v42 selectionHighlightColor];
  selectionHighlightColor = self->_selectionHighlightColor;
  self->_selectionHighlightColor = v17;

  v19 = [v42 matchHighlightColor];
  matchHighlightColor = self->_matchHighlightColor;
  self->_matchHighlightColor = v19;

  v21 = [v42 selectionBorderColor];
  selectionBorderColor = self->_selectionBorderColor;
  self->_selectionBorderColor = v21;

  [v42 selectionBorderWidth];
  self->_selectionBorderWidth = v23;
  [v42 selectionCornerRadius];
  self->_selectionCornerRadius = v24;
  [v42 selectionEdgeInsets];
  self->_selectionEdgeInsets.top = v25;
  self->_selectionEdgeInsets.left = v26;
  self->_selectionEdgeInsets.bottom = v27;
  self->_selectionEdgeInsets.right = v28;
  v29 = [v42 selectionDragDotImage];
  [(UITextInputTraits *)self setSelectionDragDotImage:v29];

  self->insertionPointWidth = [v42 insertionPointWidth];
  self->textLoupeVisibility = [v42 textLoupeVisibility];
  self->textSelectionBehavior = [v42 textSelectionBehavior];
  v30 = [v42 textSuggestionDelegate];
  id textSuggestionDelegate = self->textSuggestionDelegate;
  self->id textSuggestionDelegate = v30;

  self->isSingleLineDocument = [v42 isSingleLineDocument];
  self->contentsIsSingleValue = [v42 contentsIsSingleValue];
  self->hasDefaultContents = [v42 hasDefaultContents];
  self->acceptsPayloads = [v42 acceptsPayloads];
  self->acceptsEmoji = [v42 acceptsEmoji];
  self->acceptsInitialEmojiKeyboard = [v42 acceptsInitialEmojiKeyboard];
  self->acceptsDictationSearchResults = [v42 acceptsDictationSearchResults];
  self->useAutomaticEndpointing = [v42 useAutomaticEndpointing];
  self->showDictationButton = [v42 showDictationButton];
  self->forceEnableDictation = [v42 forceEnableDictation];
  self->forceDisableDictation = [v42 forceDisableDictation];
  self->forceSpellingDictation = [v42 forceSpellingDictation];
  self->forceDefaultDictationInfo = [v42 forceDefaultDictationInfo];
  self->forceDictationKeyboardType = [v42 forceDictationKeyboardType];
  self->preferOnlineDictation = [v42 preferOnlineDictation];
  self->returnKeyGoesToNextResponder = [v42 returnKeyGoesToNextResponder];
  self->emptyContentReturnKeyType = [v42 emptyContentReturnKeyType];
  self->acceptsFloatingKeyboard = [v42 acceptsFloatingKeyboard];
  self->forceFloatingKeyboard = [v42 forceFloatingKeyboard];
  [v42 floatingKeyboardEdgeInsets];
  self->floatingKeyboardEdgeInsets.top = v32;
  self->floatingKeyboardEdgeInsets.left = v33;
  self->floatingKeyboardEdgeInsets.bottom = v34;
  self->floatingKeyboardEdgeInsets.right = v35;
  self->acceptsSplitKeyboard = [v42 acceptsSplitKeyboard];
  self->displaySecureTextUsingPlainText = [v42 displaySecureTextUsingPlainText];
  self->displaySecureEditsUsingPlainText = [v42 displaySecureEditsUsingPlainText];
  self->learnsCorrections = [v42 learnsCorrections];
  self->shortcutConversionType = [v42 shortcutConversionType];
  self->suppressReturnKeyStyling = [v42 suppressReturnKeyStyling];
  self->useInterfaceLanguageForLocalization = [v42 useInterfaceLanguageForLocalization];
  self->deferBecomingResponder = [v42 deferBecomingResponder];
  self->enablesReturnKeyOnNonWhiteSpaceContent = [v42 enablesReturnKeyOnNonWhiteSpaceContent];
  v36 = [v42 autocorrectionContext];
  [(UITextInputTraits *)self setAutocorrectionContext:v36];

  v37 = [v42 responseContext];
  [(UITextInputTraits *)self setResponseContext:v37];

  v38 = [v42 inputContextHistory];
  [(UITextInputTraits *)self setInputContextHistory:v38];

  self->disablePrediction = [v42 disablePrediction];
  self->hidePrediction = [v42 hidePrediction];
  -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", [v42 inlinePredictionType]);
  -[UITextInputTraits setDisableInputBars:](self, "setDisableInputBars:", [v42 disableInputBars]);
  self->isCarPlayIdiom = [v42 isCarPlayIdiom];
  self->textScriptType = [v42 textScriptType];
  self->loadKeyboardsForSiriLanguage = [v42 loadKeyboardsForSiriLanguage];
  -[UITextInputTraits setPreferredKeyboardStyle:](self, "setPreferredKeyboardStyle:", [v42 preferredKeyboardStyle]);
  v39 = [v42 supplementalLexicon];
  [(UITextInputTraits *)self setSupplementalLexicon:v39];

  v40 = [v42 supplementalLexiconAmbiguousItemIcon];
  [(UITextInputTraits *)self setSupplementalLexiconAmbiguousItemIcon:v40];

  self->disableHandwritingKeyboard = [v42 disableHandwritingKeyboard];
  -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", [v42 mathExpressionCompletionType]);
  uint64_t v41 = [v42 allowsTextAnimationsType];

  [(UITextInputTraits *)self setAllowsTextAnimationsType:v41];
}

- (void)extendedPathToObtainTraitsFrom:(id)a3 lightweight:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(UITextInputTraits *)self setToDefaultValues];
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      self->autocorrectionType = [v6 autocorrectionType];
    }
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)self + 32) = [v6 keyboardType];
    }
    if (objc_opt_respondsToSelector()) {
      self->secureTextEntry = [v6 isSecureTextEntry];
    }
    if (objc_opt_respondsToSelector())
    {
      v7 = [v6 textContentType];
      textContentType = self->textContentType;
      self->textContentType = v7;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      self->autocapitalizationType = [v6 autocapitalizationType];
    }
    if (objc_opt_respondsToSelector()) {
      self->autocorrectionType = [v6 autocorrectionType];
    }
    if (objc_opt_respondsToSelector()) {
      self->spellCheckingType = [v6 spellCheckingType];
    }
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)self + 32) = [v6 keyboardType];
    }
    if (objc_opt_respondsToSelector()) {
      *((unsigned char *)self + 33) = [v6 keyboardAppearance];
    }
    if (objc_opt_respondsToSelector()) {
      self->returnKeyType = [v6 returnKeyType];
    }
    if (objc_opt_respondsToSelector()) {
      self->enablesReturnKeyAutomatically = [v6 enablesReturnKeyAutomatically];
    }
    if (objc_opt_respondsToSelector()) {
      self->secureTextEntry = [v6 isSecureTextEntry];
    }
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 passwordRules];
      passwordRules = self->passwordRules;
      self->passwordRules = v9;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v6 textContentType];
      v12 = self->textContentType;
      self->textContentType = v11;
    }
    if (objc_opt_respondsToSelector()) {
      self->smartInsertDeleteType = [v6 smartInsertDeleteType];
    }
    if (objc_opt_respondsToSelector()) {
      self->smartQuotesType = [v6 smartQuotesType];
    }
    if (objc_opt_respondsToSelector()) {
      self->smartDashesType = [v6 smartDashesType];
    }
    if (objc_opt_respondsToSelector())
    {
      v13 = [v6 recentInputIdentifier];
      [(UITextInputTraits *)self setRecentInputIdentifier:v13];
    }
    if (objc_opt_respondsToSelector()) {
      -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", [v6 inlinePredictionType]);
    }
    if (objc_opt_respondsToSelector()) {
      -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", [v6 mathExpressionCompletionType]);
    }
    if (objc_opt_respondsToSelector()) {
      -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", [v6 writingToolsBehavior]);
    }
    if (objc_opt_respondsToSelector()) {
      -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", [v6 allowedWritingToolsResultOptions]);
    }
  }
  id v54 = v6;
  if (objc_opt_respondsToSelector()) {
    self->isSingleLineDocument = [v54 isSingleLineDocument];
  }
  if (objc_opt_respondsToSelector())
  {
    v14 = [v54 insertionPointColor];
    insertionPointColor = v14;
    if (!v14) {
      insertionPointColor = self->_insertionPointColor;
    }
    objc_storeStrong((id *)&self->_insertionPointColor, insertionPointColor);
  }
  if (objc_opt_respondsToSelector())
  {
    v16 = [v54 selectionHighlightColor];
    selectionHighlightColor = v16;
    if (!v16) {
      selectionHighlightColor = self->_selectionHighlightColor;
    }
    objc_storeStrong((id *)&self->_selectionHighlightColor, selectionHighlightColor);
  }
  if (objc_opt_respondsToSelector())
  {
    v18 = [v54 selectionHandleColor];
    selectionBarColor = v18;
    if (!v18) {
      selectionBarColor = self->_selectionBarColor;
    }
    objc_storeStrong((id *)&self->_selectionBarColor, selectionBarColor);
  }
  if (objc_opt_respondsToSelector()) {
    self->learnsCorrections = [v54 isTypingAdaptationEnabled];
  }
  v20 = v54;
  if (self->secureTextEntry)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v20 = v54;
    if (isKindOfClass)
    {
      int v22 = [v54 conformsToProtocolCached:&unk_1ED701780];
      v20 = v54;
      if (v22)
      {
        [(UITextInputTraits *)self setToSecureValues];
        v20 = v54;
      }
    }
  }
  if ([v20 conformsToProtocol:&unk_1ED431490])
  {
    id v23 = v54;
    if (v4)
    {
      if (objc_opt_respondsToSelector())
      {
        double v24 = [v23 textSuggestionDelegate];
        id textSuggestionDelegate = self->textSuggestionDelegate;
        self->id textSuggestionDelegate = v24;
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsPayloads = [v23 acceptsPayloads];
      }
      if (objc_opt_respondsToSelector()) {
        self->displaySecureTextUsingPlainText = [v23 displaySecureTextUsingPlainText];
      }
      if (objc_opt_respondsToSelector()) {
        self->displaySecureEditsUsingPlainText = [v23 displaySecureEditsUsingPlainText];
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setManageRecentInputs:](self, "setManageRecentInputs:", [v23 manageRecentInputs]);
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v26 = [v23 validTextRange];
        -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", v26, v27);
      }
      if (objc_opt_respondsToSelector())
      {
        CGFloat v28 = [v23 PINEntrySeparatorIndexes];
        [(UITextInputTraits *)self setPINEntrySeparatorIndexes:v28];
      }
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setTextTrimmingSet:](self, "setTextTrimmingSet:", [v23 textTrimmingSet]);
      }
      if (objc_opt_respondsToSelector())
      {
        v29 = [v23 selectionBarColor];
        v30 = self->_selectionBarColor;
        self->_selectionBarColor = v29;
      }
      if (objc_opt_respondsToSelector())
      {
        v31 = [v23 matchHighlightColor];
        matchHighlightColor = self->_matchHighlightColor;
        self->_matchHighlightColor = v31;
      }
      if (objc_opt_respondsToSelector())
      {
        CGFloat v33 = [v23 selectionBorderColor];
        selectionBorderColor = self->_selectionBorderColor;
        self->_selectionBorderColor = v33;
      }
      if (objc_opt_respondsToSelector())
      {
        [v23 selectionBorderWidth];
        self->_selectionBorderWidth = v35;
      }
      if (objc_opt_respondsToSelector())
      {
        [v23 selectionCornerRadius];
        self->_selectionCornerRadius = v36;
      }
      if (objc_opt_respondsToSelector())
      {
        [v23 selectionEdgeInsets];
        self->_selectionEdgeInsets.top = v37;
        self->_selectionEdgeInsets.left = v38;
        self->_selectionEdgeInsets.bottom = v39;
        self->_selectionEdgeInsets.right = v40;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v41 = [v23 selectionDragDotImage];
        [(UITextInputTraits *)self setSelectionDragDotImage:v41];
      }
      if (objc_opt_respondsToSelector()) {
        self->insertionPointWidth = [v23 insertionPointWidth];
      }
      if (objc_opt_respondsToSelector()) {
        self->textLoupeVisibility = [v23 textLoupeVisibility];
      }
      if (objc_opt_respondsToSelector()) {
        self->textSelectionBehavior = [v23 textSelectionBehavior];
      }
      if (objc_opt_respondsToSelector())
      {
        v42 = [v23 textSuggestionDelegate];
        id v43 = self->textSuggestionDelegate;
        self->id textSuggestionDelegate = v42;
      }
      if (objc_opt_respondsToSelector()) {
        self->contentsIsSingleValue = [v23 contentsIsSingleValue];
      }
      if (objc_opt_respondsToSelector()) {
        self->hasDefaultContents = [v23 hasDefaultContents];
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsPayloads = [v23 acceptsPayloads];
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsEmoji = [v23 acceptsEmoji];
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsInitialEmojiKeyboard = [v23 acceptsInitialEmojiKeyboard];
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsDictationSearchResults = [v23 acceptsDictationSearchResults];
      }
      if (objc_opt_respondsToSelector()) {
        self->useAutomaticEndpointing = [v23 useAutomaticEndpointing];
      }
      if (objc_opt_respondsToSelector()) {
        self->showDictationButton = [v23 showDictationButton];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceEnableDictation = [v23 forceEnableDictation];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceDisableDictation = [v23 forceDisableDictation];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceSpellingDictation = [v23 forceSpellingDictation];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceDefaultDictationInfo = [v23 forceDefaultDictationInfo];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceDictationKeyboardType = [v23 forceDictationKeyboardType];
      }
      if (objc_opt_respondsToSelector()) {
        self->preferOnlineDictation = [v23 preferOnlineDictation];
      }
      if (objc_opt_respondsToSelector()) {
        self->returnKeyGoesToNextResponder = [v23 returnKeyGoesToNextResponder];
      }
      if (objc_opt_respondsToSelector()) {
        self->emptyContentReturnKeyType = [v23 emptyContentReturnKeyType];
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsFloatingKeyboard = [v23 acceptsFloatingKeyboard];
      }
      if (objc_opt_respondsToSelector()) {
        self->forceFloatingKeyboard = [v23 forceFloatingKeyboard];
      }
      if (objc_opt_respondsToSelector())
      {
        [v23 floatingKeyboardEdgeInsets];
        self->floatingKeyboardEdgeInsets.top = v44;
        self->floatingKeyboardEdgeInsets.left = v45;
        self->floatingKeyboardEdgeInsets.bottom = v46;
        self->floatingKeyboardEdgeInsets.right = v47;
      }
      if (objc_opt_respondsToSelector()) {
        self->acceptsSplitKeyboard = [v23 acceptsSplitKeyboard];
      }
      if (objc_opt_respondsToSelector()) {
        self->displaySecureTextUsingPlainText = [v23 displaySecureTextUsingPlainText];
      }
      if (objc_opt_respondsToSelector()) {
        self->displaySecureEditsUsingPlainText = [v23 displaySecureEditsUsingPlainText];
      }
      if (objc_opt_respondsToSelector()) {
        self->learnsCorrections = [v23 learnsCorrections];
      }
      if (objc_opt_respondsToSelector()) {
        self->learnsCorrections = [v23 typingAdaptationDisabled] ^ 1;
      }
      if (objc_opt_respondsToSelector()) {
        self->shortcutConversionType = [v23 shortcutConversionType];
      }
      if (objc_opt_respondsToSelector()) {
        self->suppressReturnKeyStyling = [v23 suppressReturnKeyStyling];
      }
      if (objc_opt_respondsToSelector()) {
        self->useInterfaceLanguageForLocalization = [v23 useInterfaceLanguageForLocalization];
      }
      if (objc_opt_respondsToSelector()) {
        self->deferBecomingResponder = [v23 deferBecomingResponder];
      }
      if (objc_opt_respondsToSelector()) {
        self->enablesReturnKeyOnNonWhiteSpaceContent = [v23 enablesReturnKeyOnNonWhiteSpaceContent];
      }
      if (objc_opt_respondsToSelector())
      {
        v48 = [v23 autocorrectionContext];
        [(UITextInputTraits *)self setAutocorrectionContext:v48];
      }
      if (objc_opt_respondsToSelector())
      {
        v49 = [v23 responseContext];
        [(UITextInputTraits *)self setResponseContext:v49];
      }
      if (objc_opt_respondsToSelector())
      {
        v50 = [v23 inputContextHistory];
        [(UITextInputTraits *)self setInputContextHistory:v50];
      }
      if (objc_opt_respondsToSelector()) {
        self->disablePrediction = [v23 disablePrediction];
      }
      if (objc_opt_respondsToSelector()) {
        self->hidePrediction = [v23 hidePrediction];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) == 0) {
        -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", [v23 inlineCompletionType]);
      }
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setDisableInputBars:](self, "setDisableInputBars:", [v23 disableInputBars]);
      }
      if (objc_opt_respondsToSelector()) {
        self->textScriptType = [v23 textScriptType];
      }
      if (objc_opt_respondsToSelector()) {
        self->devicePasscodeEntry = [v23 isDevicePasscodeEntry];
      }
      if (objc_opt_respondsToSelector())
      {
        if ([v23 wasEverSecureTextEntry]) {
          char v51 = 8;
        }
        else {
          char v51 = 0;
        }
        *(unsigned char *)&self->_privateInputTraitFlags = *(unsigned char *)&self->_privateInputTraitFlags & 0xF7 | v51;
      }
      if (objc_opt_respondsToSelector()) {
        self->loadKeyboardsForSiriLanguage = [v23 loadKeyboardsForSiriLanguage];
      }
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setPreferredKeyboardStyle:](self, "setPreferredKeyboardStyle:", [v23 preferredKeyboardStyle]);
      }
      if (objc_opt_respondsToSelector())
      {
        v52 = [v23 supplementalLexicon];
        [(UITextInputTraits *)self setSupplementalLexicon:v52];
      }
      if (objc_opt_respondsToSelector())
      {
        v53 = [v23 supplementalLexiconAmbiguousItemIcon];
        [(UITextInputTraits *)self setSupplementalLexiconAmbiguousItemIcon:v53];
      }
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setDisableHandwritingKeyboard:](self, "setDisableHandwritingKeyboard:", [v23 disableHandwritingKeyboard]);
      }
      if (objc_opt_respondsToSelector()) {
        -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", [v23 allowsTextAnimationsType]);
      }
    }
  }
}

- (void)setIsSingleLineDocument:(BOOL)a3
{
  self->isSingleLineDocument = a3;
}

- (void)setToDefaultValues
{
  self->returnKeyType = 0;
  *(_WORD *)&self->enablesReturnKeyAutomatically = 0;
  self->autocorrectionType = 0;
  self->spellCheckingType = 0;
  self->autocapitalizationType = 2;
  *((_WORD *)self + 16) = 0;
  passwordRules = self->passwordRules;
  self->passwordRules = 0;

  self->devicePasscodeEntry = 0;
  textContentType = self->textContentType;
  self->textContentType = 0;

  self->smartInsertDeleteType = 0;
  self->smartQuotesType = 0;
  self->smartDashesType = 0;
  [(UITextInputTraits *)self setRecentInputIdentifier:0];
  self->writingToolsBehavior = 0;
  self->allowedWritingToolsResultOptions = 0;
  [(UITextInputTraits *)self setManageRecentInputs:0];
  -[UITextInputTraits setValidTextRange:](self, "setValidTextRange:", 0, -1);
  [(UITextInputTraits *)self setPINEntrySeparatorIndexes:0];
  textTrimmingSet = self->textTrimmingSet;
  if (textTrimmingSet) {
    CFRelease(textTrimmingSet);
  }
  self->textTrimmingSet = 0;
  id v6 = +[UIColor insertionPointColor];
  insertionPointColor = self->_insertionPointColor;
  self->_insertionPointColor = v6;

  v8 = +[UIColor selectionGrabberColor];
  selectionBarColor = self->_selectionBarColor;
  self->_selectionBarColor = v8;

  uint64_t v10 = +[UIColor selectionHighlightColor];
  selectionHighlightColor = self->_selectionHighlightColor;
  self->_selectionHighlightColor = v10;

  _UIGetTextHighlightFillColor();
  v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
  matchHighlightColor = self->_matchHighlightColor;
  self->_matchHighlightColor = v12;

  selectionBorderColor = self->_selectionBorderColor;
  self->_selectionBorderColor = 0;

  self->_selectionBorderWidth = 0.0;
  self->_selectionCornerRadius = 0.0;
  *(_OWORD *)&self->_selectionEdgeInsets.top = 0u;
  *(_OWORD *)&self->_selectionEdgeInsets.bottom = 0u;
  [(UITextInputTraits *)self setSelectionDragDotImage:0];
  self->insertionPointWidth = 3;
  *(void *)&self->textLoupeVisibility = 0;
  id textSuggestionDelegate = self->textSuggestionDelegate;
  self->id textSuggestionDelegate = 0;

  *(_WORD *)&self->isSingleLineDocument = 0;
  *(_WORD *)&self->hasDefaultContents = 0;
  self->acceptsEmoji = 1;
  self->acceptsInitialEmojiKeyboard = 0;
  *(_DWORD *)&self->acceptsDictationSearchResults = 0;
  *(_DWORD *)&self->forceEnableDictation = 0;
  self->forceDictationKeyboardType = 0x7FFFFFFFFFFFFFFFLL;
  self->emptyContentReturnKeyType = 0;
  *(_DWORD *)&self->preferOnlineDictation = 0x10000;
  *(_OWORD *)&self->floatingKeyboardEdgeInsets.top = 0u;
  *(_OWORD *)&self->floatingKeyboardEdgeInsets.bottom = 0u;
  self->acceptsSplitKeyboard = 1;
  self->learnsCorrections = 1;
  *(void *)&self->shortcutConversionType = 0;
  [(UITextInputTraits *)self setAutocorrectionContext:0];
  [(UITextInputTraits *)self setResponseContext:0];
  [(UITextInputTraits *)self setInputContextHistory:0];
  self->disablePrediction = 0;
  self->hidePrediction = 0;
  [(UITextInputTraits *)self setInlinePredictionType:0];
  [(UITextInputTraits *)self setDisableInputBars:0];
  self->isCarPlayIdiom = 0;
  self->textScriptType = 0;
  self->loadKeyboardsForSiriLanguage = 0;
  [(UITextInputTraits *)self setPreferredKeyboardStyle:0];
  [(UITextInputTraits *)self setSupplementalLexicon:0];
  [(UITextInputTraits *)self setSupplementalLexiconAmbiguousItemIcon:0];
  self->disableHandwritingKeyboard = 0;
  self->mathExpressionCompletionType = 0;
  self->allowsTextAnimationsType = 0;
}

- (void)setInlinePredictionType:(int64_t)a3
{
  self->inlinePredictionType = a3;
}

- (void)setValidTextRange:(_NSRange)a3
{
  self->validTextRange = a3;
}

- (void)setSupplementalLexiconAmbiguousItemIcon:(id)a3
{
}

- (void)setSupplementalLexicon:(id)a3
{
}

- (void)setSelectionDragDotImage:(id)a3
{
}

- (void)setResponseContext:(id)a3
{
}

- (void)setRecentInputIdentifier:(id)a3
{
}

- (void)setPreferredKeyboardStyle:(int64_t)a3
{
  self->_preferredKeyboardStyle = a3;
}

- (void)setPINEntrySeparatorIndexes:(id)a3
{
}

- (void)setManageRecentInputs:(BOOL)a3
{
  self->manageRecentInputs = a3;
}

- (void)setInputContextHistory:(id)a3
{
}

- (void)setDisableInputBars:(BOOL)a3
{
  self->disableInputBars = a3;
}

- (void)setAutocorrectionContext:(id)a3
{
}

- (__CFCharacterSet)textTrimmingSet
{
  return self->textTrimmingSet;
}

- (int64_t)smartQuotesType
{
  return self->smartQuotesType;
}

- (int64_t)smartDashesType
{
  return self->smartDashesType;
}

- (int64_t)autocorrectionType
{
  return self->autocorrectionType;
}

- (int64_t)returnKeyType
{
  return self->returnKeyType;
}

- (UIColor)insertionPointColor
{
  return self->_insertionPointColor;
}

- (NSString)textContentType
{
  return self->textContentType;
}

- (int64_t)spellCheckingType
{
  return self->spellCheckingType;
}

- (int64_t)inlinePredictionType
{
  return self->inlinePredictionType;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->enablesReturnKeyAutomatically;
}

- (int64_t)allowsTextAnimationsType
{
  return self->allowsTextAnimationsType;
}

- (BOOL)acceptsEmoji
{
  return self->acceptsEmoji;
}

- (unint64_t)insertionPointWidth
{
  return self->insertionPointWidth;
}

- (int64_t)textScriptType
{
  return self->textScriptType;
}

- (BOOL)suppressReturnKeyStyling
{
  return self->suppressReturnKeyStyling;
}

- (_UISupplementalLexicon)supplementalLexicon
{
  return self->supplementalLexicon;
}

- (int64_t)smartInsertDeleteType
{
  return self->smartInsertDeleteType;
}

- (void)setAllowsTextAnimationsType:(int64_t)a3
{
  self->allowsTextAnimationsType = a3;
}

- (NSString)responseContext
{
  return self->responseContext;
}

- (int64_t)mathExpressionCompletionType
{
  return self->mathExpressionCompletionType;
}

- (BOOL)learnsCorrections
{
  return self->learnsCorrections;
}

- (BOOL)isDevicePasscodeEntry
{
  return self->devicePasscodeEntry;
}

- (UIInputContextHistory)inputContextHistory
{
  return self->inputContextHistory;
}

- (BOOL)enablesReturnKeyOnNonWhiteSpaceContent
{
  return self->enablesReturnKeyOnNonWhiteSpaceContent;
}

- (int)emptyContentReturnKeyType
{
  return self->emptyContentReturnKeyType;
}

- (BOOL)disablePrediction
{
  return self->disablePrediction;
}

- (BOOL)disableInputBars
{
  return self->disableInputBars;
}

- (NSString)autocorrectionContext
{
  return self->autocorrectionContext;
}

- (int64_t)autocapitalizationType
{
  return self->autocapitalizationType;
}

- (BOOL)acceptsInitialEmojiKeyboard
{
  return self->acceptsInitialEmojiKeyboard;
}

- (UITextInputTraits)init
{
  v6.receiver = self;
  v6.super_class = (Class)UITextInputTraits;
  v2 = [(UITextInputTraits *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UITextInputTraits *)v2 setToDefaultValues];
    BOOL v4 = v3;
  }

  return v3;
}

- (void)setMathExpressionCompletionType:(int64_t)a3
{
  self->mathExpressionCompletionType = a3;
}

- (BOOL)hidePrediction
{
  return self->hidePrediction;
}

- (void)setAllowedWritingToolsResultOptions:(unint64_t)a3
{
  self->allowedWritingToolsResultOptions = a3;
}

- (int64_t)writingToolsBehavior
{
  return self->writingToolsBehavior;
}

- (_NSRange)validTextRange
{
  NSUInteger length = self->validTextRange.length;
  NSUInteger location = self->validTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)useInterfaceLanguageForLocalization
{
  return self->useInterfaceLanguageForLocalization;
}

- (BOOL)useAutomaticEndpointing
{
  return self->useAutomaticEndpointing;
}

- (id)textSuggestionDelegate
{
  return self->textSuggestionDelegate;
}

- (int)textSelectionBehavior
{
  return self->textSelectionBehavior;
}

- (int)textLoupeVisibility
{
  return self->textLoupeVisibility;
}

- (UIImage)supplementalLexiconAmbiguousItemIcon
{
  return self->supplementalLexiconAmbiguousItemIcon;
}

- (BOOL)showDictationButton
{
  return self->showDictationButton;
}

- (int)shortcutConversionType
{
  return self->shortcutConversionType;
}

- (void)setWritingToolsBehavior:(int64_t)a3
{
  self->writingToolsBehavior = a3;
}

- (void)setTextTrimmingSet:(__CFCharacterSet *)a3
{
  textTrimmingSet = self->textTrimmingSet;
  self->textTrimmingSet = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (textTrimmingSet)
  {
    CFRelease(textTrimmingSet);
  }
}

- (UIEdgeInsets)selectionEdgeInsets
{
  double top = self->_selectionEdgeInsets.top;
  double left = self->_selectionEdgeInsets.left;
  double bottom = self->_selectionEdgeInsets.bottom;
  double right = self->_selectionEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIImage)selectionDragDotImage
{
  return self->selectionDragDotImage;
}

- (double)selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (UIColor)selectionBarColor
{
  return self->_selectionBarColor;
}

- (BOOL)returnKeyGoesToNextResponder
{
  return self->returnKeyGoesToNextResponder;
}

- (int64_t)preferredKeyboardStyle
{
  return self->_preferredKeyboardStyle;
}

- (BOOL)preferOnlineDictation
{
  return self->preferOnlineDictation;
}

- (UITextInputPasswordRules)passwordRules
{
  return self->passwordRules;
}

- (UIColor)matchHighlightColor
{
  return self->_matchHighlightColor;
}

- (BOOL)manageRecentInputs
{
  return self->manageRecentInputs;
}

- (BOOL)loadKeyboardsForSiriLanguage
{
  return self->loadKeyboardsForSiriLanguage;
}

- (BOOL)isSingleLineDocument
{
  return self->isSingleLineDocument;
}

- (BOOL)hasDefaultContents
{
  return self->hasDefaultContents;
}

- (BOOL)forceSpellingDictation
{
  return self->forceSpellingDictation;
}

- (BOOL)forceFloatingKeyboard
{
  return self->forceFloatingKeyboard;
}

- (BOOL)forceEnableDictation
{
  return self->forceEnableDictation;
}

- (BOOL)forceDisableDictation
{
  return self->forceDisableDictation;
}

- (int64_t)forceDictationKeyboardType
{
  return self->forceDictationKeyboardType;
}

- (BOOL)forceDefaultDictationInfo
{
  return self->forceDefaultDictationInfo;
}

- (UIEdgeInsets)floatingKeyboardEdgeInsets
{
  double top = self->floatingKeyboardEdgeInsets.top;
  double left = self->floatingKeyboardEdgeInsets.left;
  double bottom = self->floatingKeyboardEdgeInsets.bottom;
  double right = self->floatingKeyboardEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)displaySecureTextUsingPlainText
{
  return self->displaySecureTextUsingPlainText;
}

- (BOOL)displaySecureEditsUsingPlainText
{
  return self->displaySecureEditsUsingPlainText;
}

- (BOOL)disableHandwritingKeyboard
{
  return self->disableHandwritingKeyboard;
}

- (BOOL)deferBecomingResponder
{
  return self->deferBecomingResponder;
}

- (BOOL)contentsIsSingleValue
{
  return self->contentsIsSingleValue;
}

- (unint64_t)allowedWritingToolsResultOptions
{
  return self->allowedWritingToolsResultOptions;
}

- (BOOL)acceptsSplitKeyboard
{
  return self->acceptsSplitKeyboard;
}

- (BOOL)acceptsPayloads
{
  return self->acceptsPayloads;
}

- (BOOL)acceptsFloatingKeyboard
{
  return self->acceptsFloatingKeyboard;
}

- (BOOL)acceptsDictationSearchResults
{
  return self->acceptsDictationSearchResults;
}

- (NSIndexSet)PINEntrySeparatorIndexes
{
  return self->PINEntrySeparatorIndexes;
}

- (int64_t)keyboardAppearance
{
  return *((char *)self + 33);
}

- (BOOL)wasEverSecureTextEntry
{
  return (*(unsigned char *)&self->_privateInputTraitFlags >> 3) & 1;
}

- (void)setDisableHandwritingKeyboard:(BOOL)a3
{
  self->disableHandwritingKeyboard = a3;
}

- (int64_t)updateResultComparedToTraits:(id)a3
{
  int64_t returnKeyType;
  int enablesReturnKeyAutomatically;
  int emptyContentReturnKeyType;
  int enablesReturnKeyOnNonWhiteSpaceContent;
  int suppressReturnKeyStyling;

  id v6 = a3;
  uint64_t v7 = *((char *)self + 32);
  if ([v6 keyboardType] != v7) {
    goto LABEL_19;
  }
  uint64_t v8 = *((char *)self + 33);
  if ([v6 keyboardAppearance] != v8) {
    goto LABEL_19;
  }
  int secureTextEntry = self->secureTextEntry;
  if (secureTextEntry != [v6 isSecureTextEntry]) {
    goto LABEL_19;
  }
  int acceptsEmoji = self->acceptsEmoji;
  if (acceptsEmoji != [v6 acceptsEmoji]) {
    goto LABEL_19;
  }
  int acceptsInitialEmojiKeyboard = self->acceptsInitialEmojiKeyboard;
  if (acceptsInitialEmojiKeyboard != [v6 acceptsInitialEmojiKeyboard]) {
    goto LABEL_19;
  }
  int isCarPlayIdiom = self->isCarPlayIdiom;
  if (isCarPlayIdiom != [v6 isCarPlayIdiom]) {
    goto LABEL_19;
  }
  v13 = [(UITextInputTraits *)self recentInputIdentifier];
  if (v13)
  {
    v3 = [(UITextInputTraits *)self recentInputIdentifier];
    BOOL v4 = [v6 recentInputIdentifier];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {

LABEL_19:
      int64_t v19 = 2;
      goto LABEL_20;
    }
  }
  uint64_t v14 = [(UITextInputTraits *)self recentInputIdentifier];
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    v15 = [v6 recentInputIdentifier];
    if (v15) {
      goto LABEL_15;
    }
  }
  int64_t smartQuotesType = self->smartQuotesType;
  if (smartQuotesType == [v6 smartQuotesType])
  {
    int64_t smartDashesType = self->smartDashesType;
    BOOL v18 = smartDashesType != [v6 smartDashesType];
    goto LABEL_16;
  }
LABEL_15:
  BOOL v18 = 1;
LABEL_16:

  if (v13)
  {
  }
  if (v18) {
    goto LABEL_19;
  }
  int disableInputBars = self->disableInputBars;
  if (disableInputBars == [v6 disableInputBars])
  {
    returnKeyType = self->returnKeyType;
    int64_t v19 = returnKeyType != [v6 returnKeyType]
       || (enablesReturnKeyAutomatically = self->enablesReturnKeyAutomatically,
           enablesReturnKeyAutomatically != [v6 enablesReturnKeyAutomatically])
       || (emptyContentReturnKeyType = self->emptyContentReturnKeyType,
           emptyContentReturnKeyType != [v6 emptyContentReturnKeyType])
       || (enablesReturnKeyOnNonWhiteSpaceContent = self->enablesReturnKeyOnNonWhiteSpaceContent,
           enablesReturnKeyOnNonWhiteSpaceContent != [v6 enablesReturnKeyOnNonWhiteSpaceContent])|| (suppressReturnKeyStyling = self->suppressReturnKeyStyling, suppressReturnKeyStyling != objc_msgSend(v6, "suppressReturnKeyStyling"))|| self->enablesReturnKeyAutomatically|| self->enablesReturnKeyOnNonWhiteSpaceContent;
  }
  else
  {
    int64_t v19 = 3;
  }
LABEL_20:

  return v19;
}

- (NSString)recentInputIdentifier
{
  return self->recentInputIdentifier;
}

- (BOOL)isCarPlayIdiom
{
  return self->isCarPlayIdiom;
}

- (void)takeTraitsFrom:(id)a3
{
}

+ (id)defaultTextInputTraits
{
  v2 = objc_alloc_init(UITextInputTraits);
  return v2;
}

- (void)setShowDictationButton:(BOOL)a3
{
  self->showDictationButton = a3;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->autocapitalizationType = a3;
}

- (void)setTextContentType:(id)a3
{
}

- (int64_t)keyboardType
{
  return *((char *)self + 32);
}

- (void)_setColorsToMatchTintColor:(id)a3
{
  id v13 = a3;
  if (v13)
  {
    id v4 = +[UIColor systemBlueColor];
    if (v4 == v13)
    {
      BOOL v6 = 0;
    }
    else
    {
      id v5 = +[UIColor _alternateSystemInteractionTintColor];
      BOOL v6 = v5 != v13;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = +[UIColor insertionPointColor];
  uint64_t v8 = +[UIColor selectionGrabberColor];
  v9 = +[UIColor selectionHighlightColor];
  if (v6)
  {
    id v10 = v13;

    id v7 = v10;
    uint64_t v11 = [v7 colorWithAlphaComponent:0.2];

    uint64_t v8 = v7;
    v9 = (void *)v11;
  }
  char privateInputTraitFlags = (char)self->_privateInputTraitFlags;
  if ((privateInputTraitFlags & 4) != 0)
  {
    if ((*(unsigned char *)&self->_privateInputTraitFlags & 2) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_insertionPointColor, v7);
    char privateInputTraitFlags = (char)self->_privateInputTraitFlags;
    if ((privateInputTraitFlags & 2) != 0)
    {
LABEL_11:
      if (privateInputTraitFlags) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  objc_storeStrong((id *)&self->_selectionHighlightColor, v9);
  if ((*(unsigned char *)&self->_privateInputTraitFlags & 1) == 0) {
LABEL_12:
  }
    objc_storeStrong((id *)&self->_selectionBarColor, v8);
LABEL_13:
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  *((unsigned char *)self + 33) = a3;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->autocorrectionType = a3;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->returnKeyType = a3;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->enablesReturnKeyAutomatically = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->PINEntrySeparatorIndexes, 0);
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_matchHighlightColor, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_selectionBarColor, 0);
  objc_storeStrong((id *)&self->_insertionPointColor, 0);
  objc_storeStrong((id *)&self->supplementalLexiconAmbiguousItemIcon, 0);
  objc_storeStrong((id *)&self->supplementalLexicon, 0);
  objc_storeStrong((id *)&self->inputContextHistory, 0);
  objc_storeStrong((id *)&self->recentInputIdentifier, 0);
  objc_storeStrong((id *)&self->responseContext, 0);
  objc_storeStrong((id *)&self->autocorrectionContext, 0);
  objc_storeStrong(&self->textSuggestionDelegate, 0);
  objc_storeStrong((id *)&self->underlineColorForSpelling, 0);
  objc_storeStrong((id *)&self->underlineColorForTextAlternatives, 0);
  objc_storeStrong((id *)&self->selectionDragDotImage, 0);
  objc_storeStrong((id *)&self->selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->selectionBarColor, 0);
  objc_storeStrong((id *)&self->insertionPointColor, 0);
  objc_storeStrong((id *)&self->passwordRules, 0);
  objc_storeStrong((id *)&self->textContentType, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UITextInputTraits);
  [(UITextInputTraits *)v4 takeTraitsFrom:self lightweight:0];
  return v4;
}

- (void)takeTraitsFrom:(id)a3 lightweight:(BOOL)a4
{
  id v22 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v22 conformsToProtocolCached:&unk_1ED7009A0])
  {
    id v5 = [v22 extendedTextInputTraits];
    if (!v5) {
      goto LABEL_16;
    }
LABEL_15:
    id v6 = v5;

    id v7 = v6;
LABEL_24:
    id v22 = v7;
    -[UITextInputTraits extendedPathToObtainTraitsFrom:lightweight:](self, "extendedPathToObtainTraitsFrom:lightweight:");
    v9 = 0;
    char v10 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v22 conformsToProtocolCached:&unk_1ED700940])
  {
    id v5 = [v22 extendedTraitsDelegate];
    if (v5) {
      goto LABEL_15;
    }
  }
  else
  {
    NSClassFromString(&cfstr_Wkcontentview.isa);
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      if ([v22 conformsToProtocolCached:&unk_1ED700940])
      {
        id v5 = [v22 textInputTraits];
        if (v5) {
          goto LABEL_15;
        }
      }
    }
  }
LABEL_16:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v22;
  }
  else
  {
    NSClassFromString(&cfstr_Wkcontentview.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v22 conformsToProtocol:&unk_1ED431E48]) {
      goto LABEL_23;
    }
    id v8 = [v22 textInputTraits];
  }
  v9 = v8;
  if (!v8)
  {
LABEL_23:
    id v6 = 0;
    id v7 = v22;
    goto LABEL_24;
  }
  [(UITextInputTraits *)self fastPathToObtainTraitsFrom:v8];
  char v10 = 0;
  id v6 = 0;
LABEL_25:
  if (self->secureTextEntry && !self->displaySecureTextUsingPlainText)
  {
    self->autocorrectionType = 1;
    if (dyld_program_sdk_at_least()) {
      self->shortcutConversionType = 1;
    }
    self->learnsCorrections = 0;
  }
  uint64_t v11 = +[UITextInputTraits traitEnvironmentFromTraits:v22];
  if (!+[UIKeyboard isInputSystemUI])
  {
    if (*((unsigned char *)self + 32) == 127)
    {
      uint64_t v12 = 0;
      *((unsigned char *)self + 33) = 0;
    }
    else
    {
      uint64_t v12 = *((char *)self + 33);
    }
    *((unsigned char *)self + 33) = +[UITextInputTraits configuredAppearanceForAppearance:v12 withTraitEnvironment:v11];
  }
  id v13 = [v11 traitCollection];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 2)
  {
    if (self->secureTextEntry)
    {
      if ((unsigned int v15 = *((char *)self + 32), v15 <= 0xA) && ((1 << v15) & 0x68F) != 0 || v15 == 123 || v15 == 120)
      {
        int v16 = 0;
        *((unsigned char *)self + 32) = 0;
        goto LABEL_43;
      }
    }
  }
  else
  {
    v17 = [v11 traitCollection];
    uint64_t v18 = [v17 userInterfaceIdiom];

    int v16 = 1;
    if (v18 != 3) {
      goto LABEL_43;
    }
    self->int isCarPlayIdiom = 1;
  }
  int v16 = 0;
LABEL_43:
  int v19 = *((unsigned __int8 *)self + 32);
  if (v19 == 125)
  {
    *((unsigned char *)self + 32) = 12;
  }
  else if (v19 == 10)
  {
    self->returnKeyType = 1;
  }
  if ([(NSString *)self->textContentType isEqualToString:@"cc-number"])
  {
    if (self->returnKeyType) {
      char v20 = 123;
    }
    else {
      char v20 = 11;
    }
    *((unsigned char *)self + 32) = v20;
  }
  if (v16 && (UIKeyboardTypeSupportsSmartTyping(*((char *)self + 32)) & 1) != 0) {
    goto LABEL_59;
  }
  if (!self->smartQuotesType) {
    self->int64_t smartQuotesType = 1;
  }
  if (!self->smartDashesType) {
    self->int64_t smartDashesType = 1;
  }
  if (self->smartInsertDeleteType)
  {
LABEL_59:
    if (v10) {
      goto LABEL_67;
    }
  }
  else
  {
    self->smartInsertDeleteType = 1;
    if (v10) {
      goto LABEL_67;
    }
  }
  if (([v9 acceptsEmoji] & 1) == 0)
  {
    unsigned int v21 = [v9 keyboardType];
    if ((v21 > 0xB || ((1 << v21) & 0x930) == 0) && v21 != 127) {
      *((unsigned char *)self + 32) = 13;
    }
  }
LABEL_67:
  if (objc_opt_respondsToSelector()) {
    -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", [v9 allowsTextAnimationsType]);
  }
}

+ (id)traitEnvironmentFromTraits:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = v4;
  }
  else if (objc_msgSend(v4, "__isKindOfUIResponder"))
  {
    id v6 = [v4 nextResponder];
    id v5 = [a1 traitEnvironmentFromTraits:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (int64_t)configuredAppearanceForAppearance:(int64_t)a3 withTraitEnvironment:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a1 accessibleAppearanceForAppearance:a3];
  if (!v6) {
    goto LABEL_29;
  }
  id v8 = [v6 traitCollection];
  unint64_t v9 = [v8 userInterfaceIdiom];

  if ((v9 > 3 || v9 == 2 || v7) && v7 != 10)
  {
    uint64_t v12 = 10;
    if (v7) {
      uint64_t v12 = v7;
    }
    goto LABEL_24;
  }
  char v10 = [v6 traitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];

  int64_t v7 = 10;
  if (v11 > 1)
  {
    uint64_t v12 = 1;
    uint64_t v13 = 9;
    if (v11 != 1000) {
      uint64_t v13 = 10;
    }
    if (v11 == 2) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = v13;
    }
    if (v11 != 2) {
      uint64_t v12 = v13;
    }
    goto LABEL_24;
  }
  if (v11)
  {
    uint64_t v12 = 10;
    if (v11 != 1) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (v9 != 2)
  {
LABEL_23:
    int64_t v7 = 2;
    uint64_t v12 = 2;
    goto LABEL_24;
  }
  int64_t v7 = 10;
  uint64_t v12 = 10;
LABEL_24:
  if (v9 != 2) {
    uint64_t v12 = v7;
  }
  if (v12) {
    int64_t v7 = v12;
  }
  else {
    int64_t v7 = 2;
  }
LABEL_29:

  return v7;
}

+ (int64_t)accessibleAppearanceForAppearance:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 != 127 && _AXSUseDarkerKeyboard())
  {
    if (_AXSInvertColorsEnabled()) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v3;
}

- (void)setTextLoupeVisibility:(int)a3
{
  self->textLoupeVisibility = a3;
}

- (void)setSpellCheckingType:(int64_t)a3
{
  self->spellCheckingType = a3;
}

- (void)setShortcutConversionType:(int)a3
{
  self->shortcutConversionType = a3;
}

- (void)setEnablesReturnKeyOnNonWhiteSpaceContent:(BOOL)a3
{
  self->enablesReturnKeyOnNonWhiteSpaceContent = a3;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->int secureTextEntry = a3;
  if (a3) {
    [(UITextInputTraits *)self setToSecureValues];
  }
  else {
    self->devicePasscodeEntry = 0;
  }
}

- (void)overrideWithPrivateTraits:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v29 = v4;
    id v5 = objc_alloc_init(UITextInputTraits);
    int v6 = [v29 forceFloatingKeyboard];
    if (v6 != [(UITextInputTraits *)v5 forceFloatingKeyboard]) {
      -[UITextInputTraits setForceFloatingKeyboard:](self, "setForceFloatingKeyboard:", [v29 forceFloatingKeyboard]);
    }
    [v29 floatingKeyboardEdgeInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(UITextInputTraits *)v5 floatingKeyboardEdgeInsets];
    if (v10 != v18 || v8 != v15 || v14 != v17 || v12 != v16)
    {
      [v29 floatingKeyboardEdgeInsets];
      -[UITextInputTraits setFloatingKeyboardEdgeInsets:](self, "setFloatingKeyboardEdgeInsets:");
    }
    int v22 = [v29 acceptsInitialEmojiKeyboard];
    if (v22 != [(UITextInputTraits *)v5 acceptsInitialEmojiKeyboard]) {
      -[UITextInputTraits setAcceptsInitialEmojiKeyboard:](self, "setAcceptsInitialEmojiKeyboard:", [v29 acceptsInitialEmojiKeyboard]);
    }
    id v23 = [v29 recentInputIdentifier];
    double v24 = [(UITextInputTraits *)v5 recentInputIdentifier];

    if (v23 != v24)
    {
      CGFloat v25 = [v29 recentInputIdentifier];
      [(UITextInputTraits *)self setRecentInputIdentifier:v25];
    }
    uint64_t v26 = [v29 inlinePredictionType];
    if (v26 != [(UITextInputTraits *)v5 inlinePredictionType]) {
      -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", [v29 inlinePredictionType]);
    }
    uint64_t v27 = [v29 mathExpressionCompletionType];
    if (v27 != [(UITextInputTraits *)v5 mathExpressionCompletionType]) {
      -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", [v29 mathExpressionCompletionType]);
    }
    uint64_t v28 = [v29 allowsTextAnimationsType];
    if (v28 != [(UITextInputTraits *)v5 allowsTextAnimationsType]) {
      -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", [v29 allowsTextAnimationsType]);
    }

    id v4 = v29;
  }
}

- (void)overlayWithTITextInputTraits:(id)a3
{
  id v5 = a3;
  -[UITextInputTraits setAutocapitalizationType:](self, "setAutocapitalizationType:", objc_msgSend((id)objc_opt_class(), "translateToUIAutocapitalizationType:", objc_msgSend(v5, "autocapitalizationType")));
  -[UITextInputTraits setAutocorrectionType:](self, "setAutocorrectionType:", objc_msgSend((id)objc_opt_class(), "translateToUIAutocorrectionType:", objc_msgSend(v5, "autocorrectionType")));
  -[UITextInputTraits setSpellCheckingType:](self, "setSpellCheckingType:", objc_msgSend((id)objc_opt_class(), "translateToUISpellCheckingType:", objc_msgSend(v5, "spellCheckingType")));
  -[UITextInputTraits setKeyboardType:](self, "setKeyboardType:", objc_msgSend((id)objc_opt_class(), "translateToUIKeyboardType:", objc_msgSend(v5, "keyboardType")));
  -[UITextInputTraits setKeyboardAppearance:](self, "setKeyboardAppearance:", objc_msgSend((id)objc_opt_class(), "translateToUIKeyboardAppearance:", objc_msgSend(v5, "keyboardAppearance")));
  -[UITextInputTraits setReturnKeyType:](self, "setReturnKeyType:", objc_msgSend((id)objc_opt_class(), "translateToUIReturnKeyType:", objc_msgSend(v5, "returnKeyType")));
  -[UITextInputTraits setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", [v5 enablesReturnKeyAutomatically]);
  -[UITextInputTraits setSecureTextEntry:](self, "setSecureTextEntry:", [v5 secureTextEntry]);
  id v4 = [v5 textContentType];
  [(UITextInputTraits *)self setTextContentType:v4];

  -[UITextInputTraits setTextScriptType:](self, "setTextScriptType:", objc_msgSend((id)objc_opt_class(), "translateToUITextScriptType:", objc_msgSend(v5, "textScriptType")));
  -[UITextInputTraits setSmartInsertDeleteType:](self, "setSmartInsertDeleteType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartInsertDeleteEnabled:", objc_msgSend(v5, "smartInsertDeleteEnabled")));
  -[UITextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", objc_msgSend((id)objc_opt_class(), "translateToUIInlinePredictionType:", objc_msgSend(v5, "inlineCompletionType")));
  -[UITextInputTraits setSmartDashesType:](self, "setSmartDashesType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartDashesType:", objc_msgSend(v5, "smartDashesType")));
  -[UITextInputTraits setSmartQuotesType:](self, "setSmartQuotesType:", objc_msgSend((id)objc_opt_class(), "translateToUISmartQuotesType:", objc_msgSend(v5, "smartQuotesType")));
  if (objc_opt_respondsToSelector()) {
    -[UITextInputTraits setMathExpressionCompletionType:](self, "setMathExpressionCompletionType:", objc_msgSend((id)objc_opt_class(), "translateToUITextMathExpressionCompletionType:", objc_msgSend(v5, "mathExpressionCompletionType")));
  }
  if (objc_opt_respondsToSelector()) {
    -[UITextInputTraits setAllowsTextAnimationsType:](self, "setAllowsTextAnimationsType:", objc_msgSend((id)objc_opt_class(), "translateToUITextAllowsTextAnimationsType:", objc_msgSend(v5, "allowsTextAnimationsType")));
  }
}

+ (int64_t)translateToUIAutocapitalizationType:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)translateToUIAutocorrectionType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUISpellCheckingType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUIKeyboardType:(unint64_t)a3
{
  if (a3 - 1 > 0x10) {
    return 0;
  }
  else {
    return qword_186B990D0[a3 - 1];
  }
}

+ (int64_t)translateToUIKeyboardAppearance:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return 0;
  }
  else {
    return qword_186B99158[a3 - 1];
  }
}

+ (int64_t)translateToPublicUIKeyboardAppearance:(unint64_t)a3
{
  if (a3 == 6) {
    return 1;
  }
  else {
    return objc_msgSend(a1, "translateToUIKeyboardAppearance:");
  }
}

+ (int64_t)translateToUIReturnKeyType:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    return 0;
  }
  else {
    return qword_186B99188[a3 - 1];
  }
}

+ (int64_t)translateToUITextScriptType:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)translateToUISmartInsertDeleteEnabled:(BOOL)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (int64_t)translateToUIInlinePredictionType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUITextMathExpressionCompletionType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUITextAllowsTextAnimationsType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUISmartDashesType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)translateToUISmartQuotesType:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)setToSecureValues
{
  *(unsigned char *)&self->_privateInputTraitFlags |= 8u;
  self->int secureTextEntry = 1;
  *(_OWORD *)&self->autocapitalizationType = xmmword_186B8FCC0;
  self->spellCheckingType = 1;
  self->int64_t smartDashesType = 1;
  self->learnsCorrections = 0;
  int64x2_t v2 = vdupq_n_s64(1uLL);
  self->shortcutConversionType = 1;
  *(int64x2_t *)&self->smartInsertDeleteType = v2;
  self->inlinePredictionType = 1;
  *(int64x2_t *)&self->mathExpressionCompletionType = v2;
  [(UITextInputTraits *)self setTextTrimmingSet:0];
}

- (id)dictionaryRepresentation
{
  int v22 = (void *)MEMORY[0x1E4F1C9E8];
  unsigned int v21 = [NSNumber numberWithInt:1];
  char v20 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits keyboardType](self, "keyboardType"));
  int v19 = [NSNumber numberWithBool:self->acceptsEmoji];
  double v18 = [NSNumber numberWithBool:self->forceEnableDictation];
  double v17 = [NSNumber numberWithBool:self->returnKeyGoesToNextResponder];
  int64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits returnKeyType](self, "returnKeyType"));
  double v16 = objc_msgSend(NSNumber, "numberWithBool:", -[UITextInputTraits isSecureTextEntry](self, "isSecureTextEntry"));
  double v15 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits spellCheckingType](self, "spellCheckingType"));
  double v14 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits autocorrectionType](self, "autocorrectionType"));
  double v13 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits autocapitalizationType](self, "autocapitalizationType"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[UITextInputTraits textSelectionBehavior](self, "textSelectionBehavior"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[UITextInputTraits contentsIsSingleValue](self, "contentsIsSingleValue"));
  objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, @"Version", v20, @"KeyboardType", v19, @"AcceptsEmoji", v18, @"ForceEnableDictation", v17, @"ReturnKeyGoesToNextResponder", v3, @"ReturnKeyType", v16, @"SecureTextEntry", v15, @"SpellCheckingTypeKey", v14,
    @"AutocorrectionType",
    v13,
    @"AutocapitalizationType",
    v4,
    @"TextSelectionBehavior",
    v5,
    @"ContentIsSingleValue",
  int v6 = 0);

  double v7 = (void *)[v6 mutableCopy];
  double v8 = [(UITextInputTraits *)self textContentType];

  if (v8)
  {
    double v9 = [(UITextInputTraits *)self textContentType];
    [v7 setObject:v9 forKey:@"TextContentType"];
  }
  double v10 = [(UITextInputTraits *)self passwordRules];

  if (v10)
  {
    double v11 = [(UITextInputTraits *)self passwordRules];
    [v7 setObject:v11 forKey:@"PasswordRules"];
  }
  return v7;
}

- (void)setTextSuggestionDelegate:(id)a3
{
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  self->devicePasscodeEntry = a3;
  if (a3) {
    [(UITextInputTraits *)self setSecureTextEntry:1];
  }
}

- (int64_t)dictationKeyboardType
{
  int64_t v3 = [(UITextInputTraits *)self keyboardType];
  if ([(UITextInputTraits *)self forceDictationKeyboardType] == 0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  return [(UITextInputTraits *)self forceDictationKeyboardType];
}

- (int64_t)dictationInfoKeyboardType
{
  int64_t v3 = [(UITextInputTraits *)self keyboardType];
  if ([(UITextInputTraits *)self forceDictationKeyboardType] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(UITextInputTraits *)self forceDefaultDictationInfo]) {
      return 0;
    }
    else {
      return v3;
    }
  }
  else
  {
    return [(UITextInputTraits *)self forceDictationKeyboardType];
  }
}

- (BOOL)allowsSuggestionsOnlyMode
{
  unint64_t v3 = [(UITextInputTraits *)self keyboardType];
  LOBYTE(v4) = 0;
  if ((v3 > 0xC || ((1 << v3) & 0x15FE) == 0) && v3 != 120 && v3 != 124)
  {
    int v4 = dyld_program_sdk_at_least();
    if (v4) {
      LOBYTE(v4) = [(UITextInputTraits *)self spellCheckingType] != 1;
    }
  }
  return v4;
}

- (void)overrideWithTraits:(id)a3
{
  id v20 = a3;
  if (v20)
  {
    int v4 = objc_alloc_init(UITextInputTraits);
    uint64_t v5 = [v20 autocapitalizationType];
    if (v5 != [(UITextInputTraits *)v4 autocapitalizationType]) {
      -[UITextInputTraits setAutocapitalizationType:](self, "setAutocapitalizationType:", [v20 autocapitalizationType]);
    }
    uint64_t v6 = [v20 autocorrectionType];
    if (v6 != [(UITextInputTraits *)v4 autocorrectionType]) {
      -[UITextInputTraits setAutocorrectionType:](self, "setAutocorrectionType:", [v20 autocorrectionType]);
    }
    uint64_t v7 = [v20 spellCheckingType];
    if (v7 != [(UITextInputTraits *)v4 spellCheckingType]) {
      -[UITextInputTraits setSpellCheckingType:](self, "setSpellCheckingType:", [v20 spellCheckingType]);
    }
    uint64_t v8 = [v20 keyboardType];
    if (v8 != [(UITextInputTraits *)v4 keyboardType]) {
      -[UITextInputTraits setKeyboardType:](self, "setKeyboardType:", [v20 keyboardType]);
    }
    uint64_t v9 = [v20 keyboardAppearance];
    if (v9 != [(UITextInputTraits *)v4 keyboardAppearance]) {
      -[UITextInputTraits setKeyboardAppearance:](self, "setKeyboardAppearance:", [v20 keyboardAppearance]);
    }
    uint64_t v10 = [v20 returnKeyType];
    if (v10 != [(UITextInputTraits *)v4 returnKeyType]) {
      -[UITextInputTraits setReturnKeyType:](self, "setReturnKeyType:", [v20 returnKeyType]);
    }
    int v11 = [v20 enablesReturnKeyAutomatically];
    if (v11 != [(UITextInputTraits *)v4 enablesReturnKeyAutomatically]) {
      -[UITextInputTraits setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", [v20 enablesReturnKeyAutomatically]);
    }
    double v12 = [v20 textContentType];
    double v13 = [(UITextInputTraits *)v4 textContentType];

    if (v12 != v13)
    {
      double v14 = [v20 textContentType];
      [(UITextInputTraits *)self setTextContentType:v14];
    }
    uint64_t v15 = [v20 smartInsertDeleteType];
    if (v15 != [(UITextInputTraits *)v4 smartInsertDeleteType]) {
      -[UITextInputTraits setSmartInsertDeleteType:](self, "setSmartInsertDeleteType:", [v20 smartInsertDeleteType]);
    }
    uint64_t v16 = [v20 smartQuotesType];
    if (v16 != [(UITextInputTraits *)v4 smartQuotesType]) {
      -[UITextInputTraits setSmartQuotesType:](self, "setSmartQuotesType:", [v20 smartQuotesType]);
    }
    uint64_t v17 = [v20 smartDashesType];
    if (v17 != [(UITextInputTraits *)v4 smartDashesType]) {
      -[UITextInputTraits setSmartDashesType:](self, "setSmartDashesType:", [v20 smartDashesType]);
    }
    uint64_t v18 = [v20 writingToolsBehavior];
    if (v18 != [(UITextInputTraits *)v4 writingToolsBehavior]) {
      -[UITextInputTraits setWritingToolsBehavior:](self, "setWritingToolsBehavior:", [v20 writingToolsBehavior]);
    }
    uint64_t v19 = [v20 allowedWritingToolsResultOptions];
    if (v19 != [(UITextInputTraits *)v4 allowedWritingToolsResultOptions]) {
      -[UITextInputTraits setAllowedWritingToolsResultOptions:](self, "setAllowedWritingToolsResultOptions:", [v20 allowedWritingToolsResultOptions]);
    }
    [(UITextInputTraits *)self overrideWithPrivateTraits:v20];
  }
}

+ (id)traitsByAdoptingTraits:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(UITextInputTraits);
  [(UITextInputTraits *)v4 takeTraitsFrom:v3 lightweight:0];

  return v4;
}

+ (id)traitsByAdoptingTraits:(id)a3 lightweight:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(UITextInputTraits);
  [(UITextInputTraits *)v6 takeTraitsFrom:v5 lightweight:v4];

  return v6;
}

+ (BOOL)keyboardTypeRequiresASCIICapable:(int64_t)a3
{
  BOOL result = 1;
  if (a3 <= 0xD)
  {
    if (((1 << a3) & 0x3575) == 0) {
      return result;
    }
    return 0;
  }
  if ((a3 - 120) > 7) {
    return 0;
  }
  int v4 = 1 << (a3 - 120);
  if ((v4 & 0x55) != 0 || (v4 & 0x88) == 0) {
    return 0;
  }
  return result;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  int v4 = [NSString stringWithFormat:@"<%@ : %p>\n", objc_opt_class(), self];
  [v3 appendString:v4];

  [v3 appendString:@"public\n"];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"   autocapitalization:                  %ld\n", self->autocapitalizationType);
  [v3 appendString:v5];

  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"   autocorrection:                      %ld\n", self->autocorrectionType);
  [v3 appendString:v6];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"   spellchecking:                       %ld\n", self->spellCheckingType);
  [v3 appendString:v7];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"   keyboard type:                       %ld\n", *((char *)self + 32));
  [v3 appendString:v8];

  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"   kb appearance:                       %ld\n", *((char *)self + 33));
  [v3 appendString:v9];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"   return key type:                     %ld\n", self->returnKeyType);
  [v3 appendString:v10];

  if (self->enablesReturnKeyAutomatically) {
    int v11 = @"Y";
  }
  else {
    int v11 = @"N";
  }
  double v12 = [NSString stringWithFormat:@"   auto return key:                     %@\n", v11];
  [v3 appendString:v12];

  if (self->secureTextEntry) {
    double v13 = @"Y";
  }
  else {
    double v13 = @"N";
  }
  double v14 = [NSString stringWithFormat:@"   secure text entry:                   %@\n", v13];
  [v3 appendString:v14];

  if (!self->secureTextEntry)
  {
    if ((*(unsigned char *)&self->_privateInputTraitFlags & 8) != 0) {
      uint64_t v15 = @"Y";
    }
    else {
      uint64_t v15 = @"N";
    }
    uint64_t v16 = [NSString stringWithFormat:@"   was ever secure text entry:          %@\n", v15];
    [v3 appendString:v16];
  }
  if (self->devicePasscodeEntry) {
    uint64_t v17 = @"Y";
  }
  else {
    uint64_t v17 = @"N";
  }
  uint64_t v18 = [NSString stringWithFormat:@"   device passcode entry:               %@\n", v17];
  [v3 appendString:v18];

  uint64_t v19 = [(UITextInputTraits *)self passwordRules];

  if (v19)
  {
    id v20 = NSString;
    unsigned int v21 = [(UITextInputTraits *)self passwordRules];
    int v22 = [v20 stringWithFormat:@"   password rules:                      %@\n", v21];
    [v3 appendString:v22];
  }
  id v23 = [(UITextInputTraits *)self textContentType];

  if (v23)
  {
    double v24 = NSString;
    CGFloat v25 = [(UITextInputTraits *)self textContentType];
    uint64_t v26 = [v24 stringWithFormat:@"   text content type:                   %@\n", v25];
    [v3 appendString:v26];
  }
  uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"   smart insert/delete type:            %ld\n", self->smartInsertDeleteType);
  [v3 appendString:v27];

  uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"   smart quotes type:                   %ld\n", self->smartQuotesType);
  [v3 appendString:v28];

  id v29 = objc_msgSend(NSString, "stringWithFormat:", @"   smart dashes type:                   %ld\n", self->smartDashesType);
  [v3 appendString:v29];

  v30 = [(UITextInputTraits *)self recentInputIdentifier];

  if (v30)
  {
    v31 = NSString;
    CGFloat v32 = [(UITextInputTraits *)self recentInputIdentifier];
    CGFloat v33 = [v31 stringWithFormat:@"   recent input identifier:             %@\n", v32];
    [v3 appendString:v33];
  }
  CGFloat v34 = objc_msgSend(NSString, "stringWithFormat:", @"   writingToolsBehavior:            %ld\n", self->writingToolsBehavior);
  [v3 appendString:v34];

  double v35 = objc_msgSend(NSString, "stringWithFormat:", @"   allowedWritingToolsResultOptions:     %ld\n", self->allowedWritingToolsResultOptions);
  [v3 appendString:v35];

  [v3 appendString:@"private\n"];
  double v36 = objc_msgSend(NSString, "stringWithFormat:", @"   text trimming set:                   %p\n", self->textTrimmingSet);
  [v3 appendString:v36];

  CGFloat v37 = [NSString stringWithFormat:@"   ins. pt. color:                      %@\n", self->insertionPointColor];
  [v3 appendString:v37];

  CGFloat v38 = objc_msgSend(NSString, "stringWithFormat:", @"   ins. pt. width:                      %lu\n", self->insertionPointWidth);
  [v3 appendString:v38];

  CGFloat v39 = objc_msgSend(NSString, "stringWithFormat:", @"   text loupe vis.:                     %d\n", self->textLoupeVisibility);
  [v3 appendString:v39];

  CGFloat v40 = objc_msgSend(NSString, "stringWithFormat:", @"   selection behavior:                  %d\n", self->textSelectionBehavior);
  [v3 appendString:v40];

  uint64_t v41 = [NSString stringWithFormat:@"   text suggest. del.:                  %@\n", self->textSuggestionDelegate];
  [v3 appendString:v41];

  v42 = objc_msgSend(NSString, "stringWithFormat:", @"   single-line document:                %d\n", self->isSingleLineDocument);
  [v3 appendString:v42];

  id v43 = objc_msgSend(NSString, "stringWithFormat:", @"   single value:                        %d\n", self->contentsIsSingleValue);
  [v3 appendString:v43];

  CGFloat v44 = objc_msgSend(NSString, "stringWithFormat:", @"   has default contents:                %d\n", self->hasDefaultContents);
  [v3 appendString:v44];

  CGFloat v45 = objc_msgSend(NSString, "stringWithFormat:", @"   accepts payloads:                    %d\n", self->acceptsPayloads);
  [v3 appendString:v45];

  CGFloat v46 = objc_msgSend(NSString, "stringWithFormat:", @"   accepts emoji:                       %d\n", self->acceptsEmoji);
  [v3 appendString:v46];

  CGFloat v47 = objc_msgSend(NSString, "stringWithFormat:", @"   acceptsInitialEmojiKeyboard:         %d\n", self->acceptsInitialEmojiKeyboard);
  [v3 appendString:v47];

  v48 = objc_msgSend(NSString, "stringWithFormat:", @"   accepts dictation search results:    %d\n", self->acceptsDictationSearchResults);
  [v3 appendString:v48];

  v49 = objc_msgSend(NSString, "stringWithFormat:", @"   use automatic endpointing:           %d\n", self->useAutomaticEndpointing);
  [v3 appendString:v49];

  v50 = objc_msgSend(NSString, "stringWithFormat:", @"   show dictation button:               %d\n", self->showDictationButton);
  [v3 appendString:v50];

  char v51 = objc_msgSend(NSString, "stringWithFormat:", @"   force-enable dictation:              %d\n", self->forceEnableDictation);
  [v3 appendString:v51];

  v52 = objc_msgSend(NSString, "stringWithFormat:", @"   force-disable dictation:             %d\n", self->forceDisableDictation);
  [v3 appendString:v52];

  v53 = objc_msgSend(NSString, "stringWithFormat:", @"   force-spelling dictation: %d\n", self->forceSpellingDictation);
  [v3 appendString:v53];

  id v54 = objc_msgSend(NSString, "stringWithFormat:", @"   force default dictation info         %d\n", self->forceDefaultDictationInfo);
  [v3 appendString:v54];

  v55 = objc_msgSend(NSString, "stringWithFormat:", @"   force dictation keyboard type:       %ld\n", self->forceDictationKeyboardType);
  [v3 appendString:v55];

  v56 = objc_msgSend(NSString, "stringWithFormat:", @"   prefer online dictation              %d\n", self->preferOnlineDictation);
  [v3 appendString:v56];

  v57 = objc_msgSend(NSString, "stringWithFormat:", @"   disabled return key:                 %d\n", self->emptyContentReturnKeyType);
  [v3 appendString:v57];

  v58 = objc_msgSend(NSString, "stringWithFormat:", @"   return key goes to next responder:   %d\n", self->returnKeyGoesToNextResponder);
  [v3 appendString:v58];

  v59 = objc_msgSend(NSString, "stringWithFormat:", @"   accepts floating keyboard:           %d\n", self->acceptsFloatingKeyboard);
  [v3 appendString:v59];

  v60 = objc_msgSend(NSString, "stringWithFormat:", @"   force floating keyboard:             %d\n", self->forceFloatingKeyboard);
  [v3 appendString:v60];

  v61 = NSString;
  v62 = NSStringFromUIEdgeInsets(self->floatingKeyboardEdgeInsets);
  v63 = [v61 stringWithFormat:@"   floating keyboard edge insets:       %@\n", v62];
  [v3 appendString:v63];

  v64 = objc_msgSend(NSString, "stringWithFormat:", @"   accepts split keyboard:              %d\n", self->acceptsSplitKeyboard);
  [v3 appendString:v64];

  v65 = objc_msgSend(NSString, "stringWithFormat:", @"   displaySecureTextUsingPlainText:     %d\n", self->displaySecureTextUsingPlainText);
  [v3 appendString:v65];

  v66 = objc_msgSend(NSString, "stringWithFormat:", @"   displaySecureEditsUsingPlainText:    %d\n", self->displaySecureEditsUsingPlainText);
  [v3 appendString:v66];

  v67 = objc_msgSend(NSString, "stringWithFormat:", @"   learnsCorrections:        %d\n", self->learnsCorrections);
  [v3 appendString:v67];

  v68 = objc_msgSend(NSString, "stringWithFormat:", @"   shortcut conversion:                 %d\n", self->shortcutConversionType);
  [v3 appendString:v68];

  v69 = objc_msgSend(NSString, "stringWithFormat:", @"   suppress return key styling:         %d\n", self->suppressReturnKeyStyling);
  [v3 appendString:v69];

  v70 = objc_msgSend(NSString, "stringWithFormat:", @"   localized with UI language:          %d\n", self->useInterfaceLanguageForLocalization);
  [v3 appendString:v70];

  v71 = objc_msgSend(NSString, "stringWithFormat:", @"   defer becomeFirstResponder:          %d\n", self->deferBecomingResponder);
  [v3 appendString:v71];

  if (self->enablesReturnKeyOnNonWhiteSpaceContent) {
    v72 = @"Y";
  }
  else {
    v72 = @"N";
  }
  v73 = [NSString stringWithFormat:@"   enables return key for NWS content:  %@\n", v72];
  [v3 appendString:v73];

  v74 = [NSString stringWithFormat:@"   autocorrection context:              %@\n", self->autocorrectionContext];
  [v3 appendString:v74];

  v75 = [NSString stringWithFormat:@"   response context:                    %@\n", self->responseContext];
  [v3 appendString:v75];

  v76 = [NSString stringWithFormat:@"   input context history:               %@\n", self->inputContextHistory];
  [v3 appendString:v76];

  if (self->disablePrediction) {
    v77 = @"Y";
  }
  else {
    v77 = @"N";
  }
  v78 = [NSString stringWithFormat:@"   disable prediction:                  %@\n", v77];
  [v3 appendString:v78];

  if (self->hidePrediction) {
    v79 = @"Y";
  }
  else {
    v79 = @"N";
  }
  v80 = [NSString stringWithFormat:@"   hide prediction:                     %@\n", v79];
  [v3 appendString:v80];

  v81 = objc_msgSend(NSString, "stringWithFormat:", @"   inline prediction type:              %ld\n", self->inlinePredictionType);
  [v3 appendString:v81];

  if (self->disableInputBars) {
    v82 = @"Y";
  }
  else {
    v82 = @"N";
  }
  v83 = [NSString stringWithFormat:@"   disableInputBars:                    %@\n", v82];
  [v3 appendString:v83];

  if (self->isCarPlayIdiom) {
    v84 = @"Y";
  }
  else {
    v84 = @"N";
  }
  v85 = [NSString stringWithFormat:@"   isCarPlayIdiom:                      %@\n", v84];
  [v3 appendString:v85];

  if (self->loadKeyboardsForSiriLanguage) {
    v86 = @"Y";
  }
  else {
    v86 = @"N";
  }
  v87 = [NSString stringWithFormat:@"   loadKeyboardsForSiriLanguage:        %@\n", v86];
  [v3 appendString:v87];

  v88 = objc_msgSend(NSString, "stringWithFormat:", @"   textScriptType:                      %ld\n", self->textScriptType);
  [v3 appendString:v88];

  v89 = [NSString stringWithFormat:@"   supplemental lexicon:                %@\n", self->supplementalLexicon];
  [v3 appendString:v89];

  v90 = [NSString stringWithFormat:@"   supplemental lexicon ambiguous item icon: %@\n", self->supplementalLexiconAmbiguousItemIcon];
  [v3 appendString:v90];

  v91 = objc_msgSend(NSString, "stringWithFormat:", @"   disableHandwritingKeyboard:          %d\n", self->disableHandwritingKeyboard);
  [v3 appendString:v91];

  v92 = objc_msgSend(NSString, "stringWithFormat:", @"   math expression completion:          %ld\n", self->mathExpressionCompletionType);
  [v3 appendString:v92];

  v93 = objc_msgSend(NSString, "stringWithFormat:", @"   text animations allowed:             %ld\n", self->allowsTextAnimationsType);
  [v3 appendString:v93];

  return (NSString *)v3;
}

- (BOOL)publicTraitsMatchTraits:(id)a3
{
  int64_t returnKeyType;
  int enablesReturnKeyAutomatically;
  int secureTextEntry;
  int64_t smartInsertDeleteType;
  int64_t smartQuotesType;
  int64_t smartDashesType;
  NSString *textContentType;
  NSString *v18;
  NSString *v19;
  BOOL v20;
  UITextInputPasswordRules *passwordRules;
  uint64_t v23;
  void *v24;
  UITextInputPasswordRules *v25;
  void *v26;
  int64_t v27;
  unint64_t v28;
  int64_t writingToolsBehavior;
  unint64_t allowedWritingToolsResultOptions;

  id v5 = a3;
  int64_t autocapitalizationType = self->autocapitalizationType;
  if (autocapitalizationType == [v5 autocapitalizationType])
  {
    int64_t autocorrectionType = self->autocorrectionType;
    if (autocorrectionType == [v5 autocorrectionType])
    {
      int64_t spellCheckingType = self->spellCheckingType;
      if (spellCheckingType == [v5 spellCheckingType])
      {
        uint64_t v9 = *((char *)self + 32);
        if ([v5 keyboardType] == v9)
        {
          uint64_t v10 = *((char *)self + 33);
          if ([v5 keyboardAppearance] == v10)
          {
            returnKeyType = self->returnKeyType;
            if (returnKeyType == [v5 returnKeyType])
            {
              enablesReturnKeyAutomatically = self->enablesReturnKeyAutomatically;
              if (enablesReturnKeyAutomatically == [v5 enablesReturnKeyAutomatically])
              {
                int secureTextEntry = self->secureTextEntry;
                if (secureTextEntry == [v5 isSecureTextEntry])
                {
                  smartInsertDeleteType = self->smartInsertDeleteType;
                  if (smartInsertDeleteType == [v5 smartInsertDeleteType])
                  {
                    int64_t smartQuotesType = self->smartQuotesType;
                    if (smartQuotesType == [v5 smartQuotesType])
                    {
                      int64_t smartDashesType = self->smartDashesType;
                      if (smartDashesType == [v5 smartDashesType])
                      {
                        textContentType = self->textContentType;
                        uint64_t v18 = [v5 textContentType];
                        if (textContentType == v18
                          || (uint64_t v19 = self->textContentType,
                              [v5 textContentType],
                              id v3 = objc_claimAutoreleasedReturnValue(),
                              [(NSString *)v19 isEqualToString:v3]))
                        {
                          passwordRules = self->passwordRules;
                          id v23 = [v5 passwordRules];
                          if (passwordRules == (UITextInputPasswordRules *)v23)
                          {
                            writingToolsBehavior = self->writingToolsBehavior;
                            if (writingToolsBehavior == [v5 writingToolsBehavior])
                            {
                              allowedWritingToolsResultOptions = self->allowedWritingToolsResultOptions;
                              id v20 = allowedWritingToolsResultOptions == [v5 allowedWritingToolsResultOptions];
                            }
                            else
                            {
                              id v20 = 0;
                            }
                          }
                          else
                          {
                            double v24 = (void *)v23;
                            CGFloat v25 = self->passwordRules;
                            uint64_t v26 = [v5 passwordRules];
                            if ([(UITextInputPasswordRules *)v25 isEqual:v26]
                              && (uint64_t v27 = self->writingToolsBehavior, v27 == [v5 writingToolsBehavior]))
                            {
                              uint64_t v28 = self->allowedWritingToolsResultOptions;
                              id v20 = v28 == [v5 allowedWritingToolsResultOptions];
                            }
                            else
                            {
                              id v20 = 0;
                            }
                          }
                          if (textContentType == v18) {
                            goto LABEL_29;
                          }
                        }
                        else
                        {
                          id v20 = 0;
                        }

LABEL_29:
                        goto LABEL_16;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  id v20 = 0;
LABEL_16:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  int returnKeyGoesToNextResponder;
  int learnsCorrections;
  int shortcutConversionType;
  int suppressReturnKeyStyling;
  int useInterfaceLanguageForLocalization;
  int deferBecomingResponder;
  int enablesReturnKeyOnNonWhiteSpaceContent;
  NSString *autocorrectionContext;
  NSString *v49;
  NSString *responseContext;
  NSString *v51;
  UIInputContextHistory *inputContextHistory;
  UIInputContextHistory *v53;
  int isCarPlayIdiom;
  int64_t textScriptType;
  _UISupplementalLexicon *supplementalLexicon;
  _UISupplementalLexicon *v57;
  UIImage *supplementalLexiconAmbiguousItemIcon;
  int disableHandwritingKeyboard;
  int64_t mathExpressionCompletionType;
  int64_t allowsTextAnimationsType;
  UIImage *v62;
  UIImage *v63;
  _UISupplementalLexicon *v64;
  void *v65;
  UIInputContextHistory *v66;
  void *v67;
  NSString *v68;
  UIInputContextHistory *v69;
  void *v70;
  NSString *v71;
  NSString *v72;
  NSString *v73;
  void *v74;

  id v6 = a3;
  if ([(UITextInputTraits *)self publicTraitsMatchTraits:v6])
  {
    uint64_t v7 = [(UITextInputTraits *)self recentInputIdentifier];
    uint64_t v8 = [v6 recentInputIdentifier];
    if (v7 != v8)
    {
      id v3 = [(UITextInputTraits *)self recentInputIdentifier];
      int v4 = [v6 recentInputIdentifier];
      if (![v3 isEqualToString:v4])
      {
        BOOL v9 = 0;
        goto LABEL_28;
      }
    }
    int v10 = [(UITextInputTraits *)self manageRecentInputs];
    if (v10 != [v6 manageRecentInputs]) {
      goto LABEL_26;
    }
    uint64_t v11 = [(UITextInputTraits *)self validTextRange];
    uint64_t v13 = v12;
    if (v11 != [v6 validTextRange] || v13 != v14) {
      goto LABEL_26;
    }
    uint64_t v15 = [(UITextInputTraits *)self PINEntrySeparatorIndexes];
    uint64_t v16 = [v6 PINEntrySeparatorIndexes];
    if (![v15 isEqualToIndexSet:v16]) {
      goto LABEL_25;
    }
    if (!self->textTrimmingSet)
    {
      if (![v6 textTrimmingSet])
      {
LABEL_18:
        insertionPointColor = self->insertionPointColor;
        uint64_t v18 = [v6 insertionPointColor];
        if ([(UIColor *)insertionPointColor isEqual:v18])
        {
          unint64_t insertionPointWidth = self->insertionPointWidth;
          if (insertionPointWidth == [v6 insertionPointWidth])
          {
            int textLoupeVisibility = self->textLoupeVisibility;
            if (textLoupeVisibility == [v6 textLoupeVisibility])
            {
              int textSelectionBehavior = self->textSelectionBehavior;
              if (textSelectionBehavior == [v6 textSelectionBehavior])
              {
                id textSuggestionDelegate = self->textSuggestionDelegate;
                id v23 = [v6 textSuggestionDelegate];
                if (textSuggestionDelegate != v23)
                {
                  BOOL v9 = 0;
LABEL_59:

LABEL_27:
                  if (v7 == v8)
                  {
LABEL_29:

                    goto LABEL_30;
                  }
LABEL_28:

                  goto LABEL_29;
                }
                v74 = v23;
                int isSingleLineDocument = self->isSingleLineDocument;
                if (isSingleLineDocument != [v6 isSingleLineDocument]) {
                  goto LABEL_57;
                }
                int contentsIsSingleValue = self->contentsIsSingleValue;
                if (contentsIsSingleValue != [v6 contentsIsSingleValue]) {
                  goto LABEL_57;
                }
                int hasDefaultContents = self->hasDefaultContents;
                if (hasDefaultContents != [v6 hasDefaultContents]) {
                  goto LABEL_57;
                }
                int acceptsPayloads = self->acceptsPayloads;
                if (acceptsPayloads != [v6 acceptsPayloads]) {
                  goto LABEL_57;
                }
                int acceptsEmoji = self->acceptsEmoji;
                if (acceptsEmoji != [v6 acceptsEmoji]) {
                  goto LABEL_57;
                }
                int acceptsInitialEmojiKeyboard = self->acceptsInitialEmojiKeyboard;
                if (acceptsInitialEmojiKeyboard != [v6 acceptsInitialEmojiKeyboard]) {
                  goto LABEL_57;
                }
                int acceptsDictationSearchResults = self->acceptsDictationSearchResults;
                if (acceptsDictationSearchResults != [v6 acceptsDictationSearchResults]) {
                  goto LABEL_57;
                }
                int showDictationButton = self->showDictationButton;
                if (showDictationButton != [v6 showDictationButton]) {
                  goto LABEL_57;
                }
                int useAutomaticEndpointing = self->useAutomaticEndpointing;
                if (useAutomaticEndpointing != [v6 useAutomaticEndpointing]) {
                  goto LABEL_57;
                }
                int forceEnableDictation = self->forceEnableDictation;
                if (forceEnableDictation != [v6 forceEnableDictation]) {
                  goto LABEL_57;
                }
                int forceDisableDictation = self->forceDisableDictation;
                if (forceDisableDictation != [v6 forceDisableDictation]) {
                  goto LABEL_57;
                }
                int forceSpellingDictation = self->forceSpellingDictation;
                if (forceSpellingDictation != [v6 forceSpellingDictation]) {
                  goto LABEL_57;
                }
                int forceDefaultDictationInfo = self->forceDefaultDictationInfo;
                if (forceDefaultDictationInfo != [v6 forceDefaultDictationInfo]) {
                  goto LABEL_57;
                }
                int64_t forceDictationKeyboardType = self->forceDictationKeyboardType;
                if (forceDictationKeyboardType != [v6 forceDictationKeyboardType]) {
                  goto LABEL_57;
                }
                int preferOnlineDictation = self->preferOnlineDictation;
                if (preferOnlineDictation != [v6 preferOnlineDictation]) {
                  goto LABEL_57;
                }
                int emptyContentReturnKeyType = self->emptyContentReturnKeyType;
                if (emptyContentReturnKeyType != [v6 emptyContentReturnKeyType]
                  || (returnKeyGoesToNextResponder = self->returnKeyGoesToNextResponder,
                      returnKeyGoesToNextResponder != [v6 returnKeyGoesToNextResponder])
                  || (learnsCorrections = self->learnsCorrections,
                      learnsCorrections != [v6 learnsCorrections])
                  || (shortcutConversionType = self->shortcutConversionType,
                      shortcutConversionType != [v6 shortcutConversionType])
                  || (suppressReturnKeyStyling = self->suppressReturnKeyStyling,
                      suppressReturnKeyStyling != [v6 suppressReturnKeyStyling])
                  || (useInterfaceLanguageForLocalization = self->useInterfaceLanguageForLocalization,
                      useInterfaceLanguageForLocalization != [v6 useInterfaceLanguageForLocalization])|| (deferBecomingResponder = self->deferBecomingResponder, deferBecomingResponder != objc_msgSend(v6, "deferBecomingResponder"))|| (enablesReturnKeyOnNonWhiteSpaceContent = self->enablesReturnKeyOnNonWhiteSpaceContent, enablesReturnKeyOnNonWhiteSpaceContent != objc_msgSend(v6, "enablesReturnKeyOnNonWhiteSpaceContent")))
                {
LABEL_57:
                  BOOL v9 = 0;
LABEL_58:
                  id v23 = v74;
                  goto LABEL_59;
                }
                autocorrectionContext = self->autocorrectionContext;
                v73 = [v6 autocorrectionContext];
                v71 = autocorrectionContext;
                if (autocorrectionContext != v73)
                {
                  v49 = self->autocorrectionContext;
                  v70 = [v6 autocorrectionContext];
                  if (!-[NSString isEqualToString:](v49, "isEqualToString:"))
                  {
                    BOOL v9 = 0;
                    goto LABEL_81;
                  }
                }
                responseContext = self->responseContext;
                v72 = [v6 responseContext];
                v68 = responseContext;
                if (responseContext != v72)
                {
                  char v51 = self->responseContext;
                  v67 = [v6 responseContext];
                  if (!-[NSString isEqualToString:](v51, "isEqualToString:"))
                  {
                    BOOL v9 = 0;
LABEL_79:

LABEL_80:
                    if (v71 == v73)
                    {
LABEL_82:

                      goto LABEL_58;
                    }
LABEL_81:

                    goto LABEL_82;
                  }
                }
                inputContextHistory = self->inputContextHistory;
                v69 = [v6 inputContextHistory];
                v66 = inputContextHistory;
                if (inputContextHistory != v69)
                {
                  v53 = self->inputContextHistory;
                  v65 = [v6 inputContextHistory];
                  if (!-[UIInputContextHistory isEqual:](v53, "isEqual:"))
                  {
                    BOOL v9 = 0;
LABEL_77:

LABEL_78:
                    if (v68 == v72) {
                      goto LABEL_80;
                    }
                    goto LABEL_79;
                  }
                }
                int isCarPlayIdiom = self->isCarPlayIdiom;
                if (isCarPlayIdiom == [v6 isCarPlayIdiom])
                {
                  textScriptType = self->textScriptType;
                  if (textScriptType == [v6 textScriptType])
                  {
                    supplementalLexicon = self->supplementalLexicon;
                    v57 = [v6 supplementalLexicon];
                    v64 = supplementalLexicon;
                    if (supplementalLexicon == v57)
                    {
                      supplementalLexiconAmbiguousItemIcon = self->supplementalLexiconAmbiguousItemIcon;
                      [v6 supplementalLexiconAmbiguousItemIcon];
                      v62 = supplementalLexiconAmbiguousItemIcon;
                      v63 = (UIImage *)objc_claimAutoreleasedReturnValue();
                      if (supplementalLexiconAmbiguousItemIcon == v63)
                      {
                        disableHandwritingKeyboard = self->disableHandwritingKeyboard;
                        if (disableHandwritingKeyboard == [v6 disableHandwritingKeyboard])
                        {
                          mathExpressionCompletionType = self->mathExpressionCompletionType;
                          if (mathExpressionCompletionType == [v6 mathExpressionCompletionType])
                          {
                            allowsTextAnimationsType = self->allowsTextAnimationsType;
                            BOOL v9 = allowsTextAnimationsType == [v6 allowsTextAnimationsType];

                            goto LABEL_76;
                          }
                        }
                      }
                    }
                    else
                    {
                    }
                  }
                }
                BOOL v9 = 0;
LABEL_76:
                if (v66 == v69) {
                  goto LABEL_78;
                }
                goto LABEL_77;
              }
            }
          }
        }

LABEL_25:
LABEL_26:
        BOOL v9 = 0;
        goto LABEL_27;
      }
      if (!self->textTrimmingSet) {
        goto LABEL_25;
      }
    }
    if (![v6 textTrimmingSet]
      || !CFCharacterSetIsSupersetOfSet(self->textTrimmingSet, (CFCharacterSetRef)[v6 textTrimmingSet])
      || !CFCharacterSetIsSupersetOfSet((CFCharacterSetRef)[v6 textTrimmingSet], self->textTrimmingSet))
    {
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  BOOL v9 = 0;
LABEL_30:

  return v9;
}

- (void)setSelectionBarColor:(id)a3
{
  *(unsigned char *)&self->_privateInputTraitFlags |= 1u;
}

- (void)setSelectionHighlightColor:(id)a3
{
  *(unsigned char *)&self->_privateInputTraitFlags |= 2u;
}

- (void)setInsertionPointColor:(id)a3
{
  *(unsigned char *)&self->_privateInputTraitFlags |= 4u;
}

- (int64_t)inlineCompletionType
{
  return self->inlinePredictionType;
}

- (void)setInlineCompletionType:(int64_t)a3
{
  self->inlinePredictionType = a3;
}

- (void)setSmartInsertDeleteType:(int64_t)a3
{
  self->smartInsertDeleteType = a3;
}

- (void)setSmartQuotesType:(int64_t)a3
{
  self->int64_t smartQuotesType = a3;
}

- (void)setSmartDashesType:(int64_t)a3
{
  self->int64_t smartDashesType = a3;
}

- (void)setPasswordRules:(id)a3
{
}

- (void)setMatchHighlightColor:(id)a3
{
}

- (void)setSelectionBorderColor:(id)a3
{
}

- (void)setSelectionBorderWidth:(double)a3
{
  self->_selectionBorderWidth = a3;
}

- (void)setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
}

- (void)setSelectionEdgeInsets:(UIEdgeInsets)a3
{
  self->_selectionEdgeInsets = a3;
}

- (void)setInsertionPointWidth:(unint64_t)a3
{
  self->unint64_t insertionPointWidth = a3;
}

- (void)setTextSelectionBehavior:(int)a3
{
  self->int textSelectionBehavior = a3;
}

- (void)setContentsIsSingleValue:(BOOL)a3
{
  self->int contentsIsSingleValue = a3;
}

- (void)setHasDefaultContents:(BOOL)a3
{
  self->int hasDefaultContents = a3;
}

- (void)setAcceptsPayloads:(BOOL)a3
{
  self->int acceptsPayloads = a3;
}

- (void)setAcceptsEmoji:(BOOL)a3
{
  self->int acceptsEmoji = a3;
}

- (void)setAcceptsInitialEmojiKeyboard:(BOOL)a3
{
  self->int acceptsInitialEmojiKeyboard = a3;
}

- (void)setAcceptsDictationSearchResults:(BOOL)a3
{
  self->int acceptsDictationSearchResults = a3;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->int useAutomaticEndpointing = a3;
}

- (void)setForceEnableDictation:(BOOL)a3
{
  self->int forceEnableDictation = a3;
}

- (void)setForceDisableDictation:(BOOL)a3
{
  self->int forceDisableDictation = a3;
}

- (void)setForceSpellingDictation:(BOOL)a3
{
  self->int forceSpellingDictation = a3;
}

- (void)setForceDefaultDictationInfo:(BOOL)a3
{
  self->int forceDefaultDictationInfo = a3;
}

- (void)setForceDictationKeyboardType:(int64_t)a3
{
  self->int64_t forceDictationKeyboardType = a3;
}

- (void)setPreferOnlineDictation:(BOOL)a3
{
  self->int preferOnlineDictation = a3;
}

- (void)setEmptyContentReturnKeyType:(int)a3
{
  self->int emptyContentReturnKeyType = a3;
}

- (void)setReturnKeyGoesToNextResponder:(BOOL)a3
{
  self->returnKeyGoesToNextResponder = a3;
}

- (void)setAcceptsFloatingKeyboard:(BOOL)a3
{
  self->acceptsFloatingKeyboard = a3;
}

- (void)setForceFloatingKeyboard:(BOOL)a3
{
  self->forceFloatingKeyboard = a3;
}

- (void)setFloatingKeyboardEdgeInsets:(UIEdgeInsets)a3
{
  self->floatingKeyboardEdgeInsets = a3;
}

- (void)setAcceptsSplitKeyboard:(BOOL)a3
{
  self->acceptsSplitKeyboard = a3;
}

- (void)setDisplaySecureTextUsingPlainText:(BOOL)a3
{
  self->displaySecureTextUsingPlainText = a3;
}

- (void)setDisplaySecureEditsUsingPlainText:(BOOL)a3
{
  self->displaySecureEditsUsingPlainText = a3;
}

- (void)setLearnsCorrections:(BOOL)a3
{
  self->learnsCorrections = a3;
}

- (void)setSuppressReturnKeyStyling:(BOOL)a3
{
  self->suppressReturnKeyStyling = a3;
}

- (void)setUseInterfaceLanguageForLocalization:(BOOL)a3
{
  self->useInterfaceLanguageForLocalization = a3;
}

- (void)setDeferBecomingResponder:(BOOL)a3
{
  self->deferBecomingResponder = a3;
}

- (void)setDisablePrediction:(BOOL)a3
{
  self->disablePrediction = a3;
}

- (void)setHidePrediction:(BOOL)a3
{
  self->hidePrediction = a3;
}

- (void)setIsCarPlayIdiom:(BOOL)a3
{
  self->int isCarPlayIdiom = a3;
}

- (void)setTextScriptType:(int64_t)a3
{
  self->textScriptType = a3;
}

- (void)setLoadKeyboardsForSiriLanguage:(BOOL)a3
{
  self->loadKeyboardsForSiriLanguage = a3;
}

@end