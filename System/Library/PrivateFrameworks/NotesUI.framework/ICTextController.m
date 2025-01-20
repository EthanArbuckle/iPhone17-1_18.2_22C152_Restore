@interface ICTextController
+ (BOOL)shouldRetainFirstListStyleForFilteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4;
+ (double)extraBulletWidthForNumberedListWithMaxItemNumber:(id)a3 textFont:(id)a4;
+ (double)extraWidthNeededForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6;
+ (double)indentForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6;
+ (id)attributedStringToPasteWithAdaptedParagraphStyles:(id)a3 pasteRange:(_NSRange)a4 textStorage:(id)a5;
+ (id)removeBeginningListStyleIfNecessaryForAttributedString:(id)a3 fromTextStorage:(id)a4 andRange:(_NSRange)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)p_setCellsInTable:(id)a3 fromAttributedString:(id)a4 textTable:(id)a5 atCellOffset:(id)a6 filterPastedAttributes:(BOOL)a7 isReadingSelectionFromPasteboard:(BOOL)a8;
- (BOOL)attachmentsExistInRange:(_NSRange)a3 textStorage:(id)a4;
- (BOOL)canAddToTagsInTextView:(id)a3 forRange:(_NSRange)a4;
- (BOOL)canChangeStyleForSelectedRanges:(id)a3 inTextStorage:(id)a4;
- (BOOL)canConvertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4;
- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4;
- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4 forRanges:(id)a5;
- (BOOL)containsOnlyStyle:(unsigned int)a3 inRange:(_NSRange)a4 inTextStorage:(id)a5;
- (BOOL)deleteBackwardForSpecialCasesInTextView:(id)a3;
- (BOOL)deleteWordBackwardForSpecialCasesInTextView:(id)a3;
- (BOOL)disableAddingExtraLinesIfNeeded;
- (BOOL)inlineAttachmentInTextView:(id)a3 atIndex:(unint64_t)a4 outAttachment:(id *)a5;
- (BOOL)insertNewlineForSpecialCasesInTextView:(id)a3;
- (BOOL)insertedSpaceInTextView:(id)a3 replacementRange:(_NSRange)a4;
- (BOOL)isAutoListInsertionDisabled;
- (BOOL)isConvertingTables;
- (BOOL)isForPrint;
- (BOOL)isTodoDoneRange:(_NSRange)a3 inTextStorage:(id)a4;
- (BOOL)removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:(id)a3 textStorage:(id)a4 rangeToBeDeleted:(_NSRange)a5 blockBeforeEndEditing:(id)a6;
- (BOOL)removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:(id)a3 textStorage:(id)a4 paragraphRange:(_NSRange)a5 andLocation:(unint64_t)a6;
- (BOOL)selectionContainsBlockQuoteAndOthers:(id)a3;
- (BOOL)setDone:(BOOL)a3 range:(_NSRange)a4 inTextStorage:(id)a5;
- (BOOL)shouldHighlightStyleAsLink:(unsigned int)a3;
- (BOOL)shouldMergeNoteAfterScrolling;
- (BOOL)shouldUpdateIndentFor:(id)a3;
- (BOOL)trackAddedExtraNewlineRanges;
- (BOOL)userChangedWritingDirection;
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICAuthorHighlightsController)authorHighlightsController;
- (ICHashtagController)hashtagController;
- (ICMentionsController)mentionsController;
- (ICNote)note;
- (ICTTTextStorage)emptyTextStorage;
- (ICTextController)init;
- (NSMutableArray)trackedRangesForAddedExtraNewlines;
- (NSMutableDictionary)trackedToDoParagraphs;
- (_NSRange)addExtraLinesIfNeededToTextStorage:(id)a3 editedRange:(_NSRange)a4 actualLengthIncrease:(int64_t *)a5;
- (_NSRange)cleanupTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 changeInLengthAfterCleanup:(int64_t *)a7;
- (_NSRange)extendedSelectionRangeForCollapsedSectionHeadingWithRange:(_NSRange)a3 textView:(id)a4;
- (_NSRange)firstParagraphForSetListStyleRange:(_NSRange)a3 inTextStorage:(id)a4;
- (_NSRange)numberListsInAttributedString:(id)a3 inRange:(_NSRange)a4;
- (id)addTableAttachmentWithNSTextTable:(id)a3 attributedString:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6;
- (id)indentParagraphStyle:(id)a3 byAmount:(int64_t)a4;
- (id)keyboardLanguageForTextView:(id)a3;
- (id)nsParagraphStyleForICTTParagraphStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6;
- (id)scaleFont:(id)a3 withScale:(double)a4;
- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5;
- (id)tabStopsForAttributedString:(id)a3 inRange:(_NSRange)a4;
- (id)todoForRange:(_NSRange)a3 inTextStorage:(id)a4;
- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5;
- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5 inTextView:(id)a6;
- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6;
- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6 inTextView:(id)a7;
- (int64_t)writingDirectionForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5;
- (unint64_t)overrideAppearanceType;
- (unint64_t)pauseMergeForScrollingCounter;
- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5;
- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5 ignoreTypingAttributes:(BOOL)a6;
- (void)addToTagsInTextView:(id)a3 forRange:(_NSRange)a4;
- (void)convertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4;
- (void)convertNSTablesToICTables:(id)a3 pasteboardTypes:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6;
- (void)createToDoItemForCharacterRange:(_NSRange)a3 paragraphStyle:(id)a4 textStorage:(id)a5;
- (void)ensureUniqueParagraphStyleUUIDsInTextStorage:(id)a3 range:(_NSRange)a4;
- (void)filterAttachmentsForPrintingInAttributedString:(id)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (void)fixModelAttributesInTextStorage:(id)a3 inRange:(_NSRange)a4;
- (void)fixTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6;
- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6 forceUpdateAttributes:(BOOL)a7;
- (void)insertNewlineAtCharacterIndex:(unint64_t)a3 textStorage:(id)a4;
- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 hashtagController:(id)a6 mentionsController:(id)a7 languageHasSpaces:(BOOL)a8 parentAttachment:(id)a9;
- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 languageHasSpaces:(BOOL)a6;
- (void)notifyInlineAttachmentsDeletedInRange:(_NSRange)a3 ofTextStorage:(id)a4;
- (void)p_populateTable:(id)a3 withNSTextTable:(id)a4 attributedString:(id)a5 filterPastedAttributes:(BOOL)a6 isReadingSelectionFromPasteboard:(BOOL)a7;
- (void)refreshTextStylingForTextStorage:(id)a3 withTextController:(id)a4;
- (void)refreshTypingAttributesForAllTextViewsOfTextStorage:(id)a3;
- (void)refreshTypingAttributesForTextView:(id)a3 textStorage:(id)a4;
- (void)removeFontsAndColorsForRange:(_NSRange)a3 inTextStorage:(id)a4;
- (void)resetTrackedToDoParagraphs;
- (void)scaleFontPointSize:(double)a3 range:(_NSRange)a4 inTextStorage:(id)a5;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setAuthorHighlightsController:(id)a3;
- (void)setDisableAddingExtraLinesIfNeeded:(BOOL)a3;
- (void)setEmptyTextStorage:(id)a3;
- (void)setHashtagController:(id)a3;
- (void)setIsAutoListInsertionDisabled:(BOOL)a3;
- (void)setIsConvertingTables:(BOOL)a3;
- (void)setIsForPrint:(BOOL)a3;
- (void)setMentionsController:(id)a3;
- (void)setNote:(id)a3;
- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5;
- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5 traitCollection:(id)a6 firstVisibleCharLocation:(unint64_t)a7;
- (void)setOverrideAppearanceType:(unint64_t)a3;
- (void)setParagraphWritingDirectionInRange:(_NSRange)a3 toDirection:(int64_t)a4 inTextView:(id)a5;
- (void)setPauseMergeForScrollingCounter:(unint64_t)a3;
- (void)setSelectionToIndex:(unint64_t)a3 onTextView:(id)a4;
- (void)setShouldMergeNoteAfterScrolling:(BOOL)a3;
- (void)setTrackAddedExtraNewlineRanges:(BOOL)a3;
- (void)setTrackedRangesForAddedExtraNewlines:(id)a3;
- (void)setTypingAttributesForUndo:(id)a3;
- (void)setTypingTextStyle:(unsigned int)a3 textView:(id)a4;
- (void)setUserChangedWritingDirection:(BOOL)a3;
- (void)styleDataDetectorTypesForPreviewInTextStorage:(id)a3;
- (void)styleListsAndIndentsInAttributedString:(id)a3 inRange:(_NSRange)a4;
- (void)superscriptDelta:(int64_t)a3 range:(_NSRange)a4 inTextStorage:(id)a5;
- (void)superscriptUpdate:(id)a3 range:(_NSRange)a4 inTextStorage:(id)a5;
- (void)toggleBlockQuoteInTextView:(id)a3;
- (void)trackExtraNewLineRangeIfNecessary:(_NSRange)a3;
- (void)uniqueParagraphStylesInTextStorage:(id)a3 inRange:(_NSRange)a4;
- (void)unscriptRange:(_NSRange)a3 inTextStorage:(id)a4;
- (void)updateAttachmentsInNote;
- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 layoutManager:(id)a5 textView:(id)a6;
- (void)updateCellInTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 fromAttributedString:(id)a6 andTextTableBlock:(id)a7 filterPastedAttributes:(BOOL)a8 isReadingSelectionFromPasteboard:(BOOL)a9;
- (void)updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:(_NSRange)a3 textStorage:(id)a4 textView:(id)a5;
- (void)updateTrackedAttributesInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)updateTrackedToDoParagraphsAfterIndex:(unint64_t)a3 byDelta:(int64_t)a4 excludingSeenParagraphs:(id)a5;
- (void)updateTrackingInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)workAroundSageTables:(id)a3;
@end

@implementation ICTextController

- (BOOL)isForPrint
{
  return self->_isForPrint;
}

- (int64_t)writingDirectionForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5
{
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = a5;
  if (location >= [v8 length])
  {
    v10 = [v7 typingAttributes];
    v9 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  }
  else
  {
    v9 = [v8 attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];
  }
  int64_t v11 = [v9 writingDirection];

  return v11;
}

- (_NSRange)addExtraLinesIfNeededToTextStorage:(id)a3 editedRange:(_NSRange)a4 actualLengthIncrease:(int64_t *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v70[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (location + length > [v8 length])
  {
    v74.NSUInteger length = [v8 length];
    v71.NSUInteger location = location;
    v71.NSUInteger length = length;
    v74.NSUInteger location = 0;
    NSRange v9 = NSIntersectionRange(v71, v74);
    NSUInteger location = v9.location;
    NSUInteger length = v9.length;
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICTextController addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:](v10);
    }
  }
  *a5 = 0;
  int64_t v11 = [v8 string];
  unint64_t v61 = objc_msgSend(v11, "paragraphRangeForRange:", location, length);
  NSUInteger v13 = v12;

  if ([v8 length])
  {
    NSUInteger v62 = v13;
    v57 = a5;
    v14 = [v8 string];
    uint64_t v15 = objc_msgSend(v14, "paragraphRangeForRange:", objc_msgSend(v8, "length"), 0);
    uint64_t v17 = v16;

    if (v17)
    {
      v18 = [v8 attribute:*MEMORY[0x1E4F83220] atIndex:v15 effectiveRange:0];
      v19 = v18;
      if (v18
        && [v18 wantsFollowingNewLine]
        && ([v8 shouldInhibitAddingExtraNewlinesAtEndDuringFixup] & 1) == 0)
      {
        uint64_t v20 = v15 + v17;
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
        objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v20, 0, v21);

        -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v20, 1);
      }
    }
    NSUInteger v59 = length;
    v68.NSUInteger location = 0;
    v68.NSUInteger length = 0;
    uint64_t v22 = objc_msgSend(v8, "length", location);
    v23 = [(ICTextController *)self note];
    int v58 = [v23 attachmentViewType];

    NSUInteger v24 = v61;
    if (v61 < [v8 length])
    {
      uint64_t v63 = *MEMORY[0x1E4FB06B8];
      NSUInteger v25 = v61;
      do
      {
        unint64_t v26 = v62 + v24;
        if (v25 > v62 + v24) {
          break;
        }
        objc_opt_class();
        v27 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", v63, v25, &v68, 0, v22);
        v28 = ICDynamicCast();

        v72.NSUInteger location = v24;
        v72.NSUInteger length = v62;
        NSUInteger v29 = NSIntersectionRange(v72, v68).length;
        objc_opt_class();
        v30 = ICDynamicCast();
        int v31 = PKIsInlineDrawingOrPaperAttachment();
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
        if (v30) {
          int v33 = 1;
        }
        else {
          int v33 = v31;
        }
        if (((v33 | isKindOfClass) & 1) != 0 && v29)
        {
          BOOL v34 = isKindOfClass;
          NSUInteger v66 = 0;
          NSUInteger v67 = 0;
          uint64_t v65 = 0;
          v35 = [v8 string];
          objc_msgSend(v35, "getParagraphStart:end:contentsEnd:forRange:", &v67, &v65, &v66, v68.location, v68.length);

          if (v30 && [v30 supportsMultipleThumbnailsOnSameLine] && v58 == 1)
          {
            NSUInteger v36 = v25 + 1;
            while (v36 < [v8 length])
            {
              v64.NSUInteger location = 0;
              v64.NSUInteger length = 0;
              v37 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", v63, v36, &v64, 0, v22);
              uint64_t v38 = objc_opt_class();
              if (v38 != objc_opt_class() || v64.location != v36)
              {

                break;
              }
              v75.NSUInteger length = v64.length;
              v75.NSUInteger location = v36;
              NSRange v68 = NSUnionRange(v68, v75);
              NSUInteger v36 = v68.length + v68.location;
            }
          }
          if (v66 > v68.length + v68.location || v65 == v66)
          {
            NSUInteger v24 = v61;
            if (!v34 && (v31 & 1) != 0)
            {
              NSUInteger v40 = v68.length + v68.location;
              BOOL v34 = v40 < [v8 length];
            }
            if (v30 || v34)
            {
              id v42 = objc_alloc(MEMORY[0x1E4F28B18]);
              uint64_t v69 = *MEMORY[0x1E4F83220];
              v43 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:3];
              v70[0] = v43;
              v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
              v45 = (void *)[v42 initWithString:@"\n" attributes:v44];

              [v8 insertAttributedString:v45 atIndex:v68.length + v68.location];
              -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v68.length + v68.location, 1);
              ++v68.length;
              if (v26 < [v8 length])
              {
                ++v62;
                ++v59;
                ++*v57;
              }
              ++v22;
            }
          }
          else
          {
            NSUInteger v24 = v61;
          }
          if (v67 < v68.location)
          {
            v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
            [v8 insertAttributedString:v46 atIndex:v68.location];

            -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v68.location++, 1);
            ++v22;
            if (v62 + v24 < [v8 length])
            {
              ++v62;
              ++v59;
              ++*v57;
            }
          }
          v64.NSUInteger location = 0;
          v64.NSUInteger length = 0;
          NSUInteger v48 = v68.location;
          NSUInteger v47 = v68.length;
          NSUInteger v49 = v68.length + v68.location;
          if (v49 >= [v8 length]) {
            NSUInteger v50 = v47;
          }
          else {
            NSUInteger v50 = 2;
          }
          v51 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F83220], v68.location, &v64, v48, v50);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if ([v51 style] != 3
              || (v76.NSUInteger location = v48, v76.length = v50, v52 = NSIntersectionRange(v64, v76), v52.location != v48)
              || v52.length != v50)
            {
              v53 = (void *)[v51 mutableCopy];
              objc_msgSend(v53, "setBlockQuoteLevel:", objc_msgSend(v51, "blockQuoteLevel"));
              objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4F83220], v53, v48, v50);
            }
          }
        }
        NSUInteger v25 = v68.length + v68.location;
      }
      while (v25 < [v8 length]);
    }
    NSUInteger length = v59;
    NSUInteger location = v56;
  }

  NSUInteger v54 = location;
  NSUInteger v55 = length;
  result.NSUInteger length = v55;
  result.NSUInteger location = v54;
  return result;
}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v17 = v7;
  if (a3 != a1[7]
    || ([v7 uuid], v8 = objc_claimAutoreleasedReturnValue(), v8, id v7 = v17, !v8))
  {
    NSRange v9 = (void *)[v7 mutableCopy];
    [v9 setUuid:a1[4]];
    v10 = (void *)[v9 copy];
    int64_t v11 = (void *)a1[5];
    NSUInteger v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v11 setObject:v10 forKeyedSubscript:v12];

    NSUInteger v13 = [v17 uuid];

    if (v13)
    {
      uint64_t v14 = a1[4];
      uint64_t v15 = (void *)a1[6];
      uint64_t v16 = [v17 uuid];
      [v15 setObject:v14 forKeyedSubscript:v16];
    }
    id v7 = v17;
  }
}

- (id)tabStopsForAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v38[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (length
    && ([v7 string],
        NSRange v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v9, "ic_rangeIsValid:", location, length),
        v9,
        v10))
  {
    int64_t v11 = [v8 attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];
    if ([v8 length])
    {
      NSUInteger v12 = [(ICTTTextController *)self zoomController];
      [v12 checklistZoomFactor];
      double v14 = v13;

      if (v14 < 1.0) {
        double v14 = 1.0;
      }
      double v15 = v14 * 22.0 + v14 * ((double)(unint64_t)[v11 indent] * 36.0);
      double v16 = v14 * 13.0 + v15;
      if ([v11 style] == 102)
      {
        id v17 = [v8 attribute:*MEMORY[0x1E4FB06F8] atIndex:location effectiveRange:0];
        v18 = [(ICTTTextController *)self zoomController];
        [v18 zoomFactor];
        v19 = +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v17, v11);

        uint64_t v20 = [v11 listBulletInAttributedString:v8 atIndex:location];
        v21 = [v8 attribute:*MEMORY[0x1E4F83540] atIndex:location effectiveRange:0];
        [(id)objc_opt_class() extraBulletWidthForNumberedListWithMaxItemNumber:v21 textFont:v17];
        double v23 = v22;
        double v15 = v15 + v22;
        if ((unint64_t)[v20 length] >= 2)
        {
          NSUInteger v24 = objc_msgSend(v20, "substringWithRange:", objc_msgSend(v20, "length") - 2, 1);
          objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, 1.79769313e308, 1.79769313e308);
          double v26 = v25;
          v27 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v20, "length") - 2);
          objc_msgSend(v27, "boundingRectWithSize:options:attributes:context:", 0, v19, 0, 1.79769313e308, 1.79769313e308);
          double v15 = v15 + v28 - v26;
        }
        double v16 = v16 + v23;
      }
      id v29 = objc_alloc(MEMORY[0x1E4FB08C0]);
      if ([v11 isRTL]) {
        uint64_t v30 = 0;
      }
      else {
        uint64_t v30 = 2;
      }
      uint64_t v31 = MEMORY[0x1E4F1CC08];
      v32 = (void *)[v29 initWithTextAlignment:v30 location:MEMORY[0x1E4F1CC08] options:v15];
      id v33 = objc_alloc(MEMORY[0x1E4FB08C0]);
      if ([v11 isRTL]) {
        uint64_t v34 = 2;
      }
      else {
        uint64_t v34 = 0;
      }
      v35 = (void *)[v33 initWithTextAlignment:v34 location:v31 options:v16];
      v38[0] = v32;
      v38[1] = v35;
      NSUInteger v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    }
    else
    {
      NSUInteger v36 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    NSUInteger v36 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v36;
}

void __58__ICTextController_numberListsInAttributedString_inRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  id v47 = v9;
  if (!v9 || ![v9 isList])
  {
    unint64_t v17 = a3 + a4;
    if (a3 >= a3 + a4)
    {
      unint64_t v19 = a3;
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4FB06B8];
      unint64_t v19 = a3;
      do
      {
        uint64_t v20 = [*(id *)(a1 + 32) string];
        uint64_t v21 = objc_msgSend(v20, "paragraphRangeForRange:", v19, 0);
        uint64_t v23 = v22;

        NSUInteger v24 = [*(id *)(a1 + 32) attribute:v18 atIndex:v19 effectiveRange:0];
        if (!v24) {
          break;
        }
        unint64_t v19 = v21 + v23;
      }
      while (v21 + v23 < v17);
    }
    if (v19 < v17)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeAllObjects];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:&unk_1F09A4370];
    }
    goto LABEL_21;
  }
  unint64_t v10 = [v47 indent] + 1;
  if (v10 > [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    do
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:&unk_1F09A4370];
      unint64_t v11 = [v47 indent] + 1;
    }
    while (v11 > [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]);
  }
  unint64_t v12 = [v47 indent] + 1;
  if (v12 < [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "removeObjectsInRange:", objc_msgSend(v47, "indent") + 1, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count") + ~objc_msgSend(v47, "indent"));
  }
  int v13 = [v47 style];
  double v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v13 != 102)
  {
    if ([v14 count]) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "replaceObjectAtIndex:withObject:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count") - 1, &unk_1F09A4370);
    }
LABEL_21:
    char v25 = 0;
    goto LABEL_22;
  }
  double v15 = [v14 lastObject];
  uint64_t v16 = [v15 unsignedIntegerValue];

  if (!v16)
  {
    if ([v47 startingItemNumber]) {
      uint64_t v16 = [v47 startingItemNumber];
    }
    else {
      uint64_t v16 = 1;
    }
  }
  v45 = a5;
  NSUInteger v27 = a3 + a4;
  if (a3 >= a3 + a4)
  {
    char v28 = 0;
  }
  else
  {
    char v28 = 0;
    id v29 = (uint64_t *)MEMORY[0x1E4F83578];
    NSUInteger v30 = a3;
    do
    {
      uint64_t v31 = objc_msgSend(*(id *)(a1 + 32), "string", v45);
      NSUInteger v32 = objc_msgSend(v31, "paragraphRangeForRange:", v30, 0);
      NSUInteger v34 = v33;

      v35 = [*(id *)(a1 + 32) attribute:*v29 atIndex:v30 effectiveRange:0];
      uint64_t v36 = [v35 unsignedIntegerValue];

      if (v16 != v36)
      {
        v37 = *(void **)(a1 + 32);
        uint64_t v38 = *v29;
        v39 = [NSNumber numberWithUnsignedInteger:v16];
        objc_msgSend(v37, "addAttribute:value:range:", v38, v39, v32, v34);

        v49.NSUInteger location = v32;
        v49.NSUInteger length = v34;
        *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 32), v49);
        char v28 = 1;
      }
      NSUInteger v40 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F83220] atIndex:v32 effectiveRange:0];
      if ([v40 startingItemNumber] && v16 != objc_msgSend(v40, "startingItemNumber"))
      {
        v41 = (void *)[v40 mutableCopy];
        [v41 setStartingItemNumber:0];
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4F83220], v41, v32, v34);
        v50.NSUInteger location = v32;
        v50.NSUInteger length = v34;
        *(NSRange *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = NSUnionRange(*(NSRange *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 32), v50);
      }
      ++v16;
      NSUInteger v30 = v32 + v34;
    }
    while (v32 + v34 < v27);
  }
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count", v45))
  {
    id v42 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v43 = [v42 count] - 1;
    v44 = [NSNumber numberWithUnsignedInteger:v16];
    [v42 replaceObjectAtIndex:v43 withObject:v44];
  }
  char v25 = v28 & 1;
  a5 = v46;
LABEL_22:
  if (a3 > *(void *)(a1 + 72) + *(void *)(a1 + 64))
  {
    char v26 = [v47 indent] ? 1 : v25;
    if ((v26 & 1) == 0)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a3
                                                                  - *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 32);
      *a5 = 1;
    }
  }
}

void __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if ([v7 isList])
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      if ([v7 style] == 102)
      {
        id v8 = (uint64_t *)MEMORY[0x1E4F83578];
        id v9 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F83578] atIndex:a3 effectiveRange:0];

        if (v9)
        {
          uint64_t v10 = *v8;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_2;
          v19[3] = &unk_1E5FDC6F8;
          unint64_t v11 = *(void **)(a1 + 32);
          v19[4] = *(void *)(a1 + 40);
          id v20 = v7;
          id v21 = *(id *)(a1 + 32);
          objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v10, a3, a4, 0, v19);

          unint64_t v12 = v20;
LABEL_11:

          goto LABEL_15;
        }
      }
    }
    double v15 = objc_msgSend(*(id *)(a1 + 40), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", v7, a3, a4, *(void *)(a1 + 32), 0);
    if (v15) {
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v15, a3, a4);
    }
  }
  else if ([v7 style] == 3 {
         || [v7 style] == 4
  }
         || [v7 isBlockQuote] && ICInternalSettingsIsBlockQuoteEnabled())
  {
    uint64_t v13 = *MEMORY[0x1E4FB0738];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_3;
    v16[3] = &unk_1E5FDC720;
    double v14 = *(void **)(a1 + 32);
    v16[4] = *(void *)(a1 + 40);
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v13, a3, a4, 0, v16);

    unint64_t v12 = v17;
    goto LABEL_11;
  }
LABEL_15:
}

- (id)nsParagraphStyleForICTTParagraphStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (([v11 isList] & 1) != 0
    || location >= [v12 length]
    || ([v12 attribute:*MEMORY[0x1E4FB06B8] atIndex:location effectiveRange:0],
        double v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    double v15 = -[ICTTTextController preferredAttributesForICTTTextStyle:](self, "preferredAttributesForICTTTextStyle:", [v11 style]);
    id v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
    uint64_t v16 = (void *)[v17 mutableCopy];
  }
  else
  {
    double v15 = [v12 attribute:*MEMORY[0x1E4FB0738] atIndex:location effectiveRange:0];
    uint64_t v16 = (void *)[v15 mutableCopy];
  }

  if ([v11 isList])
  {
    objc_msgSend(v16, "setAlignment:", objc_msgSend(v11, "alignmentAdjustedForLists"));
    objc_msgSend(v16, "setBaseWritingDirection:", objc_msgSend(v11, "layoutWritingDirection"));
    if (!ICInternalSettingsIsTextKit2Enabled()
      || [(ICTTTextController *)self isInPreviewMode]
      || [(ICTextController *)self isForPrint])
    {
      if ([v11 style] == 103)
      {
        id v18 = [(ICTTTextController *)self zoomController];
        [v18 checklistZoomFactor];
        double v20 = 5.0 * v19;

        [v16 setParagraphSpacingBefore:v20];
        [v16 setParagraphSpacing:v20];
      }
    }
    else if ([v11 style] == 103)
    {
      id v25 = objc_alloc(MEMORY[0x1E4FB08A0]);
      char v26 = (void *)[v25 initWithMarkerFormat:*MEMORY[0x1E4FB07E0] options:0];
      NSUInteger v27 = [ICTK2TodoTextAttachment alloc];
      char v28 = [v11 todo];
      id v29 = [(ICTK2TodoTextAttachment *)v27 initWithTodo:v28];
      [v26 setMarkerTextAttachment:v29];

      v48[0] = v26;
      NSUInteger v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
      [v16 setTextLists:v30];

      uint64_t v31 = [(ICTTTextController *)self zoomController];
      [v31 checklistZoomFactor];
      double v33 = 3.5 * v32;

      [v16 setParagraphSpacingBefore:v33];
      [v16 setParagraphSpacing:v33];
    }
    else if ([v11 style] == 100)
    {
      id v34 = objc_alloc(MEMORY[0x1E4FB08A0]);
      v35 = (void *)[v34 initWithMarkerFormat:*MEMORY[0x1E4FB07E0] options:0];
      uint64_t v36 = [v12 attribute:*MEMORY[0x1E4FB06F8] atIndex:location effectiveRange:0];
      v37 = [(ICTTTextController *)self zoomController];
      [v37 zoomFactor];
      uint64_t v38 = +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v36, v11);

      v39 = [v11 listBulletInAttributedString:v12 atIndex:location];
      NSUInteger v40 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v39 attributes:v38];
      v41 = [[ICTK2BulletTextAttachment alloc] initWithMarker:v40];
      [v35 setMarkerTextAttachment:v41];

      id v47 = v35;
      id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      [v16 setTextLists:v42];
    }
    else
    {
      uint64_t v43 = [v11 listBulletInAttributedString:v12 atIndex:location];
      v44 = (void *)[objc_alloc(MEMORY[0x1E4FB08A0]) initWithMarkerFormat:v43 options:0];
      v46 = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [v16 setTextLists:v45];
    }
  }
  else
  {
    objc_msgSend(v16, "setAlignment:", objc_msgSend(v11, "alignment"));
    objc_msgSend(v16, "setBaseWritingDirection:", objc_msgSend(v11, "writingDirection"));
    if ([(ICTextController *)self shouldUpdateIndentFor:v11])
    {
      objc_msgSend((id)objc_opt_class(), "indentForStyle:range:attributedString:textView:", v11, location, length, v12, v13);
      double v22 = v21;
      objc_msgSend(v16, "setHeadIndent:");
      [v16 setFirstLineHeadIndent:v22];
    }
  }
  uint64_t v23 = (void *)[v16 copy];

  return v23;
}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  v6 = (uint64_t *)MEMORY[0x1E4F83220];
  id v7 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F83220] atIndex:a2 effectiveRange:&v40];
  uint64_t v8 = a3 - a2;
  id v9 = [v7 uuid];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F29128] UUID];
  }
  id v12 = v11;

  if (v41 + v40 < a3)
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *v6;
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    id v34 = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_2;
    v35 = &unk_1E5FDC490;
    uint64_t v39 = a2;
    id v36 = v12;
    id v37 = *(id *)(a1 + 40);
    id v38 = *(id *)(a1 + 48);
    objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v14, a2, v8, 0, &v32);
  }
  if ((objc_msgSend(v7, "isHeader", v32, v33, v34, v35) & 1) != 0
    || ([v7 isList] & 1) != 0
    || !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    || ![v7 isHierarchicallyEqualToParagraphStyle:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)])
  {
    if ([*(id *)(a1 + 56) containsObject:v12])
    {
      id v17 = (void *)[v7 mutableCopy];
      double v21 = [MEMORY[0x1E4F29128] UUID];
      [v17 setUuid:v21];

      double v22 = (void *)[v17 copy];
      uint64_t v23 = *(void **)(a1 + 40);
      NSUInteger v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, v8);
      [v23 setObject:v22 forKeyedSubscript:v24];

      uint64_t v25 = [v17 uuid];
      uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
      NSUInteger v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }
    else
    {
      uint64_t v28 = [v7 uuid];
      uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
      id v17 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    goto LABEL_15;
  }
  double v15 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v16 = [v7 uuid];
  LOBYTE(v15) = [v15 isEqual:v16];

  if ((v15 & 1) == 0)
  {
    id v17 = (void *)[v7 mutableCopy];
    [v17 setUuid:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    id v18 = (void *)[v17 copy];
    double v19 = *(void **)(a1 + 40);
    double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, v8);
    [v19 setObject:v18 forKeyedSubscript:v20];

LABEL_15:
  }
  [*(id *)(a1 + 56) addObject:v12];
  uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v7;
}

uint64_t __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", *(void *)(a1 + 40), a3, a4, *(void *)(a1 + 48), 0);
  if (v7) {
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, a3, a4);
  }
  return MEMORY[0x1F41817F8]();
}

- (BOOL)shouldUpdateIndentFor:(id)a3
{
  return [a3 style] != 4;
}

+ (double)indentForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 style] == 103)
  {
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([v12 textLayoutManager],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      double v14 = 36.0 * (double)(unint64_t)[v10 indent];
    }
    else
    {
      double v14 = (double)(unint64_t)[v10 indent] * 36.0 + 36.0;
    }
    goto LABEL_26;
  }
  if (![v10 indent])
  {
    double v14 = 0.0;
    if (![v10 isList]) {
      goto LABEL_26;
    }
  }
  if (location >= [v11 length])
  {
    if (v12)
    {
      uint64_t v16 = [v12 typingAttributes];
      id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];

      goto LABEL_14;
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB08E0], "ic_preferredFontForBodyText");
  }
  else
  {
    uint64_t v15 = [v11 attribute:*MEMORY[0x1E4FB06F8] atIndex:location effectiveRange:0];
  }
  id v17 = (void *)v15;
LABEL_14:
  double v18 = 0.0;
  if ([v10 style] == 102 && location <= objc_msgSend(v11, "length"))
  {
    uint64_t v19 = *MEMORY[0x1E4F83540];
    unint64_t v20 = [v11 length];
    if (location) {
      BOOL v21 = location >= v20;
    }
    else {
      BOOL v21 = 0;
    }
    uint64_t v22 = v21;
    uint64_t v23 = [v11 attribute:v19 atIndex:location - v22 effectiveRange:0];
    [a1 extraBulletWidthForNumberedListWithMaxItemNumber:v23 textFont:v17];
    double v18 = v24;
  }
  uint64_t v25 = [v12 textLayoutManager];

  unint64_t v26 = [v10 indent];
  if (!v25) {
    v26 += [v10 isList];
  }
  double v14 = v18 + (double)v26 * 36.0;

LABEL_26:
  return v14;
}

- (void)updateTrackedAttributesInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v51 = 0;
  NSRange v52 = &v51;
  uint64_t v53 = 0x3010000000;
  NSUInteger v54 = &unk_1B0BF84BB;
  long long v55 = xmmword_1B0B987A0;
  v59.NSUInteger length = [v8 length];
  v56.NSUInteger location = location;
  v56.NSUInteger length = length;
  v59.NSUInteger location = 0;
  NSRange v9 = NSIntersectionRange(v56, v59);
  NSUInteger v10 = v9.location;
  NSUInteger v11 = v9.length;
  if (!(v9.location + v9.length))
  {
    unint64_t v12 = [v8 length];
    NSUInteger v11 = 0;
    if (location >= v12) {
      NSUInteger v10 = v12;
    }
    else {
      NSUInteger v10 = location;
    }
  }
  id v13 = [v8 string];
  uint64_t v14 = objc_msgSend(v13, "paragraphRangeForRange:", v10, v11);
  NSUInteger v16 = v15;

  if (v14 + v16 < [v8 length])
  {
    id v17 = [v8 string];
    NSUInteger v18 = objc_msgSend(v17, "paragraphRangeForRange:", v14 + v16, 0);
    NSUInteger v20 = v19;

    v57.NSUInteger location = v14;
    v57.NSUInteger length = v16;
    v60.NSUInteger location = v18;
    v60.NSUInteger length = v20;
    NSRange v21 = NSUnionRange(v57, v60);
    uint64_t v14 = v21.location;
    NSUInteger v16 = v21.length;
  }
  NSUInteger v22 = ((1 - a5) & ~((1 - a5) >> 63)) + length;
  v58.NSUInteger location = location;
  v58.NSUInteger length = v22;
  v61.NSUInteger location = v14;
  v61.NSUInteger length = v16;
  NSRange v23 = NSUnionRange(v58, v61);
  v62.NSUInteger length = [v8 length];
  v62.NSUInteger location = 0;
  NSRange v24 = NSIntersectionRange(v23, v62);
  objc_opt_class();
  uint64_t v25 = ICDynamicCast();
  [v25 beginSkippingTimestampUpdates];

  [v8 beginEditing];
  unint64_t v26 = [v8 string];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke;
  v46[3] = &unk_1E5FDC680;
  id v27 = v8;
  id v47 = v27;
  NSUInteger v48 = self;
  id v28 = v37;
  id v49 = v28;
  NSRange v50 = &v51;
  objc_msgSend(v26, "ic_enumerateParagraphsInRange:usingBlock:", v24.location, v24.length, v46);

  if (a5 >= 1) {
    [(ICTextController *)self updateTrackedToDoParagraphsAfterIndex:v10 byDelta:a5 excludingSeenParagraphs:v28];
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = [(ICTextController *)self trackedToDoParagraphs];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_3;
  v39[3] = &unk_1E5FDC6A8;
  NSUInteger v44 = location;
  NSUInteger v45 = v22;
  id v31 = v28;
  id v40 = v31;
  id v32 = v29;
  id v41 = v32;
  id v33 = v27;
  id v42 = v33;
  uint64_t v43 = self;
  [v30 enumerateKeysAndObjectsUsingBlock:v39];

  id v34 = [(ICTextController *)self trackedToDoParagraphs];
  [v34 removeObjectsForKeys:v32];

  if (a5 < 0) {
    [(ICTextController *)self updateTrackedToDoParagraphsAfterIndex:v10 byDelta:a5 excludingSeenParagraphs:v31];
  }
  uint64_t v35 = v52[4];
  if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
    -[ICTextController styleListsAndIndentsInAttributedString:inRange:](self, "styleListsAndIndentsInAttributedString:inRange:", v33, v35, v52[5]);
  }
  [v33 endEditing];
  objc_opt_class();
  id v36 = ICDynamicCast();
  [v36 endSkippingTimestampUpdates];

  _Block_object_dispose(&v51, 8);
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke(uint64_t a1, NSUInteger a2, uint64_t a3)
{
  NSUInteger location = a2;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F83220];
  uint64_t v7 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F83220] atIndex:a2 effectiveRange:0];
  NSUInteger length = a3 - location;
  NSRange v9 = [*(id *)(a1 + 40) trackedToDoParagraphs];
  NSUInteger v10 = [v7 todoTrackingUUID];
  NSUInteger v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
LABEL_7:
    uint64_t v25 = [v7 todoTrackingUUID];
    if (v25)
    {
      unint64_t v26 = (void *)v25;
      id v27 = [*(id *)(a1 + 40) trackedToDoParagraphs];
      id v28 = [v7 todoTrackingUUID];
      id v29 = [v27 objectForKeyedSubscript:v28];

      if (!v29)
      {
        objc_msgSend(*(id *)(a1 + 40), "createToDoItemForCharacterRange:paragraphStyle:textStorage:", location, length, v7, *(void *)(a1 + 32));
        uint64_t v30 = *(void **)(a1 + 48);
        id v31 = [v7 todoTrackingUUID];
        [v30 addObject:v31];

        uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
        v33.NSUInteger location = *(void *)(v32 + 32);
        if (v33.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          v33.NSUInteger length = *(void *)(v32 + 40);
          v61.NSUInteger location = location;
          v61.NSUInteger length = length;
          NSRange v34 = NSUnionRange(v33, v61);
          NSUInteger location = v34.location;
          NSUInteger length = v34.length;
          uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
        }
        *(void *)(v32 + 32) = location;
        *(void *)(v32 + 40) = length;
      }
    }
    goto LABEL_27;
  }
  unint64_t v12 = *(void **)(a1 + 48);
  id v13 = [v11 paragraph];
  uint64_t v14 = [v13 todoTrackingUUID];
  LOBYTE(v12) = [v12 containsObject:v14];

  if (v12)
  {
    NSUInteger v15 = *(void **)(a1 + 48);
    NSUInteger v16 = [v11 paragraph];
    id v17 = [v16 todoTrackingUUID];
    LODWORD(v15) = [v15 containsObject:v17];

    if (v15)
    {
      NSUInteger v18 = (void *)[v7 mutableCopy];
      id v19 = objc_alloc_init(MEMORY[0x1E4F83508]);
      [v18 setTodo:v19];

      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v6, v18, location, length);
      objc_msgSend(*(id *)(a1 + 40), "createToDoItemForCharacterRange:paragraphStyle:textStorage:", location, length, v18, *(void *)(a1 + 32));
      NSUInteger v20 = *(void **)(a1 + 48);
      NSRange v21 = [v18 todoTrackingUUID];
      [v20 addObject:v21];

      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      v23.NSUInteger location = *(void *)(v22 + 32);
      if (v23.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23.NSUInteger length = *(void *)(v22 + 40);
        v60.NSUInteger location = location;
        v60.NSUInteger length = length;
        NSRange v24 = NSUnionRange(v23, v60);
        NSUInteger location = v24.location;
        NSUInteger length = v24.length;
        uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      *(void *)(v22 + 32) = location;
      *(void *)(v22 + 40) = length;

      goto LABEL_27;
    }
    goto LABEL_7;
  }
  [v11 setParagraph:v7];
  if ([v11 characterRange] != location || v35 != length)
  {
    objc_msgSend(v11, "setCharacterRange:", location, length);
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      objc_opt_class();
      id v37 = ICDynamicCast();
      id v38 = [v37 textLayoutManagers];

      uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v55;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v55 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = ICProtocolCast();
            [v43 textController:*(void *)(a1 + 40) updatedTrackedAttribute:v11];

            ++v42;
          }
          while (v40 != v42);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v40);
      }
    }
    else
    {
      NSUInteger v44 = [*(id *)(a1 + 32) layoutManagers];
      uint64_t v48 = MEMORY[0x1E4F143A8];
      uint64_t v49 = 3221225472;
      NSRange v50 = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_2;
      uint64_t v51 = &unk_1E5FDC658;
      uint64_t v52 = *(void *)(a1 + 40);
      id v53 = v11;
      [v44 enumerateObjectsUsingBlock:&v48];
    }
  }
  NSUInteger v45 = *(void **)(a1 + 48);
  v46 = objc_msgSend(v11, "paragraph", v48, v49, v50, v51, v52);
  id v47 = [v46 todoTrackingUUID];
  [v45 addObject:v47];

LABEL_27:
}

- (NSMutableDictionary)trackedToDoParagraphs
{
  return self->_trackedToDoParagraphs;
}

uint64_t __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v5 = (unsigned char *)a1[6];
  if (!a3)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unsigned char *v5 = 1;
    *a4 = 1;
  }
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_3;
  v9[3] = &unk_1E5FDC310;
  uint64_t v7 = (void *)a1[4];
  v9[4] = a1[5];
  v9[5] = v5;
  v9[6] = a4;
  return objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v6, a2, a3, 0x100000, v9);
}

- (ICAuthorHighlightsController)authorHighlightsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authorHighlightsController);
  return (ICAuthorHighlightsController *)WeakRetained;
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    if ([v3 conformsToProtocol:&unk_1F09A5DB0])
    {
      v5 = ICProtocolCast();
      uint64_t v6 = [v5 attachmentIdentifier];

      if (v6)
      {
        uint64_t v7 = *(void **)(a1 + 32);
        id v8 = [v5 attachmentIdentifier];
        LODWORD(v7) = [v7 containsObject:v8];

        if (v7)
        {
          [MEMORY[0x1E4F837E8] postBasicEvent:6];
          NSRange v9 = (void *)MEMORY[0x1E4F836F8];
          NSUInteger v10 = [v5 attachmentIdentifier];
          NSUInteger v11 = [v5 attachmentUTI];
          [v9 handleFailedAssertWithCondition:"__objc_no", "-[ICTextController updateAttachmentsInNote]_block_invoke", 1, 0, @"Same attachment is referenced twice in note body {attachmentIdentifier: %@, attachmentUTI: %@}", v10, v11 functionName simulateCrash showAlert format];
        }
        else
        {
          uint64_t v14 = *(void **)(a1 + 32);
          NSUInteger v10 = [v5 attachmentIdentifier];
          [v14 addObject:v10];
        }
      }
      else
      {
        id v13 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_1((uint64_t)v4, v13);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
      unint64_t v12 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_2((uint64_t)v4, v12);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = [a2 rangeValue];
  uint64_t v8 = v7;
  if (v6 <= [*(id *)(a1 + 32) length])
  {
    NSRange v9 = [*(id *)(a1 + 32) string];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_2;
    v12[3] = &unk_1E5FDC338;
    uint64_t v14 = a4;
    long long v11 = *(_OWORD *)(a1 + 32);
    id v10 = (id)v11;
    long long v13 = v11;
    objc_msgSend(v9, "ic_enumerateContentLineRangesInRange:usingBlock:", v6, v8, v12);
  }
  else
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)canChangeStyleForSelectedRanges:(id)a3 inTextStorage:(id)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke;
  v10[3] = &unk_1E5FDC360;
  id v7 = v6;
  id v11 = v7;
  unint64_t v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setNote:(id)a3
{
}

- (void)refreshTextStylingForTextStorage:(id)a3 withTextController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 beginSkippingTimestampUpdates];
  objc_msgSend(v5, "updateTrackedAttributesInTextStorage:range:changeInLength:", v6, 0, objc_msgSend(v6, "length"), 0);
  objc_msgSend(v5, "ensureUniqueParagraphStyleUUIDsInTextStorage:range:", v6, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v5, "styleText:inRange:fixModelAttributes:", v6, 0, objc_msgSend(v6, "length"), 0);

  [v6 endSkippingTimestampUpdates];
}

- (void)ensureUniqueParagraphStyleUUIDsInTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA80] set];
  char v8 = [MEMORY[0x1E4F1CA60] dictionary];
  NSRange v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__47;
  v76[4] = __Block_byref_object_dispose__47;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__47;
  v74[4] = __Block_byref_object_dispose__47;
  id v75 = 0;
  id v10 = [v6 string];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke;
  v67[3] = &unk_1E5FDC4B8;
  id v52 = v6;
  id v68 = v52;
  id v56 = v8;
  id v69 = v56;
  id v55 = v9;
  id v70 = v55;
  NSRange v72 = v74;
  v73 = v76;
  id v50 = v7;
  id v71 = v50;
  objc_msgSend(v10, "ic_enumerateParagraphsInRange:usingBlock:", location, length, v67);

  if ([v56 count])
  {
    id v11 = [v56 allKeys];
    unint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_93];

    id v53 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v12;
    uint64_t v13 = 0;
    uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v14)
    {
      NSUInteger v15 = 0;
      uint64_t v16 = *(void *)v64;
      NSUInteger v17 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          NSUInteger v20 = [v19 rangeValue];
          NSUInteger v22 = v21;
          NSRange v23 = [v56 objectForKeyedSubscript:v19];
          NSRange v24 = v23;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v20 == v17 + v15 && [v23 isEqual:v13])
            {
              v81.NSUInteger location = v17;
              v81.NSUInteger length = v15;
              v82.NSUInteger location = v20;
              v82.NSUInteger length = v22;
              NSRange v25 = NSUnionRange(v81, v82);
              NSUInteger v17 = v25.location;
              NSUInteger v15 = v25.length;
              goto LABEL_13;
            }
            unint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17, v15);
            [v53 setObject:v13 forKeyedSubscript:v26];
          }
          id v27 = v24;

          uint64_t v13 = v27;
          NSUInteger v15 = v22;
          NSUInteger v17 = v20;
LABEL_13:
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v79 count:16];
        if (!v14)
        {

          if (v17 != 0x7FFFFFFFFFFFFFFFLL && v13)
          {
            id v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17, v15);
            [v53 setObject:v13 forKeyedSubscript:v28];
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
    }
    id v28 = obj;
LABEL_19:

LABEL_20:
    objc_opt_class();
    id v29 = ICDynamicCast();
    uint64_t v30 = [v29 mergeableString];
    [v30 beginAddAttributesForUniqueParagraphUUIDs];

    [v29 beginSkippingTimestampUpdates];
    [v52 beginEditing];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_4;
    v61[3] = &unk_1E5FDC500;
    id v31 = v52;
    id v62 = v31;
    [v53 enumerateKeysAndObjectsUsingBlock:v61];
    [v31 endEditing];
    [v29 endSkippingTimestampUpdates];
    uint64_t v32 = [v29 mergeableString];
    [v32 endAddAttributesForUniqueParagraphUUIDs];
  }
  NSRange v33 = [(ICTextController *)self note];
  NSRange v34 = [v33 textContentStorage];
  uint64_t v35 = [v34 outlineController];
  id v36 = [v35 collapsedUUIDs];
  id v37 = (void *)[v36 mutableCopy];

  id v38 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v39 = [v55 allKeys];
  uint64_t v40 = [v38 setWithArray:v39];

  [v40 intersectSet:v37];
  if ([v40 count])
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v78 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v58 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * j);
          [v37 removeObject:v45];
          v46 = [v55 objectForKeyedSubscript:v45];
          [v37 addObject:v46];
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v57 objects:v78 count:16];
      }
      while (v42);
    }

    id v47 = [(ICTextController *)self note];
    uint64_t v48 = [v47 textContentStorage];
    uint64_t v49 = [v48 outlineController];
    [v49 setCollapsedUUIDs:v37];
  }
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v76, 8);
}

- (void)styleListsAndIndentsInAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = -[ICTextController numberListsInAttributedString:inRange:](self, "numberListsInAttributedString:inRange:", v7, location, length);
  uint64_t v10 = v9;
  objc_opt_class();
  id v11 = ICDynamicCast();
  [v11 beginSkippingTimestampUpdates];

  uint64_t v12 = *MEMORY[0x1E4F83220];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  NSUInteger v17 = __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke;
  NSUInteger v18 = &unk_1E5FDC748;
  id v19 = v7;
  NSUInteger v20 = self;
  id v13 = v7;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v12, v8, v10, 0, &v15);
  objc_opt_class();
  uint64_t v14 = ICDynamicCast();
  objc_msgSend(v14, "endSkippingTimestampUpdates", v15, v16, v17, v18);
}

- (_NSRange)numberListsInAttributedString:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  id v6 = a3;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3010000000;
  long long v54 = &unk_1B0BF84BB;
  int64_t v55 = location;
  NSUInteger v56 = length;
  id v7 = (uint64_t *)MEMORY[0x1E4F83220];
  uint64_t v8 = location;
  if (location >= 1)
  {
    uint64_t v9 = *MEMORY[0x1E4FB06B8];
    uint64_t v8 = location;
    do
    {
      unint64_t v45 = 0;
      v46 = 0;
      uint64_t v10 = objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *v7, v8, &v45, 0, objc_msgSend(v6, "length"));
      id v11 = v10;
      if (v10)
      {
        if ([v10 style] != 102
          && (![v11 isList] || !objc_msgSend(v11, "indent")))
        {
          goto LABEL_22;
        }
        if (v45) {
          uint64_t v8 = v45 - 1;
        }
        else {
          uint64_t v8 = 0;
        }
      }
      else
      {
        unint64_t v12 = v45;
        for (unint64_t i = v8; i > v45; unint64_t i = v15 ? v15 - 1 : 0)
        {
          uint64_t v14 = [v6 string];
          uint64_t v15 = objc_msgSend(v14, "paragraphRangeForRange:", i, 0);

          uint64_t v16 = [v6 attribute:v9 atIndex:v15 effectiveRange:0];

          unint64_t v12 = v45;
          if (!v16) {
            break;
          }
        }
        uint64_t v17 = v12 - 1;
        if (!v12) {
          uint64_t v17 = 0;
        }
        if (i > v12)
        {
LABEL_22:

          break;
        }
        uint64_t v8 = v17;
      }
    }
    while (v8 > 0);
  }
  unint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3010000000;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  uint64_t v48 = &unk_1B0BF84BB;
  uint64_t v18 = [v6 length];
  uint64_t v49 = v8;
  uint64_t v50 = (v18 - v8) & ~((v18 - v8) >> 63);
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__47;
  uint64_t v43 = __Block_byref_object_dispose__47;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(id)v40[5] addObject:&unk_1F09A4370];
  uint64_t v19 = *v7;
  uint64_t v20 = [v6 length] - v8;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __58__ICTextController_numberListsInAttributedString_inRange___block_invoke;
  v32[3] = &unk_1E5FDC770;
  NSRange v34 = &v39;
  id v21 = v6;
  id v33 = v21;
  uint64_t v35 = &v51;
  int64_t v37 = location;
  NSUInteger v38 = length;
  id v36 = &v45;
  objc_msgSend(v21, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v19, v8, v20, 0, v32);
  [(id)v40[5] removeAllObjects];
  uint64_t v22 = *MEMORY[0x1E4F83578];
  NSRange v23 = v46;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__ICTextController_numberListsInAttributedString_inRange___block_invoke_2;
  v29[3] = &unk_1E5FDC798;
  id v24 = v21;
  id v30 = v24;
  id v31 = &v39;
  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v22, v23[4], v23[5], 2, v29);
  NSUInteger v25 = v52[4];
  NSUInteger v26 = v52[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  NSUInteger v27 = v25;
  NSUInteger v28 = v26;
  result.NSUInteger length = v28;
  result.int64_t location = v27;
  return result;
}

- (void)fixTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  [v11 beginEditing];
  [v11 setDisableUndoCoalesceBreaking:1];
  uint64_t v18 = 0;
  uint64_t v12 = -[ICTextController cleanupTextStorage:afterProcessingEditing:range:changeInLength:changeInLengthAfterCleanup:](self, "cleanupTextStorage:afterProcessingEditing:range:changeInLength:changeInLengthAfterCleanup:", v11, a4, location, length, a6, &v18);
  uint64_t v14 = v13;
  if ([(ICTextController *)self disableAddingExtraLinesIfNeeded])
  {
    uint64_t v15 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v12 = -[ICTextController addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:](self, "addExtraLinesIfNeededToTextStorage:editedRange:actualLengthIncrease:", v11, v12, v14, &v17);
    uint64_t v14 = v16;
    uint64_t v15 = v18 + v17;
    v18 += v17;
  }
  -[ICTextController updateTrackingInTextStorage:range:changeInLength:](self, "updateTrackingInTextStorage:range:changeInLength:", v11, v12, v14, v15);
  [v11 setDisableUndoCoalesceBreaking:0];
  [v11 endEditing];
}

- (void)updateTrackingInTextStorage:(id)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  [(ICTextController *)self updateAttachmentsInNote];
  -[ICTextController updateTrackedAttributesInTextStorage:range:changeInLength:](self, "updateTrackedAttributesInTextStorage:range:changeInLength:", v11, location, length, a5);
  if ([v11 hasUserEditSinceFixupAfterEditing])
  {
    uint64_t v9 = objc_msgSend(v11, "ic_range");
    -[ICTextController ensureUniqueParagraphStyleUUIDsInTextStorage:range:](self, "ensureUniqueParagraphStyleUUIDsInTextStorage:range:", v11, v9, v10);
  }
}

- (void)updateAttachmentsInNote
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Attachments deleted or revived. Updating note title and snippet", v1, 2u);
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  return (ICNote *)WeakRetained;
}

- (void)fixModelAttributesInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  NSUInteger v37 = [v6 beforeEndEditedRange];
  [v6 beginEditing];
  id v7 = [v6 string];
  unint64_t v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  uint64_t v10 = v9;

  v45.NSUInteger location = 0;
  v45.NSUInteger length = 0;
  NSUInteger v11 = v8 + v10;
  if (v8 < v8 + v10)
  {
    uint64_t v12 = &v44;
    uint64_t v38 = *MEMORY[0x1E4FB06B8];
    NSUInteger v13 = v8;
    unint64_t v35 = v8;
    do
    {
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F83220], v13, &v45, v8, v10, v35);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v46.NSUInteger length = v11 - v13;
      v46.NSUInteger location = v13;
      NSRange v45 = NSIntersectionRange(v45, v46);
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      NSUInteger v42 = 0;
      uint64_t v15 = [v6 string];
      objc_msgSend(v15, "getParagraphStart:end:contentsEnd:forRange:", &v43, v12, &v42, v45.location, v45.length);

      v44 -= v43;
      uint64_t v16 = [v6 attribute:v38 atIndex:v13 effectiveRange:0];
      uint64_t v17 = ICProtocolCast();

      if (v17) {
        int v18 = [MEMORY[0x1E4F834B0] isInlineAttachment:v17] ^ 1;
      }
      else {
        int v18 = 0;
      }
      BOOL v20 = v43 == v45.location && v44 == v45.length;
      if ((v18 & 1) != 0 || v20)
      {
        if (v18)
        {
          objc_opt_class();
          id v31 = ICDynamicCast();
          uint64_t v32 = [v31 attachment];
          int v33 = [v32 isTable];

          if (v33 && v14)
          {
            NSRange v34 = (void *)[v14 mutableCopy];
            [v34 setStyle:3];
            objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E4F83220], v34, v43, v44);
          }
        }
      }
      else
      {
        if (v45.location >= v37 && v45.length + v45.location < v42)
        {
          id v21 = [v6 string];
          uint64_t v22 = objc_msgSend(v21, "paragraphRangeForRange:", v42, 0);
          uint64_t v24 = v23;

          NSUInteger v25 = [v6 attribute:*MEMORY[0x1E4F83220] atIndex:v42 effectiveRange:0];
          NSUInteger v26 = v25;
          if (v25)
          {
            uint64_t v27 = v10;
            NSUInteger v28 = v12;
            id v29 = v25;

            uint64_t v43 = v22;
            uint64_t v44 = v24;
            id v14 = v29;
            uint64_t v12 = v28;
            uint64_t v10 = v27;
            unint64_t v8 = v35;
          }
        }
        uint64_t v30 = *MEMORY[0x1E4F83220];
        if (v14)
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __60__ICTextController_fixModelAttributesInTextStorage_inRange___block_invoke;
          v39[3] = &unk_1E5FDC748;
          id v14 = v14;
          id v40 = v14;
          id v41 = v6;
          objc_msgSend(v41, "enumerateAttribute:inRange:options:usingBlock:", v30, v43, v44, 0, v39);
        }
        else
        {
          objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F83220], v43, v44);
        }
      }
      NSUInteger v13 = v44 + v43;
    }
    while (v13 < v11);
  }
  -[ICTextController uniqueParagraphStylesInTextStorage:inRange:](self, "uniqueParagraphStylesInTextStorage:inRange:", v6, v8, v10);
  [v6 endEditing];
}

- (void)uniqueParagraphStylesInTextStorage:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = [v6 string];
  unint64_t v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  uint64_t v10 = v9;

  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v31 = v10;
  unint64_t v32 = v8;
  unint64_t v30 = v8 + v10;
  if (v8 < v8 + v10)
  {
    unint64_t v11 = v8;
    while (1)
    {
      uint64_t v12 = objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F83220], v11, &v36, v32, v31, v30);
      NSUInteger v13 = [v6 string];
      uint64_t v14 = objc_msgSend(v13, "paragraphRangeForRange:", v36, v37);
      uint64_t v16 = v15;

      uint64_t v17 = [v6 string];
      uint64_t v18 = objc_msgSend(v17, "paragraphRangeForRange:", v36, 0);
      BOOL v20 = v36 == v18 && v37 == v19;
      char v21 = v20;

      if (v12)
      {
        unint64_t v22 = v14 + v16;
        if ([v12 uniqueToLine] && v11 < v22) {
          break;
        }
      }
LABEL_27:
      unint64_t v11 = v14 + v16;

      if (v14 + v16 >= v30) {
        goto LABEL_28;
      }
    }
    char v24 = 1;
    while (1)
    {
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      uint64_t v33 = 0;
      NSUInteger v25 = [v6 string];
      objc_msgSend(v25, "getParagraphStart:end:contentsEnd:forRange:", &v33, &v34, &v35, v11, 0);

      v34 -= v33;
      if ([v12 style] != 103) {
        break;
      }
      NSUInteger v26 = [v12 todo];

      if (v26) {
        char v27 = v21;
      }
      else {
        char v27 = 1;
      }
      if (v27)
      {
        if (v26) {
          break;
        }
      }
      else if ((v24 & 1) != 0 && v35 != v33)
      {
        break;
      }
      NSUInteger v28 = (void *)[v12 mutableCopy];
      id v29 = objc_alloc_init(MEMORY[0x1E4F83508]);
      [v28 setTodo:v29];

      objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E4F83220], v28, v33, v34);
LABEL_26:
      unint64_t v11 = v34 + v33;
      if (v34 + v33 >= v22) {
        goto LABEL_27;
      }
    }
    char v24 = 0;
    goto LABEL_26;
  }
LABEL_28:
}

- (BOOL)disableAddingExtraLinesIfNeeded
{
  return self->_disableAddingExtraLinesIfNeeded;
}

- (_NSRange)cleanupTextStorage:(id)a3 afterProcessingEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 changeInLengthAfterCleanup:(int64_t *)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  if ([v11 length])
  {
    uint64_t v39 = a7;
    NSUInteger v40 = location;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = (void *)MEMORY[0x1E4F83220];
    do
    {
      uint64_t v15 = v12;
      uint64_t v12 = objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *v14, v13, &v42, 0, objc_msgSend(v11, "length"));

      if ([v12 needsParagraphCleanup])
      {
        uint64_t v16 = [v11 string];
        uint64_t v17 = objc_msgSend(v16, "paragraphRangeForRange:", v42, v43);
        uint64_t v19 = v18;

        if (v17 == v42 && v19 == v43)
        {
          id v20 = (id)[v12 mutableCopy];
          [v20 setNeedsParagraphCleanup:0];
          objc_msgSend(v11, "addAttribute:value:range:", *v14, v20, v42, v43);
        }
        else
        {
          id v20 = v11;
          int v21 = [v20 convertAttributes];
          [v20 setConvertAttributes:0];
          objc_msgSend(v20, "removeAttribute:range:", *v14, v42, v43);
          -[ICTTTextController styleText:inExactRange:fixModelAttributes:](self, "styleText:inExactRange:fixModelAttributes:", v20, v42, v43, 1);
          if (v21) {
            [v20 setConvertAttributes:1];
          }
        }
      }
      if ([v12 isList] && objc_msgSend(v12, "needsListCleanup"))
      {
        unint64_t v22 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^\t\\S+?\t" options:0 error:0];
        unint64_t v23 = v42;
        for (unint64_t i = v43 + v42; v23 < i; unint64_t i = v33 + v42)
        {
          NSUInteger v25 = [v11 string];
          uint64_t v26 = objc_msgSend(v25, "paragraphRangeForRange:", v23, 0);
          uint64_t v28 = v27;

          id v29 = [v11 string];
          uint64_t v30 = objc_msgSend(v22, "rangeOfFirstMatchInString:options:range:", v29, 4, v26, v28);
          unint64_t v32 = v31;

          if (v30 == 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v23 = v26 + v28;
            unint64_t v33 = v43;
          }
          else
          {
            objc_msgSend(v11, "deleteCharactersInRange:", v30, v32);
            if (v43 >= v32) {
              unint64_t v34 = v32;
            }
            else {
              unint64_t v34 = v43;
            }
            unint64_t v33 = v43 - v34;
            v43 -= v34;
            length -= v34;
            int64_t v35 = (a6 - v34) & ~((uint64_t)(a6 - v34) >> 63);
            if (a6 > 0) {
              a6 = v35;
            }
            unint64_t v23 = v26 + v28 - v32;
          }
        }
        uint64_t v36 = (void *)[v12 mutableCopy];
        [v36 setNeedsListCleanup:0];
        uint64_t v14 = (void *)MEMORY[0x1E4F83220];
        objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4F83220], v36, v42, v43);
      }
      unint64_t v13 = v43 + v42;
    }
    while (v13 < [v11 length]);

    a7 = v39;
    NSUInteger location = v40;
  }
  *a7 = a6;

  NSUInteger v37 = location;
  NSUInteger v38 = length;
  result.NSUInteger length = v38;
  result.NSUInteger location = v37;
  return result;
}

- (void)setMentionsController:(id)a3
{
}

- (void)setHashtagController:(id)a3
{
}

- (void)setAuthorHighlightsController:(id)a3
{
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (ICTextController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICTextController;
  v2 = [(ICTTTextController *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2->_userChangedWritingDirection = 0;
    [(ICTextController *)v2 resetTrackedToDoParagraphs];
  }
  return v3;
}

- (void)resetTrackedToDoParagraphs
{
  self->_trackedToDoParagraphs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  MEMORY[0x1F41817F8]();
}

void __58__ICTextController_numberListsInAttributedString_inRange___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v7 = [a2 intValue];
    unint64_t v8 = a3 + a4;
    unint64_t v23 = a3 + a4;
    uint64_t v24 = 0;
    uint64_t v9 = (uint64_t *)MEMORY[0x1E4F83540];
    do
    {
      uint64_t v10 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F83220] atIndex:v8 - 1 effectiveRange:&v23];
      uint64_t v11 = [v10 indent];
      unint64_t v12 = v11 + 1;
      while (v12 < objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count", v23))
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeLastObject];
      while (v12 > [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:&unk_1F09A4370];
      unint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:v11];
      uint64_t v14 = [v13 intValue];

      if (!v14)
      {
        uint64_t v15 = [NSNumber numberWithInt:v7];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v15 atIndexedSubscript:v11];

        uint64_t v14 = v7;
      }
      uint64_t v16 = [*(id *)(a1 + 32) attribute:*v9 atIndex:v23 effectiveRange:0];
      uint64_t v17 = [v16 integerValue];

      double v18 = floor(log10((double)v17));
      if (v18 != floor(log10((double)(int)v14)))
      {
        uint64_t v19 = *(void **)(a1 + 32);
        uint64_t v20 = *v9;
        int v21 = [NSNumber numberWithInt:v14];
        objc_msgSend(v19, "addAttribute:value:range:", v20, v21, v23, v24);
      }
      unint64_t v8 = v23;
    }
    while (v23 > a3);
  }
  else
  {
    unint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v22 removeAllObjects];
  }
}

- (void)convertNSTablesToICTables:(id)a3 pasteboardTypes:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6
{
  uint64_t v6 = a6;
  BOOL v35 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![(ICTextController *)self isConvertingTables])
  {
    [(ICTextController *)self setIsConvertingTables:1];
    id v30 = v10;
    if ([v10 containsObject:@"SFVNativePBMetaDataPBType09"]) {
      [(ICTextController *)self workAroundSageTables:v9];
    }
    if (objc_msgSend(v9, "ic_numberOfTables"))
    {
      uint64_t v34 = *MEMORY[0x1E4FB06B8];
      unsigned int v32 = v6;
      unint64_t v31 = self;
      do
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        uint64_t v11 = v9;
        unint64_t v12 = objc_msgSend(v9, "ic_nextTableStringFromIndex:tableRange:", 0, &v44);
        unint64_t v13 = objc_msgSend(v12, "ic_textTablesInRange:", 0, objc_msgSend(v12, "length"));
        uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        unint64_t v33 = v13;
        uint64_t v15 = [v13 reverseObjectEnumerator];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = [(ICTextController *)self addTableAttachmentWithNSTextTable:*(void *)(*((void *)&v40 + 1) + 8 * i) attributedString:v12 filterPastedAttributes:v35 isReadingSelectionFromPasteboard:v6];
              if (v20) {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v47 count:16];
          }
          while (v17);
        }

        id v9 = v11;
        objc_msgSend(v11, "deleteCharactersInRange:", v44, v45);
        uint64_t v21 = v44;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v22 = v14;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v37 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * j);
              uint64_t v28 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v27];
              id v29 = (void *)[v28 mutableCopy];

              objc_msgSend(v29, "addAttribute:value:range:", v34, v27, 0, objc_msgSend(v29, "length"));
              id v9 = v11;
              [v11 insertAttributedString:v29 atIndex:v21];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v24);
        }

        uint64_t v6 = v32;
        self = v31;
      }
      while (objc_msgSend(v9, "ic_numberOfTables"));
    }
    [(ICTextController *)self setIsConvertingTables:0];
    id v10 = v30;
  }
}

- (void)workAroundSageTables:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(v3, "ic_numberOfTables"))
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v5 = [v3 length];
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend(v3, "ic_rangeofNextTableFromIndex:", v6);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v7, v8);
      [v4 addObject:v11];

      uint64_t v6 = v9 + v10;
    }
    while (v9 + v10 < v5);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unint64_t v12 = objc_msgSend(v4, "reverseObjectEnumerator", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v25 + 1) + 8 * v16) rangeValue];
          uint64_t v19 = v17 + v18;
          if (v17 + v18 + 1 <= (unint64_t)[v3 length])
          {
            uint64_t v20 = objc_msgSend(v3, "attributedSubstringFromRange:", v19, 1);
            uint64_t v21 = [v20 string];

            if ([v21 characterAtIndex:0] == 10) {
              objc_msgSend(v3, "deleteCharactersInRange:", v19, 1);
            }
          }
          if (v17)
          {
            uint64_t v22 = v17 - 1;
            uint64_t v23 = objc_msgSend(v3, "attributedSubstringFromRange:", v22, 1);
            uint64_t v24 = [v23 string];

            if ([v24 characterAtIndex:0] == 10) {
              objc_msgSend(v3, "deleteCharactersInRange:", v22, 1);
            }
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
  }
}

- (id)addTableAttachmentWithNSTextTable:(id)a3 attributedString:(id)a4 filterPastedAttributes:(BOOL)a5 isReadingSelectionFromPasteboard:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v29 = 0;
  uint64_t v12 = objc_msgSend(v11, "ic_numRowsForTextTable:outNumColumns:", v10, &v29);
  uint64_t v13 = 0;
  if (v12 && v29)
  {
    uint64_t v14 = v12;
    uint64_t v15 = [(ICTextController *)self note];
    uint64_t v16 = [v15 currentReplicaID];
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F29128] UUID];
    }
    uint64_t v19 = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F83518]);
    uint64_t v21 = (void *)[v20 initWithColumnCount:v29 rowCount:v14 replicaID:v19];
    uint64_t v22 = [v21 table];
    [(ICTextController *)self p_populateTable:v22 withNSTextTable:v10 attributedString:v11 filterPastedAttributes:v7 isReadingSelectionFromPasteboard:v6];
    uint64_t v23 = [v21 serialize];
    uint64_t v24 = [(ICTextController *)self note];

    if (v24)
    {
      long long v25 = [(ICTextController *)self note];
      long long v26 = [v25 addTableAttachmentWithTableData:v23];

      [v26 updateChangeCountWithReason:@"Created table from text table"];
      uint64_t v13 = +[ICTextAttachment textAttachmentWithAttachment:v26];
    }
    else
    {
      id v27 = objc_alloc(MEMORY[0x1E4FB0870]);
      uint64_t v13 = (void *)[v27 initWithData:v23 ofType:*MEMORY[0x1E4F83098]];
    }
  }
  return v13;
}

- (void)p_populateTable:(id)a3 withNSTextTable:(id)a4 attributedString:(id)a5 filterPastedAttributes:(BOOL)a6 isReadingSelectionFromPasteboard:(BOOL)a7
{
  BOOL v7 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v38 = [v12 length];
  if (v38)
  {
    unint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    id v36 = v12;
    uint64_t v37 = *MEMORY[0x1E4FB0738];
    while (1)
    {
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v16 = [v12 attribute:v37 atIndex:v13 effectiveRange:&v50];
      uint64_t v17 = [v16 textBlocks];
      if ([v17 count]) {
        break;
      }
      unint64_t v33 = objc_msgSend(v12, "attributedSubstringFromRange:", v50, v51);
      LOBYTE(v35) = a7;
      uint64_t v14 = -[ICTextController p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:](self, "p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:", v45, v33, 0, v14, v15, v7, v35);
      uint64_t v15 = v34;
      unint64_t v13 = v51 + v50;
LABEL_18:

      if (v13 >= v38) {
        goto LABEL_19;
      }
    }
    long long v42 = v17;
    long long v43 = v16;
    id v18 = [v17 objectAtIndex:0];
    uint64_t v19 = [v18 table];

    long long v41 = (void *)v19;
    uint64_t v20 = [v12 rangeOfTextTable:v19 atIndex:v50];
    uint64_t v39 = v21;
    uint64_t v40 = v20;
    uint64_t v22 = objc_msgSend(v12, "attributedSubstringFromRange:");
    uint64_t v23 = objc_msgSend(v22, "ic_textTablesInRange:", 0, objc_msgSend(v22, "length"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (!v24) {
      goto LABEL_16;
    }
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v47;
LABEL_6:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v23);
      }
      id v28 = *(id *)(*((void *)&v46 + 1) + 8 * v27);
      if (!v11) {
        break;
      }
      if (v28 == v11)
      {
        LOBYTE(v35) = a7;
        uint64_t v29 = self;
        id v30 = v45;
        unint64_t v31 = v22;
        id v28 = v11;
LABEL_13:
        uint64_t v14 = -[ICTextController p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:](v29, "p_setCellsInTable:fromAttributedString:textTable:atCellOffset:filterPastedAttributes:isReadingSelectionFromPasteboard:", v30, v31, v28, v14, v15, v7, v35);
        uint64_t v15 = v32;
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (!v25)
        {
LABEL_16:
          unint64_t v13 = v40 + v39;

          id v12 = v36;
          uint64_t v17 = v42;
          uint64_t v16 = v43;
          unint64_t v33 = v41;
          goto LABEL_18;
        }
        goto LABEL_6;
      }
    }
    LOBYTE(v35) = a7;
    uint64_t v29 = self;
    id v30 = v45;
    unint64_t v31 = v22;
    goto LABEL_13;
  }
LABEL_19:
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)p_setCellsInTable:(id)a3 fromAttributedString:(id)a4 textTable:(id)a5 atCellOffset:(id)a6 filterPastedAttributes:(BOOL)a7 isReadingSelectionFromPasteboard:(BOOL)a8
{
  BOOL v8 = a7;
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  id v29 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x3010000000;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  long long v60 = &unk_1B0BF84BB;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3010000000;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  long long v54 = &unk_1B0BF84BB;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke;
  aBlock[3] = &unk_1E5FDADC0;
  aBlock[4] = v49;
  aBlock[5] = &v57;
  aBlock[6] = &v51;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v17 = *MEMORY[0x1E4FB0738];
  uint64_t v27 = [v14 attribute:*MEMORY[0x1E4FB0738] atIndex:0 effectiveRange:&v46];
  BOOL v28 = v8;
  uint64_t v26 = [v27 textBlocks];
  if ([v26 count])
  {
    unint64_t v18 = var0;
    uint64_t v19 = [v14 length];
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v45[3] = 0x7FFFFFFFFFFFFFFFLL;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0x7FFFFFFFFFFFFFFFLL;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke_2;
    v30[3] = &unk_1E5FDADE8;
    id v31 = v15;
    unint64_t v39 = var0;
    unint64_t v40 = var1;
    id v32 = v29;
    id v35 = v16;
    id v36 = v44;
    uint64_t v37 = v45;
    unint64_t v38 = v43;
    id v33 = v14;
    uint64_t v34 = self;
    BOOL v41 = v28;
    BOOL v42 = a8;
    objc_msgSend(v33, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v19, 0, v30);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v45, 8);
  }
  else
  {
    (*((void (**)(void *, unint64_t, uint64_t, unint64_t, uint64_t))v16 + 2))(v16, var0, 1, var1, 1);
    uint64_t v20 = objc_msgSend(v14, "attributedSubstringFromRange:", v46, v47);
    LOBYTE(v25) = a8;
    [(ICTextController *)self updateCellInTable:v29 atColumnIndex:var0 rowIndex:var1 fromAttributedString:v20 andTextTableBlock:0 filterPastedAttributes:v8 isReadingSelectionFromPasteboard:v25];
    unint64_t v18 = var0;
  }
  uint64_t v21 = v52[5];
  if (v58[5] && v21)
  {
    unint64_t v22 = var1 + 1;
  }
  else
  {
    unint64_t v18 = 0;
    unint64_t v22 = v21 + v52[4];
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  unint64_t v23 = v18;
  unint64_t v24 = v22;
  result.unint64_t var1 = v24;
  result.unint64_t var0 = v23;
  return result;
}

void __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke(int a1, NSRange range2, uint64_t a3, NSUInteger a4)
{
  NSUInteger v6 = v5;
  NSUInteger length = range2.length;
  range2.NSUInteger length = range2.location;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(*(void *)(v8 + 32) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    *(unsigned char *)(v10 + 24) = 0;
    uint64_t v12 = *(void *)(*(void *)(v11 + 40) + 8);
    *(void *)(v12 + 32) = range2.location;
    *(void *)(v12 + 40) = v13;
    uint64_t v14 = v11 + 48;
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(v15 + 40) + 8);
    uint64_t v17 = *(void *)(v16 + 32);
    range2.NSUInteger location = *(void *)(v16 + 40);
    *(NSRange *)(*(void *)(*(void *)(v9 + 40) + 8) + 32) = NSUnionRange(range2, *(NSRange *)&range2.length);
    uint64_t v18 = *(void *)(v9 + 48);
    uint64_t v14 = v9 + 48;
    v22.NSUInteger location = v6;
    v22.NSUInteger length = a4;
    NSRange v20 = NSUnionRange(*(NSRange *)(*(void *)(v18 + 8) + 32), v22);
    NSUInteger location = v20.location;
    NSUInteger v6 = v20.location;
    a4 = v20.length;
  }
  uint64_t v21 = *(void *)(*(void *)v14 + 8);
  *(void *)(v21 + 32) = v6;
  *(void *)(v21 + 40) = a4;
}

void __156__ICTextController_ICTableAdditions__p_setCellsInTable_fromAttributedString_textTable_atCellOffset_filterPastedAttributes_isReadingSelectionFromPasteboard___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = [a2 textBlocks];
  NSUInteger v5 = [v19 lastObject];
  NSUInteger v6 = [v5 table];
  BOOL v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    uint64_t v8 = [v5 startingColumn];
    uint64_t v9 = *(void *)(a1 + 96);
    uint64_t v10 = *(void *)(a1 + 104) + [v5 startingRow];
    unint64_t v11 = v10 + [v5 rowSpan];
    if (v11 <= [*(id *)(a1 + 40) rowCount])
    {
      uint64_t v12 = v9 + v8;
      unint64_t v13 = [v5 columnSpan] + v12;
      if (v13 <= [*(id *)(a1 + 40) columnCount])
      {
        [v5 columnSpan];
        [v5 rowSpan];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
        if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == v10)
        {
          uint64_t v15 = a3;
          if (*(void *)(v14 + 24) == v12) {
            uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          }
        }
        else
        {
          uint64_t v15 = a3;
        }
        *(void *)(v14 + 24) = v12;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10;
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v15;
        uint64_t v16 = objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:");
        uint64_t v17 = objc_msgSend(v16, "ic_stringByTrimmingLeadingTrailingWhitespace");

        LOBYTE(v18) = *(unsigned char *)(a1 + 113);
        [*(id *)(a1 + 56) updateCellInTable:*(void *)(a1 + 40) atColumnIndex:v12 rowIndex:v10 fromAttributedString:v17 andTextTableBlock:v5 filterPastedAttributes:*(unsigned __int8 *)(a1 + 112) isReadingSelectionFromPasteboard:v18];
      }
    }
  }
}

- (void)updateCellInTable:(id)a3 atColumnIndex:(unint64_t)a4 rowIndex:(unint64_t)a5 fromAttributedString:(id)a6 andTextTableBlock:(id)a7 filterPastedAttributes:(BOOL)a8 isReadingSelectionFromPasteboard:(BOOL)a9
{
  BOOL v9 = a8;
  id v17 = a3;
  id v14 = a6;
  uint64_t v15 = v14;
  if (objc_msgSend(v14, "containsAttachmentsInRange:", 0, objc_msgSend(v14, "length")))
  {
    uint64_t v15 = objc_msgSend(v14, "ic_stringWithoutAttachments");
  }
  uint64_t v16 = [v17 textStorageForCellAtColumnIndex:a4 rowIndex:a5];
  [v16 setStyler:self];
  [v16 setFilterPastedAttributes:v9];
  [v16 setIsReadingSelectionFromPasteboard:a9];
  [v16 setConvertAttributes:1];
  [v16 setIsReadingSelectionFromPasteboard:1];
  [v16 setWantsUndoCommands:0];
  [v16 beginEditing];
  objc_msgSend(v16, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v16, "length"), v15);
  [v16 endEditing];
  [v16 fixupAfterEditing];
}

- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5 ignoreTypingAttributes:(BOOL)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a5;
  unint64_t v11 = v10;
  if (length || !a4 || a6)
  {
    uint64_t v15 = [v10 string];
    unint64_t v16 = objc_msgSend(v15, "paragraphRangeForRange:", location, length);

    if (v16 >= [v11 length])
    {
      unsigned int v14 = 3;
      goto LABEL_11;
    }
    unint64_t v13 = [v11 attribute:*MEMORY[0x1E4F83220] atIndex:v16 effectiveRange:0];
    if (v13) {
      goto LABEL_5;
    }
LABEL_8:
    unsigned int v14 = 3;
    goto LABEL_9;
  }
  uint64_t v12 = [a4 typingAttributes];
  unint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_5:
  unsigned int v14 = [v13 style];
LABEL_9:

LABEL_11:
  return v14;
}

- (unsigned)paragraphStyleForRange:(_NSRange)a3 inTextView:(id)a4 inTextStorage:(id)a5
{
  return -[ICTextController paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:](self, "paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:", a3.location, a3.length, a4, a5, 0);
}

- (BOOL)attachmentsExistInRange:(_NSRange)a3 textStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = *MEMORY[0x1E4FB06B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__ICTextController_attachmentsExistInRange_textStorage___block_invoke;
  v9[3] = &unk_1E5FDA328;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v7, location, length, 0x100000, v9);
  LOBYTE(length) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return length;
}

void __56__ICTextController_attachmentsExistInRange_textStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(v6, "ic_selectedRanges");
  LOBYTE(a4) = [(ICTextController *)self canIndentTextView:v6 byDelta:a4 forRanges:v7];

  return a4;
}

- (BOOL)canIndentTextView:(id)a3 byDelta:(int64_t)a4 forRanges:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a5;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v8 = [v7 textStorage];
  if ([v8 length])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v36;
    uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (!v31) {
      goto LABEL_35;
    }
    uint64_t v33 = *(void *)v44;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v9;
        uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        unint64_t v11 = objc_msgSend(v8, "string", v31);
        uint64_t v12 = [v10 rangeValue];
        int v14 = objc_msgSend(v11, "ic_rangeIsValid:", v12, v13);

        if (v14)
        {
          uint64_t v15 = [v8 string];
          uint64_t v16 = [v10 rangeValue];
          unint64_t v18 = objc_msgSend(v15, "paragraphRangeForRange:", v16, v17);
          uint64_t v20 = v19;
        }
        else
        {
          uint64_t v20 = 0;
          unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (-[ICTextController attachmentsExistInRange:textStorage:](self, "attachmentsExistInRange:textStorage:", v18, v20, v8))
        {
          *((unsigned char *)v48 + 24) = 0;
          goto LABEL_35;
        }
        unint64_t v21 = v18;
        while (1)
        {
          unint64_t v41 = v21;
          uint64_t v42 = 1;
          if (v21 >= [v8 length])
          {
            unint64_t v23 = [v7 typingAttributes];
            NSRange v22 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
          }
          else
          {
            NSRange v22 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F83220], v21, &v41, v18, v20);
          }
          if (v22)
          {
            if ([v22 canIndent] && (a4 > 0 || a4 < 0 && objc_msgSend(v22, "indent"))) {
              goto LABEL_24;
            }
          }
          else if (a4 >= 1)
          {
            goto LABEL_24;
          }
          if ([v22 style] == 4)
          {
            if (a4 < 1)
            {
              uint64_t v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v27 = [v8 string];
              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v37[2] = __56__ICTextController_canIndentTextView_byDelta_forRanges___block_invoke;
              v37[3] = &unk_1E5FDC248;
              id v28 = v26;
              id v38 = v28;
              id v39 = v8;
              unint64_t v40 = &v47;
              objc_msgSend(v27, "ic_enumerateParagraphsInRange:usingBlock:", v41, v42, v37);

              goto LABEL_25;
            }
LABEL_24:
            *((unsigned char *)v48 + 24) = 1;
          }
LABEL_25:
          unint64_t v24 = v41;
          uint64_t v25 = v42;

          unint64_t v21 = v25 + v24;
          if (v21 >= v18 + v20 || v21 <= v18) {
            break;
          }
          if (*((unsigned char *)v48 + 24)) {
            goto LABEL_35;
          }
        }
        if (*((unsigned char *)v48 + 24)) {
          goto LABEL_35;
        }
        ++v9;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (!v31)
      {
LABEL_35:

        break;
      }
    }
  }
  BOOL v29 = *((unsigned char *)v48 + 24) != 0;

  _Block_object_dispose(&v47, 8);
  return v29;
}

void __56__ICTextController_canIndentTextView_byDelta_forRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) string];
  LODWORD(a2) = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", a2));

  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (a5) {
      *a5 = 1;
    }
  }
}

- (id)indentParagraphStyle:(id)a3 byAmount:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if ([v5 canIndent])
    {
      uint64_t v8 = (void *)[v6 mutableCopy];
      uint64_t v9 = [v8 indent] + a4;
      if (v9 < 0)
      {
        id v10 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:3];
      }
      else
      {
        [v8 setIndent:v9];
        id v10 = v8;
      }
      id v7 = v10;
    }
  }
  else if (a4 < 1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:3];
    [v7 setIndent:a4];
  }

  return v7;
}

- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6
{
}

- (void)indentRange:(_NSRange)a3 byAmount:(int64_t)a4 inTextStorage:(id)a5 textView:(id)a6 forceUpdateAttributes:(BOOL)a7
{
  BOOL v42 = a7;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v12 = a5;
  id v44 = a6;
  [v12 beginEditing];
  uint64_t v13 = [v12 string];
  unint64_t v41 = location;
  NSUInteger v43 = length;
  uint64_t v14 = objc_msgSend(v13, "paragraphRangeForRange:", location, length);
  uint64_t v16 = v15;

  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  long long v64 = __Block_byref_object_copy__47;
  long long v65 = __Block_byref_object_dispose__47;
  id v66 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  long long v58 = __Block_byref_object_copy__47;
  uint64_t v59 = __Block_byref_object_dispose__47;
  id v60 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = *MEMORY[0x1E4F83220];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke;
  v50[3] = &unk_1E5FDC298;
  v50[4] = self;
  id v18 = v12;
  id v51 = v18;
  uint64_t v52 = &v61;
  uint64_t v53 = &v55;
  int64_t v54 = a4;
  objc_msgSend(v18, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v17, v14, v16, 0, v50);
  int64_t v19 = a4;
  uint64_t v20 = self;
  NSUInteger v21 = v43;
  if (([(id)v62[5] count] || objc_msgSend((id)v56[5], "count"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NSRange v22 = [v18 mergeableString];
    unint64_t v23 = objc_msgSend(v44, "ic_selectedRanges");
    unint64_t v24 = [v22 selectionForCharacterRanges:v23 selectionAffinity:v19 > 0];
  }
  else
  {
    unint64_t v24 = 0;
  }
  uint64_t v25 = (void *)v62[5];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_3;
  v47[3] = &unk_1E5FDC2C0;
  int64_t v49 = v19;
  id v26 = v18;
  id v48 = v26;
  [v25 enumerateIndexesWithOptions:2 usingBlock:v47];
  uint64_t v27 = (void *)v56[5];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_4;
  v45[3] = &unk_1E5FDC2E8;
  id v28 = v26;
  id v46 = v28;
  [v27 enumerateObjectsWithOptions:2 usingBlock:v45];
  [v28 endEditing];
  if (!v43 || v42)
  {
    uint64_t v34 = [v44 typingAttributes];
    id v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
    id v36 = [(ICTextController *)self indentParagraphStyle:v35 byAmount:v19];
    if (v36 != v35)
    {
      uint64_t v37 = (void *)[v34 mutableCopy];
      [v37 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F83220]];
      if (v41 >= [v28 length] && objc_msgSend(v28, "length"))
      {
        NSUInteger v21 = 0;
        unint64_t v41 = [v28 length] - 1;
      }
      id v38 = -[ICTextController nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:](v20, "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", v36, v41, v21, v28, v44);
      if (v38) {
        [v37 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
      }
      else {
        [v37 removeObjectForKey:*MEMORY[0x1E4FB0738]];
      }
      [v44 setTypingAttributes:v37];
    }
    if (v24) {
      goto LABEL_9;
    }
LABEL_19:
    uint64_t v39 = [v44 selectedRange];
    objc_msgSend(v44, "setSelectedRange:", v39, v40);
    goto LABEL_20;
  }
  if (!v24) {
    goto LABEL_19;
  }
LABEL_9:
  BOOL v29 = [v28 mergeableString];
  id v30 = [v29 characterRangesForSelection:v24];
  uint64_t v31 = [v30 firstObject];
  uint64_t v32 = [v31 rangeValue];
  objc_msgSend(v44, "setSelectedRange:", v32, v33);

LABEL_20:
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if ([v7 style] == 4)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v9 = [v8 invertedSet];

    id v10 = [*(id *)(a1 + 40) string];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_2;
    v15[3] = &unk_1E5FDC270;
    id v12 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v18 = v11;
    id v16 = v12;
    id v17 = v9;
    uint64_t v19 = *(void *)(a1 + 56);
    id v13 = v9;
    objc_msgSend(v10, "ic_enumerateContentLineRangesInRange:usingBlock:", a3, a4, v15);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "attachmentsExistInRange:textStorage:", a3, a4, *(void *)(a1 + 40)) & 1) == 0)
  {
    id v14 = [*(id *)(a1 + 32) indentParagraphStyle:v7 byAmount:*(void *)(a1 + 64)];
    if (v14 != v7) {
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4F83220], v14, a3, a4);
    }
  }
}

void __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(uint64_t *)(a1 + 64) < 1)
  {
    id v7 = [*(id *)(a1 + 32) string];
    uint64_t v8 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", *(void *)(a1 + 40), 0, a2, a3);

    uint64_t v9 = [@"    " length] * *(void *)(a1 + 64);
    if (v8 - a2 >= (unint64_t)-v9) {
      uint64_t v10 = -v9;
    }
    else {
      uint64_t v10 = v8 - a2;
    }
    if (v10) {
      BOOL v11 = v10 + 1 >= a3;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v13 = [MEMORY[0x1E4F29238] valueWithRange:a2];
      [v12 addObject:v13];
    }
  }
  else
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v5 addIndex:a2];
  }
}

uint64_t __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (*(uint64_t *)(result + 40) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    do
    {
      $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = objc_msgSend(*(id *)(v3 + 32), "replaceCharactersInRange:withString:", a2, 0, @"    ");
      ++v4;
    }
    while (v4 < *(void *)(v3 + 40));
  }
  return result;
}

uint64_t __86__ICTextController_indentRange_byAmount_inTextStorage_textView_forceUpdateAttributes___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 rangeValue];
  return objc_msgSend(v2, "deleteCharactersInRange:", v4, v3);
}

- (id)todoForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__47;
  uint64_t v20 = __Block_byref_object_dispose__47;
  id v21 = 0;
  if (location < [v6 length])
  {
    v24.NSUInteger length = [v6 length];
    v23.unint64_t location = location;
    v23.NSUInteger length = length;
    v24.unint64_t location = 0;
    NSRange v7 = NSIntersectionRange(v23, v24);
    uint64_t v8 = [v6 string];
    uint64_t v9 = objc_msgSend(v8, "paragraphRangeForRange:", v7.location, v7.length);
    uint64_t v11 = v10;

    uint64_t v12 = *MEMORY[0x1E4F83220];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__ICTextController_todoForRange_inTextStorage___block_invoke;
    v15[3] = &unk_1E5FDA328;
    void v15[4] = &v16;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v12, v9, v11, 0, v15);
  }
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __47__ICTextController_todoForRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    uint64_t v8 = [v12 todo];

    if (v8)
    {
      uint64_t v9 = [v12 todo];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *a5 = 1;
    }
  }
}

- (_NSRange)firstParagraphForSetListStyleRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  id v7 = [v6 string];
  uint64_t v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  uint64_t v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v12 = [v11 invertedSet];

  id v13 = [v6 string];
  uint64_t v14 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:range:", v12, 0, v8, v10);
  uint64_t v16 = v15;

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v8 = v14;
    uint64_t v17 = v16;
  }
  uint64_t v18 = [v6 string];

  uint64_t v19 = objc_msgSend(v18, "paragraphRangeForRange:", v8, v17);
  NSUInteger v21 = v20;

  NSUInteger v22 = v19;
  NSUInteger v23 = v21;
  result.NSUInteger length = v23;
  result.NSUInteger location = v22;
  return result;
}

uint64_t __66__ICTextController_canChangeStyleForSelectedRanges_inTextStorage___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (!a2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = *(unsigned char **)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *id v7 = 1;
    **(unsigned char **)(a1 + 48) = 1;
    *a5 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  return -[ICTextController setTextStyle:range:inTextStorage:inTextView:](self, "setTextStyle:range:inTextStorage:inTextView:", *(void *)&a3, a4.location, a4.length, a5, 0);
}

- (int64_t)setTextStyle:(unsigned int)a3 range:(_NSRange)a4 inTextStorage:(id)a5 inTextView:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = *(void *)&a3;
  id v11 = a5;
  id v12 = a6;
  [v11 beginEditing];
  int64_t v13 = -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:", v9, ICTTNamedStyleIsList() ^ 1, location, length, v11, v12);
  if ([v11 editedRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [v11 string];
    uint64_t v15 = objc_msgSend(v14, "paragraphRangeForRange:", location, length);
    uint64_t v17 = v16;

    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4F83210], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4F83240], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4F83228], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4F83230], v15, v17);
    objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4FB0720], v15, v17);
    uint64_t v18 = *MEMORY[0x1E4F83220];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__ICTextController_setTextStyle_range_inTextStorage_inTextView___block_invoke;
    v26[3] = &unk_1E5FDC388;
    id v27 = v11;
    objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v18, location, length, 0x100000, v26);
  }
  [v11 endEditing];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v19 = [v11 string];
    uint64_t v20 = objc_msgSend(v19, "paragraphRangeForRange:", location, length);

    if (v20) {
      uint64_t v21 = v20 - 1;
    }
    else {
      uint64_t v21 = 0;
    }
    NSUInteger v22 = [v12 textLayoutManager];
    NSUInteger v23 = objc_msgSend(v22, "ic_textRangeForRange:", v21, 1);

    NSRange v24 = [v12 textLayoutManager];
    [v24 invalidateLayoutForRange:v23];
  }
  return v13;
}

uint64_t __64__ICTextController_setTextStyle_range_inTextStorage_inTextView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a2;
  if (v7)
  {
    uint64_t v10 = (void *)v7;
    uint64_t v7 = [(id)v7 indent];
    if (v7)
    {
      uint64_t v7 = [v10 isList];
      if ((v7 & 1) == 0)
      {
        uint64_t v8 = (void *)[v10 mutableCopy];
        [v8 setIndent:0];
        objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4F83220], v8, a3, a4);
      }
    }
  }
  return MEMORY[0x1F41817F8](v7);
}

- (BOOL)containsOnlyStyle:(unsigned int)a3 inRange:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F837F8], "range:liesWithinRange:assert:", location, length, 0, objc_msgSend(v8, "length"), 1);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__ICTextController_containsOnlyStyle_inRange_inTextStorage___block_invoke;
    v15[3] = &unk_1E5FDC3B0;
    unsigned int v18 = a3;
    id v16 = v8;
    uint64_t v17 = &v19;
    objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", v12, v13, 0, v15);
    BOOL v11 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

void __60__ICTextController_containsOnlyStyle_inRange_inTextStorage___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  BOOL v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];

  if (a4)
  {
    unint64_t v12 = a3 + a4;
    unint64_t v13 = a3 + a4 - 1;
    while (a3 < v12)
    {
      unint64_t v18 = 0;
      unint64_t v19 = 0;
      unint64_t v17 = 0;
      uint64_t v14 = [*(id *)(a1 + 32) string];
      objc_msgSend(v14, "getParagraphStart:end:contentsEnd:forRange:", &v19, &v18, &v17, a3, 0);

      unint64_t v15 = v19;
      if (v19 <= a3) {
        unint64_t v15 = a3;
      }
      unint64_t v16 = v17;
      a3 = v18;
      if (v17 >= v13) {
        unint64_t v16 = v13;
      }
      if (v15 < v16)
      {
        if (!v11 && [v10 style] != *(_DWORD *)(a1 + 48))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a5 = 1;
        }
        break;
      }
    }
  }
}

- (void)removeFontsAndColorsForRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4F83208];
  uint64_t v8 = *MEMORY[0x1E4F83208];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke;
  v12[3] = &unk_1E5FDA328;
  void v12[4] = &v13;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0x100000, v12);
  id v9 = (void *)MEMORY[0x1E4F83218];
  if (*((unsigned char *)v14 + 24)
    || (uint64_t v10 = *MEMORY[0x1E4F83218],
        v11[0] = MEMORY[0x1E4F143A8],
        v11[1] = 3221225472,
        v11[2] = __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke_2,
        v11[3] = &unk_1E5FDA328,
        v11[4] = &v13,
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0x100000, v11),
        *((unsigned char *)v14 + 24)))
  {
    objc_msgSend(v6, "removeAttribute:range:", *v7, location, length);
    objc_msgSend(v6, "removeAttribute:range:", *v9, location, length);
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __63__ICTextController_removeFontsAndColorsForRange_inTextStorage___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:(_NSRange)a3 textStorage:(id)a4 textView:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a5;
  id v9 = [(ICTextController *)self keyboardLanguageForTextView:v8];
  id v13 = v9;
  if (v9 && (v10 = [v9 isEqualToString:@"dictation"], id v11 = v13, (v10 & 1) == 0))
  {
    unint64_t v12 = (void *)MEMORY[0x1E4FB0850];
  }
  else
  {
    unint64_t v12 = (void *)MEMORY[0x1E4FB0850];
    id v11 = 0;
  }
  -[ICTextController setParagraphWritingDirectionInRange:toDirection:inTextView:](self, "setParagraphWritingDirectionInRange:toDirection:inTextView:", location, length, [v12 defaultWritingDirectionForLanguage:v11], v8);
}

- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6
{
  return -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:inTextView:", *(void *)&a3, a4, a5.location, a5.length, a6, 0);
}

- (int64_t)setTextStyle:(unsigned int)a3 removeExtraStyling:(BOOL)a4 range:(_NSRange)a5 inTextStorage:(id)a6 inTextView:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  BOOL v10 = a4;
  uint64_t v11 = *(void *)&a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__47;
  int64_t v54 = __Block_byref_object_dispose__47;
  id v55 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:v11];
  uint64_t v15 = [v13 string];
  uint64_t v16 = objc_msgSend(v15, "paragraphRangeForRange:", location, length);
  uint64_t v18 = v17;

  if ([(id)v51[5] wantsFollowingNewLine])
  {
    if (v16 == [v13 length])
    {
      [v13 breakUndoCoalescing];
      unint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v16, v18, v19);

      uint64_t v18 = 1;
      -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v16, 1);
      uint64_t v20 = -1;
    }
    else
    {
      uint64_t v20 = 0;
    }
    -[ICTextController updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:](self, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v16, v18, v13, v14);
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v35 = v14;
  char v21 = objc_msgSend((id)v51[5], "isList", self);
  int64_t v34 = v20;
  BOOL v22 = [(id)v51[5] style] == 102;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  void v49[3] = 1;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  if ([(id)v51[5] isList])
  {
    NSUInteger v23 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    NSRange v24 = [v23 invertedSet];

    uint64_t v25 = [v13 string];
    uint64_t v26 = objc_msgSend(v25, "rangeOfCharacterFromSet:options:range:", v24, 0, v16, v18);

    BOOL v27 = v26 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v27 = 0;
    NSRange v24 = 0;
  }
  [v13 beginEditing];
  id v28 = [v13 string];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __83__ICTextController_setTextStyle_removeExtraStyling_range_inTextStorage_inTextView___block_invoke;
  v36[3] = &unk_1E5FDC3D8;
  char v43 = v21;
  BOOL v44 = v27;
  id v29 = v13;
  id v37 = v29;
  id v30 = v24;
  int v42 = v11;
  BOOL v45 = v10;
  BOOL v46 = v22;
  id v38 = v30;
  uint64_t v39 = v47;
  uint64_t v40 = v49;
  unint64_t v41 = &v50;
  objc_msgSend(v28, "ic_enumerateParagraphsInRange:usingBlock:", v16, v18, v36);

  if (v10) {
    objc_msgSend(v33, "removeFontsAndColorsForRange:inTextStorage:", v16, v18, v29);
  }
  [v29 endEditing];
  [v29 breakUndoCoalescing];
  uint64_t v31 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v31 removeAutocorrectPrompt];

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v50, 8);

  return v34;
}

void __83__ICTextController_setTextStyle_removeExtraStyling_range_inTextStorage_inTextView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = a3 - a2;
  id v9 = (uint64_t *)MEMORY[0x1E4F83220];
  if (*(unsigned char *)(a1 + 76) && !*(unsigned char *)(a1 + 77))
  {
    uint64_t v11 = [*(id *)(a1 + 32) string];
    uint64_t v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", *(void *)(a1 + 40), 0, a2, v8);

    id v13 = [*(id *)(a1 + 32) attribute:*v9 atIndex:a2 effectiveRange:0];
    id v14 = v13;
    BOOL v10 = v12 != 0x7FFFFFFFFFFFFFFFLL || v13 && ([v13 isList] & 1) != 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  id v31 = [*(id *)(a1 + 32) attribute:*v9 atIndex:a2 effectiveRange:0];
  uint64_t v15 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB06B8] atIndex:a2 effectiveRange:0];
  uint64_t v16 = (void *)v15;
  if (*(_DWORD *)(a1 + 72) != 4 || v15 == 0)
  {
    char v18 = 0;
    if (!v10) {
      goto LABEL_27;
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v18 = isKindOfClass ^ 1;
    if (!v10) {
      goto LABEL_27;
    }
  }
  if (v18)
  {
LABEL_27:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                           + 24) != 0;
    goto LABEL_40;
  }
  if (!v31)
  {
    if (*(unsigned char *)(a1 + 79)
      && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 2uLL)
    {
      BOOL v22 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) mutableCopy];
      [v22 setStartingItemNumber:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
      NSRange v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    if (([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEqual:0] & 1) == 0)
    {
      uint64_t v25 = *(void **)(a1 + 32);
      uint64_t v26 = *v9;
      BOOL v27 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
      objc_msgSend(v25, "addAttribute:value:range:", v26, v27, a2, v8);
    }
    goto LABEL_39;
  }
  uint64_t v20 = (void *)[v31 mutableCopy];
  [v20 setStyle:*(unsigned int *)(a1 + 72)];
  if (*(unsigned char *)(a1 + 78)) {
    [v20 setAlignment:*MEMORY[0x1E4F83258]];
  }
  if (*(unsigned char *)(a1 + 79)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 2uLL)
  {
    if ([v20 indent]) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    [v20 setStartingItemNumber:v21];
  }
  if (([v20 isEqual:v31] & 1) == 0)
  {
    id v28 = *(void **)(a1 + 32);
    uint64_t v29 = *v9;
    id v30 = (void *)[v20 copy];
    objc_msgSend(v28, "addAttribute:value:range:", v29, v30, a2, v8);
  }
  if (![v31 indent])
  {
LABEL_39:
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
LABEL_40:
  if (*(unsigned char *)(a1 + 77)) {
    *a5 = 1;
  }
}

- (void)setTypingAttributesForUndo:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"View"];
  id v6 = [v4 objectForKeyedSubscript:@"Attrs"];

  uint64_t v7 = [(ICTextController *)self note];
  uint64_t v8 = [v7 textStorage];
  id v9 = [v8 undoManager];

  v13[0] = @"Attrs";
  BOOL v10 = [v5 typingAttributes];
  v13[1] = @"View";
  v14[0] = v10;
  v14[1] = v5;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v9 registerUndoWithTarget:self selector:sel_setTypingAttributesForUndo_ object:v11];

  uint64_t v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Style Change" value:@"Style Change" table:0 allowSiri:1];
  [v9 setActionName:v12];

  [v5 setTypingAttributes:v6];
}

- (void)setTypingTextStyle:(unsigned int)a3 textView:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v37[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 typingAttributes];
  uint64_t v8 = (void *)[v7 mutableCopy];

  id v9 = (void *)MEMORY[0x1E4F83220];
  BOOL v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  int IsList = ICTTNamedStyleIsList();
  uint64_t v12 = [(ICTextController *)self note];
  id v13 = [v12 textStorage];
  int v14 = [v13 wantsUndoCommands];

  if (v14)
  {
    uint64_t v15 = [(ICTextController *)self note];
    uint64_t v16 = [v15 textStorage];
    uint64_t v17 = [v16 undoManager];

    v36[0] = @"Attrs";
    char v18 = [v6 typingAttributes];
    v36[1] = @"View";
    v37[0] = v18;
    v37[1] = v6;
    unint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v17 registerUndoWithTarget:self selector:sel_setTypingAttributesForUndo_ object:v19];

    id v9 = (void *)MEMORY[0x1E4F83220];
    uint64_t v20 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Style Change" value:@"Style Change" table:0 allowSiri:1];
    [v17 setActionName:v20];
  }
  if (v10) {
    id v21 = (id)[v10 mutableCopy];
  }
  else {
    id v21 = objc_alloc_init(MEMORY[0x1E4F834E0]);
  }
  BOOL v22 = v21;
  [v21 setStyle:v4];
  [v8 setObject:v22 forKeyedSubscript:*v9];
  uint64_t v23 = -[ICTTTextController preferredAttributesForICTTTextStyle:](self, "preferredAttributesForICTTTextStyle:", [v22 style]);
  [v8 addEntriesFromDictionary:v23];

  if (IsList)
  {
    NSRange v24 = [v6 typingAttributes];
    uint64_t v25 = (void *)MEMORY[0x1E4F83208];
    uint64_t v26 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F83208]];
    [v8 setObject:v26 forKeyedSubscript:*v25];

    BOOL v27 = [v6 typingAttributes];
    uint64_t v28 = *MEMORY[0x1E4FB06F8];
    uint64_t v29 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    [v8 setObject:v29 forKeyedSubscript:v28];

    id v30 = [v6 typingAttributes];
    id v31 = (void *)MEMORY[0x1E4F83218];
    uint64_t v32 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F83218]];
    [v8 setObject:v32 forKeyedSubscript:*v31];

    uint64_t v33 = [v6 typingAttributes];
    uint64_t v34 = *MEMORY[0x1E4FB0700];
    id v35 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4FB0700]];
    [v8 setObject:v35 forKeyedSubscript:v34];
  }
  [v6 setTypingAttributes:v8];
}

- (BOOL)setDone:(BOOL)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  BOOL v7 = a3;
  id v8 = a5;
  v46.NSUInteger length = [v8 length];
  v45.NSUInteger location = location;
  v45.NSUInteger length = length;
  v46.NSUInteger location = 0;
  NSRange v9 = NSIntersectionRange(v45, v46);
  unint64_t v43 = 0;
  unint64_t v44 = 0;
  uint64_t v42 = 0;
  BOOL v10 = [v8 string];
  objc_msgSend(v10, "getParagraphStart:end:contentsEnd:forRange:", &v44, &v43, &v42, v9.location, v9.length);

  unint64_t v11 = v44;
  BOOL v12 = v44 == v42 && v7;
  if (!v12)
  {
    BOOL v13 = v7;
    BOOL v38 = v12;
    unint64_t v14 = v43;
    objc_opt_class();
    uint64_t v15 = ICDynamicCast();
    [v15 setHasUserEditSinceFixupAfterEditing:1];

    [v8 beginEditing];
    if (v14 > v11)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F83220];
      unint64_t v17 = v11;
      BOOL v37 = v7;
      do
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        char v18 = objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", *v16, v17, &v40, v11, v14 - v11);
        unint64_t v19 = v18;
        if (v18)
        {
          if ([v18 style] == 103)
          {
            uint64_t v20 = [v19 todo];
            if (v20)
            {
              id v21 = (void *)v20;
              BOOL v22 = [v19 todo];
              uint64_t v23 = v16;
              int v24 = [v22 done];

              BOOL v25 = v24 == v13;
              uint64_t v16 = v23;
              if (!v25)
              {
                uint64_t v26 = (void *)[v19 mutableCopy];
                BOOL v27 = [v26 todo];
                uint64_t v28 = [v27 todoWithDone:v13];
                [v26 setTodo:v28];

                uint64_t v29 = [(ICTextController *)self note];
                LOBYTE(v28) = objc_opt_respondsToSelector();

                if (v28)
                {
                  id v30 = [(ICTextController *)self note];
                  id v31 = [(ICTextController *)self note];
                  uint64_t v32 = [v26 todo];
                  id v33 = (id)[v30 persistToggleChecklistItemActivityEventForObject:v31 todo:v32];

                  BOOL v13 = v37;
                }
                objc_opt_class();
                uint64_t v34 = ICCheckedDynamicCast();
                [v34 beginSkippingTimestampUpdates];
                uint64_t v16 = v23;
                objc_msgSend(v34, "addAttribute:value:range:", *v23, v26, v40, v41);
                [v34 endSkippingTimestampUpdates];
                if (v34) {
                  [(ICTextController *)self refreshTypingAttributesForAllTextViewsOfTextStorage:v34];
                }
              }
            }
          }
        }
        unint64_t v17 = v41 + v40;
      }
      while (v17 < v14);
    }
    [v8 endEditing];
    BOOL v12 = v38;
  }
  BOOL v35 = !v12;

  return v35;
}

- (void)refreshTypingAttributesForAllTextViewsOfTextStorage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(v4, "textViews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ICTextController *)self refreshTypingAttributesForTextView:*(void *)(*((void *)&v10 + 1) + 8 * v9++) textStorage:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)refreshTypingAttributesForTextView:(id)a3 textStorage:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [v7 selectedRange];
    uint64_t v10 = v9;
    id v12 = [v7 typingAttributes];
    long long v11 = -[ICTTTextController typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:](self, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v8, v10, 1, v12, v6);

    [v7 setTypingAttributes:v11];
  }
}

- (BOOL)isTodoDoneRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  id v7 = [v6 string];
  uint64_t v8 = objc_msgSend(v7, "paragraphRangeForRange:", location, length);
  uint64_t v10 = v9;

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v11 = *MEMORY[0x1E4F83220];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __50__ICTextController_isTodoDoneRange_inTextStorage___block_invoke;
  v13[3] = &unk_1E5FDA328;
  v13[4] = &v14;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v11, v8, v10, 0, v13);
  LOBYTE(v8) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __50__ICTextController_isTodoDoneRange_inTextStorage___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a2;
  if (v11)
  {
    uint64_t v7 = [v11 todo];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v11 todo];
      char v10 = [v9 done];

      if ((v10 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *a5 = 1;
      }
    }
  }
}

- (void)scaleFontPointSize:(double)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  [v9 beginEditing];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ICTextController_scaleFontPointSize_range_inTextStorage___block_invoke;
  v12[3] = &unk_1E5FDC400;
  double v14 = a3;
  void v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v12);
  [v11 endEditing];
}

void __59__ICTextController_scaleFontPointSize_range_inTextStorage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) scaleFont:a2 withScale:*(double *)(a1 + 48)];
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v7, a3, a4);
  }
}

- (id)scaleFont:(id)a3 withScale:(double)a4
{
  id v5 = a3;
  [v5 pointSize];
  id v7 = [v5 fontWithSize:v6 * a4];

  return v7;
}

- (void)superscriptUpdate:(id)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  [v10 beginEditing];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3010000000;
  v22[3] = &unk_1B0BF84BB;
  v22[4] = location;
  v22[5] = length;
  uint64_t v11 = *MEMORY[0x1E4F83230];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __58__ICTextController_superscriptUpdate_range_inTextStorage___block_invoke;
  char v17 = &unk_1E5FDC428;
  id v12 = v9;
  id v20 = v12;
  id v13 = v10;
  id v21 = v22;
  id v18 = v13;
  unint64_t v19 = self;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, location, length, 0, &v14);
  objc_msgSend(v13, "endEditing", v14, v15, v16, v17);

  _Block_object_dispose(v22, 8);
}

void __58__ICTextController_superscriptUpdate_range_inTextStorage___block_invoke(void *a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v7 = a1[6];
  id v8 = a2;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, [v8 integerValue]);
  id v10 = (void *)a1[4];
  uint64_t v11 = *MEMORY[0x1E4F83230];
  if (v9)
  {
    id v12 = [NSNumber numberWithInteger:v9];
    v21.NSUInteger location = a3;
    v21.NSUInteger length = a4;
    NSRange v13 = NSIntersectionRange(*(NSRange *)(*(void *)(a1[7] + 8) + 32), v21);
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, v13.location, v13.length);

    uint64_t v14 = [v8 integerValue];
    if (!v14)
    {
      uint64_t v15 = (void *)a1[5];
      +[ICTTTextController superscriptScaleFactor];
      uint64_t v17 = a1[4];
LABEL_6:
      objc_msgSend(v15, "scaleFontPointSize:range:inTextStorage:", a3, a4, v17, v16);
    }
  }
  else
  {
    v22.NSUInteger location = a3;
    v22.NSUInteger length = a4;
    NSRange v18 = NSIntersectionRange(*(NSRange *)(*(void *)(a1[7] + 8) + 32), v22);
    objc_msgSend(v10, "removeAttribute:range:", v11, v18.location, v18.length);
    uint64_t v19 = [v8 integerValue];

    if (v19)
    {
      uint64_t v15 = (void *)a1[5];
      +[ICTTTextController superscriptScaleFactor];
      uint64_t v17 = a1[4];
      double v16 = 1.0 / v20;
      goto LABEL_6;
    }
  }
  *(void *)(*(void *)(a1[7] + 8) + 32) = a3 + a4;
}

- (void)superscriptDelta:(int64_t)a3 range:(_NSRange)a4 inTextStorage:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ICTextController_superscriptDelta_range_inTextStorage___block_invoke;
  v5[3] = &__block_descriptor_40_e8_q16__0q8l;
  v5[4] = a3;
  -[ICTextController superscriptUpdate:range:inTextStorage:](self, "superscriptUpdate:range:inTextStorage:", v5, a4.location, a4.length, a5);
}

uint64_t __57__ICTextController_superscriptDelta_range_inTextStorage___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) + a2;
}

- (void)unscriptRange:(_NSRange)a3 inTextStorage:(id)a4
{
}

uint64_t __48__ICTextController_unscriptRange_inTextStorage___block_invoke()
{
  return 0;
}

uint64_t __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 rangeValue];
  if (v6 >= [v5 rangeValue])
  {
    unint64_t v8 = [v4 rangeValue];
    uint64_t v7 = v8 > [v5 rangeValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __71__ICTextController_ensureUniqueParagraphStyleUUIDsInTextStorage_range___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F83220];
  id v8 = a3;
  uint64_t v6 = [a2 rangeValue];
  objc_msgSend(v4, "addAttribute:value:range:", v5, v8, v6, v7);
}

- (void)updateAttachmentsSelectionStateInTextStorage:(id)a3 forSelectedRanges:(id)a4 layoutManager:(id)a5 textView:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4FB06B8];
  id v11 = a3;
  uint64_t v12 = [v11 length];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke;
  v15[3] = &unk_1E5FDA0A8;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v12, 0, v15);
}

void __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke_2;
  aBlock[3] = &unk_1E5FDC528;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  id v8 = (uint64_t (**)(void))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v9 = [*(id *)(a1 + 40) viewForTextAttachmentNoCreate:v7];
    uint64_t v10 = ICDynamicCast();

    [v10 setSelected:v8[2](v8)];
  }
}

uint64_t __106__ICTextController_updateAttachmentsSelectionStateInTextStorage_forSelectedRanges_layoutManager_textView___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v16.NSUInteger location = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "rangeValue", (void)v10);
        v16.NSUInteger length = v7;
        if (NSIntersectionRange(*(NSRange *)(a1 + 40), v16).length)
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

- (void)insertNewlineAtCharacterIndex:(unint64_t)a3 textStorage:(id)a4
{
  id v6 = a4;
  [v6 breakUndoCoalescing];
  NSUInteger v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
  objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", a3, 0, v7);

  -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", a3, 1);
}

- (void)toggleBlockQuoteInTextView:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 textStorage];
  id v6 = [v5 string];
  uint64_t v7 = [v4 selectedRange];
  uint64_t v9 = objc_msgSend(v6, "paragraphRangeForRange:", v7, v8);
  uint64_t v11 = v10;

  objc_opt_class();
  long long v12 = [v4 textStorage];
  long long v13 = ICDynamicCast();

  uint64_t v14 = [(ICTextController *)self note];
  int v15 = [v14 isEmpty];

  NSRange v16 = [v4 textStorage];
  uint64_t v17 = [v16 length];

  if (v9 == v17)
  {
    NSRange v18 = [v13 attribute:*MEMORY[0x1E4F83220] atIndex:v9 effectiveRange:0];
    if (!v18)
    {
      NSRange v18 = objc_msgSend(MEMORY[0x1E4F834E8], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
    }
    id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v42 = *MEMORY[0x1E4FB0738];
    v43[0] = v18;
    uint64_t v20 = 1;
    NSRange v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    NSRange v22 = (void *)[v19 initWithString:@"\n" attributes:v21];

    [v13 breakUndoCoalescing];
    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v9, v11, v22);
    -[ICTextController trackExtraNewLineRangeIfNecessary:](self, "trackExtraNewLineRangeIfNecessary:", v9, 1);
    -[ICTextController updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:](self, "updateParagraphWritingDirectionToKeyboardWritingDirectionInRange:textStorage:textView:", v9, 1, v13, v4);
    objc_msgSend(v4, "setSelectedRange:", v9, 0);
    if (v15) {
      -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"), 0, v9, 1, v13);
    }

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v20 = v11;
  }
  uint64_t v23 = [v4 textStorage];
  [v23 beginEditing];

  int v24 = [v4 textLayoutManager];
  BOOL v25 = objc_msgSend(v24, "ic_textRangeForRange:", v9, v20);

  BOOL v26 = [(ICTextController *)self selectionContainsBlockQuoteAndOthers:v4];
  BOOL v27 = [v4 textLayoutManager];
  uint64_t v28 = [v27 textContentManager];
  uint64_t v29 = [v25 location];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __47__ICTextController_toggleBlockQuoteInTextView___block_invoke;
  void v37[3] = &unk_1E5FDC550;
  id v38 = v4;
  uint64_t v39 = v9;
  uint64_t v40 = v11;
  BOOL v41 = v26;
  id v30 = v4;
  id v31 = (id)[v28 enumerateTextElementsFromLocation:v29 options:0 usingBlock:v37];

  uint64_t v32 = [v30 textStorage];
  [v32 endEditing];

  id v33 = [v30 textStorage];
  uint64_t v34 = [v33 attributesAtIndex:v9 effectiveRange:0];
  BOOL v35 = (void *)[v34 mutableCopy];
  [v30 setTypingAttributes:v35];

  id v36 = [(ICTextController *)self note];
  [v36 updateModificationDateAndChangeCountAndSaveAfterDelay];
}

uint64_t __47__ICTextController_toggleBlockQuoteInTextView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 textLayoutManager];
  id v6 = [v4 elementRange];

  unint64_t v7 = objc_msgSend(v5, "ic_rangeForTextRange:", v6);
  uint64_t v9 = v8;

  uint64_t v10 = [*(id *)(a1 + 32) textStorage];
  uint64_t v11 = (void *)MEMORY[0x1E4F83220];
  long long v12 = [v10 attribute:*MEMORY[0x1E4F83220] atIndex:v7 effectiveRange:0];

  long long v13 = [*(id *)(a1 + 32) textStorage];
  uint64_t v14 = [v13 attribute:*MEMORY[0x1E4FB06B8] atIndex:v7 effectiveRange:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && *(void *)(a1 + 48) + *(void *)(a1 + 40) > v7 && v12)
    {
      if (!*(unsigned char *)(a1 + 56))
      {
        int v15 = (void *)[v12 mutableCopy];
        objc_msgSend(v15, "setBlockQuoteLevel:", objc_msgSend(v12, "isBlockQuote") ^ 1);
        NSRange v18 = [*(id *)(a1 + 32) textStorage];
        objc_msgSend(v18, "addAttribute:value:range:", *v11, v15, v7, v9);

        uint64_t v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
LABEL_10:
        }
          __47__ICTextController_toggleBlockQuoteInTextView___block_invoke_cold_1(v12, v15);
LABEL_11:

        goto LABEL_12;
      }
      if (([v12 isBlockQuote] & 1) == 0)
      {
        int v15 = (void *)[v12 mutableCopy];
        [v15 setBlockQuoteLevel:1];
        NSRange v16 = [*(id *)(a1 + 32) textStorage];
        objc_msgSend(v16, "addAttribute:value:range:", *v11, v15, v7, v9);

        uint64_t v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_12:

  return 1;
}

- (BOOL)selectionContainsBlockQuoteAndOthers:(id)a3
{
  id v3 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  id v4 = [v3 textStorage];
  uint64_t v5 = [v4 string];
  uint64_t v6 = [v3 selectedRange];
  int v8 = objc_msgSend(v5, "ic_rangeIsValid:", v6, v7);

  if (v8)
  {
    uint64_t v9 = [v3 textStorage];
    uint64_t v10 = [v9 string];
    uint64_t v11 = [v3 selectedRange];
    uint64_t v13 = objc_msgSend(v10, "paragraphRangeForRange:", v11, v12);
    uint64_t v15 = v14;

    NSRange v16 = [v3 textStorage];
    uint64_t v17 = *MEMORY[0x1E4F83220];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__ICTextController_selectionContainsBlockQuoteAndOthers___block_invoke;
    v20[3] = &unk_1E5FDC578;
    id v21 = v3;
    NSRange v22 = v27;
    uint64_t v23 = v25;
    int v24 = &v29;
    objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v17, v13, v15, 0, v20);
  }
  char v18 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __57__ICTextController_selectionContainsBlockQuoteAndOthers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [*(id *)(a1 + 32) textStorage];
  uint64_t v10 = [v9 attribute:*MEMORY[0x1E4FB06B8] atIndex:a3 effectiveRange:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    objc_opt_class();
    int v11 = objc_opt_isKindOfClass() ^ 1;
  }
  if (!v15) {
    goto LABEL_16;
  }
  if ([v15 isBlockQuote])
  {
    uint64_t v12 = *(void *)(a1 + 40);
  }
  else
  {
    int v13 = (v10 != 0) & v11;
    if (!v10) {
      int v13 = 1;
    }
    if (v13 != 1) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void *)(a1 + 48);
  }
  *(unsigned char *)(*(void *)(v12 + 8) + 24) = 1;
LABEL_12:
  char v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v14) {
    char v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v14;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a5 = 1;
  }
LABEL_16:
}

- (BOOL)insertNewlineForSpecialCasesInTextView:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 selectedRange];
  if (v5) {
    goto LABEL_18;
  }
  uint64_t v6 = [v4 textStorage];
  uint64_t v7 = [v4 selectedRange];
  uint64_t v52 = 0;
  unint64_t v53 = 0;
  uint64_t v51 = 0;
  id v8 = [v6 string];
  uint64_t v9 = [v4 selectedRange];
  objc_msgSend(v8, "getParagraphStart:end:contentsEnd:forRange:", &v53, &v52, &v51, v9, v10);

  unint64_t v11 = v53;
  uint64_t v12 = 0;
  if (v11 >= [v6 length]
    || ([v6 attribute:*MEMORY[0x1E4F83220] atIndex:v53 effectiveRange:0],
        int v13 = objc_claimAutoreleasedReturnValue(),
        (uint64_t v12 = v13) == 0)
    || ![v13 isList])
  {
    unint64_t v14 = v7 - 1;
    id v15 = [v6 attributedString];
    unint64_t v16 = [v15 length];

    if (v14 < v16)
    {
      uint64_t v17 = [v6 attributedString];
      char v18 = [v17 attribute:*MEMORY[0x1E4F83220] atIndex:v14 effectiveRange:0];

      id v19 = [v6 attributedString];
      uint64_t v20 = [v19 string];
      id v21 = objc_msgSend(v20, "substringWithRange:", v14, 1);

      if ([v18 blockQuoteLevel] && objc_msgSend(v21, "isEqualToString:", @"\n"))
      {
        [(ICTextController *)self toggleBlockQuoteInTextView:v4];
        NSRange v22 = [(ICTTTextController *)self bodyAttributes];
        [v4 setTypingAttributes:v22];
      }
      if (ICInternalSettingsIsCollapsibleSectionsEnabled())
      {
        objc_opt_class();
        uint64_t v23 = [v4 textLayoutManager];
        int v24 = [v23 textContentManager];
        BOOL v25 = ICDynamicCast();
        char v26 = [v25 outlineController];

        BOOL v27 = [v18 uuid];
        LODWORD(v24) = [v26 isUUIDCollapsed:v27];

        if (v24)
        {
          char v28 = [v6 attributesAtIndex:v53 effectiveRange:0];
          uint64_t v29 = (uint64_t *)MEMORY[0x1E4F83220];
          uint64_t v50 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];

          uint64_t v54 = *v29;
          id v30 = objc_msgSend(MEMORY[0x1E4F834E8], "paragraphStyleNamed:", objc_msgSend(v50, "style"));
          v55[0] = v30;
          int64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];

          uint64_t v31 = [v18 uuid];
          uint64_t v32 = [v26 descendantRangeForUUID:v31];
          uint64_t v34 = v33;

          uint64_t v35 = v32 + v34;
          id v36 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v49];
          objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v35, 0, v36);

          objc_msgSend(v4, "setSelectedRange:", v35, 0);
          goto LABEL_23;
        }
      }
    }
    goto LABEL_17;
  }
  if (v53 != v51)
  {
    [v6 breakUndoCoalescing];
LABEL_17:

LABEL_18:
    BOOL v37 = 0;
    goto LABEL_19;
  }
  if ([v12 indent])
  {
    -[ICTextController indentRange:byAmount:inTextStorage:textView:](self, "indentRange:byAmount:inTextStorage:textView:", v53, 0, -1, v6, v4);
  }
  else
  {
    -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v53, 0, v6);
    uint64_t v39 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"body" value:@"body" table:0 allowSiri:1];
    uint64_t v40 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"exited list" value:@"exited list" table:0 allowSiri:1];
    uint64_t v47 = __ICAccessibilityStringForVariables(1, v39, v41, v42, v43, v44, v45, v46, (uint64_t)v40);

    ICAccessibilityPostHighPriorityAnnouncementNotification(0, v47);
  }
  char v48 = [v6 attributesAtIndex:v53 effectiveRange:0];
  [v4 setTypingAttributes:v48];

  [v6 breakUndoCoalescing];
LABEL_23:

  if [v4 conformsToProtocol:&unk_1F0A65AB8] && (objc_opt_respondsToSelector()) {
    [v4 textControllerDidHandleSpecialCaseEditing:self];
  }
  BOOL v37 = 1;
LABEL_19:

  return v37;
}

- (BOOL)insertedSpaceInTextView:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (length
    || !+[ICTextStyle autoListInsertionEnabled]
    || [(ICTextController *)self isAutoListInsertionDisabled])
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v10 = [v7 textStorage];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v32 = 0;
    unint64_t v11 = [v10 string];
    uint64_t v12 = [v7 selectedRange];
    objc_msgSend(v11, "getParagraphStart:end:contentsEnd:forRange:", &v34, &v33, &v32, v12, v13);

    unint64_t v14 = [v10 attribute:*MEMORY[0x1E4F83220] atIndex:v34 effectiveRange:0];
    id v15 = v14;
    if (v14 && ([v14 isList] & 1) != 0)
    {
      BOOL v8 = 0;
    }
    else
    {
      unint64_t v16 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^(?:(\\* |•)|(-)|(^(?!^0)\\d+\\. |^(?!^0)\\d+\\))"), 0, 0);
      uint64_t v17 = [v10 string];
      char v18 = objc_msgSend(v16, "firstMatchInString:options:range:", v17, 4, v34, v32 - v34);

      if (v18 && (uint64_t v19 = [v18 range], v19 + v20 > location))
      {
        id v21 = [v10 undoManager];
        NSRange v22 = [v21 prepareWithInvocationTarget:self];
        objc_msgSend(v22, "setSelectionToIndex:onTextView:", objc_msgSend(v7, "selectedRange"), v7);

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke;
        v24[3] = &unk_1E5FDC5A0;
        id v25 = v18;
        uint64_t v29 = v34;
        uint64_t v30 = v32;
        id v23 = v10;
        uint64_t v31 = v33;
        id v26 = v23;
        BOOL v27 = self;
        id v28 = v7;
        [v23 saveSelectionDuringBlock:v24];

        BOOL v8 = 1;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

void __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke(uint64_t a1)
{
  v32.NSUInteger location = [*(id *)(a1 + 32) range];
  v33.NSUInteger location = *(void *)(a1 + 64);
  v33.NSUInteger length = *(void *)(a1 + 72) - v33.location;
  NSRange v2 = NSIntersectionRange(v32, v33);
  id v3 = (UIAccessibilityNotifications *)MEMORY[0x1E4FB06A8];
  if (v2.length == *(void *)(a1 + 72) - *(void *)(a1 + 64))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:");
    uint64_t v5 = *(void *)(a1 + 80);
    if (*(void *)(a1 + 72) == v5)
    {
      _UIAccessibilityBlockPostingOfNotification();
      dispatchMainAfterDelay();
      uint64_t v6 = *(void **)(a1 + 40);
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v4];
      [v6 appendAttributedString:v7];

      objc_msgSend(*(id *)(a1 + 48), "trackExtraNewLineRangeIfNecessary:", objc_msgSend(*(id *)(a1 + 40), "length") - 1, 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v4, *(void *)(a1 + 64), v5 - *(void *)(a1 + 64));
    }
  }
  BOOL v8 = [*(id *)(a1 + 40) string];
  uint64_t v9 = [*(id *)(a1 + 32) range];
  unint64_t v11 = objc_msgSend(v8, "substringWithRange:", v9, v10);

  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = [*(id *)(a1 + 32) range];
  objc_msgSend(v12, "deleteCharactersInRange:", v13, v14);
  uint64_t v15 = -1;
  do
  {
    if (v15 == 2)
    {
      uint64_t v18 = 0;
      uint64_t v17 = 101;
      goto LABEL_13;
    }
    uint64_t v16 = [*(id *)(a1 + 32) rangeAtIndex:v15 + 2];
    ++v15;
  }
  while (v16 == 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v17 = insertedSpaceInTextView_replacementRange__bulletStyles[v15];
  if (v15 == 2) {
    uint64_t v18 = [v11 integerValue];
  }
  else {
    uint64_t v18 = 0;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 48), "setTextStyle:removeExtraStyling:range:inTextStorage:", v17, 0, *(void *)(a1 + 64), 0, *(void *)(a1 + 40));
  if (v18)
  {
    uint64_t v19 = [*(id *)(a1 + 40) string];
    uint64_t v20 = objc_msgSend(v19, "paragraphRangeForRange:", *(void *)(a1 + 64), 0);
    uint64_t v22 = v21;

    id v23 = (void *)MEMORY[0x1E4F83220];
    int v24 = [*(id *)(a1 + 40) attribute:*MEMORY[0x1E4F83220] atIndex:*(void *)(a1 + 64) effectiveRange:0];
    id v25 = (void *)[v24 mutableCopy];
    [v25 setStartingItemNumber:v18];
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *v23, v25, v20, v22);
  }
  if (*(void *)(a1 + 56))
  {
    id v26 = [*(id *)(a1 + 40) attributesAtIndex:*(void *)(a1 + 64) effectiveRange:0];
    [*(id *)(a1 + 56) setTypingAttributes:v26];
  }
  BOOL v27 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Created list" value:@"Created list" table:0 allowSiri:1];
  UIAccessibilityPostNotification(*v3, *(id *)(a1 + 56));
  dispatch_time_t v28 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_3;
  block[3] = &unk_1E5FD8DF0;
  id v31 = v27;
  id v29 = v27;
  dispatch_after(v28, MEMORY[0x1E4F14428], block);
}

uint64_t __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_2()
{
  return MEMORY[0x1F4165090](*MEMORY[0x1E4FB06A8]);
}

void __61__ICTextController_insertedSpaceInTextView_replacementRange___block_invoke_3(uint64_t a1)
{
}

- (void)setSelectionToIndex:(unint64_t)a3 onTextView:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [v8 textStorage];
  unint64_t v6 = [v5 length];

  if (v6 >= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = v6;
  }
  objc_msgSend(v8, "setSelectedRange:", v7, 0);
}

- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 languageHasSpaces:(BOOL)a6
{
  LOBYTE(v6) = a6;
  -[ICTextController insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:](self, "insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:", a3, a4.location, a4.length, a5, 0, 0, v6, 0);
}

- (void)insertedText:(id)a3 replacementRange:(_NSRange)a4 inTextView:(id)a5 hashtagController:(id)a6 mentionsController:(id)a7 languageHasSpaces:(BOOL)a8 parentAttachment:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a3;
  id v16 = a5;
  id v60 = a6;
  id v17 = a7;
  id v58 = a9;
  uint64_t v18 = [v16 textStorage];
  objc_opt_class();
  uint64_t v57 = v15;
  uint64_t v59 = v17;
  if (objc_opt_isKindOfClass())
  {
    id v19 = v15;
  }
  else
  {
    id v19 = [v15 string];
  }
  uint64_t v20 = v19;
  NSUInteger v21 = [v19 length];
  v66.NSUInteger length = [v18 length];
  v65.NSUInteger location = location;
  v65.NSUInteger length = v21;
  v66.NSUInteger location = 0;
  NSRange v22 = NSIntersectionRange(v65, v66);
  if (insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__once != -1) {
    dispatch_once(&insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__once, &__block_literal_global_204);
  }
  id v23 = [(ICTextController *)self keyboardLanguageForTextView:v16];
  int v24 = v23;
  if (v23 && ([v23 isEqualToString:@"dictation"] & 1) == 0) {
    insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection = [MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:v24];
  }
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  id v25 = [v18 string];
  objc_msgSend(v25, "getParagraphStart:end:contentsEnd:forRange:", &v64, 0, &v63, v22.location, v22.length);

  if (!self->_userChangedWritingDirection && v64 == v22.location && v63 == v22.location + v22.length)
  {
    uint64_t v26 = objc_msgSend(v18, "safeCharacterRangeForRange:", location, objc_msgSend(v20, "length"));
    if (v27) {
      -[ICTextController setParagraphWritingDirectionInRange:toDirection:inTextView:](self, "setParagraphWritingDirectionInRange:toDirection:inTextView:", v26, v27, insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection, v16);
    }
  }
  if (![v20 isEqualToString:@"\n"] || length)
  {
    if ([v20 isEqualToString:@" "] && !length) {
      -[ICTextController insertedSpaceInTextView:replacementRange:](self, "insertedSpaceInTextView:replacementRange:", v16, location, 0);
    }
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    dispatch_time_t v28 = [v18 string];
    objc_msgSend(v28, "getParagraphStart:end:contentsEnd:forRange:", &v62, 0, &v61, v22.location + 1, 0);

    if (v61 == v62)
    {
      id v29 = [v18 string];
      uint64_t v30 = objc_msgSend(v29, "paragraphRangeForRange:", v22.location + 1, 0);
      uint64_t v32 = v31;

      if (v32)
      {
        NSRange v33 = [v18 attribute:*MEMORY[0x1E4F83220] atIndex:v30 effectiveRange:0];
        uint64_t v34 = v33;
        if (v33)
        {
          if ([v33 preferSingleLine])
          {
            -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v30, v32, v18);
            if (v16)
            {
              uint64_t v35 = [v18 attributesAtIndex:v30 effectiveRange:0];
              [v16 setTypingAttributes:v35];
            }
          }
        }
      }
    }
  }
  uint64_t v36 = [(ICTextController *)self attachmentInsertionController];
  if (v36
    && (BOOL v37 = (void *)v36,
        [(ICTextController *)self note],
        id v38 = objc_claimAutoreleasedReturnValue(),
        v38,
        v37,
        v38))
  {
    uint64_t v39 = [v18 string];
    NSUInteger v40 = [v39 length];

    if (v22.location + v22.length <= v40)
    {
      uint64_t v41 = [(ICTextController *)self mentionsController];
      uint64_t v42 = [(ICTextController *)self note];
      BYTE1(v54) = a8;
      LOBYTE(v54) = 0;
      char v43 = [v41 checkForMentionInEditedRange:v22.location ofTextStorage:v22.length note:v18 textView:v42 allowAutoExplicitMention:v16 isEndingEditing:1 languageHasSpaces:v54 parentAttachment:0];

      if ((v43 & 1) == 0)
      {
        uint64_t v44 = [(ICTextController *)self hashtagController];
        uint64_t v45 = [(ICTextController *)self note];
        id v56 = 0;
LABEL_40:
        BYTE1(v55) = a8;
        LOBYTE(v55) = 0;
        [v44 checkForHashtagInEditedRange:v22.location ofTextStorage:v22.length note:v18 textView:v45 allowAutoExplicitHashtag:v16 isEndingEditing:1 languageHasSpaces:v55 parentAttachment:v56];
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v46 = [(ICTextController *)self note];

      if (v46)
      {
        if (v60) {
          -[ICTextController setHashtagController:](self, "setHashtagController:");
        }
        if (v59) {
          -[ICTextController setMentionsController:](self, "setMentionsController:");
        }
        uint64_t v47 = [v18 string];
        NSUInteger v48 = [v47 length];

        if (v22.location + v22.length <= v48)
        {
          int64_t v49 = [(ICTextController *)self mentionsController];
          uint64_t v50 = [(ICTextController *)self note];
          BYTE1(v54) = a8;
          LOBYTE(v54) = 0;
          char v51 = [v49 checkForMentionInEditedRange:v22.location ofTextStorage:v22.length note:v18 textView:v50 allowAutoExplicitMention:v16 isEndingEditing:1 languageHasSpaces:v54 parentAttachment:v58];

          if ((v51 & 1) == 0)
          {
            uint64_t v44 = [(ICTextController *)self hashtagController];
            uint64_t v45 = [(ICTextController *)self note];
            id v56 = v58;
            goto LABEL_40;
          }
        }
      }
    }
  }
  if ([v20 containsString:@"\n"])
  {
    uint64_t v52 = [(ICTextController *)self mentionsController];
    unint64_t v53 = [(ICTextController *)self note];
    [v52 newlineEnteredInNote:v53];
  }
  self->_userChangedWritingDirection = 0;
}

uint64_t __133__ICTextController_insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment___block_invoke()
{
  uint64_t result = [MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:0];
  insertedText_replacementRange_inTextView_hashtagController_mentionsController_languageHasSpaces_parentAttachment__currentKeyboardWritingDirection = result;
  return result;
}

- (void)setParagraphWritingDirectionInRange:(_NSRange)a3 toDirection:(int64_t)a4 inTextView:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a5;
  uint64_t v9 = [v8 textStorage];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__47;
  uint64_t v35 = __Block_byref_object_dispose__47;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  dispatch_time_t v28 = __Block_byref_object_copy__47;
  uint64_t v10 = (void *)MEMORY[0x1E4F83220];
  id v29 = __Block_byref_object_dispose__47;
  id v30 = 0;
  uint64_t v11 = *MEMORY[0x1E4F83220];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __79__ICTextController_setParagraphWritingDirectionInRange_toDirection_inTextView___block_invoke;
  uint64_t v20 = &unk_1E5FDC5C8;
  NSRange v22 = &v31;
  int64_t v24 = a4;
  id v12 = v9;
  id v21 = v12;
  id v23 = &v25;
  objc_msgSend(v12, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v11, location, length, 0, &v17);
  if (v32[5] || v26[5])
  {
    uint64_t v13 = objc_msgSend(v8, "typingAttributes", v17, v18, v19, v20);
    uint64_t v14 = (void *)[v13 mutableCopy];

    uint64_t v15 = v32[5];
    if (v15) {
      [v14 setObject:v15 forKeyedSubscript:*v10];
    }
    uint64_t v16 = v26[5];
    if (v16) {
      [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
    }
    [v8 setTypingAttributes:v14];
  }
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __79__ICTextController_setParagraphWritingDirectionInRange_toDirection_inTextView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v22 = v7;
  if (v7)
  {
    uint64_t v8 = [v7 mutableCopy];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F834E0] paragraphStyleNamed:3];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setWritingDirection:*(void *)(a1 + 56)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) alignment]
    || [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) alignment] == 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAlignment:4];
  }
  uint64_t v11 = *MEMORY[0x1E4F83220];
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  objc_msgSend(v12, "addAttribute:value:range:", v11, v13, a3, a4);

  uint64_t v14 = *MEMORY[0x1E4FB0738];
  uint64_t v15 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB0738] atIndex:a3 effectiveRange:0];
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 mutableCopy];
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB0850], "ic_mutableDefaultParagraphStyle");
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setBaseWritingDirection:*(void *)(a1 + 56)];
  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) alignment]
    || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) alignment] == 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAlignment:4];
  }
  uint64_t v20 = *(void **)(a1 + 32);
  id v21 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
  objc_msgSend(v20, "addAttribute:value:range:", v14, v21, a3, a4);
}

- (BOOL)deleteBackwardForSpecialCasesInTextView:(id)a3
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 textStorage];
  uint64_t v6 = ICCheckedDynamicCast();

  [v4 selectedRange];
  if (v7)
  {
    uint64_t v8 = [v4 selectedRange];
    if (-[ICTextController removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:](self, "removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:", v4, v6, v8, v9, &__block_literal_global_212))
    {
      objc_msgSend(v4, "setSelectedRange:", v8, 0);
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  uint64_t v11 = [v6 string];
  uint64_t v12 = [v4 selectedRange];
  uint64_t v14 = objc_msgSend(v11, "paragraphRangeForRange:", v12, v13);
  uint64_t v16 = v15;

  uint64_t v17 = [v4 selectedRange];
  unint64_t v18 = v17;
  if (v17 == v14)
  {
    if (!v14)
    {
      if (-[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, 0, v16, 0))
      {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    if (!v17) {
      goto LABEL_28;
    }
    if (v17 != 1
      || -[ICTextController attachmentsExistInRange:textStorage:](self, "attachmentsExistInRange:textStorage:", 0, 1, v6))
    {
      id v19 = [v6 attribute:*MEMORY[0x1E4FB06B8] atIndex:v18 - 1 effectiveRange:0];
      if (v19)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v4, "setSelectedRange:", v18 - 1, 1);

          goto LABEL_4;
        }
      }

      goto LABEL_28;
    }
  }
  uint64_t v20 = [v6 attribute:*MEMORY[0x1E4F83220] atIndex:v18 - 1 effectiveRange:0];
  BOOL v21 = -[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, v14, v16, v18);
  if (!v21 && v20 && [v20 isList])
  {
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    id v22 = [v6 string];
    objc_msgSend(v22, "getParagraphStart:end:contentsEnd:forRange:", &v70, 0, &v69, v18 - 1, 0);

    if (v70 != v69)
    {
      if (v18 >= [v6 length])
      {
        objc_msgSend(v4, "setSelectedRange:", v18 - 1, 0);

LABEL_4:
        if ([v4 conformsToProtocol:&unk_1F0A65AB8]
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v4 textControllerDidHandleSpecialCaseEditing:self];
        }
        BOOL v10 = 1;
        goto LABEL_40;
      }
      -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, v14, v16, v6);
    }
  }
  else
  {

    if (v21) {
      goto LABEL_4;
    }
  }
LABEL_28:
  id v23 = [v6 string];
  uint64_t v24 = [v4 selectedRange];
  uint64_t v26 = objc_msgSend(v23, "paragraphRangeForRange:", v24, v25);
  uint64_t v28 = v27;

  uint64_t v29 = [v4 selectedRange];
  id v30 = [v6 string];
  uint64_t v31 = objc_msgSend(v30, "paragraphRangeForRange:", v29, 0);
  uint64_t v33 = v32;

  if (v29 == v26 || v29 == v26 + 1)
  {
    uint64_t v34 = [v4 selectedRange];
    unint64_t v36 = v31 + v33;
    if (v34 + v35 >= v36 - 1)
    {
      uint64_t v37 = [v4 selectedRange];
      if (v37 + v38 <= v36)
      {
        uint64_t v39 = [v6 attribute:*MEMORY[0x1E4F83220] atIndex:v29 effectiveRange:0];
        objc_opt_class();
        NSUInteger v40 = [v4 textLayoutManager];
        uint64_t v41 = [v40 textContentManager];
        uint64_t v42 = ICDynamicCast();

        uint64_t v43 = [v39 uuid];
        if (v43)
        {
          uint64_t v44 = (void *)v43;
          uint64_t v45 = [v42 outlineController];
          [v39 uuid];
          uint64_t v46 = v28;
          uint64_t v47 = v39;
          v49 = NSUInteger v48 = v42;
          char v67 = [v45 isUUIDCollapsed:v49];

          uint64_t v42 = v48;
          uint64_t v39 = v47;
          uint64_t v50 = v46;

          if (v67)
          {
            id v65 = objc_alloc(MEMORY[0x1E4F28B18]);
            char v51 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Heading" value:@"Heading" table:0 allowSiri:1];
            v71[0] = *MEMORY[0x1E4FB06C0];
            [MEMORY[0x1E4FB1618] clearColor];
            uint64_t v52 = v68 = v42;
            v72[0] = v52;
            v71[1] = *MEMORY[0x1E4FB0700];
            unint64_t v53 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
            v72[1] = v53;
            uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
            NSRange v66 = (void *)[v65 initWithString:v51 attributes:v54];

            uint64_t v55 = objc_msgSend(v6, "attributedSubstringFromRange:", v26, v50);
            id v56 = [v55 string];

            uint64_t v57 = objc_msgSend(v56, "characterAtIndex:", objc_msgSend(v56, "length") - 1);
            id v58 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            LODWORD(v57) = [v58 characterIsMember:v57];

            uint64_t v59 = objc_msgSend(v4, "ic_textRangeFromCharacterRange:", v26, v50 - v57);
            [v4 replaceRange:v59 withText:&stru_1F0973378];

            objc_msgSend(v4, "setAttributedMarkedText:selectedRange:", v66, 0, 0);
            [v6 setIsMarkingTextForHeadingRename:1];

            goto LABEL_4;
          }
        }
      }
    }
  }
  uint64_t v60 = [v4 selectedRange];
  uint64_t v62 = v61;
  [v4 selectedRange];
  if (!v63 && [v4 selectedRange])
  {
    uint64_t v60 = [v4 selectedRange] - 1;
    uint64_t v62 = 1;
  }
  -[ICTextController notifyInlineAttachmentsDeletedInRange:ofTextStorage:](self, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v60, v62, v6);
  BOOL v10 = 0;
LABEL_40:

  return v10;
}

void __60__ICTextController_deleteBackwardForSpecialCasesInTextView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = [a2 selectedRange];
  objc_msgSend(v6, "deleteCharactersInRange:", v4, v5);
}

- (void)notifyInlineAttachmentsDeletedInRange:(_NSRange)a3 ofTextStorage:(id)a4
{
}

void __72__ICTextController_notifyInlineAttachmentsDeletedInRange_ofTextStorage___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();

  if (v3)
  {
    uint64_t v4 = [v3 attachment];
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F830E0];
    uint64_t v7 = [v4 note];
    uint64_t v9 = *MEMORY[0x1E4F830E8];
    v10[0] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:v6 object:v7 userInfo:v8];
  }
}

- (_NSRange)extendedSelectionRangeForCollapsedSectionHeadingWithRange:(_NSRange)a3 textView:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  objc_opt_class();
  uint64_t v7 = [v6 textLayoutManager];

  uint64_t v8 = [v7 textContentManager];
  uint64_t v9 = ICDynamicCast();

  BOOL v10 = [v9 textStorage];
  uint64_t v11 = [v10 attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];

  uint64_t v12 = [v9 outlineController];
  uint64_t v13 = [v11 uuid];
  if (v13)
  {
    if ([v12 isUUIDCollapsed:v13])
    {
      uint64_t v14 = [v12 rangeForUUID:v13];
      if (location == v14)
      {
        NSUInteger v16 = v15;
        if (length == v15 || length == v15 - 1)
        {
          NSUInteger v18 = v14;
          v25.NSUInteger location = [v12 descendantRangeForUUID:v13];
          v25.NSUInteger length = v19;
          v23.NSUInteger location = v18;
          v23.NSUInteger length = v16;
          NSRange v20 = NSUnionRange(v23, v25);
          NSUInteger location = v20.location;
          NSUInteger length = v20.length;
        }
      }
    }
  }

  NSUInteger v21 = location;
  NSUInteger v22 = length;
  result.NSUInteger length = v22;
  result.NSUInteger location = v21;
  return result;
}

- (BOOL)removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:(id)a3 textStorage:(id)a4 rangeToBeDeleted:(_NSRange)a5 blockBeforeEndEditing:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, id, id, NSUInteger, NSUInteger))a6;
  NSUInteger v13 = location + length;
  if ([v11 length] <= location + length)
  {
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v14 = [v11 attribute:*MEMORY[0x1E4F83220] atIndex:location + length effectiveRange:0];
    uint64_t v15 = *MEMORY[0x1E4FB0738];
    NSUInteger v16 = [v11 attribute:*MEMORY[0x1E4FB0738] atIndex:location + length effectiveRange:0];
    if ([v14 isList])
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v17 = [v11 string];
      objc_msgSend(v17, "getParagraphStart:end:contentsEnd:forRange:", 0, &v27, &v28, location, length);

      BOOL v18 = v28 == v13;
      if (v28 == v13)
      {
        uint64_t v24 = v15;
        uint64_t v26 = v16;
        [v11 beginEditing];
        NSRange v25 = v14;
        NSUInteger v19 = (void *)[v14 mutableCopy];
        [v19 setStyle:3];
        NSRange v20 = [v11 attributesAtIndex:location + length effectiveRange:0];
        NSUInteger v21 = (void *)[v20 mutableCopy];

        [v21 setObject:v19 forKey:*MEMORY[0x1E4F83220]];
        if (ICInternalSettingsIsTextKit2Enabled())
        {
          NSUInteger v22 = (void *)[v26 mutableCopy];
          [v22 setTextLists:MEMORY[0x1E4F1CBF0]];
          [v21 setObject:v22 forKey:v24];
        }
        objc_msgSend(v11, "setAttributes:range:", v21, location + length, v27 - v28);
        if (v12) {
          v12[2](v12, v10, v11, location, length);
        }
        [v11 endEditing];

        NSUInteger v16 = v26;
        uint64_t v14 = v25;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  return v18;
}

- (BOOL)deleteWordBackwardForSpecialCasesInTextView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 textStorage];
  id v6 = ICCheckedDynamicCast();

  uint64_t v7 = [v6 string];
  uint64_t v8 = [v4 selectedRange];
  unint64_t v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8 + v9, 0);
  uint64_t v12 = v11;

  uint64_t v13 = [v4 selectedRange];
  uint64_t v15 = v13 + v14;
  if (v13 + v14 == v10
    || v13 + v14 >= v10 && [v4 selectedRange] <= v10
    || !([v4 selectedRange] | v10))
  {
    BOOL v16 = -[ICTextController removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:](self, "removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:textStorage:paragraphRange:andLocation:", v4, v6, v10, v12, v15);
    uint64_t v17 = [v4 textStorage];
    [v17 beginEditing];

    BOOL v18 = [v4 textStorage];
    NSUInteger v19 = v18;
    if (v16)
    {
      uint64_t v20 = [v4 selectedRange];
      objc_msgSend(v19, "deleteCharactersInRange:", v20, v21);

      NSUInteger v22 = [v4 textStorage];
      [v22 endEditing];

      objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v4, "selectedRange"), 0);
      if ([v4 conformsToProtocol:&unk_1F0A65AB8]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v4 textControllerDidHandleSpecialCaseEditing:self];
      }
      BOOL v23 = 1;
      goto LABEL_15;
    }
    [v18 endEditing];
  }
  uint64_t v24 = [v4 selectedRange];
  uint64_t v26 = v25;
  [v4 selectedRange];
  if (!v27 && [v4 selectedRange])
  {
    uint64_t v24 = [v4 selectedRange] - 1;
    uint64_t v26 = 1;
  }
  -[ICTextController notifyInlineAttachmentsDeletedInRange:ofTextStorage:](self, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v24, v26, v6);
  BOOL v23 = 0;
LABEL_15:

  return v23;
}

- (BOOL)removeListStyleForDeletingEmptyParagrahIfNecessaryForTextView:(id)a3 textStorage:(id)a4 paragraphRange:(_NSRange)a5 andLocation:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = [v12 length];
  uint64_t v14 = (void *)MEMORY[0x1E4F83220];
  if (v13 <= a6)
  {
    BOOL v16 = [v11 typingAttributes];
    uint64_t v15 = [v16 objectForKeyedSubscript:*v14];
  }
  else
  {
    uint64_t v15 = [v12 attribute:*MEMORY[0x1E4F83220] atIndex:a6 effectiveRange:0];
  }
  if ([v11 selectedRange])
  {
    uint64_t v17 = objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *v14, objc_msgSend(v11, "selectedRange") - 1, 0);
    if (!v15) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (!v15)
    {
LABEL_11:
      BOOL v19 = 0;
      goto LABEL_16;
    }
  }
  if (![v15 isList]) {
    goto LABEL_11;
  }
  if (v17)
  {
    int v18 = [v17 style];
    if (v18 == [v15 style]) {
      goto LABEL_11;
    }
  }
  -[ICTextController setTextStyle:removeExtraStyling:range:inTextStorage:](self, "setTextStyle:removeExtraStyling:range:inTextStorage:", 3, 0, location, length, v12);
  unint64_t v20 = [v11 selectedRange];
  if (v20 >= [v12 length])
  {
    [v11 setTypingAttributes:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    uint64_t v21 = objc_msgSend(v12, "attributesAtIndex:effectiveRange:", objc_msgSend(v11, "selectedRange"), 0);
    [v11 setTypingAttributes:v21];
  }
  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (id)strippedTypingAttributesAtStartOfParagraph:(id)a3 atTheEndOfDocument:(BOOL)a4 isTyping:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(ICTextController *)self note];
  char v10 = [v9 isPerformingMerge];

  id v11 = v8;
  if ((v10 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICTextController;
    id v11 = [(ICTTTextController *)&v13 strippedTypingAttributesAtStartOfParagraph:v8 atTheEndOfDocument:v6 isTyping:v5];
  }
  return v11;
}

+ (BOOL)shouldRetainFirstListStyleForFilteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  NSUInteger v7 = location + length;
  if (location + length >= [v6 length])
  {
    uint64_t v9 = 0;
LABEL_14:
    BOOL v16 = 1;
    goto LABEL_15;
  }
  id v8 = [v6 attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];
  uint64_t v9 = v8;
  if (!v8 || ![v8 isList]) {
    goto LABEL_14;
  }
  NSUInteger v18 = 0;
  char v10 = [v6 string];
  uint64_t v11 = objc_msgSend(v10, "ic_paragraphRangeForRange:contentEnd:", location, 0, &v18);
  uint64_t v13 = v12;

  BOOL v16 = location == v11 && v7 >= v18 || v7 > v11 + v13;
LABEL_15:

  return v16;
}

+ (id)removeBeginningListStyleIfNecessaryForAttributedString:(id)a3 fromTextStorage:(id)a4 andRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a3;
  id v9 = a4;
  if (!+[ICTextController shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:](ICTextController, "shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:", v9, location, length))
  {
    char v10 = (uint64_t *)MEMORY[0x1E4F83220];
    uint64_t v11 = [v8 attribute:*MEMORY[0x1E4F83220] atIndex:0 effectiveRange:0];
    uint64_t v12 = (void *)[v11 mutableCopy];

    [v12 setStyle:3];
    uint64_t v13 = (void *)[v8 mutableCopy];
    [v9 beginSkippingTimestampUpdates];
    uint64_t v14 = *v10;
    uint64_t v15 = [v13 string];
    uint64_t v16 = objc_msgSend(v15, "paragraphRangeForRange:", 0, 0);
    objc_msgSend(v13, "addAttribute:value:range:", v14, v12, v16, v17);

    [v9 endSkippingTimestampUpdates];
    id v8 = v13;
  }

  return v8;
}

- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5
{
}

- (void)setNote:(id)a3 stylingTextUsingSeparateTextStorageForRendering:(BOOL)a4 withLayoutManager:(id)a5 traitCollection:(id)a6 firstVisibleCharLocation:(unint64_t)a7
{
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  [(ICTextController *)self setNote:v11];
  if (v11)
  {
    uint64_t v14 = [v11 textStorage];
    uint64_t v15 = v14;
    if (v9)
    {
      [v14 setWantsUndoCommands:0];

      objc_opt_class();
      uint64_t v16 = [v11 textStorage];
      uint64_t v17 = [v16 styler];
      uint64_t v15 = ICCheckedDynamicCast();

      NSUInteger v18 = [v15 zoomController];
      BOOL v19 = [ICTTTextStorage alloc];
      unint64_t v20 = [v11 textStorage];
      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      if ([(ICTextController *)self isForPrint]) {
        NSUInteger v22 = self;
      }
      else {
        NSUInteger v22 = 0;
      }
      BOOL v23 = [(ICTTTextStorage *)v19 initWithAttributedString:v20 replicaID:v21 sourceZoomController:v18 keepSourceZoomController:0 existingStyler:v22];

      if ([(ICTTTextController *)self disableSingleLineA]) {
        -[ICTTTextController styleText:inRange:fixModelAttributes:](self, "styleText:inRange:fixModelAttributes:", v23, 0, [(ICTTTextStorage *)v23 length], 0);
      }
      [v11 setNoteHasChanges:MEMORY[0x1E4F1CC28]];
      uint64_t v56 = 0;
      uint64_t v57 = &v56;
      uint64_t v58 = 0x3032000000;
      uint64_t v59 = __Block_byref_object_copy__47;
      uint64_t v60 = __Block_byref_object_dispose__47;
      id v61 = 0;
      uint64_t v50 = 0;
      char v51 = &v50;
      uint64_t v52 = 0x3010000000;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      unint64_t v53 = &unk_1B0BF84BB;
      uint64_t v24 = [(ICTTTextStorage *)v23 length];
      uint64_t v25 = *MEMORY[0x1E4FB06B8];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __135__ICTextController_setNote_stylingTextUsingSeparateTextStorageForRendering_withLayoutManager_traitCollection_firstVisibleCharLocation___block_invoke;
      void v49[3] = &unk_1E5FDC630;
      void v49[4] = &v56;
      v49[5] = &v50;
      -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](v23, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v24, 2, v49);
      if (v57[5] && [(ICTTTextStorage *)v23 length])
      {
        objc_opt_class();
        uint64_t v26 = ICDynamicCast();
        uint64_t v27 = v26;
        if (v26)
        {
          if ([v26 requiresSpaceAfterAttachmentForPrinting])
          {
            uint64_t v28 = [(ICTTTextStorage *)v23 string];
            unsigned int v48 = objc_msgSend(v28, "characterAtIndex:", -[ICTTTextStorage length](v23, "length") - 1);

            uint64_t v30 = v51[4];
            uint64_t v29 = v51[5];
            if (v29 + v30 == [(ICTTTextStorage *)v23 length]
              || (v37 = v51[4], uint64_t v36 = v51[5], v36 + v37 == [(ICTTTextStorage *)v23 length] - 1)
              && ([MEMORY[0x1E4F28B88] newlineCharacterSet],
                  uint64_t v38 = objc_claimAutoreleasedReturnValue(),
                  int v39 = [v38 characterIsMember:v48],
                  v38,
                  v39))
            {
              uint64_t v31 = [(ICTTTextStorage *)v23 mutableString];
              [v31 appendString:@" "];
            }
          }
        }
      }
      if ([(ICTextController *)self isForPrint])
      {
        NSUInteger v40 = [v11 calculateDocumentController];
        if ([v40 hasExpressions] && objc_msgSend(v11, "calculatePreviewBehavior") != 1)
        {
          [v40 updateAffectingChangeCounts:0];
          uint64_t v41 = [(ICTTTextStorage *)v23 ic_range];
          objc_msgSend(v40, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v23, v41, v42, 0, 1);
        }
      }
      uint64_t v43 = [v12 textContainers];
      uint64_t v44 = [v43 lastObject];

      [(ICTextController *)self filterAttachmentsForPrintingInAttributedString:v23 traitCollection:v13 textContainer:v44];
      [v12 icReplaceTextStorage:v23];
      uint64_t v45 = [(ICTextController *)self trackedToDoParagraphs];
      [v12 setTrackedToDoParagraphs:v45];

      uint64_t v46 = [v12 textStorage];
      objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v46, "length"), 0);

      uint64_t v47 = [v11 textStorage];
      [v47 setWantsUndoCommands:1];

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);
    }
    else
    {
      [v14 setStyler:self];
      [v15 setWantsUndoCommands:0];
      [(ICTextController *)self refreshTextStylingForTextStorage:v15 withTextController:self];
      [v15 setWantsUndoCommands:1];
      [v11 setNoteHasChanges:MEMORY[0x1E4F1CC28]];
      [v12 icReplaceTextStorage:v15];
    }
  }
  else
  {
    uint64_t v32 = [ICTTTextStorage alloc];
    uint64_t v33 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v34 = [(ICTTTextStorage *)v32 initWithData:0 replicaID:v33];
    [(ICTextController *)self setEmptyTextStorage:v34];

    uint64_t v35 = [(ICTextController *)self emptyTextStorage];
    [v12 icReplaceTextStorage:v35];
  }
}

void __135__ICTextController_setNote_stylingTextUsingSeparateTextStorageForRendering_withLayoutManager_traitCollection_firstVisibleCharLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = a2;
  if (v10)
  {
    id v12 = v10;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v10 = v12;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
    if (a5) {
      *a5 = 1;
    }
  }
}

+ (double)extraWidthNeededForStyle:(id)a3 range:(_NSRange)a4 attributedString:(id)a5 textView:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = (void *)[a3 mutableCopy];
  [v13 setIndent:0];
  objc_msgSend(a1, "indentForStyle:range:attributedString:textView:", v13, location, length, v12, v11);
  double v15 = v14;

  return v15;
}

+ (double)extraBulletWidthForNumberedListWithMaxItemNumber:(id)a3 textFont:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v5, "ic_preferredFontForBodyText");
  [v6 pointSize];
  double v10 = v9;

  id v11 = objc_msgSend(v8, "ic_fontWithSize:", v10);
  id v12 = objc_msgSend(v11, "ic_fontWithTabularNumbers");

  id v13 = NSString;
  uint64_t v14 = [v7 longValue];

  double v15 = objc_msgSend(v13, "localizedStringWithFormat:", @"%ld.", v14);
  uint64_t v21 = *MEMORY[0x1E4FB06F8];
  v22[0] = v12;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  [v15 sizeWithAttributes:v16];
  double v18 = v17;

  if (v18 + 9.2 <= 36.0) {
    double v19 = 0.0;
  }
  else {
    double v19 = v18 + 9.2 - 36.0;
  }

  return v19;
}

- (void)setTrackAddedExtraNewlineRanges:(BOOL)a3
{
  if (self->_trackAddedExtraNewlineRanges != a3)
  {
    if (a3)
    {
      BOOL v5 = [MEMORY[0x1E4F1CA48] array];
      [(ICTextController *)self setTrackedRangesForAddedExtraNewlines:v5];
    }
    else
    {
      [(ICTextController *)self setTrackedRangesForAddedExtraNewlines:0];
    }
    self->_trackAddedExtraNewlineRanges = a3;
  }
}

- (void)trackExtraNewLineRangeIfNecessary:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (![(ICTextController *)self trackAddedExtraNewlineRanges]) {
    return;
  }
  id v6 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_11;
  }
  unint64_t v8 = 0;
  char v9 = 1;
  do
  {
    double v10 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
    id v11 = [v10 objectAtIndexedSubscript:v8];
    unint64_t v12 = [v11 rangeValue];
    uint64_t v14 = v13;

    if (location >= v12)
    {
      if (location > v12 + v14) {
        goto LABEL_9;
      }
      double v15 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v12, v14 + length);
      [v15 replaceObjectAtIndex:v8 withObject:v16];
      char v9 = 0;
    }
    else
    {
      double v15 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v12 + length, v14);
      [v15 replaceObjectAtIndex:v8 withObject:v16];
    }

LABEL_9:
    ++v8;
    double v17 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
    unint64_t v18 = [v17 count];
  }
  while (v18 > v8);
  if (v9)
  {
LABEL_11:
    id v20 = [(ICTextController *)self trackedRangesForAddedExtraNewlines];
    double v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
    [v20 addObject:v19];
  }
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 textController:*(void *)(a1 + 32) updatedTrackedAttribute:*(void *)(a1 + 40)];
  }
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v23.NSUInteger location = [v6 characterRange];
  if (NSIntersectionRange(v23, *(NSRange *)(a1 + 64)).length
    && ([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v5];
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      objc_opt_class();
      uint64_t v7 = ICDynamicCast();
      unint64_t v8 = [v7 textLayoutManagers];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = ICProtocolCast();
            [v13 textController:*(void *)(a1 + 56) removedTrackedAttribute:v6];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
    else
    {
      uint64_t v14 = [*(id *)(a1 + 48) layoutManagers];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_4;
      v15[3] = &unk_1E5FDC658;
      void v15[4] = *(void *)(a1 + 56);
      id v16 = v6;
      [v14 enumerateObjectsUsingBlock:v15];
    }
  }
}

void __78__ICTextController_updateTrackedAttributesInTextStorage_range_changeInLength___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 textController:*(void *)(a1 + 32) removedTrackedAttribute:*(void *)(a1 + 40)];
  }
}

- (void)createToDoItemForCharacterRange:(_NSRange)a3 paragraphStyle:(id)a4 textStorage:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(ICTrackedParagraph);
  [(ICTrackedParagraph *)v11 setParagraph:v9];
  -[ICTrackedParagraph setCharacterRange:](v11, "setCharacterRange:", location, length);
  uint64_t v12 = [(ICTextController *)self trackedToDoParagraphs];
  uint64_t v13 = [v9 todoTrackingUUID];
  [v12 setObject:v11 forKeyedSubscript:v13];

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_opt_class();
    uint64_t v14 = ICDynamicCast();
    double v15 = [v14 textLayoutManagers];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = ICProtocolCast();
          [v20 textController:self addedTrackedAttribute:v11];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }
  }
  else
  {
    uint64_t v21 = [v10 layoutManagers];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __79__ICTextController_createToDoItemForCharacterRange_paragraphStyle_textStorage___block_invoke;
    v22[3] = &unk_1E5FDC658;
    v22[4] = self;
    NSRange v23 = v11;
    [v21 enumerateObjectsUsingBlock:v22];
  }
}

void __79__ICTextController_createToDoItemForCharacterRange_paragraphStyle_textStorage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 textController:*(void *)(a1 + 32) addedTrackedAttribute:*(void *)(a1 + 40)];
  }
}

- (void)updateTrackedToDoParagraphsAfterIndex:(unint64_t)a3 byDelta:(int64_t)a4 excludingSeenParagraphs:(id)a5
{
  id v8 = a5;
  id v9 = [(ICTextController *)self trackedToDoParagraphs];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__ICTextController_updateTrackedToDoParagraphsAfterIndex_byDelta_excludingSeenParagraphs___block_invoke;
  v11[3] = &unk_1E5FDC6D0;
  id v12 = v8;
  unint64_t v13 = a3;
  int64_t v14 = a4;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __90__ICTextController_updateTrackedToDoParagraphsAfterIndex_byDelta_excludingSeenParagraphs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  unint64_t v6 = [v5 characterRange];
  if (v6 >= *(void *)(a1 + 40))
  {
    unint64_t v8 = v6;
    uint64_t v9 = v7;
    if (([*(id *)(a1 + 32) containsObject:v13] & 1) == 0)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (v8 == v10) {
        unint64_t v11 = v8;
      }
      else {
        unint64_t v11 = *(void *)(a1 + 48) + v8;
      }
      if (v8 == v10) {
        uint64_t v12 = *(void *)(a1 + 48);
      }
      else {
        uint64_t v12 = 0;
      }
      objc_msgSend(v5, "setCharacterRange:", v11, v9 + v12);
    }
  }
}

- (void)filterAttachmentsForPrintingInAttributedString:(id)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  uint64_t v12 = [v8 length];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__ICTextController_filterAttachmentsForPrintingInAttributedString_traitCollection_textContainer___block_invoke;
  v16[3] = &unk_1E5FDA970;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v16);
}

void __97__ICTextController_filterAttachmentsForPrintingInAttributedString_traitCollection_textContainer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(v15, "printableTextContentForAppearanceType:traitCollection:textContainer:", objc_msgSend(*(id *)(a1 + 32), "overrideAppearanceType"), *(void *)(a1 + 40), *(void *)(a1 + 48));
    if (v7) {
      objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withAttributedString:", a3, a4, v7);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v8 = v15;
    uint64_t v7 = [*(id *)(a1 + 56) attributesAtIndex:a3 effectiveRange:0];
    id v9 = objc_msgSend(v8, "printableTextContentForAppearanceType:traitCollection:styleAttributes:textContainer:", objc_msgSend(*(id *)(a1 + 32), "overrideAppearanceType"), *(void *)(a1 + 40), v7, *(void *)(a1 + 48));
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = *(void **)(a1 + 56);
      uint64_t v12 = [v9 string];
      objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v12);

      id v13 = *(void **)(a1 + 56);
      id v14 = [v10 attributesAtIndex:0 effectiveRange:0];
      objc_msgSend(v13, "addAttributes:range:", v14, a3, objc_msgSend(v10, "length"));
    }
  }

LABEL_9:
}

- (BOOL)inlineAttachmentInTextView:(id)a3 atIndex:(unint64_t)a4 outAttachment:(id *)a5
{
  id v8 = [a3 textStorage];
  id v9 = [v8 attribute:*MEMORY[0x1E4F83248] atIndex:a4 effectiveRange:0];
  if ([v9 conformsToProtocol:&unk_1F09A5DB0])
  {
    id v10 = v9;
    int v11 = [MEMORY[0x1E4F834B0] isInlineAttachment:v10];
    BOOL v12 = v11;
    if (a5 && v11)
    {
      id v13 = [(ICTextController *)self note];
      *a5 = [v13 inlineAttachmentWithICTTAttachment:v10];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)canConvertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = v7;
  BOOL v12 = location != 0x7FFFFFFFFFFFFFFFLL
     && ([v7 textStorage],
         id v9 = objc_claimAutoreleasedReturnValue(),
         [v9 string],
         id v10 = objc_claimAutoreleasedReturnValue(),
         int v11 = objc_msgSend(v10, "ic_rangeIsValid:", location, length),
         v10,
         v9,
         v11)
     && [(ICTextController *)self inlineAttachmentInTextView:v8 atIndex:location outAttachment:0];

  return v12;
}

- (void)convertInlineAttachmentToTextInTextView:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v7 textStorage];
    id v10 = [v9 string];
    int v11 = objc_msgSend(v10, "ic_rangeIsValid:", location, length);

    if (v11)
    {
      id v25 = 0;
      BOOL v12 = [(ICTextController *)self inlineAttachmentInTextView:v8 atIndex:location outAttachment:&v25];
      id v13 = v25;
      id v14 = v13;
      if (v12)
      {
        if (!v13) {
          objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController convertInlineAttachmentToTextInTextView:forRange:]", 1, 0, @"Expected non-nil value for '%s'", "inlineAttachment");
        }
        id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v16 = *MEMORY[0x1E4F830E0];
        id v17 = [v14 note];
        uint64_t v26 = *MEMORY[0x1E4F830E8];
        v27[0] = v14;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        [v15 postNotificationName:v16 object:v17 userInfo:v18];

        id v19 = [v14 displayText];
        long long v20 = objc_msgSend(v19, "ic_stringByRemovingLanguageDirectionCharacters");

        uint64_t v21 = [v8 textStorage];
        objc_msgSend(v21, "replaceCharactersInRange:withString:", location, 1, v20);

        uint64_t v22 = [v20 length];
        if (length) {
          uint64_t v23 = v22;
        }
        else {
          uint64_t v23 = 0;
        }
        if (length) {
          NSUInteger v24 = location;
        }
        else {
          NSUInteger v24 = v22 + location;
        }
        objc_msgSend(v8, "setSelectedRange:", v24, v23);
      }
    }
  }
}

- (BOOL)canAddToTagsInTextView:(id)a3 forRange:(_NSRange)a4
{
  if (a4.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v15 = 0;
  BOOL v6 = [(ICTextController *)self inlineAttachmentInTextView:a3 atIndex:a4.location outAttachment:&v15];
  id v7 = v15;
  id v8 = v7;
  if (!v6) {
    goto LABEL_8;
  }
  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController canAddToTagsInTextView:forRange:]", 1, 0, @"Expected non-nil value for '%s'", "inlineAttachment");
  }
  if ([v8 isHashtagAttachment])
  {
    id v9 = (void *)MEMORY[0x1E4F83388];
    id v10 = [v8 tokenContentIdentifier];
    int v11 = [(ICTextController *)self note];
    BOOL v12 = [v11 account];
    id v13 = [v9 hashtagWithStandardizedContent:v10 account:v12];

    BOOL v4 = v13 == 0;
  }
  else
  {
LABEL_8:
    BOOL v4 = 0;
  }

  return v4;
}

- (void)addToTagsInTextView:(id)a3 forRange:(_NSRange)a4
{
  if (a4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18[7] = v4;
    v18[8] = v5;
    v18[0] = 0;
    BOOL v7 = [(ICTextController *)self inlineAttachmentInTextView:a3 atIndex:a4.location outAttachment:v18];
    id v8 = v18[0];
    id v9 = v8;
    if (v7)
    {
      if (!v8) {
        objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((inlineAttachment) != nil)", "-[ICTextController addToTagsInTextView:forRange:]", 1, 0, @"Expected non-nil value for '%s'", "inlineAttachment");
      }
      id v10 = (void *)MEMORY[0x1E4F83388];
      int v11 = [v9 displayText];
      BOOL v12 = [(ICTextController *)self note];
      id v13 = [v12 account];
      id v14 = [v10 hashtagWithDisplayText:v11 account:v13 createIfNecessary:1];

      id v15 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICTextController addToTagsInTextView:forRange:](v14, v9);
      }

      uint64_t v16 = [(ICTextController *)self note];
      id v17 = [v16 managedObjectContext];
      objc_msgSend(v17, "ic_save");
    }
  }
}

uint64_t __67__ICTextController_styleListsAndIndentsInAttributedString_inRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "nsParagraphStyleForICTTParagraphStyle:range:attributedString:textView:", *(void *)(a1 + 40), a3, a4, *(void *)(a1 + 48), 0);
  if (v7) {
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v7, a3, a4);
  }
  return MEMORY[0x1F41817F8]();
}

- (void)styleDataDetectorTypesForPreviewInTextStorage:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v43 = 0;
  id v5 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2080 error:&v43];
  id v6 = v43;
  uint64_t v7 = v6;
  if (v5)
  {
    id v32 = v6;
    id v8 = [v4 attributedString];
    uint64_t v9 = [v8 string];

    uint64_t v33 = v5;
    uint64_t v31 = v9;
    NSUInteger range1 = [v4 length];
    id v10 = [v5 matchesInString:v9 options:0 range:0];
    [v4 beginSkippingTimestampUpdates];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      uint64_t v34 = *MEMORY[0x1E4FB0720];
      id v14 = (void *)MEMORY[0x1E4F83220];
      uint64_t v35 = *(void *)v40;
      do
      {
        uint64_t v15 = 0;
        uint64_t v37 = v12;
        do
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
          NSUInteger v17 = [v16 range];
          NSUInteger v19 = v18;
          long long v20 = [v4 attribute:*v14 atIndex:v17 effectiveRange:0];
          if (-[ICTextController shouldHighlightStyleAsLink:](self, "shouldHighlightStyleAsLink:", [v20 style]))
          {
            uint64_t v21 = self;
            v46.NSUInteger location = 0;
            v46.NSUInteger length = range1;
            v47.NSUInteger location = v17;
            v47.NSUInteger length = v19;
            NSUInteger length = NSIntersectionRange(v46, v47).length;
            uint64_t v23 = v4;
            char v24 = objc_msgSend(MEMORY[0x1E4F83410], "hasMentionInTextStorage:inRange:", v4, v17, v19);
            id v25 = [v16 URL];
            if (v25) {
              BOOL v26 = length == 0;
            }
            else {
              BOOL v26 = 1;
            }
            if (!v26 && (v24 & 1) == 0) {
              objc_msgSend(v23, "addAttribute:value:range:", v34, v25, v17, v19);
            }
            long long v27 = [v16 phoneNumber];
            if (v27) {
              BOOL v28 = length == 0;
            }
            else {
              BOOL v28 = 1;
            }
            if (v28) {
              char v29 = 1;
            }
            else {
              char v29 = v24;
            }
            id v4 = v23;
            if ((v29 & 1) == 0) {
              objc_msgSend(v23, "addAttribute:value:range:", v34, v27, v17, v19);
            }

            self = v21;
            uint64_t v13 = v35;
            uint64_t v12 = v37;
            id v14 = (void *)MEMORY[0x1E4F83220];
          }

          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v12);
    }

    [v4 endSkippingTimestampUpdates];
    uint64_t v7 = v32;
    id v5 = v33;
    uint64_t v30 = v31;
  }
  else
  {
    uint64_t v30 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[ICTextController styleDataDetectorTypesForPreviewInTextStorage:](v30);
    }
  }
}

- (BOOL)shouldHighlightStyleAsLink:(unsigned int)a3
{
  return 1;
}

void __60__ICTextController_fixModelAttributesInTextStorage_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v14 = (id)[v7 mutableCopy];
  uint64_t v9 = [v8 uuid];

  if (v9)
  {
    [v14 setUuid:v9];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) uuid];
    [v14 setUuid:v10];
  }
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = *MEMORY[0x1E4F83220];
  uint64_t v13 = (void *)[v14 copy];
  objc_msgSend(v11, "addAttribute:value:range:", v12, v13, a3, a4);
}

- (id)keyboardLanguageForTextView:(id)a3
{
  if (a3)
  {
    id v4 = ICKeyboardLanguageForBaseView(a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)attributedStringToPasteWithAdaptedParagraphStyles:(id)a3 pasteRange:(_NSRange)a4 textStorage:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  if (![v8 length])
  {
    id v19 = v8;
    goto LABEL_38;
  }
  id v10 = (void *)[v8 mutableCopy];
  NSRange v64 = (NSRange)xmmword_1B0B987A0;
  NSRange v65 = (NSRange)xmmword_1B0B987A0;
  uint64_t v11 = (uint64_t *)MEMORY[0x1E4F83220];
  uint64_t v12 = [v8 attribute:*MEMORY[0x1E4F83220] atIndex:0 effectiveRange:&v65];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_29;
  }
  int v14 = [v12 style];
  if (v8 && [v8 length])
  {
    uint64_t v15 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *v11, objc_msgSend(v8, "length") - 1, &v64);

    if (v15)
    {
      int v16 = [v15 style];
      LODWORD(v17) = v16 == 3;
      if (v16 == 3 && v14 == 3)
      {
        if (NSIntersectionRange(v65, v64).length)
        {
          NSUInteger v18 = v64.length + v64.location - (v65.length + v65.location);
          if (v64.length + v64.location <= v65.length + v65.location)
          {
            LOBYTE(v17) = 0;
            goto LABEL_20;
          }
          v64.NSUInteger location = v65.length + v65.location;
          v64.NSUInteger length = v18;
        }
        LOBYTE(v17) = 1;
LABEL_20:
        uint64_t v13 = v15;
LABEL_21:
        long long v20 = [v9 attribute:*v11 atIndex:location effectiveRange:0];
        if (v20)
        {
          uint64_t v62 = [v8 attribute:*v11 atIndex:0 effectiveRange:0];
          uint64_t v21 = (void *)[v20 mutableCopy];
          objc_msgSend(v21, "setWritingDirection:", objc_msgSend(v62, "writingDirection"));
          char v22 = (char)v17;
          NSUInteger v17 = v13;
          NSUInteger v23 = location;
          id v24 = v9;
          uint64_t v25 = *MEMORY[0x1E4F83220];
          NSUInteger v63 = length;
          BOOL v26 = (void *)[v21 copy];
          uint64_t v27 = v25;
          id v9 = v24;
          NSUInteger location = v23;
          uint64_t v13 = v17;
          LOBYTE(v17) = v22;
          [v10 addAttribute:v27 value:v26 range:v65];

          NSUInteger length = v63;
          uint64_t v11 = (uint64_t *)MEMORY[0x1E4F83220];
        }
        if ((v17 & 1) == 0) {
          goto LABEL_29;
        }
        goto LABEL_24;
      }
      uint64_t v13 = v15;
      goto LABEL_15;
    }
    uint64_t v13 = 0;
  }
  LODWORD(v17) = 0;
LABEL_15:
  if (v14 == 3) {
    goto LABEL_21;
  }
  if (v17)
  {
LABEL_24:
    NSUInteger v28 = length - 1;
    if (!length) {
      NSUInteger v28 = 0;
    }
    char v29 = [v9 attribute:*v11 atIndex:location + v28 effectiveRange:0];
    if (v29)
    {
      uint64_t v30 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *v11, objc_msgSend(v8, "length") - 1, 0);
      uint64_t v31 = (void *)[v29 mutableCopy];
      objc_msgSend(v31, "setWritingDirection:", objc_msgSend(v30, "writingDirection"));
      uint64_t v32 = *v11;
      uint64_t v33 = v11;
      uint64_t v34 = (void *)[v31 copy];
      [v10 addAttribute:v32 value:v34 range:v64];

      uint64_t v11 = v33;
    }
  }
LABEL_29:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [ICTTTextStorage alloc];
    id v36 = objc_alloc_init(MEMORY[0x1E4F28B18]);
    uint64_t v37 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v38 = [(ICTTTextStorage *)v35 initWithAttributedString:v36 replicaID:v37];

    uint64_t v39 = [(ICTTTextStorage *)v38 ic_range];
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v38, "replaceCharactersInRange:withAttributedString:", v39, v40, v10);
    long long v41 = [(id)*MEMORY[0x1E4F44510] identifier];
    uint64_t v42 = objc_msgSend(v10, "ic_range");
    uint64_t v44 = -[ICTTTextStorage filteredAttributedStringForUTI:range:](v38, "filteredAttributedStringForUTI:range:", v41, v42, v43);
    uint64_t v45 = (void *)[v44 mutableCopy];

    uint64_t v46 = *v11;
    uint64_t v47 = objc_msgSend(v45, "ic_range");
    objc_msgSend(v45, "removeAttribute:range:", v46, v47, v48);
    uint64_t v49 = *MEMORY[0x1E4F83250];
    uint64_t v50 = objc_msgSend(v45, "ic_range");
    objc_msgSend(v45, "removeAttribute:range:", v49, v50, v51);

    id v10 = v45;
  }
  uint64_t v52 = [v10 attribute:*v11 atIndex:0 effectiveRange:&v65];
  unint64_t v53 = v52;
  if (v52)
  {
    if ([v52 isList])
    {
      NSUInteger v54 = v65.length;
      objc_msgSend(v10, "ic_range");
      if (v54 == v55)
      {
        uint64_t v56 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        uint64_t v57 = objc_msgSend(v10, "ic_rangeByTrimmingCharactersInSet:inRange:", v56, v65);
        uint64_t v59 = v58;

        if (v57 != 0x7FFFFFFFFFFFFFFFLL && v59 != v65.length)
        {
          uint64_t v60 = objc_msgSend(v10, "attributedSubstringFromRange:", v57, v59);
          [v10 replaceCharactersInRange:v65 withAttributedString:v60];
        }
      }
    }
  }
  id v19 = (id)[v10 copy];

LABEL_38:
  return v19;
}

- (void)setDisableAddingExtraLinesIfNeeded:(BOOL)a3
{
  self->_disableAddingExtraLinesIfNeeded = a3;
}

- (void)setIsForPrint:(BOOL)a3
{
  self->_isForPrint = a3;
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentInsertionController);
  return (ICAttachmentInsertionController *)WeakRetained;
}

- (BOOL)userChangedWritingDirection
{
  return self->_userChangedWritingDirection;
}

- (void)setUserChangedWritingDirection:(BOOL)a3
{
  self->_userChangedWritingDirection = a3;
}

- (NSMutableArray)trackedRangesForAddedExtraNewlines
{
  return self->_trackedRangesForAddedExtraNewlines;
}

- (void)setTrackedRangesForAddedExtraNewlines:(id)a3
{
}

- (BOOL)trackAddedExtraNewlineRanges
{
  return self->_trackAddedExtraNewlineRanges;
}

- (BOOL)isConvertingTables
{
  return self->_isConvertingTables;
}

- (void)setIsConvertingTables:(BOOL)a3
{
  self->_isConvertingTables = a3;
}

- (unint64_t)overrideAppearanceType
{
  return self->_overrideAppearanceType;
}

- (void)setOverrideAppearanceType:(unint64_t)a3
{
  self->_overrideAppearanceType = a3;
}

- (ICMentionsController)mentionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsController);
  return (ICMentionsController *)WeakRetained;
}

- (ICHashtagController)hashtagController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagController);
  return (ICHashtagController *)WeakRetained;
}

- (unint64_t)pauseMergeForScrollingCounter
{
  return self->_pauseMergeForScrollingCounter;
}

- (void)setPauseMergeForScrollingCounter:(unint64_t)a3
{
  self->_pauseMergeForScrollingCounter = a3;
}

- (BOOL)shouldMergeNoteAfterScrolling
{
  return self->_shouldMergeNoteAfterScrolling;
}

- (void)setShouldMergeNoteAfterScrolling:(BOOL)a3
{
  self->_shouldMergeNoteAfterScrolling = a3;
}

- (BOOL)isAutoListInsertionDisabled
{
  return self->_isAutoListInsertionDisabled;
}

- (void)setIsAutoListInsertionDisabled:(BOOL)a3
{
  self->_isAutoListInsertionDisabled = a3;
}

- (ICTTTextStorage)emptyTextStorage
{
  return self->_emptyTextStorage;
}

- (void)setEmptyTextStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyTextStorage, 0);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_authorHighlightsController);
  objc_storeStrong((id *)&self->_trackedRangesForAddedExtraNewlines, 0);
  objc_storeStrong((id *)&self->_trackedToDoParagraphs, 0);
  objc_destroyWeak((id *)&self->_attachmentInsertionController);
  objc_destroyWeak((id *)&self->_note);
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v4 = ICDynamicCast();
  id v5 = [v4 attachment];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "attempted to update an attachment without an identifier: %@ %@", (uint8_t *)&v6, 0x16u);
}

void __43__ICTextController_updateAttachmentsInNote__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "found a non-ICTTAttachment attachment: %@", (uint8_t *)&v2, 0xCu);
}

void __47__ICTextController_toggleBlockQuoteInTextView___block_invoke_cold_1(void *a1, void *a2)
{
  [a1 blockQuoteLevel];
  [a2 blockQuoteLevel];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v3, v4, "blockQuoteLevel changed from %ld to %ld.", v5, v6, v7, v8, v9);
}

- (void)addExtraLinesIfNeededToTextStorage:(os_log_t)log editedRange:actualLengthIncrease:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "error: editedRange out of bounds", v1, 2u);
}

- (void)addToTagsInTextView:(void *)a1 forRange:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a1, "ic_loggingDescription");
  uint64_t v10 = objc_msgSend(a2, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_1_0(&dword_1B08EB000, v4, v5, "User adopted tag (%@) for inline attachment (%@)", v6, v7, v8, v9, 2u);
}

- (void)styleDataDetectorTypesForPreviewInTextStorage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Could not create NSDataDetector.", v1, 2u);
}

@end