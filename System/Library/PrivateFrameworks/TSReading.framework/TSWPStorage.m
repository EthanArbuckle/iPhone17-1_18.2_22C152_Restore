@interface TSWPStorage
+ (BOOL)allowsElementKind:(int)a3 forStorageKind:(int)a4;
+ (Class)pStringClassForWPKind:(int)a3;
+ (TSWPAttributeArray)createAttributeArrayForKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4;
+ (TSWPAttributeArray)createEmptyAttributeArrayForKind:(unsigned int)a3;
+ (id)filterMarkAttributes:(id)a3;
+ (id)filterText:(id)a3;
+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4;
+ (id)plainTextPasteStringForStorages:(id)a3 forcePlainText:(BOOL)a4;
+ (void)resetDisallowedElementKinds;
+ (void)setDisallowedElementKinds:(unsigned int)a3 forStorageKind:(int)a4;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)hyperlinkCellID;
- (BOOL)adjustRangesByDelta:(int64_t)a3;
- (BOOL)allowsElementKind:(int)a3;
- (BOOL)anchoredDrawableAttachmentCharacterAtCharIndex:(unint64_t)a3;
- (BOOL)autoListRecognition;
- (BOOL)autoListTermination;
- (BOOL)canBeStoredInAStringValueCell;
- (BOOL)canPasteAsPlainText;
- (BOOL)canPasteAsPlainTextWithUniformParagraphs;
- (BOOL)canUserReplaceText;
- (BOOL)changesWithPageCount;
- (BOOL)hasAttachmentsThatChangeWithPageNumberOrPageCount;
- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasDeletedTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4;
- (BOOL)hasDeletionInRange:(_NSRange)a3;
- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3;
- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4;
- (BOOL)hasSectionForParagraphBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasSmartFields;
- (BOOL)hasSmartFieldsInRange:(_NSRange)a3;
- (BOOL)hasTrackedChanges;
- (BOOL)hasVisibleText;
- (BOOL)hasVisibleTextAtCharIndex:(unint64_t)a3;
- (BOOL)highlightsAllowed;
- (BOOL)ignoreContentsChangedNotifications;
- (BOOL)isAllWhitespaceInRange:(_NSRange)a3;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isDOLCSuppressed;
- (BOOL)isEmptyParagraphSelection:(id)a3 outRange:(_NSRange *)a4;
- (BOOL)isFloatingAboveText;
- (BOOL)isInInit;
- (BOOL)isInlineWithText;
- (BOOL)isThemeContent;
- (BOOL)isWholeParagraphsForRange:(_NSRange)a3 ignoreAttachmentCharacters:(BOOL)a4 requireParagraphBreakSelected:(BOOL)a5;
- (BOOL)isWritingDirectionRightToLeftForListAtParIndex:(unint64_t)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(unint64_t)a3;
- (BOOL)p_hasDeletedTextAtCharIndex:(unint64_t)a3 requireHidden:(BOOL)a4 range:(_NSRange *)a5;
- (BOOL)p_hasGoodAttributesForPlainTextPaste;
- (BOOL)p_passesExtraTablesChecksForStoringInAStringValueCell;
- (BOOL)p_shouldInsertionSplitChange:(id)a3 changeSession:(id)a4;
- (BOOL)paragraphHasListLabelAtCharIndex:(unint64_t)a3;
- (BOOL)selectionContainsVisibleTrackedChanges:(id)a3;
- (BOOL)setDOLCSuppressed:(BOOL)a3;
- (BOOL)styleOverridesAppliedToRange:(_NSRange)a3;
- (BOOL)supportsColumnStyles;
- (BOOL)supportsListStyles;
- (BOOL)supportsSectionCopying;
- (BOOL)supportsSections;
- (BOOL)textIsVertical;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)debugDescription;
- (NSString)description;
- (TSDContainerInfo)parentInfo;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3;
- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 fromUndo:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (TSWPChangeAttributeArray)deletionChangesTable;
- (TSWPChangeAttributeArray)insertionChangesTable;
- (TSWPParagraphAttributeArray)paragraphAttributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4;
- (TSWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4;
- (TSWPParagraphEnumerator)paragraphEnumeratorAtParIndex:(SEL)a3 styleProvider:(unint64_t)a4;
- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4;
- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4 requireHidden:(id)a5;
- (TSWPRangeVector)deletedRangeVectorInRange:(SEL)a3;
- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10;
- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10 paragraphDirection:(int)a11;
- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6;
- (_NSRange)attachmentIndexRangeForTextRange:(_NSRange)a3;
- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4;
- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4 attributeKind:(unsigned int)a5;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (_NSRange)footnoteRangeForTextRange:(_NSRange)a3;
- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4;
- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7;
- (_NSRange)insertSection:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7;
- (_NSRange)insertSpecialCharacter:(unsigned __int16)a3 object:(id)a4 kind:(unsigned int)a5 range:(_NSRange)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9;
- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4;
- (_NSRange)p_RelocateNonSelectedAnchorsInRange:(_NSRange)a3 selectionInfos:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (_NSRange)p_extendRangeToIncludeSmartFields:(_NSRange)a3;
- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5;
- (_NSRange)p_replaceCharactersInLogicalSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9;
- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3;
- (_NSRange)range;
- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3;
- (_NSRange)rangeByExtendingRangeToLineBreak:(_NSRange)a3;
- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3;
- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3 skipVisibleDeleted:(BOOL)a4;
- (_NSRange)rangeByTrimmingRange:(_NSRange)a3 withBlock:(id)a4;
- (_NSRange)rangeForChange:(id)a3;
- (_NSRange)rangeForHighlight:(id)a3;
- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4;
- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (_NSRange)rangeForSelectionWithInsertionSelection:(id)a3;
- (_NSRange)rangeForTrackedChanges:(id)a3;
- (_NSRange)rangeOfAnnotationWithOptions:(unint64_t)a3 range:(_NSRange)a4;
- (_NSRange)rangeOfParagraphBreakingCharacter:(unsigned __int16)a3 backwards:(BOOL)a4 range:(_NSRange)a5;
- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 range:(_NSRange)a5;
- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5;
- (_NSRange)replaceAllOccurrencesOfObject:(id)a3 withObject:(id)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (_NSRange)replaceAllOccurrencesOfStyle:(id)a3 withStyle:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 undoTransaction:(void *)a7;
- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 notifyObservers:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (_NSRange)replaceCharactersInSelection:(id)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 changeSession:(id)a7 undoTransaction:(void *)a8;
- (_NSRange)replaceCharactersInSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9;
- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3;
- (_NSRange)textRangeForListAtCharIndex:(unint64_t)a3;
- (_NSRange)textRangeForListsInCharRange:(_NSRange)a3;
- (_NSRange)textRangeForParagraphAtCharIndex:(unint64_t)a3;
- (_NSRange)textRangeForParagraphAtIndex:(unint64_t)a3;
- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3;
- (_NSRange)textRangeForParagraphsInRange:(_NSRange)a3;
- (_NSRange)textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:(unint64_t)a3;
- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3;
- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5;
- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6;
- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4;
- (id)attachmentAtAttachmentIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4;
- (id)attachmentAtCharIndex:(unint64_t)a3;
- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)bestCharacterLanguageForTextRange:(_NSRange)a3;
- (id)changeAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)changeAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)changeDetailsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)changeDetailsForChange:(id)a3 withRange:(_NSRange)a4;
- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)characterStyleAtCharIndex:(unint64_t)a3 left:(BOOL)a4 effectiveRange:(_NSRange *)a5;
- (id)childCommandForApplyThemeCommand:(id)a3;
- (id)childEnumerator;
- (id)childEnumeratorForRange:(_NSRange)a3;
- (id)childInfos;
- (id)columnStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)columnStyleAtColumnStyleIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)copyWithContext:(id)a3;
- (id)deletedRangesInRange:(_NSRange)a3;
- (id)dictationAndAutocorrectionKeyAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)documentRoot;
- (id)editableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 selectionIsOnEdge:(BOOL *)a6;
- (id)editableSmartFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)extendSelectionForTopicChildren:(id)a3;
- (id)extendSelectionToIncludeSmartFields:(id)a3;
- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4;
- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4 requireComment:(BOOL)a5;
- (id)fontNameAtCharIndex:(unint64_t)a3 size:(double *)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6;
- (id)footnoteAtFootnoteIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4;
- (id)footnoteMarkAtCharIndex:(unint64_t)a3;
- (id)footnoteReferenceAtCharIndex:(unint64_t)a3;
- (id)footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:(unint64_t)a3;
- (id)footnoteStorages;
- (id)glyphVariantDataAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)hiddenRangesInRange:(_NSRange)a3;
- (id)languageAtParIndex:(unint64_t)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5;
- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5;
- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5;
- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5 kind:(int)a6;
- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6;
- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6 kind:(int)a7;
- (id)nextChangeFromCharIndex:(unint64_t)a3 afterChange:(id)a4 changeRange:(_NSRange *)a5;
- (id)nsAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 withLayoutParent:(id)a5;
- (id)nsAttributedStringWithAttributeDelegate:(id)a3 withLayoutParent:(id)a4;
- (id)nsAttributedStringWithDefaultAttributeDelegateWithLayoutParent:(id)a3;
- (id)nsAttributedStringWithLayoutParent:(id)a3;
- (id)nsAttributedSubstringFromRange:(_NSRange)a3 delegate:(id)a4 scale:(double)a5 applyChanges:(BOOL)a6 includeInlineDrawables:(BOOL)a7 withLayoutParent:(id)a8;
- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4;
- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4 applyChanges:(BOOL)a5 includeInlineDrawables:(BOOL)a6 withLayoutParent:(id)a7;
- (id)nsAttributedSubstringWithAttachmentsRemovedFromRange:(_NSRange)a3 withLayoutParent:(id)a4;
- (id)objectAtLocationAtExactCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4;
- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)pDefaultSectionForContext:(id)a3;
- (id)pDrawableInfoFromImporter:(id)a3 error:(id *)a4;
- (id)pExportAttributes:(unint64_t)a3 effectiveRange:(_NSRange *)a4 stickyFont:(id *)a5 scale:(double)a6;
- (id)pExportParagraphAttributes:(id)a3 nextParagraphStyle:(id)a4 scale:(double)a5;
- (id)pFindValidInsertionCharStyleFromCharIndex:(unint64_t)a3;
- (id)pImportParagraphAttributes:(id)a3 paragraphStyle:(id)a4;
- (id)pNSAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 stripTextualAttachments:(BOOL)a5 stripGraphicalAttachments:(BOOL)a6 stripInlineAttachments:(BOOL)a7 attachmentChar:(id)a8 scale:(double)a9 withLayoutParent:(id)a10;
- (id)pNSAttributedStringWithDefaultDelegateIgnoreLists:(BOOL)a3 stripTextualAttachments:(BOOL)a4 stripGraphicalAttachments:(BOOL)a5 stripInlineAttachments:(BOOL)a6 attachmentChar:(id)a7 scale:(double)a8 withLayoutParent:(id)a9;
- (id)pOverrideObjectBeforeReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 withInsertionBehavior:(int)a5;
- (id)pOverrideObjectBeforeReplacingCharactersInSelection:(id)a3 withString:(id)a4;
- (id)pParagraphStyleWithFrequentAttributesInString:(id)a3 withinStringRange:(_NSRange)a4 currentParagraphStyle:(id)a5;
- (id)pTextListsFromListStyle:(id)a3 atLevel:(unint64_t)a4 labelTypeMap:(id)a5;
- (id)p_replacementsForSelection:(id)a3 withString:(id)a4 changeSession:(id)a5 shouldTrackDeletions:(BOOL)a6;
- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)plainTextStringFromRange:(_NSRange)a3 convertTextualAttachments:(BOOL)a4 includeChildTextStorages:(BOOL)a5 forExport:(BOOL)a6 withLayoutParent:(id)a7;
- (id)previousChangeFromCharIndex:(unint64_t)a3 beforeChange:(id)a4 changeRange:(_NSRange *)a5;
- (id)referencedStyles;
- (id)referencedStylesOfClass:(Class)a3;
- (id)relocateNonSelectedAnchorsInSelection:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (id)searchForAnnotationsWithHitBlock:(id)a3;
- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5;
- (id)searchInRange:(_NSRange)a3 forString:(id)a4 options:(unint64_t)a5 onHit:(id)a6;
- (id)sectionAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)sectionAtSectionIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4;
- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4 passingTest:(id)a5;
- (id)string;
- (id)stringEquivalentFromRange:(_NSRange)a3;
- (id)stringEquivalentFromRange:(_NSRange)a3 withLayoutParent:(id)a4;
- (id)stringValue;
- (id)stylesheet;
- (id)substringWithRange:(_NSRange)a3;
- (id)substringWithSelection:(id)a3;
- (id)textSourceForLayoutInRange:(_NSRange)a3;
- (id)valueForBIUProperties:(id)a3;
- (id)valueForBIUProperties:(id)a3 selection:(id)a4 insertionStyle:(id)a5;
- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)visibleRangesInRange:(_NSRange)a3;
- (int)compareAttributeArray1:(TSWPAttributeArray *)a3 array2:(TSWPAttributeArray *)a4 range1:(_NSRange)a5 range2:(_NSRange)a6 attributeIndex1:(unint64_t)a7 attributeIndex2:(unint64_t)a8;
- (int)compareAttributeArray:(TSWPAttributeArray *)a3 range:(_NSRange)a4 otherStorage:(id)a5 otherRange:(_NSRange)a6;
- (int)compareRange:(_NSRange)a3 otherStorage:(id)a4 otherRange:(_NSRange)a5 options:(unint64_t)a6;
- (int)wpKind;
- (int)writingDirectionForParagraphAtCharIndex:(unint64_t)a3;
- (int)writingDirectionForParagraphAtParIndex:(unint64_t)a3;
- (int64_t)contentWritingDirection;
- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6;
- (int64_t)pMapListsFromStorageRange:(_NSRange)a3 toString:(id)a4 atStringLoc:(unint64_t)a5 textListMap:(id)a6;
- (unint64_t)attachmentCount;
- (unint64_t)attachmentIndexAtCharIndex:(unint64_t)a3;
- (unint64_t)attachmentIndexForInsertionAtCharIndex:(unint64_t)a3;
- (unint64_t)autoNumberFootnoteCountForRange:(_NSRange)a3;
- (unint64_t)changeCount;
- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3;
- (unint64_t)charIndexMappedToStorage:(unint64_t)a3;
- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3;
- (unint64_t)characterCount;
- (unint64_t)characterStyleAttributeCount;
- (unint64_t)columnStyleCount;
- (unint64_t)emptyParagraphCount:(_NSRange)a3;
- (unint64_t)findCharIndexForAttachment:(id)a3;
- (unint64_t)findCharIndexForFootnoteAttachment:(id)a3;
- (unint64_t)findCharacterIndexForContainedInfo:(id)a3;
- (unint64_t)findNextParagraphStyleChange:(unint64_t)a3 maxCharIndex:(unint64_t)a4;
- (unint64_t)firstParIndexInListAtParIndex:(unint64_t)a3;
- (unint64_t)footnoteCount;
- (unint64_t)footnoteIndexForCharIndex:(unint64_t)a3;
- (unint64_t)footnoteIndexForFootnote:(id)a3;
- (unint64_t)footnoteIndexForFootnoteStorage:(id)a3;
- (unint64_t)indexAfterLastVisibleCharInRange:(_NSRange)a3;
- (unint64_t)indexForCharacter:(unsigned __int16)a3 startCharIndex:(unint64_t)a4;
- (unint64_t)indexOfFirstNonDeletedCharInRange:(_NSRange)a3;
- (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3;
- (unint64_t)length;
- (unint64_t)listEndAtCharIndex:(unint64_t)a3;
- (unint64_t)listNumberForParagraphEnumerator:(const TSWPParagraphEnumerator *)a3 numberingData:(id *)a4;
- (unint64_t)listNumberForParagraphIndex:(unint64_t)a3 numberingData:(id *)a4;
- (unint64_t)listStartAtCharIndex:(unint64_t)a3;
- (unint64_t)listStyleCount;
- (unint64_t)nextCharacterIndex:(unint64_t)a3;
- (unint64_t)p_indexOfFirstNonDeletedCharInRange:(_NSRange)a3 requireVisible:(BOOL)a4;
- (unint64_t)paragraphCount;
- (unint64_t)paragraphEndAtCharIndex:(unint64_t)a3;
- (unint64_t)paragraphIndexAtCharIndex:(unint64_t)a3;
- (unint64_t)paragraphLevelAtCharIndex:(unint64_t)a3;
- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3;
- (unint64_t)previousCharacterIndex:(unint64_t)a3;
- (unint64_t)previousCharacterIndex:(unint64_t)location forDelete:(BOOL)a4;
- (unint64_t)sectionCount;
- (unint64_t)sectionIndexForCharIndex:(unint64_t)a3;
- (unint64_t)sectionIndexForSection:(id)a3;
- (unint64_t)selectedParagraphBreakCount:(_NSRange)a3;
- (unint64_t)selectionRangeMaxForCharIndex:(unint64_t)a3;
- (unint64_t)storageLength;
- (unint64_t)wordCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (unsigned)disallowedElementKinds;
- (unsigned)paragraphFlagsAtCharIndex:(unint64_t)a3;
- (void)acceptVisitor:(id)a3;
- (void)addAllDictationAndAutocorrectionKeyRangesInRange:(_NSRange)a3 toRanges:(void *)a4;
- (void)addDisallowedElementKind:(int)a3;
- (void)addGlyphVariantData:(id)a3 toRange:(_NSRange)a4;
- (void)addObserver:(id)a3;
- (void)addSmartField:(id)a3 toRange:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)appendSection:(id)a3 charIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)applyChange:(id)a3 changeRange:(_NSRange)a4 accept:(BOOL)a5 undoTransaction:(void *)a6;
- (void)applyChanges:(BOOL)a3 inRange:(_NSRange)a4 inSelectionRange:(_NSRange)a5 outChangedRange:(_NSRange *)a6 outSelectionRange:(_NSRange *)a7 undoTransaction:(void *)a8 forceAll:(BOOL)a9;
- (void)applyDataValue:(unsigned int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphIndexRange:(_NSRange)a5 forKind:(unsigned int)a6 undoTransaction:(TSWPStorageTransaction *)a7;
- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphsInCharRange:(_NSRange)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)applyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7;
- (void)applyObject:(id)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)applyObject:(id)a3 toParagraphsInCharRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)applyWritingDirection:(int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)autoUpdateField:(id)a3 withRange:(_NSRange)a4 documentRoot:(id)a5 returningInsertedRange:(_NSRange *)a6;
- (void)autoUpdateSmartFieldsWithDocumentRoot:(id)a3;
- (void)changeViewSettingsDidChange;
- (void)clearBackPointerToParentInfoIfNeeded:(id)a3;
- (void)compress:(TSWPStorageTransaction *)a3;
- (void)compressAttributeArrayKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (void)continueSearch:(id)a3;
- (void)dealloc;
- (void)deleteRange:(_NSRange)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (void)enumerateAttachmentsInTextRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateAttachmentsOfClass:(Class)a3 inTextRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateParagraphsIntersectingTextRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)filterInvalidContentForStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (void)filterSectionBreaksFromStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (void)findChangesInRange:(_NSRange)a3 onHit:(id)a4;
- (void)fixGlyphVariantFontsForRange:(_NSRange)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8;
- (void)insertParagraphData:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 undoTransaction:(TSWPStorageTransaction *)a7;
- (void)insertStorage:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)insertString:(id)a3 atCharIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)invalidateCharIndexForAttachment:(id)a3;
- (void)invalidateFootnoteAttachmentCharIndexes;
- (void)invalidateForStyle:(id)a3;
- (void)invalidatePageCountAttachmentCharIndexes:(BOOL)a3;
- (void)lowLevelApplyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7;
- (void)pApplyOverrideObjectAfterReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)pApplyOverrideObjectAfterReplacingCharactersInSelection:(id)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)pMapAttributesFromAttributedString:(id)a3 ontoRange:(_NSRange)a4 asCharacterStylesOnly:(BOOL)a5;
- (void)p_attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6;
- (void)p_didChangeRange:(_NSRange)a3 delta:(int64_t)a4 broadcastKind:(int)a5;
- (void)p_fillMarkers:(void *)a3 startingAtCharIndex:(unint64_t)a4 forCount:(unint64_t)a5;
- (void)p_fillMarkers:(void *)a3 string:(id)a4 length:(unint64_t)a5 hasAttachments:(BOOL *)a6 hasFootnotes:(BOOL *)a7 hasBreaks:(BOOL *)a8;
- (void)p_handleChangeSplittingForInsertedRange:(_NSRange)a3 changeSession:(id)a4 undoTransaction:(void *)a5;
- (void)p_lowLevelReplaceCharactersInRange:(_NSRange)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)p_replaceCharactersInSelection:(id)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)paragraphFlags:(unsigned __int16 *)a3 andLevel:(unint64_t *)a4 atCharIndex:(unint64_t)a5;
- (void)removeDisallowedElementKind:(int)a3;
- (void)removeGlyphVariantDataFromRange:(_NSRange)a3;
- (void)removeObserver:(id)a3;
- (void)removeSmartField:(id)a3 fromRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 options:(unint64_t)a5 changedRange:(_NSRange *)a6 changeDelta:(int64_t *)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9;
- (void)replaceReferencedStylesUsingBlock:(id)a3;
- (void)replaceSectionAtSectionIndex:(unint64_t)a3 withSection:(id)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)replaceWithAttachment:(id)a3 forAttachmentIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)setCharacterStyle:(id)a3 range:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setColumnStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setDictationAndAutocorrection:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setDocumentRoot:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setHyperlinkCellID:(id)a3;
- (void)setIgnoreContentsChangedNotifications:(BOOL)a3;
- (void)setLanguage:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setListStart:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setListStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setListStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setOwningAttachment:(id)a3;
- (void)setParagraphFlags:(unsigned __int16)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParagraphLevel:(unint64_t)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParagraphLevel:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParagraphStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParagraphStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParagraphWritingDirection:(int)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5;
- (void)setParentInfo:(id)a3;
- (void)setWPKind:(int)a3 undoTransaction:(TSWPStorageTransaction *)a4;
- (void)smartFieldDidChange:(id)a3;
- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 attributeKind:(unsigned int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7;
- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6;
- (void)stashBroadcaster;
- (void)styleDidChangeInRange:(_NSRange)a3;
- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 forSourceRange:(_NSRange)a4 toDestStorage:(id)a5 objectContext:(id)a6 dolcContext:(id)a7 flags:(int)a8;
- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 toAttributeArrayDest:(TSWPAttributeArray *)a4 atCharIndex:(unint64_t)a5 dolcContext:(id)a6 undoTransaction:(void *)a7;
- (void)unstashBroadcaster;
- (void)wasAddedToDocumentRoot:(id)a3 dolcContext:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 dolcContext:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation TSWPStorage

- (id)stylesheet
{
  return self->_stylesheet;
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 notifyObservers:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  BOOL v7 = a5;
  v10 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  uint64_t v11 = [(TSWPStorage *)self p_replaceCharactersInLogicalSelection:v10 withString:a4 withFlags:v7 replaceTextData:0 changeSession:0 undoTransaction:a6 outInsertedRange:0];
  NSUInteger v13 = v12;

  NSUInteger v14 = v11;
  NSUInteger v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)p_replaceCharactersInLogicalSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9
{
  char v62 = a5;
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t location = [a3 range];
  NSUInteger length = v13;
  [a3 range];
  if (v15 || [a4 length])
  {
    uint64_t v16 = [a3 range];
    v66 = self;
    if (v16 != [(TSWPStorage *)self length]
      && (-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", [a3 range]) & 0xFC00) == 0xDC00)
    {
      v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2432, @"Inserting text within surrogate pair");
    }
    [(TSPObject *)self willModify];
    id v60 = [(TSWPStorage *)self relocateNonSelectedAnchorsInSelection:a3 undoTransaction:a8];
    self->_delayBroadcast = 1;
    id v59 = a4;
    id v19 = -[TSWPStorage p_replacementsForSelection:withString:changeSession:shouldTrackDeletions:](self, "p_replacementsForSelection:withString:changeSession:shouldTrackDeletions:");
    __p = 0;
    v72 = 0;
    v73 = 0;
    uint64_t v20 = *MEMORY[0x263F7C7C8];
    uint64_t v21 = *(void *)(MEMORY[0x263F7C7C8] + 8);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v19;
    uint64_t v22 = 0;
    uint64_t v23 = [v19 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v23)
    {
      uint64_t v64 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v68 != v64) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          objc_msgSend(v25, "performWithStorage:delta:undoTransaction:replaceBlock:");
          uint64_t v26 = [v25 delta];
          uint64_t v27 = [v25 insertedRange];
          uint64_t v29 = v27;
          uint64_t v30 = v28;
          v31 = v72;
          if (v72 >= v73)
          {
            v33 = (uint64_t *)__p;
            uint64_t v34 = ((char *)v72 - (unsigned char *)__p) >> 4;
            unint64_t v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60) {
              abort();
            }
            uint64_t v36 = (char *)v73 - (unsigned char *)__p;
            if (((char *)v73 - (unsigned char *)__p) >> 3 > v35) {
              unint64_t v35 = v36 >> 3;
            }
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v35;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v73, v37);
              v33 = (uint64_t *)__p;
              v31 = v72;
            }
            else
            {
              v38 = 0;
            }
            v39 = (uint64_t *)&v38[16 * v34];
            uint64_t *v39 = v29;
            v39[1] = v30;
            v40 = (char *)v39;
            if (v31 != v33)
            {
              do
              {
                *((_OWORD *)v40 - 1) = *((_OWORD *)v31 - 1);
                v40 -= 16;
                v31 -= 2;
              }
              while (v31 != v33);
              v33 = (uint64_t *)__p;
            }
            v32 = v39 + 2;
            __p = v40;
            v72 = v39 + 2;
            v73 = (uint64_t *)&v38[16 * v37];
            if (v33) {
              operator delete(v33);
            }
          }
          else
          {
            uint64_t *v72 = v27;
            v31[1] = v28;
            v32 = v31 + 2;
          }
          v72 = v32;
          [v25 insertedRange];
          if (v41)
          {
            uint64_t v20 = [v25 insertedRange];
            uint64_t v21 = v42;
          }
          v22 += v26;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v23);
    }
    if (a6)
    {
      v43 = v66;
      if (v21)
      {
        if (![a6->var0 isEqualToString:@"TSWPShouldExtendStoredLanguage"])
        {
          if ([v59 isEqualToString:@"\t"]
            && -[TSWPStorage writingDirectionForParagraphAtCharIndex:](v66, "writingDirectionForParagraphAtCharIndex:", v20) == 1&& [MEMORY[0x263EFF960] characterDirectionForLanguage:a6->var0] != 2)
          {
            -[TSWPStorage setLanguage:forCharRange:undoTransaction:](v66, "setLanguage:forCharRange:undoTransaction:", *MEMORY[0x263F7C900], v20, v21, a8);
          }
          else
          {
            -[TSWPStorage setLanguage:forCharRange:undoTransaction:](v66, "setLanguage:forCharRange:undoTransaction:", a6->var0, v20, v21, a8);
          }
        }
        -[TSWPStorage setDictationAndAutocorrection:forCharRange:undoTransaction:](v66, "setDictationAndAutocorrection:forCharRange:undoTransaction:", a6->var1, v20, v21, a8);
      }
    }
    else
    {
      v43 = v66;
      if (v21) {
        -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](v66, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, v20, v21, 13, 0, a8);
      }
    }
    v43->_delayBroadcast = 0;
    uint64_t location = [v60 range];
    NSUInteger length = 0;
    v44 = (NSRange *)__p;
    if (__p != v72)
    {
      unsigned __int8 v45 = 0;
      do
      {
        v76.uint64_t location = location;
        v76.NSUInteger length = length;
        NSRange v46 = NSUnionRange(v76, *v44);
        uint64_t location = v46.location;
        NSUInteger length = v46.length;
        NSUInteger v47 = v44->length;
        if (((v47 != 0) & v45) == 1)
        {
          v48 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v49 = [NSString stringWithUTF8String:"-[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:]"];
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2510, @"multiple inserted ranges aren't handled yet");
        }
        v45 |= v47 != 0;
        ++v44;
      }
      while (v44 != (NSRange *)v72);
    }
    if (v62)
    {
      NSUInteger v50 = v66->_rangeToBroadcast.location;
      NSUInteger v51 = v66->_rangeToBroadcast.length;
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v66, "p_didChangeRange:delta:broadcastKind:", location, length, v22, 1);
      if (v50 | v51) {
        -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v66, "p_didChangeRange:delta:broadcastKind:", v50, v51, 0, 1);
      }
    }
    v52 = (uint64_t *)__p;
    if (a9)
    {
      v53 = (_NSRange *)v72;
      if (__p != v72)
      {
        v54 = (_NSRange *)__p;
        do
        {
          *a9 = *v54;
          NSUInteger v55 = v54->length;
          ++v54;
          if (v55) {
            BOOL v56 = 1;
          }
          else {
            BOOL v56 = v54 == v53;
          }
        }
        while (!v56);
      }
    }
    v66->_rangeToBroadcast.uint64_t location = 0;
    v66->_rangeToBroadcast.NSUInteger length = 0;
    if (v52)
    {
      v72 = v52;
      operator delete(v52);
    }
  }
  NSUInteger v57 = location;
  NSUInteger v58 = length;
  result.NSUInteger length = v58;
  result.uint64_t location = v57;
  return result;
}

- (void)compressAttributeArrayKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  attributesTable = self->_attributesTable;
  v5 = self->_attributesTable[a3];
  if (v5)
  {
    (*((void (**)(TSWPAttributeArray *, TSWPStorageTransaction *))v5->var0 + 19))(self->_attributesTable[a3], a4);
    if ((*((unsigned int (**)(TSWPAttributeArray *))v5->var0 + 6))(v5))
    {
      (*((void (**)(TSWPAttributeArray *))v5->var0 + 1))(v5);
      attributesTable[a3] = 0;
    }
  }
}

uint64_t __137__TSWPStorage_p_replaceCharactersInLogicalSelection_withString_withFlags_replaceTextData_changeSession_undoTransaction_outInsertedRange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a3 length];
  uint64_t v8 = *(void *)(a1 + 40);

  return objc_msgSend(v6, "p_replaceCharactersInSelection:withString:length:undoTransaction:", a2, a3, v7, v8);
}

- (void)p_replaceCharactersInSelection:(id)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  __p = 0;
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  __int16 v33 = 0;
  if (!a3)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPStorage(TSWPStorage_private) p_replaceCharactersInSelection:withString:length:undoTransaction:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_private.mm"), 78, @"invalid nil value for '%s'", "selection");
  }
  if (a5) {
    [(TSWPStorage *)self p_fillMarkers:&__p string:a4 length:a5 hasAttachments:(char *)&v33 + 1 hasFootnotes:&v33 hasBreaks:0];
  }
  id v13 = [(TSWPStorage *)self pOverrideObjectBeforeReplacingCharactersInSelection:a3 withString:a4];
  uint64_t v14 = 0;
  do
  {
    if (v14)
    {
      BOOL v15 = v14 == 4 && HIBYTE(v33) != 0;
      BOOL v16 = v14 != 5 || v33 == 0;
      uint64_t v17 = !v16 || (unint64_t)v15;
      uint64_t v18 = [(TSWPStorage *)self attributeArrayForKind:v14 withCreate:v17 undoTransaction:a6];
      if (v18)
      {
        uint64_t v19 = [a3 range];
        (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *))v18->var0
         + 9))(v18, v19, v20, a4, a5, &__p, a6);
      }
    }
    uint64_t v14 = (v14 + 1);
  }
  while (v14 != 19);
  uint64_t v21 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:0 undoTransaction:a6];
  if (v21)
  {
    uint64_t v22 = [a3 range];
    (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *))v21->var0
     + 9))(v21, v22, v23, a4, a5, &__p, a6);
  }
  uint64_t v24 = [a3 range];
  -[TSWPStorage p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:](self, "p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:", v24, v25, a4, a5, a6);
  uint64_t v26 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (v26)
  {
    uint64_t v27 = [a3 range];
    (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *, uint64_t))v26->var0
     + 11))(v26, v27, v28, a4, a5, &__p, a6, [a3 styleInsertionBehavior]);
  }
  uint64_t v29 = 0;
  do
  {
    if (v29)
    {
      uint64_t v30 = [(TSWPStorage *)self attributeArrayForKind:v29];
      if (v30)
      {
        uint64_t v31 = [a3 range];
        (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *, uint64_t))v30->var0
         + 11))(v30, v31, v32, a4, a5, &__p, a6, [a3 styleInsertionBehavior]);
      }
    }
    uint64_t v29 = (v29 + 1);
  }
  while (v29 != 19);
  [(TSWPStorage *)self pApplyOverrideObjectAfterReplacingCharactersInSelection:a3 withString:a4 overrideObject:v13 undoTransaction:a6];
  if (__p)
  {
    unint64_t v35 = __p;
    operator delete(__p);
  }
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  return [(TSWPStorage *)self attributeArrayForKind:*(void *)&a3 withCreate:a4 fromUndo:0 undoTransaction:a5];
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 fromUndo:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  attributesTable = self->_attributesTable;
  _NSRange result = self->_attributesTable[a3];
  if (result) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !a4;
  }
  if (!v9)
  {
    BOOL v11 = a5;
    uint64_t v12 = *(void *)&a3;
    uint64_t v13 = a3;
    uint64_t v14 = objc_opt_class();
    if (v11) {
      _NSRange result = (TSWPAttributeArray *)[v14 createEmptyAttributeArrayForKind:v12];
    }
    else {
      _NSRange result = (TSWPAttributeArray *)[v14 createAttributeArrayForKind:v12 undoTransaction:a6];
    }
    attributesTable[v13] = result;
    if (result) {
      result->var5 = self;
    }
  }
  return result;
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3
{
  return [(TSWPStorage *)self attributeArrayForKind:*(void *)&a3 withCreate:0 undoTransaction:0];
}

+ (TSWPAttributeArray)createAttributeArrayForKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  v6 = +[TSWPStorage createEmptyAttributeArrayForKind:](TSWPStorage, "createEmptyAttributeArrayForKind:");
  uint64_t v7 = v6;
  if (a3 > 0x12)
  {
    BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"+[TSWPStorage(AttributeTables) createAttributeArrayForKind:undoTransaction:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 116, @"createAttributeArrayForKind: bad kind.");
  }
  else if (((1 << a3) & 0x40F37) == 0)
  {
    v11[0] = 0;
    v11[1] = 0;
    TSWPAttributeArray::insertAttribute(v6, (const TSWPAttributeRecord *)v11, 0, 0, a4);
  }
  return v7;
}

+ (TSWPAttributeArray)createEmptyAttributeArrayForKind:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
    case 1u:
    case 2u:
    case 0xAu:
    case 0xBu:
    case 0x12u:
      v4 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x263F8C180]);
      v5 = v4;
      if (v4)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v4, a3);
        goto LABEL_4;
      }
      break;
    case 3u:
      BOOL v11 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x263F8C180]);
      v5 = v11;
      if (v11)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v11, 3);
        v5->var0 = (void **)&unk_26D687C30;
        LOBYTE(v5[1].var0) = 0;
        *(void *)&v5[1].var1 = 0;
      }
      break;
    case 4u:
      uint64_t v12 = (TSWPAttributeArray *)operator new(0x38uLL, MEMORY[0x263F8C180]);
      v5 = v12;
      if (v12)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v12, 4);
        goto LABEL_16;
      }
      break;
    case 5u:
      uint64_t v13 = (TSWPAttributeArray *)operator new(0x38uLL, MEMORY[0x263F8C180]);
      v5 = v13;
      if (v13)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v13, 5);
LABEL_16:
        uint64_t v8 = (void **)&unk_26D688538;
        goto LABEL_30;
      }
      break;
    case 6u:
    case 7u:
      v6 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x263F8C180]);
      v5 = v6;
      if (v6)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v6, a3);
        goto LABEL_23;
      }
      break;
    case 8u:
      uint64_t v14 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x263F8C180]);
      v5 = v14;
      if (v14)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v14, 8);
        goto LABEL_4;
      }
      break;
    case 9u:
      BOOL v15 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x263F8C180]);
      v5 = v15;
      if (v15)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v15, 9);
LABEL_4:
        v5->var0 = (void **)&unk_26D6875A8;
        LOBYTE(v5[1].var0) = 0;
        *(void *)&v5[1].var1 = 0x7FFFFFFFFFFFFFFFLL;
      }
      break;
    case 0xCu:
      BOOL v16 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x263F8C180]);
      v5 = v16;
      if (v16)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v16, 12);
LABEL_23:
        LOBYTE(v5[1].var0) = 0;
        *(void *)&v5[1].var1 = 0;
        uint64_t v8 = (void **)&unk_26D688408;
        goto LABEL_30;
      }
      break;
    case 0xDu:
    case 0xEu:
      uint64_t v7 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x263F8C180]);
      v5 = v7;
      if (v7)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v7, a3);
        LOBYTE(v5[1].var0) = 0;
        *(void *)&v5[1].var1 = 0;
        uint64_t v8 = (void **)&unk_26D687D58;
        goto LABEL_30;
      }
      break;
    case 0xFu:
      uint64_t v17 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x263F8C180]);
      v5 = v17;
      if (v17) {
        TSWPChangeAttributeArray::TSWPChangeAttributeArray((uint64_t)v17, 15);
      }
      break;
    case 0x10u:
      uint64_t v18 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x263F8C180]);
      v5 = v18;
      if (v18) {
        TSWPChangeAttributeArray::TSWPChangeAttributeArray((uint64_t)v18, 16);
      }
      break;
    case 0x11u:
      uint64_t v19 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x263F8C180]);
      v5 = v19;
      if (v19)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v19, 17);
        LOBYTE(v5[1].var0) = 0;
        *(void *)&v5[1].var1 = 0;
        uint64_t v8 = (void **)&unk_26D687480;
LABEL_30:
        v5->var0 = v8;
      }
      break;
    default:
      BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"+[TSWPStorage(AttributeTables) createEmptyAttributeArrayForKind:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 83, @"createAttributeArrayForKind: bad kind.");
      v5 = 0;
      break;
  }
  return v5;
}

- (id)documentRoot
{
  return self->_documentRoot;
}

- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4 requireHidden:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  NSUInteger v13 = location + length;
  if (v13 == [(TSWPStorage *)self length])
  {
    uint64_t v14 = [(TSWPStorage *)self paragraphCount];
  }
  else if (length)
  {
    uint64_t v14 = [(TSWPStorage *)self paragraphIndexAtCharIndex:v13 - 1] + 1;
  }
  else
  {
    uint64_t v14 = v12 + 1;
  }

  return (TSWPParagraphEnumerator *)TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)retstr, (uint64_t)self, (uint64_t)a5, v12, v14, a6);
}

- (unint64_t)length
{
  return [(NSMutableString *)self->_string length];
}

- (unint64_t)paragraphIndexAtCharIndex:(unint64_t)a3
{
  v4 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (!v4)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphIndexAtCharIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3193, @"paragraphIndexAtCharIndex: no paragraph table.");
  }

  return TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
}

- (unint64_t)paragraphCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:0];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4
{
  if (self) {
    return (TSWPParagraphEnumerator *)-[TSWPParagraphEnumerator paragraphEnumeratorForCharRange:styleProvider:requireHidden:](self, "paragraphEnumeratorForCharRange:styleProvider:requireHidden:", a4.location, a4.length, a5, 1);
  }
  *(void *)&retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return self;
}

- (TSWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  unint64_t result = [(TSWPStorage *)self length];
  if (self)
  {
    if ((unint64_t)result >= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = (unint64_t)result;
    }
    if ((unint64_t)result <= a4) {
      unint64_t v11 = a4;
    }
    else {
      unint64_t v11 = (unint64_t)result;
    }
    return -[TSWPStorage paragraphEnumeratorForCharRange:styleProvider:](self, "paragraphEnumeratorForCharRange:styleProvider:", v10, v11 - v10, a5);
  }
  else
  {
    *(void *)&retstr->var6 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }
  return result;
}

- (_NSRange)textRangeForParagraphAtIndex:(unint64_t)a3
{
  v5 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = TSWPAttributeArray::charIndexForAttributeIndex(v5, a3);
    if (a3 + 1 >= v6->var2) {
      uint64_t v8 = [(TSWPStorage *)self characterCount];
    }
    else {
      uint64_t v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3 + 1);
    }
    NSUInteger v11 = v8 - v7;
  }
  else
  {
    BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage textRangeForParagraphAtIndex:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3205, @"textRangeForParagraphAtIndex: no paragraph table.");
    NSUInteger v11 = 0;
    uint64_t v7 = 0;
  }
  NSUInteger v12 = v7;
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

- (unint64_t)characterCount
{
  return [(NSMutableString *)self->_string length];
}

- (void)p_lowLevelReplaceCharactersInRange:(_NSRange)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(NSMutableString *)self->_string length])
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage(TSWPStorage_private) p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_private.mm"), 143, @"Attempting to delete past end of storage.");
  }
  string = self->_string;
  if (a4) {
    NSUInteger v13 = (__CFString *)a4;
  }
  else {
    NSUInteger v13 = &stru_26D688A48;
  }

  -[NSMutableString replaceCharactersInRange:withString:](string, "replaceCharactersInRange:withString:", location, length, v13);
}

- (void)p_fillMarkers:(void *)a3 string:(id)a4 length:(unint64_t)a5 hasAttachments:(BOOL *)a6 hasFootnotes:(BOOL *)a7 hasBreaks:(BOOL *)a8
{
  if (a5)
  {
    unint64_t v11 = a5;
    if (a5 == 1)
    {
      uint64_t v13 = [a4 characterAtIndex:0];
      if (v13 == 14)
      {
        if (a7) {
          *a7 = 1;
        }
        unint64_t v41 = *((void *)a3 + 2);
        unint64_t v16 = *((void *)a3 + 1);
        if (v16 < v41)
        {
          *(void *)unint64_t v16 = 0;
          __int16 v17 = 14;
          goto LABEL_56;
        }
        uint64_t v49 = (uint64_t)(v16 - *(void *)a3) >> 4;
        unint64_t v50 = v49 + 1;
        if (!((unint64_t)(v49 + 1) >> 60))
        {
          uint64_t v51 = v41 - *(void *)a3;
          if (v51 >> 3 > v50) {
            unint64_t v50 = v51 >> 3;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52) {
            v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v52);
          }
          else {
            v53 = 0;
          }
          id v59 = &v53[16 * v49];
          id v60 = &v53[16 * v52];
          *(void *)id v59 = 0;
          *((_WORD *)v59 + 4) = 14;
          v43 = v59 + 16;
          v63 = *(char **)a3;
          v61 = (char *)*((void *)a3 + 1);
          if (v61 == *(char **)a3) {
            goto LABEL_99;
          }
          do
          {
            *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
            v59 -= 16;
            v61 -= 16;
          }
          while (v61 != v63);
          goto LABEL_98;
        }
      }
      else
      {
        __int16 v14 = v13;
        if (v13 == 65532)
        {
          if (a6) {
            *a6 = 1;
          }
          unint64_t v15 = *((void *)a3 + 2);
          unint64_t v16 = *((void *)a3 + 1);
          if (v16 < v15)
          {
            *(void *)unint64_t v16 = 0;
            __int16 v17 = -4;
LABEL_56:
            *(_WORD *)(v16 + 8) = v17;
LABEL_62:
            v43 = (char *)(v16 + 16);
LABEL_101:
            *((void *)a3 + 1) = v43;
            return;
          }
          uint64_t v44 = (uint64_t)(v16 - *(void *)a3) >> 4;
          unint64_t v45 = v44 + 1;
          if (!((unint64_t)(v44 + 1) >> 60))
          {
            uint64_t v46 = v15 - *(void *)a3;
            if (v46 >> 3 > v45) {
              unint64_t v45 = v46 >> 3;
            }
            if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v47 = v45;
            }
            if (v47) {
              v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v47);
            }
            else {
              v48 = 0;
            }
            id v59 = &v48[16 * v44];
            id v60 = &v48[16 * v47];
            *(void *)id v59 = 0;
            *((_WORD *)v59 + 4) = -4;
            v43 = v59 + 16;
            char v62 = *(char **)a3;
            v61 = (char *)*((void *)a3 + 1);
            if (v61 == *(char **)a3) {
              goto LABEL_99;
            }
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
              v59 -= 16;
              v61 -= 16;
            }
            while (v61 != v62);
LABEL_98:
            v61 = *(char **)a3;
LABEL_99:
            *(void *)a3 = v59;
            *((void *)a3 + 1) = v43;
            *((void *)a3 + 2) = v60;
            if (v61) {
              operator delete(v61);
            }
            goto LABEL_101;
          }
        }
        else
        {
          if (!IsParagraphBreakingCharacter(v13)) {
            return;
          }
          if (a8) {
            *a8 = 1;
          }
          unint64_t v42 = *((void *)a3 + 2);
          unint64_t v16 = *((void *)a3 + 1);
          if (v16 < v42)
          {
            *(void *)unint64_t v16 = 0;
            *(_WORD *)(v16 + 8) = v14;
            goto LABEL_62;
          }
          uint64_t v54 = (uint64_t)(v16 - *(void *)a3) >> 4;
          unint64_t v55 = v54 + 1;
          if (!((unint64_t)(v54 + 1) >> 60))
          {
            uint64_t v56 = v42 - *(void *)a3;
            if (v56 >> 3 > v55) {
              unint64_t v55 = v56 >> 3;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v57 = v55;
            }
            if (v57) {
              NSUInteger v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v57);
            }
            else {
              NSUInteger v58 = 0;
            }
            id v59 = &v58[16 * v54];
            id v60 = &v58[16 * v57];
            *(void *)id v59 = 0;
            *((_WORD *)v59 + 4) = v14;
            v43 = v59 + 16;
            uint64_t v64 = *(char **)a3;
            v61 = (char *)*((void *)a3 + 1);
            if (v61 == *(char **)a3) {
              goto LABEL_99;
            }
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
              v59 -= 16;
              v61 -= 16;
            }
            while (v61 != v64);
            goto LABEL_98;
          }
        }
      }
LABEL_103:
      abort();
    }
    CFIndex v18 = 0;
    uint64_t v19 = 0;
    long long v69 = (char *)a3 + 16;
    do
    {
      if (!v19) {
        uint64_t v19 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
      }
      unint64_t v20 = v18 + 1024;
      unint64_t v68 = v18 + 1024;
      if (v18 + 1024 >= v11) {
        unint64_t v20 = v11;
      }
      CFIndex v67 = v20;
      uint64_t v21 = v20 - v18;
      v72.NSUInteger location = v18;
      v72.NSUInteger length = v20 - v18;
      CFStringGetCharacters((CFStringRef)a4, v72, v19);
      if (v21 >= 1)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if ((IsParagraphBreakingCharacter(v19[i]) & 1) == 0)
          {
            int v23 = v19[i];
            if (v23 != 65532 && v23 != 14) {
              continue;
            }
          }
          if (a6 && (uint64_t v25 = a6, (__int16)v19[i] == -4)
            || a7 && (uint64_t v25 = a7, v19[i] == 14)
            || a8 && (int v26 = IsParagraphBreakingCharacter(v19[i]), v25 = a8, v26))
          {
            BOOL *v25 = 1;
          }
          CFIndex v27 = i + v18;
          UniChar v28 = v19[i];
          unint64_t v30 = *((void *)a3 + 1);
          unint64_t v29 = *((void *)a3 + 2);
          if (v30 >= v29)
          {
            uint64_t v32 = (uint64_t)(v30 - *(void *)a3) >> 4;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 60) {
              goto LABEL_103;
            }
            uint64_t v34 = v29 - *(void *)a3;
            if (v34 >> 3 > v33) {
              unint64_t v33 = v34 >> 3;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v33;
            }
            if (v35) {
              uint64_t v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)v69, v35);
            }
            else {
              uint64_t v36 = 0;
            }
            unint64_t v37 = &v36[16 * v32];
            *(void *)unint64_t v37 = v27;
            *((_WORD *)v37 + 4) = v28;
            v39 = *(char **)a3;
            v38 = (char *)*((void *)a3 + 1);
            v40 = v37;
            if (v38 != *(char **)a3)
            {
              do
              {
                *((_OWORD *)v40 - 1) = *((_OWORD *)v38 - 1);
                v40 -= 16;
                v38 -= 16;
              }
              while (v38 != v39);
              v38 = *(char **)a3;
            }
            uint64_t v31 = v37 + 16;
            *(void *)a3 = v40;
            *((void *)a3 + 1) = v37 + 16;
            *((void *)a3 + 2) = &v36[16 * v35];
            if (v38) {
              operator delete(v38);
            }
          }
          else
          {
            *(void *)unint64_t v30 = v27;
            *(_WORD *)(v30 + 8) = v28;
            uint64_t v31 = (char *)(v30 + 16);
          }
          *((void *)a3 + 1) = v31;
        }
      }
      CFIndex v18 = v67;
      unint64_t v11 = a5;
    }
    while (v68 < a5);
    if (v19)
    {
      free(v19);
    }
  }
}

- (id)p_replacementsForSelection:(id)a3 withString:(id)a4 changeSession:(id)a5 shouldTrackDeletions:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v11 = (void *)[MEMORY[0x263EFF980] array];
  if (a5)
  {
    v60.NSUInteger location = [a3 range];
    v60.NSUInteger length = v12;
    TSWPRangeVector::TSWPRangeVector(&v59, &v60);
    memset(&__p, 0, sizeof(__p));
    if (v60.length)
    {
      if (v6) {
        TSWPRangeVector::addRange(&__p, &v60);
      }
      uint64_t v13 = [(TSWPStorage *)self insertionChangesTable];
      __int16 v14 = (TSWPAttributeArray *)v13;
      if (v13)
      {
        TSWPAttributeArray::begin((TSWPAttributeArray *)v13, &v60, &v56);
        TSWPAttributeArray::end(v14, &v60, &v54);
        for (unint64_t i = v57; i != v55; unint64_t i = ++v57)
        {
          if ([*((id *)v56->var4 + 2 * i + 1) isFromChangeSession:a5])
          {
            v53.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            v53.NSUInteger length = v16;
            TSWPRangeVector::removeRange(&__p, &v53);
          }
        }
      }
      __int16 v17 = [(TSWPStorage *)self attributeArrayForKind:4];
      CFIndex v18 = v17;
      if (v17)
      {
        TSWPAttributeArray::begin(v17, &v60, &v56);
        TSWPAttributeArray::end(v18, &v60, &v54);
        for (j = v57; j != v55; unint64_t v57 = j)
        {
          if (([*((id *)v56->var4 + 2 * j + 1) elementKind] & 0x10000F) != 0)
          {
            NSUInteger v20 = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v53.NSUInteger location = v20;
              v53.NSUInteger length = 1;
              TSWPRangeVector::removeRange(&__p, &v53);
            }
          }
          unint64_t j = v57 + 1;
        }
      }
      uint64_t v21 = [(TSWPStorage *)self attributeArrayForKind:6];
      uint64_t v22 = v21;
      if (v21)
      {
        TSWPAttributeArray::begin(v21, &v60, &v56);
        TSWPAttributeArray::end(v22, &v60, &v54);
        for (k = v57; k != v55; unint64_t v57 = k)
        {
          if ([*((id *)v56->var4 + 2 * k + 1) isMemberOfClass:objc_opt_class()])
          {
            v53.NSUInteger location = 0;
            v53.NSUInteger length = 0;
            v53.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            v53.NSUInteger length = v24;
            TSWPRangeVector::removeRange(&__p, &v53);
          }
          unint64_t k = v57 + 1;
        }
      }
      begin = __p.__begin_;
      end = __p.__end_;
      while (begin != end)
        TSWPRangeVector::removeRange(&v59, begin++);
      CFIndex v27 = [(TSWPStorage *)self deletionChangesTable];
      UniChar v28 = (TSWPAttributeArray *)v27;
      if (v27)
      {
        TSWPAttributeArray::begin((TSWPAttributeArray *)v27, &v60, &v56);
        TSWPAttributeArray::end(v28, &v60, &v54);
        unint64_t v29 = v57;
        uint64_t v30 = v55;
        while (v29 != v30)
        {
          if (*((void *)v56->var4 + 2 * v29 + 1))
          {
            v53.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v56, v29);
            v53.NSUInteger length = v31;
            TSWPRangeVector::removeRange(&__p, &v53);
            unint64_t v29 = v57;
            uint64_t v30 = v55;
          }
          unint64_t v57 = ++v29;
        }
      }
    }
    id v51 = a5;
    id v52 = a3;
    id v32 = a4;
    NSUInteger v33 = v60.length + v60.location;
    unint64_t v35 = v59.__begin_;
    uint64_t v34 = v59.__end_;
    if (v59.__begin_ == v59.__end_)
    {
      NSUInteger v36 = 0;
    }
    else
    {
      NSUInteger v36 = 0;
      do
      {
        NSUInteger location = v35->location;
        NSUInteger length = v35->length;
        if (length + v35->location == v60.length + v60.location)
        {
          NSUInteger v36 = v35->length;
          NSUInteger v33 = v35->location;
          v39 = v32;
        }
        else
        {
          v39 = 0;
        }
        if (!objc_msgSend(v39, "length", v51))
        {
          v40 = objc_msgSend(v52, "copyWithNewRange:", location, length);
          unint64_t v41 = [[TSWPTextReplacement alloc] initWithSelection:v40 string:v39];
          [v11 addObject:v41];
        }
        ++v35;
      }
      while (v35 != v34);
    }
    v43 = __p.__begin_;
    uint64_t v44 = __p.__end_;
    unint64_t v45 = v32;
    for (id m = v51; v43 != v44; ++v43)
    {
      unint64_t v47 = -[TSWPTrackedDeletion initWithRange:changeSession:]([TSWPTrackedDeletion alloc], "initWithRange:changeSession:", v43->location, v43->length, v51);
      [v11 addObject:v47];
    }
    if (objc_msgSend(v45, "length", v51))
    {
      v48 = objc_msgSend(v52, "copyWithNewRange:", v33, v36);
      uint64_t v49 = [[TSWPTrackedInsertion alloc] initWithSelection:v48 string:v45 changeSession:m];
      [v11 addObject:v49];
    }
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v59.__begin_)
    {
      v59.__end_ = v59.__begin_;
      operator delete(v59.__begin_);
    }
  }
  else
  {
    unint64_t v42 = [[TSWPTextReplacement alloc] initWithSelection:a3 string:a4];
    [v11 addObject:v42];
  }
  [v11 sortUsingComparator:&__block_literal_global_76];
  return v11;
}

- (void)p_handleChangeSplittingForInsertedRange:(_NSRange)a3 changeSession:(id)a4 undoTransaction:(void *)a5
{
  _NSRange v24 = a3;
  if (a3.length)
  {
    for (uint64_t i = 0; i != 2; ++i)
    {
      uint64_t v9 = *((unsigned int *)&unk_22383BC38 + i);
      uint64_t v10 = [(TSWPStorage *)self attributeArrayForKind:v9];
      if (v10)
      {
        unint64_t v11 = v10;
        TSWPAttributeArray::begin(v10, &v24, &v22);
        TSWPAttributeArray::end(v11, &v24, v21);
        for (unint64_t j = v23; (TSWPAttributeArray *)j != v21[1]; unint64_t j = ++v23)
        {
          uint64_t v13 = (char *)v22->var4 + 16 * j;
          __int16 v14 = (void *)*((void *)v13 + 1);
          if (v14)
          {
            if ([(TSWPStorage *)self p_shouldInsertionSplitChange:*((void *)v13 + 1) changeSession:a4])
            {
              NSUInteger v15 = TSWPAttributeArray::rangeForAttributeIndex(v22, v23);
              if (v15 < v24.location)
              {
                NSUInteger v17 = v15 + v16;
                if (v15 + v16 > v24.length + v24.location)
                {
                  CFIndex v18 = objc_msgSend(v14, "copyWithContext:", -[TSPObject context](self, "context"));
                  if (v24.length + v24.location <= v17) {
                    NSUInteger v19 = v17;
                  }
                  else {
                    NSUInteger v19 = v24.length + v24.location;
                  }
                  if (v24.length + v24.location >= v17) {
                    NSUInteger v20 = v17;
                  }
                  else {
                    NSUInteger v20 = v24.length + v24.location;
                  }
                  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v18, v20, v19 - v20, v9, 0, a5);
                  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, v24.location, v24.length, v9, 0, a5);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)pOverrideObjectBeforeReplacingCharactersInSelection:(id)a3 withString:(id)a4
{
  uint64_t v7 = [a3 range];
  uint64_t v9 = v8;
  uint64_t v10 = [a3 styleInsertionBehavior];

  return -[TSWPStorage pOverrideObjectBeforeReplacingCharactersInRange:withString:withInsertionBehavior:](self, "pOverrideObjectBeforeReplacingCharactersInRange:withString:withInsertionBehavior:", v7, v9, a4, v10);
}

- (id)pOverrideObjectBeforeReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 withInsertionBehavior:(int)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v17 = *MEMORY[0x263F7C7C8];
  if (![a4 length] || !length)
  {
    uint64_t v11 = [a4 length];
    id v10 = 0;
    if (!v11 || length) {
      return v10;
    }
    if (a5 == 2)
    {
      id v12 = [(TSWPStorage *)self smartFieldAtCharIndex:location attributeKind:6 effectiveRange:&v17];
      id v10 = 0;
      if (!v12 || (void)v17 != location) {
        return v10;
      }
    }
    else
    {
      if (a5 == 1)
      {
        if (!location) {
          goto LABEL_4;
        }
        id v10 = [(TSWPStorage *)self smartFieldAtCharIndex:location - 1 attributeKind:6 effectiveRange:&v17];
        if (!v10) {
          return v10;
        }
        if (*((void *)&v17 + 1) + (void)v17 != location) {
          goto LABEL_4;
        }
        uint64_t v13 = self;
        NSUInteger v14 = location - 1;
        goto LABEL_31;
      }
      if (a5) {
        goto LABEL_4;
      }
      if (!location)
      {
        id v10 = [(TSWPStorage *)self length];
        if (v10)
        {
          if ([(TSWPStorage *)self smartFieldAtCharIndex:0 attributeKind:6 effectiveRange:&v17])
          {
            goto LABEL_40;
          }
          id v10 = [(TSWPStorage *)self footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:0];
          if (v10) {
            goto LABEL_40;
          }
        }
        return v10;
      }
      if (![(TSWPStorage *)self smartFieldAtCharIndex:location - 1 attributeKind:6 effectiveRange:&v17]|| *((void *)&v17 + 1) + (void)v17 != location)
      {
        id v10 = [(TSWPStorage *)self footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:location - 1];
        if (v10 && location >= 2)
        {
          id v10 = [(TSWPStorage *)self pFindValidInsertionCharStyleFromCharIndex:location - 2];
          if (v10) {
            return v10;
          }
        }
        else if (!v10)
        {
          return v10;
        }
      }
      if (location >= [(TSWPStorage *)self length]) {
        goto LABEL_40;
      }
      unint64_t v15 = [(TSWPStorage *)self smartFieldAtCharIndex:location attributeKind:6 effectiveRange:&v17];
      if (v15 | (unint64_t)[(TSWPStorage *)self footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:location])goto LABEL_40; {
    }
      }
    uint64_t v13 = self;
    NSUInteger v14 = location;
LABEL_31:
    id v10 = [(TSWPStorage *)v13 characterStyleAtCharIndex:v14 effectiveRange:0];
    if (v10) {
      return v10;
    }
    goto LABEL_40;
  }
  if (a5)
  {
LABEL_4:
    id v10 = 0;
    return v10;
  }
  if ((-[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location, 6, &v17)&& (void)v17 == location&& [(id)objc_opt_class() defaultFieldStyleIdentifier]|| (id v10 = -[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", location)) != 0)&& (!location|| (id v10 = -[TSWPStorage pFindValidInsertionCharStyleFromCharIndex:](self, "pFindValidInsertionCharStyleFromCharIndex:", location - 1)) == 0))
  {
LABEL_40:
    id v10 = (id)[MEMORY[0x263EFF9D0] null];
  }
  return v10;
}

- (void)pApplyOverrideObjectAfterReplacingCharactersInSelection:(id)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v11 = [a3 range];

  -[TSWPStorage pApplyOverrideObjectAfterReplacingCharactersInRange:withString:overrideObject:undoTransaction:](self, "pApplyOverrideObjectAfterReplacingCharactersInRange:withString:overrideObject:undoTransaction:", v11, v10, a4, a5, a6);
}

- (void)pApplyOverrideObjectAfterReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger location = a3.location;
  uint64_t v10 = objc_msgSend(a4, "length", a3.location, a3.length);
  if (a5)
  {
    uint64_t v11 = v10;
    if ((id)[MEMORY[0x263EFF9D0] null] == a5) {
      id v12 = 0;
    }
    else {
      id v12 = a5;
    }
    -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", v12, location, v11, a6);
  }
}

- (BOOL)isInInit
{
  return self->_isInInit;
}

- (id)footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:(unint64_t)a3
{
  v5 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (!v5
    || (BOOL v6 = v5, !v5->var2)
    || (unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3), v7 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v8 = v7, TSWPAttributeArray::charIndexForAttributeIndex(v6, v7) != a3)
    || (id result = (id)*((void *)v6->var4 + 2 * v8 + 1)) == 0)
  {
    if ([(TSWPStorage *)self wpKind] != 2) {
      return 0;
    }
    id result = [(TSWPStorage *)self attributeArrayForKind:4];
    if (!result) {
      return result;
    }
    uint64_t v10 = (TSWPAttributeArray *)result;
    if (*((void *)result + 2)
      && (unint64_t v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v11 != 0x7FFFFFFFFFFFFFFFLL)
      && (unint64_t v12 = v11, TSWPAttributeArray::charIndexForAttributeIndex(v10, v11) == a3))
    {
      uint64_t v13 = (void *)*((void *)v10->var4 + 2 * v12 + 1);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v13;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setCharacterStyle:(id)a3 range:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];
  if (a4)
  {
    a4->NSUInteger location = v6;
    a4->NSUInteger length = v7;
  }

  return [(TSWPStorage *)self listStyleAtCharIndex:v6 effectiveRange:0];
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(unint64_t)a3
{
  unsigned int v4 = [(TSWPStorage *)self writingDirectionForParagraphAtParIndex:a3];
  if (v4 >= 2)
  {
    if (v4 == -1)
    {
      int writingDirectionCache = self->_writingDirectionCache;
      if (writingDirectionCache == -1)
      {
        documentRoot = self->_documentRoot;
        unsigned int v4 = !documentRoot
          && (uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
              uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:]"], objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3326, @"_documentRoot should never be nil at this point"), (documentRoot = self->_documentRoot) == 0)|| -[TSKDocumentRoot isDirectionRightToLeft](documentRoot, "isDirectionRightToLeft");
        self->_int writingDirectionCache = v4;
      }
      else
      {
        LOBYTE(v4) = writingDirectionCache == 1;
      }
    }
    else
    {
      NSUInteger v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3343, @"Unknown writing direction.");
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (int)writingDirectionForParagraphAtParIndex:(unint64_t)a3
{
  uint64_t v4 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];

  return [(TSWPStorage *)self writingDirectionForParagraphAtCharIndex:v4];
}

- (int)writingDirectionForParagraphAtCharIndex:(unint64_t)a3
{
  int result = objc_msgSend(-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a3, 0), "intValueForProperty:", 44);
  if (result == -1)
  {
    NSUInteger v6 = [(TSWPStorage *)self attributeArrayForKind:18];
    if (!v6)
    {
      unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPStorage writingDirectionForParagraphAtCharIndex:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3383, @"writingDirectionForParagraphAtParIndex: no paragraph table.");
      return [(TSKDocumentRoot *)self->_documentRoot isDirectionRightToLeft];
    }
    uint64_t v7 = v6;
    if (!v6->var2) {
      return [(TSKDocumentRoot *)self->_documentRoot isDirectionRightToLeft];
    }
    unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage writingDirectionForParagraphAtCharIndex:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3387, @"writingDirectionForParagraphAtParIndex: no paragraph table.");
    }
    int result = *((_DWORD *)v7->var4 + 4 * v8 + 2);
    if (result == -1) {
      return [(TSKDocumentRoot *)self->_documentRoot isDirectionRightToLeft];
    }
  }
  return result;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v7 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (!v7)
  {
    unint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphStyleAtParIndex:effectiveRange:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3800, @"paragraphStyleAtParIndex: no paragraph table.");
  }
  if (a4)
  {
    a4->NSUInteger location = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];
    a4->NSUInteger length = v10;
  }
  if (v7 && v7->var2 > a3) {
    return (id)*((void *)v7->var4 + 2 * a3 + 1);
  }
  else {
    return 0;
  }
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v6 = [(TSWPStorage *)self paragraphIndexAtCharIndex:a3];

  return [(TSWPStorage *)self paragraphStyleAtParIndex:v6 effectiveRange:a4];
}

- (int)wpKind
{
  return self->_WPKind;
}

- (BOOL)allowsElementKind:(int)a3
{
  return ([(TSWPStorage *)self disallowedElementKinds] & a3) == 0;
}

- (unsigned)disallowedElementKinds
{
  uint64_t WPKind = self->_WPKind;
  unsigned int v3 = *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds | 0xF;
  if (WPKind != 5) {
    unsigned int v3 = *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds;
  }
  unsigned int v4 = v3 | 0x100040;
  if (WPKind) {
    return v4;
  }
  else {
    return *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds;
  }
}

- (BOOL)isWritingDirectionRightToLeftForListAtParIndex:(unint64_t)a3
{
  id v5 = [(TSWPStorage *)self listStyleAtParIndex:a3 effectiveRange:0];
  if (v5)
  {
    unint64_t v6 = v5;
    if ([v5 containsProperty:44])
    {
      int v7 = [v6 intValueForProperty:44];
      if (v7 != -1) {
        return v7 != 0;
      }
    }
  }
  unint64_t v9 = [(TSWPStorage *)self firstParIndexInListAtParIndex:a3];

  return [(TSWPStorage *)self isWritingDirectionRightToLeftForParagraphAtParIndex:v9];
}

- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:2];
  if (!v6) {
    return 0;
  }
  int v7 = v6;
  unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v9 = (void *)*((void *)v7->var4 + 2 * v8 + 1);
  if (a4)
  {
    a4->NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v7, v8);
    a4->NSUInteger length = v10;
  }
  return v9;
}

- (unint64_t)firstParIndexInListAtParIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (self) {
    [(TSWPStorage *)self paragraphEnumeratorAtParIndex:a3 styleProvider:0];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  unsigned int v4 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v11);
  uint64_t v5 = TSWPParagraphEnumerator::paragraphLevel(&v11);
  if (v4 && [v4 labelTypeForLevel:v5])
  {
    while (1)
    {
      BOOL isFirstParagraph = TSWPParagraphEnumerator::isFirstParagraph(&v11);
      if (!v3 || isFirstParagraph) {
        break;
      }
      TSWPParagraphEnumerator::operator--(&v11);
      unint64_t v8 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v11);
      uint64_t v9 = TSWPParagraphEnumerator::paragraphLevel(&v11);
      if (!v8 || ![v8 labelTypeForLevel:v9]) {
        break;
      }
      --v3;
    }
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v11);
  return v3;
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  uint64_t v4 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];

  return [(TSWPStorage *)self paragraphLevelAtCharIndex:v4];
}

- (unint64_t)paragraphLevelAtCharIndex:(unint64_t)a3
{
  uint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:1];
  if (!v4)
  {
    NSUInteger v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphLevelAtCharIndex:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4146, @"paragraphLevelAtCharIndex: no paragraph table.");
    return 0;
  }
  uint64_t v5 = v4;
  if (!v4->var2) {
    return 0;
  }
  unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphLevelAtCharIndex:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4151, @"paragraphFlagsAtCharIndex: no paragraph table.");
  }
  return *((unsigned __int16 *)v5->var4 + 8 * v6 + 4);
}

- (TSWPParagraphEnumerator)paragraphEnumeratorAtParIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  uint64_t v9 = [(TSWPStorage *)self paragraphCount];

  return (TSWPParagraphEnumerator *)TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)retstr, (uint64_t)self, (uint64_t)a5, a4, v9, 1);
}

- (unint64_t)attachmentCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:4];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4 passingTest:(id)a5
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__244;
  uint64_t v12 = __Block_byref_object_dispose__245;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__TSWPStorage_smartFieldsWithAttributeKind_intersectingRange_passingTest___block_invoke;
  v7[3] = &unk_2646B2EE0;
  v7[4] = a5;
  v7[5] = &v8;
  -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", *(void *)&a3, a4.location, a4.length, v7);
  uint64_t v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  return -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:passingTest:](self, "smartFieldsWithAttributeKind:intersectingRange:passingTest:", *(void *)&a3, a4.location, a4.length, 0);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  uint64_t v5 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:");
  if ((v5 - 4) < 0xC && ((0x907u >> (v5 - 4)) & 1) != 0
    || (int v6 = IsParagraphBreakingCharacter(v5)) != 0
    && ([(TSWPStorage *)self hasColumnStyleForParagraphBreakAtCharIndex:a3]|| (int v6 = [(TSWPStorage *)self hasSectionForParagraphBreakAtCharIndex:a3]) != 0))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return a3;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return a3;
}

- (void)setParagraphStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (id)string
{
  return self->_string;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  return a3;
}

- (void)p_attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  uint64_t v10 = 0;
  NSUInteger v11 = [(TSWPStorage *)self characterCount] - a3;
  NSUInteger v12 = a3;
  do
  {
    if (!a4[v10]) {
      goto LABEL_9;
    }
    uint64_t v13 = self->_attributesTable[v10];
    if (!v13) {
      goto LABEL_9;
    }
    var2 = (void *)v13->var2;
    if (!var2) {
      goto LABEL_10;
    }
    if ((*((unsigned int (**)(TSWPAttributeArray *))v13->var0 + 2))(v13))
    {
      TSWPAttributeArray::rangeForCharIndex(v13, a3);
      NSUInteger v12 = NSIntersectionRangeInclusive();
      NSUInteger v11 = v15;
      unint64_t v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, a3);
    }
    else
    {
      unint64_t v16 = TSWPAttributeArray::exactAttributeIndexForCharIndex(v13, a3);
      NSUInteger v12 = a3;
      NSUInteger v11 = 1;
    }
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      var2 = (void *)*((void *)v13->var4 + 2 * v16 + 1);
    }
    else {
LABEL_9:
    }
      var2 = 0;
LABEL_10:
    a5[v10++] = var2;
  }
  while (v10 != 19);
  a6->NSUInteger location = v12;
  a6->NSUInteger length = v11;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = *(void *)&a3;
  if (a3 > 0xC || ((1 << a3) & 0x10C0) == 0)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5384, @"Not a smart field attribute kind");
  }
  unint64_t v12 = [(TSWPStorage *)self length];
  if (self->_attributesTable[v8])
  {
    unint64_t v13 = v12;
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v20, self, location, length, v8);
    v19.NSUInteger location = 0;
    v19.NSUInteger length = 0;
    char v18 = 0;
    while (1)
    {
      uint64_t v14 = TSWPAttributeEnumerator::nextAttributeIndex(v20, &v19);
      if (!v14) {
        break;
      }
      uint64_t v15 = *(void *)(v14 + 8);
      if (v15)
      {
        v21.NSUInteger location = location;
        v21.NSUInteger length = length;
        if (NSIntersectionRange(v21, v19).length
          || !length && TSWPInsertionPointInRangeWithOptions(location, 0, v19.location, v19.length, 0))
        {
          (*((void (**)(id, uint64_t, NSUInteger, NSUInteger, char *))a5 + 2))(a5, v15, v19.location, v19.length, &v18);
          if ([(TSWPStorage *)self length] != v13)
          {
            unint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]"];
            objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5404, @"Storage was modified while enumerating attributes");
          }
          if (v18) {
            break;
          }
        }
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v20);
  }
}

- (unint64_t)storageLength
{
  return [(NSMutableString *)self->_string length];
}

- (id)textSourceForLayoutInRange:(_NSRange)a3
{
  unint64_t v3 = -[TSWPRubyTextSource initWithSource:subRange:]([TSWPRubyTextSource alloc], "initWithSource:subRange:", self, a3.location, a3.length);

  return v3;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v10 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  NSUInteger v35 = location;
  NSUInteger v11 = location + length;
  unint64_t v12 = [(TSWPStorage *)self paragraphIndexAtCharIndex:location + length];
  if (v12 > v10) {
    v12 -= v11 == [(TSWPStorage *)self textRangeForParagraphAtIndex:v12];
  }
  unint64_t v13 = (NSUInteger *)MEMORY[0x263F7C7C8];
  BOOL v34 = v6;
  if (v10 > v12)
  {
LABEL_4:
    uint64_t v14 = 0;
    unint64_t v15 = v35;
LABEL_5:
    if (v15 <= v11)
    {
      NSUInteger v32 = length;
      BOOL v33 = v5;
      unint64_t v16 = 0;
      NSUInteger v17 = v15;
      NSUInteger v18 = *v13;
      NSUInteger v19 = v13[1];
      while (1)
      {
        NSRange v36 = *(NSRange *)v13;
        uint64_t v20 = objc_msgSend(-[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", v17, &v36), "valueForProperty:", 39);
        if (v36.location >= v11) {
          break;
        }
        NSRange v21 = (__CFString *)v20;
        if (!v20 || v20 == [MEMORY[0x263EFF9D0] null]) {
          goto LABEL_43;
        }
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_43;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ![(__CFString *)v16 isEqualToString:v21])
          {
            goto LABEL_43;
          }
        }
        else
        {
          unint64_t v16 = v21;
        }
        NSRange v22 = v36;
        if (v36.length + v36.location <= v17) {
          ++v17;
        }
        else {
          NSUInteger v17 = v36.length + v36.location;
        }
        if (v18 != *v13 || v19 != v13[1])
        {
          v37.NSUInteger location = v18;
          v37.NSUInteger length = v19;
          NSRange v22 = NSUnionRange(v37, v22);
        }
        NSUInteger v18 = v22.location;
        NSUInteger v19 = v22.length;
        if (v17 > v11) {
          goto LABEL_38;
        }
      }
      v22.NSUInteger location = v18;
      v22.NSUInteger length = v19;
      if (!v16)
      {
LABEL_43:
        BOOL v5 = v33;
        NSUInteger length = v32;
        unint64_t v15 = v35;
        goto LABEL_44;
      }
LABEL_38:
      unint64_t v15 = v35;
      BOOL v5 = v33;
      NSUInteger length = v32;
      if (v22.location == v35 && v22.length == v32 || v22.location <= v35 && v22.location + v22.length >= v11) {
        uint64_t v14 = v16;
      }
    }
    goto LABEL_44;
  }
  uint64_t v14 = 0;
  do
  {
    uint64_t v24 = objc_msgSend(-[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", v10, 0), "valueForProperty:", 39);
    uint64_t v25 = v24;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![(__CFString *)v14 isEqualToString:v25])
      {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v14 = (__CFString *)v24;
    }
    ++v10;
  }
  while (v10 <= v12);
  unint64_t v15 = v35;
  if (!v14 || v14 == (__CFString *)[MEMORY[0x263EFF9D0] null]) {
    goto LABEL_5;
  }
LABEL_44:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[(__CFString *)v14 length] >= 2 && v14) {
    return v14;
  }
  if (length == v13[1] && v15 == *v13 || length == 0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    UniChar v28 = -[TSWPStorage bestCharacterLanguageForTextRange:](self, "bestCharacterLanguageForTextRange:", v15, length);
    uint64_t v14 = v28;
    if (v28) {
      goto LABEL_65;
    }
  }
  if (!v34 || ((uint64_t v14 = 0, length == v13[1]) ? (v29 = v15 == *v13) : (v29 = 0), v29 || !length))
  {
LABEL_65:
    if (v14) {
      return v14;
    }
    goto LABEL_66;
  }
  v38.NSUInteger location = v15;
  v38.NSUInteger length = length;
  uint64_t v30 = (__CFString *)CFStringTokenizerCopyBestStringLanguage((CFStringRef)self->_string, v38);
  if (v30)
  {
    uint64_t v14 = v30;
    goto LABEL_65;
  }
  uint64_t v14 = 0;
LABEL_66:
  if (v5) {
    return [(TSKDocumentRoot *)self->_documentRoot creationLanguage];
  }
  return v14;
}

- (id)languageAtParIndex:(unint64_t)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];
  uint64_t v10 = (__PAIR128__(v9, v8 + v9) - [(TSWPStorage *)self length]) >> 64;

  return -[TSWPStorage languageForTextRange:useStringTokenizer:useCreationLanguage:](self, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v8, v10, v6, v5);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSMutableString *)self->_string characterAtIndex:a3];
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  id result = [(TSWPStorage *)self attributeArrayForKind:5];
  if (result)
  {
    BOOL v5 = (TSWPAttributeArray *)result;
    if (*((void *)result + 2)
      && (unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL)
      && (unint64_t v7 = v6, TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3))
    {
      return (id)*((void *)v5->var4 + 2 * v7 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  BOOL v5 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v5
    || (unint64_t v6 = v5, !v5->var2)
    || (unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3), v7 == 0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t v8 = v7, TSWPAttributeArray::charIndexForAttributeIndex(v6, v7) != a3)
    || (id result = (id)*((void *)v6->var4 + 2 * v8 + 1)) == 0)
  {
    id result = [(TSWPStorage *)self attributeArrayForKind:5];
    if (result)
    {
      uint64_t v10 = (TSWPAttributeArray *)result;
      if (*((void *)result + 2)
        && (unint64_t v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
            v11 != 0x7FFFFFFFFFFFFFFFLL)
        && (unint64_t v12 = v11, TSWPAttributeArray::charIndexForAttributeIndex(v10, v11) == a3))
      {
        return (id)*((void *)v10->var4 + 2 * v12 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  id result = [(TSWPStorage *)self attributeArrayForKind:4];
  if (result)
  {
    BOOL v5 = (TSWPAttributeArray *)result;
    if (*((void *)result + 2)
      && (unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL)
      && (unint64_t v7 = v6, TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3))
    {
      return (id)*((void *)v5->var4 + 2 * v7 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 left:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  BOOL v6 = a4;
  unint64_t v7 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4203, @"charIndex has an uninitialized value");
  }
  unint64_t v11 = [(TSWPStorage *)self attributeArrayForKind:3];
  if (!v11 || (unint64_t v12 = v11, !v11->var2))
  {
    if (a5)
    {
      NSUInteger v15 = [(TSWPStorage *)self range];
      goto LABEL_13;
    }
    return 0;
  }
  if (v6)
  {
    if (!v7) {
      goto LABEL_9;
    }
    --v7;
  }
  unint64_t v13 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v11, v7);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v16 = (void *)*((void *)v12->var4 + 2 * v13 + 1);
    if (!a5) {
      return v16;
    }
    NSUInteger v15 = TSWPAttributeArray::rangeForAttributeIndex(v12, v13);
    goto LABEL_14;
  }
LABEL_9:
  if (!a5) {
    return 0;
  }
  NSUInteger v14 = TSWPAttributeArray::charIndexForAttributeIndex(v12, 0);
  NSUInteger v15 = 0;
LABEL_13:
  unint64_t v16 = 0;
LABEL_14:
  a5->NSUInteger location = v15;
  a5->NSUInteger length = v14;
  return v16;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(TSWPStorage *)self characterStyleAtCharIndex:a3 left:0 effectiveRange:a4];
}

- (_NSRange)attachmentIndexRangeForTextRange:(_NSRange)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x4012000000;
  unint64_t v12 = __Block_byref_object_copy__24;
  unint64_t v13 = __Block_byref_object_dispose__24;
  NSUInteger v14 = &unk_22389B221;
  long long v15 = xmmword_223837AD0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__TSWPStorage_attachmentIndexRangeForTextRange___block_invoke;
  v8[3] = &unk_2646B2EB8;
  v8[4] = &v9;
  -[TSWPStorage enumerateAttachmentsInTextRange:usingBlock:](self, "enumerateAttachmentsInTextRange:usingBlock:", a3.location, a3.length, v8);
  unint64_t v3 = v10;
  NSUInteger v4 = v10[6];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v4 = 0;
    v10[6] = 0;
  }
  NSUInteger v5 = v3[7];
  _Block_object_dispose(&v9, 8);
  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)enumerateAttachmentsOfClass:(Class)a3 inTextRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (v9)
  {
    v11[0] = 0;
    v11[1] = v11;
    void v11[2] = 0x2020000000;
    char v12 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__TSWPStorage_enumerateAttachmentsOfClass_inTextRange_usingBlock___block_invoke;
    v10[3] = &unk_2646B2E90;
    v10[7] = location;
    v10[8] = length;
    v10[4] = a3;
    v10[5] = a5;
    v10[6] = v11;
    TSWPAttributeArray::enumerateObjectAttributesInCharacterRange(v9, location, length, (uint64_t)v10);
    _Block_object_dispose(v11, 8);
  }
}

- (void)enumerateAttachmentsInTextRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = objc_opt_class();

  -[TSWPStorage enumerateAttachmentsOfClass:inTextRange:usingBlock:](self, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v8, location, length, a4);
}

uint64_t __66__TSWPStorage_enumerateAttachmentsOfClass_inTextRange_usingBlock___block_invoke(uint64_t a1, int a2, int a3, NSRange range2, unsigned char *a5)
{
  NSRange v8 = NSIntersectionRange(*(NSRange *)(a1 + 56), range2);
  uint64_t result = v8.location;
  if (v8.length)
  {
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
  return result;
}

uint64_t __48__TSWPStorage_attachmentIndexRangeForTextRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v3 + 48) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = 1;
    *(void *)(v3 + 48) = a3;
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 56) + 1;
  }
  *(void *)(v3 + 56) = v4;
  return result;
}

- (id)attachmentAtAttachmentIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4
{
  NSUInteger v6 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v6 || v6->var2 <= a3) {
    return 0;
  }
  NSUInteger v7 = (void *)*((void *)v6->var4 + 2 * a3 + 1);
  if (a4) {
    *a4 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3);
  }
  return v7;
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 4;
  }
  if (isKindOfClass) {
    uint64_t v10 = 14;
  }
  else {
    uint64_t v10 = 65532;
  }
  NSUInteger v11 = -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", v10, a3, v9, location, length, 0, 0, 0);
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)insertSpecialCharacter:(unsigned __int16)a3 object:(id)a4 kind:(unsigned int)a5 range:(_NSRange)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v11 = *(void *)&a5;
  unsigned __int16 v35 = a3;
  NSUInteger v13 = *MEMORY[0x263F7C7C8];
  uint64_t v34 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  if (((1 << a5) & 0x301) != 0) {
    NSUInteger v14 = a6.location + 1;
  }
  else {
    NSUInteger v14 = a6.location;
  }
  if (a5 <= 9) {
    NSUInteger v15 = v14;
  }
  else {
    NSUInteger v15 = a6.location;
  }
  unint64_t v16 = (void *)[[NSString alloc] initWithCharacters:&v35 length:1];
  [(TSWPStorage *)self replaceCharactersInSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length) withString:v16 withFlags:0 replaceTextData:0 changeSession:a9 undoTransaction:a8 outInsertedRange:0];

  NSUInteger v17 = [(TSWPStorage *)self attributeArrayForKind:v11 withCreate:1 undoTransaction:a8];
  if (v17)
  {
    NSUInteger v18 = v17;
    unint64_t v19 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v17, v15);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      TSWPAttributeArray::replaceObjectForAttributeIndex(v18, (objc_object *)a4, v19, (TSKAddedToDocumentContext *)a7, a8);
      uint64_t v29 = 1;
      NSUInteger v13 = location;
      goto LABEL_13;
    }
    uint64_t v20 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:]"];
    uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
    unint64_t v23 = @"insertSpecialCharacter: Bad attribute index.";
    uint64_t v24 = (void *)v20;
    uint64_t v25 = v21;
    uint64_t v26 = 236;
  }
  else
  {
    uint64_t v27 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v28 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:]"];
    uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
    unint64_t v23 = @"insertSpecialCharacter: Bad attribute array.";
    uint64_t v24 = (void *)v27;
    uint64_t v25 = v28;
    uint64_t v26 = 232;
  }
  [v24 handleFailureInFunction:v25 file:v22 lineNumber:v26 description:v23];
  uint64_t v29 = v34;
LABEL_13:
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, 1, 1 - length, 1);
  NSUInteger v30 = v13;
  NSUInteger v31 = v29;
  result.NSUInteger length = v31;
  result.NSUInteger location = v30;
  return result;
}

- (_NSRange)replaceCharactersInSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9
{
  uint64_t v9 = *(void *)&a5;
  id v11 = a3;
  if ((unint64_t)[a3 visualRangeCount] < 2)
  {
    if ([v11 isVisual])
    {
      uint64_t v21 = [v11 superRange];
      id v11 = (id)objc_msgSend(v11, "copyWithNewType:range:", 0, v21, v22);
    }
    NSUInteger v23 = [(TSWPStorage *)self p_replaceCharactersInLogicalSelection:v11 withString:a4 withFlags:v9 replaceTextData:a6 changeSession:a7 undoTransaction:a8 outInsertedRange:a9];
  }
  else
  {
    std::vector<CGPoint>::vector(&__p, [v11 visualRanges]);
    uint64_t v13 = [v11 superRange];
    uint64_t v15 = v14;
    NSUInteger v26 = v13;
    uint64_t v16 = [a4 length];
    uint64_t v25 = v16 + v15 - TSWPRangeVector::characterCount((TSWPRangeVector *)[v11 visualRanges]);
    uint64_t v17 = ((v31 - (unsigned char *)__p) >> 4) + 1;
    for (unint64_t i = (v31 - (unsigned char *)__p) & 0xFFFFFFFFFFFFFFF0; v17-- > 1; i -= 16)
    {
      uint64_t v20 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", *(void *)((char *)__p + i - 16), *(void *)((char *)__p + i - 8));
      [(TSWPStorage *)self p_replaceCharactersInLogicalSelection:v20 withString:a4 withFlags:v9 replaceTextData:a6 changeSession:a7 undoTransaction:a8 outInsertedRange:a9];

      a4 = &stru_26D688A48;
    }
    if (__p)
    {
      NSUInteger v31 = __p;
      operator delete(__p);
    }
    NSUInteger v24 = v25;
    NSUInteger v23 = v26;
  }
  result.NSUInteger length = v24;
  result.NSUInteger location = v23;
  return result;
}

- (void)applyObject:(id)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v12 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:1 undoTransaction:a6];
  if (v12)
  {
    uint64_t v13 = (TSWPParagraphAttributeArray *)v12;
    NSUInteger v14 = [(TSWPStorage *)self textRangeForParagraphAtIndex:location];
    NSUInteger v16 = v15;
    v23.NSUInteger location = [(TSWPStorage *)self textRangeForParagraphAtIndex:length + location - 1];
    v23.NSUInteger length = v17;
    v22.NSUInteger location = v14;
    v22.NSUInteger length = v16;
    NSRange v18 = NSUnionRange(v22, v23);
    unint64_t v19 = [(TSWPStorage *)self attributeArrayForKind:v7 withCreate:a3 != 0 undoTransaction:a6];
    if (v19)
    {
      uint64_t v20 = (TSWPParagraphAttributeArray *)v19;
      [(TSPObject *)self willModify];
      v24.NSUInteger location = location;
      v24.NSUInteger length = length;
      TSWPParagraphAttributeArray::applyObjectToParagraphRange(v20, (objc_object *)a3, v24, v13, a6);
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0);
    }
  }
}

- (id)relocateNonSelectedAnchorsInSelection:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  [(TSPObject *)self willModify];
  if (![a3 isRange]) {
    return a3;
  }
  memset(&__p, 0, sizeof(__p));
  if ([a3 isVisual])
  {
    uint64_t v7 = [a3 visualRanges];
    if (&__p != (TSWPRangeVector *)v7) {
      std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>((char *)&__p, *(char **)v7, *(void *)(v7 + 8), (uint64_t)(*(void *)(v7 + 8) - *(void *)v7) >> 4);
    }
  }
  if (![a3 visualRangeCount])
  {
    uint64_t v8 = 1;
LABEL_10:
    uint64_t v10 = 0;
    char v18 = 0;
    uint64_t v11 = v8;
    id v9 = a3;
    do
    {
      v20.uint64_t location = 0;
      v20.NSUInteger length = 0;
      if (v8 == 1)
      {
        uint64_t location = [a3 range];
        NSUInteger length = v13;
        v20.uint64_t location = location;
        v20.NSUInteger length = v13;
      }
      else
      {
        _NSRange v20 = *(_NSRange *)(*(void *)[a3 visualRanges] + v10);
        uint64_t location = v20.location;
        NSUInteger length = v20.length;
      }
      v19.uint64_t location = 0;
      v19.NSUInteger length = 0;
      v19.uint64_t location = -[TSWPStorage p_RelocateNonSelectedAnchorsInRange:selectionInfos:undoTransaction:](self, "p_RelocateNonSelectedAnchorsInRange:selectionInfos:undoTransaction:", location, length, [(id)TSUProtocolCast() infos], a4);
      v19.NSUInteger length = v15;
      if (v20.location != v19.location || v20.length != v15)
      {
        if ([a3 isVisual])
        {
          TSWPRangeVector::removeRange(&__p, &v20);
          TSWPRangeVector::addRange(&__p, &v19);
          char v18 = 1;
        }
        else
        {
          id v9 = (id)objc_msgSend(a3, "copyWithNewRange:", v19.location, v19.length);
        }
      }
      v10 += 16;
      --v11;
    }
    while (v11);
    if (v18) {
      id v9 = (id)[a3 copyWithNewVisualRanges:&__p];
    }
    goto LABEL_24;
  }
  uint64_t v8 = [a3 visualRangeCount];
  if (v8) {
    goto LABEL_10;
  }
  id v9 = a3;
LABEL_24:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  return v9;
}

- (void)insertObject:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8
{
  [(TSPObject *)self willModify];
  if (!a5)
  {
    NSUInteger v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 266, @"insertObject: Bad attribute array.");
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 267, @"insertObject: Bad attribute index.");
  }
  v21[0] = a4;
  v21[1] = a3;
  TSWPAttributeArray::insertAttribute(a5, (const TSWPAttributeRecord *)v21, a6, (TSKAddedToDocumentContext *)a7, a8);
  uint64_t v19 = TSWPAttributeArray::rangeForAttributeIndex(a5, a6);
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v19, v20, 0, 0);
}

- (void)insertParagraphData:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  [(TSPObject *)self willModify];
  if (!a5)
  {
    NSUInteger v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 283, @"insertParagraphData: Bad attribute array.");
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 284, @"insertParagraphData: Bad attribute index.");
  }
  unint64_t v19 = a4;
  unsigned int var0 = a3.var0.var0.var0;
  TSWPAttributeArray::insertAttribute(a5, (const TSWPAttributeRecord *)&v19, a6, 0, a7);
  uint64_t v17 = TSWPAttributeArray::rangeForAttributeIndex(a5, a6);
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v17, v18, 0, 0);
}

- (void)p_didChangeRange:(_NSRange)a3 delta:(int64_t)a4 broadcastKind:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  ++self->_changeCount;
  if (a4 || !self->_delayBroadcast)
  {
    [(TSPObject *)self willModify];
    broadcaster = self->_broadcaster;
    -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, location, length, a4, v5);
  }
  else
  {
    p_rangeToBroadcast = &self->_rangeToBroadcast;
    v12.NSUInteger location = self->_rangeToBroadcast.location;
    if (*(_OWORD *)&self->_rangeToBroadcast == 0)
    {
      p_rangeToBroadcast->NSUInteger location = a3.location;
      self->_rangeToBroadcast.NSUInteger length = a3.length;
    }
    else
    {
      v12.NSUInteger length = self->_rangeToBroadcast.length;
      NSRange v13 = NSUnionRange(v12, a3);
      p_rangeToBroadcast->NSUInteger location = v13.location;
      self->_rangeToBroadcast.NSUInteger length = v13.length;
    }
  }
}

- (void)applyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  uint64_t v8 = *(void *)&a5;
  [(TSWPStorage *)self lowLevelApplyObject:a3 toCharRange:a4.location forKind:a4.length dolcContext:*(void *)&a5 undoTransaction:a6];

  [(TSWPStorage *)self compressAttributeArrayKind:v8 undoTransaction:a7];
}

- (void)lowLevelApplyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  if (a5 <= 0x11 && ((1 << a5) & 0x3F0C8) != 0)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    NSRange v13 = [(TSWPStorage *)self attributeArrayForKind:*(void *)&a5 withCreate:a3 != 0 undoTransaction:a7];
    if (v13)
    {
      uint64_t v14 = v13;
      [(TSPObject *)self willModify];
      (*((void (**)(TSWPAttributeArray *, id, NSUInteger, NSUInteger, id, TSWPStorageTransaction *))v14->var0
       + 8))(v14, a3, location, length, a6, a7);
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, length, 0, 0);
    }
  }
  else
  {
    NSUInteger v15 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.location, a4.length);
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:]"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:309 description:@"applyObject:toCharRange: Bad attribute array."];
  }
}

- (BOOL)isDOLCSuppressed
{
  return self->_dolcSuppressed;
}

- (BOOL)hasTrackedChanges
{
  return [(TSWPStorage *)self insertionChangesTable]
      || [(TSWPStorage *)self deletionChangesTable] != 0;
}

- (TSWPChangeAttributeArray)insertionChangesTable
{
  return (TSWPChangeAttributeArray *)[(TSWPStorage *)self attributeArrayForKind:15];
}

- (TSWPChangeAttributeArray)deletionChangesTable
{
  return (TSWPChangeAttributeArray *)[(TSWPStorage *)self attributeArrayForKind:16];
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6
{
  return -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:](self, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", a3, a4, *(void *)&a6, a5, [a5 defaultParagraphStyle], objc_msgSend(a5, "defaultListStyle"), 0, 0);
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  objc_opt_class();
  [a3 documentObject];
  uint64_t v17 = (void *)TSUDynamicCast();
  if (v17) {
    BOOL v18 = [v17 writingDirection] == 2;
  }
  else {
    BOOL v18 = 0;
  }
  LODWORD(v20) = v18;
  return [(TSWPStorage *)self initWithContext:a3 string:a4 kind:v13 stylesheet:a6 paragraphStyle:a7 listStyle:a8 section:a9 columnStyle:a10 paragraphDirection:v20];
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10 paragraphDirection:(int)a11
{
  if (!a7)
  {
    NSRange v23 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4, *(void *)&a5, a6, 0, a8);
    uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:]"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 381, @"initWithString: Missing paragraph style.");

    return 0;
  }
  uint64_t v15 = *(void *)&a5;
  BOOL v18 = -[TSPObject initWithContext:](self, "initWithContext:");
  unint64_t v19 = v18;
  if (v18)
  {
    v18->_isInInit = 1;
    v18->_stylesheet = (TSSStylesheet *)a6;
    v19->_uint64_t WPKind = v15;
    v19->_int writingDirectionCache = -1;
    [(TSWPStorage *)v19 insertObject:a7 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:0 withCreate:1 undoTransaction:0] attributeIndex:0 dolcContext:0 undoTransaction:0];
    [(TSWPStorage *)v19 insertParagraphData:0 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:1 withCreate:1 undoTransaction:0] attributeIndex:0 undoTransaction:0];
    [(TSWPStorage *)v19 insertParagraphData:0 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:11 withCreate:1 undoTransaction:0] attributeIndex:0 undoTransaction:0];
    [(TSWPStorage *)v19 insertParagraphData:a11 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:18 withCreate:1 undoTransaction:0] attributeIndex:0 undoTransaction:0];
    if (v15 == 5) {
      [(TSWPStorage *)v19 insertParagraphData:a11 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:10 withCreate:1 undoTransaction:0] attributeIndex:0 undoTransaction:0];
    }
    if (a8)
    {
      uint64_t v20 = [(TSWPStorage *)v19 attributeArrayForKind:2 withCreate:1 undoTransaction:0];
      uint64_t v21 = v19;
      id v22 = a8;
    }
    else
    {
      if (v19->_WPKind != 5
        || [(TSWPStorage *)v19 attributeArrayForKind:2 withCreate:0 undoTransaction:0])
      {
        goto LABEL_11;
      }
      uint64_t v28 = [(TSWPStorage *)v19 attributeArrayForKind:2 withCreate:1 undoTransaction:0];
      id v22 = (id)objc_msgSend(-[TSWPStorage stylesheet](v19, "stylesheet"), "defaultListStyle");
      uint64_t v21 = v19;
      uint64_t v20 = v28;
    }
    [(TSWPStorage *)v21 insertObject:v22 charIndex:0 attributeArray:v20 attributeIndex:0 dolcContext:0 undoTransaction:0];
LABEL_11:
    if ([(TSWPStorage *)v19 supportsSections])
    {
      id v25 = a9;
      if (!a9) {
        id v25 = [(TSWPStorage *)v19 pDefaultSectionForContext:a3];
      }
      [(TSWPStorage *)v19 insertObject:v25 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:8 withCreate:1 undoTransaction:0] attributeIndex:0 dolcContext:0 undoTransaction:0];
    }
    if ([(TSWPStorage *)v19 supportsColumnStyles])
    {
      id v26 = a10;
      if (!a10) {
        id v26 = (id)[a6 defaultColumnStyle];
      }
      [(TSWPStorage *)v19 insertObject:v26 charIndex:0 attributeArray:[(TSWPStorage *)v19 attributeArrayForKind:9 withCreate:1 undoTransaction:0] attributeIndex:0 dolcContext:0 undoTransaction:0];
    }
    v19->_string = (NSMutableString *)objc_alloc_init((Class)[(id)objc_opt_class() pStringClassForWPKind:v15]);
    if (a4) {
      [(TSWPStorage *)v19 insertString:a4 atCharIndex:0 undoTransaction:0];
    }
    v19->_isInInit = 0;
  }
  return v19;
}

- (BOOL)supportsSections
{
  return self->_WPKind == 0;
}

- (BOOL)supportsColumnStyles
{
  return self->_WPKind == 0;
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger v5 = -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", a3.location, a3.length, a4, 1, a5);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (void)insertString:(id)a3 atCharIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

+ (Class)pStringClassForWPKind:(int)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)findCharIndexForAttachment:(id)a3
{
  uint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v5 = v4;
  unint64_t Object = TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
  if (Object == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return TSWPAttributeArray::charIndexForAttributeIndex(v5, Object);
}

- (BOOL)hasSmartFields
{
  uint64_t v4 = [(TSWPStorage *)self range];

  return -[TSWPStorage hasSmartFieldsInRange:](self, "hasSmartFieldsInRange:", v4, v3);
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  if (!self->_attributesTable[6]) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v9, self, a3.location, a3.length, 6);
  v8.NSUInteger location = 0;
  v8.NSUInteger length = 0;
  while (1)
  {
    uint64_t v5 = TSWPAttributeEnumerator::nextAttributeIndex(v9, &v8);
    BOOL v6 = v5 != 0;
    if (!v5) {
      break;
    }
    if (*(void *)(v5 + 8))
    {
      v10.NSUInteger location = location;
      v10.NSUInteger length = length;
      if (NSIntersectionRange(v8, v10).length) {
        break;
      }
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v9);
  return v6;
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  BOOL v6 = self->_attributesTable[a4];
  if (!v6)
  {
    if (a5)
    {
      NSUInteger v9 = [(TSWPStorage *)self range];
      goto LABEL_7;
    }
    return 0;
  }
  unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(self->_attributesTable[a4], a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      NSUInteger v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, 0);
      NSUInteger v9 = 0;
LABEL_7:
      NSRange v10 = 0;
LABEL_10:
      a5->NSUInteger location = v9;
      a5->NSUInteger length = v8;
      return v10;
    }
    return 0;
  }
  NSRange v10 = (void *)*((void *)v6->var4 + 2 * v7 + 1);
  if (a5)
  {
    NSUInteger v9 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
    goto LABEL_10;
  }
  return v10;
}

- (_NSRange)range
{
  NSUInteger v2 = [(NSMutableString *)self->_string length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (void)applyObject:(id)a3 toParagraphsInCharRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSRange v12 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (v12)
  {
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    unint64_t v14 = TSWPParagraphAttributeArray::paragraphRangeForCharRange((TSWPParagraphAttributeArray *)v12, v19);
    -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", a3, v14, v13, v7, a6);
  }
  else
  {
    uint64_t v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyObject:toParagraphsInCharRange:forKind:undoTransaction:]"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:470 description:@"No paragraph array."];
  }
}

+ (void)resetDisallowedElementKinds
{
  sDisallowElementKinds = xmmword_22383B130;
  unk_26AB71B00 = xmmword_22383B140;
}

- (TSDContainerInfo)parentInfo
{
  return self->_parentInfo;
}

+ (id)plainTextPasteStringForStorages:(id)a3 forcePlainText:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(a3);
        }
        if (![*(id *)(*((void *)&v23 + 1) + 8 * v8) canPasteAsPlainText]) {
          return 0;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id result = (id)[a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (!result) {
    return result;
  }
  id v10 = result;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v20;
  do
  {
    for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(a3);
      }
      unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v15 = [v14 range];
      uint64_t v17 = objc_msgSend(v14, "stringEquivalentFromRange:withLayoutParent:", v15, v16, 0);
      if (v17)
      {
        BOOL v18 = v17;
        if ([v17 length])
        {
          if (v11) {
            uint64_t v11 = (void *)[v11 stringByAppendingFormat:@"%c%@", 10, v18];
          }
          else {
            uint64_t v11 = v18;
          }
        }
      }
    }
    id v10 = (id)[a3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  }
  while (v10);
  if (!v11) {
    return 0;
  }
  if ([v11 length]) {
    return v11;
  }
  else {
    return 0;
  }
}

- (id)plainTextStringFromRange:(_NSRange)a3 convertTextualAttachments:(BOOL)a4 includeChildTextStorages:(BOOL)a5 forExport:(BOOL)a6 withLayoutParent:(id)a7
{
  BOOL v66 = a6;
  BOOL v63 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v70 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self, location, length, -[TSWPStorage deletedRangesInRange:](self, "deletedRangesInRange:", location, length));
  id v68 = (id)objc_msgSend(-[TSWPFilteredStorage string](v70, "string"), "mutableCopy");
  [v68 replaceBreaksWithPlainTextVersions];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  NSUInteger v65 = length;
  uint64_t v11 = -[TSWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", location, length);
  if (v12)
  {
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    uint64_t v15 = 0;
    unsigned int v16 = 1;
    do
    {
      uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
      id v17 = [(TSWPStorage *)self attachmentAtAttachmentIndex:v15 + v13 outCharIndex:&v71];
      if (v17)
      {
        id v18 = v17;
        if (!-[TSWPStorage hasDeletionInRange:](self, "hasDeletionInRange:", v71, 1))
        {
          id v19 = objc_alloc(NSNumber);
          long long v20 = (void *)[v19 initWithUnsignedInteger:v71];
          long long v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v18, v20, 0);
          [v10 addObject:v21];
        }
      }
      uint64_t v15 = v16;
      BOOL v22 = v14 > v16++;
    }
    while (v22);
  }
  uint64_t v23 = -[TSWPStorage footnoteRangeForTextRange:](self, "footnoteRangeForTextRange:", location, v65);
  if (v24)
  {
    uint64_t v25 = v23;
    unint64_t v26 = v24;
    uint64_t v27 = 0;
    unsigned int v28 = 1;
    do
    {
      uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
      id v29 = [(TSWPStorage *)self footnoteAtFootnoteIndex:v27 + v25 outCharIndex:&v71];
      if (v29)
      {
        id v30 = v29;
        if (!-[TSWPStorage hasDeletionInRange:](self, "hasDeletionInRange:", v71, 1))
        {
          id v31 = objc_alloc(NSNumber);
          NSUInteger v32 = (void *)[v31 initWithUnsignedInteger:v71];
          BOOL v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v30, v32, 0);
          [v10 addObject:v33];
        }
      }
      uint64_t v27 = v28;
      BOOL v22 = v26 > v28++;
    }
    while (v22);
  }
  [v10 sortUsingFunction:compareAttachments context:0];
  uint64_t v34 = [v10 count];
  if (v34)
  {
    unint64_t v35 = v34;
    uint64_t v36 = 0;
    int v37 = 0;
    for (unsigned int i = 0; i < v35; v36 = ++i)
    {
      v39 = (void *)[v10 objectAtIndexedSubscript:v36];
      v40 = (void *)[v39 objectAtIndexedSubscript:0];
      unint64_t v41 = -[TSWPFilteredStorage charIndexMappedFromStorage:](v70, "charIndexMappedFromStorage:", objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 1), "unsignedIntValue"))+ v37;
      if (v41 >= 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v44 = [NSString stringWithUTF8String:"-[TSWPStorage(TSWPStorage_conversion) plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:]"];
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion.mm"), 228, @"Bad charIndex");
      }
      else
      {
        if (!a4) {
          goto LABEL_32;
        }
        if (v40)
        {
          if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v42 = [v40 performSelector:sel_stringEquivalentWithLayoutParent_ withObject:a7];
            }
            else {
              uint64_t v42 = [v40 stringEquivalent];
            }
            if (v42) {
              unint64_t v45 = (__CFString *)v42;
            }
            else {
              unint64_t v45 = &stru_26D688A48;
            }
            int v46 = [(__CFString *)v45 length];
            objc_msgSend(v68, "replaceCharactersInRange:withString:", v41, 1, v45);
            int v37 = v37 + v46 - 1;
            continue;
          }
          if (v63)
          {
            if (v66 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              unint64_t v47 = (void *)[v40 textRepresentationForExport];
LABEL_37:
              v48 = v47;
              if (!v47) {
                goto LABEL_42;
              }
              uint64_t v49 = [v47 length];
              if (!v49) {
                goto LABEL_42;
              }
              unint64_t v50 = objc_msgSend(v48, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", 0, v49, 1, 1, v66, a7);
              if (!v50) {
                goto LABEL_42;
              }
              id v51 = v50;
              if (![v50 length]) {
                goto LABEL_42;
              }
              id v64 = v51;
              if (!v64) {
                goto LABEL_42;
              }
LABEL_52:
              if (v41) {
                goto LABEL_53;
              }
LABEL_55:
              int v58 = 0;
            }
            else
            {
              if (objc_opt_respondsToSelector())
              {
                unint64_t v47 = (void *)[v40 textRepresentationForCopy];
                goto LABEL_37;
              }
LABEL_42:
              if (objc_opt_respondsToSelector())
              {
                id v52 = objc_msgSend((id)objc_msgSend(v40, "textStorages"), "objectEnumerator");
                uint64_t v53 = [v52 nextObject];
                if (v53)
                {
                  uint64_t v54 = (void *)v53;
                  id v64 = 0;
                  do
                  {
                    uint64_t v55 = [v54 length];
                    if (v55)
                    {
                      uint64_t v56 = objc_msgSend(v54, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", 0, v55, 1, 1, v66, a7);
                      if (v56)
                      {
                        unint64_t v57 = v56;
                        if ([v56 length])
                        {
                          if (v64) {
                            [v64 appendFormat:@"\n%@", v57];
                          }
                          else {
                            id v64 = (id)[v57 mutableCopy];
                          }
                        }
                      }
                    }
                    uint64_t v54 = (void *)[v52 nextObject];
                  }
                  while (v54);
                  goto LABEL_52;
                }
              }
              id v64 = 0;
              if (!v41) {
                goto LABEL_55;
              }
LABEL_53:
              int v58 = IsParagraphBreakingCharacter([v68 characterAtIndex:v41 - 1]) ^ 1;
            }
            if (v64)
            {
              BOOL v59 = v58 == 0;
              _NSRange v60 = @"\n";
              if (v59) {
                _NSRange v60 = &stru_26D688A48;
              }
              v61 = (__CFString *)[NSString stringWithFormat:@"%@%@%@", v60, v64, &stru_26D688A48];
            }
            else
            {
              v61 = &stru_26D688A48;
            }
            objc_msgSend(v68, "replaceCharactersInRange:withString:", v41, 1, v61);
            int v37 = v37 + [(__CFString *)v61 length] - 1;

            continue;
          }
LABEL_32:
          objc_msgSend(v68, "deleteCharactersInRange:", v41, 1);
          --v37;
        }
      }
    }
  }

  return v68;
}

- (id)stringEquivalentFromRange:(_NSRange)a3 withLayoutParent:(id)a4
{
  return -[TSWPStorage plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:](self, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", a3.location, a3.length, 1, 1, 0, a4);
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return -[TSWPStorage stringEquivalentFromRange:withLayoutParent:](self, "stringEquivalentFromRange:withLayoutParent:", a3.location, a3.length, 0);
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4
{
  return -[TSWPStorage nsAttributedSubstringFromRange:scale:applyChanges:includeInlineDrawables:withLayoutParent:](self, "nsAttributedSubstringFromRange:scale:applyChanges:includeInlineDrawables:withLayoutParent:", a3.location, a3.length, 1, 0, 0, a4);
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4 applyChanges:(BOOL)a5 includeInlineDrawables:(BOOL)a6 withLayoutParent:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, [(TSPObject *)self context], 7);
  unint64_t v12 = v11;
  if (v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F7C7C8];
    long long v19 = *MEMORY[0x263F7C7C8];
    long long v20 = v19;
    uint64_t v14 = [v11 range];
    LOBYTE(v18) = 1;
    objc_msgSend(v12, "applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:", 1, v14, v15, *v13, v13[1], &v20, &v19, 0, v18);
  }
  unsigned int v16 = (void *)[v12 pNSAttributedStringWithDefaultDelegateIgnoreLists:1 stripTextualAttachments:0 stripGraphicalAttachments:1 stripInlineAttachments:!v8 attachmentChar:@" " scale:a7 withLayoutParent:a4];

  return v16;
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 delegate:(id)a4 scale:(double)a5 applyChanges:(BOOL)a6 includeInlineDrawables:(BOOL)a7 withLayoutParent:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, [(TSPObject *)self context], 7);
  uint64_t v14 = v13;
  if (v10)
  {
    uint64_t v15 = (void *)MEMORY[0x263F7C7C8];
    long long v21 = *MEMORY[0x263F7C7C8];
    long long v22 = v21;
    uint64_t v16 = [v13 range];
    LOBYTE(v20) = 1;
    objc_msgSend(v14, "applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:", 1, v16, v17, *v15, v15[1], &v22, &v21, 0, v20);
  }
  uint64_t v18 = (void *)[v14 pNSAttributedStringWithAttributeDelegate:a4 ignoreLists:1 stripTextualAttachments:0 stripGraphicalAttachments:1 stripInlineAttachments:!v9 attachmentChar:@" " scale:a5 withLayoutParent:a8];

  return v18;
}

- (id)nsAttributedSubstringWithAttachmentsRemovedFromRange:(_NSRange)a3 withLayoutParent:(id)a4
{
  id v5 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, [(TSPObject *)self context], 7);
  uint64_t v6 = (void *)[v5 pNSAttributedStringWithDefaultDelegateIgnoreLists:1 stripTextualAttachments:1 stripGraphicalAttachments:1 stripInlineAttachments:1 attachmentChar:&stru_26D688A48 scale:a4 withLayoutParent:1.0];

  return v6;
}

- (id)nsAttributedStringWithDefaultAttributeDelegateWithLayoutParent:(id)a3
{
  id v5 = objc_alloc_init(TSWPNSAttributedStringAttachmentConversionDelegate);
  id v6 = [(TSWPStorage *)self pNSAttributedStringWithAttributeDelegate:v5 ignoreLists:0 stripTextualAttachments:0 stripGraphicalAttachments:0 stripInlineAttachments:0 attachmentChar:0 scale:1.0 withLayoutParent:a3];

  return v6;
}

- (id)nsAttributedStringWithAttributeDelegate:(id)a3 withLayoutParent:(id)a4
{
  return [(TSWPStorage *)self pNSAttributedStringWithAttributeDelegate:a3 ignoreLists:0 stripTextualAttachments:0 stripGraphicalAttachments:0 stripInlineAttachments:0 attachmentChar:0 scale:1.0 withLayoutParent:a4];
}

- (id)nsAttributedStringWithLayoutParent:(id)a3
{
  return [(TSWPStorage *)self pNSAttributedStringWithAttributeDelegate:0 ignoreLists:0 stripTextualAttachments:0 stripGraphicalAttachments:0 stripInlineAttachments:0 attachmentChar:0 scale:1.0 withLayoutParent:a3];
}

- (id)nsAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 withLayoutParent:(id)a5
{
  return [(TSWPStorage *)self pNSAttributedStringWithAttributeDelegate:a3 ignoreLists:a4 stripTextualAttachments:0 stripGraphicalAttachments:0 stripInlineAttachments:0 attachmentChar:0 scale:1.0 withLayoutParent:a5];
}

- (TSWPParagraphAttributeArray)paragraphAttributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4
{
  return (TSWPParagraphAttributeArray *)[(TSWPStorage *)self attributeArrayForKind:*(void *)&a3 withCreate:a4 undoTransaction:0];
}

- (void)compress:(TSWPStorageTransaction *)a3
{
  uint64_t v5 = 0;
  do
  {
    [(TSWPStorage *)self compressAttributeArrayKind:v5 undoTransaction:a3];
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 19);
}

- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphIndexRange:(_NSRange)a5 forKind:(unsigned int)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  uint64_t v8 = *(void *)&a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v14 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:1 undoTransaction:a7];
  if (v14)
  {
    uint64_t v15 = v14;
    unsigned __int16 v46 = a3;
    NSUInteger v16 = [(TSWPStorage *)self textRangeForParagraphAtIndex:location];
    NSUInteger v18 = v17;
    unint64_t v19 = location + length;
    v52.NSUInteger location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:");
    v52.NSUInteger length = v20;
    v50.NSUInteger location = v16;
    v50.NSUInteger length = v18;
    NSRange v21 = NSUnionRange(v50, v52);
    NSUInteger v22 = v21.location;
    NSUInteger v23 = v21.length;
    unint64_t v24 = [(TSWPStorage *)self attributeArrayForKind:v8 withCreate:1 undoTransaction:a7];
    if (v24)
    {
      uint64_t v25 = (TSWPParagraphAttributeArray *)v24;
      [(TSPObject *)self willModify];
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v25->var0 + 4))(v25) & 1) == 0)
      {
        uint64_t v44 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v26 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]"];
        uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
        uint64_t v28 = v26;
        NSUInteger v23 = v21.length;
        [v44 handleFailureInFunction:v28 file:v27 lineNumber:366 description:@"Do not call this method unless table has paired data."];
      }
      if (a4 >= 0x10000)
      {
        unint64_t v45 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v41 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]"];
        uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
        uint64_t v43 = v41;
        NSUInteger v22 = v21.location;
        [v45 handleFailureInFunction:v43 file:v42 lineNumber:369 description:@"Out-of-bounds type assignment was clamped to max"];
        LOWORD(a4) = -1;
      }
      v48[0] = a4;
      v48[1] = v46;
      TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v25, v48, location, length, v15, a7);
      id v29 = [(TSWPStorage *)self listStyleAtParIndex:location + length - 1 effectiveRange:0];
      if ([v29 parent]) {
        id v29 = (id)[v29 parent];
      }
      id v30 = (void *)MEMORY[0x263F7C7C8];
      NSUInteger v31 = *MEMORY[0x263F7C7C8];
      NSUInteger v32 = *(void *)(MEMORY[0x263F7C7C8] + 8);
      unint64_t v33 = [(TSWPStorage *)self paragraphCount];
      if (v19 < v33)
      {
        unint64_t v34 = v33;
        do
        {
          id v35 = [(TSWPStorage *)self listStyleAtParIndex:v19 effectiveRange:v47];
          if (v35 != v29 && (id)[v35 parent] != v29) {
            break;
          }
          NSUInteger v31 = v47[0];
          NSUInteger v32 = v47[1];
          ++v19;
        }
        while (v19 < v34);
      }
      if (v31 != *v30 || v32 != v30[1])
      {
        v51.NSUInteger location = v22;
        v51.NSUInteger length = v23;
        v53.NSUInteger location = v31;
        v53.NSUInteger length = v32;
        NSRange v37 = NSUnionRange(v51, v53);
        NSUInteger v22 = v37.location;
        NSUInteger v23 = v37.length;
      }
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v22, v23, 0, 0);
    }
    else
    {
      CFRange v38 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v39 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]"];
      uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
      [v38 handleFailureInFunction:v39 file:v40 lineNumber:360 description:@"applyObject: Bad attribute array."];
    }
  }
}

- (void)applyDataValue:(unsigned int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v12 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:1 undoTransaction:a6];
  if (v12)
  {
    id v13 = v12;
    NSUInteger v14 = [(TSWPStorage *)self textRangeForParagraphAtIndex:location];
    NSUInteger v16 = v15;
    v29.NSUInteger location = [(TSWPStorage *)self textRangeForParagraphAtIndex:length + location - 1];
    v29.NSUInteger length = v17;
    v28.NSUInteger location = v14;
    v28.NSUInteger length = v16;
    NSRange v18 = NSUnionRange(v28, v29);
    unint64_t v19 = [(TSWPStorage *)self attributeArrayForKind:v7 withCreate:1 undoTransaction:a6];
    if (v19)
    {
      NSUInteger v20 = (TSWPParagraphAttributeArray *)v19;
      [(TSPObject *)self willModify];
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v20->var0 + 5))(v20) & 1) == 0)
      {
        uint64_t v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyDataValue:toParagraphIndexRange:forKind:undoTransaction:]"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 416, @"Do not call this method unless table has single data.");
      }
      unsigned int v26 = a3;
      if (TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v20, (unsigned __int16 *)&v26, location, length, v13, a6))-[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0); {
    }
      }
    else
    {
      NSUInteger v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyDataValue:toParagraphIndexRange:forKind:undoTransaction:]"];
      uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
      [v22 handleFailureInFunction:v23 file:v24 lineNumber:410 description:@"applyObject: Bad attribute array."];
    }
  }
}

- (void)applyWritingDirection:(int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v12 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:1 undoTransaction:a6];
  if (v12)
  {
    id v13 = v12;
    NSUInteger v14 = [(TSWPStorage *)self textRangeForParagraphAtIndex:location];
    NSUInteger v16 = v15;
    v29.NSUInteger location = [(TSWPStorage *)self textRangeForParagraphAtIndex:length + location - 1];
    v29.NSUInteger length = v17;
    v28.NSUInteger location = v14;
    v28.NSUInteger length = v16;
    NSRange v18 = NSUnionRange(v28, v29);
    unint64_t v19 = [(TSWPStorage *)self attributeArrayForKind:v7 withCreate:1 undoTransaction:a6];
    if (v19)
    {
      NSUInteger v20 = (TSWPParagraphAttributeArray *)v19;
      [(TSPObject *)self willModify];
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v20->var0 + 5))(v20) & 1) == 0)
      {
        uint64_t v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:]"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 450, @"Do not call this method unless table has single data.");
      }
      int v26 = a3;
      if (TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v20, (unsigned __int16 *)&v26, location, length, v13, a6))-[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0); {
    }
      }
    else
    {
      NSUInteger v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:]"];
      uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
      [v22 handleFailureInFunction:v23 file:v24 lineNumber:444 description:@"applyObject: Bad attribute array."];
    }
  }
}

- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphsInCharRange:(_NSRange)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = a3;
  unint64_t v12 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (v12)
  {
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    unint64_t v14 = TSWPParagraphAttributeArray::paragraphRangeForCharRange((TSWPParagraphAttributeArray *)v12, v19);
    -[TSWPStorage applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:](self, "applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:", v10, a4, v14, v13, 1, a6);
  }
  else
  {
    NSUInteger v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphsInCharRange:undoTransaction:]"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:481 description:@"No paragraph array."];
  }
}

- (_NSRange)replaceAllOccurrencesOfObject:(id)a3 withObject:(id)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7 = *(void *)&a5;
  if (!a4)
  {
    id v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) replaceAllOccurrencesOfObject:withObject:forKind:undoTransaction:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 495, @"replaceAllOccurrencesOfStyle: toReplace is nil.");
  }
  uint64_t v13 = [(TSWPStorage *)self attributeArrayForKind:v7 withCreate:0 undoTransaction:a6];
  if (!v13 || (unint64_t v14 = v13, (var2 = v13->var2) == 0))
  {
    NSUInteger length = 0;
LABEL_14:
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  NSUInteger length = 0;
  unint64_t v17 = 0;
  uint64_t v18 = 8;
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (*(id *)((char *)v14->var4 + v18) == a3)
    {
      TSWPAttributeArray::replaceObjectForAttributeIndex(v14, (objc_object *)a4, v17, 0, a6);
      v21.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v14, v17);
      v21.NSUInteger length = v20;
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v24.NSUInteger location = location;
        v24.NSUInteger length = length;
        NSRange v21 = NSUnionRange(v24, v21);
      }
      unint64_t var2 = v14->var2;
      NSUInteger length = v21.length;
      NSUInteger location = v21.location;
    }
    ++v17;
    v18 += 16;
  }
  while (v17 < var2);
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, length, 0, 0);
LABEL_15:
  NSUInteger v22 = location;
  NSUInteger v23 = length;
  result.NSUInteger length = v23;
  result.NSUInteger location = v22;
  return result;
}

- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 forSourceRange:(_NSRange)a4 toDestStorage:(id)a5 objectContext:(id)a6 dolcContext:(id)a7 flags:(int)a8
{
  NSUInteger range1 = a4.length;
  if (a3)
  {
    if (a4.length)
    {
      uint64_t var1 = a3->var1;
      if (var1 <= 0x12)
      {
        NSUInteger location = a4.location;
        if (((1 << var1) & 0x63BFF) != 0 || ((1 << var1) & 0x18000) != 0 && (a8 & 2) != 0)
        {
          unint64_t v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a3, a4.location);
          unint64_t v12 = v11 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v11;
          if (v12 < a3->var2)
          {
            uint64_t v13 = 0;
            unint64_t v37 = 0;
            unint64_t v41 = location + range1;
            uint64_t v14 = (16 * v12) | 8;
            while (1)
            {
              unint64_t v15 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v12);
              NSUInteger v16 = TSWPAttributeArray::rangeForAttributeIndex(a3, v12);
              NSUInteger v18 = v17;
              if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3)) {
                _NSRange v19 = *(objc_object **)((char *)a3->var4 + v14);
              }
              else {
                _NSRange v19 = 0;
              }
              switch((int)var1)
              {
                case 0:
                  if (v19)
                  {
                    uint64_t v27 = 0;
                    goto LABEL_55;
                  }
                  goto LABEL_68;
                case 1:
                case 11:
                case 18:
                  if (v15 > location
                    && v15 <= v41
                    && (v13
                     || (uint64_t v13 = (TSWPAttributeArray *)[a5 attributeArrayForKind:var1 withCreate:0 undoTransaction:0]) != 0))
                  {
                    int v25 = *(_DWORD *)((char *)a3->var4 + v14);
                    unint64_t v42 = v15 - location;
                    LODWORD(v43) = v25;
                    TSWPAttributeArray::insertAttribute(v13, (const TSWPAttributeRecord *)&v42, ++v37, 0, 0);
                  }
                  goto LABEL_68;
                case 2:
                case 9:
                  if (v19)
                  {
                    if (v15 > location
                      && v15 <= v41
                      && (v13
                       || (uint64_t v13 = (TSWPAttributeArray *)[a5 attributeArrayForKind:var1 withCreate:0 undoTransaction:0]) != 0))
                    {
                      unint64_t v26 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, v15 - location);
                      if (v26 < v13->var2 && TSWPAttributeArray::charIndexForAttributeIndex(v13, v26) >= v15 - location)
                      {
                        NSUInteger v31 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                        uint64_t v32 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:]"];
                        objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 659, @"Source and dest tables are out of order.");
                      }
                      else
                      {
                        unint64_t v42 = v15 - location;
                        uint64_t v43 = v19;
                        TSWPAttributeArray::insertAttribute(v13, (const TSWPAttributeRecord *)&v42, ++v37, (TSKAddedToDocumentContext *)a7, 0);
                      }
                    }
                  }
                  goto LABEL_68;
                case 3:
                case 6:
                case 7:
                case 12:
                case 13:
                case 15:
                case 16:
                case 17:
                  if (!v19) {
                    goto LABEL_68;
                  }
                  v44.NSUInteger location = location;
                  v44.NSUInteger length = range1;
                  v45.NSUInteger location = v16;
                  v45.NSUInteger length = v18;
                  NSRange v20 = NSIntersectionRange(v44, v45);
                  BOOL v21 = var1 == 17 && v20.length < v18;
                  uint64_t v22 = v21 ? *(void *)(MEMORY[0x263F7C7C8] + 8) : v20.length;
                  if (!v22) {
                    goto LABEL_68;
                  }
                  if (v21) {
                    NSUInteger v23 = *MEMORY[0x263F7C7C8];
                  }
                  else {
                    NSUInteger v23 = v20.location;
                  }
                  if ((a8 & 8) != 0)
                  {
                    if (var1 != 17)
                    {
                      NSRange v24 = 0;
                      goto LABEL_65;
                    }
                  }
                  else
                  {
                    NSRange v24 = 0;
                    if (var1 > 0x11 || ((1 << var1) & 0x210C0) == 0) {
                      goto LABEL_65;
                    }
                  }
                  _NSRange v19 = (objc_object *)[(objc_object *)v19 copyWithContext:a6];
                  NSRange v24 = v19;
LABEL_65:
                  objc_msgSend(a5, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v19, v23 - location, v22, var1, a7, 0);

LABEL_68:
                  ++v12;
                  unint64_t var2 = a3->var2;
                  if (v12 < var2)
                  {
                    if (TSWPAttributeArray::charIndexForAttributeIndex(a3, v12) > v41) {
                      return;
                    }
                    unint64_t var2 = a3->var2;
                  }
                  v14 += 16;
                  if (v12 >= var2) {
                    return;
                  }
                  break;
                case 4:
                case 5:
                  if (v19)
                  {
                    if (v15 >= location
                      && v15 < v41
                      && (v13
                       || (uint64_t v13 = (TSWPAttributeArray *)[a5 attributeArrayForKind:var1 withCreate:1 undoTransaction:0]) != 0)&& v37 < v13->var2)
                    {
                      if (a8)
                      {
                        unint64_t v33 = (objc_object *)[(objc_object *)v19 copyWithContext:a6];
                        TSWPAttributeArray::replaceObjectForAttributeIndex(v13, v33, v37, (TSKAddedToDocumentContext *)a7, 0);
                      }
                      else
                      {
                        TSWPAttributeArray::replaceObjectForAttributeIndexForShallowCopy(v13, v19, v37);
                      }
                      ++v37;
                    }
                  }
                  goto LABEL_68;
                case 8:
                  if ([a5 supportsSectionCopying] && v19)
                  {
                    uint64_t v27 = (objc_object *)[(objc_object *)v19 copyWithContext:a6];
                    _NSRange v19 = v27;
LABEL_55:
                    if (v15 > location
                      && v15 <= v41
                      && (v13
                       || (uint64_t v13 = (TSWPAttributeArray *)[a5 attributeArrayForKind:var1 withCreate:0 undoTransaction:0]) != 0))
                    {
                      unint64_t v28 = v37 + 1;
                      unint64_t v29 = v13->var2;
                      if (v37 + 1 >= v29)
                      {
                        id v35 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                        uint64_t v30 = [NSString stringWithUTF8String:"-[TSWPStorage(AttributeTables) transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:]"];
                        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 617, @"Bad par index count.");
                        unint64_t v29 = v13->var2;
                      }
                      if (v28 < v29)
                      {
                        TSWPAttributeArray::replaceObjectForAttributeIndex(v13, v19, v28, (TSKAddedToDocumentContext *)a7, 0);
                        ++v37;
                      }
                    }
                  }
                  goto LABEL_68;
                default:
                  goto LABEL_68;
              }
            }
          }
        }
      }
    }
  }
}

- (int)compareAttributeArray:(TSWPAttributeArray *)a3 range:(_NSRange)a4 otherStorage:(id)a5 otherRange:(_NSRange)a6
{
  if (!a3) {
    return -2;
  }
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a4.length;
  NSUInteger v9 = a4.location;
  uint64_t v12 = [a5 attributeArrayForKind:a3->var1 withCreate:0 undoTransaction:0];
  if (!v12) {
    return -2;
  }
  uint64_t v13 = (TSWPAttributeArray *)v12;
  unint64_t v14 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a3, v9);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v14;
  }
  unint64_t v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, location);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = v16;
  }
  unint64_t v18 = a3->var2 - v15;
  unint64_t v19 = v13->var2 - v17;
  BOOL v20 = v18 > v19;
  if (v18 <= v19) {
    BOOL v21 = a3;
  }
  else {
    BOOL v21 = v13;
  }
  if (v18 <= v19) {
    uint64_t v22 = v13;
  }
  else {
    uint64_t v22 = a3;
  }
  if (v18 <= v19) {
    NSUInteger v23 = length;
  }
  else {
    NSUInteger v23 = v8;
  }
  if (v18 <= v19) {
    NSUInteger v24 = location;
  }
  else {
    NSUInteger v24 = v9;
  }
  if (v18 <= v19) {
    unint64_t v25 = v15;
  }
  else {
    unint64_t v25 = v17;
  }
  if (v20)
  {
    unint64_t v17 = v15;
    NSUInteger v26 = location;
  }
  else
  {
    NSUInteger v26 = v9;
  }
  if (v20) {
    NSUInteger v27 = length;
  }
  else {
    NSUInteger v27 = v8;
  }
  return -[TSWPStorage compareAttributeArray1:array2:range1:range2:attributeIndex1:attributeIndex2:](self, "compareAttributeArray1:array2:range1:range2:attributeIndex1:attributeIndex2:", v21, v22, v26, v27, v24, v23, v25, v17);
}

- (int)compareAttributeArray1:(TSWPAttributeArray *)a3 array2:(TSWPAttributeArray *)a4 range1:(_NSRange)a5 range2:(_NSRange)a6 attributeIndex1:(unint64_t)a7 attributeIndex2:(unint64_t)a8
{
  int v8 = 0;
  if (a3 && a4)
  {
    unint64_t v11 = a7;
    if (a3->var2 > a7)
    {
      unint64_t v12 = a8;
      if (a4->var2 > a8)
      {
        int v8 = 0;
        NSUInteger v36 = a5.location + a5.length;
        unint64_t v13 = (16 * a7) | 8;
        for (unint64_t i = (16 * a8) | 8; ; i += 16)
        {
          unint64_t v15 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v11);
          if (v8 || v15 > v36) {
            return v8;
          }
          unint64_t v16 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v11);
          NSUInteger v17 = TSWPAttributeArray::rangeForAttributeIndex(a3, v11);
          NSUInteger v19 = v18;
          if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3)) {
            BOOL v20 = *(void **)((char *)a3->var4 + v13);
          }
          else {
            BOOL v20 = 0;
          }
          unint64_t var2 = a4->var2;
          if (v12 >= var2)
          {
            NSRange v35 = (NSRange)0x7FFFFFFFFFFFFFFFuLL;
          }
          else
          {
            v35.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(a4, v12);
            v35.NSUInteger length = v22;
            unint64_t var2 = a4->var2;
          }
          unint64_t v34 = v20;
          if (v12 < var2 && (*((unsigned int (**)(TSWPAttributeArray *))a4->var0 + 3))(a4))
          {
            v23.NSUInteger length = v19;
            NSUInteger v24 = *(void **)((char *)a4->var4 + i);
          }
          else
          {
            v23.NSUInteger length = v19;
            NSUInteger v24 = 0;
          }
          int v8 = 0;
          unsigned int var1 = a3->var1;
          if (var1 <= 0x12)
          {
            int v26 = 1 << var1;
            if ((v26 & 0x3078) != 0)
            {
              if (v16 < v36)
              {
                v23.NSUInteger location = v17;
                NSUInteger length = NSIntersectionRange(v23, a5).length;
                if (length != NSIntersectionRange(v35, a6).length
                  || v34 != v24 && (!v34 || !v24 || ([v34 isEqual:v24] & 1) == 0))
                {
                  goto LABEL_40;
                }
              }
              goto LABEL_34;
            }
            if ((v26 & 0x305) != 0)
            {
              if (v16 <= v36)
              {
                v23.NSUInteger location = v17;
                NSUInteger v27 = NSIntersectionRange(v23, a5).length;
                if (v27 != NSIntersectionRange(v35, a6).length) {
                  goto LABEL_40;
                }
                if (v34 != v24)
                {
                  int IsSame = [v34 isEqual:v24];
                  goto LABEL_37;
                }
              }
LABEL_34:
              int v8 = 0;
              goto LABEL_41;
            }
            if ((v26 & 0x40802) != 0)
            {
              if (v16 <= v36)
              {
                v23.NSUInteger location = v17;
                NSUInteger v30 = NSIntersectionRange(v23, a5).length;
                if (v30 == NSIntersectionRange(v35, a6).length)
                {
                  int v38 = *(_DWORD *)((char *)a3->var4 + v13);
                  int v37 = *(_DWORD *)((char *)a4->var4 + i);
                  int IsSame = TSWPParagraphAttributeArray::dataIsSame((uint64_t)a3, (unsigned __int16 *)&v38, (unsigned __int16 *)&v37);
LABEL_37:
                  if (IsSame) {
                    int v8 = 0;
                  }
                  else {
                    int v8 = -2;
                  }
                  goto LABEL_41;
                }
LABEL_40:
                int v8 = -2;
                goto LABEL_41;
              }
              goto LABEL_34;
            }
          }
LABEL_41:
          ++v11;
          ++v12;
          v13 += 16;
          if (v11 >= a3->var2) {
            return v8;
          }
        }
      }
    }
    return 0;
  }
  return v8;
}

- (id)pFindValidInsertionCharStyleFromCharIndex:(unint64_t)a3
{
  unint64_t v5 = -[TSWPStorage paragraphStartAtCharIndex:](self, "paragraphStartAtCharIndex:");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v6 = v5;
  while (1)
  {
    unint64_t v7 = [(TSWPStorage *)self smartFieldAtCharIndex:a3 attributeKind:6 effectiveRange:&v10];
    if (!(v7 | (unint64_t)[(TSWPStorage *)self footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:a3]))break; {
    unint64_t v8 = v10;
    }
    if (!v7) {
      unint64_t v8 = a3;
    }
    if (v8 > v6)
    {
      a3 = v8 - 1;
      if (v8 != 0x8000000000000000) {
        continue;
      }
    }
    return 0;
  }
  id result = [(TSWPStorage *)self characterStyleAtCharIndex:a3 effectiveRange:0];
  if (!result) {
    return (id)[MEMORY[0x263EFF9D0] null];
  }
  return result;
}

- (id)pNSAttributedStringWithDefaultDelegateIgnoreLists:(BOOL)a3 stripTextualAttachments:(BOOL)a4 stripGraphicalAttachments:(BOOL)a5 stripInlineAttachments:(BOOL)a6 attachmentChar:(id)a7 scale:(double)a8 withLayoutParent:(id)a9
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  BOOL v14 = a4;
  BOOL v15 = a3;
  NSUInteger v17 = objc_alloc_init(TSWPNSAttributedStringAttachmentConversionDelegate);
  id v18 = [(TSWPStorage *)self pNSAttributedStringWithAttributeDelegate:v17 ignoreLists:v15 stripTextualAttachments:v14 stripGraphicalAttachments:v13 stripInlineAttachments:v12 attachmentChar:a7 scale:a8 withLayoutParent:a9];

  return v18;
}

- (id)pNSAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 stripTextualAttachments:(BOOL)a5 stripGraphicalAttachments:(BOOL)a6 stripInlineAttachments:(BOOL)a7 attachmentChar:(id)a8 scale:(double)a9 withLayoutParent:(id)a10
{
  BOOL v56 = a5;
  BOOL v59 = a4;
  BOOL v14 = objc_msgSend(objc_alloc(MEMORY[0x263F089B8]), "initWithString:", -[TSWPStorage string](self, "string"));
  objc_msgSend((id)objc_msgSend(v14, "mutableString"), "replaceBreaksWithPlainTextVersions");
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    NSUInteger v15 = [(TSWPStorage *)self range];
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)&v61, self, v15, v16, 6);
    uint64_t v17 = *MEMORY[0x263F1C258];
    while (TSWPAttributeEnumerator::nextAttributeIndex((id *)&v61, &v60))
    {
      objc_opt_class();
      uint64_t v18 = TSUDynamicCast();
      if (v18)
      {
        uint64_t v19 = [a3 urlForHyperlinkField:v18];
        if (v19) {
          objc_msgSend(v14, "addAttribute:value:range:", v17, v19, v60.location, v60.length);
        }
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)&v61);
  }
  v60.NSUInteger location = 0;
  uint64_t v20 = [v14 length];
  if (v20)
  {
    unint64_t v21 = v20;
    NSUInteger v22 = 0;
    do
    {
      id v23 = [(TSWPStorage *)self pExportAttributes:v22 effectiveRange:&v61 stickyFont:&v60 scale:a9];
      if (v23) {
        objc_msgSend(v14, "addAttributes:range:", v23, v61, v62);
      }
      if (v22 == (char *)(v62 + v61)) {
        ++v22;
      }
      else {
        NSUInteger v22 = (char *)(v62 + v61);
      }
    }
    while ((unint64_t)v22 < v21);
  }
  unint64_t v24 = [(TSWPStorage *)self attachmentCount];
  id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v24 && !v59)
  {
    unint64_t v26 = [(TSWPStorage *)self length];
    NSUInteger v27 = self;
    unint64_t v28 = 0;
    unint64_t v29 = v14;
    uint64_t v30 = 0;
LABEL_68:
    -[TSWPStorage pMapListsFromStorageRange:toString:atStringLoc:textListMap:](v27, "pMapListsFromStorageRange:toString:atStringLoc:textListMap:", v28, v26, v29, v30, v58);
    goto LABEL_69;
  }
  if (v24)
  {
    id v54 = a3;
    BOOL v53 = a6;
    uint64_t v25 = 0;
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    unsigned int v33 = 1;
    while (1)
    {
      uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
      id v34 = [(TSWPStorage *)self attachmentAtAttachmentIndex:v25 outCharIndex:&v61];
      uint64_t v35 = v61;
      if (v61 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v37 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:]"];
        objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 118, @"Could not find an expected attachment");
        uint64_t v35 = v61;
      }
      if (!v59)
      {
        if (v32 <= v35 + 1) {
          unint64_t v38 = v35 + 1;
        }
        else {
          unint64_t v38 = v32;
        }
        if (v32 >= v35 + 1) {
          unint64_t v39 = v35 + 1;
        }
        else {
          unint64_t v39 = v32;
        }
        v31 += -[TSWPStorage pMapListsFromStorageRange:toString:atStringLoc:textListMap:](self, "pMapListsFromStorageRange:toString:atStringLoc:textListMap:", v39, v38 - v39, v14, v31 + v32, v58);
        uint64_t v35 = v61;
      }
      if (!v34)
      {
LABEL_55:
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31--, 1, &stru_26D688A48);
        goto LABEL_56;
      }
      objc_opt_class();
      uint64_t v40 = (void *)TSUDynamicCast();
      objc_opt_class();
      unint64_t v41 = (void *)TSUDynamicCast();
      if (v40)
      {
        if (!v56)
        {
          uint64_t v42 = [v40 stringEquivalentWithLayoutParent:a10];
          if (!v42) {
            goto LABEL_55;
          }
          uint64_t v43 = (void *)v42;
          objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31, 1, v42);
          uint64_t v44 = v31 + [v43 length];
LABEL_37:
          uint64_t v31 = v44 - 1;
          goto LABEL_56;
        }
      }
      else
      {
        NSRange v45 = v41;
        if (v41)
        {
          if ([v41 isAnchored] && !objc_msgSend(v45, "isHTMLWrap"))
          {
            if (!v53)
            {
LABEL_45:
              if (!v54
                || (objc_opt_respondsToSelector() & 1) == 0
                || [v45 isAnchored] && !objc_msgSend(v45, "isHTMLWrap"))
              {
                goto LABEL_55;
              }
              uint64_t v46 = [v54 attachmentStringForDrawableAttachment:v45];
              if (!v46) {
                goto LABEL_55;
              }
              unint64_t v47 = (void *)v46;
              objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v35 + v31, 1, v46);
              uint64_t v48 = [v47 length];
              if (!v59
                && [(TSWPStorage *)self paragraphHasListLabelAtCharIndex:v61]
                && v48 != 1)
              {
                TSULogErrorInFunction();
              }
              uint64_t v44 = v31 + v48;
              goto LABEL_37;
            }
          }
          else if (!a7)
          {
            goto LABEL_45;
          }
        }
      }
      if (![a8 length]) {
        goto LABEL_55;
      }
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31, 1, a8);
LABEL_56:
      unint64_t v32 = v35 + 1;
      uint64_t v25 = v33;
      if (v24 <= v33++) {
        goto LABEL_59;
      }
    }
  }
  unint64_t v32 = 0;
  uint64_t v31 = 0;
LABEL_59:
  if (v32 < [(TSWPStorage *)self length] && !v59)
  {
    unint64_t v50 = [(TSWPStorage *)self length];
    if (v32 <= v50) {
      unint64_t v51 = v50;
    }
    else {
      unint64_t v51 = v32;
    }
    if (v32 >= v50) {
      unint64_t v28 = v50;
    }
    else {
      unint64_t v28 = v32;
    }
    unint64_t v26 = v51 - v28;
    uint64_t v30 = v31 + v32;
    NSUInteger v27 = self;
    unint64_t v29 = v14;
    goto LABEL_68;
  }
LABEL_69:

  return v14;
}

- (id)pExportAttributes:(unint64_t)a3 effectiveRange:(_NSRange *)a4 stickyFont:(id *)a5 scale:(double)a6
{
  unint64_t v11 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  _NSRange v20 = (_NSRange)0;
  range2.NSUInteger location = 0;
  range2.NSUInteger length = 0;
  id v12 = [(TSWPStorage *)self paragraphStyleAtCharIndex:a3 effectiveRange:&v20];
  id v13 = [(TSWPStorage *)self characterStyleAtCharIndex:a3 effectiveRange:&range2];
  if (v12)
  {
    unint64_t v14 = [(TSWPStorage *)self paragraphIndexAtCharIndex:v20.location + v20.length - 1]
        + 1;
    if (v14 <= [(TSWPStorage *)self paragraphIndexAtCharIndex:[(TSWPStorage *)self length]])id v15 = [(TSWPStorage *)self paragraphStyleAtParIndex:v14 effectiveRange:0]; {
    else
    }
      id v15 = 0;
    objc_msgSend(v11, "addEntriesFromDictionary:", -[TSWPStorage pExportParagraphAttributes:nextParagraphStyle:scale:](self, "pExportParagraphAttributes:nextParagraphStyle:scale:", v12, v15, a6));
    +[TSWPPropertyConverter mapCharacterPropertiesFromStyle:v12 toNS:v11 stickyFont:a5 scale:a6];
  }
  +[TSWPPropertyConverter mapCharacterPropertiesFromStyle:v13 secondaryStyle:v12 toNS:v11 stickyFont:a5 scale:a6];
  uint64_t v16 = [v11 count];
  if (a4)
  {
    *a4 = v20;
    v17.NSUInteger length = range2.length;
    if (range2.length)
    {
      v17.NSUInteger location = range2.location;
      *a4 = NSIntersectionRange(*a4, v17);
    }
  }
  if (v16) {
    return v11;
  }
  else {
    return 0;
  }
}

- (int64_t)pMapListsFromStorageRange:(_NSRange)a3 toString:(id)a4 atStringLoc:(unint64_t)a5 textListMap:(id)a6
{
  if (!a3.length) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v54 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length) {
    return 0;
  }
  unint64_t v8 = a5;
  int64_t v53 = 0;
  uint64_t v50 = *MEMORY[0x263F1C268];
  NSUInteger v10 = a3.location;
  do
  {
    unint64_t v11 = [(TSWPStorage *)self paragraphIndexAtCharIndex:v10];
    v55.NSUInteger location = [(TSWPStorage *)self textRangeForParagraphAtIndex:v11];
    NSUInteger v12 = v55.location;
    NSUInteger v13 = v55.length;
    v56.NSUInteger location = location;
    v56.NSUInteger length = length;
    NSIntersectionRange(v55, v56);
    id v14 = [(TSWPStorage *)self paragraphStyleAtParIndex:v11 effectiveRange:0];
    id v15 = [(TSWPStorage *)self listStyleAtParIndex:v11 effectiveRange:0];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = [(TSWPStorage *)self paragraphLevelAtParIndex:v11];
      if ([v16 effectiveTypeForLevel:v17])
      {
        NSUInteger v18 = v12 - location;
        if (v12 < location) {
          NSUInteger v18 = 0;
        }
        unint64_t v19 = v53 + v8 + v18;
        if (v19 < [a4 length])
        {
          uint64_t v20 = [a4 attribute:v50 atIndex:v19 effectiveRange:0];
          if (v20)
          {
            unint64_t v21 = (void *)v20;
            uint64_t v22 = objc_msgSend((id)objc_msgSend(a4, "string"), "paragraphRangeForRange:", v19, 1);
            uint64_t v48 = v23;
            uint64_t v49 = v22;
            unint64_t v24 = (void *)[v21 mutableCopy];
            [v16 labelIndentForLevel:v17];
            double v26 = v25;
            objc_msgSend(-[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self, "valueForProperty:atCharIndex:effectiveRange:", 17, v10, 0), "tsu_CGFloatValue");
            objc_msgSend(v16, "textIndentForLevel:fontSize:", v17);
            double v28 = v27;
            [v24 headIndent];
            [v24 setHeadIndent:v26 + v28 + v29];
            if (v26 == 0.0) {
              double v26 = 1.0;
            }
            uint64_t v30 = objc_msgSend((id)objc_msgSend(v24, "tabStops"), "mutableCopy");
            objc_msgSend((id)objc_msgSend(v14, "valueForProperty:", 80), "tsu_CGFloatValue");
            double v32 = v26 + v31;
            double v33 = v28 + v32;
            unint64_t v8 = a5;
            if ([v30 count])
            {
              uint64_t v34 = 0;
              uint64_t v35 = 0;
              uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", v34), "location");
                if (v37 > v33) {
                  break;
                }
                ++v35;
                if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v36 = 0;
                }
                uint64_t v34 = v35;
                if ([v30 count] <= (unint64_t)v35) {
                  goto LABEL_21;
                }
              }
              if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_22;
              }
LABEL_21:
              objc_msgSend(v30, "removeObjectsInRange:", v36, v35);
            }
LABEL_22:
            id v38 = objc_alloc(MEMORY[0x263F1C388]);
            uint64_t v39 = MEMORY[0x263EFFA78];
            uint64_t v40 = (void *)[v38 initWithTextAlignment:0 location:MEMORY[0x263EFFA78] options:v33];
            [v30 insertObject:v40 atIndex:0];

            unint64_t v41 = (void *)[objc_alloc(MEMORY[0x263F1C388]) initWithTextAlignment:0 location:v39 options:v32];
            [v30 insertObject:v41 atIndex:0];

            [v24 setTabStops:v30];
            objc_msgSend(a4, "addAttribute:value:range:", v50, v24, v49, v48);
            uint64_t v42 = [a4 labelMarkerStringAtIndex:v49];
            uint64_t v43 = (void *)[NSString stringWithFormat:@"\t%@\t", v42];
            uint64_t v44 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v24, v50, 0);
            NSRange v45 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v43 attributes:v44];
            [a4 insertAttributedString:v45 atIndex:v49];
            v53 += [v43 length];
          }
          else
          {
            unint64_t v8 = a5;
          }
        }
        NSUInteger location = a3.location;
        NSUInteger length = a3.length;
      }
    }
    NSUInteger v10 = v12 + v13;
  }
  while (v12 + v13 < v54);
  return v53;
}

- (id)pExportParagraphAttributes:(id)a3 nextParagraphStyle:(id)a4 scale:(double)a5
{
  unint64_t v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  id v9 = objc_alloc_init(MEMORY[0x263F1C350]);
  NSUInteger v10 = (void *)[a3 valueForProperty:85];
  [v10 amount];
  double v12 = v11 * a5;
  switch([v10 mode])
  {
    case 0u:
      [v9 setLineHeightMultiple:v12];
      break;
    case 1u:
      [v9 setMinimumLineHeight:v12];
      break;
    case 2u:
      [v9 setMinimumLineHeight:v12];
      goto LABEL_5;
    case 3u:
LABEL_5:
      [v9 setMaximumLineHeight:v12];
      break;
    default:
      break;
  }
  [a3 floatValueForProperty:88];
  double v14 = v13;
  if (a4)
  {
    [a4 floatValueForProperty:87];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
  }
  double v17 = v16 * a5;
  if (v14 * a5 >= v17) {
    double v17 = v14 * a5;
  }
  [v9 setParagraphSpacing:v17];
  objc_msgSend(v9, "setAlignment:", (int)objc_msgSend(a3, "intValueForProperty:", 86));
  [a3 floatValueForProperty:80];
  [v9 setFirstLineHeadIndent:v18 * a5];
  [a3 floatValueForProperty:81];
  [v9 setHeadIndent:v19 * a5];
  [a3 floatValueForProperty:82];
  double v21 = v20 * a5;
  if (v21 > 0.0 && v21 < 468.0) {
    [v9 setTailIndent:468.0 - v21];
  }
  uint64_t v22 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:10];
  uint64_t v23 = (void *)[a3 valueForProperty:84];
  [a3 floatValueForProperty:83];
  [v9 setDefaultTabInterval:v24 * a5];
  if ([v23 count])
  {
    uint64_t v25 = 0;
    unsigned int v26 = 1;
    uint64_t v27 = MEMORY[0x263EFFA78];
    do
    {
      double v28 = (void *)[v23 tabAtIndex:v25];
      [v28 position];
      double v30 = v29 * a5;
      int v31 = [v28 alignment];
      if (v31 == 2) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = v31 == 1;
      }
      double v33 = (void *)[objc_alloc(MEMORY[0x263F1C388]) initWithTextAlignment:v32 location:v27 options:v30];
      [v22 addObject:v33];

      uint64_t v25 = v26;
    }
    while ([v23 count] > (unint64_t)v26++);
  }
  if ([v22 count]) {
    [v9 setTabStops:v22];
  }
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F1C268]];

  return v8;
}

- (id)pTextListsFromListStyle:(id)a3 atLevel:(unint64_t)a4 labelTypeMap:(id)a5
{
  if (a5)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pTextListsFromListStyle:atLevel:labelTypeMap:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 611, @"Expecting a non-nil labelTypeMap parameter");
    if (a3) {
      goto LABEL_3;
    }
  }
  double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pTextListsFromListStyle:atLevel:labelTypeMap:]"];
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 612, @"Expecting a non-nil listStyle parameter");
LABEL_3:
  unint64_t v7 = (void *)MEMORY[0x263EFF980];

  return (id)[v7 arrayWithCapacity:a4 + 1];
}

- (void)pMapAttributesFromAttributedString:(id)a3 ontoRange:(_NSRange)a4 asCharacterStylesOnly:(BOOL)a5
{
  NSUInteger location = a4.location;
  NSUInteger v7 = a4.location + a4.length;
  uint64_t v8 = [a3 length];
  id v9 = (uint64_t *)MEMORY[0x263F1C240];
  if (v8)
  {
    unint64_t v10 = v8;
    unint64_t v11 = 0;
    uint64_t v12 = *MEMORY[0x263F1C240];
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v11, &v41), "objectForKeyedSubscript:", v12);
      BOOL v14 = v13 != 0;
      if (v13) {
        break;
      }
      if (v42 + v41 <= v11 + 1) {
        ++v11;
      }
      else {
        unint64_t v11 = v42 + v41;
      }
    }
    while (v11 < v10);
  }
  else
  {
    BOOL v14 = 0;
  }
  if (location < v7)
  {
    uint64_t v35 = *v9;
    NSUInteger v15 = location;
    NSUInteger v32 = v7;
    do
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      id v16 = [(TSWPStorage *)self paragraphStyleAtCharIndex:v15 effectiveRange:&v39];
      NSUInteger v17 = v40 + v39;
      if (v7 < v40 + v39) {
        NSUInteger v17 = v7;
      }
      if (v15 <= v17) {
        NSUInteger v18 = v17;
      }
      else {
        NSUInteger v18 = v15;
      }
      if (v15 < v17) {
        NSUInteger v17 = v15;
      }
      NSUInteger v19 = v18 - v17;
      NSUInteger v20 = v17 - location;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      NSUInteger v34 = v18;
      if (!a5 && v17 == v39 && v19 == v40)
      {
        id v16 = -[TSWPStorage pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:](self, "pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:", a3, v17 - location, v18 - v17, v16);
        if (v16) {
          -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self, "setParagraphStyle:forCharRange:undoTransaction:", v16, v39, v40, 0);
        }
      }
      while (v19)
      {
        NSUInteger v22 = v20 + v19;
        if (v20 + v19 > [a3 length])
        {
          uint64_t v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pMapAttributesFromAttributedString:ontoRange:asCharacterStylesOnly:]"];
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 712, @"Remaining range extends outside attributed string");
        }
        uint64_t v25 = objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v20, &v37, v20, v19), "mutableCopy");
        unsigned int v26 = v25;
        if (v14 && ![v25 objectForKeyedSubscript:v35]) {
          objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "platformColor"), v35);
        }
        uint64_t v27 = objc_msgSend(+[TSWPPropertyConverter mapCharacterPropertiesFromNS:](TSWPPropertyConverter, "mapCharacterPropertiesFromNS:", v26), "mutableCopy");
        -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", [(TSSStylesheet *)self->_stylesheet variationOfCharacterStyle:[(TSWPStorage *)self characterStyleAtCharIndex:v37 + location effectiveRange:0] paragraphStyle:v16 propertyMap:v27], v37 + location, v38, 0);
        NSUInteger v28 = v38 + v37;
        if (v38 + v37 > v22)
        {
          double v29 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v30 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pMapAttributesFromAttributedString:ontoRange:asCharacterStylesOnly:]"];
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 746, @"Attribute range extends outside remaining range - expected attribute range to be clamped");
          NSUInteger v28 = v38 + v37;
        }
        if (v28 <= v22) {
          NSUInteger v31 = v22;
        }
        else {
          NSUInteger v31 = v28;
        }
        if (v28 >= v22) {
          NSUInteger v20 = v22;
        }
        else {
          NSUInteger v20 = v28;
        }
        NSUInteger v19 = v31 - v20;
      }
      NSUInteger v15 = v34;
      NSUInteger v7 = v32;
    }
    while (v34 < v32);
  }
}

- (id)pParagraphStyleWithFrequentAttributesInString:(id)a3 withinStringRange:(_NSRange)a4 currentParagraphStyle:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = a4.location + a4.length;
  if (a4.location + a4.length > [a3 length])
  {
    unint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 760, @"Range extends outside attributed string");
  }
  uint64_t v12 = (void *)[MEMORY[0x263EFF9C0] set];
  if (location < v9)
  {
    NSUInteger v13 = location;
    do
    {
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      objc_msgSend(v12, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v13, &v25), "allKeys"));
      NSUInteger v13 = v26 + v25;
    }
    while (v26 + v25 < v9);
  }
  BOOL v14 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  NSUInteger v15 = (void *)[v12 objectEnumerator];
  uint64_t v16 = [v15 nextObject];
  if (v16)
  {
    uint64_t v17 = v16;
    do
    {
      if (location < v9)
      {
        unint64_t v18 = 0;
        uint64_t v19 = 0;
        NSUInteger v20 = location;
        do
        {
          uint64_t v25 = 0;
          unint64_t v26 = 0;
          uint64_t v21 = objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", v17, v20, &v25, location, length);
          if (v26 > v18)
          {
            uint64_t v19 = v21;
            unint64_t v18 = v26;
          }
          NSUInteger v20 = v26 + v25;
        }
        while (v26 + v25 < v9);
        if (v19) {
          [v14 setObject:v19 forKeyedSubscript:v17];
        }
      }
      uint64_t v17 = [v15 nextObject];
    }
    while (v17);
  }
  id v22 = +[TSSPropertyMap propertyMap];
  objc_msgSend(v22, "addValuesFromPropertyMap:", +[TSWPPropertyConverter mapCharacterPropertiesFromNS:](TSWPPropertyConverter, "mapCharacterPropertiesFromNS:", v14));
  objc_msgSend(v22, "addValuesFromPropertyMap:", -[TSWPStorage pImportParagraphAttributes:paragraphStyle:](self, "pImportParagraphAttributes:paragraphStyle:", v14, 0));
  return [(TSSStylesheet *)self->_stylesheet variationOfStyle:a5 propertyMap:v22];
}

- (id)pImportParagraphAttributes:(id)a3 paragraphStyle:(id)a4
{
  uint64_t v4 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x263F1C268], a4);
  if (!v4) {
    return 0;
  }
  unint64_t v5 = (void *)v4;
  id v6 = +[TSSPropertyMap propertyMap];
  [v5 lineHeightMultiple];
  if (v7 <= 0.0)
  {
    [v5 minimumLineHeight];
    double v10 = v9;
    [v5 maximumLineHeight];
    if (v10 > 0.0)
    {
      double v13 = v12;
      BOOL v14 = [TSWPLineSpacing alloc];
      uint64_t v15 = v10 == v13 ? 2 : 1;
      uint64_t v11 = [(TSWPLineSpacing *)v14 initWithMode:v15 amount:v10];
      if (v11) {
        goto LABEL_12;
      }
    }
    uint64_t v8 = +[TSWPLineSpacing lineSpacing];
  }
  else
  {
    uint64_t v8 = [[TSWPLineSpacing alloc] initWithMode:0 amount:v7];
  }
  uint64_t v11 = v8;
LABEL_12:
  [v6 setObject:v11 forProperty:85];
  [v5 paragraphSpacingBefore];
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 87);
  [v5 paragraphSpacing];
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 88);
  objc_msgSend(v6, "setIntValue:forProperty:", objc_msgSend(v5, "baseWritingDirection") == 1, 44);
  uint64_t v16 = [v5 alignment];
  if (v16 >= 0x80000000)
  {
    NSUInteger v31 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pImportParagraphAttributes:paragraphStyle:]"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 890, @"Out-of-bounds type assignment was clamped to max");
  }
  else if (v16 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    double v33 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v16);
    uint64_t v34 = [NSString stringWithUTF8String:"-[TSWPStorage(conversion_private) pImportParagraphAttributes:paragraphStyle:]"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 890, @"Out-of-bounds type assignment was clamped to min");
  }
  objc_msgSend(v6, "setIntValue:forProperty:");
  [v5 firstLineHeadIndent];
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 80);
  [v5 headIndent];
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 81);
  [v5 tailIndent];
  double v18 = 468.0 - v17;
  if (468.0 - v17 <= 0.0 || v17 == 0.0) {
    double v20 = 0.0;
  }
  else {
    double v20 = 468.0 - v17;
  }
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 82, v20, v18);
  uint64_t v21 = (void *)[v5 tabStops];
  if ([v21 count])
  {
    id v22 = objc_alloc_init(TSWPTabs);
    if ([v21 count])
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v24 = (void *)[v21 objectAtIndexedSubscript:v23];
        uint64_t v25 = [v24 alignment];
        [v24 location];
        double v27 = v26;
        if (v25 == 2) {
          uint64_t v28 = 2;
        }
        else {
          uint64_t v28 = v25 == 1;
        }
        id v29 = +[TSWPTab tab];
        [v29 setPosition:v27];
        [v29 setAlignment:v28];
        [(TSWPTabs *)v22 insertTab:v29];
        ++v23;
      }
      while (v23 < [v21 count]);
    }
    [v6 setObject:v22 forProperty:84];
  }
  return v6;
}

- (id)pDrawableInfoFromImporter:(id)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__21;
  double v20 = __Block_byref_object_dispose__21;
  uint64_t v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  double v13 = __Block_byref_object_copy__21;
  BOOL v14 = __Block_byref_object_dispose__21;
  uint64_t v15 = 0;
  if (a3)
  {
    id v6 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__TSWPStorage_conversion_private__pDrawableInfoFromImporter_error___block_invoke;
    v9[3] = &unk_2646B2AE8;
    id v9[6] = &v16;
    v9[7] = &v10;
    v9[4] = a3;
    v9[5] = v6;
    [a3 importInfoWithCompletionHandler:v9];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
  }
  if (a4) {
    *a4 = (id)v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

intptr_t __67__TSWPStorage_conversion_private__pDrawableInfoFromImporter_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(a1 + 32) info];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "copy");
  NSUInteger v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 toAttributeArrayDest:(TSWPAttributeArray *)a4 atCharIndex:(unint64_t)a5 dolcContext:(id)a6 undoTransaction:(void *)a7
{
  if (a3 && a4)
  {
    unint64_t var2 = a3->var2;
    if (var2)
    {
      unint64_t v9 = a5;
      uint64_t v10 = self;
      unint64_t v47 = 0;
      unint64_t v11 = 0;
      unint64_t v42 = a5 - 1;
      uint64_t v12 = 8;
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        uint64_t v13 = TSWPAttributeArray::rangeForAttributeIndex(a3, v11);
        uint64_t v15 = v14;
        if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3)) {
          uint64_t v16 = *(objc_object **)((char *)a3->var4 + v12);
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t var1 = a3->var1;
        unint64_t v18 = v13 + v9;
        switch((int)var1)
        {
          case 0:
          case 8:
            unint64_t v25 = v49;
            if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v25 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a4, v9);
            }
            uint64_t v49 = v25;
            if (v11 || (unint64_t v26 = TSWPAttributeArray::charIndexForAttributeIndex(a4, v25), v25 = v49, v26 >= v9))
            {
              uint64_t v27 = v25 + v11;
              uint64_t v28 = a4;
              id v29 = v16;
              uint64_t v30 = 0;
              goto LABEL_52;
            }
            goto LABEL_53;
          case 1:
          case 2:
          case 9:
          case 11:
          case 18:
            if (!v15) {
              goto LABEL_53;
            }
            uint64_t v19 = v49;
            if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v19 = [(TSWPStorage *)v10 paragraphIndexAtCharIndex:v9];
            }
            uint64_t v49 = v19;
            uint64_t v20 = (uint64_t)v47;
            if (!v47) {
              uint64_t v20 = [(TSWPStorage *)v10 attributeArrayForKind:0];
            }
            unint64_t v47 = (TSWPAttributeArray *)v20;
            unint64_t v21 = [(TSWPStorage *)v10 paragraphIndexAtCharIndex:v18];
            uint64_t v22 = [(TSWPStorage *)v10 paragraphIndexAtCharIndex:v15 + v18 - 1];
            NSUInteger v23 = v22 - v21;
            NSUInteger v24 = v22 - v21 + 1;
            if (v11)
            {
              if (v22 - v21 == -1) {
                goto LABEL_49;
              }
            }
            else
            {
              BOOL v35 = TSWPAttributeArray::charIndexForAttributeIndex(v47, v21) < v9 && v24 != 0;
              if (v35) {
                NSUInteger v24 = v23;
              }
              if (!v24) {
                goto LABEL_49;
              }
              v21 += v35;
              if (TSWPAttributeArray::charIndexForAttributeIndex(v47, v21) < v9) {
                goto LABEL_49;
              }
            }
            unsigned int v36 = a3->var1;
            uint64_t v10 = self;
            if (v36 > 0x12 || ((1 << v36) & 0x40802) == 0)
            {
              if (!a4->var2)
              {
                uint64_t v41 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                uint64_t v37 = [NSString stringWithUTF8String:"-[TSWPStorage(TSWPStorage_copying) transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:]"];
                objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_copying.mm"), 100, @"This attribute table should not be empty. This storage was created incorrectly.");
              }
              v52.NSUInteger location = v21;
              v52.NSUInteger length = v24;
              TSWPParagraphAttributeArray::applyObjectToParagraphRange((TSWPParagraphAttributeArray *)a4, v16, v52, (TSWPParagraphAttributeArray *)v47, (TSWPStorageTransaction *)a7);
LABEL_49:
              uint64_t v10 = self;
              goto LABEL_53;
            }
            int v50 = *(_DWORD *)((char *)a3->var4 + v12);
            TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange((TSWPParagraphAttributeArray *)a4, (unsigned __int16 *)&v50, v21, v24, v47, (TSWPStorageTransaction *)a7);
LABEL_53:
            ++v11;
            v12 += 16;
            if (var2 == v11) {
              return;
            }
            break;
          case 3:
          case 6:
          case 7:
          case 12:
          case 13:
          case 17:
            if (v15) {
              goto LABEL_31;
            }
            goto LABEL_53;
          case 4:
          case 5:
            int64_t v31 = v49;
            if (v49 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v9
                && (int64_t v32 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a4, v42), v32 < 0x7FFFFFFFFFFFFFFELL))
              {
                int64_t v31 = v32 + 1;
              }
              else
              {
                int64_t v31 = 0;
              }
            }
            uint64_t v49 = v31;
            uint64_t v27 = v31 + v11;
            uint64_t v28 = a4;
            id v29 = v16;
            uint64_t v30 = (TSKAddedToDocumentContext *)a6;
LABEL_52:
            TSWPAttributeArray::replaceObjectForAttributeIndex(v28, v29, v27, v30, (TSWPStorageTransaction *)a7);
            goto LABEL_53;
          case 15:
          case 16:
            if (![a6 exportingFootnotes] || !v15) {
              goto LABEL_53;
            }
            uint64_t var1 = a3->var1;
LABEL_31:
            if (var1 != 17) {
              goto LABEL_34;
            }
            if ([(TSWPStorage *)v10 highlightsAllowed])
            {
              uint64_t var1 = a3->var1;
LABEL_34:
              unint64_t v33 = var2;
              uint64_t v34 = 0;
              if (var1 <= 0x11 && ((1 << var1) & 0x390C0) != 0)
              {
                uint64_t v10 = self;
                uint64_t v16 = (objc_object *)[(objc_object *)v16 copyWithContext:[(TSPObject *)self context]];
                uint64_t v34 = v16;
              }
              else
              {
                uint64_t v10 = self;
              }
              -[TSWPStorage lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:](v10, "lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:", v16, v18, v15, var1, a6, a7);

              unint64_t var2 = v33;
              unint64_t v9 = a5;
            }
            goto LABEL_53;
          default:
            goto LABEL_53;
        }
      }
    }
  }
  else
  {
    uint64_t v38 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v39 = [NSString stringWithUTF8String:"-[TSWPStorage(TSWPStorage_copying) transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:]"];
    uint64_t v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_copying.mm"];
    [v38 handleFailureInFunction:v39 file:v40 lineNumber:25 description:@"transferAttributeArraySource: bad tables."];
  }
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 undoTransaction:(void *)a7
{
  BOOL v9 = a5;
  uint64_t v12 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  uint64_t v13 = [(TSWPStorage *)self replaceCharactersInSelection:v12 withStorage:a4 usePasteRules:v9 dolcContext:a6 changeSession:0 undoTransaction:a7];
  NSUInteger v15 = v14;

  NSUInteger v16 = v13;
  NSUInteger v17 = v15;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)replaceCharactersInSelection:(id)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 changeSession:(id)a7 undoTransaction:(void *)a8
{
  BOOL v11 = a5;
  [(TSPObject *)self willModify];
  if (v11) {
    NSUInteger v15 = objc_alloc_init(TSWPStoragePasteRules);
  }
  else {
    NSUInteger v15 = 0;
  }
  id v16 = [(TSWPStorage *)self relocateNonSelectedAnchorsInSelection:a3 undoTransaction:a8];
  uint64_t v17 = [v16 range];
  -[TSWPStoragePasteRules willPasteStorage:intoDestStorage:atDestRange:](v15, "willPasteStorage:intoDestStorage:atDestRange:", a4, self, v17, v18);
  uint64_t v19 = [a4 string];
  unint64_t v20 = [(TSWPStorage *)self length];
  long long v33 = xmmword_223837AD0;
  uint64_t v21 = [(TSWPStorage *)self replaceCharactersInSelection:v16 withString:v19 withFlags:0 replaceTextData:0 changeSession:a7 undoTransaction:a8 outInsertedRange:&v33];
  NSUInteger v23 = v22;
  if (*((void *)&v33 + 1))
  {
    uint64_t v24 = 0;
    do
    {
      uint64_t v25 = [a4 attributeArrayForKind:v24];
      if (v25)
      {
        uint64_t v26 = v25;
        if (v24 == 9)
        {
          if ((unint64_t)[a4 columnStyleCount] < 2
            || ![(TSWPStorage *)self supportsColumnStyles])
          {
            goto LABEL_19;
          }
        }
        else if (v24 == 8)
        {
          if ((unint64_t)[a4 sectionCount] < 2
            || ![(TSWPStorage *)self supportsSections])
          {
            goto LABEL_19;
          }
        }
        else if (v24 == 2 {
               && (![(TSWPStorage *)self supportsListStyles]
        }
                || ![(TSWPStorage *)self listStyleCount]))
        {
          goto LABEL_19;
        }
        uint64_t v27 = [(TSWPStorage *)self attributeArrayForKind:v24 withCreate:1 undoTransaction:a8];
        [(TSWPStorage *)self transferAttributeArraySource:v26 toAttributeArrayDest:v27 atCharIndex:(void)v33 dolcContext:a6 undoTransaction:a8];
      }
LABEL_19:
      uint64_t v24 = (v24 + 1);
    }
    while (v24 != 19);
  }
  [(TSWPStorage *)self compress:a8];
  if (a8) {
    *(void *)&double v28 = TSWPStorageTransaction::compress((TSWPStorageTransaction *)a8).u64[0];
  }
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v21, v23, [(TSWPStorage *)self length] - v20, 1);
  self->_delayBroadcast = 1;
  self->_rangeToBroadcast.NSUInteger location = 0;
  self->_rangeToBroadcast.NSUInteger length = 0;
  [(TSWPStoragePasteRules *)v15 didPasteWithIOTransaction:a8 atDestRange:v33];

  NSUInteger location = self->_rangeToBroadcast.location;
  NSUInteger length = self->_rangeToBroadcast.length;
  self->_rangeToBroadcast.NSUInteger location = 0;
  self->_rangeToBroadcast.NSUInteger length = 0;
  self->_delayBroadcast = 0;
  if (location | length) {
    -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:");
  }
  NSUInteger v31 = v21;
  NSUInteger v32 = v23;
  result.NSUInteger length = v32;
  result.NSUInteger location = v31;
  return result;
}

- (_NSRange)textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:(unint64_t)a3
{
  uint64_t v4 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a3];
  NSUInteger v6 = v4;
  if (v5)
  {
    NSUInteger v7 = v5;
    uint64_t v8 = [(TSWPStorage *)self characterAtIndex:v5 + v4 - 1];
    int v9 = v8;
    unsigned int v10 = IsParagraphBreakingCharacter(v8);
    if (v9 == 8232) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    NSUInteger v5 = v7 - v11;
  }
  NSUInteger v12 = v6;
  result.NSUInteger length = v5;
  result.NSUInteger location = v12;
  return result;
}

- (id)pDefaultSectionForContext:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    return (id)[(TSWPStorage *)self defaultSectionForContext:a3];
  }
  else
  {
    NSUInteger v6 = [[TSWPSectionPlaceholder alloc] initWithContext:a3];
    return v6;
  }
}

- (void)p_fillMarkers:(void *)a3 startingAtCharIndex:(unint64_t)a4 forCount:(unint64_t)a5
{
  unint64_t v6 = a4;
  unint64_t v8 = *((void *)a3 + 2);
  unint64_t v42 = (char *)a3 + 16;
  int v9 = (unint64_t *)*((void *)a3 + 1);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = *(unint64_t **)a3;
    uint64_t v12 = ((uint64_t)v9 - *(void *)a3) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
LABEL_57:
    }
      abort();
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      id v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)v42, v15);
      uint64_t v11 = *(unint64_t **)a3;
      int v9 = (unint64_t *)*((void *)a3 + 1);
    }
    else
    {
      id v16 = 0;
    }
    uint64_t v17 = (unint64_t *)&v16[8 * v12];
    uint64_t v18 = &v16[8 * v15];
    unint64_t *v17 = v6;
    unsigned int v10 = v17 + 1;
    while (v9 != v11)
    {
      unint64_t v19 = *--v9;
      *--uint64_t v17 = v19;
    }
    *(void *)a3 = v17;
    *((void *)a3 + 1) = v10;
    *((void *)a3 + 2) = v18;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *int v9 = a4;
    unsigned int v10 = v9 + 1;
  }
  *((void *)a3 + 1) = v10;
  if (a5 > ((uint64_t)v10 - *(void *)a3) >> 3)
  {
    unint64_t v20 = [(NSMutableString *)self->_string length];
    uint64_t v21 = 0;
    do
    {
      if (v6 >= v20) {
        break;
      }
      if (!v21) {
        uint64_t v21 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
      }
      if (v20 >= v6 + 1024) {
        unint64_t v22 = v6 + 1024;
      }
      else {
        unint64_t v22 = v20;
      }
      uint64_t v23 = v22 - v6;
      v44.NSUInteger location = v6;
      v44.NSUInteger length = v22 - v6;
      CFStringGetCharacters((CFStringRef)self->_string, v44, v21);
      if ((uint64_t)(v22 - v6) >= 1)
      {
        uint64_t v24 = 0;
        unsigned int v25 = 0;
        unint64_t v26 = v6 + 1;
        do
        {
          while (!IsParagraphBreakingCharacter(v21[v24]))
          {
            uint64_t v24 = ++v25;
            if (v23 <= v25) {
              goto LABEL_51;
            }
          }
          unint64_t v27 = v26 + v24;
          id v29 = (unint64_t *)*((void *)a3 + 1);
          unint64_t v28 = *((void *)a3 + 2);
          if ((unint64_t)v29 >= v28)
          {
            NSUInteger v31 = *(unint64_t **)a3;
            uint64_t v32 = ((uint64_t)v29 - *(void *)a3) >> 3;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 61) {
              goto LABEL_57;
            }
            uint64_t v34 = v28 - (void)v31;
            if (v34 >> 2 > v33) {
              unint64_t v33 = v34 >> 2;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v33;
            }
            if (v35)
            {
              unsigned int v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)v42, v35);
              NSUInteger v31 = *(unint64_t **)a3;
              id v29 = (unint64_t *)*((void *)a3 + 1);
            }
            else
            {
              unsigned int v36 = 0;
            }
            uint64_t v37 = &v36[8 * v32];
            *(void *)uint64_t v37 = v27;
            uint64_t v30 = v37 + 8;
            while (v29 != v31)
            {
              uint64_t v38 = *--v29;
              *((void *)v37 - 1) = v38;
              v37 -= 8;
            }
            *(void *)a3 = v37;
            *((void *)a3 + 1) = v30;
            *((void *)a3 + 2) = &v36[8 * v35];
            if (v31) {
              operator delete(v31);
            }
          }
          else
          {
            *id v29 = v27;
            uint64_t v30 = v29 + 1;
          }
          *((void *)a3 + 1) = v30;
          uint64_t v39 = (uint64_t)v30 - *(void *)a3;
          uint64_t v24 = v25 + 1;
          BOOL v40 = a5 <= v39 >> 3 || v23 <= v24;
          ++v25;
        }
        while (!v40);
      }
LABEL_51:
      unint64_t v6 = v22;
    }
    while (a5 > (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
    if (v21)
    {
      free(v21);
    }
  }
}

+ (void)setDisallowedElementKinds:(unsigned int)a3 forStorageKind:(int)a4
{
  *((_DWORD *)&sDisallowElementKinds + a4) = a3;
}

+ (BOOL)allowsElementKind:(int)a3 forStorageKind:(int)a4
{
  return (*((_DWORD *)&sDisallowElementKinds + a4) & a3) == 0;
}

+ (id)filterText:(id)a3
{
  return (id)[a1 filterText:a3 removingAttachments:1];
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars;
  if (+[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars)
  {
    id v6 = a3;
    NSUInteger v7 = (void *)+[TSWPStorage filterText:removingAttachments:]::sFilteredStorageCharsWithAttachmentChar;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F089C0]);
    objc_msgSend(v8, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "controlCharacterSet"));
    id v6 = a3;
    objc_msgSend(v8, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "illegalCharacterSet"));
    objc_msgSend(v8, "removeCharactersInRange:", 10, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 11, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8233, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8232, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 13, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 9, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 173, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8203, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 65279, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8378, 1);
    objc_msgSend(v8, "addCharactersInRange:", 14, 1);
    objc_msgSend(v8, "addCharactersInRange:", 65533, 1);
    +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars = (uint64_t)v8;
    NSUInteger v7 = (void *)[v8 mutableCopy];
    objc_msgSend(v7, "addCharactersInRange:", 65532, 1);
    +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageCharsWithAttachmentChar = (uint64_t)v7;
    uint64_t v5 = +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars;
  }
  if (v4) {
    int v9 = v7;
  }
  else {
    int v9 = (void *)v5;
  }
  objc_opt_class();
  unsigned int v10 = (void *)TSUDynamicCast();
  id v29 = v10;
  if (v10)
  {
    uint64_t v11 = [v10 string];
  }
  else
  {
    objc_opt_class();
    uint64_t v11 = TSUDynamicCast();
  }
  uint64_t v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v13 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"+[TSWPStorage filterText:removingAttachments:]"];
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];
    id v16 = (void *)v13;
    id v6 = a3;
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 268, @"invalid nil value for '%s'", "theStr");
  }
  if ([v12 length])
  {
    uint64_t v17 = 0;
    char v18 = 0;
    do
    {
      uint64_t v19 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v9, 0, v17, objc_msgSend(v12, "length") - v17);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v20 == 0) {
        break;
      }
      uint64_t v17 = v19;
      uint64_t v22 = v20;
      uint64_t v23 = [v12 length];
      if ((v18 & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = (void *)[a3 mutableCopy];
          id v6 = v24;
          uint64_t v25 = [v24 mutableString];
        }
        else
        {
          uint64_t v25 = [MEMORY[0x263F089D8] stringWithString:v12];
          id v6 = (id)v25;
        }
        uint64_t v12 = (void *)v25;
      }
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v22, &stru_26D688A48);
      char v18 = 1;
    }
    while (v23 != v17 + v22);
  }
  if (v29 && (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v6, "string")) & 1) == 0)
  {
    unint64_t v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"+[TSWPStorage filterText:removingAttachments:]"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 305, @"Internal inconsistency in attributed string");
  }
  return v6;
}

+ (id)filterMarkAttributes:(id)a3
{
  return a3;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  self->_broadcaster = 0;
  do
  {
    BOOL v4 = self->_attributesTable[v3];
    if (v4) {
      (*((void (**)(TSWPAttributeArray *))v4->var0 + 1))(v4);
    }
    ++v3;
  }
  while (v3 != 19);

  v5.receiver = self;
  v5.super_class = (Class)TSWPStorage;
  [(TSWPStorage *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  broadcaster = self->_broadcaster;
  if (!broadcaster)
  {
    broadcaster = objc_alloc_init(TSWPStorageBroadcaster);
    self->_broadcaster = broadcaster;
  }

  [(TSWPStorageBroadcaster *)broadcaster addObserver:a3];
}

- (void)removeObserver:(id)a3
{
}

- (void)setDocumentRoot:(id)a3
{
  if (self->_documentRoot != a3) {
    [(TSPObject *)self willModify];
  }
  self->_documentRoot = (TSKDocumentRoot *)a3;
}

- (void)setWPKind:(int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  if (self->_WPKind != a3)
  {
    if (!a3)
    {
      NSUInteger v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPStorage setWPKind:undoTransaction:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1081, @"Can't set storage kind to kBody without a context and column style");
    }
    self->_uint64_t WPKind = a3;
    if (![(TSWPStorage *)self supportsColumnStyles])
    {
      int v9 = [(TSWPStorage *)self attributeArrayForKind:9 withCreate:0 undoTransaction:0];
      if (v9) {
        (*((void (**)(TSWPAttributeArray *, void, unint64_t, TSWPStorageTransaction *))v9->var0 + 7))(v9, 0, v9->var2, a4);
      }
    }
    if (![(TSWPStorage *)self supportsSections])
    {
      unsigned int v10 = [(TSWPStorage *)self attributeArrayForKind:8 withCreate:0 undoTransaction:0];
      if (v10) {
        (*((void (**)(TSWPAttributeArray *, void, unint64_t, TSWPStorageTransaction *))v10->var0 + 7))(v10, 0, v10->var2, a4);
      }
    }
    if (self->_WPKind == 5
      && ![(TSWPStorage *)self attributeArrayForKind:2 withCreate:0 undoTransaction:0])
    {
      -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](self, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", objc_msgSend(-[TSWPStorage stylesheet](self, "stylesheet"), "defaultListStyle"), 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 2, 1, 0), 0, 0, 0);
    }
    [(TSWPStorage *)self filterInvalidContentForStorage:self undoTransaction:a4];
  }
}

- (void)addDisallowedElementKind:(int)a3
{
  self->_disallowElementKinds |= a3;
}

- (void)removeDisallowedElementKind:(int)a3
{
  self->_disallowElementKinds &= ~a3;
}

- (void)filterSectionBreaksFromStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  if (([a3 supportsSectionCopying] & 1) == 0)
  {
    id v6 = [(TSWPStorage *)self attributeArrayForKind:8 withCreate:0 undoTransaction:0];
    if (v6) {
      (*((void (**)(TSWPAttributeArray *, void, unint64_t, TSWPStorageTransaction *))v6->var0 + 7))(v6, 0, v6->var2, a4);
    }
    if ([(NSMutableString *)self->_string length])
    {
      __int16 v12 = 4;
      NSUInteger v7 = (void *)[[NSString alloc] initWithCharacters:&v12 length:1];
      uint64_t v8 = [(NSMutableString *)self->_string rangeOfString:v7];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = v8;
        __int16 v11 = 5;
        unsigned int v10 = (void *)[[NSString alloc] initWithCharacters:&v11 length:1];
        -[NSMutableString replaceOccurrencesOfString:withString:options:range:](self->_string, "replaceOccurrencesOfString:withString:options:range:", v7, v10, 2, v9, [(NSMutableString *)self->_string length] - v9);
      }
    }
  }
}

- (void)filterInvalidContentForStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  -[TSWPStorage filterSectionBreaksFromStorage:undoTransaction:](self, "filterSectionBreaksFromStorage:undoTransaction:");
  if (([a3 allowsElementKind:1049087] & 1) == 0)
  {
    unint64_t v7 = [(TSWPStorage *)self attachmentCount];
    if (v7)
    {
      unint64_t v8 = v7 - 1;
      do
      {
        v29[0] = (id)0x7FFFFFFFFFFFFFFFLL;
        id v9 = [(TSWPStorage *)self attachmentAtAttachmentIndex:v8 outCharIndex:v29];
        if (v9)
        {
          if (v29[0] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            unsigned int v10 = v9;
            if (!objc_msgSend(a3, "allowsElementKind:", objc_msgSend(v9, "elementKind"))
              || [v10 isDrawable]
              && [v10 isAnchored]
              && [a3 wpKind])
            {
              char v11 = objc_opt_respondsToSelector();
              __int16 v12 = &stru_26D688A48;
              if (v11) {
                __int16 v12 = (__CFString *)[v10 stringEquivalent];
              }
              -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v29[0], 1, v12, 0, a4);
            }
          }
        }
        --v8;
      }
      while (v8 != -1);
    }
    unint64_t v13 = [(TSWPStorage *)self footnoteCount];
    if (v13)
    {
      unint64_t v14 = v13 - 1;
      do
      {
        v29[0] = (id)0x7FFFFFFFFFFFFFFFLL;
        id v15 = [(TSWPStorage *)self footnoteAtFootnoteIndex:v14 outCharIndex:v29];
        if (v15)
        {
          if (v29[0] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v16 = v15;
            if ((objc_msgSend(a3, "allowsElementKind:", objc_msgSend(v15, "elementKind")) & 1) == 0)
            {
              char v17 = objc_opt_respondsToSelector();
              char v18 = &stru_26D688A48;
              if (v17) {
                char v18 = (__CFString *)[v16 stringEquivalent];
              }
              -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v29[0], 1, v18, 0, a4);
            }
          }
        }
        --v14;
      }
      while (v14 != -1);
    }
  }
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v20 = dword_22383B158[i];
    if (self->_attributesTable[v20])
    {
      if (([a3 allowsElementKind:802304] & 1) == 0)
      {
        unint64_t v21 = [(TSWPStorage *)self length];
        if (v21)
        {
          unint64_t v22 = v21;
          NSUInteger v23 = 0;
          while (2)
          {
            TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v29, self, v23, v22 - v23, v20);
            v28.NSUInteger location = 0;
            v28.NSUInteger length = 0;
            do
            {
              uint64_t v24 = TSWPAttributeEnumerator::nextAttributeIndex(v29, &v28);
              if (!v24)
              {
                TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v29);
                goto LABEL_35;
              }
              uint64_t v25 = *(void *)(v24 + 8);
            }
            while (!v25
                 || (objc_msgSend(a3, "allowsElementKind:", objc_msgSend(*(id *)(v24 + 8), "elementKind")) & 1) != 0);
            -[TSWPStorage removeSmartField:fromRange:undoTransaction:](self, "removeSmartField:fromRange:undoTransaction:", v25, v28.location, v28.length, a4);
            NSUInteger location = v28.location;
            NSUInteger length = v28.length;
            unint64_t v22 = [(TSWPStorage *)self length];
            NSUInteger v23 = length + location;
            TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v29);
            if (v23 < v22) {
              continue;
            }
            break;
          }
        }
      }
    }
LABEL_35:
    ;
  }
}

- (BOOL)setDOLCSuppressed:(BOOL)a3
{
  BOOL dolcSuppressed = self->_dolcSuppressed;
  self->_BOOL dolcSuppressed = a3;
  return dolcSuppressed;
}

- (id)stringValue
{
  if (!self->_WPKind)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorage stringValue]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1362, @"performance warning: -[TSWPStorage stringValue] should not be called on body storage.");
  }
  objc_super v5 = NSString;
  string = self->_string;

  return (id)[v5 stringWithString:string];
}

- (unint64_t)wordCount
{
  v8.NSUInteger location = [(TSWPStorage *)self selectionRangeForCharIndex:0];
  v8.NSUInteger length = v3;
  CFStringTokenizerRef v4 = CFStringTokenizerCreate(0, (CFStringRef)self->_string, v8, 0, 0);
  if (!v4) {
    return 0;
  }
  objc_super v5 = v4;
  unint64_t v6 = -1;
  do
    ++v6;
  while (CFStringTokenizerAdvanceToNextToken(v5));
  CFRelease(v5);
  return v6;
}

- (id)childEnumeratorForRange:(_NSRange)a3
{
  CFIndex v3 = -[TSWPStorageChildEnumerator initWithStorage:range:]([TSWPStorageChildEnumerator alloc], "initWithStorage:range:", self, a3.location, a3.length);

  return v3;
}

- (unint64_t)previousCharacterIndex:(unint64_t)a3
{
  return [(TSWPStorage *)self previousCharacterIndex:a3 forDelete:0];
}

- (unint64_t)previousCharacterIndex:(unint64_t)location forDelete:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(TSWPStorage *)self characterCount];
  if (v7 >= location)
  {
    unint64_t v10 = location - 1;
    if (location - 1 < v7)
    {
      CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex((CFStringRef)self->_string, location - 1);
      NSUInteger location = RangeOfComposedCharactersAtIndex.location;
      BOOL v12 = RangeOfComposedCharactersAtIndex.length < 2 || !v4;
      if (!v12
        && isDeletableWithoutCombining([(NSMutableString *)self->_string characterAtIndex:v10]))
      {
        return v10;
      }
    }
  }
  else
  {
    CFRange v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPStorage previousCharacterIndex:forDelete:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1455, @"Character index is outside storage bounds");
  }
  return location;
}

- (unint64_t)nextCharacterIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if ([(TSWPStorage *)self characterCount] > a3)
  {
    CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex((CFStringRef)self->_string, v3);
    return RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
  }
  return v3;
}

- (unint64_t)indexForCharacter:(unsigned __int16)a3 startCharIndex:(unint64_t)a4
{
  int v5 = a3;
  unint64_t v7 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
  unint64_t v8 = [(TSWPStorage *)self characterCount];
  if (v8 > a4)
  {
    while (1)
    {
      unint64_t v9 = a4 + 1024;
      unint64_t v10 = v8 >= a4 + 1024 ? a4 + 1024 : v8;
      v14.NSUInteger location = a4;
      v14.NSUInteger length = v10 - a4;
      CFStringGetCharacters((CFStringRef)self->_string, v14, v7);
      char v11 = v7;
      if ((uint64_t)(v10 - a4) >= 1) {
        break;
      }
LABEL_8:
      a4 = v10;
      if (v8 <= v9) {
        goto LABEL_11;
      }
    }
    while (1)
    {
      int v12 = *v11++;
      if (v12 == v5) {
        break;
      }
      if (v10 == ++a4) {
        goto LABEL_8;
      }
    }
    unint64_t v8 = a4;
  }
LABEL_11:
  free(v7);
  return v8;
}

- (unint64_t)selectedParagraphBreakCount:(_NSRange)a3
{
  if (!a3.length) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:");
  if (v6 >= v6 + v7) {
    return 0;
  }
  unint64_t v8 = v6;
  uint64_t v9 = v7;
  unint64_t v10 = 0;
  do
  {
    uint64_t v11 = [(TSWPStorage *)self textRangeForParagraphAtIndex:v8];
    unint64_t v13 = v12 + v11 - 1;
    BOOL v15 = v13 >= location;
    NSUInteger v14 = v13 - location;
    BOOL v15 = !v15 || v14 >= length;
    if (!v15) {
      ++v10;
    }
    ++v8;
    --v9;
  }
  while (v9);
  return v10;
}

- (unint64_t)emptyParagraphCount:(_NSRange)a3
{
  if (!a3.length) {
    return 0;
  }
  unint64_t v4 = [(TSWPStorage *)self paragraphIndexRangeForCharRange:a3.location];
  if (v4 >= v4 + v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint64_t v7 = v5;
  unint64_t v8 = 0;
  do
  {
    uint64_t v9 = [(TSWPStorage *)self textRangeForParagraphAtIndex:v6];
    if (!v10
      || v10 == 1
      && IsParagraphBreakingCharacter([(TSWPStorage *)self characterAtIndex:v9]))
    {
      ++v8;
    }
    ++v6;
    --v7;
  }
  while (v7);
  return v8;
}

- (BOOL)isWholeParagraphsForRange:(_NSRange)a3 ignoreAttachmentCharacters:(BOOL)a4 requireParagraphBreakSelected:(BOOL)a5
{
  if (!a3.length) {
    return 0;
  }
  BOOL v6 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v10 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  NSUInteger v12 = v10;
  if (v6 && (uint64_t v13 = v11, v14 = v10 + v11, v10 < v10 + v11))
  {
    NSUInteger v15 = v10;
    while (IsSpecialCharacter([(TSWPStorage *)self characterAtIndex:v15]))
    {
      ++v15;
      if (!--v13)
      {
        NSUInteger v15 = v14;
        break;
      }
    }
  }
  else
  {
    NSUInteger v15 = v10;
  }
  BOOL result = 0;
  if (location >= v12 && location <= v15)
  {
    NSUInteger v17 = location + length;
    uint64_t v18 = [(TSWPStorage *)self textRangeForParagraphAtCharIndex:v17 - 1];
    if (v19)
    {
      uint64_t v20 = v18 + v19;
      uint64_t v21 = v18 + v19 - 1;
      char v22 = IsParagraphBreakingCharacter([(TSWPStorage *)self characterAtIndex:v21]);
      BOOL v23 = v22;
      if (v17 == v20)
      {
        BOOL result = !a5 | v22;
        if (result || a5) {
          return result;
        }
        return v17 == v21 && v23;
      }
      if (!a5) {
        return v17 == v21 && v23;
      }
    }
    else
    {
      uint64_t v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v25 = [NSString stringWithUTF8String:"-[TSWPStorage isWholeParagraphsForRange:ignoreAttachmentCharacters:requireParagraphBreakSelected:]"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1604, @"Paragraph should not be zero length");
    }
    return 0;
  }
  return result;
}

- (BOOL)isEmptyParagraphSelection:(id)a3 outRange:(_NSRange *)a4
{
  if (![a3 isInsertionPoint]) {
    return 0;
  }
  uint64_t v7 = [a3 range];
  if (self) {
    [(TSWPStorage *)self paragraphEnumeratorAtCharIndex:v7 styleProvider:0];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  uint64_t v9 = (void *)TSWPParagraphEnumerator::paragraphString(&v12);
  if (![v9 length]
    || [v9 length] == 1
    && IsParagraphBreakingCharacter([v9 characterAtIndex:0]))
  {
    if (a4)
    {
      a4->NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(&v12);
      a4->NSUInteger length = v10;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v12);
  return v8;
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  return -[NSMutableString isAllWhitespaceInRange:](self->_string, "isAllWhitespaceInRange:", a3.location, a3.length);
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3
{
  NSUInteger v3 = [(TSWPStorage *)self whiteSpaceRangeAtCharIndex:a3 includingBreaks:1];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  unint64_t v7 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  uint64_t v9 = v8;
  if ([(TSWPStorage *)self length] > a3
    && IsWhitespaceCharacter([(TSWPStorage *)self characterAtIndex:a3]))
  {
    unint64_t v10 = a3;
    if (v7 < a3)
    {
      unint64_t v10 = a3;
      while (1)
      {
        unint64_t v11 = v10 - 1;
        uint64_t v12 = [(TSWPStorage *)self characterAtIndex:v10 - 1];
        if (!IsWhitespaceCharacter(v12)) {
          break;
        }
        if (!a4)
        {
          char v13 = IsParagraphBreakingCharacter(v12);
          if v12 == 8232 || (v13) {
            break;
          }
        }
        --v10;
        if (v11 <= v7)
        {
          unint64_t v10 = v7;
          break;
        }
      }
    }
    unint64_t v14 = v7 + v9;
    if (v14 > a3)
    {
      while (1)
      {
        uint64_t v15 = [(TSWPStorage *)self characterAtIndex:a3];
        if (!IsWhitespaceCharacter(v15)) {
          break;
        }
        if (!a4)
        {
          char v16 = IsParagraphBreakingCharacter(v15);
          if v15 == 8232 || (v16) {
            break;
          }
        }
        if (v14 == ++a3)
        {
          a3 = v14;
          break;
        }
      }
    }
    NSUInteger v17 = a3 - v10;
  }
  else
  {
    NSUInteger v17 = 0;
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v18 = v10;
  result.NSUInteger length = v17;
  result.NSUInteger location = v18;
  return result;
}

- (_NSRange)rangeForSelectionWithInsertionSelection:(id)a3
{
  if (![a3 isValid] || (objc_msgSend(a3, "isInsertionPoint") & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage rangeForSelectionWithInsertionSelection:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1692, @"Invalid selection parameter passed in");
  }
  if ([a3 isValid] && objc_msgSend(a3, "start")) {
    uint64_t v7 = [a3 start] - 1;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([a3 isValid]) {
    uint64_t v8 = [a3 start];
  }
  else {
    uint64_t v8 = 0;
  }

  NSUInteger v9 = [(TSWPStorage *)self p_rangeForSelectionAtCharIndex:v7 caretIndex:v8 handleNextWordWhitespace:1];
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3
{
  NSUInteger v3 = -[TSWPStorage rangeByExtendingRangeToWhitespace:skipVisibleDeleted:](self, "rangeByExtendingRangeToWhitespace:skipVisibleDeleted:", a3.location, a3.length, 0);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3 skipVisibleDeleted:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (self) {
    -[TSWPStorage paragraphEnumeratorForCharRange:styleProvider:requireHidden:](self, "paragraphEnumeratorForCharRange:styleProvider:requireHidden:", a3.location, a3.length, 0, !a4);
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  uint64_t v7 = self;
  unint64_t v8 = -[TSWPStorage charRangeMappedFromStorage:](v7, "charRangeMappedFromStorage:", location, length);
  unint64_t v10 = TSWPRangeByExtendingRangeToWhitespaceForTextSource(v8, v9, v7);
  uint64_t v12 = -[TSWPStorage charRangeMappedToStorage:](v7, "charRangeMappedToStorage:", v10, v11);
  NSUInteger v14 = v13;

  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v17);
  NSUInteger v15 = v12;
  NSUInteger v16 = v14;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (_NSRange)rangeByExtendingRangeToLineBreak:(_NSRange)a3
{
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  unint64_t v6 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  uint64_t v8 = v7;
  do
  {
    NSUInteger v9 = location;
    if (location <= v6) {
      break;
    }
    --location;
    uint64_t v10 = [(NSMutableString *)self->_string characterAtIndex:v9 - 1];
    int v11 = v10;
    int v12 = IsParagraphBreakingCharacter(v10);
  }
  while (v11 != 8232 && v12 == 0);
  for (NSUInteger i = v6 + v8; v5 < i; ++v5)
  {
    uint64_t v15 = [(NSMutableString *)self->_string characterAtIndex:v5];
    int v16 = v15;
    char v17 = IsParagraphBreakingCharacter(v15);
    if (v16 == 8232) {
      break;
    }
    if (v17) {
      break;
    }
  }
  if (v9 <= v5) {
    NSUInteger v18 = v5;
  }
  else {
    NSUInteger v18 = v9;
  }
  if (v9 >= v5) {
    NSUInteger v19 = v5;
  }
  else {
    NSUInteger v19 = v9;
  }
  NSUInteger v20 = v18 - v19;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3
{
  uint64_t v5 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  unint64_t v7 = a3;
  if (v5 + v6 > a3)
  {
    unint64_t v7 = a3;
    if (IsWhitespaceCharacter([(TSWPStorage *)self characterAtIndex:a3]))
    {
      uint64_t v8 = [(TSWPStorage *)self whiteSpaceRangeAtCharIndex:a3];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v7 = a3;
      }
      else {
        unint64_t v7 = v8;
      }
    }
  }
  NSUInteger v9 = [(TSWPStorage *)self wordAtCharIndex:a3 includePreviousWord:1];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v9 = v7;
  }
  NSUInteger v10 = a3 - v9;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  BOOL v4 = a4;
  string = self->_string;
  uint64_t v8 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");

  NSUInteger v9 = -[NSMutableString rangeOfWordAtCharacterIndex:range:includePreviousWord:](string, "rangeOfWordAtCharacterIndex:range:includePreviousWord:", a3, v8, v7, v4);
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v7 = *MEMORY[0x263F7C7C8];
  NSUInteger v8 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  unint64_t v9 = [(TSWPStorage *)self range];
  CFIndex v11 = v10;
  string = self->_string;
  if (CFStringGetLength((CFStringRef)string) > a3
    && ((uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex((CFStringRef)string, a3), CharacterAtIndex)
      ? (BOOL v14 = v9 + v11 > a3)
      : (BOOL v14 = 0),
        v14))
  {
    int v15 = IsWhitespaceCharacter(CharacterAtIndex) ^ 1;
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    int v15 = 0;
    if (!v4) {
      goto LABEL_12;
    }
  }
  if (v9 < a3)
  {
    uint64_t v16 = CFStringGetCharacterAtIndex((CFStringRef)string, a3 - 1);
    int v17 = IsWhitespaceCharacter(v16);
    v15 |= v17 ^ 1;
    if (!v17) {
      --a3;
    }
  }
LABEL_12:
  if (v15)
  {
    if (v11)
    {
      v27.CFIndex location = v9;
      v27.CFIndex length = v11;
      NSUInteger v18 = CFStringTokenizerCreate(0, (CFStringRef)string, v27, 4uLL, 0);
      if (v18)
      {
        NSUInteger v19 = v18;
        if (CFStringTokenizerGoToTokenAtIndex(v18, a3))
        {
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v19);
          CFIndex length = CurrentTokenRange.length;
          CFIndex location = CurrentTokenRange.location;
        }
        else
        {
          CFIndex length = 0;
          CFIndex location = -1;
        }
        if (location != -1 && length != 0)
        {
          NSUInteger v7 = location;
          NSUInteger v8 = length;
        }
        CFRelease(v19);
      }
    }
  }
  NSUInteger v24 = v7;
  NSUInteger v25 = v8;
  result.CFIndex length = v25;
  result.CFIndex location = v24;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  NSUInteger v4 = [(TSWPStorage *)self p_rangeForSelectionAtCharIndex:a3 caretIndex:a4 handleNextWordWhitespace:1];
  result.CFIndex length = v5;
  result.CFIndex location = v4;
  return result;
}

- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v7 = a3;
  unint64_t v9 = a4 - 1;
  if (a3 != a4 && v9 != a3)
  {
    CFIndex v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1883, @"Precondition: caretIndex is either equal to the given charIndex or one past");
  }
  unint64_t v12 = [(TSWPStorage *)self selectionRangeForCharIndex:a4];
  unint64_t v14 = v12;
  uint64_t v15 = v13;
  if (v12 > v7) {
    unint64_t v7 = v12;
  }
  if (v13 - 1 < v7 - v12)
  {
    uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1893, @"Character index should be inside allowable selection range.");
  }
  unint64_t v18 = v14 + v15;
  if (v7 >= v14 + v15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = [(TSWPStorage *)self characterAtIndex:v7];
  }
  if (!IsSpecialCharacter(v19))
  {
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  id v20 = [(TSWPStorage *)self attachmentOrFootnoteAtCharIndex:v7];
  uint64_t v21 = (uint64_t)v20;
  if (!v20)
  {
LABEL_18:
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  if ([v20 isDrawable] && objc_msgSend((id)v21, "isAnchored"))
  {
    if (v18 <= a4) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = [(TSWPStorage *)self characterAtIndex:a4];
    }
    uint64_t v21 = 0;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v7 = a4;
  }
  else
  {
    uint64_t v21 = 1;
    uint64_t v22 = v7;
  }
LABEL_22:
  if (IsSpecialCharacter(v19)) {
    goto LABEL_45;
  }
  if (v5 && IsWhitespaceCharacter(v19))
  {
    if (v7 != a4 || !v7 || v7 <= v14)
    {
      if (v18 <= a4) {
        unint64_t v23 = v7;
      }
      else {
        unint64_t v23 = a4;
      }
      if (v7 + 1 == a4) {
        unint64_t v9 = v23;
      }
      else {
        unint64_t v9 = v7;
      }
    }
    uint64_t v24 = [(TSWPStorage *)self characterAtIndex:v9];
    int v25 = v24;
    if ((IsWhitespaceCharacter(v24) & 1) == 0 && !IsSpecialCharacter(v25)) {
      goto LABEL_38;
    }
    uint64_t v22 = [(TSWPStorage *)self whiteSpaceRangeAtCharIndex:v7 includingBreaks:0];
    uint64_t v21 = v26;
  }
  unint64_t v9 = v7;
LABEL_38:
  if (v22 == 0x7FFFFFFFFFFFFFFFLL || !v21)
  {
    uint64_t v27 = [(TSWPStorage *)self wordAtCharIndex:v9 includePreviousWord:0];
    uint64_t v21 = v28;
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 >= v18)
      {
        uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v22 = objc_msgSend(-[TSWPStorage string](self, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v9);
        uint64_t v21 = v29;
      }
    }
    else
    {
      uint64_t v22 = v27;
    }
  }
LABEL_45:
  NSUInteger v30 = v22;
  NSUInteger v31 = v21;
  result.CFIndex length = v31;
  result.CFIndex location = v30;
  return result;
}

- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v8 = *MEMORY[0x263F7C7C8];
  CFIndex length = *(void *)(MEMORY[0x263F7C7C8] + 8);
  uint64_t v9 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:");
  uint64_t v11 = v10;
  unint64_t v12 = [(TSWPStorage *)self selectionRangeForCharIndex:a3];
  uint64_t v14 = v13;
  CFIndex v15 = [(TSWPStorage *)self textRangeForParagraphAtCharIndex:a3];
  unint64_t v16 = v15;
  uint64_t v18 = v17;
  string = self->_string;
  if (v4)
  {
    v12 += v14;
    v35.CFIndex length = v12 - v15;
    v35.CFIndex location = v15;
    CFStringTokenizerRef v20 = CFStringTokenizerCreate(0, (CFStringRef)string, v35, 0, 0);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      do
      {
        unint64_t v23 = a3 + v22;
        CFStringTokenizerTokenType v24 = CFStringTokenizerGoToTokenAtIndex(v21, a3 + v22--);
      }
      while (!v24 && v23 > v16 && v12 == a3);
      uint64_t v25 = -v22;
      unint64_t v26 = a3 + v22;
      do
      {
        ++v26;
        --v25;
      }
      while (!CFStringTokenizerGoToTokenAtIndex(v21, v26) && v26 < v12);
      CFIndex location = CFStringTokenizerGetCurrentTokenRange(v21).location;
      if (v9 + v11 == location || v25 && location == v26 || CFStringTokenizerAdvanceToNextToken(v21))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
        if (CurrentTokenRange.location < 0)
        {
          CFIndex length = 0;
        }
        else
        {
          unint64_t v12 = CurrentTokenRange.location;
          CFIndex length = CurrentTokenRange.length;
        }
      }
      else
      {
LABEL_28:
        CFIndex length = 0;
      }
LABEL_30:
      CFRelease(v21);
      NSUInteger v8 = v12;
    }
  }
  else
  {
    v36.CFIndex length = v18 - v12 + v15;
    v36.CFIndex location = v12;
    CFStringTokenizerRef v29 = CFStringTokenizerCreate(0, (CFStringRef)string, v36, 0, 0);
    if (v29)
    {
      uint64_t v21 = v29;
      unint64_t v30 = a3;
      while (1)
      {
        while (!CFStringTokenizerGoToTokenAtIndex(v21, v30))
        {
          if (v30 <= v12) {
            goto LABEL_28;
          }
          --v30;
        }
        CFRange v31 = CFStringTokenizerGetCurrentTokenRange(v21);
        CFIndex length = v31.length;
        if (v31.location + v31.length < a3 || v31.location + v31.length == v9) {
          break;
        }
        if (v31.location <= v12) {
          goto LABEL_28;
        }
        if (v31.location - 1 >= v30 - 1) {
          --v30;
        }
        else {
          unint64_t v30 = v31.location - 1;
        }
      }
      unint64_t v12 = v31.location;
      goto LABEL_30;
    }
  }
  NSUInteger v32 = v8;
  NSUInteger v33 = length;
  result.CFIndex length = v33;
  result.CFIndex location = v32;
  return result;
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  unint64_t v6 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  if (location > v6
    && location < v6 + v7
    && (IsWhitespaceCharacter([(TSWPStorage *)self characterAtIndex:location]) & 1) == 0)
  {
    uint64_t v8 = [(TSWPStorage *)self wordAtCharIndex:location - 1 includePreviousWord:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger location = v8;
    }
  }
  if (v5 > location
    && (IsWhitespaceCharacter([(TSWPStorage *)self characterAtIndex:v5 - 1]) & 1) == 0)
  {
    uint64_t v9 = [(TSWPStorage *)self wordAtCharIndex:v5 includePreviousWord:0];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v5 = v9 + v10;
    }
  }
  if (location <= v5) {
    NSUInteger v11 = v5;
  }
  else {
    NSUInteger v11 = location;
  }
  if (location >= v5) {
    NSUInteger v12 = v5;
  }
  else {
    NSUInteger v12 = location;
  }
  NSUInteger v13 = v11 - v12;
  result.CFIndex length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)rangeByTrimmingRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger location = a3.location;
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger v8 = -a3.length;
    NSUInteger v9 = a3.location;
    while ((*((unsigned int (**)(id, void))a4 + 2))(a4, [(TSWPStorage *)self characterAtIndex:v9]))
    {
      ++v9;
      if (__CFADD__(v8++, 1))
      {
LABEL_12:
        NSUInteger v11 = 0;
        goto LABEL_14;
      }
    }
    uint64_t v12 = 0;
    uint64_t v13 = length + location - 1;
    while ((*((unsigned int (**)(id, void))a4 + 2))(a4, [(TSWPStorage *)self characterAtIndex:v13 + v12]))
    {
      if (v8 + 1 == v12--) {
        goto LABEL_12;
      }
    }
    NSUInteger v11 = v12 - v8;
LABEL_14:
    NSUInteger location = v9;
  }
  else
  {
    NSUInteger v11 = 0;
  }
  NSUInteger v15 = location;
  result.NSUInteger length = v11;
  result.NSUInteger location = v15;
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  unint64_t v6 = (void *)a3;
  if (a5) {
    *a5 = (_NSRange)xmmword_223837AD0;
  }
  if (a3)
  {
    uint64_t v7 = [(TSWPStorage *)self attributeArrayForKind:*(void *)&a4];
    if (v7
      && (NSUInteger v8 = v7,
          unint64_t v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, (unint64_t)v6 - 1),
          v9 < v8->var2))
    {
      unint64_t v6 = (void *)*((void *)v8->var4 + 2 * v9 + 1);
      if (a5)
      {
        a5->NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v8, v9);
        a5->NSUInteger length = v10;
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)objectAtLocationAtExactCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(TSWPStorage *)self length] <= a3) {
    return 0;
  }
  id result = [(TSWPStorage *)self attributeArrayForKind:v4];
  if (!result) {
    return result;
  }
  NSUInteger v8 = result;
  unint64_t v9 = TSWPAttributeArray::exactAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
  if (v9 >= v8[2]) {
    return 0;
  }
  else {
    return *(id *)(v8[4] + 16 * v9 + 8);
  }
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  unint64_t v6 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.location, a4.length, a5, a6);
  uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStorage hyphenationLocationBeforeIndex:inRange:locale:hyphenChar:]"];
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2175, @"notreached");
  return -1;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self charIndexMappedFromStorage:a3];

  return [(TSWPStorage *)self charIndexMappedToStorage:v4];
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  return 0;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  return 1.0;
}

- (_NSRange)p_RelocateNonSelectedAnchorsInRange:(_NSRange)a3 selectionInfos:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length >= 2)
  {
    unint64_t v10 = -[TSWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", a3.location, a3.length);
    if (v10 < v10 + v11)
    {
      unint64_t v12 = v10;
      uint64_t v13 = v11;
      do
      {
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        objc_opt_class();
        [(TSWPStorage *)self attachmentAtAttachmentIndex:v12 outCharIndex:&v19];
        uint64_t v14 = (void *)TSUDynamicCast();
        if ([v14 isAnchored]
          && (objc_msgSend(a4, "containsObject:", objc_msgSend(v14, "drawable")) & 1) == 0)
        {
          BOOL v15 = [(TSWPStorage *)self setDOLCSuppressed:1];
          id v16 = v14;
          -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self, "replaceCharactersInRange:withString:undoTransaction:", v19, 1, 0, a5);
          -[TSWPStorage insertAttachmentOrFootnote:range:dolcContext:undoTransaction:changeSession:](self, "insertAttachmentOrFootnote:range:dolcContext:undoTransaction:changeSession:", v14, location++, 0, 0, a5, 0);
          --length;

          [(TSWPStorage *)self setDOLCSuppressed:v15];
        }
        ++v12;
        --v13;
      }
      while (v13);
    }
  }
  NSUInteger v17 = location;
  NSUInteger v18 = length;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (id)extendSelectionForTopicChildren:(id)a3
{
  NSUInteger v3 = (TSWPSelection *)a3;
  if ([a3 type] == 2)
  {
    TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)&v15, (uint64_t)self, 0, [(TSWPStorage *)self paragraphIndexAtCharIndex:[(TSWPSelection *)v3 range]], [(TSWPStorage *)self paragraphCount], 1);
    unint64_t v5 = TSWPParagraphEnumerator::paragraphLevel(&v15);
    char v6 = 0;
    while (1)
    {
      char v7 = v6;
      if (TSWPParagraphEnumerator::isLastParagraph(&v15)) {
        break;
      }
      TSWPParagraphEnumerator::operator++(&v15);
      unint64_t v8 = TSWPParagraphEnumerator::paragraphLevel(&v15);
      char v6 = 1;
      if (v8 <= v5)
      {
        TSWPParagraphEnumerator::operator--(&v15);
        break;
      }
    }
    if (v7)
    {
      unint64_t v9 = [(TSWPSelection *)v3 range];
      NSUInteger v10 = TSWPParagraphEnumerator::paragraphTextRange(&v15);
      if (v9 <= v10 + v11) {
        unint64_t v12 = v10 + v11;
      }
      else {
        unint64_t v12 = v9;
      }
      if (v9 >= v10 + v11) {
        unint64_t v13 = v10 + v11;
      }
      else {
        unint64_t v13 = v9;
      }
      NSUInteger v3 = +[TSWPSelection selectionWithRange:type:leadingEdge:storage:](TSWPSelection, "selectionWithRange:type:leadingEdge:storage:", v13, v12 - v13, 2, 1, 0);
    }
    TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v15);
  }
  return v3;
}

- (id)substringWithRange:(_NSRange)a3
{
  return (id)-[NSMutableString substringWithRange:](self->_string, "substringWithRange:", a3.location, a3.length);
}

- (id)substringWithSelection:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([a3 type])
  {
    if ([a3 type] != 7) {
      return &stru_26D688A48;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v5 = objc_msgSend(a3, "visualRangesArray", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v6) {
      return &stru_26D688A48;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    unint64_t v9 = &stru_26D688A48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) rangeValue];
        unint64_t v9 = (__CFString *)-[__CFString stringByAppendingString:](v9, "stringByAppendingString:", -[TSWPStorage substringWithRange:](self, "substringWithRange:", v11, v12));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
    return v9;
  }
  else
  {
    uint64_t v15 = [a3 range];
    return -[TSWPStorage substringWithRange:](self, "substringWithRange:", v15, v14);
  }
}

- (void)deleteRange:(_NSRange)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
}

- (void)insertStorage:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
}

- (void)willBeAddedToDocumentRoot:(id)a3 dolcContext:(id)a4
{
  -[TSWPStorage setDocumentRoot:](self, "setDocumentRoot:");
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = [(TSWPStorage *)self attributeArrayForKind:v7];
    if (v8) {
      (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 13))(v8, a3, a4);
    }
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 19);
}

- (void)wasAddedToDocumentRoot:(id)a3 dolcContext:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"kObjectWasAddedToDocumentNotification", a3, 0);
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = [(TSWPStorage *)self attributeArrayForKind:v7];
    if (v8) {
      (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 14))(v8, a3, a4);
    }
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 19);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:v5];
    if (v6) {
      (*((void (**)(TSWPAttributeArray *, id))v6->var0 + 15))(v6, a3);
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 19);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"kObjectWasRemovedFromDocumentNotification", a3, 0);
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:v5];
    if (v6) {
      (*((void (**)(TSWPAttributeArray *, id))v6->var0 + 16))(v6, a3);
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 19);

  [(TSWPStorage *)self setDocumentRoot:0];
}

- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  NSUInteger v5 = [(NSMutableString *)self->_string rangeOfString:a3 searchOptions:a4 updatingSearchRange:a5];
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 range:(_NSRange)a5
{
  _NSRange v7 = a5;
  NSUInteger v5 = [(NSMutableString *)self->_string rangeOfString:a3 searchOptions:a4 updatingSearchRange:&v7];
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (_NSRange)rangeOfParagraphBreakingCharacter:(unsigned __int16)a3 backwards:(BOOL)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  BOOL v7 = a4;
  if ((IsParagraphBreakingCharacter(a3) & 1) == 0)
  {
    NSUInteger v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage rangeOfParagraphBreakingCharacter:backwards:range:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2682, @"invalid character");
  }
  unsigned __int16 v16 = a3;
  uint64_t v12 = [NSString stringWithCharacters:&v16 length:1];
  if (v7) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = 2;
  }
  NSUInteger v14 = -[NSMutableString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", v12, v13, location, length);
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (id)childEnumerator
{
  uint64_t v4 = [(TSWPStorage *)self range];

  return -[TSWPStorage childEnumeratorForRange:](self, "childEnumeratorForRange:", v4, v3);
}

- (void)acceptVisitor:(id)a3
{
}

- (_NSRange)rangeOfAnnotationWithOptions:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  char v6 = a3;
  NSUInteger v8 = *MEMORY[0x263F7C7C8];
  NSUInteger v9 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v14, self, a4.location, a4.length, 15);
  char v10 = 0;
  while (TSWPAttributeEnumerator::nextAttributeIndex(v14, &v13))
  {
    objc_opt_class();
    if (TSUDynamicCast() && v13.location >= location && v13.location - location < length)
    {
      if ((v6 & 4) == 0)
      {
        if ((v10 & (v13.location >= v8)) == 0)
        {
          NSUInteger v8 = v13.location;
          NSUInteger v9 = v13.length;
        }
        char v10 = 1;
        break;
      }
      if ((v10 & (v13.location <= v8)) == 0)
      {
        NSUInteger v8 = v13.location;
        NSUInteger v9 = v13.length;
      }
      char v10 = 1;
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v14);
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v14, self, location, length, 16);
  while (TSWPAttributeEnumerator::nextAttributeIndex(v14, &v13))
  {
    objc_opt_class();
    if (TSUDynamicCast() && v13.location >= location && v13.location - location < length)
    {
      if ((v6 & 4) == 0)
      {
        if ((v10 & (v13.location >= v8)) == 0)
        {
          NSUInteger v8 = v13.location;
          NSUInteger v9 = v13.length;
        }
        break;
      }
      if ((v10 & (v13.location <= v8)) == 0)
      {
        NSUInteger v8 = v13.location;
        NSUInteger v9 = v13.length;
      }
      char v10 = 1;
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v14);
  NSUInteger v11 = v8;
  NSUInteger v12 = v9;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (void)findChangesInRange:(_NSRange)a3 onHit:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[TSWPStorage p_findChangesInRange:onHit:withAttributeKind:](self, "p_findChangesInRange:onHit:withAttributeKind:", a3.location, a3.length, a4, 15);

  -[TSWPStorage p_findChangesInRange:onHit:withAttributeKind:](self, "p_findChangesInRange:onHit:withAttributeKind:", location, length, a4, 16);
}

- (_NSRange)rangeForHighlight:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F7C7C8];
  NSUInteger v5 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  char v6 = [(TSWPStorage *)self attributeArrayForKind:17];
  if (v6)
  {
    BOOL v7 = v6;
    unint64_t Object = TSWPAttributeArray::findObject(v6, (objc_object *)a3, 0);
    if (Object == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage rangeForHighlight:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2887, @"Expected to find highlight in storage");
    }
    else
    {
      uint64_t v4 = TSWPAttributeArray::rangeForAttributeIndex(v7, Object);
      NSUInteger v5 = v11;
    }
  }
  NSUInteger v12 = v4;
  NSUInteger v13 = v5;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5
{
  if ([(TSWPStorage *)self wpKind] == 7) {
    return 0;
  }
  uint64_t v11 = [(TSWPStorage *)self range];

  return -[TSWPStorage searchInRange:forString:options:onHit:](self, "searchInRange:forString:options:onHit:", v11, v10, a3, a4, a5);
}

- (id)searchInRange:(_NSRange)a3 forString:(id)a4 options:(unint64_t)a5 onHit:(id)a6
{
  BOOL v7 = -[TSWPSearch initWithString:options:hitBlock:storage:range:]([TSWPSearch alloc], "initWithString:options:hitBlock:storage:range:", a4, a5, a6, self, a3.location, a3.length);
  [(TSWPStorage *)self continueSearch:v7];
  if ([(TSWPSearch *)v7 isComplete])
  {

    return 0;
  }
  else
  {
    NSUInteger v8 = v7;
  }
  return v7;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  uint64_t v5 = [(TSWPStorage *)self range];
  -[TSWPStorage findCommentsInRange:onHit:](self, "findCommentsInRange:onHit:", v5, v6, a3);
  uint64_t v7 = [(TSWPStorage *)self range];
  -[TSWPStorage findChangesInRange:onHit:](self, "findChangesInRange:onHit:", v7, v8, a3);
  return 0;
}

- (void)continueSearch:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage continueSearch:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2930, @"invalid nil value for '%s'", "search");
  }
  uint64_t v10 = [a3 range];
  uint64_t v11 = v7;
  if (v7 && [(TSWPStorage *)self wpKind] != 7)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "searchedString"), "rangeOfString:searchOptions:updatingSearchRange:", objc_msgSend(a3, "string"), objc_msgSend(a3, "options"), &v10);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(a3, "foundHitWithRange:", v8, v9);
    }
    objc_msgSend(a3, "setRange:", v10, v11);
  }
}

- (BOOL)canUserReplaceText
{
  if ([(TSWPStorage *)self wpKind] == 7) {
    return 0;
  }
  uint64_t v4 = [(TSWPStorage *)self parentInfo];
  if (v4)
  {
    uint64_t v5 = v4;
    while (1)
    {
      objc_opt_class();
      uint64_t v6 = (void *)TSUDynamicCast();
      if (v6)
      {
        if ([v6 isLocked]) {
          break;
        }
      }
      uint64_t v5 = [(TSDContainerInfo *)v5 parentInfo];
      if (!v5) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

- (_NSRange)replaceAllOccurrencesOfStyle:(id)a3 withStyle:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v9 = *MEMORY[0x263F7C7C8];
  NSUInteger v10 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = 0;
LABEL_7:
    uint64_t v9 = [(TSWPStorage *)self replaceAllOccurrencesOfObject:a3 withObject:a4 forKind:v11 undoTransaction:a5];
    NSUInteger v10 = v12;
    goto LABEL_8;
  }
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = 2;
    goto LABEL_7;
  }
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v11 = 3;
    goto LABEL_7;
  }
LABEL_8:
  NSUInteger v13 = v9;
  NSUInteger v14 = v10;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (BOOL)styleOverridesAppliedToRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v13, self, a3.location, a3.length, 3);
  while (1)
  {
    uint64_t AttributeIndex = TSWPAttributeEnumerator::nextAttributeIndex(v13, 0);
    if (!AttributeIndex) {
      break;
    }
    if (*(void *)(AttributeIndex + 8))
    {
      objc_opt_class();
      if ([(id)TSUDynamicCast() overridesAnyProperty])
      {
        BOOL v7 = 1;
        goto LABEL_13;
      }
    }
  }
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v12, self, location, length, 0);
  while (1)
  {
    uint64_t v8 = TSWPAttributeEnumerator::nextAttributeIndex(v12, 0);
    BOOL v7 = v8 != 0;
    if (!v8) {
      break;
    }
    if (*(void *)(v8 + 8))
    {
      objc_opt_class();
      uint64_t v9 = (void *)TSUDynamicCast();
      NSUInteger v10 = v9;
      if (v9)
      {
        if ([v9 parent] && (objc_msgSend(v10, "overridesAnyProperty") & 1) != 0) {
          break;
        }
      }
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v12);
LABEL_13:
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v13);
  return v7;
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  if (self->_stylesheet != a3)
  {
    [a4 pushMappingContext:self];
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(TSWPStorage *)self attributeArrayForKind:v7];
      if (v8) {
        (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 12))(v8, a3, a4);
      }
      uint64_t v7 = (v7 + 1);
    }
    while (v7 != 19);
    id v9 = a3;

    self->_stylesheet = (TSSStylesheet *)a3;
    [a4 popMappingContext:self];
  }
}

- (_NSRange)textRangeForListsInCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = -[TSWPStorage textRangeForListAtCharIndex:](self, "textRangeForListAtCharIndex:");
  unint64_t v8 = location + length;
  if (v8 > v7 + v6)
  {
    unint64_t v9 = [(TSWPStorage *)self length];
    if (v8 < v9) {
      unint64_t v9 = [(TSWPStorage *)self listEndAtCharIndex:v8 - 1];
    }
    NSUInteger v6 = v9 - v7;
  }
  NSUInteger v10 = v7;
  result.NSUInteger length = v6;
  result.NSUInteger location = v10;
  return result;
}

- (unint64_t)listEndAtCharIndex:(unint64_t)a3
{
  uint64_t v3 = [(TSWPStorage *)self textRangeForListAtCharIndex:a3];
  return v3 + v4;
}

- (_NSRange)textRangeForListAtCharIndex:(unint64_t)a3
{
  if (self) {
    [(TSWPStorage *)self paragraphEnumeratorAtCharIndex:a3 styleProvider:0];
  }
  else {
    memset(&v18, 0, sizeof(v18));
  }
  NSUInteger length = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v18);
  uint64_t v4 = TSWPParagraphEnumerator::paragraphLevel(&v18);
  if (!length) {
    goto LABEL_17;
  }
  if (![length labelTypeForLevel:v4])
  {
    NSUInteger length = 0;
LABEL_17:
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_18;
  }
  NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(&v18);
  NSUInteger length = v6;
  TSWPParagraphEnumerator::TSWPParagraphEnumerator(&v17, &v18);
  while (!TSWPParagraphEnumerator::isLastParagraph(&v17))
  {
    TSWPParagraphEnumerator::operator++(&v17);
    uint64_t v7 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v17);
    uint64_t v8 = TSWPParagraphEnumerator::paragraphLevel(&v18);
    if (!v7 || ![v7 labelTypeForLevel:v8]) {
      break;
    }
    v22.NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(&v17);
    v22.NSUInteger length = v9;
    v19.NSUInteger location = location;
    v19.NSUInteger length = (NSUInteger)length;
    NSRange v10 = NSUnionRange(v19, v22);
    NSUInteger location = v10.location;
    NSUInteger length = (void *)v10.length;
  }
  while (!TSWPParagraphEnumerator::isFirstParagraph(&v18))
  {
    TSWPParagraphEnumerator::operator--(&v18);
    uint64_t v11 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v18);
    uint64_t v12 = TSWPParagraphEnumerator::paragraphLevel(&v18);
    if (!v11 || ![v11 labelTypeForLevel:v12]) {
      break;
    }
    v23.NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(&v18);
    v23.NSUInteger length = v13;
    v20.NSUInteger location = location;
    v20.NSUInteger length = (NSUInteger)length;
    NSRange v14 = NSUnionRange(v20, v23);
    NSUInteger location = v14.location;
    NSUInteger length = (void *)v14.length;
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v17);
LABEL_18:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v18);
  NSUInteger v15 = location;
  NSUInteger v16 = (NSUInteger)length;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (_NSRange)textRangeForParagraphsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:");
  NSUInteger v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage textRangeForParagraphsInRange:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3224, @"bogus first paragraph text range");
  }
  if (length)
  {
    if (length == 1)
    {
      NSUInteger length = v8;
    }
    else
    {
      NSUInteger v11 = [(TSWPStorage *)self textRangeForParagraphAtIndex:length + location - 1];
      NSUInteger v13 = v12;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSRange v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPStorage textRangeForParagraphsInRange:]"];
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3233, @"bogus first paragraph text range");
      }
      v19.NSUInteger location = v6;
      v19.NSUInteger length = v8;
      v21.NSUInteger location = v11;
      v21.NSUInteger length = v13;
      NSRange v16 = NSUnionRange(v19, v21);
      uint64_t v6 = v16.location;
      NSUInteger length = v16.length;
    }
  }
  NSUInteger v17 = v6;
  NSUInteger v18 = length;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)textRangeForParagraphAtCharIndex:(unint64_t)a3
{
  uint64_t v5 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (!v5)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStorage textRangeForParagraphAtCharIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3246, @"textRangeForParagraphAtCharIndex: no paragraph table.");
  }
  unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3);

  NSUInteger v9 = [(TSWPStorage *)self textRangeForParagraphAtIndex:v8];
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (unint64_t)paragraphEndAtCharIndex:(unint64_t)a3
{
  uint64_t v3 = [(TSWPStorage *)self textRangeForParagraphAtCharIndex:a3];
  return v3 + v4;
}

- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  unint64_t v8 = location + length;
  if (v8 > v7 + v6)
  {
    unint64_t v9 = [(TSWPStorage *)self length];
    if (v8 < v9) {
      unint64_t v9 = [(TSWPStorage *)self paragraphEndAtCharIndex:v8 - 1];
    }
    NSUInteger v6 = v9 - v7;
  }
  NSUInteger v10 = v7;
  result.NSUInteger length = v6;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  if (length) {
    NSUInteger v7 = [(TSWPStorage *)self paragraphIndexAtCharIndex:length + location - 1] - v6 + 1;
  }
  else {
    NSUInteger v7 = 1;
  }
  NSUInteger v8 = v6;
  result.NSUInteger length = v7;
  result.NSUInteger location = v8;
  return result;
}

- (BOOL)paragraphHasListLabelAtCharIndex:(unint64_t)a3
{
  id v5 = [(TSWPStorage *)self listStyleAtCharIndex:a3 effectiveRange:0];
  if (v5) {
    LOBYTE(v5) = objc_msgSend(v5, "labelTypeForLevel:", -[TSWPStorage paragraphLevelAtCharIndex:](self, "paragraphLevelAtCharIndex:", a3)) != 0;
  }
  return (char)v5;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self paragraphIndexAtCharIndex:a3];

  return [(TSWPStorage *)self isWritingDirectionRightToLeftForParagraphAtParIndex:v4];
}

- (void)setParagraphWritingDirection:(int)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", a4.location, a4.length);
  if (v9)
  {
    -[TSWPStorage applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:](self, "applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:", v6, v8, v9, 18, a5);
  }
}

- (void)setLanguage:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v10 = [(TSWPStorage *)self attributeArrayForKind:13];
  if (!v10
    || (NSUInteger v11 = v10, v12 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v10, location), v12 == v11->var2)
    || (id v13 = (id)*((void *)v11->var4 + 2 * v12 + 1),
        unint64_t v14 = TSWPAttributeArray::rangeForAttributeIndex(v11, v12),
        v14 > location)
    || v14 + v15 < location + length
    || v13 != a3 && (!a3 || !v13 || ([v13 isEqualToString:a3] & 1) == 0))
  {
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, location, length, 13, 0, a5);
  }
}

- (id)bestCharacterLanguageForTextRange:(_NSRange)a3
{
  unint64_t range2 = a3.length;
  NSUInteger location = a3.location;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id result = [(TSWPStorage *)self attributeArrayForKind:13];
  if (result)
  {
    uint64_t v6 = (TSWPAttributeArray *)result;
    v45[1] = xmmword_22383ACF0;
    v45[0] = xmmword_22383ACF0;
    v45[3] = xmmword_22383ACF0;
    v45[2] = xmmword_22383ACF0;
    unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, location);
    unint64_t var2 = v6->var2;
    if (v7 < var2)
    {
      unint64_t v8 = v7;
      NSUInteger v44 = location + range2;
      uint64_t v38 = (char *)v45 + 8;
      unint64_t v39 = 0;
      BOOL v40 = v6;
      NSUInteger v41 = location;
      while (1)
      {
        v47.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v6, v8);
        NSUInteger v9 = v47.location;
        NSUInteger length = v47.length;
        NSUInteger v11 = (void *)*((void *)v6->var4 + 2 * v8 + 1);
        v48.NSUInteger location = location;
        v48.NSUInteger length = range2;
        NSRange v12 = NSIntersectionRange(v47, v48);
        if (v11) {
          break;
        }
        if (v9 + length >= v44) {
          NSUInteger v20 = v44;
        }
        else {
          NSUInteger v20 = v9 + length;
        }
        if (v9 < v20)
        {
          NSUInteger v13 = v12.length;
          BOOL v14 = 1;
          NSUInteger v21 = v9;
          do
          {
            uint64_t v22 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v21, v38);
            if (!IsSpecialCharacter(v22))
            {
              int v23 = IsParagraphBreakingCharacter(v22);
              if (v22 != 8232 && !v23) {
                break;
              }
            }
            BOOL v14 = ++v21 < v20;
          }
          while (v20 != v21);
          goto LABEL_6;
        }
LABEL_32:
        if (++v8 >= var2 || v9 + length >= v44) {
          goto LABEL_34;
        }
      }
      NSUInteger v13 = v12.length;
      BOOL v14 = 1;
LABEL_6:
      if (v13 && v14)
      {
        unint64_t v15 = 0;
        NSRange v16 = v38;
        do
        {
          uint64_t v17 = *(void *)v16;
          if (*(void *)v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v18 = (void *)*((void *)v16 - 1);
            if (v18 == v11 || ([v18 isEqualToString:v11] & 1) != 0)
            {
              unint64_t v19 = v39;
              if (v39 <= v15) {
                unint64_t v19 = v15 + 1;
              }
              goto LABEL_27;
            }
          }
          ++v15;
          v16 += 16;
        }
        while (v15 != 4);
        unint64_t v15 = v39;
        if (v39 > 3) {
          return 0;
        }
        unint64_t v19 = v39 + 1;
        uint64_t v17 = *((void *)&v45[v39] + 1);
LABEL_27:
        CFStringTokenizerTokenType v24 = &v45[v15];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = v17;
        }
        *CFStringTokenizerTokenType v24 = v11;
        v24[1] = v25 + v13;
        unint64_t v39 = v19;
      }
      uint64_t v6 = v40;
      NSUInteger location = v41;
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v26 = 0;
    int v27 = 0;
    uint64_t v28 = (unint64_t *)v45 + 1;
    unint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      unint64_t v32 = *v28;
      v28 += 2;
      unint64_t v31 = v32;
      BOOL v34 = v29 == 0x7FFFFFFFFFFFFFFFLL || v31 > v29;
      BOOL v35 = !v34;
      if (v34) {
        uint64_t v36 = v26;
      }
      else {
        uint64_t v36 = v30;
      }
      if (v35) {
        unint64_t v37 = v29;
      }
      else {
        unint64_t v37 = v31;
      }
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v30 = v36;
        ++v27;
        unint64_t v29 = v37;
      }
      ++v26;
    }
    while (v26 != 4);
    if (v30 != 0x7FFFFFFFFFFFFFFFLL
      && (v27 == 1 || (double)*((unint64_t *)&v45[v30] + 1) / (double)range2 >= 0.75))
    {
      return *(id *)&v45[v30];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)dictationAndAutocorrectionKeyAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if (a4)
  {
    a4->NSUInteger location = 0;
    a4->NSUInteger length = 0;
  }
  id result = [(TSWPStorage *)self attributeArrayForKind:14];
  if (result)
  {
    unint64_t v7 = (TSWPAttributeArray *)result;
    unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
    if (v8 >= v7->var2)
    {
      return 0;
    }
    else
    {
      unint64_t v9 = v8;
      if (a4)
      {
        a4->NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v7, v8);
        a4->NSUInteger length = v10;
      }
      return (id)*((void *)v7->var4 + 2 * v9 + 1);
    }
  }
  return result;
}

- (void)addAllDictationAndAutocorrectionKeyRangesInRange:(_NSRange)a3 toRanges:(void *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v7 = [(TSWPStorage *)self attributeArrayForKind:14];
  if (v7)
  {
    unint64_t v8 = v7;
    unint64_t v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, location);
    unint64_t var2 = v8->var2;
    if (v9 < var2)
    {
      unint64_t v11 = v9;
      do
      {
        v26.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v8, v11);
        NSUInteger v12 = v26.location;
        NSUInteger v13 = v26.length;
        uint64_t v14 = *((void *)v8->var4 + 2 * v11 + 1);
        v27.NSUInteger location = location;
        v27.NSUInteger length = length;
        if (NSIntersectionRange(v26, v27).length && v14)
        {
          NSRange v16 = (NSUInteger *)*((void *)a4 + 1);
          unint64_t v15 = *((void *)a4 + 2);
          if ((unint64_t)v16 >= v15)
          {
            NSUInteger v18 = *(NSUInteger **)a4;
            uint64_t v19 = ((uint64_t)v16 - *(void *)a4) >> 4;
            unint64_t v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60) {
              abort();
            }
            uint64_t v21 = v15 - (void)v18;
            if (v21 >> 3 > v20) {
              unint64_t v20 = v21 >> 3;
            }
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v22 = v20;
            }
            if (v22)
            {
              int v23 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a4 + 16, v22);
              NSUInteger v18 = *(NSUInteger **)a4;
              NSRange v16 = (NSUInteger *)*((void *)a4 + 1);
            }
            else
            {
              int v23 = 0;
            }
            CFStringTokenizerTokenType v24 = (NSUInteger *)&v23[16 * v19];
            *CFStringTokenizerTokenType v24 = v12;
            v24[1] = v13;
            uint64_t v25 = v24;
            if (v16 != v18)
            {
              do
              {
                *((_OWORD *)v25 - 1) = *((_OWORD *)v16 - 1);
                v25 -= 2;
                v16 -= 2;
              }
              while (v16 != v18);
              NSUInteger v18 = *(NSUInteger **)a4;
            }
            uint64_t v17 = v24 + 2;
            *(void *)a4 = v25;
            *((void *)a4 + 1) = v24 + 2;
            *((void *)a4 + 2) = &v23[16 * v22];
            if (v18) {
              operator delete(v18);
            }
          }
          else
          {
            *NSRange v16 = v12;
            v16[1] = v13;
            uint64_t v17 = v16 + 2;
          }
          *((void *)a4 + 1) = v17;
        }
        ++v11;
      }
      while (v11 < var2 && v12 + v13 < location + length);
    }
  }
}

- (void)setDictationAndAutocorrection:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v10 = [(TSWPStorage *)self attributeArrayForKind:14];
  if (!v10
    || (unint64_t v11 = v10, v12 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v10, location), v12 == v11->var2)
    || (id v13 = (id)*((void *)v11->var4 + 2 * v12 + 1),
        unint64_t v14 = TSWPAttributeArray::rangeForAttributeIndex(v11, v12),
        v14 > location)
    || v14 + v15 < location + length
    || v13 != a3 && (!a3 || !v13 || ([v13 isEqualToString:a3] & 1) == 0))
  {
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, location, length, 14, 0, a5);
  }
}

- (void)setParagraphStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (unint64_t)findNextParagraphStyleChange:(unint64_t)a3 maxCharIndex:(unint64_t)a4
{
  uint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (!v6)
  {
    unint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPStorage findNextParagraphStyleChange:maxCharIndex:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3835, @"findNextParagraphStyleChange: no paragraph table.");
  }
  unint64_t v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
  unint64_t var2 = v6->var2;
  uint64_t v11 = *((void *)v6->var4 + 2 * v9 + 1);
  uint64_t v12 = 16 * v9 + 24;
  do
  {
    if (++v9 >= var2 || TSWPAttributeArray::charIndexForAttributeIndex(v6, v9) >= a4) {
      return a4;
    }
    uint64_t v13 = *(void *)((char *)v6->var4 + v12);
    v12 += 16;
  }
  while (v13 == v11);

  return TSWPAttributeArray::charIndexForAttributeIndex(v6, v9);
}

- (void)enumerateParagraphsIntersectingTextRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = [(TSWPStorage *)self attributeArrayForKind:0];
  if (!v8)
  {
    unint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage enumerateParagraphsIntersectingTextRange:usingBlock:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3867, @"enumerateParagraphsIntersectingTextRange:usingBlock: no paragraph table.");
  }
  v19.NSUInteger location = location;
  v19.NSUInteger length = length;
  unint64_t v11 = TSWPAttributeArray::calculateAttributeRangeForCharacterRange(v8, v19);
  char v18 = 0;
  unint64_t v13 = v11 + v12;
  if (v11 < v11 + v12)
  {
    unint64_t v14 = v11;
    do
    {
      id v15 = [(TSWPStorage *)self paragraphStyleAtParIndex:v14 effectiveRange:v17];
      (*((void (**)(id, unint64_t, void, void, id, char *))a4 + 2))(a4, v14++, v17[0], v17[1], v15, &v18);
      if (v18) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v14 >= v13;
      }
    }
    while (!v16);
  }
}

- (BOOL)supportsListStyles
{
  return 1;
}

- (unint64_t)listStyleCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:2];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setListStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (void)setListStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (unint64_t)listNumberForParagraphIndex:(unint64_t)a3 numberingData:(id *)a4
{
  if (self) {
    [(TSWPStorage *)self paragraphEnumeratorAtParIndex:a3 styleProvider:0];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  unint64_t v6 = [(TSWPStorage *)self listNumberForParagraphEnumerator:&v8 numberingData:a4];
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v8);
  return v6;
}

- (unint64_t)listNumberForParagraphEnumerator:(const TSWPParagraphEnumerator *)a3 numberingData:(id *)a4
{
  unint64_t v7 = (void *)TSWPParagraphEnumerator::paragraphListStyle((TSWPParagraphEnumerator *)a3);
  unint64_t v8 = TSWPParagraphEnumerator::paragraphLevel((TSWPParagraphEnumerator *)a3);
  if (!v7)
  {
    [0 baseStyleForTopicNumbers];
    int v9 = 0;
    goto LABEL_6;
  }
  int v9 = [v7 labelTypeForLevel:v8];
  uint64_t v10 = [v7 baseStyleForTopicNumbers];
  if (v9 != 3)
  {
LABEL_6:
    unint64_t v13 = 0;
    goto LABEL_29;
  }
  unint64_t v11 = (void *)v10;
  uint64_t v12 = TSWPParagraphEnumerator::paragraphListStart((TSWPParagraphEnumerator *)a3);
  if (v12)
  {
    unint64_t v13 = v12;
    goto LABEL_28;
  }
  TSWPParagraphEnumerator::TSWPParagraphEnumerator(&v28, a3);
  char v26 = 0;
  for (uint64_t i = 1; ; uint64_t i = v13 + 1)
  {
    if (TSWPParagraphEnumerator::isFirstParagraph(&v28))
    {
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v28);
      unint64_t v13 = i + (v26 & 1);
      goto LABEL_28;
    }
    TSWPParagraphEnumerator::operator--(&v28);
    id v15 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v28);
    unint64_t v16 = TSWPParagraphEnumerator::paragraphLevel(&v28);
    if (v15) {
      int v17 = [v15 labelTypeForLevel:v16];
    }
    else {
      int v17 = 0;
    }
    NSUInteger v18 = TSWPParagraphEnumerator::paragraphTextRange(&v28);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke;
    v27[3] = &__block_descriptor_48_e26_B16__0___TSWPTextSource__8l;
    v27[4] = v18;
    v27[5] = v19;
    char v20 = __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke((uint64_t)v27, self);
    if (v17 == 3) {
      char v21 = v20;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) != 0
      || (uint64_t v22 = [v15 baseStyleForTopicNumbers], v22 != objc_msgSend(v11, "baseStyleForTopicNumbers")))
    {
      unint64_t v13 = i - 1;
      continue;
    }
    if (v16 < v8) {
      break;
    }
    if (v16 > v8)
    {
      unint64_t v13 = i - 1;
      char v26 = 1;
    }
    else
    {
      uint64_t v23 = TSWPParagraphEnumerator::paragraphListStart(&v28);
      unint64_t v13 = v23 + i;
      if (v23) {
        goto LABEL_27;
      }
      char v26 = 0;
    }
  }
  unint64_t v13 = i + (v26 & 1);
LABEL_27:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v28);
LABEL_28:
  int v9 = 3;
LABEL_29:
  uint64_t v24 = TSWPParagraphEnumerator::paragraphListStart((TSWPParagraphEnumerator *)a3);
  if (a4)
  {
    a4->unsigned int var0 = v9;
    a4->uint64_t var1 = v8;
    a4->unint64_t var2 = v24 == 0;
  }
  return v13;
}

uint64_t __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 charIndexMappedFromStorage:*(void *)(a1 + 32)];
  if (![a2 length] || objc_msgSend(a2, "characterAtIndex:", v3) != 65532) {
    return 0;
  }
  unint64_t v4 = (void *)[a2 attachmentAtCharIndex:v3];

  return [v4 isPartitioned];
}

- (void)setListStart:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", a4.location, a4.length);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    if (HIDWORD(a3))
    {
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPStorage setListStart:forCharRange:undoTransaction:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4073, @"Out-of-bounds type assignment was clamped to max");
      a3 = 0xFFFFFFFFLL;
    }
    -[TSWPStorage applyDataValue:toParagraphIndexRange:forKind:undoTransaction:](self, "applyDataValue:toParagraphIndexRange:forKind:undoTransaction:", a3, v10, v11, 11, a5);
  }
}

- (unint64_t)listStartAtCharIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:11];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4->var2)
    {
      unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPStorage listStartAtCharIndex:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4086, @"paragraphStartAtCharIndex: no paragraph table.");
      }
      return *((unsigned int *)v5->var4 + 4 * v7 + 2);
    }
  }
  else
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage listStartAtCharIndex:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4081, @"paragraphLevelAtCharIndex: no paragraph table.");
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)paragraphFlags:(unsigned __int16 *)a3 andLevel:(unint64_t *)a4 atCharIndex:(unint64_t)a5
{
  uint64_t v8 = [(TSWPStorage *)self attributeArrayForKind:1];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v8, a5);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphFlags:andLevel:atCharIndex:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4107, @"paragraphFlagsAtCharIndex: no paragraph table.");
    }
    uint64_t v13 = (uint64_t)v9->var4 + 16 * v10;
    unint64_t v14 = *(unsigned __int16 *)(v13 + 8);
    unsigned __int16 v15 = *(_WORD *)(v13 + 10);
    if (a3) {
      goto LABEL_5;
    }
  }
  else
  {
    unsigned __int16 v15 = 0;
    unint64_t v14 = 0;
    if (a3) {
LABEL_5:
    }
      *a3 = v15;
  }
  if (a4) {
    *a4 = v14;
  }
}

- (unsigned)paragraphFlagsAtCharIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:1];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphFlagsAtCharIndex:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4128, @"paragraphFlagsAtCharIndex: no paragraph table.");
    }
    return *((_WORD *)v5->var4 + 8 * v6 + 5);
  }
  else
  {
    unint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage paragraphFlagsAtCharIndex:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4123, @"paragraphFlagsAtCharIndex: no paragraph table.");
    return 0;
  }
}

- (void)setParagraphFlags:(unsigned __int16)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = a3;
  unint64_t v10 = [(TSWPStorage *)self paragraphLevelAtCharIndex:a4.location];

  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", v8, v10, location, length, a5);
}

- (void)setParagraphLevel:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v10 = [(TSWPStorage *)self paragraphFlagsAtCharIndex:a4.location];

  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", v10, a3, location, length, a5);
}

- (void)setParagraphLevel:(unint64_t)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v8 = [(TSWPStorage *)self textRangeForParagraphAtIndex:a4];
  uint64_t v10 = v9;
  uint64_t v11 = [(TSWPStorage *)self paragraphFlagsAtCharIndex:v8];

  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", v11, a3, v8, v10, a5);
}

- (unint64_t)characterStyleAttributeCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:3];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", a4, 0);
  if (v9)
  {
    id v10 = v9;
    if ([v9 definesProperty:v7])
    {
      id v11 = v10;
LABEL_6:
      uint64_t v12 = [v11 boxedValueForProperty:v7];
LABEL_7:
      uint64_t v13 = (void *)v12;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(+[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties"), "containsProperty:", v7))
  {
    id v11 = [(TSWPStorage *)self paragraphStyleAtCharIndex:a4 effectiveRange:a5];
    goto LABEL_6;
  }
  if (objc_msgSend(+[TSWPColumnStyle properties](TSWPColumnStyle, "properties"), "containsProperty:", v7))
  {
    uint64_t v12 = objc_msgSend(-[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self, "columnStyleAtCharIndex:effectiveRange:", a4, a5), "valueForProperty:", v7);
    goto LABEL_7;
  }
  unsigned __int16 v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPStorage valueForProperty:atCharIndex:effectiveRange:]"];
  [v15 handleFailureInFunction:v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4268, @"Bad property sent to storage: %@", String(v7) file lineNumber description];
  uint64_t v13 = 0;
LABEL_8:
  if (v13 == (void *)[MEMORY[0x263EFF9D0] null]) {
    return 0;
  }
  else {
    return v13;
  }
}

- (unint64_t)columnStyleCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:9];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  LODWORD(v5) = [(TSWPStorage *)self supportsColumnStyles];
  if (v5)
  {
    id v5 = [(TSWPStorage *)self attributeArrayForKind:9];
    if (v5) {
      LOBYTE(v5) = TSWPAttributeArray::exactAttributeIndexForCharIndex(v5, a3 + 1) != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return (char)v5;
}

- (id)columnStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v7 = [(TSWPStorage *)self attributeArrayForKind:9];
  if (!v7) {
    return 0;
  }
  unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(TSWPStorage *)self columnStyleAtColumnStyleIndex:v8 effectiveRange:a4];
}

- (id)columnStyleAtColumnStyleIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result = [(TSWPStorage *)self attributeArrayForKind:9];
  if (result)
  {
    uint64_t v7 = (TSWPAttributeArray *)result;
    unint64_t var2 = *((void *)result + 2);
    if (var2 <= a3)
    {
      id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage columnStyleAtColumnStyleIndex:effectiveRange:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4350, @"Bad columnStyleIndex");
      unint64_t var2 = v7->var2;
    }
    if (var2 <= a3)
    {
      return 0;
    }
    else
    {
      if (a4)
      {
        a4->NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v7, a3);
        a4->NSUInteger length = v11;
      }
      return (id)*((void *)v7->var4 + 2 * a3 + 1);
    }
  }
  return result;
}

- (void)setColumnStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
}

- (void)styleDidChangeInRange:(_NSRange)a3
{
}

- (void)invalidateForStyle:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [&unk_26D739480 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_26D739480);
        }
        id v9 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", [*(id *)(*((void *)&v11 + 1) + 8 * v8) unsignedIntegerValue]);
        if (v9)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __34__TSWPStorage_invalidateForStyle___block_invoke;
          v10[3] = &unk_2646B2E68;
          v10[4] = a3;
          v10[5] = self;
          TSWPAttributeArray::enumerateObjectAttributes(v9, (uint64_t)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_26D739480 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __34__TSWPStorage_invalidateForStyle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void **)(a1 + 32) == a2
    || (uint64_t result = objc_msgSend((id)objc_msgSend(a2, "referencedStyles"), "containsObject:", *(void *)(a1 + 32)),
        result))
  {
    id v9 = *(void **)(a1 + 40);
    return objc_msgSend(v9, "styleDidChangeInRange:", a4, a5);
  }
  return result;
}

- (BOOL)supportsSectionCopying
{
  return 0;
}

- (unint64_t)sectionCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:8];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)hasSectionForParagraphBreakAtCharIndex:(unint64_t)a3
{
  if (self->_WPKind)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    uint64_t v3 = [(TSWPStorage *)self attributeArrayForKind:8];
    if (v3) {
      LOBYTE(v3) = TSWPAttributeArray::exactAttributeIndexForCharIndex(v3, a3 + 1) != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return (char)v3;
}

- (id)sectionAtSectionIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result = [(TSWPStorage *)self attributeArrayForKind:8];
  if (result)
  {
    uint64_t v7 = result;
    if (a4)
    {
      a4->NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex((TSWPAttributeArray *)result, a3);
      a4->NSUInteger length = v8;
    }
    return *(id *)(v7[4] + 16 * a3 + 8);
  }
  return result;
}

- (void)replaceSectionAtSectionIndex:(unint64_t)a3 withSection:(id)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v10 = [(TSWPStorage *)self attributeArrayForKind:8];
  if (v10 && v10->var2 > a3)
  {
    TSWPAttributeArray::replaceObjectForAttributeIndex(v10, (objc_object *)a4, a3, (TSKAddedToDocumentContext *)a5, a6);
  }
}

- (unint64_t)sectionIndexForCharIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:8];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
}

- (unint64_t)sectionIndexForSection:(id)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:8];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
}

- (id)sectionAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v7 = [(TSWPStorage *)self attributeArrayForKind:8];
  if (!v7) {
    return 0;
  }
  unint64_t v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(TSWPStorage *)self sectionAtSectionIndex:v8 effectiveRange:a4];
}

- (_NSRange)insertSection:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7
{
  -[TSWPStorage splitSmartFieldAtCharIndex:lengthToInsert:dolcContext:undoTransaction:](self, "splitSmartFieldAtCharIndex:lengthToInsert:dolcContext:undoTransaction:", a4, 1);
  -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", 4, a3, 8, a4, 0, a5, a6, a7);
  long long v13 = [(TSWPStorage *)self attributeArrayForKind:8 withCreate:1 undoTransaction:a6];
  if (!v13)
  {
    long long v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPStorage insertSection:atCharIndex:dolcContext:undoTransaction:changeSession:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4520, @"insertSection: bad attribute array.");
  }
  unint64_t v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, a4 + 1);
  unint64_t v17 = v16;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL || *((id *)v13->var4 + 2 * v16 + 1) != a3)
  {
    NSUInteger v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPStorage insertSection:atCharIndex:dolcContext:undoTransaction:changeSession:]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4523, @"insertSection: bad insertion object.");
  }

  NSUInteger v20 = TSWPAttributeArray::rangeForAttributeIndex(v13, v17);
  result.NSUInteger length = v21;
  result.NSUInteger location = v20;
  return result;
}

- (void)appendSection:(id)a3 charIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  unint64_t v9 = [(TSWPStorage *)self length] - a4;

  -[TSWPStorage applyObject:toParagraphsInCharRange:forKind:undoTransaction:](self, "applyObject:toParagraphsInCharRange:forKind:undoTransaction:", a3, a4, v9, 8, a5);
}

- (unint64_t)footnoteCount
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:5];
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (unint64_t)footnoteIndexForCharIndex:(unint64_t)a3
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:5];
  if (result)
  {
    uint64_t v5 = (TSWPAttributeArray *)result;
    if (*(void *)(result + 16)
      && (unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v7 = v6;
      if (TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3) {
        return v7;
      }
      else {
        return v7 + 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)footnoteMarkAtCharIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (!v4->var2) {
    return 0;
  }
  unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) != a3) {
    return 0;
  }
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)footnoteAtFootnoteIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4
{
  unint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (!v6 || v6->var2 <= a3) {
    return 0;
  }
  unint64_t v7 = (void *)*((void *)v6->var4 + 2 * a3 + 1);
  if (a4) {
    *a4 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3);
  }
  return v7;
}

- (_NSRange)footnoteRangeForTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (v5)
  {
    v6.NSUInteger location = location;
    v6.NSUInteger length = length;
    uint64_t v5 = (TSWPAttributeArray *)TSWPAttributeArray::calculateAttributeRangeForCharacterRange(v5, v6);
  }
  else
  {
    NSUInteger v7 = 0;
  }
  result.NSUInteger length = v7;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (unint64_t)autoNumberFootnoteCountForRange:(_NSRange)a3
{
  unint64_t v4 = -[TSWPStorage footnoteRangeForTextRange:](self, "footnoteRangeForTextRange:", a3.location, a3.length);
  if (v4 >= v4 + v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint64_t v7 = v5;
  unint64_t v8 = 0;
  do
  {
    if (!objc_msgSend(-[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", v6, 0), "customMarkString"))++v8; {
    ++v6;
    }
    --v7;
  }
  while (v7);
  return v8;
}

- (unint64_t)footnoteIndexForFootnote:(id)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
}

- (unint64_t)footnoteIndexForFootnoteStorage:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage footnoteIndexForFootnoteStorage:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4706, @"invalid nil value for '%s'", "footnoteStorage");
  }
  if ([a3 wpKind] != 2)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPStorage footnoteIndexForFootnoteStorage:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4707, @"This isn't a footnote storage");
  }
  objc_opt_class();
  [a3 owningAttachment];
  uint64_t v9 = TSUDynamicCast();
  if (!v9)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage footnoteIndexForFootnoteStorage:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4710, @"invalid nil value for '%s'", "footnoteAttachment");
  }

  return [(TSWPStorage *)self footnoteIndexForFootnote:v9];
}

- (id)footnoteStorages
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF9C0] set];
  unint64_t v4 = [(TSWPStorage *)self footnoteCount];
  if (v4)
  {
    unint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = objc_msgSend(-[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", i, 0), "containedStorage");
      if (v7)
      {
        [v3 addObject:v7];
      }
      else
      {
        uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPStorage footnoteStorages]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4726, @"invalid nil value for '%s'", "footnoteStorage");
      }
    }
  }
  return v3;
}

- (unint64_t)findCharIndexForFootnoteAttachment:(id)a3
{
  unint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v4;
  unint64_t Object = TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
  if (Object == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return TSWPAttributeArray::charIndexForAttributeIndex(v5, Object);
}

- (void)invalidateFootnoteAttachmentCharIndexes
{
  uint64_t v3 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (v3)
  {
    unint64_t v4 = v3;
    unint64_t var2 = v3->var2;
    if (var2)
    {
      for (unint64_t i = 0; i != var2; ++i)
        -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, TSWPAttributeArray::charIndexForAttributeIndex(v4, i), 1, 0, 1);
    }
  }
}

- (void)invalidatePageCountAttachmentCharIndexes:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t var2 = v5->var2;
    if (var2)
    {
      for (unint64_t i = 0; i != var2; ++i)
      {
        id v9 = [(TSWPStorage *)self attachmentAtAttachmentIndex:i outCharIndex:0];
        if ([v9 changesWithPageCount])
        {
          uint64_t v10 = (void *)[v9 stringEquivalent];
          if ([v10 length])
          {
            int v11 = [v10 intValue];
            if (v11 == 0x7FFFFFFF)
            {
              long long v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPStorage invalidatePageCountAttachmentCharIndexes:]"];
              objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4803, @"Invalid page count.");
            }
            else
            {
              int v14 = 10;
              if (v11 >= 11)
              {
                do
                  v14 *= 10;
                while (v14 < v11);
              }
              if (v14 == v11 + !v3) {
                -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, TSWPAttributeArray::charIndexForAttributeIndex(v6, i), 1, 0, 1);
              }
            }
          }
        }
      }
    }
  }
}

- (void)invalidateCharIndexForAttachment:(id)a3
{
  uint64_t v4 = [a3 findCharIndex];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    broadcaster = self->_broadcaster;
    -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, v5, 1, 0, 1);
  }
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    uint64_t v15 = 5;
  }
  else {
    uint64_t v15 = 4;
  }
  if (isKindOfClass) {
    uint64_t v16 = 14;
  }
  else {
    uint64_t v16 = 65532;
  }
  NSUInteger v17 = -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", v16, a3, v15, location, length, a5, a6, a7);
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (unint64_t)findCharacterIndexForContainedInfo:(id)a3
{
  id v3 = a3;
  uint64_t v5 = (TSWPStorage *)[a3 parentInfo];
  BOOL v6 = v5 != 0;
  if (v5)
  {
    uint64_t v7 = v5;
    if (v5 != self)
    {
      do
      {
        uint64_t v8 = [(TSWPStorage *)v7 parentInfo];
        if (v8 == self) {
          id v3 = v7;
        }
        BOOL v6 = v8 != 0;
        if (!v8) {
          break;
        }
        uint64_t v7 = v8;
      }
      while (v8 != self);
    }
  }
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v9 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v9;
  if (!v9->var2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v11 = 0;
  for (uint64_t i = 8; ; i += 16)
  {
    uint64_t v13 = *(void **)((char *)v10->var4 + i);
    if ([v13 isDrawable])
    {
      if ((id)[v13 drawable] == v3) {
        break;
      }
    }
    if (++v11 >= v10->var2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return TSWPAttributeArray::charIndexForAttributeIndex(v10, v11);
}

- (unint64_t)attachmentIndexAtCharIndex:(unint64_t)a3
{
  uint64_t v4 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4->var2)
  {
    unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = v7;
      if (TSWPAttributeArray::charIndexForAttributeIndex(v5, v7) == a3) {
        return v8;
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v6;
}

- (void)replaceWithAttachment:(id)a3 forAttachmentIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v10 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (v10 && v10->var2 > a4)
  {
    TSWPAttributeArray::replaceObjectForAttributeIndex(v10, (objc_object *)a3, a4, (TSKAddedToDocumentContext *)a5, a6);
  }
}

- (unint64_t)attachmentIndexForInsertionAtCharIndex:(unint64_t)a3
{
  unint64_t result = [(TSWPStorage *)self attributeArrayForKind:4];
  if (result)
  {
    uint64_t v5 = (TSWPAttributeArray *)result;
    unint64_t v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
    if (v6 >= v5->var2 || TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) >= a3)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      else {
        return v6;
      }
    }
    else
    {
      return v6 + 1;
    }
  }
  return result;
}

- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4
{
  NSUInteger v4 = [(TSWPStorage *)self attachmentRangeForCharIndex:a3 forwards:a4 attributeKind:4];
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4 attributeKind:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  if ((a5 & 0xFFFFFFFE) != 4)
  {
    id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage attachmentRangeForCharIndex:forwards:attributeKind:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5077, @"Bad attribute kind passed into attachmentRangeForCharIndex::: method.");
  }
  unint64_t v11 = [(TSWPStorage *)self attributeArrayForKind:v5];
  if (!v11 || (long long v12 = v11, !v11->var2))
  {
    if (!v6) {
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  unint64_t v13 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v11, a3);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      int v14 = v12;
      unint64_t v15 = 0;
LABEL_8:
      uint64_t v16 = TSWPAttributeArray::charIndexForAttributeIndex(v14, v15);
LABEL_11:
      uint64_t v17 = v16;
      NSUInteger v18 = a3;
      a3 = v17 - a3;
      goto LABEL_21;
    }
LABEL_20:
    NSUInteger v18 = 0;
    goto LABEL_21;
  }
  unint64_t v19 = v13;
  uint64_t v20 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v13);
  if (v6)
  {
    if (v20 == a3)
    {
      NSUInteger v18 = a3;
      goto LABEL_19;
    }
    unint64_t v15 = v19 + 1;
    if (v19 + 1 < v12->var2)
    {
      int v14 = v12;
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v16 = [(TSWPStorage *)self length];
    goto LABEL_11;
  }
  if (v20 == a3)
  {
    if (!v19) {
      goto LABEL_20;
    }
    uint64_t v21 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v19 - 1);
    NSUInteger v18 = a3 - 1;
    if (v21 != a3 - 1)
    {
      NSUInteger v18 = v21 + 1;
      a3 -= v21 + 1;
      goto LABEL_21;
    }
LABEL_19:
    a3 = 1;
    goto LABEL_21;
  }
  NSUInteger v18 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v19);
  unint64_t v23 = a3 - (v18 + 1);
  if (v18 == a3 - 1)
  {
    a3 = 1;
  }
  else
  {
    ++v18;
    a3 = v23;
  }
LABEL_21:
  NSUInteger v22 = a3;
  result.NSUInteger length = v22;
  result.NSUInteger location = v18;
  return result;
}

- (BOOL)anchoredDrawableAttachmentCharacterAtCharIndex:(unint64_t)a3
{
  if (-[TSWPStorage characterAtIndex:](self, "characterAtIndex:") != 65532) {
    return 0;
  }
  id v5 = [(TSWPStorage *)self attachmentAtCharIndex:a3];
  if (![v5 isDrawable]) {
    return 0;
  }

  return [v5 isAnchored];
}

- (_NSRange)p_extendRangeToIncludeSmartFields:(_NSRange)a3
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  long long range2 = 0uLL;
  id v6 = [(TSWPStorage *)self smartFieldAtCharIndex:a3.location attributeKind:6 effectiveRange:&range2];
  NSUInteger v7 = location + length;
  v14.unint64_t location = 0;
  v14.NSUInteger length = 0;
  if (length)
  {
    id v8 = [(TSWPStorage *)self smartFieldAtCharIndex:v7 - 1 attributeKind:6 effectiveRange:&v14];
    if (v6 != v8)
    {
      id v9 = v8;
      if (v6
        && (v10.unint64_t location = range2, (unint64_t)range2 < location)
        && (v10.NSUInteger length = *((void *)&range2 + 1), location < *((void *)&range2 + 1) + (void)range2))
      {
        v16.unint64_t location = location;
        v16.NSUInteger length = length;
        NSRange v11 = NSUnionRange(v16, v10);
      }
      else
      {
        v11.unint64_t location = location;
        v11.NSUInteger length = length;
      }
      if (!v9) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else
  {
    NSRange v14 = (NSRange)range2;
  }
  if (!v6 || ([v6 allowsEditing] & 1) != 0)
  {
    v11.unint64_t location = location;
    v11.NSUInteger length = length;
    goto LABEL_21;
  }
  v12.unint64_t location = range2;
  if ((unint64_t)range2 >= location
    || (v12.NSUInteger length = *((void *)&range2 + 1), location >= *((void *)&range2 + 1) + (void)range2))
  {
    v11.unint64_t location = location;
    v11.NSUInteger length = length;
  }
  else
  {
    v17.unint64_t location = location;
    v17.NSUInteger length = length;
    NSRange v11 = NSUnionRange(v17, v12);
  }
LABEL_18:
  v13.unint64_t location = v14.location;
  if (v14.location < v7)
  {
    v13.NSUInteger length = v14.length;
    if (v7 < v14.length + v14.location) {
      NSRange v11 = NSUnionRange(v11, v13);
    }
  }
LABEL_21:
  if (v11.location == location && v11.length == length)
  {
    v11.unint64_t location = location;
    v11.NSUInteger length = length;
  }
  return v11;
}

- (id)extendSelectionToIncludeSmartFields:(id)a3
{
  if (![a3 isValid]) {
    return a3;
  }
  uint64_t v5 = [a3 range];
  uint64_t v7 = v6;
  for (uint64_t i = [a3 range];
        ;
        uint64_t i = -[TSWPStorage textRangeForParagraphsInCharRange:](self, "textRangeForParagraphsInCharRange:", v12, v13))
  {
    uint64_t v10 = -[TSWPStorage p_extendRangeToIncludeSmartFields:](self, "p_extendRangeToIncludeSmartFields:", i, v9);
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    if (v10 == v5 && v11 == v7) {
      break;
    }
    uint64_t v7 = v11;
    uint64_t v5 = v10;
    if ([a3 type] != 2) {
      break;
    }
  }
  if (v5 == [a3 range] && v7 == v14) {
    return a3;
  }
  NSRange v16 = objc_msgSend(a3, "copyWithNewType:range:", 0, v12, v13);

  return v16;
}

- (id)editableSmartFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result = [(TSWPStorage *)self smartFieldAtCharIndex:a3 attributeKind:6 effectiveRange:0];
  if (result)
  {
    id v5 = result;
    if ([result allowsEditing]) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)addSmartField:(id)a3 toRange:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v12 = [a3 styleAttributeArrayKind];

  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, location, length, v12, a5, a6);
}

- (void)removeSmartField:(id)a3 fromRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = [a3 styleAttributeArrayKind];

  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, location, length, v9, 0, a5);
}

- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (self->_attributesTable[a3])
  {
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v16, self, a4.location, a4.length, *(uint64_t *)&a3);
    v15.NSUInteger location = 0;
    v15.NSUInteger length = 0;
    char v14 = 0;
    while (1)
    {
      uint64_t v10 = TSWPAttributeEnumerator::nextAttributeIndex(v16, &v15);
      if (!v10) {
        break;
      }
      if ((uint64_t v11 = *(void *)(v10 + 8),
            v17.NSUInteger location = location,
            v17.NSUInteger length = length,
            NSIntersectionRange(v17, v15).length)
        || a3 <= 0x12
        && ((1 << a3) & 0x40307) != 0
        && (NSUInteger v12 = v15.location, v12 == [(TSWPStorage *)self length])
        || !length && TSWPInsertionPointInRangeWithOptions(location, 0, v15.location, v15.length, 0))
      {
        (*((void (**)(id, uint64_t, NSUInteger, NSUInteger, char *))a5 + 2))(a5, v11, v15.location, v15.length, &v14);
        if (v14) {
          break;
        }
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v16);
  }
  else
  {
    LOBYTE(v16[0]) = 0;
    v18.NSUInteger location = [(TSWPStorage *)self range];
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    NSRange v13 = NSIntersectionRange(v18, v19);
    (*((void (**)(id, void, NSUInteger, NSUInteger, id *))a5 + 2))(a5, 0, v13.location, v13.length, v16);
  }
}

uint64_t __74__TSWPStorage_smartFieldsWithAttributeKind_intersectingRange_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7 || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a5), result))
  {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF980] array];
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    return [v9 addObject:a2];
  }
  return result;
}

- (void)smartFieldDidChange:(id)a3
{
  if ((TSWPStorage *)[a3 parentStorage] != self)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage smartFieldDidChange:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5439, @"smart field doesn't belong to this storage");
  }
  uint64_t v8 = [a3 range];

  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v8, v7, 0, 0);
}

- (void)autoUpdateField:(id)a3 withRange:(_NSRange)a4 documentRoot:(id)a5 returningInsertedRange:(_NSRange *)a6
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.location, a4.length, a5, a6);
  uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStorage autoUpdateField:withRange:documentRoot:returningInsertedRange:]"];
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v6 handleFailureInFunction:v7 file:v8 lineNumber:5448 description:@"unimplemented"];
}

- (void)autoUpdateSmartFieldsWithDocumentRoot:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorage autoUpdateSmartFieldsWithDocumentRoot:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:5455 description:@"unimplemented"];
}

- (void)addGlyphVariantData:(id)a3 toRange:(_NSRange)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4.location, a4.length);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPStorage addGlyphVariantData:toRange:]"];
  uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v4 handleFailureInFunction:v5 file:v6 lineNumber:5463 description:@"unimplemented"];
}

- (void)removeGlyphVariantDataFromRange:(_NSRange)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.location, a3.length);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorage removeGlyphVariantDataFromRange:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:5470 description:@"unimplemented"];
}

- (id)glyphVariantDataAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPStorage glyphVariantDataAtCharIndex:effectiveRange:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5476, @"unimplemented");
  return 0;
}

- (void)fixGlyphVariantFontsForRange:(_NSRange)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3.location, a3.length);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorage fixGlyphVariantFontsForRange:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:5483 description:@"unimplemented"];
}

- (id)fontNameAtCharIndex:(unint64_t)a3 size:(double *)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  uint64_t v7 = [(TSWPStorage *)self createFontAtCharIndex:a3 scaleTextPercent:100 effectiveRange:a5 styleProvider:a6];
  uint64_t v8 = (__CFString *)CTFontCopyPostScriptName(v7);
  if (a4) {
    *a4 = CTFontGetSize(v7);
  }
  CFRelease(v7);

  return v8;
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)textIsVertical
{
  NSUInteger v2 = (void *)TSUProtocolCast();

  return [v2 textIsVertical];
}

- (int64_t)contentWritingDirection
{
  NSUInteger v2 = (void *)TSUProtocolCast();
  if (!v2) {
    return -1;
  }

  return [v2 contentWritingDirection];
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPStorage setGeometry:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:5537 description:@"can't set geometry on a storage"];
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->_parentInfo == a3) {
    self->_parentInfo = 0;
  }
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return self->_owningAttachment;
}

- (BOOL)isFloatingAboveText
{
  return 0;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  NSUInteger v2 = [(TSWPStorage *)self parentInfo];

  return [(TSDContainerInfo *)v2 isThemeContent];
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5 = [(TSWPStorage *)self range];
  uint64_t v7 = v6;
  uint64_t v8 = [(TSWPStorage *)self wpKind];

  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", v5, v7, a3, a3, 1, v8);
}

- (id)childInfos
{
  unint64_t v3 = [(TSWPStorage *)self attachmentCount];
  unint64_t v4 = [(TSWPStorage *)self footnoteCount];
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v4 + v3];
  uint64_t v6 = [(TSWPStorage *)self attributeArrayForKind:4];
  if (v6)
  {
    uint64_t v7 = v6;
    if (v6->var2)
    {
      unint64_t v8 = 0;
      uint64_t v9 = 8;
      do
      {
        objc_opt_class();
        uint64_t v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          uint64_t v11 = [v10 drawable];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        ++v8;
        v9 += 16;
      }
      while (v8 < v7->var2);
    }
  }
  NSUInteger v12 = [(TSWPStorage *)self attributeArrayForKind:5];
  if (v12)
  {
    NSRange v13 = v12;
    if (v12->var2)
    {
      unint64_t v14 = 0;
      uint64_t v15 = 8;
      do
      {
        objc_opt_class();
        NSRange v16 = (void *)TSUDynamicCast();
        if (v16)
        {
          uint64_t v17 = [v16 containedStorage];
          if (v17) {
            [v5 addObject:v17];
          }
        }
        ++v14;
        v15 += 16;
      }
      while (v14 < v13->var2);
    }
  }
  return v5;
}

- (id)childCommandForApplyThemeCommand:(id)a3
{
  return 0;
}

- (id)referencedStylesOfClass:(Class)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263EFF9C0] set];
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = 0;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = 2;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    uint64_t v8 = 3;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStorage referencedStylesOfClass:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5674, @"Unknown style class.");
      return v5;
    }
    uint64_t v8 = 9;
  }
  uint64_t v9 = [(TSWPStorage *)self attributeArrayForKind:v8];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t var2 = v9->var2;
    if (var2)
    {
      unint64_t v12 = 0;
      uint64_t v13 = 8;
      do
      {
        if (*(void *)((char *)v10->var4 + v13))
        {
          objc_msgSend(v5, "addObject:");
          unint64_t var2 = v10->var2;
        }
        ++v12;
        v13 += 16;
      }
      while (v12 < var2);
    }
  }
  return v5;
}

- (id)referencedStyles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  unint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v14, 4, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "unionSet:", -[TSWPStorage referencedStylesOfClass:](self, "referencedStylesOfClass:", *(void *)(*((void *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [&unk_26D739498 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&unk_26D739498);
        }
        uint64_t v9 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", [*(id *)(*((void *)&v11 + 1) + 8 * v8) unsignedIntegerValue]);
        if (v9)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __49__TSWPStorage_replaceReferencedStylesUsingBlock___block_invoke;
          v10[3] = &unk_2646B2F08;
          v10[4] = a3;
          v10[5] = v9;
          TSWPAttributeArray::enumerateObjectAttributes(v9, (uint64_t)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_26D739498 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __49__TSWPStorage_replaceReferencedStylesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v6 != a2)
    {
      uint64_t v7 = (objc_object *)v6;
      uint64_t v8 = *(TSWPAttributeArray **)(a1 + 40);
      TSWPAttributeArray::replaceObjectForAttributeIndex(v8, v7, a3, 0, 0);
    }
  }
}

- (BOOL)hasVisibleText
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(TSWPStorage *)self length];
  if (v3)
  {
    BOOL v4 = v3 > 8;
    if (v3 >= 8) {
      uint64_t v5 = 8;
    }
    else {
      uint64_t v5 = v3;
    }
    -[NSMutableString getCharacters:range:](self->_string, "getCharacters:range:", v21, 0, v5);
    for (uint64_t i = 0; i != v5; ++i)
    {
      while (1)
      {
        unsigned int v7 = (unsigned __int16)v21[i];
        if (v7 < 0x20) {
          break;
        }
        if (v7 < 0x7F) {
          goto LABEL_32;
        }
        BOOL v4 = 1;
        if (v5 - 1 == i++) {
          goto LABEL_14;
        }
      }
    }
    if (!v4)
    {
LABEL_31:
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_14:
    if (-[NSMutableString rangeOfCharacterFromSet:options:](self->_string, "rangeOfCharacterFromSet:options:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "invisibleCharacterSet"), "invertedSet"), 2) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_32:
      LOBYTE(v3) = 1;
      return v3;
    }
    unint64_t v9 = [(TSWPStorage *)self attachmentCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; v10 != j; ++j)
      {
        id v12 = [(TSWPStorage *)self attachmentAtAttachmentIndex:j outCharIndex:0];
        if (v12)
        {
          long long v13 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v14 = (void *)[v13 stringEquivalent];
            if (v14 && [v14 length]) {
              goto LABEL_32;
            }
          }
          else
          {
            objc_opt_class();
            uint64_t v15 = (void *)TSUDynamicCast();
            if (v15 && ![v15 isAnchored]) {
              goto LABEL_32;
            }
          }
        }
      }
    }
    unint64_t v3 = [(TSWPStorage *)self footnoteCount];
    if (v3)
    {
      unint64_t v16 = v3;
      uint64_t v17 = 0;
      while (1)
      {
        id v18 = [(TSWPStorage *)self footnoteAtFootnoteIndex:v17 outCharIndex:0];
        if (v18)
        {
          NSRange v19 = (void *)[v18 stringEquivalent];
          if (v19)
          {
            if ([v19 length]) {
              goto LABEL_32;
            }
          }
        }
        if (v16 == ++v17) {
          goto LABEL_31;
        }
      }
    }
  }
  return v3;
}

- (BOOL)p_hasGoodAttributesForPlainTextPaste
{
  unint64_t v3 = 0;
  BOOL v4 = 0;
  do
  {
    uint64_t v5 = [(TSWPStorage *)self attributeArrayForKind:dword_22383B164[v3] withCreate:0 undoTransaction:0];
    if (v5 && v5->var2) {
      break;
    }
    BOOL v4 = v3++ > 5;
  }
  while (v3 != 7);
  return v4;
}

- (BOOL)canPasteAsPlainText
{
  unint64_t v3 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:0 undoTransaction:0];
  if (v3 && v3->var2 > 1) {
    return 0;
  }

  return [(TSWPStorage *)self p_hasGoodAttributesForPlainTextPaste];
}

- (BOOL)canPasteAsPlainTextWithUniformParagraphs
{
  unint64_t v3 = [(TSWPStorage *)self attributeArrayForKind:0 withCreate:0 undoTransaction:0];
  if (v3)
  {
    unint64_t var2 = v3->var2;
    if (var2 >= 2)
    {
      var4 = v3->var4;
      uint64_t v6 = *((void *)var4 + 1);
      if (*((void *)var4 + 3) != v6) {
        return 0;
      }
      unsigned int v7 = (uint64_t *)((char *)var4 + 40);
      uint64_t v8 = 2;
      while (var2 != v8)
      {
        uint64_t v9 = *v7;
        v7 += 2;
        ++v8;
        if (v9 != v6)
        {
          if (v8 - 1 < var2) {
            return 0;
          }
          break;
        }
      }
    }
  }
  unint64_t v10 = [(TSWPStorage *)self attributeArrayForKind:18 withCreate:0 undoTransaction:0];
  if (v10 && v10->var2 > 1) {
    return 0;
  }

  return [(TSWPStorage *)self p_hasGoodAttributesForPlainTextPaste];
}

- (unint64_t)selectionRangeMaxForCharIndex:(unint64_t)a3
{
  uint64_t v3 = [(TSWPStorage *)self selectionRangeForCharIndex:a3];
  return v3 + v4;
}

- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5
{
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:", a3.location, a3.length, a4, a4, *(void *)&a5);
}

- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v12 = [(TSWPStorage *)self wpKind];

  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", location, length, a4, a5, v6, v12);
}

- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5 kind:(int)a6
{
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", a3.location, a3.length, a4, a4, *(void *)&a5, *(void *)&a6);
}

- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6 kind:(int)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length) {
    uint64_t v26 = -[NSMutableString substringWithRange:](self->_string, "substringWithRange:", a3.location, a3.length);
  }
  else {
    uint64_t v26 = 0;
  }
  id v12 = [(TSWPStorage *)self paragraphStyleAtCharIndex:location effectiveRange:0];
  id v13 = [(TSWPStorage *)self listStyleAtCharIndex:location effectiveRange:0];
  id v14 = [(TSWPStorage *)self columnStyleAtCharIndex:location effectiveRange:0];
  int v15 = [(TSWPStorage *)self writingDirectionForParagraphAtCharIndex:location];
  id v16 = 0;
  uint64_t v31 = 0;
  unsigned __int16 v30 = 0;
  if ((a6 & 4) != 0)
  {
    if ([(TSWPStorage *)self supportsSections] && [(TSWPStorage *)self sectionCount]) {
      id v16 = (id)objc_msgSend(-[TSWPStorage sectionAtCharIndex:effectiveRange:](self, "sectionAtCharIndex:effectiveRange:", location, 0), "copyWithContext:", a4);
    }
    else {
      id v16 = 0;
    }
  }
  [(TSWPStorage *)self paragraphFlags:&v30 andLevel:&v31 atCharIndex:location];
  unint64_t v27 = [(TSWPStorage *)self listStartAtCharIndex:location];
  LODWORD(v25) = v15;
  uint64_t v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContext:a4 string:v26 kind:a7 stylesheet:self->_stylesheet paragraphStyle:v12 listStyle:v13 section:v16 columnStyle:v14 paragraphDirection:v25];
  objc_msgSend(v17, "setParagraphFlags:level:forCharRange:undoTransaction:", v30, v31, 0, objc_msgSend(v17, "length"), 0);
  if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v17, "setListStart:forCharRange:undoTransaction:", v27, 0, objc_msgSend(v17, "length"), 0);
  }
  if ([v17 supportsSections] && objc_msgSend(v17, "sectionCount")) {
    id v16 = (id)[v17 sectionAtSectionIndex:0 effectiveRange:0];
  }
  [v17 filterSectionBreaksFromStorage:v17 undoTransaction:0];
  id v18 = 0;
  if ((a6 & 8) != 0) {
    id v18 = +[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext];
  }
  uint64_t v19 = 0;
  do
  {
    uint64_t v20 = [(TSWPStorage *)self attributeArrayForKind:v19];
    if (v20)
    {
      LODWORD(v24) = a6;
      -[TSWPStorage transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:](self, "transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:", v20, location, length, v17, a5, v18, v24);
    }
    uint64_t v19 = (v19 + 1);
  }
  while (v19 != 19);
  if ([v17 supportsSections])
  {
    if (!v16) {
      id v16 = (id)objc_msgSend(v17, "pDefaultSectionForContext:", objc_msgSend(v17, "context"));
    }
    if ([v17 sectionCount])
    {
      if (v16)
      {
LABEL_25:
        objc_msgSend(v16, "i_ensureHeaderFooterStoragesExistWithStylesheet:", -[TSWPStorage stylesheet](self, "stylesheet"));
        goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(v17, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", v16, 0, objc_msgSend(v17, "attributeArrayForKind:withCreate:undoTransaction:", 8, 1, 0), 0, v18, 0);
      if (v16) {
        goto LABEL_25;
      }
    }
    uint64_t v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v22 = [NSString stringWithUTF8String:"-[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:]"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 6123, @"No default section in storage.");
  }
LABEL_28:

  return v17;
}

- (int)compareRange:(_NSRange)a3 otherStorage:(id)a4 otherRange:(_NSRange)a5 options:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v10 = a3.length;
  NSUInteger v11 = a3.location;
  uint64_t v13 = [a4 range];
  uint64_t v15 = v14;
  id v16 = (void *)[a4 string];
  uint64_t v17 = (uint64_t)v16;
  if (location != v13 || length != v15) {
    uint64_t v17 = objc_msgSend(v16, "substringWithRange:", location, length);
  }
  int result = -[NSMutableString compare:options:range:](self->_string, "compare:options:range:", v17, a6, v11, v10);
  if (!result)
  {
    uint64_t v19 = 0;
    while (1)
    {
      if (v19 < 0xA || v19 <= 0x12 && ((1 << v19) & 0x43800) != 0)
      {
        uint64_t v20 = [(TSWPStorage *)self attributeArrayForKind:v19];
        if (v20)
        {
          int result = -[TSWPStorage compareAttributeArray:range:otherStorage:otherRange:](self, "compareAttributeArray:range:otherStorage:otherRange:", v20, v11, v10, a4, location, length);
          if (result) {
            break;
          }
        }
      }
      uint64_t v19 = (v19 + 1);
      if (v19 == 19) {
        return 0;
      }
    }
  }
  return result;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ Text: '", -[TSWPStorage description](self, "description")];
  [v3 appendString:self->_string];
  [v3 appendString:@"'\n"];
  [v3 appendString:@"Attribute tables:\n"];
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = [(TSWPStorage *)self attributeArrayForKind:v4];
    if (v5) {
      uint64_t v6 = (void *)(*((uint64_t (**)(TSWPAttributeArray *))v5->var0 + 17))(v5);
    }
    else {
      uint64_t v6 = 0;
    }
    if ([v6 length]) {
      [v3 appendString:v6];
    }
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 19);

  return (NSString *)v3;
}

- (NSString)description
{
  uint64_t WPKind = self->_WPKind;
  if ((int)WPKind > 7) {
    uint64_t v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"*#$! Unknown WP kind: %d", WPKind);
  }
  else {
    uint64_t v4 = -[TSWPStorage description]::kinds[WPKind];
  }
  return (NSString *)[NSString stringWithFormat:@"(%@*) %p (length:%lu) kind: %@", objc_opt_class(), self, -[TSWPStorage characterCount](self, "characterCount"), v4];
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)setParentInfo:(id)a3
{
  self->_parentInfo = (TSDContainerInfo *)a3;
}

- (TSDOwningAttachment)owningAttachment
{
  return self->_owningAttachment;
}

- (void)setOwningAttachment:(id)a3
{
  self->_owningAttachment = (TSDOwningAttachment *)a3;
}

- (BOOL)ignoreContentsChangedNotifications
{
  return self->_ignoreContentsChangedNotifications;
}

- (void)setIgnoreContentsChangedNotifications:(BOOL)a3
{
  self->_ignoreContentsChangedNotifications = a3;
}

- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 attributeKind:(unsigned int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  id v11 = [(TSWPStorage *)self smartFieldAtCharIndex:a3 attributeKind:*(void *)&a5 effectiveRange:&v16];
  if (v11 && a3 > v16)
  {
    uint64_t v12 = v17 + v16;
    if (a3 - v16 != v17 && v12 != a3)
    {
      uint64_t v14 = v12 - a3;
      uint64_t v15 = objc_msgSend(v11, "copyWithContext:", -[TSPObject context](self, "context"));
      -[TSWPStorage addSmartField:toRange:dolcContext:undoTransaction:](self, "addSmartField:toRange:dolcContext:undoTransaction:", v15, a3, v14, a6, a7);
    }
  }
}

- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  [(TSWPStorage *)self splitSmartFieldAtCharIndex:a3 lengthToInsert:a4 attributeKind:6 dolcContext:a5 undoTransaction:a6];

  [(TSWPStorage *)self splitSmartFieldAtCharIndex:a3 lengthToInsert:a4 attributeKind:12 dolcContext:a5 undoTransaction:a6];
}

- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  id v11 = [(TSWPStorage *)self characterStyleAtCharIndex:a3 left:0 effectiveRange:0];
  uint64_t v12 = objc_msgSend(a6, "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3), a5);

  return TSWPFastCreateFontForStyle((uint64_t)v11, v12, a4);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 options:(unint64_t)a5 changedRange:(_NSRange *)a6 changeDelta:(int64_t *)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a4) {
    uint64_t v14 = (__CFString *)a4;
  }
  else {
    uint64_t v14 = &stru_26D688A48;
  }
  uint64_t v15 = (void *)-[__CFString stringByCapitalizingToMatchString:range:searchOptions:](v14, "stringByCapitalizingToMatchString:range:searchOptions:", [(TSWPStorage *)self string], a3.location, a3.length, a5);
  unint64_t v16 = [(TSWPStorage *)self length];
  [(TSWPStorage *)self replaceCharactersInSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length) withString:v15 withFlags:1 replaceTextData:0 changeSession:a9 undoTransaction:a8 outInsertedRange:0];
  if (a7) {
    *a7 = [(TSWPStorage *)self length] - v16;
  }
  if (a6)
  {
    a6->NSUInteger location = location;
    a6->NSUInteger length = [v15 length];
  }
}

- (id)valueForBIUProperties:(id)a3 selection:(id)a4 insertionStyle:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)[MEMORY[0x263F089C8] indexSet];
  uint64_t v10 = [a4 superRange];
  id v11 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", v10, [a4 isInsertionPoint], 0);
  id v12 = [(TSWPStorage *)self paragraphStyleAtCharIndex:v10 effectiveRange:0];
  if (a5) {
    unint64_t v13 = 3;
  }
  else {
    unint64_t v13 = 2;
  }
  uint64_t v14 = (id *)((char *)&v30 - ((8 * (_BYTE)v13 + 15) & 0x30));
  if (a5)
  {
    v14[2] = v12;
  }
  else
  {
    a5 = v11;
    id v11 = v12;
  }
  *uint64_t v14 = a5;
  v14[1] = v11;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(a3);
        }
        int v20 = [*(id *)(*((void *)&v30 + 1) + 8 * v19) unsignedIntValue];
        int v21 = 8226;
        uint64_t v22 = 19;
        switch(v20)
        {
          case 0:
            goto LABEL_25;
          case 1:
            uint64_t v22 = 20;
            goto LABEL_25;
          case 2:
          case 6:
            int v23 = TSWPResolveIntPropertyForStyles((uint64_t)&v30 - ((8 * (_BYTE)v13 + 15) & 0x30), v13, 22, 0x80000000);
            if ((v23 & 0x7FFFFFFF) == 0) {
              break;
            }
            if ((v20 != 2 || v23 != 1) && (v20 != 6 || v23 != 3)) {
              break;
            }
            goto LABEL_26;
          case 3:
            uint64_t v22 = 26;
LABEL_25:
            if ((TSWPResolveIntPropertyForStyles((uint64_t)&v30 - ((8 * (_BYTE)v13 + 15) & 0x30), v13, v22, 0x80000000) & 0x7FFFFFFF) != 0)goto LABEL_26; {
            break;
            }
          case 4:
            goto LABEL_30;
          case 5:
            int v21 = 65093;
LABEL_30:
            uint64_t v26 = (void *)TSWPResolvePropertyForStyles((uint64_t)&v30 - ((8 * (_BYTE)v13 + 15) & 0x30), v13, 45, 1);
            if ([v26 length] == 1) {
              int v27 = [v26 characterAtIndex:0];
            }
            else {
              int v27 = 0;
            }
            if (v21 == v27) {
LABEL_26:
            }
              [v9 addIndex:v17 + v19];
            break;
          default:
            break;
        }
        ++v19;
      }
      while (v16 != v19);
      uint64_t v28 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v16 = v28;
      v17 += v19;
    }
    while (v28);
  }
  return v9;
}

- (BOOL)p_passesExtraTablesChecksForStoringInAStringValueCell
{
  if ([(TSWPStorage *)self paragraphLevelAtCharIndex:0]
    || [(TSWPStorage *)self listStyleCount] > 1)
  {
    return 0;
  }
  if ([(TSWPStorage *)self listStyleCount])
  {
    id v4 = [(TSWPStorage *)self listStyleAtCharIndex:0 effectiveRange:0];
    if (v4) {
      return [v4 firstLabelType] == 0;
    }
  }
  return 1;
}

- (BOOL)canBeStoredInAStringValueCell
{
  BOOL v3 = [(TSWPStorage *)self canPasteAsPlainTextWithUniformParagraphs];
  if (v3)
  {
    LOBYTE(v3) = [(TSWPStorage *)self p_passesExtraTablesChecksForStoringInAStringValueCell];
  }
  return v3;
}

- (id)valueForBIUProperties:(id)a3
{
  uint64_t v5 = [TSWPSelection alloc];
  uint64_t v6 = [(TSWPStorage *)self range];
  uint64_t v8 = -[TSWPSelection initWithRange:](v5, "initWithRange:", v6, v7);
  id v9 = [(TSWPStorage *)self valueForBIUProperties:a3 selection:v8 insertionStyle:0];

  return v9;
}

- (_NSRange)rangeForChange:(id)a3
{
  v12.NSUInteger length = [(TSWPStorage *)self length];
  v12.NSUInteger location = 0;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v10, self, v12);
  while (1)
  {
    if (!TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v10))
    {
      NSUInteger v5 = 0;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    if (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v10) == a3) {
      break;
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v10);
  }
  uint64_t v6 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v10);
  NSUInteger v5 = v7;
LABEL_7:
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v10);
  NSUInteger v8 = v6;
  NSUInteger v9 = v5;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)changeAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v6 = self->_attributesTable[a4];
  if (!v6 || !v6->var2)
  {
    if (a5)
    {
      NSUInteger v9 = [(TSWPStorage *)self range];
      goto LABEL_8;
    }
    return 0;
  }
  unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(self->_attributesTable[a4], a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = (void *)*((void *)v6->var4 + 2 * v7 + 1);
    if (!a5) {
      return v10;
    }
    NSUInteger v9 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
    goto LABEL_9;
  }
  if (!a5) {
    return 0;
  }
  NSUInteger v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, 0);
  NSUInteger v9 = 0;
LABEL_8:
  uint64_t v10 = 0;
LABEL_9:
  a5->NSUInteger location = v9;
  a5->NSUInteger length = v8;
  return v10;
}

- (id)changeAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id result = [(TSWPStorage *)self changeAtCharIndex:a3 attributeKind:15 effectiveRange:a4];
  if (!result)
  {
    return [(TSWPStorage *)self changeAtCharIndex:a3 attributeKind:16 effectiveRange:a4];
  }
  return result;
}

- (TSWPRangeVector)deletedRangeVectorInRange:(SEL)a3
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, a4);
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21))
  {
    if (TSWPChangeEnumerator::changeIsDeletion((TSWPChangeEnumerator *)v21))
    {
      v22.NSUInteger location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
      v23.NSUInteger location = location;
      v23.NSUInteger length = length;
      NSRange v8 = NSIntersectionRange(v22, v23);
      if (v8.length)
      {
        end = retstr->__end_;
        value = retstr->__end_cap_.__value_;
        if (end >= value)
        {
          begin = retstr->__begin_;
          uint64_t v13 = end - retstr->__begin_;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            abort();
          }
          uint64_t v15 = (char *)value - (char *)begin;
          if (v15 >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            uint64_t v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)p_end_cap, v16);
            begin = retstr->__begin_;
            end = retstr->__end_;
          }
          else
          {
            uint64_t v17 = 0;
          }
          uint64_t v18 = (NSRange *)&v17[16 * v13];
          *uint64_t v18 = v8;
          uint64_t v19 = v18;
          if (end != begin)
          {
            do
            {
              v19[-1] = end[-1];
              --v19;
              --end;
            }
            while (end != begin);
            begin = retstr->__begin_;
          }
          id v11 = v18 + 1;
          retstr->__begin_ = v19;
          retstr->__end_ = v18 + 1;
          retstr->__end_cap_.__value_ = (_NSRange *)&v17[16 * v16];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          _NSRange *end = v8;
          id v11 = end + 1;
        }
        retstr->__end_ = v11;
      }
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v21);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  return result;
}

- (id)deletedRangesInRange:(_NSRange)a3
{
  if (!self) {
    return 0;
  }
  -[TSWPStorage deletedRangeVectorInRange:](self, "deletedRangeVectorInRange:", a3.location, a3.length);
  BOOL v3 = v6;
  if (v7 != v6)
  {
    id v4 = [[TSWPRangeArray alloc] initWithRangeVector:&v6];
    BOOL v3 = v6;
    if (!v6) {
      return v4;
    }
    goto LABEL_7;
  }
  id v4 = 0;
  if (v6)
  {
LABEL_7:
    unint64_t v7 = v3;
    operator delete(v3);
  }
  return v4;
}

- (id)hiddenRangesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v8, self, a3);
  NSUInteger v5 = 0;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v8))
  {
    if (TSWPChangeEnumerator::changeIsHidden((TSWPChangeEnumerator *)v8))
    {
      v9.NSUInteger location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v8);
      v10.NSUInteger location = location;
      v10.NSUInteger length = length;
      NSRange v6 = NSIntersectionRange(v9, v10);
      if (v6.length)
      {
        if (!v5) {
          NSUInteger v5 = objc_alloc_init(TSWPRangeArray);
        }
        -[TSWPRangeArray addRange:](v5, "addRange:", v6.location, v6.length);
      }
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v8);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v8);
  return v5;
}

- (id)visibleRangesInRange:(_NSRange)a3
{
  _NSRange v10 = a3;
  TSWPRangeVector::TSWPRangeVector(&v9, &v10);
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v8, self, v10);
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v8))
  {
    if (TSWPChangeEnumerator::changeIsHidden((TSWPChangeEnumerator *)v8))
    {
      v7.NSUInteger location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v8);
      v7.NSUInteger length = v4;
      TSWPRangeVector::removeRange(&v9, &v7);
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v8);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v8);
  NSUInteger v5 = [[TSWPRangeArray alloc] initWithRangeVector:&v9];
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }
  return v5;
}

- (BOOL)p_hasDeletedTextAtCharIndex:(unint64_t)a3 requireHidden:(BOOL)a4 range:(_NSRange *)a5
{
  BOOL v6 = a4;
  NSRange v8 = [(TSWPStorage *)self deletionChangesTable];
  if (v8)
  {
    TSWPRangeVector v9 = (TSWPAttributeArray *)v8;
    unint64_t v10 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)v8, a3);
    if (v10 > 0x7FFFFFFFFFFFFFFELL)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      unint64_t v11 = v10;
      NSRange v8 = (TSWPChangeAttributeArray *)*((void *)v9->var4 + 2 * v10 + 1);
      if (v8)
      {
        if (!v6 || (LODWORD(v8) = [(TSWPChangeAttributeArray *)v8 isHidden], v8))
        {
          NSUInteger v13 = TSWPAttributeArray::rangeForAttributeIndex(v9, v11);
          LODWORD(v8) = a3 >= v13 && a3 - v13 < v12;
          if (a5 && v8)
          {
            a5->NSUInteger location = v13;
            a5->NSUInteger length = v12;
            LOBYTE(v8) = 1;
          }
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3
{
  return [(TSWPStorage *)self p_hasDeletedTextAtCharIndex:a3 requireHidden:1 range:0];
}

- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  return [(TSWPStorage *)self p_hasDeletedTextAtCharIndex:a3 requireHidden:1 range:a4];
}

- (BOOL)hasDeletedTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  return [(TSWPStorage *)self p_hasDeletedTextAtCharIndex:a3 requireHidden:0 range:a4];
}

- (BOOL)hasVisibleTextAtCharIndex:(unint64_t)a3
{
  return ![(TSWPStorage *)self hasHiddenTextAtCharIndex:a3];
}

- (unint64_t)p_indexOfFirstNonDeletedCharInRange:(_NSRange)a3 requireVisible:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger location = a3.location;
  _NSRange v17 = a3;
  BOOL v6 = [(TSWPStorage *)self deletionChangesTable];
  if (v6)
  {
    _NSRange v7 = (TSWPAttributeArray *)v6;
    TSWPAttributeArray::begin((TSWPAttributeArray *)v6, &v17, &v15);
    TSWPAttributeArray::end(v7, &v17, &v13);
    unint64_t v8 = v16;
    uint64_t v9 = v14;
    if (v16 != v14)
    {
      while (1)
      {
        unint64_t v10 = v15;
        if (!*((void *)v15->var4 + 2 * v8 + 1)) {
          break;
        }
        if (v4)
        {
          if (([*((id *)v15->var4 + 2 * v8 + 1) isHidden] & 1) == 0)
          {
            unint64_t v10 = v15;
            unint64_t v8 = v16;
            break;
          }
          unint64_t v8 = v16;
          uint64_t v9 = v14;
        }
        unint64_t v16 = ++v8;
        if (v8 == v9) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      NSUInteger v11 = v17.location;
      if (v11 <= TSWPAttributeArray::rangeForAttributeIndex(v10, v8)) {
        return TSWPAttributeArray::rangeForAttributeIndex(v15, v16);
      }
      else {
        return v17.location;
      }
    }
  }
  return location;
}

- (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3
{
  return -[TSWPStorage p_indexOfFirstNonDeletedCharInRange:requireVisible:](self, "p_indexOfFirstNonDeletedCharInRange:requireVisible:", a3.location, a3.length, 1);
}

- (unint64_t)indexOfFirstNonDeletedCharInRange:(_NSRange)a3
{
  return -[TSWPStorage p_indexOfFirstNonDeletedCharInRange:requireVisible:](self, "p_indexOfFirstNonDeletedCharInRange:requireVisible:", a3.location, a3.length, 0);
}

- (unint64_t)indexAfterLastVisibleCharInRange:(_NSRange)a3
{
  _NSRange v16 = a3;
  unint64_t v3 = a3.length + a3.location;
  BOOL v4 = [(TSWPStorage *)self deletionChangesTable];
  if (v4)
  {
    NSUInteger v5 = (TSWPAttributeArray *)v4;
    TSWPAttributeArray::end((TSWPAttributeArray *)v4, &v16, &v14);
    TSWPAttributeArray::begin(v5, &v16, &v12);
    unint64_t v6 = v15;
    if (v15 != v13)
    {
      while (1)
      {
        if (v6)
        {
          unint64_t v7 = v6 - 1;
          unint64_t v15 = v6 - 1;
        }
        else
        {
          unint64_t v7 = 0;
        }
        unint64_t v8 = v14;
        if (!*((void *)v14->var4 + 2 * v7 + 1)) {
          break;
        }
        if (([*((id *)v14->var4 + 2 * v7 + 1) isHidden] & 1) == 0)
        {
          unint64_t v8 = v14;
          unint64_t v7 = v15;
          break;
        }
        unint64_t v6 = v15;
        if (v15 == v13) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      unint64_t v3 = v16.length + v16.location;
      uint64_t v9 = TSWPAttributeArray::rangeForAttributeIndex(v8, v7);
      if (v9 + v10 < v3) {
        return v9 + v10;
      }
    }
  }
  return v3;
}

- (BOOL)hasDeletionInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(TSWPStorage *)self deletionChangesTable];
  if (v5)
  {
    unint64_t v6 = (TSWPAttributeArray *)v5;
    unint64_t v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)v5, location);
    if (*((void *)v6->var4 + 2 * v7 + 1))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      unint64_t v8 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
      LOBYTE(v5) = v8 > location || v8 + v9 < location + length;
    }
  }
  return (char)v5;
}

- (void)applyChange:(id)a3 changeRange:(_NSRange)a4 accept:(BOOL)a5 undoTransaction:(void *)a6
{
  BOOL v7 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (([a3 isInsertion] & 1) == 0 && (objc_msgSend(a3, "isDeletion") & 1) == 0)
  {
    NSUInteger v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) applyChange:changeRange:accept:undoTransaction:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 361, @"unknown change kind");
  }
  if (([a3 isInsertion] & 1) != 0 || objc_msgSend(a3, "isDeletion"))
  {
    if ([a3 isInsertion]) {
      uint64_t v14 = 15;
    }
    else {
      uint64_t v14 = 16;
    }
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, location, length, v14, 0, a6);
    if (v7)
    {
      if (([a3 isInsertion] & 1) != 0 || (objc_msgSend(a3, "isDeletion") & 1) == 0) {
        return;
      }
    }
    else if (([a3 isDeletion] & 1) != 0 || !objc_msgSend(a3, "isInsertion"))
    {
      return;
    }
    -[TSWPStorage deleteRange:undoTransaction:](self, "deleteRange:undoTransaction:", location, length, a6);
  }
}

- (void)applyChanges:(BOOL)a3 inRange:(_NSRange)a4 inSelectionRange:(_NSRange)a5 outChangedRange:(_NSRange *)a6 outSelectionRange:(_NSRange *)a7 undoTransaction:(void *)a8 forceAll:(BOOL)a9
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v11 = a4.length;
  NSUInteger v12 = a4.location;
  BOOL v13 = a3;
  uint64_t v72 = *MEMORY[0x263EF8340];
  *a6 = a4;
  *a7 = a5;
  uint64_t v49 = a7;
  NSUInteger v15 = *MEMORY[0x263F7C7C8];
  NSUInteger v16 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  _NSRange v17 = objc_opt_new();
  v81.NSUInteger location = v12;
  v81.NSUInteger length = v11;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v69, self, v81);
  int64_t v53 = 0;
  NSRange v55 = 0;
  *(_DWORD *)&v58[8] = 0;
  uint64_t v59 = 0;
  *(void *)id v58 = a9;
  NSUInteger range2 = length;
  NSUInteger v57 = location + length;
  NSUInteger v51 = v16;
  NSUInteger v52 = v15;
  NSUInteger range1 = v16;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v69))
  {
    NSUInteger v18 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v69);
    NSUInteger v20 = v19;
    v82.NSUInteger location = v18;
    v82.NSUInteger length = v19;
    *a6 = NSUnionRange(*a6, v82);
    int v21 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v69);
    NSRange v22 = v21;
    if (v13)
    {
      if (([v21 isDeletion] & 1) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      v73.NSUInteger location = v18;
      v73.NSUInteger length = v20;
      v83.NSUInteger location = 0;
      v83.NSUInteger length = location;
      NSUInteger v23 = NSIntersectionRange(v73, v83).length;
      v74.NSUInteger location = v18;
      v74.NSUInteger length = v20;
      v84.NSUInteger location = location;
      v84.NSUInteger length = range2;
      v59 -= v23;
      *(void *)&v58[4] -= NSIntersectionRange(v74, v84).length;
      goto LABEL_8;
    }
    if ([v21 isInsertion]) {
      goto LABEL_7;
    }
LABEL_8:
    if (!a9 && v18 <= location && v18 + v20 >= v57)
    {
      if ([v22 isDeletion])
      {
        NSRange v55 = v22;
        NSUInteger v15 = v18;
        NSUInteger range1 = v20;
      }
      else if ([v22 isInsertion])
      {
        int64_t v53 = v22;
        NSUInteger v51 = v20;
        NSUInteger v52 = v18;
      }
    }
    objc_msgSend(v17, "addObject:", v22, v49);
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v69);
  }
  if (v55)
  {
    a6->NSUInteger location = v15;
    a6->NSUInteger length = range1;
    if (v13)
    {
      v75.NSUInteger location = v15;
      v75.NSUInteger length = range1;
      v85.NSUInteger location = 0;
      v85.NSUInteger length = location;
      NSUInteger v24 = NSIntersectionRange(v75, v85).length;
      v76.NSUInteger location = v15;
      v76.NSUInteger length = range1;
      v86.NSUInteger location = location;
      v86.NSUInteger length = range2;
      uint64_t v59 = -(uint64_t)v24;
      *(void *)&v58[4] = -(uint64_t)NSIntersectionRange(v76, v86).length;
    }
    else
    {
      *(void *)&v58[4] = 0;
      uint64_t v59 = 0;
    }
    objc_msgSend(v17, "removeAllObjects", v49);
    [v17 addObject:v55];
  }
  else if (v53)
  {
    a6->NSUInteger location = v52;
    a6->NSUInteger length = v51;
    if (v13)
    {
      *(void *)&v58[4] = 0;
      uint64_t v59 = 0;
    }
    else
    {
      v77.NSUInteger location = v52;
      v77.NSUInteger length = v51;
      v87.NSUInteger location = 0;
      v87.NSUInteger length = location;
      NSUInteger v25 = NSIntersectionRange(v77, v87).length;
      v78.NSUInteger location = v52;
      v78.NSUInteger length = v51;
      v88.NSUInteger location = location;
      v88.NSUInteger length = range2;
      uint64_t v59 = -(uint64_t)v25;
      *(void *)&v58[4] = -(uint64_t)NSIntersectionRange(v78, v88).length;
    }
    objc_msgSend(v17, "removeAllObjects", v49);
    [v17 addObject:v53];
  }

  if (v49->location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v26 = v49->length + *(void *)&v58[4];
    v49->location += v59;
    v49->NSUInteger length = v26;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v71, 16, v49);
  if (v27)
  {
    uint64_t v28 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v66 != v28) {
          objc_enumerationMutation(v17);
        }
        long long v30 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v30 isInsertion])
        {
          uint64_t v31 = [(TSWPStorage *)self rangeForChange:v30];
          -[TSWPStorage applyChange:changeRange:accept:undoTransaction:](self, "applyChange:changeRange:accept:undoTransaction:", v30, v31, v32, v13, a8);
        }
      }
      uint64_t v27 = [v17 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v27);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v33 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v62 != v34) {
          objc_enumerationMutation(v17);
        }
        uint64_t v36 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        if ([v36 isDeletion])
        {
          unint64_t v38 = [(TSWPStorage *)self rangeForChange:v36];
          if (v38 <= 0x7FFFFFFFFFFFFFFELL) {
            -[TSWPStorage applyChange:changeRange:accept:undoTransaction:](self, "applyChange:changeRange:accept:undoTransaction:", v36, v38, v37, v13, a8);
          }
        }
      }
      uint64_t v33 = [v17 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v33);
  }
  if (*v50 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v40 = v50[1];
    NSUInteger v39 = *v50;
    if (v40 + v39 > [(TSWPStorage *)self length])
    {
      NSUInteger v41 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v42 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:]"];
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 491, @"bad selection range");
      NSUInteger v43 = *v50;
      NSUInteger v44 = v50[1];
      v89.NSUInteger location = [(TSWPStorage *)self range];
      v89.NSUInteger length = v45;
      v79.NSUInteger location = v43;
      v79.NSUInteger length = v44;
      *(NSRange *)int v50 = NSIntersectionRange(v79, v89);
    }
  }
  NSUInteger v46 = a6->location;
  if (a6->location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v47 = a6->length;
    v90.NSUInteger location = [(TSWPStorage *)self range];
    v90.NSUInteger length = v48;
    v80.NSUInteger location = v46;
    v80.NSUInteger length = v47;
    *a6 = NSIntersectionRange(v80, v90);
  }

  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v69);
}

- (id)nextChangeFromCharIndex:(unint64_t)a3 afterChange:(id)a4 changeRange:(_NSRange *)a5
{
  NSUInteger v9 = [(TSWPStorage *)self length];
  if (v9 <= a3) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v9 >= a3) {
    v11.NSUInteger location = a3;
  }
  else {
    v11.NSUInteger location = v9;
  }
  v11.NSUInteger length = v10 - v11.location;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, v11);
  NSUInteger v12 = 0;
  BOOL v13 = 0;
  NSUInteger v14 = 0x7FFFFFFFFFFFFFFFLL;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21))
  {
    BOOL v15 = !a4 || v13 == a4;
    BOOL v16 = !v15;
    BOOL v13 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21);
    NSUInteger v14 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
    NSUInteger v12 = v17;
    if (!v16) {
      break;
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v21);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  if (v13 == a4)
  {
    v22.NSUInteger location = [(TSWPStorage *)self range];
    v22.NSUInteger length = v18;
    TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, v22);
    BOOL v13 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21);
    NSUInteger v14 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
    NSUInteger v12 = v19;
    TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  }
  if (a5)
  {
    a5->NSUInteger location = v14;
    a5->NSUInteger length = v12;
  }
  return v13;
}

- (id)previousChangeFromCharIndex:(unint64_t)a3 beforeChange:(id)a4 changeRange:(_NSRange *)a5
{
  v21.NSUInteger location = 0;
  v21.NSUInteger length = a3;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v20, self, v21);
  NSUInteger v9 = 0;
  unint64_t v10 = 0;
  NSUInteger v11 = 0x7FFFFFFFFFFFFFFFLL;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20))
  {
    NSUInteger v12 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20);
    unint64_t v13 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v20);
    if (v12 == a4) {
      break;
    }
    NSUInteger v15 = v13;
    if (v13 > a3) {
      break;
    }
    NSUInteger v16 = v14;
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v20);
    NSUInteger v9 = v16;
    NSUInteger v11 = v15;
    unint64_t v10 = v12;
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v20);
  if (!v10)
  {
    v22.NSUInteger location = [(TSWPStorage *)self range];
    v22.NSUInteger length = v17;
    TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v20, self, v22);
    while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20))
    {
      unint64_t v10 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20);
      NSUInteger v11 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v20);
      NSUInteger v9 = v18;
      TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v20);
    }
    TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v20);
  }
  if (a5)
  {
    a5->NSUInteger location = v11;
    a5->NSUInteger length = v9;
  }
  return v10;
}

- (id)changeDetailsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if ([(TSWPStorage *)self range] > a3 || (uint64_t v7 = [(TSWPStorage *)self range], v7 + v8 < a3))
  {
    NSUInteger v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) changeDetailsAtCharIndex:outRange:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"];
    v17.NSUInteger location = [(TSWPStorage *)self range];
    [v9 handleFailureInFunction:v10, v11, 592, @"charIndex %lu not within storage range %@", a3, NSStringFromRange(v17) file lineNumber description];
  }
  id v12 = [(TSWPStorage *)self changeAtCharIndex:a3 outRange:a4];
  NSUInteger location = a4->location;
  NSUInteger length = a4->length;

  return -[TSWPStorage changeDetailsForChange:withRange:](self, "changeDetailsForChange:withRange:", v12, location, length);
}

- (id)changeDetailsForChange:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    if (a4.length) {
      goto LABEL_3;
    }
  }
  else
  {
    NSUInteger v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 602, @"invalid nil value for '%s'", "change");
    if (length) {
      goto LABEL_3;
    }
  }
  NSUInteger v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]"];
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 603, @"Should have a change range greater than 0");
LABEL_3:
  id v8 = -[TSWPStorage substringWithRange:](self, "substringWithRange:", location, length);
  uint64_t v9 = [v8 length];
  if (!v9)
  {
    NSUInteger v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 609, @"change text length should be greater than 0");
    uint64_t v20 = TSWPFullNameForCharacter(0, 0);
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  int v11 = [v8 characterAtIndex:0];
  BOOL v12 = v10 != 1;
  if (v10 == 1)
  {
    BOOL v12 = 0;
LABEL_13:
    uint64_t v21 = TSWPFullNameForCharacter(v11, v12);
    if (v11 != 10) {
      goto LABEL_22;
    }
    id v22 = [(TSWPStorage *)self columnStyleAtCharIndex:location effectiveRange:0];
    if (v22 == [(TSWPStorage *)self columnStyleAtCharIndex:location + 1 effectiveRange:0])goto LABEL_22; {
    NSUInteger v23 = (void *)TSWPBundle();
    }
    if (v12) {
      NSUInteger v24 = @"Layout Breaks";
    }
    else {
      NSUInteger v24 = @"Layout Break";
    }
    uint64_t v20 = [v23 localizedStringForKey:v24 value:&stru_26D688A48 table:@"TSText"];
LABEL_21:
    uint64_t v21 = v20;
LABEL_22:
    if (([a3 isInsertion] & 1) == 0) {
      goto LABEL_25;
    }
    if (v21)
    {
      uint64_t v25 = [NSString stringWithFormat:objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Added: %@", &stru_26D688A48, @"TSText", v21];
      goto LABEL_30;
    }
LABEL_29:
    uint64_t v25 = [(id)TSWPBundle() localizedStringForKey:@"Added Text" value:&stru_26D688A48 table:@"TSText"];
    goto LABEL_30;
  }
  uint64_t v13 = 1;
  while (v11 == [v8 characterAtIndex:v13])
  {
    if (v10 == ++v13) {
      goto LABEL_13;
    }
  }
  if ([a3 isInsertion]) {
    goto LABEL_29;
  }
  uint64_t v21 = 0;
LABEL_25:
  if (v21) {
    id v8 = (id)v21;
  }
  uint64_t v25 = [NSString stringWithFormat:objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Deleted: %@", &stru_26D688A48, @"TSText", v8];
LABEL_30:
  NSUInteger v26 = [[TSWPChangeDetails alloc] initWithChange:a3 changeString:v25];

  return v26;
}

- (_NSRange)rangeForTrackedChanges:(id)a3
{
  uint64_t v5 = [a3 range];
  NSUInteger v7 = v6;
  if ([a3 isInsertionPoint])
  {
    uint64_t v8 = [(TSWPStorage *)self rangeForSelectionWithInsertionSelection:a3];
    if ([a3 start] == v8 + v9)
    {
      if ([a3 start]) {
        uint64_t v5 = [a3 start] - 1;
      }
      else {
        uint64_t v5 = 0;
      }
    }
  }
  NSUInteger v10 = v5;
  NSUInteger v11 = v7;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)selectionContainsVisibleTrackedChanges:(id)a3
{
  int v5 = [a3 isValid];
  if (v5)
  {
    int v5 = [(TSWPStorage *)self hasTrackedChanges];
    if (v5)
    {
      unint64_t v6 = [(TSWPStorage *)self rangeForTrackedChanges:a3];
      unint64_t v8 = v6 + v7;
      while (1)
      {
        id v9 = [(TSWPStorage *)self changeAtCharIndex:v6 attributeKind:15 effectiveRange:&v14];
        id v10 = [(TSWPStorage *)self changeAtCharIndex:v6 attributeKind:16 effectiveRange:&v12];
        if (v9)
        {
          if (([v9 isHidden] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }
        }
        if (v10)
        {
          if (([v10 isHidden] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
          }
        }
        if (v13 + v12 >= (unint64_t)(v15 + v14)) {
          unint64_t v6 = v15 + v14;
        }
        else {
          unint64_t v6 = v13 + v12;
        }
        if (v6 >= v8)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)changeViewSettingsDidChange
{
  uint64_t v4 = [(TSWPStorage *)self range];

  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v4, v3, 0, 0);
}

- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4
{
  return -[TSWPStorage firstHighlightForSelectionRange:outRange:requireComment:](self, "firstHighlightForSelectionRange:outRange:requireComment:", a3.location, a3.length, a4, 0);
}

- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4 requireComment:(BOOL)a5
{
  return 0;
}

- (BOOL)highlightsAllowed
{
  unsigned int v3 = [(TSWPStorage *)self wpKind];
  LOBYTE(v4) = (v3 & 0xFFFFFFFD) == 0 || v3 == 3;
  if (v3 <= 3 && v3 != 1)
  {
    objc_opt_class();
    [(TSWPStorage *)self parentInfo];
    int v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      unint64_t v6 = v5;
      if ([v5 supportsAttachedComments])
      {
        documentRoot = self->_documentRoot;
        if (documentRoot) {
          return ![(TSKDocumentRoot *)documentRoot documentDisallowsHighlightsOnStorage:v6];
        }
        else {
          LOBYTE(v4) = 1;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (id)editableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 selectionIsOnEdge:(BOOL *)a6
{
  return 0;
}

- (BOOL)p_shouldInsertionSplitChange:(id)a3 changeSession:(id)a4
{
  if (a4) {
    return objc_msgSend(a3, "canMergeWithKind:session:", 1) ^ 1;
  }
  else {
    return 1;
  }
}

- (void)stashBroadcaster
{
  if (!objc_getAssociatedObject(self, "TSTStorageBroadcaster_Key"))
  {
    objc_setAssociatedObject(self, "TSTStorageBroadcaster_Key", self->_broadcaster, (void *)0x301);
    self->_broadcaster = 0;
  }
}

- (void)unstashBroadcaster
{
  Associatedunint64_t Object = (TSWPStorageBroadcaster *)objc_getAssociatedObject(self, "TSTStorageBroadcaster_Key");
  if (AssociatedObject)
  {
    BOOL v4 = AssociatedObject;
    if (self->_broadcaster)
    {
      int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage(TablesAdditions) unstashBroadcaster]"];
      [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 82, @"swapping in the stashed broadcaster, so the real one should be nil!" file lineNumber description];
      broadcaster = self->_broadcaster;
      if (broadcaster) {
    }
      }
    self->_broadcaster = v4;
    objc_setAssociatedObject(self, "TSTStorageBroadcaster_Key", 0, (void *)0x301);
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)hyperlinkCellID
{
  NSUInteger v2 = [(TSWPStorage *)self attributeArrayForKind:10];
  if (v2)
  {
    unsigned int v3 = v2;
    unint64_t v4 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v2, 0);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPStorage(TablesAdditions) hyperlinkCellID]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 101, @"cell attribute array should not be empty");
    }
    uint64_t v7 = (uint64_t)v3->var4 + 16 * v4;
    int v8 = *(unsigned __int16 *)(v7 + 8);
    unsigned int v9 = *(unsigned __int16 *)(v7 + 10);
    if (v9 >= 0x100)
    {
      id v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPStorage(TablesAdditions) hyperlinkCellID]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 105, @"Out-of-bounds type assignment was clamped to max");
      LOBYTE(v9) = -1;
    }
  }
  else
  {
    LOBYTE(v9) = -1;
    int v8 = 0xFFFF;
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v8 & 0xFF00FFFF | (v9 << 16));
}

- (void)setHyperlinkCellID:(id)a3
{
  int v4 = *(_DWORD *)&a3 & 0xFFFFFF;
  if (([(TSWPStorage *)self hyperlinkCellID] & 0xFFFFFF) != (*(_DWORD *)&a3 & 0xFFFFFF))
  {
    int v5 = [(TSWPStorage *)self attributeArrayForKind:10 withCreate:1 undoTransaction:0];
    if (v5)
    {
      uint64_t v6 = v5;
      (*((void (**)(TSWPAttributeArray *, void, unint64_t, void))v5->var0 + 7))(v5, 0, v5->var2, 0);
      uint64_t v7 = 0;
      int v8 = v4;
      TSWPAttributeArray::insertAttribute(v6, (const TSWPAttributeRecord *)&v7, 0, 0, 0);
    }
  }
}

- (BOOL)changesWithPageCount
{
  unint64_t v3 = [(TSWPStorage *)self attachmentCount];
  if (v3)
  {
    unint64_t v4 = v3;
    if (objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", 0, 0), "changesWithPageCount"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v5 = 1;
      do
      {
        unint64_t v6 = v5;
        if (v4 == v5) {
          break;
        }
        int v7 = objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v5, 0), "changesWithPageCount");
        uint64_t v5 = v6 + 1;
      }
      while (!v7);
      LOBYTE(v3) = v6 < v4;
    }
  }
  return v3;
}

- (BOOL)hasAttachmentsThatChangeWithPageNumberOrPageCount
{
  unint64_t v3 = [(TSWPStorage *)self attachmentCount];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(TSWPStorage *)self attachmentAtAttachmentIndex:v5 outCharIndex:0];
      if (([v6 changesWithPageNumber] & 1) != 0
        || [v6 changesWithPageCount])
      {
        break;
      }
      if (v4 == ++v5)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

@end