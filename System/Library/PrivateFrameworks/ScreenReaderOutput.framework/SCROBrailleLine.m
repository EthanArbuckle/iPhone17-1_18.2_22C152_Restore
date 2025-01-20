@interface SCROBrailleLine
+ (void)initialize;
- (BOOL)_allowInset;
- (BOOL)_blink:(BOOL)a3;
- (BOOL)_canPlanarPanLeft;
- (BOOL)_canPlanarPanRight;
- (BOOL)_deleteAtCursorSilently:(BOOL)a3;
- (BOOL)_forwardDeleteAtCursorSilently:(BOOL)a3;
- (BOOL)_insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4 silently:(BOOL)a5;
- (BOOL)_setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)anyUnread;
- (BOOL)blinkEnabled;
- (BOOL)canPanLeft;
- (BOOL)canPanRight;
- (BOOL)currentUnread;
- (BOOL)deleteAtCursor;
- (BOOL)display;
- (BOOL)displayEnabled;
- (BOOL)editableFieldInterruptedByAlert;
- (BOOL)forwardDeleteAtCursor;
- (BOOL)getStatusRouterIndex:(int64_t *)a3 forRawIndex:(int64_t)a4;
- (BOOL)hasEdits;
- (BOOL)insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4;
- (BOOL)isSingleLetterInputOn;
- (BOOL)isTextSearchModeOn;
- (BOOL)moveCursorLeft;
- (BOOL)moveCursorRight;
- (BOOL)moveCursorToRouterIndex:(unint64_t)a3 forwardToScreenReader:(BOOL *)a4 updateRouterLocation:(int64_t *)a5;
- (BOOL)needsDisplayFlush;
- (BOOL)panBeginning;
- (BOOL)panEnd;
- (BOOL)panLeft;
- (BOOL)panRight;
- (BOOL)showDotsSevenAndEight;
- (BOOL)wantsEdits;
- (BOOL)wordWrapEnabled;
- (BRLTBrailleStateManager)stateManager;
- (BRLTBrailleStateManagerDelegate)translationDelegate;
- (NSAttributedString)editingString;
- (NSData)imageData;
- (NSMutableArray)pendingBrailleStringDictionaries;
- (NSString)description;
- (SCROBrailleLine)initWithDriver:(id)a3 mainSize:(int64_t)a4 statusSize:(int64_t)a5;
- (_NSRange)textRangeForBrailleRange:(_NSRange)a3;
- (id)_applySuggestionCellsToPrintBraille:(id)a3;
- (id)appToken;
- (id)imageCanvas;
- (id)newLineDescriptor;
- (id)newLineDescriptorWithoutPadding;
- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8;
- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6;
- (id)translatedBrailleForTableIdentifier:(id)a3;
- (int)displayMode;
- (int)lineFocus;
- (int64_t)_indexOfWhitespaceAfterIBeam:(int64_t)a3 inLine:(id)a4;
- (int64_t)_indexOfWhitespaceBeforeIBeam:(int64_t)a3 inLine:(id)a4;
- (int64_t)firstToken;
- (int64_t)lastToken;
- (int64_t)lineOffset;
- (int64_t)masterStatusCellIndex;
- (int64_t)tokenForRouterIndex:(int64_t *)a3 location:(int64_t *)a4 appToken:(id *)a5;
- (unint64_t)bufferIndexForRouterIndex:(unint64_t)a3;
- (unint64_t)generationID;
- (unint64_t)numberOfTextLinesInPlanarBraille;
- (void)_flush;
- (void)_flushRealStatus;
- (void)_updateOffsets;
- (void)addAttributedPaddingToLineBuffer:(id)a3;
- (void)addAttributedStringToLineBuffer:(id)a3 brailleOffset:(unint64_t)a4;
- (void)blinker;
- (void)brailleDisplayDeletedCharacter:(id)a3;
- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4;
- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5;
- (void)dealloc;
- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4;
- (void)didInsertScriptString:(id)a3;
- (void)discardEdits;
- (void)enumerateWordsBetweenCharacters:(id)a3 text:(id)a4 inRange:(_NSRange)a5 usingBlock:(id)a6;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)planarPanLeft;
- (void)planarPanRight;
- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5;
- (void)scriptSelectionDidChange:(_NSRange)a3;
- (void)setAnyUnread:(BOOL)a3;
- (void)setAppToken:(id)a3;
- (void)setBlinkEnabled:(BOOL)a3;
- (void)setCurrentUnread:(BOOL)a3;
- (void)setDisplayEnabled:(BOOL)a3;
- (void)setDisplayMode:(int)a3;
- (void)setEditableFieldInterruptedByAlert:(BOOL)a3;
- (void)setFormatter:(id)a3;
- (void)setGenerationID:(unint64_t)a3;
- (void)setImageData:(id)a3;
- (void)setIsSingleLetterInputOn:(BOOL)a3;
- (void)setIsTextSearchModeOn:(BOOL)a3;
- (void)setLineFocus:(int)a3;
- (void)setLineOffset:(int64_t)a3;
- (void)setMainSize:(int64_t)a3;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setPendingBrailleStringDictionaries:(id)a3;
- (void)setPlanarData:(id)a3;
- (void)setRealStatus:(id)a3;
- (void)setShowDotsSevenAndEight:(BOOL)a3;
- (void)setStatusSize:(int64_t)a3;
- (void)setTranslationDelegate:(id)a3;
- (void)setVirtualStatus:(id)a3 alignment:(int)a4;
- (void)setWordWrapEnabled:(BOOL)a3;
- (void)translate;
@end

@implementation SCROBrailleLine

+ (void)initialize
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v9[0] = kSCROBrailleUnicodeCharacterSpace;
    v9[1] = kSCROBrailleUnicodeCharacterDot7;
    v9[2] = kSCROBrailleUnicodeCharacterDot8;
    v9[3] = kSCROBrailleUnicodeCharacterDot78;
    v2 = (void *)[[NSString alloc] initWithCharacters:v9 length:4];
    uint64_t v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v2];
    v4 = (void *)_WhitespaceSet;
    _WhitespaceSet = v3;

    uint64_t v5 = 0;
    v6 = &kSCROBrailleUnicodeCharacterBase;
    int16x8_t v7 = vld1q_dup_s16(v6);
    do
    {
      *(int16x8_t *)&v8[v5] = v7;
      v5 += 8;
    }
    while (v5 != 256);
    _SpaceString = (uint64_t)CFStringCreateWithCharacters(0, v8, 256);
  }
}

- (SCROBrailleLine)initWithDriver:(id)a3 mainSize:(int64_t)a4 statusSize:(int64_t)a5
{
  id v9 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SCROBrailleLine;
  uint64_t v10 = [(SCROBrailleLine *)&v25 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_brailleDriver, a3);
    v12 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x263F089B8]);
    lineBuffer = v11->_lineBuffer;
    v11->_lineBuffer = v12;

    v11->_lineOffset = 0;
    v11->_displayMode = 0;
    v11->_focusRange = (_NSRange)xmmword_21C6B9890;
    v11->_selectionRange = (_NSRange)xmmword_21C6B9890;
    v11->_suggestionRange = (_NSRange)xmmword_21C6B9890;
    *(_OWORD *)&v11->_masterStatusCellIndex = xmmword_21C6B98A0;
    v11->_showDotsSevenAndEight = 1;
    v11->_displayEnabled = 1;
    *(_WORD *)&v11->_wordWrapEnabled = 257;
    v11->_isUIString = 0;
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    pendingBrailleStringDictionaries = v11->_pendingBrailleStringDictionaries;
    v11->_pendingBrailleStringDictionaries = (NSMutableArray *)v14;

    v16 = objc_alloc_init(SCROBrailleLineVirtualStatus);
    virtualStatus = v11->_virtualStatus;
    v11->_virtualStatus = v16;

    [(SCROBrailleLineVirtualStatus *)v11->_virtualStatus setAlignment:0];
    [(SCROBrailleLineVirtualStatus *)v11->_virtualStatus setLength:0];
    [(SCROBrailleLineVirtualStatus *)v11->_virtualStatus setCells:0];
    char v18 = objc_opt_respondsToSelector();
    v11->_supportsCanvas = v18 & 1;
    if (v18)
    {
      v19 = [[SCRO2DBraillePlane alloc] initWithDriver:v11->_brailleDriver];
      braillePlane = v11->_braillePlane;
      v11->_braillePlane = v19;
    }
    v21 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    flushLock = v11->_flushLock;
    v11->_flushLock = v21;

    [(SCROBrailleLine *)v11 setMainSize:a4];
    [(SCROBrailleLine *)v11 setStatusSize:a5];
    v23 = [MEMORY[0x263F2BA98] manager];
    [v23 setDelegate:v11];

    v11->_inputMode = 1;
  }

  return v11;
}

- (id)imageCanvas
{
  if (self->_supportsCanvas)
  {
    v2 = [(SCROBrailleDriverProtocol *)self->_brailleDriver canvas];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setImageData:(id)a3
{
  if (self->_supportsCanvas)
  {
    id v4 = a3;
    uint64_t v5 = [(SCROBrailleLine *)self imageCanvas];
    [v5 setImageData:v4];

    brailleDriver = self->_brailleDriver;
    [(SCROBrailleDriverProtocol *)brailleDriver displayCanvas];
  }
}

- (NSData)imageData
{
  v2 = [(SCROBrailleLine *)self imageCanvas];
  uint64_t v3 = [v2 imageData];

  return (NSData *)v3;
}

- (void)setPlanarData:(id)a3
{
  if (self->_supportsCanvas) {
    [(SCRO2DBraillePlane *)self->_braillePlane setBrailleData:a3];
  }
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  if (!self->_supportsCanvas) {
    return 0;
  }
  v2 = [(SCROBrailleLine *)self imageCanvas];
  uint64_t v3 = [v2 descriptor];
  unint64_t v4 = [v3 numberOfTextLinesAvailable];

  return v4;
}

- (void)dealloc
{
  displayBuffer = self->_displayBuffer;
  if (displayBuffer) {
    free(displayBuffer);
  }
  mainCellsBuffer = self->_mainCellsBuffer;
  if (mainCellsBuffer) {
    free(mainCellsBuffer);
  }
  displayFilter = self->_displayFilter;
  if (displayFilter) {
    free(displayFilter);
  }
  blinkerBuffer = self->_blinkerBuffer;
  if (blinkerBuffer) {
    free(blinkerBuffer);
  }
  statusFilter = self->_statusFilter;
  if (statusFilter) {
    free(statusFilter);
  }
  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleLine;
  [(SCROBrailleLine *)&v8 dealloc];
}

- (void)setAppToken:(id)a3
{
}

- (id)appToken
{
  return self->_appToken;
}

- (void)setMainSize:(int64_t)a3
{
  if (self->_size != a3)
  {
    self->_size = a3;
    uint64_t v5 = (char *)malloc_type_realloc(self->_displayBuffer, a3, 0x4E8FE86EuLL);
    self->_displayBuffer = v5;
    bzero(v5, self->_size);
    v6 = (char *)malloc_type_realloc(self->_mainCellsBuffer, a3, 0x64474A69uLL);
    self->_mainCellsBuffer = v6;
    bzero(v6, self->_size);
    int16x8_t v7 = (char *)malloc_type_realloc(self->_displayFilter, a3, 0xEFDB93F4uLL);
    self->_displayFilter = v7;
    bzero(v7, self->_size);
    objc_super v8 = (char *)malloc_type_realloc(self->_blinkerBuffer, a3, 0x93A091D6uLL);
    self->_blinkerBuffer = v8;
    bzero(v8, self->_size);
    [(SCROBrailleLine *)self _updateOffsets];
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
    self->_needsFocusFlush = 1;
  }
}

- (void)setStatusSize:(int64_t)a3
{
  if (self->_statusSize != a3)
  {
    self->_statusSize = a3;
    unint64_t v4 = (char *)malloc_type_realloc(self->_statusFilter, a3, 0x100004077774924uLL);
    self->_statusFilter = v4;
    bzero(v4, self->_statusSize);
    self->_needsStatusFlush = 1;
  }
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  if (self->_masterStatusCellIndex != a3)
  {
    self->_masterStatusCellIndex = a3;
    unint64_t v4 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus data];
    [(SCROBrailleLine *)self setVirtualStatus:v4 alignment:[(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment]];

    statusData = self->_statusData;
    [(SCROBrailleLine *)self setRealStatus:statusData];
  }
}

- (int64_t)masterStatusCellIndex
{
  return self->_masterStatusCellIndex;
}

- (void)setRealStatus:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  if (self->_statusSize >= 1)
  {
    objc_super v8 = (void *)v5;
    uint64_t v5 = [(NSData *)self->_statusData isEqualToData:v5];
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_statusData, a3);
      unint64_t v6 = [v8 length];
      bzero(self->_statusFilter, self->_statusSize);
      if (v6 >= self->_statusSize) {
        int64_t statusSize = self->_statusSize;
      }
      else {
        int64_t statusSize = v6;
      }
      uint64_t v5 = [v8 getBytes:self->_statusFilter length:statusSize];
      self->_needsStatusFlush = 1;
    }
  }

  MEMORY[0x270F9A758](v5);
}

- (void)setVirtualStatus:(id)a3 alignment:(int)a4
{
  id v17 = a3;
  unint64_t v6 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus data];
  char v7 = [v6 isEqualToData:v17];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    int64_t v9 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length];
    [(SCROBrailleLineVirtualStatus *)self->_virtualStatus setData:v17];
    uint64_t v10 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus data];

    virtualStatus = self->_virtualStatus;
    if (v10)
    {
      v12 = [(SCROBrailleLineVirtualStatus *)virtualStatus data];
      -[SCROBrailleLineVirtualStatus setLength:](self->_virtualStatus, "setLength:", [v12 length]);

      [(SCROBrailleLineVirtualStatus *)self->_virtualStatus setCells:malloc_type_realloc([(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells], [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length], 0x100004077774924uLL)];
      v13 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus data];
      objc_msgSend(v13, "getBytes:length:", -[SCROBrailleLineVirtualStatus cells](self->_virtualStatus, "cells"), -[SCROBrailleLineVirtualStatus length](self->_virtualStatus, "length"));
    }
    else
    {
      [(SCROBrailleLineVirtualStatus *)virtualStatus setLength:0];
      if ([(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells])
      {
        free([(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells]);
        [(SCROBrailleLineVirtualStatus *)self->_virtualStatus setCells:0];
      }
    }
    BOOL v8 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length] != v9;
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
  }
  int v14 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment];
  v15 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus data];
  if (v15) {
    uint64_t v16 = a4;
  }
  else {
    uint64_t v16 = 0;
  }
  [(SCROBrailleLineVirtualStatus *)self->_virtualStatus setAlignment:v16];

  if ([(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment] != v14)
  {
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
    goto LABEL_15;
  }
  if (v8)
  {
LABEL_15:
    [(SCROBrailleLine *)self _updateOffsets];
    self->_needsFocusFlush = 1;
  }
}

- (BOOL)_allowInset
{
  return self->_size > 11;
}

- (void)_updateOffsets
{
  self->_leftInset = 0;
  self->_rightInset = 0;
  self->_insetSize = self->_size;
  if ([(SCROBrailleLine *)self _allowInset])
  {
    int displayMode = self->_displayMode;
    if (!displayMode || displayMode == 5)
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      *(int64x2_t *)&self->_leftInset = vaddq_s64(*(int64x2_t *)&self->_leftInset, vdupq_n_s64(1uLL));
      self->_insetSize -= 2;
    }
    if ([(SCROBrailleLineVirtualStatus *)self->_virtualStatus length] >= 1)
    {
      int v6 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment];
      int64_t v7 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length];
      uint64_t v8 = 64;
      if (!v6) {
        uint64_t v8 = 56;
      }
      *(Class *)((char *)&self->super.isa + v8) = (Class)(*(char **)((char *)&self->super.isa + v8) + v7 + v5);
      self->_insetSize = self->_insetSize - v5 - [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length];
    }
  }
}

- (BOOL)canPanLeft
{
  return self->_lineOffset != 0;
}

- (BOOL)panLeft
{
  BOOL v3 = [(SCROBrailleLine *)self canPanLeft];
  if (v3)
  {
    self->_lineOffset = (self->_lineOffset - self->_insetSize) & ~((self->_lineOffset - self->_insetSize) >> 63);
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3;
}

- (BOOL)canPanRight
{
  int64_t lineOffset = self->_lineOffset;
  int64_t insetSize = self->_insetSize;
  return insetSize + lineOffset < (unint64_t)[(NSMutableAttributedString *)self->_lineBuffer length];
}

- (BOOL)panRight
{
  BOOL v3 = [(SCROBrailleLine *)self canPanRight];
  if (v3)
  {
    self->_lineOffset += self->_insetSize;
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3;
}

- (BOOL)panBeginning
{
  self->_int64_t lineOffset = 0;
  self->_needsDisplayFlush = 1;
  self->_isPanning = 1;
  return 1;
}

- (BOOL)panEnd
{
  unint64_t v3 = [(NSMutableAttributedString *)self->_lineBuffer length];
  unint64_t insetSize = self->_insetSize;
  if (v3 > insetSize)
  {
    self->_int64_t lineOffset = [(NSMutableAttributedString *)self->_lineBuffer length] - self->_insetSize;
    self->_needsDisplayFlush = 1;
    self->_isPanning = 1;
  }
  return v3 > insetSize;
}

- (void)planarPanLeft
{
  if ([(SCROBrailleLine *)self _canPlanarPanLeft])
  {
    [(SCRO2DBraillePlane *)self->_braillePlane panLeft];
    brailleDriver = self->_brailleDriver;
    [(SCROBrailleDriverProtocol *)brailleDriver displayCanvas];
  }
  else
  {
    [(SCROBrailleLine *)self handlePlanarPanFailedIsLeft:1];
  }
}

- (void)planarPanRight
{
  if ([(SCROBrailleLine *)self _canPlanarPanRight])
  {
    [(SCRO2DBraillePlane *)self->_braillePlane panRight];
    brailleDriver = self->_brailleDriver;
    [(SCROBrailleDriverProtocol *)brailleDriver displayCanvas];
  }
  else
  {
    [(SCROBrailleLine *)self handlePlanarPanFailedIsLeft:0];
  }
}

- (BOOL)_canPlanarPanLeft
{
  return self->_supportsCanvas && [(SCRO2DBraillePlane *)self->_braillePlane canPanLeft];
}

- (BOOL)_canPlanarPanRight
{
  return self->_supportsCanvas && [(SCRO2DBraillePlane *)self->_braillePlane canPanRight];
}

- (void)setCurrentUnread:(BOOL)a3
{
  if (self->_currentUnread != a3)
  {
    self->_currentUnread = a3;
    if ((self->_masterStatusCellIndex & 0x8000000000000000) == 0) {
      self->_needsStatusFlush = 1;
    }
  }
}

- (BOOL)currentUnread
{
  return self->_currentUnread;
}

- (void)setAnyUnread:(BOOL)a3
{
  if (self->_anyUnread != a3)
  {
    self->_anyUnread = a3;
    if ((self->_masterStatusCellIndex & 0x8000000000000000) == 0) {
      self->_needsStatusFlush = 1;
    }
  }
}

- (BOOL)anyUnread
{
  return self->_anyUnread;
}

- (void)setFormatter:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [(BRLTBrailleStateManager *)self->_stateManager editable];
  if (SCROCustomBrailleEnabled())
  {
    int64_t v7 = [MEMORY[0x263F2BA78] sharedModel];
    char v8 = [v7 editable];
  }
  else
  {
    if (!SCROJapaneseBrailleSelected()) {
      goto LABEL_6;
    }
    int64_t v7 = [MEMORY[0x263F2BA98] manager];
    char v8 = [v7 isEditing];
  }
  char v6 = v8;

LABEL_6:
  if (self->_isUIString) {
    self->_previousUILineOffset = self->_lineOffset;
  }
  int v9 = [v5 displayMode];
  self->_isUIString = v9 == 0;
  if (v9) {
    BOOL v10 = v6;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10 || !v9) {
    self->_BOOL editableFieldInterruptedByAlert = v10;
  }
  self->_int64_t lineOffset = [v5 lineOffset];
  self->_iBeamLocation = -1;
  -[SCROBrailleLine setShowDotsSevenAndEight:](self, "setShowDotsSevenAndEight:", [v5 showDotsSevenAndEight]);
  -[SCROBrailleLine setCurrentUnread:](self, "setCurrentUnread:", [v5 currentUnread]);
  -[SCROBrailleLine setAnyUnread:](self, "setAnyUnread:", [v5 anyUnread]);
  -[SCROBrailleLine setDisplayMode:](self, "setDisplayMode:", [v5 displayMode]);
  v11 = [v5 appToken];
  [(SCROBrailleLine *)self setAppToken:v11];

  -[SCROBrailleLine setLineFocus:](self, "setLineFocus:", [v5 lineFocus]);
  -[SCROBrailleLine setLineOffset:](self, "setLineOffset:", [v5 lineOffset]);
  -[SCROBrailleLine setGenerationID:](self, "setGenerationID:", [v5 generationID]);
  if (self->_isUIString)
  {
    objc_storeStrong((id *)&self->_previousUIString, self->_currentUIString);
    v12 = [v5 editString];
    v13 = [v12 string];
    currentUIString = self->_currentUIString;
    self->_currentUIString = v13;
  }
  self->_firstToken = [v5 firstToken];
  self->_lastToken = [v5 lastToken];
  self->_needsDisplayFlush = 1;
  self->_brailleChunksAreDirty = 1;
  self->_needsFocusFlush = 1;
  v15 = [v5 stateManager];
  stateManager = self->_stateManager;
  self->_stateManager = v15;

  objc_storeStrong((id *)&self->_brailleFormatter, a3);
  uint64_t v17 = [v5 inputTableIdentifier];
  if (v17)
  {
    char v18 = (void *)v17;
    inputTableIdentifier = self->_inputTableIdentifier;
    v20 = [v5 inputTableIdentifier];
    LOBYTE(inputTableIdentifier) = [(NSString *)inputTableIdentifier isEqualToString:v20];

    if ((inputTableIdentifier & 1) == 0)
    {
      v21 = [v5 inputTableIdentifier];
      v22 = self->_inputTableIdentifier;
      self->_inputTableIdentifier = v21;

      id v23 = objc_alloc(MEMORY[0x263F2BAA8]);
      v24 = [v5 inputTableIdentifier];
      objc_super v25 = (void *)[v23 initWithIdentifier:v24];

      if ([v25 supportsTranslationMode8Dot])
      {
        unint64_t v26 = 2;
      }
      else if ([v25 supportsTranslationModeContracted])
      {
        unint64_t v26 = 3;
      }
      else
      {
        unint64_t v26 = 1;
      }
      self->_inputMode = v26;
    }
  }
  [v5 addOutputDelegate:self];
  v27 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
  if (![v27 count])
  {

    goto LABEL_48;
  }
  BOOL editableFieldInterruptedByAlert = self->_editableFieldInterruptedByAlert;

  if (!editableFieldInterruptedByAlert)
  {
    char v29 = [(BRLTBrailleStateManager *)self->_stateManager editable];
    if (SCROCustomBrailleEnabled())
    {
      v30 = [MEMORY[0x263F2BA78] sharedModel];
      char v31 = [v30 editable];
    }
    else
    {
      if (!SCROJapaneseBrailleSelected())
      {
        if (v29) {
          goto LABEL_32;
        }
        goto LABEL_47;
      }
      v30 = [MEMORY[0x263F2BA98] manager];
      char v31 = [v30 isEditing];
    }
    char v32 = v31;

    if (v32)
    {
LABEL_32:
      id v44 = v5;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v33 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v46 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v39 = v38;
              v40 = [v39 pendingBraille];
              v41 = [v39 modifiers];
              [(SCROBrailleLine *)self _insertBrailleStringAtCursor:v40 modifiers:v41 silently:1];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v38 isForwardDelete]) {
                  [(SCROBrailleLine *)self _forwardDeleteAtCursorSilently:1];
                }
                else {
                  [(SCROBrailleLine *)self _deleteAtCursorSilently:1];
                }
              }
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v35);
      }

      v42 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
      [v42 removeAllObjects];

      id v5 = v44;
      goto LABEL_48;
    }
LABEL_47:
    v43 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
    [v43 removeAllObjects];
  }
LABEL_48:
}

- (int64_t)firstToken
{
  return self->_firstToken;
}

- (int64_t)lastToken
{
  return self->_lastToken;
}

- (BOOL)getStatusRouterIndex:(int64_t *)a3 forRawIndex:(int64_t)a4
{
  if (![(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment])
  {
    if (self->_leftInset > a4) {
      goto LABEL_5;
    }
LABEL_6:
    BOOL result = 0;
    a4 = -1;
    goto LABEL_7;
  }
  int64_t size = self->_size;
  int64_t rightInset = self->_rightInset;
  if (size - rightInset > a4) {
    goto LABEL_6;
  }
  a4 += ~size + rightInset;
LABEL_5:
  BOOL result = 1;
LABEL_7:
  *a3 = a4;
  return result;
}

- (int64_t)tokenForRouterIndex:(int64_t *)a3 location:(int64_t *)a4 appToken:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int64_t v5 = *a3 - self->_leftInset + self->_lineOffset;
  if (v5 < 0 || v5 >= (unint64_t)[(NSMutableAttributedString *)self->_lineBuffer length]) {
    return 0;
  }
  lineBuffer = self->_lineBuffer;
  unint64_t v11 = [(NSMutableAttributedString *)lineBuffer length];
  if (v5 + 1 < v11) {
    unint64_t v12 = v5 + 1;
  }
  else {
    unint64_t v12 = v11;
  }
  v13 = -[NSMutableAttributedString attributedSubstringFromRange:](lineBuffer, "attributedSubstringFromRange:", 0, v12);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v14 = [v13 length];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke;
  v37[3] = &unk_264414C78;
  v37[4] = &v42;
  v37[5] = &v38;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", @"padd", 0, v14, 0, v37);
  uint64_t v15 = [v13 length];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke_2;
  v36[3] = &unk_2644147B8;
  v36[4] = &v42;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", @"sugg", 0, v15, 0, v36);
  if (!*a3) {
    v39[3] = 0;
  }
  if (SCROCustomBrailleEnabled())
  {
    uint64_t v16 = [MEMORY[0x263F2BA78] sharedModel];
    uint64_t v17 = [v16 scriptLocationForBrailleLocation:v5 - v43[3]];
LABEL_13:
    unint64_t v19 = v17;

    goto LABEL_15;
  }
  if (SCROJapaneseBrailleSelected())
  {
    uint64_t v16 = [MEMORY[0x263F2BA98] manager];
    uint64_t v17 = [v16 scriptLocationForBrailleLocation:v5 - v43[3]];
    goto LABEL_13;
  }
  unint64_t v19 = [(BRLTBrailleStateManager *)self->_stateManager scriptLocationForBrailleLocation:v5 - v43[3]];
LABEL_15:
  if (!v39[3])
  {
    if (SCROCustomBrailleEnabled())
    {
      v20 = [MEMORY[0x263F2BA78] sharedModel];
      v21 = [v20 displayedScript];
      uint64_t v22 = [v21 tokenForLocation:v19];
    }
    else
    {
      if (!SCROJapaneseBrailleSelected())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v24 = [(BRLTBrailleStateManager *)self->_stateManager outputScriptString];
        v20 = [v24 tokenRanges];

        int64_t v18 = [v20 countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v18)
        {
          uint64_t v25 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v20);
              }
              v27 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              unint64_t v28 = [v27 range];
              if (v19 >= v28 && v19 - v28 < v29 && v19 != v28 + v29)
              {
                int64_t v18 = [v27 token];
                goto LABEL_22;
              }
            }
            int64_t v18 = [v20 countByEnumeratingWithState:&v32 objects:v46 count:16];
          }
          while (v18);
        }
        goto LABEL_22;
      }
      v20 = [MEMORY[0x263F2BA98] manager];
      v21 = [v20 displayedScript];
      uint64_t v22 = [v21 tokenForLocation:v19];
    }
    int64_t v18 = v22;

LABEL_22:
    goto LABEL_23;
  }
  int64_t v18 = 0;
LABEL_23:
  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = self->_appToken;
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v18;
}

uint64_t __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 integerValue];
  if (result == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a4;
  }
  else {
    a4 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  return result;
}

uint64_t __57__SCROBrailleLine_tokenForRouterIndex_location_appToken___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 integerValue];
  if (result == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a4;
  }
  return result;
}

- (void)enumerateWordsBetweenCharacters:(id)a3 text:(id)a4 inRange:(_NSRange)a5 usingBlock:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (void (**)(id, void *, NSUInteger, NSUInteger, unsigned char *))a6;
  NSUInteger v13 = location + length;
  if (location + length <= [v11 length] && location < v13)
  {
    char v14 = 0;
    NSUInteger v15 = location;
    do
    {
      char v21 = 0;
      uint64_t v16 = [v11 characterAtIndex:location];
      if ([v10 characterIsMember:v16])
      {
        if ([v10 characterIsMember:v16])
        {
          if (v14)
          {
            uint64_t v17 = objc_msgSend(v11, "substringWithRange:", v15, location - v15);
            v12[2](v12, v17, v15, location - v15, &v21);

            if (v21) {
              goto LABEL_16;
            }
          }
          int64_t v18 = objc_msgSend(v11, "substringWithRange:", location, 1);
          v12[2](v12, v18, location, 1, &v21);

          if (v21) {
            goto LABEL_16;
          }
          char v14 = 0;
          NSUInteger v15 = location;
        }
      }
      else
      {
        if ((v14 & 1) == 0) {
          NSUInteger v15 = location;
        }
        char v14 = 1;
      }
      ++location;
      --length;
    }
    while (length);
    if (v14)
    {
      char v20 = 0;
      unint64_t v19 = objc_msgSend(v11, "substringWithRange:", v15, v13 - v15);
      v12[2](v12, v19, v15, v13 - v15, &v20);
    }
  }
LABEL_16:
}

- (id)newLineDescriptor
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  unint64_t v4 = (void *)[(NSMutableAttributedString *)self->_lineBuffer mutableCopy];
  int64_t v5 = (void *)[v4 copy];
  if (!SCROCustomBrailleEnabled())
  {
    if (!SCROJapaneseBrailleSelected())
    {
      if ([(BRLTBrailleStateManager *)self->_stateManager outputTranslationMode] == 4)
      {
        char v8 = [v5 string];
        +[SCROBrailleTranslationUtility translatedTextInIsolationForBraille:v8 translationMode:4];
      }
      else
      {
        char v8 = [(BRLTBrailleStateManager *)self->_stateManager outputScriptString];
        [v8 string];
      uint64_t v9 = };
      goto LABEL_12;
    }
    char v8 = [MEMORY[0x263F2BA98] manager];
    id v10 = [v8 displayedScript];
    uint64_t v11 = [v10 string];
LABEL_10:
    unint64_t v12 = (void *)v11;

    goto LABEL_13;
  }
  char v6 = [MEMORY[0x263F2BA78] sharedModel];
  int v7 = [v6 technicalMode];

  if (!v7)
  {
    char v8 = [MEMORY[0x263F2BA78] sharedModel];
    id v10 = [v8 displayedScript];
    uint64_t v11 = [v10 string];
    goto LABEL_10;
  }
  char v8 = [v5 string];
  uint64_t v9 = +[SCROBrailleTranslationUtility translatedTextInIsolationForBraille:v8 translationMode:4];
LABEL_12:
  unint64_t v12 = (void *)v9;
LABEL_13:

  int v61 = 683681792;
  NSUInteger v13 = (void *)MEMORY[0x263F08708];
  char v14 = [NSString stringWithCharacters:&v61 length:2];
  NSUInteger v15 = [v13 characterSetWithCharactersInString:v14];

  id v51 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __36__SCROBrailleLine_newLineDescriptor__block_invoke;
  v53[3] = &unk_264414CC8;
  SEL v59 = a2;
  id v50 = v5;
  id v54 = v50;
  v55 = self;
  id v16 = v4;
  id v56 = v16;
  v58 = v60;
  id v17 = v15;
  id v57 = v17;
  id v52 = (id)MEMORY[0x21D4AD760](v53);
  -[SCROBrailleLine enumerateWordsBetweenCharacters:text:inRange:usingBlock:](self, "enumerateWordsBetweenCharacters:text:inRange:usingBlock:", v51, v12, 0, [v12 length], v52);
  uint64_t v18 = [v16 length];
  if (v18)
  {
    uint64_t v49 = v18;
    unint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
    char v20 = [(BRLTBrailleStateManager *)self->_stateManager outputScriptString];
    char v21 = [v20 textFormattingRanges];

    uint64_t v22 = [v21 boldRanges];
    if (v22) {
      [v19 setObject:v22 forKey:kSCROBrailleDisplayBoldRangesAttribute[0]];
    }
    id v48 = v22;
    id v23 = [v21 underlineRanges];
    if (v23) {
      [v19 setObject:v23 forKey:kSCROBrailleDisplayUnderlineRangesAttribute[0]];
    }
    id v47 = v23;
    v24 = [v21 italicRanges];
    if (v24) {
      [v19 setObject:v24 forKey:kSCROBrailleDisplayItalicRangesAttribute[0]];
    }
    uint64_t v25 = [NSNumber numberWithInt:self->_displayMode];
    [v19 setObject:v25 forKey:kSCROBrailleDisplayModeAttribute[0]];

    unint64_t v26 = [NSNumber numberWithInteger:self->_insetSize];
    [v19 setObject:v26 forKey:kSCROBrailleSizeAttribute[0]];

    v27 = [NSNumber numberWithInteger:self->_lineOffset];
    [v19 setObject:v27 forKey:kSCROBrailleOffsetAttribute[0]];

    if ((self->_iBeamLocation & 0x8000000000000000) == 0)
    {
      unint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v19 setObject:v28 forKey:kSCROBrailleIBeamLocationAttribute[0]];
    }
    int64_t statusSize = self->_statusSize;
    uint64_t v30 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length] + statusSize;
    if (v30 < 1)
    {
      uint64_t v38 = 0;
    }
    else
    {
      [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length];
      uint64_t v44 = (uint64_t)&v44;
      MEMORY[0x270FA5388]();
      long long v32 = (char *)&v44 - v31;
      int64_t v33 = self->_statusSize;
      long long v46 = v12;
      id v45 = v17;
      if (v33 <= 0)
      {
        int64_t v33 = 0;
      }
      else
      {
        statusFilter = self->_statusFilter;
        long long v35 = v32;
        int64_t v36 = v33;
        do
        {
          __int16 v37 = *statusFilter++;
          *(_WORD *)long long v35 = v37;
          v35 += 2;
          --v36;
        }
        while (v36);
      }
      int64_t v39 = 0;
      uint64_t v40 = &v32[2 * v33];
      while (v39 < [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length])
      {
        *(_WORD *)&v40[2 * v39] = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells][v39];
        ++v39;
      }
      uint64_t v38 = (void *)[[NSString alloc] initWithCharacters:v32 length:v30];
      [v19 setObject:v38 forKey:kSCROBrailleStatusAttribute[0]];
      uint64_t v41 = objc_msgSend(NSNumber, "numberWithInt:", -[SCROBrailleLineVirtualStatus alignment](self->_virtualStatus, "alignment"));
      [v19 setObject:v41 forKey:kSCROBrailleStatusAlignmentAttribute[0]];

      unint64_t v12 = v46;
      id v17 = v45;
    }
    objc_msgSend(v16, "addAttributes:range:", v19, 0, v49);
  }
  id v42 = v16;

  _Block_object_dispose(v60, 8);
  return v42;
}

void __36__SCROBrailleLine_newLineDescriptor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  char v14 = __36__SCROBrailleLine_newLineDescriptor__block_invoke_2;
  NSUInteger v15 = &unk_264414CA0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(void **)(a1 + 48);
  id v16 = v4;
  uint64_t v17 = v5;
  id v18 = v6;
  id v19 = v3;
  uint64_t v20 = *(void *)(a1 + 64);
  id v7 = v3;
  char v8 = (void *)MEMORY[0x21D4AD760](&v12);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "string", v12, v13, v14, v15);
  objc_msgSend(v10, "enumerateWordsBetweenCharacters:text:inRange:usingBlock:", v9, v11, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), objc_msgSend(*(id *)(a1 + 32), "length") - *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v8);
}

void __36__SCROBrailleLine_newLineDescriptor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  unint64_t v9 = a3 + a4;
  if (a3 + a4 > (unint64_t)[*(id *)(a1 + 32) length])
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"SCROBrailleLine.m" lineNumber:958 description:@"Error: newLineDescriptor range out of bounds"];
  }
  if (v9 > [*(id *)(a1 + 48) length])
  {
    char v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 40) file:@"SCROBrailleLine.m" lineNumber:959 description:@"Error: newLineDescriptor range out of bounds"];
  }
  id v10 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
  id v15 = [v10 attribute:@"padd" atIndex:0 effectiveRange:0];

  int v11 = [v15 BOOLValue];
  uint64_t v12 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROBrailleOriginalStringAttribute[0], @" ", a3, a4);
  }
  else
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROBrailleOriginalStringAttribute[0], *(void *)(a1 + 56), a3, a4);
    *a5 = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9;
}

- (id)newLineDescriptorWithoutPadding
{
  id v2 = [(SCROBrailleLine *)self newLineDescriptor];
  long long v5 = xmmword_21C6B9890;
  if (![v2 getRange:&v5 ofAttribute:kSCROEditableTextPaddingAttribute[0]]) {
    return v2;
  }
  do
  {
    id v3 = objc_msgSend(v2, "attributedSubstringFromRange:", 0, (void)v5);

    id v2 = v3;
  }
  while (([v3 getRange:&v5 ofAttribute:kSCROEditableTextPaddingAttribute[0]] & 1) != 0);
  return v3;
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  if (self->_showDotsSevenAndEight != a3)
  {
    self->_needsDisplayFlush = 1;
    self->_showDotsSevenAndEight = a3;
  }
}

- (BOOL)showDotsSevenAndEight
{
  return self->_showDotsSevenAndEight;
}

- (void)setLineFocus:(int)a3
{
  if (self->_lineFocus != a3)
  {
    self->_needsDisplayFlush = 1;
    self->_needsFocusFlush = 1;
    self->_lineFocus = a3;
  }
}

- (int)lineFocus
{
  return self->_lineFocus;
}

- (void)setDisplayMode:(int)a3
{
  if (self->_displayMode != a3)
  {
    self->_int displayMode = a3;
    self->_needsDisplayFlush = 1;
    self->_brailleChunksAreDirty = 1;
    self->_needsFocusFlush = 1;
    [(SCROBrailleLine *)self _updateOffsets];
  }
}

- (int)displayMode
{
  return self->_displayMode;
}

- (int64_t)_indexOfWhitespaceBeforeIBeam:(int64_t)a3 inLine:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 length];
  if (v6 >= a3) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = v6;
  }
  int64_t v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", _WhitespaceSet, 4, 0, v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v8;
  }
}

- (int64_t)_indexOfWhitespaceAfterIBeam:(int64_t)a3 inLine:(id)a4
{
  id v5 = a4;
  int64_t v6 = [v5 length];
  if ([v5 length] > (unint64_t)a3 && v6 != a3)
  {
    uint64_t v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", _WhitespaceSet, 0, a3, v6 - a3);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v6 = v7;
    }
  }

  return v6;
}

- (_NSRange)textRangeForBrailleRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (SCROCustomBrailleEnabled())
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [MEMORY[0x263F2BA78] sharedModel];
      uint64_t v6 = [v7 scriptLocationForBrailleLocation:location];

      int64_t v8 = [MEMORY[0x263F2BA78] sharedModel];
LABEL_7:
      id v10 = v8;
      uint64_t v11 = [v8 scriptLocationForBrailleLocation:location + length];

      NSUInteger length = v11 - v6;
    }
  }
  else
  {
    if (!SCROJapaneseBrailleSelected())
    {
      uint64_t v6 = -[BRLTBrailleStateManager scriptRangeForBrailleRange:](self->_stateManager, "scriptRangeForBrailleRange:", location, length);
      NSUInteger length = v12;
      goto LABEL_9;
    }
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = [MEMORY[0x263F2BA98] manager];
      uint64_t v6 = [v9 scriptLocationForBrailleLocation:location];

      int64_t v8 = [MEMORY[0x263F2BA98] manager];
      goto LABEL_7;
    }
  }
LABEL_9:
  NSUInteger v13 = v6;
  NSUInteger v14 = length;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (void)blinker
{
  if (self->_needsDisplayFlush)
  {
    [(SCROBrailleLine *)self _flush];
    self->_needsDisplayFlush = 0;
    self->_needsFocusFlush = 0;
  }
  if ((self->_iBeamLocation & 0x8000000000000000) == 0)
  {
    BOOL v3 = !self->_blinkEnabled || self->_blink;
    [(SCROBrailleLine *)self _blink:v3];
    self->_blink ^= 1u;
  }
}

- (BOOL)_blink:(BOOL)a3
{
  if (!self->_displayEnabled) {
    return 1;
  }
  uint64_t v3 = 192;
  if (a3) {
    uint64_t v3 = 168;
  }
  return [(SCROBrailleLine *)self _setMainCells:*(Class *)((char *)&self->super.isa + v3) length:self->_size];
}

- (BOOL)_setMainCells:(const char *)a3 length:(int64_t)a4
{
  mainCellsBuffer = self->_mainCellsBuffer;
  if (!memcmp(mainCellsBuffer, a3, a4)) {
    return 1;
  }
  memcpy(mainCellsBuffer, a3, a4);
  brailleDriver = self->_brailleDriver;

  return [(SCROBrailleDriverProtocol *)brailleDriver setMainCells:a3 length:a4];
}

- (void)setDisplayEnabled:(BOOL)a3
{
  if (self->_displayEnabled != a3)
  {
    self->_displayEnabled = a3;
    if (a3)
    {
      *(_WORD *)&self->_needsDisplayFlush = 257;
      self->_brailleChunksAreDirty = 1;
    }
  }
}

- (BOOL)display
{
  if (self->_needsDisplayFlush)
  {
    [(SCROBrailleLine *)self _flush];
    self->_needsDisplayFlush = 0;
    *(_WORD *)&self->_needsFocusFlush = 256;
    BOOL v3 = !self->_displayEnabled
      || [(SCROBrailleLine *)self _setMainCells:self->_displayBuffer length:self->_size];
  }
  else
  {
    BOOL v3 = 0;
  }
  if (self->_needsStatusFlush)
  {
    [(SCROBrailleLine *)self _flushRealStatus];
    self->_needsStatusFlush = 0;
    if (self->_displayEnabled) {
      return v3 | [(SCROBrailleDriverProtocol *)self->_brailleDriver setStatusCells:self->_statusFilter length:self->_statusSize];
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)_flushRealStatus
{
  if (self->_statusSize >= 1)
  {
    int64_t v3 = 0;
    do
    {
      if (v3 == self->_masterStatusCellIndex)
      {
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xFE | self->_anyUnread;
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xFD | (2 * self->_currentUnread);
        if ([(SCROBrailleLine *)self canPanLeft]) {
          char v4 = 64;
        }
        else {
          char v4 = 0;
        }
        self->_statusFilter[v3] = self->_statusFilter[v3] & 0xBF | v4;
        if ([(SCROBrailleLine *)self canPanRight]) {
          char v5 = 0x80;
        }
        else {
          char v5 = 0;
        }
        self->_statusFilter[v3] = v5 & 0x80 | self->_statusFilter[v3] & 0x7F;
      }
      ++v3;
    }
    while (v3 < self->_statusSize);
  }
}

- (void)_flush
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  if (self->_size >= 1)
  {
    [(NSLock *)self->_flushLock lock];
    if (!self->_brailleChunksAreDirty) {
      goto LABEL_93;
    }
    p_lineBuffer = &self->_lineBuffer;
    -[NSMutableAttributedString deleteCharactersInRange:](self->_lineBuffer, "deleteCharactersInRange:", 0, [(NSMutableAttributedString *)self->_lineBuffer length]);
    self->_int64_t iBeamLocation = -1;
    if (SCROCustomBrailleEnabled())
    {
      char v4 = [MEMORY[0x263F2BA78] sharedModel];
      char v5 = [v4 displayedBraille];

      self->_focusRange.NSUInteger location = [v5 focus];
      self->_focusRange.NSUInteger length = v6;
      self->_selectionRange.NSUInteger location = [v5 selection];
      self->_selectionRange.NSUInteger length = v7;
      self->_suggestionRange.NSUInteger location = [v5 suggestion];
      self->_suggestionRange.NSUInteger length = v8;
    }
    else if (SCROJapaneseBrailleSelected())
    {
      unint64_t v9 = [MEMORY[0x263F2BA98] manager];
      id v10 = [v9 displayedBraille];
      self->_focusRange.NSUInteger location = [v10 NSFocus];
      self->_focusRange.NSUInteger length = v11;

      NSUInteger v12 = [MEMORY[0x263F2BA98] manager];
      NSUInteger v13 = [v12 displayedBraille];
      self->_selectionRange.NSUInteger location = [v13 NSSelection];
      self->_selectionRange.NSUInteger length = v14;

      id v15 = [MEMORY[0x263F2BA98] manager];
      id v16 = [v15 displayedBraille];
      self->_suggestionRange.NSUInteger location = [v16 NSSuggestion];
      self->_suggestionRange.NSUInteger length = v17;
    }
    else
    {
      stateManager = self->_stateManager;
      if (stateManager)
      {
        self->_focusRange.NSUInteger location = [(BRLTBrailleStateManager *)stateManager brailleFocus];
        self->_focusRange.NSUInteger length = v19;
        self->_selectionRange.NSUInteger location = [(BRLTBrailleStateManager *)self->_stateManager brailleSelection];
        self->_selectionRange.NSUInteger length = v20;
        self->_suggestionRange.NSUInteger location = [(BRLTBrailleStateManager *)self->_stateManager brailleSuggestion];
        self->_suggestionRange.NSUInteger length = v21;
      }
    }
    if (SCROCustomBrailleEnabled())
    {
      id v22 = objc_alloc(MEMORY[0x263F086A0]);
      id v23 = [MEMORY[0x263F2BA78] sharedModel];
      v24 = [v23 displayedBraille];
      uint64_t v25 = [v24 string];
      unint64_t v26 = v22;
      v27 = v25;
    }
    else
    {
      int v28 = SCROJapaneseBrailleSelected();
      id v29 = objc_alloc(MEMORY[0x263F086A0]);
      if (!v28)
      {
        id v23 = [(BRLTBrailleStateManager *)self->_stateManager brailleDisplayString];
        uint64_t v32 = [v23 unicode];
        v24 = (void *)v32;
        if (v32) {
          int64_t v33 = (__CFString *)v32;
        }
        else {
          int64_t v33 = &stru_26CCE0B50;
        }
        uint64_t v31 = (void *)[v29 initWithString:v33];
LABEL_21:

        NSUInteger location = self->_suggestionRange.location;
        if (location == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v35 = v31;
        }
        else
        {
          unint64_t v36 = self->_suggestionRange.length + location;
          long long v35 = v31;
          if (v36 <= [v31 length])
          {
            uint64_t v37 = [(SCROBrailleLine *)self _applySuggestionCellsToPrintBraille:v31];

            long long v35 = (void *)v37;
          }
        }
        uint64_t v38 = [(NSMutableAttributedString *)*p_lineBuffer length];
        if (SCROCustomBrailleEnabled())
        {
          int64_t v39 = [MEMORY[0x263F2BA78] sharedModel];
          int v40 = [v39 editable];
        }
        else
        {
          if (!SCROJapaneseBrailleSelected())
          {
            int v155 = [(BRLTBrailleStateManager *)self->_stateManager editable];
LABEL_31:
            NSUInteger v41 = self->_selectionRange.location;
            if (v41 != 0x7FFFFFFFFFFFFFFFLL && !self->_selectionRange.length) {
              self->_int64_t iBeamLocation = v41 + v38;
            }
            uint64_t v42 = [v35 length];
            v156 = v35;
            if ([(SCROBrailleLine *)self wordWrapEnabled])
            {
              v153 = &self->_lineBuffer;
              v43 = v35;
              int64_t insetSize = self->_insetSize;
              uint64_t v45 = v38 / insetSize * insetSize;
              uint64_t v46 = [v43 length];
              unint64_t v47 = self->_insetSize;
              uint64_t v48 = 0;
              BOOL v49 = (uint64_t)((v46 + v38) / v47 * insetSize) > v45 && v42 > v47;
              if (v49)
              {
                uint64_t v158 = 0;
                p_focusRange = &self->_focusRange;
                p_NSUInteger length = &self->_focusRange.length;
                id v50 = v156;
                do
                {
                  id v51 = [v50 string];
                  id v52 = objc_msgSend(v51, "substringWithRange:", v48, v42);

                  uint64_t v53 = [v52 characterAtIndex:v47 - 1];
                  uint64_t v54 = [v52 characterAtIndex:v47];
                  LOBYTE(v53) = [(id)_WhitespaceSet characterIsMember:v53];
                  char v55 = [(id)_WhitespaceSet characterIsMember:v54];
                  unint64_t v56 = v47;
                  if ((v53 & 1) == 0)
                  {
                    unint64_t v56 = v47;
                    if ((v55 & 1) == 0)
                    {
                      uint64_t v57 = v47 - 2;
                      if ((uint64_t)v47 >= 2)
                      {
                        while ((objc_msgSend((id)_WhitespaceSet, "characterIsMember:", objc_msgSend(v52, "characterAtIndex:", v57)) & 1) == 0)
                        {
                          BOOL v49 = v57-- <= 0;
                          if (v49)
                          {
                            uint64_t v57 = -1;
                            break;
                          }
                        }
                      }
                      unint64_t v56 = v57 + 1;
                    }
                  }
                  if (v56) {
                    uint64_t v58 = v56;
                  }
                  else {
                    uint64_t v58 = v47;
                  }
                  uint64_t v159 = [v52 length];
                  if (v58 >= 1 && v50)
                  {
                    context = (void *)MEMORY[0x21D4AD500]();
                    SEL v59 = objc_msgSend(v50, "attributedSubstringFromRange:", v48, v58);
                    [(SCROBrailleLine *)self addAttributedStringToLineBuffer:v59 brailleOffset:v158];
                    v158 += v58;
                  }
                  uint64_t v60 = v47 - v58;
                  int v61 = (void *)MEMORY[0x21D4AD500]();
                  if (v60 >= 1)
                  {
                    if (v155)
                    {
                      uint64_t v62 = [(NSMutableAttributedString *)*v153 attributesAtIndex:[(NSMutableAttributedString *)*v153 length] - 1 effectiveRange:0];
                      uint64_t v63 = _createAttributedPaddingStringWithLength(v60, v62);
                    }
                    else
                    {
                      if ((unint64_t)v60 < 0x101)
                      {
                        v166.NSUInteger location = 0;
                        v166.NSUInteger length = v60;
                        CFStringRef v65 = CFStringCreateWithSubstring(0, (CFStringRef)_SpaceString, v166);
                      }
                      else
                      {
                        for (uint64_t i = 0; i != v60; ++i)
                          chars[i] = kSCROBrailleUnicodeCharacterBase;
                        CFStringRef v65 = CFStringCreateWithCharacters(0, chars, v60);
                      }
                      uint64_t v62 = (void *)v65;
                      uint64_t v63 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v65];
                    }
                    v66 = (void *)v63;

                    [(SCROBrailleLine *)self addAttributedPaddingToLineBuffer:v66];
                    NSUInteger v67 = v58 + v45;
                    int64_t iBeamLocation = self->_iBeamLocation;
                    if (v58 + v45 <= iBeamLocation) {
                      self->_int64_t iBeamLocation = iBeamLocation + v60;
                    }
                    if (self->_showDotsSevenAndEight)
                    {
                      NSUInteger v69 = p_focusRange->location;
                      if (p_focusRange->location != 0x7FFFFFFFFFFFFFFFLL)
                      {
                        if (*p_length)
                        {
                          v70 = &self->_focusRange;
                          if (v67 <= v69
                            || (NSUInteger v71 = *p_length + v69,
                                NSUInteger v69 = *p_length,
                                v70 = (_NSRange *)&self->_focusRange.length,
                                v67 < v71))
                          {
                            v70->NSUInteger location = v69 + v60;
                          }
                        }
                      }
                    }
                    NSUInteger v72 = self->_selectionRange.location;
                    if (v72 != 0x7FFFFFFFFFFFFFFFLL && v67 <= v72) {
                      self->_selectionRange.NSUInteger location = v72 + v60;
                    }

                    id v50 = v156;
                  }
                  v48 += v58;
                  uint64_t v42 = v159 - v58;
                  unint64_t v47 = self->_insetSize;
                  v45 += v47;
                }
                while (v159 - v58 > v47);
              }
              else
              {
                uint64_t v158 = 0;
                id v50 = v156;
              }
              v73 = (void *)MEMORY[0x21D4AD500]();
              v74 = objc_msgSend(v50, "attributedSubstringFromRange:", v48, v42);
              [(SCROBrailleLine *)self addAttributedStringToLineBuffer:v74 brailleOffset:v158];

              int64_t v75 = self->_insetSize;
              if (v42 >= v75) {
                uint64_t v76 = 0;
              }
              else {
                uint64_t v76 = v42;
              }
              int v77 = v155;
              if (v76 <= 0) {
                int v77 = 0;
              }
              p_lineBuffer = &self->_lineBuffer;
              if (v77 == 1)
              {
                unint64_t v78 = v75 - v76;
                v79 = [(NSMutableAttributedString *)*v153 attributesAtIndex:[(NSMutableAttributedString *)*v153 length] - 1 effectiveRange:0];
                v80 = _createAttributedPaddingStringWithLength(v78, v79);
                [(NSMutableAttributedString *)*v153 appendAttributedString:v80];
              }
            }
            else
            {
              [(NSMutableAttributedString *)*p_lineBuffer appendAttributedString:v35];
            }
            v81 = self->_lineBuffer;
            v82 = v81;
            if (self->_selectionRange.location != 0x7FFFFFFFFFFFFFFFLL && self->_selectionRange.length)
            {
              v83 = [(NSMutableAttributedString *)v81 string];
              v84 = _applyDots7And8FocusFilterToPrintBraille(v83, self->_selectionRange.location, self->_selectionRange.length);

              v85 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v84];
              uint64_t v86 = [(NSMutableAttributedString *)v82 length];
              v162[0] = MEMORY[0x263EF8330];
              v162[1] = 3221225472;
              v162[2] = __25__SCROBrailleLine__flush__block_invoke;
              v162[3] = &unk_264414CF0;
              id v87 = v85;
              id v163 = v87;
              -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](v82, "enumerateAttributesInRange:options:usingBlock:", 0, v86, 0, v162);
              v88 = (NSMutableAttributedString *)v87;

              v82 = v88;
            }
            if (self->_showDotsSevenAndEight
              && self->_focusRange.location != 0x7FFFFFFFFFFFFFFFLL
              && self->_focusRange.length)
            {
              v89 = [(NSMutableAttributedString *)v82 string];
              v90 = _applyDots7And8FocusFilterToPrintBraille(v89, self->_focusRange.location, self->_focusRange.length);

              v91 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v90];
              uint64_t v92 = [(NSMutableAttributedString *)v82 length];
              v160[0] = MEMORY[0x263EF8330];
              v160[1] = 3221225472;
              v160[2] = __25__SCROBrailleLine__flush__block_invoke_2;
              v160[3] = &unk_264414CF0;
              id v93 = v91;
              id v161 = v93;
              -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](v82, "enumerateAttributesInRange:options:usingBlock:", 0, v92, 0, v160);
              v94 = (NSMutableAttributedString *)v93;

              v82 = v94;
            }
            objc_storeStrong((id *)p_lineBuffer, v82);
            self->_brailleChunksAreDirty = 0;

LABEL_93:
            if (self->_isPanning) {
              goto LABEL_94;
            }
            int lineFocus = self->_lineFocus;
            switch(lineFocus)
            {
              case 3:
                if (!self->_needsFocusFlush) {
                  goto LABEL_94;
                }
                if (!self->_isUIString
                  || ![(NSString *)self->_currentUIString isEqualToString:self->_previousUIString])
                {
                  goto LABEL_137;
                }
                self->_uint64_t lineOffset = self->_previousUILineOffset;
                uint64_t v112 = [(NSMutableAttributedString *)self->_lineBuffer length];
                if (self->_lineOffset - v112 + self->_insetSize < 1) {
                  goto LABEL_94;
                }
                int64_t v113 = (v112 - self->_insetSize) & ~((v112 - self->_insetSize) >> 63);
                break;
              case 2:
                if (!self->_needsFocusFlush) {
                  goto LABEL_94;
                }
                unint64_t v114 = [(NSMutableAttributedString *)self->_lineBuffer length];
                unint64_t v115 = self->_insetSize;
                BOOL v49 = v114 > v115;
                int64_t v113 = v114 / v115 * v115;
                if (!v49) {
                  int64_t v113 = 0;
                }
                break;
              case 1:
                if (!self->_needsFocusFlush) {
                  goto LABEL_94;
                }
LABEL_137:
                self->_uint64_t lineOffset = 0;
                goto LABEL_94;
              default:
                int64_t v116 = self->_iBeamLocation;
                if (v116 < 0)
                {
                  if (!self->_selectionRange.length
                    || (NSUInteger v151 = self->_selectionRange.location, v151 == 0x7FFFFFFFFFFFFFFFLL))
                  {
                    NSUInteger v151 = self->_focusRange.location;
                    if (v151 == 0x7FFFFFFFFFFFFFFFLL)
                    {
LABEL_94:
                      self->_isPanning = 0;
                      uint64_t lineOffset = self->_lineOffset;
                      int64_t v96 = self->_insetSize;
                      if (lineOffset % v96)
                      {
                        lineOffset -= lineOffset % v96;
                        self->_uint64_t lineOffset = lineOffset;
                      }
                      unint64_t v97 = [(NSMutableAttributedString *)self->_lineBuffer length];
                      [(BRLTBrailleStateManager *)self->_stateManager editable];
                      if (SCROCustomBrailleEnabled())
                      {
                        v98 = [MEMORY[0x263F2BA78] sharedModel];
                        [v98 editable];
                      }
                      else
                      {
                        if (!SCROJapaneseBrailleSelected()) {
                          goto LABEL_101;
                        }
                        v98 = [MEMORY[0x263F2BA98] manager];
                        [v98 isEditing];
                      }

LABEL_101:
                      if (lineOffset)
                      {
                        do
                        {
                          if (lineOffset == 0x7FFFFFFFFFFFFFFFLL) {
                            break;
                          }
                          if (v97 > lineOffset) {
                            break;
                          }
                          int64_t v99 = self->_insetSize;
                          int64_t v100 = self->_lineOffset;
                          BOOL v49 = v100 < v99;
                          int64_t v101 = v100 - v99;
                          if (v49) {
                            break;
                          }
                          self->_uint64_t lineOffset = v101;
                          uint64_t lineOffset = v101;
                          int64_t v96 = v99;
                        }
                        while (v101);
                      }
                      if (v96 + lineOffset <= v97) {
                        size_t v102 = v96;
                      }
                      else {
                        size_t v102 = v97 - lineOffset;
                      }
                      bzero(self->_displayFilter, self->_size);
                      int displayMode = self->_displayMode;
                      BOOL v104 = displayMode == 5 || displayMode == 0;
                      if (v104 && [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length] < 1
                        || ![(SCROBrailleLine *)self _allowInset])
                      {
LABEL_158:
                        memcpy(self->_displayBuffer, self->_displayFilter, self->_size);
                        v133 = [(NSMutableAttributedString *)self->_lineBuffer string];
                        if (v133)
                        {
                          v167.NSUInteger location = lineOffset;
                          v167.NSUInteger length = v102;
                          v134 = (id)CFStringCreateWithSubstring(0, v133, v167);
                        }
                        else
                        {
                          v134 = 0;
                        }
                        TranslatePrintBrailleToBrailleCode = (void *)SCROBrailleCreateTranslatePrintBrailleToBrailleCode(v134);
                        v136 = &self->_displayBuffer[self->_leftInset];
                        id v137 = TranslatePrintBrailleToBrailleCode;
                        memcpy(v136, (const void *)[v137 bytes], v102);
                        memcpy(self->_blinkerBuffer, self->_displayBuffer, self->_size);
                        int64_t v138 = self->_iBeamLocation;
                        if (v138 >= 0) {
                          uint64_t v139 = lineOffset;
                        }
                        else {
                          uint64_t v139 = 0;
                        }
                        int64_t v140 = v138 - v139;
                        if (!v140 && !self->_leftInset)
                        {
                          *self->_displayBuffer |= 0x40u;
                          blinkerBuffer = self->_blinkerBuffer;
LABEL_180:
                          char v149 = -65;
                          goto LABEL_181;
                        }
                        int64_t v141 = self->_insetSize;
                        if (v140 == v141 && !self->_rightInset)
                        {
                          v148 = &self->_displayBuffer[self->_size];
                          *(v148 - 1) |= 0x80u;
                          v146 = &self->_blinkerBuffer[self->_size];
                          goto LABEL_175;
                        }
                        if (v140 < 0 || v140 >= v141) {
                          goto LABEL_182;
                        }
                        displayBuffer = self->_displayBuffer;
                        int64_t v143 = self->_leftInset + v140;
                        int64_t v144 = v143 - 1;
                        int v145 = displayBuffer[v143 - 1];
                        if (v145 < 0)
                        {
                          if ((displayBuffer[v143] & 0x40) == 0)
                          {
                            displayBuffer[v143] |= 0x40u;
LABEL_179:
                            blinkerBuffer = &self->_blinkerBuffer[self->_leftInset + v140];
                            goto LABEL_180;
                          }
                        }
                        else if ((displayBuffer[v143] & 0x40) != 0)
                        {
                          displayBuffer[v144] = v145 | 0x80;
                          v146 = &self->_blinkerBuffer[self->_leftInset + v140];
LABEL_175:
                          blinkerBuffer = v146 - 1;
                          char v149 = 127;
LABEL_181:
                          *blinkerBuffer &= v149;
LABEL_182:
                          [(NSLock *)self->_flushLock unlock];

                          return;
                        }
                        displayBuffer[v144] = v145 | 0x80;
                        self->_displayBuffer[self->_leftInset + v140] |= 0x40u;
                        v150 = &self->_blinkerBuffer[self->_leftInset + v140];
                        *(v150 - 1) &= ~0x80u;
                        goto LABEL_179;
                      }
                      if ([(SCROBrailleLineVirtualStatus *)self->_virtualStatus alignment])
                      {
                        int64_t v105 = 0;
                        int64_t v106 = self->_size - self->_rightInset;
                        int64_t v107 = v106 + 1;
                        if (!displayMode)
                        {
LABEL_146:
                          int64_t masterStatusCellIndex = self->_masterStatusCellIndex;
                          int64_t statusSize = self->_statusSize;
                          if (masterStatusCellIndex >= statusSize
                            && masterStatusCellIndex < [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length]+ statusSize)
                          {
                            int64_t v121 = self->_masterStatusCellIndex - self->_statusSize;
                            BOOL anyUnread = self->_anyUnread;
                            v123 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells];
                            v123[v121] = v123[v121] & 0xFE | anyUnread;
                            BOOL currentUnread = self->_currentUnread;
                            v125 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells];
                            v125[v121] = v125[v121] & 0xFD | (2 * currentUnread);
                            BOOL v126 = [(SCROBrailleLine *)self canPanLeft];
                            v127 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells];
                            if (v126) {
                              char v128 = 64;
                            }
                            else {
                              char v128 = 0;
                            }
                            v127[v121] = v127[v121] & 0xBF | v128;
                            BOOL v129 = [(SCROBrailleLine *)self canPanRight];
                            v130 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells];
                            if (v129) {
                              char v131 = 0x80;
                            }
                            else {
                              char v131 = 0;
                            }
                            v130[v121] = v131 & 0x80 | v130[v121] & 0x7F;
                          }
                          if ([(SCROBrailleLineVirtualStatus *)self->_virtualStatus length] >= 1)
                          {
                            int64_t v132 = 0;
                            do
                            {
                              self->_displayFilter[v107 + v132] = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus cells][v132];
                              ++v132;
                            }
                            while (v132 < [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length]);
                          }
                          goto LABEL_158;
                        }
                      }
                      else
                      {
                        int64_t v105 = [(SCROBrailleLineVirtualStatus *)self->_virtualStatus length];
                        int64_t v107 = 0;
                        int64_t v106 = self->_size - 1;
                        if (!displayMode) {
                          goto LABEL_146;
                        }
                      }
                      if (displayMode != 5)
                      {
                        if (self->_displayMode == 4)
                        {
                          if ([(SCROBrailleLine *)self canPanLeft]) {
                            char v109 = 127;
                          }
                          else {
                            char v109 = 63;
                          }
                          BOOL v110 = [(SCROBrailleLine *)self canPanRight];
                          char v111 = v109 | 0x80;
                          if (!v110) {
                            char v111 = v109;
                          }
                        }
                        else
                        {
                          char v111 = -1;
                        }
                        self->_displayFilter[v105] = v111;
                        self->_displayFilter[v106] = v111;
                      }
                      goto LABEL_146;
                    }
                  }
                  int64_t v117 = self->_insetSize;
                  NSUInteger v118 = v151 / v117;
                }
                else
                {
                  int64_t v117 = self->_insetSize;
                  NSUInteger v118 = v116 / v117;
                }
                int64_t v113 = v118 * v117;
                break;
            }
            self->_uint64_t lineOffset = v113;
            goto LABEL_94;
          }
          int64_t v39 = [MEMORY[0x263F2BA98] manager];
          int v40 = [v39 isEditing];
        }
        int v155 = v40;

        goto LABEL_31;
      }
      id v23 = [MEMORY[0x263F2BA98] manager];
      v24 = [v23 displayedBraille];
      uint64_t v30 = [v24 stageSignalledString];
      uint64_t v25 = (__CFString *)v30;
      if (v30) {
        v27 = (__CFString *)v30;
      }
      else {
        v27 = &stru_26CCE0B50;
      }
      unint64_t v26 = v29;
    }
    uint64_t v31 = (void *)[v26 initWithString:v27];

    goto LABEL_21;
  }
}

uint64_t __25__SCROBrailleLine__flush__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

uint64_t __25__SCROBrailleLine__flush__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

- (id)_applySuggestionCellsToPrintBraille:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length]
    && (NSUInteger v5 = self->_suggestionRange.length + self->_suggestionRange.location, v5 <= [v4 length]))
  {
    if (self->_showDotsSevenAndEight) {
      __int16 v7 = 255;
    }
    else {
      __int16 v7 = 63;
    }
    id v6 = (id)[v4 mutableCopy];
    __int16 v16 = kSCROBrailleUnicodeCharacterBase + v7;
    NSUInteger v8 = (void *)[[NSString alloc] initWithCharacters:&v16 length:1];
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    NSUInteger v17 = @"sugg";
    v18[0] = MEMORY[0x263EFFA88];
    id v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    NSUInteger v11 = (void *)[v9 initWithString:v8 attributes:v10];

    [v6 insertAttributedString:v11 atIndex:self->_suggestionRange.location];
    [v6 insertAttributedString:v11 atIndex:self->_suggestionRange.location + self->_suggestionRange.length + 1];
    NSUInteger location = self->_focusRange.location;
    NSUInteger v13 = self->_suggestionRange.location;
    if (location > v13) {
      self->_focusRange.NSUInteger location = location + 2;
    }
    NSUInteger v14 = self->_selectionRange.location;
    if (v14 > v13) {
      self->_selectionRange.NSUInteger location = v14 + 2;
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)addAttributedStringToLineBuffer:(id)a3 brailleOffset:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 length]) {
    [(NSMutableAttributedString *)self->_lineBuffer appendAttributedString:v5];
  }
}

- (void)addAttributedPaddingToLineBuffer:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    [(NSMutableAttributedString *)self->_lineBuffer appendAttributedString:v4];
    uint64_t v5 = [(NSMutableAttributedString *)self->_lineBuffer length];
    uint64_t v6 = v5 - [v4 length];
    uint64_t v7 = [v4 length];
    id v9 = @"padd";
    v10[0] = MEMORY[0x263EFFA88];
    NSUInteger v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    -[NSMutableAttributedString addAttributes:range:](self->_lineBuffer, "addAttributes:range:", v8, v6, v7);
  }
}

- (unint64_t)bufferIndexForRouterIndex:(unint64_t)a3
{
  return self->_lineOffset + a3 - self->_leftInset;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleLine;
  int64_t v3 = [(SCROBrailleLine *)&v8 description];
  id v4 = (void *)MEMORY[0x263F089D8];
  uint64_t v5 = [(NSMutableAttributedString *)self->_lineBuffer string];
  uint64_t v6 = [v4 stringWithFormat:@"<%@ \"%@\"", v3, v5];

  return (NSString *)v6;
}

- (NSAttributedString)editingString
{
  if (SCROCustomBrailleEnabled())
  {
    id v3 = objc_alloc_init(MEMORY[0x263F086A0]);
  }
  else
  {
    int v4 = SCROJapaneseBrailleSelected();
    id v5 = objc_alloc(MEMORY[0x263F086A0]);
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x263F2BA98] manager];
      uint64_t v7 = [v6 displayedBraille];
      [v7 stageString];
    }
    else
    {
      uint64_t v6 = [(BRLTBrailleStateManager *)self->_stateManager brailleBuffer];
      uint64_t v7 = [v6 brailleString];
      [v7 unicode];
    uint64_t v8 = };
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    else {
      id v10 = &stru_26CCE0B50;
    }
    id v3 = (id)[v5 initWithString:v10];
  }

  return (NSAttributedString *)v3;
}

- (BOOL)hasEdits
{
  if (SCROCustomBrailleEnabled())
  {
    id v3 = [MEMORY[0x263F2BA78] sharedModel];
    LOBYTE(v4) = [v3 brailleStringDirty];
  }
  else
  {
    if (SCROJapaneseBrailleSelected())
    {
      id v3 = [MEMORY[0x263F2BA98] manager];
      id v5 = [v3 displayedBraille];
      int v4 = [v5 isStageEmpty] ^ 1;
    }
    else
    {
      id v3 = [(BRLTBrailleStateManager *)self->_stateManager brailleBuffer];
      id v5 = [v3 brailleString];
      LOBYTE(v4) = [v5 length] != 0;
    }
  }
  return v4;
}

- (BOOL)wantsEdits
{
  if (SCROCustomBrailleEnabled())
  {
    id v3 = [MEMORY[0x263F2BA78] sharedModel];
    char v4 = [v3 editable];

    return v4;
  }
  int v6 = SCROJapaneseBrailleSelected();
  BOOL v7 = [(SCROBrailleLine *)self isSingleLetterInputOn];
  if (v6)
  {
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x263F2BA98] manager];
      BOOL v9 = ([v8 isEditing] & 1) != 0 || self->_editableFieldInterruptedByAlert;

      return v9;
    }
  }
  else if (!v7)
  {
    return ([(BRLTBrailleStateManager *)self->_stateManager editable] & 1) != 0
        || self->_editableFieldInterruptedByAlert;
  }
  return 0;
}

- (void)translate
{
  if (SCROCustomBrailleEnabled())
  {
    id v4 = [MEMORY[0x263F2BA78] sharedModel];
    [v4 forceTranslate];
  }
  else if ((SCROJapaneseBrailleSelected() & 1) == 0)
  {
    stateManager = self->_stateManager;
    [(BRLTBrailleStateManager *)stateManager translate];
  }
}

- (void)discardEdits
{
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    while (1)
    {
      id v3 = [(BRLTBrailleStateManager *)self->_stateManager brailleBuffer];
      id v4 = [v3 brailleString];
      uint64_t v5 = [v4 length];

      if (!v5) {
        break;
      }
      int v6 = [(BRLTBrailleStateManager *)self->_stateManager brailleBuffer];
      [v6 deleteBrailleChar];
    }
  }
}

- (BOOL)deleteAtCursor
{
  return [(SCROBrailleLine *)self _deleteAtCursorSilently:0];
}

- (BOOL)_deleteAtCursorSilently:(BOOL)a3
{
  BOOL v3 = a3;
  if (SCROCustomBrailleEnabled())
  {
    uint64_t v5 = [MEMORY[0x263F2BA78] sharedModel];
    int v6 = v5;
    if (v3) {
      char v7 = [v5 handleDeleteSilently];
    }
    else {
      char v7 = [v5 handleDelete];
    }
    BOOL v11 = v7;

    return v11;
  }
  else if (SCROJapaneseBrailleSelected())
  {
    uint64_t v8 = [MEMORY[0x263F2BA98] manager];
    char v9 = [v8 delete];

    return v9;
  }
  else if (self->_editableFieldInterruptedByAlert)
  {
    NSUInteger v12 = objc_alloc_init(SCROPendingBrailleDelete);
    NSUInteger v13 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
    [v13 addObject:v12];

    return 1;
  }
  else
  {
    NSUInteger v14 = +[SCROBrailleTranslationManager sharedManager];
    int v15 = [v14 primaryTableSupportsRoundTripping];

    if (v15)
    {
      stateManager = self->_stateManager;
      if (v3)
      {
        return [(BRLTBrailleStateManager *)stateManager deleteBrailleCharSilently];
      }
      else
      {
        return [(BRLTBrailleStateManager *)stateManager deleteBrailleChar];
      }
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)forwardDeleteAtCursor
{
  return [(SCROBrailleLine *)self _forwardDeleteAtCursorSilently:0];
}

- (BOOL)_forwardDeleteAtCursorSilently:(BOOL)a3
{
  BOOL v3 = a3;
  if (SCROJapaneseBrailleSelected())
  {
    uint64_t v5 = [MEMORY[0x263F2BA98] manager];
    char v6 = [v5 forwardDelete];

    return v6;
  }
  if (self->_editableFieldInterruptedByAlert)
  {
    char v7 = objc_alloc_init(SCROPendingBrailleDelete);
    char v6 = 1;
    [(SCROPendingBrailleDelete *)v7 setIsForwardDelete:1];
    uint64_t v8 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
    [v8 addObject:v7];

    return v6;
  }
  char v9 = +[SCROBrailleTranslationManager sharedManager];
  if (![v9 primaryTableSupportsRoundTripping])
  {

    return 0;
  }
  NSUInteger length = self->_selectionRange.length;

  if (length) {
    return 0;
  }
  stateManager = self->_stateManager;
  if (v3)
  {
    return [(BRLTBrailleStateManager *)stateManager forwardDeleteBrailleCharSilently];
  }
  else
  {
    return [(BRLTBrailleStateManager *)stateManager forwardDeleteBrailleChar];
  }
}

- (BOOL)moveCursorLeft
{
  if (SCROCustomBrailleEnabled())
  {
    BOOL v3 = [MEMORY[0x263F2BA78] sharedModel];
    id v4 = [v3 displayedBraille];
    uint64_t v5 = [v4 selection];

    if (v5)
    {
      char v6 = [MEMORY[0x263F2BA78] sharedModel];
      objc_msgSend(v6, "handleBrailleSelection:", v5 - 1, 0);

LABEL_10:
      LOBYTE(v14) = 1;
      return v14;
    }
LABEL_7:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (SCROJapaneseBrailleSelected())
  {
    char v7 = [MEMORY[0x263F2BA98] manager];
    uint64_t v8 = [v7 displayedBraille];
    uint64_t v9 = [v8 NSSelection];

    if (v9)
    {
      id v10 = [MEMORY[0x263F2BA98] manager];
      BOOL v11 = [v10 displayedBraille];
      uint64_t v12 = [v11 NSSelection] - 1;

      NSUInteger v13 = [MEMORY[0x263F2BA98] manager];
      objc_msgSend(v13, "setBrailleSelection:", v12, 0);

      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v14 = [(BRLTBrailleStateManager *)self->_stateManager brailleSelection];
  if (v14)
  {
    -[BRLTBrailleStateManager setBrailleSelection:](self->_stateManager, "setBrailleSelection:", [(BRLTBrailleStateManager *)self->_stateManager brailleSelection] - 1, 0);
    goto LABEL_10;
  }
  return v14;
}

- (BOOL)moveCursorRight
{
  if (SCROCustomBrailleEnabled())
  {
    BOOL v3 = [MEMORY[0x263F2BA78] sharedModel];
    id v4 = [v3 displayedBraille];
    unint64_t v5 = [v4 selection];

    char v6 = [MEMORY[0x263F2BA78] sharedModel];
    char v7 = [v6 displayedBraille];
    uint64_t v8 = [v7 string];
    unint64_t v9 = [v8 length];

    if (v5 < v9)
    {
      id v10 = [MEMORY[0x263F2BA78] sharedModel];
      objc_msgSend(v10, "handleBrailleSelection:", v5 + 1, 0);

      return 1;
    }
  }
  else if (SCROJapaneseBrailleSelected())
  {
    BOOL v11 = [MEMORY[0x263F2BA98] manager];
    uint64_t v12 = [v11 displayedBraille];
    unint64_t v13 = [v12 NSSelection];
    uint64_t v14 = [MEMORY[0x263F2BA98] manager];
    int v15 = [v14 displayedBraille];
    __int16 v16 = [v15 string];
    unint64_t v17 = [v16 length];

    if (v13 < v17)
    {
      id v18 = [MEMORY[0x263F2BA98] manager];
      NSUInteger v19 = [v18 displayedBraille];
      uint64_t v20 = [v19 NSSelection] + 1;

      NSUInteger v21 = [MEMORY[0x263F2BA98] manager];
      objc_msgSend(v21, "setBrailleSelection:", v20, 0);

      return 1;
    }
  }
  else
  {
    unint64_t v22 = [(BRLTBrailleStateManager *)self->_stateManager brailleSelection];
    id v23 = [(BRLTBrailleStateManager *)self->_stateManager brailleDisplayString];
    unint64_t v24 = [v23 length];

    if (v22 < v24)
    {
      -[BRLTBrailleStateManager setBrailleSelection:](self->_stateManager, "setBrailleSelection:", [(BRLTBrailleStateManager *)self->_stateManager brailleSelection] + 1, 0);
      return 1;
    }
  }
  return 0;
}

- (BOOL)moveCursorToRouterIndex:(unint64_t)a3 forwardToScreenReader:(BOOL *)a4 updateRouterLocation:(int64_t *)a5
{
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0)
  {
    unint64_t v24 = +[SCROBrailleTranslationManager sharedManager];
    if (![v24 primaryTableSupportsRoundTripping]
      || ![(NSMutableAttributedString *)self->_lineBuffer length])
    {

      goto LABEL_23;
    }
    char v25 = [(BRLTBrailleStateManager *)self->_stateManager editable];

    if ((v25 & 1) == 0) {
      goto LABEL_23;
    }
    if (a4) {
      *a4 = 0;
    }
  }
  int64_t v9 = a3 - self->_leftInset + self->_lineOffset;
  if (v9 >= 0 && v9 < (unint64_t)[(NSMutableAttributedString *)self->_lineBuffer length])
  {
    lineBuffer = self->_lineBuffer;
    unint64_t v11 = [(NSMutableAttributedString *)lineBuffer length];
    if (v9 + 1 < v11) {
      unint64_t v12 = v9 + 1;
    }
    else {
      unint64_t v12 = v11;
    }
    unint64_t v13 = -[NSMutableAttributedString attributedSubstringFromRange:](lineBuffer, "attributedSubstringFromRange:", 0, v12);
    uint64_t v32 = 0;
    int64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v14 = [v13 length];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __86__SCROBrailleLine_moveCursorToRouterIndex_forwardToScreenReader_updateRouterLocation___block_invoke;
    v31[3] = &unk_2644147B8;
    v31[4] = &v32;
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", @"padd", 0, v14, 0, v31);
    unint64_t v15 = v9 - v33[3];
    if ((SCROCustomBrailleEnabled() & 1) == 0
      && (SCROJapaneseBrailleSelected() & 1) == 0
      && [(BRLTBrailleStateManager *)self->_stateManager brailleSelection] == v15
      && !v16)
    {
      unint64_t v17 = [(BRLTBrailleStateManager *)self->_stateManager brailleDisplayString];
      BOOL v18 = v15 <= [v17 length];

      v15 += v18;
    }
    int64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    if (SCROCustomBrailleEnabled())
    {
      NSUInteger v19 = [MEMORY[0x263F2BA78] sharedModel];
      char v20 = objc_msgSend(v19, "handleBrailleSelection:", v15, 0);

      if (a4) {
        *a4 = v20;
      }
      NSUInteger v21 = objc_msgSend(MEMORY[0x263F2BA78], "sharedModel", v30);
      unint64_t v22 = [v21 displayedScript];
      uint64_t v23 = [v22 selection];
    }
    else
    {
      if (!SCROJapaneseBrailleSelected())
      {
        -[BRLTBrailleStateManager setBrailleSelection:needsForwardToScreenReader:newScriptLocation:](self->_stateManager, "setBrailleSelection:needsForwardToScreenReader:newScriptLocation:", v15, 0, a4, &v30);
        goto LABEL_32;
      }
      v27 = [MEMORY[0x263F2BA98] manager];
      objc_msgSend(v27, "setBrailleSelection:", v15, 0);

      if (a4) {
        *a4 = 1;
      }
      NSUInteger v21 = objc_msgSend(MEMORY[0x263F2BA98], "manager", v30);
      unint64_t v22 = [v21 displayedScript];
      uint64_t v23 = [v22 NSSelection];
    }
    int64_t v30 = v23;

LABEL_32:
    if (!a4 || !*a4) {
      goto LABEL_43;
    }
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (SCROCustomBrailleEnabled())
      {
        int v28 = [MEMORY[0x263F2BA78] sharedModel];
        uint64_t v29 = [v28 scriptLocationForBrailleLocation:v15];
LABEL_39:
        int64_t v30 = v29;

        goto LABEL_41;
      }
      if (SCROJapaneseBrailleSelected())
      {
        int v28 = [MEMORY[0x263F2BA98] manager];
        uint64_t v29 = [v28 scriptLocationForBrailleLocation:v15];
        goto LABEL_39;
      }
      int64_t v30 = [(BRLTBrailleStateManager *)self->_stateManager scriptLocationForBrailleLocation:v15];
    }
LABEL_41:
    if (*a5 != v30) {
      *a5 = v30;
    }
LABEL_43:
    self->_brailleChunksAreDirty = 1;
    [(SCROBrailleLine *)self _flush];
    _Block_object_dispose(&v32, 8);

    return 1;
  }
LABEL_23:
  BOOL result = 0;
  if (a4) {
    *a4 = 1;
  }
  return result;
}

uint64_t __86__SCROBrailleLine_moveCursorToRouterIndex_forwardToScreenReader_updateRouterLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 integerValue];
  if (result == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a4;
  }
  return result;
}

- (BOOL)insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SCROBrailleFormatter *)self->_brailleFormatter hasPlaceholderText]) {
    [(SCROBrailleFormatter *)self->_brailleFormatter clearPlaceholderForEditing];
  }
  BOOL v8 = [(SCROBrailleLine *)self _insertBrailleStringAtCursor:v6 modifiers:v7 silently:0];

  return v8;
}

- (BOOL)_insertBrailleStringAtCursor:(id)a3 modifiers:(id)a4 silently:(BOOL)a5
{
  BOOL v27 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ((SCROCustomBrailleEnabled() & 1) != 0
    || (SCROJapaneseBrailleSelected() & 1) != 0
    || !self->_editableFieldInterruptedByAlert)
  {
    id v26 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v25 = (void *)[objc_alloc(MEMORY[0x263F2BA88]) initWithUnicode:v7];
    unint64_t v12 = [v25 brailleChars];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    uint64_t v16 = *MEMORY[0x263F2BB08];
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (SCROCustomBrailleEnabled())
        {
          NSUInteger v19 = [NSNumber numberWithUnsignedInt:v16];
          int v20 = [v8 containsObject:v19];

          if (v20)
          {
            if (self->_inputMode == 2)
            {
              [v18 setDot7:1];
            }
            else
            {
              unint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F2BA70]) initWithUnicode:@"⠠"];
              uint64_t v23 = [MEMORY[0x263F2BA78] sharedModel];
              [v23 handleBrailleDotPress:v22];
            }
          }
          NSUInteger v21 = [MEMORY[0x263F2BA78] sharedModel];
          [v21 handleBrailleDotPress:v18];
        }
        else
        {
          if (!SCROJapaneseBrailleSelected())
          {
            [(BRLTBrailleStateManager *)self->_stateManager insertBrailleChar:v18 modifiers:v8 silently:v27];
            continue;
          }
          NSUInteger v21 = [MEMORY[0x263F2BA98] manager];
          [v21 insertBrailleChar:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v14)
      {
LABEL_22:

        BOOL v11 = 1;
        id v7 = v26;
        goto LABEL_23;
      }
    }
  }
  int64_t v9 = [[SCROPendingBrailleModifierPair alloc] initWithPendingBraille:v7 modifiers:v8];
  id v10 = [(SCROBrailleLine *)self pendingBrailleStringDictionaries];
  [v10 addObject:v9];

  BOOL v11 = 0;
LABEL_23:

  return v11;
}

- (id)translatedBrailleForTableIdentifier:(id)a3
{
  if (SCROCustomBrailleEnabled())
  {
    id v4 = [MEMORY[0x263F2BA78] sharedModel];
    unint64_t v5 = [v4 displayedBraille];
    id v6 = [v5 string];

    id v7 = +[SCROBrailleTranslationManager sharedManager];
    id v8 = [v7 textForPrintBraille:v6 language:0 mode:3 locations:0];
  }
  else
  {
    int v9 = SCROJapaneseBrailleSelected();
    id v6 = +[SCROBrailleTranslationManager sharedManager];
    if (v9)
    {
      id v7 = [MEMORY[0x263F2BA98] manager];
      id v10 = [v7 displayedBraille];
      BOOL v11 = [v10 string];
      id v8 = [v6 textForPrintBraille:v11 language:0 mode:3 locations:0];
    }
    else
    {
      id v7 = [(BRLTBrailleStateManager *)self->_stateManager brailleDisplayString];
      id v10 = [v7 unicode];
      id v8 = [v6 textForPrintBraille:v10 language:0 mode:3 locations:0];
    }
  }

  return v8;
}

- (id)printBrailleForText:(id)a3 language:(id)a4 mode:(unint64_t)a5 textPositionsRange:(_NSRange)a6 locations:(id *)a7 textFormattingRanges:(id)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = +[SCROBrailleTranslationManager sharedManager];
  BOOL v18 = objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v16, v15, a5, location, length, a7, v14);

  return v18;
}

- (id)textForPrintBraille:(id)a3 language:(id)a4 mode:(unint64_t)a5 locations:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = +[SCROBrailleTranslationManager sharedManager];
  unint64_t v12 = [v11 textForPrintBraille:v10 language:v9 mode:a5 locations:a6];

  return v12;
}

- (void)brailleDisplayStringDidChange:(id)a3 brailleSelection:(_NSRange)a4 modifiers:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  self->_brailleChunksAreDirty = 1;
  self->_needsDisplayFlush = 1;
  id v9 = a5;
  id v10 = a3;
  [(SCROBrailleLine *)self display];
  id v11 = [(SCROBrailleLine *)self translationDelegate];
  objc_msgSend(v11, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v10, location, length, v9);
}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = [(SCROBrailleLine *)self translationDelegate];
  objc_msgSend(v10, "replaceScriptStringRange:withScriptString:cursorLocation:", location, length, v9, a5);
}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(SCROBrailleLine *)self translationDelegate];
  objc_msgSend(v5, "scriptSelectionDidChange:", location, length);
}

- (void)didInsertScriptString:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleLine *)self translationDelegate];
  [v5 didInsertScriptString:v4];
}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SCROBrailleLine *)self translationDelegate];
  [v8 brailleDisplayInsertedCharacter:v7 modifiers:v6];
}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleLine *)self translationDelegate];
  [v5 brailleDisplayDeletedCharacter:v4];
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SCROBrailleLine *)self translationDelegate];
  [v4 handlePlanarPanFailedIsLeft:v3];
}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = (objc_class *)MEMORY[0x263F2BA88];
  id v8 = a3;
  id v9 = (id)[[v7 alloc] initWithUnicode:v8];

  -[SCROBrailleLine brailleDisplayStringDidChange:brailleSelection:modifiers:](self, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v9, location, length, 0);
}

- (BOOL)needsDisplayFlush
{
  return self->_needsDisplayFlush;
}

- (BOOL)displayEnabled
{
  return self->_displayEnabled;
}

- (int64_t)lineOffset
{
  return self->_lineOffset;
}

- (void)setLineOffset:(int64_t)a3
{
  self->_uint64_t lineOffset = a3;
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_wordWrapEnabled = a3;
}

- (BOOL)blinkEnabled
{
  return self->_blinkEnabled;
}

- (void)setBlinkEnabled:(BOOL)a3
{
  self->_blinkEnabled = a3;
}

- (BOOL)isSingleLetterInputOn
{
  return self->_isSingleLetterInputOn;
}

- (void)setIsSingleLetterInputOn:(BOOL)a3
{
  self->_isSingleLetterInputOn = a3;
}

- (BOOL)isTextSearchModeOn
{
  return self->_isTextSearchModeOn;
}

- (void)setIsTextSearchModeOn:(BOOL)a3
{
  self->_isTextSearchModeOn = a3;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_generationID = a3;
}

- (BRLTBrailleStateManagerDelegate)translationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);

  return (BRLTBrailleStateManagerDelegate *)WeakRetained;
}

- (void)setTranslationDelegate:(id)a3
{
}

- (NSMutableArray)pendingBrailleStringDictionaries
{
  return self->_pendingBrailleStringDictionaries;
}

- (void)setPendingBrailleStringDictionaries:(id)a3
{
}

- (BOOL)editableFieldInterruptedByAlert
{
  return self->_editableFieldInterruptedByAlert;
}

- (void)setEditableFieldInterruptedByAlert:(BOOL)a3
{
  self->_BOOL editableFieldInterruptedByAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBrailleStringDictionaries, 0);
  objc_destroyWeak((id *)&self->_translationDelegate);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_flushLock, 0);
  objc_storeStrong((id *)&self->_braillePlane, 0);
  objc_storeStrong((id *)&self->_brailleFormatter, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_virtualStatus, 0);
  objc_storeStrong((id *)&self->_previousUIString, 0);
  objc_storeStrong((id *)&self->_currentUIString, 0);
  objc_storeStrong(&self->_appToken, 0);
  objc_storeStrong((id *)&self->_lineBuffer, 0);
  objc_storeStrong((id *)&self->_statusData, 0);

  objc_storeStrong((id *)&self->_brailleDriver, 0);
}

- (BRLTBrailleStateManager)stateManager
{
  return self->_stateManager;
}

@end