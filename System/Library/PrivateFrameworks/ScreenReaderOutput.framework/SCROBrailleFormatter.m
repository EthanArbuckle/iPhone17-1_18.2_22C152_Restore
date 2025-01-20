@interface SCROBrailleFormatter
+ (void)resetEditingManager;
- (BOOL)anyUnread;
- (BOOL)currentUnread;
- (BOOL)hasPlaceholderText;
- (BOOL)isEditableText;
- (BOOL)needsTechnicalMode;
- (BOOL)showDotsSevenAndEight;
- (BRLTBrailleStateManager)stateManager;
- (BRLTEditString)editString;
- (BRLTScriptString)emptyEditingScriptString;
- (NSAttributedString)statusText;
- (NSPointerArray)outputDelegates;
- (NSString)inputTableIdentifier;
- (NSString)outputTableIdentifier;
- (SCROBrailleFormatter)initWithOutputContractionMode:(int)a3 inputContractionMode:(int)a4 outputShowEightDot:(BOOL)a5 inputShowEightDot:(BOOL)a6 showDotsSevenAndEight:(BOOL)a7;
- (SCROBrailleFormatter)initWithOutputTableIdentifier:(id)a3 inputTableIdentifier:(id)a4 showDotsSevenAndEight:(BOOL)a5;
- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3;
- (id)appToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8;
- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6;
- (int)displayMode;
- (int)lineFocus;
- (int64_t)firstToken;
- (int64_t)lastToken;
- (int64_t)lineOffset;
- (unint64_t)generationID;
- (void)addOutputDelegate:(id)a3;
- (void)addText:(id)a3 language:(id)a4 selection:(_NSRange *)a5 token:(int64_t)a6 focus:(_NSRange *)a7 isEditableText:(BOOL)a8;
- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10;
- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 paddingRange:(_NSRange)a11 suggestionRange:(_NSRange)a12 editingString:(id)a13 textFormattingRanges:(id)a14 selectionOnDifferentLine:(BOOL)a15;
- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 isEditableText:(BOOL)a7;
- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 technical:(BOOL)a7 isEditableText:(BOOL)a8;
- (void)addTextPreCustom:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 isTerminalOutput:(BOOL)a11 paddingRange:(_NSRange)a12 suggestionRange:(_NSRange)a13 editingString:(id)a14 textFormattingRanges:(id)a15;
- (void)brailleDisplayDeletedCharacter:(id)a3;
- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4;
- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5;
- (void)clearPlaceholderForEditing;
- (void)didInsertScriptString:(id)a3;
- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5;
- (void)requestSpeech:(id)a3 language:(id)a4;
- (void)scriptSelectionDidChange:(_NSRange)a3;
- (void)setAnyUnread:(BOOL)a3;
- (void)setAppToken:(id)a3;
- (void)setCurrentUnread:(BOOL)a3;
- (void)setDisplayMode:(int)a3;
- (void)setEmptyEditingScriptString:(id)a3;
- (void)setLineFocus:(int)a3;
- (void)setLineOffset:(int64_t)a3;
- (void)setStatusText:(id)a3;
- (void)translate;
- (void)translate:(BOOL)a3;
@end

@implementation SCROBrailleFormatter

+ (void)resetEditingManager
{
  v2 = (void *)_editingStateManager;
  _editingStateManager = 0;
}

- (SCROBrailleFormatter)initWithOutputTableIdentifier:(id)a3 inputTableIdentifier:(id)a4 showDotsSevenAndEight:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(SCROBrailleFormatter *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_displayMode = 0;
    v11->_showDotsSevenAndEight = a5;
    v11->_generationID = ++GenerationCount;
    objc_storeStrong((id *)&v11->_outputTableIdentifier, a3);
    objc_storeStrong((id *)&v12->_inputTableIdentifier, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F2BA80]) initWithDelegate:v12 translationDelegate:v12];
    stateManager = v12->_stateManager;
    v12->_stateManager = (BRLTBrailleStateManager *)v13;

    v15 = (BRLTEditString *)objc_alloc_init(MEMORY[0x263F2BA90]);
    editString = v12->_editString;
    v12->_editString = v15;

    emptyEditingScriptString = v12->_emptyEditingScriptString;
    v12->_emptyEditingScriptString = 0;

    uint64_t v18 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    outputDelegates = v12->_outputDelegates;
    v12->_outputDelegates = (NSPointerArray *)v18;
  }
  return v12;
}

- (SCROBrailleFormatter)initWithOutputContractionMode:(int)a3 inputContractionMode:(int)a4 outputShowEightDot:(BOOL)a5 inputShowEightDot:(BOOL)a6 showDotsSevenAndEight:(BOOL)a7
{
  if (a3) {
    v7 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g1";
  }
  else {
    v7 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g2";
  }
  return -[SCROBrailleFormatter initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:](self, "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", v7, v7, a7, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOutputTableIdentifier:inputTableIdentifier:showDotsSevenAndEight:", self->_outputTableIdentifier, self->_inputTableIdentifier, self->_showDotsSevenAndEight);
  [v4 setDisplayMode:self->_displayMode];
  [v4 setAppToken:self->_appToken];
  [v4 setStatusText:self->_statusText];
  [v4 setCurrentUnread:self->_currentUnread];
  [v4 setAnyUnread:self->_anyUnread];
  objc_msgSend(v4, "setLineFocus:", -[SCROBrailleFormatter lineFocus](self, "lineFocus"));
  objc_msgSend(v4, "setLineOffset:", -[SCROBrailleFormatter lineOffset](self, "lineOffset"));
  v4[12] = self->_generationID;
  uint64_t v5 = [(NSPointerArray *)self->_outputDelegates copy];
  v6 = (void *)v4[13];
  v4[13] = v5;

  uint64_t v7 = [(BRLTBrailleStateManager *)self->_stateManager copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(BRLTEditString *)self->_editString copy];
  id v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = -[SCROBrailleFormatter copyWithZone:](self, "copyWithZone:");
  id v6 = [(NSAttributedString *)self->_statusText deepCopyWithZone:a3];
  uint64_t v7 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v6;

  *((void *)v5 + 10) = self->_firstToken;
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_lastToken;
  *((void *)v5 + 6) = self->_lineOffset;
  uint64_t v8 = [(BRLTBrailleStateManager *)self->_stateManager copy];
  uint64_t v9 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v8;

  uint64_t v10 = [(BRLTEditString *)self->_editString copy];
  v11 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v10;

  uint64_t v12 = [(NSPointerArray *)self->_outputDelegates copy];
  uint64_t v13 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v12;

  return v5;
}

- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 isEditableText:(BOOL)a7
{
}

- (void)addText:(id)a3 language:(id)a4 selection:(_NSRange *)a5 token:(int64_t)a6 focus:(_NSRange *)a7 isEditableText:(BOOL)a8
{
  BYTE1(v8) = a8;
  LOBYTE(v8) = 0;
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:", a3, 0, a4, a5, a6, a7, v8);
}

- (void)addText:(id)a3 selection:(_NSRange *)a4 token:(int64_t)a5 focus:(_NSRange *)a6 technical:(BOOL)a7 isEditableText:(BOOL)a8
{
  BYTE1(v8) = a8;
  LOBYTE(v8) = a7;
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:", a3, 0, 0, a4, a5, a6, v8);
}

- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10
{
  LOBYTE(v11) = 0;
  LOWORD(v10) = __PAIR16__(a10, a9);
  -[SCROBrailleFormatter addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:](self, "addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:", a3, a4, a5, a6, a7, a8, v10, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v11);
}

- (void)addText:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 paddingRange:(_NSRange)a11 suggestionRange:(_NSRange)a12 editingString:(id)a13 textFormattingRanges:(id)a14 selectionOnDifferentLine:(BOOL)a15
{
  id v33 = a3;
  id v19 = a14;
  v36.length = [v33 length];
  v36.NSUInteger location = 0;
  NSRange v20 = NSIntersectionRange(v36, a11);
  if (v20.location == a11.location && v20.length == a11.length)
  {
    uint64_t v23 = objc_msgSend(v33, "stringByReplacingCharactersInRange:withString:", a11.location, a11.length, &stru_26CCE0B50);

    v22 = (void *)v23;
  }
  else
  {
    v22 = v33;
  }
  if (a6)
  {
    NSUInteger location = a6->location;
    a6 = (_NSRange *)a6->length;
  }
  else
  {
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v25 = !a10;
  if (location != 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v25 = 1;
  }
  if (v25) {
    uint64_t v26 = location;
  }
  else {
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v34 = v22;
  if (!v25 && !a15)
  {
    uint64_t v26 = [v22 length];
    a6 = 0;
  }
  if (a8)
  {
    NSUInteger v27 = a8->location;
    a8 = (_NSRange *)a8->length;
  }
  else
  {
    NSUInteger v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v28 = objc_alloc(MEMORY[0x263F2BA90]);
  if (a10) {
    id v29 = 0;
  }
  else {
    id v29 = v19;
  }
  v30 = objc_msgSend(v28, "initWithString:selection:focus:token:suggestion:textFormattingRanges:", v34, v26, a6, v27, a8, a7, a12.location, a12.length, v29);
  v31 = [(BRLTEditString *)self->_editString appending:v30];
  editString = self->_editString;
  self->_editString = v31;

  self->_isEditableText = a10;
  self->_needsTechnicalMode = a9;
  if (a7)
  {
    if (!self->_firstToken) {
      self->_firstToken = a7;
    }
    self->_lastToken = a7;
  }
}

- (void)addTextPreCustom:(id)a3 overrideText:(id)a4 language:(id)a5 selection:(_NSRange *)a6 token:(int64_t)a7 focus:(_NSRange *)a8 technical:(BOOL)a9 isEditableText:(BOOL)a10 isTerminalOutput:(BOOL)a11 paddingRange:(_NSRange)a12 suggestionRange:(_NSRange)a13 editingString:(id)a14 textFormattingRanges:(id)a15
{
  id v49 = a3;
  id v19 = a15;
  v52.NSUInteger length = [v49 length];
  v52.NSUInteger location = 0;
  NSRange v20 = NSIntersectionRange(v52, a12);
  if (v20.location == a12.location && v20.length == a12.length)
  {
    uint64_t v25 = objc_msgSend(v49, "stringByReplacingCharactersInRange:withString:", a12.location, a12.length, &stru_26CCE0B50);

    v22 = (void *)v25;
    if (a6) {
      goto LABEL_6;
    }
LABEL_8:
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  v22 = v49;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_6:
  NSUInteger location = a6->location;
  NSUInteger length = a6->length;
LABEL_9:
  id v50 = v22;
  if (a10 && location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = [v22 length];
    NSUInteger length = 0;
  }
  if (a8)
  {
    NSUInteger v26 = a8->location;
    a8 = (_NSRange *)a8->length;
  }
  else
  {
    NSUInteger v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  p_stateManager = &self->_stateManager;
  id v28 = [(BRLTBrailleStateManager *)self->_stateManager outputScriptString];

  if (v28)
  {
    id v29 = [(BRLTBrailleStateManager *)*p_stateManager outputScriptString];
    objc_msgSend(v29, "addString:selection:focus:token:", v50, location, length, v26, a8, a7);
  }
  else
  {
    if (a10)
    {
      if (_editingStateManager)
      {
        uint64_t v30 = [(BRLTBrailleStateManager *)*p_stateManager inputTranslationMode];
        [(id)_editingStateManager setInputTranslationMode:v30];
        uint64_t v31 = [(BRLTBrailleStateManager *)self->_stateManager outputTranslationMode];
        [(id)_editingStateManager setOutputTranslationMode:v31];
        objc_storeStrong((id *)&self->_stateManager, (id)_editingStateManager);
        outputDelegates = self->_outputDelegates;
        if (!outputDelegates || ![(NSPointerArray *)outputDelegates count])
        {
          id v33 = [(BRLTBrailleStateManager *)*p_stateManager translationDelegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v34 = [(BRLTBrailleStateManager *)self->_stateManager translationDelegate];
            v35 = [v34 outputDelegates];
            NSRange v36 = self->_outputDelegates;
            self->_outputDelegates = v35;

            v37 = self->_outputDelegates;
            if (v37)
            {
              v38 = (NSPointerArray *)[(NSPointerArray *)v37 copy];
              v39 = self->_outputDelegates;
              self->_outputDelegates = v38;
            }
          }
        }
        [(BRLTBrailleStateManager *)self->_stateManager setDelegate:self];
        [(BRLTBrailleStateManager *)self->_stateManager setTranslationDelegate:self];
      }
      else
      {
        objc_storeStrong((id *)&_editingStateManager, *p_stateManager);
      }
    }
    if (a4)
    {
      v40 = objc_msgSend(objc_alloc(MEMORY[0x263F2BAA0]), "initWithString:selection:focus:token:", &stru_26CCE0B50, 0, 0, v26, a8, a7);
      [(SCROBrailleFormatter *)self setEmptyEditingScriptString:v40];
    }
    id v29 = objc_msgSend(objc_alloc(MEMORY[0x263F2BAA0]), "initWithString:selection:focus:token:", v50, location, length, v26, a8, a7);
  }
  [v29 setTextFormattingRanges:v19];

  objc_msgSend(v29, "setSuggestionRange:", a13.location, a13.length);
  if (a7)
  {
    if (!self->_firstToken) {
      self->_firstToken = a7;
    }
    self->_lastToken = a7;
  }
  if (a9) {
    [(BRLTBrailleStateManager *)*p_stateManager setOutputTranslationMode:4];
  }
  [(BRLTBrailleStateManager *)*p_stateManager setScriptString:v29];
  [(BRLTBrailleStateManager *)*p_stateManager setEditable:a10];
  [(BRLTBrailleStateManager *)*p_stateManager setIsTerminalOutput:a11];
  if (*p_stateManager == (BRLTBrailleStateManager *)_editingStateManager)
  {
    uint64_t v41 = _editingLanguage;
    v42 = +[SCROBrailleTranslationManager sharedManager];
    v43 = [v42 defaultLanguage];
    LOBYTE(v41) = [(id)v41 isEqualToString:v43];

    if ((v41 & 1) == 0)
    {
      if (_editingLanguage) {
        [(BRLTBrailleStateManager *)*p_stateManager translateForced:1];
      }
      v44 = +[SCROBrailleTranslationManager sharedManager];
      uint64_t v45 = [v44 defaultLanguage];
      v46 = (void *)_editingLanguage;
      _editingLanguage = v45;
    }
  }
}

- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3
{
  if (SCROCustomBrailleEnabled())
  {
    uint64_t v5 = [MEMORY[0x263F2BA78] sharedModel];
    uint64_t v6 = [v5 scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:a3];
    NSUInteger v8 = v7;

    NSUInteger v9 = v6;
    NSUInteger v10 = v8;
  }
  else if (SCROJapaneseBrailleSelected())
  {
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v10 = 0;
  }
  else
  {
    stateManager = self->_stateManager;
    NSUInteger v9 = [(BRLTBrailleStateManager *)stateManager scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:a3];
  }
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (BOOL)hasPlaceholderText
{
  v2 = [(SCROBrailleFormatter *)self emptyEditingScriptString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)clearPlaceholderForEditing
{
  if ((SCROJapaneseBrailleSelected() & 1) == 0 && (SCROCustomBrailleEnabled() & 1) == 0)
  {
    stateManager = self->_stateManager;
    v4 = [(SCROBrailleFormatter *)self emptyEditingScriptString];
    [(BRLTBrailleStateManager *)stateManager setScriptString:v4];

    [(BRLTBrailleStateManager *)self->_stateManager setEditable:1];
    [(SCROBrailleFormatter *)self setEmptyEditingScriptString:0];
  }
}

- (void)translate
{
}

- (void)translate:(BOOL)a3
{
  if (SCROCustomBrailleEnabled())
  {
    id v5 = [MEMORY[0x263F2BA78] sharedModel];
    [v5 forceTranslate];
  }
  else if ((SCROJapaneseBrailleSelected() & 1) == 0)
  {
    stateManager = self->_stateManager;
    [(BRLTBrailleStateManager *)stateManager translate];
  }
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  v17 = +[SCROBrailleTranslationManager sharedManager];
  uint64_t v18 = objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v16, v15, a5, location, length, a7, v14);

  return v18;
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[SCROBrailleTranslationManager sharedManager];
  uint64_t v12 = [v11 textForPrintBraille:v10 language:v9 mode:a5 locations:a6];

  return v12;
}

- (void)addOutputDelegate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v10 = v4;
  if (!self->_outputDelegates)
  {
    uint64_t v6 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    outputDelegates = self->_outputDelegates;
    self->_outputDelegates = v6;

    id v5 = v10;
  }
  if (v5)
  {
    NSUInteger v8 = [(NSPointerArray *)self->_outputDelegates allObjects];
    char v9 = [v8 containsObject:v10];

    if ((v9 & 1) == 0) {
      id v4 = (id)[(NSPointerArray *)self->_outputDelegates addPointer:v10];
    }
  }

  MEMORY[0x270F9A758](v4);
}

- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = self->_outputDelegates;
  uint64_t v12 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "brailleDisplayStringDidChange:brailleSelection:modifiers:", v9, location, length, v10, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v9 = a4;
  memset(v11, 0, sizeof(v11));
  id v10 = self->_outputDelegates;
  if ([(NSPointerArray *)v10 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    objc_msgSend(**((id **)&v11[0] + 1), "replaceScriptStringRange:withScriptString:cursorLocation:", location, length, v9, a5, *(void *)&v11[0]);
  }
}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  id v5 = self->_outputDelegates;
  if ([(NSPointerArray *)v5 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    objc_msgSend(**((id **)&v6[0] + 1), "scriptSelectionDidChange:", location, length, *(void *)&v6[0]);
  }
}

- (void)didInsertScriptString:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v6, 0, sizeof(v6));
  id v5 = self->_outputDelegates;
  if ([(NSPointerArray *)v5 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    objc_msgSend(**((id **)&v6[0] + 1), "didInsertScriptString:", v4, *(void *)&v6[0]);
  }
}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    if (![v6 bits]
      || [(BRLTBrailleStateManager *)self->_stateManager inputTranslationMode] == 2
      && (+[SCROBrailleTranslationManager sharedManager],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 primaryTableSupportsEightDotBraille],
          v8,
          v9))
    {
      [(BRLTBrailleStateManager *)self->_stateManager translate];
    }
  }
  memset(v11, 0, sizeof(v11));
  id v10 = self->_outputDelegates;
  if ([(NSPointerArray *)v10 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    objc_msgSend(**((id **)&v11[0] + 1), "brailleDisplayInsertedCharacter:modifiers:", v6, v7, *(void *)&v11[0]);
  }
}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  id v5 = self->_outputDelegates;
  if ([(NSPointerArray *)v5 countByEnumeratingWithState:v8 objects:v9 count:16])
  {
    objc_msgSend(**((id **)&v8[0] + 1), "brailleDisplayDeletedCharacter:", v4, *(void *)&v8[0]);
  }

  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    if (![v4 bits]
      || [(BRLTBrailleStateManager *)self->_stateManager inputTranslationMode] == 2
      && (+[SCROBrailleTranslationManager sharedManager],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 primaryTableSupportsEightDotBraille],
          v6,
          v7))
    {
      [(BRLTBrailleStateManager *)self->_stateManager translate];
    }
  }
}

- (void)requestSpeech:(id)a3 language:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  memset(v9, 0, sizeof(v9));
  uint64_t v8 = self->_outputDelegates;
  if ([(NSPointerArray *)v8 countByEnumeratingWithState:v9 objects:v10 count:16])
  {
    objc_msgSend(**((id **)&v9[0] + 1), "requestSpeech:language:", v6, v7, *(void *)&v9[0]);
  }
}

- (int)lineFocus
{
  return self->_lineFocus;
}

- (void)setLineFocus:(int)a3
{
  self->_lineFocus = a3;
}

- (NSString)outputTableIdentifier
{
  return self->_outputTableIdentifier;
}

- (NSString)inputTableIdentifier
{
  return self->_inputTableIdentifier;
}

- (BOOL)isEditableText
{
  return self->_isEditableText;
}

- (BOOL)needsTechnicalMode
{
  return self->_needsTechnicalMode;
}

- (BOOL)showDotsSevenAndEight
{
  return self->_showDotsSevenAndEight;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int)a3
{
  self->_displayMode = a3;
}

- (BOOL)currentUnread
{
  return self->_currentUnread;
}

- (void)setCurrentUnread:(BOOL)a3
{
  self->_currentUnread = a3;
}

- (BOOL)anyUnread
{
  return self->_anyUnread;
}

- (void)setAnyUnread:(BOOL)a3
{
  self->_anyUnread = a3;
}

- (id)appToken
{
  return self->_appToken;
}

- (void)setAppToken:(id)a3
{
}

- (int64_t)lineOffset
{
  return self->_lineOffset;
}

- (void)setLineOffset:(int64_t)a3
{
  self->_lineOffset = a3;
}

- (NSAttributedString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (BRLTBrailleStateManager)stateManager
{
  return self->_stateManager;
}

- (BRLTEditString)editString
{
  return self->_editString;
}

- (int64_t)firstToken
{
  return self->_firstToken;
}

- (int64_t)lastToken
{
  return self->_lastToken;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (NSPointerArray)outputDelegates
{
  return self->_outputDelegates;
}

- (BRLTScriptString)emptyEditingScriptString
{
  return self->_emptyEditingScriptString;
}

- (void)setEmptyEditingScriptString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyEditingScriptString, 0);
  objc_storeStrong((id *)&self->_outputDelegates, 0);
  objc_storeStrong((id *)&self->_editString, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong(&self->_appToken, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);

  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
}

@end