@interface ICTTTextStorage
+ (double)listItemGlyphPointSizeForUnorderedListStyle:(unsigned int)a3 zoomFactor:(double)a4;
+ (id)bulletTextAttributesWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5;
+ (id)filteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6 fixAttachments:(BOOL)a7 insertListMarkers:(BOOL)a8;
+ (id)removeDataDetectorLinksForAttributedString:(id)a3;
+ (id)removeTextAttachmentsForAttributedString:(id)a3 translateICTTFont:(BOOL)a4;
+ (id)standardizedAttributedStringFromAttributedString:(id)a3 withStyler:(id)a4 fixAttachments:(BOOL)a5 translateICTTFont:(BOOL)a6 context:(id)a7;
+ (void)fixAttachmentsForRenderingInAttributedString:(id)a3 forPlainText:(BOOL)a4 forStandardizedText:(BOOL)a5;
- (BOOL)_shouldSetOriginalFontAttribute;
- (BOOL)alwaysEnumerateTrailingParagraph;
- (BOOL)convertAttributes;
- (BOOL)delayedFixupAfterEditingWantsUndoCommand;
- (BOOL)directlyEditing;
- (BOOL)disableUndoCoalesceBreaking;
- (BOOL)filterPastedAttributes;
- (BOOL)filterSubstringAttributes;
- (BOOL)filterSubstringAttributesForPlainText;
- (BOOL)hasAnyTextViewWithDarkAppearance;
- (BOOL)hasEditedCharactersAfterTextSelection;
- (BOOL)hasNamedStyle:(unsigned int)a3 inRange:(_NSRange)a4;
- (BOOL)hasUserEditSinceFixupAfterEditing;
- (BOOL)isApplyingUndoCommand;
- (BOOL)isDeletingContentAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4;
- (BOOL)isDeletingDictationAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4;
- (BOOL)isDragging;
- (BOOL)isDropping;
- (BOOL)isEditing;
- (BOOL)isEditingOrConvertingMarkedText:(BOOL)a3;
- (BOOL)isEditingTemporaryAttributes;
- (BOOL)isEditingViaWritingTools;
- (BOOL)isEndingEditing;
- (BOOL)isFixing;
- (BOOL)isForTextKit2;
- (BOOL)isHandlingTextCheckingResults;
- (BOOL)isMarkingTextForHeadingRename;
- (BOOL)isPausingUndoActions;
- (BOOL)isPerformingAccessibilityUndoableTextInsertion;
- (BOOL)isReadingSelectionFromPasteboard;
- (BOOL)isResettingBaseWritingDirection;
- (BOOL)isRightToLeftAtIndex:(int64_t)a3;
- (BOOL)isSelectingText;
- (BOOL)isSkippingTimestampUpdates;
- (BOOL)isTypingOrMarkingText;
- (BOOL)isUndoCoalescingForWritingTools;
- (BOOL)isZombie;
- (BOOL)mergeableStringIsEqualAfterSerialization:(id)a3;
- (BOOL)pendingFixupAfterEditing;
- (BOOL)previouslyHadMarkedText;
- (BOOL)retainOriginalFormatting;
- (BOOL)shouldBreakUndoCoalescingWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4;
- (BOOL)shouldConvertTablesToTabs;
- (BOOL)shouldInhibitAddingExtraNewlinesAtEndDuringFixup;
- (BOOL)shouldRemoveLeadingWhitespaceForChecklistDrop;
- (BOOL)textViewHasMarkedText:(id)a3;
- (BOOL)validateIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (BOOL)wantsTimestampUpdates;
- (BOOL)wantsUndoCommands;
- (ICOutlineController)outlineController;
- (ICTTMergeableAttributedString)mergeableString;
- (ICTTMergeableStringUndoGroup)coalescingUndoGroup;
- (ICTTMergeableStringVersionedDocument)document;
- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4;
- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4 sourceZoomController:(id)a5 keepSourceZoomController:(BOOL)a6 existingStyler:(id)a7;
- (ICTTTextStorage)initWithData:(id)a3 replicaID:(id)a4;
- (ICTTTextStorage)initWithDocument:(id)a3;
- (ICTTTextStorageStyler)styler;
- (ICTTTextUndoTarget)overrideUndoTarget;
- (ICTTTextUndoTarget)undoTarget;
- (NSArray)pasteboardTypes;
- (NSAttributedString)highlightsAttributedString;
- (NSDate)now;
- (NSMutableArray)deletedRanges;
- (NSMutableArray)undoCommands;
- (NSMutableAttributedString)attributedString;
- (NSMutableSet)textLayoutManagerReferences;
- (NSNumber)currentTimestamp;
- (NSSet)textLayoutManagers;
- (NSSet)textViews;
- (NSUUID)replicaID;
- (NSUUID)writingToolsSessionUUID;
- (NSUndoManager)undoManager;
- (_NSRange)beforeEndEditedRange;
- (_NSRange)lastUndoEditRange;
- (_NSRange)logicalRangeForLocation:(unint64_t)a3;
- (_NSRange)safeCharacterRangeForRange:(_NSRange)a3;
- (_NSRange)ttEditedRange;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributedSubstringFromRange:(_NSRange)a3;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)copyDataForUTI:(id)a3 range:(_NSRange)a4 persistenceHelper:(id)a5;
- (id)correctParagraphStyleReuseForRange:(_NSRange)a3 withNewAttributedString:(id)a4;
- (id)customPasteboardDataFromRange:(_NSRange)a3 persistenceHelper:(id)a4;
- (id)dataFromRange:(_NSRange)a3 documentAttributes:(id)a4 error:(id *)a5;
- (id)editAtIndex:(unint64_t)a3;
- (id)filteredAttributedStringForUTI:(id)a3 range:(_NSRange)a4;
- (id)filteredAttributedSubstringFromRange:(_NSRange)a3;
- (id)filteredAttributedSubstringFromRange:(_NSRange)a3 insertListMarkers:(BOOL)a4;
- (id)itemProviderForRange:(_NSRange)a3 andNote:(id)a4;
- (id)newCoalescingUndoGroup;
- (id)paragraphUUIDsInRange:(_NSRange)a3;
- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3;
- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 context:(id)a4;
- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 styler:(id)a4 context:(id)a5;
- (id)standardizedAttributedStringFixingTextAttachmentsInContext:(id)a3;
- (id)string;
- (int64_t)skipTimestampUpdatesCount;
- (int64_t)ttChangeInLength;
- (unint64_t)attributeOptions;
- (unint64_t)editingCount;
- (unint64_t)length;
- (unint64_t)mergeWithDocument:(id)a3;
- (unint64_t)ttEditedMask;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addTextLayoutManager:(id)a3;
- (void)addUndoCommand:(id)a3;
- (void)applyUndoGroup:(id)a3;
- (void)applyUndoWithBlock:(id)a3;
- (void)beginEditing;
- (void)beginSkippingTimestampUpdates;
- (void)beginTemporaryAttributeEditing;
- (void)beginTemporaryAttributes;
- (void)breakUndoCoalescing;
- (void)convertNSTablesToTabs:(id)a3;
- (void)coordinateAccess:(id)a3;
- (void)coordinateEditing:(id)a3;
- (void)coordinateReading:(id)a3;
- (void)dd_makeLinksForResultsInAttributesOfType:(unint64_t)a3 context:(id)a4 range:(_NSRange)a5;
- (void)dd_resetResults;
- (void)editWithAttributeOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)editedAttributeRange:(_NSRange)a3;
- (void)editedRange:(_NSRange)a3 changeInLength:(int64_t)a4;
- (void)endEditing;
- (void)endSkippingTimestampUpdates;
- (void)endTemporaryAttributeEditing;
- (void)endTemporaryAttributes;
- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)executeDelayedFixupAfterEditing;
- (void)fixupAfterEditing;
- (void)fixupAfterEditingDelayedToEndOfRunLoop;
- (void)forceFixupAfterEditingIfDelayed;
- (void)handleDidUndoRedoNotification:(id)a3;
- (void)preReplaceCharactersInRange:(_NSRange)a3 withStringLength:(unint64_t)a4;
- (void)redactAuthorAttributionsToCurrentUser;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)removeTextLayoutManager:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)replaceWithDocument:(id)a3;
- (void)resetHighlightsAttributedString;
- (void)resetTTEdits;
- (void)resetUndoManager;
- (void)restoreAttributedString:(id)a3;
- (void)restoreSelection:(id)a3;
- (void)saveSelectionDuringBlock:(id)a3;
- (void)saveSelectionDuringBlock:(id)a3 affinity:(unint64_t)a4;
- (void)setAlwaysEnumerateTrailingParagraph:(BOOL)a3;
- (void)setAttributeOptions:(unint64_t)a3;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setBeforeEndEditedRange:(_NSRange)a3;
- (void)setCoalescingUndoGroup:(id)a3;
- (void)setConvertAttributes:(BOOL)a3;
- (void)setCurrentTimestamp:(id)a3;
- (void)setDelayedFixupAfterEditingWantsUndoCommand:(BOOL)a3;
- (void)setDirectlyEditing:(BOOL)a3;
- (void)setDisableUndoCoalesceBreaking:(BOOL)a3;
- (void)setEditingCount:(unint64_t)a3;
- (void)setFilterPastedAttributes:(BOOL)a3;
- (void)setFilterSubstringAttributes:(BOOL)a3;
- (void)setFilterSubstringAttributesForPlainText:(BOOL)a3;
- (void)setHasEditedCharactersAfterTextSelection:(BOOL)a3;
- (void)setHasUserEditSinceFixupAfterEditing:(BOOL)a3;
- (void)setIsApplyingUndoCommand:(BOOL)a3;
- (void)setIsDragging:(BOOL)a3;
- (void)setIsDropping:(BOOL)a3;
- (void)setIsEditingTemporaryAttributes:(BOOL)a3;
- (void)setIsEditingViaWritingTools:(BOOL)a3;
- (void)setIsEndingEditing:(BOOL)a3;
- (void)setIsFixing:(BOOL)a3;
- (void)setIsHandlingTextCheckingResults:(BOOL)a3;
- (void)setIsMarkingTextForHeadingRename:(BOOL)a3;
- (void)setIsPausingUndoActions:(BOOL)a3;
- (void)setIsPerformingAccessibilityUndoableTextInsertion:(BOOL)a3;
- (void)setIsReadingSelectionFromPasteboard:(BOOL)a3;
- (void)setIsResettingBaseWritingDirection:(BOOL)a3;
- (void)setIsSelectingText:(BOOL)a3;
- (void)setIsTypingOrMarkingText:(BOOL)a3;
- (void)setIsUndoCoalescingForWritingTools:(BOOL)a3;
- (void)setIsZombie:(BOOL)a3;
- (void)setLastUndoEditRange:(_NSRange)a3;
- (void)setNow:(id)a3;
- (void)setOutlineController:(id)a3;
- (void)setOverrideUndoTarget:(id)a3;
- (void)setPasteboardTypes:(id)a3;
- (void)setPendingFixupAfterEditing:(BOOL)a3;
- (void)setPreviouslyHadMarkedText:(BOOL)a3;
- (void)setRetainOriginalFormatting:(BOOL)a3;
- (void)setShouldConvertTablesToTabs:(BOOL)a3;
- (void)setShouldInhibitAddingExtraNewlinesAtEndDuringFixup:(BOOL)a3;
- (void)setShouldRemoveLeadingWhitespaceForChecklistDrop:(BOOL)a3;
- (void)setSkipTimestampUpdatesCount:(int64_t)a3;
- (void)setStyler:(id)a3;
- (void)setTextLayoutManagerReferences:(id)a3;
- (void)setTimestamp:(id)a3 range:(_NSRange)a4;
- (void)setTtChangeInLength:(int64_t)a3;
- (void)setTtEditedMask:(unint64_t)a3;
- (void)setTtEditedRange:(_NSRange)a3;
- (void)setUndoCommands:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setWantsUndoCommands:(BOOL)a3;
- (void)setWritingToolsSessionUUID:(id)a3;
- (void)styleTextInRange:(_NSRange)a3;
- (void)suppressingShiftStateUpdatesIfNecessaryWithSelection:(void *)a3 perform:;
@end

@implementation ICTTTextStorage

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:"))
  {
    v12.receiver = self;
    v12.super_class = (Class)ICTTTextStorage;
    v10 = -[ICTTTextStorage attributesAtIndex:longestEffectiveRange:inRange:](&v12, sel_attributesAtIndex_longestEffectiveRange_inRange_, a3, a4, location, length);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if (addAttribute_value_range__onceToken != -1) {
    dispatch_once(&addAttribute_value_range__onceToken, &__block_literal_global_177);
  }
  if ([(ICTTTextStorage *)self isEditingTemporaryAttributes]
    || !objc_msgSend(MEMORY[0x1E4F28E48], "dd_isTransientAttribute:", v9))
  {
    int v11 = 0;
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [(ICTTTextStorage *)self beginTemporaryAttributes];
  int v11 = 1;
  if (v10)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage addAttribute:value:range:](&v12, sel_addAttribute_value_range_, v9, v10, location, length);
  }
LABEL_9:
  if (v11) {
    [(ICTTTextStorage *)self endTemporaryAttributes];
  }
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (length)
  {
    if (![(ICTTTextStorage *)self isResettingBaseWritingDirection]
      && ![(ICTTTextStorage *)self isTypingOrMarkingText]
      && ![(ICTTTextStorage *)self isSelectingText]
      && ![(ICTTTextStorage *)self isPausingUndoActions]
      && ![(ICTTTextStorage *)self isEditingTemporaryAttributes]
      && ![(ICTTTextStorage *)self isEndingEditing]
      && (location != [(ICTTTextStorage *)self lastUndoEditRange] || length != v8))
    {
      [(ICTTTextStorage *)self breakUndoCoalescing];
    }
    [(ICTTTextStorage *)self beginEditing];
    self->_directlyEditing = 1;
    if (![(ICTTTextStorage *)self isEditingTemporaryAttributes])
    {
      id v7 = v7;
      id v9 = v7;
      if ([(ICTTTextStorage *)self convertAttributes])
      {
        id v10 = [(ICTTTextStorage *)self styler];
        id v9 = [v10 modelForStyleAttributes:v7 filterAttributes:0];
      }
      int v11 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
      objc_super v12 = [v11 attributedString];
      uint64_t v13 = *MEMORY[0x1E4F83238];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __39__ICTTTextStorage_setAttributes_range___block_invoke;
      v28[3] = &unk_1E5FDB918;
      id v14 = v9;
      id v29 = v14;
      v30 = self;
      objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, location, length, 0, v28);

      if ([(ICTTTextStorage *)self convertAttributes])
      {
        v15 = [(ICTTTextStorage *)self styler];
        uint64_t v16 = [v15 styleForModelAttributes:v14];

        id v7 = (id)v16;
      }
    }
    if ([(ICTTTextStorage *)self wantsTimestampUpdates]) {
      [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:1];
    }
    -[NSMutableAttributedString setAttributes:range:](self->_attributedString, "setAttributes:range:", v7, location, length);
    objc_opt_class();
    v17 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    v18 = ICCheckedDynamicCast();

    objc_opt_class();
    v19 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];
    v20 = ICCheckedDynamicCast();

    highlightsAttributedString = self->_highlightsAttributedString;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__ICTTTextStorage_setAttributes_range___block_invoke_2;
    v24[3] = &unk_1E5FDB940;
    id v25 = v18;
    v26 = self;
    id v27 = v20;
    id v22 = v20;
    id v23 = v18;
    -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](highlightsAttributedString, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v24);
    -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
    [(ICTTTextStorage *)self endEditing];
    self->_directlyEditing = 0;
  }
}

- (BOOL)isEditingTemporaryAttributes
{
  return self->_temporaryAttributeEditing != 0;
}

- (void)beginEditing
{
  [(ICTTTextStorage *)self setEditingCount:[(ICTTTextStorage *)self editingCount] + 1];
  v4.receiver = self;
  v4.super_class = (Class)ICTTTextStorage;
  [(ICTTTextStorage *)&v4 beginEditing];
  v3 = [(ICTTTextStorage *)self mergeableString];
  [v3 beginEditing];
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (void)endEditing
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(ICTTTextStorage *)self mergeableString];
  [v3 endEditing];

  int64_t v4 = [(ICTTTextStorage *)self changeInLength];
  unint64_t v5 = [(ICTTTextStorage *)self editedRange];
  NSUInteger v7 = v6;
  uint64_t v8 = [(ICTTTextStorage *)self editedMask];
  -[ICTTTextStorage setBeforeEndEditedRange:](self, "setBeforeEndEditedRange:", v5, v7);
  if ([(ICTTTextStorage *)self isEndingEditing])
  {
    [(ICTTTextStorage *)self beginSkippingTimestampUpdates];
    v37.receiver = self;
    v37.super_class = (Class)ICTTTextStorage;
    [(ICTTTextStorage *)&v37 endEditing];
    [(ICTTTextStorage *)self endSkippingTimestampUpdates];
  }
  else
  {
    [(ICTTTextStorage *)self setIsEndingEditing:1];
    [(ICTTTextStorage *)self beginSkippingTimestampUpdates];
    v37.receiver = self;
    v37.super_class = (Class)ICTTTextStorage;
    [(ICTTTextStorage *)&v37 endEditing];
    [(ICTTTextStorage *)self endSkippingTimestampUpdates];
    [(ICTTTextStorage *)self setIsEndingEditing:0];
  }
  if ([(ICTTTextStorage *)self editingCount]) {
    [(ICTTTextStorage *)self setEditingCount:[(ICTTTextStorage *)self editingCount] - 1];
  }
  if (![(ICTTTextStorage *)self editingCount])
  {
    if (![(ICTTTextStorage *)self isFixing] && v8)
    {
      p_ttEditedRange = &self->_ttEditedRange;
      NSUInteger location = self->_ttEditedRange.location;
      if (location == 0x7FFFFFFFFFFFFFFFLL)
      {
        p_ttEditedRange->NSUInteger location = v5;
        self->_ttEditedRange.NSUInteger length = v7;
      }
      else
      {
        if (v5 >= location) {
          NSUInteger v11 = self->_ttEditedRange.location;
        }
        else {
          NSUInteger v11 = v5;
        }
        NSUInteger v12 = self->_ttEditedRange.length + location;
        if (v7 - v4 + v5 > v12) {
          NSUInteger v12 = v7 - v4 + v5;
        }
        p_ttEditedRange->NSUInteger location = v11;
        self->_ttEditedRange.NSUInteger length = v4 - v11 + v12;
        v4 += self->_ttChangeInLength;
      }
      self->_ttChangeInLength = v4;
      [(ICTTTextStorage *)self setTtEditedMask:[(ICTTTextStorage *)self ttEditedMask] | v8];
      if (![(ICTTTextStorage *)self isApplyingUndoCommand]
        && ![(ICTTTextStorage *)self isEditingTemporaryAttributes])
      {
        [(ICTTTextStorage *)self fixupAfterEditingDelayedToEndOfRunLoop];
      }
    }
    [(NSMutableArray *)self->_deletedRanges removeAllObjects];
    uint64_t v13 = [(ICTTTextStorage *)self undoCommands];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      v15 = [(ICTTTextStorage *)self coalescingUndoGroup];

      if (!v15)
      {
        uint64_t v16 = [(ICTTTextStorage *)self undoTarget];
        v17 = (void *)[v16 newCoalescingUndoGroup];
        [(ICTTTextStorage *)self setCoalescingUndoGroup:v17];

        v18 = [(ICTTTextStorage *)self undoManager];
        v19 = [(ICTTTextStorage *)self coalescingUndoGroup];
        [v18 registerUndoWithTarget:v16 selector:sel_applyUndoGroup_ object:v19];

        v20 = [(ICTTTextStorage *)self undoManager];
        v21 = [v20 undoActionName];
        uint64_t v22 = [v21 length];

        if (!v22)
        {
          id v23 = [(ICTTTextStorage *)self undoManager];
          v24 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Typing" value:@"Typing" table:0 allowSiri:1];
          [v23 setActionName:v24];
        }
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v25 = [(ICTTTextStorage *)self undoCommands];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v34 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v31 = [(ICTTTextStorage *)self coalescingUndoGroup];
            [v31 addCommand:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v27);
      }

      v32 = [(ICTTTextStorage *)self undoCommands];
      [v32 removeAllObjects];
    }
  }
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setIsEndingEditing:(BOOL)a3
{
  self->_isEndingEditing = a3;
}

- (void)endSkippingTimestampUpdates
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Ending skipping timestamp updates without corresponding begin", v1, 2u);
}

- (int64_t)skipTimestampUpdatesCount
{
  return self->_skipTimestampUpdatesCount;
}

- (void)setSkipTimestampUpdatesCount:(int64_t)a3
{
  self->_skipTimestampUpdatesCount = a3;
}

- (void)beginSkippingTimestampUpdates
{
  int64_t v3 = [(ICTTTextStorage *)self skipTimestampUpdatesCount] + 1;
  [(ICTTTextStorage *)self setSkipTimestampUpdatesCount:v3];
}

- (void)setBeforeEndEditedRange:(_NSRange)a3
{
  self->_beforeEndEditedRange = a3;
}

- (BOOL)isEndingEditing
{
  return self->_isEndingEditing;
}

- (BOOL)isTypingOrMarkingText
{
  return self->_isTypingOrMarkingText;
}

- (BOOL)isSelectingText
{
  return self->_isSelectingText;
}

- (BOOL)wantsTimestampUpdates
{
  BOOL v3 = [(ICTTTextStorage *)self wantsUndoCommands];
  if (v3)
  {
    if ([(ICTTTextStorage *)self isSkippingTimestampUpdates]
      || [(ICTTTextStorage *)self isEditingTemporaryAttributes]
      || [(ICTTTextStorage *)self disableUndoCoalesceBreaking])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = ![(ICTTTextStorage *)self isFixing];
    }
  }
  return v3;
}

- (BOOL)wantsUndoCommands
{
  return self->_wantsUndoCommands;
}

- (BOOL)isResettingBaseWritingDirection
{
  return self->_isResettingBaseWritingDirection;
}

- (BOOL)isPausingUndoActions
{
  return self->_isPausingUndoActions;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = self;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v48, sel_edited_range_changeInLength_);
  if (v9->_directlyEditing || location == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  NSUInteger v11 = [(ICTTMergeableStringVersionedDocument *)v9->_document mergeableString];
  NSUInteger v12 = [v11 attributedString];

  uint64_t v13 = -[NSMutableAttributedString attributedSubstringFromRange:](v9->_attributedString, "attributedSubstringFromRange:", location, length);
  uint64_t v14 = objc_msgSend(v12, "attributedSubstringFromRange:", location, length + a5);
  v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = *MEMORY[0x1E4F83238];
  uint64_t v17 = objc_msgSend(v15, "ic_range");
  objc_msgSend(v15, "removeAttribute:range:", v16, v17, v18);
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](v9->_attributedString, "replaceCharactersInRange:withAttributedString:", location, length, v15);
  highlightsAttributedString = v9->_highlightsAttributedString;
  v43 = v15;
  v20 = [v15 string];
  -[NSMutableAttributedString replaceCharactersInRange:withString:](highlightsAttributedString, "replaceCharactersInRange:withString:", location, length, v20);

  if ([(ICTTTextStorage *)v9 isEditingViaWritingTools])
  {
    v21 = [(ICTTTextStorage *)v9 undoManager];
    if ([v21 isUndoing])
    {

LABEL_9:
      v38 = v13;
      NSUInteger v24 = location;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v25 = [(ICTTTextStorage *)v9 textViews];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
      NSUInteger v27 = length;
      if (v26)
      {
        uint64_t v28 = v26;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v32 = [v31 _inputController];
              char v33 = objc_opt_respondsToSelector();

              NSUInteger v27 = length;
              if (v33)
              {
                long long v34 = [v31 _inputController];
                [v34 _ensureSelectionValid];
              }
            }
            objc_msgSend(v31, "_customUndoManagerUndoRedoDidApplyAttributedText:toCharacterRange:", v43, v24, v27);
          }
          uint64_t v28 = [v25 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v28);
      }

      NSUInteger v12 = v41;
      id v9 = v42;
      uint64_t v13 = v39;
      LOBYTE(a3) = v40;
      goto LABEL_20;
    }
    uint64_t v22 = [(ICTTTextStorage *)v9 undoManager];
    int v23 = [v22 isRedoing];

    if (v23) {
      goto LABEL_9;
    }
  }
LABEL_20:
  if ((a3 & 2) != 0)
  {
    long long v35 = [(ICTTTextStorage *)v9 delegate];
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      objc_super v37 = [(ICTTTextStorage *)v9 delegate];
      [v37 textStorage:v9 didReplace:v13 with:v43];
    }
  }
}

- (NSSet)textLayoutManagers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v4 = [(ICTTTextStorage *)self textLayoutManagerReferences];
  unint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        NSUInteger v11 = [v10 object];

        if (v11)
        {
          NSUInteger v12 = [v10 object];
          [v3 addObject:v12];
        }
        else
        {
          NSUInteger v12 = [(ICTTTextStorage *)self textLayoutManagerReferences];
          [v12 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v3 copy];
  return (NSSet *)v13;
}

- (NSMutableSet)textLayoutManagerReferences
{
  return self->_textLayoutManagerReferences;
}

- (BOOL)isSkippingTimestampUpdates
{
  return [(ICTTTextStorage *)self skipTimestampUpdatesCount] > 0;
}

- (BOOL)isFixing
{
  return self->_isFixing;
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (unint64_t)ttEditedMask
{
  return self->_ttEditedMask;
}

- (void)setTtEditedMask:(unint64_t)a3
{
  self->_ttEditedMask = a3;
}

- (BOOL)isApplyingUndoCommand
{
  return self->_isApplyingUndoCommand;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(ICTTTextStorage *)self mergeableString];
  objc_msgSend(v8, "enumerateEditsInRange:usingBlock:", location, length, v7);
}

- (ICTTMergeableAttributedString)mergeableString
{
  return (ICTTMergeableAttributedString *)[(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
}

+ (id)bulletTextAttributesWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__onceToken != -1) {
    dispatch_once(&bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__onceToken, &__block_literal_global_22);
  }
  id v10 = [[TTBulletTextAttributesCacheKey alloc] initWithTextFont:v8 paragraphStyle:v9 zoomFactor:a5];
  NSUInteger v11 = [(id)bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache objectForKey:v10];
  if (!v11)
  {
    if ([v9 style] == 100)
    {
      [a1 listItemGlyphPointSizeForUnorderedListStyle:100 zoomFactor:a5];
      NSUInteger v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "fontWithName:size:", @"Menlo-Regular");
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
      if ([v9 style] == 101)
      {
        [a1 listItemGlyphPointSizeForUnorderedListStyle:101 zoomFactor:a5];
        NSUInteger v12 = objc_msgSend(v13, "ic_fontWithSize:");
      }
      else
      {
        [v8 pointSize];
        uint64_t v14 = objc_msgSend(v13, "ic_fontWithSize:");
        NSUInteger v12 = objc_msgSend(v14, "ic_fontWithTabularNumbers");
      }
    }
    long long v15 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
    objc_msgSend(v15, "setBaseWritingDirection:", objc_msgSend(v9, "layoutWritingDirection"));
    uint64_t v16 = *MEMORY[0x1E4FB0738];
    v19[0] = *MEMORY[0x1E4FB06F8];
    v19[1] = v16;
    v20[0] = v12;
    v20[1] = v15;
    v19[2] = *MEMORY[0x1E4FB0700];
    long long v17 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    v20[2] = v17;
    NSUInteger v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

    [(id)bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache setObject:v11 forKey:v10];
  }

  return v11;
}

+ (double)listItemGlyphPointSizeForUnorderedListStyle:(unsigned int)a3 zoomFactor:(double)a4
{
  if (a3 == 100)
  {
    double v4 = 12.0;
    double v5 = 26.0;
  }
  else if (a3 == 101)
  {
    double v4 = 17.0;
    double v5 = 32.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICTTTextStorage(UI) listItemGlyphPointSizeForUnorderedListStyle:zoomFactor:]", 1, 0, @"Expected bulleted or dashed list style", a4);
    double v5 = 0.0;
    double v4 = 0.0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", *MEMORY[0x1E4FB28C8], v4, v5);
  [v6 pointSize];
  double v8 = v7;

  return ceil(v8);
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(ICTTTextStorage *)self attributedString];
  v14.NSUInteger location = objc_msgSend(v6, "ic_range");
  v15.NSUInteger location = location;
  v15.NSUInteger length = length;
  NSRange v7 = NSIntersectionRange(v14, v15);

  if ([(ICTTTextStorage *)self filterSubstringAttributes])
  {
    double v8 = -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", v7.location, v7.length);
    if (v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v9 = [(ICTTTextStorage *)self attributedString];
  id v10 = [v9 string];

  if (!v10
    || ([(ICTTTextStorage *)self attributedString],
        NSUInteger v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "attributedSubstringFromRange:", v7.location, v7.length),
        double v8 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v8))
  {
LABEL_6:
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0973378 attributes:0];
  }
LABEL_7:
  return v8;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (id)string
{
  v2 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
  BOOL v3 = [v2 attributedString];

  double v4 = [v3 string];

  return v4;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  if ([(ICTTTextStorage *)self validateIndex:a4 effectiveRange:a5])
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTTTextStorage;
    NSUInteger v12 = -[ICTTTextStorage attribute:atIndex:longestEffectiveRange:inRange:](&v14, sel_attribute_atIndex_longestEffectiveRange_inRange_, v11, a4, a5, location, length);
  }
  else
  {
    NSUInteger v12 = 0;
  }

  return v12;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:"))
  {
    NSRange v7 = [(NSMutableAttributedString *)self->_attributedString attributesAtIndex:a3 effectiveRange:a4];
  }
  else
  {
    NSRange v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

- (unint64_t)length
{
  v2 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
  BOOL v3 = [v2 attributedString];
  unint64_t v4 = [v3 length];

  return v4;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8 = a3;
  if ([(ICTTTextStorage *)self validateIndex:a4 effectiveRange:a5])
  {
    id v9 = [(NSMutableAttributedString *)self->_attributedString attribute:v8 atIndex:a4 effectiveRange:a5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)validateIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v6 = [(NSMutableAttributedString *)self->_attributedString length];
  if (a4 && v6 <= a3) {
    *a4 = (_NSRange)xmmword_1B0B987A0;
  }
  return v6 > a3;
}

- (BOOL)filterSubstringAttributes
{
  return self->_filterSubstringAttributes;
}

- (void)setOutlineController:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

void __39__ICTTTextStorage_setAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v40 = a2;
  objc_opt_class();
  NSRange v7 = (uint64_t *)MEMORY[0x1E4F83588];
  id v8 = [v40 objectForKeyedSubscript:*MEMORY[0x1E4F83588]];
  id v9 = ICDynamicCast();

  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v9) {
    NSUInteger v12 = 0;
  }
  else {
    NSUInteger v12 = v9;
  }
  unint64_t v13 = v12;
  if (v11 == v10) {
    objc_super v14 = 0;
  }
  else {
    objc_super v14 = v10;
  }
  unint64_t v15 = v14;
  if (!(v13 | v15)) {
    goto LABEL_15;
  }
  uint64_t v16 = (void *)v15;
  if (v13) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
  }
  else
  {
    char v18 = [(id)v13 isEqual:v15];

    if (v18)
    {
LABEL_15:
      int v19 = 0;
      goto LABEL_20;
    }
  }
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(*(void *)(a1 + 40) + 112);
  uint64_t v22 = *v7;
  if (v20) {
    objc_msgSend(v21, "addAttribute:value:range:", v22, v20, a3, a4);
  }
  else {
    objc_msgSend(v21, "removeAttribute:range:", v22, a3, a4);
  }
  int v19 = 1;
LABEL_20:
  objc_opt_class();
  int v23 = (uint64_t *)MEMORY[0x1E4F83200];
  NSUInteger v24 = [v40 objectForKeyedSubscript:*MEMORY[0x1E4F83200]];
  id v25 = ICCheckedDynamicCast();

  uint64_t v26 = *(void **)(a1 + 48);
  if (v11 == v25) {
    NSUInteger v27 = 0;
  }
  else {
    NSUInteger v27 = v25;
  }
  unint64_t v28 = v27;
  if (v11 == v26) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v26;
  }
  unint64_t v30 = v29;
  if (v28 | v30)
  {
    v31 = (void *)v30;
    if (v28) {
      BOOL v32 = v30 == 0;
    }
    else {
      BOOL v32 = 1;
    }
    if (v32)
    {
    }
    else
    {
      char v33 = [(id)v28 isEqual:v30];

      if (v33)
      {
        if (!v19) {
          goto LABEL_43;
        }
        goto LABEL_41;
      }
    }
    uint64_t v34 = *(void *)(a1 + 48);
    long long v35 = *(void **)(*(void *)(a1 + 40) + 112);
    uint64_t v36 = *v23;
    if (v34) {
      objc_msgSend(v35, "addAttribute:value:range:", v36, v34, a3, a4);
    }
    else {
      objc_msgSend(v35, "removeAttribute:range:", v36, a3, a4);
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_43;
  }
LABEL_41:
  objc_super v37 = [*(id *)(a1 + 40) styler];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    uint64_t v39 = [*(id *)(a1 + 40) styler];
    objc_msgSend(v39, "updateHighlightsInRange:inTextStorage:", a3, a4, *(void *)(a1 + 40));
  }
LABEL_43:
}

- (ICTTTextStorageStyler)styler
{
  return self->_styler;
}

- (NSAttributedString)highlightsAttributedString
{
  return &self->_highlightsAttributedString->super;
}

uint64_t __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(*(void *)(result + 32) + 112), "addAttribute:value:range:", *MEMORY[0x1E4F83588], a2, a3, a4);
  }
  return result;
}

- (BOOL)hasAnyTextViewWithDarkAppearance
{
  v2 = [(ICTTTextStorage *)self textViews];
  char v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_40);

  return v3;
}

- (NSSet)textViews
{
  if ([(ICTTTextStorage *)self isForTextKit2])
  {
    char v3 = [(ICTTTextStorage *)self textLayoutManagers];
    unint64_t v4 = objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_147);
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CAD0];
    char v3 = [(ICTTTextStorage *)self layoutManagers];
    unint64_t v6 = objc_msgSend(v3, "ic_flatMap:", &__block_literal_global_151);
    unint64_t v4 = [v5 setWithArray:v6];
  }
  return (NSSet *)v4;
}

- (BOOL)isForTextKit2
{
  if (ICInternalSettingsIsTextKit2Enabled() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    char v2 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

- (ICTTTextStorage)initWithDocument:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ICTTTextStorage;
  unint64_t v6 = [(ICTTTextStorage *)&v29 init];
  NSRange v7 = v6;
  if (v6)
  {
    p_document = (id *)&v6->_document;
    objc_storeStrong((id *)&v6->_document, a3);
    id v9 = [*p_document mergeableString];
    [v9 setDelegate:v7];

    id v10 = [*p_document mergeableString];
    id v11 = [v10 attributedString];
    uint64_t v12 = [v11 mutableCopy];
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSMutableAttributedString *)v12;

    objc_super v14 = v7->_attributedString;
    uint64_t v15 = *MEMORY[0x1E4F83238];
    uint64_t v16 = [(NSMutableAttributedString *)v14 ic_range];
    -[NSMutableAttributedString removeAttribute:range:](v14, "removeAttribute:range:", v15, v16, v17);
    char v18 = [[ICTTUndoManager_135534566 alloc] initWithTextStorage:v7];
    undoManager = v7->_undoManager;
    v7->_undoManager = &v18->super;

    uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel_handleDidUndoRedoNotification_ name:*MEMORY[0x1E4F28A80] object:v7->_undoManager];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v7 selector:sel_handleDidUndoRedoNotification_ name:*MEMORY[0x1E4F28A78] object:v7->_undoManager];

    uint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    undoCommands = v7->_undoCommands;
    v7->_undoCommands = v22;

    v7->_wantsUndoCommands = 1;
    NSUInteger v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedRanges = v7->_deletedRanges;
    v7->_deletedRanges = v24;

    v7->_previouslyHadMarkedText = 0;
    uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
    textLayoutManagerReferences = v7->_textLayoutManagerReferences;
    v7->_textLayoutManagerReferences = (NSMutableSet *)v26;

    [(ICTTTextStorage *)v7 resetHighlightsAttributedString];
    [(ICTTTextStorage *)v7 resetTTEdits];
  }

  return v7;
}

- (void)resetHighlightsAttributedString
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  unint64_t v4 = [(NSMutableAttributedString *)self->_attributedString string];
  id v5 = (NSMutableAttributedString *)[v3 initWithString:v4];
  highlightsAttributedString = self->_highlightsAttributedString;
  self->_highlightsAttributedString = v5;

  attributedString = self->_attributedString;
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  uint64_t v9 = [(NSMutableAttributedString *)attributedString ic_range];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke;
  v16[3] = &unk_1E5FDA3C8;
  v16[4] = self;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](attributedString, "enumerateAttribute:inRange:options:usingBlock:", v8, v9, v10, 0, v16);
  id v11 = self->_attributedString;
  uint64_t v12 = *MEMORY[0x1E4F83200];
  uint64_t v13 = [(NSMutableAttributedString *)v11 ic_range];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke_2;
  v15[3] = &unk_1E5FDA3C8;
  v15[4] = self;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](v11, "enumerateAttribute:inRange:options:usingBlock:", v12, v13, v14, 0, v15);
}

- (void)fixupAfterEditingDelayedToEndOfRunLoop
{
  [(ICTTTextStorage *)self setDelayedFixupAfterEditingWantsUndoCommand:[(ICTTTextStorage *)self wantsUndoCommands]];
  if (![(ICTTTextStorage *)self pendingFixupAfterEditing])
  {
    [(ICTTTextStorage *)self setPendingFixupAfterEditing:1];
    [(ICTTTextStorage *)self performSelector:sel_executeDelayedFixupAfterEditing withObject:0 afterDelay:0.0];
  }
}

- (void)setDelayedFixupAfterEditingWantsUndoCommand:(BOOL)a3
{
  self->_delayedFixupAfterEditingWantsUndoCommand = a3;
}

- (void)fixupAfterEditing
{
  BOOL v3 = [(ICTTTextStorage *)self pendingFixupAfterEditing];
  [(ICTTTextStorage *)self setPendingFixupAfterEditing:0];
  if (![(ICTTTextStorage *)self isFixing]
    && [(ICTTTextStorage *)self ttEditedRange] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(ICTTTextStorage *)self setIsFixing:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__ICTTTextStorage_fixupAfterEditing__block_invoke;
    v5[3] = &unk_1E5FD8DF0;
    v5[4] = self;
    [(ICTTTextStorage *)self saveSelectionDuringBlock:v5];
    [(ICTTTextStorage *)self resetTTEdits];
    [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:0];
    [(ICTTTextStorage *)self setIsFixing:0];
    if (v3)
    {
      unint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"ICTTTextStorageDidProcessEndEditingNotification" object:self];
    }
  }
}

- (void)setIsFixing:(BOOL)a3
{
  self->_isFixing = a3;
}

- (void)setPendingFixupAfterEditing:(BOOL)a3
{
  self->_pendingFixupAfterEditing = a3;
}

- (void)resetTTEdits
{
  self->_ttEditedRange = (_NSRange)xmmword_1B0B987A0;
  self->_ttEditedMask = 0;
  self->_ttChangeInLength = 0;
}

void __36__ICTTTextStorage_fixupAfterEditing__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) styler];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) styler];
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 ttEditedMask];
    uint64_t v7 = [*(id *)(a1 + 32) ttEditedRange];
    objc_msgSend(v4, "fixTextStorage:afterProcessingEditing:range:changeInLength:", v5, v6, v7, v8, objc_msgSend(*(id *)(a1 + 32), "ttChangeInLength"));
  }
  if (([*(id *)(a1 + 32) directlyEditing] & 1) == 0
    && ([*(id *)(a1 + 32) isEditingTemporaryAttributes] & 1) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v11 = [*(id *)(a1 + 32) ttEditedRange];
    NSUInteger v13 = objc_msgSend(v9, "ic_enclosingRangeContainingCharactersInSet:forRange:", v10, v11, v12);
    NSUInteger v15 = v14;

    v23.NSUInteger location = objc_msgSend(*(id *)(a1 + 32), "ic_range");
    v23.NSUInteger length = v16;
    v22.NSUInteger location = v13;
    v22.NSUInteger length = v15;
    NSRange v17 = NSIntersectionRange(v22, v23);
    objc_opt_class();
    id v20 = [*(id *)(a1 + 32) styler];
    char v18 = ICDynamicCast();
    int v19 = [v18 authorHighlightsController];
    objc_msgSend(v19, "performHighlightUpdatesForRange:inTextStorage:updates:", v17.location, v17.length, *(void *)(a1 + 32), 0);
  }
}

- (_NSRange)ttEditedRange
{
  p_ttEditedRange = &self->_ttEditedRange;
  NSUInteger location = self->_ttEditedRange.location;
  NSUInteger length = p_ttEditedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)ttChangeInLength
{
  return self->_ttChangeInLength;
}

- (void)setHasUserEditSinceFixupAfterEditing:(BOOL)a3
{
  self->_hasUserEditSinceFixupAfterEditing = a3;
}

- (void)saveSelectionDuringBlock:(id)a3 affinity:(unint64_t)a4
{
  uint64_t v6 = (void (**)(void))a3;
  id v7 = [(ICTTTextStorage *)self savedSelectionWithSelectionAffinity:a4];
  v6[2](v6);

  [(ICTTTextStorage *)self restoreSelection:v7];
}

- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = [(ICTTTextStorage *)self textViews];
  uint64_t v6 = [v5 allObjects];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = (void *)MEMORY[0x1E4F29238];
        uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) selectedRange];
        NSUInteger v15 = objc_msgSend(v12, "valueWithRange:", v13, v14);
        objc_super v29 = v15;
        NSUInteger v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];

        NSRange v17 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
        char v18 = [v17 selectionForCharacterRanges:v16 selectionAffinity:a3];

        [v7 addObject:v18];
        int v19 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
        id v20 = [v19 objectsNeedingUpdatedRanges];
        [v20 addObject:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  v28[0] = obj;
  v28[1] = v7;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

  return v21;
}

- (void)saveSelectionDuringBlock:(id)a3
{
}

- (void)restoreSelection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v4 objectAtIndexedSubscript:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__ICTTTextStorage_restoreSelection___block_invoke;
  v9[3] = &unk_1E5FD8FE8;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v5;
  -[ICTTTextStorage suppressingShiftStateUpdatesIfNecessaryWithSelection:perform:](self, v4, v9);
}

- (void)suppressingShiftStateUpdatesIfNecessaryWithSelection:(void *)a3 perform:
{
  uint64_t v6 = a3;
  if (a1)
  {
    id v5 = [a2 objectAtIndexedSubscript:0];
    if (([a1 isFixing] & 1) != 0 || !objc_msgSend(v5, "count")) {
      v6[2]();
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB18E0], "ic_suppressingShiftStateUpdates:", v6);
    }
  }
}

void __36__ICTTTextStorage_restoreSelection___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] count];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = 0;
    *(void *)&long long v3 = 138412546;
    long long v27 = v3;
    do
    {
      uint64_t v6 = objc_msgSend(*((id *)a1[5] + 26), "mergeableString", v27);
      id v7 = [a1[6] objectAtIndexedSubscript:v5];
      id v8 = [v6 characterRangesForSelection:v7];
      uint64_t v9 = [v8 lastObject];
      unint64_t location = [v9 rangeValue];
      NSUInteger length = v11;

      uint64_t v13 = [a1[4] objectAtIndexedSubscript:v5];
      if ([v13 selectedRange] != location || v14 != length)
      {
        if (location + length > [a1[5] length])
        {
          NSUInteger v16 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __36__ICTTTextStorage_restoreSelection___block_invoke_cold_2(&v28, v29, v16);
          }

          NSRange v17 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v37.unint64_t location = location;
            v37.NSUInteger length = length;
            long long v25 = NSStringFromRange(v37);
            uint64_t v26 = [a1[5] length];
            *(_DWORD *)buf = v27;
            char v33 = v25;
            __int16 v34 = 2048;
            uint64_t v35 = v26;
            _os_log_error_impl(&dword_1B08EB000, v17, OS_LOG_TYPE_ERROR, "original selRange: %@, self.NSUInteger length = %lu", buf, 0x16u);
          }
          unint64_t v18 = [a1[5] length];
          v19.unint64_t location = [a1[5] length];
          v19.NSUInteger length = v19.location;
          if (location >= v18)
          {
            NSUInteger length = 0;
            unint64_t location = v19.location;
          }
          else
          {
            v19.unint64_t location = 0;
            v39.unint64_t location = location;
            v39.NSUInteger length = length;
            NSRange v20 = NSIntersectionRange(v19, v39);
            unint64_t location = v20.location;
            NSUInteger length = v20.length;
          }
          v21 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v38.unint64_t location = location;
            v38.NSUInteger length = length;
            __36__ICTTTextStorage_restoreSelection___block_invoke_cold_1(v30, v38, &v31, v21);
          }
        }
        objc_msgSend(v13, "setSelectedRange:", location, length);
      }
      NSRange v22 = [*((id *)a1[5] + 26) mergeableString];
      NSRange v23 = [v22 objectsNeedingUpdatedRanges];
      long long v24 = [a1[6] objectAtIndexedSubscript:v5];
      [v23 removeObject:v24];

      ++v5;
    }
    while (v4 != v5);
  }
}

- (BOOL)directlyEditing
{
  return self->_directlyEditing;
}

uint64_t __51__ICTTTextStorage_hasAnyTextViewWithDarkAppearance__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 traitCollection];
  uint64_t v3 = objc_msgSend(v2, "ic_isDark");

  return v3;
}

id __28__ICTTTextStorage_textViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = [v2 textContainer];

  uint64_t v4 = [v3 textView];
  uint64_t v5 = [v4 superview];
  uint64_t v6 = ICDynamicCast();

  return v6;
}

- (void)coordinateEditing:(id)a3
{
  id v4 = a3;
  if (![(ICTTTextStorage *)self isTypingOrMarkingText]
    && ![(ICTTTextStorage *)self isSelectingText]
    && ![(ICTTTextStorage *)self isDropping])
  {
    [(ICTTTextStorage *)self forceFixupAfterEditingIfDelayed];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  [(ICTTTextStorage *)&v5 coordinateEditing:v4];
}

- (void)coordinateAccess:(id)a3
{
  id v4 = a3;
  if (![(ICTTTextStorage *)self isTypingOrMarkingText]
    && ![(ICTTTextStorage *)self isSelectingText]
    && ![(ICTTTextStorage *)self isDropping])
  {
    [(ICTTTextStorage *)self forceFixupAfterEditingIfDelayed];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  [(ICTTTextStorage *)&v5 coordinateAccess:v4];
}

- (void)coordinateReading:(id)a3
{
  id v4 = a3;
  if (![(ICTTTextStorage *)self isTypingOrMarkingText]
    && ![(ICTTTextStorage *)self isSelectingText]
    && ![(ICTTTextStorage *)self isDropping])
  {
    [(ICTTTextStorage *)self forceFixupAfterEditingIfDelayed];
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  [(ICTTTextStorage *)&v5 coordinateReading:v4];
}

- (BOOL)isDropping
{
  return self->_isDropping;
}

- (void)forceFixupAfterEditingIfDelayed
{
  if ([(ICTTTextStorage *)self pendingFixupAfterEditing])
  {
    BOOL v3 = [(ICTTTextStorage *)self wantsUndoCommands];
    [(ICTTTextStorage *)self setWantsUndoCommands:[(ICTTTextStorage *)self delayedFixupAfterEditingWantsUndoCommand]];
    [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:1];
    [(ICTTTextStorage *)self fixupAfterEditing];
    [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:0];
    [(ICTTTextStorage *)self setWantsUndoCommands:v3];
  }
}

- (BOOL)pendingFixupAfterEditing
{
  return self->_pendingFixupAfterEditing;
}

- (void)executeDelayedFixupAfterEditing
{
  if (![(ICTTTextStorage *)self isZombie]
    && [(ICTTTextStorage *)self pendingFixupAfterEditing])
  {
    BOOL v3 = [(ICTTTextStorage *)self wantsUndoCommands];
    [(ICTTTextStorage *)self setWantsUndoCommands:[(ICTTTextStorage *)self delayedFixupAfterEditingWantsUndoCommand]];
    id v4 = [(ICTTTextStorage *)self textViews];
    [v4 enumerateObjectsUsingBlock:&__block_literal_global_82];

    [(ICTTTextStorage *)self fixupAfterEditing];
    objc_super v5 = [(ICTTTextStorage *)self textViews];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_130];

    [(ICTTTextStorage *)self setWantsUndoCommands:v3];
  }
}

- (BOOL)isZombie
{
  return self->_isZombie;
}

- (BOOL)delayedFixupAfterEditingWantsUndoCommand
{
  return self->_delayedFixupAfterEditingWantsUndoCommand;
}

- (void)setWantsUndoCommands:(BOOL)a3
{
  self->_wantsUndoCommands = a3;
}

- (void)setStyler:(id)a3
{
}

uint64_t __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(*(void *)(result + 32) + 112), "addAttribute:value:range:", *MEMORY[0x1E4F83200], a2, a3, a4);
  }
  return result;
}

- (void)styleTextInRange:(_NSRange)a3
{
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    if (![(ICTTTextStorage *)self isEditingTemporaryAttributes])
    {
      id v6 = [(ICTTTextStorage *)self styler];
      objc_msgSend(v6, "styleText:inRange:fixModelAttributes:", self, location, length, 1);
    }
  }
}

- (void)dd_makeLinksForResultsInAttributesOfType:(unint64_t)a3 context:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", location, length);
  objc_opt_class();
  NSUInteger v11 = [(ICTTTextStorage *)self delegate];
  id v12 = ICDynamicCast();

  objc_opt_class();
  uint64_t v13 = [v12 calculateDocumentController];
  uint64_t v14 = ICDynamicCast();

  if (v14)
  {
    NSUInteger v15 = [v14 expressionsIndexSet];
    [v10 removeIndexes:v15];
  }
  [(ICTTTextStorage *)self beginTemporaryAttributes];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__ICTTTextStorage_dd_makeLinksForResultsInAttributesOfType_context_range___block_invoke;
  v18[3] = &unk_1E5FDB8F0;
  NSRange v20 = self;
  unint64_t v21 = a3;
  id v19 = v9;
  id v16 = v9;
  [v10 enumerateRangesUsingBlock:v18];
  [(ICTTTextStorage *)self endTemporaryAttributes];
  NSRange v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 postNotificationName:@"ICTTTextStorageDidUpdateDataDetectionResultsNotification" object:self];
}

- (ICTTMergeableStringVersionedDocument)document
{
  return self->_document;
}

- (void)endTemporaryAttributes
{
  unint64_t temporaryAttributeEditing = self->_temporaryAttributeEditing;
  if (temporaryAttributeEditing)
  {
    unint64_t v3 = temporaryAttributeEditing - 1;
    self->_unint64_t temporaryAttributeEditing = v3;
    self->_isEditingTemporaryAttributes = v3 != 0;
  }
}

- (void)endTemporaryAttributeEditing
{
  [(ICTTTextStorage *)self endEditing];
  [(ICTTTextStorage *)self endTemporaryAttributes];
}

- (void)beginTemporaryAttributeEditing
{
  [(ICTTTextStorage *)self beginTemporaryAttributes];
  [(ICTTTextStorage *)self beginEditing];
}

- (void)beginTemporaryAttributes
{
}

- (void)setDisableUndoCoalesceBreaking:(BOOL)a3
{
  self->_disableUndoCoalesceBreaking = a3;
}

- (BOOL)hasUserEditSinceFixupAfterEditing
{
  return self->_hasUserEditSinceFixupAfterEditing;
}

- (_NSRange)beforeEndEditedRange
{
  p_beforeEndEditedRange = &self->_beforeEndEditedRange;
  NSUInteger location = self->_beforeEndEditedRange.location;
  NSUInteger length = p_beforeEndEditedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIsPausingUndoActions:(BOOL)a3
{
  self->_isPausingUndoActions = a3;
}

- (void)setAlwaysEnumerateTrailingParagraph:(BOOL)a3
{
  self->_alwaysEnumerateTrailingParagraph = a3;
}

- (BOOL)alwaysEnumerateTrailingParagraph
{
  return self->_alwaysEnumerateTrailingParagraph;
}

uint64_t __82__ICTTTextStorage_UI__bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor___block_invoke()
{
  bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F83718]);
  return MEMORY[0x1F41817F8]();
}

id __74__ICTTTextStorage_dd_makeLinksForResultsInAttributesOfType_context_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)ICTTTextStorage;
  return objc_msgSendSuper2(&v7, sel_dd_makeLinksForResultsInAttributesOfType_context_range_, v4, v5, a2, a3);
}

void __50__ICTTTextStorage_executeDelayedFixupAfterEditing__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F0A659F8]) {
    [v2 didEndPostLayoutFixupAfterEditing];
  }
}

void __50__ICTTTextStorage_executeDelayedFixupAfterEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F0A659F8]) {
    [v2 willBeginPostLayoutFixupAfterEditing];
  }
}

- (void)addTextLayoutManager:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F83800];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithObject:v5];

  id v6 = [(ICTTTextStorage *)self textLayoutManagerReferences];
  [v6 addObject:v7];
}

void __44__ICTTTextStorage_addAttribute_value_range___block_invoke()
{
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0
    && !dlopen("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI", 1))
  {
    v0 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __44__ICTTTextStorage_addAttribute_value_range___block_invoke_cold_1(v0);
    }
  }
}

- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4
{
  id v6 = a3;
  id v7 = [(ICTTTextStorage *)self initWithData:0 replicaID:a4];
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = [(ICTTTextStorage *)v7 isForTextKit2];
    id v10 = off_1E5FD7F48;
    if (!v9) {
      id v10 = off_1E5FD8090;
    }
    id v11 = objc_alloc_init(*v10);
    [(ICTTTextStorage *)v8 setStyler:v11];

    [(ICTTTextStorage *)v8 setConvertAttributes:1];
    [(ICTTTextStorage *)v8 setWantsUndoCommands:0];
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v8, "replaceCharactersInRange:withAttributedString:", 0, [(ICTTTextStorage *)v8 length], v6);
    [(ICTTTextStorage *)v8 fixupAfterEditing];
    [(ICTTTextStorage *)v8 setConvertAttributes:0];
  }

  return v8;
}

- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4 sourceZoomController:(id)a5 keepSourceZoomController:(BOOL)a6 existingStyler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  NSUInteger v15 = [(ICTTTextStorage *)self initWithData:0 replicaID:a4];
  id v16 = v15;
  if (!v15) {
    goto LABEL_8;
  }
  if (!v14)
  {
    if ([(ICTTTextStorage *)v15 isForTextKit2]) {
      uint64_t v26 = ICTK2TextController;
    }
    else {
      uint64_t v26 = ICTextController;
    }
    id v27 = objc_alloc_init(v26);
    [(ICTTTextStorage *)v16 setStyler:v27];

    if (!v13) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [(ICTTTextStorage *)v15 setStyler:v14];
  if (v13)
  {
LABEL_4:
    objc_opt_class();
    NSRange v17 = [(ICTTTextStorage *)v16 styler];
    unint64_t v18 = ICDynamicCast();
    [v18 setZoomController:v13];
  }
LABEL_5:
  [(ICTTTextStorage *)v16 setConvertAttributes:1];
  [(ICTTTextStorage *)v16 setWantsUndoCommands:0];
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v16, "replaceCharactersInRange:withAttributedString:", 0, [(ICTTTextStorage *)v16 length], v12);
  id v19 = [(ICTTTextStorage *)v16 styler];
  uint64_t v20 = [(ICTTTextStorage *)v16 editedRange];
  objc_msgSend(v19, "styleText:inRange:fixModelAttributes:", v16, v20, v21, 1);

  [(ICTTTextStorage *)v16 fixupAfterEditing];
  [(ICTTTextStorage *)v16 setConvertAttributes:0];
  if (v13 && !a6)
  {
    objc_opt_class();
    NSRange v22 = [(ICTTTextStorage *)v16 styler];
    NSRange v23 = ICDynamicCast();

    id v24 = objc_alloc_init((Class)objc_opt_class());
    [v23 setZoomController:v24];

    [v23 refreshTextStylingForTextStorage:v16 withTextController:v23];
  }
LABEL_8:

  return v16;
}

- (void)preReplaceCharactersInRange:(_NSRange)a3 withStringLength:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v8 = -[ICTTTextStorage isDeletingDictationAttachmentWithReplacementRange:replacementLength:](self, "isDeletingDictationAttachmentWithReplacementRange:replacementLength:");
  BOOL v9 = -[ICTTTextStorage shouldBreakUndoCoalescingWithReplacementRange:replacementLength:](self, "shouldBreakUndoCoalescingWithReplacementRange:replacementLength:", location, length, a4);
  if ([(ICTTTextStorage *)self isPerformingAccessibilityUndoableTextInsertion]|| ![(ICTTTextStorage *)self isDragging]&& ![(ICTTTextStorage *)self isPausingUndoActions]&& !v8&& v9&& ![(ICTTTextStorage *)self isEditingViaWritingTools])
  {
    [(ICTTTextStorage *)self breakUndoCoalescing];
  }
  if (length)
  {
    if (!a4)
    {
      id v10 = [(ICTTTextStorage *)self deletedRanges];
      id v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
      v15[0] = v11;
      id v12 = [(ICTTTextStorage *)self attributedString];
      id v13 = objc_msgSend(v12, "attributedSubstringFromRange:", location, length);
      v15[1] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      [v10 addObject:v14];
    }
  }
}

- (BOOL)isDeletingDictationAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  LOBYTE(v4) = 0;
  if (a3.length && !a4)
  {
    id v5 = -[ICTTTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E4FB06B8], a3.location);
    BOOL v4 = !+[ICTextAttachment textAttachmentIsContent:v5];
  }
  return v4;
}

- (BOOL)isEditingOrConvertingMarkedText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(ICTTTextStorage *)self textViews];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICTTTextStorage_UI__isEditingOrConvertingMarkedText___block_invoke;
  v8[3] = &unk_1E5FDA300;
  v8[4] = self;
  v8[5] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  int v6 = *((unsigned __int8 *)v10 + 24);
  if (v3) {
    [(ICTTTextStorage *)self setPreviouslyHadMarkedText:v6 != 0];
  }
  _Block_object_dispose(&v9, 8);
  return v6 != 0;
}

uint64_t __55__ICTTTextStorage_UI__isEditingOrConvertingMarkedText___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) textViewHasMarkedText:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (BOOL)textViewHasMarkedText:(id)a3
{
  BOOL v3 = [a3 markedTextRange];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeletingContentAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  NSUInteger length = a3.length;
  BOOL v5 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (a3.length && !a4)
  {
    NSUInteger location = a3.location;
    uint64_t v7 = *MEMORY[0x1E4FB06B8];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__ICTTTextStorage_UI__isDeletingContentAttachmentWithReplacementRange_replacementLength___block_invoke;
    v9[3] = &unk_1E5FDA328;
    void v9[4] = &v10;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v7, location, length, 0, v9);
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __89__ICTTTextStorage_UI__isDeletingContentAttachmentWithReplacementRange_replacementLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  if (v7
    && +[ICTextAttachment textAttachmentIsContent:v7])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

- (BOOL)shouldBreakUndoCoalescingWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v8 = [(ICTTTextStorage *)self isEditingOrConvertingMarkedText:1];
  uint64_t v9 = [(ICTTTextStorage *)self lastUndoEditRange];
  BOOL v11 = location != v9 + v10 && location + length != [(ICTTTextStorage *)self lastUndoEditRange];
  if (location >= [(ICTTTextStorage *)self length])
  {
    NSUInteger v14 = 0;
  }
  else
  {
    uint64_t v12 = [(ICTTTextStorage *)self string];
    [v12 rangeOfComposedCharacterSequenceAtIndex:location];
    NSUInteger v14 = v13;
  }
  BOOL v15 = length == v14 && a4 == 0;
  BOOL v16 = -[ICTTTextStorage isDeletingContentAttachmentWithReplacementRange:replacementLength:](self, "isDeletingContentAttachmentWithReplacementRange:replacementLength:", location, length, a4);
  if (a4) {
    BOOL v17 = length == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17 || v15)
  {
    BOOL v21 = v11 || v16;
    BOOL v20 = !v8;
  }
  else
  {
    BOOL v18 = a4 == 0;
    if (a4) {
      BOOL v19 = length != 0;
    }
    else {
      BOOL v19 = 0;
    }
    if (length <= v14) {
      BOOL v18 = 0;
    }
    BOOL v20 = v19 || v18;
    BOOL v21 = !v8;
  }
  if (![(ICTTTextStorage *)self isHandlingTextCheckingResults]) {
    -[ICTTTextStorage setLastUndoEditRange:](self, "setLastUndoEditRange:", location, a4);
  }
  return v20 && v21;
}

- (void)convertNSTablesToTabs:(id)a3
{
  id v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_1B0BF84BB;
  long long v14 = xmmword_1B0B987A0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__18;
  v11[4] = __Block_byref_object_dispose__18;
  id v12 = 0;
  uint64_t v4 = [v3 length];
  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ICTTTextStorage_UI__convertNSTablesToTabs___block_invoke;
  v7[3] = &unk_1E5FDA350;
  uint64_t v9 = v13;
  uint64_t v10 = v11;
  id v6 = v3;
  id v8 = v6;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
}

void __45__ICTTTextStorage_UI__convertNSTablesToTabs___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v20 = v7;
    id v8 = [v7 textBlocks];
    uint64_t v9 = [v8 count];

    id v7 = v20;
    if (v9)
    {
      uint64_t v10 = [v20 textBlocks];
      BOOL v11 = [v10 lastObject];

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startingRow];
        if (v12 == [v11 startingRow])
        {
          NSUInteger v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) table];
          long long v14 = [v11 table];

          if (v13 == v14)
          {
            BOOL v15 = objc_msgSend(&stru_1F0973378, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "columnSpan"), @"\t", 0);
            objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)+ *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)- 1, 1, v15);
          }
        }
      }
      if (a4)
      {
        BOOL v16 = [*(id *)(a1 + 32) string];
        int v17 = [v16 characterAtIndex:a4 + a3 - 1];

        if (v17 == 10)
        {
          uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
          *(void *)(v18 + 32) = a3;
          *(void *)(v18 + 40) = a4;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
        }
      }
      BOOL v19 = (void *)[v20 mutableCopy];
      [v19 setAlignment:4];
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v19, a3, a4);

      id v7 = v20;
    }
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  os_log_t v7 = (os_log_t)a4;
  if (location + length <= [(ICTTTextStorage *)self length]
    && ([(ICTTTextStorage *)self attributedString],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 length],
        v8,
        location + length <= v9))
  {
    if ([(ICTTTextStorage *)self shouldRemoveLeadingWhitespaceForChecklistDrop])
    {
      [(ICTTTextStorage *)self setShouldRemoveLeadingWhitespaceForChecklistDrop:0];
      if (!length)
      {
        uint64_t v12 = [(ICTTTextStorage *)self string];
        uint64_t v13 = objc_msgSend(v12, "lineRangeForRange:", location, 0);
        BOOL v15 = objc_msgSend(v12, "ic_substringWithRange:", v13, v14);
        BOOL v16 = objc_msgSend(v15, "ic_leadingTrimmedString");
        uint64_t v17 = [v15 length];
        NSUInteger length = v17 - [v16 length];
        if (length) {
          NSUInteger location = v13;
        }
      }
    }
    uint64_t v18 = -[ICTTTextStorage correctParagraphStyleReuseForRange:withNewAttributedString:](self, "correctParagraphStyleReuseForRange:withNewAttributedString:", location, length, v7);

    -[ICTTTextStorage preReplaceCharactersInRange:withStringLength:](self, "preReplaceCharactersInRange:withStringLength:", location, length, [v18 length]);
    BOOL v19 = [v18 copy];
    id v20 = (void *)[v18 mutableCopy];
    uint64_t v21 = *MEMORY[0x1E4F83238];
    uint64_t v22 = objc_msgSend(v20, "ic_range");
    objc_msgSend(v20, "removeAttribute:range:", v21, v22, v23);
    os_log_t v10 = v20;

    BOOL v24 = [(ICTTTextStorage *)self filterPastedAttributes];
    if ([(ICTTTextStorage *)self convertAttributes]
      || [(ICTTTextStorage *)self isEditingViaWritingTools])
    {
      id v25 = [v10 mutableCopy];
      if ([(ICTTTextStorage *)self shouldConvertTablesToTabs])
      {
        [(ICTTTextStorage *)self convertNSTablesToTabs:v25];
      }
      else
      {
        uint64_t v26 = [(ICTTTextStorage *)self styler];
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          uint8_t v28 = [(ICTTTextStorage *)self styler];
          objc_super v29 = [(ICTTTextStorage *)self pasteboardTypes];
          objc_msgSend(v28, "convertNSTablesToICTables:pasteboardTypes:filterPastedAttributes:isReadingSelectionFromPasteboard:", v25, v29, v24, -[ICTTTextStorage isReadingSelectionFromPasteboard](self, "isReadingSelectionFromPasteboard"));
        }
      }
      v90 = (void *)[v25 mutableCopy];
      if (v24)
      {
        unint64_t v30 = [(ICTTTextStorage *)self styler];
        [v30 guessFontSizeThresholdsForTTStylesInAttributedString:v25];
      }
      v91 = v19;
      v108[0] = 0;
      v108[1] = v108;
      v108[2] = 0x2020000000;
      char v109 = 0;
      uint64_t v31 = objc_msgSend(v25, "ic_range");
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke;
      v107[3] = &unk_1E5FDA378;
      v107[4] = v108;
      objc_msgSend(v25, "enumerateAttributesInRange:options:usingBlock:", v31, v32, 0, v107);
      objc_opt_class();
      char v33 = (uint64_t *)MEMORY[0x1E4F83220];
      __int16 v34 = [(ICTTTextStorage *)self attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];
      uint64_t v35 = ICDynamicCast();

      v105[0] = 0;
      v105[1] = v105;
      v105[2] = 0x2020000000;
      char v106 = 0;
      uint64_t v36 = *v33;
      uint64_t v37 = [v10 ic_range];
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_2;
      v104[3] = &unk_1E5FDA328;
      v104[4] = v105;
      -[NSObject enumerateAttribute:inRange:options:usingBlock:](v10, "enumerateAttribute:inRange:options:usingBlock:", v36, v37, v38, 0, v104);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSRange v39 = 0;
      }
      else {
        NSRange v39 = v10;
      }
      id v40 = [(ICTTTextStorage *)self styler];
      [v40 prepareIndentInformationInAttributedString:v10];

      uint64_t v41 = objc_msgSend(v25, "ic_range");
      uint64_t v43 = v42;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_3;
      v97[3] = &unk_1E5FDA3A0;
      v97[4] = self;
      BOOL v103 = v24;
      v88 = v39;
      v98 = v88;
      id v87 = v35;
      id v99 = v87;
      v102 = v108;
      id v44 = v90;
      id v100 = v44;
      id v45 = v25;
      id v101 = v45;
      objc_msgSend(v45, "enumerateAttributesInRange:options:usingBlock:", v41, v43, 0, v97);
      long long v46 = [(ICTTTextStorage *)self styler];
      [v46 resetGuessedFontSizes];

      long long v47 = [(ICTTTextStorage *)self styler];
      [v47 resetIndentInformation];

      os_log_t v7 = (os_log_t)[v45 copy];
      BOOL v19 = [v44 copy];

      _Block_object_dispose(v105, 8);
      _Block_object_dispose(v108, 8);
    }
    else
    {
      os_log_t v7 = v10;
    }
    if ([(ICTTTextStorage *)self wantsTimestampUpdates])
    {
      id v48 = [v19 mutableCopy];
      uint64_t v49 = *MEMORY[0x1E4F83238];
      uint64_t v50 = [(ICTTTextStorage *)self currentTimestamp];
      uint64_t v51 = objc_msgSend(v48, "ic_range");
      objc_msgSend(v48, "addAttribute:value:range:", v49, v50, v51, v52);

      uint64_t v53 = [v48 copy];
      [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:1];

      v92 = v53;
    }
    else
    {
      v92 = v19;
    }
    v54 = [(ICTTTextStorage *)self document];
    uint64_t v55 = [v54 mergeableString];
    v56 = [(id)v55 attributedString];
    v89 = objc_msgSend(v56, "attributedSubstringFromRange:", location, length);

    v57 = [(ICTTTextStorage *)self delegate];
    LOBYTE(v55) = objc_opt_respondsToSelector();

    if (v55)
    {
      v58 = [(ICTTTextStorage *)self delegate];
      [v58 textStorageWillChange:self];
    }
    [(ICTTTextStorage *)self setDirectlyEditing:1];
    objc_opt_class();
    v59 = [(ICTTTextStorage *)self attributedString];
    v60 = ICCheckedDynamicCast();
    objc_msgSend(v60, "replaceCharactersInRange:withAttributedString:", location, length, v7);

    id v61 = objc_alloc(MEMORY[0x1E4F28E48]);
    v62 = [v7 string];
    v63 = (void *)[v61 initWithString:v62];

    uint64_t v64 = *MEMORY[0x1E4FB0700];
    uint64_t v65 = [v7 ic_range];
    uint64_t v67 = v66;
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_4;
    v95[3] = &unk_1E5FDA3C8;
    id v68 = v63;
    id v96 = v68;
    -[NSObject enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", v64, v65, v67, 0, v95);
    uint64_t v69 = *MEMORY[0x1E4F83200];
    uint64_t v70 = [v7 ic_range];
    uint64_t v72 = v71;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_5;
    v93[3] = &unk_1E5FDA3C8;
    id v73 = v68;
    id v94 = v73;
    -[NSObject enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", v69, v70, v72, 0, v93);
    objc_opt_class();
    v74 = [(ICTTTextStorage *)self highlightsAttributedString];
    v75 = ICCheckedDynamicCast();
    v76 = (void *)[v73 copy];
    objc_msgSend(v75, "replaceCharactersInRange:withAttributedString:", location, length, v76);

    v77 = [(ICTTTextStorage *)self document];
    v78 = [v77 mergeableString];
    os_log_t v11 = v92;
    objc_msgSend(v78, "replaceCharactersInRange:withAttributedString:", location, length, v92);

    if ([(ICTTTextStorage *)self isEditingViaWritingTools])
    {
      v79 = -[ICTTTextStorage paragraphUUIDsInRange:](self, "paragraphUUIDsInRange:", location, length);
      v80 = [(ICTTTextStorage *)self outlineController];
      [v80 expandUUIDs:v79];
    }
    [(ICTTTextStorage *)self setDirectlyEditing:0];
    v81 = [(ICTTTextStorage *)self delegate];
    char v82 = objc_opt_respondsToSelector();

    if (v82)
    {
      v83 = [(ICTTTextStorage *)self delegate];
      [v83 textStorage:self didReplace:v89 with:v7];
    }
    v84 = [(ICTTTextStorage *)self delegate];
    char v85 = objc_opt_respondsToSelector();

    if (v85)
    {
      v86 = [(ICTTTextStorage *)self delegate];
      [v86 textStorageDidChange:self];
    }
    [(ICTTTextStorage *)self setHasEditedCharactersAfterTextSelection:1];
  }
  else
  {
    os_log_t v10 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v110.NSUInteger location = location;
      v110.NSUInteger length = length;
      -[ICTTTextStorage(UI) replaceCharactersInRange:withAttributedString:](v110, self);
    }
    os_log_t v11 = v10;
  }
}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  uint64_t v5 = ICDynamicCast();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v5 != 0;

  objc_opt_class();
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F83250]];

  id v6 = ICDynamicCast();
  os_log_t v7 = [v6 textLists];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ([v7 count] | *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) != 0;
}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 isBlockQuote])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v9 = [v7 styler];
  os_log_t v10 = [v9 modelForStyleAttributes:v8 filterAttributes:*(unsigned __int8 *)(a1 + 80) pasteboardAttributedString:*(void *)(a1 + 40)];

  id v21 = (id)[v10 mutableCopy];
  if (*(void *)(a1 + 48) && *(unsigned char *)(a1 + 80) && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    objc_opt_class();
    os_log_t v11 = (void *)MEMORY[0x1E4F83220];
    uint64_t v12 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
    uint64_t v13 = ICDynamicCast();
    uint64_t v14 = (void *)[v13 mutableCopy];
    BOOL v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x1E4F834E0]);
    }
    uint64_t v17 = v16;

    objc_msgSend(v17, "setStyle:", objc_msgSend(*(id *)(a1 + 48), "style"));
    uint64_t v18 = (void *)[v17 copy];
    [v21 setObject:v18 forKeyedSubscript:*v11];
  }
  objc_msgSend(*(id *)(a1 + 56), "setAttributes:range:", v21, a3, a4);
  BOOL v19 = [*(id *)(a1 + 32) styler];
  id v20 = [v19 styleForModelAttributes:v21];

  objc_msgSend(*(id *)(a1 + 64), "setAttributes:range:", v20, a3, a4);
}

uint64_t __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E4F83588], a2, a3, a4);
  }
  return result;
}

uint64_t __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_5(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E4F83200], a2, a3, a4);
  }
  return result;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if (location + length <= [(ICTTTextStorage *)self length]
    && ([(ICTTTextStorage *)self attributedString],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 length],
        v8,
        location + length <= v9))
  {
    -[ICTTTextStorage preReplaceCharactersInRange:withStringLength:](self, "preReplaceCharactersInRange:withStringLength:", location, length, [v7 length]);
    os_log_t v11 = [(ICTTTextStorage *)self document];
    uint64_t v12 = [v11 mergeableString];
    uint64_t v13 = [v12 attributedString];
    os_log_t v10 = objc_msgSend(v13, "attributedSubstringFromRange:", location, length);

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];
    [(ICTTTextStorage *)self setDirectlyEditing:1];
    objc_opt_class();
    BOOL v15 = [(ICTTTextStorage *)self attributedString];
    id v16 = ICCheckedDynamicCast();
    objc_msgSend(v16, "replaceCharactersInRange:withString:", location, length, v7);

    objc_opt_class();
    uint64_t v17 = [(ICTTTextStorage *)self highlightsAttributedString];
    uint64_t v18 = ICCheckedDynamicCast();
    objc_msgSend(v18, "replaceCharactersInRange:withString:", location, length, v7);

    BOOL v19 = [(ICTTTextStorage *)self document];
    id v20 = [v19 mergeableString];
    objc_msgSend(v20, "replaceCharactersInRange:withString:", location, length, v7);

    if ([v7 length] && -[ICTTTextStorage wantsTimestampUpdates](self, "wantsTimestampUpdates"))
    {
      id v21 = [(ICTTTextStorage *)self document];
      uint64_t v22 = [v21 mergeableString];
      uint64_t v23 = [v22 attributesAtIndex:location effectiveRange:0];
      BOOL v24 = (void *)[v23 mutableCopy];

      id v25 = [(ICTTTextStorage *)self currentTimestamp];
      [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F83238]];

      uint64_t v26 = [(ICTTTextStorage *)self document];
      char v27 = [v26 mergeableString];
      uint8_t v28 = (void *)[v24 copy];
      objc_msgSend(v27, "setAttributes:range:", v28, location, objc_msgSend(v7, "length"));
    }
    if ([(ICTTTextStorage *)self wantsTimestampUpdates]) {
      [(ICTTTextStorage *)self setHasUserEditSinceFixupAfterEditing:1];
    }
    [(ICTTTextStorage *)self setDirectlyEditing:0];
    objc_super v29 = [(ICTTTextStorage *)self delegate];
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      uint64_t v31 = [(ICTTTextStorage *)self delegate];
      [v31 textStorage:self didReplace:v10 with:v14];
    }
  }
  else
  {
    os_log_t v10 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v32.NSUInteger location = location;
      v32.NSUInteger length = length;
      -[ICTTTextStorage(UI) replaceCharactersInRange:withString:](v32, self);
    }
  }
}

+ (id)standardizedAttributedStringFromAttributedString:(id)a3 withStyler:(id)a4 fixAttachments:(BOOL)a5 translateICTTFont:(BOOL)a6 context:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a7;
  id v13 = a4;
  objc_opt_class();
  uint64_t v14 = ICDynamicCast();

  BOOL v15 = (void *)[v11 mutableCopy];
  if (v14)
  {
    objc_msgSend(v14, "styleFontInAttributedString:inRange:contentSizeCategory:", v15, 0, objc_msgSend(v11, "length"), *MEMORY[0x1E4FB27D0]);
    objc_msgSend(v14, "styleListsAndIndentsInAttributedString:inRange:", v15, 0, objc_msgSend(v15, "length"));
    id v16 = (void *)[v15 copy];

    uint64_t v17 = [v14 zoomController];
    [v17 zoomFactor];
    if (v18 != 1.0)
    {
      uint64_t v19 = [v17 unzoomAttributedString:v16];

      id v16 = (void *)v19;
    }

    id v11 = v16;
  }
  LOBYTE(v25) = 1;
  id v20 = +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v11, 0, [v11 length], 0, 1, v9, v25);
  id v21 = objc_msgSend(v20, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", v12);

  uint64_t v22 = +[ICTTTextStorage removeTextAttachmentsForAttributedString:v21 translateICTTFont:v8];

  uint64_t v23 = +[ICTTTextStorage removeDataDetectorLinksForAttributedString:v22];

  return v23;
}

- (id)standardizedAttributedStringFixingTextAttachmentsInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTTTextStorage *)self attributedString];
  id v6 = -[ICTTTextStorage standardizedAttributedStringFixingTextAttachmentsForRange:context:](self, "standardizedAttributedStringFixingTextAttachmentsForRange:context:", 0, [v5 length], v4);

  return v6;
}

- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 context:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  BOOL v8 = [(ICTTTextStorage *)self styler];
  BOOL v9 = -[ICTTTextStorage standardizedAttributedStringFixingTextAttachmentsForRange:styler:context:](self, "standardizedAttributedStringFixingTextAttachmentsForRange:styler:context:", location, length, v8, v7);

  return v9;
}

- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 styler:(id)a4 context:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(ICTTTextStorage *)self attributedString];
  id v12 = objc_msgSend(v11, "attributedSubstringFromRange:", location, length);

  id v13 = +[ICTTTextStorage standardizedAttributedStringFromAttributedString:v12 withStyler:v10 fixAttachments:1 translateICTTFont:1 context:v9];

  return v13;
}

- (id)dataFromRange:(_NSRange)a3 documentAttributes:(id)a4 error:(id *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if ([(ICTTTextStorage *)self filterSubstringAttributes])
  {
    id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06E0]];
    id v11 = -[ICTTTextStorage filteredAttributedSubstringFromRange:insertListMarkers:](self, "filteredAttributedSubstringFromRange:insertListMarkers:", location, length, v10 != (void *)*MEMORY[0x1E4FB0708]);
    id v12 = objc_msgSend(v11, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v11, "length"), v9, a5);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTTTextStorage;
    id v12 = -[ICTTTextStorage dataFromRange:documentAttributes:error:](&v14, sel_dataFromRange_documentAttributes_error_, location, length, v9, a5);
  }

  return v12;
}

- (id)filteredAttributedSubstringFromRange:(_NSRange)a3 insertListMarkers:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v8 = [(ICTTTextStorage *)self attributedString];
  LOBYTE(v11) = a4;
  id v9 = +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v8, location, length, [(ICTTTextStorage *)self filterSubstringAttributesForPlainText], 0, 1, v11);

  return v9;
}

- (id)filteredAttributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(ICTTTextStorage *)self attributedString];
  LOBYTE(v9) = 1;
  id v7 = +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v6, location, length, [(ICTTTextStorage *)self filterSubstringAttributesForPlainText], 0, 1, v9);

  return v7;
}

+ (id)removeDataDetectorLinksForAttributedString:(id)a3
{
  id v3 = (void *)[a3 mutableCopy];
  uint64_t v4 = *MEMORY[0x1E4FB0720];
  uint64_t v5 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ICTTTextStorage_UI__removeDataDetectorLinksForAttributedString___block_invoke;
  v8[3] = &unk_1E5FDA3C8;
  id v6 = v3;
  id v9 = v6;
  objc_msgSend(v6, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v4, 0, v5, 0x100000, v8);
  objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F5F118], 0, objc_msgSend(v6, "length"));

  return v6;
}

void __66__ICTTTextStorage_UI__removeDataDetectorLinksForAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F5F118], a3, 0, a3, a4);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0720], a3, a4);
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    if (!a3
      || ([*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB0700] atIndex:a3 - 1 effectiveRange:0],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v9 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    }
    id v10 = (id)v9;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v8, v9, a3, a4);
  }
}

+ (id)removeTextAttachmentsForAttributedString:(id)a3 translateICTTFont:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (void *)[a3 mutableCopy];
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  uint64_t v7 = [v5 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke;
  v14[3] = &unk_1E5FDA3F0;
  id v8 = v5;
  id v15 = v8;
  objc_msgSend(v8, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v6, 0, v7, 0x100000, v14);
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x1E4F83208];
    uint64_t v10 = [v8 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke_2;
    v12[3] = &unk_1E5FDA418;
    id v13 = v8;
    objc_msgSend(v13, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v9, 0, v10, 0x100000, v12);
  }
  return v8;
}

void __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *MEMORY[0x1E4FB06B8];
    objc_msgSend(v9, "removeAttribute:range:", v10, a3, a4);
  }
}

void __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4F83208], a3, a4);
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *MEMORY[0x1E4FB06F8];
    uint64_t v10 = [v11 nativeFontForStyle:3];
    objc_msgSend(v8, "addAttribute:value:range:", v9, v10, a3, a4);
  }
}

+ (void)fixAttachmentsForRenderingInAttributedString:(id)a3 forPlainText:(BOOL)a4 forStandardizedText:(BOOL)a5
{
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4FB06B8];
  uint64_t v9 = [v7 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__ICTTTextStorage_UI__fixAttachmentsForRenderingInAttributedString_forPlainText_forStandardizedText___block_invoke;
  v11[3] = &unk_1E5FDA440;
  id v12 = v7;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v7;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 0, v11);
}

void __101__ICTTTextStorage_UI__fixAttachmentsForRenderingInAttributedString_forPlainText_forStandardizedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:", *(void *)(a1 + 32), a3, a4, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    }
  }
}

+ (id)filteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6 fixAttachments:(BOOL)a7 insertListMarkers:(BOOL)a8
{
  BOOL v65 = a6;
  BOOL v66 = a7;
  BOOL v75 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  void v93[4] = *MEMORY[0x1E4F143B8];
  uint64_t v84 = 0;
  char v85 = &v84;
  uint64_t v86 = 0x3032000000;
  id v87 = __Block_byref_object_copy__18;
  v88 = __Block_byref_object_dispose__18;
  id v67 = a3;
  id v10 = objc_msgSend(v67, "attributedSubstringFromRange:", location, length);
  id v89 = (id)[v10 mutableCopy];

  BOOL v73 = +[ICTextController shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:](ICTextController, "shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:", v67, location, length);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v75)
  {
    v92[0] = &unk_1F09A41D8;
    v92[1] = &unk_1F09A41F0;
    v93[0] = @"*";
    v93[1] = @"-";
    v92[2] = &unk_1F09A4208;
    v92[3] = &unk_1F09A4220;
    v93[2] = @"- [ ]";
    v93[3] = @"{decimal}.";
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4];
    id v12 = @"- [x]";
  }
  else
  {
    v90[0] = &unk_1F09A41D8;
    v90[1] = &unk_1F09A41F0;
    v91[0] = @"{disc}";
    v91[1] = @"{hyphen}";
    v90[2] = &unk_1F09A4208;
    v90[3] = &unk_1F09A4220;
    v91[2] = @"{circle}";
    v91[3] = @"{decimal}.";
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
    id v12 = @"{check}";
  }
  id v68 = v12;
  if (!filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass) {
    filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass = (uint64_t)NSClassFromString(&cfstr_Nstextlist.isa);
  }
  unint64_t v13 = 0;
  uint64_t v74 = *MEMORY[0x1E4FB06F8];
  uint64_t v69 = *MEMORY[0x1E4FB0738];
  while (v13 < [(id)v85[5] length])
  {
    unint64_t v82 = 0;
    uint64_t v83 = 0;
    BOOL v14 = objc_msgSend((id)v85[5], "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F83220], v13, &v82, 0, objc_msgSend((id)v85[5], "length"));
    if ([v14 isList])
    {
      while (1)
      {
        uint64_t v15 = [v14 indent];
        if (v15 + 1 <= (unint64_t)[v11 count]) {
          break;
        }
        id v16 = objc_alloc((Class)filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass);
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "style"));
        double v18 = [v77 objectForKeyedSubscript:v17];
        uint64_t v19 = (void *)[v16 initWithMarkerFormat:v18 options:0];

        if ([v14 startingItemNumber]) {
          objc_msgSend(v19, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
        }
        [v11 addObject:v19];
      }
      uint64_t v20 = [v14 indent];
      if (v20 + 1 < (unint64_t)[v11 count]) {
        objc_msgSend(v11, "removeObjectsInRange:", objc_msgSend(v14, "indent") + 1, objc_msgSend(v11, "count") + ~objc_msgSend(v14, "indent"));
      }
      id v21 = [v11 lastObject];
      uint64_t v22 = [v14 todo];
      if (v22)
      {
        uint64_t v70 = [v14 todo];
        uint64_t v71 = v68;
        if ([v70 done]) {
          goto LABEL_19;
        }
      }
      uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v14, "style"));
      uint64_t v71 = [v77 objectForKeyedSubscript:v23];

      if (v22) {
LABEL_19:
      }

      BOOL v24 = [v21 markerFormat];
      char v25 = [v24 isEqualToString:v71];

      if (v25)
      {
        v76 = v21;
      }
      else
      {
        v76 = (void *)[objc_alloc((Class)filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass) initWithMarkerFormat:v71 options:0];

        if ([v14 startingItemNumber]) {
          objc_msgSend(v76, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
        }
        objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "count") - 1, v76);
      }
      uint64_t v72 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
      uint64_t v26 = [v72 tabStops];
      char v27 = (void *)[v26 mutableCopy];

      uint64_t v28 = [v27 count];
      if (v28)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          char v30 = [v27 objectAtIndexedSubscript:i];
          id v31 = objc_alloc(MEMORY[0x1E4FB08C0]);
          uint64_t v32 = [v30 alignment];
          uint64_t v33 = [v14 indent];
          __int16 v34 = [v30 options];
          if (i) {
            double v35 = 0.0;
          }
          else {
            double v35 = 11.0;
          }
          uint64_t v36 = (void *)[v31 initWithTextAlignment:v32 location:v34 options:v35 + (double)(unint64_t)(i + v33) * 36.0];

          [v27 replaceObjectAtIndex:i withObject:v36];
        }
      }
      [v72 setTabStops:v27];
      [v72 setTextLists:v11];
      unint64_t v38 = v82;
      uint64_t v37 = v83;
      if (a8 && v82 < v83 + v82)
      {
        do
        {
          NSRange v39 = objc_msgSend((id)v85[5], "attribute:atIndex:effectiveRange:", *MEMORY[0x1E4F83578], v38, 0, v37);
          uint64_t v40 = [v39 unsignedIntegerValue];

          uint64_t v41 = NSString;
          if (v75)
          {
            uint64_t v42 = objc_msgSend(&stru_1F0973378, "stringByPaddingToLength:withString:startingAtIndex:", 4 * objc_msgSend(v14, "indent"), @" ", 0);
            uint64_t v43 = [v76 markerForItemNumber:v40];
            id v44 = [v41 stringWithFormat:@"%@%@ ", v42, v43];
          }
          else
          {
            uint64_t v42 = [v76 markerForItemNumber:v40];
            id v44 = [v41 stringWithFormat:@"\t%@\t", v42];
          }

          id v45 = [(id)v85[5] attribute:v74 atIndex:v38 effectiveRange:0];
          long long v46 = +[ICTTTextStorage bulletTextAttributesWithTextFont:v45 paragraphStyle:v14 zoomFactor:1.0];
          long long v47 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v44 attributes:v46];
          id v48 = [(id)v85[5] string];
          uint64_t v49 = objc_msgSend(v48, "paragraphRangeForRange:", v38, 0);
          unint64_t v38 = v50;

          int v51 = v73;
          if (v49) {
            int v51 = 1;
          }
          if (v51 == 1)
          {
            objc_msgSend((id)v85[5], "replaceCharactersInRange:withAttributedString:", v49, 0, v47);
            uint64_t v52 = [v44 length];
            v83 += v52;
            v38 += v49 + [v44 length];
          }
          else
          {
            uint64_t v53 = v82 - v38 + v83;
            unint64_t v82 = v38;
            uint64_t v83 = v53;
          }

          uint64_t v37 = v83;
        }
        while (v38 < v83 + v82);
        unint64_t v38 = v82;
      }
      objc_msgSend((id)v85[5], "addAttribute:value:range:", v69, v72, v38, v37);
    }
    else
    {
      [v11 removeAllObjects];
    }
    unint64_t v54 = v82;
    uint64_t v55 = v83;

    unint64_t v13 = v55 + v54;
  }
  v56 = (void *)v85[5];
  uint64_t v57 = *MEMORY[0x1E4F83218];
  uint64_t v58 = [v56 length];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke;
  v81[3] = &unk_1E5FDA328;
  v81[4] = &v84;
  objc_msgSend(v56, "enumerateAttribute:inRange:options:usingBlock:", v57, 0, v58, 0, v81);
  if (v66)
  {
    [a1 fixAttachmentsForRenderingInAttributedString:v85[5] forPlainText:v75 forStandardizedText:v65];
    v59 = [MEMORY[0x1E4F83428] sharedContext];
    v60 = [v59 workerManagedObjectContext];

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke_2;
    v78[3] = &unk_1E5FD91F8;
    v80 = &v84;
    id v61 = v60;
    id v79 = v61;
    [v61 performBlockAndWait:v78];
  }
  id v62 = (id)v85[5];

  _Block_object_dispose(&v84, 8);
  return v62;
}

uint64_t __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return objc_msgSend(*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40), "removeAttribute:range:", *MEMORY[0x1E4FB0700], a3, a4);
  }
  return result;
}

void __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(void *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (_NSRange)safeCharacterRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(ICTTTextStorage *)self length];
  if (v5 == location)
  {
    NSUInteger v6 = 0;
LABEL_5:
    NSUInteger v8 = location;
    goto LABEL_9;
  }
  v7.NSUInteger length = v5;
  if (v5 < location)
  {
    NSUInteger v6 = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_5;
  }
  v9.NSUInteger location = location;
  v9.NSUInteger length = length;
  v7.NSUInteger location = 0;
  NSRange v10 = NSIntersectionRange(v9, v7);
  NSUInteger v6 = v10.length;
  NSUInteger v8 = v10.location;
LABEL_9:
  result.NSUInteger length = v6;
  result.NSUInteger location = v8;
  return result;
}

- (unint64_t)attributeOptions
{
  unint64_t v3 = [(ICTTTextStorage *)self convertAttributes];
  if ([(ICTTTextStorage *)self filterPastedAttributes]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (void)setAttributeOptions:(unint64_t)a3
{
  [(ICTTTextStorage *)self setConvertAttributes:a3 & 1];
  [(ICTTTextStorage *)self setFilterPastedAttributes:(a3 >> 1) & 1];
}

- (void)editWithAttributeOptions:(unint64_t)a3 usingBlock:(id)a4
{
  NSUInteger v6 = (void (**)(void))a4;
  unint64_t v7 = [(ICTTTextStorage *)self attributeOptions];
  [(ICTTTextStorage *)self beginEditing];
  [(ICTTTextStorage *)self setAttributeOptions:a3];
  v6[2](v6);

  [(ICTTTextStorage *)self endEditing];
  [(ICTTTextStorage *)self setAttributeOptions:v7];
}

- (id)itemProviderForRange:(_NSRange)a3 andNote:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  NSUInteger v8 = -[ICTTTextStorageWithRange initWithTextStorage:range:note:]([ICTTTextStorageWithRange alloc], "initWithTextStorage:range:note:", self, location, length, v7);

  NSRange v9 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v8];
  [(ICTTTextStorageWithRange *)v8 prepareTextStorage];

  return v9;
}

- (ICTTTextStorage)initWithData:(id)a3 replicaID:(id)a4
{
  NSUInteger v6 = (objc_class *)MEMORY[0x1E4F834D8];
  id v7 = a4;
  id v8 = a3;
  NSRange v9 = (void *)[[v6 alloc] initWithData:v8 replicaID:v7];

  NSRange v10 = [(ICTTTextStorage *)self initWithDocument:v9];
  return v10;
}

- (NSUUID)replicaID
{
  uint64_t v2 = [(ICTTTextStorage *)self document];
  unint64_t v3 = [v2 replicaID];

  return (NSUUID *)v3;
}

- (void)handleDidUndoRedoNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(ICTTTextStorage *)self isEditingViaWritingTools])
  {
    BOOL v4 = [(ICTTTextStorage *)self undoCommands];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      NSUInteger v6 = [(ICTTTextStorage *)self textViews];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v10++) _customUndoManagerDidFinishUndoRedoChanges];
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)restoreAttributedString:(id)a3
{
  p_attributedString = &self->_attributedString;
  objc_storeStrong((id *)&self->_attributedString, a3);
  id v6 = a3;
  uint64_t v7 = *p_attributedString;
  uint64_t v8 = *MEMORY[0x1E4F83238];
  uint64_t v9 = [(NSMutableAttributedString *)v7 ic_range];
  -[NSMutableAttributedString removeAttribute:range:](v7, "removeAttribute:range:", v8, v9, v10);

  [(ICTTTextStorage *)self resetHighlightsAttributedString];
}

- (void)editedRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
}

- (void)editedAttributeRange:(_NSRange)a3
{
}

- (_NSRange)logicalRangeForLocation:(unint64_t)a3
{
  NSUInteger v3 = [(ICTTTextStorage *)self length];
  NSUInteger v4 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v4;
  return result;
}

- (id)paragraphUUIDsInRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "set", 0x7FFFFFFFFFFFFFFFLL, a3.length);
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v8 = v7;
    uint64_t v9 = *MEMORY[0x1E4F83220];
    if (length)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __41__ICTTTextStorage_paragraphUUIDsInRange___block_invoke;
      v14[3] = &unk_1E5FDA3C8;
      id v15 = v7;
      -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v14);
    }
    else
    {
      uint64_t v10 = [(ICTTTextStorage *)self attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];
      objc_opt_class();
      long long v11 = ICDynamicCast();
      long long v12 = [v11 uuid];
      objc_msgSend(v8, "ic_addNonNilObject:", v12);
    }
    NSUInteger v3 = (void *)[v8 copy];
  }
  return v3;
}

void __41__ICTTTextStorage_paragraphUUIDsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  NSUInteger v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v6 uuid];
  objc_msgSend(v4, "ic_addNonNilObject:", v5);
}

- (ICTTTextUndoTarget)undoTarget
{
  id v3 = [(ICTTTextStorage *)self overrideUndoTarget];
  NSUInteger v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  uint64_t v5 = v3;

  return v5;
}

- (void)addUndoCommand:(id)a3
{
  id v4 = a3;
  [(ICTTTextStorage *)self beginEditing];
  [(NSMutableArray *)self->_undoCommands addObject:v4];

  [(ICTTTextStorage *)self endEditing];
}

- (void)applyUndoGroup:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__ICTTTextStorage_applyUndoGroup___block_invoke;
  v6[3] = &unk_1E5FD91D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICTTTextStorage *)self applyUndoWithBlock:v6];
}

void __34__ICTTTextStorage_applyUndoGroup___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 208) mergeableString];
  [v2 applyUndoCommand:*(void *)(a1 + 40)];
}

- (void)applyUndoWithBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = (void (**)(void))a3;
  id v4 = [(ICTTTextStorage *)self styler];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICTTTextStorage *)self styler];
    [v6 setDisableAddingExtraLinesIfNeeded:1];
  }
  [(ICTTTextStorage *)self setIsApplyingUndoCommand:1];
  [(ICTTTextStorage *)self breakUndoCoalescing];
  id v7 = [(ICTTTextStorage *)self writingToolsSessionUUID];

  uint64_t v8 = &off_1B0B98000;
  if (v7)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v9 = [(ICTTTextStorage *)self textViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v15 = [(ICTTTextStorage *)self writingToolsSessionUUID];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __38__ICTTTextStorage_applyUndoWithBlock___block_invoke;
          v29[3] = &unk_1E5FDB7F8;
          v29[4] = self;
          char v30 = v26;
          [v14 _performExternalEditsForWritingToolsSessionIdentifier:v15 action:1 usingBlock:v29];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
    }

    uint64_t v8 = &off_1B0B98000;
  }
  else
  {
    [(ICTTTextStorage *)self beginEditing];
    v26[2]();
    [(ICTTTextStorage *)self endEditing];
  }
  uint64_t v16 = [(ICTTTextStorage *)self ttEditedRange];
  uint64_t v18 = v17;
  [(ICTTTextStorage *)self setPendingFixupAfterEditing:1];
  [(ICTTTextStorage *)self fixupAfterEditing];
  [(ICTTTextStorage *)self breakUndoCoalescing];
  uint64_t v19 = [(ICTTTextStorage *)self textViews];
  v28[0] = MEMORY[0x1E4F143A8];
  uint64_t v20 = *((void *)v8 + 232);
  v28[1] = v20;
  void v28[2] = __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_2;
  v28[3] = &unk_1E5FDB820;
  void v28[4] = self;
  v28[5] = v16;
  v28[6] = v18;
  [v19 enumerateObjectsUsingBlock:v28];

  [(ICTTTextStorage *)self setIsApplyingUndoCommand:0];
  id v21 = [(ICTTTextStorage *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v21 textStorageDidPerformUndo:self];
  }
  uint64_t v22 = [(ICTTTextStorage *)self styler];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    BOOL v24 = [(ICTTTextStorage *)self styler];
    [v24 setDisableAddingExtraLinesIfNeeded:0];
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0 && v16 + v18 <= [(ICTTTextStorage *)self length])
  {
    uint64_t v25 = *MEMORY[0x1E4FB06B8];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = v20;
    v27[2] = __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_3;
    v27[3] = &unk_1E5FDA3C8;
    v27[4] = self;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v25, v16, v18, 0, v27);
  }
}

uint64_t __38__ICTTTextStorage_applyUndoWithBlock___block_invoke(uint64_t a1)
{
  return 1;
}

void __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isFirstResponder] & 1) == 0
    && [v5 canBecomeFirstResponder]
    && [v5 isEditable])
  {
    [v5 becomeFirstResponder];
  }
  objc_opt_class();
  id v3 = [*(id *)(a1 + 32) styler];
  id v4 = ICDynamicCast();
  [v4 refreshTypingAttributesForTextView:v5 textStorage:*(void *)(a1 + 32)];

  objc_msgSend(v5, "setSelectedRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "layoutManagers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)newCoalescingUndoGroup
{
  return objc_alloc_init(MEMORY[0x1E4F834D0]);
}

- (void)breakUndoCoalescing
{
  if (![(ICTTTextStorage *)self disableUndoCoalesceBreaking])
  {
    id v3 = [(ICTTTextStorage *)self coalescingUndoGroup];
    [v3 closeGroup];

    [(ICTTTextStorage *)self setCoalescingUndoGroup:0];
  }
}

- (void)resetUndoManager
{
  if ([(ICTTTextStorage *)self disableUndoCoalesceBreaking]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.disableUndoCoalesceBreaking == __objc_no" functionName:"-[ICTTTextStorage resetUndoManager]" simulateCrash:1 showAlert:0 format:@"We shouldn't get here when disableUndoCoalesceBreaking == YES"];
  }
  id v3 = [(ICTTTextStorage *)self undoManager];
  [v3 removeAllActions];

  id v4 = [(ICTTTextStorage *)self coalescingUndoGroup];
  [v4 closeGroup];

  [(ICTTTextStorage *)self setCoalescingUndoGroup:0];
  [(ICTTTextStorage *)self setIsPerformingAccessibilityUndoableTextInsertion:0];
}

- (BOOL)mergeableStringIsEqualAfterSerialization:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTTextStorage *)self mergeableString];

  if (v5 == v4)
  {
    char v44 = 1;
  }
  else
  {
    id v6 = [(ICTTTextStorage *)self mergeableString];
    uint64_t v7 = [v6 attributedString];
    uint64_t v8 = [v7 string];
    uint64_t v9 = [v4 attributedString];
    uint64_t v10 = [v9 string];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      id v48 = v4;
      long long v46 = self;
      long long v12 = [(ICTTTextStorage *)self mergeableString];
      long long v13 = [v12 attributedString];
      unint64_t v49 = [v13 length];

      long long v14 = 0;
      id v15 = 0;
      unint64_t v16 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v17 = *MEMORY[0x1E4FB06B8];
      char v47 = 1;
      uint64_t v18 = (void *)MEMORY[0x1E4F83220];
      do
      {
        if (v16 >= v49) {
          break;
        }
        if (v16 >= v52 + v53)
        {
          uint64_t v19 = [(ICTTTextStorage *)v46 mergeableString];
          uint64_t v20 = [v19 attributedString];
          id v21 = [v20 attributesAtIndex:v16 effectiveRange:&v52];
          uint64_t v22 = [v21 mutableCopy];

          id v15 = (void *)v22;
        }
        if (v16 >= v50 + v51)
        {
          char v23 = [v48 attributedString];
          BOOL v24 = [v23 attributesAtIndex:v16 effectiveRange:&v50];
          uint64_t v25 = [v24 mutableCopy];

          long long v14 = (void *)v25;
        }
        uint64_t v26 = [v15 objectForKeyedSubscript:*v18];
        char v27 = (void *)[v26 mutableCopy];

        uint64_t v28 = [v14 objectForKeyedSubscript:*v18];
        objc_super v29 = (void *)[v28 mutableCopy];

        [v27 setNeedsParagraphCleanup:0];
        [v27 setNeedsListCleanup:0];
        [v29 setNeedsParagraphCleanup:0];
        [v29 setNeedsListCleanup:0];
        char v30 = [MEMORY[0x1E4F29128] UUID];
        long long v31 = [v27 todo];

        if (v31)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F83508]);
          long long v33 = [v27 todo];
          long long v34 = objc_msgSend(v32, "initWithIdentifier:done:", v30, objc_msgSend(v33, "done"));
          [v27 setTodo:v34];
        }
        double v35 = [v29 todo];

        if (v35)
        {
          id v36 = objc_alloc(MEMORY[0x1E4F83508]);
          uint64_t v37 = [v29 todo];
          unint64_t v38 = objc_msgSend(v36, "initWithIdentifier:done:", v30, objc_msgSend(v37, "done"));
          [v29 setTodo:v38];
        }
        [v15 setObject:v27 forKeyedSubscript:*v18];
        [v14 setObject:v29 forKeyedSubscript:*v18];
        id v39 = objc_alloc_init(MEMORY[0x1E4FB0870]);
        uint64_t v40 = [v15 objectForKeyedSubscript:v17];

        if (v40) {
          [v15 setObject:v39 forKeyedSubscript:v17];
        }
        uint64_t v41 = [v14 objectForKeyedSubscript:v17];

        if (v41) {
          [v14 setObject:v39 forKeyedSubscript:v17];
        }
        int v42 = [v15 isEqualToDictionary:v14];
        char v43 = v42;
        if (v42) {
          unint64_t v16 = v50 + v51 >= (unint64_t)(v52 + v53) ? v52 + v53 : v50 + v51;
        }
        else {
          char v47 = 0;
        }
      }
      while ((v43 & 1) != 0);

      id v4 = v48;
      char v44 = v47;
    }
    else
    {
      char v44 = 0;
    }
  }

  return v44 & 1;
}

- (void)removeTextLayoutManager:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F83800];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithObject:v5];

  id v6 = [(ICTTTextStorage *)self textLayoutManagerReferences];
  [v6 removeObject:v7];
}

id __28__ICTTTextStorage_textViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 textContainers];
  id v3 = objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_154);

  return v3;
}

id __28__ICTTTextStorage_textViews__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 textView];

  id v4 = [v3 superview];
  id v5 = ICDynamicCast();

  return v5;
}

- (id)editAtIndex:(unint64_t)a3
{
  id v4 = [(ICTTTextStorage *)self mergeableString];
  id v5 = [v4 editAtIndex:a3];

  return v5;
}

- (void)redactAuthorAttributionsToCurrentUser
{
  [(ICTTTextStorage *)self setWantsUndoCommands:0];
  id v9 = (id)[(ICTTTextStorage *)self mutableCopy];
  uint64_t v3 = *MEMORY[0x1E4F83238];
  id v4 = [(ICTTTextStorage *)self currentTimestamp];
  uint64_t v5 = objc_msgSend(v9, "ic_range");
  objc_msgSend(v9, "addAttribute:value:range:", v3, v4, v5, v6);

  uint64_t v7 = objc_msgSend(v9, "ic_range");
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", v7, v8, v9);
  [(ICTTTextStorage *)self setWantsUndoCommands:1];
}

- (unint64_t)mergeWithDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTTTextStorage *)self savedSelectionWithSelectionAffinity:0];
  uint64_t v6 = [(ICTTTextStorage *)self document];
  unint64_t v7 = [v6 mergeWithStringVersionedDocument:v4];

  [(ICTTTextStorage *)self restoreSelection:v5];
  return v7;
}

- (void)replaceWithDocument:(id)a3
{
  id v4 = (ICTTMergeableStringVersionedDocument *)a3;
  uint64_t v5 = [(NSMutableAttributedString *)self->_attributedString length];
  uint64_t v6 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
  [v6 setDelegate:0];

  document = self->_document;
  self->_document = v4;
  uint64_t v8 = v4;

  id v9 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
  [v9 setDelegate:self];

  uint64_t v10 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
  int v11 = [v10 attributedString];
  long long v12 = (NSMutableAttributedString *)[v11 mutableCopy];
  attributedString = self->_attributedString;
  self->_attributedString = v12;

  long long v14 = self->_attributedString;
  uint64_t v15 = *MEMORY[0x1E4F83238];
  uint64_t v16 = [(NSMutableAttributedString *)v14 ic_range];
  -[NSMutableAttributedString removeAttribute:range:](v14, "removeAttribute:range:", v15, v16, v17);
  [(ICTTTextStorage *)self resetHighlightsAttributedString];
  uint64_t v18 = [(NSMutableAttributedString *)self->_attributedString length];
  v19.receiver = self;
  v19.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v19, sel_edited_range_changeInLength_, 3, 0, v5, v18 - v5);
}

- (void)setAttributedString:(id)a3
{
}

- (id)correctParagraphStyleReuseForRange:(_NSRange)a3 withNewAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  BOOL v8 = ![(ICTTTextStorage *)self hasEditedCharactersAfterTextSelection]
    && [(ICTTTextStorage *)self isTypingOrMarkingText];
  id v9 = [(ICTTTextStorage *)self string];
  uint64_t v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, length);
  uint64_t v12 = v11;

  uint64_t v13 = v10 + v12;
  if (v10 + v12) {
    BOOL v14 = v8;
  }
  else {
    BOOL v14 = 0;
  }
  if (v12 && v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v16 = [(ICTTTextStorage *)self string];
    int v17 = objc_msgSend(v15, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", v13 - 1));

    if (!v17 || v12 != 1) {
      goto LABEL_16;
    }
  }
  else if (!v14)
  {
    goto LABEL_16;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  char v27 = __Block_byref_object_copy__35;
  uint64_t v28 = __Block_byref_object_dispose__35;
  id v29 = 0;
  uint64_t v18 = [(ICTTTextStorage *)self textViews];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__ICTTTextStorage_correctParagraphStyleReuseForRange_withNewAttributedString___block_invoke;
  v23[3] = &unk_1E5FDB8C8;
  v23[4] = &v24;
  [v18 enumerateObjectsUsingBlock:v23];

  if (v25[5])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v20 = [v7 string];
    uint64_t v21 = [v19 initWithString:v20 attributes:v25[5]];

    id v7 = (id)v21;
  }
  _Block_object_dispose(&v24, 8);

LABEL_16:
  return v7;
}

uint64_t __78__ICTTTextStorage_correctParagraphStyleReuseForRange_withNewAttributedString___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 typingAttributes];
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    *a3 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (void)dd_resetResults
{
  [(ICTTTextStorage *)self beginTemporaryAttributes];
  uint64_t v3 = *MEMORY[0x1E4F5F118];
  unint64_t v4 = [(ICTTTextStorage *)self length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__ICTTTextStorage_dd_resetResults__block_invoke;
  v10[3] = &unk_1E5FDA3C8;
  v10[4] = self;
  -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v10);
  v9.receiver = self;
  v9.super_class = (Class)ICTTTextStorage;
  [(ICTTTextStorage *)&v9 dd_resetResults];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  unint64_t v6 = [(ICTTTextStorage *)self length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__ICTTTextStorage_dd_resetResults__block_invoke_2;
  v8[3] = &unk_1E5FD96F8;
  void v8[4] = self;
  -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v8);
  [(ICTTTextStorage *)self endTemporaryAttributes];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"ICTTTextStorageDidUpdateDataDetectionResultsNotification" object:self];
}

uint64_t __34__ICTTTextStorage_dd_resetResults__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = result;
    id v7 = *(void **)(result + 32);
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    objc_super v9 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a3, a4);

    uint64_t v10 = *(void **)(v6 + 32);
    uint64_t v11 = *MEMORY[0x1E4F83588];
    uint64_t v12 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);

    uint64_t v13 = *(void **)(v6 + 32);
    uint64_t v14 = *MEMORY[0x1E4FB0800];
    return objc_msgSend(v13, "removeAttribute:range:", v14, a3, a4);
  }
  return result;
}

void __34__ICTTTextStorage_dd_resetResults__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    uint64_t v10 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    objc_msgSend(v8, "addAttribute:value:range:", v9, v10, a3, a4);

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *MEMORY[0x1E4F83588];
    id v13 = [MEMORY[0x1E4FB1618] preferredDefaultFontColor];
    objc_msgSend(v11, "addAttribute:value:range:", v12, v13, a3, a4);
  }
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if ([v7 isEqualToString:*MEMORY[0x1E4F835D8]])
  {
    if (-[ICTTTextStorage ic_containsAttribute:inRange:](self, "ic_containsAttribute:inRange:", v7, location, length))
    {
      [(ICTTTextStorage *)self beginTemporaryAttributes];
      v8.receiver = self;
      v8.super_class = (Class)ICTTTextStorage;
      -[ICTTTextStorage removeAttribute:range:](&v8, sel_removeAttribute_range_, v7, location, length);
      [(ICTTTextStorage *)self endTemporaryAttributes];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage removeAttribute:range:](&v8, sel_removeAttribute_range_, v7, location, length);
  }
}

void __39__ICTTTextStorage_setAttributes_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v11 = (id)[v7 mutableCopy];
  [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F83238]];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 208) mergeableString];
  uint64_t v10 = (void *)[v11 copy];
  objc_msgSend(v9, "setAttributes:range:", v10, a3, a4);
}

- (BOOL)isEditing
{
  return [(ICTTTextStorage *)self editingCount] != 0;
}

- (BOOL)hasNamedStyle:(unsigned int)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v8 = [(ICTTTextStorage *)self string];
  int v9 = objc_msgSend(v8, "ic_rangeIsValid:", location, length);

  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F83220];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__ICTTTextStorage_hasNamedStyle_inRange___block_invoke;
    v13[3] = &unk_1E5FDB968;
    unsigned int v14 = a3;
    void v13[4] = &v15;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v13);
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __41__ICTTTextStorage_hasNamedStyle_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 style] == *(_DWORD *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)isRightToLeftAtIndex:(int64_t)a3
{
  uint64_t v3 = [(ICTTTextStorage *)self attribute:*MEMORY[0x1E4F83220] atIndex:a3 effectiveRange:0];
  objc_opt_class();
  uint64_t v4 = ICDynamicCast();
  char v5 = [v4 isRTL];

  return v5;
}

- (NSNumber)currentTimestamp
{
  id v2 = [(ICTTTextStorage *)self now];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] now];
  }
  char v5 = v4;

  uint64_t v6 = NSNumber;
  id v7 = objc_msgSend(v5, "ic_truncated");
  [v7 timeIntervalSince1970];
  id v8 = objc_msgSend(v6, "numberWithDouble:");

  return (NSNumber *)v8;
}

- (void)setTimestamp:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_msgSend(a3, "ic_truncated");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v11.NSUInteger location = [(NSMutableAttributedString *)self->_attributedString ic_range];
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  NSRange v7 = NSIntersectionRange(v11, v12);
  if (v7.length)
  {
    self->_directlyEditing = 1;
    [(ICTTTextStorage *)self beginSkippingTimestampUpdates];
    [(ICTTTextStorage *)self beginEditing];
    id v8 = [(ICTTMergeableStringVersionedDocument *)self->_document mergeableString];
    objc_msgSend(v8, "setTimestamp:range:", v9, v7.location, v7.length);

    -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, v7.location, v7.length, 0);
    [(ICTTTextStorage *)self endEditing];
    [(ICTTTextStorage *)self endSkippingTimestampUpdates];
    self->_directlyEditing = 0;
  }
}

- (ICOutlineController)outlineController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineController);
  return (ICOutlineController *)WeakRetained;
}

- (void)setUndoManager:(id)a3
{
}

- (ICTTTextUndoTarget)overrideUndoTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideUndoTarget);
  return (ICTTTextUndoTarget *)WeakRetained;
}

- (void)setOverrideUndoTarget:(id)a3
{
}

- (BOOL)shouldInhibitAddingExtraNewlinesAtEndDuringFixup
{
  return self->_shouldInhibitAddingExtraNewlinesAtEndDuringFixup;
}

- (void)setShouldInhibitAddingExtraNewlinesAtEndDuringFixup:(BOOL)a3
{
  self->_shouldInhibitAddingExtraNewlinesAtEndDuringFixup = a3;
}

- (NSMutableArray)deletedRanges
{
  return self->_deletedRanges;
}

- (BOOL)convertAttributes
{
  return self->_convertAttributes;
}

- (void)setConvertAttributes:(BOOL)a3
{
  self->_convertAttributes = a3;
}

- (BOOL)shouldConvertTablesToTabs
{
  return self->_shouldConvertTablesToTabs;
}

- (void)setShouldConvertTablesToTabs:(BOOL)a3
{
  self->_shouldConvertTablesToTabs = a3;
}

- (NSArray)pasteboardTypes
{
  return self->_pasteboardTypes;
}

- (void)setPasteboardTypes:(id)a3
{
}

- (BOOL)retainOriginalFormatting
{
  return self->_retainOriginalFormatting;
}

- (void)setRetainOriginalFormatting:(BOOL)a3
{
  self->_retainOriginalFormatting = a3;
}

- (void)setFilterSubstringAttributes:(BOOL)a3
{
  self->_filterSubstringAttributes = a3;
}

- (BOOL)filterPastedAttributes
{
  return self->_filterPastedAttributes;
}

- (void)setFilterPastedAttributes:(BOOL)a3
{
  self->_filterPastedAttributes = a3;
}

- (BOOL)filterSubstringAttributesForPlainText
{
  return self->_filterSubstringAttributesForPlainText;
}

- (void)setFilterSubstringAttributesForPlainText:(BOOL)a3
{
  self->_filterSubstringAttributesForPlainText = a3;
}

- (void)setIsEditingTemporaryAttributes:(BOOL)a3
{
  self->_isEditingTemporaryAttributes = a3;
}

- (BOOL)disableUndoCoalesceBreaking
{
  return self->_disableUndoCoalesceBreaking;
}

- (BOOL)isPerformingAccessibilityUndoableTextInsertion
{
  return self->_isPerformingAccessibilityUndoableTextInsertion;
}

- (void)setIsPerformingAccessibilityUndoableTextInsertion:(BOOL)a3
{
  self->_isPerformingAccessibilityUndoableTextInsertion = a3;
}

- (BOOL)isHandlingTextCheckingResults
{
  return self->_isHandlingTextCheckingResults;
}

- (void)setIsHandlingTextCheckingResults:(BOOL)a3
{
  self->_isHandlingTextCheckingResults = a3;
}

- (void)setIsTypingOrMarkingText:(BOOL)a3
{
  self->_isTypingOrMarkingText = a3;
}

- (void)setIsSelectingText:(BOOL)a3
{
  self->_isSelectingText = a3;
}

- (BOOL)hasEditedCharactersAfterTextSelection
{
  return self->_hasEditedCharactersAfterTextSelection;
}

- (void)setHasEditedCharactersAfterTextSelection:(BOOL)a3
{
  self->_hasEditedCharactersAfterTextSelection = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (void)setIsDropping:(BOOL)a3
{
  self->_isDropping = a3;
}

- (void)setIsResettingBaseWritingDirection:(BOOL)a3
{
  self->_isResettingBaseWritingDirection = a3;
}

- (BOOL)isReadingSelectionFromPasteboard
{
  return self->_isReadingSelectionFromPasteboard;
}

- (void)setIsReadingSelectionFromPasteboard:(BOOL)a3
{
  self->_isReadingSelectionFromPasteboard = a3;
}

- (BOOL)isEditingViaWritingTools
{
  return self->_isEditingViaWritingTools;
}

- (void)setIsEditingViaWritingTools:(BOOL)a3
{
  self->_isEditingViaWritingTools = a3;
}

- (BOOL)isUndoCoalescingForWritingTools
{
  return self->_isUndoCoalescingForWritingTools;
}

- (void)setIsUndoCoalescingForWritingTools:(BOOL)a3
{
  self->_isUndoCoalescingForWritingTools = a3;
}

- (NSUUID)writingToolsSessionUUID
{
  return self->_writingToolsSessionUUID;
}

- (void)setWritingToolsSessionUUID:(id)a3
{
}

- (BOOL)isMarkingTextForHeadingRename
{
  return self->_isMarkingTextForHeadingRename;
}

- (void)setIsMarkingTextForHeadingRename:(BOOL)a3
{
  self->_isMarkingTextForHeadingRename = a3;
}

- (BOOL)shouldRemoveLeadingWhitespaceForChecklistDrop
{
  return self->_shouldRemoveLeadingWhitespaceForChecklistDrop;
}

- (void)setShouldRemoveLeadingWhitespaceForChecklistDrop:(BOOL)a3
{
  self->_shouldRemoveLeadingWhitespaceForChecklistDrop = a3;
}

- (void)setIsApplyingUndoCommand:(BOOL)a3
{
  self->_isApplyingUndoCommand = a3;
}

- (void)setIsZombie:(BOOL)a3
{
  self->_isZombie = a3;
}

- (void)setUndoCommands:(id)a3
{
}

- (ICTTMergeableStringUndoGroup)coalescingUndoGroup
{
  return self->_coalescingUndoGroup;
}

- (void)setCoalescingUndoGroup:(id)a3
{
}

- (void)setTtEditedRange:(_NSRange)a3
{
  self->_ttEditedRange = a3;
}

- (void)setTtChangeInLength:(int64_t)a3
{
  self->_ttChangeInLength = a3;
}

- (void)setTextLayoutManagerReferences:(id)a3
{
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
}

- (void)setDirectlyEditing:(BOOL)a3
{
  self->_directlyEditing = a3;
}

- (BOOL)previouslyHadMarkedText
{
  return self->_previouslyHadMarkedText;
}

- (void)setPreviouslyHadMarkedText:(BOOL)a3
{
  self->_previouslyHadMarkedText = a3;
}

- (_NSRange)lastUndoEditRange
{
  p_lastUndoEditRange = &self->_lastUndoEditRange;
  NSUInteger location = self->_lastUndoEditRange.location;
  NSUInteger length = p_lastUndoEditRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastUndoEditRange:(_NSRange)a3
{
  self->_lastUndoEditRange = a3;
}

- (void)setCurrentTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimestamp, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_textLayoutManagerReferences, 0);
  objc_storeStrong((id *)&self->_coalescingUndoGroup, 0);
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_writingToolsSessionUUID, 0);
  objc_storeStrong((id *)&self->_pasteboardTypes, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_deletedRanges, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_destroyWeak((id *)&self->_overrideUndoTarget);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_outlineController);
  objc_storeStrong((id *)&self->_highlightsAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (id)customPasteboardDataFromRange:(_NSRange)a3 persistenceHelper:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(ICTTTextStorage *)self attributedString];
  id v9 = objc_msgSend(v8, "attributedSubstringFromRange:", location, length);

  uint64_t v10 = +[ICTextController removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:](ICTextController, "removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:", v9, self, location, length);

  NSRange v11 = objc_msgSend(v10, "ic_attributedStringByRefreshingParagraphStyleUUIDs");

  if (v7)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F83350]);
    id v13 = [v7 identifier];
    unsigned int v14 = (void *)[v12 initWithObjectIdentifier:v13 forPasteboard:1];
  }
  else
  {
    unsigned int v14 = 0;
  }
  uint64_t v15 = [v7 managedObjectContext];
  uint64_t v16 = objc_msgSend(v11, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v14, v15, 0);

  if (v16) {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F83438]) initWithAttributedStringData:v16 dataPersister:v14];
  }
  else {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)copyDataForUTI:(id)a3 range:(_NSRange)a4 persistenceHelper:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (![v9 isEqualToString:*MEMORY[0x1E4F83138]])
  {
    [(ICTTTextStorage *)self setFilterSubstringAttributes:1];
    id v13 = [(id)*MEMORY[0x1E4F443F0] identifier];
    int v14 = [v9 isEqualToString:v13];

    if (v14)
    {
      uint64_t v40 = *MEMORY[0x1E4FB06E0];
      v41[0] = *MEMORY[0x1E4FB0708];
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = (__CFString **)v41;
      uint64_t v17 = &v40;
    }
    else
    {
      char v18 = [(id)*MEMORY[0x1E4F44538] identifier];
      int v19 = [v9 isEqualToString:v18];

      if (v19)
      {
        uint64_t v38 = *MEMORY[0x1E4FB06E0];
        id v39 = ICWebArchiveTextDocumentType;
        uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v16 = &v39;
        uint64_t v17 = &v38;
      }
      else
      {
        uint64_t v20 = [(id)*MEMORY[0x1E4F444A0] identifier];
        int v21 = [v9 isEqualToString:v20];

        if (v21)
        {
          uint64_t v36 = *MEMORY[0x1E4FB06E0];
          uint64_t v37 = *MEMORY[0x1E4FB0750];
          uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v16 = (__CFString **)&v37;
          uint64_t v17 = &v36;
        }
        else
        {
          uint64_t v22 = [(id)*MEMORY[0x1E4F443C0] identifier];
          int v23 = [v9 isEqualToString:v22];

          if (!v23)
          {
            uint64_t v26 = [(id)*MEMORY[0x1E4F44510] identifier];
            int v27 = [v9 isEqualToString:v26];

            if (v27)
            {
              [(ICTTTextStorage *)self setFilterSubstringAttributesForPlainText:1];
              uint64_t v28 = *MEMORY[0x1E4FB0740];
              uint64_t v29 = *MEMORY[0x1E4FB06D0];
              v32[0] = *MEMORY[0x1E4FB06E0];
              v32[1] = v29;
              v33[0] = v28;
              v33[1] = &unk_1F09A45E0;
              char v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
              id v12 = -[ICTTTextStorage dataFromRange:documentAttributes:error:](self, "dataFromRange:documentAttributes:error:", location, length, v30, 0);

              [(ICTTTextStorage *)self setFilterSubstringAttributesForPlainText:0];
            }
            else
            {
              long long v31 = -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", location, length);
              id v12 = objc_msgSend(v31, "ic_itemProviderDataForUTI:", v9);
            }
            goto LABEL_12;
          }
          uint64_t v34 = *MEMORY[0x1E4FB06E0];
          uint64_t v35 = *MEMORY[0x1E4FB0748];
          uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v16 = (__CFString **)&v35;
          uint64_t v17 = &v34;
        }
      }
    }
    uint64_t v24 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    id v12 = -[ICTTTextStorage dataFromRange:documentAttributes:error:](self, "dataFromRange:documentAttributes:error:", location, length, v24, 0);

LABEL_12:
    [(ICTTTextStorage *)self setFilterSubstringAttributes:0];
    goto LABEL_13;
  }
  NSRange v11 = -[ICTTTextStorage customPasteboardDataFromRange:persistenceHelper:](self, "customPasteboardDataFromRange:persistenceHelper:", location, length, v10);
  id v12 = [v11 persistenceData];

LABEL_13:
  return v12;
}

- (id)filteredAttributedStringForUTI:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = (void *)*MEMORY[0x1E4F44510];
  id v8 = a3;
  id v9 = [v7 identifier];
  uint64_t v10 = [v8 isEqualToString:v9];

  [(ICTTTextStorage *)self setFilterSubstringAttributesForPlainText:v10];
  NSRange v11 = -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", location, length);
  [(ICTTTextStorage *)self setFilterSubstringAttributesForPlainText:0];
  return v11;
}

void __36__ICTTTextStorage_restoreSelection___block_invoke_cold_1(uint8_t *a1, NSRange range, void *a3, NSObject *a4)
{
  id v7 = NSStringFromRange(range);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1B08EB000, a4, OS_LOG_TYPE_ERROR, "corrected selRange: %@", a1, 0xCu);
}

void __36__ICTTTextStorage_restoreSelection___block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "ICTTTextStorage selection restoration error: selRange out of bounds of ICTTTextStorage. Clipping to the length of ICTTTextStorage", buf, 2u);
}

void __44__ICTTTextStorage_addAttribute_value_range___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Unable to lazy load DataDetectorsUI framework", v1, 2u);
}

@end