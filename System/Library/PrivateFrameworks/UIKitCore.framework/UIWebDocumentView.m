@interface UIWebDocumentView
+ (BOOL)hasLandscapeOrientation;
+ (Class)layerClass;
+ (double)getTimestamp;
+ (id)_createDefaultHighlightView;
+ (id)_sharedHighlightView;
+ (id)standardTextViewPreferences;
+ (void)initialize;
- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3;
- (BOOL)_acceptsFirstResponder;
- (BOOL)_dataDetectionIsActivated;
- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4;
- (BOOL)_handleSingleTapZoomPreClickAtLocation:(CGPoint)a3;
- (BOOL)_insertFragmentWithoutPreservingStyle:(id)a3 atDestination:(id)a4 smartReplace:(BOOL)a5 collapseToEnd:(BOOL)a6;
- (BOOL)_interactionShouldBeginFromPreviewItemController:(id)a3 forPosition:(CGPoint)a4;
- (BOOL)_isDisplayingLookupViewController;
- (BOOL)_isDisplayingReferenceLibraryViewController;
- (BOOL)_isDisplayingShareViewController;
- (BOOL)_isDisplayingShortcutViewController;
- (BOOL)_isDisplayingTranslateViewController;
- (BOOL)_isInspectorSearchingForNode;
- (BOOL)_isSubviewOfPlugInView:(id)a3;
- (BOOL)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_previewAllowedForPosition:(CGPoint)a3;
- (BOOL)_restoreFirstResponder;
- (BOOL)_shouldFlattenContentLayersForRect:(CGRect)a3;
- (BOOL)_shouldPaste;
- (BOOL)_shouldResetForNewPage;
- (BOOL)_shouldUpdateSubviewCachesForPlugins;
- (BOOL)_textPlaceholderHasBeenRemoved;
- (BOOL)alwaysConstrainsScale;
- (BOOL)becomeFirstResponder;
- (BOOL)becomesEditableWithGestures;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)clearWKFirstResponder;
- (BOOL)considerHeightForDoubleTap;
- (BOOL)detectsPhoneNumbers;
- (BOOL)didFirstVisuallyNonEmptyLayout;
- (BOOL)doubleTapRectIsReplaced;
- (BOOL)dragInteractionEnabled;
- (BOOL)fragmentContainsRichContent:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleKeyAppCommandForCurrentEvent;
- (BOOL)handleKeyTextCommandForCurrentEvent;
- (BOOL)hasBodyElement;
- (BOOL)hasContent;
- (BOOL)hasDrawnTiles;
- (BOOL)hasEditableSelection;
- (BOOL)hasMarkedText;
- (BOOL)hasPlugInSubviews;
- (BOOL)hasRangedSelection;
- (BOOL)hasRichlyEditableSelection;
- (BOOL)hasSelection;
- (BOOL)inPopover;
- (BOOL)isCaretInEmptyParagraph;
- (BOOL)isClassicViewportMode;
- (BOOL)isDoubleTapEnabled;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isEditingSingleLineElement;
- (BOOL)isInInteraction;
- (BOOL)isInPrintMode;
- (BOOL)isInsideRichlyEditableTextWidget;
- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)isPreviewing;
- (BOOL)isShowingFullScreenPlugInUI;
- (BOOL)isStandaloneEditableView;
- (BOOL)isWidgetEditingView;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)loadsSynchronously;
- (BOOL)makeWKFirstResponder;
- (BOOL)mediaPlaybackAllowsAirPlay;
- (BOOL)mouseEventsChangeSelection;
- (BOOL)needsScrollNotifications;
- (BOOL)performTwoStepDrop:(id)a3 atDestination:(id)a4 isMove:(BOOL)a5;
- (BOOL)performsTwoStepPaste:(id)a3;
- (BOOL)playsNicelyWithGestures;
- (BOOL)requiresKeyEvents;
- (BOOL)resignFirstResponder;
- (BOOL)selectionAtDocumentStart;
- (BOOL)selectionAtWordStart;
- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4;
- (BOOL)shouldAutoscroll;
- (BOOL)shouldIgnoreCustomViewport;
- (BOOL)shouldOnlyRecognizeGesturesOnActiveElements;
- (BOOL)shouldRevealCurrentSelectionAfterInsertion;
- (BOOL)shouldSelectionAssistantReceiveDoubleTapAtPoint:(CGPoint)a3 forScale:(double)a4;
- (BOOL)shouldSuppressPasswordEcho;
- (BOOL)sizeUpdatesSuspended;
- (BOOL)startActionSheet;
- (BOOL)supportsTwoFingerScrollingAtTouchLocation:(CGPoint)a3 andLocation:(CGPoint)a4;
- (BOOL)suppressesIncrementalRendering;
- (BOOL)updateKeyboardStateOnResponderChanges;
- (BOOL)updatesScrollView;
- (BOOL)wantsMinimalUI;
- (BOOL)webView:(id)a3 shouldScrollToPoint:(CGPoint)a4 forFrame:(id)a5;
- (BOOL)willInteractWithLocation:(CGPoint)a3;
- (CGImage)newSnapshotWithRect:(CGRect)a3;
- (CGPoint)autoscrollContentOffset;
- (CGPoint)constrainedPoint:(CGPoint)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromFrame:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toFrame:(id)a4;
- (CGPoint)convertPointToSelectedFrameCoordinates:(CGPoint)a3;
- (CGPoint)interactionLocation;
- (CGPoint)lastGlobalPosition;
- (CGRect)_adjustedLayoutRectForFixedPositionObjects;
- (CGRect)_documentViewVisibleRect;
- (CGRect)_lastRectForRange:(id)a3;
- (CGRect)_layoutRectForFixedPositionObjects;
- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (CGRect)_selectionClipRect;
- (CGRect)_shortcutPresentationRect;
- (CGRect)autoscrollContentFrame;
- (CGRect)autoscrollDragFrame;
- (CGRect)caretRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)caretRectForVisiblePosition:(id)a3;
- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3;
- (CGRect)computeRectForElement:(id)a3 withHighligh:(id)a4 isInverted:(BOOL)a5;
- (CGRect)contentFrameForView:(id)a3;
- (CGRect)convertRect:(CGRect)a3 fromFrame:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toFrame:(id)a4;
- (CGRect)convertRectFromSelectedFrameCoordinates:(CGRect)a3;
- (CGRect)convertRectWithDocumentScale:(CGRect)a3;
- (CGRect)currentDragCaretRect;
- (CGRect)documentBounds;
- (CGRect)doubleTapRect;
- (CGRect)exposedScrollViewRect;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForDictationResultPlaceholder:(id)a3;
- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3;
- (CGRect)presentationRectInHostViewForSheet:(id)a3;
- (CGRect)rectOfInterestForPoint:(CGPoint)a3;
- (CGRect)visibleBounds;
- (CGRect)visibleContentFrame;
- (CGRect)visibleContentRect;
- (CGRect)visibleFrame;
- (CGRect)webViewFrameForUIFrame:(CGRect)a3;
- (CGSize)_sizeForDictationResultPlaceholder;
- (DOMRange)rangeToRestoreAfterDictation;
- (NSDictionary)markedTextStyle;
- (NSString)draggedLinkTitle;
- (NSURL)draggedLinkURL;
- (SEL)_actionForLongPressOnElement:(id)a3;
- (UIColor)insertionPointColor;
- (UIDragInteraction)dragInteraction;
- (UIDropInteraction)dropInteraction;
- (UIEdgeInsets)caretInsets;
- (UITextInputDelegate)inputDelegate;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)initialDropSnapshotView;
- (UIWebDocumentView)initWithFrame:(CGRect)a3;
- (UIWebDocumentView)initWithWebView:(id)a3 frame:(CGRect)a4;
- (UIWebDraggingDelegate)webDraggingDelegate;
- (_NSRange)selectionRange;
- (double)_zoomedDocumentScale;
- (double)currentDocumentScale;
- (double)maximumDoubleTapScale;
- (double)minimumScaleForSize:(CGSize)a3;
- (float)_documentScale;
- (float)initialScale;
- (float)maximumScale;
- (float)minimumScale;
- (float)minimumScaleForMinimumSize:(CGSize)a3;
- (id)_beginPrintModeForHTMLView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8;
- (id)_beginPrintModeForPDFView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7;
- (id)_collectAdditionalSubviews;
- (id)_dataForPreviewItemController:(id)a3 atPosition:(CGPoint)a4 type:(int64_t *)a5;
- (id)_documentUrl;
- (id)_doubleTapGestureRecognizer;
- (id)_focusedOrMainFrame;
- (id)_groupName;
- (id)_insertTextPlaceholderWithSize:(CGSize)a3;
- (id)_parentTextView;
- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6;
- (id)_presentationRectsForPreview;
- (id)_presentationRectsForPreviewItemController:(id)a3;
- (id)_presentationSnapshotForPreview;
- (id)_presentationSnapshotForPreviewItemController:(id)a3;
- (id)_presentedViewControllerForPreviewItemController:(id)a3;
- (id)_responderForBecomeFirstResponder;
- (id)_supportedPasteboardTypesForCurrentSelection;
- (id)_targetURL;
- (id)_textSelectingContainer;
- (id)approximateNodeAtViewportLocation:(CGPoint *)a3;
- (id)automaticallySelectedOverlay;
- (id)beginPrintModeForFrame:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8;
- (id)beginPrintModeForFrame:(id)a3 withWidth:(double)a4 height:(double)a5 startOffset:(double)a6 shrinkToFit:(BOOL)a7 tileClippedContent:(BOOL)a8;
- (id)beginPrintModeWithSize:(CGSize)a3 startOffset:(double)a4 minimumLayoutWidth:(double)a5 maximumLayoutWidth:(double)a6 tileClippedContent:(BOOL)a7;
- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 forFrame:(id)a7;
- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 tileClippedContent:(BOOL)a7 forFrame:(id)a8;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)checkSpellingOfString:(id)a3;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)deepestNodeAtViewportLocation:(CGPoint)a3;
- (id)delegate;
- (id)dictationInterpretations;
- (id)dictationResultMetadataForRange:(id)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)editDragPreviewForTextIndicator:(id)a3;
- (id)fallbackDropPreviewForUninsertedContent:(id)a3;
- (id)fontForCaretSelection;
- (id)formElement;
- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)interactionDelegate;
- (id)interactionElement;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)newMouseEvent:(int)a3;
- (id)positionAtStartOrEndOfWord:(id)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeByExtendingCurrentSelection:(int)a3;
- (id)rangeByMovingCurrentSelection:(int)a3;
- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5;
- (id)rangeOfEnclosingWord:(id)a3;
- (id)readDataFromPasteboard:(id)a3 withIndex:(int64_t)a4;
- (id)rectsForNSRange:(_NSRange)a3;
- (id)selectedDOMRange;
- (id)selectionRects;
- (id)selectionRectsForDOMRange:(id)a3;
- (id)selectionRectsForRange:(id)a3;
- (id)standaloneEditingElement;
- (id)subviews;
- (id)superviewForSheet;
- (id)supportedPasteboardTypesForCurrentSelection;
- (id)targetedDragPreviewFromCurrentTextIndicatorData;
- (id)text;
- (id)textColorForCaretSelection;
- (id)textFormElement;
- (id)textInDOMRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textInputTraits;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (id)undoManagerForWebView:(id)a3;
- (id)webView;
- (id)webView:(id)a3 plugInViewWithArguments:(id)a4 fromPlugInPackage:(id)a5;
- (id)webVisiblePositionForPoint:(CGPoint)a3;
- (id)wordAtPoint:(CGPoint)a3;
- (int)deviceOrientation;
- (int)documentType;
- (int)selectionState;
- (int)wordOffsetInRange:(id)a3;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)getPasteboardChangeCount;
- (int64_t)getPasteboardItemsCount;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)selectionAffinity;
- (int64_t)selectionBaseWritingDirection;
- (int64_t)selectionGranularity;
- (unint64_t)currentDragSourceAction;
- (unint64_t)dataDetectorTypes;
- (unint64_t)effectiveDataDetectorTypes;
- (unint64_t)offsetInMarkedTextForSelection:(id)a3;
- (unint64_t)renderTreeSize;
- (unint64_t)renderTreeSizeThresholdForReset;
- (unsigned)_contentSizeInExposedRect:(CGRect)a3 topLayer:(id)a4 visibleLayerCount:(int *)a5;
- (unsigned)characterAfterCaretSelection;
- (unsigned)characterInRelationToCaretSelection:(int)a3;
- (void)_WAKViewSizeDidChange:(id)a3;
- (void)_addShortcut:(id)a3;
- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4;
- (void)_applyViewportArguments:(id)a3;
- (void)_cancelLongPressGestureRecognizer;
- (void)_cleanUpFrameStateAndLoad:(id)a3;
- (void)_cleanupSheet;
- (void)_clearDoubleTapRect;
- (void)_clearPreviewRevealInformation;
- (void)_collectPreviewRevealInformationIfNeeded;
- (void)_createIOSurfaceFromRect:(CGRect)a3;
- (void)_createSheetWithElementActions:(id)a3 showLinkTitle:(BOOL)a4;
- (void)_define:(id)a3;
- (void)_didChangeDragCaretRectFromRect:(CGRect)a3 toRect:(CGRect)a4;
- (void)_didDismissElementSheet;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_didScroll;
- (void)_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_doubleTapRecognized:(id)a3;
- (void)_drawPDFPagesForPage:(unint64_t)a3 withPaginationInfo:(id)a4;
- (void)_editableSelectionLayoutChangedByScrolling:(BOOL)a3;
- (void)_endPrintMode;
- (void)_finishedUsingTextPlaceholder;
- (void)_flattenAndSwapContentLayersInRect:(CGRect)a3;
- (void)_focusAndAssistFormNode:(id)a3;
- (void)_handleDoubleTapAtLocation:(CGPoint)a3;
- (void)_handleSingleTapZoomPostClickAtLocation:(CGPoint)a3;
- (void)_handleTwoFingerDoubleTapAtLocation:(CGPoint)a3;
- (void)_highlightLongPressRecognized:(id)a3;
- (void)_insertAttributedTextWithoutClosingTyping:(id)a3;
- (void)_inspectorDidStartSearchingForNode:(id)a3;
- (void)_inspectorDidStopSearchingForNode:(id)a3;
- (void)_interactionStartedFromPreviewItemController:(id)a3;
- (void)_interactionStoppedFromPreviewItemController:(id)a3;
- (void)_longPressRecognized:(id)a3;
- (void)_notifyContentHostingLayersOfScaleChange;
- (void)_notifyPlugInViewsOfDidEndZooming;
- (void)_notifyPlugInViewsOfDidZoom;
- (void)_notifyPlugInViewsOfScaleChange;
- (void)_notifyPlugInViewsOfWillBeginZooming;
- (void)_previewItemController:(id)a3 commitPreview:(id)a4;
- (void)_previewItemController:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5;
- (void)_previewItemController:(id)a3 willPresentPreview:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6;
- (void)_promptForReplace:(id)a3;
- (void)_registerPreview;
- (void)_removeDefinitionController:(BOOL)a3;
- (void)_removeShareController:(BOOL)a3;
- (void)_removeShortcutController:(BOOL)a3;
- (void)_removeTextPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)_renderUnbufferedInContext:(CGContext *)a3;
- (void)_resetForNewPage;
- (void)_resetInteractionWithLocation:(CGPoint)a3 modifierFlags:(int64_t)a4;
- (void)_reshapePlugInViews;
- (void)_restoreFlattenedContentLayers;
- (void)_restoreScrollPointForce:(BOOL)a3;
- (void)_restoreViewportSettingsWithSize:(CGSize)a3;
- (void)_runLoadBlock:(id)a3;
- (void)_saveStateToHistoryItem:(id)a3;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)_selectPositionAtPoint:(CGPoint)a3;
- (void)_selectionLayoutChangedByScrolling:(BOOL)a3;
- (void)_sendMouseMoveAndAttemptClick:(id)a3;
- (void)_setAcceptsFirstResponder:(BOOL)a3;
- (void)_setDocumentScale:(float)a3;
- (void)_setDocumentType:(int)a3;
- (void)_setDocumentType:(int)a3 overrideCustomConfigurations:(BOOL)a4 viewportArguments:(id)a5;
- (void)_setFont:(id)a3;
- (void)_setParentTextView:(id)a3;
- (void)_setSubviewCachesNeedUpdate:(BOOL)a3;
- (void)_setTextColor:(id)a3;
- (void)_share:(id)a3;
- (void)_shareElement:(id)a3 withURL:(id)a4;
- (void)_shareText:(id)a3 fromRect:(CGRect)a4;
- (void)_showDataDetectorsSheet;
- (void)_showImageSheet;
- (void)_showLinkSheet;
- (void)_showPendingContentLayers;
- (void)_singleTapRecognized:(id)a3;
- (void)_transitionDragPreviewToImageIfNecessary:(id)a3;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_twoFingerDoubleTapRecognized:(id)a3;
- (void)_twoFingerPanRecognized:(id)a3;
- (void)_undoManagerDidRedo:(id)a3;
- (void)_undoManagerDidUndo:(id)a3;
- (void)_unregisterPreview;
- (void)_updateFixedPositionContent;
- (void)_updateFixedPositionedObjectsLayoutRectUsingWebThread:(BOOL)a3 synchronize:(BOOL)a4;
- (void)_updateFixedPositioningObjectsLayoutAfterScroll;
- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange;
- (void)_updateFixedPositioningObjectsLayoutDuringScroll;
- (void)_updateScrollViewBoundaryZoomScales;
- (void)_updateSize;
- (void)_updateSubviewCaches;
- (void)_updateWebKitExposedScrollViewRect;
- (void)_webthread_webView:(id)a3 attachRootLayer:(id)a4;
- (void)actionDidFinish;
- (void)addInputString:(id)a3;
- (void)addInputString:(id)a3 withFlags:(unint64_t)a4;
- (void)assistFormNode:(id)a3;
- (void)attemptClick:(id)a3;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginSelectionChange;
- (void)cancelAutoscroll;
- (void)cancelInteraction;
- (void)cancelInteractionWithImmediateDisplay:(BOOL)a3;
- (void)clearInteractionTimer;
- (void)clearMarkedText;
- (void)clearRangedSelectionInitialExtent;
- (void)clearSelection;
- (void)collapseSelection;
- (void)completeInteraction;
- (void)computeClientAndGlobalPointsForSession:(id)a3 outClientPoint:(CGPoint *)a4 outGlobalPoint:(CGPoint *)a5;
- (void)confirmMarkedText:(id)a3;
- (void)continueInteractionWithLocation:(CGPoint)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)deferInteraction;
- (void)deferredBecomeFirstResponder;
- (void)deleteBackward;
- (void)deleteFromInput;
- (void)deleteFromInputWithFlags:(unint64_t)a3;
- (void)didEndScroll;
- (void)didEndZoom;
- (void)didRemovePlugInView:(id)a3;
- (void)didRotateInteractionSheet;
- (void)didZoom;
- (void)disableClearsOnInsertion;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)drawPage:(unint64_t)a3 withPaginationInfo:(id)a4;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)endFloatingCursor;
- (void)endPrintMode;
- (void)endSelectionChange;
- (void)ensureSelection;
- (void)extendCurrentSelection:(int)a3;
- (void)fileUploadPanelDidDismiss:(id)a3;
- (void)forceLayout;
- (void)forwardInvocation:(id)a3;
- (void)handleKeyWebEvent:(id)a3;
- (void)hideTapHighlight;
- (void)highlightApproximateNodeAndDisplayInfoSheet;
- (void)highlightApproximateNodeInverted:(BOOL)a3;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)insertText:(id)a3;
- (void)installGestureRecognizers;
- (void)keyboardInputChangedSelection:(id)a3;
- (void)layoutSubviews;
- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6;
- (void)loadHTMLString:(id)a3 baseURL:(id)a4;
- (void)loadRequest:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)performClick:(id)a3;
- (void)performInteractionSelector:(SEL)a3 afterDelay:(double)a4;
- (void)redrawScaledDocument;
- (void)releasePrintMode;
- (void)removeTextPlaceholder:(id)a3;
- (void)replace:(id)a3;
- (void)replaceCurrentWordWithText:(id)a3;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5;
- (void)resetCurrentDragInformation;
- (void)resetInteraction;
- (void)resetSelectionAssistant;
- (void)resetTilingAfterLoadComplete;
- (void)revealedSelectionByScrollingWebFrame:(id)a3;
- (void)saveStateToCurrentHistoryItem;
- (void)scrollViewWasRemoved;
- (void)select:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)selectWord;
- (void)selectionChanged;
- (void)selectionChanged:(id)a3;
- (void)sendOrientationEventForOrientation:(int64_t)a3;
- (void)sendScrollEventIfNecessary;
- (void)sendScrollEventIfNecessaryWasUserScroll:(BOOL)a3;
- (void)sendScrollWheelEvents;
- (void)setAllowsDataDetectorsSheet:(BOOL)a3;
- (void)setAllowsImageSheet:(BOOL)a3;
- (void)setAllowsLinkSheet:(BOOL)a3;
- (void)setAllowsShrinkToFit:(BOOL)a3 forDocumentTypes:(int)a4;
- (void)setAllowsUserScaling:(BOOL)a3 forDocumentTypes:(int)a4;
- (void)setAlwaysConstrainsScale:(BOOL)a3;
- (void)setAutoresizes:(BOOL)a3;
- (void)setAutoscrollContentOffset:(CGPoint)a3;
- (void)setAvoidsUnsafeArea:(BOOL)a3 forDocumentTypes:(int)a4;
- (void)setBaseWritingDirection:(int64_t)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBottomBufferHeight:(double)a3;
- (void)setCaretChangeListener:(id)a3;
- (void)setCaretInsets:(UIEdgeInsets)a3;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setCurrentDragCaretRect:(CGRect)a3;
- (void)setCurrentDragSourceAction:(unint64_t)a3;
- (void)setDataDetectorTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDetectsPhoneNumbers:(BOOL)a3;
- (void)setDoubleTapEnabled:(BOOL)a3;
- (void)setDragInteraction:(id)a3;
- (void)setDragInteractionEnabled:(BOOL)a3;
- (void)setDraggedLinkTitle:(id)a3;
- (void)setDraggedLinkURL:(id)a3;
- (void)setDrawsBackground:(BOOL)a3;
- (void)setDropInteraction:(id)a3;
- (void)setExposedScrollViewRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoresFocusingMouse:(BOOL)a3;
- (void)setIgnoresKeyEvents:(BOOL)a3;
- (void)setIgnoresViewportOverflowWhenAutoresizing:(BOOL)a3;
- (void)setInitialDropSnapshotView:(id)a3;
- (void)setInitialScale:(float)a3 forDocumentTypes:(int)a4;
- (void)setInputDelegate:(id)a3;
- (void)setInteractionAssistantGestureRecognizers;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsStandaloneEditableView:(BOOL)a3;
- (void)setIsWidgetEditingView:(BOOL)a3;
- (void)setLastGlobalPosition:(CGPoint)a3;
- (void)setLoadsSynchronously:(BOOL)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMaximumScale:(float)a3 forDocumentTypes:(int)a4;
- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3;
- (void)setMinimumScale:(float)a3 forDocumentTypes:(int)a4;
- (void)setMinimumSize:(CGSize)a3;
- (void)setMinimumSize:(CGSize)a3 updateCurrentViewportConfigurationSize:(BOOL)a4;
- (void)setOpaque:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3 withEvents:(BOOL)a4;
- (void)setRangeToRestoreAfterDictation:(id)a3;
- (void)setRangedSelectionBaseToCurrentSelection;
- (void)setRangedSelectionBaseToCurrentSelectionEnd;
- (void)setRangedSelectionBaseToCurrentSelectionStart;
- (void)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5;
- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd;
- (void)setRangedSelectionInitialExtentToCurrentSelectionStart;
- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3;
- (void)setRenderTreeSizeThresholdForReset:(unint64_t)a3;
- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4;
- (void)setSelectedDOMRange:(id)a3 affinityDownstream:(BOOL)a4;
- (void)setSelectedTextRange:(id)a3;
- (void)setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
- (void)setSelectionGranularity:(int64_t)a3;
- (void)setSelectionToEnd;
- (void)setSelectionToStart;
- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4;
- (void)setSelectionWithPoint:(CGPoint)a3;
- (void)setShouldAutoscroll:(BOOL)a3;
- (void)setShouldIgnoreCustomViewport:(BOOL)a3;
- (void)setShouldOnlyRecognizeGesturesOnActiveElements:(BOOL)a3;
- (void)setSizeUpdatesSuspended:(BOOL)a3;
- (void)setSmoothsFonts:(BOOL)a3;
- (void)setStandaloneEditingElement:(id)a3;
- (void)setSuppressesIncrementalRendering:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTileUpdatesDisabled:(BOOL)a3;
- (void)setTilingArea:(int)a3;
- (void)setUpdatesScrollView:(BOOL)a3;
- (void)setUserStyleSheet:(id)a3;
- (void)setViewportSize:(CGSize)a3 forDocumentTypes:(int)a4;
- (void)setWebDraggingDelegate:(id)a3;
- (void)showPlaybackTargetPicker:(BOOL)a3 fromRect:(CGRect)a4;
- (void)smartExtendRangedSelection:(int)a3;
- (void)startAutoscroll:(CGPoint)a3;
- (void)startInteractionWithLocation:(CGPoint)a3;
- (void)stopLoading:(id)a3;
- (void)takeTraitsFrom:(id)a3;
- (void)tapInteractionWithLocation:(CGPoint)a3;
- (void)toggleBaseWritingDirection;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)unmarkText;
- (void)updateDragCaretIfPossible;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)updateInteractionElements;
- (void)validateInteractionWithLocation:(CGPoint)a3;
- (void)viewportHandler:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4;
- (void)viewportHandler:(id)a3 didChangeViewportSize:(CGSize)a4;
- (void)viewportHandlerDidChangeScales:(id)a3;
- (void)webThreadWebViewDidLayout:(id)a3 byScrolling:(BOOL)a4;
- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4;
- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4;
- (void)webView:(id)a3 didHideFullScreenForPlugInView:(id)a4;
- (void)webView:(id)a3 didObserveDeferredContentChange:(int)a4 forFrame:(id)a5;
- (void)webView:(id)a3 didReceiveViewportArguments:(id)a4;
- (void)webView:(id)a3 needsScrollNotifications:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 restoreStateFromHistoryItem:(id)a4 forFrame:(id)a5 force:(BOOL)a6;
- (void)webView:(id)a3 runOpenPanelForFileButtonWithResultListener:(id)a4 configuration:(id)a5;
- (void)webView:(id)a3 saveStateToHistoryItem:(id)a4 forFrame:(id)a5;
- (void)webView:(id)a3 willAddPlugInView:(id)a4;
- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4;
- (void)webViewDidCommitCompositingLayerChanges:(id)a3;
- (void)webViewDidDrawTiles:(id)a3;
- (void)webViewDidEndOverflowScroll:(id)a3;
- (void)webViewDidReceiveMobileDocType:(id)a3;
- (void)webViewDidRestoreFromPageCache:(id)a3;
- (void)webViewDidStartOverflowScroll:(id)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
- (void)willRotateInteractionSheet;
- (void)willStartScroll;
- (void)willStartScrollToTop;
- (void)willStartZoom;
- (void)willZoomToLocation:(CGPoint)a3 atScale:(double)a4 forDuration:(double)a5;
- (void)writeDataToPasteboard:(id)a3;
@end

@implementation UIWebDocumentView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (double)getTimestamp
{
  return (double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UIApplicationLoadWebKit();
    +[UIWebPDFView setAsPDFDocRepAndView];
    v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v3 = [v2 BOOLForKey:@"WebKitSingleTapModeEnabled"];
    kSingleTapInteractionsEnabled = v3;
    if (v3) {
      kSingleTapInteractionsHeuristic = [v2 integerForKey:@"WebKitSingleTapModeHeuristic"];
    }
  }
}

- (void)_restoreViewportSettingsWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  LODWORD(a3.width) = 1.0;
  [(UIWebDocumentView *)self setInitialScale:0xFFFFFFLL forDocumentTypes:a3.width];
  LODWORD(v6) = -1.0;
  [(UIWebDocumentView *)self setInitialScale:1 forDocumentTypes:v6];
  LODWORD(v7) = -1.0;
  [(UIWebDocumentView *)self setInitialScale:2 forDocumentTypes:v7];
  LODWORD(v8) = -1.0;
  [(UIWebDocumentView *)self setInitialScale:4 forDocumentTypes:v8];
  LODWORD(v9) = 0.25;
  [(UIWebDocumentView *)self setMinimumScale:0xFFFFFFLL forDocumentTypes:v9];
  LODWORD(v10) = 1.0;
  [(UIWebDocumentView *)self setMinimumScale:8 forDocumentTypes:v10];
  LODWORD(v11) = 1058642330;
  [(UIWebDocumentView *)self setMinimumScale:16 forDocumentTypes:v11];
  LODWORD(v12) = 1074580685;
  [(UIWebDocumentView *)self setMaximumScale:0xFFFFFFLL forDocumentTypes:v12];
  LODWORD(v13) = 5.0;
  [(UIWebDocumentView *)self setMaximumScale:1 forDocumentTypes:v13];
  [(UIWebDocumentView *)self setAllowsUserScaling:1 forDocumentTypes:0xFFFFFFLL];
  [(UIWebDocumentView *)self setAllowsShrinkToFit:1 forDocumentTypes:16];
  [(UIWebDocumentView *)self setAvoidsUnsafeArea:1 forDocumentTypes:0xFFFFFFLL];
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 1, 320.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 2, width, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 4, 500.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 8, -1.0, -1.0);
  -[UIWebDocumentView setViewportSize:forDocumentTypes:](self, "setViewportSize:forDocumentTypes:", 16, width / 0.6, height / 0.6);
}

- (CGRect)webViewFrameForUIFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    objc_msgSend(-[UIView _screen](self, "_screen"), "_referenceBounds");
    CGFloat width = v8;
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    CGFloat height = v8;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)initSimpleHTMLDocumentWithStyle:(id)a3 frame:(CGRect)a4 preferences:(id)a5 groupName:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  WebThreadLock();
  -[UIWebDocumentView webViewFrameForUIFrame:](self, "webViewFrameForUIFrame:", 0.0, 0.0, width, height);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB6E08]), "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:", a3, a5, a6, v14, v15, v16, v17);
  v19 = -[UIWebDocumentView initWithWebView:frame:](self, "initWithWebView:frame:", v18, x, y, width, height);

  return v19;
}

- (UIWebDocumentView)initWithFrame:(CGRect)a3
{
  return -[UIWebDocumentView initWithWebView:frame:](self, "initWithWebView:frame:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIWebDocumentView)initWithWebView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  WebThreadLock();
  -[UIWebDocumentView webViewFrameForUIFrame:](self, "webViewFrameForUIFrame:", 0.0, 0.0, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v28.receiver = self;
  v28.super_class = (Class)UIWebDocumentView;
  v18 = -[UIWebTiledView initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v18)
  {
    if (a3)
    {
      id v19 = a3;
      *((void *)v18 + 54) = v19;
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
      char v20 = v18[956] & 0xDF;
    }
    else
    {
      *((void *)v18 + 54) = objc_msgSend(objc_alloc(MEMORY[0x1E4FB6E08]), "initWithFrame:", v11, v13, v15, v17);
      char v20 = v18[956] | 0x20;
    }
    v18[956] = v20;
    [*((id *)v18 + 54) _setUIKitDelegate:v18];
    [*((id *)v18 + 54) setEditingDelegate:v18];
    [*((id *)v18 + 51) setContentView:*((void *)v18 + 54)];
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v18 + 1464) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v18 + 1480) = v21;
    v22 = objc_alloc_init(_UIWebViewportHandler);
    *((void *)v18 + 110) = v22;
    [(_UIWebViewportHandler *)v22 setDelegate:v18];
    *((_DWORD *)v18 + 223) = 1065353216;
    v18[850] = 1;
    *((void *)v18 + 118) = 0;
    v18[849] = 1;
    v18[851] = 1;
    [v18 installGestureRecognizers];
    v23 = (void *)[v18 textInputTraits];
    [v23 setAutocapitalizationType:2];
    [v23 setAutocorrectionType:0];
    [v23 setSpellCheckingType:0];
    [v23 setKeyboardType:0];
    [v23 setSmartInsertDeleteType:0];
    [v18 setMultipleTouchEnabled:1];
    objc_msgSend(v18, "setMinimumSize:", width, height);
    objc_msgSend(v18, "_restoreViewportSettingsWithSize:", width, height);
    objc_msgSend(v18, "sendOrientationEventForOrientation:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0));
    v24 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v18 selector:sel_selectionChanged_ name:*MEMORY[0x1E4FB6E80] object:0];
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel__inspectorDidStartSearchingForNode_, *MEMORY[0x1E4FB6E40], objc_msgSend(*((id *)v18 + 54), "inspector"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v18, sel__inspectorDidStopSearchingForNode_, *MEMORY[0x1E4FB6E48], objc_msgSend(*((id *)v18 + 54), "inspector"));
    *((void *)v18 + 172) = [[UIDragInteraction alloc] initWithDelegate:v18];
    objc_msgSend(v18, "addInteraction:", objc_msgSend(v18, "dragInteraction"));
    *((void *)v18 + 173) = [[UIDropInteraction alloc] initWithDelegate:v18];
    objc_msgSend(v18, "addInteraction:", objc_msgSend(v18, "dropInteraction"));
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3052000000;
    v33 = __Block_byref_object_copy__243;
    v34 = __Block_byref_object_dispose__243;
    v25 = (objc_class *)qword_1EB25C070;
    uint64_t v35 = qword_1EB25C070;
    if (!qword_1EB25C070)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __getPKScribbleInteractionClass_block_invoke;
      v29[3] = &unk_1E52D9900;
      v29[4] = &v30;
      __getPKScribbleInteractionClass_block_invoke((uint64_t)v29);
      v25 = (objc_class *)v31[5];
    }
    _Block_object_dispose(&v30, 8);
    id v26 = objc_alloc_init(v25);
    *((void *)v18 + 143) = v26;
    [v26 setDelegate:v18];
    [*((id *)v18 + 143) setElementSource:v18];
    [v18 addInteraction:*((void *)v18 + 143)];
  }
  return (UIWebDocumentView *)v18;
}

- (void)_inspectorDidStartSearchingForNode:(id)a3
{
  *((unsigned char *)self + 957) |= 4u;
}

- (void)_inspectorDidStopSearchingForNode:(id)a3
{
  *((unsigned char *)self + 957) &= ~4u;
}

- (void)_removeDefinitionController:(BOOL)a3
{
}

- (void)_removeShareController:(BOOL)a3
{
}

- (void)_removeShortcutController:(BOOL)a3
{
}

- (BOOL)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id delegate = self->_delegate;
  return [delegate _webView:self presentViewController:a3 animated:v6 completion:a5];
}

- (void)_dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate _webView:self dismissViewControllerAnimated:v5 completion:a4];
  }
}

- (void)_setFont:(id)a3
{
  uint64_t v4 = [a3 markupDescription];
  BOOL v5 = [[(WebFrame *)[(WebView *)self->_webView mainFrame] DOMDocument] createCSSStyleDeclaration];
  [(DOMCSSStyleDeclaration *)v5 setCssText:v4];
  BOOL v6 = [(UIWebDocumentView *)self selectedTextRange];
  [(UIWebDocumentView *)self selectAll];
  [(WebView *)self->_webView applyStyle:v5];
  [(UIWebDocumentView *)self setSelectedTextRange:v6];
}

- (void)_setTextColor:(id)a3
{
  uint64_t v4 = [a3 styleString];
  uint64_t v5 = [NSString stringWithFormat:@"color: %@", v4];
  BOOL v6 = [[(WebFrame *)[(WebView *)self->_webView mainFrame] DOMDocument] createCSSStyleDeclaration];
  [(DOMCSSStyleDeclaration *)v6 setCssText:v5];
  double v7 = [(UIWebDocumentView *)self selectedTextRange];
  [(UIWebDocumentView *)self selectAll];
  [(WebView *)self->_webView applyStyle:v6];
  [(UIWebDocumentView *)self setSelectedTextRange:v7];
}

- (void)dealloc
{
  v22[6] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FB6E40];
  v22[0] = *MEMORY[0x1E4FB6E80];
  v22[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB6E10];
  v22[2] = *MEMORY[0x1E4FB6E48];
  v22[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F28A78];
  v22[4] = *MEMORY[0x1E4F28A80];
  v22[5] = v6;
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6]);
  if (self->_textPlaceholderRemovalObserver) {
    objc_msgSend(v3, "removeObserver:");
  }
  WebThreadLock();

  if ((*((unsigned char *)self + 956) & 0x40) != 0)
  {
    double v7 = (void *)MEMORY[0x1E4FB6E08];
    id v8 = [(UIWebDocumentView *)self _groupName];
    objc_msgSend(v7, "_removeUserStyleSheetsFromGroup:world:", v8, objc_msgSend(MEMORY[0x1E4FB6DF0], "standardWorld"));
  }
  if (sDataDetectorsUIFrameworkLoaded == 1
    && [(UIWebDocumentView *)self _dataDetectionIsActivated])
  {
    objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(@"DDDetectionController"), "sharedController"), "frameWillBeRemoved:", -[WebView mainFrame](self->_webView, "mainFrame"));
  }
  [(WebView *)self->_webView _clearDelegates];
  [(WAKWindow *)self->super._wakWindow close];
  if ((*((unsigned char *)self + 956) & 0x20) != 0) {
    [(WebView *)self->_webView close];
  }

  [(_UIWebViewportHandler *)self->_viewportHandler setDelegate:0];
  [(UIWebDocumentView *)self cancelInteractionWithImmediateDisplay:1];
  [(UIWebDocumentView *)self _cleanupSheet];
  [(UIAutoscroll *)self->_autoscroll invalidate];

  [(UIWebDocumentView *)self _unregisterPreview];
  [(UIWebDocumentView *)self _clearPreviewRevealInformation];
  plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    double v10 = (void *)[(__CFDictionary *)plugInViews allValues];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) setWebView:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    CFRelease(self->_plugInViews);
    self->_plugInViews = 0;
  }

  [(CALayer *)self->_contentLayersHostingLayer removeFromSuperlayer];
  fileUploadPanel = self->_fileUploadPanel;
  if (fileUploadPanel)
  {
    [(UIWebFileUploadPanel *)fileUploadPanel setDelegate:0];
    [(UIWebFileUploadPanel *)self->_fileUploadPanel dismiss];
  }
  [(UIWebDocumentView *)self _removeDefinitionController:0];
  [(UIWebDocumentView *)self _removeShareController:0];
  [(UIWebPlaybackTargetPicker *)self->_playbackTargetPicker setDelegate:0];

  v16.receiver = self;
  v16.super_class = (Class)UIWebDocumentView;
  [(UIWebTiledView *)&v16 dealloc];
}

- (BOOL)didFirstVisuallyNonEmptyLayout
{
  return (*((unsigned __int8 *)self + 955) >> 6) & 1;
}

- (BOOL)hasDrawnTiles
{
  return *((unsigned __int8 *)self + 956) >> 7;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3) {
    [(UIWebDocumentView *)self _registerPreview];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentView;
  [(UIWebTiledView *)&v5 willMoveToWindow:a3];
}

- (void)willMoveToSuperview:(id)a3
{
}

- (void)stopLoading:(id)a3
{
  [(UIWebDocumentView *)self completeInteraction];
  webView = self->_webView;
  [(WebView *)webView stopLoading:a3];
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (void)_runLoadBlock:(id)a3
{
  if (*((unsigned char *)self + 955))
  {
    WebThreadLock();
    uint64_t v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    WebThreadRun();
  }
}

- (void)_cleanUpFrameStateAndLoad:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__UIWebDocumentView__cleanUpFrameStateAndLoad___block_invoke;
  v5[3] = &unk_1E52DC580;
  v5[4] = self;
  [(UIWebDocumentView *)self _runLoadBlock:v5];
  [(UIWebDocumentView *)self _runLoadBlock:a3];
}

uint64_t __47__UIWebDocumentView__cleanUpFrameStateAndLoad___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 432) mainFrame];
  uint64_t result = [*(id *)(a1 + 32) _dataDetectionIsActivated];
  if (result)
  {
    uint64_t v4 = (void *)[DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
    return [v4 cancelURLificationForFrame:v2];
  }
  return result;
}

- (void)loadRequest:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__UIWebDocumentView_loadRequest___block_invoke;
  v3[3] = &unk_1E52EBA80;
  v3[4] = self;
  v3[5] = a3;
  [(UIWebDocumentView *)self _cleanUpFrameStateAndLoad:v3];
}

uint64_t __33__UIWebDocumentView_loadRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) mainFrame];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 loadRequest:v3];
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__UIWebDocumentView_loadHTMLString_baseURL___block_invoke;
  v4[3] = &unk_1E52EBAA8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(UIWebDocumentView *)self _cleanUpFrameStateAndLoad:v4];
}

uint64_t __44__UIWebDocumentView_loadHTMLString_baseURL___block_invoke(void *a1)
{
  uint64_t v2 = (void *)[*(id *)(a1[4] + 432) mainFrame];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 loadHTMLString:v3 baseURL:v4];
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__UIWebDocumentView_loadData_MIMEType_textEncodingName_baseURL___block_invoke;
  v6[3] = &unk_1E5310CA0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  v6[8] = a6;
  [(UIWebDocumentView *)self _cleanUpFrameStateAndLoad:v6];
}

uint64_t __64__UIWebDocumentView_loadData_MIMEType_textEncodingName_baseURL___block_invoke(void *a1)
{
  uint64_t v2 = (void *)[*(id *)(a1[4] + 432) mainFrame];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  return [v2 loadData:v3 MIMEType:v4 textEncodingName:v5 baseURL:v6];
}

- (void)setLoadsSynchronously:(BOOL)a3
{
  if (((((*((unsigned char *)self + 955) & 1) == 0) ^ a3) & 1) == 0)
  {
    WebThreadLock();
    *((unsigned char *)self + 955) = *((unsigned char *)self + 955) & 0xFE | a3;
    uint64_t v5 = [(WebView *)self->_webView mainFrame];
    uint64_t v6 = *((unsigned char *)self + 955) & 1;
    [(WebFrame *)v5 _setLoadsSynchronously:v6];
  }
}

- (BOOL)loadsSynchronously
{
  return *((unsigned char *)self + 955) & 1;
}

- (id)webView
{
  return self->_webView;
}

- (id)_groupName
{
  return (id)[NSString stringWithFormat:@"%@.%p", _UIMainBundleIdentifier(), self];
}

- (id)_focusedOrMainFrame
{
  id m_parentTextView = self->m_parentTextView;
  webView = self->_webView;
  if (!m_parentTextView)
  {
    id result = [(WebView *)webView selectedFrame];
    if (result) {
      return result;
    }
    webView = self->_webView;
  }
  return [(WebView *)webView mainFrame];
}

- (void)setUserStyleSheet:(id)a3
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _groupName];
  if (![(NSString *)[(WebView *)self->_webView groupName] isEqualToString:v5]) {
    [(WebView *)self->_webView setGroupName:v5];
  }
  uint64_t v6 = [MEMORY[0x1E4FB6DF0] standardWorld];
  [MEMORY[0x1E4FB6E08] _removeUserStyleSheetsFromGroup:v5 world:v6];
  LODWORD(v7) = 0;
  [MEMORY[0x1E4FB6E08] _addUserStyleSheetToGroup:v5 world:v6 source:a3 url:0 includeMatchPatternStrings:0 excludeMatchPatternStrings:0 injectedFrames:v7];
  *((unsigned char *)self + 956) |= 0x40u;
}

- (void)setDetectsPhoneNumbers:(BOOL)a3
{
}

- (BOOL)detectsPhoneNumbers
{
  return (self->_dataDetectorTypes & 0xFFFFFFFF80000001) != 0;
}

- (BOOL)_dataDetectionIsActivated
{
  unint64_t dataDetectorTypes = self->_dataDetectorTypes;
  if (dataDetectorTypes) {
    BOOL v3 = dataDetectorTypes == 0xFFFFFFFF80000000;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (unint64_t)effectiveDataDetectorTypes
{
  if (self->_dataDetectorTypes == -1) {
    return 511;
  }
  else {
    return self->_dataDetectorTypes;
  }
}

- (void)setDataDetectorTypes:(unint64_t)a3
{
  if (self->_dataDetectorTypes != a3)
  {
    BOOL v5 = [(UIWebDocumentView *)self _dataDetectionIsActivated];
    self->_unint64_t dataDetectorTypes = a3;
    WebThreadLock();
    [(WebView *)self->_webView _setWantsTelephoneNumberParsing:self->_dataDetectorTypes == 0xFFFFFFFF80000000];
    if (v5)
    {
      uint64_t v6 = (void *)[DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
      uint64_t v7 = [(WebView *)self->_webView mainFrame];
      [v6 frameWillBeRemoved:v7];
    }
  }
}

- (unint64_t)dataDetectorTypes
{
  return self->_dataDetectorTypes;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v8 = v14.origin.x;
  double v9 = v14.origin.y;
  double v10 = v14.size.width;
  double v11 = v14.size.height;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v13.receiver = self;
    v13.super_class = (Class)UIWebDocumentView;
    -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
    [(UIWebDocumentView *)self _updateWebKitExposedScrollViewRect];
    v12.receiver = self;
    v12.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v12 setNeedsLayout];
    [(UIWebDocumentView *)self _notifyContentHostingLayersOfScaleChange];
    if (v10 != width || v11 != height)
    {
      WebThreadLock();
      -[WAKWindow setContentRect:](self->super._wakWindow, "setContentRect:", 0.0, 0.0, width, height);
      -[WebView setFrameSize:](self->_webView, "setFrameSize:", width, height);
    }
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(self->_delegate, "view:didSetFrame:oldFrame:asResultOfZoom:", self, (*((unsigned __int8 *)self + 954) >> 6) & 1, x, y, width, height, v8, v9, v10, v11);
    }
    else if (objc_opt_respondsToSelector())
    {
      objc_msgSend(self->_delegate, "view:didSetFrame:oldFrame:", self, x, y, width, height, v8, v9, v10, v11);
    }
  }
}

- (void)_setDocumentScale:(float)a3
{
  id v5 = [(UIView *)self _scroller];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 contentOffset];
    v23.m11 = v7;
    v23.m12 = v8;
    [(_UIWebViewportHandler *)self->_viewportHandler integralScaleForScale:&v23 keepingPointFixed:a3];
    double v10 = v9;
    objc_msgSend(v6, "setContentOffset:", v23.m11, v23.m12);
  }
  else
  {
    [(_UIWebViewportHandler *)self->_viewportHandler integralScaleForScale:0 keepingPointFixed:a3];
    double v10 = v11;
  }
  float v12 = v10;
  if (self->_documentScale != v12)
  {
    self->_documentScale = v12;
    memset(&v23, 0, sizeof(v23));
    CATransform3DMakeScale(&v23, v12, v12, 1.0);
    contentLayersHostingLayer = self->_contentLayersHostingLayer;
    CATransform3D v22 = v23;
    [(CALayer *)contentLayersHostingLayer setTransform:&v22];
    WebThreadLock();
    CGRect v14 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
    *(float *)&double v15 = self->_documentScale;
    [(NSView *)v14 setScale:v15];
    *(float *)&double v16 = self->_documentScale;
    [(WAKWindow *)self->super._wakWindow setCurrentTileScale:v16];
    IsEmptdouble y = CGRectIsEmpty(self->_mainDocumentDoubleTapRect);
    if (v14)
    {
      if (!IsEmpty)
      {
        -[NSView convertRect:toView:](v14, "convertRect:toView:", 0, self->_mainDocumentDoubleTapRect.origin.x, self->_mainDocumentDoubleTapRect.origin.y, self->_mainDocumentDoubleTapRect.size.width, self->_mainDocumentDoubleTapRect.size.height);
        self->_doubleTapRect.origin.double x = v18;
        self->_doubleTapRect.origin.double y = v19;
        self->_doubleTapRect.size.double width = v20;
        self->_doubleTapRect.size.double height = v21;
      }
    }
    [(UIWebDocumentView *)self _notifyPlugInViewsOfScaleChange];
    [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange];
    [(UIWebDocumentView *)self _notifyContentHostingLayersOfScaleChange];
  }
}

- (float)_documentScale
{
  return self->_documentScale;
}

- (float)minimumScaleForMinimumSize:(CGSize)a3
{
  -[_UIWebViewportHandler minimumScaleForViewSize:](self->_viewportHandler, "minimumScaleForViewSize:", a3.width, a3.height);
  return result;
}

- (float)initialScale
{
  [(_UIWebViewportHandler *)self->_viewportHandler initialScale];
  return result;
}

- (float)maximumScale
{
  [(_UIWebViewportHandler *)self->_viewportHandler maximumScale];
  return result;
}

- (float)minimumScale
{
  [(_UIWebViewportHandler *)self->_viewportHandler minimumScale];
  return result;
}

- (double)_zoomedDocumentScale
{
  double documentScale = self->_documentScale;
  id v3 = [(UIView *)self _scroller];
  if (v3)
  {
    [v3 zoomScale];
    return v4 * documentScale;
  }
  return documentScale;
}

- (void)_updateScrollViewBoundaryZoomScales
{
  if ((*((unsigned char *)self + 953) & 4) != 0 && self->_documentScale > 0.0)
  {
    id v3 = [(UIView *)self _scroller];
    [(_UIWebViewportHandler *)self->_viewportHandler minimumScale];
    double v5 = (float)(v4 / self->_documentScale);
    [(_UIWebViewportHandler *)self->_viewportHandler maximumScale];
    double v7 = (float)(v6 / self->_documentScale);
    [v3 setMinimumZoomScale:v5];
    [v3 setMaximumZoomScale:v7];
    BOOL v8 = [(_UIWebViewportHandler *)self->_viewportHandler allowsUserScaling];
    [v3 setZoomEnabled:v8];
  }
}

- (void)viewportHandlerDidChangeScales:(id)a3
{
  [(UIWebDocumentView *)self _updateScrollViewBoundaryZoomScales];
  if ((*((unsigned char *)self + 953) & 8) != 0)
  {
    if ((*((unsigned char *)self + 953) & 2) != 0)
    {
      float documentScale = self->_documentScale;
      [a3 minimumScale];
      if (documentScale < v10) {
        float documentScale = v10;
      }
      [a3 maximumScale];
      if (documentScale < *(float *)&v11) {
        *(float *)&double v11 = documentScale;
      }
      [(UIWebDocumentView *)self _setDocumentScale:v11];
    }
  }
  else
  {
    WebThreadLock();
    double v5 = [(WebBackForwardList *)[(WebView *)self->_webView backForwardList] currentItem];
    [(WebHistoryItem *)v5 _scale];
    if (v6 <= 0.0 || (float v7 = v6, ([(WebHistoryItem *)v5 _scaleIsInitial] & 1) != 0))
    {
      [a3 initialScale];
    }
    else
    {
      [a3 minimumScale];
      if (v7 < v12) {
        float v7 = v12;
      }
      [a3 maximumScale];
      if (v7 < *(float *)&v8) {
        *(float *)&double v8 = v7;
      }
    }
    [(UIWebDocumentView *)self _setDocumentScale:v8];
    [(UIWebDocumentView *)self _updateScrollViewBoundaryZoomScales];
  }
  [(_UIWebViewportHandler *)self->_viewportHandler minimumScale];
  if (v13 > 0.0)
  {
    wakWindow = self->super._wakWindow;
    -[WAKWindow setZoomedOutTileScale:](wakWindow, "setZoomedOutTileScale:");
  }
}

- (void)viewportHandler:(id)a3 didChangeViewportSize:(CGSize)a4
{
  if ((*((unsigned char *)self + 952) & 0x10) != 0)
  {
    double height = a4.height;
    double width = a4.width;
    WebThreadLock();
    double v8 = [(WebView *)self->_webView mainFrame];
    double v9 = [(WebFrameView *)[(WebFrame *)v8 frameView] documentView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WebView *)self->_webView _fixedLayoutSize];
      double v11 = v10;
      -[WebView _setFixedLayoutSize:](self->_webView, "_setFixedLayoutSize:", width, height);
      if ((*((unsigned char *)self + 953) & 0x20) == 0)
      {
        if (width != v11) {
          [(WebFrame *)v8 resetTextAutosizingBeforeLayout];
        }
        [(UIWebDocumentView *)self _updateFixedPositionedObjectsLayoutRectUsingWebThread:0 synchronize:1];
      }
      [(NSView *)v9 setNeedsLayout:1];
      [(NSView *)v9 layout];
    }
    else
    {
      [(UIView *)self frame];
      double v13 = v12;
      double v15 = v14;
      [a3 availableViewSize];
      -[UIWebDocumentView setFrame:](self, "setFrame:", v13, v15, v16, v17);
    }
  }
}

- (void)viewportHandler:(id)a3 didChangeAvoidsUnsafeArea:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate _webView:self didChangeAvoidsUnsafeArea:v4];
  }
}

- (CGPoint)convertPoint:(CGPoint)a3 toFrame:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  float v6 = (void *)[a4 documentView];
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromFrame:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  float v6 = (void *)[a4 documentView];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toFrame:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)[a4 documentView];
  objc_msgSend(v8, "convertRect:fromView:", 0, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromFrame:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)[a4 documentView];
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)_setDocumentType:(int)a3 overrideCustomConfigurations:(BOOL)a4 viewportArguments:(id)a5
{
  viewportHandler = self->_viewportHandler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__UIWebDocumentView__setDocumentType_overrideCustomConfigurations_viewportArguments___block_invoke;
  v6[3] = &unk_1E5310CC8;
  int v7 = a3;
  BOOL v8 = a4;
  v6[4] = self;
  v6[5] = a5;
  [(_UIWebViewportHandler *)viewportHandler update:v6];
}

uint64_t __85__UIWebDocumentView__setDocumentType_overrideCustomConfigurations_viewportArguments___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 888) = *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = v2 + 1152;
  uint64_t v4 = *(unsigned int *)(v2 + 888);
  double v5 = (long long *)(v2 + 1152 + 32 * v4);
  if (!*(unsigned char *)(a1 + 52))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v8 = *(void **)(v2 + 880);
    if (v8)
    {
      objc_msgSend(v8, "rawViewConfiguration", v11, v12);
      BOOL v8 = *(void **)(*(void *)(a1 + 32) + 880);
    }
    __int16 v9 = objc_msgSend(v8, "webkitDefinedConfigurationFlags", (void)v11);
    if ((v9 & 2) != 0)
    {
      if ((v9 & 4) != 0) {
        goto LABEL_7;
      }
    }
    else
    {
      LODWORD(v12) = *(_DWORD *)(v3 + 32 * v4 + 16);
      if ((v9 & 4) != 0)
      {
LABEL_7:
        if ((v9 & 8) != 0) {
          goto LABEL_8;
        }
        goto LABEL_18;
      }
    }
    DWORD1(v12) = *(_DWORD *)(v3 + 32 * v4 + 20);
    if ((v9 & 8) != 0)
    {
LABEL_8:
      if ((v9 & 0x10) != 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
LABEL_18:
    DWORD2(v12) = *(_DWORD *)(v3 + 32 * v4 + 24);
    if ((v9 & 0x10) != 0)
    {
LABEL_9:
      if ((v9 & 0x20) != 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
LABEL_19:
    *(void *)&long long v11 = *(void *)v5;
    if ((v9 & 0x20) != 0)
    {
LABEL_10:
      if ((v9 & 0x40) != 0) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
LABEL_20:
    *((void *)&v11 + 1) = *((void *)v5 + 1);
    if ((v9 & 0x40) != 0)
    {
LABEL_11:
      if ((v9 & 0x80) != 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
LABEL_21:
    BYTE12(v12) = *(unsigned char *)(v3 + 32 * v4 + 28);
    if ((v9 & 0x80) != 0)
    {
LABEL_12:
      if ((v9 & 0x100) != 0)
      {
LABEL_14:
        float v6 = *(void **)(*(void *)(a1 + 32) + 880);
        int v7 = &v11;
        goto LABEL_15;
      }
LABEL_13:
      BYTE14(v12) = *(unsigned char *)(v3 + 32 * v4 + 30);
      goto LABEL_14;
    }
LABEL_22:
    BYTE13(v12) = *(unsigned char *)(v3 + 32 * v4 + 29);
    if ((v9 & 0x100) != 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  [*(id *)(v2 + 880) clearWebKitViewportConfigurationFlags];
  float v6 = *(void **)(*(void *)(a1 + 32) + 880);
  int v7 = v5;
LABEL_15:
  objc_msgSend(v6, "resetViewportConfiguration:", v7, v11, v12);
  return [*(id *)(a1 + 32) _applyViewportArguments:*(void *)(a1 + 40)];
}

- (void)_setDocumentType:(int)a3
{
}

- (void)setSizeUpdatesSuspended:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 956);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 956) = v3 & 0xFD | v5;
    if (!a3 && (*((unsigned char *)self + 956) & 4) != 0) {
      [(UIWebDocumentView *)self _updateSize];
    }
    *((unsigned char *)self + 956) &= ~4u;
  }
}

- (BOOL)sizeUpdatesSuspended
{
  return (*((unsigned __int8 *)self + 956) >> 1) & 1;
}

- (void)_updateSize
{
  if ((*((char *)self + 952) & 0x80000000) == 0)
  {
    if ((*((unsigned char *)self + 956) & 2) != 0)
    {
      *((unsigned char *)self + 956) |= 4u;
    }
    else
    {
      WebThreadLock();
      *((unsigned char *)self + 952) |= 0x80u;
      char v3 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
      if (v3)
      {
        uint64_t v4 = v3;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          viewportHandler = self->_viewportHandler;
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __32__UIWebDocumentView__updateSize__block_invoke_2;
          v43[3] = &unk_1E52DC580;
          v43[4] = self;
          [(_UIWebViewportHandler *)viewportHandler update:v43];
          [(UIView *)self frame];
          -[UIWebDocumentView setFrame:](self, "setFrame:");
        }
        else
        {
          if ((*((unsigned char *)self + 952) & 0x20) != 0)
          {
            [(_UIWebViewportHandler *)self->_viewportHandler viewportWidth];
            double v11 = v12;
            [(_UIWebViewportHandler *)self->_viewportHandler viewportHeight];
            double v9 = v13;
            uint64_t v7 = 0;
            uint64_t v8 = 0;
          }
          else
          {
            [(NSView *)v4 bounds];
            double v11 = v10;
          }
          float documentScale = self->_documentScale;
          double v15 = self->_viewportHandler;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __32__UIWebDocumentView__updateSize__block_invoke_3;
          v42[3] = &unk_1E52F1BA0;
          v42[4] = self;
          v42[5] = v7;
          v42[6] = v8;
          *(double *)&v42[7] = v11;
          *(double *)&v42[8] = v9;
          [(_UIWebViewportHandler *)v15 update:v42];
          if ((*((unsigned char *)self + 952) & 0x20) == 0)
          {
            [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            [(NSView *)v4 bounds];
            v46.origin.double x = v24;
            v46.origin.double y = v25;
            v46.size.double width = v26;
            v46.size.double height = v27;
            v45.origin.double x = v17;
            v45.origin.double y = v19;
            v45.size.double width = v21;
            v45.size.double height = v23;
            if (!CGRectEqualToRect(v45, v46))
            {
              objc_super v28 = self->_viewportHandler;
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __32__UIWebDocumentView__updateSize__block_invoke_4;
              v41[3] = &unk_1E52EBA80;
              v41[4] = v4;
              v41[5] = self;
              [(_UIWebViewportHandler *)v28 update:v41];
            }
          }
          [(NSView *)v4 bounds];
          -[NSView convertRect:toView:](v4, "convertRect:toView:", 0);
          double v30 = v29;
          double v32 = v31;
          [(_UIWebViewportHandler *)self->_viewportHandler viewportWidth];
          double v34 = (float)(v33 * self->_documentScale);
          if (v30 > v34) {
            double v34 = v30;
          }
          double v35 = round(v34);
          [(_UIWebViewportHandler *)self->_viewportHandler viewportHeight];
          float v36 = self->_documentScale;
          double v38 = (float)(v37 * v36);
          if (v32 > v38) {
            double v38 = v32;
          }
          double v39 = floor(v38);
          if ((*((unsigned char *)self + 953) & 0x20) != 0)
          {
            self->_pendingSize.double width = v35;
            self->_pendingSize.double height = v39;
          }
          else
          {
            id v40 = [(UIView *)self _layer];
            [v40 setLayoutsSuspended:1];
            [(UIView *)self frame];
            -[UIWebDocumentView setFrame:](self, "setFrame:");
            [v40 setLayoutsSuspended:0];
            self->_pendingSize = (CGSize)*MEMORY[0x1E4F1DB30];
            [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange];
            float v36 = self->_documentScale;
            if (v36 != documentScale)
            {
              [(UIWebTiledView *)self removeAllNonVisibleTiles];
              float v36 = self->_documentScale;
            }
          }
          if (v36 != documentScale) {
            [(WebView *)self->_webView setNeedsDisplay:1];
          }
        }
      }
      else
      {
        float v6 = self->_viewportHandler;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __32__UIWebDocumentView__updateSize__block_invoke;
        v44[3] = &unk_1E52DC580;
        v44[4] = self;
        [(_UIWebViewportHandler *)v6 update:v44];
      }
      *((unsigned char *)self + 952) &= ~0x80u;
    }
  }
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 880), "setDocumentBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 880), "setDocumentBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 880), "setDocumentBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 648);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v2, "setBounds:", v3, v4, v5, v6);
}

uint64_t __32__UIWebDocumentView__updateSize__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 880), "setDocumentBounds:");
  double v10 = *(void **)(*(void *)(a1 + 40) + 648);
  return objc_msgSend(v10, "setBounds:", v3, v5, v7, v9);
}

- (void)_clearDoubleTapRect
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_mainDocumentDoubleTapRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_mainDocumentDoubleTapRect.size = v3;
  self->_doubleTapRect.origin = v2;
  self->_doubleTapRect.size = v3;
  *((unsigned char *)self + 954) &= ~1u;
}

- (void)setShouldIgnoreCustomViewport:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 952);
  if (((((v3 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 952) = v3 & 0xBF | v5;
    if (a3)
    {
      if ([(_UIWebViewportHandler *)self->_viewportHandler webkitDefinedConfigurationFlags])
      {
        uint64_t documentType = self->_documentType;
        [(UIWebDocumentView *)self _setDocumentType:documentType];
      }
    }
    else
    {
      WebThreadLock();
      viewportHandler = self->_viewportHandler;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __51__UIWebDocumentView_setShouldIgnoreCustomViewport___block_invoke;
      v8[3] = &unk_1E52DC580;
      v8[4] = self;
      [(_UIWebViewportHandler *)viewportHandler update:v8];
    }
  }
}

uint64_t __51__UIWebDocumentView_setShouldIgnoreCustomViewport___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[54], "backForwardList"), "currentItem"), "_viewportArguments");
  return [v1 _applyViewportArguments:v2];
}

- (BOOL)shouldIgnoreCustomViewport
{
  return (*((unsigned __int8 *)self + 952) >> 6) & 1;
}

- (void)_applyViewportArguments:(id)a3
{
  if (a3)
  {
    self->_wantsMinimalUI = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"minimal-ui"), "BOOLValue");
    if ((*((unsigned char *)self + 952) & 0x40) == 0)
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6EA0]), "floatValue");
      int v6 = v5;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6E98]), "floatValue");
      int v8 = v7;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6E90]), "floatValue");
      int v10 = v9;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6EB8]), "floatValue");
      float v12 = v11;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6E88]), "floatValue");
      double v14 = v13;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6EB0]), "floatValue");
      int v16 = v15;
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4FB6EA8]), "floatValue");
      int v18 = v17;
      uint64_t v19 = [a3 objectForKey:@"viewport-fit"];
      viewportHandler = self->_viewportHandler;
      LODWORD(v21) = v10;
      LODWORD(v22) = v6;
      LODWORD(v23) = v8;
      LODWORD(v24) = v16;
      LODWORD(v25) = v18;
      -[_UIWebViewportHandler applyWebKitViewportArgumentsSize:initialScale:minimumScale:maximumScale:allowsUserScaling:allowsShrinkToFit:viewportFit:](viewportHandler, "applyWebKitViewportArgumentsSize:initialScale:minimumScale:maximumScale:allowsUserScaling:allowsShrinkToFit:viewportFit:", v19, v12, v14, v21, v22, v23, v24, v25);
    }
  }
}

- (void)webView:(id)a3 didReceiveViewportArguments:(id)a4
{
  WebThreadLock();
  viewportHandler = self->_viewportHandler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__UIWebDocumentView_webView_didReceiveViewportArguments___block_invoke;
  v7[3] = &unk_1E52EBA80;
  v7[4] = self;
  v7[5] = a4;
  [(_UIWebViewportHandler *)viewportHandler update:v7];
}

uint64_t __57__UIWebDocumentView_webView_didReceiveViewportArguments___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyViewportArguments:*(void *)(a1 + 40)];
}

- (BOOL)isClassicViewportMode
{
  return [(_UIWebViewportHandler *)self->_viewportHandler isClassicViewportMode];
}

- (void)webView:(id)a3 needsScrollNotifications:(id)a4 forFrame:(id)a5
{
  if ([(WebView *)self->_webView mainFrame] == a5)
  {
    if ([a4 BOOLValue]) {
      char v7 = 0x80;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 954) = v7 & 0x80 | *((unsigned char *)self + 954) & 0x7F;
  }
}

- (BOOL)needsScrollNotifications
{
  return *((unsigned __int8 *)self + 954) >> 7;
}

- (void)sendScrollEventIfNecessary
{
}

- (void)sendScrollEventIfNecessaryWasUserScroll:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutDuringScroll];
  if (*((char *)self + 954) < 0)
  {
    int v5 = v8;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    int v6 = __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke;
  }
  else
  {
    if (!v3) {
      return;
    }
    int v5 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    int v6 = __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke_2;
  }
  v5[2] = v6;
  v5[3] = &unk_1E52DC580;
  v5[4] = self;
  WebThreadRun();
}

uint64_t __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) mainFrame];
  return [v1 sendScrollEvent];
}

uint64_t __61__UIWebDocumentView_sendScrollEventIfNecessaryWasUserScroll___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) mainFrame];
  return [v1 _userScrolled];
}

- (void)resetTilingAfterLoadComplete
{
  if ((*((unsigned char *)self + 953) & 0x20) != 0)
  {
    if ((*((unsigned char *)self + 952) & 0x10) != 0) {
      [(UIWebDocumentView *)self _updateSize];
    }
    [(UIWebTiledView *)self setNeedsLayout];
  }
  if ((*((unsigned char *)self + 955) & 8) != 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v3 setTilingArea:0];
    *((unsigned char *)self + 955) &= ~8u;
  }
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  if ([(WebView *)self->_webView mainFrame] == a4)
  {
    *((unsigned char *)self + 957) &= ~8u;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate webViewMainFrameDidFinishLoad:self];
    }
    objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *((unsigned char *)self + 955) &= ~0x80u;
      [(UIWebDocumentView *)self resetTilingAfterLoadComplete];
      if ([(UIWebDocumentView *)self _dataDetectionIsActivated])
      {
        if (![(WebView *)self->_webView isEditable]
          && ![(UIWebDocumentView *)self _parentTextView])
        {
          WebThreadLock();
          int v6 = (void *)[DataDetectorsUIGetClass(@"DDDetectionController") sharedController];
          unint64_t v7 = [(UIWebDocumentView *)self effectiveDataDetectorTypes];
          [v6 startURLificationForFrame:a4 detectedTypes:v7];
        }
      }
    }
  }
}

- (void)webThreadWebViewDidLayout:(id)a3 byScrolling:(BOOL)a4
{
  if (objc_opt_respondsToSelector()) {
    [self->_delegate webThreadWebViewDidLayout:self];
  }
  self->_renderTreeSize = [a3 _renderTreeSize];
  if (self->_renderTreeSizeThresholdForReset)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke;
    block[3] = &unk_1E52DC580;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([(UIWebDocumentView *)self hasSelection])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke_2;
    v7[3] = &unk_1E530D4F0;
    v7[4] = self;
    BOOL v8 = a4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

uint64_t __59__UIWebDocumentView_webThreadWebViewDidLayout_byScrolling___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _selectionLayoutChangedByScrolling:*(unsigned __int8 *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) hasEditableSelection];
  if (result)
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    return [v3 _editableSelectionLayoutChangedByScrolling:v4];
  }
  return result;
}

- (void)_selectionLayoutChangedByScrolling:(BOOL)a3
{
}

- (void)_editableSelectionLayoutChangedByScrolling:(BOOL)a3
{
  if (objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3), "autocorrectPrompt"))
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    [v3 updateCandidateDisplay];
  }
}

- (void)webViewDidStartOverflowScroll:(id)a3
{
}

- (void)webViewDidEndOverflowScroll:(id)a3
{
}

- (void)webView:(id)a3 runOpenPanelForFileButtonWithResultListener:(id)a4 configuration:(id)a5
{
  if (self->_fileUploadPanel)
  {
    objc_msgSend(a4, "cancel", a3);
  }
  else
  {
    int v6 = [[UIWebFileUploadPanel alloc] initWithResultListener:a4 configuration:a5 documentView:self];
    self->_fileUploadPanel = v6;
    [(UIWebFileUploadPanel *)v6 setDelegate:self];
    fileUploadPanel = self->_fileUploadPanel;
    [(UIWebFileUploadPanel *)fileUploadPanel present];
  }
}

- (void)webViewDidRestoreFromPageCache:(id)a3
{
  *((unsigned char *)self + 957) |= 0x10u;
}

- (void)webView:(id)a3 didFirstVisuallyNonEmptyLayoutInFrame:(id)a4
{
  *((unsigned char *)self + 955) |= 0x40u;
  if ((*((unsigned char *)self + 952) & 0x10) != 0) {
    [(UIWebDocumentView *)self _updateSize];
  }
  [(UIWebTiledView *)self setNeedsLayout];
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  if ([(WebView *)self->_webView mainFrame] == a5)
  {
    if (objc_opt_respondsToSelector()) {
      [self->_delegate webViewMainFrameDidFailLoad:self withError:a4];
    }
    *((unsigned char *)self + 955) &= ~0x80u;
    [(UIWebDocumentView *)self resetTilingAfterLoadComplete];
  }
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  if ([(WebView *)self->_webView mainFrame] == a4)
  {
    *((unsigned char *)self + 953) &= ~8u;
    self->_previousDocumentScale = self->_documentScale;
    self->_float documentScale = -1.0;
    [(UIWebDocumentView *)self _resetFormDataForFrame:a4];
    [(UIWebDocumentView *)self setTilingArea:2];
    [(UIWebTiledView *)self setNeedsDisplay];
    *((unsigned char *)self + 953) |= 0x20u;
    if ([a4 _isVisuallyNonEmpty]) {
      char v6 = 64;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 955) = *((unsigned char *)self + 955) & 0xBF | v6;
    *((unsigned char *)self + 956) &= ~0x80u;
    *((unsigned char *)self + 955) |= 0x80u;
    *((unsigned char *)self + 953) &= ~0x40u;
    self->_pendingSize = (CGSize)*MEMORY[0x1E4F1DB30];
    char v7 = *((unsigned char *)self + 957);
    if ((v7 & 0x10) == 0)
    {
      *((unsigned char *)self + 954) &= ~0x80u;
      char v7 = *((unsigned char *)self + 957);
    }
    *((unsigned char *)self + 957) = v7 & 0xEF;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate webViewMainFrameDidCommitLoad:self];
    }
    BOOL v8 = (void *)[a4 dataSource];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "frameView"), "documentView");
    if (([a4 _loadType] & 0xFFFFFFFD) == 4) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = [(WebHistoryItem *)[(WebBackForwardList *)[(WebView *)self->_webView backForwardList] currentItem] _viewportArguments];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = 0;
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "response"), "MIMEType"), "lowercaseString"), "isEqualToString:", @"text/plain"))
    {
      uint64_t v11 = 1;
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6E08], "_productivityDocumentMIMETypes"), "containsObject:", objc_msgSend((id)objc_msgSend(v8, "_responseMIMEType"), "lowercaseString")))
    {
      uint64_t v11 = 2;
    }
    else
    {
      uint64_t v11 = 4;
    }
    [(UIWebDocumentView *)self _setDocumentType:v11 overrideCustomConfigurations:1 viewportArguments:v10];
    float v12 = [(WebBackForwardList *)[(WebView *)self->_webView backForwardList] currentItem];

    self->_latestCommittedPageLoadHistoryItem = v12;
    [(UIWebDocumentView *)self _clearDoubleTapRect];
    [(UIWebDocumentView *)self _clearAllConsoleMessages];
    if ((*((unsigned char *)self + 952) & 0x10) != 0)
    {
      [(UIWebDocumentView *)self _updateSize];
      float v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      double v14 = (uint64_t *)MEMORY[0x1E4FB6E10];
      [v13 removeObserver:self name:*MEMORY[0x1E4FB6E10] object:0];
      uint64_t v15 = *v14;
      [v13 addObserver:self selector:sel__WAKViewSizeDidChange_ name:v15 object:v9];
    }
  }
}

- (void)webViewDidReceiveMobileDocType:(id)a3
{
}

- (void)_WAKViewSizeDidChange:(id)a3
{
  int v5 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
  if (v5 == (NSView *)[a3 object])
  {
    [(NSView *)v5 frame];
    if (v7 != *MEMORY[0x1E4F1DB30] || v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [(UIWebTiledView *)self setNeedsLayout];
      if ((*((unsigned char *)self + 952) & 0x10) != 0)
      {
        [(UIWebDocumentView *)self _updateSize];
      }
    }
  }
}

- (CGRect)documentBounds
{
  [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setAutoresizes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 952) = *((unsigned char *)self + 952) & 0xEF | v3;
}

- (void)setIgnoresViewportOverflowWhenAutoresizing:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 952) = *((unsigned char *)self + 952) & 0xDF | v3;
}

- (void)setMinimumSize:(CGSize)a3
{
}

- (void)setMinimumSize:(CGSize)a3 updateCurrentViewportConfigurationSize:(BOOL)a4
{
  viewportHandler = self->_viewportHandler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__UIWebDocumentView_setMinimumSize_updateCurrentViewportConfigurationSize___block_invoke;
  v5[3] = &unk_1E5310CF0;
  v5[4] = self;
  BOOL v7 = a4;
  CGSize v6 = a3;
  [(_UIWebViewportHandler *)viewportHandler update:v5];
}

uint64_t __75__UIWebDocumentView_setMinimumSize_updateCurrentViewportConfigurationSize___block_invoke(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 880);
  if (v3)
  {
    [v3 rawViewConfiguration];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(a1 + 56)
    || (char v4 = [*(id *)(v2 + 880) webkitDefinedConfigurationFlags],
        uint64_t v2 = *(void *)(a1 + 32),
        (v4 & 0x10) != 0))
  {
    uint64_t v5 = 1;
  }
  else if (*(double *)&v7 == *(double *)(v2 + 1152 + 32 * *(unsigned int *)(v2 + 888)))
  {
    uint64_t v5 = 0;
  }
  else
  {
    *(void *)&long long v7 = *(void *)(v2 + 1152 + 32 * *(unsigned int *)(v2 + 888));
    [*(id *)(v2 + 880) overrideViewportConfiguration:&v7];
    uint64_t v5 = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 880), "setAvailableViewSize:updateConfigurationSize:", v5, round(*(double *)(a1 + 40)), round(*(double *)(a1 + 48)), v7, v8);
}

- (void)setViewportSize:(CGSize)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  double v5 = round(a3.width);
  double v6 = round(a3.height);
  do
  {
    if ((a4 >> v4))
    {
      self->_defaultViewportConfigurations[0].size.double width = v5;
      self->_defaultViewportConfigurations[0].size.double height = v6;
    }
    ++v4;
    self = (UIWebDocumentView *)((char *)self + 32);
  }
  while (v4 != 5);
}

- (void)setInitialScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  p_layeringSceneIdentitdouble y = &self->super.super.super.__layeringSceneIdentity;
  do
  {
    if ((a4 >> v4)) {
      *((float *)p_layeringSceneIdentity + 288) = a3;
    }
    ++v4;
    p_layeringSceneIdentity += 4;
  }
  while (v4 != 5);
}

- (void)setMinimumScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  double v5 = (float *)&self->super.super.super.__layeringSceneIdentity + 1;
  do
  {
    if ((a4 >> v4)) {
      v5[288] = a3;
    }
    ++v4;
    v5 += 8;
  }
  while (v4 != 5);
}

- (void)setMaximumScale:(float)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  p_constraintsExceptingSubviewAutoresizingConstraints = &self->super.super._constraintsExceptingSubviewAutoresizingConstraints;
  do
  {
    if ((a4 >> v4)) {
      *((float *)p_constraintsExceptingSubviewAutoresizingConstraints + 288) = a3;
    }
    ++v4;
    p_constraintsExceptingSubviewAutoresizingConstraints += 4;
  }
  while (v4 != 5);
}

- (void)setAllowsUserScaling:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  double v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 4;
  do
  {
    if ((a4 >> v4)) {
      v5[1152] = a3;
    }
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)setAllowsShrinkToFit:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  double v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 5;
  do
  {
    if ((a4 >> v4)) {
      v5[1152] = a3;
    }
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)setAvoidsUnsafeArea:(BOOL)a3 forDocumentTypes:(int)a4
{
  uint64_t v4 = 0;
  double v5 = (char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints + 6;
  do
  {
    if ((a4 >> v4)) {
      v5[1152] = a3;
    }
    ++v4;
    v5 += 32;
  }
  while (v4 != 5);
}

- (void)fileUploadPanelDidDismiss:(id)a3
{
  self->_fileUploadPanel = 0;
}

- (void)setUpdatesScrollView:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 953) = *((unsigned char *)self + 953) & 0xFB | v3;
}

- (BOOL)updatesScrollView
{
  return (*((unsigned __int8 *)self + 953) >> 2) & 1;
}

- (void)_restoreScrollPointForce:(BOOL)a3
{
  if (a3 || (*((unsigned char *)self + 953) & 0x10) != 0 && (*((unsigned char *)self + 953) & 8) == 0)
  {
    WebThreadLock();
    id v4 = [(UIView *)self _scroller];
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if ((*((unsigned char *)self + 953) & 0x40) != 0)
    {
      long long v7 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
      if (v7)
      {
        -[NSView convertPoint:toView:](v7, "convertPoint:toView:", self->_webView, self->_scrollPoint.x, self->_scrollPoint.y);
        double v5 = v8;
        double v6 = v9;
      }
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v4, v5, v6);
      double v5 = v10;
      double v6 = fmax(v11, 0.0);
      *((unsigned char *)self + 953) &= ~0x10u;
    }
    [v4 contentOffset];
    double v13 = v12;
    double v15 = v14;
    [v4 contentInset];
    double v17 = v16;
    double v19 = v18;
    [v4 _systemContentInset];
    *((unsigned char *)self + 957) |= 2u;
    objc_msgSend(v4, "_setContentOffsetPinned:", v5 - (v19 + v21), v6 - (v17 + v20));
    *((unsigned char *)self + 957) &= ~2u;
    *((unsigned char *)self + 957) &= ~8u;
    [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutAfterScroll];
    [v4 contentOffset];
    if (v13 != v23 || v15 != v22)
    {
      [(UIWebTiledView *)self layoutTilesNow];
    }
  }
}

- (void)_resetForNewPage
{
  id v3 = [(UIView *)self _scroller];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;
  if (self->_pendingSize.width != 0.0 && self->_pendingSize.height != 0.0)
  {
    [(UIView *)self frame];
    -[UIWebDocumentView setFrame:](self, "setFrame:");
    self->_pendingSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  *((unsigned char *)self + 953) &= ~0x20u;
  *((unsigned char *)self + 953) |= 0x10u;
  self->_renderTreeSizeThresholdForReset = 0;
  if (*((char *)self + 955) < 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v12 setTilingArea:1];
    *((unsigned char *)self + 955) |= 8u;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v11 setTilingArea:0];
  }
  if ((*((unsigned char *)self + 953) & 4) != 0 && [(UIView *)self _scroller]) {
    [(UIWebDocumentView *)self _restoreScrollPointForce:0];
  }
  [v3 contentOffset];
  if (v5 != v9
    || v7 != v8
    || (float previousDocumentScale = self->_previousDocumentScale, previousDocumentScale != 0.0)
    && previousDocumentScale != self->_documentScale)
  {
    [(UIWebTiledView *)self removeAllTiles];
    [(UIWebTiledView *)self layoutTilesNow];
    self->_float previousDocumentScale = 0.0;
  }
  [(UIWebDocumentView *)self _showPendingContentLayers];
  if (objc_opt_respondsToSelector()) {
    [self->_delegate didResetViewForNewPage:self];
  }
}

- (void)_saveStateToHistoryItem:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [self->_delegate saveStateToHistoryItem:a3 forWebView:self];
  }
  id v5 = [(UIView *)self _scroller];
  if ((*((unsigned char *)self + 953) & 4) != 0)
  {
    double v6 = v5;
    if (v5)
    {
      if (([a3 lastVisitWasFailure] & 1) == 0)
      {
        [v6 contentOffset];
        -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v6);
        double v8 = v7;
        double v10 = v9;
        objc_super v11 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
        if (v11)
        {
          -[NSView convertPoint:fromView:](v11, "convertPoint:fromView:", self->_webView, v8, v10);
          double v8 = v12;
          double v10 = v13;
        }
        [(_UIWebViewportHandler *)self->_viewportHandler integralInitialScale];
        float v15 = v14;
        objc_msgSend(a3, "_setScrollPoint:", v8, v10);
        BOOL v16 = self->_documentScale == v15;
        objc_msgSend(a3, "_setScale:isInitial:", v16);
      }
    }
  }
}

- (void)saveStateToCurrentHistoryItem
{
  if (self->_latestCommittedPageLoadHistoryItem)
  {
    WebThreadLock();
    latestCommittedPageLoadHistoryItem = self->_latestCommittedPageLoadHistoryItem;
    [(UIWebDocumentView *)self _saveStateToHistoryItem:latestCommittedPageLoadHistoryItem];
  }
}

- (void)webView:(id)a3 saveStateToHistoryItem:(id)a4 forFrame:(id)a5
{
  [(UIWebDocumentView *)self _saveStateToHistoryItem:a4];
  if (([a4 lastVisitWasFailure] & 1) == 0)
  {
    unsigned int v7 = [(_UIWebViewportHandler *)self->_viewportHandler webkitDefinedConfigurationFlags];
    __int16 v8 = v7;
    if (v7 || self->_wantsMinimalUI)
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
      viewportHandler = self->_viewportHandler;
      if (viewportHandler)
      {
        [(_UIWebViewportHandler *)viewportHandler rawViewConfiguration];
        LODWORD(v11) = 0;
      }
      else
      {
        double v11 = 0.0;
      }
      if ((v8 & 2) == 0) {
        *(float *)&double v11 = -1.0;
      }
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithFloat:", v11, 0);
      [v9 setObject:v12 forKey:*MEMORY[0x1E4FB6E90]];
      LODWORD(v13) = 0;
      if ((v8 & 4) == 0) {
        *(float *)&double v13 = -1.0;
      }
      uint64_t v14 = [NSNumber numberWithFloat:v13];
      [v9 setObject:v14 forKey:*MEMORY[0x1E4FB6EA0]];
      LODWORD(v15) = 0;
      if ((v8 & 8) == 0) {
        *(float *)&double v15 = -1.0;
      }
      uint64_t v16 = [NSNumber numberWithFloat:v15];
      [v9 setObject:v16 forKey:*MEMORY[0x1E4FB6E98]];
      if ((v8 & 0x40) != 0) {
        int v18 = 0;
      }
      else {
        int v18 = -1;
      }
      *(float *)&double v17 = (float)v18;
      uint64_t v19 = [NSNumber numberWithFloat:v17];
      [v9 setObject:v19 forKey:*MEMORY[0x1E4FB6EB0]];
      if ((v8 & 0x80) != 0) {
        int v21 = 0;
      }
      else {
        int v21 = -1;
      }
      *(float *)&double v20 = (float)v21;
      uint64_t v22 = [NSNumber numberWithFloat:v20];
      [v9 setObject:v22 forKey:*MEMORY[0x1E4FB6EA8]];
      HIDWORD(v23) = HIDWORD(v28);
      *(float *)&double v23 = v28;
      if ((v8 & 0x10) == 0) {
        *(float *)&double v23 = -1.0;
      }
      uint64_t v24 = [NSNumber numberWithFloat:v23];
      [v9 setObject:v24 forKey:*MEMORY[0x1E4FB6EB8]];
      HIDWORD(v25) = 0;
      *(float *)&double v25 = 0.0;
      if ((v8 & 0x20) == 0) {
        *(float *)&double v25 = -1.0;
      }
      uint64_t v26 = [NSNumber numberWithFloat:v25];
      [v9 setObject:v26 forKey:*MEMORY[0x1E4FB6E88]];
      objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_wantsMinimalUI), @"minimal-ui");
      if ((v8 & 0x100) != 0) {
        CGFloat v27 = @"cover";
      }
      else {
        CGFloat v27 = @"auto";
      }
      [v9 setObject:v27 forKey:@"viewport-fit"];
      [a4 _setViewportArguments:v9];
    }
  }
}

- (void)webView:(id)a3 restoreStateFromHistoryItem:(id)a4 forFrame:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  if (objc_opt_respondsToSelector()) {
    [self->_delegate restoreStateFromHistoryItem:a4 forWebView:self];
  }
  if ((*((unsigned char *)self + 953) & 4) != 0)
  {
    if ([(UIView *)self _scroller])
    {
      [a4 _scrollPoint];
      self->_scrollPoint.double x = v9;
      self->_scrollPoint.double y = v10;
      *((unsigned char *)self + 953) |= 0x40u;
      if ((*((unsigned char *)self + 953) & 0x20) == 0)
      {
        if (![a4 _scaleIsInitial]
          || ([a4 _scale],
              double v12 = v11,
              [(_UIWebViewportHandler *)self->_viewportHandler integralInitialScale],
              v13 == v12))
        {
          [(UIWebDocumentView *)self _restoreScrollPointForce:v6];
        }
      }
    }
  }
  [(UIWebTiledView *)self setNeedsLayout];
}

- (BOOL)webView:(id)a3 shouldScrollToPoint:(CGPoint)a4 forFrame:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  if ((unint64_t)([(UIGestureRecognizer *)self->_twoFingerPanGestureRecognizer state] - 1) < 2
    || ([a3 _isProcessingUserGesture] & 1) == 0 && (*((unsigned char *)self + 957) & 8) != 0)
  {
    goto LABEL_7;
  }
  if ([(WebView *)self->_webView mainFrame] != a5)
  {
    LOBYTE(v10) = 1;
    return (char)v10;
  }
  if ((*((unsigned char *)self + 953) & 4) == 0)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  id v10 = [(UIView *)self _scroller];
  if (v10)
  {
    float v11 = [(WebFrame *)[(WebView *)self->_webView mainFrame] frameView];
    double v12 = (void *)[(WebFrameView *)v11 _scrollView];
    if ((*((unsigned char *)self + 953) & 0x20) != 0)
    {
      objc_msgSend(v12, "convertPoint:toView:", -[WebFrameView documentView](v11, "documentView"), x, y);
      LOBYTE(v10) = 0;
      self->_scrollPoint.double x = v36;
      self->_scrollPoint.double y = v37;
      uint64_t v34 = 953;
      char v35 = *((unsigned char *)self + 953) | 0x40;
    }
    else
    {
      id v13 = [(UIView *)self _scroller];
      objc_msgSend(v12, "convertPoint:toView:", 0, x, y);
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13);
      double v15 = v14;
      double v17 = v16;
      [(UIView *)self frame];
      if (v15 < v18) {
        double v15 = v18;
      }
      if (v17 < v19) {
        double v17 = v19;
      }
      if (!CGRectIsNull(self->_exposedScrollViewRect))
      {
        [v13 contentOffset];
        double v17 = v17 - (self->_exposedScrollViewRect.origin.y - v20);
        double v15 = v15 - (self->_exposedScrollViewRect.origin.x - v21);
      }
      if ((*((unsigned char *)self + 952) & 0x10) != 0)
      {
        [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        [(NSView *)[(WebFrameView *)v11 documentView] bounds];
        v40.origin.double x = v30;
        v40.origin.double y = v31;
        v40.size.double width = v32;
        v40.size.double height = v33;
        v39.origin.double x = v23;
        v39.origin.double y = v25;
        v39.size.double width = v27;
        v39.size.double height = v29;
        if (!CGRectEqualToRect(v39, v40)) {
          [(UIWebDocumentView *)self _updateSize];
        }
      }
      objc_msgSend(v13, "_setContentOffsetPinned:", v15, v17);
      [(UIWebDocumentView *)self sendScrollEventIfNecessaryWasUserScroll:0];
      [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutAfterScroll];
      LOBYTE(v10) = 0;
      *((unsigned char *)self + 953) &= ~0x10u;
      uint64_t v34 = 957;
      char v35 = *((unsigned char *)self + 957) & 0xF7;
    }
    *((unsigned char *)&self->super.super.super.super.isa + v34) = v35;
  }
  return (char)v10;
}

- (void)_showPendingContentLayers
{
}

- (void)forceLayout
{
  WebThreadLock();
  [(NSView *)[(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView] layout];
  if ((*((unsigned char *)self + 953) & 0x20) != 0
    && [(UIWebDocumentView *)self _shouldResetForNewPage])
  {
    [(UIWebDocumentView *)self _resetForNewPage];
  }
  [(UIWebTiledView *)self setNeedsLayout];
  [(UIView *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  if ((WebThreadIsCurrent() & 1) == 0)
  {
    if ((*((unsigned char *)self + 953) & 0x20) != 0)
    {
      if (![(UIWebDocumentView *)self _shouldResetForNewPage]) {
        return;
      }
      [(UIWebDocumentView *)self _resetForNewPage];
    }
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    BOOL v6 = __35__UIWebDocumentView_layoutSubviews__block_invoke;
    unsigned int v7 = &unk_1E52DC580;
    __int16 v8 = self;
    WebThreadRun();
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v3 layoutSubviews];
  }
}

uint64_t __35__UIWebDocumentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) _viewGeometryDidChange];
}

- (void)setSmoothsFonts:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && (setSmoothsFonts__didSetOrientationProvider & 1) == 0)
  {
    [MEMORY[0x1E4FB6D80] setOrientationProvider:objc_opt_class()];
    setSmoothsFonts__didSetOrientationProvider = 1;
  }
  wakWindow = self->super._wakWindow;
  [(WAKWindow *)wakWindow setUseOrientationDependentFontAntialiasing:v3];
}

+ (BOOL)hasLandscapeOrientation
{
  return (unint64_t)([(id)UIApp _defaultSceneInterfaceOrientationReturningUnknownForNilScene:0]- 3) < 2;
}

- (void)setDrawsBackground:(BOOL)a3
{
  BOOL v3 = a3;
  WebThreadLock();
  [(WebView *)self->_webView setDrawsBackground:v3];
  [(UIWebTiledView *)self setTilesOpaque:v3];
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIWebDocumentView;
  -[UIView setOpaque:](&v5, sel_setOpaque_);
  [(UIWebDocumentView *)self setDrawsBackground:v3];
}

- (CGImage)newSnapshotWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  WebThreadLock();
  [(UIWebTiledView *)self layoutTilesNow];
  v9.receiver = self;
  v9.super_class = (Class)UIWebDocumentView;
  return -[UIView newSnapshotWithRect:](&v9, sel_newSnapshotWithRect_, x, y, width, height);
}

- (BOOL)cancelMouseTracking
{
  uint64_t v2 = (void *)DynamicCastUIScrollView((uint64_t)[(UIView *)self _scroller]);
  if (v2)
  {
    LOBYTE(v2) = [v2 cancelTouchTracking];
  }
  return (char)v2;
}

- (BOOL)cancelTouchTracking
{
  uint64_t v2 = (void *)DynamicCastUIScrollView((uint64_t)[(UIView *)self _scroller]);
  if (v2)
  {
    LOBYTE(v2) = [v2 cancelTouchTracking];
  }
  return (char)v2;
}

- (void)setIgnoresFocusingMouse:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 952) = *((unsigned char *)self + 952) & 0xFB | v3;
}

- (void)setIgnoresKeyEvents:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 952) = *((unsigned char *)self + 952) & 0xF7 | v3;
}

- (void)setTilingArea:(int)a3
{
  if ((*((unsigned char *)self + 955) & 8) == 0) {
    goto LABEL_5;
  }
  if (!a3) {
    return;
  }
  if (a3 == 1)
  {
    *((unsigned char *)self + 955) &= ~8u;
  }
  else
  {
LABEL_5:
    v3.receiver = self;
    v3.super_class = (Class)UIWebDocumentView;
    [(UIWebTiledView *)&v3 setTilingArea:*(void *)&a3];
  }
}

- (void)_cancelLongPressGestureRecognizer
{
}

- (void)_didScroll
{
  self->_mouseDownCount = 0;
  [(UIWebDocumentView *)self cancelInteractionWithImmediateDisplay:1];
  [(UIWebDocumentView *)self _cancelLongPressGestureRecognizer];
  if (objc_msgSend((id)DynamicCastUIScrollView((uint64_t)-[UIView _scroller](self, "_scroller")), "isDragging"))
  {
    *((unsigned char *)self + 953) &= ~0x10u;
    [(UIWebDocumentView *)self _clearDoubleTapRect];
    if ((*((unsigned char *)self + 955) & 8) != 0)
    {
      *((unsigned char *)self + 955) &= ~8u;
      v12.receiver = self;
      v12.super_class = (Class)UIWebDocumentView;
      [(UIWebTiledView *)&v12 setTilingArea:0];
    }
  }
  id v3 = [(UIView *)self _scroller];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 _verticalVelocity];
    double v6 = v5;
    [v4 _horizontalVelocity];
    double v8 = -v6;
    if (v6 >= 0.0) {
      double v8 = v6;
    }
    if (v7 >= 0.0)
    {
      unsigned int v9 = 3;
    }
    else
    {
      double v7 = -v7;
      unsigned int v9 = 2;
    }
    if (v8 >= v7) {
      uint64_t v10 = v6 >= 0.0;
    }
    else {
      uint64_t v10 = v9;
    }
    [(WAKWindow *)self->super._wakWindow setTilingDirection:v10];
    if ((*((unsigned char *)self + 957) & 2) == 0) {
      [(UIWebDocumentView *)self _updateFixedPositionContent];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIWebDocumentView;
  [(UIWebTiledView *)&v11 _didScroll];
}

- (BOOL)_isSubviewOfPlugInView:(id)a3
{
  BOOL v3 = 0;
  if (a3 && self->_plugInViews)
  {
    id v5 = a3;
    do
    {
      Value = CFDictionaryGetValue(self->_plugInViews, v5);
      BOOL v3 = Value != 0;
      if (Value) {
        break;
      }
      id v5 = (id)[v5 superview];
    }
    while (v5);
  }
  return v3;
}

- (void)_notifyPlugInViewsOfWillBeginZooming
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    uint64_t v4 = (void *)[(__CFDictionary *)self->_plugInViews copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          unsigned int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 _webViewWillBeginZooming];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_notifyPlugInViewsOfDidEndZooming
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    uint64_t v4 = (void *)[(__CFDictionary *)self->_plugInViews copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          unsigned int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 _webViewDidEndZooming:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_notifyPlugInViewsOfDidZoom
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    [(UIView *)self transform];
    double v4 = v15;
    uint64_t v5 = (void *)[(__CFDictionary *)self->_plugInViews copy];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 _webViewDidZoomWithRelativeScale:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_notifyPlugInViewsOfScaleChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  plugInViews = self->_plugInViews;
  if (plugInViews && CFDictionaryGetCount(plugInViews))
  {
    double v4 = (void *)[(__CFDictionary *)self->_plugInViews copy];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 _webViewScaleDidChange];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)UIWebDocumentView;
  -[UIView _didMoveFromWindow:toWindow:](&v17, sel__didMoveFromWindow_toWindow_);
  uint64_t v7 = (void *)[(__CFDictionary *)self->_plugInViews copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 superview]) {
          [v12 _didMoveFromWindow:a3 toWindow:a4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_notifyContentHostingLayersOfScaleChange
{
  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  [(UIView *)self bounds];
  -[CALayer setFrame:](contentLayersHostingLayer, "setFrame:");
}

- (void)setExposedScrollViewRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_exposedScrollViewRect = &self->_exposedScrollViewRect;
  if (!CGRectEqualToRect(self->_exposedScrollViewRect, a3))
  {
    p_exposedScrollViewRect->origin.CGFloat x = x;
    p_exposedScrollViewRect->origin.CGFloat y = y;
    p_exposedScrollViewRect->size.CGFloat width = width;
    p_exposedScrollViewRect->size.CGFloat height = height;
    [(UIWebDocumentView *)self _updateWebKitExposedScrollViewRect];
    [(UIWebDocumentView *)self _updateFixedPositionContent];
  }
}

- (void)_updateWebKitExposedScrollViewRect
{
  id v3 = [(UIView *)self _scroller];
  double x = self->_exposedScrollViewRect.origin.x;
  double y = self->_exposedScrollViewRect.origin.y;
  double width = self->_exposedScrollViewRect.size.width;
  double height = self->_exposedScrollViewRect.size.height;
  [(UIView *)self frame];
  if (v3)
  {
    [(UIView *)self bounds];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v3);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v26.size.double width = v14;
    v26.size.double height = v15;
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    v26.origin.double x = v11;
    v26.origin.double y = v13;
    CGRect v24 = CGRectIntersection(v23, v26);
    double x = v24.origin.x;
    double y = v24.origin.y;
    double width = v24.size.width;
    double height = v24.size.height;
  }
  else
  {
    CGFloat v11 = v8;
    CGFloat v13 = v9;
  }
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  IsEmptdouble y = CGRectIsEmpty(v25);
  double v17 = 0.0;
  if (IsEmpty) {
    double v18 = 0.0;
  }
  else {
    double v18 = v13;
  }
  double v19 = y - v18;
  if (!IsEmpty) {
    double v17 = v11;
  }
  wakWindow = self->super._wakWindow;
  double v21 = x - v17;
  -[WAKWindow setExposedScrollViewRect:](wakWindow, "setExposedScrollViewRect:", v21, v19, width, height);
}

- (CGRect)_documentViewVisibleRect
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UIView *)self _scroller];
  if (v11)
  {
    double v12 = v11;
    if (CGRectIsNull(self->_exposedScrollViewRect))
    {
      [v12 bounds];
      CGFloat x = v13;
      CGFloat y = v15;
      CGFloat width = v17;
      CGFloat height = v19;
    }
    else
    {
      CGFloat x = self->_exposedScrollViewRect.origin.x;
      CGFloat y = self->_exposedScrollViewRect.origin.y;
      CGFloat width = self->_exposedScrollViewRect.size.width;
      CGFloat height = self->_exposedScrollViewRect.size.height;
    }
    -[UIView convertRect:toView:](self, "convertRect:toView:", v12, v4, v6, v8, v10);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRect v29 = CGRectIntersection(v28, v33);
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    double v4 = v30.origin.x;
    double v6 = v30.origin.y;
    double v8 = v30.size.width;
    double v10 = v30.size.height;
    if (CGRectIsNull(v30))
    {
      [(UIView *)self bounds];
      double v4 = v21;
      double v6 = v22;
      double v8 = v23;
      double v10 = v24;
    }
  }
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeScale(&v27, self->_documentScale, self->_documentScale);
  CGAffineTransform v25 = v27;
  CGAffineTransformInvert(&v26, &v25);
  CGAffineTransform v27 = v26;
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  return CGRectApplyAffineTransform(v31, &v26);
}

- (CGRect)_layoutRectForFixedPositionObjects
{
  [(UIWebDocumentView *)self _documentViewVisibleRect];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  if ([(UIView *)self _scroller])
  {
    [(UIWebDocumentView *)self _zoomedDocumentScale];
    double v12 = v11;
    float v13 = fmin(v11, 1.20000005);
    [(_UIWebViewportHandler *)self->_viewportHandler minimumScale];
    if (v14 <= v13 || v14 == -1.0) {
      float v14 = v13;
    }
    double v16 = v14;
    if (v12 > v14)
    {
      [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
      if (!CGRectIsEmpty(v33))
      {
        [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
        double v20 = v18 - height;
        double v22 = v21 + v19 - width;
        double v23 = v19 * (x - v21) / (v19 - width);
        if (v22 > 0.0) {
          double v24 = v23;
        }
        else {
          double v24 = 0.0;
        }
        memset(&v32.c, 0, 32);
        if (v17 + v20 > 0.0) {
          double v25 = v18 * (y - v17) / v20;
        }
        else {
          double v25 = 0.0;
        }
        *(_OWORD *)&v32.a = 0uLL;
        CGAffineTransformMakeTranslation(&v32, v24, v25);
        CGAffineTransform v30 = v32;
        CGAffineTransformScale(&v31, &v30, v12 / v16, v12 / v16);
        CGAffineTransform v32 = v31;
        CGAffineTransform v30 = v31;
        CGAffineTransformTranslate(&v31, &v30, -v24, -v25);
        CGAffineTransform v32 = v31;
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        CGRect v35 = CGRectApplyAffineTransform(v34, &v31);
        double x = v35.origin.x;
        double y = v35.origin.y;
        double width = v35.size.width;
        double height = v35.size.height;
      }
    }
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)_updateFixedPositionedObjectsLayoutRectUsingWebThread:(BOOL)a3 synchronize:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(UIWebDocumentView *)self _layoutRectForFixedPositionObjects];
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  CGRect v17 = CGRectIntegral(v16);
  double v11 = v17.origin.x;
  double v12 = v17.origin.y;
  double v13 = v17.size.width;
  double v14 = v17.size.height;
  if (!v5)
  {
    BOOL v15 = +[UIView areAnimationsEnabled];
    +[UIView setAnimationsEnabled:0];
    -[WebView _setCustomFixedPositionLayoutRect:](self->_webView, "_setCustomFixedPositionLayoutRect:", v11, v12, v13, v14);
    +[UIView setAnimationsEnabled:v15];
    if (!v4) {
      return;
    }
    goto LABEL_5;
  }
  -[WebView _setCustomFixedPositionLayoutRectInWebThread:synchronize:](self->_webView, "_setCustomFixedPositionLayoutRectInWebThread:synchronize:", v4, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  if (v4)
  {
LABEL_5:
    self->_fixedLayoutOriginRoundingDelta.double width = x - v11;
    self->_fixedLayoutOriginRoundingDelta.double height = y - v12;
    self->_fixedLayoutSizeRoundingDelta.double width = width - v13;
    self->_fixedLayoutSizeRoundingDelta.double height = height - v14;
  }
}

- (CGRect)_adjustedLayoutRectForFixedPositionObjects
{
  [(UIWebDocumentView *)self _layoutRectForFixedPositionObjects];
  double v4 = v3 - self->_fixedLayoutOriginRoundingDelta.width;
  double v6 = v5 - self->_fixedLayoutOriginRoundingDelta.height;
  double v8 = v7 - self->_fixedLayoutSizeRoundingDelta.width;
  double v10 = v9 - self->_fixedLayoutSizeRoundingDelta.height;
  result.size.double height = v10;
  result.size.double width = v8;
  result.origin.double y = v6;
  result.origin.double x = v4;
  return result;
}

- (void)_updateFixedPositionContent
{
  double v3 = (void *)[(WebView *)self->_webView _fixedPositionContent];
  if ([v3 hasFixedOrStickyPositionLayers])
  {
    [(UIWebDocumentView *)self _adjustedLayoutRectForFixedPositionObjects];
    objc_msgSend(v3, "scrollOrZoomChanged:");
  }
}

- (void)writeDataToPasteboard:(id)a3
{
  if (-[UITextSelection granularity](-[UITextInteractionAssistant activeSelection](self->_textSelectionAssistant, "activeSelection"), "granularity") == 1)[a3 setValue:@"NeXT smart paste pasteboard type" forKey:@"NeXT smart paste pasteboard type"]; {
  double v4 = +[UIPasteboard generalPasteboard];
  }
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  [(UIPasteboard *)v4 setItems:v5];
}

- (int64_t)getPasteboardItemsCount
{
  uint64_t v2 = +[UIPasteboard generalPasteboard];
  return [(UIPasteboard *)v2 numberOfItems];
}

- (BOOL)isInsideRichlyEditableTextWidget
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id m_parentTextView = self->m_parentTextView;
  return [m_parentTextView allowsEditingTextAttributes];
}

- (BOOL)hasRichlyEditableSelection
{
  if (self->_isPerformingDrop)
  {
    id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
    LOBYTE(v4) = [v3 hasRichlyEditableDragCaret];
  }
  else
  {
    LODWORD(v4) = [(UIWebDocumentView *)self hasSelection];
    if (v4)
    {
      if ([(UIWebDocumentView *)self isInsideRichlyEditableTextWidget])
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        id v4 = [(UIWebDocumentView *)self formElement];
        if (v4)
        {
          id v5 = [(UIWebDocumentView *)self formElement];
          LOBYTE(v4) = [v5 isContentEditable];
        }
      }
    }
  }
  return (char)v4;
}

- (BOOL)fragmentContainsRichContent:(id)a3
{
  return [(NSArray *)[+[UIPasteboard generalPasteboard] valuesForPasteboardType:@"iOS rich content paste pasteboard type" inItemSet:0] count] != 0;
}

- (BOOL)performTwoStepDrop:(id)a3 atDestination:(id)a4 isMove:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance", 0), "pasteboardTypes");
    uint64_t v5 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v10 = v5;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (qword_1EB25C088 != -1) {
            dispatch_once(&qword_1EB25C088, &__block_literal_global_1694);
          }
          if ([(id)qword_1EB25C080 containsObject:v13])
          {
            WebThreadLock();
            LODWORD(v5) = [(UIWebDocumentView *)self hasRichlyEditableSelection];
            if (v5) {
              LOBYTE(v5) = [(UIWebDocumentView *)self _insertFragmentWithoutPreservingStyle:a3 atDestination:a4 smartReplace:0 collapseToEnd:0];
            }
            return v5;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        LOBYTE(v5) = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  return v5;
}

- (BOOL)performsTwoStepPaste:(id)a3
{
  WebThreadLock();
  if (![(UIWebDocumentView *)self hasRichlyEditableSelection]
    || ![(UIWebDocumentView *)self fragmentContainsRichContent:a3])
  {
    return 0;
  }
  uint64_t v5 = +[UIPasteboard generalPasteboard];
  BOOL v6 = [(UIPasteboard *)v5 numberOfItems] == 1
    && [(UIPasteboard *)v5 valueForPasteboardType:@"NeXT smart paste pasteboard type"] != 0;
  return [(UIWebDocumentView *)self _insertFragmentWithoutPreservingStyle:a3 atDestination:0 smartReplace:v6 collapseToEnd:1];
}

- (BOOL)_insertFragmentWithoutPreservingStyle:(id)a3 atDestination:(id)a4 smartReplace:(BOOL)a5 collapseToEnd:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  id v12 = [(UIWebDocumentView *)self undoManager];
  uint64_t v13 = [v12 groupsByEvent];
  [v12 setGroupsByEvent:0];
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "beginUndoGrouping");
  if (a4) {
    [v11 setSelectedDOMRange:a4 affinity:1 closeTyping:1];
  }
  [v11 _replaceSelectionWithFragment:a3 selectReplacement:1 smartReplace:v7 matchStyle:0];
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "endUndoGrouping");
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "beginUndoGrouping");
  [v11 removeUnchangeableStyles];
  if (v6 && [(UITextRange *)[(UIWebDocumentView *)self selectedTextRange] end]) {
    [(UIWebDocumentView *)self setSelectedTextRange:[(UIWebDocumentView *)self textRangeFromPosition:[(UITextRange *)[(UIWebDocumentView *)self selectedTextRange] end] toPosition:[(UITextRange *)[(UIWebDocumentView *)self selectedTextRange] end]]];
  }
  objc_msgSend(-[UIWebDocumentView undoManager](self, "undoManager"), "endUndoGrouping");
  [v12 setGroupsByEvent:v13];
  return 1;
}

- (id)_supportedPasteboardTypesForCurrentSelection
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
  {
    return (id)[m_parentTextView supportedPasteboardTypesForCurrentSelection];
  }
  else
  {
    if (!qword_1EB25C058)
    {
      qword_1EB25C058 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend((id)qword_1EB25C058, "addObject:", objc_msgSend((id)*MEMORY[0x1E4F444F8], "identifier"));
      [(id)qword_1EB25C058 addObjectsFromArray:UIPasteboardTypeListString];
      qword_1EB25C050 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(id)qword_1EB25C050 addObject:*MEMORY[0x1E4FB6E28]];
      objc_msgSend((id)qword_1EB25C050, "addObject:", objc_msgSend((id)*MEMORY[0x1E4F444A0], "identifier"));
      objc_msgSend((id)qword_1EB25C050, "addObject:", objc_msgSend((id)*MEMORY[0x1E4F443C0], "identifier"));
      [(id)qword_1EB25C050 addObjectsFromArray:UIPasteboardTypeListImage];
      [(id)qword_1EB25C050 addObjectsFromArray:qword_1EB25C058];
    }
    BOOL v5 = [(UIWebDocumentView *)self hasRichlyEditableSelection];
    uint64_t v6 = 16;
    if (v5) {
      uint64_t v6 = 8;
    }
    return *(id *)&_MergedGlobals_25[v6];
  }
}

- (id)supportedPasteboardTypesForCurrentSelection
{
  if (![(UIWebDocumentView *)self hasSelection]) {
    return 0;
  }
  return [(UIWebDocumentView *)self _supportedPasteboardTypesForCurrentSelection];
}

- (id)readDataFromPasteboard:(id)a3 withIndex:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)*MEMORY[0x1E4F444F8], "identifier")) & 1) != 0
    || [UIPasteboardTypeListString containsObject:a3])
  {
    uint64_t v6 = +[UIPasteboard generalPasteboard];
    return [(UIPasteboard *)v6 valuesForPasteboardType:a3 inItemSet:v5];
  }
  else
  {
    double v8 = +[UIPasteboard generalPasteboard];
    return [(UIPasteboard *)v8 dataForPasteboardType:a3 inItemSet:v5];
  }
}

- (int64_t)getPasteboardChangeCount
{
  uint64_t v2 = +[UIPasteboard generalPasteboard];
  return [(UIPasteboard *)v2 changeCount];
}

- (void)showPlaybackTargetPicker:(BOOL)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v8 = a3;
  playbackTargetPicker = self->_playbackTargetPicker;
  if (!playbackTargetPicker)
  {
    id v11 = objc_alloc_init(UIWebPlaybackTargetPicker);
    self->_playbackTargetPicker = v11;
    [(UIWebPlaybackTargetPicker *)v11 setDelegate:self];
    playbackTargetPicker = self->_playbackTargetPicker;
  }
  -[UIWebPlaybackTargetPicker show:fromRect:](playbackTargetPicker, "show:fromRect:", v8, x, y, width, height);
}

- (int)deviceOrientation
{
  int64_t orientation = self->_orientation;
  switch(orientation)
  {
    case 1:
      return 0;
    case 3:
      return 90;
    case 4:
      return -90;
    case 2:
      return 180;
  }
  return 0;
}

- (BOOL)shouldSuppressPasswordEcho
{
  if ([(UIScreen *)[(UIWindow *)[(UIView *)self window] screen] isCaptured]) {
    return 1;
  }
  return +[UIKeyboard isInHardwareKeyboardMode];
}

- (void)revealedSelectionByScrollingWebFrame:(id)a3
{
}

- (void)_webthread_webView:(id)a3 attachRootLayer:(id)a4
{
  if (!self->_contentLayersHostingLayer)
  {
    self->_contentLayersHostingLayer = (CALayer *)(id)objc_msgSend(MEMORY[0x1E4F39BE8], "layer", a3);
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"anchorPoint", v6, @"bounds", v6, @"contents", v6, @"opacity", v6, @"position", v6, @"shadowColor", v6, @"sublayerTransform", v6, @"sublayers", v6, @"transform",
           v6,
           @"zPosition",
           v6,
           @"hidden",
           0);
    -[CALayer setStyle:](self->_contentLayersHostingLayer, "setStyle:", [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"actions"]);
    -[CALayer setAnchorPoint:](self->_contentLayersHostingLayer, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    contentLayersHostingLayer = self->_contentLayersHostingLayer;
    [(UIView *)self bounds];
    -[CALayer setFrame:](contentLayersHostingLayer, "setFrame:");
    if ((*((unsigned char *)self + 952) & 0x10) != 0)
    {
      double v9 = self->_contentLayersHostingLayer;
      [(_UIWebViewportHandler *)self->_viewportHandler documentBounds];
      -[CALayer setBounds:](v9, "setBounds:");
    }
    memset(&v15, 0, sizeof(v15));
    CATransform3DMakeScale(&v15, self->_documentScale, self->_documentScale, 1.0);
    uint64_t v10 = self->_contentLayersHostingLayer;
    CATransform3D v14 = v15;
    [(CALayer *)v10 setTransform:&v14];
    id v11 = objc_msgSend(-[UIView _layer](self, "_layer"), "sublayers");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__UIWebDocumentView__webthread_webView_attachRootLayer___block_invoke;
    v13[3] = &unk_1E5304D58;
    v13[4] = self;
    [v11 enumerateObjectsUsingBlock:v13];
    if (![(CALayer *)self->_contentLayersHostingLayer superlayer])
    {
      objc_msgSend(-[UIView _layer](self, "_layer"), "addSublayer:", self->_contentLayersHostingLayer);
      if (a4) {
        goto LABEL_6;
      }
LABEL_10:
      id v12 = (void *)[(NSArray *)[(CALayer *)self->_contentLayersHostingLayer sublayers] copy];
      [v12 makeObjectsPerformSelector:sel_removeFromSuperlayer];

      return;
    }
  }
  if (!a4) {
    goto LABEL_10;
  }
LABEL_6:
  if (![(UIWebDocumentView *)self _shouldResetForNewPage]) {
    [(CALayer *)self->_contentLayersHostingLayer setHidden:1];
  }
  [(CALayer *)self->_contentLayersHostingLayer addSublayer:a4];
}

uint64_t __56__UIWebDocumentView__webthread_webView_attachRootLayer___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = result;
    CGRect result = [a2 delegate];
    if (result)
    {
      objc_opt_class();
      CGRect result = objc_opt_isKindOfClass();
      if (result)
      {
        CGRect result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "_layer"), "insertSublayer:atIndex:", *(void *)(*(void *)(v6 + 32) + 648), a3);
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)webViewDidCommitCompositingLayerChanges:(id)a3
{
  if (*((unsigned char *)self + 957)) {
    [(UIWebDocumentView *)self _updateSubviewCaches];
  }
  [(UIWebDocumentView *)self _reshapePlugInViews];
}

- (void)_setSubviewCachesNeedUpdate:(BOOL)a3
{
  *((unsigned char *)self + 957) = *((unsigned char *)self + 957) & 0xFE | a3;
}

- (id)_collectAdditionalSubviews
{
  return 0;
}

- (void)_updateSubviewCaches
{
  self->_additionalSubviews = (NSArray *)[(UIWebDocumentView *)self _collectAdditionalSubviews];
  [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:0];
}

- (BOOL)_shouldUpdateSubviewCachesForPlugins
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    CFDictionaryRef plugInViews = (const __CFDictionary *)CFDictionaryGetCount(plugInViews);
    if (plugInViews)
    {
      id v4 = (void *)[(__CFDictionary *)self->_plugInViews allValues];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      CFDictionaryRef plugInViews = (const __CFDictionary *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (plugInViews)
      {
        uint64_t v5 = (uint64_t)plugInViews;
        uint64_t v6 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v4);
            }
            BOOL v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
            if ([v8 willProvidePluginLayer]
              && ![(NSArray *)self->_additionalSubviews containsObject:v8])
            {
              LOBYTE(plugInViews) = 1;
              return (char)plugInViews;
            }
          }
          uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
          LOBYTE(plugInViews) = 0;
          if (v5) {
            continue;
          }
          break;
        }
      }
    }
  }
  return (char)plugInViews;
}

- (id)subviews
{
  char v3 = *((unsigned char *)self + 957);
  if ((v3 & 1) == 0)
  {
    BOOL v4 = [(UIWebDocumentView *)self _shouldUpdateSubviewCachesForPlugins];
    char v3 = *((unsigned char *)self + 957);
    if (v4)
    {
      v3 |= 1u;
      *((unsigned char *)self + 957) = v3;
    }
  }
  if (v3) {
    [(UIWebDocumentView *)self _updateSubviewCaches];
  }
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentView;
  uint64_t v5 = [(UIView *)&v7 subviews];
  if ([(NSArray *)self->_additionalSubviews count]
    && ![(UIWebDocumentView *)self _isInspectorSearchingForNode])
  {
    return [(NSArray *)self->_additionalSubviews arrayByAddingObjectsFromArray:v5];
  }
  return v5;
}

- (void)webViewDidDrawTiles:(id)a3
{
  *((unsigned char *)self + 956) |= 0x80u;
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate webViewDidDrawTiles:self];
  }
}

- (void)_renderUnbufferedInContext:(CGContext *)a3
{
  if ((WebThreadIsCurrent() & 1) == 0) {
    WebThreadLock();
  }
  objc_msgSend((id)-[WAKWindow contentView](self->super._wakWindow, "contentView"), "viewWillDraw");
  WKGetCurrentGraphicsContext();
  WKSetCurrentGraphicsContext();
  wakWindow = self->super._wakWindow;
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  -[WAKWindow displayRect:](wakWindow, "displayRect:", ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height);
  WKSetCurrentGraphicsContext();
  BOOL v6 = [(CALayer *)self->_contentLayersHostingLayer isHidden];
  [(CALayer *)self->_contentLayersHostingLayer setHidden:0];
  CGContextSaveGState(a3);
  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  if (contentLayersHostingLayer) {
    [(CALayer *)contentLayersHostingLayer transform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DGetAffineTransform(&transform, &v8);
  CGContextConcatCTM(a3, &transform);
  [(CALayer *)self->_contentLayersHostingLayer renderInContext:a3];
  CGContextRestoreGState(a3);
  [(CALayer *)self->_contentLayersHostingLayer setHidden:v6];
}

- (id)checkSpellingOfString:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!self->_textChecker) {
    self->_textChecker = (UITextChecker *)[[UITextChecker alloc] _initWithAsynchronousLoading:1];
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(UITextChecker *)self->_textChecker _doneLoading])
  {
    BOOL v6 = objc_msgSend(+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), "currentInputMode");
    if (objc_msgSend((id)objc_msgSend(v6, "multilingualLanguages"), "count"))
    {
      uint64_t v7 = [v6 multilingualLanguages];
    }
    else
    {
      if (![v6 primaryLanguage])
      {
        uint64_t v8 = MEMORY[0x1E4F1CBF0];
LABEL_9:
        uint64_t v9 = [a3 length];
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self->_textChecker, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", a3, 0, v9, v10, 0, v8);
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v13 = v11;
          uint64_t v14 = v12;
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v12));
          unint64_t v10 = v13 + v14;
        }
        while (v10 < [a3 length]);
        return v5;
      }
      v16[0] = [v6 languageWithRegion];
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    uint64_t v8 = v7;
    goto LABEL_9;
  }
  return v5;
}

- (void)_reshapePlugInViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef plugInViews = self->_plugInViews;
  if (plugInViews)
  {
    char v3 = (void *)[(__CFDictionary *)plugInViews allValues];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) reshape];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)redrawScaledDocument
{
  [(UIWebDocumentView *)self _restoreFlattenedContentLayers];
  *((unsigned char *)self + 957) &= ~2u;
  WebThreadLock();
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIWebDocumentView *)self _zoomedDocumentScale];
  double v12 = v11;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v27[0] = *MEMORY[0x1E4F1DAB8];
  v27[1] = v13;
  v27[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIWebTiledView *)self setTransform:v27];
  double v14 = round(v4);
  double v15 = round(v6);
  [(_UIWebViewportHandler *)self->_viewportHandler availableViewSize];
  double v17 = round(v10);
  double v19 = round(v18);
  if (v17 >= v19) {
    double v20 = v17;
  }
  else {
    double v20 = v19;
  }
  double v21 = round(v8);
  double v22 = round(v16);
  if (v21 >= v22) {
    double v23 = v21;
  }
  else {
    double v23 = v22;
  }
  *((unsigned char *)self + 954) |= 0x40u;
  -[UIWebDocumentView setFrame:](self, "setFrame:", v14, v15, v23, v20);
  float documentScale = self->_documentScale;
  viewportHandler = self->_viewportHandler;
  if ((*((unsigned char *)self + 953) & 8) != 0)
  {
    [(_UIWebViewportHandler *)viewportHandler minimumScale];
    if (v12 > *(float *)&v26) {
      *(float *)&double v26 = v12;
    }
  }
  else
  {
    [(_UIWebViewportHandler *)viewportHandler initialScale];
  }
  [(UIWebDocumentView *)self _setDocumentScale:v26];
  *((unsigned char *)self + 954) &= ~0x40u;
  if (self->_documentScale != documentScale)
  {
    [(UIWebDocumentView *)self _updateScrollViewBoundaryZoomScales];
    [(UIWebTiledView *)self removeForegroundTiles];
    [(UIWebTiledView *)self layoutTilesNow];
    [(UIWebDocumentView *)self _reshapePlugInViews];
  }
  [(UIWebDocumentView *)self updateInteractionElements];
}

- (void)updateInteractionElements
{
  [(UITextInteractionAssistant *)self->_textSelectionAssistant setNeedsSelectionDisplayUpdate];
  if ([(UIWebDocumentView *)self isEditing])
  {
    double v3 = [(UIWebDocumentView *)self inputDelegate];
    if (objc_opt_respondsToSelector())
    {
      [(UITextInputDelegate *)v3 layoutHasChanged];
    }
  }
}

- (void)willRotateInteractionSheet
{
  p_interaction = &self->_interaction;
  if (self->_interaction.var0
    && ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    var0 = p_interaction->var0;
    [(UIWebRotatingAlertController *)var0 willRotate];
  }
}

- (void)didRotateInteractionSheet
{
  p_interaction = &self->_interaction;
  if (self->_interaction.var0
    && ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    var0 = p_interaction->var0;
    [(UIWebRotatingAlertController *)var0 didRotate];
  }
}

- (void)sendOrientationEventForOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_int64_t orientation = a3;
    double v3 = [(WebView *)self->_webView mainFrame];
    [(WebFrame *)v3 deviceOrientationChanged];
  }
}

- (void)setShouldOnlyRecognizeGesturesOnActiveElements:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 956) = *((unsigned char *)self + 956) & 0xF7 | v3;
}

- (BOOL)shouldOnlyRecognizeGesturesOnActiveElements
{
  return (*((unsigned __int8 *)self + 956) >> 3) & 1;
}

- (void)setMediaPlaybackAllowsAirPlay:(BOOL)a3
{
  BOOL v3 = a3;
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  double v5 = [(WebView *)self->_webView preferences];
  [(WebPreferences *)v5 setMediaPlaybackAllowsAirPlay:v3];
}

- (BOOL)mediaPlaybackAllowsAirPlay
{
  if ((WebThreadIsLocked() & 1) == 0) {
    WebThreadLock();
  }
  BOOL v3 = [(WebView *)self->_webView preferences];
  return [(WebPreferences *)v3 mediaPlaybackAllowsAirPlay];
}

- (void)setAlwaysConstrainsScale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 953) = *((unsigned char *)self + 953) & 0xFD | v3;
}

- (BOOL)alwaysConstrainsScale
{
  return (*((unsigned __int8 *)self + 953) >> 1) & 1;
}

- (void)setDoubleTapEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_doubleTapGestureRecognizer, "setEnabled:");
  twoFingerDoubleTapGestureRecognizer = self->_twoFingerDoubleTapGestureRecognizer;
  [(UIGestureRecognizer *)twoFingerDoubleTapGestureRecognizer setEnabled:v3];
}

- (BOOL)isDoubleTapEnabled
{
  return [(UIGestureRecognizer *)self->_doubleTapGestureRecognizer isEnabled];
}

- (BOOL)_handleSingleTapZoomPreClickAtLocation:(CGPoint)a3
{
  if ((*((unsigned char *)self + 953) & 4) == 0 || (*((unsigned char *)self + 953) & 0x20) != 0) {
    return 0;
  }
  else {
    return _UIWebSingleTapZoomAtLocationPreClick(self, a3.x, a3.y);
  }
}

- (void)_handleSingleTapZoomPostClickAtLocation:(CGPoint)a3
{
  if ((*((unsigned char *)self + 953) & 4) != 0 && (*((unsigned char *)self + 953) & 0x20) == 0) {
    _UIWebSingleTapZoomAtLocationPostClick(self, a3.x, a3.y);
  }
}

- (void)_handleDoubleTapAtLocation:(CGPoint)a3
{
  if ((*((unsigned char *)self + 953) & 4) != 0 && (*((unsigned char *)self + 953) & 0x20) == 0) {
    _UIWebDoubleTapAtLocation(self, a3.x, a3.y);
  }
}

- (void)_handleTwoFingerDoubleTapAtLocation:(CGPoint)a3
{
  if ((*((unsigned char *)self + 953) & 4) != 0 && (*((unsigned char *)self + 953) & 0x20) == 0) {
    zoomToMinimumScaleCenteringOnLocation(self, a3.x, a3.y);
  }
}

- (CGRect)doubleTapRect
{
  double x = self->_doubleTapRect.origin.x;
  double y = self->_doubleTapRect.origin.y;
  double width = self->_doubleTapRect.size.width;
  double height = self->_doubleTapRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)doubleTapRectIsReplaced
{
  return *((unsigned char *)self + 954) & 1;
}

- (void)assistFormNode:(id)a3
{
}

- (void)_focusAndAssistFormNode:(id)a3
{
  WebThreadLock();
  [a3 focus];
}

- (id)formElement
{
  return 0;
}

- (id)textFormElement
{
  return 0;
}

- (void)setIsStandaloneEditableView:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 954) = *((unsigned char *)self + 954) & 0xFD | v3;
}

- (BOOL)isStandaloneEditableView
{
  return (*((unsigned __int8 *)self + 954) >> 1) & 1;
}

- (void)setStandaloneEditingElement:(id)a3
{
  standaloneEditingElement = self->_standaloneEditingElement;
  self->_standaloneEditingElement = (DOMHTMLElement *)a3;
}

- (id)standaloneEditingElement
{
  return self->_standaloneEditingElement;
}

- (void)setIsWidgetEditingView:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 954) = *((unsigned char *)self + 954) & 0xFB | v3;
}

- (BOOL)isWidgetEditingView
{
  return (*((unsigned __int8 *)self + 954) >> 2) & 1;
}

- (BOOL)updateKeyboardStateOnResponderChanges
{
  BOOL result = 0;
  if ((*((unsigned char *)self + 952) & 8) == 0)
  {
    if ((*((unsigned char *)self + 954) & 4) != 0) {
      return 1;
    }
    if ((*((unsigned char *)self + 954) & 2) != 0) {
      return 1;
    }
    id m_parentTextView = self->m_parentTextView;
    if (m_parentTextView)
    {
      if ([m_parentTextView isEditable]) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
  {
    return [m_parentTextView becomeFirstResponder];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIWebDocumentView;
    if (![(UIView *)&v6 becomeFirstResponder]) {
      return 0;
    }
    if (self->_learnSession) {
      [(UIWebDocumentView *)self _removeShortcutController:0];
    }
    WebThreadLock();
    *((unsigned char *)self + 956) |= 0x10u;
    [(WAKWindow *)self->super._wakWindow makeFirstResponder:[(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView]];
    BOOL v5 = 1;
    [(UITextInteractionAssistant *)self->_textSelectionAssistant setSelectionDisplayVisible:1];
    [(UITextInteractionAssistant *)self->_textSelectionAssistant activateSelection];
    *((unsigned char *)self + 956) &= ~0x10u;
    return v5;
  }
}

- (void)deferredBecomeFirstResponder
{
  if (self->m_parentTextView) {
    self = (UIWebDocumentView *)self->m_parentTextView;
  }
  [(UIWebDocumentView *)self becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  char v3 = self;
  if ((*((unsigned char *)self + 956) & 1) != 0 || ![(UIView *)self isFirstResponder]) {
    return 1;
  }
  if (![(UIWebDocumentView *)self canResignFirstResponder]) {
    return 0;
  }
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView)
  {
    if (![m_parentTextView canResignFirstResponder]) {
      return 0;
    }
  }
  *((unsigned char *)self + 956) |= 1u;
  BOOL v5 = 1;
  [(UIWebDocumentView *)self cancelInteractionWithImmediateDisplay:1];
  v7.receiver = self;
  v7.super_class = (Class)UIWebDocumentView;
  [(UIResponder *)&v7 resignFirstResponder];
  [self->m_parentTextView resignFirstResponder];
  [(UIWebDocumentView *)self _removeDefinitionController:1];
  [(UIWebDocumentView *)self _removeShareController:1];
  [(UIWebDocumentView *)self clearWKFirstResponder];
  [(UITextInteractionAssistant *)self->_textSelectionAssistant resignedFirstResponder];
  *((unsigned char *)self + 956) &= ~1u;
  return v5;
}

- (id)_responderForBecomeFirstResponder
{
  WebThreadLock();
  id v3 = [(WebView *)self->_webView editingDelegate];
  if (!v3) {
    return self;
  }
  double v4 = v3;
  if ((objc_msgSend(v3, "__isKindOfUIResponder") & 1) == 0) {
    return self;
  }
  return v4;
}

- (BOOL)makeWKFirstResponder
{
  if (self->_learnSession) {
    [(UIWebDocumentView *)self _removeShortcutController:0];
  }
  WebThreadLock();
  id v3 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
  wakWindow = self->super._wakWindow;
  return [(WAKWindow *)wakWindow makeFirstResponder:v3];
}

- (BOOL)clearWKFirstResponder
{
  WebThreadLock();
  if (_MergedGlobals_25[0] != 1)
  {
    double v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_resignFirstResponder);
    IMP Implementation = method_getImplementation(InstanceMethod);
    objc_super v7 = (objc_class *)[(id)objc_opt_class() superclass];
    double v8 = class_getInstanceMethod(v7, sel_resignFirstResponder);
    IMP v9 = method_getImplementation(v8);
    _MergedGlobals_25[0] = 1;
    byte_1EB25C049 = Implementation != v9;
    if (Implementation != v9) {
      goto LABEL_3;
    }
LABEL_5:
    wakWindow = (WAKWindow *)[(WAKWindow *)self->super._wakWindow firstResponder];
    goto LABEL_6;
  }
  if (!byte_1EB25C049) {
    goto LABEL_5;
  }
LABEL_3:
  wakWindow = self->super._wakWindow;
LABEL_6:
  [(WAKWindow *)wakWindow resignFirstResponder];
  return 1;
}

- (void)ensureSelection
{
  WebThreadLock();
  if ([(UIWebDocumentView *)self makeWKFirstResponder])
  {
    if (![(UIWebDocumentView *)self hasSelection])
    {
      id v3 = [(WebFrame *)[(WebView *)self->_webView mainFrame] DOMDocument];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v4 = [(DOMDocument *)v3 body];
        BOOL v5 = self->_standaloneEditingElement ? self->_standaloneEditingElement : v4;
        if ([(DOMHTMLElement *)v5 isContentEditable])
        {
          objc_super v6 = [(DOMDocument *)v3 createRange];
          [(DOMRange *)v6 setStart:v5 offset:0];
          [(DOMRange *)v6 setEnd:v5 offset:0];
          [(WebView *)self->_webView setSelectedDOMRange:v6 affinity:1];
          [(DOMRange *)v6 detach];
        }
      }
    }
  }
}

- (void)setInteractionAssistantGestureRecognizers
{
  if (self->m_parentTextView) {
    textSelectionAssistant = (UITextInteractionAssistant *)[self->m_parentTextView interactionAssistant];
  }
  else {
    textSelectionAssistant = self->_textSelectionAssistant;
  }
  [(UITextInteractionAssistant *)textSelectionAssistant setGestureRecognizers];
}

- (void)_undoManagerDidUndo:(id)a3
{
  if (pthread_main_np())
  {
    if ([(UIView *)self isFirstResponder]
      || [self->m_parentTextView isFirstResponder])
    {
      objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateForChangedSelection");
      [(UIWebDocumentView *)self setInteractionAssistantGestureRecognizers];
    }
  }
  else
  {
    [(UIWebDocumentView *)self performSelectorOnMainThread:a2 withObject:a3 waitUntilDone:0];
  }
}

- (void)_undoManagerDidRedo:(id)a3
{
  if (pthread_main_np())
  {
    if ([(UIView *)self isFirstResponder]
      || [self->m_parentTextView isFirstResponder])
    {
      objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateForChangedSelection");
      [(UIWebDocumentView *)self setInteractionAssistantGestureRecognizers];
    }
  }
  else
  {
    [(UIWebDocumentView *)self performSelectorOnMainThread:a2 withObject:a3 waitUntilDone:0];
  }
}

- (id)undoManagerForWebView:(id)a3
{
  id result = self->_undoManager;
  if (!result)
  {
    self->_undoManager = objc_alloc_init(WebThreadSafeUndoManager);
    BOOL v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__undoManagerDidUndo_ name:*MEMORY[0x1E4F28A80] object:self->_undoManager];
    [v5 addObserver:self selector:sel__undoManagerDidRedo_ name:*MEMORY[0x1E4F28A78] object:self->_undoManager];
    return self->_undoManager;
  }
  return result;
}

- (id)undoManager
{
  return [(UIWebDocumentView *)self undoManagerForWebView:self->_webView];
}

- (id)_parentTextView
{
  return self->m_parentTextView;
}

- (void)_setParentTextView:(id)a3
{
  self->id m_parentTextView = a3;
}

+ (id)standardTextViewPreferences
{
  id result = (id)standardTextViewPreferences_sTextViewPreferences;
  if (!standardTextViewPreferences_sTextViewPreferences)
  {
    WebThreadLock();
    standardTextViewPreferences_sTextViewPreferences = [objc_alloc(MEMORY[0x1E4FB6DE0]) initWithIdentifier:@"com.apple.uikit.text"];
    [(id)standardTextViewPreferences_sTextViewPreferences setAutosaves:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setJavaEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setJavaScriptEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setPlugInsEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setDatabasesEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setLocalStorageEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setOfflineWebApplicationCacheEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setDiskImageCacheEnabled:0];
    [(id)standardTextViewPreferences_sTextViewPreferences setAcceleratedDrawingEnabled:0];
    return (id)standardTextViewPreferences_sTextViewPreferences;
  }
  return result;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  WebThreadLock();
  webView = self->_webView;
  [(WebView *)webView setContinuousSpellCheckingEnabled:v3];
}

- (id)delegate
{
  return 0;
}

- (BOOL)handleKeyTextCommandForCurrentEvent
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  return [(UIKeyboardImpl *)v2 handleKeyTextCommandForCurrentEvent];
}

- (BOOL)handleKeyAppCommandForCurrentEvent
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  return [(UIKeyboardImpl *)v2 handleKeyAppCommandForCurrentEvent];
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4
{
  objc_super v6 = +[UIKeyboardImpl sharedInstance];
  [(UIKeyboardImpl *)v6 addInputString:a3 withFlags:a4];
}

- (void)addInputString:(id)a3
{
}

- (void)deleteFromInput
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  [(UIKeyboardImpl *)v2 deleteFromInputWithFlags:0];
}

- (void)deleteFromInputWithFlags:(unint64_t)a3
{
  double v4 = +[UIKeyboardImpl sharedInstance];
  [(UIKeyboardImpl *)v4 deleteFromInputWithFlags:a3];
}

- (void)disableClearsOnInsertion
{
  if (self->m_parentTextView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id m_parentTextView = self->m_parentTextView;
    [m_parentTextView disableClearsOnInsertion];
  }
}

- (void)deleteBackward
{
  if (+[UIDictationController shouldDeleteBackward])
  {
    WebThreadLock();
    [(WebView *)self->_webView deleteBackward:self];
    [(UIWebDocumentView *)self disableClearsOnInsertion];
  }
}

- (void)insertText:(id)a3
{
  if (+[UIDictationController shouldInsertText:](UIDictationController, "shouldInsertText:"))
  {
    WebThreadLock();
    [(WebView *)self->_webView insertText:a3];
    [(UIWebDocumentView *)self disableClearsOnInsertion];
  }
}

- (BOOL)isEditingSingleLineElement
{
  if ([(UIWebDocumentView *)self formElement])
  {
    [(UIWebDocumentView *)self formElement];
    objc_opt_class();
    return objc_opt_isKindOfClass() & 1;
  }
  else
  {
    return [(UIWebDocumentView *)self isSingleLineDocument];
  }
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = +[UIKeyboardImpl activeInstance];
  if (![(UIWebDocumentView *)self isEditingSingleLineElement]
    || (a3 = (id)[a3 singleLineResult], objc_msgSend((id)objc_msgSend(a3, "phrases"), "count")))
  {
    uint64_t v8 = [a3 bestText];
    if (-[UIWebDocumentView keyboardInput:shouldInsertText:isMarkedText:](self, "keyboardInput:shouldInsertText:isMarkedText:", [v7 delegate], v8, 0))
    {
      WebThreadLock();
      [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
      id v9 = +[UIDictationUtilities metadataDictionaryForCorrectionIdentifier:a4];
      webView = self->_webView;
      uint64_t v11 = v8;
      v12[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      -[WebView insertDictationPhrases:metadata:](webView, "insertDictationPhrases:metadata:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1], v9);
      [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] setSelectionDisplayVisible:1];
      [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textDidChange:self];
      if ([(UIWebDocumentView *)self rangeToRestoreAfterDictation])
      {
        [(UIWebDocumentView *)self setSelectedDOMRange:[(UIWebDocumentView *)self rangeToRestoreAfterDictation] affinityDownstream:1];
        [(UIWebDocumentView *)self setRangeToRestoreAfterDictation:0];
      }
    }
  }
}

- (id)metadataDictionariesForDictationResults
{
  id v10 = 0;
  id v11 = 0;
  WebThreadLock();
  [(WebFrame *)[(WebView *)self->_webView mainFrame] getDictationResultRanges:&v11 andMetadatas:&v10];
  id result = v10;
  if (v10)
  {
    id result = (id)[v10 count];
    if (result)
    {
      uint64_t v4 = [v10 count];
      if (v4)
      {
        uint64_t v5 = v4;
        for (uint64_t i = 0; i != v5; ++i)
        {
          id v7 = objc_msgSend(v10, "objectAtIndex:", i, v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = [v11 objectAtIndex:i];
            if (v8)
            {
              uint64_t v9 = v8;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v7, "setObject:forKey:", -[WebFrame stringForRange:](-[WebView mainFrame](self->_webView, "mainFrame"), "stringForRange:", v9), @"fullText");
              }
            }
          }
        }
      }
      return v10;
    }
  }
  return result;
}

- (id)dictationResultMetadataForRange:(id)a3
{
  WebThreadLock();
  uint64_t v5 = [(WebView *)self->_webView mainFrame];
  return (id)[(WebFrame *)v5 dictationResultMetadataForRange:a3];
}

- (BOOL)hasRangedSelection
{
  return [(UIWebDocumentView *)self selectionState] == 2;
}

- (BOOL)_textPlaceholderHasBeenRemoved
{
  id v3 = [(UIWebDocumentView *)self formElement];
  uint64_t v4 = [(UIWebTextPlaceholder *)self->_textPlaceholder element];
  if (v3) {
    BOOL v5 = [(DOMElement *)v4 parentNode] != 0;
  }
  else {
    BOOL v5 = [(DOMElement *)v4 inDocument];
  }
  return !v5;
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  WebThreadLock();
  if ([(UIWebDocumentView *)self hasRangedSelection]) {
    [(UIWebDocumentView *)self deleteBackward];
  }
  return -[UIWebDocumentView _insertTextPlaceholderWithSize:](self, "_insertTextPlaceholderWithSize:", width, height);
}

- (void)removeTextPlaceholder:(id)a3
{
}

- (id)insertDictationResultPlaceholder
{
  WebThreadLock();
  if ([(UIWebDocumentView *)self hasRangedSelection]) {
    [(UIWebDocumentView *)self deleteBackward];
  }
  [(UIWebDocumentView *)self _sizeForDictationResultPlaceholder];
  return -[UIWebDocumentView _insertTextPlaceholderWithSize:](self, "_insertTextPlaceholderWithSize:");
}

- (CGSize)_sizeForDictationResultPlaceholder
{
  WebThreadLock();
  BOOL v3 = [(UIWebDocumentView *)self isCaretInEmptyParagraph];
  uint64_t v4 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument");
  BOOL v5 = objc_msgSend((id)objc_msgSend(v4, "getComputedStyle:pseudoElement:", objc_msgSend(v4, "body"), &stru_1ED0E84C0), "getPropertyValue:", @"line-height");
  if ([v5 isEqualToString:@"normal"])
  {
    objc_msgSend(-[UIWebDocumentView fontForCaretSelection](self, "fontForCaretSelection"), "lineHeight");
  }
  else
  {
    [v5 floatValue];
    double v6 = v7;
  }
  if (v3) {
    double v8 = v6 + 3.0;
  }
  else {
    double v8 = v6;
  }
  uint64_t v9 = [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] activeSelection];
  [(UITextSelection *)v9 caretRectAtEndOfDocument];
  double v12 = v11;
  if (v8 > v10 + v10 || v8 < 0.5) {
    double v8 = v10;
  }
  [(UITextSelection *)v9 caretRectAtBeginOfDocument];
  dictatingIntoEmptyDocument = v14 == v12;
  +[UIDictationLandingView widthForLineHeight:v8];
  double v16 = v8;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (id)_insertTextPlaceholderWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  WebThreadLock();
  double v6 = +[UIWebTextPlaceholder placeholderWithWebDocumentView:self];
  self->_textPlaceholder = v6;
  float v7 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createElement:", @"img");
  [(UIWebTextPlaceholder *)v6 setElement:v7];
  objc_msgSend(v7, "setAttribute:value:", @"style", objc_msgSend(NSString, "stringWithFormat:", @"width: %.0fpx; height: %.0fpx; max-width: %.0fpx; max-height: %.0fpx; border: 1px solid red; display:inline-block; border: none; outline: none; opacity: 0; vertical-align: bottom;",
      *(void *)&width,
      *(void *)&height,
      *(void *)&width,
      *(void *)&height));
  [v7 setAttribute:@"class" value:@"-webkit-dictation-result-placeholder"];
  objc_msgSend(-[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange"), "insertNode:", v7);
  if ([(UIWebDocumentView *)self formElement]) {
    objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "hidePlaceholder");
  }
  double v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4FB6E78];
  webView = self->_webView;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__UIWebDocumentView__insertTextPlaceholderWithSize___block_invoke;
  v14[3] = &unk_1E5310D18;
  v14[4] = self;
  self->_textPlaceholderRemovalObserver = (id)[v8 addObserverForName:v9 object:webView queue:0 usingBlock:v14];
  [(WebFrame *)[(WebView *)self->_webView mainFrame] forceLayoutAdjustingViewSize:1];
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView) {
    [m_parentTextView webViewDidChange:0];
  }
  double v12 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createRange");
  [v12 setStartAfter:v7];
  [v12 setEndAfter:v7];
  [(UIWebDocumentView *)self setSelectedDOMRange:v12 affinityDownstream:1];
  [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] selectionChanged];
  [(UIWebDocumentView *)self keyboardInputChanged:self];
  [(UIWebDocumentView *)self disableClearsOnInsertion];
  return v6;
}

uint64_t __52__UIWebDocumentView__insertTextPlaceholderWithSize___block_invoke(uint64_t a1)
{
  WebThreadLock();
  uint64_t result = [*(id *)(a1 + 32) _textPlaceholderHasBeenRemoved];
  if (result)
  {
    BOOL v3 = +[UIDictationController sharedInstance];
    return [(UIDictationController *)v3 cancelDictation];
  }
  return result;
}

- (CGRect)frameForDictationResultPlaceholder:(id)a3
{
  if (self->_textPlaceholder == a3)
  {
    objc_msgSend((id)objc_msgSend(a3, "element"), "boundingBoxUsingTransforms");
    -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
    double v5 = v8;
    double v6 = v9;
    double v7 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v11 = v4 + -3.0;
  if (IsMobileNotes())
  {
    objc_msgSend((id)objc_msgSend(-[UIView _window](self, "_window"), "screen"), "scale");
    if (v12 > 1.0) {
      double v11 = v11 + 7.5;
    }
    else {
      double v11 = v11 + 8.0;
    }
  }
  double v13 = v7 + 3.0;
  double v14 = v5;
  double v15 = v11;
  double v16 = v6;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_finishedUsingTextPlaceholder
{
  self->_textPlaceholderRemovalObserver = 0;

  self->_textPlaceholder = 0;
}

- (void)_removeTextPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  BOOL v4 = a4;
  WebThreadLock();
  if (v4) {
    [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] setSelectionDisplayVisible:0];
  }
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder) {
    BOOL v8 = textPlaceholder == a3;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && self->_textPlaceholderRemovalObserver)
  {
    if ([(UIWebDocumentView *)self formElement]) {
      objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "showPlaceholderIfNecessary");
    }
    dictatingIntoEmptyDocument = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_textPlaceholderRemovalObserver);
    if (![(UIWebDocumentView *)self _textPlaceholderHasBeenRemoved])
    {
      double v9 = (void *)[a3 element];
      double v10 = (void *)[v9 previousSibling];
      for (i = 0; v10; double v10 = (void *)[v10 previousSibling])
        uint64_t i = (i + 1);
      double v12 = (void *)[v9 parentNode];
      double v13 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectedDOMRange");
      if ((void *)[v13 startContainer] != v12
        || [v13 startOffset] != i + 1)
      {
        [(UIWebDocumentView *)self setRangeToRestoreAfterDictation:v13];
      }
      [v12 removeChild:v9];
      if (!v4)
      {
        [(WebFrame *)[(WebView *)self->_webView mainFrame] forceLayoutAdjustingViewSize:1];
        id m_parentTextView = self->m_parentTextView;
        if (m_parentTextView) {
          [m_parentTextView webViewDidChange:0];
        }
        [(UIWebDocumentView *)self keyboardInputChanged:self];
      }
      double v15 = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "DOMDocument"), "createRange");
      [v15 setStart:v12 offset:i];
      [v15 setEnd:v12 offset:i];
      [(UIWebDocumentView *)self setSelectedDOMRange:v15 affinityDownstream:1];
    }
    [(UIWebDocumentView *)self _finishedUsingTextPlaceholder];
  }
}

- (id)dictationInterpretations
{
  uint64_t v2 = [(WebView *)self->_webView mainFrame];
  return (id)[(WebFrame *)v2 interpretationsForCurrentRoot];
}

- (void)clearMarkedText
{
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  [(UIWebDocumentView *)self clearMarkedText];
  WebThreadLock();
  id v7 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  uint64_t v8 = [(UIResponder *)self _nsrangeForTextRange:a3];
  objc_msgSend(v7, "selectWithoutClosingTypingNSRange:", v8, v9);
  if ([a4 length]) {
    [(UIWebDocumentView *)self insertText:a4];
  }
  else {
    [(UIWebDocumentView *)self deleteBackward];
  }
  double v10 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v10 textDidChange:self];
}

- (void)replaceCurrentWordWithText:(id)a3
{
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  [(UIWebDocumentView *)self clearMarkedText];
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "expandSelectionToWordContainingCaretSelection");
  if ([a3 length]) {
    [(UIWebDocumentView *)self insertText:a3];
  }
  else {
    [(UIWebDocumentView *)self deleteBackward];
  }
  double v5 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v5 textDidChange:self];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(UIWebDocumentView *)self ensureSelection];
  WebThreadLock();
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setMarkedText:selectedRange:", a3, location, length);
  uint64_t v8 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v8 textDidChange:self];
}

- (void)confirmMarkedText:(id)a3
{
  WebThreadLock();
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "confirmMarkedText:", a3);
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textDidChange:self];
  [(UIWebDocumentView *)self setInteractionAssistantGestureRecognizers];
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v5 characterInRelationToCaretSelection:v3];
}

- (unsigned)characterAfterCaretSelection
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 characterAfterCaretSelection];
}

- (id)fontForCaretSelection
{
  WebThreadLock();
  char v4 = 0;
  return (id)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "fontForSelection:", &v4);
}

- (id)textColorForCaretSelection
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView) {
    return (id)[m_parentTextView textColor];
  }
  else {
    return +[UIColor blackColor];
  }
}

- (id)rectsForNSRange:(_NSRange)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  WebThreadLock();
  id v7 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  id v3 = objc_msgSend(v7, "selectionRectsForRange:", objc_msgSend(v7, "convertNSRangeToDOMRange:", location, length));
  uint64_t v8 = (void *)[v7 documentView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v3);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v13 rect];
        objc_msgSend(v8, "convertRect:toView:", 0);
        objc_msgSend(v13, "setRect:");
      }
      uint64_t v10 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v3;
}

- (int)wordOffsetInRange:(id)a3
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v5 wordOffsetInRange:a3];
}

- (void)replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  WebThreadLock();
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "_replaceSelectionWithWebArchive:selectReplacement:smartReplace:", a3, v6, v5);
  uint64_t v9 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v9 textDidChange:self];
}

- (_NSRange)selectionRange
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  NSUInteger v4 = [v3 _selectedNSRange];
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (id)selectedDOMRange
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)[v3 selectedDOMRange];
}

- (void)setSelectedDOMRange:(id)a3 affinityDownstream:(BOOL)a4
{
  BOOL v4 = a4;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  if (a3) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", a3, v4, 1);
  }
  else {
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "clearSelection");
  }
  [(UIWebDocumentView *)self endSelectionChange];
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)[v5 rangeByMovingCurrentSelection:v3];
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)[v5 rangeByExtendingCurrentSelection:v3];
}

- (void)extendCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  objc_msgSend(v5, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(v5, "rangeByExtendingCurrentSelection:", v3), (int)v3 >= 0, 0);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (BOOL)hasSelection
{
  if (pthread_main_np()) {
    WebThreadLock();
  }
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 hasSelection];
}

- (BOOL)selectionAtDocumentStart
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 selectionAtDocumentStart];
}

- (BOOL)selectionAtWordStart
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 selectionAtWordStart];
}

- (void)selectAll
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "_selectAll");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setText:(id)a3
{
  [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(UIView *)self superview];
    [(UIView *)v5 setText:a3];
  }
  else
  {
    WebThreadLock();
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "expandSelectionToElementContainingCaretSelection");
    uint64_t v6 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "textTrimmingSet");
    if (v6) {
      a3 = (id)[a3 _stringByTrimmingCharactersInCFCharacterSet:v6];
    }
    [(UIWebDocumentView *)self insertText:a3];
    id v7 = [(UIWebDocumentView *)self inputDelegate];
    [(UITextInputDelegate *)v7 textDidChange:self];
  }
}

- (id)text
{
  [(UIView *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(UIView *)self superview];
    return (id)[(UIView *)v3 text];
  }
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  uint64_t v6 = (void *)[v5 DOMDocument];
  uint64_t v7 = [v6 documentElement];
  if (!v7) {
    return &stru_1ED0E84C0;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)[v6 createRange];
  [v9 setStart:v8 offset:0];
  objc_msgSend(v9, "setEnd:offset:", v8, objc_msgSend((id)objc_msgSend(v8, "childNodes"), "length"));
  uint64_t v10 = (void *)[v5 stringForRange:v9];
  uint64_t v11 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "textTrimmingSet");
  if (!v11) {
    return v10;
  }
  return (id)[v10 _stringByTrimmingCharactersInCFCharacterSet:v11];
}

- (BOOL)hasContent
{
  WebThreadLockFromAnyThread();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  if (!v3) {
    id v3 = [(WebView *)self->_webView mainFrame];
  }
  char v4 = [(WebFrame *)v3 focusedNodeHasContent];
  WebThreadUnlockFromAnyThread();
  return v4;
}

- (void)setCaretChangeListener:(id)a3
{
  WebThreadLock();
  webView = self->_webView;
  [(WebView *)webView setCaretChangeListener:a3];
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  if (!self->m_parentTextView) {
    return 1;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id m_parentTextView = self->m_parentTextView;
  return objc_msgSend(m_parentTextView, "keyboardInput:shouldReplaceTextInRange:replacementText:", a3, location, length, a5);
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->m_parentTextView)
  {
    id m_parentTextView = self->m_parentTextView;
  }
  else
  {
    id v9 = [(UIWebDocumentView *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 1;
    }
    id m_parentTextView = v9;
  }
  return [m_parentTextView keyboardInput:a3 shouldInsertText:a4 isMarkedText:v5];
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  if (self->m_parentTextView)
  {
    id m_parentTextView = self->m_parentTextView;
    return objc_msgSend(m_parentTextView, "keyboardInputShouldDelete:");
  }
  else
  {
    id v6 = [(UIWebDocumentView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      return [v6 keyboardInputChanged:a3];
    }
    else
    {
      return 1;
    }
  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView) {
    [m_parentTextView keyboardInputChanged:a3];
  }
  id v6 = [(UIWebDocumentView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 keyboardInputChanged:a3];
  }
  return 1;
}

- (void)keyboardInputChangedSelection:(id)a3
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView) {
    [m_parentTextView keyboardInputChangedSelection:a3];
  }
  id v6 = [(UIWebDocumentView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v6 keyboardInputChangedSelection:a3];
  }
}

- (id)automaticallySelectedOverlay
{
  uint64_t v2 = self;
  if (!self->m_parentTextView) {
    return v2;
  }
  char v3 = objc_opt_respondsToSelector();
  uint64_t v2 = (UIWebDocumentView *)v2->m_parentTextView;
  if ((v3 & 1) == 0) {
    return v2;
  }
  return [(UIWebDocumentView *)v2 automaticallySelectedOverlay];
}

- (void)setBottomBufferHeight:(double)a3
{
  id m_parentTextView = self->m_parentTextView;
  if (m_parentTextView) {
    [m_parentTextView setBottomBufferHeight:a3];
  }
}

- (BOOL)requiresKeyEvents
{
  return 0;
}

- (void)handleKeyWebEvent:(id)a3
{
  WebThreadLock();
  BOOL v5 = [(WebView *)self->_webView mainFrame];
  [(WebFrame *)v5 _handleKeyEvent:a3];
}

- (void)setPaused:(BOOL)a3
{
}

- (void)setPaused:(BOOL)a3 withEvents:(BOOL)a4
{
}

uint64_t __42__UIWebDocumentView_setPaused_withEvents___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) mainFrame];
  char v3 = v2;
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41)) {
    [v2 prepareForPause];
  }
  [v3 setTimeoutsPaused:*(unsigned __int8 *)(a1 + 41)];
  uint64_t result = [v3 setPluginsPaused:*(unsigned __int8 *)(a1 + 41)];
  if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    return [v3 resumeFromPause];
  }
  return result;
}

- (id)webView:(id)a3 plugInViewWithArguments:(id)a4 fromPlugInPackage:(id)a5
{
  if (![(UIWebDocumentView *)self mediaPlaybackAllowsAirPlay])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB6E68];
    id v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E4FB6E68]), "mutableCopy");
    [v9 setValue:@"deny" forKey:@"airplay"];
    [v9 setValue:@"deny" forKey:@"_media_element_airplay_"];
    a4 = (id)[a4 mutableCopy];
    [a4 setValue:v9 forKey:*v8];
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a5, "bundle"), "principalClass");
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = [v10 plugInViewWithArguments:a4];
  if (!v11) {
    return 0;
  }
  double v12 = (const void *)v11;
  double v13 = [[UIWebPlugInView alloc] initWithWebView:self plugInView:v11];
  if (v13)
  {
    double v14 = objc_msgSend((id)objc_msgSend(a5, "bundle"), "bundleIdentifier");
    -[UIWebPlugInView setIsQuickTimePlugIn:](v13, "setIsQuickTimePlugIn:", [v14 isEqualToString:@"com.apple.quicktime.plugin"]);
    -[UIWebPlugInView setIsMapViewPlugIn:](v13, "setIsMapViewPlugIn:", [v14 isEqualToString:@"com.apple.mapview.plugin"]);
    -[UIWebPlugInView setIsiAdPlugIn:](v13, "setIsiAdPlugIn:", [v14 isEqualToString:@"com.apple.iad.plugin"]);
    CFDictionaryRef plugInViews = self->_plugInViews;
    if (!plugInViews)
    {
      CFDictionaryRef plugInViews = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      self->_CFDictionaryRef plugInViews = plugInViews;
    }
    CFDictionarySetValue(plugInViews, v12, v13);
  }
  return v13;
}

- (void)webView:(id)a3 willShowFullScreenForPlugInView:(id)a4
{
  *((unsigned char *)self + 954) |= 0x20u;
  [(UITextInteractionAssistant *)self->_textSelectionAssistant clearSelection];
}

- (void)webView:(id)a3 didHideFullScreenForPlugInView:(id)a4
{
  if ((*((unsigned char *)self + 954) & 0x20) != 0)
  {
    *((unsigned char *)self + 954) &= ~0x20u;
    if (![(UIWebDocumentView *)self isShowingFullScreenPlugInUI]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id delegate = self->_delegate;
      [delegate webViewWillHideFullScreenPlugInUI:self];
    }
  }
}

- (void)didRemovePlugInView:(id)a3
{
  if (a3)
  {
    CFDictionaryRemoveValue(self->_plugInViews, (const void *)[a3 plugInView]);
    [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:1];
  }
}

- (BOOL)isShowingFullScreenPlugInUI
{
  return (*((unsigned __int8 *)self + 954) >> 5) & 1;
}

- (BOOL)hasPlugInSubviews
{
  CFDictionaryRef plugInViews = self->_plugInViews;
  if (plugInViews) {
    LOBYTE(plugInViews) = CFDictionaryGetCount(plugInViews) != 0;
  }
  return (char)plugInViews;
}

- (void)webView:(id)a3 willAddPlugInView:(id)a4
{
  id v6 = (const void *)objc_msgSend(a4, "plugInView", a3);
  CFDictionaryRef plugInViews = self->_plugInViews;
  if (!plugInViews || !CFDictionaryGetValue(plugInViews, v6))
  {
    [a4 setWebView:self];
    Mutable = self->_plugInViews;
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      self->_CFDictionaryRef plugInViews = Mutable;
    }
    CFDictionarySetValue(Mutable, v6, a4);
    [a4 reshape];
    [(UIWebDocumentView *)self _setSubviewCachesNeedUpdate:1];
  }
}

- (UIColor)insertionPointColor
{
  uint64_t v2 = [(WebView *)self->_webView mainFrame];
  if ((objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v3 = [(WebFrame *)v2 caretColor]) != 0)
  {
    return +[UIColor colorWithCGColor:v3];
  }
  else
  {
    return (UIColor *)+[UIColor insertionPointColor];
  }
}

- (id)textInputTraits
{
  id result = self->_traits;
  if (!result)
  {
    id result = objc_alloc_init(UITextInputTraits);
    self->_traits = (UITextInputTraits *)result;
  }
  return result;
}

- (void)forwardInvocation:(id)a3
{
  id v5 = [(UIWebDocumentView *)self textInputTraits];
  [a3 selector];
  if (objc_opt_respondsToSelector())
  {
    [a3 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIWebDocumentView;
    [(UIWebDocumentView *)&v6 forwardInvocation:a3];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = (id)[(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!result)
  {
    id v5 = objc_opt_class();
    return (id)[v5 instanceMethodSignatureForSelector:a3];
  }
  return result;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4 = [(UIWebDocumentView *)self textInputTraits];
  [v4 takeTraitsFrom:a3];
}

- (UITextInteractionAssistant)interactionAssistant
{
  id result = (UITextInteractionAssistant *)objc_getAssociatedObject(self, &_UITextInputImplicitInteractionAssistantKey);
  if (!result)
  {
    id result = self->_textSelectionAssistant;
    if (!result)
    {
      id m_parentTextView = self->m_parentTextView;
      if (m_parentTextView && [m_parentTextView interactionAssistant])
      {
        id v5 = self->m_parentTextView;
        return (UITextInteractionAssistant *)[v5 interactionAssistant];
      }
      else
      {
        if (!self->_initiatingTextSelectionAssistant || ([(id)UIApp isSuspended] & 1) == 0)
        {
          self->_initiatingTextSelectionAssistant = 1;
          self->_textSelectionAssistant = [[UITextInteractionAssistant alloc] initWithView:self];
          self->_initiatingTextSelectionAssistant = 0;
        }
        return self->_textSelectionAssistant;
      }
    }
  }
  return result;
}

- (BOOL)_restoreFirstResponder
{
  uint64_t v3 = [(UIWebDocumentView *)self interactionAssistant];
  if (v3)
  {
    [(UITextInteractionAssistant *)v3 checkEditabilityAndSetFirstResponderIfNecessary];
    return [(UIView *)self isFirstResponder];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebDocumentView;
    return [(UIResponder *)&v5 _restoreFirstResponder];
  }
}

- (BOOL)isEditable
{
  if (!self->m_parentTextView || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id m_parentTextView = self->m_parentTextView;
  return [m_parentTextView isEditable];
}

- (BOOL)isEditing
{
  if (!self->m_parentTextView || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id m_parentTextView = self->m_parentTextView;
  return [m_parentTextView isEditing];
}

- (void)beginSelectionChange
{
  if (!UIWebCurrentUserInterfaceIdiomIsSmallScreen())
  {
    [(_UITextServiceSession *)self->_definitionSession dismissTextServiceAnimated:1];
    [(_UITextServiceSession *)self->_shareSession dismissTextServiceAnimated:1];
  }
  uint64_t v3 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v3 selectionWillChange:self];
}

- (void)endSelectionChange
{
  uint64_t v3 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v3 selectionDidChange:self];
}

- (CGRect)_selectionClipRect
{
  id v3 = [(UIWebDocumentView *)self formElement];
  if (v3)
  {
    id v4 = v3;
    WebThreadLock();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    [v4 innerFrameQuad];
    objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "ownerDocument"), "webFrame"), "documentView");
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    v10[3] = v14;
    [v5 convertRect:0 toView:quadBoundingBox((double *)v10)];
  }
  else
  {
    [(UIView *)self bounds];
  }
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v5 = [(UIWebDocumentView *)self interactionAssistant];
  -[UITextInteractionAssistant beginFloatingCursorAtPoint:](v5, "beginFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v5 = [(UIWebDocumentView *)self interactionAssistant];
  -[UITextInteractionAssistant updateFloatingCursorAtPoint:](v5, "updateFloatingCursorAtPoint:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v7 = [(UIWebDocumentView *)self interactionAssistant];
  -[UITextInteractionAssistant updateFloatingCursorAtPoint:animated:](v7, "updateFloatingCursorAtPoint:animated:", v4, x, y);
}

- (void)endFloatingCursor
{
  uint64_t v2 = [(UIWebDocumentView *)self interactionAssistant];
  [(UITextInteractionAssistant *)v2 endFloatingCursor];
}

- (void)cut:(id)a3
{
  if (-[UIWebDocumentView keyboardInputShouldDelete:](self, "keyboardInputShouldDelete:", objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "delegate")))
  {
    WebThreadLock();
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
    [(WebView *)self->_webView cut:a3];
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textDidChange:self];
    [(UIWebDocumentView *)self disableClearsOnInsertion];
  }
}

- (void)copy:(id)a3
{
  WebThreadLock();
  webView = self->_webView;
  [(WebView *)webView copy:a3];
}

- (void)toggleBoldface:(id)a3
{
  if ([(UIWebDocumentView *)self hasRichlyEditableSelection])
  {
    WebThreadLock();
    [(UIWebDocumentView *)self beginSelectionChange];
    [(WebView *)self->_webView toggleBold:a3];
    [(UIWebDocumentView *)self endSelectionChange];
  }
}

- (void)toggleItalics:(id)a3
{
  if ([(UIWebDocumentView *)self hasRichlyEditableSelection])
  {
    WebThreadLock();
    [(UIWebDocumentView *)self beginSelectionChange];
    [(WebView *)self->_webView toggleItalic:a3];
    [(UIWebDocumentView *)self endSelectionChange];
  }
}

- (void)toggleUnderline:(id)a3
{
  if ([(UIWebDocumentView *)self hasRichlyEditableSelection])
  {
    WebThreadLock();
    [(UIWebDocumentView *)self beginSelectionChange];
    [(WebView *)self->_webView toggleUnderline:a3];
    [(UIWebDocumentView *)self endSelectionChange];
  }
}

- (CGRect)_shortcutPresentationRect
{
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", -[UIWebDocumentView selectedDOMRange](self, "selectedDOMRange")), "objectAtIndex:", 0), "rect");
  double v5 = round(v4);
  double v7 = round(v6);
  result.size.CGFloat height = v3;
  result.size.CGFloat width = v2;
  result.origin.double y = v7;
  result.origin.double x = v5;
  return result;
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  return self->_definitionSession != 0;
}

- (void)_shareText:(id)a3 fromRect:(CGRect)a4
{
  double v5 = (_UITextServiceSession *)[(UIResponder *)self _showServiceForType:8 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)];
  self->_shareSession = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__UIWebDocumentView__shareText_fromRect___block_invoke;
  v6[3] = &unk_1E530AE40;
  v6[4] = self;
  [(_UITextServiceSession *)v5 setDismissedHandler:v6];
}

void __41__UIWebDocumentView__shareText_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1328) = 0;
}

- (void)_share:(id)a3
{
  id v4 = [(UIWebDocumentView *)self textInRange:[(UIWebDocumentView *)self selectedTextRange]];
  [(UIWebDocumentView *)self _shortcutPresentationRect];
  -[UIWebDocumentView _shareText:fromRect:](self, "_shareText:fromRect:", v4);
}

- (void)_shareElement:(id)a3 withURL:(id)a4
{
  uint64_t v6 = objc_msgSend(a4, "_web_userVisibleString");
  [a3 boundingBox];
  -[UIWebDocumentView _shareText:fromRect:](self, "_shareText:fromRect:", v6);
}

- (BOOL)_isDisplayingShareViewController
{
  return self->_shareSession != 0;
}

- (void)_define:(id)a3
{
  id v4 = (_UITextServiceSession *)[(UIResponder *)self _showServiceForType:16 withContext:+[_UITextServiceSessionContext sessionContextForType:16 withTextInput:self]];
  self->_lookupSession = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__UIWebDocumentView__define___block_invoke;
  v5[3] = &unk_1E530AE40;
  v5[4] = self;
  [(_UITextServiceSession *)v4 setDismissedHandler:v5];
}

void __29__UIWebDocumentView__define___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1336) = 0;
}

- (BOOL)_isDisplayingLookupViewController
{
  return self->_lookupSession != 0;
}

- (void)_translate:(id)a3
{
  id v4 = (_UITextServiceSession *)[(UIResponder *)self _showServiceForType:32 withContext:+[_UITextServiceSessionContext sessionContextForType:32 withTextInput:self]];
  self->_translateSession = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__UIWebDocumentView__translate___block_invoke;
  v5[3] = &unk_1E530AE40;
  v5[4] = self;
  [(_UITextServiceSession *)v4 setDismissedHandler:v5];
}

void __32__UIWebDocumentView__translate___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1344) = 0;
}

- (BOOL)_isDisplayingTranslateViewController
{
  return self->_translateSession != 0;
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  uint64_t v4 = [a3 string];
  [(UIWebDocumentView *)self insertText:v4];
}

- (void)_addShortcut:(id)a3
{
  if (!UIWebCurrentUserInterfaceIdiomIsSmallScreen()) {
    [(UIWebDocumentView *)self _removeShortcutController:0];
  }
  uint64_t v4 = (_UITextServiceSession *)[(UIResponder *)self _showServiceForType:4 withContext:+[_UITextServiceSessionContext sessionContextForType:16 withTextInput:self]];
  self->_learnSession = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__UIWebDocumentView__addShortcut___block_invoke;
  v5[3] = &unk_1E530AE40;
  v5[4] = self;
  [(_UITextServiceSession *)v4 setDismissedHandler:v5];
}

uint64_t __34__UIWebDocumentView__addShortcut___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1320) = 0;
  uint64_t result = UIWebCurrentUserInterfaceIdiomIsSmallScreen();
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 becomeFirstResponder];
  }
  return result;
}

- (BOOL)_isDisplayingShortcutViewController
{
  return self->_learnSession != 0;
}

- (BOOL)_shouldPaste
{
  id v3 = +[UIKeyboardImpl activeInstance];
  if (!self->m_parentTextView) {
    return 1;
  }
  uint64_t v4 = v3;
  double v5 = +[UIPasteboard generalPasteboard];
  uint64_t v6 = [(UIPasteboard *)v5 string];
  if (!v6)
  {
    id v7 = -[UIPasteboard valueForPasteboardType:](v5, "valueForPasteboardType:", [(id)*MEMORY[0x1E4F444F8] identifier]);
    if (v7) {
      uint64_t v6 = [v7 absoluteString];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  int v8 = objc_msgSend(self->m_parentTextView, "keyboardInput:shouldInsertText:isMarkedText:", objc_msgSend(v4, "delegate"), v6, 0);
  BOOL result = 0;
  if (v8) {
    return 1;
  }
  return result;
}

- (void)paste:(id)a3
{
  if ([(UIWebDocumentView *)self _shouldPaste])
  {
    WebThreadLock();
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
    [(WebView *)self->_webView paste:a3];
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textDidChange:self];
    [(UIWebDocumentView *)self disableClearsOnInsertion];
  }
}

- (void)pasteAndMatchStyle:(id)a3
{
  if ([(UIWebDocumentView *)self _shouldPaste])
  {
    WebThreadLock();
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
    [(WebView *)self->_webView pasteAsPlainText:a3];
    [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textDidChange:self];
    [(UIWebDocumentView *)self disableClearsOnInsertion];
  }
}

- (void)select:(id)a3
{
  if (self->m_parentTextView) {
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  }
  else {
    textSelectionAssistant = self->_textSelectionAssistant;
  }
  [(UITextInteractionAssistant *)textSelectionAssistant selectWord];
}

- (void)selectAll:(id)a3
{
  if (self->m_parentTextView) {
    textSelectionAssistant = (UITextInteractionAssistant *)[self->m_parentTextView interactionAssistant];
  }
  else {
    textSelectionAssistant = self->_textSelectionAssistant;
  }
  [(UITextInteractionAssistant *)textSelectionAssistant selectAll:a3];
}

- (void)replace:(id)a3
{
  id v4 = [(UIWebDocumentView *)self dictationResultMetadataForRange:[(UIWebDocumentView *)self selectedDOMRange]];
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = (void *)[v4 objectForKey:@"alternativesSelectedCount"];
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "intValue") + 1), @"alternativesSelectedCount");
  }
  id v7 = +[UIKeyboardImpl sharedInstance];
  [(UIKeyboardImpl *)v7 replaceText:a3];
}

- (void)_promptForReplace:(id)a3
{
  if (self->m_parentTextView) {
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  }
  else {
    textSelectionAssistant = self->_textSelectionAssistant;
  }
  [(UITextInteractionAssistant *)textSelectionAssistant scheduleReplacements];
}

- (void)_transliterateChinese:(id)a3
{
  if (self->m_parentTextView) {
    textSelectionAssistant = (UITextInteractionAssistant *)objc_msgSend(self->m_parentTextView, "interactionAssistant", a3);
  }
  else {
    textSelectionAssistant = self->_textSelectionAssistant;
  }
  [(UITextInteractionAssistant *)textSelectionAssistant scheduleChineseTransliteration];
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (BOOL)isCaretInEmptyParagraph
{
  if ([(UIWebDocumentView *)self selectionState] != 1) {
    return 0;
  }
  int v3 = (unsigned __int16)[(UIResponder *)self _characterBeforeCaretSelection];
  if (v3 != 10)
  {
    if (v3) {
      return 0;
    }
  }
  int v4 = [(UIWebDocumentView *)self characterAfterCaretSelection];
  return v4 == 10 || v4 == 0;
}

- (BOOL)inPopover
{
  double v2 = [(UIView *)self superview];
  if (v2)
  {
    int v3 = v2;
    do
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        break;
      }
      int v3 = [(UIView *)v3 superview];
    }
    while (v3);
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  if (!a3 || ![(UIWebDocumentView *)self hasRichlyEditableSelection]) {
    return 0;
  }
  WebThreadLock();
  webView = self->_webView;
  return (id)[(WebView *)webView typingAttributes];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v7 = [(UITextSelection *)[(UITextInteractionAssistant *)self->_textSelectionAssistant activeSelection] selectionRects];
  if (sel_toggleBoldface_ == a3 || sel_toggleItalics_ == a3 || sel_toggleUnderline_ == a3)
  {
    LOBYTE(v10) = [(UIWebDocumentView *)self hasRichlyEditableSelection];
    return v10;
  }
  if (sel_makeTextWritingDirectionRightToLeft_ == a3 || sel_makeTextWritingDirectionLeftToRight_ == a3)
  {
    LODWORD(v10) = [(UIWebDocumentView *)self hasEditableSelection];
    if (!v10) {
      return v10;
    }
    if ([(UIWebDocumentView *)self isCaretInEmptyParagraph]) {
      goto LABEL_40;
    }
    int64_t v12 = [(UIWebDocumentView *)self selectionBaseWritingDirection];
    uint64_t v13 = objc_msgSend(-[UIWebDocumentView textInputTraits](self, "textInputTraits"), "keyboardType");
    if (unint64_t)(v13 - 4) < 8 && ((0x93u >> (v13 - 4))) {
      goto LABEL_40;
    }
    if (!UIKeyboardIsRightToLeftInputModeActive() && !v12) {
      goto LABEL_40;
    }
    if (sel_makeTextWritingDirectionRightToLeft_ == a3 && !v12)
    {
LABEL_25:
      LOBYTE(v10) = 1;
      return v10;
    }
    BOOL v19 = sel_makeTextWritingDirectionLeftToRight_ == a3 && v12 == 1;
    goto LABEL_64;
  }
  if (sel_cut_ == a3)
  {
    if (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure")) {
      goto LABEL_40;
    }
    LODWORD(v10) = [(UIWebDocumentView *)self hasEditableSelection];
    if (!v10) {
      return v10;
    }
LABEL_49:
    BOOL v19 = [(UIWebDocumentView *)self selectionState] == 2;
LABEL_64:
    LOBYTE(v10) = v19;
    return v10;
  }
  if (sel_paste_ == a3)
  {
    LODWORD(v10) = [(UIWebDocumentView *)self hasEditableSelection];
    if (v10)
    {
      long long v15 = +[UIPasteboard generalPasteboard];
      id v16 = [(UIWebDocumentView *)self supportedPasteboardTypesForCurrentSelection];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[UIPasteboard numberOfItems](v15, "numberOfItems"));
      LOBYTE(v10) = [(UIPasteboard *)v15 containsPasteboardTypes:v16 inItemSet:v17];
    }
    return v10;
  }
  id v14 = v7;
  if (sel_copy_ == a3)
  {
    char v18 = objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure");
    LOBYTE(v10) = v18 ^ 1;
    if ((v18 & 1) != 0 || v14) {
      return v10;
    }
    goto LABEL_49;
  }
  if (sel__share_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && [(UIWebDocumentView *)self selectionState] != 2)
    {
      goto LABEL_40;
    }
    LODWORD(v10) = [(UIResponder *)self _canShowTextServiceForType:8];
    if (!v10) {
      return v10;
    }
    uint64_t v20 = [(UIWebDocumentView *)self selectedTextRange];
    if (qword_1EB25C068 != -1) {
      dispatch_once(&qword_1EB25C068, &__block_literal_global_671);
    }
    id v21 = [(UIWebDocumentView *)self textInRange:v20];
    id v22 = (id)[v21 stringByTrimmingCharactersInSet:qword_1EB25C060];
LABEL_74:
    LOBYTE(v10) = [v22 length] != 0;
    return v10;
  }
  if (sel__define_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && [(UIWebDocumentView *)self selectionState] != 2)
    {
      goto LABEL_40;
    }
    double v23 = self;
    uint64_t v24 = 2;
LABEL_72:
    LODWORD(v10) = [(UIResponder *)v23 _canShowTextServiceForType:v24];
    if (!v10) {
      return v10;
    }
    id v22 = [(UIWebDocumentView *)self textInRange:[(UIWebDocumentView *)self selectedTextRange]];
    goto LABEL_74;
  }
  if (sel__translate_ == a3)
  {
    if ((objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0
      || !v14 && [(UIWebDocumentView *)self selectionState] != 2)
    {
      goto LABEL_40;
    }
    double v23 = self;
    uint64_t v24 = 32;
    goto LABEL_72;
  }
  if (sel__addShortcut_ == a3)
  {
    if ((objc_msgSend(+[_UITextServiceSession textServiceSessionForType:](_UITextServiceSession, "textServiceSessionForType:", 4), "isDisplaying") & 1) != 0|| (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure") & 1) != 0|| !v14 && -[UIWebDocumentView selectionState](self, "selectionState") != 2)
    {
      goto LABEL_40;
    }
    LODWORD(v10) = [(UIResponder *)self _canShowTextServiceForType:4];
    if (v10)
    {
      id v25 = [(UIWebDocumentView *)self textInRange:[(UIWebDocumentView *)self selectedTextRange]];
      uint64_t v10 = [v25 length];
      if (v10)
      {
        LODWORD(v10) = TIEnabledInputModesAllowOneToManyShortcuts();
        if (v10)
        {
          LODWORD(v10) = [v25 _containsCJScripts];
          if (v10)
          {
            char v26 = [(UIWebDocumentView *)self inPopover];
            goto LABEL_99;
          }
        }
      }
    }
    return v10;
  }
  if (sel__promptForReplace_ == a3 || sel__transliterateChinese_ == a3)
  {
    LODWORD(v10) = [(UIWebDocumentView *)self hasEditableSelection];
    if (!v10) {
      return v10;
    }
    double v27 = [(UIWebDocumentView *)self selectedTextRange];
    if ([(UITextRange *)v27 isEmpty]) {
      goto LABEL_40;
    }
    id v28 = [(UIWebDocumentView *)self textInRange:v27];
    LOBYTE(v10) = [(UIResponder *)self _shouldPerformUICalloutBarButtonReplaceAction:a3 forText:v28 checkAutocorrection:1];
    return v10;
  }
  if (sel_select_ == a3)
  {
    if (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure")) {
      goto LABEL_40;
    }
    LODWORD(v10) = [(UIWebDocumentView *)self hasContent];
    if (!v10) {
      return v10;
    }
    BOOL v19 = [(UIWebDocumentView *)self selectionState] == 1;
    goto LABEL_64;
  }
  if (sel_selectAll_ != a3)
  {
    if (sel_replace_ != a3)
    {
LABEL_38:
      v30.receiver = self;
      v30.super_class = (Class)UIWebDocumentView;
      LOBYTE(v10) = [(UIView *)&v30 canPerformAction:a3 withSender:a4];
      return v10;
    }
    LODWORD(v10) = [(UIWebDocumentView *)self hasEditableSelection];
    if (!v10) {
      return v10;
    }
    char v26 = objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSecure");
LABEL_99:
    LOBYTE(v10) = v26 ^ 1;
    return v10;
  }
  LODWORD(v10) = [(UIWebDocumentView *)self hasContent];
  if (v10)
  {
    LODWORD(v10) = [(UIWebDocumentView *)self selectionState];
    if (v10)
    {
      if (v10 != 2)
      {
        if (v10 == 1) {
          return v10;
        }
        goto LABEL_38;
      }
      if (![(UIWebDocumentView *)self hasEditableSelection])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([(UIResponder *)self _selectionAtDocumentStart])
          {
            char v26 = [(UIResponder *)self _selectionAtDocumentEnd];
            goto LABEL_99;
          }
          goto LABEL_25;
        }
      }
LABEL_40:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

uint64_t __49__UIWebDocumentView_canPerformAction_withSender___block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E4F28B88], "controlCharacterSet"));
  __int16 v2 = -4;
  objc_msgSend(v0, "addCharactersInString:", objc_msgSend(NSString, "stringWithCharacters:length:", &v2, 1));
  uint64_t result = [v0 copy];
  qword_1EB25C060 = result;
  return result;
}

- (CGRect)visibleFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)visibleContentFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)autoscrollDragFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)autoscrollContentFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)playsNicelyWithGestures
{
  return 1;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (void)resetSelectionAssistant
{
  [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] setGestureRecognizers];
  if ([(UIView *)self isFirstResponder])
  {
    double v3 = [(UIWebDocumentView *)self interactionAssistant];
    [(UITextInteractionAssistant *)v3 activateSelection];
  }
}

- (void)willStartScroll
{
  *((unsigned char *)self + 957) &= ~8u;
  if (self->super._inGestureType != 2) {
    [(UIWebTiledView *)self setInGesture:8];
  }
  textSelectionAssistant = self->_textSelectionAssistant;
  [(UITextInteractionAssistant *)textSelectionAssistant willStartScrollingOrZooming];
}

- (void)willStartScrollToTop
{
  *((unsigned char *)self + 957) |= 8u;
  [(UIWebDocumentView *)self setTilingArea:3];
  textSelectionAssistant = self->_textSelectionAssistant;
  [(UITextInteractionAssistant *)textSelectionAssistant willStartScrollingOrZooming];
}

- (void)_updateFixedPositioningObjectsLayoutDuringScroll
{
}

- (void)_updateFixedPositioningObjectsLayoutAfterScroll
{
  [(UIWebDocumentView *)self _updateFixedPositionedObjectsLayoutRectUsingWebThread:1 synchronize:1];
  double v3 = (void *)[(WebView *)self->_webView _fixedPositionContent];
  [v3 didFinishScrollingOrZooming];
}

- (void)_updateFixedPositioningObjectsLayoutAfterVisibleGeometryChange
{
}

- (void)didEndScroll
{
  [(UIWebDocumentView *)self sendScrollEventIfNecessary];
  if (self->super._inGestureType == 8) {
    [(UIWebTiledView *)self setInGesture:0];
  }
  if ([(UIWebTiledView *)self tilingArea] == 3) {
    [(UIWebDocumentView *)self setTilingArea:0];
  }
  [(UITextInteractionAssistant *)self->_textSelectionAssistant didEndScrollingOrZooming];
  [(UIWebDocumentView *)self _updateFixedPositioningObjectsLayoutAfterScroll];
}

- (void)scrollViewWasRemoved
{
}

- (void)willStartZoom
{
  [(UIWebTiledView *)self setInGesture:2];
  [(UIWebDocumentView *)self _notifyPlugInViewsOfWillBeginZooming];
  textSelectionAssistant = self->_textSelectionAssistant;
  [(UITextInteractionAssistant *)textSelectionAssistant willStartScrollingOrZooming];
}

- (void)didZoom
{
  if ((*((unsigned char *)self + 953) & 0x20) == 0) {
    *((unsigned char *)self + 953) |= 8u;
  }
  [(UIWebDocumentView *)self _clearDoubleTapRect];
  [(UIWebDocumentView *)self _notifyPlugInViewsOfDidZoom];
}

- (void)didEndZoom
{
  [(UIWebTiledView *)self setInGesture:0];
  [(UIWebDocumentView *)self _notifyPlugInViewsOfDidEndZooming];
  [(UITextInteractionAssistant *)self->_textSelectionAssistant didEndScrollingOrZooming];
  [(UIWebDocumentView *)self _editableSelectionLayoutChangedByScrolling:0];
  double v3 = (void *)[(WebView *)self->_webView _fixedPositionContent];
  [v3 didFinishScrollingOrZooming];
}

- (double)maximumDoubleTapScale
{
  return 1.6;
}

- (unsigned)_contentSizeInExposedRect:(CGRect)a3 topLayer:(id)a4 visibleLayerCount:(int *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [a4 bounds];
  -[CALayer convertRect:fromLayer:](self->_contentLayersHostingLayer, "convertRect:fromLayer:", a4);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  if (![a4 contents]) {
    goto LABEL_3;
  }
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  v37.origin.double x = v13;
  v37.origin.double y = v15;
  v37.size.double width = v17;
  v37.size.double height = v19;
  CGRect v36 = CGRectIntersection(v35, v37);
  double v20 = v36.size.width;
  double v21 = v36.size.height;
  if (!CGRectIsEmpty(v36))
  {
    unsigned int v22 = (v20 * v21);
    ++*a5;
  }
  else
  {
LABEL_3:
    unsigned int v22 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v23 = objc_msgSend(a4, "sublayers", 0);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        v22 += -[UIWebDocumentView _contentSizeInExposedRect:topLayer:visibleLayerCount:](self, "_contentSizeInExposedRect:topLayer:visibleLayerCount:", *(void *)(*((void *)&v29 + 1) + 8 * i), a5, x, y, width, height);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v25);
  }
  return v22;
}

- (BOOL)_shouldFlattenContentLayersForRect:(CGRect)a3
{
  contentLayersHostingLayer = self->_contentLayersHostingLayer;
  if (!contentLayersHostingLayer) {
    return 0;
  }
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v15 = 0;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 1.0 / self->_documentScale, 1.0 / self->_documentScale);
  CGAffineTransform v13 = v14;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v13);
  unsigned int v9 = -[UIWebDocumentView _contentSizeInExposedRect:topLayer:visibleLayerCount:](self, "_contentSizeInExposedRect:topLayer:visibleLayerCount:", contentLayersHostingLayer, &v15, v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  BOOL result = 0;
  if (v9 >= 0xC0000 && v15 >= 4)
  {
    CFDictionaryRef plugInViews = self->_plugInViews;
    if (plugInViews && CFDictionaryGetCount(plugInViews) >= 1)
    {
      WebThreadLock();
      return [(WebView *)self->_webView _pluginsAreRunning] ^ 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_createIOSurfaceFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v6 = [(UIWindow *)[(UIView *)self window] screen];
  if (!v6) {
    return 0;
  }
  [(UIScreen *)v6 scale];
  double v8 = v7;
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeScale(&v11, v7 * self->_documentScale, v7 * self->_documentScale, 1.0);
  unsigned int v9 = _UIRenderingBufferCreate(0, width * v8, height * v8);
  if (v9)
  {
    [(UIWindow *)[(UIView *)self window] _contextId];
    CARenderServerRenderLayerWithTransform();
  }
  return v9;
}

- (void)_flattenAndSwapContentLayersInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v8 = _flattenAndSwapContentLayersInRect__processorCount;
  if (!_flattenAndSwapContentLayersInRect__processorCount)
  {
    unint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processorCount");
    _flattenAndSwapContentLayersInRect__processorCount = v8;
  }
  if (v8 <= 1)
  {
    if (self->_contentLayersHostingLayer)
    {
      if (-[UIWebDocumentView _shouldFlattenContentLayersForRect:](self, "_shouldFlattenContentLayersForRect:", x, y, width, height))
      {
        unsigned int v9 = -[UIWebDocumentView _createIOSurfaceFromRect:](self, "_createIOSurfaceFromRect:", x, y, width, height);
        if (v9)
        {
          id v11 = v9;
          uint64_t v10 = objc_alloc_init(_UIWebDocumentViewRotationLayer);
          self->_flattenedRotatingContentLayer = &v10->super;
          [(_UIWebDocumentViewRotationLayer *)v10 setContents:v11];
          -[CALayer setFrame:](self->_flattenedRotatingContentLayer, "setFrame:", x, y, width, height);
          [(CALayer *)self->_contentLayersHostingLayer removeFromSuperlayer];
          objc_msgSend(-[UIView _layer](self, "_layer"), "addSublayer:", self->_flattenedRotatingContentLayer);
        }
      }
    }
  }
}

- (void)_restoreFlattenedContentLayers
{
  if (self->_contentLayersHostingLayer)
  {
    flattenedRotatingContentLayer = self->_flattenedRotatingContentLayer;
    if (flattenedRotatingContentLayer)
    {
      [(CALayer *)flattenedRotatingContentLayer removeFromSuperlayer];

      self->_flattenedRotatingContentLayer = 0;
      id v4 = [(UIView *)self _layer];
      contentLayersHostingLayer = self->_contentLayersHostingLayer;
      [v4 addSublayer:contentLayersHostingLayer];
    }
  }
}

- (void)setTileUpdatesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIView *)self _layer];
  [v4 setLayoutsSuspended:v3];
}

- (BOOL)hasBodyElement
{
  WebThreadLock();
  BOOL v3 = [(WebView *)self->_webView mainFrame];
  return [(WebFrame *)v3 hasBodyElement];
}

- (id)_textSelectingContainer
{
  if (*((void *)self + 55)) {
    return (id)*((void *)self + 55);
  }
  return self;
}

- (UITextRange)selectedTextRange
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self selectedDOMRange];
  int64_t v4 = [(UIWebDocumentView *)self selectionAffinity];
  return (UITextRange *)+[UITextRangeImpl wrapDOMRange:v3 withAffinity:v4];
}

- (void)setSelectedTextRange:(id)a3
{
  if (!self->_selectionAffinity)
  {
    int v5 = 1;
    if ([a3 isEmpty])
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "start"), "webVisiblePosition"), "affinity") == 1) {
        int v5 = 1;
      }
      else {
        int v5 = 2;
      }
    }
    self->_selectionAffinitdouble y = v5;
  }
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", [a3 domRange], self->_selectionAffinity != 2);
  [(UIWebDocumentView *)self endSelectionChange];
  self->_selectionAffinitdouble y = 0;
}

- (void)setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  if (a4) {
    int v6 = 1;
  }
  else {
    int v6 = 2;
  }
  self->_selectionAffinitdouble y = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id m_parentTextView = self->m_parentTextView;
  }
  else {
    id m_parentTextView = self;
  }
  [m_parentTextView setSelectedTextRange:a3];
  self->_selectionAffinitdouble y = 0;
}

- (UITextRange)markedTextRange
{
  WebThreadLock();
  id v3 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if ([v3 collapsed]) {
    return 0;
  }
  return (UITextRange *)+[UITextRangeImpl wrapDOMRange:v3];
}

- (void)unmarkText
{
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "confirmMarkedText:", 0);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (UITextPosition)beginningOfDocument
{
  WebThreadLock();
  uint64_t v3 = [(WebFrame *)[(WebView *)self->_webView mainFrame] startPosition];
  return (UITextPosition *)+[UITextPositionImpl wrapWebVisiblePosition:v3];
}

- (UITextPosition)endOfDocument
{
  WebThreadLock();
  uint64_t v3 = [(WebFrame *)[(WebView *)self->_webView mainFrame] endPosition];
  return (UITextPosition *)+[UITextPositionImpl wrapWebVisiblePosition:v3];
}

- (id)textInRange:(id)a3
{
  if (!a3) {
    return 0;
  }
  WebThreadLock();
  int v5 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "stringForRange:", objc_msgSend(a3, "domRange"));
  return (id)[v5 _stringByReplacingCharacter:160 withCharacter:32];
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  WebThreadLock();
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB6D78], "rangeForFirstPosition:second:", objc_msgSend(a3, "webVisiblePosition"), objc_msgSend(a4, "webVisiblePosition"));
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "affinity");
  if (!v6) {
    return 0;
  }
  return +[UITextRangeImpl wrapDOMRange:v6 withAffinity:v7 != 1];
}

- (id)rangeOfEnclosingWord:(id)a3
{
  WebThreadLock();
  int64_t v4 = (void *)[a3 webVisiblePosition];
  uint64_t v5 = objc_msgSend(v4, "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", 1, objc_msgSend(v4, "atBoundaryOfGranularity:inDirection:", 1, 1) ^ 1);
  if (!v5)
  {
    uint64_t v7 = (void *)[v4 positionOfNextBoundaryOfGranularity:1 inDirection:1];
    if (!v4) {
      return 0;
    }
    unint64_t v8 = (void *)[v7 enclosingTextUnitOfGranularity:1 inDirectionIfAtBoundary:1];
    if (!v8) {
      return 0;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB6D78], "rangeForFirstPosition:second:", objc_msgSend(v8, "startPosition"), v4);
    if (!v5) {
      return 0;
    }
  }
  return +[UITextRangeImpl wrapDOMRange:v5];
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  WebThreadLock();
  [(UITextInputDelegate *)[(UIWebDocumentView *)self inputDelegate] textWillChange:self];
  -[UIWebDocumentView setSelectedDOMRange:affinityDownstream:](self, "setSelectedDOMRange:affinityDownstream:", [a3 domRange], 0);
  if ([a4 length]) {
    [(UIWebDocumentView *)self insertText:a4];
  }
  else {
    [(UIWebDocumentView *)self deleteBackward];
  }
  uint64_t v7 = [(UIWebDocumentView *)self inputDelegate];
  [(UITextInputDelegate *)v7 textDidChange:self];
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  WebThreadLock();
  uint64_t v6 = (void *)[a3 webVisiblePosition];
  uint64_t v7 = [a4 webVisiblePosition];
  return [v6 compare:v7];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return (int)objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "distanceFromPosition:", objc_msgSend(a3, "webVisiblePosition"));
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  WebThreadLock();
  uint64_t v6 = (void *)[a3 webVisiblePosition];
  if (a4 >= 0) {
    int64_t v7 = a4;
  }
  else {
    int64_t v7 = -a4;
  }
  id result = (id)[v6 positionByMovingInDirection:a4 < 1 amount:v7];
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  BOOL v6 = a6;
  WebThreadLock();
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionByMovingInDirection:amount:withAffinityDownstream:", a4, a5, v6);
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return [(UIWebDocumentView *)self _positionFromPosition:a3 inDirection:a4 offset:a5 withAffinityDownstream:1];
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  unsigned int v9 = (void *)[a3 webVisiblePosition];
  return [v9 atBoundaryOfGranularity:a4 inDirection:a5];
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionOfNextBoundaryOfGranularity:inDirection:", a4, a5);
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  unint64_t v8 = (void *)[a3 webVisiblePosition];
  return [v8 withinTextUnitOfGranularity:a4 inDirectionIfAtBoundary:a5];
}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (objc_opt_respondsToSelector())
  {
    id m_parentTextView = self->m_parentTextView;
    objc_msgSend(m_parentTextView, "scrollRectToVisible:animated:", v4, x, y, width, height);
  }
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  WebThreadLock();
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "affinity");
  if (!v8) {
    return 0;
  }
  return +[UITextRangeImpl wrapDOMRange:v8 withAffinity:v9 != 1];
}

- (CGRect)firstRectForRange:(id)a3
{
  WebThreadLock();
  id v5 = -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", [a3 domRange]);
  if ([v5 count])
  {
    objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", 0), "rect");
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_lastRectForRange:(id)a3
{
  WebThreadLock();
  id v5 = -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", [a3 domRange]);
  if ([v5 count])
  {
    objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 1), "rect");
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (UITextInputDelegate)inputDelegate
{
  return self->_inputDelegate;
}

- (void)setInputDelegate:(id)a3
{
  self->_inputDelegate = (UITextInputDelegate *)a3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 caretRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    uint64_t v13 = [a3 webVisiblePosition];
    if (v13)
    {
      [(UIWebDocumentView *)self caretRectForVisiblePosition:v13];
      double v6 = v14;
      double v8 = v15;
      double v10 = v16;
      double v12 = v17;
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB20];
      double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    textPlaceholder = self->_textPlaceholder;
    if (textPlaceholder)
    {
      if ([(DOMElement *)[(UIWebTextPlaceholder *)textPlaceholder element] parentNode])
      {
        if (IsMobileNotes())
        {
          CGFloat v19 = [(WebFrame *)[(WebView *)self->_webView mainFrame] DOMDocument];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v20 = [(DOMDocument *)v19 createRange];
            double v21 = (void *)[(DOMElement *)[(UIWebTextPlaceholder *)self->_textPlaceholder element] previousSibling];
            for (uint64_t i = 1; v21; uint64_t i = (i + 1))
              double v21 = (void *)[v21 previousSibling];
            uint64_t v23 = [(DOMElement *)[(UIWebTextPlaceholder *)self->_textPlaceholder element] parentNode];
            [(DOMRange *)v20 setStart:v23 offset:i];
            [(DOMRange *)v20 setEnd:v23 offset:i];
            if (objc_msgSend((id)-[DOMRange startPosition](v20, "startPosition"), "isEqual:", v13))
            {
              double v24 = 0.0;
              if (!dictatingIntoEmptyDocument) {
                double v24 = 3.0;
              }
              double v8 = v8 + v24;
              double v12 = v12 + -3.0;
            }
          }
        }
      }
    }
  }
  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  double v28 = v12;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  id result = -[UIWebDocumentView webVisiblePositionForPoint:](self, "webVisiblePositionForPoint:", x, y);
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  id v8 = -[UIWebDocumentView webVisiblePositionForPoint:](self, "webVisiblePositionForPoint:", x, y);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "domRange"), "startPosition");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "domRange"), "endPosition");
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v10;
  if (!v10) {
    return 0;
  }
  if ([v8 compare:v9] != -1)
  {
    uint64_t v9 = v11;
    if ([v8 compare:v11] != 1)
    {
      uint64_t v9 = (uint64_t)v8;
      if (!v8) {
        return 0;
      }
    }
  }
  return +[UITextPositionImpl wrapWebVisiblePosition:v9];
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  id v6 = -[UIWebDocumentView closestPositionToPoint:](self, "closestPositionToPoint:", x, y);
  id v7 = [(UIWebDocumentView *)self positionFromPosition:v6 offset:1];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = self;
    id v10 = v6;
  }
  else
  {
    id result = [(UIWebDocumentView *)self positionFromPosition:v6 offset:-1];
    if (!result) {
      return result;
    }
    id v10 = result;
    uint64_t v9 = self;
    id v8 = v6;
  }
  return [(UIWebDocumentView *)v9 textRangeFromPosition:v10 toPosition:v8];
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  WebThreadLock();
  int64_t v7 = -[UIWebDocumentView baseWritingDirectionForPosition:inDirection:](self, "baseWritingDirectionForPosition:inDirection:", [a3 start], 0);
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (v7 != 1) {
      goto LABEL_3;
    }
  }
  else if (v7 == 1)
  {
LABEL_3:
    return (id)[a3 end];
  }
  return (id)[a3 start];
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  WebThreadLock();
  if ([(UIWebDocumentView *)self baseWritingDirectionForPosition:a3 inDirection:0] == 1)uint64_t v7 = 1; {
  else
  }
    uint64_t v7 = -1;
  if ((unint64_t)(a4 - 3) >= 2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  id result = [(UIWebDocumentView *)self positionFromPosition:a3 offset:v8];
  if (result)
  {
    return [(UIWebDocumentView *)self textRangeFromPosition:a3 toPosition:result];
  }
  return result;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  WebThreadLock();
  return [(UIWebDocumentView *)self selectionBaseWritingDirection];
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  WebThreadLock();
  id v6 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v6 setBaseWritingDirection:a3];
}

- (int64_t)selectionAffinity
{
  return objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionAffinity") != 1;
}

- (int64_t)selectionGranularity
{
  return self->m_selectionGranularity;
}

- (void)setSelectionGranularity:(int64_t)a3
{
  self->m_selectionGranularitdouble y = a3;
}

- (id)selectionRectsForRange:(id)a3
{
  if (!a3) {
    return 0;
  }
  WebThreadLock();
  id v5 = -[UIWebDocumentView selectionRectsForDOMRange:](self, "selectionRectsForDOMRange:", [a3 domRange]);
  return +[UITextSelectionRectImpl rectsWithWebRects:v5];
}

- (id)_documentUrl
{
  WebThreadLock();
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[UIWebDocumentView webView](self, "webView"), "mainFrame"), "dataSource"), "request");
  return (id)[v3 URL];
}

- (int)documentType
{
  return self->_documentType;
}

- (BOOL)_shouldResetForNewPage
{
  if ((*((char *)self + 955) & 0x80000000) == 0) {
    return 1;
  }
  if (!self->_suppressesIncrementalRendering && (*((unsigned char *)self + 955) & 0x40) != 0) {
    return self->_renderTreeSize >= self->_renderTreeSizeThresholdForReset;
  }
  return 0;
}

- (void)setRenderTreeSizeThresholdForReset:(unint64_t)a3
{
  if (self->_renderTreeSizeThresholdForReset != a3)
  {
    self->_renderTreeSizeThresholdForReset = a3;
    [(UIWebTiledView *)self setNeedsLayout];
  }
}

- (BOOL)_isInspectorSearchingForNode
{
  return (*((unsigned __int8 *)self + 957) >> 2) & 1;
}

- (double)currentDocumentScale
{
  return self->_documentScale;
}

- (CGRect)visibleContentRect
{
  id v2 = [(UIView *)self _scroller];
  [v2 bounds];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)minimumScaleForSize:(CGSize)a3
{
  -[UIWebDocumentView minimumScaleForMinimumSize:](self, "minimumScaleForMinimumSize:", a3.width, a3.height);
  return v3;
}

- (CGRect)rectOfInterestForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = MEMORY[0x1E4F1DB28];
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  WebThreadLock();
  uint64_t v11 = (NSView *)-[WebView hitTest:](self->_webView, "hitTest:", x, y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[NSView convertPoint:fromView:](v11, "convertPoint:fromView:", 0, x, y);
    char v33 = 0;
    int v32 = 0;
    objc_msgSend((id)-[NSView _frame](v11, "_frame"), "renderRectForPoint:isReplaced:fontSize:", &v33, &v32, v12, v13);
    double v14 = v34.origin.x;
    double v15 = v34.origin.y;
    double width = v34.size.width;
    double height = v34.size.height;
    if (!CGRectIsEmpty(v34))
    {
      double v18 = [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
      if (v18 == v11)
      {
        CGFloat v19 = v14;
        CGFloat v20 = v15;
        CGFloat v21 = width;
        CGFloat v22 = height;
      }
      else
      {
        -[NSView convertRect:toView:](v11, "convertRect:toView:", v18, v14, v15, width, height);
      }
      self->_mainDocumentDoubleTapRect.origin.double x = v19;
      self->_mainDocumentDoubleTapRect.origin.double y = v20;
      self->_mainDocumentDoubleTapRect.size.double width = v21;
      self->_mainDocumentDoubleTapRect.size.double height = v22;
      -[NSView convertRect:toView:](v11, "convertRect:toView:", 0, v14, v15, width, height);
      double v7 = v23;
      double v8 = v24;
      double v9 = v25;
      double v10 = v26;
      CGSize v27 = *(CGSize *)(v6 + 16);
      self->_doubleTapRect.origin = *(CGPoint *)v6;
      self->_doubleTapRect.size = v27;
      *((unsigned char *)self + 954) = *((unsigned char *)self + 954) & 0xFE | v33;
    }
  }
  double v28 = v7;
  double v29 = v8;
  double v30 = v9;
  double v31 = v10;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3
{
  -[UIWebDocumentView minimumScaleForSize:](self, "minimumScaleForSize:", a3.width, a3.height);
  double v5 = v4;
  [(UIWebDocumentView *)self maximumDoubleTapScale];
  if (v6 >= v5) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  double v8 = 0.0;
  double v9 = v5;
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v9;
  return result;
}

- (BOOL)considerHeightForDoubleTap
{
  return *((unsigned char *)self + 954) & 1;
}

- (BOOL)shouldSelectionAssistantReceiveDoubleTapAtPoint:(CGPoint)a3 forScale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self;
  LOBYTE(self) = 0;
  double documentScale = v6->_documentScale;
  if (documentScale > 0.9 && documentScale < 1.1)
  {
    LODWORD(self) = -[UITextInteractionAssistant swallowsDoubleTapWithScale:atPoint:](v6->_textSelectionAssistant, "swallowsDoubleTapWithScale:atPoint:", a4 / documentScale, x, y);
    if (self)
    {
      [(UIWebDocumentView *)v6 _clearDoubleTapRect];
      LOBYTE(self) = 1;
    }
  }
  return (char)self;
}

- (void)willZoomToLocation:(CGPoint)a3 atScale:(double)a4 forDuration:(double)a5
{
  if (a5 <= 0.0) {
    char v5 = 0;
  }
  else {
    char v5 = 2 * (self->_documentScale < a4);
  }
  *((unsigned char *)self + 957) = *((unsigned char *)self + 957) & 0xFD | v5;
}

- (CGRect)currentDragCaretRect
{
  double x = self->_currentDragCaretRect.origin.x;
  double y = self->_currentDragCaretRect.origin.y;
  double width = self->_currentDragCaretRect.size.width;
  double height = self->_currentDragCaretRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentDragCaretRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_currentDragCaretRect = &self->_currentDragCaretRect;
  if (!CGRectEqualToRect(self->_currentDragCaretRect, a3))
  {
    double v9 = p_currentDragCaretRect->origin.x;
    double v10 = p_currentDragCaretRect->origin.y;
    double v11 = p_currentDragCaretRect->size.width;
    double v12 = p_currentDragCaretRect->size.height;
    p_currentDragCaretRect->origin.double x = x;
    p_currentDragCaretRect->origin.double y = y;
    p_currentDragCaretRect->size.double width = width;
    p_currentDragCaretRect->size.double height = height;
    -[UIWebDocumentView _didChangeDragCaretRectFromRect:toRect:](self, "_didChangeDragCaretRectFromRect:toRect:", v9, v10, v11, v12, x, y, width, height);
  }
}

- (BOOL)dragInteractionEnabled
{
  return [(UIDragInteraction *)self->_dragInteraction isEnabled];
}

- (void)setDragInteractionEnabled:(BOOL)a3
{
}

- (DOMRange)rangeToRestoreAfterDictation
{
  return self->_rangeToRestoreAfterDictation;
}

- (void)setRangeToRestoreAfterDictation:(id)a3
{
}

- (BOOL)suppressesIncrementalRendering
{
  return self->_suppressesIncrementalRendering;
}

- (void)setSuppressesIncrementalRendering:(BOOL)a3
{
  self->_suppressesIncrementalRendering = a3;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (UIWebDraggingDelegate)webDraggingDelegate
{
  return self->_webDraggingDelegate;
}

- (void)setWebDraggingDelegate:(id)a3
{
  self->_webDraggingDelegate = (UIWebDraggingDelegate *)a3;
}

- (CGPoint)lastGlobalPosition
{
  double x = self->_lastGlobalPosition.x;
  double y = self->_lastGlobalPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastGlobalPosition:(CGPoint)a3
{
  self->_lastGlobalPosition = a3;
}

- (NSString)draggedLinkTitle
{
  return self->_draggedLinkTitle;
}

- (void)setDraggedLinkTitle:(id)a3
{
}

- (NSURL)draggedLinkURL
{
  return self->_draggedLinkURL;
}

- (void)setDraggedLinkURL:(id)a3
{
}

- (unint64_t)currentDragSourceAction
{
  return self->_currentDragSourceAction;
}

- (void)setCurrentDragSourceAction:(unint64_t)a3
{
  self->_currentDragSourceAction = a3;
}

- (UIView)initialDropSnapshotView
{
  return self->_initialDropSnapshotView;
}

- (void)setInitialDropSnapshotView:(id)a3
{
}

- (CGRect)exposedScrollViewRect
{
  double x = self->_exposedScrollViewRect.origin.x;
  double y = self->_exposedScrollViewRect.origin.y;
  double width = self->_exposedScrollViewRect.size.width;
  double height = self->_exposedScrollViewRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)wantsMinimalUI
{
  return self->_wantsMinimalUI;
}

- (unint64_t)renderTreeSize
{
  return self->_renderTreeSize;
}

- (unint64_t)renderTreeSizeThresholdForReset
{
  return self->_renderTreeSizeThresholdForReset;
}

+ (id)_createDefaultHighlightView
{
  id v2 = [_UIHighlightView alloc];
  float v3 = -[_UIHighlightView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v3 setOpaque:0];
  [(_UIHighlightView *)v3 setCornerRadius:2.0];
  [(_UIHighlightView *)v3 setColor:+[UIColor colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.3]];
  return v3;
}

+ (id)_sharedHighlightView
{
  id result = (id)_sharedHighlightView__highlightView;
  if (!_sharedHighlightView__highlightView)
  {
    id result = +[UIWebDocumentView _createDefaultHighlightView];
    _sharedHighlightView__highlightView = (uint64_t)result;
  }
  return result;
}

- (void)_registerPreview
{
  if (self->_previewItemController) {
    [(UIWebDocumentView *)self _unregisterPreview];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [(UIWebDocumentView *)self allowsLinkPreview])
  {
    float v3 = [[UIPreviewItemController alloc] initWithView:self];
    self->_previewItemController = v3;
    [(UIPreviewItemController *)v3 setDelegate:self];
    self->_previewGestureRecognizer = (UILongPressGestureRecognizer *)[(UIPreviewItemController *)self->_previewItemController presentationGestureRecognizer];
    self->_previewSecondaryGestureRecognizer = (UILongPressGestureRecognizer *)[(UIPreviewItemController *)self->_previewItemController presentationSecondaryGestureRecognizer];
  }
}

- (void)_unregisterPreview
{
  self->_previewGestureRecognizer = 0;
  self->_previewSecondaryGestureRecognizer = 0;
  [(UIPreviewItemController *)self->_previewItemController setDelegate:0];

  self->_previewItemController = 0;
}

- (BOOL)isPreviewing
{
  return [(UIPreviewItemController *)self->_previewItemController interactionInProgress];
}

- (BOOL)_previewAllowedForPosition:(CGPoint)a3
{
  CGPoint v7 = a3;
  WebThreadLock();
  id v4 = [(UIWebDocumentView *)self approximateNodeAtViewportLocation:&v7];
  if (v4)
  {
    char v5 = v4;
    objc_opt_class();
    LOBYTE(v4) = (objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "absoluteLinkURL", *(void *)&v7.x, *(void *)&v7.y), "absoluteString"), "length");
  }
  return (char)v4;
}

- (BOOL)_interactionShouldBeginFromPreviewItemController:(id)a3 forPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    return objc_msgSend(delegate, "_webView:previewIsAllowedForPosition:", self, x, y);
  }
  else
  {
    return -[UIWebDocumentView _previewAllowedForPosition:](self, "_previewAllowedForPosition:", x, y);
  }
}

- (id)_dataForPreviewItemController:(id)a3 atPosition:(CGPoint)a4 type:(int64_t *)a5
{
  p_interaction = &self->_interaction;
  if (!self->_interaction.element) {
    return 0;
  }
  WebThreadLock();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = (void *)[(DOMNode *)p_interaction->element absoluteLinkURL];
    if (objc_msgSend((id)objc_msgSend(v10, "absoluteString"), "length"))
    {
      *a5 = 2;
      [v8 setObject:v10 forKeyedSubscript:UIPreviewDataLink];
      id v11 = DataDetectorsUIGetClass(@"DDDetectionController");
      double v12 = (void *)[v11 sharedController];
      double v13 = [(WebView *)self->_webView mainFrame];
      if (objc_msgSend((id)objc_msgSend(v11, "tapAndHoldSchemes"), "containsObject:", objc_msgSend(v10, "scheme")))
      {
        uint64_t v16 = 0;
        uint64_t v14 = [v12 resultForNode:p_interaction->element url:v10 frame:v13 contextRef:&v16];
        if (v14) {
          [v8 setObject:v14 forKeyedSubscript:UIPreviewDataDDResult];
        }
        if (v16) {
          [v8 setObject:v16 forKeyedSubscript:UIPreviewDataDDContext];
        }
      }
      else
      {
        double v15 = (void *)[v12 copyContextForContainer:v13];
        if ([v15 count]) {
          [v8 setObject:v15 forKeyedSubscript:UIPreviewDataDDContext];
        }
      }
    }
  }
  return v8;
}

- (id)_presentedViewControllerForPreviewItemController:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id delegate = self->_delegate;
  double v6 = (void *)[a3 previewData];
  uint64_t v7 = [v6 objectForKeyedSubscript:UIPreviewDataLink];
  return (id)[delegate _webView:self previewViewControllerForURL:v7];
}

- (void)_previewItemController:(id)a3 willPresentPreview:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate _webView:self willPresentPreview:a4];
  }
}

- (void)_collectPreviewRevealInformationIfNeeded
{
  p_interaction = &self->_interaction;
  if (!self->_interaction.previewHintImage || !self->_interaction.previewHintRects)
  {
    if (self->_interaction.element)
    {
      WebThreadLock();
      id v3 = [(DOMNode *)p_interaction->element _realNode];
      uint64_t v4 = 0;
      id v5 = 0;
      [v3 getPreviewSnapshotImage:&v4 andRects:&v5];
      p_interaction->previewHintImage = +[UIImage imageWithCGImage:v4];
      p_interaction->previewHintRects = (NSArray *)v5;
    }
  }
}

- (void)_clearPreviewRevealInformation
{
  p_interaction = &self->_interaction;

  p_interaction->previewHintImage = 0;
  p_interaction->previewHintRects = 0;
}

- (void)_previewItemController:(id)a3 didDismissPreview:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate _webView:self didDismissPreview:a4 committing:v5];
  }
}

- (void)_previewItemController:(id)a3 commitPreview:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    [delegate _webView:self commitPreview:a4];
  }
}

- (id)_presentationSnapshotForPreview
{
  return self->_interaction.previewHintImage;
}

- (id)_presentationRectsForPreview
{
  return self->_interaction.previewHintRects;
}

- (id)_presentationSnapshotForPreviewItemController:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    uint64_t v6 = [a3 presentedViewController];
    return (id)[delegate _webView:self presentationSnapshotForPreview:v6];
  }
  else
  {
    return [(UIWebDocumentView *)self _presentationSnapshotForPreview];
  }
}

- (id)_presentationRectsForPreviewItemController:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_delegate;
    uint64_t v6 = [a3 presentedViewController];
    return (id)[delegate _webView:self presentationRectsForPreview:v6];
  }
  else
  {
    return [(UIWebDocumentView *)self _presentationRectsForPreview];
  }
}

- (CGRect)computeRectForElement:(id)a3 withHighligh:(id)a4 isInverted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  double v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "webFrame"), "documentView");
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "bounds");
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  if (a4) {
    double v19 = 2.0;
  }
  else {
    double v19 = 0.0;
  }
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v132 = a3;
  CGFloat v20 = objc_msgSend(a3, "absoluteQuadsAtPoint:", self->_interaction.location.x, self->_interaction.location.y, &self->_interaction);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v162 objects:v170 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v131 = a4;
    uint64_t v23 = *(void *)v163;
    CGFloat v24 = v14;
    CGFloat v25 = v16;
LABEL_6:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v163 != v23) {
        objc_enumerationMutation(v20);
      }
      CGSize v27 = *(void **)(*((void *)&v162 + 1) + 8 * v26);
      if (v27)
      {
        [v27 quad];
        double v29 = *((double *)&v158 + 1);
        double v28 = *(double *)&v158;
        double v30 = *((double *)&v159 + 1);
        double v31 = *(double *)&v159;
        double v32 = *((double *)&v160 + 1);
        double v33 = *(double *)&v160;
        double v34 = *((double *)&v161 + 1);
        double v35 = *(double *)&v161;
      }
      else
      {
        double v34 = 0.0;
        double v35 = 0.0;
        long long v160 = 0u;
        long long v161 = 0u;
        double v32 = 0.0;
        double v33 = 0.0;
        double v30 = 0.0;
        double v31 = 0.0;
        long long v158 = 0u;
        long long v159 = 0u;
        double v29 = 0.0;
        double v28 = 0.0;
      }
      if ((v31 - v28) * (v32 - v29) - (v30 - v29) * (v33 - v28) <= 0.0)
      {
        double v36 = v29;
        double v37 = v28;
      }
      else
      {
        double v36 = v32;
        double v37 = v33;
        double v32 = v29;
        double v33 = v28;
      }
      BOOL v38 = v33 == v31 && v30 == v36;
      BOOL v39 = v38 && v37 == v35;
      if (!v39 || v34 != v32)
      {
        BOOL v41 = v32 == v30 && v31 == v37;
        BOOL v42 = v41 && v36 == v34;
        if (!v42 || v35 != v33) {
          break;
        }
      }
      v157[0] = v33;
      v157[1] = v32;
      v157[2] = v31;
      v157[3] = v30;
      v157[4] = v37;
      v157[5] = v36;
      v157[6] = v35;
      v157[7] = v34;
      [v9 convertRect:0 toView:quadBoundingBox(v157)];
      CGFloat x = v172.origin.x;
      CGFloat y = v172.origin.y;
      CGFloat width = v172.size.width;
      CGFloat rect = v172.size.height;
      double v133 = CGRectGetWidth(v172);
      v173.origin.CGFloat x = v12;
      v173.origin.CGFloat y = v24;
      v173.size.CGFloat width = v25;
      v173.size.double height = v18;
      if (v133 > CGRectGetWidth(v173)) {
        goto LABEL_42;
      }
      v174.origin.CGFloat x = x;
      v174.origin.CGFloat y = y;
      v174.size.CGFloat width = width;
      v174.size.double height = rect;
      double Height = CGRectGetHeight(v174);
      v175.origin.CGFloat x = v12;
      v175.origin.CGFloat y = v24;
      v175.size.CGFloat width = v25;
      v175.size.double height = v18;
      if (Height > CGRectGetHeight(v175)) {
        goto LABEL_42;
      }
      v176.origin.CGFloat x = x;
      v176.origin.CGFloat y = y;
      v176.size.CGFloat width = width;
      v176.size.double height = rect;
      CGRect v177 = CGRectIntegral(v176);
      CGRect v178 = CGRectInset(v177, -v19, -v19);
      v47 = (void *)MEMORY[0x1E4F29238];
      if (v5) {
        -[UIView convertRect:toView:](self, "convertRect:toView:", 0, v178.origin.x, v178.origin.y, v178.size.width, v178.size.height);
      }
      objc_msgSend(v10, "addObject:", objc_msgSend(v47, "valueWithCGRect:", v178.origin.x, v178.origin.y, v178.size.width, v178.size.height));
      if (v22 == ++v26)
      {
        uint64_t v22 = [v20 countByEnumeratingWithState:&v162 objects:v170 count:16];
        if (v22) {
          goto LABEL_6;
        }
LABEL_42:
        if (v131) {
          goto LABEL_46;
        }
        goto LABEL_56;
      }
    }
    objc_msgSend(v10, "removeAllObjects", v34, v35);
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v81 = objc_msgSend(v132, "absoluteQuadsAtPoint:", *(double *)(v130 + 8), *(double *)(v130 + 16));
    uint64_t v82 = [v81 countByEnumeratingWithState:&v153 objects:v169 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v154 != v84) {
            objc_enumerationMutation(v81);
          }
          v86 = *(void **)(*((void *)&v153 + 1) + 8 * i);
          if (v86)
          {
            [v86 quad];
            double v87 = *((double *)&v149 + 1);
            double v88 = *(double *)&v149;
            double v89 = *((double *)&v150 + 1);
            double v90 = *(double *)&v150;
            double v91 = *((double *)&v151 + 1);
            double v92 = *(double *)&v151;
            double v94 = *((double *)&v152 + 1);
            double v93 = *(double *)&v152;
          }
          else
          {
            double v94 = 0.0;
            double v93 = 0.0;
            long long v151 = 0u;
            long long v152 = 0u;
            double v91 = 0.0;
            double v92 = 0.0;
            double v89 = 0.0;
            double v90 = 0.0;
            long long v149 = 0u;
            long long v150 = 0u;
            double v87 = 0.0;
            double v88 = 0.0;
          }
          if ((v90 - v88) * (v91 - v87) - (v89 - v87) * (v92 - v88) <= 0.0)
          {
            double v95 = v92;
            double v96 = v91;
          }
          else
          {
            double v95 = v88;
            double v96 = v87;
            double v88 = v92;
            double v87 = v91;
          }
          objc_msgSend(v9, "convertPoint:toView:", 0, v93, v94);
          double v98 = v97 - v19;
          double v100 = v19 + v99;
          v101 = (void *)MEMORY[0x1E4F29238];
          if (v5) {
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v98, v100);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v101, "valueWithCGPoint:", v98, v100));
          objc_msgSend(v9, "convertPoint:toView:", 0, v95, v96);
          double v103 = v102 - v19;
          double v105 = v104 - v19;
          v106 = (void *)MEMORY[0x1E4F29238];
          if (v5) {
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v103, v105);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v106, "valueWithCGPoint:", v103, v105));
          objc_msgSend(v9, "convertPoint:toView:", 0, v90, v89);
          double v108 = v19 + v107;
          double v110 = v109 - v19;
          v111 = (void *)MEMORY[0x1E4F29238];
          if (v5) {
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v108, v110);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v111, "valueWithCGPoint:", v108, v110));
          objc_msgSend(v9, "convertPoint:toView:", 0, v88, v87);
          double v113 = v19 + v112;
          double v115 = v19 + v114;
          v116 = (void *)MEMORY[0x1E4F29238];
          if (v5) {
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v113, v115);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v116, "valueWithCGPoint:", v113, v115));
        }
        uint64_t v83 = [v81 countByEnumeratingWithState:&v153 objects:v169 count:16];
      }
      while (v83);
    }
    if (v131)
    {
      int recta = 0;
      goto LABEL_47;
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    uint64_t v117 = [v10 countByEnumeratingWithState:&v137 objects:v166 count:16];
    if (v117)
    {
      uint64_t v118 = v117;
      char v119 = 0;
      uint64_t v120 = *(void *)v138;
      double v121 = 0.0;
      double v58 = 0.0;
      double v122 = 0.0;
      double v59 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v118; ++j)
        {
          if (*(void *)v138 != v120) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v137 + 1) + 8 * j) CGPointValue];
          if (v119) {
            double v126 = v121;
          }
          else {
            double v126 = v124;
          }
          if (v119) {
            double v127 = v58;
          }
          else {
            double v127 = v124;
          }
          if (v119) {
            double v128 = v122;
          }
          else {
            double v128 = v125;
          }
          if (v119) {
            double v129 = v59;
          }
          else {
            double v129 = v125;
          }
          if (v124 >= v126) {
            double v121 = v124;
          }
          else {
            double v121 = v126;
          }
          if (v124 >= v127) {
            double v58 = v127;
          }
          else {
            double v58 = v124;
          }
          if (v125 >= v128) {
            double v122 = v125;
          }
          else {
            double v122 = v128;
          }
          if (v125 >= v129) {
            double v59 = v129;
          }
          else {
            double v59 = v125;
          }
          char v119 = 1;
        }
        uint64_t v118 = [v10 countByEnumeratingWithState:&v137 objects:v166 count:16];
      }
      while (v118);
    }
    else
    {
      double v121 = 0.0;
      double v58 = 0.0;
      double v122 = 0.0;
      double v59 = 0.0;
    }
    double v60 = v121 - v58;
    double v61 = v122 - v59;
    goto LABEL_66;
  }
  if (!a4)
  {
LABEL_56:
    double v58 = *MEMORY[0x1E4F1DB20];
    double v59 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v60 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v61 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    uint64_t v62 = [v10 countByEnumeratingWithState:&v141 objects:v167 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      char v64 = 0;
      uint64_t v65 = *(void *)v142;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v142 != v65) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v141 + 1) + 8 * k) rectValue];
          double v71 = v67;
          double v72 = v68;
          double v73 = v69;
          double v74 = v70;
          if (v64)
          {
            v179.origin.CGFloat x = v58;
            v179.origin.CGFloat y = v59;
            v179.size.CGFloat width = v60;
            v179.size.double height = v61;
            CGRect v180 = CGRectUnion(v179, *(CGRect *)&v71);
            double v58 = v180.origin.x;
            double v59 = v180.origin.y;
            double v60 = v180.size.width;
            double v61 = v180.size.height;
          }
          else
          {
            double v61 = v70;
            double v60 = v69;
            double v59 = v68;
            double v58 = v67;
          }
          char v64 = 1;
        }
        uint64_t v63 = [v10 countByEnumeratingWithState:&v141 objects:v167 count:16];
      }
      while (v63);
    }
LABEL_66:

    goto LABEL_72;
  }
  id v131 = a4;
LABEL_46:
  int recta = 1;
LABEL_47:
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v49 = (void *)[v132 borderRadii];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v145 objects:v168 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v146;
    do
    {
      for (uint64_t m = 0; m != v51; ++m)
      {
        if (*(void *)v146 != v52) {
          objc_enumerationMutation(v49);
        }
        [*(id *)(*((void *)&v145 + 1) + 8 * m) sizeValue];
        objc_msgSend(v9, "convertSize:toView:", 0);
        objc_msgSend(v48, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v54 + 2.0, v55 + 2.0));
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v145 objects:v168 count:16];
    }
    while (v51);
  }
  [v131 setCornerRadii:v48];

  objc_msgSend(v131, "setColor:", objc_msgSend(v132, "tapHighlightColor"));
  if (v5)
  {
    double v56 = *MEMORY[0x1E4F1DAD8];
    double v57 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(-[UIView _screen](self, "_screen"), "bounds");
  }
  else
  {
    [(UIWebTiledView *)self visibleRect];
    double v56 = v75;
    double v57 = v76;
  }
  if (recta) {
    objc_msgSend(v131, "setFrames:boundaryRect:", v10, v56, v57);
  }
  else {
    objc_msgSend(v131, "setQuads:boundaryRect:", v10, v56, v57);
  }

  double v58 = *MEMORY[0x1E4F1DB20];
  double v59 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v60 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v61 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_72:
  double v77 = v58;
  double v78 = v59;
  double v79 = v60;
  double v80 = v61;
  result.size.double height = v80;
  result.size.CGFloat width = v79;
  result.origin.CGFloat y = v78;
  result.origin.CGFloat x = v77;
  return result;
}

- (void)_interactionStartedFromPreviewItemController:(id)a3
{
  self->_panGestureWasEnabled = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "panGestureRecognizer"), "isEnabled");
  self->_pinchGestureWasEnabled = objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "pinchGestureRecognizer"), "isEnabled");
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView"), "pinchGestureRecognizer"), "setEnabled:", 0);
  [(UIWebDocumentView *)self _collectPreviewRevealInformationIfNeeded];
  [(UIWebDocumentView *)self hideTapHighlight];
  [(UIWebDocumentView *)self resetInteraction];
}

- (void)_interactionStoppedFromPreviewItemController:(id)a3
{
  if (self->_panGestureWasEnabled) {
    objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "panGestureRecognizer"), "setEnabled:", 1);
  }
  if (self->_pinchGestureWasEnabled) {
    objc_msgSend((id)objc_msgSend(-[UIWebDocumentView enclosingScrollView](self, "enclosingScrollView", a3), "pinchGestureRecognizer"), "setEnabled:", 1);
  }
  [(_UIWebHighlightLongPressGestureRecognizer *)self->_highlightLongPressGestureRecognizer cancel];
  [(UIWebDocumentView *)self _clearPreviewRevealInformation];
}

- (void)clearInteractionTimer
{
  self->_interaction.timer = 0;
}

- (void)performInteractionSelector:(SEL)a3 afterDelay:(double)a4
{
  self->_interaction.timer = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:a3 selector:0 userInfo:0 repeats:a4];
}

- (void)_resetInteractionWithLocation:(CGPoint)a3 modifierFlags:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIWebDocumentView *)self clearInteractionTimer];
  [(UIWebDocumentView *)self cancelInteraction];
  self->_interaction.location.CGFloat x = x;
  self->_interaction.location.CGFloat y = y;
  self->_interaction.modifierFlags = a4;
  self->_interaction.isCancelled = 0;
  [(UIWebDocumentView *)self highlightApproximateNodeInverted:0];
  if (!self->_interaction.element)
  {
    [(UIWebDocumentView *)self cancelInteraction];
  }
}

- (void)startInteractionWithLocation:(CGPoint)a3
{
  BOOL isOnWebThread = self->_interaction.isOnWebThread;
  self->_interaction.isBlocked = isOnWebThread;
  if (!isOnWebThread) {
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", 0, a3.x, a3.y);
  }
}

- (void)continueInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isCancelled) {
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", 0, a3.x, a3.y);
  }
}

- (void)tapInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isBlocked && !self->_interaction.var0)
  {
    -[UIWebDocumentView startInteractionWithLocation:](self, "startInteractionWithLocation:", a3.x, a3.y);
    [(UIWebDocumentView *)self attemptClick:self];
  }
}

- (void)validateInteractionWithLocation:(CGPoint)a3
{
  if (!self->_interaction.isCancelled && !self->_interaction.isBlocked && !self->_interaction.var0)
  {
    if (!self->_interaction.isDisplayingHighlight) {
      -[UIWebDocumentView startInteractionWithLocation:](self, "startInteractionWithLocation:", a3.x, a3.y);
    }
    -[UIWebDocumentView attemptClick:](self, "attemptClick:", self, a3.x, a3.y);
  }
}

- (BOOL)startActionSheet
{
  p_interaction = &self->_interaction;
  if (self->_interaction.allowsDataDetectorsSheet
    && self->_interaction.element
    && objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(@"DDDetectionController"), "tapAndHoldSchemes"), "containsObject:", -[DOMNode urlScheme](self->_interaction.element, "urlScheme")))
  {
    [(UIWebDocumentView *)self _showDataDetectorsSheet];
    return 1;
  }
  if (p_interaction->allowsLinkSheet)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIWebDocumentView *)self _showLinkSheet];
      return 1;
    }
  }
  return 0;
}

- (BOOL)isInInteraction
{
  return self->_interaction.attemptedClick || self->_interaction.element != 0;
}

- (BOOL)willInteractWithLocation:(CGPoint)a3
{
  CGPoint v7 = a3;
  WebThreadLock();
  id v4 = [(UIWebDocumentView *)self approximateNodeAtViewportLocation:&v7];
  id v5 = [(UIWebDocumentView *)self formElement];
  BOOL result = (![(UIWebDocumentView *)self _parentTextView]
         || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        && v4
        && ![v5 isEqual:v4];
  return result;
}

- (void)installGestureRecognizers
{
  if (!self->_singleTapGestureRecognizer)
  {
    id v3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__singleTapRecognized_];
    self->_singleTapGestureRecognizer = v3;
    [(UIGestureRecognizer *)v3 setDelegate:self];
    [(UIView *)self addGestureRecognizer:self->_singleTapGestureRecognizer];
    if (!kSingleTapInteractionsEnabled)
    {
      id v4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__doubleTapRecognized_];
      self->_doubleTapGestureRecognizer = v4;
      [(UITapGestureRecognizer *)v4 setNumberOfTapsRequired:2];
      [(UIGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:self];
      [(UIView *)self addGestureRecognizer:self->_doubleTapGestureRecognizer];
      [(UIGestureRecognizer *)self->_singleTapGestureRecognizer requireGestureRecognizerToFail:self->_doubleTapGestureRecognizer];
      id v5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__twoFingerDoubleTapRecognized_];
      self->_twoFingerDoubleTapGestureRecognizer = v5;
      [(UITapGestureRecognizer *)v5 setNumberOfTapsRequired:2];
      [(UITapGestureRecognizer *)self->_twoFingerDoubleTapGestureRecognizer setNumberOfTouchesRequired:2];
      [(UIGestureRecognizer *)self->_twoFingerDoubleTapGestureRecognizer setDelegate:self];
      [(UIView *)self addGestureRecognizer:self->_twoFingerDoubleTapGestureRecognizer];
      [(UIGestureRecognizer *)self->_singleTapGestureRecognizer requireGestureRecognizerToFail:self->_twoFingerDoubleTapGestureRecognizer];
    }
    uint64_t v6 = [[_UIWebHighlightLongPressGestureRecognizer alloc] initWithTarget:self action:sel__highlightLongPressRecognized_];
    self->_highlightLongPressGestureRecognizer = v6;
    [(UILongPressGestureRecognizer *)v6 setDelay:0.12];
    [(UIGestureRecognizer *)self->_highlightLongPressGestureRecognizer setDelegate:self];
    [(UIView *)self addGestureRecognizer:self->_highlightLongPressGestureRecognizer];
    CGPoint v7 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__longPressRecognized_];
    self->_longPressGestureRecognizer = v7;
    [(UILongPressGestureRecognizer *)v7 setDelay:0.75];
    [(UIGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:self];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer _setRequiresQuietImpulse:1];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:1];
    [(UIView *)self addGestureRecognizer:self->_longPressGestureRecognizer];
    id v8 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__twoFingerPanRecognized_];
    self->_twoFingerPanGestureRecognizer = v8;
    [(UIPanGestureRecognizer *)v8 setMinimumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)self->_twoFingerPanGestureRecognizer setMaximumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)self->_twoFingerPanGestureRecognizer setDelegate:self];
    twoFingerPanGestureRecognizer = self->_twoFingerPanGestureRecognizer;
    [(UIView *)self addGestureRecognizer:twoFingerPanGestureRecognizer];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_doubleTapGestureRecognizer == a3 || self->_twoFingerDoubleTapGestureRecognizer == a3) {
    return 1;
  }
  else {
    return !-[UIWebDocumentView _isSubviewOfPlugInView:](self, "_isSubviewOfPlugInView:", [a4 view]);
  }
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  if (self->_highlightLongPressGestureRecognizer == a3 || self->_longPressGestureRecognizer == a3) {
    return [a4 _isGestureType:9] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return [(UITextInteractionAssistant *)self->_textSelectionAssistant loupeGesture] != a4
      || self->_highlightLongPressGestureRecognizer != a3 && self->_longPressGestureRecognizer != a3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (*(_OWORD *)&self->_highlightLongPressGestureRecognizer == __PAIR128__((unint64_t)a4, (unint64_t)a3)
    || self->_highlightLongPressGestureRecognizer == a4 && self->_longPressGestureRecognizer == a3)
  {
    return 1;
  }
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
  if (singleTapGestureRecognizer != a3) {
    goto LABEL_7;
  }
  if ([(UITextInteractionAssistant *)self->_textSelectionAssistant singleTapGesture] == a4) {
    return 1;
  }
  singleTapGestureRecognizer = self->_singleTapGestureRecognizer;
LABEL_7:
  if (singleTapGestureRecognizer == a4
    && [(UITextInteractionAssistant *)self->_textSelectionAssistant singleTapGesture] == a3)
  {
    return 1;
  }
  highlightLongPressGestureRecognizer = self->_highlightLongPressGestureRecognizer;
  if (highlightLongPressGestureRecognizer == a3 && self->_previewSecondaryGestureRecognizer == a4) {
    return 1;
  }
  if (highlightLongPressGestureRecognizer == a4 && self->_previewSecondaryGestureRecognizer == a3) {
    return 1;
  }
  if (highlightLongPressGestureRecognizer == a3 && self->_previewGestureRecognizer == a4) {
    return 1;
  }
  if (highlightLongPressGestureRecognizer == a4 && self->_previewGestureRecognizer == a3) {
    return 1;
  }
  if (self->_singleTapGestureRecognizer == a3 || self->_doubleTapGestureRecognizer == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
  }
  return 0;
}

- (void)_singleTapRecognized:(id)a3
{
  [a3 location];
  int v5 = kSingleTapInteractionsEnabled;
  int v6 = kSingleTapInteractionsHeuristic;
  if (kSingleTapInteractionsEnabled) {
    BOOL v7 = kSingleTapInteractionsHeuristic == 2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [a3 location];
    if (-[UIWebDocumentView _handleSingleTapZoomPreClickAtLocation:](self, "_handleSingleTapZoomPreClickAtLocation:")) {
      return;
    }
    int v5 = kSingleTapInteractionsEnabled;
    int v6 = kSingleTapInteractionsHeuristic;
  }
  if (v5) {
    BOOL v8 = v6 == 3;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    [a3 location];
    -[UIWebDocumentView _handleSingleTapZoomPostClickAtLocation:](self, "_handleSingleTapZoomPostClickAtLocation:");
  }
  else
  {
    if (!self->_interaction.isDisplayingHighlight) {
      *((unsigned char *)self + 957) |= 0x20u;
    }
    [a3 location];
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", [a3 modifierFlags], v9, v10);
    [(UIWebDocumentView *)self attemptClick:self];
  }
}

- (void)_doubleTapRecognized:(id)a3
{
  [a3 location];
  -[UIWebDocumentView _handleDoubleTapAtLocation:](self, "_handleDoubleTapAtLocation:");
}

- (void)_twoFingerDoubleTapRecognized:(id)a3
{
  [a3 location];
  -[UIWebDocumentView _handleTwoFingerDoubleTapAtLocation:](self, "_handleTwoFingerDoubleTapAtLocation:");
}

- (SEL)_actionForLongPressOnElement:(id)a3
{
  if (![a3 touchCalloutEnabled]) {
    return 0;
  }
  if (self->_interaction.allowsImageSheet)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return sel__showImageSheet;
    }
  }
  if (self->_interaction.allowsDataDetectorsSheet)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(@"DDDetectionController"), "tapAndHoldSchemes"), "containsObject:", objc_msgSend(a3, "urlScheme")))return sel__showDataDetectorsSheet; {
    }
      }
  }
  if (!self->_interaction.allowsLinkSheet) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return sel__showLinkSheet;
  }
  else {
    return 0;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if ((*((unsigned char *)self + 956) & 8) == 0
    || (WebThreadLock(),
        [a3 locationInView:self],
        uint64_t v25 = v5,
        uint64_t v26 = v6,
        (id v7 = [(UIWebDocumentView *)self approximateNodeAtViewportLocation:&v25]) != 0))
  {
    if ((self->_highlightLongPressGestureRecognizer == a3
       || self->_doubleTapGestureRecognizer == a3
       || self->_twoFingerDoubleTapGestureRecognizer == a3
       || self->_singleTapGestureRecognizer == a3
       || self->_longPressGestureRecognizer == a3)
      && (WebThreadLock(), (id v8 = [(UIWebDocumentView *)self textFormElement]) != 0)
      && (double v9 = v8,
          [a3 locationInView:self],
          uint64_t v25 = v10,
          uint64_t v26 = v11,
          (id v12 = -[UIWebDocumentView approximateNodeAtViewportLocation:](self, "approximateNodeAtViewportLocation:", &v25)) != 0)&& ([v9 isSameNode:v12] & 1) != 0)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      if (self->_highlightLongPressGestureRecognizer == a3)
      {
        objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
        uint64_t v25 = v13;
        uint64_t v26 = v14;
        WebThreadLock();
        id v7 = [(UIWebDocumentView *)self approximateNodeAtViewportLocation:&v25];
        if (!v7) {
          return (char)v7;
        }
        double v15 = v7;
        if (![v7 alwaysAttemptToShowTapHighlight]
          || ([v15 showsTapHighlight] & 1) == 0)
        {
          LOBYTE(v7) = [(UIWebDocumentView *)self _actionForLongPressOnElement:v15] != 0;
          return (char)v7;
        }
      }
      else if (self->_twoFingerPanGestureRecognizer == a3)
      {
        [a3 locationOfTouch:0 inView:self];
        double v17 = v16;
        double v19 = v18;
        [a3 locationOfTouch:1 inView:self];
        double v21 = v20;
        double v23 = v22;
        WebThreadLock();
        LOBYTE(v7) = -[UIWebDocumentView supportsTwoFingerScrollingAtTouchLocation:andLocation:](self, "supportsTwoFingerScrollingAtTouchLocation:andLocation:", v17, v19, v21, v23);
        return (char)v7;
      }
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (void)_highlightLongPressRecognized:(id)a3
{
  uint64_t v5 = [a3 state];
  if (v5 == 4) {
    goto LABEL_10;
  }
  if (v5 != 3)
  {
    if (v5 == 1)
    {
      if (!self->_interaction.isDisplayingHighlight) {
        *((unsigned char *)self + 957) |= 0x20u;
      }
      [a3 startPoint];
      double v7 = v6;
      double v9 = v8;
      uint64_t v10 = [a3 modifierFlags];
      -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", v10, v7, v9);
    }
    return;
  }
  if ([(UIPreviewItemController *)self->_previewItemController interactionInProgress])
  {
LABEL_10:
    [(UIWebDocumentView *)self cancelInteraction];
  }
  else
  {
    [a3 startPoint];
    -[UIWebDocumentView _resetInteractionWithLocation:modifierFlags:](self, "_resetInteractionWithLocation:modifierFlags:", [a3 modifierFlags], v11, v12);
    [(UIWebDocumentView *)self attemptClick:self];
  }
}

- (void)_longPressRecognized:(id)a3
{
  if ([a3 state] == 1)
  {
    if (self->_interaction.element)
    {
      id v4 = -[UIWebDocumentView _actionForLongPressOnElement:](self, "_actionForLongPressOnElement:");
      if (v4)
      {
        uint64_t v5 = v4;
        if (dyld_program_sdk_at_least()) {
          [self v5];
        }
        else {
          [(UIWebDocumentView *)self performSelector:v5];
        }
        highlightLongPressGestureRecognizer = self->_highlightLongPressGestureRecognizer;
        [(_UIWebHighlightLongPressGestureRecognizer *)highlightLongPressGestureRecognizer cancel];
      }
    }
    else
    {
      [(UIWebDocumentView *)self cancelInteraction];
    }
  }
}

- (void)_twoFingerPanRecognized:(id)a3
{
  uint64_t v5 = [a3 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    [(UIWebDocumentView *)self webViewDidEndOverflowScroll:0];
  }
  else
  {
    if (v5 != 2)
    {
      if (v5 != 1) {
        return;
      }
      [a3 locationInView:self];
      self->_interaction.location.CGFloat x = v6;
      self->_interaction.location.CGFloat y = v7;
      self->_interaction.lastPanTranslation = (CGPoint)*MEMORY[0x1E4F1DAD8];
      [(UIWebDocumentView *)self webViewDidStartOverflowScroll:0];
    }
    if ([(UIPreviewItemController *)self->_previewItemController interactionInProgress])
    {
      [(UIWebDocumentView *)self cancelInteraction];
    }
    else
    {
      [(UIWebDocumentView *)self sendScrollWheelEvents];
    }
  }
}

- (void)performClick:(id)a3
{
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v15[5] = MEMORY[0x1E4F143A8];
    v15[6] = 3221225472;
    v15[7] = __47__UIWebDocumentView_Interaction__performClick___block_invoke_2;
    v15[8] = &unk_1E52DC580;
    v15[9] = *(void *)(a1 + 32);
    WebThreadRunOnMainThread();
  }
  int v3 = [*(id *)(*(void *)(a1 + 32) + 824) nodeCanBecomeFirstResponder];
  if (v3)
  {
    id v4 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    uint64_t v5 = __47__UIWebDocumentView_Interaction__performClick___block_invoke_3;
LABEL_8:
    int v6 = v3 ^ 1;
    v4[2] = v5;
    v4[3] = &unk_1E52DC580;
    v4[4] = *(void *)(a1 + 32);
    WebThreadRunOnMainThread();
    goto LABEL_10;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 824) isLikelyToBeginPageLoad]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    uint64_t v5 = __47__UIWebDocumentView_Interaction__performClick___block_invoke_4;
    goto LABEL_8;
  }
  int v6 = 0;
LABEL_10:
  CGFloat v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) window];
  double v8 = (void *)[*(id *)(a1 + 32) newMouseEvent:0];
  [v7 sendEventSynchronously:v8];
  char v9 = [v8 wasHandled];

  char v10 = 1;
  double v11 = (void *)[*(id *)(a1 + 32) newMouseEvent:1];
  [v7 sendEventSynchronously:v11];
  if ((v9 & 1) == 0) {
    char v10 = [v11 wasHandled];
  }

  if (isKindOfClass) {
    WebThreadRunOnMainThread();
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    WebThreadRunOnMainThread();
  }
  if (kSingleTapInteractionsEnabled) {
    char v12 = v10;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0 && (kSingleTapInteractionsHeuristic - 1) <= 1) {
    WebThreadRunOnMainThread();
  }
  return WebThreadRunOnMainThread();
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginAllowingFocusRedirects];
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) assistFormNode:*(void *)(*(void *)(a1 + 32) + 824)];
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "webView:willClickElement:");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAllowingFocusRedirects];
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "webViewDidClick:");
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syntheticMouseEventNotHandledAtLocation:", *(double *)(*(void *)(a1 + 32) + 776), *(double *)(*(void *)(a1 + 32) + 784));
}

uint64_t __47__UIWebDocumentView_Interaction__performClick___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeInteraction];
}

- (id)newMouseEvent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [MEMORY[0x1E4FB6DA8] instancesRespondToSelector:sel_initWithMouseEventType_timeStamp_location_modifiers_];
  id v6 = objc_alloc(MEMORY[0x1E4FB6DA8]);
  +[UIWebDocumentView getTimestamp];
  if (v5)
  {
    unsigned int modifierFlags = self->_interaction.modifierFlags;
    return (id)objc_msgSend(v6, "initWithMouseEventType:timeStamp:location:modifiers:", v3, modifierFlags & 0xA0000 | ((HIWORD(modifierFlags) & 1) << 18) & 0xFBEFFFFF | (modifierFlags >> 4) & 0x10000 | (((modifierFlags >> 18) & 1) << 20) & 0xFBFFFFFF | (((modifierFlags >> 23) & 1) << 26));
  }
  else
  {
    return (id)objc_msgSend(v6, "initWithMouseEventType:timeStamp:location:", v3);
  }
}

- (void)_sendMouseMoveAndAttemptClick:(id)a3
{
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 432) window];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newMouseEvent:2];
  int v5 = 0;
  [v2 sendMouseMoveEvent:v3 contentChange:&v5];

  if (v5 == 1 || v5 == 2) {
    return WebThreadRunOnMainThread();
  }
  else {
    return [*(id *)(a1 + 32) performClick:*(void *)(a1 + 32)];
  }
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeInteraction];
}

uint64_t __64__UIWebDocumentView_Interaction___sendMouseMoveAndAttemptClick___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deferInteraction];
}

- (void)attemptClick:(id)a3
{
  id v4 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v12 = self;
  if (![(UIView *)self isFirstResponder]) {
    [(UIWebDocumentView *)v4 becomeFirstResponder];
  }
  [(UIWebDocumentView *)v4 clearInteractionTimer];
  p_interaction = &v4->_interaction;
  if (!v4->_interaction.isDisplayingHighlight && GSEventQueueContainsMouseEvent()) {
    goto LABEL_16;
  }
  if ([(UIWebDocumentView *)v4 _isInspectorSearchingForNode])
  {
    WebThreadLock();
    objc_msgSend(-[UIWebDocumentView deepestNodeAtViewportLocation:](v4, "deepestNodeAtViewportLocation:", v4->_interaction.location.x, v4->_interaction.location.y), "inspect");
LABEL_16:
    [(UIWebDocumentView *)v4 cancelInteraction];
    return;
  }
  if (!v4->_interaction.isDisplayingHighlight) {
    [(UIWebDocumentView *)v4 highlightApproximateNodeInverted:0];
  }
  if (v4->_interaction.allowsImageSheet)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && [(interactionSheet *)v4->_interaction.delegate webView:v4 shouldImmediatelyShowImageSheetForElement:v4->_interaction.element])
    {
      [(UIWebDocumentView *)v4 _showImageSheet];
      return;
    }
  }
  if (!v4->_interaction.allowsDataDetectorsSheet) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  id v6 = (void *)[(DOMNode *)v4->_interaction.element absoluteLinkURL];
  uint64_t v7 = [(WebView *)v4->_webView mainFrame];
  if (!v6) {
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    v13[0] = 0;
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      v13[1] = (void *)MEMORY[0x1E4F143A8];
      v13[2] = (void *)3221225472;
      v13[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
      v13[4] = &__block_descriptor_40_e5_v8__0l;
      void v13[5] = v13;
      long long v14 = xmmword_1E5310F50;
      uint64_t v15 = 0;
      TelephonyUtilitiesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    }
    if (TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      char v9 = v13[0];
      if (!v13[0]) {
        goto LABEL_27;
      }
    }
    else
    {
      id v4 = (UIWebDocumentView *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"void *TelephonyUtilitiesLibrary(void)"];
      char v9 = (void *)[(UIWebDocumentView *)v4 handleFailureInFunction:v11, @"UIWebDocumentViewInteraction.m", 121, @"%s", v13[0] file lineNumber description];
      __break(1u);
    }
    free(v9);
LABEL_27:
    if ([v6 hasTelephonyScheme])
    {
LABEL_29:
      [(UIWebDocumentView *)v4 _showDataDetectorsSheet];
      return;
    }
  }
  if (objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(@"DDDetectionController"), "sharedController"), "shouldImmediatelyShowActionSheetForURL:forFrame:", v6, v8))goto LABEL_29; {
LABEL_30:
  }
  if (p_interaction->element)
  {
    p_interaction->BOOL isOnWebThread = 1;
    if (!p_interaction->attemptedClick)
    {
      p_interaction->attemptedClicuint64_t k = 1;
      char v10 = v4;
    }
    [(UIWebDocumentView *)v4 _sendMouseMoveAndAttemptClick:a3];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      [(id)WebThreadMakeNSInvocation() setArgument:&v12 atIndex:2];
      WebThreadCallDelegateAsync();
    }
    if (kSingleTapInteractionsEnabled && (kSingleTapInteractionsHeuristic - 1) <= 1) {
      -[UIWebDocumentView _syntheticMouseEventNotHandledAtLocation:](v12, "_syntheticMouseEventNotHandledAtLocation:", v12->_interaction.location.x, v12->_interaction.location.y);
    }
    [(UIWebDocumentView *)v12 cancelInteraction];
  }
}

- (void)webView:(id)a3 didObserveDeferredContentChange:(int)a4 forFrame:(id)a5
{
  if (a4) {
    [(UIWebDocumentView *)self completeInteraction];
  }
  else {
    -[UIWebDocumentView performClick:](self, "performClick:", self, *(void *)&a4, a5);
  }
}

- (id)approximateNodeAtViewportLocation:(CGPoint *)a3
{
  [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [(WebView *)self->_webView mainFrame];
  return (id)[(WebFrame *)v5 approximateNodeAtViewportLocation:a3];
}

- (id)deepestNodeAtViewportLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(WebFrameView *)[(WebFrame *)[(WebView *)self->_webView mainFrame] frameView] documentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v6 = [(WebView *)self->_webView mainFrame];
  return (id)-[WebFrame deepestNodeAtViewportLocation:](v6, "deepestNodeAtViewportLocation:", x, y);
}

- (void)highlightApproximateNodeInverted:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIWebDocumentView *)self clearInteractionTimer];
  if (!GSEventQueueContainsMouseEvent())
  {
    WebThreadLock();
    id v5 = [(UIWebDocumentView *)self approximateNodeAtViewportLocation:&self->_interaction.location];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v5 = 0;
    }
    id v6 = [(UIWebDocumentView *)self formElement];
    if ([(UIWebDocumentView *)self _parentTextView])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
    }
    if (!v5 || [v6 isEqual:v5]) {
      goto LABEL_8;
    }
    if (v3)
    {
      id v7 = +[UIWebDocumentView _createDefaultHighlightView];
      [(UIWebTiledView *)self visibleRect];
      -[UIView convertRect:toView:](self, "convertRect:toView:", 0);
      objc_msgSend(v7, "setInvertHighlight:clipRect:", 1);
      [v5 showsTapHighlight];
    }
    else
    {
      id v8 = +[UIWebDocumentView _sharedHighlightView];
      id v7 = v8;
      if (!self->_interaction.element)
      {
        [v8 removeFromSuperview];
        if ([v5 showsTapHighlight]) {
          [(UIView *)self addSubview:v7];
        }
      }

      self->_interaction.element = (DOMNode *)+[UIThreadSafeNode threadSafeNodeWithNode:v5];
      if (([v5 showsTapHighlight] & 1) == 0) {
        goto LABEL_21;
      }
    }
    if (*((unsigned char *)self + 957) & 0x20) != 0 && (objc_opt_respondsToSelector()) {
      [(interactionSheet *)self->_interaction.delegate webViewWillShowInteractionHighlight:self];
    }
    [(UIWebDocumentView *)self computeRectForElement:v5 withHighligh:v7 isInverted:v3];
    if (v3)
    {

LABEL_8:
      *((unsigned char *)self + 957) &= ~0x20u;
      return;
    }
LABEL_21:
    self->_mouseDownCount = 0;
    self->_interaction.isDisplayingHighlight = 1;
    goto LABEL_8;
  }
}

- (void)hideTapHighlight
{
  [(UIWebDocumentView *)self clearInteractionTimer];
  id v2 = +[UIWebDocumentView _sharedHighlightView];
  [v2 removeFromSuperview];
}

- (void)highlightApproximateNodeAndDisplayInfoSheet
{
  [(UIWebDocumentView *)self highlightApproximateNodeInverted:0];
  element = self->_interaction.element;
  if (element)
  {
    if (![(DOMNode *)element touchCalloutEnabled]) {
      return;
    }
    if (self->_interaction.allowsImageSheet && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v4 = sel__showImageSheet;
    }
    else if (self->_interaction.allowsDataDetectorsSheet {
           && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    }
           && objc_msgSend((id)objc_msgSend(DataDetectorsUIGetClass(@"DDDetectionController"), "tapAndHoldSchemes"), "containsObject:", -[DOMNode urlScheme](self->_interaction.element, "urlScheme")))
    {
      id v4 = sel__showDataDetectorsSheet;
    }
    else
    {
      if (!self->_interaction.allowsLinkSheet) {
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
      id v4 = sel__showLinkSheet;
    }
    [(UIWebDocumentView *)self performInteractionSelector:v4 afterDelay:0.75];
  }
  else
  {
    [(UIWebDocumentView *)self cancelInteraction];
  }
}

- (void)resetInteraction
{
  self->_interaction.isCancelled = 1;
  self->_interaction.isDisplayingHighlight = 0;
}

- (void)completeInteraction
{
  p_interaction = &self->_interaction;
  self->_interaction.BOOL isOnWebThread = 0;
  [(UIWebDocumentView *)self cancelInteractionWithImmediateDisplay:0];
  if (p_interaction->attemptedClick)
  {
    p_interaction->attemptedClicuint64_t k = 0;
  }
}

- (void)cancelInteraction
{
}

- (void)deferInteraction
{
  [(UIWebDocumentView *)self resetInteraction];
  [(UIWebDocumentView *)self performInteractionSelector:sel_hideTapHighlight afterDelay:0.0];
}

- (void)cancelInteractionWithImmediateDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  p_interaction = &self->_interaction;
  if (self->_interaction.var0)
  {
    element = self->_interaction.element;
    if (element)
    {
      [(DOMNode *)element absoluteQuad];
      v13.origin.double x = quadBoundingBox(v12);
      if (!CGRectIsEmpty(v13))
      {
        if ([(DOMNode *)p_interaction->element ownerDocument]) {
          return;
        }
      }
    }
    var0 = p_interaction->var0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__UIWebDocumentView_Interaction__cancelInteractionWithImmediateDisplay___block_invoke;
    v11[3] = &unk_1E52DC580;
    v11[4] = self;
    [(UIViewController *)var0 dismissViewControllerAnimated:0 completion:v11];
  }
  [(UIWebDocumentView *)self resetInteraction];
  if (!v3)
  {
    p_element = (id *)&p_interaction->element;
    if (!p_interaction->element) {
      return;
    }
    [(UIWebDocumentView *)self performInteractionSelector:sel_hideTapHighlight afterDelay:0.0];
    goto LABEL_15;
  }
  id v8 = (UIWebDocumentView *)objc_msgSend(+[UIWebDocumentView _sharedHighlightView](UIWebDocumentView, "_sharedHighlightView"), "superview");
  p_element = (id *)&p_interaction->element;
  if (p_interaction->element) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == self;
  }
  if (v10)
  {
    [(UIWebDocumentView *)self hideTapHighlight];
LABEL_15:
    if (!p_interaction->var0)
    {
      WebThreadLock();

      id *p_element = 0;
    }
  }
}

uint64_t __72__UIWebDocumentView_Interaction__cancelInteractionWithImmediateDisplay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupSheet];
}

- (id)_targetURL
{
  p_interaction = &self->_interaction;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    element = p_interaction->element;
    return (id)[(DOMNode *)element hrefURL];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = p_interaction->element;
      return (id)[(DOMNode *)v5 absoluteLinkURL];
    }
    else
    {
      return 0;
    }
  }
}

- (void)_didDismissElementSheet
{
  [(UIWebDocumentView *)self _cleanupSheet];
  if (objc_opt_respondsToSelector())
  {
    id delegate = self->_interaction.delegate;
    [(interactionSheet *)delegate webViewDidDismissElementSheet:self];
  }
}

- (void)_cleanupSheet
{
  p_interaction = &self->_interaction;
  [(UIWebRotatingAlertController *)self->_interaction.var0 doneWithSheet];
  [(_UIRotatingAlertController *)p_interaction->var0 setRotatingSheetDelegate:0];
  id v4 = p_interaction->var0;
  p_interaction->var0 = 0;
  [(UIWebDocumentView *)self completeInteraction];
}

- (void)sendScrollWheelEvents
{
  [(UIPanGestureRecognizer *)self->_twoFingerPanGestureRecognizer translationInView:self];
  double documentScale = self->_documentScale;
  if ((v3 - self->_interaction.lastPanTranslation.x) / documentScale != 0.0
    || (v4 - self->_interaction.lastPanTranslation.y) / documentScale != 0.0)
  {
    self->_interaction.lastPanTranslation.double x = v3;
    self->_interaction.lastPanTranslation.double y = v4;
    WebThreadLock();
    id v6 = objc_alloc(MEMORY[0x1E4FB6DA8]);
    +[UIWebDocumentView getTimestamp];
    id v7 = (id)objc_msgSend(v6, "initWithScrollWheelEventWithTimeStamp:location:deltaX:deltaY:");
    objc_msgSend((id)-[WebView window](self->_webView, "window"), "sendEvent:", v7);
  }
}

- (BOOL)supportsTwoFingerScrollingAtTouchLocation:(CGPoint)a3 andLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  char v9 = (void *)-[WebView hitTest:](self->_webView, "hitTest:");
  BOOL v10 = (void *)-[WebView hitTest:](self->_webView, "hitTest:", x, y);
  uint64_t v11 = [v9 lastScrollableAncestor];
  if (v11 && v11 == [v10 lastScrollableAncestor]) {
    return 1;
  }
  if (v9 != v10) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "_frame"), "scrollableNodeAtViewportLocation:", v7, v6);
  uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "_frame"), "scrollableNodeAtViewportLocation:", x, y);
  return v12 && v12 == v13;
}

- (void)setInteractionDelegate:(id)a3
{
  self->_interaction.id delegate = (interactionSheet *)a3;
}

- (id)interactionDelegate
{
  return self->_interaction.delegate;
}

- (void)setAllowsImageSheet:(BOOL)a3
{
  self->_interaction.allowsImageSheet = a3;
}

- (void)setAllowsDataDetectorsSheet:(BOOL)a3
{
  self->_interaction.allowsDataDetectorsSheet = a3;
}

- (void)setAllowsLinkSheet:(BOOL)a3
{
  self->_interaction.allowsLinkSheet = a3;
}

- (id)interactionElement
{
  return self->_interaction.element;
}

- (CGPoint)interactionLocation
{
  double x = self->_interaction.location.x;
  double y = self->_interaction.location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)superviewForSheet
{
  id v2 = self;
  double v3 = [(UIWebDocumentView *)self _parentTextView];
  if (!v3) {
    double v3 = v2;
  }
  double v4 = [(UIView *)v3 window];
  char v5 = objc_opt_respondsToSelector();
  id delegate = v2->_interaction.delegate;
  if (v5)
  {
    return (id)[(interactionSheet *)delegate superviewForInteractionForWebView:v2];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v8 = v2->_interaction.delegate;
    return (id)[(interactionSheet *)v8 superviewForImageSheetForWebView:v2];
  }
  else
  {
    char v9 = 0;
    do
    {
      id v10 = +[UIViewController viewControllerForView:v2];
      if (v10) {
        char v9 = v10;
      }
      id v2 = [(UIView *)v2 superview];
    }
    while (v2);
    if (v9)
    {
      return (id)[v9 view];
    }
    else
    {
      return v4;
    }
  }
}

- (id)_doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)_setAcceptsFirstResponder:(BOOL)a3
{
  self->_interaction.acceptsFirstResponder = a3;
}

- (BOOL)_acceptsFirstResponder
{
  return self->_interaction.acceptsFirstResponder;
}

- (void)_didChangeDragCaretRectFromRect:(CGRect)a3 toRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  BOOL v10 = CGRectIsEmpty(v16);
  if (!IsEmpty || !v10)
  {
    if (IsEmpty)
    {
      uint64_t v11 = [[_UITextDragCaretView alloc] initWithTextInputView:self];
      self->_textDragCaretView = v11;
      uint64_t v12 = +[UIWebCaretRectTextPosition textPositionWithCaretRect:](UIWebCaretRectTextPosition, "textPositionWithCaretRect:", x, y, width, height);
      [(_UITextDragCaretView *)v11 insertAtPosition:v12];
    }
    else
    {
      textDragCaretView = self->_textDragCaretView;
      if (v10)
      {
        [(_UITextDragCaretView *)self->_textDragCaretView remove];

        self->_textDragCaretView = 0;
      }
      else
      {
        long long v14 = +[UIWebCaretRectTextPosition textPositionWithCaretRect:](UIWebCaretRectTextPosition, "textPositionWithCaretRect:", x, y, width, height);
        [(_UITextDragCaretView *)textDragCaretView updateToPosition:v14];
      }
    }
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dragStartedFromWebContent"];
  [a3 _locationInView:self];
  double v7 = v6;
  double v9 = v8;
  webView = self->_webView;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", [(UIView *)self window], v6, v8);
  if (!-[WebView _requestStartDataInteraction:globalPosition:](webView, "_requestStartDataInteraction:globalPosition:", v7, v9, v11, v12))return (id)MEMORY[0x1E4F1CBF0]; {
  [(UIWebDocumentView *)self setCurrentDragSourceAction:[(WebView *)self->_webView _dragSourceAction]];
  }
  if (![(UIWebDocumentView *)self currentDragSourceAction]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  [(WebView *)self->_webView _draggedElementBounds];
  self->_currentDragBoundingRect.origin.double x = v13;
  self->_currentDragBoundingRect.origin.double y = v14;
  self->_currentDragBoundingRect.size.double width = v15;
  self->_currentDragBoundingRect.size.double height = v16;
  [(UIWebDocumentView *)self setDraggedLinkURL:[(WebView *)self->_webView _draggedLinkURL]];
  [(UIWebDocumentView *)self setDraggedLinkTitle:[(WebView *)self->_webView _draggedLinkTitle]];
  uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "takeRegistrationLists"), "firstObject"), "itemProvider");
  if (v17)
  {
    v30[0] = v17;
    double v18 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  }
  else
  {
    double v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (![v18 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  [(UIWebDocumentView *)self webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    double v18 = (void *)[(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self adjustedItemProviders:v18];
  }
  double v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(v19, "addObject:", -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", *(void *)(*((void *)&v25 + 1) + 8 * i)));
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v21);
  }
  return v19;
}

- (CGRect)convertRectWithDocumentScale:(CGRect)a3
{
  double documentScale = self->_documentScale;
  double v4 = a3.origin.x * documentScale;
  double v5 = a3.origin.y * documentScale;
  double v6 = a3.size.width * documentScale;
  double v7 = a3.size.height * documentScale;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)targetedDragPreviewFromCurrentTextIndicatorData
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[(WebView *)self->_webView _getDataInteractionData];
  uint64_t v4 = [v3 dataInteractionImage];
  unint64_t v5 = [(UIWebDocumentView *)self currentDragSourceAction];
  [v3 textBoundingRectInRootViewCoordinates];
  double x = v55.origin.x;
  double y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  if (CGRectIsEmpty(v55))
  {
    double x = self->_currentDragBoundingRect.origin.x;
    double y = self->_currentDragBoundingRect.origin.y;
    double width = self->_currentDragBoundingRect.size.width;
    double height = self->_currentDragBoundingRect.size.height;
  }
  BOOL v10 = (void *)[v3 textRectsInBoundingRectCoordinates];
  if (![v10 count]) {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height));
  }
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:", x, y, width, height);
  if ((v5 & 0xC) != 0)
  {
    double v15 = v11;
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = [UIImageView alloc];
    uint64_t v20 = [v3 contentImage];
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v4;
    }
    uint64_t v22 = [(UIImageView *)v19 initWithImage:v21];
    objc_msgSend(+[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), "convertRect:fromView:", self, v15, v16, v17, v18);
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    -[UIImageView setFrame:](v22, "setFrame:");
    double v31 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), v24 + v28 * 0.5, v26 + v30 * 0.5);
    if (self->_documentScale != 1.0)
    {
      double v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v33 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v50;
        do
        {
          uint64_t v36 = 0;
          do
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v49 + 1) + 8 * v36) CGRectValue];
            -[UIWebDocumentView convertRectWithDocumentScale:](self, "convertRectWithDocumentScale:");
            objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:"));
            ++v36;
          }
          while (v34 != v36);
          uint64_t v34 = [v10 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v34);
      }
      BOOL v10 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:v32];
    }
    double v37 = [(UIPreviewParameters *)[UIDragPreviewParameters alloc] initWithTextLineRects:v10];
    BOOL v38 = (UIColor *)[v3 estimatedBackgroundColor];
    if (!v38) {
      BOOL v38 = +[UIColor whiteColor];
    }
    [(UIPreviewParameters *)v37 setBackgroundColor:v38];
    BOOL v39 = [[UITargetedDragPreview alloc] initWithView:v22 parameters:v37 target:v31];
  }
  else if ((v5 & 2) != 0)
  {
    CGRect v40 = [[UIImageView alloc] initWithImage:v4];
    -[UIView convertRect:toView:](self, "convertRect:toView:", self, self->_currentDragBoundingRect.origin.x, self->_currentDragBoundingRect.origin.y, self->_currentDragBoundingRect.size.width, self->_currentDragBoundingRect.size.height);
    -[UIImageView setFrame:](v40, "setFrame:");
    BOOL v41 = [UIDragPreviewTarget alloc];
    __asm { FMOV            V2.2D, #0.5 }
    v47 = [(UIPreviewTarget *)v41 initWithContainer:self center:vaddq_f64((float64x2_t)self->_currentDragBoundingRect.origin, vmulq_f64((float64x2_t)self->_currentDragBoundingRect.size, _Q2))];
    double v37 = objc_alloc_init(UIDragPreviewParameters);
    [(UIPreviewParameters *)v37 setBackgroundColor:+[UIColor whiteColor]];
    BOOL v39 = [[UITargetedDragPreview alloc] initWithView:v40 parameters:v37 target:v47];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unhandled draggable content type: %tu", v5);
    double v37 = 0;
    BOOL v39 = 0;
  }

  return v39;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self previewForLiftingItem:a4 session:a5]) == 0)
  {
    return [(UIWebDocumentView *)self targetedDragPreviewFromCurrentTextIndicatorData];
  }
  return result;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v5 = +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", [a3 view]);
  [v5 dismissCurrentMenu];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self previewForCancellingItem:a4 withDefault:a5]) == 0)
  {
    return [(UIWebDocumentView *)self targetedDragPreviewFromCurrentTextIndicatorData];
  }
  return result;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  if (!self->_isPerformingDrop) {
    [(UIWebDocumentView *)self resetCurrentDragInformation];
  }
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v6 = [(UIWebDocumentView *)self webDraggingDelegate];
  return [(UIWebDraggingDelegate *)v6 _webView:self dataOwnerForDragSession:a4];
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v9 = [(UIWebDocumentView *)self webDraggingDelegate];
  return -[UIWebDraggingDelegate _webView:dataOwnerForAddingToSession:withTouchAtPoint:](v9, "_webView:dataOwnerForAddingToSession:withTouchAtPoint:", self, a4, x, y);
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  double v6 = [(UIWebDocumentView *)self webDraggingDelegate];
  return [(UIWebDraggingDelegate *)v6 _webView:self dragSessionSupportsSystemDrag:a4];
}

- (void)_createSheetWithElementActions:(id)a3 showLinkTitle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_interaction = &self->_interaction;
  var0 = self->_interaction.var0;
  if (var0) {

  }
  id v7 = [(UIWebDocumentView *)self _targetURL];
  int v8 = [v7 isJavaScriptURL];
  if (!v8
    || objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DE0], "standardPreferences"), "isJavaScriptEnabled"))
  {
    p_interaction->double documentScale = self->_documentScale;
    double v9 = [[UIWebRotatingAlertController alloc] initWithUIWebDocumentView:self];
    p_interaction->var0 = v9;
    [(_UIRotatingAlertController *)v9 setRotatingSheetDelegate:self];
    [(UIAlertController *)v9 setPreferredStyle:0];
    if (v4)
    {
      if (v8) {
        uint64_t v10 = [_UIKitBundle() localizedStringForKey:@"JavaScript Action Sheet Title" value:@"JavaScript" table:@"Localizable"];
      }
      else {
        uint64_t v10 = objc_msgSend(v7, "_web_userVisibleString");
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v11 = 0;
        goto LABEL_13;
      }
      uint64_t v10 = [(DOMNode *)p_interaction->element getAttribute:@"title"];
    }
    double v11 = (void *)v10;
LABEL_13:
    if ([v11 length]) {
      [(UIAlertController *)v9 setTitle:v11];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(a3);
          }
          double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = [v16 _title];
          v22[4] = v16;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke;
          v23[3] = &unk_1E52EBAA8;
          v23[4] = v9;
          v23[5] = self;
          v23[6] = v16;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_2;
          v22[3] = &unk_1E5310DF0;
          [(UIAlertController *)v9 _addActionWithTitle:v17 style:0 handler:v23 shouldDismissHandler:v22];
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
    id v18 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_3;
    v21[3] = &unk_1E5310E18;
    v21[4] = self;
    [(UIAlertController *)v9 addAction:+[UIAlertAction actionWithTitle:v18 style:1 handler:v21]];
  }
}

void *__86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id result = *(void **)(a1 + 40);
  if (v3 == result[105])
  {
    objc_msgSend(*(id *)(a1 + 48), "_runActionWithElement:targetURL:documentView:interactionLocation:", result[103], objc_msgSend(result, "_targetURL"), *(double *)(*(void *)(a1 + 40) + 776), *(double *)(*(void *)(a1 + 40) + 784));
    if (![*(id *)(a1 + 48) dismissalHandler]
      || (id result = (void *)(*(uint64_t (**)(void))([*(id *)(a1 + 48) dismissalHandler] + 16))(),
          result))
    {
      BOOL v4 = *(void **)(a1 + 40);
      return (void *)[v4 _didDismissElementSheet];
    }
  }
  return result;
}

uint64_t __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) dismissalHandler]) {
    return 1;
  }
  id v2 = *(uint64_t (**)(void))([*(id *)(a1 + 32) dismissalHandler] + 16);
  return v2();
}

uint64_t __86__UIWebDocumentView_InteractionPrivate___createSheetWithElementActions_showLinkTitle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismissElementSheet];
}

- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (_UIApplicationHasAppLinkEntitlements() && (id v6 = _UIAppLinkForURL(a3)) != 0)
  {
    id v7 = v6;
    double v11 = @"UIWebElementActionContextAppLinkKey";
    v12[0] = v6;
    objc_msgSend(a4, "addObject:", +[UIWebElementAction standardElementActionWithType:customTitle:context:](UIWebElementAction, "standardElementActionWithType:customTitle:context:", 5, 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
    if (objc_msgSend((id)objc_msgSend(v7, "targetApplicationProxy"), "localizedNameForContext:", 0))
    {
      double v9 = @"UIWebElementActionContextAppLinkKey";
      uint64_t v10 = v7;
      objc_msgSend(a4, "addObject:", +[UIWebElementAction standardElementActionWithType:customTitle:context:](UIWebElementAction, "standardElementActionWithType:customTitle:context:", 6, 0, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)));
    }
  }
  else
  {
    id v8 = +[UIWebElementAction standardElementActionWithType:1];
    [a4 addObject:v8];
  }
}

- (void)_showImageSheet
{
  p_interaction = &self->_interaction;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[interactionSheet webView:showCustomImageSheetForElement:fromLocation:](p_interaction->delegate, "webView:showCustomImageSheetForElement:fromLocation:", self, p_interaction->element, p_interaction->location.x, p_interaction->location.y))
  {
    BOOL v4 = (void *)UIApp;
    uint64_t v5 = objc_msgSend(-[UIView _window](self, "_window"), "windowScene");
    [v4 _cancelAllEventsOfType:0 onWindowScene:v5];
    return;
  }
  id v6 = (void *)[(DOMNode *)p_interaction->element hrefURL];
  uint64_t v7 = [(DOMNode *)p_interaction->element showsTapHighlight];
  id v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v7) {
    [(UIWebDocumentView *)self _appendOpenActionsForURL:v6 actions:v8];
  }
  if ([(id)getSSReadingListClass_0() supportsURL:v6]) {
    objc_msgSend(v8, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 4));
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  double v9 = (uint64_t *)qword_1EB265418;
  long long v24 = (void *)qword_1EB265418;
  if (!qword_1EB265418)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __getkTCCServicePhotosSymbolLoc_block_invoke;
    uint64_t v20 = &unk_1E52D9900;
    uint64_t v10 = TCCLibrary_0();
    v22[3] = (uint64_t)dlsym(v10, "kTCCServicePhotos");
    qword_1EB265418 = v22[3];
    double v9 = (uint64_t *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v9)
  {
    double v15 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkTCCServicePhotos(void)"), @"UIWebDocumentViewInteraction.m", 124, @"%s", dlerror(), v17, v18, v19, v20);
LABEL_29:
    __break(1u);
    return;
  }
  uint64_t v11 = *v9;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v12 = (unsigned int (*)(uint64_t, void))off_1EB265410;
  long long v24 = off_1EB265410;
  if (!off_1EB265410)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __getTCCAccessPreflightSymbolLoc_block_invoke_0;
    uint64_t v20 = &unk_1E52D9900;
    uint64_t v13 = TCCLibrary_0();
    v22[3] = (uint64_t)dlsym(v13, "TCCAccessPreflight");
    off_1EB265410 = (_UNKNOWN *)v22[3];
    uint64_t v12 = (unsigned int (*)(uint64_t, void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
  {
    double v16 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "TCCAccessPreflightResult __TCCAccessPreflight(CFStringRef, CFDictionaryRef)"), @"UIWebDocumentViewInteraction.m", 123, @"%s", dlerror(), v17, v18, v19, v20);
    goto LABEL_29;
  }
  if (v12(v11, 0) != 1) {
    objc_msgSend(v8, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 3));
  }
  if (([v6 isJavaScriptURL] & 1) == 0) {
    objc_msgSend(v8, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 2));
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = -[interactionSheet webView:actionsForImageElement:withTargetURL:suggestedActions:](p_interaction->delegate, "webView:actionsForImageElement:withTargetURL:suggestedActions:", self, p_interaction->element, v6, (id)[v8 copy]);
    if (v14) {
      id v8 = (void *)v14;
    }
  }
  [(UIWebDocumentView *)self _createSheetWithElementActions:v8 showLinkTitle:v7];
  if (p_interaction->var0)
  {
    [(UIWebDocumentView *)self highlightApproximateNodeInverted:1];
    if (![(UIWebRotatingAlertController *)p_interaction->var0 presentSheet]) {
      [(UIWebDocumentView *)self _didDismissElementSheet];
    }
  }
}

- (void)_showLinkSheet
{
  p_interaction = &self->_interaction;
  uint64_t v4 = [(DOMNode *)self->_interaction.element absoluteLinkURL];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    [(UIWebDocumentView *)self _appendOpenActionsForURL:v5 actions:v6];
    if ([(id)getSSReadingListClass_0() supportsURL:v5]) {
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 4));
    }
    if (([v5 isJavaScriptURL] & 1) == 0)
    {
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 2));
      objc_msgSend(v6, "addObject:", +[UIWebElementAction standardElementActionWithType:](UIWebElementAction, "standardElementActionWithType:", 7));
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = -[interactionSheet webView:actionsForLinkElement:withTargetURL:suggestedActions:](p_interaction->delegate, "webView:actionsForLinkElement:withTargetURL:suggestedActions:", self, p_interaction->element, v5, (id)[v6 copy]);
      if (v7) {
        id v6 = (void *)v7;
      }
    }
    [(UIWebDocumentView *)self _createSheetWithElementActions:v6 showLinkTitle:1];
    if (p_interaction->var0)
    {
      [(UIWebDocumentView *)self hideTapHighlight];
      if (![(UIWebRotatingAlertController *)p_interaction->var0 presentSheet])
      {
        [(UIWebDocumentView *)self _didDismissElementSheet];
      }
    }
  }
}

- (void)actionDidFinish
{
  if (self->m_parentTextView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id m_parentTextView = self->m_parentTextView;
    [m_parentTextView actionDidFinish];
  }
}

- (void)_showDataDetectorsSheet
{
  p_interaction = &self->_interaction;
  uint64_t v4 = [(DOMNode *)self->_interaction.element absoluteLinkURL];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = DataDetectorsUIGetClass(@"DDDetectionController");
    if (objc_msgSend((id)objc_msgSend(v6, "tapAndHoldSchemes"), "containsObject:", objc_msgSend(v5, "scheme")))
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "sharedController"), "actionsForDOMNode:forFrame:", p_interaction->element, -[WebView mainFrame](self->_webView, "mainFrame"));
      if ([v7 count])
      {
        uint64_t v13 = p_interaction;
        id v8 = (void *)[MEMORY[0x1E4F1CA48] array];
        if ([v7 count])
        {
          unint64_t v9 = 0;
          do
          {
            uint64_t v10 = (void *)[v7 objectAtIndex:v9];
            uint64_t v11 = [v10 localizedName];
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke;
            v15[3] = &unk_1E5310E40;
            v15[4] = v6;
            v15[5] = v10;
            v15[6] = self;
            id v12 = +[UIWebElementAction customElementActionWithTitle:v11 actionHandler:v15];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke_2;
            v14[3] = &unk_1E5310DF0;
            v14[4] = v10;
            [v12 setDismissalHandler:v14];
            [v8 addObject:v12];
            ++v9;
          }
          while (v9 < [v7 count]);
        }
        [(UIWebDocumentView *)self _createSheetWithElementActions:v8 showLinkTitle:0];
        if (v13->var0)
        {
          [(UIWebDocumentView *)self hideTapHighlight];
          if ((unint64_t)[v8 count] <= 1) {
            [(_UIRotatingAlertController *)v13->var0 setArrowDirections:3];
          }
          if (![(UIWebRotatingAlertController *)v13->var0 presentSheet]) {
            [(UIWebDocumentView *)self _didDismissElementSheet];
          }
        }
      }
    }
  }
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) sharedController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 840);
  return objc_msgSend(v2, "performAction:fromAlertController:interactionDelegate:", v3, v4);
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___showDataDetectorsSheet__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasUserInterface] ^ 1;
}

- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4
{
  objc_msgSend(a4, "convertPoint:fromView:", self, a3.x, a3.y);
  double v6 = 1.0;
  double v7 = 1.0;
  return CGRectInset(*(CGRect *)&v4, -22.0, -22.0);
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  id v4 = [(UIWebDocumentView *)self superviewForSheet];
  if (v4)
  {
    -[UIWebDocumentView _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v4, self->_interaction.location.x, self->_interaction.location.y);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet:(id)a3
{
  WebThreadLock();
  id v4 = [(UIWebDocumentView *)self superviewForSheet];
  if (!v4) {
    goto LABEL_12;
  }
  id v5 = v4;
  element = self->_interaction.element;
  if (element)
  {
    [(DOMNode *)element absoluteQuad];
    double v7 = self->_interaction.element;
  }
  else
  {
    double v7 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
  }
  double v8 = quadBoundingBox((double *)&v29);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(DOMDocument *)[(DOMNode *)v7 ownerDocument] webFrame];
  v34.origin.double x = v8;
  v34.origin.double y = v10;
  v34.size.CGFloat width = v12;
  v34.size.CGFloat height = v14;
  if (CGRectIsEmpty(v34)) {
    goto LABEL_12;
  }
  if (v15)
  {
    double x = self->_interaction.location.x;
    double y = self->_interaction.location.y;
    double documentScale = self->_interaction.documentScale;
    double v19 = self->_documentScale;
    if (documentScale != v19)
    {
      double v20 = v19 / documentScale;
      double x = x * v20;
      double y = y * v20;
      self->_interaction.double documentScale = v19;
    }
    -[UIWebDocumentView convertRect:fromFrame:](self, "convertRect:fromFrame:", v15, v8, v10, v12, v14, v29, v30, v31, v32);
    CGFloat v21 = v35.origin.x;
    CGFloat v22 = v35.origin.y;
    CGFloat width = v35.size.width;
    CGFloat height = v35.size.height;
    v33.double x = x;
    v33.double y = y;
    if (!CGRectContainsPoint(v35, v33))
    {
      v36.origin.double x = v21;
      v36.origin.double y = v22;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      double x = CGRectGetMidX(v36);
      v37.origin.double x = v21;
      v37.origin.double y = v22;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      double y = CGRectGetMidY(v37);
    }
    self->_interaction.location.double x = x;
    self->_interaction.location.double y = y;
    -[UIWebDocumentView _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v5, x, y);
  }
  else
  {
LABEL_12:
    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (void)resetCurrentDragInformation
{
  [(UIWebDocumentView *)self setCurrentDragSourceAction:0];
  uint64_t v3 = MEMORY[0x1E4F1DB28];
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIWebDocumentView *)self setDraggedLinkURL:0];
  [(UIWebDocumentView *)self setDraggedLinkTitle:0];
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "hasPendingOperation") & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:", 0);
  }
  [(UIView *)[(UIWebDocumentView *)self initialDropSnapshotView] removeFromSuperview];
  [(UIWebDocumentView *)self setInitialDropSnapshotView:0];
  CGSize v4 = *(CGSize *)(v3 + 16);
  self->_currentDragBoundingRect.origin = *(CGPoint *)v3;
  self->_currentDragBoundingRect.size = v4;
  id v5 = [(UIWebDocumentView *)self interactionAssistant];
  [(UITextInteractionAssistant *)v5 setGestureRecognizers];
}

- (void)updateDragCaretIfPossible
{
  [(WebView *)self->_webView _dataInteractionCaretRect];
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:");
}

- (void)computeClientAndGlobalPointsForSession:(id)a3 outClientPoint:(CGPoint *)a4 outGlobalPoint:(CGPoint *)a5
{
  if (a4)
  {
    [a3 locationInView:self];
    a4->double x = v9;
    a4->double y = v10;
  }
  if (a5)
  {
    double v11 = [(UIView *)self window];
    if (v11) {
      [a3 locationInView:v11];
    }
    else {
      [(UIWebDocumentView *)self lastGlobalPosition];
    }
    a5->double x = v12;
    a5->double y = v13;
  }
}

- (void)_transitionDragPreviewToImageIfNecessary:(id)a3
{
  if (([(UIWebDocumentView *)self currentDragSourceAction] & 6) == 4)
  {
    id v5 = [(UIWebDocumentView *)self draggedLinkURL];
    if (v5)
    {
      double v6 = v5;
      double v7 = [(UIWebDocumentView *)self draggedLinkTitle];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "items", MEMORY[0x1E4F143A8], 3221225472, __82__UIWebDocumentView_InteractionPrivate___transitionDragPreviewToImageIfNecessary___block_invoke, &unk_1E5310E68, v7, v6, *(_OWORD *)&self->_currentDragBoundingRect.origin, *(void *)&self->_currentDragBoundingRect.size.width, *(void *)&self->_currentDragBoundingRect.size.height), "firstObject"), "setPreviewProvider:", &v8);
    }
  }
}

UIDragPreview *__82__UIWebDocumentView_InteractionPrivate___transitionDragPreviewToImageIfNecessary___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[UIURLDragPreviewView viewWithTitle:*(void *)(a1 + 32) URL:*(void *)(a1 + 40)];
  __asm { FMOV            V2.2D, #0.5 }
  [(UIView *)v2 setCenter:vaddq_f64(*(float64x2_t *)(a1 + 48), vmulq_f64(*(float64x2_t *)(a1 + 64), _Q2))];
  uint64_t v8 = [UIDragPreviewParameters alloc];
  CGFloat v9 = (void *)MEMORY[0x1E4F29238];
  [(UIView *)v2 bounds];
  v11[0] = objc_msgSend(v9, "valueWithCGRect:");
  return -[UIDragPreview initWithView:parameters:]([UIDragPreview alloc], "initWithView:parameters:", v2, -[UIPreviewParameters initWithTextLineRects:](v8, "initWithTextLineRects:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]));
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    [(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self sessionDidEnter:a4];
  }
  self->_isPerformingDrop = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [(UIWebDocumentView *)self computeClientAndGlobalPointsForSession:a4 outClientPoint:&v7 outGlobalPoint:&v9];
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", v9, v10);
  uint64_t v6 = [a4 _operationMask];
  -[WebView _enteredDataInteraction:client:global:operation:](self->_webView, "_enteredDataInteraction:client:global:operation:", a4, v6, v7, v8, v9, v10);
  [(UIWebDocumentView *)self updateDragCaretIfPossible];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance", a3), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  double v14 = 0.0;
  double v15 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  [(UIWebDocumentView *)self computeClientAndGlobalPointsForSession:a4 outClientPoint:&v12 outGlobalPoint:&v14];
  -[UIWebDocumentView setLastGlobalPosition:](self, "setLastGlobalPosition:", v14, v15);
  uint64_t v6 = [a4 _operationMask];
  uint64_t v7 = -[WebView _updatedDataInteraction:client:global:operation:](self->_webView, "_updatedDataInteraction:client:global:operation:", a4, v6, v12, v13, v14, v15);
  uint64_t v8 = 3;
  if (v7 != 16) {
    uint64_t v8 = 0;
  }
  if (v7 == 1) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8;
  }
  double v10 = [[UIDropProposal alloc] initWithDropOperation:v9];
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self willUpdateDropProposalToProposal:v10 forSession:a4], v10 == result))
  {
    [(UIWebDocumentView *)self updateDragCaretIfPossible];
    return v10;
  }
  return result;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    [(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self dropInteraction:a3 item:a4 willAnimateDropWithAnimator:a5];
  }
  uint64_t v9 = (void *)[(WebView *)self->_webView _dataOperationTextIndicator];
  double v10 = [(UIWebDocumentView *)self initialDropSnapshotView];
  if ([v9 contentImageWithoutSelection])
  {
    double v11 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", [v9 contentImageWithoutSelection]);
    double v12 = (UIColor *)[v9 estimatedBackgroundColor];
    if (!v12) {
      double v12 = +[UIColor whiteColor];
    }
    [(UIImageView *)v11 setBackgroundColor:v12];
    [v9 contentImageWithoutSelectionRectInRootViewCoordinates];
    -[UIImageView setFrame:](v11, "setFrame:");
    [(UIView *)self insertSubview:v11 below:v10];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v15[3] = &unk_1E5310E90;
    v15[4] = v11;
    [a5 addCompletion:v15];
  }
  if (v10)
  {
    v13[4] = v10;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
    v14[3] = &unk_1E52DC580;
    v14[4] = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3;
    v13[3] = &unk_1E530D518;
    +[UIView animateWithDuration:v14 animations:v13 completion:0.1];
    [(UIWebDocumentView *)self setInitialDropSnapshotView:0];
  }
}

void __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = *(void **)(a1 + 32);
}

uint64_t __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __90__UIWebDocumentView_InteractionPrivate__dropInteraction_item_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    [(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self sessionDidExit:a4];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4FB6DC0], "sharedInstance"), "setItemProviders:", extractItemProvidersFromDropSession(a4));
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [(UIWebDocumentView *)self computeClientAndGlobalPointsForSession:a4 outClientPoint:&v7 outGlobalPoint:&v9];
  uint64_t v6 = [a4 _operationMask];
  -[WebView _exitedDataInteraction:client:global:operation:](self->_webView, "_exitedDataInteraction:client:global:operation:", a4, v6, v7, v8, v9, v10);
  -[UIWebDocumentView setCurrentDragCaretRect:](self, "setCurrentDragCaretRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dropOnWebContent"];
  uint64_t v6 = [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(UIWebDraggingDelegate *)v6 _webView:self performDropWithSession:a4] & 1) == 0)
  {
    ItemProvidersFromDropSession = extractItemProvidersFromDropSession(a4);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(UIWebDraggingDelegate *)v6 _webView:self performDropWithItemProviders:ItemProvidersFromDropSession] & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (ItemProvidersFromDropSession = (void *)-[UIWebDraggingDelegate _webView:willPerformDropWithSession:](v6, "_webView:willPerformDropWithSession:", self, a4), [ItemProvidersFromDropSession count]))
      {
        self->_didCreateDropPreview = 0;
        self->_didEndDropSession = 0;
        self->_isPerformingDrop = 1;
        double v8 = (void *)[MEMORY[0x1E4FB6DC0] sharedInstance];
        objc_msgSend(v8, "incrementPendingOperationCount", MEMORY[0x1E4F143A8], 3221225472, __69__UIWebDocumentView_InteractionPrivate__dropInteraction_performDrop___block_invoke, &unk_1E5310EB8, self, a4, ItemProvidersFromDropSession, v8);
        [v8 setItemProviders:ItemProvidersFromDropSession];
        if (objc_opt_respondsToSelector()) {
          [v8 doAfterLoadingProvidedContentIntoFileURLs:&v9 synchronousTimeout:0.25];
        }
        else {
          [v8 doAfterLoadingProvidedContentIntoFileURLs:&v9];
        }
      }
    }
  }
}

uint64_t __69__UIWebDocumentView_InteractionPrivate__dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  [*(id *)(a1 + 32) computeClientAndGlobalPointsForSession:*(void *)(a1 + 40) outClientPoint:&v8 outGlobalPoint:&v10];
  uint64_t v2 = [*(id *)(a1 + 40) _operationMask];
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[1138])
  {
    CGSize v4 = (void *)[v3 snapshotViewAfterScreenUpdates:0];
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(v4, "setFrame:");
    [*(id *)(a1 + 32) addSubview:v4];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "initialDropSnapshotView"), "removeFromSuperview");
    [*(id *)(a1 + 32) setInitialDropSnapshotView:v4];
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "_tryToPerformDataInteraction:client:global:operation:", *(void *)(a1 + 40), v2, v8, v9, v10, v11);
  }
  else {
    uint64_t v5 = 1;
  }
  [*(id *)(a1 + 32) webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate"), "_webView:allowsSelectingContentAfterDropForSession:", *(void *)(a1 + 32), *(void *)(a1 + 40)) & 1) == 0)
  {
    [*(id *)(a1 + 32) clearSelection];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 1137))
  {
    objc_msgSend(*(id *)(v6 + 432), "_endedDataInteraction:global:", v8, v9, v10, v11);
    [*(id *)(a1 + 32) resetCurrentDragInformation];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v6 + 1136) = 0;
  [*(id *)(a1 + 32) webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webDraggingDelegate"), "_webView:dropWasHandled:forSession:itemProviders:", *(void *)(a1 + 32), v5, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  [*(id *)(a1 + 56) decrementPendingOperationCount];
  return [*(id *)(a1 + 56) setItemProviders:0];
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if (objc_opt_respondsToSelector()) {
    [(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self dropInteraction:a3 concludeDrop:a4];
  }
  [(UIView *)[(UIWebDocumentView *)self initialDropSnapshotView] removeFromSuperview];
  [(UIWebDocumentView *)self setInitialDropSnapshotView:0];
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  self->_didEndDropSession = 1;
  if (!self->_isPerformingDrop)
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
    [(UIWebDocumentView *)self computeClientAndGlobalPointsForSession:a4 outClientPoint:&v5 outGlobalPoint:&v7];
    -[WebView _endedDataInteraction:global:](self->_webView, "_endedDataInteraction:global:", v5, v6, v7, v8);
    [(UIWebDocumentView *)self resetCurrentDragInformation];
  }
}

- (id)fallbackDropPreviewForUninsertedContent:(id)a3
{
  [(UIWebDocumentView *)self currentDragCaretRect];
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  if (CGRectIsEmpty(v19)) {
    return 0;
  }
  -[UIView convertRect:toView:](self, "convertRect:toView:", +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene")), x, y, width, height);
  CGFloat v10 = v20.origin.x;
  CGFloat v11 = v20.origin.y;
  CGFloat v12 = v20.size.width;
  CGFloat v13 = v20.size.height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = v10;
  v21.origin.double y = v11;
  v21.size.double width = v12;
  v21.size.double height = v13;
  double MidY = CGRectGetMidY(v21);
  double v16 = [UIDragPreviewTarget alloc];
  id v17 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", objc_msgSend(-[UIView _window](self, "_window"), "windowScene"));
  CGAffineTransformMakeScale(&v18, 0.0001, 0.0001);
  return (id)objc_msgSend(a3, "retargetedPreviewWithTarget:", -[UIPreviewTarget initWithContainer:center:transform:](v16, "initWithContainer:center:transform:", v17, &v18, MidX, MidY));
}

- (id)editDragPreviewForTextIndicator:(id)a3
{
  [a3 textBoundingRectInRootViewCoordinates];
  if (CGRectIsEmpty(v20)) {
    return 0;
  }
  double v6 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", [a3 contentImage]);
  [a3 textBoundingRectInRootViewCoordinates];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[UIImageView setBounds:](v6, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v15 = -[UIPreviewParameters initWithTextLineRects:]([UIDragPreviewParameters alloc], "initWithTextLineRects:", [a3 textRectsInBoundingRectCoordinates]);
  double v16 = (UIColor *)[a3 estimatedBackgroundColor];
  if (!v16) {
    double v16 = +[UIColor whiteColor];
  }
  [(UIPreviewParameters *)v15 setBackgroundColor:v16];
  id v17 = -[UIPreviewTarget initWithContainer:center:]([UIDragPreviewTarget alloc], "initWithContainer:center:", self, v8 + v12 * 0.5, v10 + v14 * 0.5);
  CGAffineTransform v18 = [[UITargetedDragPreview alloc] initWithView:v6 parameters:v15 target:v17];

  return v18;
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(UIWebDraggingDelegate *)[(UIWebDocumentView *)self webDraggingDelegate] _webView:self previewForDroppingItem:a4 withDefault:a5]) == 0)
  {
    id result = [(UIWebDocumentView *)self editDragPreviewForTextIndicator:[(WebView *)self->_webView _dataOperationTextIndicator]];
    if (!result) {
      id result = [(UIWebDocumentView *)self fallbackDropPreviewForUninsertedContent:a5];
    }
  }
  self->_didCreateDropPreview = 1;
  return result;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  [(UIWebDocumentView *)self webDraggingDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v6 = [(UIWebDocumentView *)self webDraggingDelegate];
  return [(UIWebDraggingDelegate *)v6 _webView:self dataOwnerForDropSession:a4];
}

- (BOOL)shouldRevealCurrentSelectionAfterInsertion
{
  return !self->_interaction.isWriting;
}

- (void)_selectPositionAtPoint:(CGPoint)a3
{
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    WebThreadRunOnMainThread();
  }
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _focusedOrMainFrame];
  objc_msgSend(*(id *)(a1 + 32), "convertPointToSelectedFrameCoordinates:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  CGSize v4 = objc_msgSend(v3, "webVisiblePositionForPoint:");
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_focusedOrMainFrame"), "setSelectedDOMRange:affinity:closeTyping:userTriggered:", objc_msgSend(MEMORY[0x1E4FB6D78], "rangeForFirstPosition:second:", v4, v4), objc_msgSend(v4, "affinity"), 1, 1);
  if (isKindOfClass) {
    return WebThreadRunOnMainThread();
  }
  return result;
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginAllowingFocusRedirects];
}

uint64_t __64__UIWebDocumentView_InteractionPrivate___selectPositionAtPoint___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endAllowingFocusRedirects];
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  WebThreadLock();
  webView = self->_webView;
  -[UIWebDocumentView convertRect:toFrame:](self, "convertRect:toFrame:", [(WebView *)webView mainFrame], x, y, width, height);
  double v12 = (void *)-[WebView _editableElementsInRect:](webView, "_editableElementsInRect:");
  if ([v12 count])
  {
    uint64_t v13 = [v12 count];
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    if (v13)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v17 = [v12 objectAtIndex:v15];
        [v14 addObject:v17];
        if (objc_msgSend(-[UIWebDocumentView formElement](self, "formElement"), "isSameNode:", v17)) {
          uint64_t v16 = v15;
        }
        ++v15;
      }
      while (v13 != v15);
    }
    else
    {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v19 = v14;
    CGAffineTransform v18 = (void (*)(id, id, uint64_t))*((void *)a5 + 2);
    id v20 = a5;
    uint64_t v21 = v16;
  }
  else
  {
    CGAffineTransform v18 = (void (*)(id, id, uint64_t))*((void *)a5 + 2);
    id v19 = (id)MEMORY[0x1E4F1CBF0];
    id v20 = a5;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18(v20, v19, v21);
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRun();
  }
  else
  {
    double v7 = (void (*)(id, void))*((void *)a6 + 2);
    v7(a6, 0);
  }
}

uint64_t __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  WebThreadRunOnMainThread();
  uint64_t v2 = *(void **)(a1 + 40);
  if (objc_msgSend(v2, "isSameNode:", objc_msgSend(*(id *)(a1 + 32), "formElement", v5, 3221225472, __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_2, &unk_1E5310F08, v6, v7)))
  {
    [*(id *)(a1 + 32) _focusAndAssistFormNode:v2];
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if ([v2 nodeCanBecomeFirstResponder])
    {
      objc_msgSend(*(id *)(a1 + 32), "_selectPositionAtPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      [*(id *)(a1 + 32) formElement];
    }
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v3();
}

uint64_t __122__UIWebDocumentView_InteractionPrivate___scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) becomeFirstResponder];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadLock();
    if (a4) {
      [a4 innerFrameQuad];
    }
    else {
      memset(v14, 0, sizeof(v14));
    }
    double v10 = quadBoundingBox((double *)v14);
    -[UIWebDocumentView convertRect:fromFrame:](self, "convertRect:fromFrame:", objc_msgSend((id)objc_msgSend(a4, "ownerDocument"), "webFrame"), v10, v11, v12, v13);
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  self->_interaction.isWriting = 1;
  if (objc_opt_respondsToSelector())
  {
    WebThreadLock();
    [a4 setCanShowPlaceholder:0];
  }
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  self->_interaction.isWriting = 0;
  WebThreadRun();
}

uint64_t __88__UIWebDocumentView_InteractionPrivate___scribbleInteraction_didFinishWritingInElement___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (objc_opt_respondsToSelector())
  {
    WebThreadLock();
    [v2 setCanShowPlaceholder:1];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 40) + 432) revealCurrentSelection];
  }
  uint64_t result = [*(id *)(a1 + 40) formElement];
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result) {
      return WebThreadRunOnMainThread();
    }
  }
  return result;
}

uint64_t __88__UIWebDocumentView_InteractionPrivate___scribbleInteraction_didFinishWritingInElement___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayFormNodeInputView];
}

- (BOOL)mouseEventsChangeSelection
{
  return (*((unsigned __int8 *)self + 954) >> 1) & 1;
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIView *)self size];
  double v7 = v6;
  [(UIView *)self size];
  double v21 = v8 * 0.5;
  [(UIWebDocumentView *)self _selectionClipRect];
  CGFloat v9 = v23.origin.x;
  double v10 = v23.origin.y;
  CGFloat width = v23.size.width;
  double height = v23.size.height;
  double MinX = CGRectGetMinX(v23);
  v24.origin.double x = v9;
  v24.origin.double y = v10;
  v24.size.CGFloat width = width;
  v24.size.double height = height;
  double MinY = CGRectGetMinY(v24);
  if (y >= MinY)
  {
    double MinY = v10 + height;
    double v15 = y - (v10 + height);
    if (v15 <= 0.0) {
      goto LABEL_7;
    }
    double v16 = v15 / v21 + 5.0;
  }
  else
  {
    double v15 = y - MinY;
    if (y - MinY >= 0.0) {
      goto LABEL_7;
    }
    double v16 = 5.0 - v15 / v21;
  }
  double y = MinY + v15 / v16;
LABEL_7:
  double v17 = v7 * 0.5;
  if (x >= MinX)
  {
    v25.origin.double x = v9;
    v25.origin.double y = v10;
    v25.size.CGFloat width = width;
    v25.size.double height = height;
    double MaxX = CGRectGetMaxX(v25);
    if (x - MaxX > 0.0) {
      double x = MaxX + (x - MaxX) / ((x - MaxX) / v17 + 5.0);
    }
  }
  else if (x - MinX < 0.0)
  {
    double x = MinX + (x - MinX) / (5.0 - (x - MinX) / v17);
  }
  double v19 = x;
  double v20 = y;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (void)selectWord
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "aggressivelyExpandSelectionToWordContainingCaretSelection");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (CGRect)convertRectFromSelectedFrameCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  WebThreadLock();
  double v8 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "documentView");
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGPoint)convertPointToSelectedFrameCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  double v6 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "documentView");
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)selectionChanged
{
  if ([(UIView *)self superview]) {
    [(UITextInteractionAssistant *)[(UIWebDocumentView *)self interactionAssistant] selectionChanged];
  }
  [(UIWebDocumentView *)self _removeDefinitionController:1];
}

- (void)selectionChanged:(id)a3
{
  CGSize v4 = (void *)[a3 object];
  if (v4 == [(UIWebDocumentView *)self webView])
  {
    [(UIWebDocumentView *)self selectionChanged];
    if (_AXSZoomTouchEnabled())
    {
      [(UIWebDocumentView *)self caretRect];
      UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, *(CGRect *)&v5, &self->super.super);
    }
  }
}

- (void)clearSelection
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "clearSelection");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (BOOL)hasEditableSelection
{
  if (pthread_main_np()) {
    WebThreadLock();
  }
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 hasEditableSelection];
}

- (BOOL)hasMarkedText
{
  WebThreadLock();
  id v3 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if (v3) {
    LOBYTE(v3) = [v3 collapsed] ^ 1;
  }
  return (char)v3;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "closestCaretRectInMarkedTextRangeForPoint:", v5, v7);
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (unint64_t)offsetInMarkedTextForSelection:(id)a3
{
  double v5 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "markedTextDOMRange");
  if (!v5) {
    return 0;
  }
  double v6 = v5;
  if ([v5 collapsed]) {
    return 0;
  }
  WebThreadLock();
  id v8 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  uint64_t v9 = [v8 convertDOMRangeToNSRange:v6];
  unint64_t v7 = v10;
  if (a3)
  {
    uint64_t v11 = v9;
    uint64_t v12 = [v8 convertDOMRangeToNSRange:a3];
    if (v12 - v11 <= v7 && v12 - v11 >= 0) {
      return v12 - v11;
    }
  }
  return v7;
}

- (int)selectionState
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return [v3 selectionState];
}

- (void)collapseSelection
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "collapseSelection");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setCaretInsets:(UIEdgeInsets)a3
{
  self->_caretInsets = a3;
}

- (UIEdgeInsets)caretInsets
{
  double top = self->_caretInsets.top;
  double left = self->_caretInsets.left;
  bottouint64_t m = self->_caretInsets.bottom;
  double right = self->_caretInsets.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)caretRect
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "caretRect");
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  double top = self->_caretInsets.top;
  double left = self->_caretInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_caretInsets.right);
  double v12 = v11 - (top + self->_caretInsets.bottom);
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (CGRect)caretRectForVisiblePosition:(id)a3
{
  WebThreadLock();
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "caretRectForPosition:", a3);
  -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
  double top = self->_caretInsets.top;
  double left = self->_caretInsets.left;
  double v8 = v7 + left;
  double v10 = v9 + top;
  double v12 = v11 - (left + self->_caretInsets.right);
  double v14 = v13 - (top + self->_caretInsets.bottom);
  result.size.double height = v14;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v8;
  return result;
}

- (int64_t)selectionBaseWritingDirection
{
  return (int)objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionBaseWritingDirection");
}

- (void)toggleBaseWritingDirection
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "toggleBaseWritingDirection");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v5 setBaseWritingDirection:a3];
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 setRangedSelectionBaseToCurrentSelection];
}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 setRangedSelectionBaseToCurrentSelectionStart];
}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 setRangedSelectionBaseToCurrentSelectionEnd];
}

- (void)clearRangedSelectionInitialExtent
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 clearRangedSelectionInitialExtent];
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 setRangedSelectionInitialExtentToCurrentSelectionStart];
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  WebThreadLock();
  id v3 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v3 setRangedSelectionInitialExtentToCurrentSelectionEnd];
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4
{
  uint64_t v4 = a4;
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  LOBYTE(v4) = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", v4, 0, v8, v9);
  [(UIWebDocumentView *)self endSelectionChange];
  return v4;
}

- (void)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", v6, v5, v10, v11);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", v7, v6);
  double v10 = v9;
  double v12 = v11;
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setSelectionWithFirstPoint:secondPoint:", v10, v12, v13, v14);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (id)wordAtPoint:(CGPoint)a3
{
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  WebThreadLock();
  id v8 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)objc_msgSend(v8, "wordAtPoint:", v5, v7);
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "startContainer"), "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", a3, a4, 1);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (id)textInDOMRange:(id)a3
{
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)[v5 stringForRange:a3];
}

- (id)selectionRectsForDOMRange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  id v5 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionRectsForRange:", a3);
  if (![v5 count]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 rect];
        -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
        objc_msgSend(v10, "setRect:");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)selectionRects
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  id v3 = objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "selectionRects");
  if (![v3 count]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 rect];
        -[UIWebDocumentView convertRectFromSelectedFrameCoordinates:](self, "convertRectFromSelectedFrameCoordinates:");
        objc_msgSend(v8, "setRect:");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)smartExtendRangedSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WebThreadLock();
  id v5 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  [v5 smartExtendRangedSelection:v3];
}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "setRangedSelectionWithExtentPoint:", v5, v7);
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setSelectionToEnd
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToEnd");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setSelectionToStart
{
  WebThreadLock();
  [(UIWebDocumentView *)self beginSelectionChange];
  objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToStart");
  [(UIWebDocumentView *)self endSelectionChange];
}

- (void)setAutoscrollContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(UIWebDocumentView *)self formElement];
  if (v5)
  {
    double v6 = v5;
    WebThreadLock();
    [v6 setScrollLeft:(int)x];
    [v6 setScrollTop:(int)y];
  }
}

- (CGPoint)autoscrollContentOffset
{
  id v2 = [(UIWebDocumentView *)self formElement];
  if (v2)
  {
    uint64_t v3 = v2;
    WebThreadLock();
    double v4 = (double)(int)[v3 scrollLeft];
    double v5 = (double)(int)[v3 scrollTop];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v6 = v4;
  result.double y = v5;
  result.double x = v6;
  return result;
}

- (CGRect)contentFrameForView:(id)a3
{
  [(UIWebDocumentView *)self formElement];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (BOOL)shouldAutoscroll
{
  autoscroll = self->_autoscroll;
  if (autoscroll) {
    return ![(UIAutoscroll *)autoscroll disabled];
  }
  else {
    return 1;
  }
}

- (void)setShouldAutoscroll:(BOOL)a3
{
  BOOL v3 = a3;
  autoscroll = self->_autoscroll;
  if (!autoscroll)
  {
    autoscroll = objc_alloc_init(UIAutoscroll);
    self->_autoscroll = autoscroll;
  }
  [(UIAutoscroll *)autoscroll setDisabled:!v3];
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)double v6 = 32.0; {
  else
  }
    double v6 = 8.0;
  if (!self->_autoscroll) {
    self->_autoscroll = objc_alloc_init(UIAutoscroll);
  }
  double v7 = [(UIWebDocumentView *)self formElement];
  if (!v7
    || (textSelectionAssistant = v7, ![(UITextInteractionAssistant *)v7 isTextControl]))
  {
    double v31 = *MEMORY[0x1E4F1DAD8];
    double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      textSelectionAssistant = (UITextInteractionAssistant *)[self->m_parentTextView interactionAssistant];
      id m_parentTextView = self->m_parentTextView;
      [m_parentTextView contentInset];
      double v98 = v32;
      double v34 = v33;
      double v36 = v35;
      if (!m_parentTextView) {
        goto LABEL_67;
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v38 = self->m_parentTextView;
      if (isKindOfClass)
      {
        textSelectionAssistant = (UITextInteractionAssistant *)[self->m_parentTextView interactionAssistant];
        id m_parentTextView = (id)[v38 _scroller];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_67;
        }
        [m_parentTextView contentInset];
        double v98 = v39;
        double v34 = v40;
        double v36 = v41;
        uint64_t v42 = [v38 superview];
        [v38 frame];
        CGRect v45 = (UIWebDocumentView *)v42;
      }
      else
      {
        if (v38)
        {
          textSelectionAssistant = 0;
          goto LABEL_67;
        }
        textSelectionAssistant = self->_textSelectionAssistant;
        id m_parentTextView = [(UIView *)self _scroller];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_67;
        }
        [m_parentTextView contentInset];
        double v98 = v52;
        double v34 = v53;
        double v36 = v54;
        CGRect v45 = self;
        double v43 = v31;
        double v44 = v30;
      }
      -[UIView convertPoint:toView:](v45, "convertPoint:toView:", m_parentTextView, v43, v44);
      double v31 = v55;
      double v30 = v56;
      if (!m_parentTextView) {
        goto LABEL_67;
      }
    }
    [(UIWebDocumentView *)self visibleBounds];
    double v97 = y;
    double v58 = v57;
    double v87 = v36;
    double v60 = v59;
    double v62 = v61;
    double v90 = v30;
    double v64 = v63;
    [(UIView *)self size];
    double v88 = v34;
    double v66 = v65;
    double v96 = v6;
    double v99 = x;
    double v68 = v67;
    [m_parentTextView autoscrollContentOffset];
    double v28 = v69;
    double v93 = v60;
    double v94 = v70;
    double v21 = v58 + v62;
    double v91 = v60 + v64;
    double v92 = -v98;
    [m_parentTextView bounds];
    double v22 = v31 + v66 - (v71 - v87);
    [m_parentTextView bounds];
    double v89 = v90 + v68 - (v72 - v88);
    double v29 = 0.075;
    double v27 = v96;
    double v25 = v97;
    double v18 = v99;
    goto LABEL_37;
  }
  double v95 = v6;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[UITextInteractionAssistant ownerDocument](textSelectionAssistant, "ownerDocument"), "webFrame"), "documentView"), "scale");
  double v10 = v9;
  [(UIWebDocumentView *)self _selectionClipRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v99 = x;
  double v18 = (x - v17) / v10;
  double v19 = (double)(int)[(UITextInteractionAssistant *)textSelectionAssistant scrollWidth];
  int v20 = [(UITextInteractionAssistant *)textSelectionAssistant scrollHeight];
  double v21 = v14 / v10;
  double v22 = v19 - v21;
  int v23 = [(UITextInteractionAssistant *)textSelectionAssistant scrollLeft];
  double v24 = (double)v23;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v97 = y;
    double v25 = (y - v12) / v10;
    double v89 = (double)v20 - v16 / v10;
    double v91 = v16 / v10;
    double v94 = (double)(int)[(UITextInteractionAssistant *)textSelectionAssistant scrollTop];
    double v98 = 0.0;
    id m_parentTextView = self;
    double v92 = 0.0;
    double v93 = 0.0;
    double v27 = v95;
    double v28 = v24;
    double v29 = 0.2;
LABEL_37:
    BOOL v73 = v18 > v21 - v27 && v28 < v22;
    if (v73) {
      int v74 = 2;
    }
    else {
      int v74 = 0;
    }
    if (v28 > 0.0 && v18 < v27) {
      int v76 = 1;
    }
    else {
      int v76 = v74;
    }
    id v77 = [(UIView *)self _scroller];
    double v78 = [(UIView *)self superview];
    [(UIView *)self frame];
    -[UIView convertRect:toView:](v78, "convertRect:toView:", v77);
    double v80 = v79;
    [v77 contentInset];
    BOOL v73 = v80 < v81;
    double v82 = -0.0;
    if (!v73) {
      double v82 = v98;
    }
    double v83 = v27 + v93 + v82;
    BOOL v84 = v94 > v92 && v25 < v83;
    double v51 = v99;
    if (v84)
    {
      int v49 = v76 | 4;
    }
    else if (v25 >= v91 - v27 && v94 < v89)
    {
      int v49 = v76 | 8;
    }
    else
    {
      int v49 = v76;
    }
    double y = v97;
    if (!textSelectionAssistant) {
      goto LABEL_67;
    }
    goto LABEL_63;
  }
  objc_opt_class();
  char v46 = objc_opt_isKindOfClass();
  if (v46) {
    double v47 = 0.075;
  }
  else {
    double v47 = 0.2;
  }
  double v48 = 0.0;
  if (v46) {
    double v48 = 16.0;
  }
  if (v23 < 1 || v18 >= v48)
  {
    if (v18 <= v21 - v48 || v22 <= v24) {
      int v49 = 0;
    }
    else {
      int v49 = 2;
    }
  }
  else
  {
    int v49 = 1;
  }
  id m_parentTextView = self;
  double v51 = v99;
  double v29 = v47;
LABEL_63:
  if (v49)
  {
    autoscroll = self->_autoscroll;
    [(UIAutoscroll *)autoscroll startAutoscroll:textSelectionAssistant scrollContainer:m_parentTextView point:v51 directions:y repeatInterval:v29];
    return;
  }
LABEL_67:
  if (objc_opt_respondsToSelector()) {
    [(UITextInteractionAssistant *)textSelectionAssistant autoscrollWillNotStart];
  }
  [(UIWebDocumentView *)self cancelAutoscroll];
}

- (void)cancelAutoscroll
{
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  id v8 = [(UIWebDocumentView *)self formElement];
  if (v8)
  {
    objc_msgSend(v8, "setSelectionWithPoint:", v5, v7);
  }
  else
  {
    WebThreadLock();
    [(UIWebDocumentView *)self beginSelectionChange];
    objc_msgSend(-[UIWebDocumentView _focusedOrMainFrame](self, "_focusedOrMainFrame"), "moveSelectionToPoint:", v5, v7);
    [(UIWebDocumentView *)self endSelectionChange];
  }
}

- (id)webVisiblePositionForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  WebThreadLock();
  -[UIWebDocumentView convertPointToSelectedFrameCoordinates:](self, "convertPointToSelectedFrameCoordinates:", x, y);
  double v7 = v6;
  double v9 = v8;
  id v10 = [(UIWebDocumentView *)self formElement];
  if (v10)
  {
    objc_msgSend(v10, "constrainedPoint:", v7, v9);
    double v7 = v11;
    double v9 = v12;
  }
  id v13 = [(UIWebDocumentView *)self _focusedOrMainFrame];
  return (id)objc_msgSend(v13, "webVisiblePositionForPoint:", v7, v9);
}

- (CGRect)visibleBounds
{
  [(UIView *)self bounds];
  double x = v3;
  double y = v5;
  double width = v7;
  double height = v9;
  id v11 = [(UIView *)self _scroller];
  if (v11)
  {
    double v12 = v11;
    [v11 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v12 contentInset];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v12, v14 + v24, v16 + v21, v18 - (v24 + v22), v20 - (v21 + v23));
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [(UIView *)self bounds];
    v48.origin.double x = v33;
    v48.origin.double y = v34;
    v48.size.double width = v35;
    v48.size.double height = v36;
    v45.origin.double x = v26;
    v45.origin.double y = v28;
    v45.size.double width = v30;
    v45.size.double height = v32;
    CGRect v46 = CGRectIntersection(v45, v48);
    double x = v46.origin.x;
    double y = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
  }
  if ([(UIWebDocumentView *)self isEditing])
  {
    objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "subtractKeyboardFrameFromRect:inView:", self, x, y, width, height);
    double x = v37;
    double y = v38;
    double width = v39;
    double height = v40;
  }
  double v41 = x;
  double v42 = y;
  double v43 = width;
  double v44 = height;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (id)positionAtStartOrEndOfWord:(id)a3
{
  WebThreadLock();
  if (objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "atBoundaryOfGranularity:inDirection:", 4, 0)) {
    return a3;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionAtStartOrEndOfWord");
  if (!v4) {
    return 0;
  }
  return +[UITextPositionImpl wrapWebVisiblePosition:v4];
}

- (BOOL)isInPrintMode
{
  WebThreadLock();
  double v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", -[WebView mainFrame](self->_webView, "mainFrame"));
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = 0;
    while (1)
    {
      double v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5), "frameView"), "documentView");
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 _isInPrintMode]) {
        break;
      }
      objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5++), "childFrames"));
      if (v5 >= [v3 count])
      {
        LOBYTE(v4) = 0;
        return v4;
      }
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (id)_beginPrintModeForHTMLView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a4.height;
  double width = a4.width;
  double v16 = (a4.height - a5) * (a6 / a4.width);
  [(UIWebDocumentView *)self setTilingArea:2];
  if ([a3 _beginPrintModeWithMinimumPageWidth:a6 height:v16 maximumPageWidth:a7])
  {
    double v32 = v16;
    ++self->_printModeCount;
    [a3 bounds];
    double v18 = v17;
    double v20 = v19;
    if (v17 >= a7) {
      double v21 = a7;
    }
    else {
      double v21 = v17;
    }
    double v22 = width / v21;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v24 = floor(-a5 / v22);
    if (v24 < v20)
    {
      double v25 = floor(width / v22);
      double v26 = floor(height / v22);
      do
      {
        [a3 _adjustedBottomOfPageWithTop:v24 bottom:v26 + v24 limit:v24];
        double v28 = 0.0;
        if (v24 >= 0.0) {
          double v29 = v24;
        }
        else {
          double v29 = 0.0;
        }
        if (v27 <= v20) {
          double v24 = v27;
        }
        else {
          double v24 = v20;
        }
        do
        {
          objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v28, v29, v25, v24 - v29));
          if (!v8) {
            break;
          }
          double v28 = v25 + v28;
        }
        while (v28 < v18);
      }
      while (v24 < v20);
    }
    CGFloat v30 = -[UIWebPaginationInfo initWithDocumentView:scaleFactor:layoutSize:pageRects:]([UIWebPaginationInfo alloc], "initWithDocumentView:scaleFactor:layoutSize:pageRects:", a3, v23, v22, v18, v32 / v22);
    [(UIWebPaginationInfo *)v30 setWebDocumentView:self];

    return v30;
  }
  else
  {
    [(UIWebDocumentView *)self setTilingArea:0];
    return 0;
  }
}

- (id)_beginPrintModeForPDFView:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7
{
  double height = a4.height;
  double width = a4.width;
  unsigned int v14 = [a3 totalPages];
  unsigned int v15 = v14;
  if (v14)
  {
    uint64_t v16 = 0;
    uint64_t v17 = v14;
    do
    {
      [a3 rectForPageNumber:++v16];
      if (a6 < v18) {
        a6 = v18;
      }
    }
    while (v17 != v16);
  }
  if (a6 >= a7) {
    double v19 = a7;
  }
  else {
    double v19 = a6;
  }
  double v20 = width / v19;
  double v21 = floor(height / (width / v19));
  if (v21 == 0.0) {
    return 0;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [a3 rectForPageNumber:1];
  if (v15)
  {
    double v24 = v23;
    unsigned int v25 = 0;
    double v26 = floor(-a5 / v20);
    double v27 = floor(width / v20);
    double v28 = 0.0;
    do
    {
      double v29 = v28;
      double v28 = v21 + v26;
      if (v24 > v21)
      {
LABEL_16:
        double v24 = v24 - (v28 - v29);
      }
      else
      {
        while (1)
        {
          double v30 = v29 + v24;
          if (v29 + v24 > v28)
          {
            double v28 = v29;
            goto LABEL_19;
          }
          if (v25 + 1 >= v15) {
            break;
          }
          [a3 rectForPageNumber:v25 + 2];
          double v24 = v31;
          ++v25;
          double v29 = v30;
          if (v31 > v21) {
            goto LABEL_16;
          }
        }
        ++v25;
        double v28 = v29 + v24;
      }
LABEL_19:
      if (v26 >= 0.0) {
        double v32 = v26;
      }
      else {
        double v32 = 0.0;
      }
      objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, v32, v27, v28 - v32));
      double v26 = v28;
    }
    while (v25 < v15);
  }
  else
  {
    double v27 = floor(width / v20);
  }
  CGFloat v34 = -[UIWebPaginationInfo initWithDocumentView:scaleFactor:layoutSize:pageRects:]([UIWebPaginationInfo alloc], "initWithDocumentView:scaleFactor:layoutSize:pageRects:", a3, v22, v20, v27, v21);
  [(UIWebPaginationInfo *)v34 setWebDocumentView:self];

  return v34;
}

- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 forFrame:(id)a7
{
  return [(UIWebDocumentView *)self beginPrintModeWithWidth:a6 height:0 startOffset:a7 shrinkToFit:a3 tileClippedContent:a4 forFrame:a5];
}

- (id)beginPrintModeWithWidth:(double)a3 height:(double)a4 startOffset:(double)a5 shrinkToFit:(BOOL)a6 tileClippedContent:(BOOL)a7 forFrame:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  if (!a8) {
    a8 = [(WebView *)self->_webView mainFrame];
  }
  return [(UIWebDocumentView *)self beginPrintModeForFrame:a8 withWidth:v9 height:v8 startOffset:a3 shrinkToFit:a4 tileClippedContent:a5];
}

- (id)beginPrintModeForFrame:(id)a3 withWidth:(double)a4 height:(double)a5 startOffset:(double)a6 shrinkToFit:(BOOL)a7 tileClippedContent:(BOOL)a8
{
  BOOL v8 = a8;
  if ((WebView *)[a3 webView] != self->_webView) {
    return 0;
  }
  if (a7)
  {
    double v16 = *MEMORY[0x1E4FB6EC0] * a4;
    WebThreadLock();
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v18 = *MEMORY[0x1E4FB6EC8] * a4;
      return -[UIWebDocumentView _beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "_beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", v17, v8, a4, a5, a6, v18, v16);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      return -[UIWebDocumentView _beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:](self, "_beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:", v17, a4, a5, a6, a4, v16);
    }
  }
  else
  {
    return -[UIWebDocumentView beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", a3, v8, a4, a5, a6, a4, a4);
  }
}

- (id)beginPrintModeWithSize:(CGSize)a3 startOffset:(double)a4 minimumLayoutWidth:(double)a5 maximumLayoutWidth:(double)a6 tileClippedContent:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.height;
  double width = a3.width;
  unsigned int v14 = [(WebView *)self->_webView mainFrame];
  return -[UIWebDocumentView beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "beginPrintModeForFrame:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", v14, v7, width, height, a4, a5, a6);
}

- (id)beginPrintModeForFrame:(id)a3 withSize:(CGSize)a4 startOffset:(double)a5 minimumLayoutWidth:(double)a6 maximumLayoutWidth:(double)a7 tileClippedContent:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a4.height;
  double width = a4.width;
  double v16 = (WebView *)[a3 webView];
  BOOL v17 = a6 > 0.0 && v16 == self->_webView;
  if (!v17 || width <= 0.0) {
    return 0;
  }
  if (a7 < a6) {
    a7 = a6;
  }
  WebThreadLock();
  uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "frameView"), "documentView");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return -[UIWebDocumentView _beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:](self, "_beginPrintModeForHTMLView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:tileClippedContent:", v18, v8, width, height, a5, a6, a7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return -[UIWebDocumentView _beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:](self, "_beginPrintModeForPDFView:withSize:startOffset:minimumLayoutWidth:maximumLayoutWidth:", v18, width, height, a5, a6, a7);
}

- (void)releasePrintMode
{
  unsigned int printModeCount = self->_printModeCount;
  if (!printModeCount || (unsigned int v3 = printModeCount - 1, (self->_printModeCount = v3) == 0)) {
    [(UIWebDocumentView *)self _endPrintMode];
  }
}

- (void)endPrintMode
{
  self->_unsigned int printModeCount = 0;
  [(UIWebDocumentView *)self _endPrintMode];
}

- (void)_endPrintMode
{
  WebThreadLock();
  unsigned int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", -[WebView mainFrame](self->_webView, "mainFrame"));
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = (void *)[v3 objectAtIndex:v4];
      double v6 = objc_msgSend((id)objc_msgSend(v5, "frameView"), "documentView");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v6 _isInPrintMode])
        {
          [(UIWebDocumentView *)self setTilingArea:0];
          [v6 _endPrintMode];
        }
      }
      objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v5, "childFrames"));
      ++v4;
    }
    while (v4 < [v3 count]);
  }
}

- (void)_drawPDFPagesForPage:(unint64_t)a3 withPaginationInfo:(id)a4
{
  double v6 = (void *)[a4 documentView];
  BOOL v7 = (CGPDFDocument *)[v6 doc];
  if (CGPDFDocumentAllowsPrinting(v7))
  {
    BOOL v8 = (void *)[a4 pageRects];
    if ([v8 count] > a3)
    {
      ContextStacuint64_t k = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        id v10 = 0;
      }
      else {
        id v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      CGContextSaveGState(v10);
      [a4 scaleFactor];
      CGContextScaleCTM(v10, v11, v11);
      objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", a3), "rectValue");
      CGFloat v13 = v12;
      double v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      uint64_t v20 = [v6 totalPages];
      if (v20)
      {
        size_t v21 = 0;
        double v22 = 0.0;
        double v36 = v19;
        double v37 = v13;
        do
        {
          v39.origin.double x = v13;
          v39.origin.double y = v15;
          v39.size.double width = v17;
          v39.size.double height = v19;
          if (v22 >= CGRectGetMaxY(v39)) {
            break;
          }
          [v6 rectForPageNumber:++v21];
          CGFloat v23 = v19;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          v40.origin.double x = v13;
          double v32 = v22 + v30;
          v40.size.double width = v17;
          v40.origin.double y = v15;
          v40.size.double height = v23;
          if (v32 > CGRectGetMinY(v40))
          {
            Page = CGPDFDocumentGetPage(v7, v21);
            CGContextSaveGState(v10);
            CGContextScaleCTM(v10, 1.0, -1.0);
            v41.origin.double x = v25;
            v41.origin.double y = v27;
            v41.size.double width = v29;
            v41.size.double height = v31;
            CGFloat Height = CGRectGetHeight(v41);
            CGContextTranslateCTM(v10, 0.0, v15 - v22 - Height);
            v42.origin.double x = v25;
            v42.origin.double y = v27;
            v42.size.double width = v29;
            v42.size.double height = v31;
            CGFloat Width = CGRectGetWidth(v42);
            v43.origin.double x = v25;
            v43.origin.double y = v27;
            v43.size.double width = v29;
            v43.size.double height = v31;
            v44.size.double height = CGRectGetHeight(v43);
            v44.origin.double x = 0.0;
            v44.origin.double y = 0.0;
            v44.size.double width = Width;
            CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v44, 0, 1);
            CGContextConcatCTM(v10, &transform);
            CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
            CGContextClipToRect(v10, BoxRect);
            CGContextDrawPDFPage(v10, Page);
            CGContextRestoreGState(v10);
          }
          double v22 = v32;
          CGFloat v19 = v36;
          CGFloat v13 = v37;
        }
        while (v20 != v21);
      }
      CGContextRestoreGState(v10);
    }
  }
}

- (void)drawPage:(unint64_t)a3 withPaginationInfo:(id)a4
{
  WebThreadLock();
  BOOL v7 = (void *)[a4 documentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 _isInPrintMode])
    {
      BOOL v8 = (void *)[a4 pageRects];
      if ([v8 count] > a3)
      {
        [a4 layoutSize];
        double v10 = v9;
        double v12 = v11;
        [v7 bounds];
        if (v13 != v10) {
          [v7 _beginPrintModeWithMinimumPageWidth:v10 height:v12 maximumPageWidth:v10];
        }
        ContextStacuint64_t k = GetContextStack(0);
        if (*(int *)ContextStack < 1) {
          double v15 = 0;
        }
        else {
          double v15 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        }
        CGContextSaveGState(v15);
        [a4 scaleFactor];
        CGContextScaleCTM(v15, v16, v16);
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", a3), "rectValue");
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        CGContextTranslateCTM(v15, -v17, -v19);
        [(WebView *)self->_webView viewWillDraw];
        objc_msgSend(v7, "displayRectIgnoringOpacity:inContext:", v15, v18, v20, v22, v24);
        CGContextRestoreGState(v15);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UIWebDocumentView *)self _drawPDFPagesForPage:a3 withPaginationInfo:a4];
    }
  }
}

@end