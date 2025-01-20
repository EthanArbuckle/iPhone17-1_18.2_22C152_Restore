@interface ICBaseTextView
+ (id)attachmentInNote:(id)a3 range:(_NSRange)a4;
+ (id)copyTmpFileToTmpFileInSubDirectory:(id)a3 uti:(id)a4 suggestedName:(id)a5;
+ (id)temporaryTextStorageWithAttributedString:(id)a3 note:(id)a4 filterAttributedString:(BOOL)a5;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityOverridesInstructionsHint;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (BOOL)_icaxShouldPreventUpdatingFakeCursorRange;
- (BOOL)_isDropSessionLocalDragContextViewFromSubview:(id)a3;
- (BOOL)_shouldBecomeEditableUponDrop;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)attributedStringContainsICTTAttachment:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)dd_ignoreSignatures;
- (BOOL)exceedsMaxLengthIfSelectionReplacedWithAttributedString:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleAttributedStringDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleGenericFileForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 preferredTypeIdentifier:(id)a6 outProgress:(id *)a7 completionBlock:(id)a8;
- (BOOL)handleImageDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleInlineDrawingDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleInlinePaperDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleMapKitItemDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleMovieOrAudioDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handlePaperDocumentDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleTopotextDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)handleURLDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7;
- (BOOL)hasFullWidthTextAttachmentAtCaretLocation:(int64_t)a3;
- (BOOL)hasSupportedImageInItemProvider:(id)a3;
- (BOOL)ic_allSelectedRangesContainAttributeName:(id)a3;
- (BOOL)ic_allSelectedRangesContainFontHint:(unsigned int)a3;
- (BOOL)ic_canChangeStyle;
- (BOOL)ic_canIndentByDelta:(int64_t)a3;
- (BOOL)ic_shouldStartDataDetectors;
- (BOOL)inhibitNextDropCursorUpdateAnimation;
- (BOOL)isAccessibilityElement;
- (BOOL)isAccessibilityTableTextView;
- (BOOL)isDocumentCopyableSize;
- (BOOL)isDraggingChecklistItem;
- (BOOL)isDraggingOverChecklistItem;
- (BOOL)isInProcessEditingForTextStorage;
- (BOOL)isPreviewing;
- (BOOL)isSelectionCopyableSize;
- (BOOL)isSettingTextStyle;
- (BOOL)isSupportedAsGenericFile:(id)a3;
- (BOOL)languageHasSpaces;
- (BOOL)needsStylingRefreshOnNextLayout;
- (BOOL)resignFirstResponder;
- (BOOL)selectionContainsDDResultAttribute;
- (BOOL)selectionContainsLink;
- (BOOL)selectionContainsNonLinkAttachment;
- (BOOL)selectionSupportsFindInNote;
- (BOOL)shouldAcceptDropSession:(id)a3;
- (BOOL)shouldAvoidResigningFirstResponder;
- (BOOL)shouldCheckURLFirstForItemProvider:(id)a3;
- (BOOL)shouldDropChecklistAbove;
- (BOOL)supportsAttachments;
- (BOOL)textDroppableView:(id)a3 dropSession:(id)a4 willMoveCaretToRange:(id)a5;
- (BOOL)textSelectionHidden;
- (BOOL)touchIsPointer;
- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3;
- (CALayer)tempHighlightLayer;
- (CALayer)tempHighlightLayerIfExists;
- (CGPoint)accessibilityActivationPoint;
- (CGPoint)hitTestPoint;
- (CGPoint)renderTextInCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 image:(id *)a7 boundingRectangles:(id *)a8 renderedGlyphRange:(_NSRange *)a9;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)enclosingRectForGlyphRange:(_NSRange)a3;
- (ICBaseTextView)dragTextViewStrongReference;
- (ICBaseTextView)initWithCoder:(id)a3;
- (ICBaseTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (ICBaseTextViewDelegate)icDelegate;
- (ICBaseTextViewItemProviderPasteSession)itemProviderPasteSession;
- (ICCalculateRecognitionController)calculateRecognitionController;
- (ICHashtagController)hashtagController;
- (ICLayoutManager)icLayoutManager;
- (ICMentionsController)mentionsController;
- (ICNAEventReporter)eventReporter;
- (ICNoteEditorViewController)editorController;
- (ICTK2TextLayoutManager)icTextLayoutManager;
- (ICTTTextStorage)TTTextStorage;
- (ICTTTextStoragePersistenceHelper)persistenceHelper;
- (ICTextViewRenderingSurfaceView)renderingSurfaceView;
- (ICTrackedParagraph)draggedChecklistTrackedParagraph;
- (ICTrackedParagraph)trackedParagraphCurrentlyUnderDraggedChecklist;
- (NSArray)_icaxCachedChildrenForReparenting;
- (NSArray)participants;
- (NSAttributedString)_icaxCachedModifiedAttributedString;
- (NSAttributedString)_icaxUnfilteredAttributedString;
- (NSDictionary)cachedTypingAttributes;
- (NSDictionary)pendingTypingAttributes;
- (NSMutableArray)viewsGhostedForDrag;
- (NSMutableDictionary)_icaxPencilKitAttachmentsDict;
- (NSTextHighlightShapeProvider)highlightShapeProvider;
- (UISelectionFeedbackGenerator)checklistDragFeedbackGenerator;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)_icaxModifiedSelectionRange;
- (_NSRange)_icaxRangeInModifiedAttributedString:(id)a3 forRange:(_NSRange)a4;
- (_NSRange)_icaxRangeInTextStorageForRange:(_NSRange)a3 fromModifiedString:(id)a4;
- (_NSRange)_icaxRangeOfAttachment:(id)a3;
- (_NSRange)selectedRangeBeforeMarking;
- (_NSRange)willInsertText:(id)a3;
- (double)_icaxLastOffsetForBuildingReparentingCache;
- (double)checklistDragVerticalOffset;
- (double)distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4;
- (double)zoomFactor;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTextOperations;
- (id)_accessibilityValueForRange:(_NSRange *)a3;
- (id)_icaxAdditionalElementsForAutomation;
- (id)_icaxAttachmentElements;
- (id)_icaxAttachmentElementsForRotor;
- (id)_icaxAttachmentViewForCurrentSelectedRange;
- (id)_icaxAttributedStringForRange:(_NSRange *)a3;
- (id)_icaxCalculateAdjustString;
- (id)_icaxCalculationErrorElementsForRotor;
- (id)_icaxCalculationResultElementsForRotor;
- (id)_icaxChecklistDeleteCheckedItemsString;
- (id)_icaxChecklistMarkAllItemsCompleteString;
- (id)_icaxChecklistMoveCheckedToBottomString;
- (id)_icaxChecklistUnmarkAllItemsCompleteString;
- (id)_icaxCurrentParagraph;
- (id)_icaxDecreaseIndentationString;
- (id)_icaxFirstAttachmentViewSupportingAction:(SEL)a3;
- (id)_icaxFirstTextAttachmentInRange:(_NSRange)a3;
- (id)_icaxIncreaseIndentationString;
- (id)_icaxInsertDrawingString;
- (id)_icaxLinkEditActions;
- (id)_icaxLinkElements;
- (id)_icaxMakeBoldString;
- (id)_icaxMakeChecklistString;
- (id)_icaxMakeItalicString;
- (id)_icaxMakeNotBoldString;
- (id)_icaxMakeNotItalicString;
- (id)_icaxMakeNotUnderlinedString;
- (id)_icaxMakeUnderlinedString;
- (id)_icaxMarkAsCompletedString;
- (id)_icaxMarkAsIncompleteString;
- (id)_icaxMentionsElementsForRotor;
- (id)_icaxModifiedAttributedStorageString;
- (id)_icaxRemoveChecklistString;
- (id)_icaxShareAttachmentString;
- (id)_icaxTableElementsForRotor;
- (id)_icaxTagsElementsForRotor;
- (id)_icaxTodoButtonForParagraphStyle:(id)a3;
- (id)_icaxTodoElements;
- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4 includeFullDocument:(BOOL)a5;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)attachmentsInRange:(_NSRange)a3;
- (id)attributedStringForDrawing:(id)a3 session:(id)a4;
- (id)attributedStringForImageData:(id)a3 imageTypeUTI:(id)a4 itemProvider:(id)a5 pasteSession:(id)a6;
- (id)attributedStringForStrokeSelection:(id)a3 session:(id)a4;
- (id)attributedStringForURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 synapseData:(id)a7 session:(id)a8;
- (id)automationElements;
- (id)childElements;
- (id)childElementsForAccessibilityReparenting;
- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4;
- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 containerView:(id)a7;
- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 uiRange:(id)a4;
- (id)elementsForAccessibilityRotorType:(id)a3;
- (id)firstResponderMatchingPredicate:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)ic_selectedStyles;
- (id)ic_selectedStylesIgnoreTypingAttributes:(BOOL)a3;
- (id)icaxMakeNotStrikethroughString;
- (id)icaxMakeStrikethroughString;
- (id)internalTypingAttributes;
- (id)itemProviderConsumerTypesForItemProvider:(id)a3;
- (id)itemProviderPasteSessionCreateIfNecessary;
- (id)linkTappedByGesture:(id)a3;
- (id)pasteConfigurationForCurrentTextView;
- (id)pasteImagesDataArray:(id)a3 typesArray:(id)a4 session:(id)a5;
- (id)pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:(id)a3 session:(id)a4;
- (id)pasteNotePasteboardData:(id)a3 session:(id)a4 error:(id *)a5;
- (id)pasteStringUsingBlock:(id)a3 approxPasteString:(id)a4 pasteboardTypes:(id)a5 session:(id)a6;
- (id)pasteURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 session:(id)a7;
- (id)preferredFileTypeForItemProvider:(id)a3;
- (id)preferredFileTypesExtensionDictionary;
- (id)selectionRectsForRange:(id)a3;
- (id)singleSelectedAttachment;
- (id)standardizedAttributedString:(id)a3 attachmentIdentifiers:(id *)a4;
- (id)targetedPreviewForPaperKitAttachment:(id)a3 textFindingResult:(id)a4;
- (id)textAttachmentsInRange:(_NSRange)a3;
- (id)textController;
- (id)textDraggableView:(id)a3 dragPreviewForLiftingItem:(id)a4 session:(id)a5;
- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4;
- (id)textDraggableView:(id)a3 textRangeForDragFromPosition:(id)a4 defaultRange:(id)a5 session:(id)a6;
- (id)textDroppableView:(id)a3 positionForDrop:(id)a4;
- (id)textDroppableView:(id)a3 previewForDroppingAllItemsWithDefault:(id)a4;
- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4;
- (id)textPasteConfigurationSupporting:(id)a3 combineItemAttributedStrings:(id)a4 forRange:(id)a5;
- (id)textPasteConfigurationSupporting:(id)a3 performPasteOfAttributedString:(id)a4 toRange:(id)a5;
- (id)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4;
- (id)typeIdentifiersSupportedAsGenericFiles;
- (id)typingAttributes;
- (id)updateIndentForChecklistDragIfNecessaryForString:(id)a3 lineUnderDrop:(id)a4;
- (int64_t)_accessibilityLineEndPosition;
- (int64_t)_accessibilityLineStartPosition;
- (int64_t)ic_currentWritingDirection;
- (unint64_t)_icaxLinePositionForPosition:(unint64_t)a3 start:(BOOL)a4;
- (unint64_t)_icaxModifiedCursorPosition;
- (unint64_t)_icaxModifiedPositionForPosition:(unint64_t)a3;
- (unint64_t)_icaxPositionForModifiedPosition:(unint64_t)a3;
- (unint64_t)accessibilityTraits;
- (unint64_t)firstValidEmphasisLocationWithinSelection:(_NSRange)a3;
- (unint64_t)ic_selectedBIUS;
- (unint64_t)lastChecklistDropIndex;
- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4;
- (void)TTTextStorage;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_addPencilKitAccessibilityElementIfNeededForTextAttachment:(id)a3 toAttachmentElements:(id)a4;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_getPasteboardItemFromSelection:(id)a3;
- (void)_icaxAddParticipantEditHighlightsToString:(id)a3 forRange:(_NSRange)a4;
- (void)_icaxAddPredictiveTextToAttributedString:(id)a3;
- (void)_icaxChecklistDeleteChecked;
- (void)_icaxChecklistMarkAllComplete;
- (void)_icaxChecklistSortCheckedToBottom;
- (void)_icaxChecklistUnMarkAllComplete;
- (void)_icaxGetBoldForCurrentRange:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6;
- (void)_icaxMarkTodoCompleteForCurrentSelection;
- (void)_icaxMarkTodoIncompleteForCurrentSelection;
- (void)_icaxResetCalculationErrorsForCalculateDocumentUpdate;
- (void)_icaxUpdateFakeTextSelectionRange;
- (void)_insertDrawing:(id)a3;
- (void)_reallyCut:(id)a3;
- (void)_removeDrawingAttachment:(id)a3 withView:(id)a4 forDeletion:(BOOL)a5;
- (void)applyPendingTypingAttributesIfNeeded;
- (void)beginDrop;
- (void)beginSelectionChange;
- (void)buildMenuWithBuilder:(id)a3;
- (void)calculateRecognitionController:(id)a3 didUpdateTextSuggestions:(id)a4;
- (void)commonInit;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)didInsertText:(id)a3 range:(_NSRange)a4;
- (void)didPasteOrDropText:(id)a3 toRange:(id)a4;
- (void)drawBlockQuoteAndCleanup:(BOOL *)a3 pendingBlockQuoteLevelToDraw:(unint64_t *)a4 pendingBlockQuoteRectToDraw:(CGRect *)a5 ps:(id)a6;
- (void)drawBlockQuoteLayerInRectForTK2:(CGRect)a3 blockQuoteLevel:(int64_t)a4 isMonostyled:(BOOL)a5;
- (void)drawMonostyledLayerInRect:(CGRect)a3;
- (void)endHeadingRenameCommittingMarkedText:(BOOL)a3;
- (void)endSelectionChange;
- (void)eventReporterLostSession:(id)a3;
- (void)finishDropWithString:(id)a3;
- (void)ic_disableBoldface;
- (void)ic_disableItalics;
- (void)ic_disableStrikethrough;
- (void)ic_disableUnderline;
- (void)ic_editAttributesInSelectedRanges:(id)a3;
- (void)ic_editAttributesInSelectedRanges:(id)a3 shouldSkipAttachments:(BOOL)a4;
- (void)ic_enableBoldface;
- (void)ic_enableItalics;
- (void)ic_enableStrikethrough;
- (void)ic_enableUnderline;
- (void)ic_enumerateAttributesInSelectedRanges:(id)a3;
- (void)ic_enumerateTableAttachmentViewControllersInRanges:(id)a3 usingBlock:(id)a4;
- (void)ic_indentByAmount:(int64_t)a3;
- (void)ic_performBlock:(id)a3;
- (void)ic_resetDataDetectorsResults;
- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4;
- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4 withEmphasisColorType:(int64_t)a5;
- (void)ic_setFontHint:(unsigned int)a3 enabled:(BOOL)a4;
- (void)ic_setTextStyleForCurrentSelection:(unsigned int)a3;
- (void)ic_startDataDetectors;
- (void)ic_toggleAttributeWithName:(id)a3;
- (void)ic_toggleAttributeWithName:(id)a3 withEmphasisColorType:(int64_t)a4;
- (void)ic_toggleBoldface;
- (void)ic_toggleEmphasisWithType:(int64_t)a3;
- (void)ic_toggleFontHint:(unsigned int)a3;
- (void)ic_toggleItalics;
- (void)ic_toggleStrikethrough;
- (void)ic_toggleUnderline;
- (void)icaxBeginEditingAtAttachment:(id)a3;
- (void)icaxBeginEditingInStorageRange:(_NSRange)a3;
- (void)icaxClearCachedChildrenForReparenting;
- (void)icaxClearCaches;
- (void)icaxSpeakIndentationLevelForCurrentSelectedRange;
- (void)icaxTextDidChange;
- (void)icaxUpdateLinkRanges;
- (void)informDelegateOfAnalyticsCalloutBarButtonActionOfType:(int64_t)a3 sender:(id)a4;
- (void)informDelegateOfPastedAttributedString:(id)a3;
- (void)insertAttributedText:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextSuggestion:(id)a3;
- (void)keyboardLocaleChanged:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)resetViewsGhostedForDrag;
- (void)respondToTapGesture:(id)a3;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setCachedTypingAttributes:(id)a3;
- (void)setCalculateRecognitionController:(id)a3;
- (void)setChecklistDragFeedbackGenerator:(id)a3;
- (void)setChecklistDragVerticalOffset:(double)a3;
- (void)setDragTextViewStrongReference:(id)a3;
- (void)setDraggedChecklistTrackedParagraph:(id)a3;
- (void)setEditorController:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setHashtagController:(id)a3;
- (void)setHighlightShapeProvider:(id)a3;
- (void)setHitTestPoint:(CGPoint)a3;
- (void)setIcDelegate:(id)a3;
- (void)setInhibitNextDropCursorUpdateAnimation:(BOOL)a3;
- (void)setInternalTypingAttributes:(id)a3;
- (void)setIsDraggingChecklistItem:(BOOL)a3;
- (void)setIsDraggingOverChecklistItem:(BOOL)a3;
- (void)setIsInProcessEditingForTextStorage:(BOOL)a3;
- (void)setIsSettingTextStyle:(BOOL)a3;
- (void)setItemProviderPasteSession:(id)a3;
- (void)setLanguageHasSpaces:(BOOL)a3;
- (void)setLastChecklistDropIndex:(unint64_t)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMentionsController:(id)a3;
- (void)setNeedsStylingRefreshOnNextLayout:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingTypingAttributes:(id)a3;
- (void)setRenderingSurfaceView:(id)a3;
- (void)setSelectedRangeBeforeMarking:(_NSRange)a3;
- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3;
- (void)setShouldDropChecklistAbove:(BOOL)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTempHighlightLayer:(id)a3;
- (void)setTextSelectionHidden:(BOOL)a3;
- (void)setTouchIsPointer:(BOOL)a3;
- (void)setTrackedParagraphCurrentlyUnderDraggedChecklist:(id)a3;
- (void)setTypingAttributes:(id)a3;
- (void)setViewsGhostedForDrag:(id)a3;
- (void)set_icaxCachedChildrenForReparenting:(id)a3;
- (void)set_icaxCachedModifiedAttributedString:(id)a3;
- (void)set_icaxLastOffsetForBuildingReparentingCache:(double)a3;
- (void)set_icaxModifiedCursorPosition:(unint64_t)a3;
- (void)set_icaxModifiedSelectionRange:(_NSRange)a3;
- (void)set_icaxPencilKitAttachmentsDict:(id)a3;
- (void)set_icaxShouldPreventUpdatingFakeCursorRange:(BOOL)a3;
- (void)setupLinkTextAttributes;
- (void)setupTextViewDragAndDropDelegates;
- (void)showDeleteInlineDrawingAlertWithType:(unint64_t)a3 attachments:(id)a4 completionHandler:(id)a5;
- (void)showRemoveAttachmentAlertIfNecessaryForOperation:(unint64_t)a3 selectedRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)showRemoveAttachmentAlertWithTitle:(id)a3 message:(id)a4 primaryActionTitle:(id)a5 completionHandler:(id)a6;
- (void)showRemoveInProgressRecordingAlertWithOperation:(unint64_t)a3 type:(unint64_t)a4 attachments:(id)a5 completionHandler:(id)a6;
- (void)showWritingTools:(id)a3;
- (void)speakAccessibilityAutoListItemIfNecessaryForInsertedText:(id)a3;
- (void)textDraggableView:(id)a3 dragSessionDidEnd:(id)a4 withOperation:(unint64_t)a5;
- (void)textDraggableView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)textDraggableView:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)textDroppableView:(id)a3 dropSessionDidExit:(id)a4;
- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4;
- (void)textStorageDidPerformMerge:(id)a3;
- (void)textStorageWillPerformMerge:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleStrikethrough;
- (void)toggleUnderline:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)unmarkText;
- (void)updateBlockQuoteLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousBlockQuoteRect:(CGRect *)a5;
- (void)updateKeyboardSuggestions:(id)a3 hashtagController:(id)a4;
- (void)updateKeyboardSuggestions:(id)a3 mentionsController:(id)a4 mentionString:(id)a5;
- (void)updateMonostyledLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousMonoRect:(CGRect *)a5 ioPreviousBlockQuoteLevel:(unint64_t *)a6;
- (void)updateStyleLayersInRange:(_NSRange)a3;
- (void)updateTextViewForDidChange;
- (void)willPresentWritingTools;
@end

@implementation ICBaseTextView

- (ICTTTextStorage)TTTextStorage
{
  uint64_t v3 = [(ICBaseTextView *)self textStorage];
  if (v3
    && (v4 = (void *)v3,
        [(ICBaseTextView *)self textStorage],
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) == 0))
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ICBaseTextView *)self TTTextStorage];
    }

    v7 = 0;
  }
  else
  {
    v7 = [(ICBaseTextView *)self textStorage];
  }

  return (ICTTTextStorage *)v7;
}

void __59__ICBaseTextView_StyleAdditions__updateStyleLayersInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3 - a2;
  v6 = [*(id *)(a1 + 32) textStorage];
  id v23 = [v6 attribute:*MEMORY[0x263F5AB28] atIndex:a2 effectiveRange:0];

  if (v23 && [v23 style] == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateMonostyledLayerForParagraphStyle:inRange:ioPreviousMonoRect:ioPreviousBlockQuoteLevel:", v23, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(a1 + 48) + 8) + 32, *(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  else if (!NSIsEmptyRect(*(NSRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "drawMonostyledLayerInRect:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v8 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v7 + 32) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v7 + 48) = v8;
  }
  if (!NSIsEmptyRect(*(NSRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
       + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    v10 = [*(id *)(a1 + 32) textStorage];
    uint64_t v11 = objc_msgSend(v10, "ic_range");
    uint64_t v13 = v11 + v12;

    if (v9 == v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "drawMonostyledLayerInRect:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v15 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
      *(_OWORD *)(v14 + 32) = *MEMORY[0x263F001A0];
      *(_OWORD *)(v14 + 48) = v15;
    }
  }
  if (v23 && [v23 blockQuoteLevel])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v23 blockQuoteLevel];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v23 style] == 4;
    objc_msgSend(*(id *)(a1 + 32), "updateBlockQuoteLayerForParagraphStyle:inRange:ioPreviousBlockQuoteRect:", v23, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(a1 + 72) + 8) + 32);
    goto LABEL_18;
  }
  if (!NSIsEmptyRect(*(NSRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32)))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_17:
    [*(id *)(a1 + 32) drawBlockQuoteAndCleanup:*(void *)(*(void *)(a1 + 64) + 8) + 24 pendingBlockQuoteLevelToDraw:v17 + 24 pendingBlockQuoteRectToDraw:*(void *)(*(void *)(a1 + 72) + 8) + 32 ps:v23];
    goto LABEL_18;
  }
  if (v23)
  {
    uint64_t v16 = [v23 blockQuoteLevel];
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v16 != *(void *)(v17 + 24)) {
      goto LABEL_17;
    }
  }
LABEL_18:
  if (!NSIsEmptyRect(*(NSRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32)))
  {
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
        + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    v19 = [*(id *)(a1 + 32) textStorage];
    uint64_t v20 = objc_msgSend(v19, "ic_range");
    uint64_t v22 = v20 + v21;

    if (v18 == v22) {
      [*(id *)(a1 + 32) drawBlockQuoteAndCleanup:*(void *)(*(void *)(a1 + 64) + 8) + 24 pendingBlockQuoteLevelToDraw:*(void *)(*(void *)(a1 + 56) + 8) + 24 pendingBlockQuoteRectToDraw:*(void *)(*(void *)(a1 + 72) + 8) + 32 ps:v23];
    }
  }
}

- (void)setIcDelegate:(id)a3
{
}

- (ICNoteEditorViewController)editorController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorController);

  return (ICNoteEditorViewController *)WeakRetained;
}

- (ICBaseTextViewDelegate)icDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icDelegate);

  return (ICBaseTextViewDelegate *)WeakRetained;
}

- (BOOL)resignFirstResponder
{
  if ([(ICBaseTextView *)self shouldAvoidResigningFirstResponder]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  return [(ICBaseTextView *)&v4 resignFirstResponder];
}

- (BOOL)shouldAvoidResigningFirstResponder
{
  return self->_shouldAvoidResigningFirstResponder;
}

- (BOOL)ic_canChangeStyle
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__ICBaseTextView_StyleAdditions__ic_canChangeStyle__block_invoke;
  v4[3] = &unk_2640BA798;
  v4[4] = self;
  v4[5] = &v5;
  [(ICBaseTextView *)self ic_performBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)ic_performBlock:(id)a3
{
  objc_super v4 = (void (**)(id, id, void *))a3;
  objc_opt_class();
  uint64_t v5 = [(ICBaseTextView *)self textStorage];
  ICCheckedDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = [v8 styler];
  uint64_t v7 = ICCheckedDynamicCast();

  v4[2](v4, v8, v7);
}

void __51__ICBaseTextView_StyleAdditions__ic_canChangeStyle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "ic_selectedRanges");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = [v6 canChangeStyleForSelectedRanges:v8 inTextStorage:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
}

- (BOOL)isInProcessEditingForTextStorage
{
  return self->_isInProcessEditingForTextStorage;
}

- (void)updateStyleLayersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(ICBaseTextView *)self layer];
  if (v6)
  {
  }
  else
  {
    id v7 = [(ICBaseTextView *)self renderingSurfaceView];
    id v8 = [v7 layer];

    if (!v8) {
      return;
    }
  }
  uint64_t v9 = [(ICBaseTextView *)self textStorage];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    uint64_t v11 = [(ICBaseTextView *)self renderingSurfaceView];
    uint64_t v12 = [v11 layer];
    [v12 setSublayers:0];

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x4010000000;
    v29[3] = &unk_20C1E2BF2;
    long long v13 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v30 = *MEMORY[0x263F001A0];
    long long v31 = v13;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x4010000000;
    v26[3] = &unk_20C1E2BF2;
    long long v27 = v30;
    long long v28 = v13;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3010000000;
    v21[3] = &unk_20C1E2BF2;
    long long v22 = xmmword_20C1794E0;
    if (!length)
    {
      uint64_t v14 = [(ICBaseTextView *)self textStorage];
      NSUInteger location = objc_msgSend(v14, "ic_range");
      NSUInteger length = v15;
    }
    uint64_t v16 = [(ICBaseTextView *)self textStorage];
    uint64_t v17 = [v16 string];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__ICBaseTextView_StyleAdditions__updateStyleLayersInRange___block_invoke;
    v20[3] = &unk_2640BAA60;
    v20[4] = self;
    v20[5] = v21;
    v20[6] = v29;
    v20[7] = v25;
    v20[8] = v23;
    v20[9] = v26;
    objc_msgSend(v17, "ic_enumerateParagraphsInRange:usingBlock:", location, length, v20);

    [MEMORY[0x263F158F8] commit];
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v29, 8);
  }
  else
  {
    id v19 = [(ICBaseTextView *)self renderingSurfaceView];
    uint64_t v18 = [v19 layer];
    [v18 setSublayers:0];
  }
}

void __28__ICBaseTextView_commonInit__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    id v8 = objc_loadWeakRetained(&to);
    uint64_t v9 = [v8 renderingSurfaceView];
    [v5 addRenderingSurface:v9 key:@"RenderingSurfaceView" group:1 placement:1];
  }
  objc_destroyWeak(&to);
}

- (ICTextViewRenderingSurfaceView)renderingSurfaceView
{
  return self->_renderingSurfaceView;
}

- (BOOL)dd_ignoreSignatures
{
  return 1;
}

- (BOOL)needsStylingRefreshOnNextLayout
{
  return self->_needsStylingRefreshOnNextLayout;
}

- (void)setupTextViewDragAndDropDelegates
{
  objc_opt_class();
  uint64_t v3 = [(ICBaseTextView *)self textContainer];
  objc_super v4 = ICDynamicCast();
  char v5 = [v4 insideSiriSnippet];

  if ((v5 & 1) == 0)
  {
    [(ICBaseTextView *)self setTextDragDelegate:self];
    [(ICBaseTextView *)self setTextDropDelegate:self];
    [(ICBaseTextView *)self setPasteDelegate:self];
    id v6 = [(ICBaseTextView *)self pasteConfigurationForCurrentTextView];
    [(ICBaseTextView *)self setPasteConfiguration:v6];
  }
}

- (ICBaseTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  objc_super v4 = -[ICBaseTextView initWithFrame:textContainer:](&v7, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v5 = v4;
  if (v4) {
    [(ICBaseTextView *)v4 commonInit];
  }
  return v5;
}

- (void)commonInit
{
  [(ICBaseTextView *)self setAllowsEditingTextAttributes:1];
  id v3 = objc_alloc(MEMORY[0x263F816A8]);
  objc_super v4 = [(ICBaseTextView *)self textLayoutManager];
  char v5 = (void *)[v3 initWithTextLayoutManager:v4];
  [(ICBaseTextView *)self setHighlightShapeProvider:v5];

  [(ICBaseTextView *)self setupLinkTextAttributes];
  id v6 = [(ICBaseTextView *)self _allowedTypingAttributes];
  objc_super v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:*MEMORY[0x263F814A0]];
  [v7 removeObject:*MEMORY[0x263F814A8]];
  id v8 = [MEMORY[0x263F5ACF0] allowedTypingAttributes];
  [v7 unionSet:v8];

  [(ICBaseTextView *)self _setAllowedTypingAttributes:v7];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_respondToTapGesture_];
  [(ICBaseTextView *)self setTapGestureRecognizer:v9];

  uint64_t v10 = [(ICBaseTextView *)self tapGestureRecognizer];
  [v10 setDelegate:self];

  uint64_t v11 = [(ICBaseTextView *)self tapGestureRecognizer];
  [(ICBaseTextView *)self addGestureRecognizer:v11];

  uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = *MEMORY[0x263F5B1E0];
  uint64_t v14 = [(ICBaseTextView *)self textStorage];
  [v12 addObserver:self selector:sel_textStorageDidEndEditingNotification_ name:v13 object:v14];

  NSUInteger v15 = [MEMORY[0x263F08A00] defaultCenter];
  [v15 addObserver:self selector:sel_keyboardLocaleChanged_ name:*MEMORY[0x263F83BD0] object:0];

  [(ICBaseTextView *)self keyboardLocaleChanged:0];
  [(ICBaseTextView *)self setMathExpressionCompletionType:ICInternalSettingsIsMathEnabled()];
  uint64_t v16 = objc_alloc_init(ICTextViewRenderingSurfaceView);
  [(ICBaseTextView *)self setRenderingSurfaceView:v16];

  uint64_t v17 = [(ICBaseTextView *)self textLayoutManager];
  uint64_t v18 = [v17 textViewportLayoutController];

  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __28__ICBaseTextView_commonInit__block_invoke;
  long long v22 = &unk_2640BB4A8;
  objc_copyWeak(&v23, &location);
  [v18 setRenderingSurfaceUpdater:&v19];
  [(ICBaseTextView(ICAccessibility_iOS) *)self _icaxAddObservationsForCalculate];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)keyboardLocaleChanged:(id)a3
{
  objc_super v4 = [(ICBaseTextView *)self textInputMode];
  id v9 = v4;
  if (v4)
  {
    char v5 = (void *)MEMORY[0x263EFF960];
    id v6 = [v4 primaryLanguage];
    objc_super v7 = [v5 localeWithLocaleIdentifier:v6];
    id v8 = [v7 languageCode];

    [(ICBaseTextView *)self setLanguageHasSpaces:ICLanguageUsesSpaces()];
  }
  else
  {
    [(ICBaseTextView *)self setLanguageHasSpaces:1];
  }
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (void)setupLinkTextAttributes
{
  uint64_t v3 = [(ICBaseTextView *)self linkTextAttributes];
  objc_super v4 = (void *)v3;
  char v5 = (void *)MEMORY[0x263EFFA78];
  if (v3) {
    char v5 = (void *)v3;
  }
  id v6 = v5;

  id v11 = (id)[v6 mutableCopy];
  objc_super v7 = [MEMORY[0x263F5B288] defaultLinkTextAttributes];
  [v11 addEntriesFromDictionary:v7];

  if (ICInternalSettingsIsTextKit2Enabled())
  {
    id v8 = (void *)[v11 copy];
    [(ICBaseTextView *)self setLinkTextAttributes:v8];
  }
  else
  {
    objc_opt_class();
    id v9 = [(ICBaseTextView *)self layoutManager];
    id v8 = ICDynamicCast();

    [v8 setIsSettingLinkTextAttributes:1];
    uint64_t v10 = (void *)[v11 copy];
    [(ICBaseTextView *)self setLinkTextAttributes:v10];

    [v8 setIsSettingLinkTextAttributes:0];
  }
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setRenderingSurfaceView:(id)a3
{
}

- (void)setHighlightShapeProvider:(id)a3
{
}

- (void)setEditorController:(id)a3
{
}

- (id)pasteConfigurationForCurrentTextView
{
  v17[14] = *MEMORY[0x263EF8340];
  if ([(ICBaseTextView *)self supportsAttachments])
  {
    v17[0] = *MEMORY[0x263F5AA90];
    uint64_t v3 = [(id)*MEMORY[0x263F1DB18] identifier];
    v17[1] = v3;
    objc_super v4 = [(id)*MEMORY[0x263F1DBC8] identifier];
    v17[2] = v4;
    char v5 = [(id)*MEMORY[0x263F1DBF0] identifier];
    v17[3] = v5;
    id v6 = [(id)*MEMORY[0x263F1DD50] identifier];
    uint64_t v7 = *MEMORY[0x263F7C260];
    v17[4] = v6;
    v17[5] = v7;
    id v8 = [(id)*MEMORY[0x263F1DD08] identifier];
    v17[6] = v8;
    v17[7] = @"com.apple.iwork.keynote.key";
    v17[8] = @"com.apple.iwork.numbers.numbers";
    v17[9] = @"com.apple.iwork.pages.pages";
    uint64_t v9 = *MEMORY[0x263F14C60];
    v17[10] = @"com.apple.calendar.ics";
    v17[11] = v9;
    uint64_t v10 = *MEMORY[0x263F5AD98];
    v17[12] = *MEMORY[0x263F14C70];
    v17[13] = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:14];

    uint64_t v12 = [(ICBaseTextView *)self typeIdentifiersSupportedAsGenericFiles];
    uint64_t v13 = [v12 arrayByAddingObjectsFromArray:v11];
  }
  else
  {
    uint64_t v12 = [(id)*MEMORY[0x263F1DCF8] identifier];
    uint64_t v16 = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F82A08]) initWithAcceptableTypeIdentifiers:v13];

  return v14;
}

- (id)typeIdentifiersSupportedAsGenericFiles
{
  v6[2] = *MEMORY[0x263EF8340];
  char v2 = [(id)*MEMORY[0x263F1DA38] identifier];
  v6[0] = v2;
  uint64_t v3 = [(id)*MEMORY[0x263F1D9A8] identifier];
  v6[1] = v3;
  objc_super v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)setShouldAvoidResigningFirstResponder:(BOOL)a3
{
  self->_shouldAvoidResigningFirstResponder = a3;
}

- (void)applyPendingTypingAttributesIfNeeded
{
  char v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(ICBaseTextView *)v2 pendingTypingAttributes];

  if (v3)
  {
    [(ICBaseTextView *)v2 setPendingTypingAttributes:0];
    objc_super v4 = [(ICBaseTextView *)v2 pendingTypingAttributes];
    [(ICBaseTextView *)v2 setCachedTypingAttributes:v4];

    char v5 = [(ICBaseTextView *)v2 pendingTypingAttributes];
    v6.receiver = v2;
    v6.super_class = (Class)ICBaseTextView;
    [(ICBaseTextView *)&v6 setTypingAttributes:v5];
  }
  objc_sync_exit(v2);
}

- (NSDictionary)pendingTypingAttributes
{
  return self->_pendingTypingAttributes;
}

+ (id)attachmentInNote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v14 = 0;
  NSUInteger v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  if (length == 1)
  {
    uint64_t v9 = [v6 textStorage];
    uint64_t v10 = [v7 managedObjectContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__ICBaseTextView_DragAndDrop__attachmentInNote_range___block_invoke;
    v13[3] = &unk_2640B8328;
    v13[4] = &v14;
    objc_msgSend(v9, "ic_enumerateAttachmentsInContext:range:usingBlock:", v10, location, 1, v13);

    id v8 = (void *)v15[5];
  }
  id v11 = v8;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __54__ICBaseTextView_DragAndDrop__attachmentInNote_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

+ (id)copyTmpFileToTmpFileInSubDirectory:(id)a3 uti:(id)a4 suggestedName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 lastPathComponent];
  id v11 = [v7 pathExtension];
  uint64_t v12 = v11;
  if (!v11 || [v11 isEqualToString:@"tmp"])
  {
    uint64_t v13 = [MEMORY[0x263F5AB78] filenameExtensionForUTI:v8];

    uint64_t v12 = (void *)v13;
  }
  if ([v10 containsString:@"UIKit.ItemProvider"])
  {
    if (v9) {
      objc_msgSend(v9, "ic_sanitizedFilenameString");
    }
    else {
    uint64_t v14 = [MEMORY[0x263F5AB78] filenameFromUTI:v8];
    }

    uint64_t v10 = (void *)v14;
  }
  NSUInteger v15 = NSURL;
  uint64_t v16 = NSTemporaryDirectory();
  uint64_t v17 = [MEMORY[0x263F08C38] UUID];
  uint64_t v18 = [v17 UUIDString];
  id v19 = [v16 stringByAppendingPathComponent:v18];
  uint64_t v20 = [v15 fileURLWithPath:v19];

  uint64_t v21 = [v20 URLByAppendingPathComponent:v10 isDirectory:0];
  long long v22 = v21;
  v36 = v9;
  if (v12)
  {
    id v23 = [v21 URLByDeletingPathExtension];
    uint64_t v24 = [v23 URLByAppendingPathExtension:v12];

    long long v22 = (void *)v24;
  }
  v25 = v8;
  v26 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:]();
  }

  long long v27 = [MEMORY[0x263F08850] defaultManager];
  id v38 = 0;
  char v28 = [v27 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v38];
  id v29 = v38;

  if ((v28 & 1) == 0)
  {
    long long v30 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:]();
    }
  }
  long long v31 = [MEMORY[0x263F08850] defaultManager];
  id v37 = v29;
  char v32 = [v31 copyItemAtURL:v7 toURL:v22 error:&v37];
  id v33 = v37;

  if ((v32 & 1) == 0)
  {

    v34 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[ICBaseTextView(DragAndDrop) copyTmpFileToTmpFileInSubDirectory:uti:suggestedName:]((uint64_t)v7, (uint64_t)v33, v34);
    }

    long long v22 = 0;
  }

  return v22;
}

- (CGPoint)renderTextInCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 image:(id *)a7 boundingRectangles:(id *)a8 renderedGlyphRange:(_NSRange *)a9
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v89 = a4;
  id v88 = a5;
  if (ICInternalSettingsIsTextKit2Enabled()
    && ([(ICBaseTextView *)self textLayoutManager],
        NSUInteger v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    id v16 = objc_alloc(MEMORY[0x263F83140]);
    uint64_t v17 = [(ICBaseTextView *)self textLayoutManager];
    uint64_t v18 = [(ICBaseTextView *)self textLayoutManager];
    id v19 = objc_msgSend(v18, "ic_textRangeForRange:", location, length);
    uint64_t v20 = (void *)[v16 initWithTextLayoutManager:v17 range:v19 unifyRects:1];

    if (v88) {
      [v20 addRenderingAttributes:v88];
    }
    *a7 = [v20 image];
    uint64_t v21 = [(ICBaseTextView *)self textLayoutManager];
    long long v22 = [v20 range];
    a9->NSUInteger location = objc_msgSend(v21, "ic_rangeForTextRange:", v22);
    a9->NSUInteger length = v23;

    if (v88)
    {
      uint64_t v24 = [v88 allKeys];
      [v20 removeRenderingAttributes:v24];
    }
    [v20 firstLineRect];
    uint64_t v103 = v25;
    uint64_t v104 = v26;
    uint64_t v105 = v27;
    uint64_t v106 = v28;
    [v20 bodyRect];
    uint64_t v107 = v29;
    uint64_t v108 = v30;
    uint64_t v109 = v31;
    uint64_t v110 = v32;
    [v20 lastLineRect];
    uint64_t v111 = v33;
    uint64_t v112 = v34;
    uint64_t v113 = v35;
    uint64_t v114 = v36;
    id v37 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    for (uint64_t i = 0; i != 96; i += 32)
    {
      [(ICBaseTextView *)self contentScaleFactor];
      UIRectIntegralWithScale();
      double x = v117.origin.x;
      double y = v117.origin.y;
      double width = v117.size.width;
      double height = v117.size.height;
      if (!CGRectIsEmpty(v117))
      {
        v43 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", x, y, width, height);
        [v37 addObject:v43];
      }
    }
    *a8 = (id)[v37 copy];
    v44 = (double *)MEMORY[0x263F00148];
    if ([(ICBaseTextView *)self isDraggingChecklistItem] || a6)
    {
      v78 = [v20 range];
      v100[0] = 0;
      v100[1] = v100;
      v100[2] = 0x4010000000;
      v100[3] = &unk_20C1E2BF2;
      long long v101 = 0u;
      long long v102 = 0u;
      uint64_t v94 = 0;
      v95 = (CGRect *)&v94;
      uint64_t v96 = 0x4010000000;
      v97 = &unk_20C1E2BF2;
      long long v79 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v98 = *MEMORY[0x263F001A8];
      long long v99 = v79;
      v80 = [(ICBaseTextView *)self textLayoutManager];
      v81 = [v78 location];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke;
      v91[3] = &unk_2640B8350;
      id v82 = v78;
      id v92 = v82;
      v93 = v100;
      id v83 = (id)[v80 enumerateTextLayoutFragmentsFromLocation:v81 options:0 usingBlock:v91];

      v84 = [(ICBaseTextView *)self textLayoutManager];
      v85 = [v20 range];
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke_2;
      v90[3] = &unk_2640B8378;
      v90[4] = v100;
      v90[5] = &v94;
      [v84 enumerateTextSegmentsInRange:v85 type:0 options:1 usingBlock:v90];

      CGFloat MinX = CGRectGetMinX(v95[1]);
      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(v100, 8);
    }
    else
    {
      CGFloat MinX = *v44;
    }

    double v77 = v44[1];
  }
  else
  {
    objc_opt_class();
    v46 = [(ICBaseTextView *)self textContainer];
    v47 = [v46 layoutManager];
    v48 = ICCheckedDynamicCast();

    uint64_t v49 = objc_msgSend(v48, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
    uint64_t v51 = v50;
    [v48 setShouldManuallyRenderSeparateSubviews:1];
    [v48 setIsRenderingPreviewForDragAndDrop:1];
    objc_opt_class();
    v52 = [v89 styler];
    v53 = ICCheckedDynamicCast();

    objc_msgSend(v53, "styleText:inExactRange:fixModelAttributes:", v89, location, length, 0);
    v54 = objc_msgSend(objc_alloc(MEMORY[0x263F5B4F0]), "initWithLayoutManager:range:textStorage:", v48, location, length, v89);
    objc_msgSend(v54, "setIsDraggingChecklistItem:", -[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem"));
    *a7 = [v54 image];
    objc_msgSend(v53, "styleText:inExactRange:fixModelAttributes:", v89, location, length, 0);
    a9->NSUInteger location = [v54 renderedGlyphRange];
    a9->NSUInteger length = v55;
    [v48 setShouldManuallyRenderSeparateSubviews:0];
    [v48 setIsRenderingPreviewForDragAndDrop:0];
    objc_msgSend(v48, "invalidateDisplayForGlyphRange:", v49, v51);
    [v54 firstLineRect];
    uint64_t v103 = v56;
    uint64_t v104 = v57;
    uint64_t v105 = v58;
    uint64_t v106 = v59;
    [v54 bodyRect];
    uint64_t v107 = v60;
    uint64_t v108 = v61;
    uint64_t v109 = v62;
    uint64_t v110 = v63;
    [v54 lastLineRect];
    uint64_t v111 = v64;
    uint64_t v112 = v65;
    uint64_t v113 = v66;
    uint64_t v114 = v67;
    v68 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    for (uint64_t j = 0; j != 96; j += 32)
    {
      [(ICBaseTextView *)self contentScaleFactor];
      UIRectIntegralWithScale();
      double v70 = v118.origin.x;
      double v71 = v118.origin.y;
      double v72 = v118.size.width;
      double v73 = v118.size.height;
      if (!CGRectIsEmpty(v118))
      {
        v74 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v70, v71, v72, v73);
        [v68 addObject:v74];
      }
    }
    *a8 = (id)[v68 copy];
    [v54 originAdjustment];
    CGFloat MinX = v75;
    double v77 = v76;
  }
  double v86 = MinX;
  double v87 = v77;
  result.double y = v87;
  result.double x = v86;
  return result;
}

BOOL __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 rangeInElement];
  char v5 = [v4 location];
  id v6 = [*(id *)(a1 + 32) endLocation];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == -1)
  {
    [v3 layoutFragmentFrame];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
    if (!CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)))
    {
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRect v18 = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v19);
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
    }
    id v16 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
    v16[4] = x;
    v16[5] = y;
    v16[6] = width;
    v16[7] = height;
  }

  return v7 == -1;
}

uint64_t __159__ICBaseTextView_DragAndDrop__renderTextInCharacterRange_inTextStorage_temporaryAttributes_forceOffsetCalculation_image_boundingRectangles_renderedGlyphRange___block_invoke_2(uint64_t a1, double a2, double y, double width, double height)
{
  double x = a2 - CGRectGetMinX(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  if (!CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)))
  {
    v13.origin.double x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    CGRect v12 = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v13);
    double x = v12.origin.x;
    CGFloat y = v12.origin.y;
    CGFloat width = v12.size.width;
    CGFloat height = v12.size.height;
  }
  double v10 = *(double **)(*(void *)(a1 + 40) + 8);
  v10[4] = x;
  v10[5] = y;
  v10[6] = width;
  v10[7] = height;
  return 1;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = (void *)MEMORY[0x263F82CE8];
  id v8 = a4;
  id v9 = [(ICBaseTextView *)self window];
  double v10 = [v9 windowScene];
  id v11 = [v7 sharedTextEffectsWindowForWindowScene:v10];

  CGRect v12 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:", location, length, v8, 0, 0, v11);

  return v12;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 inTextStorage:(id)a4 temporaryAttributes:(id)a5 forceOffsetCalculation:(BOOL)a6 containerView:(id)a7
{
  BOOL v8 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([(ICBaseTextView *)self isDraggingChecklistItem])
  {
    id v16 = [v13 string];
    char v17 = objc_msgSend(v16, "ic_isLastCharacterInRangeANewlineForRange:", location, length);
    if (length == 1) {
      char v18 = 0;
    }
    else {
      char v18 = v17;
    }

    length -= v18 & 1;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  id v37 = 0;
  id v38 = 0;
  -[ICBaseTextView renderTextInCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:image:boundingRectangles:renderedGlyphRange:](self, "renderTextInCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:image:boundingRectangles:renderedGlyphRange:", location, length, v13, v14, v8, &v38, &v37, &v39);
  double v20 = v19;
  double v22 = v21;
  NSUInteger v23 = v38;
  uint64_t v24 = (objc_class *)MEMORY[0x263F82828];
  id v25 = v37;
  id v26 = v23;
  uint64_t v27 = (void *)[[v24 alloc] initWithImage:v26];
  [v27 setContentMode:9];
  -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", v39, v40);
  -[ICBaseTextView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v15);
  double v29 = v28;
  double v31 = v30;
  [v27 bounds];
  objc_msgSend(v27, "setFrame:", v29 - v20, v31 - v22);
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x263F826E0]) initWithTextLineRects:v25];

  id v33 = objc_alloc(MEMORY[0x263F826F0]);
  [v27 frame];
  UIRectGetCenter();
  uint64_t v34 = objc_msgSend(v33, "initWithContainer:center:", v15);

  uint64_t v35 = (void *)[objc_alloc(MEMORY[0x263F82CB8]) initWithView:v27 parameters:v32 target:v34];

  return v35;
}

- (id)correctlyPositionedPreviewForCharacterRange:(_NSRange)a3 uiRange:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  BOOL v8 = [(ICBaseTextView *)self editorController];
  id v9 = [v8 note];
  double v10 = [v9 textStorage];

  if (location >= [v10 length])
  {
    CGRect v12 = 0;
  }
  else
  {
    objc_opt_class();
    id v11 = [v10 attribute:*MEMORY[0x263F814A0] atIndex:location effectiveRange:0];
    CGRect v12 = ICDynamicCast();
  }
  id v13 = objc_msgSend(v7, "_ic_textFindingResult");
  if (v12)
  {
    NSUInteger v90 = length;
    id v92 = v13;
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([(ICBaseTextView *)self textLayoutManager],
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      objc_opt_class();
      id v15 = [(ICBaseTextView *)self textLayoutManager];
      id v16 = ICDynamicCast();

      char v17 = [v12 viewIdentifier];
      char v18 = [v16 existingAttachmentViewForIdentifier:v17];
      double v19 = ICProtocolCast();
    }
    else
    {
      objc_opt_class();
      double v20 = [(ICBaseTextView *)self layoutManager];
      id v16 = ICDynamicCast();

      char v17 = [v16 viewForTextAttachmentNoCreate:v12];
      double v19 = ICProtocolCast();
    }

    uint64_t v98 = 0;
    long long v99 = &v98;
    uint64_t v100 = 0x3032000000;
    long long v101 = __Block_byref_object_copy__1;
    long long v102 = __Block_byref_object_dispose__1;
    id v103 = 0;
    v91 = v19;
    if (v19)
    {
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      v95[0] = MEMORY[0x263EF8330];
      v95[1] = 3221225472;
      v95[2] = __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke;
      v95[3] = &unk_2640B83A0;
      v97 = &v98;
      double v22 = v21;
      uint64_t v96 = v22;
      [v19 imageForTextPreviewUsingFindingResult:v92 inTextView:self completion:v95];
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

      double v23 = 0.0;
      if (v99[5]) {
        goto LABEL_29;
      }
    }
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([(ICBaseTextView *)self textLayoutManager],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      objc_opt_class();
      id v25 = [(ICBaseTextView *)self textLayoutManager];
      id v26 = ICDynamicCast();

      uint64_t v27 = [v26 documentRange];
      uint64_t v28 = [v27 location];

      double v29 = [(ICBaseTextView *)self textContainer];
      double v30 = [v29 textLayoutManager];
      double v31 = [v30 locationFromLocation:v28 withOffset:location];
      uint64_t v88 = v28;

      uint64_t v32 = [(ICBaseTextView *)self textContainer];
      id v33 = [v32 textLayoutManager];
      uint64_t v34 = [v33 locationFromLocation:v31 withOffset:v90];

      uint64_t v35 = [(ICBaseTextView *)self textLayoutManager];
      uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263F816E0]) initWithLocation:v31 endLocation:v34];
      [v35 ensureLayoutForRange:v36];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v38 = -[ICBaseTextView _pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:](self, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v12, location, 0, v88);
      }
      else
      {
        id v37 = [(ICBaseTextView *)self textContainer];
        id v38 = [v12 viewProviderForParentView:self location:v31 textContainer:v37];
      }
    }
    else
    {
      objc_opt_class();
      uint64_t v40 = [(ICBaseTextView *)self layoutManager];
      id v26 = ICDynamicCast();

      id v38 = [v12 viewProviderForParentView:self characterIndex:location layoutManager:v26];
    }

    v41 = [v38 view];
    double v23 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v38 additionalXOffsetForTextDragPreviewInTextView:self];
      double v23 = v42;
    }
    if (objc_opt_respondsToSelector())
    {
      [v41 additionalXOffsetForTextDragPreviewInTextView:self];
      double v23 = v43;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v44 = [v38 viewForTextDragPreview];

      v41 = (void *)v44;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v45 = [v41 viewForTextDragPreview];

      v41 = (void *)v45;
    }
    v93[0] = MEMORY[0x263EF8330];
    v93[1] = 3221225472;
    v93[2] = __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_2;
    v93[3] = &unk_2640B83C8;
    id v46 = v41;
    id v94 = v46;
    uint64_t v47 = objc_msgSend(v46, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:fallback:", 0, v93);
    v48 = (void *)v99[5];
    v99[5] = v47;

    if (v99[5])
    {
LABEL_29:
      uint64_t v49 = [(ICBaseTextView *)self subviews];
      uint64_t v50 = objc_msgSend(v49, "ic_objectPassingTest:", &__block_literal_global_1);
      uint64_t v51 = (void *)v50;
      if (v50) {
        v52 = (ICBaseTextView *)v50;
      }
      else {
        v52 = self;
      }
      v53 = v52;

      id v54 = objc_alloc(MEMORY[0x263F82828]);
      NSUInteger v55 = (void *)[v54 initWithImage:v99[5]];
      if (ICInternalSettingsIsTextKit2Enabled()
        && ([(ICBaseTextView *)self textLayoutManager],
            uint64_t v56 = objc_claimAutoreleasedReturnValue(),
            v56,
            v56))
      {
        -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", location, v90);
      }
      else
      {
        uint64_t v57 = [(ICBaseTextView *)self layoutManager];
        uint64_t v58 = objc_msgSend(v57, "glyphRangeForCharacterRange:actualCharacterRange:", location, v90, 0);
        uint64_t v60 = v59;

        -[ICBaseTextView textOriginOffsetForGlyphRange:](self, "textOriginOffsetForGlyphRange:", v58, v60);
      }
      -[ICBaseTextView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v53);
      double v62 = v61;
      double v64 = v63;
      [v55 bounds];
      objc_msgSend(v55, "setFrame:", v62, v64);
      if (v23 != 0.0)
      {
        [v55 frame];
        CGRect v106 = CGRectOffset(v105, v23, 0.0);
        objc_msgSend(v55, "setFrame:", v106.origin.x, v106.origin.y, v106.size.width, v106.size.height);
      }
      objc_opt_class();
      uint64_t v65 = ICDynamicCast();
      uint64_t v66 = v65;
      if (v65)
      {
        [v65 attachmentBoundsMargins];
        CGFloat v68 = v67;
        CGFloat v70 = v69;
        [v55 frame];
        CGRect v108 = CGRectOffset(v107, v68, v70);
        objc_msgSend(v55, "setFrame:", v108.origin.x, v108.origin.y, v108.size.width, v108.size.height);
      }
      id v71 = objc_alloc_init(MEMORY[0x263F826E0]);
      objc_opt_class();
      double v72 = ICDynamicCast();
      [v72 viewCornerRadius];
      if (v73 > 0.0)
      {
        v74 = (void *)MEMORY[0x263F824C0];
        [v55 bounds];
        double v76 = v75;
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        [v72 viewCornerRadius];
        v84 = objc_msgSend(v74, "bezierPathWithRoundedRect:cornerRadius:", v76, v78, v80, v82, v83);
        [v71 setVisiblePath:v84];
      }
      id v85 = objc_alloc(MEMORY[0x263F826F0]);
      [v55 frame];
      UIRectGetCenter();
      double v86 = objc_msgSend(v85, "initWithContainer:center:", v53);
      uint64_t v39 = (void *)[objc_alloc(MEMORY[0x263F82CB8]) initWithView:v55 parameters:v71 target:v86];
    }
    else
    {
      uint64_t v39 = 0;
    }
    _Block_object_dispose(&v98, 8);

    id v13 = v92;
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

void __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  id v4 = [*(id *)(a1 + 32) layer];
  [v4 renderInContext:v3];

  CGContextRestoreGState(v3);
}

uint64_t __83__ICBaseTextView_DragAndDrop__correctlyPositionedPreviewForCharacterRange_uiRange___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)targetedPreviewForPaperKitAttachment:(id)a3 textFindingResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__1;
  uint64_t v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  uint64_t v41 = 0;
  double v42 = (CGRect *)&v41;
  uint64_t v43 = 0x4010000000;
  uint64_t v44 = &unk_20C1E2BF2;
  long long v45 = 0u;
  long long v46 = 0u;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __86__ICBaseTextView_DragAndDrop__targetedPreviewForPaperKitAttachment_textFindingResult___block_invoke;
  v37[3] = &unk_2640B8410;
  uint64_t v39 = &v47;
  uint64_t v40 = &v41;
  id v9 = v8;
  id v38 = v9;
  [v7 generateFindPreviewImageForPaperKitAttachment:v6 completion:v37];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);
  [(ICBaseTextView *)self bounds];
  +[ICPaperKitTextFindingResult scaleForDrawingBounds:](ICPaperKitTextFindingResult, "scaleForDrawingBounds:");
  id v11 = v42;
  CGAffineTransformMakeScale(&v36, v12, v12);
  CGRect v54 = CGRectApplyAffineTransform(v11[1], &v36);
  CGRect v55 = CGRectIntegral(v54);
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  objc_opt_class();
  char v17 = ICDynamicCast();
  char v18 = [v7 framesForHighlightInTextView:v17];
  double v19 = [v18 firstObject];
  [v19 CGRectValue];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  id v28 = objc_alloc(MEMORY[0x263F82828]);
  double v29 = (void *)[v28 initWithImage:v48[5]];
  objc_msgSend(v29, "setFrame:", x, y, width, height);
  UIRectGetCenter();
  objc_msgSend(v29, "setCenter:");
  id v30 = objc_alloc_init(MEMORY[0x263F82AD0]);
  double v31 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v21, v23, v25, v27, 4.0);
  [v30 setVisiblePath:v31];

  id v32 = objc_alloc(MEMORY[0x263F82AE0]);
  [(ICBaseTextView *)self frame];
  UIRectGetCenter();
  id v33 = objc_msgSend(v32, "initWithContainer:center:", self);
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:v29 parameters:v30 target:v33];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v34;
}

void __86__ICBaseTextView_DragAndDrop__targetedPreviewForPaperKitAttachment_textFindingResult___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v13 = a2;
  CGFloat v12 = *(double **)(*(void *)(a1 + 48) + 8);
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_targetedPreviewForRange:(id)a3 withRenderingAttributes:(id)a4 includeFullDocument:(BOOL)a5
{
  BOOL v38 = a5;
  v47[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_msgSend(v7, "_ic_textFindingResult");
  dispatch_time_t v10 = v9;
  if (!v9)
  {
    uint64_t v19 = [(ICBaseTextView *)self ic_characterRangeFromTextRange:v7];
    uint64_t v21 = v20;
    objc_opt_class();
    double v22 = [(ICBaseTextView *)self textStorage];
    double v23 = ICDynamicCast();

    double v24 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:", v19, v21, v23, v8, 0, self);

    goto LABEL_13;
  }
  uint64_t v11 = [v9 range];
  uint64_t v39 = v12;
  id v13 = objc_opt_class();
  id v14 = [(ICBaseTextView *)self editorController];
  id v15 = [v14 note];
  id v16 = objc_msgSend(v13, "attachmentInNote:range:", v15, v11, v39);

  objc_opt_class();
  char v17 = ICDynamicCast();
  if ([v16 attachmentType] == 13 && v17)
  {
    uint64_t v18 = [(ICBaseTextView *)self targetedPreviewForPaperKitAttachment:v16 textFindingResult:v17];
  }
  else
  {
    if (![v10 isAttachmentResult])
    {
      objc_opt_class();
      double v25 = [(ICBaseTextView *)self textStorage];
      id v37 = ICDynamicCast();

      CGAffineTransform v36 = [v37 attribute:*MEMORY[0x263F5AB28] atIndex:v11 effectiveRange:0];
      uint64_t v42 = 0;
      uint64_t v43 = &v42;
      uint64_t v44 = 0x2020000000;
      char v45 = 0;
      if ([v36 isList])
      {
        double v26 = [(ICBaseTextView *)self textLayoutManager];
        uint64_t v35 = [(ICBaseTextView *)self textLayoutManager];
        double v27 = objc_msgSend(v35, "ic_textRangeForRange:", v11, v39);
        id v28 = [v27 location];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __100__ICBaseTextView_DragAndDrop___targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke;
        v41[3] = &unk_2640B8438;
        v41[4] = self;
        v41[5] = &v42;
        v41[6] = v11;
        v41[7] = v39;
        id v29 = (id)[v26 enumerateTextLayoutFragmentsFromLocation:v28 options:0 usingBlock:v41];
      }
      v46[0] = *MEMORY[0x263F81500];
      id v30 = [MEMORY[0x263F825C8] blackColor];
      v47[0] = v30;
      v46[1] = *MEMORY[0x263F814A8];
      double v31 = [MEMORY[0x263F825C8] clearColor];
      v47[1] = v31;
      id v32 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

      LODWORD(v31) = *((unsigned __int8 *)v43 + 24);
      id v33 = [(ICBaseTextView *)self window];
      double v24 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:temporaryAttributes:forceOffsetCalculation:containerView:", v11, v39, v37, v32, v31 != 0, v33);

      _Block_object_dispose(&v42, 8);
      goto LABEL_12;
    }
    uint64_t v18 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:uiRange:](self, "correctlyPositionedPreviewForCharacterRange:uiRange:", v11, v39, v7);
  }
  double v24 = (void *)v18;
LABEL_12:

LABEL_13:
  if (!v24)
  {
    v40.receiver = self;
    v40.super_class = (Class)ICBaseTextView;
    double v24 = [(ICBaseTextView *)&v40 _targetedPreviewForRange:v7 withRenderingAttributes:v8 includeFullDocument:v38];
  }

  return v24;
}

uint64_t __100__ICBaseTextView_DragAndDrop___targetedPreviewForRange_withRenderingAttributes_includeFullDocument___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  char v5 = [v3 textLayoutManager];
  id v6 = [v4 rangeInElement];

  uint64_t v7 = objc_msgSend(v5, "ic_rangeForTextRange:", v6);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v7 == a1[6];
  return 0;
}

- (CGRect)enclosingRectForGlyphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (ICInternalSettingsIsTextKit2Enabled()
    && ([(ICBaseTextView *)self textLayoutManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [(ICBaseTextView *)self textLayoutManager];
    id v8 = objc_msgSend(v7, "ic_textRangeForRange:", location, length);

    id v9 = [(ICBaseTextView *)self textContainer];
    [v9 textContainerOrigin];
    uint64_t v11 = v10;
    uint64_t v13 = v12;

    uint64_t v41 = 0;
    uint64_t v42 = (double *)&v41;
    uint64_t v43 = 0x4010000000;
    uint64_t v44 = &unk_20C1E2BF2;
    long long v14 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v45 = *MEMORY[0x263F001A0];
    long long v46 = v14;
    id v15 = [(ICBaseTextView *)self textLayoutManager];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke;
    v40[3] = &unk_2640B8460;
    v40[5] = v11;
    v40[6] = v13;
    v40[4] = &v41;
    [v15 enumerateTextSegmentsInRange:v8 type:1 options:0 usingBlock:v40];

    double v16 = v42[4];
    double v17 = v42[5];
    double v18 = v42[6];
    double v19 = v42[7];
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v42 = (double *)&v41;
    uint64_t v43 = 0x4010000000;
    uint64_t v44 = &unk_20C1E2BF2;
    long long v20 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v45 = *MEMORY[0x263F001A0];
    long long v46 = v20;
    uint64_t v21 = [(ICBaseTextView *)self textContainer];
    [v21 textContainerOrigin];
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    double v26 = [(ICBaseTextView *)self layoutManager];
    double v27 = [(ICBaseTextView *)self textContainer];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke_2;
    v33[3] = &unk_2640B8488;
    v33[4] = self;
    NSUInteger v36 = location;
    NSUInteger v37 = length;
    id v28 = v21;
    uint64_t v38 = v23;
    uint64_t v39 = v25;
    id v34 = v28;
    uint64_t v35 = &v41;
    objc_msgSend(v26, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", location, length, location, length, v27, v33);

    double v16 = v42[4];
    double v17 = v42[5];
    double v18 = v42[6];
    double v19 = v42[7];

    _Block_object_dispose(&v41, 8);
  }
  double v29 = v16;
  double v30 = v17;
  double v31 = v18;
  double v32 = v19;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

uint64_t __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGRect v11 = CGRectOffset(*(CGRect *)&a2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  if (v11.size.height > 0.0 || v11.size.width > 0.0) {
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), *(CGRect *)&x);
  }
  return 1;
}

void __58__ICBaseTextView_DragAndDrop__enclosingRectForGlyphRange___block_invoke_2(uint64_t a1, CGFloat a2, double a3, CGFloat a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) layoutManager];
  objc_msgSend(v7, "boundingRectForGlyphRange:inTextContainer:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40));
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12.origin.CGFloat x = a2;
  v12.origin.CGFloat y = v9;
  v12.size.CGFloat width = a4;
  v12.size.CGFloat height = v11;
  CGRect v13 = CGRectOffset(v12, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
  *(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)+ 32), v13);
}

- (void)beginDrop
{
  id v3 = [(ICBaseTextView *)self TTTextStorage];
  [v3 breakUndoCoalescing];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v4 = [(ICBaseTextView *)self TTTextStorage];
    [v4 beginEditing];
  }
}

- (void)finishDropWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(ICBaseTextView *)self icaxTextDidChange];
    char v5 = [(ICBaseTextView *)self editorController];
    id v6 = [v5 note];
    [v6 updateChangeCountWithReason:@"Finished string drop"];
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    uint64_t v7 = [(ICBaseTextView *)self TTTextStorage];
    [v7 endEditing];
  }
  double v8 = [(ICBaseTextView *)self TTTextStorage];
  [v8 fixupAfterEditing];

  CGFloat v9 = [(ICBaseTextView *)self editorController];
  double v10 = [v9 note];
  [v10 save];

  CGFloat v11 = [(ICBaseTextView *)self editorController];
  CGRect v12 = [v11 note];
  CGRect v13 = [v12 managedObjectContext];
  objc_msgSend(v13, "ic_save");

  long long v14 = [(ICBaseTextView *)self editorController];
  id v15 = [v14 note];
  [v15 setShouldAddMediaAsynchronously:0];

  objc_initWeak(&location, self);
  double v16 = [MEMORY[0x263F5ACA0] sharedContext];
  double v17 = [v16 snapshotManagedObjectContext];

  double v18 = dispatch_get_global_queue(-32768, 0);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke;
  v21[3] = &unk_2640B84D8;
  id v22 = v17;
  id v23 = v4;
  id v19 = v4;
  id v20 = v17;
  objc_copyWeak(&v24, &location);
  dispatch_async(v18, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke(id *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_2;
  v3[3] = &unk_2640B84D8;
  id v2 = a1[4];
  id v4 = a1[5];
  id v5 = a1[4];
  objc_copyWeak(&v6, a1 + 6);
  [v2 performBlockAndWait:v3];
  objc_destroyWeak(&v6);
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = 0;
  CGFloat v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_3;
  v7[3] = &unk_2640B84B0;
  id v5 = v2;
  id v8 = v5;
  CGFloat v9 = &v10;
  objc_msgSend(v3, "ic_enumerateAttachmentsInContext:usingBlock:", v4, v7);
  objc_msgSend(*(id *)(a1 + 40), "ic_save");
  if (*((unsigned char *)v11 + 24))
  {
    objc_copyWeak(&v6, (id *)(a1 + 48));
    dispatchMainAfterDelay();
    objc_destroyWeak(&v6);
  }

  _Block_object_dispose(&v10, 8);
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectID];
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v4 = [MEMORY[0x263F5B230] sharedGenerator];
    [v4 generatePreviewIfNeededForAttachmentWithObjectID:v7];
  }
  [v3 updateChangeCountWithReason:@"Finished string drop"];
  id v5 = [v3 media];
  [v5 updateChangeCountWithReason:@"Finished string drop"];

  int v6 = [v3 attachmentType];
  if (v6 == 10) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __52__ICBaseTextView_DragAndDrop__finishDropWithString___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained editorController];
  id v3 = [v2 note];

  objc_msgSend(v3, "updatePKDrawingsWithHandwritingRecognitionEnabled:", objc_msgSend(v3, "isHandwritingRecognitionEnabled"));
}

- (BOOL)handleTopotextDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = *MEMORY[0x263F5AA90];
  int v17 = [v12 hasRepresentationConformingToTypeIdentifier:*MEMORY[0x263F5AA90] fileOptions:0];
  if (v17)
  {
    objc_initWeak(&location, self);
    double v18 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [(ICBaseTextView *)self editorController];
      id v20 = [v23 note];
      uint64_t v21 = [v20 shortLoggingDescription];
      *(_DWORD *)buf = 138412546;
      id v22 = (void *)v21;
      uint64_t v31 = v21;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_debug_impl(&dword_20BE60000, v18, OS_LOG_TYPE_DEBUG, "Topotext drop in note: %@, position: %@", buf, 0x16u);
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v24[3] = &unk_2640B8528;
    objc_copyWeak(&v28, &location);
    id v25 = v14;
    double v26 = self;
    id v27 = v15;
    *a6 = [v12 loadDataRepresentationForTypeIdentifier:v16 completionHandler:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (v5
    && WeakRetained
    && ([MEMORY[0x263F5ACA8] pasteboardDataFromPersistenceData:v5],
        (CGFloat v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = v9;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v14[3] = &unk_2640B8500;
    CGFloat v11 = *(void **)(a1 + 32);
    id v12 = *(void **)(a1 + 48);
    v14[4] = *(void *)(a1 + 40);
    id v15 = v9;
    id v17 = v12;
    id v16 = *(id *)(a1 + 32);
    id v13 = v10;
    [v11 performBlockAndWait:v14];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __121__ICBaseTextView_DragAndDrop__handleTopotextDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) supportsAttachments];
  if (v4)
  {
    objc_opt_class();
    id v5 = ICDynamicCast();
    id v6 = [v5 cellDelegate];
    id v7 = [v6 attachment];
    id v8 = [v7 objectID];

    if (v8)
    {
      CGFloat v9 = [v3 managedObjectContext];
      uint64_t v10 = [v9 existingObjectWithID:v8 error:0];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  CGFloat v11 = (void *)MEMORY[0x263F086A0];
  id v12 = [*(id *)(a1 + 40) attributedStringData];
  id v13 = [*(id *)(a1 + 40) dataPersister];
  id v17 = 0;
  id v14 = objc_msgSend(v11, "ic_attributedStringWithData:dataPersister:note:parentAttachment:shouldCreateAttachments:error:", v12, v13, v3, v10, v4, &v17);
  id v15 = v17;

  id v16 = [v3 managedObjectContext];
  objc_msgSend(v16, "ic_save");

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (v15) {
    objc_msgSend(*(id *)(a1 + 48), "addErrorWithCode:", objc_msgSend(v15, "code"));
  }
}

- (BOOL)handleInlineDrawingDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (id)*MEMORY[0x263F5A988];
  if (([v12 hasRepresentationConformingToTypeIdentifier:v16 fileOptions:0] & 1) == 0)
  {
    id v17 = (id)*MEMORY[0x263F5A980];

    if ([v12 hasRepresentationConformingToTypeIdentifier:v17 fileOptions:0])
    {
      id v16 = v17;
    }
    else
    {
      id v16 = (id)*MEMORY[0x263F14C70];

      if (([v12 hasRepresentationConformingToTypeIdentifier:v16 fileOptions:0] & 1) == 0)
      {

        goto LABEL_10;
      }
    }
  }
  if (!v16)
  {
LABEL_10:
    BOOL v20 = 0;
    goto LABEL_11;
  }
  double v18 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v24 = [(ICBaseTextView *)self editorController];
    id v22 = [v24 note];
    id v23 = [v22 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    uint64_t v31 = v23;
    __int16 v32 = 2112;
    id v33 = v13;
    __int16 v34 = 2112;
    id v35 = v16;
    _os_log_debug_impl(&dword_20BE60000, v18, OS_LOG_TYPE_DEBUG, "Inline drawing drop in note: %@, position: %@, uti: %@", buf, 0x20u);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
  v25[3] = &unk_2640B8550;
  id v26 = v16;
  id v27 = self;
  id v28 = v14;
  id v29 = v15;
  id v19 = v16;
  *a6 = [v12 loadDataRepresentationForTypeIdentifier:v19 completionHandler:v25];

  BOOL v20 = 1;
LABEL_11:

  return v20;
}

void __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = 0;
LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  if ([MEMORY[0x263F5AB78] typeUTIIsInlineDrawing:a1[4]])
  {
    id v14 = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F14AE0]) initWithData:v5 error:&v14];
    id v8 = v14;
    if (v8)
    {
      CGFloat v9 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();
      }
    }
    goto LABEL_9;
  }
  uint64_t v10 = [MEMORY[0x263F14BD8] strokeSelectionFromData:v5];
  uint64_t v7 = 0;
LABEL_11:
  if (v10 | v7)
  {
    CGFloat v11 = (void *)a1[5];
    uint64_t v12 = a1[6];
    if (v7) {
      [v11 attributedStringForDrawing:v7 session:v12];
    }
    else {
    id v13 = [v11 attributedStringForStrokeSelection:v10 session:v12];
    }
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (BOOL)handleInlinePaperDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = *MEMORY[0x263F14C68];
  int v14 = [v10 hasRepresentationConformingToTypeIdentifier:*MEMORY[0x263F14C68] fileOptions:0];
  if (v14)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v16[3] = &unk_2640B8618;
    id v18 = v12;
    id v17 = v11;
    *a6 = [v10 loadFileRepresentationForTypeIdentifier:v13 completionHandler:v16];
  }
  return v14;
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__1;
  v51[4] = __Block_byref_object_dispose__1;
  id v52 = 0;
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__1;
  uint64_t v49 = __Block_byref_object_dispose__1;
  id v50 = 0;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v41[3] = &unk_2640B8578;
    id v42 = v7;
    uint64_t v43 = &v45;
    uint64_t v44 = v51;
    [v42 performBlockAndWait:v41];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3;
    aBlock[3] = &unk_2640B85C8;
    id v39 = *(id *)(a1 + 32);
    objc_super v40 = &v45;
    id v8 = (void (**)(void))_Block_copy(aBlock);
    CGFloat v9 = NSURL;
    id v10 = NSTemporaryDirectory();
    id v11 = [v9 fileURLWithPath:v10 isDirectory:1];
    uint64_t v12 = [MEMORY[0x263F08C38] UUID];
    uint64_t v13 = [(id)v12 UUIDString];
    id v14 = [v11 URLByAppendingPathComponent:v13];

    id v15 = [MEMORY[0x263F08850] defaultManager];
    id v37 = v6;
    LOBYTE(v12) = [v15 linkItemAtURL:v5 toURL:v14 error:&v37];
    id v16 = v37;

    if (v12)
    {
      id v6 = v16;
    }
    else
    {
      id v17 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_2();
      }

      id v18 = [MEMORY[0x263F08850] defaultManager];
      id v36 = v16;
      char v19 = [v18 copyItemAtURL:v5 toURL:v14 error:&v36];
      id v6 = v36;

      if ((v19 & 1) == 0)
      {
        id v28 = os_log_create("com.apple.notes", "DragAndDrop");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();
        }

        v8[2](v8);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_16;
      }
    }
    id v35 = 0;
    int v20 = [v14 getResourceValue:&v35 forKey:*MEMORY[0x263EFF670] error:0];
    id v21 = v35;
    id v22 = v21;
    if (v20 && [v21 isEqual:*MEMORY[0x263EFF678]])
    {
      id v23 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v14 options:0 error:0];
      uint64_t v24 = [NSURL URLWithDataRepresentation:v23 relativeToURL:0];

      char v25 = 0;
      id v14 = (id)v24;
    }
    else
    {
      char v25 = 1;
    }
    id v26 = (void *)MEMORY[0x263F5ACB8];
    uint64_t v27 = v46[5];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_128;
    v29[3] = &unk_2640B85F0;
    uint64_t v31 = v8;
    id v32 = *(id *)(a1 + 40);
    id v33 = v51;
    char v34 = v25;
    id v14 = v14;
    id v30 = v14;
    [v26 copyNewPaperBundleToAttachment:v27 fromURL:v14 completionHandler:v29];

LABEL_16:
    goto LABEL_17;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(v51, 8);
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  [*(id *)(a1 + 32) incrementNumberOfAttachmentsAttemptedAdded];
  if ([v13 canAddAttachment])
  {
    id v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    uint64_t v5 = [v13 addSystemPaperAttachmentWithIdentifier:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)[objc_alloc(MEMORY[0x263F5B468]) initWithAttachment:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v9 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = [v13 managedObjectContext];
    objc_msgSend(v12, "ic_save");
  }
  else
  {
    [*(id *)(a1 + 32) addErrorWithCode:202];
  }
}

uint64_t __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_4;
  v3[3] = &unk_2640B85A0;
  v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  return [v1 performBlockAndWait:v3];
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v3 setNeedsInitialRelationshipSetup:0];
  [MEMORY[0x263F5AB78] deleteAttachment:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  id v5 = [v4 managedObjectContext];

  objc_msgSend(v5, "ic_save");
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_128(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 64))
  {
    id v3 = [MEMORY[0x263F08850] defaultManager];
    [v3 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
}

- (BOOL)handlePaperDocumentDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ((ICInternalSettingsIsPDFsInNotesEnabled() & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"ICInternalSettingsIsPDFsInNotesEnabled()" functionName:"-[ICBaseTextView(DragAndDrop) handlePaperDocumentDropForItemProvider:atTextPosition:pasteSession:outProgress:completionBlock:]" simulateCrash:1 showAlert:0 format:@"PDFsInNotes must be enabled"];
  }
  id v16 = [(id)*MEMORY[0x263F1DBF0] identifier];
  int v17 = [v12 hasRepresentationConformingToTypeIdentifier:v16 fileOptions:0];
  if (v17)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v19[3] = &unk_2640B8690;
    objc_copyWeak(&v24, &location);
    id v20 = v16;
    id v21 = v12;
    id v23 = v15;
    id v22 = v14;
    *a6 = [v21 loadFileRepresentationForTypeIdentifier:v20 completionHandler:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (id v8 = objc_opt_class(),
        uint64_t v9 = *(void *)(a1 + 32),
        [*(id *)(a1 + 40) suggestedName],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)[v8 copyTmpFileToTmpFileInSubDirectory:v5 uti:v9 suggestedName:v10],
        v10,
        v11))
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__1;
    v31[4] = __Block_byref_object_dispose__1;
    id v32 = 0;
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = __Block_byref_object_copy__1;
    id v29 = __Block_byref_object_dispose__1;
    id v30 = 0;
    id v12 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
    v20[3] = &unk_2640B8640;
    id v21 = v12;
    id v23 = &v25;
    id v22 = *(id *)(a1 + 40);
    id v24 = v31;
    [v21 performBlockAndWait:v20];
    id v13 = (void *)MEMORY[0x263F5ACB8];
    uint64_t v14 = v26[5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3;
    v16[3] = &unk_2640B8668;
    id v15 = v11;
    id v17 = v15;
    id v18 = *(id *)(a1 + 56);
    char v19 = v31;
    [v13 createPaperDocumentForAttachment:v14 fromLegacyMediaAtURL:v15 completionHandler:v16];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  [*(id *)(a1 + 32) incrementNumberOfAttachmentsAttemptedAdded];
  if ([v16 canAddAttachment])
  {
    id v3 = [MEMORY[0x263F08C38] UUID];
    id v4 = [v3 UUIDString];
    uint64_t v5 = [v16 addPaperDocumentAttachmentWithIdentifier:v4 subtype:*MEMORY[0x263F5A990]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 40) suggestedName];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) suggestedName];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTitle:v10];
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x263F5B400]) initWithAttachment:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = [v16 managedObjectContext];
    objc_msgSend(v15, "ic_save");
  }
  else
  {
    [*(id *)(a1 + 32) addErrorWithCode:202];
  }
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v10];
  id v7 = v10;
  id v8 = v7;
  if (v6)
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v9 = [v7 code];

  if (v9 != 4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3_cold_1((void *)(a1 + 32), (uint64_t)v8, v5);
    }
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)hasSupportedImageInItemProvider:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = a3;
  id v3 = [v17 registeredTypeIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    id v7 = (void *)*MEMORY[0x263F1DAD0];
    uint64_t v8 = *MEMORY[0x263F1DB18];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v7 identifier];
        if ([v10 isEqualToString:v11])
        {
        }
        else
        {
          uint64_t v12 = [MEMORY[0x263F1D920] typeWithIdentifier:v10];
          char v13 = [v12 conformsToType:v8];

          if (v13)
          {

            id v15 = v17;
            char v14 = [v17 canLoadObjectOfClass:objc_opt_class()];
            goto LABEL_13;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  char v14 = 0;
  id v15 = v17;
LABEL_13:

  return v14;
}

- (id)attributedStringForImageData:(id)a3 imageTypeUTI:(id)a4 itemProvider:(id)a5 pasteSession:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__1;
  id v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__ICBaseTextView_DragAndDrop__attributedStringForImageData_imageTypeUTI_itemProvider_pasteSession___block_invoke;
  v19[3] = &unk_2640B86B8;
  id v13 = v12;
  id v20 = v13;
  id v14 = v9;
  id v21 = v14;
  id v15 = v10;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  id v24 = &v25;
  [v13 performBlockAndWait:v19];
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);

  return v17;
}

void __99__ICBaseTextView_DragAndDrop__attributedStringForImageData_imageTypeUTI_itemProvider_pasteSession___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  [*(id *)(a1 + 32) incrementNumberOfAttachmentsAttemptedAdded];
  if (([v18 canAddAttachment] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = 202;
    goto LABEL_5;
  }
  if (objc_msgSend(v18, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(*(id *)(a1 + 40), "length")))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = 207;
LABEL_5:
    [v3 addErrorWithCode:v4];
    goto LABEL_11;
  }
  uint64_t v5 = [MEMORY[0x263F5AB78] filenameExtensionForUTI:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(a1 + 56) suggestedName];
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x263F5AB78] filenameFromUTI:*(void *)(a1 + 48)];
  }
  id v7 = objc_msgSend(v6, "ic_sanitizedFilenameString");

  if (![v7 length])
  {
    uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"Image" value:&stru_26C10E100 table:0];

    id v7 = (void *)v9;
  }
  id v10 = [v7 stringByDeletingPathExtension];

  id v11 = [v10 stringByAppendingPathExtension:v5];

  id v12 = [v18 addAttachmentWithData:*(void *)(a1 + 40) filename:v11];
  id v13 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:v12];
  uint64_t v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v13];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  id v17 = [v18 managedObjectContext];
  objc_msgSend(v17, "ic_save");

LABEL_11:
}

- (id)attributedStringForStrokeSelection:(id)a3 session:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v25 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F14AE0]);
  [v5 boundsWithoutLasso];
  double v10 = v9;
  BOOL v11 = v9 < 760.0;
  double v12 = 0.0;
  if (v11) {
    double v12 = 8.0;
  }
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeTranslation(&v35, v12 - v7, 8.0 - v8);
  if (v10 > 768.0)
  {
    CGAffineTransformMakeScale(&t2, 768.0 / v10, 768.0 / v10);
    CGAffineTransform t1 = v35;
    CGAffineTransformConcat(&v34, &t1, &t2);
    CGAffineTransform v35 = v34;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v27 = v5;
  id v13 = [v5 strokes];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    uint64_t v17 = *MEMORY[0x263F14C90];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v20 = [v19 ink];
        id v21 = [v20 identifier];
        char v22 = [v21 isEqualToString:v17];

        if ((v22 & 1) == 0)
        {
          CGAffineTransform v34 = v35;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v15);
  }

  id v23 = [(ICBaseTextView *)self attributedStringForDrawing:v6 session:v25];

  return v23;
}

- (id)attributedStringForDrawing:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  id v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  [v6 bounds];
  objc_msgSend(v6, "set_canvasBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), 768.0, CGRectGetMaxY(v24));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ICBaseTextView_DragAndDrop__attributedStringForDrawing_session___block_invoke;
  v12[3] = &unk_2640B86E0;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = self;
  uint64_t v16 = &v17;
  [v8 performBlockAndWait:v12];
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v10;
}

void __66__ICBaseTextView_DragAndDrop__attributedStringForDrawing_session___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  [*(id *)(a1 + 32) incrementNumberOfAttachmentsAttemptedAdded];
  if ([v16 canAddAttachment])
  {
    id v3 = [v16 addAttachmentWithUTI:*MEMORY[0x263F5A980]];
    uint64_t v4 = [*(id *)(a1 + 40) serialize];
    [v3 setMergeableData:v4];

    id v5 = (void *)[objc_alloc(MEMORY[0x263F5B368]) initWithAttachment:v3];
    id v6 = [*(id *)(a1 + 48) icDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v7 = [*(id *)(a1 + 48) icDelegate];
      int v8 = [v7 shouldInsertNewDrawingsAsPaper];

      if (!v8)
      {
LABEL_6:
        uint64_t v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v5];
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        uint64_t v15 = [v16 managedObjectContext];
        objc_msgSend(v15, "ic_save");

        goto LABEL_8;
      }
      id v6 = [v16 managedObjectContext];
      id v9 = [[_TtC11NotesEditor28ICInlineDrawingUpgradeHelper alloc] initWithNote:v16 managedObjectContext:v6 textView:*(void *)(a1 + 48)];
      id v10 = -[ICInlineDrawingUpgradeHelper upgradeWithAttachment:itemProviders:itemsLocation:](v9, "upgradeWithAttachment:itemProviders:itemsLocation:", v3, MEMORY[0x263EFFA68], *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      uint64_t v11 = [objc_alloc(MEMORY[0x263F5B468]) initWithAttachment:v10];

      [MEMORY[0x263F5AB78] deleteAttachment:v3];
      id v5 = (void *)v11;
    }

    goto LABEL_6;
  }
  [*(id *)(a1 + 32) addErrorWithCode:202];
LABEL_8:
}

- (BOOL)handleImageDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v38 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(id)*MEMORY[0x263F1DB18] identifier];
  if ([v11 hasRepresentationConformingToTypeIdentifier:v14 fileOptions:0])
  {
    LODWORD(v15) = [(ICBaseTextView *)self hasSupportedImageInItemProvider:v11];

    if (v15)
    {
      objc_initWeak(&location, self);
      id v16 = (void *)MEMORY[0x263EFFA08];
      uint64_t v17 = [(id)*MEMORY[0x263F1DB40] identifier];
      id v18 = [(id)*MEMORY[0x263F1DC08] identifier];
      uint64_t v19 = [(id)*MEMORY[0x263F1DCE0] identifier];
      id v20 = [(id)*MEMORY[0x263F1DAE8] identifier];
      id v21 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, 0);

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v22 = [v11 registeredTypeIdentifiers];
      id v23 = (id)[v22 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v51;
        while (2)
        {
          for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(v22);
            }
            id v26 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([v21 containsObject:v26])
            {
              id v23 = v26;
              goto LABEL_14;
            }
          }
          id v23 = (id)[v22 countByEnumeratingWithState:&v50 objects:v61 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      uint64_t v27 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        CGAffineTransform v34 = [(ICBaseTextView *)self editorController];
        CGAffineTransform v35 = [v34 note];
        id v36 = [v35 shortLoggingDescription];
        *(_DWORD *)buf = 138412802;
        uint64_t v56 = v36;
        __int16 v57 = 2112;
        id v58 = v38;
        __int16 v59 = 2112;
        id v60 = v23;
        _os_log_debug_impl(&dword_20BE60000, v27, OS_LOG_TYPE_DEBUG, "Image drop in note: %@, position: %@, uti: %@", buf, 0x20u);
      }
      if (v23)
      {
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
        v44[3] = &unk_2640B8708;
        long long v28 = &v49;
        objc_copyWeak(&v49, &location);
        id v45 = v23;
        id v46 = v11;
        id v47 = v12;
        id v48 = v13;
        *a6 = [v46 loadDataRepresentationForTypeIdentifier:v45 completionHandler:v44];

        long long v29 = &v45;
        uint64_t v15 = &v46;
        long long v30 = &v47;
      }
      else
      {
        uint64_t v31 = objc_opt_class();
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
        v39[3] = &unk_2640B8730;
        long long v28 = &v43;
        objc_copyWeak(&v43, &location);
        id v40 = v11;
        id v41 = v12;
        id v42 = v13;
        id v32 = [v40 loadObjectOfClass:v31 completionHandler:v39];
        long long v29 = &v40;
        uint64_t v15 = &v41;
        long long v30 = &v42;
        *a6 = v32;
      }

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
      LOBYTE(v15) = 1;
    }
  }
  else
  {

    LOBYTE(v15) = 0;
  }

  return (char)v15;
}

void __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (v9 && WeakRetained)
  {
    int v8 = [WeakRetained attributedStringForImageData:v9 imageTypeUTI:*(void *)(a1 + 32) itemProvider:*(void *)(a1 + 40) pasteSession:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __118__ICBaseTextView_DragAndDrop__handleImageDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v7 = UIImagePNGRepresentation(v6);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = WeakRetained;
    if (v7) {
      BOOL v10 = WeakRetained == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      id v11 = [(id)*MEMORY[0x263F1DC08] identifier];
      id v12 = [v9 attributedStringForImageData:v7 imageTypeUTI:v11 itemProvider:*(void *)(a1 + 32) pasteSession:*(void *)(a1 + 40)];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:
}

- (BOOL)handleMovieOrAudioDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v41 = a4;
  id v44 = a5;
  id v42 = a7;
  id v11 = (void *)*MEMORY[0x263F1DBC8];
  id v12 = [(id)*MEMORY[0x263F1DBC8] identifier];
  int v13 = [v10 hasRepresentationConformingToTypeIdentifier:v12 fileOptions:0];
  id v14 = (void **)MEMORY[0x263F1D9B8];
  if (v13)
  {
  }
  else
  {
    uint64_t v15 = [(id)*MEMORY[0x263F1D9B8] identifier];
    int v16 = [v10 hasRepresentationConformingToTypeIdentifier:v15 fileOptions:0];

    if (!v16)
    {
      BOOL v34 = 0;
      goto LABEL_27;
    }
  }
  objc_initWeak(&location, self);
  uint64_t v17 = [v11 identifier];
  int v18 = [v10 hasRepresentationConformingToTypeIdentifier:v17 fileOptions:0];
  uint64_t v19 = *v14;
  if (v18) {
    uint64_t v19 = v11;
  }
  id v20 = v19;

  id v45 = [v20 identifier];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v21 = [v10 registeredTypeIdentifiers];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v26 = objc_msgSend(MEMORY[0x263F1D920], "typeWithIdentifier:", v25, v41);
        int v27 = [v26 conformsToType:v20];

        if (v27)
        {
          id v28 = v25;

          id v45 = v28;
          goto LABEL_16;
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  long long v29 = [(ICBaseTextView *)self editorController];
  long long v30 = [v29 note];
  if (![v30 isPasswordProtected])
  {

    goto LABEL_22;
  }
  char v31 = [MEMORY[0x263F5AB78] isTypeUTISupportedForPasswordProtectedNotes:v45];

  if (v31)
  {
LABEL_22:
    CGAffineTransform v35 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      id v38 = [(ICBaseTextView *)self editorController];
      id v39 = [v38 note];
      id v40 = [v39 shortLoggingDescription];
      *(_DWORD *)buf = 138412546;
      id v58 = v40;
      __int16 v59 = 2112;
      id v60 = v41;
      _os_log_debug_impl(&dword_20BE60000, v35, OS_LOG_TYPE_DEBUG, "Movie/audio drop in note: %@, position: %@", buf, 0x16u);
    }
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    void v46[2] = __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v46[3] = &unk_2640B8758;
    objc_copyWeak(&v51, &location);
    id v47 = v45;
    id v48 = v10;
    id v49 = v44;
    id v50 = v42;
    id v36 = (id)[v48 loadFileRepresentationForTypeIdentifier:v47 completionHandler:v46];

    objc_destroyWeak(&v51);
    BOOL v34 = 1;
    goto LABEL_25;
  }
  if (([v44 didWarnAboutNotSupportedForPasswordProtectedNotes] & 1) == 0)
  {
    id v32 = [MEMORY[0x263F5B258] cannotAddAttachmentsInfoAlertWithAttachmentCount:1];
    id v33 = [(ICBaseTextView *)self window];
    [v32 presentInWindow:v33 completionHandler:0];

    [v44 setDidWarnAboutNotSupportedForPasswordProtectedNotes:1];
  }
  BOOL v34 = 0;
LABEL_25:

  objc_destroyWeak(&location);
LABEL_27:

  return v34;
}

void __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (int v8 = objc_opt_class(),
        uint64_t v9 = *(void *)(a1 + 32),
        [*(id *)(a1 + 40) suggestedName],
        id v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)[v8 copyTmpFileToTmpFileInSubDirectory:v5 uti:v9 suggestedName:v10],
        v10,
        v11))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = [*(id *)(a1 + 40) suggestedName];
    id v14 = [WeakRetained attributedStringForURL:v11 uti:v12 name:v13 metadata:0 synapseData:0 session:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v15 = [v11 URLByDeletingLastPathComponent];
    int v16 = [MEMORY[0x263F08850] defaultManager];
    id v19 = 0;
    [v16 removeItemAtURL:v15 error:&v19];
    id v17 = v19;

    if (v17 && [v17 code] != 4)
    {
      int v18 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (BOOL)handleAttributedStringDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  objc_initWeak(&location, self);
  int v16 = [v12 canLoadObjectOfClass:objc_opt_class()];
  if (v16)
  {
    [v14 setShouldFilterAttributedString:1];
    uint64_t v17 = objc_opt_class();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v19[3] = &unk_2640B8780;
    id v22 = v15;
    id v20 = v12;
    objc_copyWeak(&v23, &location);
    id v21 = v14;
    *a6 = [v20 loadObjectOfClass:v17 completionHandler:v19];

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);

  return v16;
}

void __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = ICDynamicCast();
  if (v7)
  {
    int v8 = (void (*)(void))*((void *)a1[6] + 2);
LABEL_6:
    v8();
    goto LABEL_7;
  }
  id v9 = a1[4];
  id v10 = (void *)*MEMORY[0x263F1DC70];
  id v11 = [(id)*MEMORY[0x263F1DC70] identifier];
  LODWORD(v9) = [v9 hasItemConformingToTypeIdentifier:v11];

  if (!v9)
  {
    int v8 = (void (*)(void))*((void *)a1[6] + 2);
    goto LABEL_6;
  }
  id v12 = a1[4];
  id v13 = [v10 identifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
  v15[3] = &unk_2640B8528;
  objc_copyWeak(&v19, a1 + 7);
  id v16 = a1[4];
  id v17 = a1[5];
  id v18 = a1[6];
  id v14 = (id)[v12 loadDataRepresentationForTypeIdentifier:v13 completionHandler:v15];

  objc_destroyWeak(&v19);
LABEL_7:
}

void __129__ICBaseTextView_DragAndDrop__handleAttributedStringDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v8 = WeakRetained;
  id v9 = 0;
  if (v5 && WeakRetained)
  {
    id v10 = NSURL;
    id v11 = NSTemporaryDirectory();
    id v12 = [MEMORY[0x263F08C38] UUID];
    id v13 = [v12 UUIDString];
    id v14 = [v11 stringByAppendingPathComponent:v13];
    id v15 = [v10 fileURLWithPath:v14];

    if (v15 && [v5 writeToURL:v15 atomically:1])
    {
      id v16 = [(id)*MEMORY[0x263F1DC70] identifier];
      id v17 = [*(id *)(a1 + 32) suggestedName];
      id v9 = [v8 attributedStringForURL:v15 uti:v16 name:v17 metadata:0 synapseData:0 session:*(void *)(a1 + 40)];

      id v18 = [MEMORY[0x263F08850] defaultManager];
      id v21 = 0;
      [v18 removeItemAtURL:v15 error:&v21];
      id v19 = v21;

      if (v19 && [v19 code] != 4)
      {
        id v20 = os_log_create("com.apple.notes", "DragAndDrop");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();
        }
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)handleMapKitItemDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 canLoadObjectOfClass:objc_opt_class()]
    && (uint64_t v16 = *MEMORY[0x263F5AD98],
        [v12 hasRepresentationConformingToTypeIdentifier:*MEMORY[0x263F5AD98] fileOptions:0]))
  {
    objc_initWeak(&location, self);
    id v17 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [(ICBaseTextView *)self editorController];
      id v21 = [v20 note];
      id v22 = [v21 shortLoggingDescription];
      *(_DWORD *)buf = 138412546;
      long long v30 = v22;
      __int16 v31 = 2112;
      id v32 = v13;
      _os_log_debug_impl(&dword_20BE60000, v17, OS_LOG_TYPE_DEBUG, "MapKitItem drop in note: %@, position: %@", buf, 0x16u);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    void v23[3] = &unk_2640B87D0;
    id v24 = v12;
    objc_copyWeak(&v27, &location);
    id v25 = v14;
    id v26 = v15;
    *a6 = [v24 loadDataRepresentationForTypeIdentifier:v16 completionHandler:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
  v11[3] = &unk_2640B87A8;
  objc_copyWeak(&v16, a1 + 7);
  id v9 = v5;
  id v12 = v9;
  id v13 = a1[4];
  id v14 = a1[5];
  id v15 = a1[6];
  id v10 = (id)[v7 loadObjectOfClass:v8 completionHandler:v11];

  objc_destroyWeak(&v16);
}

void __123__ICBaseTextView_DragAndDrop__handleMapKitItemDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();

  if (v8 && (id v9 = *(void **)(a1 + 32)) != 0 && WeakRetained)
  {
    uint64_t v17 = *MEMORY[0x263F5A958];
    id v10 = [v9 base64EncodedStringWithOptions:0];
    v18[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

    id v12 = [*(id *)(a1 + 40) suggestedName];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v8 _title];
    }
    id v15 = v14;

    id v16 = [WeakRetained attributedStringForURL:v8 uti:0 name:v15 metadata:v11 synapseData:0 session:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (BOOL)handleURLDropForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 outProgress:(id *)a6 completionBlock:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 canLoadObjectOfClass:objc_opt_class()])
  {
    objc_initWeak(&location, self);
    id v16 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [(ICBaseTextView *)self editorController];
      id v22 = [v26 note];
      id v23 = [v22 shortLoggingDescription];
      *(_DWORD *)buf = 138412546;
      id v40 = v23;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_debug_impl(&dword_20BE60000, v16, OS_LOG_TYPE_DEBUG, "Synapse drop in note: %@, position: %@", buf, 0x16u);
    }
    uint64_t v17 = objc_opt_class();
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke;
    v33[3] = &unk_2640B87F8;
    objc_copyWeak(&v37, &location);
    id v36 = v15;
    id v34 = v12;
    id v35 = v14;
    *a6 = [v34 loadObjectOfClass:v17 completionHandler:v33];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    if (![v12 canLoadObjectOfClass:objc_opt_class()])
    {
      BOOL v20 = 0;
      goto LABEL_11;
    }
    [v14 setIsTypeURL:1];
    objc_initWeak(&location, self);
    BOOL v18 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v27 = [(ICBaseTextView *)self editorController];
      id v24 = [v27 note];
      id v25 = [v24 shortLoggingDescription];
      *(_DWORD *)buf = 138412546;
      id v40 = v25;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_debug_impl(&dword_20BE60000, v18, OS_LOG_TYPE_DEBUG, "URL drop in note: %@, position: %@", buf, 0x16u);
    }
    uint64_t v19 = objc_opt_class();
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_153;
    v28[3] = &unk_2640B8730;
    objc_copyWeak(&v32, &location);
    id v29 = v12;
    id v30 = v14;
    id v31 = v15;
    *a6 = [v29 loadObjectOfClass:v19 completionHandler:v28];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  BOOL v20 = 1;
LABEL_11:

  return v20;
}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();

  id v9 = [v8 itemURL];
  if (v9)
  {
    id v16 = v5;
    id v10 = [v8 dataRepresentationWithError:&v16];
    id v11 = v16;

    if (v10)
    {
      id v12 = [v8 displayTitle];
      if (![v12 length])
      {
        uint64_t v13 = [v9 _title];

        id v12 = (void *)v13;
      }
      if (![v12 length])
      {
        uint64_t v14 = [*(id *)(a1 + 32) suggestedName];

        id v12 = (void *)v14;
      }
      id v15 = [WeakRetained attributedStringForURL:v9 uti:0 name:v12 metadata:0 synapseData:v10 session:*(void *)(a1 + 40)];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v11 = v5;
  }
}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_153(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();

  if (v8)
  {
    id v9 = [v8 _title];
    if (![v9 length])
    {
      uint64_t v10 = [a1[4] suggestedName];

      id v9 = (void *)v10;
    }
    if ([v9 length] || !objc_msgSend(a1[4], "canLoadObjectOfClass:", objc_opt_class()))
    {
      uint64_t v14 = [WeakRetained attributedStringForURL:v8 uti:0 name:v9 metadata:0 synapseData:0 session:a1[5]];
      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      id v11 = a1[4];
      uint64_t v12 = objc_opt_class();
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2;
      v15[3] = &unk_2640B8820;
      void v15[4] = WeakRetained;
      id v16 = v8;
      id v17 = a1[5];
      id v18 = a1[6];
      id v13 = (id)[v11 loadObjectOfClass:v12 completionHandler:v15];
    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __116__ICBaseTextView_DragAndDrop__handleURLDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  objc_opt_class();
  id v6 = ICDynamicCast();

  id v7 = [v3 attributedStringForURL:v4 uti:0 name:v6 metadata:0 synapseData:0 session:a1[6]];

  (*(void (**)(void))(a1[7] + 16))();
}

- (id)preferredFileTypesExtensionDictionary
{
  v7[5] = *MEMORY[0x263EF8340];
  id v2 = [(id)*MEMORY[0x263F1DBF0] identifier];
  v6[0] = v2;
  v6[1] = @"com.apple.iwork.keynote.key";
  v7[0] = @"pdf";
  v7[1] = @"key";
  v6[2] = @"com.apple.iwork.pages.pages";
  void v6[3] = @"com.apple.iwork.numbers.numbers";
  v7[2] = @"pages";
  v7[3] = @"numbers";
  id v3 = [(id)*MEMORY[0x263F1DD50] identifier];
  v6[4] = v3;
  void v7[4] = @"vcard";
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];

  return v4;
}

- (id)preferredFileTypeForItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self preferredFileTypesExtensionDictionary];
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [v5 allKeys];
  uint64_t v8 = [v6 setWithArray:v7];

  id v9 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v10 = [v4 registeredTypeIdentifiers];

  id v11 = [v9 setWithArray:v10];

  [v11 intersectSet:v8];
  uint64_t v12 = [v11 anyObject];
  if (v12)
  {
    id v13 = [(ICBaseTextView *)self editorController];
    uint64_t v14 = [v13 note];
    if ([v14 isPasswordProtected])
    {
      char v15 = [MEMORY[0x263F5AB78] isTypeUTISupportedForPasswordProtectedNotes:v12];

      if (v15) {
        goto LABEL_7;
      }
      id v13 = v12;
      uint64_t v12 = 0;
    }
    else
    {
    }
  }
LABEL_7:

  return v12;
}

- (BOOL)shouldCheckURLFirstForItemProvider:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [a3 registeredTypeIdentifiers];
  id v5 = [v3 setWithArray:v4];

  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [(id)*MEMORY[0x263F1DA90] identifier];
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, 0);

  LOBYTE(v7) = [v5 intersectsSet:v8];
  return (char)v7;
}

- (id)attributedStringForURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 synapseData:(id)a7 session:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  char v19 = [v18 supportsAttachments];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__1;
  __int16 v41 = __Block_byref_object_dispose__1;
  id v42 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __92__ICBaseTextView_DragAndDrop__attributedStringForURL_uti_name_metadata_synapseData_session___block_invoke;
  v28[3] = &unk_2640B8848;
  id v20 = v13;
  id v29 = v20;
  id v21 = v18;
  id v30 = v21;
  char v36 = v19;
  id v22 = v14;
  id v31 = v22;
  id v23 = v16;
  id v32 = v23;
  id v24 = v17;
  id v33 = v24;
  id v25 = v15;
  id v34 = v25;
  id v35 = &v37;
  [v21 performBlockAndWait:v28];
  id v26 = (id)v38[5];

  _Block_object_dispose(&v37, 8);

  return v26;
}

void __92__ICBaseTextView_DragAndDrop__attributedStringForURL_uti_name_metadata_synapseData_session___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3
    && objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment")
    && [v3 canAddAttachment]
    && (([*(id *)(a1 + 40) isForDragAndDrop] & 1) != 0
     || !objc_msgSend(*(id *)(a1 + 32), "ic_isWebURL")
     || objc_msgSend(*(id *)(a1 + 32), "ic_isMapURL"))
    && *(unsigned char *)(a1 + 88))
  {
    int v4 = [*(id *)(a1 + 32) isFileURL];
    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      id v38 = 0;
      [v5 getResourceValue:&v38 forKey:*MEMORY[0x263EFF688] error:0];
      id v6 = v38;
      id v7 = v6;
      if (v6) {
        uint64_t v8 = [v6 unsignedIntegerValue];
      }
      else {
        uint64_t v8 = 0;
      }
      [*(id *)(a1 + 40) incrementNumberOfAttachmentsAttemptedAdded];
      if ([v3 attachmentExceedsMaxSizeAllowed:v8])
      {
        [*(id *)(a1 + 40) addErrorWithCode:207];
        id v11 = 0;
      }
      else
      {
        uint64_t v21 = *(void *)(a1 + 48);
        if (v21) {
          [v3 addAttachmentWithUTI:v21 withURL:*(void *)(a1 + 32)];
        }
        else {
        id v11 = [v3 addAttachmentWithFileURL:*(void *)(a1 + 32)];
        }
      }
    }
    else
    {
      id v11 = [v3 addURLAttachmentWithURL:*(void *)(a1 + 32)];
    }
    if (!v11) {
      goto LABEL_21;
    }
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v11, "setMetadata:");
    }
    if (*(void *)(a1 + 64)) {
      objc_msgSend(v11, "setSynapseData:");
    }
    if (*(void *)(a1 + 48)
      && (objc_msgSend(MEMORY[0x263F1D920], "typeWithIdentifier:"),
          id v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 conformsToType:*MEMORY[0x263F1DBF0]],
          v22,
          v23))
    {
      id v24 = (void *)[objc_alloc(MEMORY[0x263F14740]) initWithURL:*(void *)(a1 + 32)];
      id v25 = [v24 documentAttributes];
      id v26 = [v25 objectForKeyedSubscript:*MEMORY[0x263F14878]];

      if ([v26 length])
      {
        [v11 setTitle:v26];
LABEL_51:

LABEL_52:
        id v33 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:v11];
        uint64_t v34 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v33];
        uint64_t v35 = *(void *)(*(void *)(a1 + 80) + 8);
        char v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = v34;

        uint64_t v37 = [v3 managedObjectContext];
        objc_msgSend(v37, "ic_save");

        goto LABEL_21;
      }
      id v30 = [*(id *)(a1 + 72) stringByDeletingPathExtension];
      [v11 setTitle:v30];
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "ic_isMapURL")
        || ([*(id *)(a1 + 32) absoluteString],
            id v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = [v27 isEqualToString:*(void *)(a1 + 72)],
            v27,
            !v28))
      {
        if ([*(id *)(a1 + 72) length]) {
          [v11 setTitle:*(void *)(a1 + 72)];
        }
        goto LABEL_52;
      }
      id v29 = [MEMORY[0x263F08BA0] componentsWithURL:*(void *)(a1 + 32) resolvingAgainstBaseURL:0];
      id v24 = [v29 queryItems];

      id v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"name=%@", @"q"];
      id v30 = [v24 filteredArrayUsingPredicate:v26];
      id v31 = [v30 firstObject];
      id v32 = [v31 value];

      [v11 setTitle:v32];
    }

    goto LABEL_51;
  }
  if (([*(id *)(a1 + 32) isFileURL] & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v10 = v9;
    if (*(void *)(a1 + 72))
    {
      id v11 = objc_msgSend(v9, "initWithString:");
    }
    else
    {
      uint64_t v12 = [*(id *)(a1 + 32) absoluteString];
      id v11 = (void *)[v10 initWithString:v12];
    }
    uint64_t v13 = *MEMORY[0x263F81520];
    id v14 = [*(id *)(a1 + 32) absoluteString];
    objc_msgSend(v11, "addAttribute:value:range:", v13, v14, 0, objc_msgSend(v11, "length"));

    goto LABEL_20;
  }
  if ([*(id *)(a1 + 32) isFileURL]
    && (objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment") & 1) == 0)
  {
    id v18 = objc_alloc(MEMORY[0x263F089B8]);
    char v19 = v18;
    if (*(void *)(a1 + 72))
    {
      id v11 = objc_msgSend(v18, "initWithString:");
    }
    else
    {
      id v20 = [*(id *)(a1 + 32) absoluteString];
      id v11 = (void *)[v19 initWithString:v20];
    }
LABEL_20:
    uint64_t v15 = [v11 copy];
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

LABEL_21:
    goto LABEL_22;
  }
  if (([v3 canAddAttachment] & 1) == 0)
  {
    [*(id *)(a1 + 40) incrementNumberOfAttachmentsAttemptedAdded];
    [*(id *)(a1 + 40) addErrorWithCode:202];
  }
LABEL_22:
}

- (BOOL)handleGenericFileForItemProvider:(id)a3 atTextPosition:(id)a4 pasteSession:(id)a5 preferredTypeIdentifier:(id)a6 outProgress:(id *)a7 completionBlock:(id)a8
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v36 = a4;
  id v14 = a5;
  id v15 = a6;
  id v37 = a8;
  id v16 = v15;
  id v17 = v16;
  if (!v16)
  {
    id v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F5AA90], 0);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = [v13 registeredTypeIdentifiers];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v45;
LABEL_12:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(v26);
        }
        id v30 = *(void **)(*((void *)&v44 + 1) + 8 * v29);
        if (([v25 containsObject:v30] & 1) == 0
          && [(ICBaseTextView *)self isSupportedAsGenericFile:v30])
        {
          break;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v27) {
            goto LABEL_12;
          }
          goto LABEL_19;
        }
      }
      id v17 = v30;

      if (v17) {
        goto LABEL_2;
      }
    }
    else
    {
LABEL_19:

      id v17 = 0;
    }
    goto LABEL_21;
  }
LABEL_2:
  id v18 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v32 = [(ICBaseTextView *)self editorController];
    id v33 = [v32 note];
    uint64_t v34 = [v33 shortLoggingDescription];
    *(_DWORD *)id location = 138412802;
    *(void *)&location[4] = v34;
    __int16 v49 = 2112;
    id v50 = v36;
    __int16 v51 = 2112;
    id v52 = v17;
    _os_log_debug_impl(&dword_20BE60000, v18, OS_LOG_TYPE_DEBUG, "Generic file drop in note: %@, position: %@, UTI: %@", location, 0x20u);
  }
  char v19 = [(ICBaseTextView *)self editorController];
  id v20 = [v19 note];
  if ([v20 isPasswordProtected])
  {
    char v21 = [MEMORY[0x263F5AB78] isTypeUTISupportedForPasswordProtectedNotes:v17];

    if ((v21 & 1) == 0)
    {
      if (([v14 didWarnAboutNotSupportedForPasswordProtectedNotes] & 1) == 0)
      {
        id v22 = [MEMORY[0x263F5B258] cannotAddAttachmentsInfoAlertWithAttachmentCount:1];
        int v23 = [(ICBaseTextView *)self window];
        [v22 presentInWindow:v23 completionHandler:0];

        [v14 setDidWarnAboutNotSupportedForPasswordProtectedNotes:1];
      }
LABEL_21:
      BOOL v24 = 0;
      goto LABEL_22;
    }
  }
  else
  {
  }
  objc_initWeak((id *)location, self);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __144__ICBaseTextView_DragAndDrop__handleGenericFileForItemProvider_atTextPosition_pasteSession_preferredTypeIdentifier_outProgress_completionBlock___block_invoke;
  v38[3] = &unk_2640B8758;
  objc_copyWeak(&v43, (id *)location);
  id v17 = v17;
  id v39 = v17;
  id v40 = v13;
  id v41 = v14;
  id v42 = v37;
  *a7 = [v40 loadFileRepresentationForTypeIdentifier:v17 completionHandler:v38];

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)location);
  BOOL v24 = 1;
LABEL_22:

  return v24;
}

void __144__ICBaseTextView_DragAndDrop__handleGenericFileForItemProvider_atTextPosition_pasteSession_preferredTypeIdentifier_outProgress_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v5
    && (uint64_t v8 = objc_opt_class(),
        uint64_t v9 = *(void *)(a1 + 32),
        [*(id *)(a1 + 40) suggestedName],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (void *)[v8 copyTmpFileToTmpFileInSubDirectory:v5 uti:v9 suggestedName:v10],
        v10,
        v11))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [*(id *)(a1 + 40) suggestedName];
    id v14 = [WeakRetained attributedStringForURL:v11 uti:v12 name:v13 metadata:0 synapseData:0 session:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v15 = [v11 URLByDeletingLastPathComponent];
    id v16 = [MEMORY[0x263F08850] defaultManager];
    id v19 = 0;
    [v16 removeItemAtURL:v15 error:&v19];
    id v17 = v19;

    if (v17 && [v17 code] != 4)
    {
      id v18 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1();
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (BOOL)isSupportedAsGenericFile:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(ICBaseTextView *)self typeIdentifiersSupportedAsGenericFiles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [MEMORY[0x263F1D920] typeWithIdentifier:v4];
        id v11 = [MEMORY[0x263F1D920] typeWithIdentifier:v9];
        char v12 = [v10 conformsToType:v11];

        if (v12)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)shouldAcceptDropSession:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self editorController];
  uint64_t v6 = [v5 note];
  if (!v6)
  {

LABEL_14:
    BOOL v22 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [(ICBaseTextView *)self editorController];
  uint64_t v9 = [v8 note];
  int v10 = [v9 isEditable];

  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = *MEMORY[0x263F5A730];
  v29[0] = @"com.apple.notes.noteitemprovider";
  v29[1] = v11;
  char v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  char v13 = [v4 hasItemsConformingToTypeIdentifiers:v12];

  if (v13) {
    goto LABEL_14;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = objc_msgSend(v4, "items", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v24 + 1) + 8 * i) itemProvider];
        id v20 = [(ICBaseTextView *)self itemProviderConsumerTypesForItemProvider:v19];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          BOOL v22 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  BOOL v22 = 0;
LABEL_17:

LABEL_15:
  return v22;
}

- (id)itemProviderConsumerTypesForItemProvider:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self editorController];
  uint64_t v6 = [v5 note];
  unsigned int v49 = [v6 isPasswordProtected];

  __int16 v51 = self;
  BOOL v7 = [(ICBaseTextView *)self supportsAttachments];
  uint64_t v8 = (void *)MEMORY[0x263EFF980];
  id v41 = v4;
  uint64_t v9 = [v4 registeredTypeIdentifiers];
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v53 = (id)objc_claimAutoreleasedReturnValue();

  if (itemProviderConsumerTypesForItemProvider__onceToken != -1) {
    dispatch_once(&itemProviderConsumerTypesForItemProvider__onceToken, &__block_literal_global_198);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = [v4 registeredTypeIdentifiers];
  uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    uint64_t v13 = !v7 | v49;
    uint64_t v43 = *MEMORY[0x263F1DB18];
    uint64_t v44 = *MEMORY[0x263F1DBF0];
    uint64_t v47 = *MEMORY[0x263F1DD08];
    uint64_t v42 = *MEMORY[0x263F1DBC8];
    uint64_t v40 = *MEMORY[0x263F1D9B8];
    uint64_t v45 = *MEMORY[0x263F1DCF8];
    uint64_t v46 = *MEMORY[0x263F1DA28];
    uint64_t v48 = *(void *)v55;
    do
    {
      uint64_t v14 = 0;
      uint64_t v50 = v11;
      do
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * v14);
        if (v7) {
          uint64_t v16 = &itemProviderConsumerTypesForItemProvider__utiToConsumer;
        }
        else {
          uint64_t v16 = &itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments;
        }
        uint64_t v17 = objc_msgSend((id)*v16, "objectForKeyedSubscript:", *(void *)(*((void *)&v54 + 1) + 8 * v14), v40);
        if (v17)
        {
          [v53 addObject:v17];
          goto LABEL_47;
        }
        if ((v13 & 1) == 0)
        {
          id v18 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
          if ([v18 conformsToType:v44])
          {
            int v19 = ICInternalSettingsDefaultToPaperKitPDFsAndScans();

            if (v19)
            {
              id v20 = v53;
              uint64_t v21 = &unk_26C138D90;
LABEL_22:
              [v20 addObject:v21];
              goto LABEL_24;
            }
          }
          else
          {
          }
        }
        if (!v7) {
          goto LABEL_24;
        }
        BOOL v22 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
        if ([v22 conformsToType:v43])
        {
          BOOL v23 = [(ICBaseTextView *)v51 hasSupportedImageInItemProvider:v41];

          if (!v23) {
            goto LABEL_24;
          }
          id v20 = v53;
          uint64_t v21 = &unk_26C138DA8;
          goto LABEL_22;
        }

LABEL_24:
        uint64_t v24 = v13;
        long long v25 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
        int v26 = [v25 conformsToType:v47];

        if (v26) {
          [v53 addObject:&unk_26C138DC0];
        }
        if (!v7)
        {
          if (v49) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        if (v49) {
          goto LABEL_35;
        }
        long long v27 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
        if ([v27 conformsToType:v42])
        {
        }
        else
        {
          uint64_t v28 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
          int v29 = [v28 conformsToType:v40];

          if (!v29) {
            goto LABEL_34;
          }
        }
        [v53 addObject:&unk_26C138DD8];
LABEL_34:
        id v30 = [(ICBaseTextView *)v51 preferredFileTypesExtensionDictionary];
        id v31 = [v30 objectForKeyedSubscript:v15];

        if (v31) {
          goto LABEL_43;
        }
LABEL_35:
        id v32 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
        if ([v32 conformsToType:v45])
        {

LABEL_38:
          uint64_t v35 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
          if ([v35 conformsToType:v46]) {
            id v36 = &unk_26C138DF0;
          }
          else {
            id v36 = &unk_26C138E08;
          }
          [v53 addObject:v36];

          goto LABEL_42;
        }
        id v33 = [MEMORY[0x263F1D920] typeWithIdentifier:v15];
        int v34 = [v33 conformsToType:v46];

        if (v34) {
          goto LABEL_38;
        }
LABEL_42:
        id v31 = 0;
LABEL_43:
        uint64_t v13 = v24;
        if ((v24 & 1) == 0 && [(ICBaseTextView *)v51 isSupportedAsGenericFile:v15]) {
          [v53 addObject:&unk_26C138E20];
        }

        uint64_t v12 = v48;
        uint64_t v11 = v50;
LABEL_47:

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v11);
  }

  id v37 = [(ICBaseTextView *)v51 itemProviderPasteSession];
  if ([v37 isForDragAndDrop])
  {
  }
  else
  {
    unint64_t v38 = [v53 count];

    if (v38 >= 2) {
      [v53 sortUsingSelector:sel_compare_];
    }
  }

  return v53;
}

void __72__ICBaseTextView_DragAndDrop__itemProviderConsumerTypesForItemProvider___block_invoke()
{
  v11[7] = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F14C68];
  v10[0] = *MEMORY[0x263F5AA90];
  uint64_t v0 = v10[0];
  v10[1] = v1;
  v11[0] = &unk_26C138D00;
  v11[1] = &unk_26C138D18;
  uint64_t v2 = *MEMORY[0x263F14C60];
  v10[2] = *MEMORY[0x263F14C70];
  v10[3] = v2;
  uint64_t v3 = *MEMORY[0x263F5AD98];
  v10[4] = *MEMORY[0x263F5A980];
  v10[5] = v3;
  v11[2] = &unk_26C138D30;
  v11[3] = &unk_26C138D48;
  void v11[4] = &unk_26C138D48;
  v11[5] = &unk_26C138D60;
  v10[6] = *MEMORY[0x263F7C260];
  v11[6] = &unk_26C138D78;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
  id v5 = (void *)itemProviderConsumerTypesForItemProvider__utiToConsumer;
  itemProviderConsumerTypesForItemProvider__utiToConsumer = v4;

  uint64_t v8 = v0;
  uint64_t v9 = &unk_26C138D00;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  BOOL v7 = (void *)itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments;
  itemProviderConsumerTypesForItemProvider__utiToConsumerNoAttachments = v6;
}

- (id)standardizedAttributedString:(id)a3 attachmentIdentifiers:(id *)a4
{
  id v6 = a3;
  if (a4) {
    BOOL v7 = objc_opt_new();
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__1;
  int v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v8 = [(ICBaseTextView *)self itemProviderPasteSession];
  uint64_t v9 = [v8 workerContext];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke;
  uint64_t v17 = &unk_2640B88B8;
  id v10 = v6;
  id v18 = v10;
  int v19 = self;
  uint64_t v21 = &v22;
  id v11 = v7;
  id v20 = v11;
  [v9 performBlockAndWait:&v14];

  if (a4) {
    *a4 = (id)objc_msgSend(v11, "copy", v14, v15, v16, v17, v18, v19);
  }
  uint64_t v12 = objc_msgSend((id)v23[5], "copy", v14, v15, v16, v17);

  _Block_object_dispose(&v22, 8);

  return v12;
}

void __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)MEMORY[0x263F5B498];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) itemProviderPasteSession];
  id v6 = [v5 workerContext];
  BOOL v7 = [v3 standardizedAttributedStringFromAttributedString:v4 withStyler:v2 fixAttachments:0 translateICTTFont:1 context:v6];

  uint64_t v8 = [v7 mutableCopy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) itemProviderPasteSession];
  uint64_t v13 = [v12 workerContext];
  uint64_t v14 = [*(id *)(a1 + 32) length];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke_2;
  v17[3] = &unk_2640B8890;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v15 = (id)v16;
  long long v18 = v16;
  objc_msgSend(v11, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", v13, 0, v14, 2, v17);
}

void __82__ICBaseTextView_DragAndDrop__standardizedAttributedString_attachmentIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v10 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:a2];
  objc_msgSend(v10, "fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3, a4, 0, 1);
  if (*(void *)(a1 + 32))
  {
    BOOL v7 = [v10 attachmentIdentifier];

    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v10 attachmentIdentifier];
      [v8 addObject:v9];
    }
  }
}

- (BOOL)attributedStringContainsICTTAttachment:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = [v3 length];
  uint64_t v5 = *MEMORY[0x263F814A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__ICBaseTextView_DragAndDrop__attributedStringContainsICTTAttachment___block_invoke;
  v8[3] = &unk_2640B80C8;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __70__ICBaseTextView_DragAndDrop__attributedStringContainsICTTAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
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

- (BOOL)_shouldBecomeEditableUponDrop
{
  return 1;
}

- (BOOL)textDroppableView:(id)a3 dropSession:(id)a4 willMoveCaretToRange:(id)a5
{
  if ([(ICBaseTextView *)self isDraggingOverChecklistItem]) {
    LOBYTE(v6) = 0;
  }
  else {
    BOOL v6 = ![(ICBaseTextView *)self inhibitNextDropCursorUpdateAnimation];
  }
  [(ICBaseTextView *)self setInhibitNextDropCursorUpdateAnimation:0];
  return v6;
}

- (id)textDraggableView:(id)a3 textRangeForDragFromPosition:(id)a4 defaultRange:(id)a5 session:(id)a6
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v59 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v11;
  [v12 locationInView:v10];
  double v15 = v14;
  double v17 = v16;
  long long v18 = [(ICBaseTextView *)self containerViewForAttachments];
  uint64_t v19 = objc_msgSend(v18, "hitTest:forEvent:", 0, v15, v17);

  objc_opt_class();
  id v58 = (void *)v19;
  id v20 = ICDynamicCast();
  uint64_t v21 = [(ICBaseTextView *)self containerViewForAttachments];
  uint64_t v22 = [v21 subviews];
  BOOL v23 = objc_msgSend(v22, "ic_objectsPassingTest:", &__block_literal_global_230);

  id v24 = v20;
  long long v25 = v24;
  id v60 = v23;
  if (v24) {
    goto LABEL_2;
  }
  id v57 = v13;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v35 = v23;
  uint64_t v39 = [v35 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (!v39)
  {
    uint64_t v36 = 0;
    long long v25 = 0;
    id v33 = v13;
    goto LABEL_3;
  }
  uint64_t v40 = v39;
  id v56 = v12;
  long long v25 = 0;
  uint64_t v41 = *(void *)v65;
  double v63 = INFINITY;
  double v61 = v17;
  double v62 = v15;
  while (2)
  {
    for (uint64_t i = 0; i != v40; ++i)
    {
      if (*(void *)v65 != v41) {
        objc_enumerationMutation(v35);
      }
      uint64_t v43 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      objc_msgSend(v10, "convertPoint:toView:", 0, v15, v17);
      objc_msgSend(v43, "convertPoint:fromView:", 0);
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      [v43 bounds];
      [(ICBaseTextView *)self touchIsPointer];
      [v43 bounds];
      TSDCenterOfRect();
      TSDDistance();
      double v49 = v48;
      [v43 bounds];
      v71.CGFloat x = v45;
      v71.CGFloat y = v47;
      if (CGRectContainsPoint(v73, v71))
      {
        id v55 = v43;

        long long v25 = v55;
        goto LABEL_25;
      }
      TSDMultiplySizeScalar();
      TSDMultiplySizeScalar();
      TSDAddSizes();
      TSDCenterOfRect();
      TSDRectWithCenterAndSize();
      v72.CGFloat x = v45;
      v72.CGFloat y = v47;
      if (CGRectContainsPoint(v74, v72) && v49 < v63)
      {
        id v51 = v43;

        double v63 = v49;
        long long v25 = v51;
      }
      id v52 = [v25 trackedParagraph];
      [v52 characterRange];
      unint64_t v54 = v53;

      double v17 = v61;
      double v15 = v62;
      if (v54 <= 1)
      {

        long long v25 = 0;
      }
    }
    uint64_t v40 = [v35 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v40) {
      continue;
    }
    break;
  }
LABEL_25:

  id v12 = v56;
  id v13 = v57;
  id v37 = v60;
  if (v25)
  {
LABEL_2:
    int v26 = [v25 trackedParagraph];
    uint64_t v27 = [v26 characterRange];
    uint64_t v29 = v28;

    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v27, v29);
    uint64_t v30 = [(ICBaseTextView *)self selectedRange];
    id v32 = -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v30, v31);
    [(ICBaseTextView *)self setSelectedTextRange:v32];

    id v33 = [(ICBaseTextView *)self selectedTextRange];

    [v25 imageFrame];
    [(ICBaseTextView *)self setChecklistDragVerticalOffset:v34 * 0.75];
    id v35 = [v25 trackedParagraph];
    [(ICBaseTextView *)self setDraggedChecklistTrackedParagraph:v35];
    uint64_t v36 = 1;
LABEL_3:

    id v37 = v60;
    goto LABEL_4;
  }
  uint64_t v36 = 0;
  id v33 = v57;
LABEL_4:
  [(ICBaseTextView *)self setIsDraggingChecklistItem:v36];

  return v33;
}

BOOL __99__ICBaseTextView_DragAndDrop__textDraggableView_textRangeForDragFromPosition_defaultRange_session___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();

  return v3 != 0;
}

- (id)textDroppableView:(id)a3 positionForDrop:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 dropPosition];
  if ([(ICBaseTextView *)self isDraggingChecklistItem])
  {
    id v7 = [v5 dropSession];
    [v7 locationInView:self];
    double v9 = v8;
    double v11 = v10;

    id v12 = [v5 icaxValueForKeyPath:@"dropSession.sessionDestination.isAccessibilitySession"];
    int v13 = [v12 BOOLValue];

    objc_opt_class();
    double v14 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x263F831D0]);
    double v15 = ICDynamicCast();

    if (v15) {
      int v16 = v13;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1)
    {
      [v15 frame];
      TSDClampPointInRect();
      double v9 = v17;
      double v19 = v18;
    }
    else
    {
      [(ICBaseTextView *)self checklistDragVerticalOffset];
      double v19 = v11 - v20;
    }
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([(ICBaseTextView *)self textLayoutManager],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v21))
    {
      uint64_t v22 = [(ICBaseTextView *)self icTextLayoutManager];
      uint64_t v23 = objc_msgSend(v22, "characterIndexForPoint:", v9, v19);

      id v24 = [(ICBaseTextView *)self icTextLayoutManager];
      uint64_t v25 = [v24 trackedTodoParagraphAtIndex:v23];
    }
    else
    {
      int v26 = [(ICBaseTextView *)self icLayoutManager];
      uint64_t v27 = [(ICBaseTextView *)self textContainer];
      uint64_t v23 = objc_msgSend(v26, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v27, 0, v9, v19);

      id v24 = [(ICBaseTextView *)self icLayoutManager];
      uint64_t v25 = [v24 trackedTodoParagraphAtIndexIfExists:v23];
    }
    uint64_t v28 = (void *)v25;

    if (!v28)
    {
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v30 = -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v23, 0);
        uint64_t v31 = [v30 start];

        BOOL v6 = (void *)v31;
      }
      [(ICBaseTextView *)self setIsDraggingOverChecklistItem:0];
      [(ICBaseTextView *)self setTrackedParagraphCurrentlyUnderDraggedChecklist:0];
      id v32 = [(ICBaseTextView *)self tempHighlightLayerIfExists];
      [v32 removeFromSuperlayer];
      goto LABEL_22;
    }
    if (v16)
    {
      uint64_t v29 = [v28 characterRange];
    }
    else
    {
      BOOL v33 = +[ICChecklistDragUtilities shouldDropAboveForTrackedTodoParagraph:forPoint:textView:](ICChecklistDragUtilities, "shouldDropAboveForTrackedTodoParagraph:forPoint:textView:", v28, self, v9, v19);
      uint64_t v34 = [v28 characterRange];
      uint64_t v29 = v34;
      if (!v33)
      {
        uint64_t v29 = v34 + v35;
        goto LABEL_21;
      }
    }
    BOOL v33 = 1;
LABEL_21:
    [(ICBaseTextView *)self setIsDraggingOverChecklistItem:1];
    [(ICBaseTextView *)self setTrackedParagraphCurrentlyUnderDraggedChecklist:v28];
    [(ICBaseTextView *)self setShouldDropChecklistAbove:v33];
    [(ICBaseTextView *)self invalidateDropCaret];
    id v32 = -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v29, 0);
    uint64_t v36 = [v32 start];

    [(ICBaseTextView *)self setLastChecklistDropIndex:v29];
    BOOL v6 = (void *)v36;
LABEL_22:
  }

  return v6;
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  BOOL v6 = [(ICBaseTextView *)self textContainer];
  id v7 = ICDynamicCast();
  char v8 = [v7 insideSiriSnippet];

  if (v8)
  {
    double v9 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_57;
  }
  CGRect v74 = [v5 dragRange];
  NSUInteger v10 = -[ICBaseTextView ic_characterRangeFromTextRange:](self, "ic_characterRangeFromTextRange:");
  uint64_t v12 = v11;
  int v13 = (uint64_t *)MEMORY[0x263F814A0];
  if (v11 != 1) {
    goto LABEL_24;
  }
  objc_opt_class();
  double v14 = [(ICBaseTextView *)self textStorage];
  double v15 = [v14 attribute:*v13 atIndex:v10 effectiveRange:0];
  int v16 = ICDynamicCast();

  if (v16)
  {
    if (([v16 canDragWithoutSelecting] & 1) == 0)
    {
      v87.id location = [(ICBaseTextView *)self selectedRange];
      v87.NSUInteger length = v17;
      v86.id location = v10;
      v86.NSUInteger length = 1;
      if (!NSIntersectionRange(v86, v87).length) {
        goto LABEL_62;
      }
    }
  }
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning())
  {
LABEL_12:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (ICInternalSettingsIsTextKit2Enabled()
        && ([(ICBaseTextView *)self textLayoutManager],
            double v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            v19))
      {
        double v20 = [(ICBaseTextView *)self textLayoutManager];
        uint64_t v21 = [(ICBaseTextView *)self textLayoutManager];
        uint64_t v22 = [v21 documentRange];
        uint64_t v23 = [v22 location];
        id v24 = [v20 locationFromLocation:v23 withOffset:v10];

        uint64_t v25 = [(ICBaseTextView *)self textContainer];
        double v18 = [v16 viewProviderForParentView:self location:v24 textContainer:v25];
      }
      else
      {
        id v24 = [(ICBaseTextView *)self layoutManager];
        double v18 = [v16 viewProviderForParentView:self characterIndex:v10 layoutManager:v24];
      }

      int v26 = [v18 view];
      uint64_t v27 = [v5 dragSession];
      uint64_t v28 = [v18 view];
      [v27 locationInView:v28];
      uint64_t v29 = objc_msgSend(v26, "hitTest:withEvent:", 0);

      if (v29)
      {
        while (1)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          NSClassFromString(&cfstr_Icpaperdocumen.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v30 = [v29 superview];

            uint64_t v29 = (void *)v30;
            if (v30) {
              continue;
            }
          }

          goto LABEL_22;
        }

        goto LABEL_61;
      }
LABEL_22:

      int v13 = (uint64_t *)MEMORY[0x263F814A0];
    }

LABEL_24:
    uint64_t v31 = [(ICBaseTextView *)self editorController];
    id v32 = [v31 note];
    BOOL v33 = [v32 managedObjectContext];
    objc_msgSend(v33, "ic_save");

    uint64_t v34 = [(ICBaseTextView *)self editorController];
    uint64_t v35 = [v34 note];

    uint64_t v36 = [v35 textStorage];
    id v37 = [(ICBaseTextView *)self textStorage];

    if (v36 != v37)
    {
      objc_opt_class();
      unint64_t v38 = [(ICBaseTextView *)self textStorage];
      uint64_t v39 = ICDynamicCast();

      CGRect v73 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v39);
      uint64_t v40 = objc_msgSend(v39, "itemProviderForRange:andNote:", v10, v12, v35);

LABEL_39:
      id v52 = [(ICBaseTextView *)self viewsGhostedForDrag];

      if (!v52)
      {
        unint64_t v53 = [MEMORY[0x263EFF980] array];
        [(ICBaseTextView *)self setViewsGhostedForDrag:v53];
      }
      unint64_t v54 = [(ICBaseTextView *)self textStorage];
      uint64_t v55 = *v13;
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __62__ICBaseTextView_DragAndDrop__textDraggableView_itemsForDrag___block_invoke;
      v79[3] = &unk_2640B88E0;
      v79[4] = self;
      v79[5] = v10;
      v79[6] = v12;
      objc_msgSend(v54, "enumerateAttribute:inRange:options:usingBlock:", v55, v10, v12, 0, v79);

      if (ICInternalSettingsIsTextKit2Enabled()
        && ([(ICBaseTextView *)self textLayoutManager],
            (uint64_t v56 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v57 = (void *)v56;
        id v58 = v5;
        id v59 = [(ICBaseTextView *)self icTextLayoutManager];
        id v60 = objc_msgSend(v59, "todoButtonsForCharacterRange:", v10, v12);
      }
      else
      {
        id v58 = v5;
        id v57 = [(ICBaseTextView *)self icLayoutManager];
        id v60 = objc_msgSend(v57, "todoButtonsForCharacterRange:", v10, v12);
      }

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v61 = v60;
      uint64_t v62 = [v61 countByEnumeratingWithState:&v75 objects:v83 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v76 != v64) {
              objc_enumerationMutation(v61);
            }
            long long v66 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            long long v67 = [(ICBaseTextView *)self viewsGhostedForDrag];
            [v67 addObject:v66];

            [v66 setAlpha:0.2];
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v75 objects:v83 count:16];
        }
        while (v63);
      }

      if (v40)
      {
        CGFloat v68 = (void *)[objc_alloc(MEMORY[0x263F826C8]) initWithItemProvider:v40];
        uint64_t v69 = v73;
        [v68 setLocalObject:v73];
        id v5 = v58;
        CGFloat v70 = [v58 dragSession];
        [v70 setLocalContext:self];

        double v82 = v68;
        double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
      }
      else
      {
        id v5 = v58;
        double v9 = [v58 suggestedItems];
        uint64_t v69 = v73;
      }

      goto LABEL_56;
    }
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = [(ICBaseTextView *)self editorController];
    uint64_t v43 = [v42 note];
    double v44 = objc_msgSend(v41, "attachmentInNote:range:", v43, v10, v12);

    if (v44)
    {
      CGRect v73 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:uiRange:](self, "correctlyPositionedPreviewForCharacterRange:uiRange:", v10, v12, v74);
      if (!v73)
      {
        CGFloat v45 = [v35 textStorage];
        CGRect v73 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v45);
      }
      double v46 = [v44 attachmentModel];
      uint64_t v40 = [v46 itemProvider];

      if (v40) {
        goto LABEL_38;
      }
    }
    else
    {
      CGRect v73 = 0;
    }
    CGFloat v47 = v13;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    double v48 = [v35 textStorage];
    double v49 = [v48 attribute:*MEMORY[0x263F81520] atIndex:v10 effectiveRange:&v80];

    if (v49 && v10 == v80 && v12 == v81)
    {
      uint64_t v40 = 0;
    }
    else
    {
      uint64_t v50 = [v35 textStorage];
      uint64_t v72 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v10, v12, v50);

      id v51 = [v35 textStorage];
      uint64_t v40 = objc_msgSend(v51, "itemProviderForRange:andNote:", v10, v12, v35);

      CGRect v73 = (void *)v72;
    }

    int v13 = v47;
LABEL_38:

    goto LABEL_39;
  }
  double v18 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x263F831D0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_12;
  }
LABEL_61:

LABEL_62:
  double v9 = (void *)MEMORY[0x263EFFA68];
LABEL_56:

LABEL_57:

  return v9;
}

void __62__ICBaseTextView_DragAndDrop__textDraggableView_itemsForDrag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([*(id *)(a1 + 32) textLayoutManager],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      id v5 = [*(id *)(a1 + 32) textLayoutManager];
      BOOL v6 = [*(id *)(a1 + 32) textLayoutManager];
      id v7 = [v6 documentRange];
      char v8 = [v7 location];
      double v9 = [v5 locationFromLocation:v8 withOffset:*(void *)(a1 + 40)];

      NSUInteger v10 = [*(id *)(a1 + 32) icTextLayoutManager];
      objc_opt_class();
      uint64_t v11 = ICDynamicCast();
      uint64_t v12 = (void *)[v10 newViewProviderForTextAttachment:v11 parentView:*(void *)(a1 + 32) location:v9];
    }
    else
    {
      int v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      double v9 = [v13 layoutManager];
      uint64_t v12 = [v19 viewProviderForParentView:v13 characterIndex:v14 layoutManager:v9];
    }

    double v15 = [v12 view];
    if (v15)
    {
      int v16 = [*(id *)(a1 + 32) viewsGhostedForDrag];
      [v16 addObject:v15];

      NSUInteger v17 = [*(id *)(a1 + 32) viewsGhostedForDrag];
      unint64_t v18 = [v17 count];

      if (v18 >= 2) {
        [v15 setAlpha:0.2];
      }
    }
  }
}

- (void)resetViewsGhostedForDrag
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(ICBaseTextView *)self setIsDraggingChecklistItem:0];
  [(ICBaseTextView *)self setDraggedChecklistTrackedParagraph:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(ICBaseTextView *)self viewsGhostedForDrag];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setAlpha:1.0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(ICBaseTextView *)self setViewsGhostedForDrag:0];
  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
}

- (void)textDraggableView:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__ICBaseTextView_DragAndDrop__textDraggableView_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_2640B8908;
  v5[4] = self;
  [a4 addCompletion:v5];
}

uint64_t __85__ICBaseTextView_DragAndDrop__textDraggableView_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) resetViewsGhostedForDrag];
  }
  return result;
}

- (id)textDraggableView:(id)a3 dragPreviewForLiftingItem:(id)a4 session:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  uint64_t v6 = [v5 localObject];
  uint64_t v7 = ICDynamicCast();

  [v5 setLocalObject:0];

  return v7;
}

- (void)textDraggableView:(id)a3 dragSessionWillBegin:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDraggableView:dragSessionWillBegin:](self);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(ICBaseTextView *)self viewsGhostedForDrag];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v10++) setAlpha:0.2];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v11 = [(ICBaseTextView *)self editorController];
  uint64_t v12 = [v11 note];
  uint64_t v13 = [v12 documentMergeController];
  [v13 beginBlockingMergeForReason:2 textView:self];

  [(ICBaseTextView *)self setLastChecklistDropIndex:-1];
}

- (void)textDraggableView:(id)a3 dragSessionDidEnd:(id)a4 withOperation:(unint64_t)a5
{
  uint64_t v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDraggableView:dragSessionDidEnd:withOperation:](self);
  }

  uint64_t v7 = [(ICBaseTextView *)self editorController];
  uint64_t v8 = [v7 note];
  uint64_t v9 = [v8 documentMergeController];
  [v9 endBlockingMergeForReason:2 textView:self];

  uint64_t v10 = [(ICBaseTextView *)self editorController];
  [v10 saveNote];

  [(ICBaseTextView *)self setIsDraggingOverChecklistItem:0];
  [(ICBaseTextView *)self setTrackedParagraphCurrentlyUnderDraggedChecklist:0];
  [(ICBaseTextView *)self setLastChecklistDropIndex:-1];
  [(ICBaseTextView *)self resetViewsGhostedForDrag];
}

- (id)textDroppableView:(id)a3 previewForDroppingAllItemsWithDefault:(id)a4
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v5 = [(ICBaseTextView *)self icLayoutManager];
    [v5 cleanupStaleTodoButtons];
  }
  uint64_t v6 = [(ICBaseTextView *)self TTTextStorage];
  objc_opt_class();
  uint64_t v7 = [v6 styler];
  uint64_t v8 = ICDynamicCast();

  if (![(ICBaseTextView *)self isDraggingChecklistItem]
    || ![(ICBaseTextView *)self isDraggingOverChecklistItem])
  {
    goto LABEL_18;
  }
  [(ICBaseTextView *)self lastChecklistDropIndex];
  [v6 fixupAfterEditing];
  unint64_t v9 = [(ICBaseTextView *)self lastChecklistDropIndex];
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v10 = [(ICBaseTextView *)self icTextLayoutManager];
    [v10 trackedTodoParagraphAtIndex:v9];
  }
  else
  {
    uint64_t v10 = [(ICBaseTextView *)self icLayoutManager];
    [v10 trackedTodoParagraphAtIndexIfExists:v9];
  long long v11 = };

  if (v11)
  {
    uint64_t v12 = [(ICBaseTextView *)self draggedChecklistTrackedParagraph];
    unint64_t v13 = [v12 characterRange];

    if (v13 < v9)
    {
      long long v14 = [v8 expandedChecklistTrackedParagraphsInTextView:self forIndex:v9];
      uint64_t v15 = [v14 indexOfObject:v11];
      if (v15)
      {
        uint64_t v16 = [v14 objectAtIndexedSubscript:v15 - 1];

        long long v11 = (void *)v16;
      }
    }
    uint64_t v17 = [v11 characterRange];
    unint64_t v19 = v18;
    if (v18 >= 2)
    {
      double v20 = [v6 string];
      uint64_t v21 = objc_msgSend(v20, "substringWithRange:", v17, v19);
      unsigned int v22 = objc_msgSend(v21, "ic_isLastCharacterANewline");

      v19 -= v22;
    }
    uint64_t v23 = -[ICBaseTextView correctlyPositionedPreviewForCharacterRange:inTextStorage:](self, "correctlyPositionedPreviewForCharacterRange:inTextStorage:", v17, v19, v6);
    if (ICInternalSettingsIsTextKit2Enabled()
      && ([(ICBaseTextView *)self textLayoutManager],
          id v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      uint64_t v25 = [(ICBaseTextView *)self icTextLayoutManager];
      int v26 = [v25 documentRange];
      uint64_t v27 = [v26 location];
      uint64_t v28 = [v25 locationFromLocation:v27 withOffset:v17];

      uint64_t v29 = [v25 locationFromLocation:v28 withOffset:v19];
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F816E0]) initWithLocation:v28 endLocation:v29];
      uint64_t v31 = [(ICBaseTextView *)self icTextLayoutManager];
      [v31 invalidateLayoutForRange:v30];
    }
    else
    {
      uint64_t v25 = [(ICBaseTextView *)self icLayoutManager];
      objc_msgSend(v25, "invalidateLayoutForCharacterRange:actualCharacterRange:", v17, v19, 0);
    }
  }
  else
  {
LABEL_18:
    uint64_t v23 = 0;
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v32 = [(ICBaseTextView *)self icLayoutManager];
    [v32 setShouldManuallyRenderSeparateSubviews:0];

    BOOL v33 = [(ICBaseTextView *)self icLayoutManager];
    [v33 setIsRenderingPreviewForDragAndDrop:0];
  }

  return v23;
}

- (unint64_t)textDroppableView:(id)a3 willBecomeEditableForDrop:(id)a4
{
  return 1;
}

- (id)textDroppableView:(id)a3 proposalForDrop:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 dropSession];
  BOOL v7 = [(ICBaseTextView *)self shouldAcceptDropSession:v6];

  if (v7)
  {
    if ([v5 isSameView])
    {
      uint64_t v8 = 3;
    }
    else
    {
      unint64_t v9 = [v5 dropSession];
      if ([(ICBaseTextView *)self _isDropSessionLocalDragContextViewFromSubview:v9])
      {
        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = 2;
      }
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F82CE0]) initWithDropOperation:v8];

  return v10;
}

- (BOOL)_isDropSessionLocalDragContextViewFromSubview:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localDragSession];
  uint64_t v6 = [v5 localContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    BOOL v7 = [v4 localDragSession];
    uint64_t v8 = [v7 localContext];
    unint64_t v9 = ICDynamicCast();
    char v10 = [(ICBaseTextView *)self containsView:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)textDroppableView:(id)a3 willPerformDrop:(id)a4
{
  id v5 = a4;
  uint64_t v6 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDroppableView:willPerformDrop:](self);
  }

  BOOL v7 = [(ICBaseTextView *)self itemProviderPasteSessionCreateIfNecessary];
  [v7 setIsForDragAndDrop:1];
  uint64_t v8 = [(ICBaseTextView *)self TTTextStorage];
  [v8 setIsDropping:1];

  [(ICBaseTextView *)self setPasteDelegate:self];
  LODWORD(v8) = [v5 isSameView];

  if (v8)
  {
    unint64_t v9 = [(ICBaseTextView *)self editorController];
    [v9 setHasMadeEdits];

    char v10 = [(ICBaseTextView *)self editorController];
    long long v11 = [v10 note];
    [v11 updateModificationDateAndChangeCountAndSaveAfterDelay];
  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    uint64_t v12 = [(ICBaseTextView *)self layoutManager];
    unint64_t v13 = ICCheckedDynamicCast();

    [v13 setShouldManuallyRenderSeparateSubviews:1];
    [v13 setIsRenderingPreviewForDragAndDrop:1];
  }
}

- (void)textDroppableView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidEnter:](self);
  }

  uint64_t v6 = [(ICBaseTextView *)self editorController];
  BOOL v7 = [v6 note];
  uint64_t v8 = [v7 documentMergeController];
  [v8 beginBlockingMergeForReason:2 textView:self];
}

- (void)textDroppableView:(id)a3 dropSessionDidExit:(id)a4
{
  id v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidExit:](self);
  }

  uint64_t v6 = [(ICBaseTextView *)self editorController];
  BOOL v7 = [v6 note];
  uint64_t v8 = [v7 documentMergeController];
  [v8 endBlockingMergeForReason:2 textView:self];

  unint64_t v9 = [(ICBaseTextView *)self editorController];
  [v9 saveNote];
}

- (void)textDroppableView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textDroppableView:dropSessionDidEnd:](self);
  }

  uint64_t v6 = [(ICBaseTextView *)self editorController];
  BOOL v7 = [v6 note];
  uint64_t v8 = [v7 documentMergeController];
  [v8 endBlockingMergeForReason:2 textView:self];

  unint64_t v9 = [(ICBaseTextView *)self editorController];
  [v9 saveNote];

  char v10 = [(ICBaseTextView *)self TTTextStorage];
  [v10 setIsDropping:0];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    long long v11 = [(ICBaseTextView *)self layoutManager];
    uint64_t v12 = ICCheckedDynamicCast();

    [v12 setShouldManuallyRenderSeparateSubviews:0];
    [v12 setIsRenderingPreviewForDragAndDrop:0];
  }
  [(ICBaseTextView *)self icaxClearCaches];
}

- (id)itemProviderPasteSessionCreateIfNecessary
{
  id v3 = [(ICBaseTextView *)self itemProviderPasteSession];
  if (!v3)
  {
    id v4 = [(ICBaseTextView *)self editorController];
    id v5 = [v4 note];

    uint64_t v6 = [v5 managedObjectContext];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __72__ICBaseTextView_DragAndDrop__itemProviderPasteSessionCreateIfNecessary__block_invoke;
    unint64_t v18 = &unk_2640B82D8;
    id v19 = v5;
    id v20 = v6;
    id v7 = v6;
    id v8 = v5;
    [v7 performBlockAndWait:&v15];
    unint64_t v9 = [ICBaseTextViewItemProviderPasteSession alloc];
    char v10 = objc_msgSend(v8, "objectID", v15, v16, v17, v18);
    long long v11 = [(ICBaseTextViewItemProviderPasteSession *)v9 initWithNoteObjectID:v10];
    [(ICBaseTextView *)self setItemProviderPasteSession:v11];

    BOOL v12 = [(ICBaseTextView *)self supportsAttachments];
    unint64_t v13 = [(ICBaseTextView *)self itemProviderPasteSession];
    [v13 setSupportsAttachments:v12];

    id v3 = [(ICBaseTextView *)self itemProviderPasteSession];
  }

  return v3;
}

uint64_t __72__ICBaseTextView_DragAndDrop__itemProviderPasteSessionCreateIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) save];
  id v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "ic_save");
}

- (id)textPasteConfigurationSupporting:(id)a3 transformPasteItem:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:transformPasteItem:](self);
  }

  id v8 = [(ICBaseTextView *)self itemProviderPasteSessionCreateIfNecessary];
  unint64_t v9 = [v6 itemProvider];
  char v10 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:transformPasteItem:](v9);
  }

  long long v11 = [(ICBaseTextView *)self selectedTextRange];
  id v32 = [v11 end];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke;
  aBlock[3] = &unk_2640B8980;
  id v31 = v8;
  id v48 = v31;
  id v28 = v6;
  id v49 = v28;
  BOOL v12 = _Block_copy(aBlock);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v13 = v9;
  obuint64_t j = [(ICBaseTextView *)self itemProviderConsumerTypesForItemProvider:v9];
  uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = self;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v44;
LABEL_7:
    uint64_t v19 = 0;
    while (2)
    {
      if (*(void *)v44 != v18) {
        objc_enumerationMutation(obj);
      }
      switch([*(id *)(*((void *)&v43 + 1) + 8 * v19) unsignedIntegerValue])
      {
        case 0:
          uint64_t v42 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleTopotextDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v42 completionBlock:v12];
          uint64_t v21 = v42;
          goto LABEL_20;
        case 1:
          id v37 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handlePaperDocumentDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v37 completionBlock:v12];
          uint64_t v21 = v37;
          goto LABEL_20;
        case 2:
          unint64_t v38 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleInlinePaperDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v38 completionBlock:v12];
          uint64_t v21 = v38;
          goto LABEL_20;
        case 3:
        case 4:
          uint64_t v36 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleInlineDrawingDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v36 completionBlock:v12];
          uint64_t v21 = v36;
          goto LABEL_20;
        case 5:
          BOOL v33 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleMapKitItemDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v33 completionBlock:v12];
          uint64_t v21 = v33;
          goto LABEL_20;
        case 6:
          uint64_t v39 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleMovieOrAudioDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v39 completionBlock:v12];
          uint64_t v21 = v39;
          goto LABEL_20;
        case 7:
        case 11:
          uint64_t v41 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleAttributedStringDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v41 completionBlock:v12];
          uint64_t v21 = v41;
          goto LABEL_20;
        case 8:
          uint64_t v40 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleImageDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v40 completionBlock:v12];
          uint64_t v21 = v40;
          goto LABEL_20;
        case 9:
        case 10:
          uint64_t v34 = 0;
          BOOL v20 = [(ICBaseTextView *)v16 handleURLDropForItemProvider:v13 atTextPosition:v32 pasteSession:v31 outProgress:&v34 completionBlock:v12];
          uint64_t v21 = v34;
LABEL_20:
          id v22 = v21;

          uint64_t v17 = v22;
          if (!v20) {
            goto LABEL_21;
          }
          goto LABEL_27;
        case 12:
          uint64_t v23 = [(ICBaseTextView *)v16 preferredFileTypeForItemProvider:v13];
          id v35 = 0;
          BOOL v24 = [(ICBaseTextView *)v16 handleGenericFileForItemProvider:v13 atTextPosition:v32 pasteSession:v31 preferredTypeIdentifier:v23 outProgress:&v35 completionBlock:v12];
          id v22 = v35;

          uint64_t v17 = v22;
          if (!v24) {
            goto LABEL_21;
          }
LABEL_27:

          goto LABEL_30;
        default:
LABEL_21:
          if (v15 != ++v19) {
            continue;
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
          uint64_t v15 = v25;
          if (!v25) {
            goto LABEL_29;
          }
          goto LABEL_7;
      }
    }
  }
  uint64_t v17 = 0;
LABEL_29:

  (*((void (**)(void *, void, void))v12 + 2))(v12, 0, 0);
  id v22 = v17;
LABEL_30:
  id v26 = v22;

  return v26;
}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) supportsAttachments] & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(v5, "ic_stringWithoutAttachments");

    id v5 = (id)v7;
  }
  if ([v5 length])
  {
    if ([*(id *)(a1 + 32) supportsAttachments]
      && (unint64_t)[*(id *)(a1 + 32) numberOfAttachmentImagesPreloaded] <= 1)
    {
      id v8 = [*(id *)(a1 + 32) workerContext];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_2;
      v10[3] = &unk_2640B8958;
      id v11 = *(id *)(a1 + 32);
      objc_msgSend(v5, "ic_enumerateAttachmentsInContext:usingBlock:", v8, v10);
    }
    [*(id *)(a1 + 40) setAttributedStringResult:v5];
  }
  else
  {
    unint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_cold_1();
    }

    [*(id *)(a1 + 40) setNoResult];
  }
}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) workerContext];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_3;
  uint64_t v16 = &unk_2640B8930;
  id v17 = v7;
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = a5;
  id v9 = v7;
  [v8 performBlockAndWait:&v13];

  char v10 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v13, v14, v15, v16);
  uint64_t v11 = *MEMORY[0x263F5AA10];
  uint64_t v20 = *MEMORY[0x263F5AA18];
  v21[0] = v9;
  BOOL v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v10 postNotificationName:v11 object:0 userInfo:v12];
}

unint64_t __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) attachmentType] == 3
    || (unint64_t result = [*(id *)(a1 + 32) attachmentType], result == 5))
  {
    id v3 = (id)[*(id *)(a1 + 32) image];
    objc_msgSend(*(id *)(a1 + 40), "setNumberOfAttachmentImagesPreloaded:", objc_msgSend(*(id *)(a1 + 40), "numberOfAttachmentImagesPreloaded") + 1);
    unint64_t result = [*(id *)(a1 + 40) numberOfAttachmentImagesPreloaded];
    if (result >= 2) {
      **(unsigned char **)(a1 + 48) = 1;
    }
  }
  return result;
}

+ (id)temporaryTextStorageWithAttributedString:(id)a3 note:(id)a4 filterAttributedString:(BOOL)a5
{
  BOOL v24 = a5;
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F5B498]);
  id v9 = [MEMORY[0x263F08C38] UUID];
  char v10 = (void *)[v8 initWithData:0 replicaID:v9];

  [v10 setShouldInhibitAddingExtraNewlinesAtEndDuringFixup:1];
  id v11 = objc_alloc_init(MEMORY[0x263F5B4E8]);
  BOOL v12 = [v7 managedObjectContext];
  uint64_t v13 = *MEMORY[0x263F814A0];
  uint64_t v14 = [v6 length];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke;
  v25[3] = &unk_2640B89D0;
  id v15 = v12;
  id v26 = v15;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v25);
  objc_opt_class();
  uint64_t v16 = [v7 textStorage];
  id v17 = [v16 styler];
  id v18 = ICCheckedDynamicCast();
  uint64_t v19 = [v18 zoomController];
  [v19 zoomFactor];
  double v21 = v20;
  id v22 = [v11 zoomController];
  [v22 setZoomFactor:v21];

  [v10 setStyler:v11];
  if (v24)
  {
    [v10 setConvertAttributes:1];
    [v10 setFilterPastedAttributes:1];
  }
  [v10 setWantsUndoCommands:0];
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v10, "length"), v6);
  objc_msgSend(v7, "filterAttachmentsInTextStorage:range:", v10, 0, objc_msgSend(v10, "length"));
  [v10 fixupAfterEditing];
  [v10 setFilterPastedAttributes:0];
  [v10 setConvertAttributes:0];
  [v10 setStyler:0];

  return v10;
}

void __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = ICDynamicCast();

  if (v4)
  {
    id v5 = [v4 attachment];
    id v6 = [v5 objectID];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke_2;
      v8[3] = &unk_2640B89A8;
      id v9 = v6;
      id v10 = *(id *)(a1 + 32);
      id v11 = v4;
      [v7 performBlockAndWait:v8];
    }
  }
}

void __100__ICBaseTextView_DragAndDrop__temporaryTextStorageWithAttributedString_note_filterAttributedString___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) setAttachment:v2];
}

- (id)textPasteConfigurationSupporting:(id)a3 combineItemAttributedStrings:(id)a4 forRange:(id)a5
{
  v85[1] = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v8 = a4;
  id v60 = a5;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    uint64_t v80 = MEMORY[0x263EF8330];
    uint64_t v81 = 3221225472;
    double v82 = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke;
    double v83 = &unk_2640B8140;
    uint64_t v84 = self;
    performBlockOnMainThreadAndWait();
  }
  id v9 = objc_alloc_init(MEMORY[0x263F089B8]);
  uint64_t v10 = [v8 count];
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  char v79 = 0;
  id v11 = [(ICBaseTextView *)self itemProviderPasteSession];
  char v12 = [v11 isForDragAndDrop];
  if (v10 == 2) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [v8 objectAtIndexedSubscript:0];
    id v77 = 0;
    id v15 = [(ICBaseTextView *)self standardizedAttributedString:v14 attachmentIdentifiers:&v77];
    id v58 = v77;

    uint64_t v16 = [v8 objectAtIndexedSubscript:1];
    id v76 = 0;
    id v17 = [(ICBaseTextView *)self standardizedAttributedString:v16 attachmentIdentifiers:&v76];
    id v56 = v76;

    id v18 = [(ICBaseTextView *)self editorController];
    uint64_t v19 = [v18 note];
    double v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      objc_opt_class();
      id v22 = ICDynamicCast();
      id v21 = [v22 note];
    }
    uint64_t v23 = [v21 calculateDocumentController];
    if (v23)
    {
      BOOL v24 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v15];
      uint64_t v25 = objc_msgSend(v24, "ic_range");
      objc_msgSend(v23, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v24, v25, v26, 0, 0);
      uint64_t v27 = [v24 copy];

      id v15 = (void *)v27;
    }
    id v28 = objc_msgSend(v15, "string", v56);
    id v29 = [v17 string];
    int v30 = [v28 isEqualToString:v29];

    if (v30
      && (([v8 objectAtIndexedSubscript:1],
           id v31 = objc_claimAutoreleasedReturnValue(),
           BOOL v32 = -[ICBaseTextView attributedStringContainsICTTAttachment:](self, "attributedStringContainsICTTAttachment:", v31), v31, ![v58 count])? (v33 = 1): (v33 = v32), (v33 & 1) != 0 || objc_msgSend(v58, "isEqualToArray:", v57)))
    {
      uint64_t v34 = [v8 objectAtIndexedSubscript:1];
      v85[0] = v34;
      id v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:1];

      uint64_t v10 = [v35 count];
      id v8 = v35;
    }
    else
    {
      uint64_t v10 = 2;
    }
  }
  uint64_t v36 = [(ICBaseTextView *)self itemProviderPasteSession];
  [v36 saveWorkerContext];

  uint64_t v68 = MEMORY[0x263EF8330];
  uint64_t v69 = 3221225472;
  CGFloat v70 = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_2;
  CGPoint v71 = &unk_2640B89F8;
  uint64_t v72 = self;
  id v61 = v60;
  id v73 = v61;
  id v37 = v9;
  id v74 = v37;
  long long v75 = v78;
  performBlockOnMainThreadAndWait();
  if (v10)
  {
    for (unint64_t i = 0; i != v10; ++i)
    {
      uint64_t v39 = [v8 objectAtIndexedSubscript:i];
      [v37 appendAttributedString:v39];
      if (i < v10 - 1)
      {
        uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
        [v37 appendAttributedString:v40];
      }
    }
  }
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = __Block_byref_object_copy__1;
  long long v66 = __Block_byref_object_dispose__1;
  id v67 = 0;
  id v41 = v37;
  performBlockOnMainThreadAndWait();
  if ([(ICBaseTextView *)self isDraggingChecklistItem])
  {
    uint64_t v42 = [(ICBaseTextView *)self ic_characterRangeFromTextRange:v61];
    uint64_t v44 = v43;
    long long v45 = [(ICBaseTextView *)self textStorage];
    long long v46 = [v45 string];
    uint64_t v47 = objc_msgSend(v46, "lineRangeForRange:", v42, v44);
    uint64_t v49 = v48;

    uint64_t v50 = [(ICBaseTextView *)self textStorage];
    uint64_t v51 = objc_msgSend(v50, "attributedSubstringFromRange:", v47, v49);

    uint64_t v52 = [(ICBaseTextView *)self updateIndentForChecklistDragIfNecessaryForString:v63[5] lineUnderDrop:v51];
    unint64_t v53 = (void *)v63[5];
    v63[5] = v52;
  }
  id v54 = (id)v63[5];

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(v78, 8);

  return v54;
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) itemProviderPasteSession];
  int v3 = [v2 isForDragAndDrop];

  if (v3)
  {
    objc_opt_class();
    id v4 = [*(id *)(a1 + 32) layoutManager];
    ICCheckedDynamicCast();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    [v5 setShouldManuallyRenderSeparateSubviews:0];
  }
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_characterRangeFromTextRange:", *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = *(void **)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) textStorage];
    id v6 = objc_msgSend(v5, "attributedSubstringFromRange:", v3 - 1, 1);
    [v4 appendAttributedString:v6];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) editorController];
  uint64_t v3 = [v2 note];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_opt_class();
    id v6 = ICDynamicCast();
    id v5 = [v6 note];
  }
  id v7 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_4;
  v10[3] = &unk_2640B8A20;
  id v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v8;
  id v12 = v5;
  long long v13 = *(_OWORD *)(a1 + 48);
  id v9 = v5;
  [v7 performBlockAndWait:v10];
}

void __102__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_combineItemAttributedStrings_forRange___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) itemProviderPasteSession];
  objc_msgSend(v2, "temporaryTextStorageWithAttributedString:note:filterAttributedString:", v4, v3, objc_msgSend(v5, "shouldFilterAttributedString"));
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v30 attributedString];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) string];
  LOBYTE(v3) = objc_msgSend(v9, "ic_containsNonWhitespaceAndAttachmentCharacters");

  if ((v3 & 1) == 0)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v11 = [*(id *)(a1 + 48) managedObjectContext];
    uint64_t v12 = objc_msgSend(v10, "ic_attributedStringByFlatteningCalculateAttachmentsWithContext:", v11);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "attributedSubstringFromRange:", 1, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "length") - 1);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  if ((![*(id *)(a1 + 32) isDraggingChecklistItem]
     || ([*(id *)(a1 + 32) isDraggingOverChecklistItem] & 1) == 0)
    && (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length] >= 2)
  {
    id v18 = [*(id *)(a1 + 32) itemProviderPasteSession];
    int v19 = [v18 isForDragAndDrop];

    if (v19)
    {
      double v20 = [MEMORY[0x263F08708] newlineCharacterSet];
      uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length] - 1;
      uint64_t v22 = -1;
      uint64_t v23 = v21;
      while (v23)
      {
        BOOL v24 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) string];
        uint64_t v25 = [v24 characterAtIndex:v23];

        ++v22;
        --v23;
        if (([v20 characterIsMember:v25] & 1) == 0) {
          goto LABEL_14;
        }
      }
      uint64_t v22 = v21;
LABEL_14:
      uint64_t v26 = [*(id *)(a1 + 32) itemProviderPasteSession];
      [v26 setNumberOfTrailingNewlinesStripped:v22];

      if (v22)
      {
        uint64_t v27 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "attributedSubstringFromRange:", 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "length") - v22);
        uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
        id v29 = *(void **)(v28 + 40);
        *(void *)(v28 + 40) = v27;
      }
    }
  }
}

- (id)updateIndentForChecklistDragIfNecessaryForString:(id)a3 lineUnderDrop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if ([(ICBaseTextView *)self isDraggingChecklistItem])
  {
    uint64_t v10 = [(ICBaseTextView *)self trackedParagraphCurrentlyUnderDraggedChecklist];

    if (v10)
    {
      id v11 = [(ICBaseTextView *)self trackedParagraphCurrentlyUnderDraggedChecklist];
      uint64_t v12 = [v11 paragraph];
      uint64_t v13 = [v12 indent];
    }
    else
    {
      id v9 = v8;
      if (![v7 length]) {
        goto LABEL_9;
      }
      id v17 = [v7 string];
      id v18 = objc_msgSend(v17, "ic_trimmedString");
      uint64_t v19 = [v18 length];

      id v9 = v8;
      if (v19) {
        goto LABEL_9;
      }
      uint64_t v21 = [v7 attribute:*MEMORY[0x263F5AB28] atIndex:0 effectiveRange:0];
      id v11 = v21;
      if (v21) {
        uint64_t v13 = [v21 indent];
      }
      else {
        uint64_t v13 = -1;
      }
      uint64_t v22 = [v7 string];
      unint64_t v23 = +[ICChecklistDragUtilities tabIndentationEqualivantForString:v22];

      if (v23)
      {
        BOOL v24 = [(ICBaseTextView *)self TTTextStorage];
        [v24 setShouldRemoveLeadingWhitespaceForChecklistDrop:1];

        v13 += v23;
      }
    }

    id v9 = v8;
    if ((v13 & 0x8000000000000000) == 0)
    {
      id v9 = v8;
      if ([v8 length])
      {
        id v9 = (void *)[v8 mutableCopy];
        uint64_t v14 = (void *)MEMORY[0x263F5AB28];
        uint64_t v15 = [v8 attribute:*MEMORY[0x263F5AB28] atIndex:0 effectiveRange:0];
        uint64_t v16 = (void *)[v15 mutableCopy];
        [v16 setIndent:v13];
        objc_msgSend(v9, "addAttribute:value:range:", *v14, v16, 0, objc_msgSend(v9, "length"));
      }
    }
  }
LABEL_9:

  return v9;
}

- (id)textPasteConfigurationSupporting:(id)a3 performPasteOfAttributedString:(id)a4 toRange:(id)a5
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  id v91 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ICBaseTextView *)self itemProviderPasteSession];
  int v11 = [v10 isForDragAndDrop];

  if (v11)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      uint64_t v12 = [(ICBaseTextView *)self icLayoutManager];
      [v12 setShouldManuallyRenderSeparateSubviews:0];

      uint64_t v13 = [(ICBaseTextView *)self icLayoutManager];
      [v13 setIsRenderingPreviewForDragAndDrop:0];
    }
    uint64_t v14 = [(ICBaseTextView *)self itemProviderPasteSession];
    uint64_t v15 = [v14 numberOfTrailingNewlinesStripped];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x263F089D8] stringWithCapacity:v15];
      do
      {
        [v16 appendString:@"\n"];
        --v15;
      }
      while (v15);
      id v17 = (void *)[v8 mutableCopy];
      objc_msgSend(v17, "ic_appendString:", v16);
      uint64_t v18 = [v17 copy];

      id v8 = (id)v18;
    }
    uint64_t v19 = [(ICBaseTextView *)self itemProviderPasteSession];
    [v19 setNumberOfTrailingNewlinesStripped:0];
  }
  double v20 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:].cold.4(self, v20);
  }

  uint64_t v116 = 0;
  v117[0] = &v116;
  v117[1] = 0x3032000000;
  v117[2] = __Block_byref_object_copy__1;
  v117[3] = __Block_byref_object_dispose__1;
  id v95 = v8;
  id v96 = v9;
  id v118 = v96;
  if ([(ICBaseTextView *)self exceedsMaxLengthIfSelectionReplacedWithAttributedString:v95])
  {
    uint64_t v21 = [(ICBaseTextView *)self editorController];
    [v21 warnUserNoteLengthExceeded];
    id v94 = v95;
  }
  else
  {
    id v92 = [(ICBaseTextView *)self TTTextStorage];
    [(ICBaseTextView *)self setSelectedTextRange:v96];
    uint64_t v22 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:]();
    }

    [(ICBaseTextView *)self beginDrop];
    unint64_t v23 = [(ICBaseTextView *)self itemProviderPasteSession];
    int v24 = [v23 shouldFilterAttributedString];

    uint64_t location = [(ICBaseTextView *)self ic_characterRangeFromTextRange:v96];
    uint64_t v26 = v25;
    uint64_t v27 = [(ICBaseTextView *)self TTTextStorage];
    uint64_t v28 = [v27 length];

    if (v24)
    {
      id v29 = os_log_create("com.apple.notes", "DragAndDrop");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:](v29);
      }

      id v30 = [(ICBaseTextView *)self TTTextStorage];
      [v30 setFilterPastedAttributes:1];

      id v31 = [(ICBaseTextView *)self TTTextStorage];
      [v31 setConvertAttributes:1];

      BOOL v32 = [(ICBaseTextView *)self TTTextStorage];
      [v32 setPasteboardTypes:0];
    }
    char v33 = [(ICBaseTextView *)self TTTextStorage];
    v111[0] = MEMORY[0x263EF8330];
    v111[1] = 3221225472;
    v111[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke;
    v111[3] = &unk_2640B8A70;
    id v34 = v95;
    uint64_t v114 = location;
    uint64_t v115 = v26;
    id v112 = v34;
    uint64_t v113 = self;
    [v33 saveSelectionDuringBlock:v111 affinity:1];

    id v35 = [MEMORY[0x263F5ACA0] sharedContext];
    uint64_t v36 = [v35 managedObjectContext];
    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    v110[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2;
    v110[3] = &unk_2640B8958;
    v110[4] = self;
    objc_msgSend(v34, "ic_enumerateAttachmentsInContext:usingBlock:", v36, v110);

    id v37 = [(ICBaseTextView *)self editorController];
    unint64_t v38 = [v37 note];
    uint64_t v39 = [v38 calculateDocumentController];
    [v39 scheduleUpdateAffectingChangeCounts:1 isHighPriority:1];

    uint64_t v40 = [(ICBaseTextView *)self TTTextStorage];
    unint64_t v41 = [v40 length];

    if (v24)
    {
      [v92 setPasteboardTypes:0];
      [v92 setConvertAttributes:0];
      [v92 setFilterPastedAttributes:0];
      uint64_t v42 = [(ICBaseTextView *)self TTTextStorage];
      uint64_t v43 = [v42 length];

      uint64_t v44 = objc_msgSend(v92, "attributedSubstringFromRange:", location, v26 - v28 + v43);

      objc_opt_class();
      long long v45 = [v92 styler];
      long long v46 = ICCheckedDynamicCast();

      objc_msgSend(v46, "insertedText:replacementRange:inTextView:languageHasSpaces:", v44, location, v26, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
      id v47 = (id)v44;
    }
    else
    {
      id v47 = v34;
    }
    id v94 = v47;
    -[ICBaseTextView finishDropWithString:](self, "finishDropWithString:");
    NSUInteger v48 = v41 - v28 + v26;
    NSUInteger range2 = v48;
    if (v41 >= v48 + location) {
      unint64_t v49 = v48 + location;
    }
    else {
      unint64_t v49 = v41;
    }
    uint64_t v50 = -[ICBaseTextView ic_textRangeFromCharacterRange:](self, "ic_textRangeFromCharacterRange:", v49, 0);
    uint64_t v51 = *(void **)(v117[0] + 40);
    *(void *)(v117[0] + 40) = v50;

    uint64_t v52 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[ICBaseTextView(DragAndDrop) textPasteConfigurationSupporting:performPasteOfAttributedString:toRange:]((uint64_t)v117, v52);
    }

    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      unint64_t v53 = [(ICBaseTextView *)self itemProviderPasteSession];
      int v54 = [v53 isForDragAndDrop];

      if (v54)
      {
        objc_opt_class();
        uint64_t v55 = [v92 attributedString];
        id v56 = ICDynamicCast();

        id v57 = (void *)[v56 mutableCopy];
        v122.uint64_t location = objc_msgSend(v92, "ic_range");
        v123.NSUInteger length = range2;
        v123.uint64_t location = location;
        NSRange v58 = NSIntersectionRange(v122, v123);
        uint64_t v59 = *MEMORY[0x263F81500];
        NSUInteger range2 = v58.length;
        objc_msgSend(v56, "removeAttribute:range:", *MEMORY[0x263F81500], v58.location, v58.length);
        id v60 = [MEMORY[0x263F825C8] clearColor];
        objc_msgSend(v56, "addAttribute:value:range:", v59, v60, v58.location, v58.length);
        uint64_t location = v58.location;

        objc_msgSend(v56, "removeAttribute:range:", *MEMORY[0x263F81520], v58.location, v58.length);
        objc_msgSend(v56, "removeAttribute:range:", *MEMORY[0x263F815F8], v58.location, v58.length);
        objc_msgSend(v56, "removeAttribute:range:", *MEMORY[0x263F81598], v58.location, v58.length);
        id v61 = [(ICBaseTextView *)self editorController];
        uint64_t v62 = [v61 note];
        uint64_t v63 = [v62 documentMergeController];
        [v63 beginBlockingMergeForReason:2 textView:self];

        dispatch_time_t v64 = dispatch_time(0, 700000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_256;
        block[3] = &unk_2640B8A98;
        id v106 = v92;
        id v107 = v57;
        CGRect v108 = self;
        NSRange v109 = v58;
        id v65 = v57;
        dispatch_after(v64, MEMORY[0x263EF83A0], block);
      }
      long long v66 = [(ICBaseTextView *)self icLayoutManager];
      [v66 updateVisibleSupplementalViews];

      id v67 = [(ICBaseTextView *)self icLayoutManager];
      uint64_t v68 = objc_msgSend(v67, "todoButtonsForCharacterRange:", location, range2);

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      obuint64_t j = v68;
      uint64_t v69 = [obj countByEnumeratingWithState:&v101 objects:v119 count:16];
      if (v69)
      {
        uint64_t v70 = *(void *)v102;
        do
        {
          for (uint64_t i = 0; i != v69; ++i)
          {
            if (*(void *)v102 != v70) {
              objc_enumerationMutation(obj);
            }
            uint64_t v72 = *(void **)(*((void *)&v101 + 1) + 8 * i);
            [v72 setAlpha:0.0];
            id v73 = (void *)MEMORY[0x263F82E00];
            id v74 = [(ICBaseTextView *)self itemProviderPasteSession];
            if ([v74 isForDragAndDrop]) {
              double v75 = 0.5;
            }
            else {
              double v75 = 0.0;
            }
            v100[0] = MEMORY[0x263EF8330];
            v100[1] = 3221225472;
            v100[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2_257;
            v100[3] = &unk_2640B8140;
            void v100[4] = v72;
            [v73 animateWithDuration:0 delay:v100 options:0 animations:0.3 completion:v75];
          }
          uint64_t v69 = [obj countByEnumeratingWithState:&v101 objects:v119 count:16];
        }
        while (v69);
      }

      if ([(ICBaseTextView *)self supportsAttachments])
      {
        id v76 = [(ICBaseTextView *)self editorController];
        uint64_t v77 = [v76 visibleRange];
        uint64_t v79 = v78;

        uint64_t v80 = [(ICBaseTextView *)self textStorage];
        uint64_t v81 = *MEMORY[0x263F814A0];
        v99[0] = MEMORY[0x263EF8330];
        v99[1] = 3221225472;
        v99[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_3;
        v99[3] = &unk_2640B88E0;
        v99[5] = v77;
        v99[6] = v79;
        v99[4] = self;
        objc_msgSend(v80, "enumerateAttribute:inRange:options:usingBlock:", v81, location, range2, 0, v99);
      }
    }

    uint64_t v21 = v92;
  }

  double v82 = [(ICBaseTextView *)self itemProviderPasteSession];
  char v83 = [v82 isForDragAndDrop];

  if ((v83 & 1) == 0)
  {
    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_6;
    v98[3] = &unk_2640B85C8;
    v98[4] = self;
    v98[5] = &v116;
    dispatch_async(MEMORY[0x263EF83A0], v98);
  }
  uint64_t v84 = [(ICBaseTextView *)self itemProviderPasteSession];
  id v85 = [v84 errorCodes];

  if ([v85 containsObject:&unk_26C138E38])
  {
    NSRange v86 = [(ICBaseTextView *)self editorController];
    [v86 warnUserAttachmentLimitExceeded];
  }
  else
  {
    if (![v85 containsObject:&unk_26C138E50]) {
      goto LABEL_51;
    }
    NSRange v86 = [(ICBaseTextView *)self editorController];
    NSRange v87 = [(ICBaseTextView *)self itemProviderPasteSession];
    objc_msgSend(v86, "warnUserAttachmentSizeExceededWithAttachmentCount:", objc_msgSend(v87, "numberOfAttachmentsAttemptedAdded"));
  }
LABEL_51:
  [(ICBaseTextView *)self setItemProviderPasteSession:0];
  [(ICBaseTextView *)self didPasteOrDropText:v94 toRange:v96];
  id v88 = *(id *)(v117[0] + 40);

  _Block_object_dispose(&v116, 8);

  return v88;
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5B4E8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) TTTextStorage];
  objc_msgSend(v2, "attributedStringToPasteWithAdaptedParagraphStyles:pasteRange:textStorage:", v3, *(void *)(a1 + 48), *(void *)(a1 + 56), v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v19 string];
  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  id v8 = [NSURL URLWithString:v7];
  id v9 = [*(id *)(a1 + 40) textStorage];
  uint64_t v10 = objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], objc_msgSend(*(id *)(a1 + 40), "selectedRange"), 0);

  if (*(void *)(a1 + 56) && !v10)
  {
    int v11 = [*(id *)(a1 + 40) itemProviderPasteSession];
    if ([v11 isTypeURL])
    {
      uint64_t v12 = [v8 absoluteString];

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 40) TTTextStorage];
        uint64_t v14 = objc_msgSend(v13, "ic_attributedSubstringFromRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));

        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:v14];
        uint64_t v16 = *MEMORY[0x263F81520];
        id v17 = [v8 absoluteString];
        objc_msgSend(v15, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v15, "length"));

        uint64_t v18 = [*(id *)(a1 + 40) TTTextStorage];
        objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 48), *(void *)(a1 + 56), v15);

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v14 = [*(id *)(a1 + 40) TTTextStorage];
  objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 48), *(void *)(a1 + 56), v19);
LABEL_8:
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 attachmentType] == 12)
  {
    uint64_t v3 = [*(id *)(a1 + 32) editorController];
    uint64_t v4 = [v3 eventReporter];
    id v5 = [*(id *)(a1 + 32) editorController];
    id v6 = [v5 note];
    [v4 submitTableCreateEventForAttachment:v7 inNote:v6];
  }
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_256(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) restoreAttributedString:*(void *)(a1 + 40)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 48), "textStorage", 0);
  uint64_t v3 = [v2 layoutManagers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7++), "invalidateDisplayForCharacterRange:", *(void *)(a1 + 56), *(void *)(a1 + 64));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v8 = [*(id *)(a1 + 48) editorController];
  id v9 = [v8 note];
  uint64_t v10 = [v9 documentMergeController];
  [v10 endBlockingMergeForReason:2 textView:*(void *)(a1 + 48)];

  int v11 = [*(id *)(a1 + 48) editorController];
  [v11 saveNote];
}

uint64_t __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_2_257(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_3(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  objc_opt_class();
  id v8 = ICDynamicCast();

  if (v8)
  {
    v17.uint64_t location = a3;
    v17.NSUInteger length = a4;
    if (NSIntersectionRange(v17, *(NSRange *)(a1 + 40)).length)
    {
      id v9 = [*(id *)(a1 + 32) icLayoutManager];
      uint64_t v10 = [v9 viewForTextAttachment:v8];

      if (v10)
      {
        double v11 = 0.0;
        [v10 setAlpha:0.0];
        long long v12 = (void *)MEMORY[0x263F82E00];
        long long v13 = [*(id *)(a1 + 32) itemProviderPasteSession];
        if ([v13 isForDragAndDrop]) {
          double v11 = 0.5;
        }
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_4;
        v15[3] = &unk_2640B8140;
        id v16 = v10;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_5;
        v14[3] = &unk_2640B8AC0;
        v14[4] = *(void *)(a1 + 32);
        void v14[5] = a3;
        v14[6] = a4;
        [v12 animateWithDuration:0 delay:v15 options:v14 animations:0.1 completion:v11];
      }
    }
  }
}

uint64_t __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) icLayoutManager];
  objc_msgSend(v2, "invalidateLayoutForCharacterRange:actualCharacterRange:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0);

  id v3 = [*(id *)(a1 + 32) icLayoutManager];
  objc_msgSend(v3, "ensureLayoutForCharacterRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __103__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_performPasteOfAttributedString_toRange___block_invoke_6(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) selectedTextRange];
  char v3 = [v2 isEqual:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) selectedTextRange];
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl(&dword_20BE60000, v4, OS_LOG_TYPE_DEFAULT, "Corrected text selection range after paste: %@ => %@", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(a1 + 32) setSelectedTextRange:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)didPasteOrDropText:(id)a3 toRange:(id)a4
{
  id v17 = a3;
  if ([v17 length])
  {
    uint64_t v5 = objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F81520], objc_msgSend(v17, "length") - 1, 0);
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }
  int v7 = [(ICBaseTextView *)self typingAttributes];
  uint64_t v8 = *MEMORY[0x263F81500];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F81500]];
  [v9 CGColor];
  id v10 = [MEMORY[0x263F825C8] tintColor];
  [v10 CGColor];
  int v11 = ICCGColorEquivalentToColor();

  if (!v6 && v11)
  {
    long long v12 = [(ICBaseTextView *)self typingAttributes];
    long long v13 = (void *)[v12 mutableCopy];

    [v13 setObject:0 forKeyedSubscript:v8];
    [v13 setObject:0 forKeyedSubscript:*MEMORY[0x263F5AB20]];
    [v13 setObject:0 forKeyedSubscript:*MEMORY[0x263F5AD90]];
    long long v14 = (void *)[v13 copy];
    [(ICBaseTextView *)self setTypingAttributes:v14];
  }
  long long v15 = [(ICBaseTextView *)self editorController];
  id v16 = [v15 note];
  [v16 updateModificationDateAndChangeCountAndSaveAfterDelay];
}

- (void)icaxBeginEditingAtAttachment:(id)a3
{
  uint64_t v4 = [(ICBaseTextView *)self _icaxRangeOfAttachment:a3];

  -[ICBaseTextView icaxBeginEditingInStorageRange:](self, "icaxBeginEditingInStorageRange:", v4 + v5, 0);
}

- (void)icaxBeginEditingInStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v6 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  uint64_t v7 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v6, location, length);
  uint64_t v9 = v8;

  -[ICBaseTextView _accessibilitySetSelectedTextRange:](self, "_accessibilitySetSelectedTextRange:", v7, v9);
  id v10 = [(ICBaseTextView *)self editorController];
  [v10 startEditing];
}

- (void)icaxTextDidChange
{
  [(ICBaseTextView *)self set_icaxCachedModifiedAttributedString:0];
  if ([(ICBaseTextView *)self isFirstResponder] && UIAccessibilityIsVoiceOverRunning())
  {
    [(ICBaseTextView *)self _icaxUpdateFakeTextSelectionRange];
  }
}

- (void)icaxClearCaches
{
  [(ICBaseTextView *)self set_icaxCachedModifiedAttributedString:0];
  [(ICBaseTextView *)self icaxClearCachedChildrenForReparenting];
  [(ICBaseTextView *)self _accessibilitySetRetainedValue:0 forKey:@"AXLinks"];

  [(ICBaseTextView *)self _accessibilitySetRetainedValue:0 forKey:@"LinkRotor"];
}

- (void)icaxUpdateLinkRanges
{
  char v3 = [(ICBaseTextView *)self _icaxCachedModifiedAttributedString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(ICBaseTextView *)self _icaxCachedModifiedAttributedString];
    BOOL v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = [(ICBaseTextView *)self baseAttributedStringForAccessibility];
    uint64_t v8 = *MEMORY[0x263F81520];
    uint64_t v9 = [v7 length];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    long long v14 = __59__ICBaseTextView_ICAccessibility_iOS__icaxUpdateLinkRanges__block_invoke;
    long long v15 = &unk_2640B8C78;
    id v16 = self;
    id v17 = v6;
    id v10 = v6;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 0, &v12);
    int v11 = objc_msgSend(v10, "copy", v12, v13, v14, v15, v16);
    [(ICBaseTextView *)self set_icaxCachedModifiedAttributedString:v11];
  }
  [(ICBaseTextView *)self _accessibilitySetRetainedValue:0 forKey:@"AXLinks"];
}

void __59__ICBaseTextView_ICAccessibility_iOS__icaxUpdateLinkRanges__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  objc_opt_class();
  uint64_t v8 = ICDynamicCast();

  if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v9 _icaxCachedModifiedAttributedString];
    uint64_t v11 = objc_msgSend(v9, "_icaxRangeInModifiedAttributedString:forRange:", v10, a3, a4);
    uint64_t v13 = v12;

    long long v14 = *(void **)(a1 + 40);
    uint64_t v16 = *MEMORY[0x263F217B0];
    v17[0] = MEMORY[0x263EFFA88];
    long long v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v14, "addAttributes:range:", v15, v11, v13);
  }
}

- (void)icaxClearCachedChildrenForReparenting
{
  char v3 = [(ICBaseTextView *)self _icaxPencilKitAttachmentsDict];
  [v3 removeAllObjects];

  [(ICBaseTextView *)self set_icaxCachedChildrenForReparenting:0];
}

- (void)icaxSpeakIndentationLevelForCurrentSelectedRange
{
  unint64_t v3 = [(ICBaseTextView *)self selectedRange];
  uint64_t v4 = [(ICBaseTextView *)self textStorage];
  unint64_t v5 = [v4 length];

  if (v3 <= v5)
  {
    BOOL v6 = [(ICBaseTextView *)self textStorage];
    unint64_t v7 = [v6 length];

    if (v3 && v3 >= v7)
    {
      uint64_t v8 = [(ICBaseTextView *)self textStorage];
      unint64_t v3 = [v8 length] - 1;
    }
    uint64_t v9 = [(ICBaseTextView *)self textStorage];
    id v13 = [v9 attribute:*MEMORY[0x263F5AB28] atIndex:v3 effectiveRange:0];

    id v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"Indentation level %lu" value:&stru_26C10E100 table:0];

    uint64_t v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, objc_msgSend(v13, "indent"));
    ICAccessibilityPostAnnouncementNotification();
  }
}

- (BOOL)isAccessibilityElement
{
  uint64_t v2 = [(ICBaseTextView *)self editorController];
  unint64_t v3 = [v2 viewControllerManager];
  char v4 = [v3 isAttachmentBrowserVisible] ^ 1;

  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"note" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityValue
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    long long v7 = xmmword_20C179570;
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    id v4 = [(ICBaseTextView *)self _icaxAttributedStringForRange:&v7];
    unint64_t v5 = objc_msgSend(v3, "initWithCFAttributedString:", v4, v7);
  }
  else
  {
    unint64_t v5 = [(ICBaseTextView *)self text];
  }

  return v5;
}

- (id)accessibilityHint
{
  uint64_t v2 = [(ICBaseTextView *)self editorController];
  id v3 = [v2 note];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    unint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    id v4 = [v5 localizedStringForKey:@"Double tap to begin editing a new note" value:&stru_26C10E100 table:0];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v9.receiver = self;
  v9.super_class = (Class)ICBaseTextView;
  unint64_t v3 = *MEMORY[0x263F81408] | [(ICBaseTextView *)&v9 accessibilityTraits];
  id v4 = [(ICBaseTextView *)self editorController];
  unint64_t v5 = [v4 note];
  int v6 = [v5 isEditable];

  if (v6) {
    uint64_t v7 = ~*MEMORY[0x263F832B8];
  }
  else {
    uint64_t v7 = -1;
  }
  return v7 & v3 & ~*MEMORY[0x263F83280];
}

- (CGPoint)accessibilityActivationPoint
{
  unint64_t v3 = [(ICBaseTextView *)self editorController];
  char v4 = [v3 isInkPickerShowing];

  double v5 = -1.0;
  double v6 = -1.0;
  if ((v4 & 1) == 0)
  {
    unint64_t v7 = [(ICBaseTextView *)self accessibilityTraits];
    if ((*MEMORY[0x263F81398] & v7) != 0)
    {
      v24.receiver = self;
      v24.super_class = (Class)ICBaseTextView;
      [(ICBaseTextView *)&v24 accessibilityActivationPoint];
    }
    else
    {
      [(ICBaseTextView *)self visibleTextRect];
      double v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      int v16 = objc_msgSend(MEMORY[0x263F81658], "ic_isRTL");
      double v17 = v9;
      CGFloat v18 = v11;
      CGFloat v19 = v13;
      CGFloat v20 = v15;
      if (v16)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v17);
        double v22 = 5.0;
      }
      else
      {
        double MinX = CGRectGetMaxX(*(CGRect *)&v17);
        double v22 = -5.0;
      }
      v26.origin.CGFloat x = v9 + MinX + v22;
      v26.origin.CGFloat y = v11;
      v26.size.CGFloat width = v13;
      v26.size.CGFloat height = v15;
      CGRectGetMaxY(v26);
      unint64_t v23 = [(ICBaseTextView *)self editorController];
      objc_msgSend(v23, "ic_safeAreaDistanceFromBottom");

      UIAccessibilityFrameForBounds();
    }
  }
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(ICBaseTextView *)self editorController];
  char v4 = [v3 note];
  char v5 = [v4 isDeletedOrInTrash];

  double v6 = [(ICBaseTextView *)self editorController];
  unint64_t v7 = [v6 note];
  if (v7) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [(ICBaseTextView *)self isEditable] ^ 1;
  }

  char v9 = v5 | v8;
  if ((v9 & 1) == 0)
  {
    double v10 = [(ICBaseTextView *)self editorController];
    [v10 startEditing];
  }
  return v9 ^ 1;
}

- (BOOL)accessibilityPerformEscape
{
  if ([(ICBaseTextView *)self isFirstResponder])
  {
    [(ICBaseTextView *)self resignFirstResponder];
    return 1;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ICBaseTextView;
    return [(ICBaseTextView *)&v4 accessibilityPerformEscape];
  }
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  uint64_t v2 = [(ICBaseTextView *)self editorController];
  unint64_t v3 = [v2 note];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)childElements
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [(ICBaseTextView *)self _accessibleSubviews];
  [v3 addObjectsFromArray:v4];

  char v5 = [(ICBaseTextView *)self textStorage];
  uint64_t v6 = *MEMORY[0x263F814A0];
  uint64_t v7 = [v5 length];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  CGFloat v13 = __52__ICBaseTextView_ICAccessibility_iOS__childElements__block_invoke;
  double v14 = &unk_2640B8CA0;
  CGFloat v15 = self;
  id v16 = v3;
  id v8 = v3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, &v11);
  char v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  return v9;
}

uint64_t __52__ICBaseTextView_ICAccessibility_iOS__childElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    double v14 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      char v5 = *(void **)(a1 + 32);
      if (IsTextKit2Enabled)
      {
        uint64_t v6 = [v5 icTextLayoutManager];
        uint64_t v7 = [v14 viewIdentifier];
        id v8 = [v6 existingAttachmentViewForIdentifier:v7];
      }
      else
      {
        uint64_t v6 = [v5 layoutManager];
        id v8 = [v14 viewForLayoutManager:v6];
      }

      if ([v8 isAccessibilityElement])
      {
        [*(id *)(a1 + 40) addObject:v8];
      }
      else
      {
        char v9 = [v8 accessibilityElements];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = [v8 accessibilityElements];
          [v11 addObjectsFromArray:v12];
        }
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a4;
  -[ICBaseTextView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(ICBaseTextView *)self _icaxLinkElements];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = (id)[v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        [v16 accessibilityFrame];
        v67.double x = v9;
        v67.double y = v11;
        if (CGRectContainsPoint(v70, v67))
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = (id)[v12 countByEnumeratingWithState:&v57 objects:v64 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v17 = [(ICBaseTextView *)self childElements];
  CGFloat v18 = v17;
  if (!v13)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v54;
LABEL_17:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v53 + 1) + 8 * v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v25 accessibilityFrame];
          v68.double x = v9;
          v68.double y = v11;
          if (CGRectContainsPoint(v71, v68)) {
            break;
          }
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v22) {
            goto LABEL_17;
          }
          goto LABEL_24;
        }
      }
      id v13 = v25;

      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {
LABEL_24:
    }
    CGRect v26 = [(UIView *)self icaxRecursiveSubviewsPassingTest:&__block_literal_global_3];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      unint64_t v41 = v18;
      uint64_t v42 = self;
      id v43 = v7;
      id v13 = 0;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          BOOL v32 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
          char v33 = [v31 _accessibilityLeafDescendantsWithOptions:v32];

          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v34 = v33;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v61 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v46;
            while (2)
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v46 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = *(void **)(*((void *)&v45 + 1) + 8 * k);
                [v39 accessibilityFrame];
                v69.double x = v9;
                v69.double y = v11;
                if (CGRectContainsPoint(v72, v69))
                {
                  id v40 = v39;

                  id v13 = v40;
                  goto LABEL_41;
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v61 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }
LABEL_41:
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }
      while (v28);

      self = v42;
      id v7 = v43;
      CGFloat v18 = v41;
      if (v13) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v44.receiver = self;
    v44.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityHitTest:withEvent:](&v44, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v13;
}

uint64_t __71__ICBaseTextView_ICAccessibility_iOS___accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 className];
  uint64_t v3 = [v2 isEqualToString:@"PaperKit.CanvasGenerationTool"];

  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    [(ICBaseTextView *)self contentOffset];
    double v5 = v4;
    uint64_t v6 = [(ICBaseTextView *)self editorController];
    objc_msgSend(v6, "ic_safeAreaDistanceFromTop");
    double v8 = -v7;

    if (v5 <= v8)
    {
      CGFloat v9 = [(ICBaseTextView *)self editorController];
      [v9 showOverscrollContentAndScrollToTop];
    }
    return 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICBaseTextView;
    return -[ICBaseTextView accessibilityScroll:](&v11, sel_accessibilityScroll_);
  }
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    double v5 = [(ICBaseTextView *)self _icaxAttributedStringForRange:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBaseTextView;
    double v5 = [(ICBaseTextView *)&v7 _accessibilityAttributedValueForRange:a3];
  }

  return v5;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    double v5 = [(ICBaseTextView *)self _icaxAttributedStringForRange:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBaseTextView;
    double v5 = [(ICBaseTextView *)&v7 _accessibilityAttributedValueForRange:a3];
  }

  return v5;
}

- (int64_t)_accessibilityLineEndPosition
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unint64_t v3 = [(ICBaseTextView *)self _icaxModifiedCursorPosition];
    return [(ICBaseTextView *)self _icaxLinePositionForPosition:v3 start:0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    return [(ICBaseTextView *)&v5 _accessibilityLineEndPosition];
  }
}

- (int64_t)_accessibilityLineStartPosition
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unint64_t v3 = [(ICBaseTextView *)self _icaxModifiedCursorPosition];
    return [(ICBaseTextView *)self _icaxLinePositionForPosition:v3 start:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    return [(ICBaseTextView *)&v5 _accessibilityLineStartPosition];
  }
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ICBaseTextView;
  double v4 = -[ICBaseTextView _accessibilityLineNumberAndColumnForPoint:](&v12, sel__accessibilityLineNumberAndColumnForPoint_, a3.x, a3.y);
  objc_super v5 = [v4 objectForKeyedSubscript:@"lineNumber"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  objc_super v7 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  uint64_t v8 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v7, v6, 0);

  CGFloat v9 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  double v10 = [NSNumber numberWithUnsignedInteger:v8];
  [v9 setObject:v10 forKeyedSubscript:@"lineNumber"];

  return v9;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  double v4 = [a3 objectForKeyedSubscript:@"lineNumber"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  NSUInteger v6 = [(ICBaseTextView *)self _accessibilityLineRangeForPosition:v5];
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v5 = [(ICBaseTextView *)self _icaxLinePositionForPosition:a3 start:1];
    unint64_t v6 = [(ICBaseTextView *)self _icaxLinePositionForPosition:a3 start:0];
    NSUInteger v7 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    uint64_t v8 = [v7 length];
    if ((id)v6 != v5 || v5 == (id)v8) {
      uint64_t v10 = v6 - (void)v5;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICBaseTextView;
    id v5 = [(ICBaseTextView *)&v14 _accessibilityLineRangeForPosition:a3];
    uint64_t v10 = v11;
  }
  NSUInteger v12 = (NSUInteger)v5;
  NSUInteger v13 = v10;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  if (UIAccessibilityIsVoiceOverRunning()
    && ![(ICBaseTextView *)self isAccessibilityTableTextView])
  {
    id v3 = (id)[(ICBaseTextView *)self _icaxModifiedSelectionRange];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    id v3 = [(ICBaseTextView *)&v5 _accessibilitySelectedTextRange];
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(ICBaseTextView *)self set_icaxShouldPreventUpdatingFakeCursorRange:1];
    [(ICBaseTextView *)self set_icaxModifiedCursorPosition:location + length];
    -[ICBaseTextView set_icaxModifiedSelectionRange:](self, "set_icaxModifiedSelectionRange:", location, length);
    uint64_t v6 = [(ICBaseTextView *)self selectedRange];
    uint64_t v8 = v7;
    CGFloat v9 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    uint64_t v10 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v9);
    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v10, v11);

    if ([(ICBaseTextView *)self selectedRange] == v6 && v12 == v8) {
      UIAccessibilityPostNotification(0x3F9u, 0);
    }
    [(ICBaseTextView *)self set_icaxShouldPreventUpdatingFakeCursorRange:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilitySetSelectedTextRange:](&v13, sel__accessibilitySetSelectedTextRange_, location, length);
  }
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v42 = 0;
  id v43 = (double *)&v42;
  uint64_t v44 = 0x4010000000;
  long long v45 = &unk_20C1E2BF2;
  long long v46 = 0u;
  long long v47 = 0u;
  if ([(ICBaseTextView *)self isAccessibilityTableTextView])
  {
    v35.receiver = self;
    v35.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityBoundsForRange:](&v35, sel__accessibilityBoundsForRange_, location, length);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    objc_super v14 = v43;
    v43[4] = v6;
    void v14[5] = v8;
    v14[6] = v10;
    void v14[7] = v12;
  }
  else
  {
    CGFloat v15 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    id v16 = v15;
    if (location != 0x7FFFFFFFFFFFFFFFLL && !length) {
      NSUInteger length = location != [v15 length];
    }
    if (length + location > [v16 length]) {
      NSUInteger length = [v16 length] - location;
    }
    double v17 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    CGFloat v18 = (void *)-[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v17);
    uint64_t v20 = v19;

    v41.receiver = self;
    v41.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _accessibilityBoundsForRange:](&v41, sel__accessibilityBoundsForRange_, v18, v20);
    int v21 = 0;
    uint64_t v22 = v43;
    *((void *)v43 + 4) = v23;
    *((void *)v22 + 5) = v24;
    *((void *)v22 + 6) = v25;
    *((void *)v22 + 7) = v26;
    if (location != 0x7FFFFFFF && location != 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v18 = [v16 string];
      int v21 = objc_msgSend(v18, "ic_rangeIsValid:", location, length);
    }
    if (location != 0x7FFFFFFF && location != 0x7FFFFFFFFFFFFFFFLL) {

    }
    if (v21)
    {
      uint64_t v27 = objc_msgSend(v16, "ic_attributedSubstringFromRange:", location, length);
      uint64_t v28 = *MEMORY[0x263F216E0];
      uint64_t v29 = [v27 length];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __68__ICBaseTextView_ICAccessibility_iOS___accessibilityBoundsForRange___block_invoke;
      v36[3] = &unk_2640B8CE8;
      id v30 = v27;
      NSUInteger v39 = location;
      NSUInteger v40 = length;
      id v37 = v30;
      unint64_t v38 = &v42;
      objc_msgSend(v30, "enumerateAttribute:inRange:options:usingBlock:", v28, 0, v29, 0, v36);
    }
    double v7 = v43[4];
    double v9 = v43[5];
    double v11 = v43[6];
    double v13 = v43[7];
  }
  _Block_object_dispose(&v42, 8);
  double v31 = v7;
  double v32 = v9;
  double v33 = v11;
  double v34 = v13;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

void __68__ICBaseTextView_ICAccessibility_iOS___accessibilityBoundsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    double v6 = [*(id *)(a1 + 32) attribute:@"ICAXAdditionalTextAttribute" atIndex:a3 effectiveRange:&v14];

    if (v6)
    {
      if (*(void *)(a1 + 56) + *(void *)(a1 + 48) <= (unint64_t)(v14 + *(void *)(a1 + 48) + v15))
      {
        [v5 accessibilityFrame];
        uint64_t v7 = a1 + 40;
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v7 = a1 + 40;
        double v9 = *(CGRect **)(v8 + 8);
        [v5 accessibilityFrame];
        v17.origin.double x = v10;
        v17.origin.double y = v11;
        v17.size.CGFloat width = v12;
        v17.size.CGFloat height = v13;
        CGRect v16 = CGRectUnion(v9[1], v17);
      }
      *(CGRect *)(*(void *)(*(void *)v7 + 8) + 32) = v16;
    }
  }
}

- (BOOL)_accessibilityHasTextOperations
{
  id v3 = [(ICBaseTextView *)self editorController];
  NSUInteger v4 = [v3 note];
  char v5 = [v4 isDeletedOrInTrash];

  if ((v5 & 1) != 0 || [(ICBaseTextView *)self selectedRange] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  return [(ICBaseTextView *)&v7 _accessibilityHasTextOperations];
}

- (id)_accessibilityTextOperations
{
  v66[1] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(ICBaseTextView *)self selectedRange] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_62;
  }
  v65.receiver = self;
  v65.super_class = (Class)ICBaseTextView;
  NSUInteger v4 = [(ICBaseTextView *)&v65 _accessibilityTextOperations];
  [v3 addObjectsFromArray:v4];

  unint64_t v5 = [(ICBaseTextView *)self selectedRange];
  double v6 = [(ICBaseTextView *)self textStorage];
  if (v5 >= [v6 length])
  {
    uint64_t v8 = [(ICBaseTextView *)self textStorage];
    uint64_t v9 = [v8 length];

    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    unint64_t v7 = v10 - 1;
  }
  else
  {
    unint64_t v7 = [(ICBaseTextView *)self selectedRange];
  }

  CGFloat v11 = [(ICBaseTextView *)self textStorage];
  unint64_t v12 = [v11 length];

  if (v7 < v12)
  {
    CGFloat v13 = [(ICBaseTextView *)self textStorage];
    uint64_t v14 = [v13 attribute:*MEMORY[0x263F5AB28] atIndex:v7 effectiveRange:0];

    uint64_t v15 = [(ICBaseTextView *)self editorController];
    CGRect v16 = [v15 icaxTextController];

    if ([(ICBaseTextView *)self isAccessibilityTableTextView])
    {
LABEL_29:
      __int16 v64 = 0;
      __int16 v63 = 0;
      [(ICBaseTextView *)self _icaxGetBoldForCurrentRange:(char *)&v64 + 1 italic:&v64 underline:(char *)&v63 + 1 strikethrough:&v63];
      if (HIBYTE(v64)) {
        [(ICBaseTextView *)self _icaxMakeNotBoldString];
      }
      else {
      objc_super v41 = [(ICBaseTextView *)self _icaxMakeBoldString];
      }
      if ((_BYTE)v64) {
        [(ICBaseTextView *)self _icaxMakeNotItalicString];
      }
      else {
      uint64_t v42 = [(ICBaseTextView *)self _icaxMakeItalicString];
      }
      if (HIBYTE(v63)) {
        [(ICBaseTextView *)self _icaxMakeNotUnderlinedString];
      }
      else {
      id v43 = [(ICBaseTextView *)self _icaxMakeUnderlinedString];
      }
      if ((_BYTE)v63) {
        [(ICBaseTextView *)self icaxMakeNotStrikethroughString];
      }
      else {
      uint64_t v44 = [(ICBaseTextView *)self icaxMakeStrikethroughString];
      }
      [v3 addObject:v41];
      [v3 addObject:v42];
      [v3 addObject:v43];
      [v3 addObject:v44];
      if (![(ICBaseTextView *)self isAccessibilityTableTextView])
      {
        long long v45 = [(ICBaseTextView *)self editorController];
        int v46 = [v45 canPerformAction:sel_increaseIndentation_ withSender:0];

        if (v46)
        {
          long long v47 = [(ICBaseTextView *)self _icaxIncreaseIndentationString];
          [v3 addObject:v47];
        }
        long long v48 = [(ICBaseTextView *)self editorController];
        int v49 = [v48 canPerformAction:sel_decreaseIndentation_ withSender:0];

        if (v49)
        {
          long long v50 = [(ICBaseTextView *)self _icaxDecreaseIndentationString];
          [v3 addObject:v50];
        }
      }
      if (-[ICBaseTextView canPerformAction:withSender:](self, "canPerformAction:withSender:", sel__insertDrawing_, 0, v14))
      {
        long long v51 = [(ICBaseTextView *)self _icaxInsertDrawingString];
        [v3 addObject:v51];
      }
      long long v52 = [(ICBaseTextView *)self editorController];
      long long v53 = [v52 note];

      long long v54 = [v53 calculateDocumentController];
      long long v55 = objc_msgSend(v54, "numberLiteralAtLocation:", -[ICBaseTextView selectedRange](self, "selectedRange"));

      if (v55)
      {
        if (ICInternalSettingsIsScrubbingEnabled())
        {
          if ([v53 isEditable])
          {
            if ([v53 isCalculateMathEnabled])
            {
              if (([v53 isDeletedOrInTrash] & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  long long v56 = [(ICBaseTextView *)self _icaxCalculateAdjustString];
                  [v3 addObject:v56];
                }
              }
            }
          }
        }
      }

      goto LABEL_56;
    }
    if ([v14 style] == 103)
    {
      uint64_t v17 = [(ICBaseTextView *)self selectedRange];
      uint64_t v19 = v18;
      uint64_t v20 = [(ICBaseTextView *)self textStorage];
      int v21 = objc_msgSend(v16, "todoForRange:inTextStorage:", v17, v19, v20);

      if (!v21)
      {
LABEL_28:

        goto LABEL_29;
      }
      if ([v21 done]) {
        [(ICBaseTextView *)self _icaxMarkAsIncompleteString];
      }
      else {
      uint64_t v26 = [(ICBaseTextView *)self _icaxMarkAsCompletedString];
      }
      [v3 addObject:v26];

      uint64_t v61 = [(ICBaseTextView *)self _icaxRemoveChecklistString];
      objc_msgSend(v3, "addObject:");
      uint64_t v27 = (void *)MEMORY[0x263F08D40];
      uint64_t v28 = [(ICBaseTextView *)self selectedRange];
      id v30 = objc_msgSend(v27, "valueWithRange:", v28, v29);
      v66[0] = v30;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:1];

      int v32 = [v16 checklistItemExistsMarkedCompleted:1 inTextView:self forRanges:v31];
      int v33 = [v16 checklistItemExistsMarkedCompleted:0 inTextView:self forRanges:v31];
      uint64_t v34 = [(ICBaseTextView *)self selectedRange];
      int v36 = objc_msgSend(v16, "canMoveCheckedChecklistsToBottomInTextView:forRange:", self, v34, v35);
      if (v33)
      {
        id v37 = [(ICBaseTextView *)self _icaxChecklistMarkAllItemsCompleteString];
        [v3 addObject:v37];
      }
      if (v32)
      {
        unint64_t v38 = [(ICBaseTextView *)self _icaxChecklistUnmarkAllItemsCompleteString];
        [v3 addObject:v38];
      }
      if ((v33 & v36) == 1)
      {
        NSUInteger v39 = [(ICBaseTextView *)self _icaxChecklistMoveCheckedToBottomString];
        [v3 addObject:v39];
      }
      if (v32)
      {
        NSUInteger v40 = [(ICBaseTextView *)self _icaxChecklistDeleteCheckedItemsString];
        [v3 addObject:v40];
      }
      uint64_t v25 = (void *)v61;
    }
    else
    {
      int v21 = [(ICBaseTextView *)self _icaxAttachmentViewForCurrentSelectedRange];
      if (v21) {
        goto LABEL_28;
      }
      uint64_t v22 = [(ICBaseTextView *)self editorController];
      uint64_t v23 = [v22 navigationItemConfiguration];
      int v24 = [v23 canAddChecklist];

      if (!v24) {
        goto LABEL_28;
      }
      uint64_t v25 = [(ICBaseTextView *)self _icaxMakeChecklistString];
      [v3 addObject:v25];
    }

    goto LABEL_28;
  }
LABEL_56:
  if (![(ICBaseTextView *)self isAccessibilityTableTextView])
  {
    long long v57 = [(ICBaseTextView *)self _icaxAttachmentViewForCurrentSelectedRange];
    long long v58 = v57;
    if (v57)
    {
      long long v59 = [v57 _accessibilityTextOperations];
      if ([v59 count]) {
        [v3 addObjectsFromArray:v59];
      }
    }
  }
LABEL_62:

  return v3;
}

- (id)_icaxLinkEditActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  NSUInteger v4 = [(ICBaseTextView *)self textContainer];
  unint64_t v5 = ICDynamicCast();

  if (([(ICBaseTextView *)self ic_isInSecureWindow] & 1) == 0
    && ![(ICBaseTextView *)self selectionContainsNonLinkAttachment])
  {
    double v6 = [(ICBaseTextView *)self editorController];
    unint64_t v7 = [v6 note];
    if (![v7 isSharedReadOnly])
    {
      char v8 = [v5 insideSiriSnippet];

      if (v8) {
        goto LABEL_11;
      }
      BOOL v9 = [(ICBaseTextView *)self selectionContainsLink];
      uint64_t v10 = [MEMORY[0x263F086E0] mainBundle];
      CGFloat v11 = v10;
      if (v9) {
        unint64_t v12 = @"Edit Link";
      }
      else {
        unint64_t v12 = @"Add Link";
      }
      double v6 = [v10 localizedStringForKey:v12 value:&stru_26C10E100 table:0];

      id v13 = objc_alloc(MEMORY[0x263F823A0]);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke;
      v21[3] = &unk_2640B8D10;
      void v21[4] = self;
      unint64_t v7 = (void *)[v13 initWithName:v6 actionHandler:v21];
      objc_msgSend(v3, "ic_addNonNilObject:", v7);
      if ([(ICBaseTextView *)self selectionContainsLink])
      {
        uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v15 = [v14 localizedStringForKey:@"Remove Link" value:&stru_26C10E100 table:0];

        id v16 = objc_alloc(MEMORY[0x263F823A0]);
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke_2;
        v20[3] = &unk_2640B8D10;
        void v20[4] = self;
        uint64_t v17 = (void *)[v16 initWithName:v15 actionHandler:v20];
        objc_msgSend(v3, "ic_addNonNilObject:", v17);
      }
    }
  }
LABEL_11:
  uint64_t v18 = (void *)[v3 copy];

  return v18;
}

uint64_t __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) editorController];
  id v3 = [v2 auxiliaryResponder];

  if (v3)
  {
    objc_opt_class();
    NSUInteger v4 = [*(id *)(a1 + 32) editorController];
    unint64_t v5 = [v4 auxiliaryResponder];
    double v6 = ICDynamicCast();
  }
  else
  {
    double v6 = [*(id *)(a1 + 32) editorController];
  }
  [v6 openLinkEditor:*(void *)(a1 + 32)];

  return 1;
}

uint64_t __59__ICBaseTextView_ICAccessibility_iOS___icaxLinkEditActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) editorController];
  if (![v2 conformsToProtocol:&unk_26C161198]) {
    goto LABEL_4;
  }
  id v3 = [*(id *)(a1 + 32) editorController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    unint64_t v5 = [*(id *)(a1 + 32) editorController];
    uint64_t v2 = ICProtocolCast();

    [v2 removeLinksFromCurrentSelection];
LABEL_4:
  }
  return 1;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4 = a3;
  if ([(ICBaseTextView *)self selectedRange] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_16;
  }
  unint64_t v5 = [(ICBaseTextView *)self _icaxMarkAsIncompleteString];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    [(ICBaseTextView *)self _icaxMarkTodoIncompleteForCurrentSelection];
    unint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    char v8 = v7;
    BOOL v9 = @"Incomplete: %@";
LABEL_10:
    uint64_t v18 = [v7 localizedStringForKey:v9 value:&stru_26C10E100 table:0];

    uint64_t v19 = NSString;
    uint64_t v20 = [(ICBaseTextView *)self _icaxCurrentParagraph];
    int v21 = objc_msgSend(v19, "localizedStringWithFormat:", v18, v20);

    ICAccessibilityPostAnnouncementNotification();
LABEL_11:
    char v22 = 1;
    goto LABEL_12;
  }
  uint64_t v10 = [(ICBaseTextView *)self _icaxMarkAsCompletedString];
  int v11 = [v4 isEqualToString:v10];

  if (v11)
  {
    [(ICBaseTextView *)self _icaxMarkTodoCompleteForCurrentSelection];
    unint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    char v8 = v7;
    BOOL v9 = @"Completed: %@";
    goto LABEL_10;
  }
  unint64_t v12 = [(ICBaseTextView *)self _icaxRemoveChecklistString];
  int v13 = [v4 isEqualToString:v12];

  if (v13)
  {
    uint64_t v14 = [(ICBaseTextView *)self editorController];
    [v14 icaxToggleTodoStyle];

    unint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    char v8 = v7;
    BOOL v9 = @"Body: %@";
    goto LABEL_10;
  }
  uint64_t v15 = [(ICBaseTextView *)self _icaxMakeChecklistString];
  int v16 = [v4 isEqualToString:v15];

  if (v16)
  {
    uint64_t v17 = [(ICBaseTextView *)self editorController];
    [v17 icaxToggleTodoStyle];

    unint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
    char v8 = v7;
    BOOL v9 = @"Checklist item: %@";
    goto LABEL_10;
  }
  int v33 = [(ICBaseTextView *)self _icaxChecklistMarkAllItemsCompleteString];
  int v34 = [v4 isEqualToString:v33];

  if (v34)
  {
    [(ICBaseTextView *)self _icaxChecklistMarkAllComplete];
    goto LABEL_11;
  }
  uint64_t v35 = [(ICBaseTextView *)self _icaxChecklistUnmarkAllItemsCompleteString];
  int v36 = [v4 isEqualToString:v35];

  if (v36)
  {
    [(ICBaseTextView *)self _icaxChecklistUnMarkAllComplete];
    goto LABEL_11;
  }
  id v37 = [(ICBaseTextView *)self _icaxChecklistDeleteCheckedItemsString];
  int v38 = [v4 isEqualToString:v37];

  if (v38)
  {
    [(ICBaseTextView *)self _icaxChecklistDeleteChecked];
    goto LABEL_11;
  }
  NSUInteger v39 = [(ICBaseTextView *)self _icaxChecklistMoveCheckedToBottomString];
  int v40 = [v4 isEqualToString:v39];

  if (v40)
  {
    [(ICBaseTextView *)self _icaxChecklistSortCheckedToBottom];
    goto LABEL_11;
  }
  objc_super v41 = [(ICBaseTextView *)self _icaxMakeBoldString];
  if ([v4 isEqualToString:v41])
  {

LABEL_31:
    [(ICBaseTextView *)self toggleBoldface:0];
    goto LABEL_11;
  }
  uint64_t v42 = [(ICBaseTextView *)self _icaxMakeNotBoldString];
  int v43 = [v4 isEqualToString:v42];

  if (v43) {
    goto LABEL_31;
  }
  uint64_t v44 = [(ICBaseTextView *)self _icaxMakeItalicString];
  if ([v4 isEqualToString:v44])
  {

LABEL_35:
    [(ICBaseTextView *)self toggleItalics:0];
    goto LABEL_11;
  }
  long long v45 = [(ICBaseTextView *)self _icaxMakeNotItalicString];
  int v46 = [v4 isEqualToString:v45];

  if (v46) {
    goto LABEL_35;
  }
  long long v47 = [(ICBaseTextView *)self _icaxMakeUnderlinedString];
  if ([v4 isEqualToString:v47])
  {

LABEL_39:
    [(ICBaseTextView *)self toggleUnderline:0];
    goto LABEL_11;
  }
  long long v48 = [(ICBaseTextView *)self _icaxMakeNotUnderlinedString];
  int v49 = [v4 isEqualToString:v48];

  if (v49) {
    goto LABEL_39;
  }
  long long v50 = [(ICBaseTextView *)self icaxMakeStrikethroughString];
  if ([v4 isEqualToString:v50])
  {

LABEL_43:
    [(ICBaseTextView *)self toggleStrikethrough];
    goto LABEL_11;
  }
  long long v51 = [(ICBaseTextView *)self icaxMakeNotStrikethroughString];
  int v52 = [v4 isEqualToString:v51];

  if (v52) {
    goto LABEL_43;
  }
  long long v53 = [(ICBaseTextView *)self _icaxDecreaseIndentationString];
  int v54 = [v4 isEqualToString:v53];

  if (v54)
  {
    long long v55 = [(ICBaseTextView *)self targetForAction:sel_decreaseIndentation_ withSender:0];
    [v55 decreaseIndentation:0];
LABEL_48:

    goto LABEL_11;
  }
  long long v56 = [(ICBaseTextView *)self _icaxIncreaseIndentationString];
  int v57 = [v4 isEqualToString:v56];

  if (v57)
  {
    long long v55 = [(ICBaseTextView *)self targetForAction:sel_increaseIndentation_ withSender:0];
    [v55 increaseIndentation:0];
    goto LABEL_48;
  }
  long long v58 = [(ICBaseTextView *)self _icaxInsertDrawingString];
  int v59 = [v4 isEqualToString:v58];

  if (v59)
  {
    [(ICBaseTextView *)self _insertDrawing:0];
    goto LABEL_11;
  }
  long long v60 = [(ICBaseTextView *)self _icaxCalculateAdjustString];
  int v61 = [v4 isEqualToString:v60];

  if (v61)
  {
    uint64_t v62 = [(ICBaseTextView *)self editorController];
    __int16 v63 = [v62 note];
    long long v55 = [v63 calculateDocumentController];

    __int16 v64 = objc_msgSend(v55, "numberLiteralAtLocation:", -[ICBaseTextView selectedRange](self, "selectedRange"));
    if (v64)
    {
      objc_super v65 = [(ICBaseTextView *)self editorController];
      long long v66 = [v65 calculateScrubberController];
      [v66 showScrubberForNumberLiteral:v64 isCompact:0];
    }
    goto LABEL_48;
  }
  char v22 = 0;
LABEL_12:
  uint64_t v23 = [(ICBaseTextView *)self _icaxAttachmentViewForCurrentSelectedRange];
  int v24 = [v23 _accessibilityTextOperations];
  int v25 = [v24 containsObject:v4];

  if (v25)
  {
    char v26 = [v23 _accessibilityTextOperationAction:v4];

    if (v26)
    {
LABEL_14:
      unsigned __int8 v27 = 1;
      goto LABEL_19;
    }
  }
  else
  {

    if (v22) {
      goto LABEL_14;
    }
  }
LABEL_16:
  uint64_t v28 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v29 = [v28 localizedStringForKey:@"Share Attachment" value:&stru_26C10E100 table:0];
  int v30 = [v4 isEqualToString:v29];

  if (v30)
  {
    double v31 = [(ICBaseTextView *)self _icaxAttachmentViewForCurrentSelectedRange];
    unsigned __int8 v27 = [v31 _accessibilityTextOperationAction:v4];
  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)ICBaseTextView;
    unsigned __int8 v27 = [(ICBaseTextView *)&v67 _accessibilityTextOperationAction:v4];
  }
LABEL_19:

  return v27;
}

- (id)automationElements
{
  id v3 = (void *)MEMORY[0x263EFF980];
  v12.receiver = self;
  v12.super_class = (Class)ICBaseTextView;
  id v4 = [(ICBaseTextView *)&v12 automationElements];
  unint64_t v5 = [v3 arrayWithArray:v4];

  int v6 = [(UIView *)self icaxRecursiveSubviewsPassingTest:&__block_literal_global_497];
  [v5 addObjectsFromArray:v6];
  unint64_t v7 = [(ICBaseTextView *)self _icaxLinkElements];
  if ([v7 count]) {
    [v5 addObjectsFromArray:v7];
  }
  char v8 = [(ICBaseTextView *)self ic_pkTiledView];
  objc_msgSend(v5, "ic_addNonNilObject:", v8);

  BOOL v9 = [(ICBaseTextView *)self _icaxAdditionalElementsForAutomation];
  objc_msgSend(v5, "ic_addObjectsFromNonNilArray:", v9);

  uint64_t v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __57__ICBaseTextView_ICAccessibility_iOS__automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_icaxAdditionalElementsForAutomation
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_msgSend(v3, "ic_addNonNilObject:", NSClassFromString(&cfstr_Iccollaborator_1.isa));
  objc_msgSend(v3, "ic_addNonNilObject:", NSClassFromString(&cfstr_Iccollaborator.isa));
  [v3 addObject:objc_opt_class()];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxAdditionalElementsForAutomation__block_invoke;
  v7[3] = &unk_2640B8D38;
  id v8 = v3;
  id v4 = v3;
  unint64_t v5 = [(UIView *)self icaxRecursiveSubviewsPassingTest:v7];

  return v5;
}

uint64_t __75__ICBaseTextView_ICAccessibility_iOS___icaxAdditionalElementsForAutomation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_opt_class();

  return [v1 containsObject:v2];
}

- (id)accessibilityCustomActions
{
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  NSUInteger v39 = __Block_byref_object_copy__2;
  int v40 = __Block_byref_object_dispose__2;
  id v41 = [MEMORY[0x263EFF980] array];
  id v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [v3 string];
  uint64_t v5 = [(ICBaseTextView *)self selectedRange];
  uint64_t v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5, v6);
  uint64_t v9 = v8;

  uint64_t v10 = [(ICBaseTextView *)self textStorage];
  uint64_t v11 = *MEMORY[0x263F814A0];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke;
  v35[3] = &unk_2640B8D60;
  v35[4] = self;
  v35[5] = &v36;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v11, v7, v9, 0, v35);

  objc_super v12 = (void *)v37[5];
  int v13 = [(ICBaseTextView *)self _icaxLinkEditActions];
  [v12 addObjectsFromArray:v13];

  if (ICInternalSettingsIsPaperKitMathEnabled())
  {
    uint64_t v14 = [(ICBaseTextView *)self editorController];
    uint64_t v15 = [v14 note];
    if ([v15 isEditable])
    {
      uint64_t v16 = [(ICBaseTextView *)self selectedRange];

      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_10;
      }
      uint64_t v17 = [(ICBaseTextView *)self editorController];
      uint64_t v18 = [v17 calculateGraphingController];
      uint64_t v19 = [(ICBaseTextView *)self selectedRange];
      uint64_t v14 = objc_msgSend(v18, "insertionDecisionForExpressionsInRange:", v19, v20);

      if ([v14 allowsInsertingNewGraph])
      {
        int v21 = (void *)v37[5];
        id v22 = objc_alloc(MEMORY[0x263F823A0]);
        uint64_t v23 = [MEMORY[0x263F086E0] mainBundle];
        int v24 = [v23 localizedStringForKey:@"Insert Graph" value:&stru_26C10E100 table:0];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_2;
        v34[3] = &unk_2640B8D88;
        v34[4] = self;
        v34[5] = v14;
        int v25 = (void *)[v22 initWithName:v24 actionHandler:v34];
        [v21 addObject:v25];
      }
      if ([v14 allowsAddingToGraph])
      {
        char v26 = (void *)v37[5];
        id v27 = objc_alloc(MEMORY[0x263F823A0]);
        uint64_t v28 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v29 = [v28 localizedStringForKey:@"Add to Existing Graph" value:&stru_26C10E100 table:0];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_3;
        v33[3] = &unk_2640B8D88;
        void v33[4] = v14;
        void v33[5] = self;
        int v30 = (void *)[v27 initWithName:v29 actionHandler:v33];
        [v26 addObject:v30];
      }
    }
    else
    {
    }
  }
LABEL_10:
  double v31 = (void *)[(id)v37[5] copy];
  _Block_object_dispose(&v36, 8);

  return v31;
}

void __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = a2;
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v8 = [*(id *)(a1 + 32) icTextLayoutManager];
    uint64_t v9 = [v7 viewIdentifier];
    [v8 existingAttachmentViewForIdentifier:v9];
  }
  else
  {
    objc_opt_class();
    uint64_t v8 = ICDynamicCast();
    uint64_t v9 = [*(id *)(a1 + 32) layoutManager];
    [v8 viewForLayoutManager:v9];
  uint64_t v10 = };

  uint64_t v11 = [v10 accessibilityCustomActions];
  if ([v11 count])
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_addObjectsFromNonNilArray:", v11);
    *a5 = 1;
  }
}

uint64_t __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) editorController];
  id v3 = [v2 calculateGraphingController];
  [v3 performDecision:*(void *)(a1 + 40)];

  return 1;
}

uint64_t __65__ICBaseTextView_ICAccessibility_iOS__accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPrefersExistingGraph:1];
  uint64_t v2 = [*(id *)(a1 + 40) editorController];
  id v3 = [v2 calculateGraphingController];
  [v3 performDecision:*(void *)(a1 + 32)];

  return 1;
}

- (id)_icaxAttributedStringForRange:(_NSRange *)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    uint64_t v5 = (void *)[v4 mutableCopy];

    v11.NSUInteger length = [v5 length];
    v11.NSUInteger location = 0;
    NSRange v6 = NSIntersectionRange(*v3, v11);
    uint64_t v7 = objc_msgSend(v5, "ic_attributedSubstringFromRange:", v6.location, v6.length);
    uint64_t v8 = (void *)[v7 mutableCopy];

    objc_msgSend(v8, "removeAttribute:range:", @"ICAXAdditionalTextAttribute", 0, objc_msgSend(v8, "length"));
    id v3 = (NSRange *)[v8 copy];
  }

  return v3;
}

- (id)_icaxModifiedAttributedStorageString
{
  id v3 = [(ICBaseTextView *)self _icaxCachedModifiedAttributedString];

  if (!v3)
  {
    id v4 = [(ICBaseTextView *)self baseAttributedStringForAccessibility];
    uint64_t v5 = v4;
    if (v4)
    {
      NSRange v6 = (void *)[v4 mutableCopy];
      uint64_t v7 = [(ICBaseTextView *)self editorController];
      uint64_t v8 = [v7 note];
      uint64_t v9 = [v8 calculateDocumentController];
      uint64_t v10 = objc_msgSend(v6, "ic_range");
      objc_msgSend(v9, "formatExpressionsInAttributedString:range:textStorageOffset:skipStaleExpressions:", v6, v10, v11, 0, 1);

      [(ICBaseTextView *)self _accessibilityConvertStyleAttributesToAccessibility:v6];
      [(ICBaseTextView *)self _accessibilityAddMispellingsToAttributedString:v6];
      [(ICBaseTextView *)self _icaxAddPredictiveTextToAttributedString:v6];
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      v41[3] = 0;
      uint64_t v12 = *MEMORY[0x263F5AB28];
      uint64_t v13 = [v5 length];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke;
      v36[3] = &unk_2640B8DB0;
      int v40 = v41;
      id v14 = v6;
      id v37 = v14;
      uint64_t v38 = self;
      id v15 = v5;
      id v39 = v15;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v13, 0, v36);
      uint64_t v16 = [v15 length];
      uint64_t v17 = *MEMORY[0x263F814A0];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_2;
      v34[3] = &unk_2640B8C78;
      v34[4] = self;
      id v18 = v14;
      id v35 = v18;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v16, 0, v34);
      uint64_t v19 = objc_msgSend(v18, "ic_range");
      uint64_t v21 = v20;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_3;
      v32[3] = &unk_2640B8DD8;
      id v22 = v18;
      id v33 = v22;
      objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", v19, v21, 0, v32);
      uint64_t v23 = objc_msgSend(v22, "ic_range");
      uint64_t v25 = v24;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_4;
      v30[3] = &unk_2640B8E00;
      v30[4] = self;
      id v26 = v22;
      id v31 = v26;
      objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", v17, v23, v25, 0, v30);
      id v27 = (void *)[v26 copy];
      [(ICBaseTextView *)self set_icaxCachedModifiedAttributedString:v27];

      [(ICBaseTextView *)self icaxUpdateLinkRanges];
      _Block_object_dispose(v41, 8);
    }
  }
  uint64_t v28 = [(ICBaseTextView *)self _icaxCachedModifiedAttributedString];

  return v28;
}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v59 = v7;
    id v8 = v7;
    unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + a3;
    uint64_t v62 = v8;
    if ([v8 isList])
    {
      if (v9 < v9 + a4)
      {
        uint64_t v60 = a3;
        uint64_t v61 = a4;
        uint64_t v10 = 1;
        unint64_t v11 = v9;
        while (2)
        {
          uint64_t v12 = [*(id *)(a1 + 32) string];
          uint64_t v13 = objc_msgSend(v12, "paragraphRangeForRange:", v11, 0);
          uint64_t v15 = v14;

          if ([v8 style] == 103)
          {
            id v16 = objc_alloc(MEMORY[0x263F089B8]);
            uint64_t v17 = NSString;
            id v18 = objc_msgSend(NSString, "ic_attachmentCharacterString");
            uint64_t v19 = [v17 stringWithFormat:@" %@ ", v18];
            uint64_t v20 = (void *)[v16 initWithString:v19];

            id v21 = v8;
            uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
            uint64_t v23 = [*(id *)(a1 + 40) _icaxTodoButtonForParagraphStyle:v21];
            if (v23)
            {
              uint64_t v24 = -[ICTodoButtonProxyElement initWithTodoButton:inTextRange:textView:]([ICTodoButtonProxyElement alloc], "initWithTodoButton:inTextRange:textView:", v23, 0, 3, *(void *)(a1 + 40));
              objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x263F216E0], v24, 0, 3);
            }
            uint64_t v25 = [v20 length];
            objc_msgSend(v20, "addAttribute:value:range:", @"ICAXAdditionalTextAttribute", MEMORY[0x263EFFA88], 0, v25);
            [*(id *)(a1 + 32) insertAttributedString:v20 atIndex:v22 + v60];
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v20 length];
            v9 += [v20 length];
            v13 += [v20 length];

            id v8 = v62;
          }
          uint64_t v26 = v13 - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          unint64_t v63 = v9;
          switch([v8 style])
          {
            case 'd':
              id v27 = [MEMORY[0x263F086E0] mainBundle];
              uint64_t v28 = v27;
              uint64_t v29 = @"bullet";
              goto LABEL_13;
            case 'e':
              id v27 = [MEMORY[0x263F086E0] mainBundle];
              uint64_t v28 = v27;
              uint64_t v29 = @"dash";
LABEL_13:
              int v32 = [v27 localizedStringForKey:v29 value:&stru_26C10E100 table:0];

              int v30 = 0;
              goto LABEL_20;
            case 'f':
              id v33 = [*(id *)(a1 + 40) textStorage];
              id v31 = [v33 attribute:*MEMORY[0x263F5AD88] atIndex:v26 effectiveRange:0];

              if (v31)
              {
                int v32 = ICAccessibilityLocalizedNumber();
                int v30 = 0;
              }
              else
              {
                int v30 = 0;
LABEL_22:
                int v32 = 0;
              }
LABEL_23:
              uint64_t v40 = v15;
              if ([v32 length] && v15)
              {
                id v41 = [*(id *)(a1 + 48) string];
                uint64_t v42 = objc_msgSend(v41, "substringWithRange:", v15 + v26 - 1, 1);
                uint64_t v43 = [v42 characterAtIndex:0];

                uint64_t v44 = [MEMORY[0x263F08708] newlineCharacterSet];
                LODWORD(v43) = [v44 characterIsMember:v43];

                uint64_t v40 = v15 - v43;
                id v8 = v62;
              }
              if (v31)
              {
                if (!v32) {
                  goto LABEL_29;
                }
LABEL_28:
                objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F217C0], v32, v13, v40);
                goto LABEL_29;
              }
              id v31 = [NSNumber numberWithUnsignedInteger:v10];
              if (v32) {
                goto LABEL_28;
              }
LABEL_29:
              if ([v8 style] != 103) {
                objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F217B8], v31, v13, v40);
              }
              ++v10;
              unint64_t v11 = v13 + v15;

              a4 = v61;
              unint64_t v9 = v63;
              if (v11 >= v63 + v61) {
                break;
              }
              continue;
            case 'g':
              int v34 = [*(id *)(a1 + 40) editorController];
              uint64_t v35 = [v34 icaxTextController];
              uint64_t v36 = [*(id *)(a1 + 40) textStorage];
              int v30 = objc_msgSend((id)v35, "todoForRange:inTextStorage:", v26, 0, v36);

              LOBYTE(v35) = [v30 done];
              id v37 = [MEMORY[0x263F086E0] mainBundle];
              uint64_t v38 = v37;
              if (v35) {
                id v39 = @"checklist, completed";
              }
              else {
                id v39 = @"checklist, incomplete";
              }
              int v32 = [v37 localizedStringForKey:v39 value:&stru_26C10E100 table:0];

LABEL_20:
              id v31 = 0;
              goto LABEL_23;
            default:
              int v30 = 0;
              id v31 = 0;
              goto LABEL_22;
          }
          break;
        }
      }
    }
    else
    {
      long long v45 = objc_msgSend(MEMORY[0x263F5B4F8], "icaxStyleDescriptionForNamedStyle:", objc_msgSend(v8, "style"));
      if (a4)
      {
        int v46 = [*(id *)(a1 + 32) string];
        long long v47 = objc_msgSend(v46, "substringWithRange:", a4 + v9 - 1, 1);
        uint64_t v48 = [v47 characterAtIndex:0];

        int v49 = [MEMORY[0x263F08708] newlineCharacterSet];
        LODWORD(v47) = [v49 characterIsMember:v48];

        uint64_t v50 = a4 - v47;
      }
      else
      {
        uint64_t v50 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F218B0], v45, v9, v50);
      long long v51 = *(void **)(a1 + 32);
      uint64_t v52 = *MEMORY[0x263F21788];
      long long v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v62, "indent"));
      int v54 = v51;
      id v8 = v62;
      objc_msgSend(v54, "addAttribute:value:range:", v52, v53, v9, v50);
    }
    if ([v8 isBlockQuote])
    {
      long long v55 = *(void **)(a1 + 32);
      uint64_t v56 = *MEMORY[0x263F216E8];
      int v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v62, "blockQuoteLevel"));
      uint64_t v58 = v56;
      id v8 = v62;
      objc_msgSend(v55, "addAttribute:value:range:", v58, v57, v9, a4);
    }
    id v7 = v59;
  }
}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = ICDynamicCast();
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(void *)(a1 + 40), a3, a4);
    if (!ICInternalSettingsIsTextKit2Enabled())
    {
      uint64_t v14 = *MEMORY[0x263F216E0];
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v13 = [*(id *)(a1 + 32) layoutManager];
      id v16 = [v8 viewForLayoutManager:v13];
      objc_msgSend(v15, "addAttribute:value:range:", v14, v16, v9, 1);

LABEL_9:
      goto LABEL_10;
    }
    uint64_t v10 = [*(id *)(a1 + 32) icTextLayoutManager];
    unint64_t v11 = [v8 viewIdentifier];
    uint64_t v12 = [v10 existingAttachmentViewForIdentifier:v11];
LABEL_6:
    uint64_t v13 = (void *)v12;

    if (v13) {
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F216E0], v13, v9, 1);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = ICDynamicCast();
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(void *)(a1 + 40), a3, a4);
    uint64_t v10 = [*(id *)(a1 + 32) _icaxPencilKitAttachmentsDict];
    unint64_t v11 = [v8 attachmentIdentifier];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  objc_opt_class();
  id v8 = ICDynamicCast();
  uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "_icaxRangeInModifiedAttributedString:forRange:", *(void *)(a1 + 40), a3, a4);
  char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  uint64_t v19 = *(void **)(a1 + 32);
  if (IsTextKit2Enabled)
  {
    uint64_t v20 = [v19 icTextLayoutManager];
    id v21 = [v8 viewIdentifier];
    uint64_t v22 = [v20 existingAttachmentViewForIdentifier:v21];
  }
  else
  {
    uint64_t v20 = [v19 layoutManager];
    uint64_t v22 = [v8 viewForLayoutManager:v20];
  }

  if (v22) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F216E0], v22, v17, 1);
  }
  objc_opt_class();
  uint64_t v23 = ICDynamicCast();
  uint64_t v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v23 expressionRangeInTextStorage];
    if (v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v27 = v25;
      uint64_t v28 = v26;
      unint64_t v29 = v25 + v26;
      uint64_t v30 = objc_msgSend(*(id *)(a1 + 40), "ic_range");
      if (v29 <= v30 + v31)
      {
        uint64_t v33 = *MEMORY[0x263F83220];
        v34[0] = MEMORY[0x263EFFA88];
        int v32 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
        objc_msgSend(*(id *)(a1 + 40), "addAttributes:range:", v32, v27, v28);
      }
    }
  }

LABEL_10:
LABEL_11:
}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = +[ICTextViewAccessibility icaxEmphasisStyleNameFromAttributes:](ICTextViewAccessibility, "icaxEmphasisStyleNameFromAttributes:");
  if ([v7 length])
  {
    id v8 = (void *)MEMORY[0x263F218B0];
    uint64_t v9 = [v12 objectForKeyedSubscript:*MEMORY[0x263F218B0]];
    uint64_t v11 = *MEMORY[0x263F5B550];
    uint64_t v10 = __ICAccessibilityStringForVariables();
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *v8, v10, a3, a4, v7, v11);
  }
}

void __75__ICBaseTextView_ICAccessibility_iOS___icaxModifiedAttributedStorageString__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v20 localizedError];
  if ([v4 length])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [v20 expressionRangeInTextStorage];
    uint64_t v9 = objc_msgSend(v5, "_icaxRangeInModifiedAttributedString:forRange:", v6, v7, v8);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v9;
      uint64_t v12 = v10;
      unint64_t v13 = v9 + v10;
      uint64_t v14 = objc_msgSend(*(id *)(a1 + 40), "ic_range");
      if (v13 <= v14 + v15)
      {
        id v16 = NSString;
        uint64_t v17 = [MEMORY[0x263F086E0] mainBundle];
        id v18 = [v17 localizedStringForKey:@"Calculation error, %@", &stru_26C10E100, 0 value table];
        uint64_t v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v4);

        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F218B0], v19, v11, v12);
      }
    }
  }
}

- (void)_icaxResetCalculationErrorsForCalculateDocumentUpdate
{
}

- (void)_icaxAddParticipantEditHighlightsToString:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v71[3] = *MEMORY[0x263EF8340];
  id v51 = a3;
  uint64_t v7 = [(ICBaseTextView *)self editorController];
  uint64_t v8 = [v7 note];

  uint64_t v61 = v8;
  id v59 = [v8 collaborationColorManager];
  objc_opt_class();
  uint64_t v9 = [(ICBaseTextView *)self textStorage];
  uint64_t v10 = ICDynamicCast();

  uint64_t v11 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  unint64_t v12 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", location, length, v11);
  uint64_t v14 = v13;

  uint64_t v58 = v10;
  uint64_t v15 = [v10 mutableString];
  id v16 = (void *)[v15 copy];

  uint64_t v54 = v14;
  unint64_t v17 = v12 + v14;
  id v18 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v52 = self;
  uint64_t v19 = [(ICBaseTextView *)self textStorage];
  id v20 = [v19 string];
  int v57 = (void *)[v18 initWithString:v20];

  unint64_t v55 = v12;
  uint64_t v56 = *MEMORY[0x263F21650];
  if (v12 < v17)
  {
    unint64_t v21 = 0x263F08000uLL;
    uint64_t v22 = v54;
    unint64_t v23 = v12;
    long long v53 = v16;
    while (1)
    {
      uint64_t v24 = [v16 characterAtIndex:v23];
      uint64_t v25 = [*(id *)(v21 + 1800) newlineCharacterSet];
      LOBYTE(v24) = [v25 characterIsMember:v24];

      if ((v24 & 1) == 0) {
        break;
      }
LABEL_10:
      ++v23;
      if (!--v22) {
        goto LABEL_11;
      }
    }
    uint64_t v26 = [v58 editAtIndex:v23];
    uint64_t v27 = [v26 replicaID];
    uint64_t v28 = [v61 userIDForReplicaID:v27];

    [v59 highlightColorForUserID:v28 note:v61];
    v67 = long long v66 = (void *)v28;
    uint64_t v29 = [v59 participantAXDisplayNameForUserID:v28 forNote:v61];
    uint64_t v30 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v31 = [v30 localizedStringForKey:@"added by %@" value:&stru_26C10E100 table:0];

    __int16 v64 = (void *)v31;
    objc_super v65 = (void *)v29;
    uint64_t v63 = objc_msgSend(NSString, "localizedStringWithFormat:", v31, v29);
    int v32 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v33 = [v32 localizedStringForKey:@"at %@" value:&stru_26C10E100 table:0];

    int v34 = NSString;
    uint64_t v35 = [v26 timestamp];
    uint64_t v36 = objc_msgSend(v35, "ic_briefFormattedDateForAccessibility");
    uint64_t v62 = (void *)v33;
    uint64_t v37 = v33;
    uint64_t v38 = v26;
    id v39 = objc_msgSend(v34, "localizedStringWithFormat:", v37, v36);

    uint64_t v40 = [v67 icaxApproximateColorDescription];
    id v41 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v42 = [v41 localizedStringForKey:@"%@ highlight" value:&stru_26C10E100 table:0];

    uint64_t v43 = objc_msgSend(NSString, "localizedStringWithFormat:", v42, v40);
    uint64_t v44 = [v38 timestamp];
    if (v44
      && ([v38 replicaID],
          uint64_t v60 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v61, "trustsTimestampsFromReplicaID:")))
    {
      long long v45 = (void *)v63;
      v71[0] = v63;
      v71[1] = v39;
      v71[2] = v43;
      int v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:3];
    }
    else
    {
      long long v45 = (void *)v63;
      v70[0] = v63;
      v70[1] = v43;
      int v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
      if (!v44)
      {
LABEL_9:

        objc_msgSend(v57, "addAttribute:value:range:", v56, v46, v55, v54);
        id v16 = v53;
        unint64_t v21 = 0x263F08000;
        goto LABEL_10;
      }
    }

    goto LABEL_9;
  }
LABEL_11:
  objc_msgSend(v57, "ic_range");
  uint64_t v47 = TSUClampRange();
  uint64_t v49 = v48;
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __90__ICBaseTextView_ICAccessibility_iOS___icaxAddParticipantEditHighlightsToString_forRange___block_invoke;
  v68[3] = &unk_2640B8C78;
  v68[4] = v52;
  id v69 = v51;
  id v50 = v51;
  objc_msgSend(v57, "enumerateAttribute:inRange:options:usingBlock:", v56, v47, v49, 0, v68);
}

void __90__ICBaseTextView_ICAccessibility_iOS___icaxAddParticipantEditHighlightsToString_forRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v8 _icaxModifiedAttributedStorageString];
    objc_msgSend(v8, "_icaxRangeInModifiedAttributedString:forRange:", v9, a3, a4);

    objc_msgSend(*(id *)(a1 + 40), "ic_range");
    uint64_t v10 = TSUClampRange();
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x263F21650], v12, v10, v11);
  }
}

- (_NSRange)_icaxRangeInModifiedAttributedString:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v8 = [(ICBaseTextView *)self textStorage];
  uint64_t v9 = [v8 length];

  uint64_t v10 = [v7 length];
  unint64_t v11 = v10;
  if (location == v9)
  {
    NSUInteger length = 0;
  }
  else if (v10)
  {
    unint64_t v11 = 0;
    NSUInteger v12 = location;
    NSUInteger v13 = length;
    while (v12)
    {
      uint64_t v14 = [v7 attribute:@"ICAXAdditionalTextAttribute" atIndex:v11 effectiveRange:0];
      uint64_t v15 = v14 == 0;
      BOOL v16 = v14 != 0;

      LODWORD(v17) = v11 >= location && v16;
      if (length) {
        uint64_t v17 = v17;
      }
      else {
        uint64_t v17 = 0;
      }
      v13 += v17;
      v12 -= v15;
      if (++v11 >= [v7 length])
      {
        unint64_t v11 = 0;
        break;
      }
    }
    NSUInteger length = v13;
  }

  NSUInteger v18 = v11;
  NSUInteger v19 = length;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (_NSRange)_icaxRangeInTextStorageForRange:(_NSRange)a3 fromModifiedString:(id)a4
{
  unint64_t length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  unint64_t v8 = 0;
  if ([v7 length])
  {
    unint64_t v9 = location + length;
    if (location + length)
    {
      unint64_t v8 = 0;
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = [v7 attribute:@"ICAXAdditionalTextAttribute" atIndex:v10 effectiveRange:0];

        unint64_t v12 = length - (v10 >= location);
        if (!length) {
          unint64_t v12 = 0;
        }
        if (v10 >= location) {
          unint64_t v13 = v8;
        }
        else {
          unint64_t v13 = v8 + 1;
        }
        if (v11) {
          unint64_t length = v12;
        }
        else {
          unint64_t v8 = v13;
        }
        ++v10;
      }
      while (v10 < [v7 length] && v10 < v9);
    }
  }
  uint64_t v14 = [(ICBaseTextView *)self textStorage];
  unint64_t v15 = [v14 length];

  if (v8 >= v15) {
    NSUInteger v16 = v15;
  }
  else {
    NSUInteger v16 = v8;
  }
  uint64_t v17 = [(ICBaseTextView *)self textStorage];
  uint64_t v18 = [v17 length] - v16;

  if (length >= (v18 & (unint64_t)~(v18 >> 63))) {
    unint64_t length = v18 & ~(v18 >> 63);
  }

  NSUInteger v19 = v16;
  NSUInteger v20 = length;
  result.unint64_t length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (unint64_t)_icaxModifiedPositionForPosition:(unint64_t)a3
{
  uint64_t v5 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  unint64_t v6 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v5, a3, 0);

  return v6;
}

- (unint64_t)_icaxPositionForModifiedPosition:(unint64_t)a3
{
  uint64_t v5 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  unint64_t v6 = -[ICBaseTextView _icaxRangeInTextStorageForRange:fromModifiedString:](self, "_icaxRangeInTextStorageForRange:fromModifiedString:", a3, 0, v5);

  return v6;
}

- (unint64_t)_icaxLinePositionForPosition:(unint64_t)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
  uint64_t v8 = [v7 length];
  if (v8 - 1 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v8 - 1;
  }
  unint64_t v10 = [(ICBaseTextView *)self _icaxPositionForModifiedPosition:v9];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3010000000;
  uint64_t v35 = &unk_20C1E2BF2;
  long long v36 = xmmword_20C1794E0;
  unint64_t v11 = [(ICBaseTextView *)self textStorage];
  uint64_t v12 = [v11 length];

  unint64_t v13 = v12 - v10;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v14 = [(ICBaseTextView *)self textLayoutManager];
    unint64_t v15 = objc_msgSend(v14, "ic_textRangeForRange:", v10, v13);

    NSUInteger v16 = [(ICBaseTextView *)self textLayoutManager];
    uint64_t v17 = [v15 location];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke;
    v31[3] = &unk_2640B8E50;
    v31[4] = self;
    void v31[5] = &v32;
    v31[6] = v10;
    id v18 = (id)[v16 enumerateTextLayoutFragmentsFromLocation:v17 options:0 usingBlock:v31];
  }
  else
  {
    NSUInteger v19 = [(ICBaseTextView *)self layoutManager];
    uint64_t v20 = objc_msgSend(v19, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v13, 0);
    uint64_t v22 = v21;

    unint64_t v23 = [(ICBaseTextView *)self layoutManager];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_3;
    v30[3] = &unk_2640B8E78;
    v30[4] = self;
    void v30[5] = &v32;
    v30[6] = v10;
    objc_msgSend(v23, "enumerateLineFragmentsForGlyphRange:usingBlock:", v20, v22, v30);
  }
  uint64_t v24 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v7, v33[4], v33[5]);
  if (v4)
  {
    unint64_t v25 = v24;
  }
  else
  {
    unint64_t v26 = [(ICBaseTextView *)self _icaxModifiedPositionForPosition:v33[5] + v33[4]];
    if (ICInternalSettingsIsTextKit2Enabled()) {
      unsigned int v27 = [(ICBaseTextView *)self isFirstResponder];
    }
    else {
      unsigned int v27 = 1;
    }
    if (v26 < [v7 length]) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0;
    }
    unint64_t v25 = v26 - v28;
  }
  _Block_object_dispose(&v32, 8);

  return v25;
}

uint64_t __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v36 = a2;
  id v3 = [*(id *)(a1 + 32) textLayoutManager];
  BOOL v4 = [v36 rangeInElement];
  unint64_t v5 = objc_msgSend(v3, "ic_rangeForTextRange:", v4);
  uint64_t v7 = v6;

  unint64_t v8 = *(void *)(a1 + 48);
  uint64_t v30 = v7;
  unint64_t v31 = v5;
  BOOL v9 = v5 > v8 || v8 >= v5 + v7;
  int v10 = v9;
  unsigned int v32 = v10;
  if (!v9)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = [v36 textLineFragments];
    uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v11)
    {
      uint64_t v35 = *(void *)v43;
      uint64_t v34 = *MEMORY[0x263F81540];
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          unint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v38 = 0;
          id v39 = &v38;
          uint64_t v40 = 0x2020000000;
          uint64_t v41 = 0;
          uint64_t v14 = objc_msgSend(v13, "attributedString", v30, v31);
          unint64_t v15 = [v13 attributedString];
          uint64_t v16 = objc_msgSend(v15, "ic_range");
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_2;
          v37[3] = &unk_2640B8E28;
          void v37[4] = &v38;
          objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v34, v16, v17, 0, v37);

          uint64_t v18 = [v13 characterRange];
          uint64_t v20 = v19;
          uint64_t v21 = [*(id *)(a1 + 32) textLayoutManager];
          uint64_t v22 = [v36 rangeInElement];
          uint64_t v23 = objc_msgSend(v21, "ic_rangeForTextRange:", v22);
          uint64_t v24 = v39[3];

          uint64_t v25 = v23 + v18;
          unint64_t v26 = *(void *)(a1 + 48);
          if (v23 + v18 <= v26 && v26 < v20 - v24 + v25)
          {
            uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
            *(void *)(v28 + 32) = v25;
            *(void *)(v28 + 40) = v20 - v24;
            _Block_object_dispose(&v38, 8);

            goto LABEL_19;
          }
          _Block_object_dispose(&v38, 8);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v27 + 32) = v31;
    *(void *)(v27 + 40) = v30;
  }
LABEL_19:

  return v32;
}

void __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v14 = a2;
  uint64_t v7 = [v14 textLists];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    BOOL v9 = [v14 textLists];
    int v10 = [v9 firstObject];

    uint64_t v11 = [v14 tabStops];
    uint64_t v12 = [v11 count];
    unint64_t v13 = [v10 markerFormat];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v13 length] + v12;
  }
  *a5 = 1;
}

void __74__ICBaseTextView_ICAccessibility_iOS___icaxLinePositionForPosition_start___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  BOOL v9 = [*(id *)(a1 + 32) layoutManager];
  unint64_t v10 = objc_msgSend(v9, "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  uint64_t v12 = v11;

  unint64_t v13 = *(void *)(a1 + 48);
  if (v10 <= v13 && v13 < v10 + v12)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v15 + 32) = v10;
    *(void *)(v15 + 40) = v12;
    *a5 = 1;
  }
}

- (id)elementsForAccessibilityRotorType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeLinks"])
  {
    unint64_t v5 = [(ICBaseTextView *)self _icaxLinkElements];
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeChecklist"])
  {
    uint64_t v6 = [(ICBaseTextView *)self _icaxTodoElements];

    unint64_t v5 = (void *)v6;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeAttachments"])
  {
    uint64_t v7 = [(ICBaseTextView *)self _icaxAttachmentElementsForRotor];

    unint64_t v5 = (void *)v7;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeTables"])
  {
    uint64_t v8 = [(ICBaseTextView *)self _icaxTableElementsForRotor];

    unint64_t v5 = (void *)v8;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeTags"])
  {
    uint64_t v9 = [(ICBaseTextView *)self _icaxTagsElementsForRotor];

    unint64_t v5 = (void *)v9;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeMentions"])
  {
    uint64_t v10 = [(ICBaseTextView *)self _icaxMentionsElementsForRotor];

    unint64_t v5 = (void *)v10;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeCalculationResults"])
  {
    uint64_t v11 = [(ICBaseTextView *)self _icaxCalculationResultElementsForRotor];

    unint64_t v5 = (void *)v11;
  }
  if ([v4 isEqualToString:@"ICAccessibilityRotorTypeCalculationErrors"])
  {
    uint64_t v12 = [(ICBaseTextView *)self _icaxCalculationErrorElementsForRotor];

    unint64_t v5 = (void *)v12;
  }

  return v5;
}

- (id)accessibilityCustomRotors
{
  v13.receiver = self;
  v13.super_class = (Class)ICBaseTextView;
  uint64_t v3 = [(ICBaseTextView *)&v13 accessibilityCustomRotors];
  id v4 = (void *)v3;
  unint64_t v5 = (void *)MEMORY[0x263EFFA68];
  if (v3) {
    unint64_t v5 = (void *)v3;
  }
  id v6 = v5;

  uint64_t v7 = [(ICBaseTextView *)self editorController];
  uint64_t v8 = +[ICAccessibilityCustomRotorController sharedInstance];
  [v8 setNoteEditorViewController:v7];

  uint64_t v9 = +[ICAccessibilityCustomRotorController sharedInstance];
  uint64_t v10 = [v9 sharedTextViewRotors];
  uint64_t v11 = [v6 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)_icaxAttachmentElementsForRotor
{
  uint64_t v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __70__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __70__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElementsForRotor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v18 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
        id v7 = *(void **)(a1 + 32);
        if (IsTextKit2Enabled)
        {
          uint64_t v8 = [v7 textLayoutManager];
          uint64_t v9 = [*(id *)(a1 + 32) textLayoutManager];
          uint64_t v10 = [v9 documentRange];
          uint64_t v11 = [v10 location];
          uint64_t v12 = [v8 locationFromLocation:v11 withOffset:a3];

          objc_super v13 = *(void **)(a1 + 32);
          id v14 = [v13 textContainer];
          id v15 = [v18 viewProviderForParentView:v13 location:v12 textContainer:v14];
          uint64_t v16 = [v15 view];
        }
        else
        {
          uint64_t v12 = [v7 layoutManager];
          uint64_t v16 = [v18 viewForLayoutManager:v12];
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [*(id *)(a1 + 32) _addPencilKitAccessibilityElementIfNeededForTextAttachment:v18 toAttachmentElements:*(void *)(a1 + 40)];
        }
        else if (objc_opt_respondsToSelector())
        {
          [*(id *)(a1 + 40) addObject:v16];
        }
        else
        {
          [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no", "-[ICBaseTextView(ICAccessibility_iOS) _icaxAttachmentElementsForRotor]_block_invoke", 1, 0, @"%@ does not conform to 'ICAccessibilityRotorSearchElement'", v16 functionName simulateCrash showAlert format];
        }
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(a1 + 32) _addPencilKitAccessibilityElementIfNeededForTextAttachment:v18 toAttachmentElements:*(void *)(a1 + 40)];
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)_icaxTableElementsForRotor
{
  uint64_t v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __65__ICBaseTextView_ICAccessibility_iOS___icaxTableElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __65__ICBaseTextView_ICAccessibility_iOS___icaxTableElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v16 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      uint64_t v5 = *(void **)(a1 + 32);
      if (IsTextKit2Enabled)
      {
        uint64_t v6 = [v5 icTextLayoutManager];
        id v7 = [v16 viewIdentifier];
        uint64_t v8 = [v6 existingAttachmentViewForIdentifier:v7];
      }
      else
      {
        uint64_t v6 = [v5 layoutManager];
        uint64_t v8 = [v16 viewForLayoutManager:v6];
      }

      objc_opt_class();
      uint64_t v9 = [v8 accessibilityElements];
      uint64_t v10 = [v9 firstObject];
      uint64_t v11 = ICCheckedDynamicCast();

      uint64_t v12 = [v11 tableAXController];
      LODWORD(v10) = [v12 isEditable];

      if (v10)
      {
        objc_super v13 = [v11 tableAXController];
        id v14 = [v13 cellElementForColumnIndex:0 rowIndex:0];

        objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v14);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)_icaxTagsElementsForRotor
{
  id v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __64__ICBaseTextView_ICAccessibility_iOS___icaxTagsElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __64__ICBaseTextView_ICAccessibility_iOS___icaxTagsElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    uint64_t v5 = *(void **)(a1 + 32);
    if (IsTextKit2Enabled)
    {
      uint64_t v6 = [v5 icTextLayoutManager];
      id v7 = [v10 viewIdentifier];
      uint64_t v8 = [v6 existingAttachmentViewForIdentifier:v7];
      uint64_t v9 = ICDynamicCast();
    }
    else
    {
      uint64_t v6 = [v5 layoutManager];
      id v7 = [v10 viewForLayoutManager:v6];
      uint64_t v9 = ICDynamicCast();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }
}

- (id)_icaxMentionsElementsForRotor
{
  id v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __68__ICBaseTextView_ICAccessibility_iOS___icaxMentionsElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __68__ICBaseTextView_ICAccessibility_iOS___icaxMentionsElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    uint64_t v5 = *(void **)(a1 + 32);
    if (IsTextKit2Enabled)
    {
      uint64_t v6 = [v5 icTextLayoutManager];
      id v7 = [v10 viewIdentifier];
      uint64_t v8 = [v6 existingAttachmentViewForIdentifier:v7];
      uint64_t v9 = ICDynamicCast();
    }
    else
    {
      uint64_t v6 = [v5 layoutManager];
      id v7 = [v10 viewForLayoutManager:v6];
      uint64_t v9 = ICDynamicCast();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }
}

- (id)_icaxCalculationResultElementsForRotor
{
  id v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __77__ICBaseTextView_ICAccessibility_iOS___icaxCalculationResultElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __77__ICBaseTextView_ICAccessibility_iOS___icaxCalculationResultElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    uint64_t v5 = *(void **)(a1 + 32);
    if (IsTextKit2Enabled)
    {
      uint64_t v6 = [v5 icTextLayoutManager];
      id v7 = [v10 viewIdentifier];
      uint64_t v8 = [v6 existingAttachmentViewForIdentifier:v7];
      uint64_t v9 = ICDynamicCast();
    }
    else
    {
      uint64_t v6 = [v5 layoutManager];
      id v7 = [v10 viewForLayoutManager:v6];
      uint64_t v9 = ICDynamicCast();
    }

    objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v9);
  }
}

- (id)_icaxCalculationErrorElementsForRotor
{
  id v3 = [(ICBaseTextView *)self textStorage];
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v3 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __76__ICBaseTextView_ICAccessibility_iOS___icaxCalculationErrorElementsForRotor__block_invoke;
  objc_super v13 = &unk_2640B8E00;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __76__ICBaseTextView_ICAccessibility_iOS___icaxCalculationErrorElementsForRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = v13;
  if (v13)
  {
    uint64_t v5 = [v13 attachment];
    char v6 = [v5 isValidCalculateAttachment];

    id v4 = v13;
    if ((v6 & 1) == 0)
    {
      char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      objc_opt_class();
      uint64_t v8 = *(void **)(a1 + 32);
      if (IsTextKit2Enabled)
      {
        uint64_t v9 = [v8 icTextLayoutManager];
        uint64_t v10 = [v13 viewIdentifier];
        uint64_t v11 = [v9 existingAttachmentViewForIdentifier:v10];
        uint64_t v12 = ICDynamicCast();
      }
      else
      {
        uint64_t v9 = [v8 layoutManager];
        uint64_t v10 = [v13 viewForLayoutManager:v9];
        uint64_t v12 = ICDynamicCast();
      }

      objc_msgSend(*(id *)(a1 + 40), "ic_addNonNilObject:", v12);
      id v4 = v13;
    }
  }
}

- (void)_icaxMarkTodoIncompleteForCurrentSelection
{
  id v8 = [(ICBaseTextView *)self editorController];
  id v3 = [v8 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self selectedRange];
  uint64_t v6 = v5;
  id v7 = [(ICBaseTextView *)self textStorage];
  objc_msgSend(v3, "setDone:range:inTextStorage:", 0, v4, v6, v7);
}

- (void)_icaxMarkTodoCompleteForCurrentSelection
{
  id v8 = [(ICBaseTextView *)self editorController];
  id v3 = [v8 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self selectedRange];
  uint64_t v6 = v5;
  id v7 = [(ICBaseTextView *)self textStorage];
  objc_msgSend(v3, "setDone:range:inTextStorage:", 1, v4, v6, v7);
}

- (void)_icaxChecklistMarkAllComplete
{
  id v5 = [(ICBaseTextView *)self editorController];
  id v3 = [v5 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self ic_selectedRanges];
  [v3 markAllChecklistItemsCompleted:1 inTextview:self forSelectedRanges:v4];
}

- (void)_icaxChecklistUnMarkAllComplete
{
  id v5 = [(ICBaseTextView *)self editorController];
  id v3 = [v5 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self ic_selectedRanges];
  [v3 markAllChecklistItemsCompleted:0 inTextview:self forSelectedRanges:v4];
}

- (void)_icaxChecklistDeleteChecked
{
  id v5 = [(ICBaseTextView *)self editorController];
  id v3 = [v5 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self ic_selectedRanges];
  [v3 removeChecklistItemsMarkedCompleted:1 inTextView:self forRanges:v4];
}

- (void)_icaxChecklistSortCheckedToBottom
{
  id v6 = [(ICBaseTextView *)self editorController];
  id v3 = [v6 icaxTextController];
  uint64_t v4 = [(ICBaseTextView *)self selectedRange];
  objc_msgSend(v3, "moveCheckedChecklistsToBottomInTextView:forRange:animated:", self, v4, v5, 1);
}

- (void)textStorageWillPerformMerge:(id)a3
{
}

- (void)textStorageDidPerformMerge:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  [(ICBaseTextView *)self icaxClearCaches];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F81340];
  uint64_t v5 = *MEMORY[0x263F5AFE8];
  v6[0] = MEMORY[0x263EFFA88];
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  UIAccessibilityPostNotification(v3, v4);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)childElementsForAccessibilityReparenting
{
  [(ICBaseTextView *)self contentOffset];
  double v4 = v3;
  [(ICBaseTextView *)self _icaxLastOffsetForBuildingReparentingCache];
  if (vabdd_f64(v4, v5) > 200.0) {
    [(ICBaseTextView *)self icaxClearCachedChildrenForReparenting];
  }
  id v6 = [(ICBaseTextView *)self _icaxCachedChildrenForReparenting];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v8 = [(ICBaseTextView *)self _accessibleSubviews];
    [v7 addObjectsFromArray:v8];

    uint64_t v9 = [(ICBaseTextView *)self textStorage];
    uint64_t v10 = *MEMORY[0x263F814A0];
    uint64_t v11 = [(ICBaseTextView *)self textStorage];
    uint64_t v12 = [v11 length];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    void v46[2] = __79__ICBaseTextView_ICAccessibility_iOS__childElementsForAccessibilityReparenting__block_invoke;
    v46[3] = &unk_2640B8C78;
    void v46[4] = self;
    id v13 = v7;
    id v47 = v13;
    objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, 0, v12, 0, v46);

    long long v45 = v13;
    id v14 = [v13 array];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v14 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

      id v14 = (void *)v15;
    }
    long long v44 = v14;
    uint64_t v16 = (void *)[v14 mutableCopy];
    uint64_t v17 = [v16 count];
    if (v17)
    {
      unint64_t v18 = v17;
      for (unint64_t i = 0; i < v18; ++i)
      {
        uint64_t v20 = [v16 objectAtIndexedSubscript:i];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v22 = 0;
          while (1)
          {
            if (i != v22)
            {
              uint64_t v23 = [v16 objectAtIndexedSubscript:v22];
              objc_opt_class();
              char v24 = objc_opt_isKindOfClass();

              uint64_t v25 = [v16 objectAtIndexedSubscript:i];
              [v25 accessibilityFrame];
              CGFloat v27 = v26;
              CGFloat v29 = v28;
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              uint64_t v34 = [v16 objectAtIndexedSubscript:v22];
              [v34 accessibilityFrame];
              v50.origin.double x = v35;
              v50.origin.double y = v36;
              v50.size.CGFloat width = v37;
              v50.size.CGFloat height = v38;
              v49.origin.double x = v27;
              v49.origin.double y = v29;
              v49.size.CGFloat width = v31;
              v49.size.CGFloat height = v33;
              BOOL v39 = CGRectEqualToRect(v49, v50);

              if ((v24 & 1) != 0 && v39) {
                break;
              }
            }
            if (v18 == ++v22) {
              goto LABEL_16;
            }
          }
          [v16 exchangeObjectAtIndex:i withObjectAtIndex:v22];
          [v16 removeObjectAtIndex:v22];
          --v18;
        }
LABEL_16:
        ;
      }
    }
    uint64_t v40 = (void *)[v16 copy];

    [(ICBaseTextView *)self set_icaxCachedChildrenForReparenting:v40];
    [(ICBaseTextView *)self contentOffset];
    [(ICBaseTextView *)self set_icaxLastOffsetForBuildingReparentingCache:v41];
    UIAccessibilityPostNotification(*MEMORY[0x263F831C0], 0);
  }
  long long v42 = [(ICBaseTextView *)self _icaxCachedChildrenForReparenting];

  return v42;
}

void __79__ICBaseTextView_ICAccessibility_iOS__childElementsForAccessibilityReparenting__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  double v4 = ICDynamicCast();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    if (IsTextKit2Enabled)
    {
      id v7 = [v6 icTextLayoutManager];
      id v8 = [v4 viewIdentifier];
      uint64_t v9 = [v7 existingAttachmentViewForIdentifier:v8];
      uint64_t v10 = ICDynamicCast();
    }
    else
    {
      id v7 = [v6 layoutManager];
      id v8 = [v7 viewForTextAttachment:v4];
      uint64_t v10 = ICDynamicCast();
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v10 isAccessibilityElement])
  {
    uint64_t v11 = [v10 superview];

    if (v11)
    {
      [*(id *)(a1 + 40) addObject:v10];
      goto LABEL_25;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 _accessibleSubviews];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
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
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [*(id *)(a1 + 40) addObject:v17];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
    unint64_t v18 = [v10 accessibilityElements];
    if (v18) {
      [*(id *)(a1 + 40) addObjectsFromArray:v18];
    }
LABEL_22:

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v19 = [*(id *)(a1 + 32) _icaxPencilKitAttachmentsDict];

      if (!v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_msgSend(*(id *)(a1 + 32), "set_icaxPencilKitAttachmentsDict:", v20);
      }
      uint64_t v21 = [v4 attachment];
      uint64_t v12 = [v21 identifier];

      if (v12)
      {
        uint64_t v22 = [*(id *)(a1 + 32) _icaxPencilKitAttachmentsDict];
        unint64_t v18 = [v22 objectForKeyedSubscript:v12];

        if (!v18)
        {
          unint64_t v18 = [[ICPencilKitAttachmentAccessibilityElement alloc] initWithTextAttachment:v4 textView:*(void *)(a1 + 32)];
          if (v18)
          {
            uint64_t v23 = [*(id *)(a1 + 32) _icaxPencilKitAttachmentsDict];
            [v23 setObject:v18 forKeyedSubscript:v12];

            char v24 = [(ICPencilKitAttachmentAccessibilityElement *)v18 resizeHandleElements];
            if ([v24 count]) {
              [*(id *)(a1 + 40) addObjectsFromArray:v24];
            }
            [*(id *)(a1 + 40) addObject:v18];
          }
        }
      }
      else
      {
        unint64_t v18 = 0;
      }
      goto LABEL_22;
    }
  }
LABEL_25:
}

- (id)accessibilityDragSourceDescriptors
{
  v28[1] = *MEMORY[0x263EF8340];
  if ([(ICBaseTextView *)self isEditing])
  {
    v27.receiver = self;
    v27.super_class = (Class)ICBaseTextView;
    id v3 = [(ICBaseTextView *)&v27 accessibilityDragSourceDescriptors];
    goto LABEL_24;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    double v4 = (id *)MEMORY[0x263F831D0];
LABEL_7:
    double v5 = (NSString *)*v4;
    goto LABEL_9;
  }
  if (UIAccessibilityIsSwitchControlRunning())
  {
    double v4 = (id *)MEMORY[0x263F831C8];
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_9:
  id v6 = UIAccessibilityFocusedElement(v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    ICDynamicCast();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 tableAXController];
    id v9 = [v8 hostingTableAttachmentView];

    uint64_t v10 = v9;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v6;
        uint64_t v25 = [v9 accessibilityLabel];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v11 = 0;
          goto LABEL_22;
        }
        id v9 = v6;
        uint64_t v25 = [v9 icaxDragSourceName];
      }
      uint64_t v11 = (void *)v25;
      if (v9) {
        goto LABEL_14;
      }
LABEL_22:
      id v3 = 0;
      goto LABEL_23;
    }
    id v7 = v6;
    id v9 = [v7 attachmentDrawingView];
    uint64_t v10 = v7;
  }
  uint64_t v11 = [v10 accessibilityLabel];

  if (!v9) {
    goto LABEL_22;
  }
LABEL_14:
  uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"Drag %@" value:&stru_26C10E100 table:0];

  uint64_t v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v11);
  [v9 center];
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [v9 superview];
  -[ICBaseTextView convertPoint:fromView:](self, "convertPoint:fromView:", v19, v16, v18);
  double v21 = v20;
  double v23 = v22;

  char v24 = objc_msgSend(objc_alloc(MEMORY[0x263F823C8]), "initWithName:point:inView:", v14, self, v21, v23);
  v28[0] = v24;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

LABEL_23:
LABEL_24:

  return v3;
}

- (id)accessibilityDropPointDescriptors
{
  v23[1] = *MEMORY[0x263EF8340];
  if (![(ICBaseTextView *)self isEditable])
  {
    id v3 = 0;
    goto LABEL_25;
  }
  if ([(ICBaseTextView *)self isEditing])
  {
    v22.receiver = self;
    v22.super_class = (Class)ICBaseTextView;
    id v3 = [(ICBaseTextView *)&v22 accessibilityDropPointDescriptors];
    goto LABEL_25;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    double v4 = (id *)MEMORY[0x263F831D0];
LABEL_9:
    double v5 = (NSString *)*v4;
    goto LABEL_11;
  }
  if (UIAccessibilityIsSwitchControlRunning())
  {
    double v4 = (id *)MEMORY[0x263F831C8];
    goto LABEL_9;
  }
  double v5 = 0;
LABEL_11:
  id v6 = UIAccessibilityFocusedElement(v5);
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    ICDynamicCast();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 tableAXController];
    id v11 = [v10 hostingTableAttachmentView];

    uint64_t v12 = v11;
LABEL_15:
    uint64_t v13 = [v12 accessibilityLabel];

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    id v11 = [v9 attachmentDrawingView];
    uint64_t v12 = v9;
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    uint64_t v13 = [v11 accessibilityLabel];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v13 = 0;
      goto LABEL_23;
    }
    id v11 = v6;
    uint64_t v13 = [v11 icaxDragSourceName];
    [v11 bounds];
    double MidX = CGRectGetMidX(v25);
    [v11 bounds];
    -[ICBaseTextView convertPoint:fromView:](self, "convertPoint:fromView:", v11, MidX, CGRectGetMinY(v26));
    double v7 = v19;
    double v8 = v20;
  }
LABEL_16:
  if (!v11)
  {
LABEL_23:
    id v3 = 0;
    goto LABEL_24;
  }
  uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
  double v15 = [v14 localizedStringForKey:@"Drop before %@" value:&stru_26C10E100 table:0];

  double v16 = objc_msgSend(NSString, "localizedStringWithFormat:", v15, v13);
  double v17 = objc_msgSend(objc_alloc(MEMORY[0x263F823C8]), "initWithName:point:inView:", v16, self, v7, v8);
  v23[0] = v17;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];

LABEL_24:
LABEL_25:

  return v3;
}

- (id)_icaxCurrentParagraph
{
  id v3 = [(ICBaseTextView *)self textStorage];
  double v4 = [v3 string];
  uint64_t v5 = [(ICBaseTextView *)self selectedRange];
  uint64_t v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5 + v6, 0);
  uint64_t v9 = v8;

  uint64_t v10 = [(ICBaseTextView *)self textStorage];
  id v11 = [v10 string];
  uint64_t v12 = objc_msgSend(v11, "substringWithRange:", v7, v9);

  return v12;
}

- (_NSRange)_icaxRangeOfAttachment:(id)a3
{
  id v3 = a3;
  double v4 = [v3 note];
  uint64_t v5 = [v4 rangeForAttachment:v3];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.unint64_t length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)_icaxFirstTextAttachmentInRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy__2;
  double v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  if (a3.length)
  {
    NSUInteger length = a3.length;
    uint64_t v5 = [(ICBaseTextView *)self textStorage];
    uint64_t v6 = *MEMORY[0x263F814A0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__ICBaseTextView_ICAccessibility_iOS___icaxFirstTextAttachmentInRange___block_invoke;
    v13[3] = &unk_2640B80C8;
    v13[4] = &v14;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v6, location, length, 0, v13);
  }
  else
  {
    NSUInteger v7 = [(ICBaseTextView *)self textStorage];
    uint64_t v5 = [v7 attributesAtIndex:location effectiveRange:0];

    objc_opt_class();
    NSUInteger v8 = [v5 objectForKeyedSubscript:*MEMORY[0x263F814A0]];
    uint64_t v9 = ICDynamicCast();
    uint64_t v10 = (void *)v15[5];
    void v15[5] = v9;
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __71__ICBaseTextView_ICAccessibility_iOS___icaxFirstTextAttachmentInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    id v7 = a2;
    objc_opt_class();
    uint64_t v8 = ICDynamicCast();

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a5 = 1;
  }
}

- (id)_icaxAttachmentViewForCurrentSelectedRange
{
  uint64_t v3 = [(ICBaseTextView *)self selectedRange];
  uint64_t v5 = -[ICBaseTextView _icaxFirstTextAttachmentInRange:](self, "_icaxFirstTextAttachmentInRange:", v3, v4);
  if (v5)
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    if (IsTextKit2Enabled)
    {
      id v7 = [(ICBaseTextView *)self icTextLayoutManager];
      uint64_t v8 = [v5 viewIdentifier];
      uint64_t v9 = [v7 existingAttachmentViewForIdentifier:v8];
      uint64_t v10 = ICDynamicCast();
    }
    else
    {
      id v7 = [(ICBaseTextView *)self layoutManager];
      uint64_t v8 = [v7 viewForBaseTextAttachmentNoCreate:v5];
      uint64_t v10 = ICDynamicCast();
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_icaxAttachmentElements
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(ICBaseTextView *)self textStorage];
  uint64_t v5 = *MEMORY[0x263F814A0];
  uint64_t v6 = [v4 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __62__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElements__block_invoke;
  uint64_t v13 = &unk_2640B8CA0;
  uint64_t v14 = self;
  id v15 = v3;
  id v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v7, v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __62__ICBaseTextView_ICAccessibility_iOS___icaxAttachmentElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v10 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      uint64_t v5 = *(void **)(a1 + 32);
      if (IsTextKit2Enabled)
      {
        uint64_t v6 = [v5 icTextLayoutManager];
        id v7 = [v10 viewIdentifier];
        uint64_t v8 = [v6 existingAttachmentViewForIdentifier:v7];
      }
      else
      {
        uint64_t v6 = [v5 layoutManager];
        uint64_t v8 = [v10 viewForLayoutManager:v6];
      }

      [*(id *)(a1 + 40) addObject:v8];
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)_icaxLinkElements
{
  if ([(ICBaseTextView *)self isEditing])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(ICBaseTextView *)self _accessibilityInternalTextLinks];
  }

  return v3;
}

- (id)_icaxTodoElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(ICBaseTextView *)self textStorage];
  uint64_t v5 = *MEMORY[0x263F5AB28];
  uint64_t v6 = [v4 length];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __56__ICBaseTextView_ICAccessibility_iOS___icaxTodoElements__block_invoke;
  uint64_t v13 = &unk_2640B8EA0;
  uint64_t v14 = self;
  id v15 = v3;
  id v7 = v3;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, &v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

uint64_t __56__ICBaseTextView_ICAccessibility_iOS___icaxTodoElements__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 todo];

  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) _icaxTodoButtonForParagraphStyle:v7];
    if (v5) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }

  return MEMORY[0x270F9A790](v4);
}

- (void)_icaxUpdateFakeTextSelectionRange
{
  if (UIAccessibilityIsVoiceOverRunning()
    && ![(ICBaseTextView *)self _icaxShouldPreventUpdatingFakeCursorRange])
  {
    id v3 = [(ICBaseTextView *)self _icaxModifiedAttributedStorageString];
    uint64_t v4 = [(ICBaseTextView *)self selectedRange];
    uint64_t v6 = -[ICBaseTextView _icaxRangeInModifiedAttributedString:forRange:](self, "_icaxRangeInModifiedAttributedString:forRange:", v3, v4, v5);
    -[ICBaseTextView set_icaxModifiedSelectionRange:](self, "set_icaxModifiedSelectionRange:", v6, v7);

    uint64_t v8 = [(ICBaseTextView *)self _icaxModifiedSelectionRange];
    [(ICBaseTextView *)self set_icaxModifiedCursorPosition:v8];
  }
}

- (void)_icaxGetBoldForCurrentRange:(BOOL *)a3 italic:(BOOL *)a4 underline:(BOOL *)a5 strikethrough:(BOOL *)a6
{
  uint64_t v11 = [(ICBaseTextView *)self editorController];
  char v12 = [v11 currentBIUSForStyleSelector];

  *a3 = v12 & 1;
  *a4 = (v12 & 2) != 0;
  *a5 = (v12 & 4) != 0;
  id v14 = [(ICBaseTextView *)self typingAttributes];
  uint64_t v13 = [v14 objectForKeyedSubscript:*MEMORY[0x263F5AB30]];
  *a6 = [v13 integerValue] != 0;
}

- (id)_icaxFirstAttachmentViewSupportingAction:(SEL)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  uint64_t v5 = [(ICBaseTextView *)self textStorage];
  uint64_t v6 = [(ICBaseTextView *)self textStorage];
  uint64_t v7 = [v6 length];
  uint64_t v8 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__ICBaseTextView_ICAccessibility_iOS___icaxFirstAttachmentViewSupportingAction___block_invoke;
  v11[3] = &unk_2640B8EC8;
  void v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v11);

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __80__ICBaseTextView_ICAccessibility_iOS___icaxFirstAttachmentViewSupportingAction___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    char IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
    objc_opt_class();
    id v9 = (void *)a1[4];
    if (IsTextKit2Enabled)
    {
      uint64_t v10 = [v9 icTextLayoutManager];
      uint64_t v11 = [v14 viewIdentifier];
      uint64_t v12 = [v10 existingAttachmentViewForIdentifier:v11];
      uint64_t v13 = ICDynamicCast();
    }
    else
    {
      uint64_t v10 = [v9 layoutManager];
      uint64_t v11 = [v10 viewForTextAttachment:v14];
      uint64_t v13 = ICDynamicCast();
    }

    if ([v13 canPerformAction:a1[6] withSender:0])
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v13);
      *a5 = 1;
    }
  }
}

- (BOOL)isAccessibilityTableTextView
{
  return 0;
}

- (id)_icaxTodoButtonForParagraphStyle:(id)a3
{
  id v4 = a3;
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    id v7 = [(ICBaseTextView *)self layoutManager];
    uint64_t v8 = [v7 icaxTodoButtonForParagraphStyle:v4];
    goto LABEL_5;
  }
  uint64_t v5 = [(ICBaseTextView *)self icTextLayoutManager];
  uint64_t v6 = [v4 todoTrackingUUID];

  id v7 = [v5 trackedTodoParagraphForTrackingUUID:v6];

  if (v7)
  {
    id v4 = [(ICBaseTextView *)self icTextLayoutManager];
    uint64_t v8 = [v4 todoButtonForTrackedParagraph:v7];
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (void)_icaxAddPredictiveTextToAttributedString:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  v23.receiver = self;
  v23.super_class = (Class)ICBaseTextView;
  uint64_t v5 = [(ICBaseTextView *)&v23 accessibilityValue];
  uint64_t v6 = ICDynamicCast();

  uint64_t v7 = *MEMORY[0x263F21698];
  v25[0] = *MEMORY[0x263F216A8];
  v25[1] = v7;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        unint64_t v13 = [v6 length];
        unint64_t v14 = [v4 length];
        if (v13 >= v14) {
          unint64_t v13 = v14;
        }
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __80__ICBaseTextView_ICAccessibility_iOS___icaxAddPredictiveTextToAttributedString___block_invoke;
        v16[3] = &unk_2640B8C78;
        id v17 = v4;
        uint64_t v18 = v12;
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v13, 0, v16);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }
}

uint64_t __80__ICBaseTextView_ICAccessibility_iOS___icaxAddPredictiveTextToAttributedString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *(void *)(result + 40), a2, a3, a4);
  }
  return result;
}

- (void)_addPencilKitAccessibilityElementIfNeededForTextAttachment:(id)a3 toAttachmentElements:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 attachment];
  id v10 = [v7 identifier];

  uint64_t v8 = [(ICBaseTextView *)self _icaxPencilKitAttachmentsDict];
  uint64_t v9 = [v8 objectForKeyedSubscript:v10];

  objc_msgSend(v6, "ic_addNonNilObject:", v9);
}

- (id)_icaxMakeBoldString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set bold" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeNotBoldString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not bold" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeItalicString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set italic" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeNotItalicString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not italic" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeUnderlinedString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set underline" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeNotUnderlinedString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not underline" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)icaxMakeStrikethroughString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set strike-through" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)icaxMakeNotStrikethroughString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Set not strike-through" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMarkAsCompletedString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Mark as checked" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMarkAsIncompleteString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Mark as unchecked" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxMakeChecklistString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Make checklist item" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxRemoveChecklistString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Remove checklist item" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxChecklistMarkAllItemsCompleteString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Check all items" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxChecklistUnmarkAllItemsCompleteString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Uncheck all items" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxChecklistDeleteCheckedItemsString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Delete all checked items" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxChecklistMoveCheckedToBottomString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Move Checked items to the Bottom" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxShareAttachmentString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Share Attachment" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxIncreaseIndentationString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Increase Indentation" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxDecreaseIndentationString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Decrease Indentation" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxInsertDrawingString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Insert Drawing" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)_icaxCalculateAdjustString
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Adjust" value:&stru_26C10E100 table:0];

  return v3;
}

- (BOOL)ic_canIndentByDelta:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__ICBaseTextView_StyleAdditions__ic_canIndentByDelta___block_invoke;
  v5[3] = &unk_2640BA7C0;
  v5[4] = self;
  void v5[5] = &v6;
  v5[6] = a3;
  [(ICBaseTextView *)self ic_performBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__ICBaseTextView_StyleAdditions__ic_canIndentByDelta___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 canIndentTextView:a1[4] byDelta:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (void)ic_setTextStyleForCurrentSelection:(unsigned int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke;
  v3[3] = &unk_2640BA810;
  void v3[4] = self;
  unsigned int v4 = a3;
  [(ICBaseTextView *)self ic_performBlock:v3];
}

void __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke_2;
  id v17 = &unk_2640BA7E8;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = v6;
  int v21 = *(_DWORD *)(a1 + 40);
  id v20 = v5;
  id v7 = v5;
  id v8 = v6;
  [v7 saveSelectionDuringBlock:&v14 affinity:0];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "selectedRange", v14, v15, v16, v17, v18);
  uint64_t v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) typingAttributes];
  unint64_t v13 = objc_msgSend(v8, "typingAttributesForSettingTextStyleForRange:currentTypingAttributes:inTextStorage:", v9, v11, v12, v7);
  [*(id *)(a1 + 32) setTypingAttributes:v13];

  [*(id *)(a1 + 32) setIsSettingTextStyle:0];
}

void __69__ICBaseTextView_StyleAdditions__ic_setTextStyleForCurrentSelection___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setIsSettingTextStyle:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) rangeValue];
        objc_msgSend(*(id *)(a1 + 40), "setTextStyle:range:inTextStorage:inTextView:", *(unsigned int *)(a1 + 56), v7, v8, *(void *)(a1 + 48), *(void *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) setTypingTextStyle:*(unsigned int *)(a1 + 56) textView:*(void *)(a1 + 32)];
  uint64_t v9 = [*(id *)(a1 + 32) delegate];
  [v9 textViewDidChange:*(void *)(a1 + 32)];
}

- (void)ic_indentByAmount:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ICBaseTextView_StyleAdditions__ic_indentByAmount___block_invoke;
  v3[3] = &unk_2640BA838;
  void v3[4] = self;
  void v3[5] = a3;
  [(ICBaseTextView *)self ic_performBlock:v3];
}

void __52__ICBaseTextView_StyleAdditions__ic_indentByAmount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) rangeValue];
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = [*(id *)(a1 + 32) textStorage];
        objc_msgSend(v4, "indentRange:byAmount:inTextStorage:textView:", v10, v12, v13, v14, *(void *)(a1 + 32));

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)ic_toggleBoldface
{
}

- (void)ic_enableBoldface
{
}

- (void)ic_disableBoldface
{
}

- (void)ic_toggleItalics
{
}

- (void)ic_enableItalics
{
}

- (void)ic_disableItalics
{
}

- (void)ic_toggleUnderline
{
}

- (void)ic_enableUnderline
{
}

- (void)ic_disableUnderline
{
}

- (void)ic_toggleStrikethrough
{
}

- (void)ic_enableStrikethrough
{
}

- (void)ic_disableStrikethrough
{
}

- (void)ic_toggleEmphasisWithType:(int64_t)a3
{
  if (a3 && ic_currentEmphasisColorTypeDefault() != a3) {
    ic_setCurrentEmphasisColorTypeDefault();
  }
  [(ICBaseTextView *)self ic_toggleAttributeWithName:*MEMORY[0x263F5AB10] withEmphasisColorType:a3];
  uint64_t v6 = [(ICBaseTextView *)self selectedRange];

  -[ICBaseTextView updateStyleLayersInRange:](self, "updateStyleLayersInRange:", v6, v5);
}

- (id)ic_selectedStyles
{
  return [(ICBaseTextView *)self ic_selectedStylesIgnoreTypingAttributes:0];
}

- (id)ic_selectedStylesIgnoreTypingAttributes:(BOOL)a3
{
  uint64_t v5 = [MEMORY[0x263F089C8] indexSet];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke;
  v9[3] = &unk_2640BA888;
  v9[4] = self;
  id v10 = v5;
  BOOL v11 = a3;
  id v6 = v5;
  [(ICBaseTextView *)self ic_performBlock:v9];
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

void __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = [*(id *)(*((void *)&v28 + 1) + 8 * i) rangeValue];
        unint64_t v12 = v11;
        uint64_t v14 = v13;
        if (v13)
        {
          long long v15 = [v5 string];
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          void v23[2] = __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke_2;
          void v23[3] = &unk_2640BA860;
          id v16 = v6;
          uint64_t v17 = *(void *)(a1 + 32);
          id v24 = v16;
          uint64_t v25 = v17;
          id v26 = v5;
          id v27 = *(id *)(a1 + 40);
          objc_msgSend(v15, "ic_enumerateParagraphsInRange:usingBlock:", v12, v14, v23);
        }
        else if (v11 != 0x7FFFFFFFFFFFFFFFLL && [v5 length] >= v11)
        {
          long long v18 = [v5 string];
          uint64_t v19 = objc_msgSend(v18, "paragraphRangeForRange:", v12, 0);
          uint64_t v21 = v20;

          objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v6, "paragraphStyleForRange:inTextView:inTextStorage:ignoreTypingAttributes:", v19, v21, *(void *)(a1 + 32), v5, *(unsigned __int8 *)(a1 + 48)));
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }
}

uint64_t __74__ICBaseTextView_StyleAdditions__ic_selectedStylesIgnoreTypingAttributes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "paragraphStyleForRange:inTextView:inTextStorage:", a2, a3 - a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  id v5 = *(void **)(a1 + 56);

  return [v5 addIndex:v4];
}

- (unint64_t)ic_selectedBIUS
{
  uint64_t v3 = [(ICBaseTextView *)self selectedRange];
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    uint64_t v7 = [(ICBaseTextView *)self textStorage];
    uint64_t v8 = objc_msgSend(v7, "attributesAtIndex:longestEffectiveRange:inRange:", v5, 0, v5, v6);
  }
  else
  {
    uint64_t v8 = [(ICBaseTextView *)self typingAttributes];
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
  char v10 = [v9 intValue];

  objc_opt_class();
  unint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F814F0]];
  unint64_t v12 = ICDynamicCast();

  if ((v10 & 1) != 0 || objc_msgSend(v12, "ic_hasSymbolicBoldTrait"))
  {
    uint64_t v13 = 1;
    if ((v10 & 2) != 0) {
      goto LABEL_10;
    }
LABEL_9:
    if (!objc_msgSend(v12, "ic_hasSymbolicItalicTrait")) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v13 = 0;
  if ((v10 & 2) == 0) {
    goto LABEL_9;
  }
LABEL_10:
  v13 |= 2uLL;
LABEL_11:
  uint64_t v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB38]];
  int v15 = [v14 BOOLValue];

  if (v15) {
    v13 |= 4uLL;
  }
  id v16 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB30]];
  int v17 = [v16 BOOLValue];

  if (v17) {
    v13 |= 8uLL;
  }
  long long v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB10]];
  int v19 = [v18 BOOLValue];

  if (v19) {
    unint64_t v20 = v13 | 0x10;
  }
  else {
    unint64_t v20 = v13;
  }

  return v20;
}

- (int64_t)ic_currentWritingDirection
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__ICBaseTextView_StyleAdditions__ic_currentWritingDirection__block_invoke;
  v4[3] = &unk_2640BA798;
  v4[4] = self;
  v4[5] = &v5;
  [(ICBaseTextView *)self ic_performBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __60__ICBaseTextView_StyleAdditions__ic_currentWritingDirection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 selectedRange];
  uint64_t v10 = objc_msgSend(v6, "writingDirectionForRange:inTextView:inTextStorage:", v8, v9, *(void *)(a1 + 32), v7);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
}

- (void)ic_enumerateTableAttachmentViewControllersInRanges:(id)a3 usingBlock:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    uint64_t v8 = [(ICBaseTextView *)self textLayoutManager];
    uint64_t v9 = ICCheckedDynamicCast();

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v26 = v6;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "rangeValue", v26);
          uint64_t v16 = v15;
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke;
          v36[3] = &unk_2640BA8B0;
          id v17 = v9;
          id v37 = v17;
          id v38 = v7;
          objc_msgSend(v17, "enumerateAttachmentViewsInRange:usingBlock:", v14, v16, v36);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
LABEL_17:
      uint64_t v9 = v17;
      id v6 = v26;
    }
  }
  else
  {
    objc_opt_class();
    long long v18 = [(ICBaseTextView *)self layoutManager];
    uint64_t v9 = ICCheckedDynamicCast();

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obja = v6;
    uint64_t v19 = [obja countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v26 = v6;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obja);
          }
          uint64_t v23 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "rangeValue", v26);
          uint64_t v25 = v24;
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke_2;
          void v29[3] = &unk_2640BA8B0;
          id v17 = v9;
          id v30 = v17;
          id v31 = v7;
          objc_msgSend(v17, "enumerateAttachmentViewsInRange:usingBlock:", v23, v25, v29);
        }
        uint64_t v20 = [obja countByEnumeratingWithState:&v32 objects:v43 count:16];
      }
      while (v20);
      goto LABEL_17;
    }
  }
}

uint64_t __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v9 = ICDynamicCast();

  if (v9)
  {
    id v6 = [*(id *)(a1 + 32) tableViewControllerForAttachment:v9 createIfNeeded:0];
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7) {
        (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
      }
    }
  }

  return MEMORY[0x270F9A790](v5);
}

void __96__ICBaseTextView_StyleAdditions__ic_enumerateTableAttachmentViewControllersInRanges_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [v9 attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 12)
  {
    objc_opt_class();
    id v6 = [*(id *)(a1 + 32) viewControllerForTextAttachment:v9];
    uint64_t v7 = ICDynamicCast();

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
      }
    }
  }
}

- (BOOL)ic_allSelectedRangesContainFontHint:(unsigned int)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainFontHint___block_invoke;
  v5[3] = &unk_2640BA8D8;
  unsigned int v6 = a3;
  v5[4] = &v7;
  [(ICBaseTextView *)self ic_enumerateAttributesInSelectedRanges:v5];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __70__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainFontHint___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F5AB18]];
  int v4 = [v3 intValue];

  if ((*(_DWORD *)(a1 + 40) & v4) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (BOOL)ic_allSelectedRangesContainAttributeName:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainAttributeName___block_invoke;
  v7[3] = &unk_2640BA900;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(ICBaseTextView *)self ic_enumerateAttributesInSelectedRanges:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __75__ICBaseTextView_StyleAdditions__ic_allSelectedRangesContainAttributeName___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)ic_enumerateAttributesInSelectedRanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke;
  void v6[3] = &unk_2640BA950;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICBaseTextView *)self ic_performBlock:v6];
}

void __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = [*(id *)(*((void *)&v13 + 1) + 8 * v5) rangeValue];
        uint64_t v8 = v7;
        uint64_t v9 = [*(id *)(a1 + 32) textStorage];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke_2;
        v11[3] = &unk_2640BA928;
        id v12 = *(id *)(a1 + 40);
        objc_msgSend(v9, "ic_enumerateAttributesInClampedRange:options:usingBlock:", v6, v8, 0, v11);

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

uint64_t __73__ICBaseTextView_StyleAdditions__ic_enumerateAttributesInSelectedRanges___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)ic_toggleAttributeWithName:(id)a3
{
}

- (void)ic_toggleAttributeWithName:(id)a3 withEmphasisColorType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(ICBaseTextView *)self ic_allSelectedRangesContainAttributeName:v6];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__ICBaseTextView_StyleAdditions__ic_toggleAttributeWithName_withEmphasisColorType___block_invoke;
  v10[3] = &unk_2640BA978;
  BOOL v8 = a4 != 0;
  id v11 = v6;
  int64_t v12 = a4;
  BOOL v13 = v7;
  id v9 = v6;
  [(ICBaseTextView *)self ic_editAttributesInSelectedRanges:v10 shouldSkipAttachments:v8];
}

void __83__ICBaseTextView_StyleAdditions__ic_toggleAttributeWithName_withEmphasisColorType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  id v6 = [v14 objectForKeyedSubscript:*(void *)(a1 + 32)];
  int v7 = [v6 BOOLValue];

  if (*(void *)(a1 + 32) == *MEMORY[0x263F5AB10])
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = NSNumber;
      if (!a4) {
        uint64_t v9 = ic_currentEmphasisColorTypeDefault();
      }
      id v11 = [v10 numberWithInteger:v9];
      [v14 setObject:v11 forKeyedSubscript:*(void *)(a1 + 32)];

      int64_t v12 = ICNSTextHighlightColorSchemeForEmphasisColorType();
      [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x263F815A8]];
    }
    else
    {
      [v14 removeObjectForKey:*(void *)(a1 + 32)];
    }
  }
  else
  {
    if (a4) {
      uint64_t v8 = *(unsigned char *)(a1 + 48) == 0;
    }
    else {
      uint64_t v8 = v7 ^ 1u;
    }
    BOOL v13 = [NSNumber numberWithInt:v8];
    [v14 setObject:v13 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4
{
}

- (void)ic_setAttributeWithName:(id)a3 enabled:(BOOL)a4 withEmphasisColorType:(int64_t)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__ICBaseTextView_StyleAdditions__ic_setAttributeWithName_enabled_withEmphasisColorType___block_invoke;
  v10[3] = &unk_2640BA978;
  id v11 = v8;
  int64_t v12 = a5;
  BOOL v13 = a4;
  id v9 = v8;
  [(ICBaseTextView *)self ic_editAttributesInSelectedRanges:v10];
}

void __88__ICBaseTextView_StyleAdditions__ic_setAttributeWithName_enabled_withEmphasisColorType___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  if (*(void *)(a1 + 32) == *MEMORY[0x263F5AB10])
  {
    if (!*(void *)(a1 + 40))
    {
      objc_msgSend(v11, "removeObjectForKey:");
      goto LABEL_10;
    }
    int v7 = NSNumber;
    if (a4)
    {
      id v8 = NSNumber;
      uint64_t v9 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t v9 = ic_currentEmphasisColorTypeDefault();
      id v8 = v7;
    }
    uint64_t v6 = [v8 numberWithInteger:v9];
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t v10 = (void *)v6;
  [v11 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

LABEL_10:
}

- (void)ic_toggleFontHint:(unsigned int)a3
{
  BOOL v5 = -[ICBaseTextView ic_allSelectedRangesContainFontHint:](self, "ic_allSelectedRangesContainFontHint:");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __52__ICBaseTextView_StyleAdditions__ic_toggleFontHint___block_invoke;
  void v6[3] = &__block_descriptor_37_e44_v32__0__NSMutableDictionary_8__NSRange_QQ_16l;
  unsigned int v7 = a3;
  BOOL v8 = v5;
  [(ICBaseTextView *)self ic_editAttributesInSelectedRanges:v6];
}

void __52__ICBaseTextView_StyleAdditions__ic_toggleFontHint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x263F5AB18];
  uint64_t v7 = *MEMORY[0x263F5AB18];
  id v8 = a2;
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  int v10 = [v9 intValue];

  if (a4)
  {
    int v11 = *(_DWORD *)(a1 + 32);
    unsigned int v12 = v11 | v10;
    unsigned int v13 = v10 & ~v11;
    if (*(unsigned char *)(a1 + 36)) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v12;
    }
  }
  else
  {
    int v15 = *(_DWORD *)(a1 + 32);
    BOOL v16 = (v15 & v10) == 0;
    unsigned int v17 = v15 | v10;
    unsigned int v18 = v10 & ~v15;
    if (v16) {
      uint64_t v14 = v17;
    }
    else {
      uint64_t v14 = v18;
    }
  }
  id v19 = [NSNumber numberWithUnsignedInt:v14];
  [v8 setObject:v19 forKeyedSubscript:*v6];
}

- (void)ic_setFontHint:(unsigned int)a3 enabled:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__ICBaseTextView_StyleAdditions__ic_setFontHint_enabled___block_invoke;
  v4[3] = &__block_descriptor_37_e44_v32__0__NSMutableDictionary_8__NSRange_QQ_16l;
  BOOL v6 = a4;
  unsigned int v5 = a3;
  [(ICBaseTextView *)self ic_editAttributesInSelectedRanges:v4];
}

void __57__ICBaseTextView_StyleAdditions__ic_setFontHint_enabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F5AB18];
  uint64_t v4 = *MEMORY[0x263F5AB18];
  id v5 = a2;
  BOOL v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = [v6 intValue];

  int v8 = *(_DWORD *)(a1 + 32);
  unsigned int v9 = v8 | v7;
  unsigned int v10 = v7 & ~v8;
  if (*(unsigned char *)(a1 + 36)) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = [NSNumber numberWithUnsignedInt:v11];
  [v5 setObject:v12 forKeyedSubscript:*v3];
}

- (void)ic_editAttributesInSelectedRanges:(id)a3
{
}

- (void)ic_editAttributesInSelectedRanges:(id)a3 shouldSkipAttachments:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke;
  v8[3] = &unk_2640BA9E8;
  BOOL v10 = a4;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICBaseTextView *)self ic_performBlock:v8];
}

void __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 beginEditing];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ic_selectedRanges");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) rangeValue];
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = [*(id *)(a1 + 32) textStorage];
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke_2;
          v15[3] = &unk_2640BA9C0;
          char v20 = *(unsigned char *)(a1 + 48);
          id v17 = *(id *)(a1 + 40);
          uint64_t v18 = v8;
          uint64_t v19 = v10;
          id v16 = v3;
          objc_msgSend(v11, "ic_enumerateAttributesInClampedRange:options:usingBlock:", v8, v10, 0, v15);

          id v12 = v17;
        }
        else
        {
          unsigned int v13 = [*(id *)(a1 + 32) typingAttributes];
          id v12 = (void *)[v13 mutableCopy];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          [*(id *)(a1 + 32) setTypingAttributes:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  [v3 endEditing];
}

void __90__ICBaseTextView_StyleAdditions__ic_editAttributesInSelectedRanges_shouldSkipAttachments___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (void *)[a2 mutableCopy];
  id v15 = v7;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F814A0]];
    objc_opt_class();
    uint64_t v9 = ICDynamicCast();
    uint64_t v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v12 = *(void **)(a1 + 32);
      unsigned int v13 = (void *)[v15 copy];
      objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v8 = (void *)[v15 copy];
    objc_msgSend(v14, "setAttributes:range:", v8, a3, a4);
  }
}

- (void)updateMonostyledLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousMonoRect:(CGRect *)a5 ioPreviousBlockQuoteLevel:(unint64_t *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    id v12 = [(ICBaseTextView *)self editorController];
    unsigned int v13 = [v12 note];
    uint64_t v14 = [v13 calculateDocumentController];
    [v14 setIsExpressionFormattingEnabled:0];

    id v15 = [(ICBaseTextView *)self textLayoutManager];
    id v16 = objc_msgSend(v15, "ic_textRangeForRange:", location, length);

    uint64_t v44 = 0;
    uint64_t v45 = (double *)&v44;
    uint64_t v46 = 0x4010000000;
    id v47 = &unk_20C1E2BF2;
    id v17 = (CGRect *)MEMORY[0x263F001A0];
    long long v18 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v48 = *MEMORY[0x263F001A0];
    long long v49 = v18;
    uint64_t v19 = [(ICBaseTextView *)self textLayoutManager];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __126__ICBaseTextView_StyleAdditions__updateMonostyledLayerForParagraphStyle_inRange_ioPreviousMonoRect_ioPreviousBlockQuoteLevel___block_invoke;
    v43[3] = &unk_2640BAA10;
    v43[4] = &v44;
    [v19 enumerateTextSegmentsInRange:v16 type:0 options:12 usingBlock:v43];

    char v20 = [(ICBaseTextView *)self editorController];
    long long v21 = [v20 note];
    long long v22 = [v21 calculateDocumentController];
    [v22 setIsExpressionFormattingEnabled:1];

    unint64_t v23 = [v11 blockQuoteLevel];
    double v25 = v45[4];
    CGFloat v24 = v45[5];
    double v27 = v45[6];
    CGFloat v26 = v45[7];
    uint64_t v28 = [v11 blockQuoteLevel];
    double v29 = *MEMORY[0x263F5B568] * (double)v23;
    double v30 = v29 + v25;
    double v31 = v27 - v29;
    if (v28 == *a6)
    {
      if (!CGRectEqualToRect(*v17, *a5))
      {
        v50.origin.double x = v30;
        v50.origin.double y = v24;
        v50.size.CGFloat width = v31;
        v50.size.CGFloat height = v26;
        *a5 = CGRectUnion(*a5, v50);
LABEL_13:
        _Block_object_dispose(&v44, 8);

        goto LABEL_14;
      }
    }
    else
    {
      -[ICBaseTextView drawMonostyledLayerInRect:](self, "drawMonostyledLayerInRect:", a5->origin.x, a5->origin.y, a5->size.width, a5->size.height);
    }
    a5->origin.double x = v30;
    a5->origin.double y = v24;
    a5->size.CGFloat width = v31;
    a5->size.CGFloat height = v26;
    goto LABEL_13;
  }
  -[ICBaseTextView ic_rectForRange:](self, "ic_rectForRange:", location, length);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  if ([v11 isBlockQuote]) {
    double v40 = *MEMORY[0x263F5B568];
  }
  else {
    double v40 = 0.0;
  }
  int v41 = [v11 isBlockQuote];
  double v42 = v33 + v40;
  if (!v41) {
    double v42 = 0.0;
  }
  -[ICBaseTextView drawMonostyledLayerInRect:](self, "drawMonostyledLayerInRect:", v42, v35, v37 - v40, v39);
LABEL_14:
}

uint64_t __126__ICBaseTextView_StyleAdditions__updateMonostyledLayerForParagraphStyle_inRange_ioPreviousMonoRect_ioPreviousBlockQuoteLevel___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v6.size.CGFloat height = a5;
  v6.size.CGFloat width = a4;
  v6.origin.double y = a3;
  v6.origin.double x = a2;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

- (void)updateBlockQuoteLayerForParagraphStyle:(id)a3 inRange:(_NSRange)a4 ioPreviousBlockQuoteRect:(CGRect *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v10 = [(ICBaseTextView *)self editorController];
    id v11 = [v10 note];
    id v12 = [v11 calculateDocumentController];
    [v12 setIsExpressionFormattingEnabled:0];

    unsigned int v13 = [(ICBaseTextView *)self textLayoutManager];
    uint64_t v14 = objc_msgSend(v13, "ic_textRangeForRange:", location, length);

    uint64_t v31 = 0;
    double v32 = (double *)&v31;
    uint64_t v33 = 0x4010000000;
    double v34 = &unk_20C1E2BF2;
    id v15 = (CGRect *)MEMORY[0x263F001A0];
    long long v16 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v35 = *MEMORY[0x263F001A0];
    long long v36 = v16;
    id v17 = [(ICBaseTextView *)self textLayoutManager];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __106__ICBaseTextView_StyleAdditions__updateBlockQuoteLayerForParagraphStyle_inRange_ioPreviousBlockQuoteRect___block_invoke;
    v30[3] = &unk_2640BAA10;
    v30[4] = &v31;
    [v17 enumerateTextSegmentsInRange:v14 type:0 options:12 usingBlock:v30];

    long long v18 = [(ICBaseTextView *)self editorController];
    uint64_t v19 = [v18 note];
    char v20 = [v19 calculateDocumentController];
    [v20 setIsExpressionFormattingEnabled:1];

    int v21 = [v9 isRTL];
    double v22 = v32[4];
    if (v21) {
      double v22 = v22 + v32[6];
    }
    CGFloat v23 = v32[5];
    CGFloat v24 = v32[7];
    BOOL v25 = CGRectEqualToRect(*v15, *a5);
    CGFloat v26 = 4.0;
    if (!v25)
    {
      v37.size.CGFloat width = 4.0;
      v37.origin.double x = v22;
      v37.origin.double y = v23;
      v37.size.CGFloat height = v24;
      *(CGRect *)(&v26 - 2) = CGRectUnion(*a5, v37);
      double v22 = v27;
      CGFloat v23 = v28;
      CGFloat v24 = v29;
    }
    a5->origin.double x = v22;
    a5->origin.double y = v23;
    a5->size.CGFloat width = v26;
    a5->size.CGFloat height = v24;
    _Block_object_dispose(&v31, 8);
  }
}

uint64_t __106__ICBaseTextView_StyleAdditions__updateBlockQuoteLayerForParagraphStyle_inRange_ioPreviousBlockQuoteRect___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v6.size.CGFloat height = a5;
  v6.size.CGFloat width = a4;
  v6.origin.double y = a3;
  v6.origin.double x = a2;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v6);
  return 1;
}

- (unint64_t)firstValidEmphasisLocationWithinSelection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGRect v6 = [(ICBaseTextView *)self textLayoutManager];
  id v7 = objc_msgSend(v6, "ic_textRangeForRange:", location, length);

  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = [(ICBaseTextView *)self textLayoutManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__ICBaseTextView_StyleAdditions__firstValidEmphasisLocationWithinSelection___block_invoke;
  v11[3] = &unk_2640BAA38;
  void v11[4] = self;
  v11[5] = &v12;
  [v8 enumerateTextSegmentsInRange:v7 type:0 options:12 usingBlock:v11];

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __76__ICBaseTextView_StyleAdditions__firstValidEmphasisLocationWithinSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 textLayoutManager];
  uint64_t v6 = objc_msgSend(v5, "ic_rangeForTextRange:", v4);
  uint64_t v8 = v7;

  unint64_t v9 = [*(id *)(a1 + 32) textStorage];
  uint64_t v10 = [v9 attribute:*MEMORY[0x263F814A0] atIndex:v6 effectiveRange:0];
  id v11 = ICProtocolCast();

  if (v8 && !v11 || [MEMORY[0x263F5ACE8] isInlineAttachment:v11])
  {
    uint64_t v12 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

- (void)drawMonostyledLayerInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = objc_alloc_init(MEMORY[0x263F157E8]);
  id v8 = [MEMORY[0x263F825C8] ICMonostyledBackgroundColor];
  objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  LODWORD(v9) = 0.25;
  [v15 setOpacity:v9];
  [v15 setCornerRadius:10.0];
  [v15 setBorderWidth:1.0];
  id v10 = [MEMORY[0x263F825C8] ICMonostyledBorderColor];
  objc_msgSend(v15, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  [v15 setCornerCurve:*MEMORY[0x263F15A20]];
  [(ICBaseTextView *)self ic_textContainerOrigin];
  objc_msgSend(v15, "setFrame:", x + v11, y + v12 - *MEMORY[0x263F5B570], width, height + *MEMORY[0x263F5B560] + 2.0);
  unsigned int v13 = [(ICBaseTextView *)self renderingSurfaceView];
  uint64_t v14 = [v13 layer];
  [v14 addSublayer:v15];
}

- (void)drawBlockQuoteAndCleanup:(BOOL *)a3 pendingBlockQuoteLevelToDraw:(unint64_t *)a4 pendingBlockQuoteRectToDraw:(CGRect *)a5 ps:(id)a6
{
  unint64_t v10 = *a4;
  BOOL v11 = *a3;
  double x = a5->origin.x;
  double y = a5->origin.y;
  double width = a5->size.width;
  double height = a5->size.height;
  id v16 = a6;
  -[ICBaseTextView drawBlockQuoteLayerInRectForTK2:blockQuoteLevel:isMonostyled:](self, "drawBlockQuoteLayerInRectForTK2:blockQuoteLevel:isMonostyled:", v10, v11, x, y, width, height);
  CGSize v17 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  a5->origin = (CGPoint)*MEMORY[0x263F001A0];
  a5->size = v17;
  unint64_t v18 = [v16 blockQuoteLevel];

  *a4 = v18;
  *a3 = 0;
}

- (void)drawBlockQuoteLayerInRectForTK2:(CGRect)a3 blockQuoteLevel:(int64_t)a4 isMonostyled:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ICBaseTextView *)self ic_textContainerOrigin];
  double v13 = v12;
  double v15 = v14;
  int v16 = objc_msgSend(MEMORY[0x263F81658], "ic_isRTL");
  if (a4)
  {
    if (v16) {
      double v17 = x;
    }
    else {
      double v17 = 5.0;
    }
    uint64_t v18 = *MEMORY[0x263F15A20];
    if (v5) {
      double v19 = y + v15 + -5.0;
    }
    else {
      double v19 = y + v15;
    }
    if (v5) {
      double height = height + 10.0;
    }
    unint64_t v20 = 1;
    do
    {
      id v21 = objc_alloc_init(MEMORY[0x263F157E8]);
      id v22 = [MEMORY[0x263F825C8] ICBlockQuoteBackgroundColor];
      objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v22, "CGColor"));

      LODWORD(v23) = 1.0;
      [v21 setOpacity:v23];
      [v21 setCornerRadius:2.0];
      [v21 setCornerCurve:v18];
      objc_msgSend(v21, "setFrame:", v17 + v13 + (float)((float)(v20 - 1) * 13.0), v19, width, height);
      CGFloat v24 = [(ICBaseTextView *)self renderingSurfaceView];
      BOOL v25 = [v24 layer];
      [v25 addSublayer:v21];

      ++v20;
    }
    while (v20 <= a4);
  }
}

- (id)pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ICBaseTextView *)self supportsAttachments])
  {
    uint64_t v8 = objc_msgSend(v6, "ic_stringWithoutAttachments");

    id v6 = (id)v8;
  }
  if (![v6 length]) {
    goto LABEL_7;
  }
  if ([(ICBaseTextView *)self exceedsMaxLengthIfSelectionReplacedWithAttributedString:v6])
  {
    if (([v7 didWarnAboutExceedingMaxLength] & 1) == 0)
    {
      double v9 = [(ICBaseTextView *)self editorController];
      [v9 warnUserNoteLengthExceeded];

      [v7 setDidWarnAboutExceedingMaxLength:1];
    }
LABEL_7:

    id v6 = 0;
    goto LABEL_10;
  }
  if (v6) {
    [(ICBaseTextView *)self _pasteAttributedString:v6 pasteAsRichText:1];
  }
LABEL_10:

  return v6;
}

- (BOOL)exceedsMaxLengthIfSelectionReplacedWithAttributedString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICBaseTextView *)self TTTextStorage];
  uint64_t v6 = [v5 length];
  uint64_t v7 = [v4 length];
  [(ICBaseTextView *)self selectedRange];
  uint64_t v9 = v8;

  unint64_t v10 = [v4 length];
  [(ICBaseTextView *)self selectedRange];
  if (v10 <= v11)
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    uint64_t v12 = v7 + v6 - v9;
    double v13 = [(ICBaseTextView *)self icDelegate];
    int v14 = [v13 allowsNewTextLength:v12] ^ 1;
  }
  return v14;
}

- (id)pasteNotePasteboardData:(id)a3 session:(id)a4 error:(id *)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__13;
  long long v48 = __Block_byref_object_dispose__13;
  id v49 = 0;
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  int v41 = __Block_byref_object_copy__13;
  double v42 = __Block_byref_object_dispose__13;
  id v43 = 0;
  unint64_t v10 = [v8 attributedStringData];
  uint64_t v11 = [v10 length];
  uint64_t v12 = [v8 dataPersister];
  uint64_t v13 = [v12 accumulatedDataSize];
  int v14 = [(ICBaseTextView *)self editorController];
  double v15 = [v14 note];
  [v15 setShouldAddMediaAsynchronously:(unint64_t)(v13 + v11) > *MEMORY[0x263F5ADA8]];

  int v16 = [(ICBaseTextView *)self editorController];
  double v17 = [v16 note];
  uint64_t v18 = [v8 attributedStringData];
  LODWORD(v11) = objc_msgSend(v17, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v18, "length"));

  if (v11)
  {
    if (([v9 didWarnAboutAttachmentSizeExceeded] & 1) == 0)
    {
      double v19 = [(ICBaseTextView *)self editorController];
      [v19 warnUserAttachmentSizeExceededWithAttachmentCount:1];

      [v9 setDidWarnAboutAttachmentSizeExceeded:1];
    }
  }
  else
  {
    unint64_t v20 = [(ICBaseTextView *)self TTTextStorage];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __72__ICBaseTextView_PasteUtilities__pasteNotePasteboardData_session_error___block_invoke;
    v32[3] = &unk_2640BAB60;
    long long v36 = &v38;
    id v33 = v8;
    double v34 = self;
    CGRect v37 = &v44;
    id v35 = v9;
    [v20 saveSelectionDuringBlock:v32 affinity:1];
  }
  if (!v39[5])
  {
    double v23 = (void *)v45[5];
    if (v23)
    {
      uint64_t v24 = [v23 code];
      if (v24 == 205)
      {
        if ([v9 didWarnAboutNotSupportedForPasswordProtectedNotes]) {
          goto LABEL_6;
        }
        CGFloat v26 = [(id)v45[5] userInfo];
        double v27 = [v26 objectForKeyedSubscript:*MEMORY[0x263F5AE18]];

        if (v27) {
          uint64_t v28 = [v27 unsignedIntegerValue];
        }
        else {
          uint64_t v28 = 1;
        }
        os_log_t v29 = [MEMORY[0x263F5B258] cannotAddAttachmentsInfoAlertWithAttachmentCount:v28];
        uint64_t v31 = [(ICBaseTextView *)self window];
        [v29 presentInWindow:v31 completionHandler:0];

        [v9 setDidWarnAboutNotSupportedForPasswordProtectedNotes:1];
      }
      else
      {
        if (v24 == 202)
        {
          if (([v9 didWarnAboutAttachmentLimitExceeded] & 1) == 0)
          {
            BOOL v25 = [(ICBaseTextView *)self editorController];
            [v25 warnUserAttachmentLimitExceeded];

            [v9 setDidWarnAboutAttachmentLimitExceeded:1];
          }
          goto LABEL_6;
        }
        os_log_t v29 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          double v30 = [(id)v45[5] description];
          -[ICBaseTextView(PasteUtilities) pasteNotePasteboardData:session:error:](v30, buf, v29);
        }
        double v27 = v29;
      }
    }
  }
LABEL_6:
  if (a5) {
    *a5 = (id) v45[5];
  }
  id v21 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);

  return v21;
}

void __72__ICBaseTextView_PasteUtilities__pasteNotePasteboardData_session_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F086A0];
  id v3 = [*(id *)(a1 + 32) attributedStringData];
  id v4 = [*(id *)(a1 + 32) dataPersister];
  BOOL v5 = [*(id *)(a1 + 40) editorController];
  uint64_t v6 = [v5 note];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = objc_msgSend(v2, "ic_attributedStringWithData:dataPersister:createNewAttachmentsInNote:error:", v3, v4, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v11)
  {
    uint64_t v12 = [*(id *)(a1 + 40) pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:v11 session:*(void *)(a1 + 48)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (id)pasteImagesDataArray:(id)a3 typesArray:(id)a4 session:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v26 = a4;
  id v27 = a5;
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  int v41 = __Block_byref_object_copy__13;
  double v42 = __Block_byref_object_dispose__13;
  id v43 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v15 = [(ICBaseTextView *)self editorController];
        int v16 = [v15 note];
        int v17 = objc_msgSend(v16, "attachmentExceedsMaxSizeAllowed:", objc_msgSend(v14, "length"));

        if (v17)
        {
          char v22 = [v27 didWarnAboutAttachmentSizeExceeded];
          id v21 = v9;
          if ((v22 & 1) == 0)
          {
            double v23 = [(ICBaseTextView *)self editorController];
            objc_msgSend(v23, "warnUserAttachmentSizeExceededWithAttachmentCount:", objc_msgSend(v9, "count"));

            [v27 setDidWarnAboutAttachmentSizeExceeded:1];
            id v21 = v9;
          }
          goto LABEL_12;
        }
        v10 += [v14 length];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = [(ICBaseTextView *)self editorController];
  double v19 = [v18 note];
  [v19 setShouldAddMediaAsynchronously:v10 > *MEMORY[0x263F5ADA8]];

  unint64_t v20 = [(ICBaseTextView *)self TTTextStorage];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  void v28[2] = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke;
  v28[3] = &unk_2640BABD8;
  id v29 = v9;
  id v30 = v26;
  uint64_t v31 = self;
  id v32 = v27;
  id v33 = &v38;
  [v20 saveSelectionDuringBlock:v28 affinity:1];

  id v21 = v29;
LABEL_12:

  id v24 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke(uint64_t a1)
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = __Block_byref_object_copy__13;
  id v24 = __Block_byref_object_dispose__13;
  id v25 = objc_alloc_init(MEMORY[0x263F089B8]);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  int v14 = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_2;
  double v15 = &unk_2640BABB0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = *(void **)(a1 + 56);
  id v16 = v3;
  uint64_t v17 = v4;
  id v18 = v5;
  double v19 = &v20;
  [v2 enumerateObjectsUsingBlock:&v12];
  objc_msgSend(*(id *)(a1 + 56), "setNumberOfImagesPasted:", objc_msgSend(*(id *)(a1 + 56), "numberOfImagesPasted") + objc_msgSend(*(id *)(a1 + 32), "count", v12, v13, v14, v15));
  uint64_t v6 = [(id)v21[5] copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [*(id *)(a1 + 48) pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) session:*(void *)(a1 + 56)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  _Block_object_dispose(&v20, 8);
}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__13;
  uint64_t v31 = __Block_byref_object_dispose__13;
  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v32 = [v6 firstObject];

  uint64_t v7 = [*(id *)(a1 + 40) editorController];
  id v8 = [v7 note];
  char v9 = [v8 canAddAttachment];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    unint64_t v11 = [v10 count];

    if (v11 >= 2)
    {
      uint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_3;
      v26[3] = &unk_2640BAB88;
      void v26[4] = &v27;
      [v12 enumerateObjectsUsingBlock:v26];
    }
    uint64_t v13 = [MEMORY[0x263F5AB78] filenameExtensionForUTI:v28[5]];
    int v14 = NSString;
    double v15 = [MEMORY[0x263F086E0] mainBundle];
    id v16 = [v15 localizedStringForKey:@"Pasted Image %lu" value:&stru_26C10E100 table:0];
    uint64_t v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, objc_msgSend(*(id *)(a1 + 48), "numberOfImagesPasted") + a3);

    id v18 = [v17 stringByAppendingPathExtension:v13];

    double v19 = [*(id *)(a1 + 40) editorController];
    uint64_t v20 = [v19 note];
    id v21 = [v20 addAttachmentWithData:v5 filename:v18];

    uint64_t v22 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:v21];
    double v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v24 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v22];
    [v23 appendAttributedString:v24];
  }
  else if (([*(id *)(a1 + 48) didWarnAboutAttachmentLimitExceeded] & 1) == 0)
  {
    id v25 = [*(id *)(a1 + 40) editorController];
    [v25 warnUserAttachmentLimitExceeded];

    [*(id *)(a1 + 48) setDidWarnAboutAttachmentLimitExceeded:1];
  }
  _Block_object_dispose(&v27, 8);
}

void __74__ICBaseTextView_PasteUtilities__pasteImagesDataArray_typesArray_session___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F1D920], "typeWithIdentifier:");
  int v8 = [v7 conformsToType:*MEMORY[0x263F1DB18]];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)pasteURL:(id)a3 uti:(id)a4 name:(id)a5 metadata:(id)a6 session:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(ICBaseTextView *)self editorController];
  id v18 = [v17 note];
  if ([v18 canAddAttachment])
  {

    goto LABEL_7;
  }
  int v19 = [v12 isFileURL];

  if (!v19)
  {
LABEL_7:
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    uint64_t v38 = 0;
    double v39 = &v38;
    uint64_t v40 = 0x3032000000;
    int v41 = __Block_byref_object_copy__13;
    double v42 = __Block_byref_object_dispose__13;
    id v43 = 0;
    uint64_t v22 = [(ICBaseTextView *)self TTTextStorage];
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __69__ICBaseTextView_PasteUtilities__pasteURL_uti_name_metadata_session___block_invoke;
    uint64_t v29 = &unk_2640BAC00;
    id v30 = v12;
    uint64_t v31 = self;
    long long v36 = &v44;
    id v32 = v13;
    id v33 = v15;
    id v34 = v14;
    long long v37 = &v38;
    id v23 = v16;
    id v35 = v23;
    [v22 saveSelectionDuringBlock:&v26 affinity:1];

    if (*((unsigned char *)v45 + 24)
      && (objc_msgSend(v23, "didWarnAboutAttachmentSizeExceeded", v26, v27, v28, v29, v30, v31, v32, v33, v34) & 1) == 0)
    {
      id v24 = [(ICBaseTextView *)self editorController];
      [v24 warnUserAttachmentSizeExceededWithAttachmentCount:1];

      [v23 setDidWarnAboutAttachmentSizeExceeded:1];
    }
    id v21 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v44, 8);
    goto LABEL_11;
  }
  if (([v16 didWarnAboutAttachmentLimitExceeded] & 1) == 0)
  {
    uint64_t v20 = [(ICBaseTextView *)self editorController];
    [v20 warnUserAttachmentLimitExceeded];

    [v16 setDidWarnAboutAttachmentLimitExceeded:1];
  }
  id v21 = 0;
LABEL_11:

  return v21;
}

void __69__ICBaseTextView_PasteUtilities__pasteURL_uti_name_metadata_session___block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "ic_isSupportedAsAttachment"))
  {
LABEL_5:
    id v4 = objc_alloc(MEMORY[0x263F089B8]);
    id v5 = v4;
    if (*(void *)(a1 + 64))
    {
      uint64_t v6 = objc_msgSend(v4, "initWithString:");
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) absoluteString];
      uint64_t v6 = (void *)[v5 initWithString:v7];
    }
    uint64_t v8 = *MEMORY[0x263F81520];
    id v9 = [*(id *)(a1 + 32) absoluteString];
    objc_msgSend(v6, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v6, "length"));

    uint64_t v10 = [v6 copy];
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    goto LABEL_9;
  }
  uint64_t v2 = [*(id *)(a1 + 40) editorController];
  id v3 = [v2 note];
  if (![v3 canAddAttachment]
    || objc_msgSend(*(id *)(a1 + 32), "ic_isWebURL"))
  {

    goto LABEL_5;
  }
  int v17 = [*(id *)(a1 + 40) supportsAttachments];

  if (!v17) {
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) isFileURL])
  {
    id v18 = *(void **)(a1 + 32);
    id v33 = 0;
    [v18 getResourceValue:&v33 forKey:*MEMORY[0x263EFF688] error:0];
    id v19 = v33;
    uint64_t v20 = v19;
    if (v19) {
      uint64_t v21 = [v19 unsignedIntegerValue];
    }
    else {
      uint64_t v21 = 0;
    }
    id v23 = [*(id *)(a1 + 40) editorController];
    id v24 = [v23 note];
    int v25 = [v24 attachmentExceedsMaxSizeAllowed:v21];

    if (v25)
    {
      uint64_t v6 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_25;
    }
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v22 = [*(id *)(a1 + 40) editorController];
    uint64_t v27 = [v22 note];
    uint64_t v28 = v27;
    if (v26) {
      [v27 addAttachmentWithUTI:*(void *)(a1 + 48) withURL:*(void *)(a1 + 32)];
    }
    else {
    uint64_t v6 = [v27 addAttachmentWithFileURL:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v20 = [*(id *)(a1 + 40) editorController];
    uint64_t v22 = [v20 note];
    uint64_t v6 = [v22 addURLAttachmentWithURL:*(void *)(a1 + 32)];
  }

LABEL_25:
  if (v6)
  {
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v6, "setMetadata:");
    }
    if ([*(id *)(a1 + 64) length]) {
      [v6 setTitle:*(void *)(a1 + 64)];
    }
    uint64_t v29 = [MEMORY[0x263F5B4D0] textAttachmentWithAttachment:v6];
    uint64_t v30 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v29];
    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
LABEL_9:

  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v13)
  {
    uint64_t v14 = [*(id *)(a1 + 40) pasteIntoSelectedRangeWithoutExceedingMaxLengthWithAttributedString:v13 session:*(void *)(a1 + 72)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (id)pasteStringUsingBlock:(id)a3 approxPasteString:(id)a4 pasteboardTypes:(id)a5 session:(id)a6
{
  uint64_t v10 = (void (**)(void))a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(ICBaseTextView *)self selectedRange];
  unint64_t v16 = v15;
  if ([v11 length] <= v15) {
    goto LABEL_3;
  }
  int v17 = [(ICBaseTextView *)self TTTextStorage];
  uint64_t v18 = [v17 length];
  uint64_t v19 = v18 - v16 + [v11 length];

  uint64_t v20 = [(ICBaseTextView *)self icDelegate];
  LOBYTE(v19) = [v20 allowsNewTextLength:v19];

  if (v19)
  {
LABEL_3:
    uint64_t v21 = [(ICBaseTextView *)self TTTextStorage];
    [v21 setFilterPastedAttributes:1];

    uint64_t v22 = [(ICBaseTextView *)self TTTextStorage];
    [v22 setConvertAttributes:1];

    id v23 = [(ICBaseTextView *)self TTTextStorage];
    [v23 setPasteboardTypes:v12];

    id v24 = [(ICBaseTextView *)self TTTextStorage];
    uint64_t v25 = [v24 length];

    v10[2](v10);
    uint64_t v26 = [(ICBaseTextView *)self TTTextStorage];
    unint64_t v27 = [v26 length];

    unint64_t v47 = v27 - v25 + v16;
    [(ICBaseTextView *)self TTTextStorage];
    uint64_t v28 = v49 = v10;
    uint64_t v29 = objc_msgSend(v28, "attributedSubstringFromRange:", v14, v47);

    uint64_t v46 = [v29 string];
    [(ICBaseTextView *)self TTTextStorage];
    uint64_t v30 = v48 = v12;
    [v30 setPasteboardTypes:0];

    uint64_t v31 = [(ICBaseTextView *)self TTTextStorage];
    [v31 setConvertAttributes:0];

    id v32 = [(ICBaseTextView *)self TTTextStorage];
    [v32 setFilterPastedAttributes:0];

    objc_opt_class();
    [(ICBaseTextView *)self TTTextStorage];
    unint64_t v33 = v16;
    v35 = uint64_t v34 = v14;
    [v35 styler];
    id v36 = v13;
    v38 = id v37 = v11;
    double v39 = ICCheckedDynamicCast();

    id v11 = v37;
    id v13 = v36;

    objc_msgSend(v39, "insertedText:replacementRange:inTextView:languageHasSpaces:", v46, v34, v33, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
    if (v27 >= v47 + v34) {
      unint64_t v40 = v47 + v34;
    }
    else {
      unint64_t v40 = v27;
    }
    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v40, 0);
    uint64_t v41 = [(ICBaseTextView *)self selectedRange];
    -[ICBaseTextView scrollRangeToVisible:](self, "scrollRangeToVisible:", v41, v42);
    [(ICBaseTextView *)self informDelegateOfPastedAttributedString:v29];

    id v12 = v48;
    uint64_t v10 = v49;
  }
  else
  {
    if (([v13 didWarnAboutExceedingMaxLength] & 1) == 0)
    {
      id v43 = [(ICBaseTextView *)self editorController];
      [v43 warnUserNoteLengthExceeded];

      [v13 setDidWarnAboutExceedingMaxLength:1];
    }
    if (([v13 didWarnAboutExceedingMaxLength] & 1) == 0)
    {
      uint64_t v44 = [(ICBaseTextView *)self editorController];
      [v44 warnUserNoteLengthExceeded];

      [v13 setDidWarnAboutExceedingMaxLength:1];
    }
    uint64_t v29 = 0;
  }

  return v29;
}

- (ICBaseTextView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  id v3 = [(ICBaseTextView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(ICBaseTextView *)v3 commonInit];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v4 dealloc];
}

- (id)textController
{
  objc_opt_class();
  id v3 = [(ICBaseTextView *)self TTTextStorage];
  objc_super v4 = [v3 styler];
  id v5 = ICCheckedDynamicCast();

  return v5;
}

- (ICLayoutManager)icLayoutManager
{
  objc_opt_class();
  id v3 = [(ICBaseTextView *)self layoutManager];
  objc_super v4 = ICDynamicCast();

  return (ICLayoutManager *)v4;
}

- (ICTK2TextLayoutManager)icTextLayoutManager
{
  objc_opt_class();
  id v3 = [(ICBaseTextView *)self textLayoutManager];
  objc_super v4 = ICDynamicCast();

  return (ICTK2TextLayoutManager *)v4;
}

- (ICTTTextStoragePersistenceHelper)persistenceHelper
{
  uint64_t v2 = [(ICBaseTextView *)self editorController];
  id v3 = [v2 note];

  return (ICTTTextStoragePersistenceHelper *)v3;
}

- (BOOL)supportsAttachments
{
  return 0;
}

- (id)selectionRectsForRange:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ICBaseTextView *)self textSelectionHidden])
  {
    id v5 = objc_alloc_init(ICEmptyTextSelectionRect);
    v9[0] = v5;
    objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICBaseTextView;
    objc_super v6 = [(ICBaseTextView *)&v8 selectionRectsForRange:v4];
  }

  return v6;
}

- (CALayer)tempHighlightLayer
{
  tempHighlightLayer = self->_tempHighlightLayer;
  if (!tempHighlightLayer)
  {
    id v4 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    id v5 = self->_tempHighlightLayer;
    self->_tempHighlightLayer = v4;

    id v6 = [MEMORY[0x263F825C8] redColor];
    -[CALayer setBorderColor:](self->_tempHighlightLayer, "setBorderColor:", [v6 CGColor]);

    [(CALayer *)self->_tempHighlightLayer setBorderWidth:1.0];
    uint64_t v7 = [(ICBaseTextView *)self layer];
    [v7 addSublayer:self->_tempHighlightLayer];

    tempHighlightLayer = self->_tempHighlightLayer;
  }

  return tempHighlightLayer;
}

- (CALayer)tempHighlightLayerIfExists
{
  return self->_tempHighlightLayer;
}

- (id)singleSelectedAttachment
{
  return 0;
}

- (BOOL)selectionSupportsFindInNote
{
  return 0;
}

- (id)attachmentsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = [(ICBaseTextView *)self textStorage];
  uint64_t v8 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__ICBaseTextView_attachmentsInRange___block_invoke;
  v11[3] = &unk_2640B89D0;
  id v9 = v6;
  id v12 = v9;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v11);

  return v9;
}

void __37__ICBaseTextView_attachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = *(void **)(a1 + 32);
  id v5 = [v6 attachment];
  objc_msgSend(v4, "ic_addNonNilObject:", v5);
}

- (id)textAttachmentsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = [(ICBaseTextView *)self textStorage];
  uint64_t v8 = *MEMORY[0x263F814A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__ICBaseTextView_textAttachmentsInRange___block_invoke;
  v11[3] = &unk_2640B89D0;
  id v9 = v6;
  id v12 = v9;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v11);

  return v9;
}

void __41__ICBaseTextView_textAttachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v4);
}

- (BOOL)canBecomeFirstResponder
{
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v9.receiver = self;
    v9.super_class = (Class)ICBaseTextView;
    return [(ICBaseTextView *)&v9 canBecomeFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICBaseTextView;
    unsigned __int8 v4 = [(ICBaseTextView *)&v8 canBecomeFirstResponder];
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      objc_opt_class();
      id v6 = [(ICBaseTextView *)self layoutManager];
      uint64_t v7 = ICDynamicCast();
      int v5 = [v7 isRenderingPreviewForDragAndDrop] ^ 1;
    }
    return v4 & v5;
  }
}

- (BOOL)becomeFirstResponder
{
  id v3 = [(ICBaseTextView *)self editorController];
  unsigned __int8 v4 = [v3 presentedViewController];

  uint64_t v5 = [v4 modalPresentationStyle];
  if ([(ICBaseTextView *)self isEditable])
  {
    id v6 = [(ICBaseTextView *)self editorController];
    uint64_t v7 = [v6 note];
    int v8 = [v7 isEditable];

    if (!v8 || v5 == 5) {
      [(ICBaseTextView *)self setEditable:0];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ICBaseTextView;
  BOOL v9 = [(ICBaseTextView *)&v11 becomeFirstResponder];
  [(ICBaseTextView *)self keyboardLocaleChanged:0];

  return v9;
}

- (id)firstResponderMatchingPredicate:(id)a3
{
  unsigned __int8 v4 = (uint64_t (**)(id, void *))a3;
  uint64_t v5 = [(ICBaseTextView *)self firstResponder];
  if (v5)
  {
    do
    {
      if (v4[2](v4, v5)) {
        break;
      }
      uint64_t v6 = [v5 nextResponder];

      uint64_t v5 = (void *)v6;
    }
    while (v6);
  }

  return v5;
}

- (void)toggleBoldface:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self TTTextStorage];
  [v5 setConvertAttributes:1];

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v7 toggleBoldface:v4];
  uint64_t v6 = [(ICBaseTextView *)self TTTextStorage];
  [v6 setConvertAttributes:0];

  [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:6 sender:v4];
}

- (void)toggleItalics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self TTTextStorage];
  [v5 setConvertAttributes:1];

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v7 toggleItalics:v4];
  uint64_t v6 = [(ICBaseTextView *)self TTTextStorage];
  [v6 setConvertAttributes:0];

  [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:7 sender:v4];
}

- (void)toggleUnderline:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self TTTextStorage];
  [v5 setConvertAttributes:1];

  v7.receiver = self;
  v7.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v7 toggleUnderline:v4];
  uint64_t v6 = [(ICBaseTextView *)self TTTextStorage];
  [v6 setConvertAttributes:0];

  [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:8 sender:v4];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self TTTextStorage];
  [v5 setConvertAttributes:1];
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v8 makeTextWritingDirectionLeftToRight:v4];
  uint64_t v6 = [v5 styler];
  [v6 setUserChangedWritingDirection:1];
  objc_super v7 = [(ICBaseTextView *)self editorController];
  [v7 textViewDidChange:self];

  [v5 setConvertAttributes:0];
  [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:10 sender:v4];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self TTTextStorage];
  [v5 setConvertAttributes:1];
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v8 makeTextWritingDirectionRightToLeft:v4];
  uint64_t v6 = [v5 styler];
  [v6 setUserChangedWritingDirection:1];
  objc_super v7 = [(ICBaseTextView *)self editorController];
  [v7 textViewDidChange:self];

  [v5 setConvertAttributes:0];
  [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:10 sender:v4];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82A18];
  uint64_t v6 = [(ICBaseTextView *)self _dataOwnerForPaste];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __24__ICBaseTextView_paste___block_invoke;
  v8[3] = &unk_2640B82D8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 _performAsDataOwner:v6 block:v8];
}

uint64_t __24__ICBaseTextView_paste___block_invoke(uint64_t a1)
{
  v47[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) pasteDelegate];

  if (!v2)
  {
    id v4 = [*(id *)(a1 + 32) TTTextStorage];
    [v4 setIsReadingSelectionFromPasteboard:1];

    uint64_t v5 = [*(id *)(a1 + 32) TTTextStorage];
    [v5 breakUndoCoalescing];

    uint64_t v6 = [*(id *)(a1 + 32) TTTextStorage];
    [v6 beginEditing];

    id v7 = [MEMORY[0x263F82A18] generalPasteboard];
    v47[0] = *MEMORY[0x263F5AA90];
    uint64_t v8 = v47[0];
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
    uint64_t v10 = [v7 itemSetWithPasteboardTypes:v9];

    objc_super v11 = [v7 dataForPasteboardType:v8 inItemSet:v10];
    id v12 = [v11 lastObject];

    if (v12)
    {
      id v13 = [MEMORY[0x263F5ACA8] pasteboardDataFromPersistenceData:v12];
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = objc_alloc_init(ICBaseTextViewPasteSession);
    unint64_t v15 = [*(id *)(a1 + 32) editorController];
    unint64_t v16 = [v15 note];
    -[ICBaseTextViewPasteSession setPreviousShouldAddMediaAsynchronously:](v14, "setPreviousShouldAddMediaAsynchronously:", [v16 shouldAddMediaAsynchronously]);

    if (v13)
    {
      int v17 = *(void **)(a1 + 32);
      id v44 = 0;
      uint64_t v18 = [v17 pasteNotePasteboardData:v13 session:v14 error:&v44];
      id v19 = v44;
      if (!v18)
      {
LABEL_9:
        id v24 = [*(id *)(a1 + 32) TTTextStorage];
        [v24 endEditing];

        uint64_t v25 = [*(id *)(a1 + 32) TTTextStorage];
        [v25 setIsReadingSelectionFromPasteboard:0];

        uint64_t v26 = [*(id *)(a1 + 32) editorController];
        unint64_t v27 = [v26 note];
        [v27 save];

        return [*(id *)(a1 + 32) informDelegateOfAnalyticsCalloutBarButtonActionOfType:3 sender:*(void *)(a1 + 40)];
      }
    }
    else
    {
      unint64_t v40 = v10;
      uint64_t v29 = (void *)*MEMORY[0x263F1DB18];
      uint64_t v30 = [(id)*MEMORY[0x263F1DB18] identifier];
      uint64_t v46 = v30;
      uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      id v32 = [v7 itemSetWithPasteboardTypes:v31];

      unint64_t v33 = [v29 identifier];
      uint64_t v34 = [v7 dataForPasteboardType:v33 inItemSet:v32];

      if ([v34 count])
      {
        id v35 = [v7 pasteboardTypesForItemSet:v32];
        uint64_t v18 = [*(id *)(a1 + 32) pasteImagesDataArray:v34 typesArray:v35 session:v14];
      }
      else
      {
        id v35 = [v7 string];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __24__ICBaseTextView_paste___block_invoke_2;
        v41[3] = &unk_2640B82D8;
        id v36 = *(void **)(a1 + 32);
        id v37 = *(id *)(a1 + 40);
        uint64_t v38 = *(void *)(a1 + 32);
        id v42 = v37;
        uint64_t v43 = v38;
        double v39 = [v7 pasteboardTypes];
        uint64_t v18 = [v36 pasteStringUsingBlock:v41 approxPasteString:v35 pasteboardTypes:v39 session:v14];
      }
      id v19 = 0;
      uint64_t v10 = v40;
      if (!v18) {
        goto LABEL_9;
      }
    }
    [*(id *)(a1 + 32) icaxTextDidChange];
    uint64_t v20 = [*(id *)(a1 + 32) editorController];
    uint64_t v21 = [v20 note];
    [v21 updateChangeCountWithReason:@"Pasted string"];

    uint64_t v22 = [*(id *)(a1 + 32) editorController];
    id v23 = [v22 note];
    [v23 save];

    [*(id *)(a1 + 32) _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21BC0]];
    goto LABEL_9;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v45.receiver = *(id *)(a1 + 32);
  v45.super_class = (Class)ICBaseTextView;
  objc_msgSendSuper2(&v45, sel_paste_, v3);
  return [*(id *)(a1 + 32) informDelegateOfAnalyticsCalloutBarButtonActionOfType:3 sender:*(void *)(a1 + 40)];
}

id __24__ICBaseTextView_paste___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ICBaseTextView;
  return objc_msgSendSuper2(&v3, sel_paste_, v1);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(ICBaseTextView *)self icDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(ICBaseTextView *)self icDelegate];
    int v9 = [v8 shouldShowMenuItems];

    if (!v9) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  if (NSSelectorFromString(&cfstr_Showtextformat.isa) == a3) {
    goto LABEL_26;
  }
  if (sel_copy_ == a3 || sel_cut_ == a3)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICBaseTextView;
    if ([(ICBaseTextView *)&v24 canPerformAction:a3 withSender:v6])
    {
      unsigned __int8 v13 = [(ICBaseTextView *)self isSelectionCopyableSize];
      goto LABEL_23;
    }
    goto LABEL_26;
  }
  if (sel__share_ == a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)ICBaseTextView;
    if (![(ICBaseTextView *)&v23 canPerformAction:a3 withSender:v6]
      || ![(ICBaseTextView *)self isSelectionCopyableSize])
    {
      goto LABEL_26;
    }
    LODWORD(self) = [(ICBaseTextView *)self ic_isInSecureWindow] ^ 1;
    goto LABEL_27;
  }
  uint64_t v10 = [(ICBaseTextView *)self singleSelectedAttachment];
  if (v10)
  {
    objc_super v11 = (void *)v10;
    if (NSSelectorFromString(&cfstr_Define.isa) == a3)
    {

      goto LABEL_26;
    }
    id v12 = NSSelectorFromString(&cfstr_Promptforrepla.isa);

    if (v12 == a3)
    {
LABEL_26:
      LOBYTE(self) = 0;
      goto LABEL_27;
    }
  }
  if (sel_toggleStrikethrough == a3)
  {
    v22.receiver = self;
    v22.super_class = (Class)ICBaseTextView;
    unsigned __int8 v13 = [(ICBaseTextView *)&v22 canPerformAction:sel_toggleBoldface_ withSender:v6];
    goto LABEL_23;
  }
  if (sel__findSelected_ == a3)
  {
    if ([(ICBaseTextView *)self selectionSupportsFindInNote])
    {
      Class v14 = NSClassFromString(&cfstr_Icpaperdocumen.isa);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      void v21[2] = __46__ICBaseTextView_canPerformAction_withSender___block_invoke;
      v21[3] = &__block_descriptor_40_e21_B16__0__UIResponder_8lu32l8;
      void v21[4] = v14;
      unint64_t v15 = [(ICBaseTextView *)self firstResponderMatchingPredicate:v21];
      LOBYTE(self) = v15 == 0;

      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (sel_captureTextFromCamera_ != a3)
  {
    v19.receiver = self;
    v19.super_class = (Class)ICBaseTextView;
    unsigned __int8 v13 = [(ICBaseTextView *)&v19 canPerformAction:a3 withSender:v6];
LABEL_23:
    LOBYTE(self) = v13;
    goto LABEL_27;
  }
  objc_opt_class();
  int v17 = [(ICBaseTextView *)self firstResponder];
  ICDynamicCast();
  uint64_t v18 = (ICBaseTextView *)objc_claimAutoreleasedReturnValue();

  if (v18
    && v18 != self
    && [(ICBaseTextView *)v18 isDescendantOfView:self]
    && ([(ICBaseTextView *)v18 conformsToProtocol:&unk_26C171F10] & 1) != 0)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ICBaseTextView;
    LOBYTE(self) = [(ICBaseTextView *)&v20 canPerformAction:a3 withSender:v6];
  }

LABEL_27:
  return (char)self;
}

uint64_t __46__ICBaseTextView_canPerformAction_withSender___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isDocumentCopyableSize
{
  uint64_t v2 = [(ICBaseTextView *)self TTTextStorage];
  objc_super v3 = [v2 mergeableString];
  id v4 = [v3 attributedString];
  char v5 = objc_msgSend(v4, "ic_isCopyableSize");

  return v5;
}

- (BOOL)isSelectionCopyableSize
{
  objc_super v3 = [(ICBaseTextView *)self TTTextStorage];
  id v4 = [v3 mergeableString];
  char v5 = [v4 attributedString];
  uint64_t v6 = [(ICBaseTextView *)self selectedRange];
  uint64_t v8 = objc_msgSend(v5, "attributedSubstringFromRange:", v6, v7);

  LOBYTE(v3) = objc_msgSend(v8, "ic_isCopyableSize");
  return (char)v3;
}

- (BOOL)selectionContainsDDResultAttribute
{
  if ([(ICBaseTextView *)self isEditing]) {
    return 0;
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v4 = [(ICBaseTextView *)self textStorage];
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v5 = (id *)getDDResultAttributeNameSymbolLoc_ptr;
  uint64_t v19 = getDDResultAttributeNameSymbolLoc_ptr;
  if (!getDDResultAttributeNameSymbolLoc_ptr)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getDDResultAttributeNameSymbolLoc_block_invoke;
    v15[3] = &unk_2640B9818;
    void v15[4] = &v16;
    __getDDResultAttributeNameSymbolLoc_block_invoke((uint64_t)v15);
    char v5 = (id *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    id v6 = *v5;
    uint64_t v7 = [(ICBaseTextView *)self selectedRange];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__ICBaseTextView_selectionContainsDDResultAttribute__block_invoke;
    v10[3] = &unk_2640B80C8;
    void v10[4] = &v11;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, v7, v8, 0, v10);

    BOOL v3 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
    return v3;
  }
  dlerror();
  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

uint64_t __52__ICBaseTextView_selectionContainsDDResultAttribute__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)_getPasteboardItemFromSelection:(id)a3
{
  id v46 = a3;
  BOOL v47 = [(ICBaseTextView *)self selectionContainsDDResultAttribute];
  if (v47) {
    [(ICBaseTextView *)self ic_resetDataDetectorsResults];
  }
  id v4 = [(ICBaseTextView *)self TTTextStorage];
  char v5 = [(ICBaseTextView *)self persistenceHelper];
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [(ICBaseTextView *)self selectedRange];
  uint64_t v44 = v8;
  uint64_t v45 = v7;
  int v9 = [(ICBaseTextView *)self textController];
  uint64_t v10 = [(ICBaseTextView *)self selectedRange];
  uint64_t v12 = objc_msgSend(v9, "extendedSelectionRangeForCollapsedSectionHeadingWithRange:textView:", v10, v11, self);
  -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:", v12, v13);

  uint64_t v14 = [(ICBaseTextView *)self selectedRange];
  uint64_t v16 = v15;
  int v17 = (void *)*MEMORY[0x263F1DD70];
  uint64_t v18 = [(id)*MEMORY[0x263F1DD70] identifier];
  uint64_t v19 = objc_msgSend(v4, "copyDataForUTI:range:persistenceHelper:", v18, v14, v16, v5);

  if (v19)
  {
    objc_super v20 = [v17 identifier];
    [v6 setObject:v19 forKeyedSubscript:v20];
  }
  uint64_t v43 = (void *)v19;
  uint64_t v21 = (void *)*MEMORY[0x263F1DB00];
  objc_super v22 = [(id)*MEMORY[0x263F1DB00] identifier];
  uint64_t v23 = objc_msgSend(v4, "copyDataForUTI:range:persistenceHelper:", v22, v14, v16, v5);

  if (v23)
  {
    objc_super v24 = (void *)[[NSString alloc] initWithData:v23 encoding:4];
    uint64_t v25 = [v21 identifier];
    [v6 setObject:v24 forKeyedSubscript:v25];
  }
  id v42 = (void *)v23;
  uint64_t v26 = (void *)*MEMORY[0x263F1DAA8];
  unint64_t v27 = [(id)*MEMORY[0x263F1DAA8] identifier];
  uint64_t v28 = objc_msgSend(v4, "copyDataForUTI:range:persistenceHelper:", v27, v14, v16, v5);

  if (v28)
  {
    uint64_t v29 = [v26 identifier];
    [v6 setObject:v28 forKeyedSubscript:v29];
  }
  uint64_t v30 = (void *)*MEMORY[0x263F1DD38];
  uint64_t v31 = [(id)*MEMORY[0x263F1DD38] identifier];
  id v32 = objc_msgSend(v4, "copyDataForUTI:range:persistenceHelper:", v31, v14, v16, v5);

  if (v32)
  {
    unint64_t v33 = [v30 identifier];
    [v6 setObject:v32 forKeyedSubscript:v33];
  }
  uint64_t v34 = *MEMORY[0x263F5AA90];
  id v35 = objc_msgSend(v4, "copyDataForUTI:range:persistenceHelper:", *MEMORY[0x263F5AA90], v14, v16, v5);
  if (v35) {
    [v6 setObject:v35 forKeyedSubscript:v34];
  }
  id v36 = [MEMORY[0x263EFF8F8] data];
  [v6 setObject:v36 forKeyedSubscript:@"iOS rich content paste pasteboard type"];

  id v37 = (void *)MEMORY[0x263F82A18];
  uint64_t v38 = [(ICBaseTextView *)self _dataOwnerForCopy];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __50__ICBaseTextView__getPasteboardItemFromSelection___block_invoke;
  v48[3] = &unk_2640BB098;
  id v49 = v6;
  id v50 = v46;
  id v39 = v6;
  id v40 = v46;
  [v37 _performAsDataOwner:v38 block:v48];
  if (v47) {
    [(ICBaseTextView *)self ic_startDataDetectors];
  }
  if (v45 != [(ICBaseTextView *)self selectedRange] || v44 != v41) {
    -[ICBaseTextView setSelectedRange:](self, "setSelectedRange:");
  }
}

uint64_t __50__ICBaseTextView__getPasteboardItemFromSelection___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)copy:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __23__ICBaseTextView_copy___block_invoke;
  v3[3] = &unk_2640BB4F0;
  void v3[4] = self;
  [(ICBaseTextView *)self _getPasteboardItemFromSelection:v3];
}

void __23__ICBaseTextView_copy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  BOOL v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  char v5 = [v3 arrayWithObjects:&v7 count:1];
  id v6 = objc_msgSend(MEMORY[0x263F82A18], "generalPasteboard", v7, v8);
  [v6 setItems:v5];

  [*(id *)(a1 + 32) _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
}

- (void)cut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self selectedRange];
  uint64_t v7 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __22__ICBaseTextView_cut___block_invoke;
  v9[3] = &unk_2640B9510;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 1, v5, v7, v9);
}

uint64_t __22__ICBaseTextView_cut___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _reallyCut:*(void *)(result + 40)];
  }
  return result;
}

- (void)_reallyCut:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__22;
  void v19[4] = __Block_byref_object_dispose__22;
  id v20 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __29__ICBaseTextView__reallyCut___block_invoke;
  v18[3] = &unk_2640BB518;
  v18[4] = v19;
  [(ICBaseTextView *)self _getPasteboardItemFromSelection:v18];
  uint64_t v5 = [MEMORY[0x263F82A18] generalPasteboard];
  uint64_t v6 = (void *)MEMORY[0x263F82A18];
  uint64_t v7 = [(ICBaseTextView *)self _dataOwnerForCopy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __29__ICBaseTextView__reallyCut___block_invoke_2;
  v16[3] = &unk_2640B82D8;
  void v16[4] = self;
  id v8 = v4;
  id v17 = v8;
  [v6 _performAsDataOwner:v7 block:v16];
  int v9 = (void *)MEMORY[0x263F82A18];
  uint64_t v10 = [(ICBaseTextView *)self _dataOwnerForCopy];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __29__ICBaseTextView__reallyCut___block_invoke_3;
  v12[3] = &unk_2640BB540;
  id v11 = v5;
  uint64_t v14 = self;
  uint64_t v15 = v19;
  id v13 = v11;
  [v9 _performAsDataOwner:v10 block:v12];

  _Block_object_dispose(v19, 8);
}

void __29__ICBaseTextView__reallyCut___block_invoke(uint64_t a1, void *a2)
{
}

void __29__ICBaseTextView__reallyCut___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textController];
  BOOL v3 = [*(id *)(a1 + 32) textController];
  uint64_t v4 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v6 = objc_msgSend(v3, "extendedSelectionRangeForCollapsedSectionHeadingWithRange:textView:", v4, v5, *(void *)(a1 + 32));
  uint64_t v8 = v7;

  if (v6 != [*(id *)(a1 + 32) selectedRange] || v8 != v9) {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", v6, v8);
  }
  uint64_t v11 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v13 = v12;
  uint64_t v14 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v16 = v15;
  id v17 = [*(id *)(a1 + 32) TTTextStorage];
  objc_msgSend(v2, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v14, v16, v17);

  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v19 = [v18 TTTextStorage];
  objc_msgSend(v2, "removeListStyleBeforeDeletingParagraphContentIfNecessaryForTextView:textStorage:rangeToBeDeleted:blockBeforeEndEditing:", v18, v19, v11, v13, 0);

  uint64_t v20 = *(void *)(a1 + 40);
  v21.receiver = *(id *)(a1 + 32);
  v21.super_class = (Class)ICBaseTextView;
  objc_msgSendSuper2(&v21, sel_cut_, v20);
}

uint64_t __29__ICBaseTextView__reallyCut___block_invoke_3(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [*(id *)(a1 + 32) setItems:v2];

  [*(id *)(a1 + 40) icaxTextDidChange];
  return [*(id *)(a1 + 40) _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B80]];
}

- (void)insertAttributedText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 string];
  uint64_t v6 = [(ICBaseTextView *)self willInsertText:v5];
  uint64_t v8 = v7;

  uint64_t v9 = [(ICBaseTextView *)self textController];
  uint64_t v10 = [v9 authorHighlightsController];

  uint64_t v11 = [(ICBaseTextView *)self selectedRange];
  uint64_t v13 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__ICBaseTextView_insertAttributedText___block_invoke;
  v16[3] = &unk_2640BB568;
  id v17 = v10;
  id v18 = v4;
  uint64_t v19 = self;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  id v14 = v4;
  id v15 = v10;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 2, v11, v13, v16);
}

void __39__ICBaseTextView_insertAttributedText___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setCoalesceAuthorHighlightUpdates:1];
    uint64_t v3 = *(void *)(a1 + 40);
    v6.receiver = *(id *)(a1 + 48);
    v6.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v6, sel_insertAttributedText_, v3);
    [*(id *)(a1 + 32) setCoalesceAuthorHighlightUpdates:0];
    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 40) string];
    objc_msgSend(v4, "didInsertText:range:", v5, *(void *)(a1 + 56), *(void *)(a1 + 64));
  }
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICBaseTextView *)self willInsertText:v4];
  uint64_t v7 = v6;
  uint64_t v8 = [(ICBaseTextView *)self textController];
  uint64_t v9 = [v8 authorHighlightsController];

  uint64_t v10 = [(ICBaseTextView *)self selectedRange];
  uint64_t v12 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __29__ICBaseTextView_insertText___block_invoke;
  v15[3] = &unk_2640BB568;
  id v16 = v9;
  id v17 = v4;
  id v18 = self;
  uint64_t v19 = v5;
  uint64_t v20 = v7;
  id v13 = v4;
  id v14 = v9;
  -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 2, v10, v12, v15);
}

uint64_t __29__ICBaseTextView_insertText___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setCoalesceAuthorHighlightUpdates:1];
    uint64_t v3 = *(void *)(v2 + 40);
    v4.receiver = *(id *)(v2 + 48);
    v4.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v4, sel_insertText_, v3);
    [*(id *)(v2 + 32) setCoalesceAuthorHighlightUpdates:0];
    return objc_msgSend(*(id *)(v2 + 48), "didInsertText:range:", *(void *)(v2 + 40), *(void *)(v2 + 56), *(void *)(v2 + 64));
  }
  return result;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if ([(ICBaseTextView *)self selectedRangeBeforeMarking] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(ICBaseTextView *)self selectedRange];
    -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", v8, v9);
  }
  objc_opt_class();
  uint64_t v10 = [(ICBaseTextView *)self textStorage];
  uint64_t v11 = ICDynamicCast();
  [v11 setIsTypingOrMarkingText:1];

  v14.receiver = self;
  v14.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView setMarkedText:selectedRange:](&v14, sel_setMarkedText_selectedRange_, v7, location, length);

  objc_opt_class();
  uint64_t v12 = [(ICBaseTextView *)self textStorage];
  id v13 = ICDynamicCast();
  [v13 setIsTypingOrMarkingText:0];
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v19[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([(ICBaseTextView *)self selectedRangeBeforeMarking] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(ICBaseTextView *)self selectedRange];
    -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", v8, v9);
  }
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  v18[0] = @"ICBaseTextViewWillSetMarkedTextNotificationMarkedTextKey";
  v18[1] = @"ICBaseTextViewWillSetMarkedTextNotificationSelectedRangeKey";
  v19[0] = v7;
  uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  v19[1] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v10 postNotificationName:@"ICBaseTextViewWillSetMarkedTextNotification" object:self userInfo:v12];

  objc_opt_class();
  id v13 = [(ICBaseTextView *)self textStorage];
  objc_super v14 = ICDynamicCast();
  [v14 setIsTypingOrMarkingText:1];

  v17.receiver = self;
  v17.super_class = (Class)ICBaseTextView;
  -[ICBaseTextView setAttributedMarkedText:selectedRange:](&v17, sel_setAttributedMarkedText_selectedRange_, v7, location, length);
  objc_opt_class();

  id v15 = [(ICBaseTextView *)self textStorage];
  id v16 = ICDynamicCast();
  [v16 setIsTypingOrMarkingText:0];
}

- (void)unmarkText
{
  uint64_t v3 = [(ICBaseTextView *)self editorController];
  objc_super v4 = [v3 calculateRecognitionController];
  [v4 discardPreviewedResult];

  uint64_t v5 = [(ICBaseTextView *)self ic_markedTextRange];
  uint64_t v7 = v6;
  uint64_t v8 = [(ICBaseTextView *)self textStorage];
  uint64_t v35 = v5;
  uint64_t v9 = objc_msgSend(v8, "attributedSubstringFromRange:", v5, v7);
  uint64_t v10 = [v9 string];

  -[ICBaseTextView setSelectedRangeBeforeMarking:](self, "setSelectedRangeBeforeMarking:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_opt_class();
  uint64_t v11 = [(ICBaseTextView *)self textStorage];
  uint64_t v12 = ICDynamicCast();
  [v12 setIsTypingOrMarkingText:1];

  v36.receiver = self;
  v36.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v36 unmarkText];
  objc_opt_class();
  id v13 = [(ICBaseTextView *)self textStorage];
  objc_super v14 = ICDynamicCast();
  [v14 setIsTypingOrMarkingText:0];

  objc_opt_class();
  id v15 = [(ICBaseTextView *)self textStorage];
  id v16 = ICDynamicCast();

  objc_super v17 = [(ICBaseTextView *)self editorController];
  id v18 = [v17 mentionsController];
  uint64_t v19 = [(ICBaseTextView *)self selectedRange];
  uint64_t v21 = v20;
  objc_super v22 = [(ICBaseTextView *)self editorController];
  uint64_t v23 = [v22 note];
  BYTE1(v33) = [(ICBaseTextView *)self languageHasSpaces];
  LOBYTE(v33) = 0;
  LOBYTE(v19) = [v18 checkForMentionInEditedRange:v19 ofTextStorage:v21 note:v16 textView:v23 allowAutoExplicitMention:self isEndingEditing:1 languageHasSpaces:v33 parentAttachment:0];

  if ((v19 & 1) == 0)
  {
    objc_super v24 = [(ICBaseTextView *)self editorController];
    uint64_t v25 = [v24 hashtagController];
    uint64_t v26 = [(ICBaseTextView *)self selectedRange];
    uint64_t v28 = v27;
    uint64_t v29 = [(ICBaseTextView *)self editorController];
    uint64_t v30 = [v29 note];
    BYTE1(v34) = [(ICBaseTextView *)self languageHasSpaces];
    LOBYTE(v34) = 0;
    [v25 checkForHashtagInEditedRange:v26 ofTextStorage:v28 note:v16 textView:v30 allowAutoExplicitHashtag:self isEndingEditing:1 languageHasSpaces:v34 parentAttachment:0];
  }
  uint64_t v31 = [(ICBaseTextView *)self editorController];
  id v32 = [v31 calculateRecognitionController];
  objc_msgSend(v32, "didUnmarkString:atRange:", v10, v35, v7);
}

- (void)deleteBackward
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICBaseTextView *)self editorController];
  objc_super v4 = [v3 calculateRecognitionController];
  [v4 discardPreviewedResult];

  objc_opt_class();
  uint64_t v5 = [(ICBaseTextView *)self textStorage];
  uint64_t v6 = ICDynamicCast();

  uint64_t v7 = [(ICBaseTextView *)self selectedTextRange];
  uint64_t v8 = [(ICBaseTextView *)self ic_characterRangeFromTextRange:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v10 = [v6 attribute:*MEMORY[0x263F5AB28] atIndex:v8 effectiveRange:0];
    uint64_t v11 = [v10 uuid];
    if (v11)
    {
      uint64_t v12 = [v6 outlineController];
      id v13 = [v10 uuid];
      int v9 = [v12 isUUIDCollapsed:v13];
    }
    else
    {
      int v9 = 0;
    }

    uint64_t v14 = [v10 uuid];
    if (v14)
    {
      id v15 = (void *)v14;
      id v16 = [v6 outlineController];
      objc_super v17 = [v10 uuid];
      int v18 = [v16 isUUIDHidden:v17];

      if (v18)
      {
        uint64_t v19 = [v6 outlineController];
        uint64_t v20 = [v10 uuid];
        uint64_t v21 = [v19 closestVisibleAncestorForUUID:v20];

        if (v21)
        {
          objc_super v22 = [v6 outlineController];
          uint64_t v23 = (void *)MEMORY[0x263EFFA08];
          v31[0] = v21;
          objc_super v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
          uint64_t v25 = [v23 setWithArray:v24];
          [v22 expandUUIDs:v25];
        }
        goto LABEL_18;
      }
    }
  }
  uint64_t v10 = [(ICBaseTextView *)self textController];
  uint64_t v26 = [(ICBaseTextView *)self selectedTextRange];
  char v27 = [v26 isEmpty];

  if ((v27 & 1) == 0 && !v9)
  {
    if ([v10 deleteWordBackwardForSpecialCasesInTextView:self]) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (([v10 deleteBackwardForSpecialCasesInTextView:self] & 1) == 0)
  {
LABEL_17:
    uint64_t v28 = [(ICBaseTextView *)self selectedRange];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __32__ICBaseTextView_deleteBackward__block_invoke;
    v30[3] = &unk_2640B8AC0;
    v30[4] = self;
    void v30[5] = v28;
    v30[6] = v29;
    -[ICBaseTextView showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:](self, "showRemoveAttachmentAlertIfNecessaryForOperation:selectedRange:completionHandler:", 0, v28, v29, v30);
  }
LABEL_18:
}

void __32__ICBaseTextView_deleteBackward__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    objc_opt_class();
    uint64_t v3 = [*(id *)(a1 + 32) textStorage];
    objc_super v4 = ICDynamicCast();
    [v4 setIsTypingOrMarkingText:1];

    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)ICBaseTextView;
    objc_msgSendSuper2(&v7, sel_deleteBackward);
    objc_opt_class();
    uint64_t v5 = [*(id *)(a1 + 32) textStorage];
    uint64_t v6 = ICDynamicCast();
    [v6 setIsTypingOrMarkingText:0];
  }
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  if (a3)
  {
    [(ICBaseTextView *)self deleteBackward];
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    -[ICBaseTextView _deleteBackwardAndNotify:](&v5, sel__deleteBackwardAndNotify_);
  }
}

- (void)_removeDrawingAttachment:(id)a3 withView:(id)a4 forDeletion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    objc_opt_class();
    uint64_t v10 = ICCheckedDynamicCast();
    uint64_t v11 = [v10 attachment];
    uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8C0], "ic_arrayFromNonNilObject:", v11);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__ICBaseTextView__removeDrawingAttachment_withView_forDeletion___block_invoke;
    v14[3] = &unk_2640B94C0;
    id v15 = v8;
    id v16 = v9;
    objc_super v17 = self;
    [(ICBaseTextView *)self showDeleteInlineDrawingAlertWithType:1 attachments:v12 completionHandler:v14];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICBaseTextView;
    [(ICBaseTextView *)&v13 _removeDrawingAttachment:v8 withView:v9 forDeletion:0];
  }
}

id __64__ICBaseTextView__removeDrawingAttachment_withView_forDeletion___block_invoke(id result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *((void *)result + 5);
    uint64_t v3 = *((void *)result + 4);
    v4.receiver = (id)*((void *)result + 6);
    v4.super_class = (Class)ICBaseTextView;
    return objc_msgSendSuper2(&v4, sel__removeDrawingAttachment_withView_forDeletion_, v3, v2, 1);
  }
  return result;
}

- (BOOL)isPreviewing
{
  int v3 = [MEMORY[0x263F82D60] instancesRespondToSelector:sel_isPreviewing];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ICBaseTextView;
    LOBYTE(v3) = [(ICBaseTextView *)&v5 isPreviewing];
  }
  return v3;
}

- (void)_insertDrawing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  id v4 = a3;
  [(ICBaseTextView *)&v5 _insertDrawing:self];
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 4, v4, v5.receiver, v5.super_class);
}

- (void)select:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  id v4 = a3;
  [(ICBaseTextView *)&v5 select:v4];
  -[ICBaseTextView informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:](self, "informDelegateOfAnalyticsCalloutBarButtonActionOfType:sender:", 1, v4, v5.receiver, v5.super_class);
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v5 selectAll:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ICBaseTextView *)self informDelegateOfAnalyticsCalloutBarButtonActionOfType:2 sender:v4];
  }
}

- (void)toggleStrikethrough
{
  [(ICBaseTextView *)self selectedRange];
  int v3 = (uint64_t *)MEMORY[0x263F5AB30];
  if (v4)
  {
    objc_super v5 = [(ICBaseTextView *)self textStorage];
    uint64_t v6 = objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *v3, -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
    int v7 = [v6 BOOLValue];

    id v8 = [(ICBaseTextView *)self textStorage];
    uint64_t v9 = *v3;
    uint64_t v11 = [(ICBaseTextView *)self selectedRange];
    if (v7) {
      objc_msgSend(v8, "removeAttribute:range:", v9, v11, v10);
    }
    else {
      objc_msgSend(v8, "addAttribute:value:range:", v9, MEMORY[0x263EFFA88], v11, v10);
    }

    uint64_t v14 = [(ICBaseTextView *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v12 = [(ICBaseTextView *)self delegate];
    [v12 textViewDidChange:self];
  }
  else
  {
    uint64_t v12 = [(ICBaseTextView *)self typingAttributes];
    objc_super v13 = [v12 objectForKeyedSubscript:*v3];
    int v7 = [v13 BOOLValue];
  }
LABEL_9:
  uint64_t v16 = v7 ^ 1u;
  objc_super v17 = [(ICBaseTextView *)self typingAttributes];
  id v20 = (id)[v17 mutableCopy];

  int v18 = [NSNumber numberWithBool:v16];
  [v20 setObject:v18 forKeyedSubscript:*v3];

  uint64_t v19 = [NSNumber numberWithInteger:v16];
  [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x263F81570]];

  [(ICBaseTextView *)self setTypingAttributes:v20];
}

- (id)typingAttributes
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int v3 = [(ICBaseTextView *)v2 cachedTypingAttributes];
  uint64_t v4 = v3;
  if (!v3)
  {
    v7.receiver = v2;
    v7.super_class = (Class)ICBaseTextView;
    uint64_t v4 = [(ICBaseTextView *)&v7 typingAttributes];
  }
  [(ICBaseTextView *)v2 setCachedTypingAttributes:v4];
  if (!v3) {

  }
  objc_super v5 = [(ICBaseTextView *)v2 cachedTypingAttributes];
  objc_sync_exit(v2);

  return v5;
}

- (void)setTypingAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v4) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((typingAttributes) != nil)", "-[ICBaseTextView setTypingAttributes:]", 1, 0, @"Expected non-nil value for '%s'", "typingAttributes");
  }
  objc_opt_class();
  uint64_t v6 = [(ICBaseTextView *)v5 textStorage];
  objc_super v7 = ICDynamicCast();
  int v8 = [v7 isEditing];

  if (v8)
  {
    [(ICBaseTextView *)v5 setPendingTypingAttributes:v4];
  }
  else
  {
    [(ICBaseTextView *)v5 setPendingTypingAttributes:0];
    [(ICBaseTextView *)v5 setCachedTypingAttributes:v4];
    v9.receiver = v5;
    v9.super_class = (Class)ICBaseTextView;
    [(ICBaseTextView *)&v9 setTypingAttributes:v4];
  }
  objc_sync_exit(v5);
}

- (id)internalTypingAttributes
{
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  uint64_t v2 = [(ICBaseTextView *)&v4 typingAttributes];

  return v2;
}

- (void)setInternalTypingAttributes:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v3 setTypingAttributes:a3];
}

- (void)ic_startDataDetectors
{
  if ([(ICBaseTextView *)self ic_shouldStartDataDetectors]
    && [MEMORY[0x263F82D60] instancesRespondToSelector:sel__startDataDetectors])
  {
    [(ICBaseTextView *)self _startDataDetectors];
  }
}

- (void)ic_resetDataDetectorsResults
{
  if ([(ICBaseTextView *)self ic_shouldStartDataDetectors]
    && [MEMORY[0x263F82D60] instancesRespondToSelector:sel__resetDataDetectorsResults])
  {
    [(ICBaseTextView *)self _resetDataDetectorsResults];
  }
}

- (BOOL)ic_shouldStartDataDetectors
{
  if (![(ICBaseTextView *)self dataDetectorTypes]
    || ([(ICBaseTextView *)self isEditable] & 1) != 0)
  {
    return 0;
  }

  return [(ICBaseTextView *)self isSelectable];
}

- (BOOL)hasFullWidthTextAttachmentAtCaretLocation:(int64_t)a3
{
  if (a3 < 0) {
    return 0;
  }
  objc_super v5 = [(ICBaseTextView *)self TTTextStorage];
  unint64_t v6 = [v5 length];

  if (v6 <= a3) {
    return 0;
  }
  objc_opt_class();
  objc_super v7 = [(ICBaseTextView *)self TTTextStorage];
  int v8 = objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x263F814A0], a3, 0, a3, 1);
  objc_super v9 = ICDynamicCast();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  objc_opt_class();
  uint64_t v10 = ICDynamicCast();
  uint64_t v11 = [v10 attachment];
  int v12 = [v11 preferredViewSize];

  if (v12 != 1)
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_6:
    if (v9 && [v9 embeddingType] == 1)
    {
      [v9 bounds];
      BOOL v14 = v13 > 0.0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICBaseTextView *)self beginningOfDocument];
  unint64_t v6 = [(ICBaseTextView *)self offsetFromPosition:v5 toPosition:v4];

  objc_super v7 = [(ICBaseTextView *)self TTTextStorage];
  unint64_t v8 = [v7 logicalRangeForLocation:v6];
  uint64_t v10 = v8 + v9;
  if (v6 == v8 + v9)
  {
    uint64_t v11 = [(ICBaseTextView *)self editorController];
    uint64_t v12 = [v11 textController];
    double v13 = [(ICBaseTextView *)self typingAttributes];
    BOOL v14 = objc_msgSend((id)v12, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v6, 0, 0, v13, v7);

    char v15 = [(ICBaseTextView *)self typingAttributes];
    LOBYTE(v12) = [v14 isEqual:v15];

    if ((v12 & 1) == 0) {
      [(ICBaseTextView *)self setTypingAttributes:v14];
    }
  }
  v95.receiver = self;
  v95.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v95 caretRectForPosition:v4];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  objc_super v24 = (void *)MEMORY[0x263F81540];
  unint64_t v25 = 0x263F81000;
  if (v6 == v10)
  {
    uint64_t v26 = [v7 styler];
    char v27 = [(ICBaseTextView *)self typingAttributes];
    uint64_t v28 = [v27 objectForKeyedSubscript:*v24];

    if (v28)
    {
      uint64_t v29 = v24;
      uint64_t v30 = [v28 baseWritingDirection];
      uint64_t v31 = [(ICBaseTextView *)self typingAttributes];
      id v32 = [v31 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];

      if (v32)
      {
        uint64_t v33 = (void *)MEMORY[0x263F5B4E8];
        uint64_t v34 = [(ICBaseTextView *)self selectedRange];
        objc_msgSend(v33, "indentForStyle:range:attributedString:textView:", v32, v34, v35, v7, self);
      }
      else
      {
        [v28 firstLineHeadIndent];
      }
      double v48 = v36;
      objc_super v24 = v29;

      BOOL v46 = v30 == -1;
      double v47 = (double)(unint64_t)v48;
    }
    else
    {
      BOOL v46 = 1;
      double v47 = 0.0;
    }
    uint64_t v93 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v94 = 0;
    id v49 = [v7 string];
    uint64_t v50 = [(ICBaseTextView *)self selectedRange];
    objc_msgSend(v49, "getParagraphStart:end:contentsEnd:forRange:", &v94, 0, &v93, v50, v51);

    if (v46 && v94 == v93)
    {
      uint64_t v52 = [v26 keyboardLanguageForTextView:self];
      unint64_t v25 = 0x263F81000uLL;
      if (v52)
      {
        long long v53 = v24;
        uint64_t v54 = [MEMORY[0x263F81658] defaultWritingDirectionForLanguage:v52];
        [(ICBaseTextView *)self bounds];
        uint64_t v56 = v55;
        uint64_t v90 = v57;
        uint64_t v91 = v58;
        uint64_t rect = v59;
        uint64_t v60 = [(ICBaseTextView *)self textContainer];
        [v60 lineFragmentPadding];
        double v62 = v61;
        [(ICBaseTextView *)self textContainerInset];
        double v64 = v63;
        double v66 = v65;

        uint64_t v67 = v56;
        uint64_t v68 = v90;
        uint64_t v69 = v91;
        uint64_t v70 = rect;
        if (v54 == 1) {
          double v17 = CGRectGetMaxX(*(CGRect *)&v67) - (v62 + v66) - v47;
        }
        else {
          double v17 = v47 + CGRectGetMinX(*(CGRect *)&v67) + v62 + v64;
        }
        objc_super v24 = v53;
        unint64_t v25 = 0x263F81000uLL;
      }
    }
    else
    {
      unint64_t v25 = 0x263F81000;
    }
  }
  else
  {
    if (v6 <= v8) {
      goto LABEL_29;
    }
    uint64_t v26 = objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x263F814A0], v6 - 1, 0, v6 - 1, 1);
    objc_opt_class();
    id v37 = ICDynamicCast();
    uint64_t v28 = v37;
    if (v37)
    {
      [v37 attachmentBoundsMargins];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      uint64_t v44 = objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ICBaseTextView semanticContentAttribute](self, "semanticContentAttribute"));
      double v45 = v17 + v39 + -2.0;
      if (v44 != 1) {
        double v45 = v17 - (v39 + -2.0);
      }
      if (v39 > 2.0) {
        double v17 = v45;
      }
      double v19 = v19 + v41;
      double v23 = v23 - (v41 + v43);
    }
  }

LABEL_29:
  unsigned int v71 = objc_msgSend(*(id *)(v25 + 1624), "ic_isRTL");
  CGRect v72 = [(ICBaseTextView *)self textStorage];
  unint64_t v73 = [v72 length];

  if (v6 < v73)
  {
    id v74 = [(ICBaseTextView *)self textStorage];
    double v75 = [v74 attribute:*v24 atIndex:v6 effectiveRange:0];

    if (v75) {
      unsigned int v71 = [v75 baseWritingDirection] == 1;
    }
  }
  [(ICBaseTextView *)self bounds];
  if (v17 >= CGRectGetMidX(v96))
  {
    uint64_t v84 = v6 - (v71 ^ 1);
    if (v84 >= 0
      && [(ICBaseTextView *)self hasFullWidthTextAttachmentAtCaretLocation:v84])
    {
      [(ICBaseTextView *)self bounds];
      double v17 = v85 + -3.0;
    }
  }
  else
  {
    uint64_t v76 = v6 - v71;
    if (v76 >= 0)
    {
      if ([(ICBaseTextView *)self hasFullWidthTextAttachmentAtCaretLocation:v76])
      {
        uint64_t v77 = [(ICBaseTextView *)self ink];
        int v78 = [v77 _isHandwritingInk];

        double v17 = 1.0;
        if (v78)
        {
          uint64_t v79 = [(ICBaseTextView *)self textStorage];
          uint64_t v80 = [v79 attribute:*MEMORY[0x263F814F0] atIndex:v76 effectiveRange:0];

          uint64_t v81 = [(ICBaseTextView *)self textContainer];
          [v81 textContainerOrigin];
          double v17 = v82;

          if (v80)
          {
            [v80 lineHeight];
            double v23 = v83;
          }
          else
          {
            double v23 = 18.0;
          }
        }
      }
    }
  }

  double v86 = v17;
  double v87 = v19;
  double v88 = v21;
  double v89 = v23;
  result.size.double height = v89;
  result.size.double width = v88;
  result.origin.double y = v87;
  result.origin.double x = v86;
  return result;
}

- (void)updateTextViewForDidChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__ICBaseTextView_updateTextViewForDidChange__block_invoke;
  v2[3] = &unk_2640BB590;
  v2[4] = self;
  [(ICBaseTextView *)self ic_performBlock:v2];
}

void __44__ICBaseTextView_updateTextViewForDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  unint64_t v8 = [v5 typingAttributes];
  uint64_t v9 = *MEMORY[0x263F814F0];
  id v22 = [v8 objectForKeyedSubscript:*MEMORY[0x263F814F0]];

  uint64_t v10 = [*(id *)(a1 + 32) internalTypingAttributes];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v22)
  {
    uint64_t v12 = [v11 objectForKeyedSubscript:v9];
    double v13 = v12;
    if (v12)
    {
      BOOL v14 = (void *)MEMORY[0x263F81708];
      char v15 = [v12 fontDescriptor];
      [v22 pointSize];
      double v16 = objc_msgSend(v14, "fontWithDescriptor:size:", v15);

      [v11 setObject:v16 forKeyedSubscript:v9];
    }
  }
  [v7 fixupAfterEditing];
  uint64_t v17 = [*(id *)(a1 + 32) selectedRange];
  double v19 = objc_msgSend(v6, "typingAttributesForRange:forSelectionChange:currentTypingAttributes:inTextStorage:", v17, v18, 0, v11, v7);

  double v20 = [*(id *)(a1 + 32) typingAttributes];
  char v21 = [v19 isEqualToDictionary:v20];

  if ((v21 & 1) == 0) {
    [*(id *)(a1 + 32) setTypingAttributes:v19];
  }
  [*(id *)(a1 + 32) icaxTextDidChange];
}

- (double)zoomFactor
{
  return 1.0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self tapGestureRecognizer];

  if (v5 != v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)ICBaseTextView;
    BOOL v6 = [(ICBaseTextView *)&v15 gestureRecognizerShouldBegin:v4];
    id v7 = [(ICBaseTextView *)self editorController];
    unint64_t v8 = [v7 auxiliaryResponder];

    if (v6)
    {
      uint64_t v9 = [(ICBaseTextView *)self editorController];
      if (![v9 isEditing] || (LOBYTE(v6) = 1, v8) && v8 != self)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        uint64_t v9 = [(ICBaseTextView *)self linkTappedByGesture:v4];
        LOBYTE(v6) = v9 != 0;
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  if ([v4 numberOfTouches]
    && ([(ICBaseTextView *)self editorController],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 shouldIgnoreTapToStartEditingTextView:self],
        v11,
        (v12 & 1) == 0))
  {
    BOOL v14 = [(ICBaseTextView *)self linkTappedByGesture:v4];

    LOBYTE(v6) = v14 == 0;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
LABEL_14:

  return v6;
}

- (void)respondToTapGesture:(id)a3
{
  id v32 = a3;
  objc_opt_class();
  id v4 = [(ICBaseTextView *)self textContainer];
  id v5 = ICDynamicCast();
  int v6 = [v5 insideSiriSnippet];

  if (v6)
  {
    objc_opt_class();
    id v7 = ICDynamicCast();
    unint64_t v8 = [v7 note];

    uint64_t v9 = [MEMORY[0x263F5AB68] appURLForNote:v8];
    if (v9) {
      +[ICExtensionSafeAPIShims openURL:v9 originatingView:self completionHandler:0];
    }
    goto LABEL_4;
  }
  uint64_t v10 = [(ICBaseTextView *)self editorController];
  uint64_t v11 = [v10 calculateScrubberController];
  int v12 = [v11 isShowing];

  if (v12)
  {
    double v13 = [(ICBaseTextView *)self editorController];
    BOOL v14 = [v13 calculateScrubberController];
    [v14 hideScrubber];
  }
  objc_opt_class();
  objc_super v15 = [(ICBaseTextView *)self textStorage];
  unint64_t v8 = ICDynamicCast();

  if ([v8 isMarkingTextForHeadingRename])
  {
    [(ICBaseTextView *)self endHeadingRenameCommittingMarkedText:1];
  }
  else
  {
    id v16 = [(ICBaseTextView *)self tapGestureRecognizer];
    if (v16 == v32)
    {
      uint64_t v17 = [v32 state];

      if (v17 == 3)
      {
        uint64_t v18 = [(ICBaseTextView *)self editorController];
        uint64_t v9 = [v18 note];

        if (v9)
        {
          if ([v32 numberOfTouches])
          {
            double v19 = [(ICBaseTextView *)self icDelegate];
            char v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) == 0
              || ([(ICBaseTextView *)self icDelegate],
                  char v21 = objc_claimAutoreleasedReturnValue(),
                  char v22 = [v21 handleTapGestureForAttribution:v32],
                  v21,
                  (v22 & 1) == 0))
            {
              double v23 = [(ICBaseTextView *)self calculateRecognitionController];
              int v24 = [v23 isPreviewingResult];

              if (v24)
              {
                unint64_t v25 = [(ICBaseTextView *)self calculateRecognitionController];
                [v25 discardPreviewedResult];
              }
              else
              {
                if ([v9 isEditable])
                {
                  char v27 = [(ICBaseTextView *)self icDelegate];
                  char v28 = objc_opt_respondsToSelector();

                  if ((v28 & 1) == 0
                    || ([(ICBaseTextView *)self icDelegate],
                        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
                        int v30 = [v29 shouldStartEditingForTapGesture:v32],
                        v29,
                        v30))
                  {
                    [(ICBaseTextView *)self startEditingForTapGesture:v32];
                  }
                  goto LABEL_4;
                }
                [(ICBaseTextView *)self selectedRange];
                if (v31) {
                  [(ICBaseTextView *)self setSelectedTextRange:0];
                }
                if (![v9 isDeletedOrInTrash]) {
                  goto LABEL_4;
                }
                unint64_t v25 = [(ICBaseTextView *)self editorController];
                [v25 showRecoverNoteAlert];
              }
            }
          }
        }
        else
        {
          uint64_t v26 = [(ICBaseTextView *)self editorController];
          [v26 addNote:self];
        }
LABEL_4:
      }
    }
    else
    {
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unint64_t v8 = [(ICBaseTextView *)self icDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(ICBaseTextView *)self icDelegate];
    char v10 = [v9 shouldBlockHitTestOnTextView:self event:v7];

    if (v10)
    {
      uint64_t v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  -[ICBaseTextView setHitTestPoint:](self, "setHitTestPoint:", x, y);
  v13.receiver = self;
  v13.super_class = (Class)ICBaseTextView;
  uint64_t v11 = -[ICBaseTextView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
LABEL_6:

  return v11;
}

- (id)linkTappedByGesture:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfTouches])
  {
    [v4 locationOfTouch:0 inView:self];
    uint64_t v10 = 0;
    -[ICBaseTextView distanceFromContentToGivenPoint:charIndexAtPoint:](self, "distanceFromContentToGivenPoint:charIndexAtPoint:", &v10);
    id v5 = 0;
    if (v6 < 28.2842712 && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v8 = [(ICBaseTextView *)self textStorage];
      id v5 = [v8 attribute:*MEMORY[0x263F81520] atIndex:v10 effectiveRange:0];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (double)distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  double v6 = -[ICBaseTextView closestPositionToPoint:](self, "closestPositionToPoint:", a3.x, a3.y);
  if (v6)
  {
    id v7 = [(ICBaseTextView *)self beginningOfDocument];
    unint64_t v8 = [(ICBaseTextView *)self offsetFromPosition:v7 toPosition:v6];

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICBaseTextView ic_rectForRange:](self, "ic_rectForRange:", v8, 0);
    }
    else
    {
      objc_opt_class();
      uint64_t v10 = [(ICBaseTextView *)self layoutManager];
      uint64_t v11 = ICDynamicCast();

      uint64_t v12 = [v11 glyphIndexForCharacterAtIndex:v8];
      objc_super v13 = [(ICBaseTextView *)self textContainer];
      objc_msgSend(v11, "boundingRectForGlyphRange:inTextContainer:", v12, 0, v13);
    }
    BOOL v14 = [(ICBaseTextView *)self textContainer];
    [v14 textContainerOrigin];

    UIDistanceBetweenPointAndRect();
    double v9 = v15;
    if (a4) {
      *a4 = v8;
    }
  }
  else
  {
    double v9 = 1.79769313e308;
  }

  return v9;
}

- (void)setIsDraggingChecklistItem:(BOOL)a3
{
  if (self->_isDraggingChecklistItem != a3)
  {
    self->_isDraggingChecklistItem = a3;
    if (a3)
    {
      id v4 = objc_alloc_init(MEMORY[0x263F82BC0]);
      [(ICBaseTextView *)self setChecklistDragFeedbackGenerator:v4];

      id v5 = [(ICBaseTextView *)self checklistDragFeedbackGenerator];
      [v5 prepare];

      id v6 = [(ICBaseTextView *)self checklistDragFeedbackGenerator];
      [v6 selectionChanged];
    }
    else
    {
      [(ICBaseTextView *)self setChecklistDragFeedbackGenerator:0];
    }
  }
}

- (void)setIsDraggingOverChecklistItem:(BOOL)a3
{
  if (self->_isDraggingOverChecklistItem != a3)
  {
    self->_isDraggingOverChecklistItem = a3;
    if (!a3) {
      [(ICBaseTextView *)self setInhibitNextDropCursorUpdateAnimation:1];
    }
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[ICBaseTextView setTouchIsPointer:](self, "setTouchIsPointer:", objc_msgSend(v7, "ic_containsObjectPassingTest:", &__block_literal_global_25));
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v8 touchesBegan:v7 withEvent:v6];
}

uint64_t __41__ICBaseTextView_touchesBegan_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isPointerTouch];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v4 touchesMoved:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v5 touchesEnded:a3 withEvent:a4];
  [(ICBaseTextView *)self setTouchIsPointer:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(ICBaseTextView *)self setTouchIsPointer:0];
}

- (void)beginSelectionChange
{
  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v6 beginSelectionChange];
  objc_super v3 = [(ICBaseTextView *)self editorController];
  objc_super v4 = [v3 note];
  objc_super v5 = [v4 documentMergeController];
  [v5 beginBlockingMergeForReason:0 textView:self];
}

- (void)endSelectionChange
{
  objc_super v3 = [(ICBaseTextView *)self editorController];
  objc_super v4 = [v3 note];
  objc_super v5 = [v4 documentMergeController];
  [v5 endBlockingMergeForReason:0 textView:self];

  v6.receiver = self;
  v6.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v6 endSelectionChange];
}

- (BOOL)willInteractWithLinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[ICBaseTextView distanceFromContentToGivenPoint:charIndexAtPoint:](self, "distanceFromContentToGivenPoint:charIndexAtPoint:", 0);
  if (v6 >= 28.2842712) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  return -[ICBaseTextView willInteractWithLinkAtPoint:](&v8, sel_willInteractWithLinkAtPoint_, x, y);
}

- (void)speakAccessibilityAutoListItemIfNecessaryForInsertedText:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unint64_t v5 = [(ICBaseTextView *)self selectedRange];
    double v6 = [(ICBaseTextView *)self textStorage];
    if (v5 >= [v6 length])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v7 = [v4 length];

    if (v7 == 1)
    {
      double v6 = [(ICBaseTextView *)self textStorage];
      objc_super v8 = objc_msgSend(v6, "attributesAtIndex:effectiveRange:", -[ICBaseTextView selectedRange](self, "selectedRange"), 0);
      double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];
      if ([v9 isList])
      {
        uint64_t v10 = [v4 characterAtIndex:0];
        uint64_t v11 = [MEMORY[0x263F08708] newlineCharacterSet];
        LODWORD(v10) = [v11 characterIsMember:v10];

        if (v10)
        {
          UIAccessibilityPostNotification(*MEMORY[0x263F81438], self);
          switch([v9 style])
          {
            case 'd':
              uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
              objc_super v13 = v12;
              BOOL v14 = @"bullet";
              goto LABEL_12;
            case 'e':
              uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
              objc_super v13 = v12;
              BOOL v14 = @"dash";
              goto LABEL_12;
            case 'f':
              id v16 = NSString;
              objc_super v13 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5AD88]];
              uint64_t v17 = objc_msgSend(v16, "localizedStringWithFormat:", @"%lu", objc_msgSend(v13, "unsignedIntegerValue"));
              goto LABEL_13;
            case 'g':
              uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
              objc_super v13 = v12;
              BOOL v14 = @"checklist";
LABEL_12:
              uint64_t v17 = [v12 localizedStringForKey:v14 value:&stru_26C10E100 table:0];
LABEL_13:
              double v15 = (void *)v17;

              break;
            default:
              double v15 = 0;
              break;
          }
          uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
          double v19 = [v18 localizedStringForKey:@"New list item" value:&stru_26C10E100 table:0];

          char v21 = __ICAccessibilityStringForVariables();
          id v20 = v21;
          dispatchMainAfterDelay();
        }
      }

      goto LABEL_16;
    }
  }
LABEL_17:
}

uint64_t __75__ICBaseTextView_speakAccessibilityAutoListItemIfNecessaryForInsertedText___block_invoke()
{
  return ICAccessibilityPostHighPriorityAnnouncementNotification();
}

- (void)buildMenuWithBuilder:(id)a3
{
  v146[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  Class v5 = NSClassFromString(&cfstr_Icpaperdocumen.isa);
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke;
  v140[3] = &__block_descriptor_40_e21_B16__0__UIResponder_8lu32l8;
  v140[4] = v5;
  double v6 = [(ICBaseTextView *)self firstResponderMatchingPredicate:v140];
  if (v6) {
    goto LABEL_30;
  }
  v139.receiver = self;
  v139.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v139 buildMenuWithBuilder:v4];
  uint64_t v115 = *MEMORY[0x263F838B8];
  objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:");
  uint64_t v7 = (void *)MEMORY[0x263F825E8];
  objc_super v8 = [MEMORY[0x263F086E0] mainBundle];
  double v9 = [v8 localizedStringForKey:@"Check All" value:&stru_26C10E100 table:0];
  uint64_t v10 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle"];
  v125 = [v7 commandWithTitle:v9 image:v10 action:sel_checkAll_ propertyList:0];

  uint64_t v11 = (void *)MEMORY[0x263F825E8];
  uint64_t v12 = [MEMORY[0x263F086E0] mainBundle];
  objc_super v13 = [v12 localizedStringForKey:@"Uncheck All" value:&stru_26C10E100 table:0];
  BOOL v14 = [MEMORY[0x263F827E8] systemImageNamed:@"circle"];
  v124 = [v11 commandWithTitle:v13 image:v14 action:sel_uncheckAll_ propertyList:0];

  double v15 = (void *)MEMORY[0x263F825E8];
  id v16 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v17 = [v16 localizedStringForKey:@"Delete Checked" value:&stru_26C10E100 table:0];
  uint64_t v18 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];
  v130 = [v15 commandWithTitle:v17 image:v18 action:sel_removeChecked_ propertyList:0];

  objc_msgSend(v130, "setAttributes:", objc_msgSend(v130, "attributes") | 2);
  double v19 = (void *)MEMORY[0x263F825E8];
  id v20 = [MEMORY[0x263F086E0] mainBundle];
  char v21 = [v20 localizedStringForKey:@"Move Checked to Bottom" value:&stru_26C10E100 table:0];
  NSRange v123 = [v19 commandWithTitle:v21 image:0 action:sel_moveCheckedToBottom_ propertyList:0];

  char v22 = (void *)MEMORY[0x263F82940];
  double v23 = [MEMORY[0x263F086E0] mainBundle];
  int v24 = [v23 localizedStringForKey:@"Checklist" value:&stru_26C10E100 table:0];
  unint64_t v25 = [MEMORY[0x263F827E8] systemImageNamed:@"checklist"];
  v146[0] = v125;
  v146[1] = v124;
  v146[2] = v130;
  v146[3] = v123;
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:4];
  id v118 = [v22 menuWithTitle:v24 image:v25 identifier:0 options:0 children:v26];

  char v27 = (void *)MEMORY[0x263F825E8];
  char v28 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v29 = [v28 localizedStringForKey:@"Decrease" value:&stru_26C10E100 table:0];
  int v30 = [MEMORY[0x263F827E8] systemImageNamed:@"decrease.indent"];
  v129 = [v27 commandWithTitle:v29 image:v30 action:sel_decreaseIndentation_ propertyList:0];

  uint64_t v31 = (void *)MEMORY[0x263F825E8];
  id v32 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v33 = [v32 localizedStringForKey:@"Increase" value:&stru_26C10E100 table:0];
  uint64_t v34 = [MEMORY[0x263F827E8] systemImageNamed:@"increase.indent"];
  v128 = [v31 commandWithTitle:v33 image:v34 action:sel_increaseIndentation_ propertyList:0];

  objc_msgSend(v129, "setAttributes:", objc_msgSend(v129, "attributes") | 8);
  objc_msgSend(v128, "setAttributes:", objc_msgSend(v128, "attributes") | 8);
  uint64_t v35 = (void *)MEMORY[0x263F82940];
  double v36 = [MEMORY[0x263F086E0] mainBundle];
  id v37 = [v36 localizedStringForKey:@"Indentation" value:&stru_26C10E100 table:0];
  v145[0] = v129;
  v145[1] = v128;
  double v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:2];
  v119 = [v35 menuWithTitle:v37 image:0 identifier:0 options:0 children:v38];

  double v39 = [(ICBaseTextView *)self editorController];
  double v40 = [v39 calculateGraphingController];
  uint64_t v41 = [(ICBaseTextView *)self selectedRange];
  NSRange v122 = objc_msgSend(v40, "insertionDecisionForExpressionsInRange:", v41, v42);

  v127 = [v122 makeMenu];
  double v43 = (void *)MEMORY[0x263F825E8];
  uint64_t v44 = [MEMORY[0x263F086E0] mainBundle];
  double v45 = [v44 localizedStringForKey:@"Convert to Text" value:&stru_26C10E100 table:0];
  v121 = [v43 commandWithTitle:v45 image:0 action:sel_convertToText_ propertyList:0];

  BOOL v46 = (void *)MEMORY[0x263F825E8];
  double v47 = [MEMORY[0x263F086E0] mainBundle];
  double v48 = [v47 localizedStringForKey:@"Convert to Tag" value:&stru_26C10E100 table:0];
  v126 = [v46 commandWithTitle:v48 image:0 action:sel_convertToTag_ propertyList:0];

  id v49 = (void *)MEMORY[0x263F825E8];
  uint64_t v50 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v51 = [v50 localizedStringForKey:@"Add to Tags" value:&stru_26C10E100 table:0];
  uint64_t v120 = [v49 commandWithTitle:v51 image:0 action:sel_addToTags_ propertyList:0];

  uint64_t v52 = (void *)MEMORY[0x263EFF980];
  v144[0] = v121;
  v144[1] = v126;
  v144[2] = v120;
  long long v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:3];
  uint64_t v54 = [v52 arrayWithArray:v53];

  uint64_t v55 = [(ICBaseTextView *)self editorController];
  uint64_t v56 = [v55 note];
  LODWORD(v53) = [v56 isPasswordProtected];

  if (v53) {
    [v54 removeObject:v126];
  }
  if (ICDebugModeEnabled())
  {
    uint64_t v57 = [MEMORY[0x263F825E8] commandWithTitle:@"Tags" image:0 action:sel_openExperimentalHashtagUI_ propertyList:0];
    [v54 addObject:v57];
  }
  if (ICInternalSettingsIsScrubbingEnabled())
  {
    uint64_t v58 = [(ICBaseTextView *)self editorController];
    id v59 = [v58 note];
    if (![v59 isEditable])
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v60 = [(ICBaseTextView *)self editorController];
    double v61 = [v60 note];
    if (![v61 isCalculateMathEnabled])
    {

      goto LABEL_12;
    }
    double v62 = [(ICBaseTextView *)self editorController];
    double v63 = [v62 note];
    if ([v63 isDeletedOrInTrash])
    {

      goto LABEL_12;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_super v95 = [(ICBaseTextView *)self editorController];
      CGRect v96 = [v95 note];
      uint64_t v58 = [v96 calculateDocumentController];

      objc_msgSend(v58, "numberLiteralAtLocation:", -[ICBaseTextView selectedRange](self, "selectedRange"));
      id v59 = (id)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        objc_initWeak(&location, self);
        v97 = (void *)MEMORY[0x263F823D0];
        uint64_t v98 = [MEMORY[0x263F086E0] mainBundle];
        long long v99 = [v98 localizedStringForKey:@"Adjust" value:&stru_26C10E100 table:0];
        v135[0] = MEMORY[0x263EF8330];
        v135[1] = 3221225472;
        v135[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_3;
        v135[3] = &unk_2640BB5F8;
        objc_copyWeak(&v137, &location);
        id v59 = v59;
        id v136 = v59;
        uint64_t v100 = objc_msgSend(v97, "ic_actionWithTitle:handler:", v99, v135);

        long long v101 = (void *)MEMORY[0x263F82940];
        v143 = v100;
        long long v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v143 count:1];
        long long v103 = [v101 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v102];

        [v4 insertSiblingMenu:v103 beforeMenuForIdentifier:*MEMORY[0x263F83868]];
        objc_destroyWeak(&v137);
        objc_destroyWeak(&location);
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  double v64 = (void *)MEMORY[0x263F82940];
  double v65 = (void *)[v54 copy];
  double v66 = [v64 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v65];

  objc_opt_class();
  uint64_t v67 = [(ICBaseTextView *)self textContainer];
  ICDynamicCast();
  uint64_t v116 = (id *)objc_claimAutoreleasedReturnValue();

  if (([(ICBaseTextView *)self ic_isInSecureWindow] & 1) == 0)
  {
    uint64_t v68 = [(ICBaseTextView *)self editorController];
    uint64_t v69 = [v68 note];
    if (([v69 isSharedReadOnly] & 1) != 0
      || [(ICBaseTextView *)self selectionContainsNonLinkAttachment])
    {
    }
    else
    {
      char v93 = [v116 insideSiriSnippet];

      if ((v93 & 1) == 0)
      {
        objc_initWeak(&location, self);
        if ([(ICBaseTextView *)self selectionContainsLink])
        {
          uint64_t v94 = [MEMORY[0x263F086E0] mainBundle];
          [v94 localizedStringForKey:@"Edit Link" value:&stru_26C10E100 table:0];
        }
        else
        {
          uint64_t v94 = [MEMORY[0x263F086E0] mainBundle];
          [v94 localizedStringForKey:@"Add Link" value:&stru_26C10E100 table:0];
        uint64_t v114 = };

        long long v104 = (void *)MEMORY[0x263F823D0];
        v133[0] = MEMORY[0x263EF8330];
        v133[1] = 3221225472;
        v133[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_4;
        v133[3] = &unk_2640B9E88;
        objc_copyWeak(&v134, &location);
        uint64_t v113 = objc_msgSend(v104, "ic_actionWithTitle:handler:", v114, v133);
        CGRect v105 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v113, 0);
        if ([(ICBaseTextView *)self selectionContainsLink])
        {
          id v112 = (void *)MEMORY[0x263F823D0];
          id v106 = [MEMORY[0x263F086E0] mainBundle];
          id v107 = [v106 localizedStringForKey:@"Remove Link" value:&stru_26C10E100 table:0];
          v131[0] = MEMORY[0x263EF8330];
          v131[1] = 3221225472;
          v131[2] = __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_5;
          v131[3] = &unk_2640B9E88;
          objc_copyWeak(&v132, &location);
          CGRect v108 = objc_msgSend(v112, "ic_actionWithTitle:handler:", v107, v131);

          objc_msgSend(v105, "ic_addNonNilObject:", v108);
          objc_destroyWeak(&v132);
        }
        NSRange v109 = (void *)MEMORY[0x263F82940];
        uint64_t v110 = (void *)[v105 copy];
        uint64_t v111 = [v109 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v110];

        [v4 insertSiblingMenu:v111 beforeMenuForIdentifier:*MEMORY[0x263F83868]];
        objc_destroyWeak(&v134);

        objc_destroyWeak(&location);
      }
    }
  }
  if ([(ICBaseTextView *)self ic_isInSecureWindow]) {
    goto LABEL_22;
  }
  uint64_t v70 = [(ICBaseTextView *)self editorController];
  unsigned int v71 = [v70 note];
  if ([v71 isPasswordProtected]) {
    goto LABEL_21;
  }
  CGRect v72 = [(ICBaseTextView *)self editorController];
  unint64_t v73 = [v72 note];
  char v74 = [v73 isSharedReadOnly];

  if ((v74 & 1) == 0)
  {
    double v75 = (void *)MEMORY[0x263F825E8];
    uint64_t v76 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v77 = [v76 localizedStringForKey:@"Attach File" value:&stru_26C10E100 table:0];
    int v78 = objc_msgSend(MEMORY[0x263F827E8], "ic_systemImageNamed:", @"document");
    uint64_t v70 = [v75 commandWithTitle:v77 image:v78 action:sel_attachFile_ propertyList:0];

    uint64_t v79 = (void *)MEMORY[0x263F82940];
    v142 = v70;
    uint64_t v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v142 count:1];
    unsigned int v71 = [v79 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v80];

    [v4 insertSiblingMenu:v71 beforeMenuForIdentifier:*MEMORY[0x263F83868]];
LABEL_21:
  }
LABEL_22:
  uint64_t v81 = [(ICBaseTextView *)self editorController];
  double v82 = [v81 note];
  char v83 = [v82 isSharedReadOnly];

  if ((v83 & 1) == 0) {
    [v4 insertSiblingMenu:v118 afterMenuForIdentifier:*MEMORY[0x263F83868]];
  }
  [v4 insertChildMenu:v119 atEndOfMenuForIdentifier:v115];
  uint64_t v84 = *MEMORY[0x263F83890];
  if (v127) {
    [v4 insertChildMenu:v127 atEndOfMenuForIdentifier:*MEMORY[0x263F83890]];
  }
  [v4 insertChildMenu:v66 atEndOfMenuForIdentifier:v84];
  if (ICInternalSettingsShouldShowImageGenerationUI()
    && ([(ICBaseTextView *)self ic_isInSecureWindow] & 1) == 0)
  {
    double v85 = (void *)MEMORY[0x263F825E8];
    double v86 = [MEMORY[0x263F086E0] mainBundle];
    double v87 = [v86 localizedStringForKey:@"Add to Playground" value:&stru_26C10E100 table:0];
    double v88 = [MEMORY[0x263F827E8] systemImageNamed:@"apple.image.playground"];
    double v89 = [v85 commandWithTitle:v87 image:v88 action:sel_createImage_ propertyList:0];

    uint64_t v90 = (void *)MEMORY[0x263F82940];
    v141 = v89;
    uint64_t v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v141 count:1];
    id v92 = [v90 menuWithTitle:&stru_26C10E100 image:0 identifier:0 options:1 children:v91];

    [v4 insertSiblingMenu:v92 afterMenuForIdentifier:*MEMORY[0x263F83868]];
  }

LABEL_30:
}

uint64_t __39__ICBaseTextView_buildMenuWithBuilder___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

id __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F825E8];
  objc_super v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  Class v5 = [v3 mainBundle];
  double v6 = [v5 localizedStringForKey:@"Strikethrough" value:&stru_26C10E100 table:0];
  uint64_t v7 = [MEMORY[0x263F827E8] systemImageNamed:@"strikethrough"];
  objc_super v8 = [v2 commandWithTitle:v6 image:v7 action:sel_toggleStrikethrough propertyList:0];

  double v9 = [v4 arrayByAddingObject:v8];

  return v9;
}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained editorController];
  objc_super v3 = [v2 calculateScrubberController];
  [v3 showScrubberForNumberLiteral:*(void *)(a1 + 32) isCompact:0];
}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained editorController];
  uint64_t v2 = [v1 auxiliaryResponder];

  if (v2)
  {
    objc_opt_class();
    objc_super v3 = [WeakRetained editorController];
    id v4 = [v3 auxiliaryResponder];
    Class v5 = ICDynamicCast();
  }
  else
  {
    Class v5 = [WeakRetained editorController];
  }
  [v5 openLinkEditor:WeakRetained];
}

void __39__ICBaseTextView_buildMenuWithBuilder___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained editorController];
  if ([v1 conformsToProtocol:&unk_26C161198])
  {
    uint64_t v2 = [WeakRetained editorController];
    char v3 = objc_opt_respondsToSelector();

    id v4 = WeakRetained;
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    Class v5 = [WeakRetained editorController];
    uint64_t v1 = ICProtocolCast();

    [v1 removeLinksFromCurrentSelection];
  }

  id v4 = WeakRetained;
LABEL_5:
}

- (BOOL)selectionContainsLink
{
  char v3 = [(ICBaseTextView *)self textStorage];
  id v4 = objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F81520], -[ICBaseTextView selectedRange](self, "selectedRange"), 0);

  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    double v6 = [(ICBaseTextView *)self textStorage];
    uint64_t v7 = objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], -[ICBaseTextView selectedRange](self, "selectedRange"), 0);

    objc_opt_class();
    objc_super v8 = ICDynamicCast();
    double v9 = [v8 attachmentUTI];
    char v5 = [v9 isEqualToString:*MEMORY[0x263F5AAD8]];
  }
  return v5;
}

- (BOOL)selectionContainsNonLinkAttachment
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  char v3 = [(ICBaseTextView *)self textStorage];
  uint64_t v4 = [(ICBaseTextView *)self selectedRange];
  uint64_t v5 = *MEMORY[0x263F814A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ICBaseTextView_selectionContainsNonLinkAttachment__block_invoke;
  v8[3] = &unk_2640B80C8;
  void v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v8);

  LOBYTE(v3) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __52__ICBaseTextView_selectionContainsNonLinkAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v8 = v11;
  if (v11)
  {
    uint64_t v9 = [v11 attachment];
    uint64_t v10 = v9;
    if (v9 && ([v9 isLinkAttachment] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }

    objc_super v8 = v11;
  }
}

- (void)willPresentWritingTools
{
  char v3 = [(ICBaseTextView *)self editorController];
  uint64_t v4 = [v3 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ICBaseTextView *)self editorController];
    [v6 showStyleSelector:0 animated:0 sender:0];
  }
}

- (void)updateKeyboardSuggestions:(id)a3 hashtagController:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICBaseTextView *)self inputDelegate];
  uint64_t v9 = (void *)v8;
  if (v6)
  {
    char v27 = self;
    char v28 = (void *)v8;
    uint64_t v29 = v7;
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v17 = [v16 displayText];

          if (v17)
          {
            uint64_t v18 = (void *)MEMORY[0x263F5B528];
            double v19 = [v16 displayText];
            id v20 = [v16 displayText];
            char v21 = objc_msgSend(v20, "ic_withHashtagPrefix");
            char v22 = [v18 hashtagTextSuggestionWithIdentifier:v19 displayText:v21];

            [v10 addObject:v22];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__ICBaseTextView_updateKeyboardSuggestions_hashtagController___block_invoke;
    block[3] = &unk_2640B89A8;
    uint64_t v9 = v28;
    id v32 = v28;
    id v33 = v10;
    id v7 = v29;
    id v23 = v29;
    id v34 = v23;
    id v24 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(ICBaseTextView *)v27 setHashtagController:v23];

    id v6 = v30;
  }
  else
  {
    [v7 setIsUpdatingKeyboard:0];
    [(ICBaseTextView *)self setHashtagController:v7];
    unint64_t v25 = [(ICBaseTextView *)self mentionsController];
    char v26 = [v25 isUpdatingKeyboard];

    if ((v26 & 1) == 0) {
      [v9 setSuggestions:0];
    }
  }
}

uint64_t __62__ICBaseTextView_updateKeyboardSuggestions_hashtagController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSuggestions:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 setIsUpdatingKeyboard:1];
}

- (void)updateKeyboardSuggestions:(id)a3 mentionsController:(id)a4 mentionString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((participants) != nil)", "-[ICBaseTextView updateKeyboardSuggestions:mentionsController:mentionString:]", 1, 0, @"Expected non-nil value for '%s'", "participants");
  }
  [(ICBaseTextView *)self setParticipants:v8];
  id v11 = [(ICBaseTextView *)self inputDelegate];
  if (v8 && [v8 count])
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke;
    v26[3] = &__block_descriptor_48_e54___ICThumbnailConfiguration_16__0__CKShareParticipant_8l;
    void v26[4] = 0x403C000000000000;
    void v26[5] = 0x403C000000000000;
    uint64_t v12 = objc_msgSend(v8, "ic_compactMap:", v26);
    objc_initWeak(&location, self);
    uint64_t v13 = [MEMORY[0x263F5B508] sharedThumbnailService];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_2;
    v18[3] = &unk_2640BB668;
    objc_copyWeak(&v24, &location);
    id v19 = v8;
    id v14 = v12;
    id v20 = v14;
    id v21 = v10;
    id v15 = v9;
    id v22 = v15;
    id v23 = v11;
    [v13 thumbnailsWithConfigurations:v14 completion:v18];

    [(ICBaseTextView *)self setMentionsController:v15];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    [v9 setIsUpdatingKeyboard:0];
    [(ICBaseTextView *)self setMentionsController:v9];
    id v16 = [(ICBaseTextView *)self hashtagController];
    char v17 = [v16 isUpdatingKeyboard];

    if ((v17 & 1) == 0) {
      [v11 setSuggestions:0];
    }
  }
}

id __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = (objc_class *)MEMORY[0x263F5B500];
  id v4 = a2;
  id v5 = [v3 alloc];
  v9[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  id v7 = objc_msgSend(v5, "initForAvatarWithParticipants:preferredSize:hasBorder:", v6, 0, *(double *)(a1 + 32), *(double *)(a1 + 40));

  return v7;
}

void __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_3;
  block[3] = &unk_2640BB640;
  objc_copyWeak(&v12, a1 + 9);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  id v10 = v3;
  id v11 = a1[8];
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

uint64_t __77__ICBaseTextView_updateKeyboardSuggestions_mentionsController_mentionString___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v31 = WeakRetained;
    id WeakRetained = [WeakRetained participants];
    id v3 = v31;
    if (WeakRetained)
    {
      uint64_t v4 = *(void *)(v1 + 32);

      id v3 = v31;
      if (v4)
      {
        id v5 = (void *)MEMORY[0x263EFFA08];
        id v6 = [v31 participants];
        id v7 = [v5 setWithArray:v6];

        id v8 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(v1 + 32)];
        if ([v7 isEqualToSet:v8])
        {
          uint64_t v29 = v8;
          id v30 = v7;
          id v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
          if ([*(id *)(v1 + 32) count])
          {
            unint64_t v9 = 0;
            do
            {
              id v10 = [*(id *)(v1 + 32) objectAtIndexedSubscript:v9];
              id v11 = [*(id *)(v1 + 40) objectAtIndexedSubscript:v9];
              id v12 = objc_msgSend(v10, "ic_cachedDisplayNameFromContacts");
              uint64_t v13 = v12;
              if (!v12 || ![v12 length])
              {
                uint64_t v14 = objc_msgSend(v10, "ic_participantName");

                uint64_t v13 = (void *)v14;
              }
              id v15 = objc_msgSend(v10, "ic_participantNameMatchingString:returnFullName:", *(void *)(v1 + 48), 0);
              id v16 = v15;
              if (!v15 || ![v15 length])
              {
                uint64_t v17 = objc_msgSend(v10, "ic_shortParticipantName");

                id v16 = (void *)v17;
              }
              uint64_t v18 = (void *)MEMORY[0x263F5B528];
              id v19 = [*(id *)(v1 + 56) note];
              id v20 = objc_msgSend(v10, "ic_userRecordNameInNote:", v19);
              objc_msgSend(v13, "ic_trimmedString");
              id v21 = v34 = v13;
              id v22 = objc_msgSend(v16, "ic_mentionString");
              long long v35 = v10;
              id v23 = *(void **)(v1 + 64);
              [v11 associatedObjectIdentifier];
              id v33 = v11;
              v25 = uint64_t v24 = v1;
              char v26 = [v23 objectForKeyedSubscript:v25];
              char v27 = [v18 mentionTextSuggestionWithIdentifier:v20 displayText:v21 inputText:v22 image:v26];

              uint64_t v1 = v24;
              [v32 addObject:v27];

              ++v9;
            }
            while (v9 < [*(id *)(v24 + 32) count]);
          }
          [*(id *)(v1 + 72) setSuggestions:v32];
          [*(id *)(v1 + 56) setIsUpdatingKeyboard:1];

          id v8 = v29;
          id v7 = v30;
        }

        id v3 = v31;
      }
    }
  }

  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)showWritingTools:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self icDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICBaseTextView *)self icDelegate];
    [v7 startEditingForWritingTools];
  }
  v8.receiver = self;
  v8.super_class = (Class)ICBaseTextView;
  [(ICBaseTextView *)&v8 showWritingTools:v4];
}

- (void)calculateRecognitionController:(id)a3 didUpdateTextSuggestions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICBaseTextView *)self inputDelegate];
  [v8 setSuggestions:v6];

  [(ICBaseTextView *)self setCalculateRecognitionController:v7];
}

- (void)insertTextSuggestion:(id)a3
{
  id v18 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v4 = ICDynamicCast();
    id v5 = [v4 cellDelegate];
    id v6 = [v5 attachment];
  }
  else
  {
    id v6 = 0;
  }
  objc_opt_class();
  id v7 = ICCheckedDynamicCast();
  id v8 = v7;
  if (v7)
  {
    switch([v7 type])
    {
      case 0:
      case 1:
        unint64_t v9 = [(ICBaseTextView *)self calculateRecognitionController];
        [v9 discardPreviewedResult];
        goto LABEL_13;
      case 2:
        unint64_t v9 = [(ICBaseTextView *)self hashtagController];
        id v10 = [v18 displayText];
        [v9 insertHashtagWithText:v10 viaAutoComplete:1 parentAttachment:v6];
        goto LABEL_9;
      case 3:
        unint64_t v9 = [(ICBaseTextView *)self mentionsController];
        id v10 = [v8 inputText];
        id v11 = [v8 identifier];
        [v9 insertMentionWithText:v10 uuidString:v11 parentAttachment:v6];

LABEL_9:
        goto LABEL_13;
      case 4:
        unint64_t v9 = [(ICBaseTextView *)self calculateRecognitionController];
        uint64_t v12 = [(ICBaseTextView *)self selectedRange];
        uint64_t v13 = v9;
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        goto LABEL_12;
      case 5:
        unint64_t v9 = [(ICBaseTextView *)self calculateRecognitionController];
        uint64_t v12 = [(ICBaseTextView *)self selectedRange];
        uint64_t v13 = v9;
        uint64_t v15 = v17;
        uint64_t v16 = 1;
LABEL_12:
        objc_msgSend(v13, "commitPreviewedResultAtRange:asLiteral:", v12, v15, v16);
LABEL_13:

        break;
      default:
        break;
    }
  }
}

- (void)endHeadingRenameCommittingMarkedText:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  id v5 = [(ICBaseTextView *)self textStorage];
  ICDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if ([v12 isMarkingTextForHeadingRename])
  {
    uint64_t v6 = [(ICBaseTextView *)self ic_markedTextRange];
    uint64_t v8 = v7;
    unint64_t v9 = [(ICBaseTextView *)self markedTextRange];

    if (v9)
    {
      if (v3)
      {
        id v10 = objc_msgSend(v12, "attributedSubstringFromRange:", v6, v8);
        id v11 = [v10 string];
        -[ICBaseTextView setMarkedText:selectedRange:](self, "setMarkedText:selectedRange:", v11, 0x7FFFFFFFFFFFFFFFLL, 0);

        [(ICBaseTextView *)self unmarkText];
      }
      else
      {
        [(ICBaseTextView *)self unmarkText];
        objc_msgSend(v12, "deleteCharactersInRange:", v6, v8);
      }
    }
    [v12 setIsMarkingTextForHeadingRename:0];
  }
}

- (_NSRange)willInsertText:(id)a3
{
  [(ICBaseTextView *)self endHeadingRenameCommittingMarkedText:0];
  objc_opt_class();
  id v4 = [(ICBaseTextView *)self textStorage];
  id v5 = ICDynamicCast();

  [v5 setIsTypingOrMarkingText:1];
  uint64_t v6 = [(ICBaseTextView *)self selectedRange];
  NSUInteger v8 = v7;
  unint64_t v9 = [(ICBaseTextView *)self markedTextRange];

  if (v9)
  {
    uint64_t v6 = [(ICBaseTextView *)self selectedRangeBeforeMarking];
    NSUInteger v8 = v10;
  }
  id v11 = [(ICBaseTextView *)self textController];
  objc_msgSend(v11, "notifyInlineAttachmentsDeletedInRange:ofTextStorage:", v6, v8, v5);

  NSUInteger v12 = v6;
  NSUInteger v13 = v8;
  result.NSUInteger length = v13;
  result.id location = v12;
  return result;
}

- (void)didInsertText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v22 = a3;
  NSUInteger v7 = [(ICBaseTextView *)self textController];
  NSUInteger v8 = [(ICBaseTextView *)self editorController];
  unint64_t v9 = [v8 hashtagController];

  NSUInteger v10 = [(ICBaseTextView *)self editorController];
  id v11 = [v10 mentionsController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    NSUInteger v12 = ICDynamicCast();
    [v9 setHashtagTableKeyboardDelegate:v12];

    objc_opt_class();
    NSUInteger v13 = ICDynamicCast();
    [v11 setMentionsTableKeyboardDelegate:v13];

    objc_opt_class();
    uint64_t v14 = ICDynamicCast();
    uint64_t v15 = [v14 cellDelegate];
    uint64_t v16 = [v15 attachment];

    LOBYTE(v21) = [(ICBaseTextView *)self languageHasSpaces];
    objc_msgSend(v7, "insertedText:replacementRange:inTextView:hashtagController:mentionsController:languageHasSpaces:parentAttachment:", v22, location, length, self, v9, v11, v21, v16);
  }
  else
  {
    objc_opt_class();
    uint64_t v17 = ICDynamicCast();
    [v9 setHashtagKeyboardDelegate:v17];

    objc_opt_class();
    id v18 = ICDynamicCast();
    [v11 setMentionsKeyboardDelegate:v18];

    objc_msgSend(v7, "insertedText:replacementRange:inTextView:languageHasSpaces:", v22, location, length, self, -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces"));
    uint64_t v14 = [(ICBaseTextView *)self editorController];
    uint64_t v16 = [v14 calculateRecognitionController];
    objc_msgSend(v16, "didInsertString:atRange:", v22, location, length);
  }

  objc_opt_class();
  id v19 = [(ICBaseTextView *)self textStorage];
  id v20 = ICDynamicCast();

  [v20 setIsTypingOrMarkingText:0];
  [(ICBaseTextView *)self speakAccessibilityAutoListItemIfNecessaryForInsertedText:v22];
}

- (void)informDelegateOfAnalyticsCalloutBarButtonActionOfType:(int64_t)a3 sender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    NSUInteger v8 = [(ICBaseTextView *)self icDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(ICBaseTextView *)self icDelegate];
      [v10 didInvokeAnalyticsCalloutBarButtonActionOfType:a3];
    }
  }
}

- (void)informDelegateOfPastedAttributedString:(id)a3
{
  id v7 = a3;
  id v4 = [(ICBaseTextView *)self icDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ICBaseTextView *)self icDelegate];
    [v6 didInvokePasteWithAttributedString:v7];
  }
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter && [MEMORY[0x263F5A768] isOptedInForAnalytics])
  {
    id v3 = objc_alloc(MEMORY[0x263F5A768]);
    id v4 = (objc_class *)objc_opt_class();
    char v5 = NSStringFromClass(v4);
    id v6 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v5 view:self];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    NSUInteger v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
  }
  char v9 = self->_eventReporter;

  return v9;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (BOOL)isDraggingChecklistItem
{
  return self->_isDraggingChecklistItem;
}

- (BOOL)isDraggingOverChecklistItem
{
  return self->_isDraggingOverChecklistItem;
}

- (BOOL)inhibitNextDropCursorUpdateAnimation
{
  return self->_inhibitNextDropCursorUpdateAnimation;
}

- (void)setInhibitNextDropCursorUpdateAnimation:(BOOL)a3
{
  self->_inhibitNextDropCursorUpdateAnimation = a3;
}

- (BOOL)touchIsPointer
{
  return self->_touchIsPointer;
}

- (void)setTouchIsPointer:(BOOL)a3
{
  self->_touchIsPointer = a3;
}

- (UISelectionFeedbackGenerator)checklistDragFeedbackGenerator
{
  return self->_checklistDragFeedbackGenerator;
}

- (void)setChecklistDragFeedbackGenerator:(id)a3
{
}

- (ICTrackedParagraph)draggedChecklistTrackedParagraph
{
  return self->_draggedChecklistTrackedParagraph;
}

- (void)setDraggedChecklistTrackedParagraph:(id)a3
{
}

- (ICTrackedParagraph)trackedParagraphCurrentlyUnderDraggedChecklist
{
  return self->_trackedParagraphCurrentlyUnderDraggedChecklist;
}

- (void)setTrackedParagraphCurrentlyUnderDraggedChecklist:(id)a3
{
}

- (BOOL)shouldDropChecklistAbove
{
  return self->_shouldDropChecklistAbove;
}

- (void)setShouldDropChecklistAbove:(BOOL)a3
{
  self->_shouldDropChecklistAbove = a3;
}

- (double)checklistDragVerticalOffset
{
  return self->_checklistDragVerticalOffset;
}

- (void)setChecklistDragVerticalOffset:(double)a3
{
  self->_checklistDragVerticalOffset = a3;
}

- (unint64_t)lastChecklistDropIndex
{
  return self->_lastChecklistDropIndex;
}

- (void)setLastChecklistDropIndex:(unint64_t)a3
{
  self->_lastChecklistDropIndedouble x = a3;
}

- (void)setTempHighlightLayer:(id)a3
{
}

- (CGPoint)hitTestPoint
{
  double x = self->_hitTestPoint.x;
  double y = self->_hitTestPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHitTestPoint:(CGPoint)a3
{
  self->_hitTestPoint = a3;
}

- (NSTextHighlightShapeProvider)highlightShapeProvider
{
  return self->_highlightShapeProvider;
}

- (BOOL)textSelectionHidden
{
  return self->_textSelectionHidden;
}

- (void)setTextSelectionHidden:(BOOL)a3
{
  self->_textSelectionHidden = a3;
}

- (BOOL)isSettingTextStyle
{
  return self->_isSettingTextStyle;
}

- (void)setIsSettingTextStyle:(BOOL)a3
{
  self->_isSettingTextStyle = a3;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setEventReporter:(id)a3
{
}

- (ICHashtagController)hashtagController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagController);

  return (ICHashtagController *)WeakRetained;
}

- (void)setHashtagController:(id)a3
{
}

- (ICMentionsController)mentionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsController);

  return (ICMentionsController *)WeakRetained;
}

- (void)setMentionsController:(id)a3
{
}

- (ICCalculateRecognitionController)calculateRecognitionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calculateRecognitionController);

  return (ICCalculateRecognitionController *)WeakRetained;
}

- (void)setCalculateRecognitionController:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  self->_participants = (NSArray *)a3;
}

- (NSAttributedString)_icaxUnfilteredAttributedString
{
  return self->__icaxUnfilteredAttributedString;
}

- (unint64_t)_icaxModifiedCursorPosition
{
  return self->__icaxModifiedCursorPosition;
}

- (void)set_icaxModifiedCursorPosition:(unint64_t)a3
{
  self->__icaxModifiedCursorPosition = a3;
}

- (_NSRange)_icaxModifiedSelectionRange
{
  p_icaxModifiedSelectionRange = &self->__icaxModifiedSelectionRange;
  NSUInteger location = self->__icaxModifiedSelectionRange.location;
  NSUInteger length = p_icaxModifiedSelectionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)set_icaxModifiedSelectionRange:(_NSRange)a3
{
  self->__icaxModifiedSelectionRange = a3;
}

- (NSAttributedString)_icaxCachedModifiedAttributedString
{
  return self->__icaxCachedModifiedAttributedString;
}

- (void)set_icaxCachedModifiedAttributedString:(id)a3
{
}

- (BOOL)_icaxShouldPreventUpdatingFakeCursorRange
{
  return self->__icaxShouldPreventUpdatingFakeCursorRange;
}

- (void)set_icaxShouldPreventUpdatingFakeCursorRange:(BOOL)a3
{
  self->__icaxShouldPreventUpdatingFakeCursorRange = a3;
}

- (NSArray)_icaxCachedChildrenForReparenting
{
  return self->__icaxCachedChildrenForReparenting;
}

- (void)set_icaxCachedChildrenForReparenting:(id)a3
{
}

- (double)_icaxLastOffsetForBuildingReparentingCache
{
  return self->__icaxLastOffsetForBuildingReparentingCache;
}

- (void)set_icaxLastOffsetForBuildingReparentingCache:(double)a3
{
  self->__icaxLastOffsetForBuildingReparentingCache = a3;
}

- (NSMutableDictionary)_icaxPencilKitAttachmentsDict
{
  return self->__icaxPencilKitAttachmentsDict;
}

- (void)set_icaxPencilKitAttachmentsDict:(id)a3
{
}

- (NSDictionary)cachedTypingAttributes
{
  return self->_cachedTypingAttributes;
}

- (void)setCachedTypingAttributes:(id)a3
{
}

- (void)setPendingTypingAttributes:(id)a3
{
}

- (_NSRange)selectedRangeBeforeMarking
{
  p_selectedRangeBeforeMarking = &self->_selectedRangeBeforeMarking;
  NSUInteger location = self->_selectedRangeBeforeMarking.location;
  NSUInteger length = p_selectedRangeBeforeMarking->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectedRangeBeforeMarking:(_NSRange)a3
{
  self->_selectedRangeBeforeMarking = a3;
}

- (void)setIsInProcessEditingForTextStorage:(BOOL)a3
{
  self->_isInProcessEditingForTextStorage = a3;
}

- (ICBaseTextView)dragTextViewStrongReference
{
  return self->_dragTextViewStrongReference;
}

- (void)setDragTextViewStrongReference:(id)a3
{
}

- (ICBaseTextViewItemProviderPasteSession)itemProviderPasteSession
{
  return self->_itemProviderPasteSession;
}

- (void)setItemProviderPasteSession:(id)a3
{
}

- (NSMutableArray)viewsGhostedForDrag
{
  return self->_viewsGhostedForDrag;
}

- (void)setViewsGhostedForDrag:(id)a3
{
}

- (void)setNeedsStylingRefreshOnNextLayout:(BOOL)a3
{
  self->_needsStylingRefreshOnNextLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsGhostedForDrag, 0);
  objc_storeStrong((id *)&self->_itemProviderPasteSession, 0);
  objc_storeStrong((id *)&self->_dragTextViewStrongReference, 0);
  objc_storeStrong((id *)&self->_pendingTypingAttributes, 0);
  objc_storeStrong((id *)&self->_cachedTypingAttributes, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__icaxPencilKitAttachmentsDict, 0);
  objc_storeStrong((id *)&self->__icaxCachedChildrenForReparenting, 0);
  objc_storeStrong((id *)&self->__icaxCachedModifiedAttributedString, 0);
  objc_storeStrong((id *)&self->__icaxUnfilteredAttributedString, 0);
  objc_destroyWeak((id *)&self->_calculateRecognitionController);
  objc_destroyWeak((id *)&self->_mentionsController);
  objc_destroyWeak((id *)&self->_hashtagController);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_highlightShapeProvider, 0);
  objc_storeStrong((id *)&self->_renderingSurfaceView, 0);
  objc_storeStrong((id *)&self->_tempHighlightLayer, 0);
  objc_storeStrong((id *)&self->_trackedParagraphCurrentlyUnderDraggedChecklist, 0);
  objc_storeStrong((id *)&self->_draggedChecklistTrackedParagraph, 0);
  objc_storeStrong((id *)&self->_checklistDragFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_icDelegate);

  objc_destroyWeak((id *)&self->_editorController);
}

- (void)showRemoveAttachmentAlertIfNecessaryForOperation:(unint64_t)a3 selectedRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v47 = a5;
  BOOL v8 = length == 0;
  BOOL v9 = location != 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v43 = length;
  NSUInteger v44 = location;
  if (v8 && v9) {
    NSUInteger v10 = location - 1;
  }
  else {
    NSUInteger v10 = location;
  }
  if (v8 && v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = length;
  }
  NSUInteger v12 = -[ICBaseTextView attachmentsInRange:](self, "attachmentsInRange:", v10, v11);
  NSUInteger v13 = [MEMORY[0x263EFF980] array];
  id v49 = [MEMORY[0x263EFF980] array];
  double v48 = [MEMORY[0x263EFF980] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v51;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v50 + 1) + 8 * v18);
        if ([v19 attachmentType] == 10
          || [v19 attachmentType] == 13)
        {
          id v20 = v13;
LABEL_15:
          [v20 addObject:v19];
          goto LABEL_16;
        }
        if ([v19 attachmentType] == 4)
        {
          if ([v19 isBeingEditedLocallyOnDevice])
          {
            uint64_t v21 = [v19 audioModel];
            id v22 = [v21 audioDocument];
            char v23 = [v22 isCallRecording];

            if ((v23 & 1) == 0)
            {
              id v20 = v49;
              goto LABEL_15;
            }
          }
        }
        if ([v19 attachmentType] == 4)
        {
          uint64_t v24 = [MEMORY[0x263F5B240] sharedAudioController];
          unint64_t v25 = [v24 currentAttachment];
          if (v25 == v19)
          {
            char v26 = [MEMORY[0x263F5B240] sharedAudioController];
            int v27 = [v26 isPlaying];

            if (v27)
            {
              id v20 = v48;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
LABEL_16:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v28 = [v14 countByEnumeratingWithState:&v50 objects:v54 count:16];
      uint64_t v16 = v28;
    }
    while (v28);
  }

  if (![v49 count])
  {
    id v30 = v48;
    uint64_t v29 = v47;
    if ([v48 count])
    {
      [(ICBaseTextView *)self showRemoveInProgressRecordingAlertWithOperation:a3 type:1 attachments:v48 completionHandler:v47];
      goto LABEL_34;
    }
    if (!a3 && [v13 count])
    {
      if ([v13 count] == 1)
      {
        [(ICBaseTextView *)self selectedRange];
        if (v31 >= 2) {
          uint64_t v32 = 2;
        }
        else {
          uint64_t v32 = 3;
        }
      }
      else
      {
        uint64_t v32 = 4;
      }
      if ((unint64_t)[(ICBaseTextView *)self selectedRange] <= 4)
      {
        id v33 = [(ICBaseTextView *)self textStorage];
        id v34 = [v33 string];
        long long v35 = objc_msgSend(v34, "ic_trimmedString");
        uint64_t v36 = [v35 length];

        BOOL v37 = v36 == 1;
        id v30 = v48;
        if (v37 && [v14 count] == 1)
        {
          long long v38 = [v14 firstObject];
          if ([v38 attachmentType] == 10)
          {

LABEL_50:
            [(ICBaseTextView *)self showDeleteInlineDrawingAlertWithType:v32 attachments:v13 completionHandler:v47];
            goto LABEL_34;
          }
          double v39 = [v14 firstObject];
          int v40 = [v39 attachmentType];

          if (v40 == 13) {
            goto LABEL_50;
          }
        }
      }
      uint64_t v41 = [(ICBaseTextView *)self textStorage];
      uint64_t v42 = [v41 length];

      if (!v44 && v43 == v42) {
        goto LABEL_50;
      }
    }
    (*((void (**)(id, uint64_t))v47 + 2))(v47, 1);
    goto LABEL_34;
  }
  uint64_t v29 = v47;
  [(ICBaseTextView *)self showRemoveInProgressRecordingAlertWithOperation:a3 type:0 attachments:v49 completionHandler:v47];
  id v30 = v48;
LABEL_34:
}

- (void)showDeleteInlineDrawingAlertWithType:(unint64_t)a3 attachments:(id)a4 completionHandler:(id)a5
{
  id v16 = a5;
  id v7 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v8 = [v7 localizedStringForKey:@"Delete Drawing?" value:&stru_26C10E100 table:0];

  BOOL v9 = [MEMORY[0x263F086E0] mainBundle];
  NSUInteger v10 = [v9 localizedStringForKey:@"Delete" value:&stru_26C10E100 table:0];

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 3uLL:
      [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICBaseTextView(DeleteConfirmation) showDeleteInlineDrawingAlertWithType:attachments:completionHandler:]" simulateCrash:1 showAlert:0 format:@"Undefined type in delete drawing alert"];
      goto LABEL_3;
    case 2uLL:
      NSUInteger v12 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v11 = [v12 localizedStringForKey:@"Selection contains a drawing." value:&stru_26C10E100 table:0];

      break;
    case 4uLL:
      NSUInteger v13 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"Delete Drawings?" value:&stru_26C10E100 table:0];

      uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v11 = [v15 localizedStringForKey:@"Selection contains multiple drawings." value:&stru_26C10E100 table:0];

      BOOL v8 = (void *)v14;
      break;
    default:
LABEL_3:
      uint64_t v11 = 0;
      break;
  }
  [(ICBaseTextView *)self showRemoveAttachmentAlertWithTitle:v8 message:v11 primaryActionTitle:v10 completionHandler:v16];
}

- (void)showRemoveInProgressRecordingAlertWithOperation:(unint64_t)a3 type:(unint64_t)a4 attachments:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [a5 firstObject];
  NSUInteger v12 = [v11 audioModel];
  NSUInteger v13 = [v12 audioDocument];
  int v14 = [v13 isCallRecording];

  if (a3 == 2)
  {
    uint64_t v21 = [MEMORY[0x263F086E0] mainBundle];
    id v22 = v21;
    if (v14)
    {
      uint64_t v17 = [v21 localizedStringForKey:@"Stop Call Recording?" value:&stru_26C10E100 table:0];

      uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
      id v19 = v18;
      id v20 = @"Replacing this attachment will stop the recording and remove it from the note.";
      goto LABEL_10;
    }
    uint64_t v17 = [v21 localizedStringForKey:@"Delete Audio Recording?" value:&stru_26C10E100 table:0];

    id v30 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v31 = v30;
    uint64_t v32 = @"Replacing this attachment will stop the recording and remove it from the note.";
    goto LABEL_15;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICBaseTextView(DeleteConfirmation) showRemoveInProgressRecordingAlertWithOperation:type:attachments:completionHandler:]", 1, 0, @"Unexpected ICRemoveAttachmentOperation: %ld", a3);
      uint64_t v17 = 0;
      unint64_t v25 = 0;
      uint64_t v29 = 0;
      goto LABEL_17;
    }
    uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
    id v16 = v15;
    if (v14)
    {
      uint64_t v17 = [v15 localizedStringForKey:@"Stop Call Recording?" value:&stru_26C10E100 table:0];

      uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
      id v19 = v18;
      id v20 = @"Deleting this attachment will stop the recording and remove it from the note.";
      goto LABEL_10;
    }
    uint64_t v17 = [v15 localizedStringForKey:@"Delete Audio Recording?" value:&stru_26C10E100 table:0];

    id v30 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v31 = v30;
    uint64_t v32 = @"Deleting this attachment will stop the recording and remove it from the note.";
LABEL_15:
    unint64_t v25 = [v30 localizedStringForKey:v32 value:&stru_26C10E100 table:0];

    char v26 = [MEMORY[0x263F086E0] mainBundle];
    int v27 = v26;
    uint64_t v28 = @"Delete";
    goto LABEL_16;
  }
  char v23 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v24 = v23;
  if (!v14)
  {
    uint64_t v17 = [v23 localizedStringForKey:@"Cut Audio Recording?" value:&stru_26C10E100 table:0];

    id v33 = [MEMORY[0x263F086E0] mainBundle];
    unint64_t v25 = [v33 localizedStringForKey:@"Cutting this attachment will stop the recording and remove it from the note." value:&stru_26C10E100 table:0];

    char v26 = [MEMORY[0x263F086E0] mainBundle];
    int v27 = v26;
    uint64_t v28 = @"Cut";
    goto LABEL_16;
  }
  uint64_t v17 = [v23 localizedStringForKey:@"Stop Call Recording?" value:&stru_26C10E100 table:0];

  uint64_t v18 = [MEMORY[0x263F086E0] mainBundle];
  id v19 = v18;
  id v20 = @"Cutting this attachment will stop the recording and remove it from the note.";
LABEL_10:
  unint64_t v25 = [v18 localizedStringForKey:v20 value:&stru_26C10E100 table:0];

  char v26 = [MEMORY[0x263F086E0] mainBundle];
  int v27 = v26;
  uint64_t v28 = @"OK";
LABEL_16:
  uint64_t v29 = [v26 localizedStringForKey:v28 value:&stru_26C10E100 table:0];

LABEL_17:
  if (a4 == 1)
  {
    id v34 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v35 = [v34 localizedStringForKey:@"This will stop the audio that’s playing and remove it from the note." value:&stru_26C10E100 table:0];

    unint64_t v25 = (void *)v35;
  }
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke;
  v37[3] = &unk_2640BBE50;
  id v38 = v10;
  id v36 = v10;
  [(ICBaseTextView *)self showRemoveAttachmentAlertWithTitle:v17 message:v25 primaryActionTitle:v29 completionHandler:v37];
}

void __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)MEMORY[0x263F5ABB8];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    void v4[2] = __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke_2;
    v4[3] = &unk_2640BBE28;
    id v5 = *(id *)(a1 + 32);
    char v6 = 1;
    [v2 cancelCurrentAudioRecordingSessionWithCompletionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __121__ICBaseTextView_DeleteConfirmation__showRemoveInProgressRecordingAlertWithOperation_type_attachments_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)showRemoveAttachmentAlertWithTitle:(id)a3 message:(id)a4 primaryActionTitle:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x263F82418];
  id v12 = a5;
  NSUInteger v13 = [v11 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  int v14 = [(ICBaseTextView *)self editorController];
  LOBYTE(a4) = [v14 isEditing];

  uint64_t v15 = (void *)MEMORY[0x263F82400];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  void v31[2] = __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke;
  v31[3] = &unk_2640BBE78;
  id v16 = v10;
  char v33 = (char)a4;
  v31[4] = self;
  id v32 = v16;
  uint64_t v17 = [v15 actionWithTitle:v12 style:2 handler:v31];

  [v13 addAction:v17];
  uint64_t v18 = (void *)MEMORY[0x263F82400];
  id v19 = [MEMORY[0x263F086E0] mainBundle];
  id v20 = [v19 localizedStringForKey:@"Cancel" value:&stru_26C10E100 table:0];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  char v26 = __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_3;
  int v27 = &unk_2640BBE78;
  char v30 = (char)a4;
  uint64_t v28 = self;
  id v29 = v16;
  id v21 = v16;
  id v22 = [v18 actionWithTitle:v20 style:1 handler:&v24];
  objc_msgSend(v13, "addAction:", v22, v24, v25, v26, v27, v28);

  [(ICBaseTextView *)self resignFirstResponder];
  char v23 = [(ICBaseTextView *)self editorController];
  [v23 presentViewController:v13 animated:1 completion:0];
}

uint64_t __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48)) {
    return dispatchMainAfterDelay();
  }
  return result;
}

void __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editorController];
  [v1 setEditing:1];
}

uint64_t __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48)) {
    return dispatchMainAfterDelay();
  }
  return result;
}

void __118__ICBaseTextView_DeleteConfirmation__showRemoveAttachmentAlertWithTitle_message_primaryActionTitle_completionHandler___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editorController];
  [v1 setEditing:1];
}

void __126__ICBaseTextView_DragAndDrop__handleInlineDrawingDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "handleInlineDrawingDropForItemProvider error creating currentDrawing %@", v2, v3, v4, v5, v6);
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Failed to copy PaperKit bundle URL; aborting -- error %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __124__ICBaseTextView_DragAndDrop__handleInlinePaperDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Failed to create link to PaperKit bundle url, falling back to copying -- error: %@", v2, v3, v4, v5, v6);
}

void __126__ICBaseTextView_DragAndDrop__handlePaperDocumentDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_3_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_20BE60000, a2, a3, "Failed to remove temporary file: %@, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __125__ICBaseTextView_DragAndDrop__handleMovieOrAudioDropForItemProvider_atTextPosition_pasteSession_outProgress_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_20BE60000, v0, v1, "Failed to remove temporary file: %@, %@");
}

void __83__ICBaseTextView_DragAndDrop__textPasteConfigurationSupporting_transformPasteItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_20BE60000, v0, v1, "Dropping paste item failed: %@", v2, v3, v4, v5, v6);
}

- (void)TTTextStorage
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 textStorage];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  id v7 = [a1 textStorage];
  int v8 = 138412546;
  BOOL v9 = v6;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Expects textStorage be a ICTTTextStorage %@ %p", (uint8_t *)&v8, 0x16u);
}

@end