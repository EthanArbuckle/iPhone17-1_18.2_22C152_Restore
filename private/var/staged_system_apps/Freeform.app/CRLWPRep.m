@interface CRLWPRep
+ (id)focusedHighlightColorForDarkMode:(BOOL)a3;
+ (id)unfocusedHighlightColorForDarkMode:(BOOL)a3;
+ (void)initialize;
- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtCharIndex:(SEL)a3;
- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtPoint:(SEL)a3;
- ($1C7B61A4053D036F47119D3E279950B5)p_lineMetricsAtPoint:(SEL)a3 allowNotFound:(CGPoint)a4;
- ($C5ACE5DF23171BCD39C0E4E0C96DCEA5)wordMetricsAtCharIndex:(SEL)a3;
- (BOOL)allowGenericDrags;
- (BOOL)canEditWithEditor:(id)a3;
- (BOOL)caretBlinks;
- (BOOL)caretIsHidden;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)containsStartOfSelection:(id)a3;
- (BOOL)didPointHitSelectionEnd:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)doesNeedDisplayOnEditingDidEnd;
- (BOOL)dragAndDropCaretLayerIsForCaret;
- (BOOL)dragOperationInProgress;
- (BOOL)findIsShowing;
- (BOOL)ghostCaretAppearance;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)hasOverflowed;
- (BOOL)isBeingEdited;
- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5;
- (BOOL)isDropTarget;
- (BOOL)isOverflowing;
- (BOOL)isPointInSelectedArea:(CGPoint)a3;
- (BOOL)isSelectionHighlightSuppressed;
- (BOOL)isShowingCaret;
- (BOOL)p_allowCaretForSelection:(id)a3;
- (BOOL)p_automaticTextSubstitutionEnabled;
- (BOOL)p_canRepBeginEditingOnDoubleTap;
- (BOOL)p_canShowSelectionAndCaretLayers;
- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5;
- (BOOL)p_doesRepIntersectSearchReference:(id)a3;
- (BOOL)p_isRedesignedTextCursorEnabled;
- (BOOL)p_needsSpellChecker;
- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5;
- (BOOL)p_shouldDisplaySelectionControls;
- (BOOL)p_spellCheckingEnabled;
- (BOOL)p_storageMatchesSelectionPath:(id)a3;
- (BOOL)scribbleElementIsFocused;
- (BOOL)scribbleExceedsVerticalDistanceForNearestCharIndex:(unint64_t)a3 boundsPoint:(CGPoint)a4 isAtEndOfLine:(BOOL)a5;
- (BOOL)selectionChangeWasLocal;
- (BOOL)shouldAddCollaboratorLayerToOverlays;
- (BOOL)shouldCreateLockedKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldCreateTextKnobs;
- (BOOL)shouldDelayScribbleFocus;
- (BOOL)shouldIgnoreFirstRequestToShowEditMenu;
- (BOOL)shouldLayoutTilingLayer:(id)a3;
- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4;
- (BOOL)shouldShowCollaboratorCursorHighlight;
- (BOOL)shouldShowEditMenu;
- (BOOL)shouldShowKnobs;
- (BOOL)suppressSelectionControls;
- (BOOL)textIsVertical;
- (BOOL)useKeyboardWhenEditing;
- (BOOL)usesStandardHighlightColorForReplaceSelections;
- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren;
- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3;
- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CALayer)dragAndDropTopicLayer;
- (CAShapeLayer)dragAndDropCaretLayer;
- (CAShapeLayer)floatingCaretLayer;
- (CGAffineTransform)transformToConvertNaturalToScaledRoot;
- (CGColor)p_caretLayerColor;
- (CGColor)p_highlightLineColor;
- (CGPath)newPathForSearchReference:(id)a3;
- (CGPath)newPathForSelection:(id)a3;
- (CGPath)p_newPathForSelection:(id)a3 withTransform:(CGAffineTransform *)a4 withInset:(double)a5;
- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6;
- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6 markedText:(BOOL)a7;
- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4;
- (CGPoint)p_applyLineSnappingToFloatingCaret:(id)a3 atPoint:(CGPoint)a4 withRect:(CGRect)a5;
- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4;
- (CGPoint)pinToClosestColumn:(CGPoint)a3;
- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4;
- (CGRect)boundsForCollaboratorCursorRenderable;
- (CGRect)caretRect;
- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(unint64_t)a4;
- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(unint64_t)a5;
- (CGRect)caretRectForSelection:(id)a3;
- (CGRect)clipRect;
- (CGRect)columnRectForRange:(_NSRange)a3;
- (CGRect)getCurrentTextFieldBounds;
- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4;
- (CGRect)labelRectForCharIndex:(unint64_t)a3;
- (CGRect)newTextLayerUnscaledBounds:(CGRect)a3 forNewTextBounds:(CGRect)a4;
- (CGRect)p_caretRectForSelection:(id)a3;
- (CGRect)p_clipRect:(CGRect)a3;
- (CGRect)p_closestCaretRectForCharacterAtPoint:(CGPoint)a3;
- (CGRect)p_closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4 allowPastBreak:(BOOL)a5;
- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4;
- (CGRect)p_convertRectIntoZoomCoordinates:(CGRect)a3;
- (CGRect)p_topicDragRectForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4 includePaginatedAttachments:(BOOL)a5;
- (CGRect)rectToClipChildRepRenderables;
- (CGRect)scaledScribbleEditingFrame;
- (CGRect)selectionRect;
- (CGSize)hitTestingSlop;
- (CRLColor)backgroundColor;
- (CRLColor)overrideCaretColor;
- (CRLContainerInfo)containerInfo;
- (CRLNoDefaultImplicitActionLayer)dragAndDropTopicIndentLayer;
- (CRLWPDragAndDropHelper)dragAndDropHelper;
- (CRLWPLayoutTarget)layout;
- (CRLWPRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLWPSearchReference)primaryFindResultSearchReference;
- (CRLWPSelection)dropSelection;
- (CRLWPSelection)lastSelection;
- (CRLWPSelection)selection;
- (CRLWPStorageSpellChecker)spellChecker;
- (Class)layerClass;
- (Class)wpEditorClass;
- (NSArray)columns;
- (NSArray)hyperlinkRegions;
- (NSArray)scribbleCapableElements;
- (NSArray)searchReferences;
- (NSUUID)scribbleIdentifier;
- (_NSRange)dragRange;
- (_NSRange)range;
- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3;
- (_TtC8Freeform11CRLWPEditor)textEditor;
- (_TtC8Freeform12CRLWPStorage)storage;
- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation;
- (double)collaborativeCursorOpacityForCaret:(BOOL)a3;
- (double)ibeamLength;
- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4;
- (double)p_maximumBeamLength;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)backgroundColorForDragPreviewOfSelection:(id)a3;
- (id)closestColumnForPoint:(CGPoint)a3;
- (id)collaboratorCursorRenderable;
- (id)colorBehindLayer:(id)a3;
- (id)columnForCharIndex:(unint64_t)a3;
- (id)contextMenuConfigurationAtPoint:(CGPoint)a3;
- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4;
- (id)currentCollaboratorCursorColor;
- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5;
- (id)cursorForPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4;
- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3;
- (id)dragItemsForBeginningDragOfChildRep:(id)a3;
- (id)hyperlinkContainerRep;
- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5;
- (id)knobClassWithTag:(unint64_t)a3;
- (id)knobPositioner;
- (id)lineSearchReferencesForSearchReference:(id)a3;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayRenderables;
- (id)p_caretLayerWithZPosition:(double)a3;
- (id)p_dragItemsForBeginningDragWithSelection:(id)a3 inlineRepBeingDragged:(id)a4;
- (id)p_hyperlinkAtPoint:(CGPoint)a3;
- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 prepareBackground:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 forCaret:(BOOL)a8 drawSelection:(id)a9 suppressInvisibles:(BOOL)a10 suppressChildReps:(BOOL)a11;
- (id)p_imageForZeroLengthPath:(CGPath *)a3;
- (id)p_lineSelectionsForSelection:(id)a3;
- (id)p_selectionPathIncludingInfo:(id)a3 excludingInfo:(id)a4;
- (id)p_styleProvider;
- (id)p_textEditorForStorage:(id)a3;
- (id)p_textEditorForTextStorage:(id)a3;
- (id)prepareForScribbleBlock;
- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4;
- (id)repForDragging;
- (id)scribbleEditingBlock;
- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3;
- (id)siblings;
- (id)smartFieldAtPoint:(CGPoint)a3;
- (id)textBackgroundLayer;
- (id)textEditorForDropIntoStorage:(id)a3;
- (id)textImageForRect:(CGRect)a3;
- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7 suppressChildReps:(BOOL)a8 drawBackground:(BOOL)a9 inset:(double)a10;
- (id)textLayer;
- (id)willBeginWritingBlock;
- (int64_t)tilingMode;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3;
- (unint64_t)pulseAnimationStyle:(id)a3;
- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)addKnobsToArray:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)beginEditing;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3 animate:(BOOL)a4;
- (void)clearSecondaryHighlight;
- (void)collaboratorCursorChangedToSelectionPath:(id)a3;
- (void)dealloc;
- (void)didBeginEditingWithTextEditor:(id)a3;
- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4;
- (void)didEnterBackground;
- (void)didUpdateRenderable:(id)a3;
- (void)disableCaretAnimation;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5;
- (void)editingDidEndWithTextEditor:(id)a3;
- (void)enableCaretAnimation;
- (void)endFloatingCursorWithRepForAnimation:(id)a3;
- (void)gesturesDidEnd:(id)a3;
- (void)handleFadeInForZoom;
- (void)handleFadeOutForZoom;
- (void)hideCaretLayer;
- (void)hideCollaboratorCursors;
- (void)hideDragAndDropUI;
- (void)i_primaryFindResultChanged:(id)a3;
- (void)i_setNeedsDisplayForSelectionChange;
- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3;
- (void)i_setSearchReferencesToHighlight:(id)a3;
- (void)i_spellCheckerWordsDidChange;
- (void)i_textInputResponderDidBecomeFirstResponder;
- (void)i_textInputResponderDidResignFirstResponder;
- (void)invalidateCollaboratorCursorRenderable;
- (void)p_addDropAnimationToFloatingCursorWithEndingRep:(id)a3;
- (void)p_addLiftAnimationToFloatingCursor;
- (void)p_clearICCPrimaryFindResultSearchReference;
- (void)p_createLayer:(int64_t)a3;
- (void)p_createMarkHighlightLayer;
- (void)p_createSelectionHighlightLayer;
- (void)p_createSelectionLineLayers;
- (void)p_createSelectionParagraphBorderLayer;
- (void)p_createSpellChecker;
- (void)p_destroyLayer:(int64_t)a3;
- (void)p_destroySpellChecker;
- (void)p_drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5;
- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3;
- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(unint64_t)a7 suppressInvisibles:(BOOL)a8;
- (void)p_drawTextLayerInContext:(CGContext *)a3;
- (void)p_hideCollaboratorCursorLayer;
- (void)p_hideMarkHighlightLayer;
- (void)p_hideSelectionHighlightLayer;
- (void)p_hideSelectionLayers;
- (void)p_hideSelectionParagraphBorderLayer;
- (void)p_invalidateSuppressedMisspellingRange;
- (void)p_positionAndSizeFloatingCaret:(id)a3 atPoint:(CGPoint)a4;
- (void)p_registerNotifications;
- (void)p_selectionChangedNotification:(id)a3;
- (void)p_setPrimaryFindResultSearchReference:(id)a3;
- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4;
- (void)p_setSelectionHighlightColor;
- (void)p_setSelectionLineLayersHidden:(BOOL)a3;
- (void)p_setSuppressedMisspellingRange:(_NSRange)a3;
- (void)p_showCollaboratorCursorLayer;
- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3;
- (void)p_spellcheckFinished:(id)a3;
- (void)p_teardown;
- (void)p_unregisterNotifications;
- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3;
- (void)p_updateCaretLayerColor;
- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3;
- (void)p_updateHighlights;
- (void)p_updateLayersForInsertionPointSelection:(id)a3;
- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4;
- (void)p_updateMarkHighlightLayer;
- (void)p_updateSecondaryHighlightLayer;
- (void)p_updateSuppressedSpellingRange;
- (void)p_validateWithLayoutController;
- (void)p_withCollaboratorCursorPerformBlock:(id)a3;
- (void)performBlockOnTextLayers:(id)a3;
- (void)prepareLayoutForImagingSearchReferencesAsActive:(BOOL)a3 usingBlock:(id)a4;
- (void)processChangedProperty:(unint64_t)a3;
- (void)pulseAnimationDidStop:(id)a3;
- (void)pulseAnimationDidStopForPulse:(id)a3;
- (void)pulseCaret;
- (void)recursivelyDrawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5;
- (void)refreshEditMenu;
- (void)screenScaleDidChange;
- (void)scribbleSetSelectionForBeginEditingWithBoundsPoint:(CGPoint)a3 tappedInRep:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setCaretBlinks:(BOOL)a3;
- (void)setDragAndDropCaretLayer:(id)a3;
- (void)setDragAndDropCaretLayerIsForCaret:(BOOL)a3;
- (void)setDragAndDropTopicIndentLayer:(id)a3;
- (void)setDragAndDropTopicLayer:(id)a3;
- (void)setDragOperationInProgress:(BOOL)a3;
- (void)setDragRange:(_NSRange)a3;
- (void)setDropSelection:(id)a3;
- (void)setFindIsShowing:(BOOL)a3;
- (void)setFloatingCaretLayer:(id)a3;
- (void)setGhostCaretAppearance:(BOOL)a3;
- (void)setHasOverflowed:(BOOL)a3;
- (void)setHighlightedHyperlinkField:(id)a3;
- (void)setIbeamLength:(double)a3;
- (void)setLastSelection:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRange:(_NSRange)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setOverrideCaretColor:(id)a3;
- (void)setParentRep:(id)a3;
- (void)setPrimaryFindResultSearchReference:(id)a3;
- (void)setSearchReferences:(id)a3;
- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5;
- (void)setShouldIgnoreFirstRequestToShowEditMenu:(BOOL)a3;
- (void)setSuppressSelectionControls:(BOOL)a3;
- (void)setSuppressSelectionHighlight:(BOOL)a3;
- (void)setUseKeyboardWhenEditing:(BOOL)a3;
- (void)setUsesStandardHighlightColorForReplaceSelections:(BOOL)a3;
- (void)showCaretLayerStartingAnimation;
- (void)spellCheckingStateChanged;
- (void)suppressCaret:(BOOL)a3;
- (void)textInteractionCaretBeganFloating;
- (void)textInteractionCaretDragStopped;
- (void)textInteractionCaretEndedFloating;
- (void)updateCaretColorForFinishedFloatingCursor;
- (void)updateCaretColorForFloatingCursorInFlight;
- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFromLayout;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)updateUniversalAccessZoomWindow;
- (void)updateVisualSelection:(id)a3;
- (void)verticalTextPropertyChanged;
- (void)willBeRemoved;
- (void)willEnterForeground;
@end

@implementation CRLWPRep

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = [(CRLWPRep *)self dragAndDropHelper];
  id v9 = [v8 dragOperationForDragInfo:v7 atUnscaledPoint:x, y];

  return (unint64_t)v9;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  v10 = [(CRLWPRep *)self dragAndDropHelper];
  LOBYTE(a3) = [v10 handleDragOperation:a3 withDragInfo:v9 atUnscaledPoint:x, y];

  return a3;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CRLWPRep *)self dragAndDropHelper];
  [v8 adjustedUnscaledPoint:x, y];
  double v10 = v9;
  double v12 = v11;

  v62.receiver = self;
  v62.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep updateDragAndDropUIForPoint:dragInfo:](&v62, "updateDragAndDropUIForPoint:dragInfo:", v7, v10, v12);
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
  double v14 = v13;
  double v16 = v15;
  [(CRLWPRep *)self hideCaretLayer];
  v17 = [(CRLWPRep *)self dragAndDropHelper];
  v18 = [v17 sourceSelectionPathForDragInfo:v7];

  v19 = [(CRLCanvasRep *)self interactiveCanvasController];
  v20 = [v19 modelsForSelectionPath:v18];

  v21 = [v20 objectsPassingTest:&stru_1014E6468];
  uint64_t v22 = objc_opt_class();
  v23 = [v21 crl_onlyObject];
  v24 = sub_1002469D0(v22, v23);

  v25 = [v24 textStorage];
  if (v25)
  {
    if (![v20 count])
    {
      v60 = v18;
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6488);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101092354();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E64A8);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v26);
      }
      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep(DragAdditions) updateDragAndDropUIForPoint:dragInfo:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep+DragAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 243, 0, "If %s found model objects, one should be a storage.", "-[CRLWPRep(DragAdditions) updateDragAndDropUIForPoint:dragInfo:]");

      v18 = v60;
    }
    id v29 = [v25 changeCount];
    v30 = [(CRLWPRep *)self dragAndDropHelper];
    id v31 = [v30 sourceChangeCountForDragInfo:v7];

    if (v29 != v31)
    {

      v25 = 0;
    }
  }
  v32 = [(CRLWPRep *)self storage];
  v33 = [(CRLWPRep *)self dragAndDropHelper];
  [v33 setDragIsStorageLocal:v25 == v32];

  v34 = [(CRLWPRep *)self dragAndDropHelper];
  unsigned int v35 = [v34 dragIsStorageLocal];

  if (v35)
  {
    v36 = [(CRLWPRep *)self dragAndDropHelper];
    v37 = [v36 sourceSelectionForDragInfo:v7];

    if (v37
      && -[CRLWPRep isDragPoint:inSelection:includeEndpoints:](self, "isDragPoint:inSelection:includeEndpoints:", v37, 0, v14, v16))
    {
      v38 = [(CRLWPRep *)self dragAndDropHelper];
      id v39 = [v38 dragIsStorageLocal];
    }
    else
    {
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
    v37 = 0;
  }
  v40 = [(CRLWPRep *)self dragAndDropCaretLayer];
  [v40 setHidden:v39];

  if (v39)
  {
    [(CRLWPRep *)self hideDragAndDropUI];
  }
  else
  {
    [(CRLWPRep *)self setDragOperationInProgress:1];
    v41 = [(CRLWPRep *)self dragAndDropHelper];
    [v41 dragAndDropNaturalPoint];
    double v43 = v42;
    double v45 = v44;

    if (v43 != v14 || v45 != v16)
    {
      v46 = [(CRLWPRep *)self dragAndDropHelper];
      [v46 setDragAndDropNaturalPoint:v14, v16];

      v47 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v47 invalidateOverlayLayersForRep:self];
    }
  }
  v48 = [(CRLWPRep *)self dragAndDropHelper];
  unsigned int v49 = [v48 dragIsStorageLocal];

  if (v49)
  {
    id v61 = [v37 range];
    uint64_t v51 = v50;
    [(id)objc_opt_class() unfocusedHighlightColorForDarkMode:0];
    v52 = v37;
    v53 = v25;
    id v54 = v7;
    v55 = v20;
    v56 = v24;
    v57 = v21;
    v59 = v58 = v18;
    -[CRLWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v61, v51, [v59 CGColor], 0);

    v18 = v58;
    v21 = v57;
    v24 = v56;
    v20 = v55;
    id v7 = v54;
    v25 = v53;
    v37 = v52;
  }
}

- (void)hideDragAndDropUI
{
  [(CRLWPRep *)self setDragOperationInProgress:0];
  [(CRLWPRep *)self clearSecondaryHighlight];
  v3 = [(CRLWPRep *)self dragAndDropHelper];
  [v3 setDragAndDropNaturalPoint:NAN, NAN];

  v4 = [(CRLWPRep *)self dragAndDropCaretLayer];
  [v4 setDelegate:0];

  [(CRLWPRep *)self setDragAndDropCaretLayer:0];
  v5 = [(CRLWPRep *)self dragAndDropTopicLayer];
  [v5 setDelegate:0];

  [(CRLWPRep *)self setDragAndDropTopicLayer:0];
  [(CRLWPRep *)self setDragAndDropTopicIndentLayer:0];
  v6.receiver = self;
  v6.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v6 hideDragAndDropUI];
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v6 = [(CRLWPRep *)self textEditor];

  if (v6)
  {
    id v7 = [(CRLWPRep *)self selection];
    if ([v7 isRange])
    {
      unsigned int v8 = -[CRLWPRep isPointInSelectedArea:](self, "isPointInSelectedArea:", x, y);

      if (v8)
      {
        double v9 = [_TtC8Freeform23CRLWPEditMenuController alloc];
        double v10 = [(CRLCanvasRep *)self interactiveCanvasController];
        double v11 = [(CRLWPEditMenuController *)v9 initWithICC:v10];
        [(CRLWPEditMenuController *)v11 hide];

        double v12 = [(CRLWPRep *)self selection];
        double v13 = [(CRLWPRep *)self p_dragItemsForBeginningDragWithSelection:v12 inlineRepBeingDragged:0];

        goto LABEL_8;
      }
    }
    else
    {
    }
    double v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLWPRep;
    double v13 = -[CRLCanvasRep dragItemsForBeginningDragAtPoint:](&v15, "dragItemsForBeginningDragAtPoint:", x, y);
  }
LABEL_8:

  return v13;
}

- (id)p_dragItemsForBeginningDragWithSelection:(id)a3 inlineRepBeingDragged:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v7 = objc_alloc_init(CRLItemProviderItemWriter);
  double v14 = sub_100246AC8(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLWPIngestibleItemWriting);

  objc_super v15 = [(CRLWPRep *)self storage];
  double v16 = [(CRLWPRep *)self p_textEditorForStorage:v15];

  v71 = v16;
  v17 = [v16 editorHelper];
  id v18 = [v17 hasWhitespaceBoundedWordAtSelection:v5];

  v19 = [(CRLWPRep *)self storage];
  v20 = [v6 canvasEditor];
  v21 = [v20 pasteboardController];
  uint64_t v22 = [v14 itemProviderWithStorage:v19 selection:v5 boardItems:&__NSArray0__struct styleProvider:0 inIsSmart:v18 pasteboardController:v21];

  if (v22)
  {
    v67 = (void *)v22;
    v70 = v14;
    v23 = [v6 selectionModelTranslator];
    v24 = [(CRLWPRep *)self storage];
    uint64_t v25 = [v23 selectionPathForSelection:v5 onStorage:v24];

    v26 = [v6 editorController];
    uint64_t v27 = [v26 selectionPath];
    v28 = [CRLWPiOSTextDraggingContext alloc];
    id v29 = [(CRLWPRep *)self storage];
    v66 = v26;
    v68 = (void *)v27;
    v69 = (void *)v25;
    v30 = -[CRLWPiOSTextDraggingContext initWithEditorController:sourceSelectionPath:changeCount:reverseSelectionPath:](v28, "initWithEditorController:sourceSelectionPath:changeCount:reverseSelectionPath:", v26, v25, [v29 changeCount], v27);

    CGSize size = CGRectNull.size;
    CGPoint origin = CGRectNull.origin;
    CGSize v79 = size;
    v32 = [(CRLCanvasRep *)self canvas];
    [v32 viewScale];
    double v34 = -12.0 / v33;

    LOBYTE(v65) = 1;
    unsigned int v35 = [(CRLWPRep *)self textImageForSelection:v5 frame:&origin usingGlyphRect:1 shouldPulsate:0 suppressInvisibles:1 suppressChildReps:0 drawBackground:v34 inset:v65];
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", origin, v79);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v44 = [(CRLWPRep *)self backgroundColorForDragPreviewOfSelection:v5];
    id v45 = objc_alloc_init((Class)UIView);
    v83.origin.double x = CGRectNull.origin.x;
    v83.origin.double y = CGRectNull.origin.y;
    v83.size.width = CGRectNull.size.width;
    v83.size.height = CGRectNull.size.height;
    v82.origin.double x = v37;
    v82.origin.double y = v39;
    v82.size.width = v41;
    v82.size.height = v43;
    if (CGRectEqualToRect(v82, v83))
    {
      v46 = 0;
    }
    else
    {
      [v6 convertUnscaledToBoundsRect:v37, v39, v41, v43];
      [v45 setFrame:];
      id v54 = [(CRLCanvasRep *)self canvas];
      [v54 viewScale];

      v46 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", sub_100064070());
    }
    id v55 = [v35 CGImage];
    v56 = [v45 layer];
    [v56 setContents:v55];

    v57 = [v45 layer];
    LODWORD(v58) = 1062836634;
    [v57 setOpacity:v58];

    v59 = [CRLiOSCanvasDragItem alloc];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10026BE18;
    v72[3] = &unk_1014E6510;
    id v73 = v46;
    v74 = v44;
    v75 = v6;
    id v76 = v45;
    v60 = v30;
    v77 = v30;
    id v61 = v45;
    id v62 = v46;
    v53 = v67;
    v63 = [(CRLiOSCanvasDragItem *)v59 initWithItemProvider:v67 previewGeneratingBlock:v72];
    [(CRLiOSCanvasDragItem *)v63 setAllowsMoveOperation:1];
    [(CRLiOSCanvasDragItem *)v63 setSourceObject:v71];
    v80 = v63;
    v52 = +[NSArray arrayWithObjects:&v80 count:1];

    v47 = v71;
    uint64_t v51 = v69;
    double v14 = v70;
    uint64_t v50 = v66;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E64C8);
    }
    v47 = v71;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092400();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E64E8);
    }
    v48 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v48);
    }
    uint64_t v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep(DragAdditions) p_dragItemsForBeginningDragWithSelection:inlineRepBeingDragged:]");
    uint64_t v50 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep+DragAdditions.m"];
    uint64_t v51 = (void *)v49;
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 395, 0, "invalid nil value for '%{public}s'", "itemProvider");
    v52 = 0;
    v53 = 0;
  }

  return v52;
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  return 0;
}

- (id)p_styleProvider
{
  v2 = [(CRLWPRep *)self storage];
  v3 = +[CRLWPStorageStyleProvider styleProviderForStorage:v2];

  return v3;
}

- (id)p_textEditorForStorage:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = sub_10026C0CC;
  v17 = sub_10026C0DC;
  id v18 = 0;
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v6 = [v5 editorController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10026C0E4;
  v10[3] = &unk_1014CFB80;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateEditorsOnStackUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

+ (id)focusedHighlightColorForDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = (id *)&unk_1016A9888;
  if (!v3) {
    id v5 = (id *)&qword_1016A9880;
  }
  id v6 = *v5;
  objc_sync_exit(v4);

  return v6;
}

+ (id)unfocusedHighlightColorForDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  id v5 = (id *)&qword_1016A9898;
  if (!v3) {
    id v5 = (id *)&unk_1016A9890;
  }
  id v6 = *v5;
  objc_sync_exit(v4);

  return v6;
}

- (void)setSuppressSelectionHighlight:(BOOL)a3
{
  if (self->_suppressSelectionHighlight != a3)
  {
    self->_suppressSelectionHighlight = a3;
    if (a3) {
      [(CRLWPRep *)self p_hideSelectionLayers];
    }
  }
}

- (BOOL)p_shouldDisplaySelectionControls
{
  return ![(CRLWPRep *)self suppressSelectionControls];
}

- (BOOL)shouldShowKnobs
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPRep;
  BOOL v3 = [(CRLCanvasRep *)&v5 shouldShowKnobs];
  if (v3) {
    LOBYTE(v3) = [(CRLWPRep *)self p_shouldDisplaySelectionControls];
  }
  return v3;
}

- (CRLContainerInfo)containerInfo
{
  v2 = [(CRLCanvasRep *)self info];
  uint64_t v3 = objc_opt_class();
  uint64_t v9 = sub_100246DEC(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  return (CRLContainerInfo *)v9;
}

- (void)setDragRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  NSUInteger length = a3.length;
  if (!a3.length)
  {
    NSUInteger location = self->_dragRange.location;
    NSUInteger length = self->_dragRange.length;
  }
  self->_dragRange = a3;
  -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", location, length);
}

- (void)setDropSelection:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSelection);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dropSelection, obj);
    uint64_t v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v5 invalidateOverlayLayersForRep:self];

    id v6 = objc_loadWeakRetained((id *)&self->_dropSelection);
    if (v6)
    {
      uint64_t v7 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v7 layoutIfNeeded];

      [(CAShapeLayer *)self->_dragAndDropCaretLayer setHidden:0];
    }
    else
    {
      [(CAShapeLayer *)self->_dragAndDropCaretLayer setDelegate:0];
      dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
      self->_dragAndDropCaretLayer = 0;

      self->_dragAndDropCaretLayerIsForCaret = 0;
    }
  }
}

- (CRLWPDragAndDropHelper)dragAndDropHelper
{
  dragAndDropHelper = self->_dragAndDropHelper;
  if (!dragAndDropHelper)
  {
    uint64_t v4 = [[CRLWPDragAndDropHelper alloc] initWithOwningRep:self];
    uint64_t v5 = self->_dragAndDropHelper;
    self->_dragAndDropHelper = v4;

    dragAndDropHelper = self->_dragAndDropHelper;
  }

  return dragAndDropHelper;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = +[CRLColor colorWithRed:0.0 green:0.33 blue:0.65 alpha:0.25];
    uint64_t v3 = (void *)qword_1016A9880;
    qword_1016A9880 = v2;

    objc_storeStrong(&qword_1016A9888, (id)qword_1016A9880);
    uint64_t v4 = +[CRLColor colorWithWhite:0.1786 alpha:0.25];
    uint64_t v5 = (void *)qword_1016A9898;
    qword_1016A9898 = v4;

    objc_storeStrong(&qword_1016A9890, (id)qword_1016A9898);
    uint64_t v6 = +[CRLColor colorWithRed:0.22 green:0.22 blue:0.22 alpha:0.11];
    uint64_t v7 = (void *)qword_1016A98A0;
    qword_1016A98A0 = v6;
  }
}

- (CRLWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CRLWPRep;
  uint64_t v8 = [(CRLCanvasRep *)&v24 initWithLayout:v6 canvas:v7];
  if (v8)
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    sub_100246E2C(v6, v9, 1, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);

    uint64_t v15 = [v8 storage];

    if (v15)
    {
      [v8 p_registerNotifications];
      v8[557] = 1;
      *((_OWORD *)v8 + 22) = xmmword_101176F48;
      *(_OWORD *)(v8 + 376) = xmmword_101176F48;
      v8[418] = 1;
      double v16 = [[CRLWPRepCaretController alloc] initWithDelegate:v8];
      v17 = (void *)*((void *)v8 + 66);
      *((void *)v8 + 66) = v16;

      uint64_t v18 = +[CRLWPRepHelper forCurrentPlatform:v8];
      v19 = (void *)*((void *)v8 + 67);
      *((void *)v8 + 67) = v18;

      unsigned __int8 v20 = [v8 p_isRedesignedTextCursorEnabled];
      v8[321] = v20;
      v8[369] = v20;
      [v8 setIbeamLength:20.0];
      uint64_t v21 = +[NSUUID UUID];
      uint64_t v22 = (void *)*((void *)v8 + 70);
      *((void *)v8 + 70) = v21;
    }
  }

  return (CRLWPRep *)v8;
}

- (void)dealloc
{
  [(CRLWPRep *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v3 dealloc];
}

- (void)setParentRep:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v15 setParentRep:v4];
  uint64_t v5 = [(CRLWPRep *)self storage];
  if (v5)
  {
    id v6 = [(CRLCanvasRep *)self canvas];
    unsigned int v7 = [v6 isCanvasInteractive];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [(CRLCanvasRep *)self interactiveCanvasController];
      uint64_t v10 = [v9 primaryFindResultSearchReference];
      uint64_t v11 = sub_1002469D0(v8, v10);
      id v12 = [v11 copy];

      if ([(CRLWPRep *)self p_doesRepIntersectSearchReference:v12]) {
        [(CRLWPRep *)self p_setPrimaryFindResultSearchReference:v12];
      }
      uint64_t v13 = [(CRLCanvasRep *)self interactiveCanvasController];
      uint64_t v14 = [v13 searchReferencesToHighlight];
      [(CRLWPRep *)self i_setSearchReferencesToHighlight:v14];
    }
  }
}

- (void)willBeRemoved
{
  [(CRLWPRep *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v3 willBeRemoved];
}

- (BOOL)p_isRedesignedTextCursorEnabled
{
  return +[CRLFeatureFlagGroup isRedesignedTextCursorEnabled];
}

- (_NSRange)range
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [(CRLWPRep *)self columns];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  NSUInteger v4 = 0;
  if (v3)
  {
    uint64_t v5 = *(void *)v16;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id location = [v8 range];
        }
        else
        {
          v22.id location = (NSUInteger)[v8 range];
          v22.NSUInteger length = v11;
          v20.id location = v6;
          v20.NSUInteger length = v4;
          NSRange v12 = NSUnionRange(v20, v22);
          NSUInteger length = v12.length;
          id location = (id)v12.location;
        }
        NSUInteger v6 = (NSUInteger)location;
        NSUInteger v4 = length;
      }
      id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
  else
  {
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v6;
  NSUInteger v14 = v4;
  result.NSUInteger length = v14;
  result.id location = v13;
  return result;
}

- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(CRLCanvasRep *)self naturalBounds];
  -[CRLWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  if (v4)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v16 = [(CRLWPRep *)self columns];
    id v17 = [v16 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v59;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v59 != v18) {
            objc_enumerationMutation(v16);
          }
          NSRange v20 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          [v20 frameBounds];
          v64.double x = v13;
          v64.double y = v15;
          if (CGRectContainsPoint(v65, v64))
          {
            uint64_t v21 = (char *)[v20 lineCount];
            if (v21)
            {
              [v20 boundsOfLineFragmentAtIndex:v21 - 1];
              CGFloat rect = v22;
              CGFloat v24 = v23;
              CGFloat v26 = v25;
              CGFloat v28 = v27;
              if (v20)
              {
                [v20 transformToWP];
                double v29 = v53;
                double v30 = v55;
                double v42 = v54;
                double v31 = v57;
                double v43 = v56;
                double v44 = v52;
              }
              else
              {
                double v31 = 0.0;
                double v30 = 0.0;
                double v29 = 0.0;
                double v42 = 0.0;
                double v43 = 0.0;
                double v44 = 0.0;
              }
              v66.origin.double x = v26;
              v66.origin.double y = v28;
              v66.size.width = v24;
              v66.size.height = rect;
              double MaxY = CGRectGetMaxY(v66);
              if (v31 + v15 * v30 + v29 * v13 > MaxY)
              {
                if (v20)
                {
                  [v20 transformFromWP];
                  double v33 = v47;
                  double v34 = v46;
                  double v35 = v49;
                  double v36 = v48;
                  double v37 = v51;
                  double v38 = v50;
                }
                else
                {
                  double v37 = 0.0;
                  double v35 = 0.0;
                  double v33 = 0.0;
                  double v38 = 0.0;
                  double v36 = 0.0;
                  double v34 = 0.0;
                }
                double v39 = v43 + v15 * v42 + v44 * v13;
                double v13 = v38 + MaxY * v36 + v34 * v39;
                double v15 = v37 + MaxY * v35 + v33 * v39;
              }
            }
            goto LABEL_20;
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  double v40 = v13;
  double v41 = v15;
  result.double y = v41;
  result.double x = v40;
  return result;
}

- (CGPoint)pinToClosestColumn:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  NSUInteger v6 = -[CRLWPRep closestColumnForPoint:](self, "closestColumnForPoint:");
  unsigned int v7 = v6;
  if (v6)
  {
    [v6 frameBounds];
    -[CRLWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
    double x = v12;
    double y = v13;
  }

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGRect)caretRect
{
  id v3 = [(CRLWPRep *)self selection];
  [(CRLWPRep *)self caretRectForSelection:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)selectionRect
{
  id v3 = [(CRLWPRep *)self selection];
  [(CRLWPRep *)self rectForSelection:v3 includeRuby:0 includePaginatedAttachments:0];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPRep;
  if (!-[CRLCanvasRep containsPoint:withPrecision:](&v12, "containsPoint:withPrecision:")) {
    return 0;
  }
  double v8 = [(CRLCanvasRep *)self parentRep];

  if (!v8) {
    return 1;
  }
  double v9 = [(CRLCanvasRep *)self parentRep];
  unsigned __int8 v10 = [v9 containsPoint:v4 withPrecision:x, y];

  return v10;
}

- (BOOL)didPointHitSelectionEnd:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(CRLWPRep *)self selection];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(CRLWPRep *)self selection];
    unsigned __int8 v9 = [v8 isInsertionPoint];

    if (v9)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      CGSize size = CGRectNull.size;
      CGPoint origin = CGRectNull.origin;
      CGSize v20 = size;
      v18.CGPoint origin = origin;
      v18.CGSize size = size;
      double v11 = [(CRLCanvasRep *)self canvas];
      [v11 viewScale];
      double v13 = v12;

      LODWORD(v11) = [(CRLWPRep *)self textIsVertical];
      double v14 = [(CRLWPRep *)self selection];
      double v15 = [(CRLWPRep *)self p_newSelectionPathForSelection:v14 transform:0 headPinRect:&origin tailPinRect:&v18];

      CGPathRelease(v15);
      double v16 = 1.0 / v13;
      if (v11)
      {
        origin.double y = origin.y - v16;
        v18.origin.double y = CGRectGetMaxY(v18) - v16;
      }
      else
      {
        origin.double x = origin.x - v16;
        v18.origin.double x = CGRectGetMaxX(v18) - v16;
      }
      if (sub_1000652B0(x, y, origin.x + -2.5, origin.y + -3.5, v20.width + 5.0, v20.height + 7.0)
        || (LODWORD(v6) = sub_1000652B0(x, y, v18.origin.x + -2.5, v18.origin.y + -3.5, v18.size.width + 5.0, v18.size.height + 7.0), v6))
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

- (BOOL)isPointInSelectedArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = [(CRLWPRep *)self selection];

  if (!v6) {
    return 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v7 = [(CRLWPRep *)self columns];
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v12 = [(CRLWPRep *)self selection];
        id v13 = [v12 range];
        uint64_t v15 = v14;
        double v16 = [(CRLWPRep *)self selection];
        id v17 = [v11 rectsForSelectionRange:v13 selectionType:v15 forParagraphMode:[v16 type] includeRuby:0 includePaginatedAttachments:0];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v18 = v17;
        id v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v25;
          while (2)
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) CGRectValue];
              v34.CGFloat x = x;
              v34.CGFloat y = y;
              if (CGRectContainsPoint(v35, v34))
              {

                BOOL v22 = 1;
                goto LABEL_21;
              }
            }
            id v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      BOOL v22 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_21:

  return v22;
}

- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4 includePaginatedAttachments:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(CRLWPRep *)self columns];
  +[CRLWPColumn boundsRectForSelection:v8 columnArray:v9 includeRuby:v6 includePaginatedAttachments:v5];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGPath)newPathForSelection:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if ([v4 isRange])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v9 = [(CRLWPRep *)self columns];
    id v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v35;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v9);
          }
          double v13 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v12);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = [v4 range];
          double v16 = [v13 rectsForSelectionRange:v14 selectionType:v15 forParagraphMode:[v4 type] includeRuby:0 includePaginatedAttachments:1];
          id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v31;
            do
            {
              double v19 = 0;
              do
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v30 + 1) + 8 * (void)v19) CGRectValue];
                CGFloat v21 = v20;
                CGFloat v23 = v22;
                CGFloat v25 = v24;
                CGFloat v27 = v26;
                v40.origin.CGFloat x = x;
                v40.origin.CGFloat y = y;
                v40.size.CGFloat width = width;
                v40.size.CGFloat height = height;
                if (CGRectIsEmpty(v40))
                {
                  CGFloat x = v21;
                  CGFloat y = v23;
                  CGFloat width = v25;
                  CGFloat height = v27;
                }
                else
                {
                  v41.origin.CGFloat x = x;
                  v41.origin.CGFloat y = y;
                  v41.size.CGFloat width = width;
                  v41.size.CGFloat height = height;
                  v46.origin.CGFloat x = v21;
                  v46.origin.CGFloat y = v23;
                  v46.size.CGFloat width = v25;
                  v46.size.CGFloat height = v27;
                  CGRect v42 = CGRectUnion(v41, v46);
                  CGFloat x = v42.origin.x;
                  CGFloat y = v42.origin.y;
                  CGFloat width = v42.size.width;
                  CGFloat height = v42.size.height;
                }
                double v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v17);
          }

          double v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v10);
    }
  }
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  if (CGRectIsEmpty(v43))
  {
    Mutable = 0;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGRect v45 = CGRectIntegral(v44);
    CGPathAddRect(Mutable, 0, v45);
  }

  return Mutable;
}

- (CGPath)p_newPathForSelection:(id)a3 withTransform:(CGAffineTransform *)a4 withInset:(double)a5
{
  id v8 = a3;
  if ([v8 isRange])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(CRLWPRep *)self columns];
    Mutable = 0;
    id v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v35;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v12);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = [v8 range];
          double v16 = [v13 rectsForSelectionRange:v14 selectionType:v15 forParagraphMode:[v8 type] includeRuby:0 includePaginatedAttachments:1];
          id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v31;
            do
            {
              double v19 = 0;
              do
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v16);
                }
                [*(id *)(*((void *)&v30 + 1) + 8 * (void)v19) CGRectValue];
                CGFloat x = v40.origin.x;
                CGFloat y = v40.origin.y;
                CGFloat width = v40.size.width;
                CGFloat height = v40.size.height;
                if (!CGRectIsNull(v40))
                {
                  v41.origin.CGFloat x = x;
                  v41.origin.CGFloat y = y;
                  v41.size.CGFloat width = width;
                  v41.size.CGFloat height = height;
                  CGRect v42 = CGRectInset(v41, a5, a5);
                  CGFloat v24 = v42.origin.x;
                  CGFloat v25 = v42.origin.y;
                  CGFloat v26 = v42.size.width;
                  CGFloat v27 = v42.size.height;
                  if (!Mutable) {
                    Mutable = CGPathCreateMutable();
                  }
                  v43.origin.CGFloat x = v24;
                  v43.origin.CGFloat y = v25;
                  v43.size.CGFloat width = v26;
                  v43.size.CGFloat height = v27;
                  CGRect v44 = CGRectIntegral(v43);
                  CGPathAddRect(Mutable, a4, v44);
                }
                double v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v17);
          }

          double v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v10);
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(unint64_t)a4
{
  BOOL v5 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([CRLWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, a4);
  [(CRLWPRep *)self p_caretRectForSelection:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(unint64_t)a5
{
  double v9 = [CRLWPSelection alloc];
  double v10 = [(CRLWPRep *)self storage];
  id v11 = [v10 copyWithMarkedText];
  LOBYTE(v25) = a4;
  double v12 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, a3, 0, 0, a5, 0x7FFFFFFFFFFFFFFFLL, 0, v25, v11);

  [(CRLWPRep *)self p_caretRectForSelection:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- ($1C7B61A4053D036F47119D3E279950B5)p_lineMetricsAtPoint:(SEL)a3 allowNotFound:(CGPoint)a4
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  memcpy(retstr, &unk_101178488, sizeof($1C7B61A4053D036F47119D3E279950B5));
  double v10 = -[CRLWPRep closestColumnForPoint:](self, "closestColumnForPoint:", x, y);
  __int16 v14 = 0;
  id v11 = [v10 charIndexFromPoint:0 allowPastBreak:1 pastCenterGoesToNextChar:v5 allowNotFound:&v14 isAtEndOfLine:&v14 leadingEdge:x y];
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10) {
      [v10 lineMetricsAtCharIndex:v11 allowEndOfLine:HIBYTE(v14)];
    }
    else {
      memset(v13, 0, sizeof(v13));
    }
    memcpy(retstr, v13, sizeof($1C7B61A4053D036F47119D3E279950B5));
  }

  return result;
}

- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtPoint:(SEL)a3
{
  return -[CRLWPRep p_lineMetricsAtPoint:allowNotFound:](self, "p_lineMetricsAtPoint:allowNotFound:", 0, a4.x, a4.y);
}

- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtCharIndex:(SEL)a3
{
  double v6 = -[CRLWPRep columnForCharIndex:](self, "columnForCharIndex:");
  id v8 = v6;
  if (v6)
  {
    [v6 lineMetricsAtCharIndex:a4 allowEndOfLine:0];
  }
  else
  {
    retstr->var7.tdouble y = 0.0;
    *(_OWORD *)&retstr->var7.b = 0u;
    *(_OWORD *)&retstr->var7.d = 0u;
    *(_OWORD *)&retstr->var6.xHeight = 0u;
    *(_OWORD *)&retstr->var6.underlineThickness = 0u;
    *(_OWORD *)&retstr->var6.leadingAbove = 0u;
    *(_OWORD *)&retstr->var6.spaceAfter = 0u;
    *(_OWORD *)&retstr->var6.attachmentHeight = 0u;
    *(_OWORD *)&retstr->var6.capHeight = 0u;
    retstr->var4.CGSize size = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    *(_OWORD *)&retstr->var2.underlineThickness = 0u;
    retstr->var4.CGPoint origin = 0u;
    *(_OWORD *)&retstr->var2.spaceAfter = 0u;
    *(_OWORD *)&retstr->var2.xHeight = 0u;
    *(_OWORD *)&retstr->var2.capHeight = 0u;
    *(_OWORD *)&retstr->var2.leadingAbove = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
    *(_OWORD *)&retstr->var2.attachmentHeight = 0u;
    retstr->var0.CGPoint origin = 0u;
    retstr->var0.CGSize size = 0u;
  }

  return result;
}

- ($C5ACE5DF23171BCD39C0E4E0C96DCEA5)wordMetricsAtCharIndex:(SEL)a3
{
  *(_OWORD *)&retstr->var5 = xmmword_101178610;
  *(_OWORD *)&retstr->var6.b = unk_101178620;
  *(_OWORD *)&retstr->var6.d = xmmword_101178630;
  retstr->var6.tdouble y = 0.0;
  retstr->var0.CGPoint origin = (CGPoint)xmmword_1011785D0;
  retstr->var0.CGSize size = (CGSize)unk_1011785E0;
  *(_OWORD *)&retstr->var1 = xmmword_1011785F0;
  *(_OWORD *)&retstr->var3 = unk_101178600;
  double v7 = [(CRLWPRep *)self storage];
  id v8 = [v7 wordAtCharIndex:a4 includePreviousWord:0];
  uint64_t v10 = v9;

  id v11 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v8, v10);
  [(CRLWPRep *)self rectForSelection:v11 includeRuby:0 includePaginatedAttachments:0];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  retstr->var0.origin.double x = v13;
  retstr->var0.origin.double y = v15;
  retstr->var0.size.CGFloat width = v17;
  retstr->var0.size.CGFloat height = v19;
  memset(v21, 0, sizeof(v21));
  CGRect result = -[CRLWPRep lineMetricsAtCharIndex:](self, "lineMetricsAtCharIndex:", a4, 0, 0, 0, 0);
  retstr->var1 = 0.0;
  retstr->var2 = 0.0;
  retstr->var3 = 0.0;
  retstr->var4 = 0.0;
  retstr->var6 = *(CGAffineTransform *)&v21[1];
  return result;
}

- (CGRect)caretRectForSelection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CRLWPRep *)self p_caretRectForSelection:v4];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)p_caretRectForSelection:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  if ([v4 type] != (id)3 && objc_msgSend(v4, "type") != (id)5)
  {
    v26.origin.CGFloat x = CGRectNull.origin.x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    if (CGRectIsNull(v26))
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v9 = [(CRLWPRep *)self columns];
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v22;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * i) caretRectForSelection:v4];
            if (v16 > 0.0 || v15 > 0.0)
            {
              CGFloat x = v13;
              CGFloat y = v14;
              CGFloat width = v15;
              CGFloat height = v16;
              goto LABEL_15;
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)p_topicDragRectForSelection:(id)a3
{
  id v4 = a3;
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4A68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA4B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4A88);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_topicDragRectForSelection:]");
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 575, 0, "invalid nil value for '%{public}s'", "sel");
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v12 = [(CRLWPRep *)self columns];
  id v13 = [v12 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v50;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        [v16 caretRectForSelection:v4];
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        CGFloat v22 = v17;
        CGFloat v24 = v23;
        if (v23 > 0.0 || v17 > 0.0)
        {
          unsigned int v25 = [v16 textIsVertical];
          if (v25)
          {
            v54.origin.double x = v19;
            v54.origin.double y = v21;
            v54.size.CGFloat width = v22;
            v54.size.CGFloat height = v24;
            CGFloat MaxX = CGRectGetMaxX(v54);
            [v16 frameBounds];
            CGFloat MaxY = v27;
            [v16 frameBounds];
            CGFloat v30 = v29;
            CGFloat v31 = 1.0;
          }
          else
          {
            [v16 frameBounds];
            CGFloat MaxX = v32;
            [v16 frameBounds];
            CGFloat v31 = v33;
            CGFloat v30 = 1.0;
            CGFloat MaxY = v21;
          }
          id v34 = [v4 range];
          long long v48 = xmmword_101176F48;
          long long v35 = [(CRLWPRep *)self storage];
          id v36 = [v35 paragraphIndexAtCharIndex:v34 effectiveRange:&v48];

          long long v37 = [(CRLWPRep *)self storage];
          if (v36 == [v37 paragraphCount] && *((void *)&v48 + 1))
          {
            BOOL v38 = (unint64_t)v34 > (unint64_t)v48;

            if (v38)
            {
              CGFloat v39 = v19;
              CGFloat v40 = v21;
              CGFloat v41 = v22;
              CGFloat v42 = v24;
              if (v25) {
                CGFloat MaxX = CGRectGetMinX(*(CGRect *)&v39);
              }
              else {
                CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v39);
              }
            }
          }
          else
          {
          }
          [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
          v55.origin.double x = MaxX;
          v55.origin.double y = MaxY;
          v55.size.CGFloat width = v31;
          v55.size.CGFloat height = v30;
          CGRect v56 = CGRectApplyAffineTransform(v55, &v47);
          double x = v56.origin.x;
          double y = v56.origin.y;
          if (v25)
          {
            CGFloat height = v56.size.height;
            double x = rint(v56.origin.x);
            CGFloat width = 1.0;
          }
          else
          {
            CGFloat width = v56.size.width;
            double y = rint(v56.origin.y);
            CGFloat height = 1.0;
          }
          goto LABEL_33;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  double v43 = x;
  double v44 = y;
  double v45 = width;
  double v46 = height;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.double y = v44;
  result.origin.double x = v43;
  return result;
}

- (CGRect)p_closestCaretRectForCharacterAtPoint:(CGPoint)a3
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  -[CRLWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CRLWPRep *)self layout];
  unint64_t v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", 1, 1, 0, 0, 0, 0, v9, v11, v12);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v14 = [(CRLWPRep *)self columns];
    id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    unint64_t v16 = v13 + 1;
    if (v15)
    {
      uint64_t v17 = *(void *)v34;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          CGFloat v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v20 = [v19 range];
          if (v16 >= (unint64_t)v20 && v16 - (unint64_t)v20 < v21)
          {
            id v15 = v19;
            goto LABEL_14;
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v15);
    }
LABEL_14:

    if (v15) {
      unint64_t v23 = v13 + 1;
    }
    else {
      unint64_t v23 = v13;
    }
    CGFloat v24 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v23, 0);
    [(CRLWPRep *)self caretRectForSelection:v24];
    CGFloat x = v25;
    CGFloat y = v26;
    CGFloat width = v27;
    CGFloat height = v28;
  }
  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)p_closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4 allowPastBreak:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[CRLWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  double v9 = v8;
  double v11 = v10;
  unsigned __int8 v29 = 0;
  double v12 = [(CRLWPRep *)self layout];
  unint64_t v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:", v5, &v29, v12, v9, v11);

  if (v6)
  {
    uint64_t v14 = [(CRLWPRep *)self selection];
    unsigned __int8 v15 = [v14 isValid];

    if ((v15 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4AA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AA54C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4AC8);
      }
      unint64_t v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:]");
      double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:667 isFatal:0 description:"invalid text selection"];
    }
    CGFloat v19 = [(CRLWPRep *)self selection];
    BOOL v20 = v13 < (unint64_t)[v19 start];

    unint64_t v21 = [(CRLWPRep *)self selection];
    CGFloat v22 = v21;
    if (v20)
    {
      id v23 = [v21 start];
LABEL_16:
      unint64_t v13 = (unint64_t)v23;

      goto LABEL_17;
    }
    BOOL v24 = v13 > (unint64_t)[v21 end];

    if (v24)
    {
      CGFloat v22 = [(CRLWPRep *)self selection];
      id v23 = [v22 end];
      goto LABEL_16;
    }
  }
LABEL_17:
  [(CRLWPRep *)self caretRectForCharIndex:v13 caretAffinity:v29];
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLWPRep;
    uint64_t v11 = -[CRLCanvasRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v14, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
  }
  else
  {
    uint64_t v11 = -[CRLWPRep cursorForPoint:withCursorPlatformObject:](self, "cursorForPoint:withCursorPlatformObject:", v10, x, y);
  }
  double v12 = (void *)v11;

  return v12;
}

- (double)p_maximumBeamLength
{
  return 1000.0;
}

- (id)cursorForPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(CRLCanvasRep *)self canvas];
  v68 = [v7 canvasController];

  unsigned int v8 = [(CRLWPRep *)self textIsVertical];
  uint64_t v9 = -[CRLWPRep p_hyperlinkAtPoint:](self, "p_hyperlinkAtPoint:", x, y);
  id v10 = (void *)v9;
  if (v8) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  if (v9)
  {
    CGFloat width = CGRectZero.size.width;
    CGFloat v66 = CGRectZero.origin.y;
    CGFloat v67 = CGRectZero.origin.x;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    [(CRLCanvasRep *)self layerFrameInScaledCanvas];
    CGFloat v66 = v15;
    CGFloat v67 = v14;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  -[CRLWPRep p_closestCaretRectForCharacterAtPoint:](self, "p_closestCaretRectForCharacterAtPoint:", x, y);
  CGFloat v18 = v91.origin.x;
  CGFloat v19 = v91.origin.y;
  CGFloat v20 = v91.size.width;
  CGFloat v21 = v91.size.height;
  if (CGRectIsNull(v91))
  {
    int v22 = 0;
  }
  else
  {
    [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:sub_100065738(v18, v19, v20, v21)];
    [v68 convertUnscaledToBoundsPoint:];
    uint64_t v64 = v24;
    double v65 = v23;
    if (!v10)
    {
      [v68 viewScale];
      double v26 = sub_1000646A4(v20, v21, v25);
      if (!v8) {
        double v26 = v27;
      }
      if (v26 > 0.0) {
        -[CRLWPRep setIbeamLength:](self, "setIbeamLength:");
      }
    }
    double v28 = [(CRLWPRep *)self layout];
    unsigned __int8 v29 = v28;
    if (v28) {
      [v28 transformInRoot];
    }
    else {
      memset(v89, 0, sizeof(v89));
    }
    double v30 = sub_10007F788(v89);

    double v31 = sub_100407E0C(v30, 90.0);
    sub_100065C2C(v31);
    if (v32 != 0.0 && v32 != 180.0 && fabs(v32 + -180.0) >= 0.00018)
    {
      if (v32 == 90.0 || v32 == 270.0 || fabs(v32 + -90.0) < 0.0000899999998 || fabs(v32 + -270.0) < 0.000269999999)
      {
        if (v8) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F4AE8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AA5D4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F4B08);
        }
        long long v61 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        id v62 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep cursorForPoint:withCursorPlatformObject:]");
        v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v62 file:v63 lineNumber:763 isFatal:0 description:"Something is wrong with our math"];
      }
    }
    uint64_t v88 = 0;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    memset(&v69[3], 0, 32);
    -[CRLWPRep p_lineMetricsAtPoint:allowNotFound:](self, "p_lineMetricsAtPoint:allowNotFound:", 1, x, y);
    long long v33 = [(CRLWPRep *)self layout];
    long long v34 = v33;
    if (v33) {
      [v33 transformInRoot];
    }
    else {
      memset(v69, 0, 48);
    }
    BOOL v35 = sub_10007F910((double *)v69, 0.01);

    IsEmptdouble y = CGRectIsEmpty(*(CGRect *)&v69[3]);
    if (v10)
    {
      BOOL v37 = 1;
    }
    else
    {
      [(CRLWPRep *)self ibeamLength];
      double v39 = v38;
      [(CRLWPRep *)self p_maximumBeamLength];
      BOOL v37 = v39 <= v40;
    }
    int v22 = v35 & ~IsEmpty & v37;
    if (v22 == 1)
    {
      if (v11 == 2)
      {
        v92.origin.double x = v67;
        v92.origin.double y = v66;
        v92.size.CGFloat width = width;
        v92.size.CGFloat height = height;
        CGRectGetMaxY(v92);
        v93.origin.double x = v67;
        v93.origin.double y = v66;
        v93.size.CGFloat width = width;
        v93.size.CGFloat height = height;
        CGRectGetMinY(v93);
        double v41 = sub_100065928(v67, v66, width, height, v65);
        double v43 = v42;
        CGFloat width = v44;
        CGFloat height = v45;
        uint64_t v46 = +[NSString stringWithFormat:@"%f", v64];
      }
      else
      {
        v94.origin.double x = v67;
        v94.origin.double y = v66;
        v94.size.CGFloat width = width;
        v94.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v94);
        v95.origin.double x = v67;
        v95.origin.double y = v66;
        v95.size.CGFloat width = width;
        v95.size.CGFloat height = height;
        double MinX = CGRectGetMinX(v95);
        double v52 = vabdd_f64(v65, MaxX);
        double v53 = vabdd_f64(v65, MinX);
        if (v52 > v53) {
          double v53 = -v52;
        }
        double v41 = sub_100065928(v67, v66, width, height, v65 + v53);
        double v43 = v54;
        CGFloat width = v55;
        CGFloat height = v56;
        uint64_t v46 = +[NSString stringWithFormat:@"%f", *(void *)&v65];
      }
      CGAffineTransform v47 = (__CFString *)v46;
      CGFloat v66 = v43;
      CGFloat v67 = v41;
      if (v10) {
        goto LABEL_34;
      }
      goto LABEL_39;
    }
  }
  CGAffineTransform v47 = &stru_101538650;
  if (v10)
  {
LABEL_34:
    long long v48 = 0;
    long long v49 = +[CRLCursor defaultCursor];
    goto LABEL_42;
  }
LABEL_39:
  [(CRLWPRep *)self ibeamLength];
  double v57 = +[UIPointerShape beamWithPreferredLength:axis:](UIPointerShape, "beamWithPreferredLength:axis:", v11);
  long long v49 = +[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v57, v67, v66, width, height);
  [(CRLWPRep *)self ibeamLength];
  CFStringRef v59 = @"H";
  if (v11 == 2) {
    CFStringRef v59 = @"V";
  }
  long long v48 = +[NSString stringWithFormat:@"%f%@%@", v58, v59, v47];
  [(CRLWPRep *)self setIbeamLength:20.0];
  [v49 setIdentifierSuffix:v48];

LABEL_42:
  if (v22) {
    [v49 setConstrainedAxes:v11];
  }

  return v49;
}

- (void)p_registerNotifications
{
  id v5 = [(CRLCanvasRep *)self canvas];
  unsigned int v3 = [v5 isCanvasInteractive];

  if (v3)
  {
    id v6 = [(CRLWPRep *)self storage];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"p_selectionChangedNotification:" name:@"CRLTPEditorSelectionChanged" object:v6];
    [v4 addObserver:self selector:"p_markChangedNotification:" name:@"CRLWPEditorMarkChanged" object:v6];
    [v4 addObserver:self selector:"p_editingDidEndNotification:" name:@"CRLWPEditorEditingDidEnd" object:v6];
  }
}

- (void)p_unregisterNotifications
{
  id v5 = [(CRLCanvasRep *)self canvas];
  unsigned int v3 = [v5 isCanvasInteractive];

  if (v3)
  {
    id v6 = [(CRLWPRep *)self storage];
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"CRLTPEditorSelectionChanged" object:v6];
    [v4 removeObserver:self name:@"CRLWPEditorMarkChanged" object:v6];
    [v4 removeObserver:self name:@"CRLWPEditorEditingDidEnd" object:v6];
  }
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4B28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA65C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4B48);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep newTrackerForKnob:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 850, 0, "invalid nil value for '%{public}s'", "knob");
  }
  unsigned int v8 = [[CRLWPTextKnobTracker alloc] initWithRep:self knob:v4];

  return v8;
}

- (id)knobPositioner
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLWPRep *)self layout];
  id v5 = sub_1002469D0(v3, v4);

  if (v5) {
    id v6 = [[_TtC8Freeform22CRLWPKnobPositioning_i alloc] initWithLayout:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(CRLWPRep *)self knobPositioner];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 knobCenterForSelection:v6 knob:v7];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0x7FF0000000000000;
    uint64_t v13 = 0x7FF0000000000000;
  }

  double v14 = *(double *)&v11;
  double v15 = *(double *)&v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 renderable];
  [v7 bounds];
  double Height = CGRectGetHeight(v16);

  uint64_t v9 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v9 viewScale];
  double v11 = v10;

  id v12 = [v6 tag];
  double v13 = Height * 0.5;
  double v14 = 0.0;
  if (v12 == (id)11)
  {
    if (!a4) {
      double v14 = 0.0 - (v13 / v11 + -1.0);
    }
  }
  else if (!a4)
  {
    double v14 = v13 / v11 + -1.0;
  }

  return v14;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (int64_t)tilingMode
{
  if ([(CRLWPRep *)self textIsVertical]) {
    return 5;
  }
  else {
    return 4;
  }
}

- (void)verticalTextPropertyChanged
{
  [(CRLWPRep *)self p_destroyLayer:1];
  [(CRLWPRep *)self p_destroyLayer:0];
  [(CRLWPRep *)self p_createLayer:1];
  [(CRLWPRep *)self p_createLayer:0];
  dragAndDropTopicIndentLayer = self->_dragAndDropTopicIndentLayer;
  self->_dragAndDropTopicIndentLayer = 0;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 != 7 && a3 != 25)
  {
    if (a3 != 26) {
      return;
    }
    [(CRLWPStorageSpellChecker *)self->_spellChecker i_resetSpellCheckingForNotification:0];
  }
  [(CRLWPRep *)self setNeedsDisplay];
}

- (void)spellCheckingStateChanged
{
  [(CRLWPRep *)self setNeedsDisplay];
  if ([(CRLWPRep *)self p_needsSpellChecker])
  {
    if (!self->_spellChecker)
    {
      [(CRLWPRep *)self p_createSpellChecker];
    }
  }
  else
  {
    [(CRLWPRep *)self p_destroySpellChecker];
  }
}

- (id)p_hyperlinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  id v7 = -[CRLWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", x, y);
  unsigned int v8 = sub_1002469D0(v6, v7);

  return v8;
}

- (void)performBlockOnTextLayers:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = 0;
  textLayers = self->_textLayers;
  uint64_t v9 = v4;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if (textLayers[v5]) {
      v9[2]();
    }
    char v7 = 0;
    uint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
}

- (id)textLayer
{
  return self->_textLayers[1];
}

- (id)textBackgroundLayer
{
  return self->_textLayers[0];
}

- (void)setNeedsDisplay
{
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003B0208;
    v8[3] = &unk_1014F4B70;
    v8[4] = self;
    [(CRLWPRep *)self performBlockOnTextLayers:v8];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(CRLCanvasRep *)self parentRep];
    char v7 = sub_1002469D0(v5, v6);

    [v7 invalidateEffectLayersForChildren];
  }
}

- (void)setNeedsDisplayInRange:(_NSRange)a3
{
  +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", a3.location, a3.length);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CRLWPRep rectForSelection:includeRuby:includePaginatedAttachments:](self, "rectForSelection:includeRuby:includePaginatedAttachments:");
  -[CRLWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    char v8 = [(CRLCanvasRep *)self canvas];
    unsigned int v9 = [v8 isCanvasInteractive];

    if (v9)
    {
      -[CRLCanvasRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1003B0468;
      v17[3] = &unk_1014F4B98;
      v17[4] = self;
      v17[5] = v10;
      v17[6] = v11;
      v17[7] = v12;
      v17[8] = v13;
      [(CRLWPRep *)self performBlockOnTextLayers:v17];
      uint64_t v14 = objc_opt_class();
      double v15 = [(CRLCanvasRep *)self parentRep];
      CGRect v16 = sub_1002469D0(v14, v15);

      [v16 invalidateEffectLayersForChildren];
    }
  }
}

- (id)colorBehindLayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLWPRep *)self backgroundColor];
  if (!v5)
  {
    uint64_t v6 = objc_opt_class();
    char v7 = [(CRLCanvasRep *)self parentRep];
    char v8 = sub_1002469D0(v6, v7);

    uint64_t v5 = [v8 colorBehindLayer:v4];
  }

  return v5;
}

- (void)drawInLayerContext:(CGContext *)a3
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4BB8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010AA6F0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4BD8);
  }
  uint64_t v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep drawInLayerContext:]");
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1039, 0, "this method should never be called, and WP reps should never get a bitmap allocated");
}

- (void)drawInContext:(CGContext *)a3
{
}

- (void)p_drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
  id v9 = a4;
  CGContextSaveGState(a3);
  LOBYTE(v8) = a5;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v9, 0x7FFFFFFFFFFFFFFFLL, 0, 3, v8);
  CGContextRestoreGState(a3);
}

- (void)recursivelyDrawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
}

- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = [(CRLWPRep *)self storage];
  id v11 = [v10 smartFieldAtCharIndex:a4 attributeKind:7 effectiveRange:&v15];

  if (v16)
  {
    CGContextSaveGState(a3);
    uint64_t v12 = [CRLWPSelection alloc];
    uint64_t v13 = -[CRLWPSelection initWithRange:](v12, "initWithRange:", v15, v16);
    LOBYTE(v14) = 0;
    -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v13, location, length, 3, v14);
    CGContextRestoreGState(a3);
  }
}

- (id)overlayRenderables
{
  v54.receiver = self;
  v54.super_class = (Class)CRLWPRep;
  uint64_t v3 = [(CRLCanvasRep *)&v54 overlayRenderables];
  id v4 = [v3 mutableCopy];

  if (!self->_selectionLineLayers[0]) {
    [(CRLWPRep *)self p_createSelectionLineLayers];
  }
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    uint64_t v8 = +[CRLCanvasRenderable renderableFromLayer:self->_selectionLineLayers[v5]];
    [v4 addObject:v8];

    char v6 = 0;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);
  if (self->_caretPulseController)
  {
    id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v10 = [(CRLHighlightController *)self->_caretPulseController layer];
    [v10 setDelegate:v9];

    id v11 = [(CRLHighlightController *)self->_caretPulseController layer];
    uint64_t v12 = +[CRLCanvasRenderable renderableFromLayer:v11];
    [v4 addObject:v12];
  }
  uint64_t v13 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v14 = [v13 canvas];
  [v14 contentsScale];
  double v16 = v15;

  if (![(CRLCanvasRep *)self shouldShowDragAndDropHighlight])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSelection);
    if (!WeakRetained) {
      goto LABEL_28;
    }
    goto LABEL_16;
  }
  double v17 = [(CRLWPRep *)self dragAndDropHelper];
  [v17 dragAndDropNaturalPoint];
  char v18 = sub_100067C90();

  if (v18)
  {
    id WeakRetained = 0;
    goto LABEL_28;
  }
  CGFloat v20 = [(CRLWPRep *)self storage];
  CGFloat v21 = [(CRLWPRep *)self storageForDragDropOperation];

  if (v20 == v21)
  {
    int v22 = [(CRLWPRep *)self dragAndDropHelper];
    [v22 dragAndDropNaturalPoint];
    -[CRLWPRep selectionForDragAndDropNaturalPoint:](self, "selectionForDragAndDropNaturalPoint:");
  }
  else
  {
    int v22 = [(CRLWPRep *)self storage];
    id v23 = [v22 range];
    +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v23, v24);
  id WeakRetained = };

  if (WeakRetained)
  {
LABEL_16:
    if ([WeakRetained isRange])
    {
      if (self->_dragAndDropCaretLayerIsForCaret)
      {
        [(CAShapeLayer *)self->_dragAndDropCaretLayer setDelegate:0];
        dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = 0;

        self->_dragAndDropCaretLayerIsForCaret = 0;
      }
      if (!self->_dragAndDropCaretLayer)
      {
        double v26 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        double v27 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = v26;

        double v28 = self->_dragAndDropCaretLayer;
        [(CAShapeLayer *)v28 setContentsScale:v16];
        -[CAShapeLayer setAnchorPoint:](v28, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
        [(CAShapeLayer *)v28 setEdgeAntialiasingMask:0];
        [(CAShapeLayer *)v28 setDelegate:self];
        [(CAShapeLayer *)v28 setZPosition:1.0];
        [(CAShapeLayer *)v28 setFillColor:0];
        [(CAShapeLayer *)v28 setStrokeColor:[(CRLWPRep *)self p_highlightLineColor]];
      }
      id v29 = [WeakRetained range];
      uint64_t v31 = v30;
      double v32 = [(CRLWPRep *)self columns];
      long long v33 = +[CRLWPColumn pathForHighlightWithRange:columnArray:pathStyle:](CRLWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", v29, v31, v32, 0);

      long long v34 = [v33 pathByNormalizingClosedPathToRemoveSelfIntersections];

      [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
      [v34 transformUsingAffineTransform:&v53];
      id v35 = v34;
      -[CAShapeLayer setPath:](self->_dragAndDropCaretLayer, "setPath:", [v35 CGPath]);
      long long v36 = +[CRLCanvasRenderable renderableFromLayer:self->_dragAndDropCaretLayer];
      [v4 addObject:v36];
    }
    else
    {
      if (!self->_dragAndDropCaretLayerIsForCaret)
      {
        [(CAShapeLayer *)self->_dragAndDropCaretLayer setDelegate:0];
        BOOL v37 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = 0;
      }
      double v38 = self->_dragAndDropCaretLayer;
      if (!v38)
      {
        double v39 = [(CRLWPRep *)self p_caretLayerWithZPosition:1.0];
        double v40 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = v39;

        self->_dragAndDropCaretLayerIsForCaret = 1;
        [(CAShapeLayer *)self->_dragAndDropCaretLayer setHidden:1];
        double v38 = self->_dragAndDropCaretLayer;
      }
      [(CRLWPRep *)self p_positionCaretLayer:v38 forSelection:WeakRetained layerRelative:0];
      id v35 = +[CRLCanvasRenderable renderableFromLayer:self->_dragAndDropCaretLayer];
      [v4 addObject:v35];
    }
  }
LABEL_28:
  double v41 = [(CRLWPRep *)self floatingCaretLayer];

  if (v41)
  {
    double v42 = [(CRLWPRep *)self floatingCaretLayer];
    double v43 = +[CRLCanvasRenderable renderableFromLayer:v42];
    [v4 addObject:v43];
  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    double v45 = [(CRLWPHighlightArrayController *)pulseArrayController layers];
    if ([v45 count])
    {
      uint64_t v46 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v45 makeObjectsPerformSelector:"setDelegate:" withObject:v46];

      CGAffineTransform v47 = +[CRLCanvasRenderable renderablesFromLayers:v45];
      [v4 addObjectsFromArray:v47];
    }
  }
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    long long v49 = [(CRLWPHighlightArrayController *)highlightArrayController layers];
    if ([v49 count])
    {
      long long v50 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v49 makeObjectsPerformSelector:"setDelegate:" withObject:v50];

      long long v51 = +[CRLCanvasRenderable renderablesFromLayers:v49];
      [v4 addObjectsFromArray:v51];
    }
  }

  return v4;
}

- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren
{
  return 1;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v13 = a3;
  caretLayer = self->_caretLayer;
  BOOL v5 = caretLayer == 0;
  if (!caretLayer)
  {
    char v6 = [(CRLWPRep *)self p_caretLayerWithZPosition:0.5];
    char v7 = self->_caretLayer;
    self->_caretLayer = v6;

    [(CRLWPRepCaretController *)self->_caretController setCaretLayer:self->_caretLayer];
    [(CRLWPRepHelper *)self->_repHelper configureCaretLayer:self->_caretLayer];
  }
  if (!self->_selectionHighlightLayer)
  {
    [(CRLWPRep *)self p_createSelectionHighlightLayer];
    BOOL v5 = 1;
  }
  if (!self->_selectionParagraphBorderLayer) {
    [(CRLWPRep *)self p_createSelectionParagraphBorderLayer];
  }
  if (!self->_markHighlightLayer) {
    [(CRLWPRep *)self p_createMarkHighlightLayer];
  }
  if (v5) {
    [(CRLWPRep *)self p_updateForCurrentSelectionWithFlags:0];
  }
  if (self->_markHighlightLayer) {
    [v13 addObject:];
  }
  if (self->_selectionHighlightLayer) {
    [v13 addObject:];
  }
  if (self->_smartFieldHighlightLayer) {
    [v13 addObject:];
  }
  if (self->_secondaryHighlightLayer) {
    [v13 addObject:];
  }
  uint64_t v8 = [(CRLWPRep *)self textLayer];

  if (!v8) {
    [(CRLWPRep *)self p_createLayer:1];
  }
  id v9 = [(CRLWPRep *)self textLayer];

  if (v9)
  {
    uint64_t v10 = [(CRLWPRep *)self textLayer];
    [v13 addObject:v10];
  }
  if (self->_selectionParagraphBorderLayer) {
    [v13 addObject:];
  }
  [v13 addObject:self->_caretLayer];
  if ([(CRLWPRep *)self shouldShowCollaboratorCursorHighlight]
    && ![(CRLWPRep *)self shouldAddCollaboratorLayerToOverlays])
  {
    id v11 = [(CRLWPRep *)self collaboratorCursorRenderable];
    uint64_t v12 = [v11 layer];

    if (v12) {
      [v13 addObject:v12];
    }
  }
}

- (BOOL)shouldShowEditMenu
{
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  if ([v3 isCanvasInteractive])
  {
    unsigned __int8 v4 = [(CRLWPRep *)self isBeingEdited];

    if ((v4 & 1) == 0) {
      return 0;
    }
    uint64_t v3 = [(CRLWPRep *)self textEditor];
    BOOL v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    char v6 = [v5 textInputResponder];
    unsigned __int8 v7 = [v6 scribbleInProgress];

    uint64_t v8 = [v3 textSelectionDelegate];
    id v9 = [v8 selectedTextRange];
    unsigned int v10 = [v9 isInsertionPointRange];
    char v11 = v7 ^ 1;

    if (v10)
    {
      if ([v3 editMenuIsVisible])
      {
        [v3 hideEditMenu];
LABEL_11:
        char v11 = 0;
        [(CRLWPRep *)self setShouldIgnoreFirstRequestToShowEditMenu:0];
        goto LABEL_7;
      }
      if ([(CRLWPRep *)self shouldIgnoreFirstRequestToShowEditMenu]) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    char v11 = 0;
  }
LABEL_7:

  return v11;
}

- (void)refreshEditMenu
{
  if (![(CRLWPRep *)self isBeingEdited]) {
    return;
  }
  self->_hudStateDirtdouble y = 1;
  if ([(CRLWPRep *)self p_isRedesignedTextCursorEnabled])
  {
    uint64_t v3 = [(CRLWPRep *)self textEditor];
    unsigned __int8 v4 = [v3 textSelectionManager];
    unsigned int v5 = [v4 displayingSelectionView];

    if (!v5) {
      return;
    }
  }
  else if ([(CRLWPRepCaretController *)self->_caretController suppressCaret])
  {
    return;
  }
  id range1 = [(CRLCanvasRep *)self interactiveCanvasController];
  if (![range1 textGesturesInFlight])
  {
    char v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    if ([v6 currentlyScrolling])
    {

      goto LABEL_10;
    }
    unsigned __int8 v7 = [(CRLWPRep *)self layout];
    unsigned int v8 = [v7 layoutIsValid];

    if (!v8) {
      return;
    }
    id v9 = [(CRLWPRep *)self layout];
    unsigned int v10 = [v9 columns];

    char v11 = [v10 firstObject];
    uint64_t v12 = [v10 lastObject];
    id v13 = (void *)v12;
    if (v11 && v12)
    {
      id v14 = [v11 range];
      NSUInteger v16 = v15;
      v33.NSUInteger location = (NSUInteger)[v13 range];
      v33.NSUInteger length = v17;
      v31.NSUInteger location = (NSUInteger)v14;
      v31.NSUInteger length = v16;
      NSRange v18 = NSUnionRange(v31, v33);
      CGFloat v19 = [(CRLWPRep *)self selection];
      id v20 = [v19 range];
      id range1a = v21;
      NSUInteger v22 = (NSUInteger)v20;

      id v23 = [(CRLWPRep *)self selection];
      unsigned int v24 = [v23 isInsertionPoint];

      if (v24)
      {
        BOOL v25 = v22 - v18.location < v18.length && v22 >= v18.location;
        if (v25 || v18.location + v18.length == v22)
        {
LABEL_24:
          if ([(CRLWPRep *)self shouldShowEditMenu])
          {
            double v26 = [(CRLCanvasRep *)self interactiveCanvasController];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_1003B1748;
            v29[3] = &unk_1014D0800;
            v29[4] = self;
            [v26 performBlockOnMainThreadAfterLayoutIfNecessary:v29];

            self->_hudStateDirtdouble y = 0;
          }
        }
      }
      else
      {
        v32.NSUInteger location = v22;
        v32.NSUInteger length = (NSUInteger)range1a;
        if (NSIntersectionRange(v32, v18).length) {
          goto LABEL_24;
        }
      }
    }

    return;
  }
LABEL_10:
}

- (void)updateFromLayout
{
  v26.receiver = self;
  v26.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v26 updateFromLayout];
  if ([(CRLWPRep *)self p_needsSpellChecker])
  {
    if (!self->_spellChecker)
    {
      [(CRLWPRep *)self range];
      if (v3)
      {
        unsigned __int8 v4 = [(CRLWPRep *)self layout];
        unsigned __int8 v5 = [v4 isInstructional];

        if ((v5 & 1) == 0) {
          [(CRLWPRep *)self p_createSpellChecker];
        }
      }
    }
  }
  else
  {
    [(CRLWPRep *)self p_destroySpellChecker];
  }
  if (self->_selectionChanged)
  {
    [(CRLWPRep *)self p_updateForCurrentSelectionWithFlags:self->_newSelectionFlags];
    [(CRLWPRep *)self i_setNeedsDisplayForSelectionChange];
    self->_selectionChanged = 0;
  }
  char v6 = [(CRLWPRep *)self selection];
  unsigned int v7 = [v6 isRange];

  if (v7) {
    [(CRLCanvasRep *)self invalidateKnobPositions];
  }
  if (self->_markChanged) {
    [(CRLWPRep *)self p_updateMarkHighlightLayer];
  }
  highlightArrayController = self->_highlightArrayController;
  if (!highlightArrayController)
  {
    if (!self->_searchHitsAreInvalid) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  [(CRLWPHighlightArrayController *)highlightArrayController viewScale];
  double v10 = v9;
  char v11 = [(CRLCanvasRep *)self canvas];
  [v11 viewScale];
  if (v10 != v12)
  {

LABEL_17:
    [(CRLWPRep *)self p_updateHighlights];
    goto LABEL_18;
  }
  BOOL searchHitsAreInvalid = self->_searchHitsAreInvalid;

  if (searchHitsAreInvalid) {
    goto LABEL_17;
  }
LABEL_18:
  pulseArrayController = self->_pulseArrayController;
  if (!pulseArrayController)
  {
    if (!self->_searchHitsAreInvalid) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  [(CRLWPHighlightArrayController *)pulseArrayController viewScale];
  double v15 = v14;
  NSUInteger v16 = [(CRLCanvasRep *)self canvas];
  [v16 viewScale];
  if (v15 != v17)
  {

LABEL_22:
    [(CRLWPRep *)self p_updateAnimationWithAnimatingPulse:[(CRLWPHighlightArrayController *)self->_pulseArrayController shouldPulsate]];
    goto LABEL_23;
  }
  BOOL v25 = self->_searchHitsAreInvalid;

  if (v25) {
    goto LABEL_22;
  }
LABEL_23:
  if (self->_secondaryHighlightLayer) {
    [(CRLWPRep *)self p_updateSecondaryHighlightLayer];
  }
  self->_BOOL searchHitsAreInvalid = 0;
  uint64_t v18 = objc_opt_class();
  CGFloat v19 = [(CRLWPRep *)self layout];
  id v20 = sub_1002469D0(v18, v19);

  LODWORD(v19) = [(CRLWPRep *)self hasOverflowed];
  if (v19 != [v20 isOverflowing])
  {
    -[CRLWPRep setHasOverflowed:](self, "setHasOverflowed:", [v20 isOverflowing]);
    CGFloat v21 = [(CRLCanvasRep *)self canvas];
    NSUInteger v22 = [v21 canvasController];
    id v23 = [(CRLCanvasRep *)self parentRep];
    [v22 invalidateOverlayLayersForRep:v23];
  }
}

- (CGRect)p_clipRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unsigned int v8 = [(CRLWPRep *)self columns];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      char v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v11) erasableBounds:0];
        v28.origin.double x = v12;
        v28.origin.double y = v13;
        v28.size.double width = v14;
        v28.size.double height = v15;
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        double x = v26.origin.x;
        double y = v26.origin.y;
        double width = v26.size.width;
        double height = v26.size.height;
        char v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  -[CRLWPRep newTextLayerUnscaledBounds:forNewTextBounds:](self, "newTextLayerUnscaledBounds:forNewTextBounds:", x, y, width, height, x, y, width, height);
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)clipRect
{
  v7.receiver = self;
  v7.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v7 clipRect];
  -[CRLWPRep p_clipRect:](self, "p_clipRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)didUpdateRenderable:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v40 didUpdateRenderable:v4];
  double v5 = [v4 layer];
  if (![(CRLCanvasRep *)self isBeingRotated]
    || ([(CRLWPRep *)self layout],
        double v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 wantsNormalLayoutDuringDynamicRotation],
        v6,
        v7))
  {
    -[CRLWPRep p_clipRect:](self, "p_clipRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    double v16 = [(CRLWPRep *)self layout];
    double v17 = v16;
    if (v16) {
      [v16 transformInRoot];
    }
    else {
      memset(&v39, 0, sizeof(v39));
    }
    v42.origin.CGFloat x = v9;
    v42.origin.CGFloat y = v11;
    v42.size.CGFloat width = v13;
    v42.size.CGFloat height = v15;
    CGRectApplyAffineTransform(v42, &v39);

    double v18 = [(CRLWPRep *)self layout];
    [v18 frameInRoot];

    double v19 = [(CRLCanvasRep *)self interactiveCanvasController];
    Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v41 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v19, v20);
    [v19 convertUnscaledToBoundsRect:v41.recordType._object];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    v43.origin.CGFloat x = v22;
    v43.origin.CGFloat y = v24;
    v43.size.CGFloat width = v26;
    v43.size.CGFloat height = v28;
    CGRect v44 = CGRectIntegral(v43);
    CGFloat x = v44.origin.x;
    CGFloat y = v44.origin.y;
    CGFloat width = v44.size.width;
    CGFloat height = v44.size.height;
    if (!CGRectIsNull(v44) && (sub_100067C6C() & 1) == 0)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1003B2034;
      v33[3] = &unk_1014F4B98;
      CGFloat v35 = x;
      CGFloat v36 = y;
      CGFloat v37 = width;
      CGFloat v38 = height;
      id v34 = v5;
      [(CRLWPRep *)self performBlockOnTextLayers:v33];
    }
  }
  if ([v5 edgeAntialiasingMask]) {
    [v5 setEdgeAntialiasingMask:0];
  }
  [(CRLWPRep *)self p_updateForCurrentSelectionWithFlags:0];
}

- (CGRect)rectToClipChildRepRenderables
{
  v18.receiver = self;
  v18.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v18 rectToClipChildRepRenderables];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  uint64_t v11 = objc_opt_class();
  double v12 = [(CRLWPRep *)self layout];
  CGFloat v13 = sub_1002469D0(v11, v12);

  if (v13)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    if (!CGRectIsNull(v19))
    {
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGRect v21 = CGRectIntegral(v20);
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
    }
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)screenScaleDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v10 screenScaleDidChange];
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [v3 canvas];
  [v4 contentsScale];
  double v6 = v5;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003B2314;
  v9[3] = &unk_1014F4BF8;
  *(double *)&v9[4] = v6;
  [(CRLWPRep *)self performBlockOnTextLayers:v9];
  caretLayer = self->_caretLayer;
  if (caretLayer) {
    [(CAShapeLayer *)caretLayer setContentsScale:v6];
  }
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  if (selectionParagraphBorderLayer) {
    [(CAShapeLayer *)selectionParagraphBorderLayer setContentsScale:v6];
  }
}

- (CGRect)newTextLayerUnscaledBounds:(CGRect)a3 forNewTextBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class();
}

- (void)beginEditing
{
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v4 = [v3 selectionModelTranslator];
  double v5 = [(CRLWPRep *)self storage];
  double v6 = +[CRLTextRange textRangeForEndOf:v5];
  id v7 = [v6 nsRange];
  uint64_t v9 = v8;
  objc_super v10 = [(CRLWPRep *)self storage];
  [v4 selectionPathForRange:v7 onStorage:v9];
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v11 setSelectionPath:v12 withSelectionFlags:4];

  [(CRLWPRep *)self p_updateCaretLayerColor];
}

- (void)didBeginEditingWithTextEditor:(id)a3
{
  uint64_t v4 = objc_opt_class();
  double v5 = [(CRLCanvasRep *)self parentRep];
  sub_1002469D0(v4, v5);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = v13;
  if (v13)
  {
    id v7 = [v13 shapeLayout];
    uint64_t v8 = [v7 fill];
    unsigned __int8 v9 = [v8 isOpaque];

    double v6 = v13;
    if ((v9 & 1) == 0)
    {
      objc_super v10 = [v13 shadow];
      uint64_t v11 = v10;
      if (v10) {
        uint64_t v12 = [v10 showForEditingText] ^ 1;
      }
      else {
        uint64_t v12 = 0;
      }
      [v13 setShadowOnChildrenDisabled:v12];

      double v6 = v13;
    }
  }
}

- (BOOL)canEditWithEditor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 storage];
    unsigned __int8 v9 = [(CRLWPRep *)self storage];
    if (v8 == v9)
    {
      uint64_t v11 = [(CRLWPRep *)self layout];
      if ([v11 isInTopLevelContainerForEditing])
      {
        uint64_t v12 = [(CRLCanvasRep *)self parentRep];
        unsigned int v10 = [v12 isLocked] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)p_canRepBeginEditingOnDoubleTap
{
  return 1;
}

- (id)smartFieldAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLWPRep *)self layout];
  if (![v6 layoutIsValid])
  {
    unsigned int v10 = 0;
    goto LABEL_5;
  }
  id v7 = [(CRLWPRep *)self storage];
  unsigned int v8 = [v7 hasSmartFields];

  if (v8)
  {
    double v6 = [(CRLWPRep *)self layout];
    unsigned __int8 v9 = [v6 columns];
    unsigned int v10 = +[CRLWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](CRLWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 6, v9, x, y);

LABEL_5:
    goto LABEL_7;
  }
  unsigned int v10 = 0;
LABEL_7:

  return v10;
}

- (void)p_updateSecondaryHighlightLayer
{
  if (self->_secondaryHighlightLayer)
  {
    NSUInteger location = self->_secondaryHighlightRange.location;
    NSUInteger length = self->_secondaryHighlightRange.length;
    uint64_t v5 = [(CRLWPRep *)self columns];
    double v6 = +[CRLWPColumn pathForHighlightWithRange:columnArray:pathStyle:](CRLWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", location, length, v5, self->_secondaryHighlightPathStyle);

    [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
    [v6 transformUsingAffineTransform:&v8];
    id v7 = v6;
    -[CAShapeLayer setPath:](self->_secondaryHighlightLayer, "setPath:", [v7 CGPath]);
  }
}

- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5
{
  p_secondaryHighlightRange = &self->_secondaryHighlightRange;
  if (a3.location != self->_secondaryHighlightRange.location || a3.length != self->_secondaryHighlightRange.length)
  {
    NSUInteger length = a3.length;
    if (a3.length)
    {
      NSUInteger location = a3.location;
      secondaryHighlightLayer = self->_secondaryHighlightLayer;
      if (!secondaryHighlightLayer)
      {
        id v13 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        double v14 = self->_secondaryHighlightLayer;
        self->_secondaryHighlightLayer = v13;

        [(CAShapeLayer *)self->_secondaryHighlightLayer setEdgeAntialiasingMask:0];
        [(CAShapeLayer *)self->_secondaryHighlightLayer setDelegate:self];
        secondaryHighlightLayer = self->_secondaryHighlightLayer;
      }
      [(CAShapeLayer *)secondaryHighlightLayer setFillColor:a4];
      p_secondaryHighlightRange->NSUInteger location = location;
      p_secondaryHighlightRange->NSUInteger length = length;
      self->_secondaryHighlightPathStyle = a5;
    }
    else
    {
      p_secondaryHighlightRange->NSUInteger location = 0;
      self->_secondaryHighlightRange.NSUInteger length = 0;
      -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", 0, 0, a4, *(void *)&a5);
      [(CAShapeLayer *)self->_secondaryHighlightLayer removeFromSuperlayer];
      double v15 = self->_secondaryHighlightLayer;
      self->_secondaryHighlightLayer = 0;
    }
    id v16 = [(CRLWPRep *)self layout];
    [v16 invalidate];
  }
}

- (void)clearSecondaryHighlight
{
}

- (void)setHighlightedHyperlinkField:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = [v4 range];
    uint64_t v7 = v6;
  }
  else
  {
    id v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = +[CRLColor colorWithWhite:0.300000012 alpha:0.469999999];
  -[CRLWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v5, v7, [v8 CGColor], 2);
}

- (id)closestColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CRLWPRep *)self layout];
  uint64_t v6 = [v5 columns];
  uint64_t v7 = +[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v6, 1, 1, x, y);

  return v7;
}

- (id)columnForCharIndex:(unint64_t)a3
{
  id v5 = [(CRLWPRep *)self storage];
  uint64_t v6 = (char *)[v5 range];
  uint64_t v8 = v7;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [(CRLWPRep *)self layout];
  unsigned int v10 = [v9 columns];

  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    id v13 = &v6[v8];
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = (char *)[v15 range];
        if ((a3 < (unint64_t)v16 || a3 - (unint64_t)v16 >= v17)
          && (&v16[v17] != (char *)a3 || v13 != (char *)a3))
        {
          continue;
        }
        id v20 = v15;
        goto LABEL_20;
      }
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v20 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v20 = 0;
  }
LABEL_20:

  return v20;
}

- (BOOL)isBeingEdited
{
  double v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v7 = [v6 editorController];
  uint64_t v8 = [v7 textInputEditor];
  id v9 = sub_1002469D0(v5, v8);

  if (v9)
  {
    unsigned int v10 = [v9 storage];
    id v11 = [(CRLWPRep *)self storage];
    BOOL v12 = v10 == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isDropTarget
{
  if ([(CRLCanvasRep *)self shouldShowDragAndDropHighlight]) {
    return 1;
  }
  unsigned int v4 = [(CRLWPRep *)self dropSelection];
  unsigned __int8 v3 = [v4 isValid];

  return v3;
}

- (CGSize)hitTestingSlop
{
  uint64_t v2 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v2 convertBoundsToUnscaledSize:20.0, 2.0];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  if ([(CRLWPRep *)self isBeingEdited])
  {
    uint64_t v3 = objc_opt_class();
    double v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    double v5 = [v4 editorController];
    double v6 = [v5 textInputEditor];
    double v7 = sub_1002469D0(v3, v6);
  }
  else
  {
    double v7 = 0;
  }

  return (_TtC8Freeform11CRLWPEditor *)v7;
}

- (void)handleFadeOutForZoom
{
  [(CRLWPRepCaretController *)self->_caretController setSuppressCaret:1];
  [(CRLWPRep *)self hideCaretLayer];
  [(CRLWPRep *)self p_hideCollaboratorCursorLayer];

  [(CRLWPRep *)self setShouldIgnoreFirstRequestToShowEditMenu:1];
}

- (void)handleFadeInForZoom
{
  [(CRLWPRep *)self p_updateSecondaryHighlightLayer];
  [(CRLWPRepCaretController *)self->_caretController setSuppressCaret:0];
  if (!self->_caretAnimationDisabled) {
    self->_selectionChanged = 1;
  }
  [(CRLWPRep *)self p_updateForCurrentSelectionWithFlags:0];
  [(CRLWPRep *)self setShouldIgnoreFirstRequestToShowEditMenu:1];
  [(CRLWPRep *)self refreshEditMenu];

  [(CRLWPRep *)self p_showCollaboratorCursorLayer];
}

- (void)gesturesDidEnd:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:@"CRLTextGesturesTerminated"];
  sub_100246AC8(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if ([v12 inputType]) {
    [(CRLWPRep *)self refreshEditMenu];
  }
}

- (void)p_addLiftAnimationToFloatingCursor
{
}

- (void)p_addDropAnimationToFloatingCursorWithEndingRep:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLWPRep *)self floatingCaretLayer];
  [v5 position];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(CRLWPRep *)self selection];
  id v11 = [v10 start];
  id v12 = [(CRLWPRep *)self selection];
  [v4 caretRectForCharIndex:v11 caretAffinity:[v12 caretAffinity]];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v43.origin.CGFloat x = v14;
  v43.origin.CGFloat y = v16;
  v43.size.CGFloat width = v18;
  v43.size.CGFloat height = v20;
  if (!CGRectIsNull(v43))
  {
    [v4 convertNaturalRectToUnscaledCanvas:v14, v16, v18, v20];
    -[CRLCanvasRep convertNaturalRectFromUnscaledCanvas:](self, "convertNaturalRectFromUnscaledCanvas:");
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
    v44.origin.CGFloat x = v22;
    v44.origin.CGFloat y = v24;
    v44.size.CGFloat width = v26;
    v44.size.CGFloat height = v28;
    CGRect v45 = CGRectApplyAffineTransform(v44, &v41);
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;
    double MidX = CGRectGetMidX(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v46);
    +[CATransaction begin];
    CGFloat v35 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
    [v35 setDelegate:self];
    CGFloat v36 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, v9);
    v42[0] = v36;
    CGFloat v37 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", MidX, MidY);
    v42[1] = v37;
    CGFloat v38 = +[NSArray arrayWithObjects:v42 count:2];
    [v35 setValues:v38];

    [v35 setRemovedOnCompletion:0];
    [v35 setDuration:0.25];
    CGAffineTransform v39 = [(CRLWPRep *)self floatingCaretLayer];
    [v39 addAnimation:v35 forKey:@"dropAnimation"];

    objc_super v40 = [(CRLWPRep *)self floatingCaretLayer];
    [v40 setPosition:MidX, MidY];

    +[CATransaction commit];
  }
}

- (BOOL)ghostCaretAppearance
{
  uint64_t v2 = [(CRLWPRep *)self overrideCaretColor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setGhostCaretAppearance:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CRLWPRepHelper *)self->_repHelper colorForGhostCaret];
    [(CRLWPRep *)self setOverrideCaretColor:v4];
  }
  else
  {
    [(CRLWPRep *)self setOverrideCaretColor:0];
  }

  [(CRLWPRep *)self p_updateCaretLayerColor];
}

- (void)updateCaretColorForFloatingCursorInFlight
{
}

- (void)updateCaretColorForFinishedFloatingCursor
{
}

- (void)suppressCaret:(BOOL)a3
{
}

- (void)textInteractionCaretBeganFloating
{
  [(CRLWPRep *)self suppressCaret:0];
  [(CRLWPRepCaretController *)self->_caretController showCaretLayerStartingAnimation];

  [(CRLWPRep *)self updateCaretColorForFloatingCursorInFlight];
}

- (void)textInteractionCaretEndedFloating
{
  [(CRLWPRep *)self updateCaretColorForFinishedFloatingCursor];
  [(CRLWPRep *)self suppressCaret:1];
  caretController = self->_caretController;

  [(CRLWPRepCaretController *)caretController hideCaretLayer];
}

- (void)textInteractionCaretDragStopped
{
  [(CRLWPRep *)self suppressCaret:0];
  [(CRLWPRepCaretController *)self->_caretController showCaretLayerStartingAnimation];
  [(CRLWPRep *)self updateCaretColorForFinishedFloatingCursor];

  [(CRLWPRep *)self enableCaretAnimation];
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = +[CRLColor colorWithRed:0.26 green:0.42 blue:0.95 alpha:1.0];
  id v9 = [v8 CGColor];

  uint64_t v10 = [(CRLWPRep *)self p_caretLayerWithZPosition:1.0];
  [(CRLWPRep *)self setFloatingCaretLayer:v10];

  id v11 = [(CRLWPRep *)self floatingCaretLayer];
  [v11 setBackgroundColor:v9];

  id v12 = [(CRLWPRep *)self floatingCaretLayer];
  -[CRLWPRep p_positionAndSizeFloatingCaret:atPoint:](self, "p_positionAndSizeFloatingCaret:atPoint:", v12, x, y);

  repHelper = self->_repHelper;
  double v14 = [(CRLWPRep *)self floatingCaretLayer];
  [(CRLWPRepHelper *)repHelper cornerRadiusForFloatingCaret:v14];
  double v16 = v15;
  double v17 = [(CRLWPRep *)self floatingCaretLayer];
  [v17 setCornerRadius:v16];

  [(CRLWPRep *)self updateCaretColorForFloatingCursorInFlight];
  double v18 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v18 invalidateOverlayLayersForRep:self];

  if (v4)
  {
    [(CRLWPRep *)self p_addLiftAnimationToFloatingCursor];
  }
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLWPRep *)self floatingCaretLayer];
  [(CRLWPRep *)self p_positionAndSizeFloatingCaret:x atPoint:y];
}

- (void)endFloatingCursorWithRepForAnimation:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(CRLWPRep *)self floatingCaretLayer];

  if (v4)
  {
    [(CRLWPRep *)self updateCaretColorForFinishedFloatingCursor];
    if (v8
      && ([(CRLWPRep *)self selection],
          double v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 isInsertionPoint],
          v5,
          v6))
    {
      [(CRLWPRep *)self p_addDropAnimationToFloatingCursorWithEndingRep:v8];
    }
    else
    {
      double v7 = [(CRLWPRep *)self floatingCaretLayer];
      [v7 removeFromSuperlayer];

      [(CRLWPRep *)self setFloatingCaretLayer:0];
    }
    [(CRLWPRep *)self enableCaretAnimation];
  }
}

- (BOOL)selectionChangeWasLocal
{
  return (self->_newSelectionFlags & 0x800) == 0 && self->_selectionChanged;
}

- (BOOL)caretBlinks
{
  return [(CRLWPRepCaretController *)self->_caretController caretAnimates];
}

- (void)setCaretBlinks:(BOOL)a3
{
}

- (void)disableCaretAnimation
{
}

- (void)enableCaretAnimation
{
}

- (void)willEnterForeground
{
}

- (void)didEnterBackground
{
}

- (void)pulseCaret
{
  caretPulseController = self->_caretPulseController;
  if (caretPulseController)
  {
    self->_caretPulseController = 0;
  }
  Mutable = CGPathCreateMutable();
  [(CRLWPRep *)self caretRect];
  double y = v25.origin.y;
  double height = v25.size.height;
  v25.size.CGFloat width = 2.0;
  v25.origin.CGFloat x = v8 + -1.0;
  CGFloat x = v25.origin.x;
  CGPathAddRect(Mutable, 0, v25);
  LOWORD(v20) = 0;
  id v9 = -[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", 0, 1, 1, 1, 1, 0, x, y, 2.0, height, v20);
  uint64_t v10 = [[CRLPulseAnimationController alloc] initWithDelegate:self];
  id v11 = self->_caretPulseController;
  self->_caretPulseController = v10;

  [(CRLPulseAnimationController *)self->_caretPulseController setAutohide:1];
  id v12 = [(CRLWPRep *)self layout];
  double v13 = v12;
  if (v12)
  {
    [v12 transformInRoot];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
  }
  double v14 = self->_caretPulseController;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  [(CRLHighlightController *)v14 setTransform:v21];

  double v15 = [(CRLCanvasRep *)self canvas];
  [v15 viewScale];
  -[CRLHighlightController setViewScale:](self->_caretPulseController, "setViewScale:");

  [(CRLPulseAnimationController *)self->_caretPulseController setDuration:0.05];
  [(CRLPulseAnimationController *)self->_caretPulseController setPulseOffset:4.0];
  double v16 = self->_caretPulseController;
  double v17 = [(CRLCanvasRep *)self canvas];
  [v17 contentsScale];
  [(CRLHighlightController *)v16 createLayerWithZOrder:8.0 contentsScaleForLayers:v18];

  [(CRLHighlightController *)self->_caretPulseController buildLayersForPath:Mutable withImage:v9];
  [(CRLPulseAnimationController *)self->_caretPulseController startAnimating];
  CGPathRelease(Mutable);
  double v19 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v19 canvasInvalidatedForRep:self];
}

- (BOOL)containsStartOfSelection:(id)a3
{
  id v4 = a3;
  if ([v4 isInsertionPoint])
  {
    double v5 = (char *)[v4 start];
    unsigned int v6 = (char *)[(CRLWPRep *)self range];
    if (v5 == v6)
    {
      unsigned __int8 v8 = [v4 caretAffinity] == 0;
      goto LABEL_20;
    }
    double v13 = &v6[v7];
    if (v6 < v5 && v5 < v13
      || v5 == v13
      && ([v4 caretAffinity] == (id)1
       || ([(CRLWPRep *)self storage],
           double v14 = objc_claimAutoreleasedReturnValue(),
           double v15 = (char *)[v14 length],
           v14,
           v5 == v15)))
    {
      unsigned __int8 v8 = 1;
      goto LABEL_20;
    }
    if (v13 < v5)
    {
      unsigned __int8 v8 = [(CRLWPRep *)self isOverflowing];
      goto LABEL_20;
    }
LABEL_19:
    unsigned __int8 v8 = 0;
    goto LABEL_20;
  }
  if (![v4 isRange]) {
    goto LABEL_19;
  }
  id v9 = [v4 start];
  uint64_t v10 = [(CRLWPRep *)self range];
  unsigned __int8 v8 = v9 >= v10 && v9 - v10 < v11;
LABEL_20:

  return v8;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [a3 range];
  if (v5 && (unint64_t)v7 <= a4) {
    return (unint64_t)v7 + v8 > a4;
  }
  BOOL v10 = (unint64_t)v7 + v8 >= a4;
  if ((unint64_t)v7 >= a4) {
    BOOL v10 = 0;
  }
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CRLWPRep *)self p_doesRep:self containCharIndex:a3 isStart:a4])
  {
    id v7 = self;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(CRLWPRep *)self siblings];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([(CRLWPRep *)self p_doesRep:v12 containCharIndex:a3 isStart:v4])
          {
            id v7 = v12;

            goto LABEL_13;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)siblings
{
  id v3 = +[NSMutableSet set];
  BOOL v4 = [(CRLWPRep *)self storage];
  unsigned int v5 = [v4 wpKind];

  if (!v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unsigned int v6 = [(CRLCanvasRep *)self parentRep];
    id v7 = [v6 childReps];

    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          unint64_t v11 = *(CRLWPRep **)(*((void *)&v18 + 1) + 8 * i);
          if (v11 != self)
          {
            uint64_t v12 = objc_opt_class();
            double v13 = sub_1002469D0(v12, v11);
            long long v14 = [v13 storage];
            long long v15 = [(CRLWPRep *)self storage];
            BOOL v16 = v14 == v15;

            if (v16) {
              [v3 addObject:v13];
            }
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }

  return v3;
}

- (id)repForDragging
{
  if ([(CRLWPRep *)self isBeingEdited])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLWPRep;
    id v3 = [(CRLCanvasRep *)&v5 repForDragging];
  }

  return v3;
}

- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v9 = [v8 layerHost];
  uint64_t v10 = [v9 asiOSCVC];
  unsigned int v11 = [v10 isCurrentlyInQuickSelectMode];

  if (v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLWPRep;
    return -[CRLCanvasRep shouldPreventMarqueeInitiationAtPoint:withTouchType:](&v15, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", a4, x, y);
  }
  else
  {
    double v13 = [(CRLWPRep *)self storage];
    if ([v13 wpKind]) {
      BOOL v12 = [(CRLWPRep *)self isBeingEdited];
    }
    else {
      BOOL v12 = 1;
    }
  }
  return v12;
}

- (id)hyperlinkContainerRep
{
  id v3 = [(CRLCanvasRep *)self parentRep];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLWPRep;
    objc_super v5 = [(CRLCanvasRep *)&v7 repForSelecting];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  objc_super v7 = [(CRLCanvasRep *)self parentRep];
  id v8 = sub_1002469D0(v6, v7);

  LOBYTE(v7) = [v8 wantsContextMenuWhenEditingDisabledAtPoint:x, y];
  return (char)v7;
}

- (CRLWPLayoutTarget)layout
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPRep;
  uint64_t v2 = [(CRLCanvasRep *)&v11 layout];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v9 = sub_100246E2C(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);

  return (CRLWPLayoutTarget *)v9;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CRLWPRep *)self layout];
  uint64_t v5 = sub_1002469D0(v3, v4);

  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v5) {
    [v5 storage];
  }
  else {
  uint64_t v7 = [(CRLCanvasRep *)self info];
  }
  uint64_t v8 = sub_10024715C(v6, v7);

  return (_TtC8Freeform12CRLWPStorage *)v8;
}

- (NSArray)columns
{
  uint64_t v2 = [(CRLWPRep *)self layout];
  uint64_t v3 = [v2 columns];

  return (NSArray *)v3;
}

- (CRLWPSelection)selection
{
  uint64_t v2 = [(CRLWPRep *)self textEditor];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 selection];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (CRLWPSelection *)v4;
}

- (void)addKnobsToArray:(id)a3
{
  id v26 = a3;
  uint64_t v4 = [(CRLWPRep *)self layout];
  unsigned int v5 = [v4 layoutIsValid];

  if (v5 && [(CRLWPRep *)self shouldCreateTextKnobs])
  {
    CGRect v25 = [(CRLWPRep *)self textEditor];
    unsigned __int8 v6 = [v25 wantsParagraphMode];
    unsigned __int8 v7 = [v25 knobTracking];
    long long v24 = [(CRLWPRep *)self selection];
    if ([v24 headCharIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
      id v27 = [v24 start];
    }
    else {
      id v27 = [v24 headCharIndex];
    }
    uint64_t v8 = [v24 tailCharIndex];
    if (v8 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [v24 end];
      if (v8)
      {
        uint64_t v9 = [(CRLWPRep *)self storage];
        uint64_t v8 = (unsigned char *)sub_1001CAB34((unint64_t)v8, v9);
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [(CRLWPRep *)self columns];
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      char v13 = v6 ^ 1;
      if (!v25) {
        char v13 = 1;
      }
      char v14 = v13 | v7 ^ 1;
      objc_super v15 = v10;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v18 = [(CRLWPRep *)self selection];
          if (objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", v27, 11, objc_msgSend(v18, "type")))
          {
            if (v14)
            {
            }
            else
            {
              BOOL v19 = [v25 knobTag] == (id)11;

              if (!v19) {
                goto LABEL_22;
              }
            }
            long long v18 = [(CRLWPRep *)self knobClassWithTag:11];
            [v26 addObject:v18];
          }

LABEL_22:
          uint64_t v10 = v15;
          long long v20 = [v17 range];
          BOOL v22 = v8 < v20 || v8 - v20 >= v21;
          if (!v22 && ((v14 & 1) != 0 || [v25 knobTag] == (id)10))
          {
            long long v23 = [(CRLWPRep *)self knobClassWithTag:10];
            [v26 addObject:v23];

            uint64_t v10 = v15;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }
  }
}

- (id)knobClassWithTag:(unint64_t)a3
{
  unsigned int v5 = [(CRLWPRep *)self knobPositioner];
  [v5 knobRadius];
  double v7 = v6;
  uint64_t v8 = [(CRLCanvasRep *)self canvas];
  [v8 viewScale];
  double v10 = v7 * v9;

  id v11 = -[CRLWPTextKnob initWithType:position:radius:tag:onRep:]([CRLWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 2, a3, self, CGPointZero.x, CGPointZero.y, v10);

  return v11;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        double v9 = [(CRLWPRep *)self selection];
        [(CRLWPRep *)self knobCenterForSelection:v9 knob:v8];
        [v8 setPosition:];

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)shouldCreateSelectionKnobs
{
  return 0;
}

- (BOOL)shouldCreateLockedKnobs
{
  return 0;
}

- (BOOL)shouldCreateTextKnobs
{
  if (![(CRLWPRep *)self isBeingEdited]
    || ![(CRLWPRep *)self p_canShowSelectionAndCaretLayers])
  {
    return 0;
  }
  uint64_t v3 = [(CRLWPRep *)self knobPositioner];
  id v4 = [(CRLWPRep *)self selection];
  id v5 = [(CRLWPRep *)self storage];
  unsigned __int8 v6 = [v3 shouldCreateKnobsForSelection:v4 inStorage:v5];

  return v6;
}

- (CGRect)labelRectForCharIndex:(unint64_t)a3
{
  id v4 = [(CRLWPRep *)self columns];
  +[CRLWPColumn labelRectForCharIndex:a3 withColumns:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v5 = [(CRLWPRep *)self columns];
  +[CRLWPColumn columnRectForRange:withColumns:](CRLWPColumn, "columnRectForRange:withColumns:", location, length, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v11 = [(CRLWPRep *)self columns];
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16.NSUInteger location = (NSUInteger)[v15 range];
        if (length) {
          BOOL v17 = v16.length == 0;
        }
        else {
          BOOL v17 = 1;
        }
        int v18 = v17;
        v34.NSUInteger location = location;
        v34.NSUInteger length = length;
        NSUInteger v20 = sub_1002093DC(v16, v34, v18);
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v15 glyphRectForRange:v20 includingLabel:v19];
          v38.origin.CGFloat x = v21;
          v38.origin.CGFloat y = v22;
          v38.size.CGFloat width = v23;
          v38.size.CGFloat height = v24;
          v35.origin.CGFloat x = x;
          v35.origin.CGFloat y = y;
          v35.size.CGFloat width = width;
          v35.size.CGFloat height = height;
          CGRect v36 = CGRectUnion(v35, v38);
          CGFloat x = v36.origin.x;
          CGFloat y = v36.origin.y;
          CGFloat width = v36.size.width;
          CGFloat height = v36.size.height;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v7 = [(CRLWPRep *)self columns];
  unsigned int v8 = 0;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13.NSUInteger location = (NSUInteger)[v12 range];
        if (length) {
          BOOL v14 = v13.length == 0;
        }
        else {
          BOOL v14 = 1;
        }
        int v15 = v14;
        v25.NSUInteger location = location;
        v25.NSUInteger length = length;
        NSUInteger v17 = sub_1002093DC(v13, v25, v15);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v18 = [v12 fontTraitsForRange:v17 includingLabel:v16 fontTraits:v4];
          if (v8)
          {
            if (v8 != v18) {
              unsigned int v8 = (v18 | v8) & 0xFFFFFFF;
            }
          }
          else
          {
            unsigned int v8 = v18;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v8;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(CRLWPRep *)self columns];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 range];
        if (a3 >= (unint64_t)v9 && a3 - (unint64_t)v9 < v10)
        {
          unint64_t v12 = (unint64_t)[v8 glyphCountForRubyFieldAtCharIndex:a3];
          goto LABEL_14;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v12;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v11 = [(CRLWPRep *)self columns];
  id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 range];
        if (a3 >= (unint64_t)v16 && a3 - (unint64_t)v16 < v17)
        {
          [v15 glyphRectForRubyFieldAtCharIndex:a3 glyphRange:location length];
          CGFloat x = v19;
          CGFloat y = v20;
          CGFloat width = v21;
          CGFloat height = v22;
          goto LABEL_13;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }
LABEL_13:

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0;
  if (self->_spellChecker)
  {
    if ([(CRLWPRep *)self p_spellCheckingEnabled])
    {
      NSUInteger v3 = (NSUInteger)[(CRLWPStorageSpellChecker *)self->_spellChecker rangeOfMisspelledWordAtCharIndex:a3];
      NSUInteger v4 = v7;
      v12.NSUInteger location = v3;
      v12.NSUInteger length = v7;
      sub_100209474(self->_suppressedMisspellingRange, v12);
      if (v8)
      {
        NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
        NSUInteger v4 = 0;
      }
    }
  }
  NSUInteger v9 = v3;
  NSUInteger v10 = v4;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v9 = [(CRLWPRep *)self textIsVertical];
  if (v9) {
    a4 = fmod(a4 + 270.0, 360.0);
  }
  if ((a4 <= 45.0 || a4 >= 135.0) && (a4 <= 225.0 || a4 >= 315.0))
  {
    long double v10 = width;
    long double v11 = height;
  }
  else
  {
    long double v10 = height;
    long double v11 = width;
  }
  double v12 = hypot(v11, v10);
  if (v9) {
    double v13 = v12;
  }
  else {
    double v13 = v10;
  }
  if (v9) {
    double v14 = v11;
  }
  else {
    double v14 = v12;
  }
  double v15 = -0.0;
  if (a4 <= 180.0) {
    double v16 = -0.0;
  }
  else {
    double v16 = width;
  }
  double v17 = x + v16;
  if (a4 < 270.0 && a4 > 90.0) {
    double v15 = height;
  }
  double v19 = y + v15;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v19;
  result.origin.double x = v17;
  return result;
}

- (BOOL)p_allowCaretForSelection:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 range];
  uint64_t v6 = [(CRLWPRep *)self storage];
  unsigned __int8 v7 = [v6 hasMarkedText];

  if ((v7 & 1) == 0)
  {
    if (![v4 isInsertionPoint]
      || ((unsigned int v9 = (char *)[(CRLWPRep *)self range], v5 < v9) || v5 - v9 >= v10)
      && (long double v11 = (char *)[(CRLWPRep *)self range], v5 != &v11[v12])
      || v5 == -[CRLWPRep range](self, "range") && ([v4 isAtEndOfLine] & 1) != 0)
    {
      BOOL v8 = 0;
      goto LABEL_10;
    }
    double v14 = (char *)[(CRLWPRep *)self range];
    if (v5 == &v14[v15] && ([v4 isAtEndOfLine] & 1) == 0)
    {
      double v16 = [(CRLWPRep *)self storage];
      [v16 length];
    }
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (void)p_updateLayersForInsertionPointSelection:(id)a3
{
  id v4 = a3;
  [(CRLWPRep *)self p_setSelectionLineLayersHidden:1];
  [(CRLWPRep *)self p_hideSelectionHighlightLayer];
  [(CRLWPRep *)self p_hideSelectionParagraphBorderLayer];
  id v5 = [(CRLWPRep *)self textEditor];
  if (![(CRLWPRep *)self p_isRedesignedTextCursorEnabled])
  {
    if ([v5 wantsCaret])
    {
      uint64_t v6 = [(CRLCanvasRep *)self interactiveCanvasController];
      unsigned __int8 v7 = [v6 layerHost];
      [v7 isInFocusedContainer];
    }
    if ([(CRLWPRep *)self p_allowCaretForSelection:v4])
    {
      BOOL v8 = [v5 editorHelper];
      id v9 = [v8 calculateVisualRunsFromSelection:v4 updateControllerSelection:1];

      if (-[CRLWPRep p_positionCaretLayer:forSelection:layerRelative:](self, "p_positionCaretLayer:forSelection:layerRelative:", self->_caretLayer)&& [(CRLWPRep *)self p_canShowSelectionAndCaretLayers])
      {
        [(CRLWPRepCaretController *)self->_caretController showCaretLayerStartingAnimation];
        goto LABEL_10;
      }
      id v4 = v9;
    }
  }
  [(CRLWPRepCaretController *)self->_caretController stopCaretLayerAnimationHidingCaret:1];
  id v9 = v4;
LABEL_10:
}

- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 prepareBackground:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 forCaret:(BOOL)a8 drawSelection:(id)a9 suppressInvisibles:(BOOL)a10 suppressChildReps:(BOOL)a11
{
  BOOL v11 = a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a9;
  memset(&v41, 0, sizeof(v41));
  [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
  CGAffineTransform v40 = v41;
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGRect v44 = CGRectApplyAffineTransform(v43, &v40);
  CGRect v45 = CGRectIntegral(v44);
  CGRect v46 = CGRectInset(v45, -0.0, -0.0);
  double v19 = v46.origin.x;
  double v20 = v46.origin.y;
  double v21 = v46.size.width;
  double v22 = v46.size.height;
  +[UIScreen crl_screenScale];
  CGFloat v24 = v23;
  double v25 = sub_1000646A4(v21, v22, v23);
  long long v27 = sub_100455AA8(11, v25, v26);
  long long v28 = v27;
  if (v27)
  {
    CGContextScaleCTM(v27, v24, v24);
    CGContextTranslateCTM(v28, -v19, -v20);
    [(CRLCanvasRep *)self setupForDrawingInLayer:0 context:v28];
    CGContextSetShouldAntialias(v28, 1);
    if (v18 || !a5)
    {
      CGContextSaveGState(v28);
      if (v11) {
        uint64_t v29 = 3;
      }
      else {
        uint64_t v29 = 33;
      }
      LOBYTE(v39) = a10;
      -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, v28, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v29, v39);
      CGContextRestoreGState(v28);
    }
    [(CRLWPRep *)self didDrawInLayer:0 context:v28];
    Image = CGBitmapContextCreateImage(v28);
    if (Image)
    {
      long long v31 = +[CRLImage imageWithCGImage:Image scale:0 orientation:v24];
      CGImageRelease(Image);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4C58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AA80C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4C78);
      }
      CGRect v35 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      CGRect v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:]");
      CGFloat v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 2479, 0, "invalid nil value for '%{public}s'", "ctxImage");

      long long v31 = 0;
    }
    CGContextRelease(v28);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4C18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA778();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4C38);
    }
    long long v32 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSRange v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:]");
    NSRange v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 2452, 0, "invalid nil value for '%{public}s'", "ctx");

    long long v31 = 0;
  }

  return v31;
}

- (id)p_imageForZeroLengthPath:(CGPath *)a3
{
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4C98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA9BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4CB8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]");
    unsigned __int8 v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2492, 0, "invalid nil value for '%{public}s'", "path");
  }
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(a3);
  CGFloat x = PathBoundingBox.origin.x;
  CGFloat y = PathBoundingBox.origin.y;
  CGFloat width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  memset(&v32, 0, sizeof(v32));
  [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
  CGAffineTransform v31 = v32;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectApplyAffineTransform(v35, &v31);
  CGRect v37 = CGRectIntegral(v36);
  double v12 = v37.origin.x;
  double v13 = v37.origin.y;
  double v14 = v37.size.width;
  double v15 = v37.size.height;
  +[UIScreen crl_screenScale];
  CGFloat v17 = v16;
  double v18 = sub_1000646A4(v14, v15, v16);
  double v20 = sub_100455AA8(11, v18, v19);
  double v21 = v20;
  if (v20)
  {
    CGContextScaleCTM(v20, v17, v17);
    CGContextTranslateCTM(v21, -v12, -v13);
    [(CRLCanvasRep *)self setupForDrawingInLayer:0 context:v21];
    CGContextSetShouldAntialias(v21, 1);
    CGContextBeginTransparencyLayer(v21, 0);
    CGContextEndTransparencyLayer(v21);
    [(CRLWPRep *)self didDrawInLayer:0 context:v21];
    Image = CGBitmapContextCreateImage(v21);
    if (Image)
    {
      double v23 = +[CRLImage imageWithCGImage:Image scale:0 orientation:v17];
      CGImageRelease(Image);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4D18);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AA928();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4D38);
      }
      long long v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      long long v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]");
      uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 2526, 0, "invalid nil value for '%{public}s'", "ctxImage");

      double v23 = 0;
    }
    CGContextRelease(v21);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4CD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA8A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4CF8);
    }
    CGFloat v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]");
    double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:2507 isFatal:0 description:"Nil context"];

    double v23 = 0;
  }

  return v23;
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7 suppressChildReps:(BOOL)a8 drawBackground:(BOOL)a9 inset:(double)a10
{
  BOOL v13 = a6;
  BOOL v14 = a5;
  id v17 = a3;
  double v18 = v17;
  uint64_t v51 = 0;
  double v52 = &v51;
  uint64_t v53 = 0x5012000000;
  objc_super v54 = sub_1003B6B14;
  double v55 = nullsub_43;
  double v56 = "";
  if (!v14) {
    goto LABEL_10;
  }
  if ([v17 type] == (id)7 && (unint64_t)objc_msgSend(v18, "visualRangeCount") >= 2)
  {
    double v19 = [v18 visualRanges];
    id v20 = [v19 rangeAtIndex:0];
    -[CRLWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v20, v21, 0);
    double v22 = v52;
    v52[6] = v23;
    v22[7] = v24;
    v22[8] = v25;
    v22[9] = v26;

    long long v27 = [v18 visualRanges];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1003B6B24;
    v50[3] = &unk_1014F4D60;
    v50[4] = self;
    v50[5] = &v51;
    [v27 enumerateRanges:v50];

    uint64_t v28 = v52[6];
    uint64_t v29 = v52[7];
    uint64_t v30 = v52[8];
    uint64_t v31 = v52[9];
  }
  else
  {
    id v32 = [v18 superRange];
    uint64_t v34 = v33;
    BOOL v35 = [v18 type] == (id)2 || (unint64_t)(v18 type) == (id)1;
    -[CRLWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v32, v34, v35);
    CGRect v36 = v52;
    v52[6] = v28;
    v36[7] = v29;
    v36[8] = v30;
    v36[9] = v31;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v28))
  {
    uint64_t v37 = v52[6];
    uint64_t v38 = v52[7];
    uint64_t v39 = v52[8];
    uint64_t v40 = v52[9];
    uint64_t v41 = 1;
  }
  else
  {
LABEL_10:
    [(CRLWPRep *)self rectForSelection:v18 includeRuby:0 includePaginatedAttachments:1];
    uint64_t v41 = 0;
    CGRect v42 = v52;
    v52[6] = v37;
    v42[7] = v38;
    v42[8] = v39;
    v42[9] = v40;
  }
  CGRect v58 = CGRectInset(*(CGRect *)&v37, a10, a10);
  CGRect v43 = v52;
  CGRect v44 = v52;
  *(CGRect *)(v52 + 6) = v58;
  CGRect v45 = v44 + 6;
  if (a4)
  {
    CGSize v46 = (CGSize)*((_OWORD *)v45 + 1);
    a4->CGPoint origin = *(CGPoint *)v45;
    a4->CGSize size = v46;
    CGRect v58 = *(CGRect *)(v43 + 6);
  }
  BYTE1(v49) = a8;
  LOBYTE(v49) = a7;
  CGAffineTransform v47 = -[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", v41, 0, a9, v13, 0, v18, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height, v49);
  _Block_object_dispose(&v51, 8);

  return v47;
}

- (id)textImageForRect:(CGRect)a3
{
  LOWORD(v4) = 0;
  return -[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", 0, 0, 1, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v4);
}

- (BOOL)isOverflowing
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CRLWPRep *)self layout];
  id v5 = sub_1002469D0(v3, v4);

  LOBYTE(v4) = [v5 isOverflowing];
  return (char)v4;
}

- (BOOL)doesNeedDisplayOnEditingDidEnd
{
  return 0;
}

- (void)editingDidEndWithTextEditor:(id)a3
{
  [(CRLWPRep *)self p_hideSelectionLayers];
  if ([(CRLWPRep *)self doesNeedDisplayOnEditingDidEnd]) {
    [(CRLWPRep *)self setNeedsDisplay];
  }
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLCanvasRep *)self parentRep];
  sub_1002469D0(v4, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6) {
    [v6 setShadowOnChildrenDisabled:0];
  }
}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CRLWPHighlightArrayController *)self->_pulseArrayController pulsating])
  {
    id v5 = [(CRLWPRep *)self primaryFindResultSearchReference];

    if (v5)
    {
      if (!self->_updatingHighlights)
      {
        self->_updatingHighlights = 1;
        id v6 = [(CRLCanvasRep *)self canvas];
        [v6 viewScale];
        -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

        [(CRLWPHighlightArrayController *)self->_pulseArrayController reset];
        unsigned __int8 v7 = sub_1001D0764();
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1003B6E80;
        v8[3] = &unk_1014F4D88;
        v8[4] = self;
        void v8[5] = v7;
        [(CRLWPRep *)self prepareLayoutForImagingSearchReferencesAsActive:1 usingBlock:v8];
        CGColorRelease(v7);
        if (v3) {
          [(CRLWPHighlightArrayController *)self->_pulseArrayController startAnimating];
        }
        [(CRLWPRep *)self p_setSelectionLineLayersHidden:1];
        self->_updatingHighlights = 0;
      }
    }
  }
}

- (void)updateVisualSelection:(id)a3
{
  id v4 = a3;
  CGPathRelease(-[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:"));
}

- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6
{
  return [(CRLWPRep *)self p_newSelectionPathForSelection:a3 transform:a4 headPinRect:a5 tailPinRect:a6 markedText:0];
}

- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6 markedText:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v14 = 0;
  id v15 = [v12 type];
  if ([v12 headCharIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = [v12 tailCharIndex];
    if (v15 == (id)7 && v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v17 = [v12 headCharIndex];
      id v18 = [v12 tailCharIndex];
      if (v18 >= v17) {
        unint64_t v19 = (unint64_t)v17;
      }
      else {
        unint64_t v19 = (unint64_t)v18;
      }
      id v20 = [v12 headCharIndex];
      id v21 = [v12 tailCharIndex];
      if (v20 <= v21) {
        id v22 = v21;
      }
      else {
        id v22 = v20;
      }
      if (v19 <= (unint64_t)v22 + 1) {
        unint64_t v23 = (unint64_t)v22 + 1;
      }
      else {
        unint64_t v23 = v19;
      }
      if (v19 >= (unint64_t)v22 + 1) {
        uint64_t v13 = (uint64_t)v22 + 1;
      }
      else {
        uint64_t v13 = v19;
      }
      unint64_t v14 = v23 - v13;
    }
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = (uint64_t)[v12 range];
    unint64_t v14 = v24;
  }
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v83 = size;
  CGPoint v80 = origin;
  CGSize v81 = size;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0)
  {
    Mutable = 0;
  }
  else
  {
    memset(&m, 0, sizeof(m));
    if (a4)
    {
      long long v28 = *(_OWORD *)&a4->c;
      *(_OWORD *)&m.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&m.c = v28;
      *(_OWORD *)&m.tCGFloat x = *(_OWORD *)&a4->tx;
    }
    else
    {
      [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
    }
    uint64_t v29 = [(CRLCanvasRep *)self canvas];
    [v29 contentsScale];
    double v70 = v30;

    uint64_t v31 = [(CRLWPRep *)self columns];
    id v32 = &OBJC_METACLASS_____CRLUndoManagerAccessibility_super;
    +[CRLWPColumn populateHeadAndTailCharIndicesInSelection:v12 forColumns:v31];
    v69 = +[CRLWPColumn selectionRectsforColumns:v31 forSelection:v12];
    if ([v69 count])
    {
      Mutable = CGPathCreateMutable();
      unsigned int v33 = [(CRLWPRep *)self textIsVertical];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v34 = v69;
      id v35 = [v34 countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v76;
        if (v33) {
          double v37 = 0.0;
        }
        else {
          double v37 = 0.5;
        }
        if (v33) {
          double v38 = 0.5;
        }
        else {
          double v38 = 0.0;
        }
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(void *)v76 != v36) {
              objc_enumerationMutation(v34);
            }
            [*(id *)(*((void *)&v75 + 1) + 8 * i) CGRectValue];
            CGFloat v44 = v40;
            CGFloat v45 = v41;
            CGFloat v46 = v42;
            CGFloat v47 = v43;
            if (v7)
            {
              CGRect v85 = CGRectInset(*(CGRect *)&v40, v37, v38);
              CGFloat x = v85.origin.x;
              CGFloat y = v85.origin.y;
              CGFloat width = v85.size.width;
              CGFloat height = v85.size.height;
              CGAffineTransform v74 = m;
              if (sub_10007F964(&v74.a))
              {
                CGAffineTransform v73 = m;
                v86.origin.CGFloat x = x;
                v86.origin.CGFloat y = y;
                v86.size.CGFloat width = width;
                v86.size.CGFloat height = height;
                CGRect v87 = CGRectApplyAffineTransform(v86, &v73);
                v88.origin.CGFloat x = sub_100067584(v87.origin.x, v87.origin.y, v87.size.width, v87.size.height, v70);
                CGFloat v52 = v88.origin.x;
                CGFloat v53 = v88.origin.y;
                CGFloat v54 = v88.size.width;
                CGFloat v55 = v88.size.height;
                double v56 = CGRectGetHeight(v88);
                v89.origin.CGFloat x = v52;
                v89.origin.CGFloat y = v53;
                v89.size.CGFloat width = v54;
                v89.size.CGFloat height = v55;
                double v57 = CGRectGetWidth(v89);
                if (v56 * 0.5 <= 2.0) {
                  double v58 = v56 * 0.5;
                }
                else {
                  double v58 = 2.0;
                }
                double v59 = v57 * 0.5;
                if (v59 <= 2.0) {
                  double v60 = v59;
                }
                else {
                  double v60 = 2.0;
                }
                v90.origin.CGFloat x = v52;
                v90.origin.CGFloat y = v53;
                v90.size.CGFloat width = v54;
                v90.size.CGFloat height = v55;
                CGPathAddRoundedRect(Mutable, 0, v90, v60, v58);
              }
              else
              {
                v95.origin.CGFloat x = x;
                v95.origin.CGFloat y = y;
                v95.size.CGFloat width = width;
                v95.size.CGFloat height = height;
                double v61 = CGRectGetHeight(v95);
                v96.origin.CGFloat x = x;
                v96.origin.CGFloat y = y;
                v96.size.CGFloat width = width;
                v96.size.CGFloat height = height;
                double v62 = CGRectGetWidth(v96);
                if (v61 * 0.5 <= 2.0) {
                  double v63 = v61 * 0.5;
                }
                else {
                  double v63 = 2.0;
                }
                double v64 = v62 * 0.5;
                if (v64 <= 2.0) {
                  double v65 = v64;
                }
                else {
                  double v65 = 2.0;
                }
                v97.origin.CGFloat x = x;
                v97.origin.CGFloat y = y;
                v97.size.CGFloat width = width;
                v97.size.CGFloat height = height;
                CGPathAddRoundedRect(Mutable, &m, v97, v65, v63);
              }
            }
            else
            {
              CGAffineTransform v72 = m;
              if (sub_10007F964(&v72.a))
              {
                CGAffineTransform v71 = m;
                v91.origin.CGFloat x = v44;
                v91.origin.CGFloat y = v45;
                v91.size.CGFloat width = v46;
                v91.size.CGFloat height = v47;
                CGRect v92 = CGRectApplyAffineTransform(v91, &v71);
                v93.origin.CGFloat x = sub_100067584(v92.origin.x, v92.origin.y, v92.size.width, v92.size.height, v70);
                CGPathAddRect(Mutable, 0, v93);
              }
              else
              {
                v94.origin.CGFloat x = v44;
                v94.origin.CGFloat y = v45;
                v94.size.CGFloat width = v46;
                v94.size.CGFloat height = v47;
                CGPathAddRect(Mutable, &m, v94);
              }
            }
          }
          id v35 = [v34 countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v35);
      }

      id v32 = &OBJC_METACLASS_____CRLUndoManagerAccessibility_super;
    }
    else
    {
      Mutable = 0;
    }
    if ((unint64_t)a5 | (unint64_t)a6) {
      [&v32[32] calculateSelectionPinRectsForSelection:v12 inColumns:v31 outSelectionPinRect:&origin outSelectionTailPinRect:&v80];
    }
  }
  if (a5)
  {
    CGSize v66 = v83;
    a5->CGPoint origin = origin;
    a5->CGSize size = v66;
  }
  if (a6)
  {
    CGSize v67 = v81;
    a6->CGPoint origin = v80;
    a6->CGSize size = v67;
  }

  return Mutable;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  id v4 = a3;
  if ([v4 isRange])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(CRLWPRep *)self columns];
    id v6 = 0;
    id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) lineSelectionsForSelection:v4];
          if (v10)
          {
            if (!v6)
            {
              id v6 = +[NSMutableArray array];
            }
            [v6 addObjectsFromArray:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  id v4 = a3;
  id v5 = [v4 selection];
  [(CRLWPRep *)self p_lineSelectionsForSelection:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = 0;
  id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      unint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        if (!v7)
        {
          id v7 = +[NSMutableArray array];
        }
        id v12 = [v4 copy:v17];
        id v13 = [v11 range];
        [v12 setRange:v13, v14];
        [v7 addObject:v12];

        unint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = v7;
  return v15;
}

- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4 = sub_1000656DC(a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width + -1.0, a4.size.height + -1.0);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(CRLWPRep *)self p_canShowSelectionAndCaretLayers];
  [(CRLWPRep *)self hideCaretLayer];
  selectionLineLayers = (id *)self->_selectionLineLayers;
  if (!self->_selectionLineLayers[0]) {
    [(CRLWPRep *)self p_createSelectionLineLayers];
  }
  if (v4)
  {
    uint64_t v9 = +[CABasicAnimation animationWithKeyPath:@"path"];
    [v9 setDuration:0.100000001];
    [(CAShapeLayer *)self->_selectionHighlightLayer addAnimation:v9 forKey:@"selectionHighlightPathAnimation"];
    if ([(CRLWPRep *)self p_shouldDisplaySelectionControls])
    {
      [*selectionLineLayers addAnimation:v9 forKey:@"leftSelectionLinePositionAnimation"];
      [(CAShapeLayer *)self->_selectionLineLayers[1] addAnimation:v9 forKey:@"rightSelectionLinePositionAnimation"];
    }
  }
  CGSize size = CGRectNull.size;
  v29.CGPoint origin = CGRectNull.origin;
  v29.CGSize size = size;
  v28.CGPoint origin = v29.origin;
  v28.CGSize size = size;
  if (v7)
  {
    [v6 isVisual];
    BOOL v11 = [(CRLWPRep *)self p_newSelectionPathForSelection:v6 transform:0 headPinRect:&v29 tailPinRect:&v28];
    [(CRLWPRep *)self p_hideSelectionParagraphBorderLayer];
    selectionHighlightLayer = self->_selectionHighlightLayer;
    if (v11)
    {
      [(CAShapeLayer *)selectionHighlightLayer setPath:v11];
      [(CAShapeLayer *)self->_selectionHighlightLayer setHidden:0];
    }
    else
    {
      [(CAShapeLayer *)selectionHighlightLayer setHidden:1];
      [(CAShapeLayer *)self->_selectionHighlightLayer setPath:0];
    }
    CGPathRelease(0);
    CGPathRelease(v11);
    [(CRLWPRep *)self p_setSelectionHighlightColor];
  }
  else
  {
    [(CRLWPRep *)self p_hideSelectionParagraphBorderLayer];
    [(CAShapeLayer *)self->_selectionHighlightLayer setHidden:1];
    [(CAShapeLayer *)self->_selectionHighlightLayer setPath:0];
  }
  id v13 = [(CRLCanvasRep *)self canvas];
  [v13 viewScale];
  double v15 = v14;

  unsigned int v16 = [(CRLWPRep *)self textIsVertical];
  BOOL v17 = [v6 type] == (id)3 || [v6 type] == (id)5;
  if (([(CRLWPRep *)self p_shouldDisplaySelectionControls] & v7) == 1
    && ((IsEmptCGFloat y = CGRectIsEmpty(v29), v15 == 0.0) ? (v19 = 1) : (v19 = IsEmpty), ((v19 | v17) & 1) == 0))
  {
    double v21 = 1.0 / v15;
    if (v16)
    {
      double x = v29.origin.x;
      v29.size.CGFloat height = 2.0 / v15;
      v29.origin.CGFloat y = v29.origin.y - v21;
    }
    else
    {
      double x = v29.origin.x - v21;
      v29.size.CGFloat width = 2.0 / v15;
      v29.origin.double x = v29.origin.x - v21;
    }
    long long v20 = [(CRLCanvasRep *)self newPathInScaledCanvasFromNaturalRect:x];
    [*selectionLineLayers setHidden:0];
    [*selectionLineLayers setPath:v20];
  }
  else
  {
    [*selectionLineLayers setHidden:1];
    [*selectionLineLayers setPath:0];
    long long v20 = 0;
  }
  if (([(CRLWPRep *)self p_shouldDisplaySelectionControls] & v7) == 1
    && ((v23 = CGRectIsEmpty(v28), v15 == 0.0) ? (int v24 = 1) : (int v24 = v23), ((v24 | v17) & 1) == 0))
  {
    CGRect v26 = v28;
    if (v16)
    {
      v28.origin.CGFloat y = CGRectGetMaxY(v26) + -1.0 / v15;
      v28.size.CGFloat height = 2.0 / v15;
      double v27 = v28.origin.x;
    }
    else
    {
      double v27 = CGRectGetMaxX(v26) + -1.0 / v15;
      v28.origin.double x = v27;
      v28.size.CGFloat width = 2.0 / v15;
    }
    uint64_t v25 = -[CRLCanvasRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", v27, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size, *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size);
    [selectionLineLayers[1] setHidden:0];
    [selectionLineLayers[1] setPath:v25];
  }
  else
  {
    [(CAShapeLayer *)self->_selectionLineLayers[1] setHidden:1];
    [(CAShapeLayer *)self->_selectionLineLayers[1] setPath:0];
    uint64_t v25 = 0;
  }
  CGPathRelease(v20);
  CGPathRelease(v25);
}

- (BOOL)p_canShowSelectionAndCaretLayers
{
  BOOL v3 = [(CRLWPRep *)self selection];
  unsigned int v4 = [v3 isRange];

  if (v4)
  {
    double v5 = [(CRLWPRep *)self selection];
    id v6 = [v5 range];
    NSUInteger v8 = v7;

    v18.NSUInteger location = (NSUInteger)[(CRLWPRep *)self range];
    v19.NSUInteger location = (NSUInteger)v6;
    v19.NSUInteger length = v8;
    NSRange v9 = NSIntersectionRange(v18, v19);
    if (self->_secondaryHighlightLayer) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v9.length == 0;
    }
    if (!v10) {
      goto LABEL_6;
    }
    return 0;
  }
  if (self->_secondaryHighlightLayer) {
    return 0;
  }
LABEL_6:
  BOOL v11 = [(CRLWPRep *)self selection];
  id v12 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v13 = [v12 editorController];
  double v14 = [v13 selectionPath];
  double v15 = [v14 mostSpecificSelectionOfClass:0];
  BOOL v16 = v11 == v15;

  return v16;
}

- (void)p_hideSelectionLayers
{
  [(CRLWPRep *)self hideCaretLayer];
  [(CRLWPRep *)self p_setSelectionLineLayersHidden:1];
  [(CRLWPRep *)self p_hideSelectionHighlightLayer];
  [(CRLWPRep *)self p_hideSelectionParagraphBorderLayer];

  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v10 = [(CRLWPRep *)self columns];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)v13) erasableRectForSelectionRange:location length:length];
        v26.origin.double x = v14;
        v26.origin.double y = v15;
        v26.size.double width = v16;
        v26.size.double height = v17;
        v23.origin.double x = x;
        v23.origin.double y = y;
        v23.size.double width = width;
        v23.size.double height = height;
        CGRect v24 = CGRectUnion(v23, v26);
        double x = v24.origin.x;
        double y = v24.origin.y;
        double width = v24.size.width;
        double height = v24.size.height;
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  if (!CGRectIsEmpty(v25)) {
    -[CRLWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", x, y, width, height);
  }
}

- (void)i_spellCheckerWordsDidChange
{
  if (self->_spellChecker && [(CRLWPRep *)self p_spellCheckingEnabled])
  {
    [(CRLWPRep *)self setNeedsDisplay];
  }
}

- (void)p_invalidateSuppressedMisspellingRange
{
  if (self->_suppressedMisspellingRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_suppressedMisspellingRange.length) {
      -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:");
    }
  }
}

- (void)p_setSuppressedMisspellingRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v13.NSUInteger location = (NSUInteger)[(CRLWPRep *)self range];
  v13.NSUInteger length = v6;
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  NSRange v7 = NSIntersectionRange(v12, v13);
  if (v7.length) {
    NSUInteger v8 = v7.length;
  }
  else {
    NSUInteger v8 = 0;
  }
  if (v7.length) {
    NSUInteger v9 = v7.location;
  }
  else {
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9 != self->_suppressedMisspellingRange.location || v8 != self->_suppressedMisspellingRange.length)
  {
    [(CRLWPRep *)self p_invalidateSuppressedMisspellingRange];
    self->_suppressedMisspellingRange.NSUInteger location = v9;
    self->_suppressedMisspellingRange.NSUInteger length = v8;
    [(CRLWPRep *)self p_invalidateSuppressedMisspellingRange];
  }
}

- (void)p_updateSuppressedSpellingRange
{
  BOOL v3 = [(CRLWPRep *)self selection];
  NSUInteger location = self->_suppressedMisspellingRange.location;
  NSUInteger length = self->_suppressedMisspellingRange.length;
  if (location != 0x7FFFFFFFFFFFFFFFLL || length != 0)
  {
    v12.NSUInteger location = (NSUInteger)[(CRLWPRep *)self range];
    v12.NSUInteger length = v7;
    v11.NSUInteger location = location;
    v11.NSUInteger length = length;
    self->_suppressedMisspellingRange = NSIntersectionRange(v11, v12);
  }
  if ([v3 isValid])
  {
    NSUInteger v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    NSUInteger v9 = [v8 canvas];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003B8348;
    v10[3] = &unk_1014ECF00;
    void v10[4] = self;
    v10[5] = v3;
    [v9 performBlockAfterLayoutIfNecessary:v10];
  }
  else
  {
    -[CRLWPRep p_setSuppressedMisspellingRange:](self, "p_setSuppressedMisspellingRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    NSUInteger v8 = [(CRLWPRep *)self storage];
    self->_changeCountForSpellingSuppression = (unint64_t)[v8 changeCount];
  }
}

- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3
{
  double v5 = [(CRLWPRep *)self selection];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4DE8);
      }
      NSUInteger v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        unsigned int v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v36 = (id)objc_claimAutoreleasedReturnValue();
        id v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        *(_DWORD *)buf = 67110658;
        unsigned int v38 = v6;
        __int16 v39 = 2082;
        CGFloat v40 = "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]";
        __int16 v41 = 2082;
        double v42 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        __int16 v43 = 1024;
        int v44 = 3040;
        __int16 v45 = 2082;
        CGFloat v46 = "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]";
        __int16 v47 = 2114;
        id v48 = v36;
        id v35 = v49 = 2114;
        long long v50 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %{public}s expected %{public}@, got %{public}@", buf, 0x40u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4E08);
      }
      NSUInteger v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      NSUInteger v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]");
      BOOL v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      NSRange v11 = (objc_class *)objc_opt_class();
      NSRange v12 = NSStringFromClass(v11);
      NSRange v13 = (objc_class *)objc_opt_class();
      CGFloat v14 = NSStringFromClass(v13);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 3040, 0, "%{public}s expected %{public}@, got %{public}@", "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]", v12, v14);
    }
  }
  if ([(CRLWPRep *)self p_isRedesignedTextCursorEnabled])
  {
    CGFloat v15 = [(CRLWPRep *)self layout];
    BOOL v16 = v15 == 0;

    if (!v16) {
      [(CRLWPRep *)self p_validateWithLayoutController];
    }
  }
  if (self->_caretLayer && !self->_suppressSelectionHighlight)
  {
    CGFloat v17 = [(CRLWPRep *)self layout];
    BOOL v18 = v17 == 0;

    if (!v18) {
      [(CRLWPRep *)self p_validateWithLayoutController];
    }
    [(CRLWPRep *)self p_updateSuppressedSpellingRange];
    long long v19 = [(CRLWPRep *)self textEditor];
    id v20 = [v19 markedRange];
    NSUInteger v22 = v21;

    id v23 = v5;
    CGRect v24 = [(CRLWPRep *)self storage];
    unsigned int v25 = [v24 hasMarkedText];

    if (v25)
    {
      v51.NSUInteger location = (NSUInteger)[v23 range];
      v52.NSUInteger location = (NSUInteger)v20;
      v52.NSUInteger length = v22;
      CGRect v26 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", NSUnionRange(v51, v52).location, v51.length);
      double v27 = [(CRLTextRange *)v26 makeTrailingInsertionPoint];
      id v28 = [v27 nsRange];
      id v30 = [v23 copyWithNewRange:v28, v29];

      id v23 = v30;
    }
    unsigned int v31 = [v23 isInsertionPoint];
    if (v22) {
      int v32 = 1;
    }
    else {
      int v32 = v31;
    }
    if (v32 == 1)
    {
      [(CRLWPRep *)self p_updateLayersForInsertionPointSelection:v23];
    }
    else if ([v23 isRange])
    {
      [(CRLWPRep *)self p_updateLayersForRangeSelection:v23 selectionFlags:a3];
    }
    else
    {
      [(CRLWPRep *)self p_hideSelectionLayers];
    }
    [(CRLWPRep *)self p_updateMarkHighlightLayer];
  }
}

- (void)i_setNeedsDisplayForSelectionChange
{
  if (!self->_lastSelection) {
    goto LABEL_4;
  }
  BOOL v3 = [(CRLWPRep *)self storage];
  unsigned int v4 = [v3 parentInfo];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(CRLWPRep *)self storage];
    unsigned int v6 = [v5 parentInfo];
    unsigned int v7 = [v6 shouldHideEmptyBullets];

    if (v7)
    {
LABEL_4:
      [(CRLWPRep *)self setNeedsDisplay];
      goto LABEL_38;
    }
  }
  else
  {
  }
  NSUInteger v8 = [(CRLWPRep *)self selection];
  if (![(CRLWPSelection *)self->_lastSelection isEqual:v8]
    && (([v8 isRange] & 1) != 0
     || [(CRLWPSelection *)self->_lastSelection isRange]))
  {
    if (v8)
    {
      id v9 = [v8 range];
      NSUInteger v11 = v10;
      NSRange v12 = [(CRLWPRep *)self storage];
      v50.NSUInteger location = (NSUInteger)[v12 range];
      v50.NSUInteger length = v13;
      v47.NSUInteger location = (NSUInteger)v9;
      v47.NSUInteger length = v11;
      NSRange v14 = NSIntersectionRange(v47, v50);
      NSUInteger location = v14.location;
      NSUInteger length = v14.length;

      NSUInteger v17 = v14.length;
    }
    else
    {
      NSUInteger length = 0;
      NSUInteger location = 0;
      NSUInteger v17 = 0;
    }
    id v18 = [(CRLWPSelection *)self->_lastSelection range];
    NSUInteger v20 = v19;
    NSUInteger v21 = [(CRLWPRep *)self storage];
    v51.NSUInteger location = (NSUInteger)[v21 range];
    v51.NSUInteger length = v22;
    v48.NSUInteger location = (NSUInteger)v18;
    v48.NSUInteger length = v20;
    NSRange v23 = NSIntersectionRange(v48, v51);

    id v24 = objc_alloc_init((Class)NSMutableIndexSet);
    unsigned int v25 = v24;
    if (length) {
      [v24 addIndexesInRange:location, v17];
    }
    if (v23.length)
    {
      [v25 addIndexesInRange:v23.location, v23.length];
      if (length)
      {
        v49.NSUInteger location = location;
        v49.NSUInteger length = v17;
        NSRange v26 = NSIntersectionRange(v49, v23);
        [v25 removeIndexesInRange:v26.location, v26.length];
      }
    }
    uint64_t v43 = 0;
    int v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    void v42[2] = sub_1003B9418;
    v42[3] = &unk_1014F4E30;
    v42[4] = self;
    v42[5] = &v43;
    [v25 enumerateIndexesUsingBlock:v42];
    uint64_t v38 = 0;
    __int16 v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
    if (v44[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1003B94B8;
      v37[3] = &unk_1014F4E30;
      v37[4] = self;
      v37[5] = &v38;
      [v25 enumerateIndexesWithOptions:2 usingBlock:v37];
      unint64_t v27 = v44[3];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = v39[3];
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F4E50);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010AAA50();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014F4E70);
          }
          uint64_t v29 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          id v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep i_setNeedsDisplayForSelectionChange]");
          unsigned int v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 3117, 0, "If there is a invisible char, we should have found it going backwards.");

          unint64_t v27 = v44[3];
          uint64_t v28 = v39[3];
        }
        if (v27 <= v28 + 1) {
          unint64_t v32 = v28 + 1;
        }
        else {
          unint64_t v32 = v27;
        }
        if (v27 >= v28 + 1) {
          unint64_t v33 = v28 + 1;
        }
        else {
          unint64_t v33 = v27;
        }
        -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", v33, v32 - v33);
      }
    }
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v43, 8);
  }
LABEL_38:
  if (self->_lastSelection) {
    [(CRLWPRep *)self updateUniversalAccessZoomWindow];
  }
  id v34 = [(CRLWPRep *)self selection];
  id v35 = (CRLWPSelection *)[v34 copy];
  lastSelection = self->_lastSelection;
  self->_lastSelection = v35;
}

- (void)p_validateWithLayoutController
{
  id v3 = [(CRLWPRep *)self layout];
  uint64_t v2 = [v3 layoutController];
  [v2 validateLayoutWithDependencies:v3];
}

- (void)p_drawTextLayerInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  double v5 = [(CRLWPRep *)self textLayer];
  [(CRLCanvasRep *)self setupForDrawingInLayer:v5 context:a3];

  unsigned int v6 = [(CRLWPRep *)self textLayer];
  LOBYTE(v8) = 0;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 3, v8);

  unsigned int v7 = [(CRLWPRep *)self textLayer];
  [(CRLWPRep *)self didDrawInLayer:v7 context:a3];

  CGContextRestoreGState(a3);
}

- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  double v5 = [(CRLWPRep *)self textBackgroundLayer];
  [(CRLCanvasRep *)self setupForDrawingInLayer:v5 context:a3];

  unsigned int v6 = [(CRLWPRep *)self textBackgroundLayer];
  LOBYTE(v8) = 0;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 2, v8);

  unsigned int v7 = [(CRLWPRep *)self textBackgroundLayer];
  [(CRLWPRep *)self didDrawInLayer:v7 context:a3];

  CGContextRestoreGState(a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v10 = a3;
  unsigned int v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 shouldSuppressRendering];

  if ((v7 & 1) == 0)
  {
    id v8 = [(CRLWPRep *)self textLayer];

    if (v8 == v10)
    {
      [(CRLWPRep *)self p_drawTextLayerInContext:a4];
    }
    else
    {
      id v9 = [(CRLWPRep *)self textBackgroundLayer];

      if (v9 == v10) {
        [(CRLWPRep *)self p_drawTextBackgroundLayerInContext:a4];
      }
    }
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  unsigned int v4 = +[NSNull null];

  return v4;
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 shouldLayoutTilingLayer:v4];

  return v6;
}

- (BOOL)textIsVertical
{
  uint64_t v2 = [(CRLWPRep *)self layout];
  unsigned __int8 v3 = [v2 textIsVertical];

  return v3;
}

- (void)p_teardown
{
  if (!self->_tornDown)
  {
    [(CRLWPRep *)self p_unregisterNotifications];
    [(CRLWPRepCaretController *)self->_caretController stopCaretLayerAnimationHidingCaret:0];
    [(CRLWPRepCaretController *)self->_caretController tearDown];
    if ([(CRLWPHighlightArrayController *)self->_pulseArrayController autohide])
    {
      uint64_t v3 = [(CRLWPRep *)self primaryFindResultSearchReference];
      if (v3)
      {
        id v4 = (void *)v3;
        uint64_t v28 = [(CRLCanvasRep *)self interactiveCanvasController];
        unint64_t v27 = [v28 primaryFindResultSearchReference];
        if (v27)
        {
          NSRange v26 = [(CRLCanvasRep *)self interactiveCanvasController];
          double v5 = [v26 primaryFindResultSearchReference];
          unsigned __int8 v6 = [(CRLWPRep *)self primaryFindResultSearchReference];
          unsigned int v7 = [v5 isEqual:v6];

          if (v7) {
            [(CRLWPRep *)self p_clearICCPrimaryFindResultSearchReference];
          }
        }
        else
        {
        }
      }
    }
    [(CAShapeLayer *)self->_floatingCaretLayer removeAllAnimations];
    [(CAShapeLayer *)self->_floatingCaretLayer removeFromSuperlayer];
    [(CRLPulseAnimationController *)self->_caretPulseController disconnect];
    [(CRLWPHighlightArrayController *)self->_pulseArrayController disconnect];
    [(CRLWPRep *)self p_destroySpellChecker];
    self->_tornDown = 1;
  }
  floatingCaretLayer = self->_floatingCaretLayer;
  self->_floatingCaretLayer = 0;

  searchReferences = self->_searchReferences;
  self->_searchReferences = 0;

  primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
  self->_primaryFindResultSearchReference = 0;

  [(CAShapeLayer *)self->_selectionHighlightLayer setDelegate:0];
  selectionHighlightLayer = self->_selectionHighlightLayer;
  self->_selectionHighlightLayer = 0;

  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  self->_selectionParagraphBorderLayer = 0;

  lastSelection = self->_lastSelection;
  self->_lastSelection = 0;

  [(CAShapeLayer *)self->_markHighlightLayer setDelegate:0];
  markHighlightLayer = self->_markHighlightLayer;
  self->_markHighlightLayer = 0;

  [(CAShapeLayer *)self->_smartFieldHighlightLayer setDelegate:0];
  smartFieldHighlightLayer = self->_smartFieldHighlightLayer;
  self->_smartFieldHighlightLayer = 0;

  caretPulseController = self->_caretPulseController;
  self->_caretPulseController = 0;

  pulseArrayController = self->_pulseArrayController;
  self->_pulseArrayController = 0;

  caretController = self->_caretController;
  self->_caretController = 0;

  [(CRLWPRep *)self p_destroyLayer:1];
  [(CRLWPRep *)self p_destroyLayer:0];
  [(CAShapeLayer *)self->_selectionLineLayers[0] setDelegate:0];
  NSUInteger v19 = self->_selectionLineLayers[0];
  self->_selectionLineLayers[0] = 0;

  [(CAShapeLayer *)self->_selectionLineLayers[1] setDelegate:0];
  NSUInteger v20 = self->_selectionLineLayers[1];
  self->_selectionLineLayers[1] = 0;

  [(CAShapeLayer *)self->_caretLayer setDelegate:0];
  caretLayer = self->_caretLayer;
  self->_caretLayer = 0;

  [(CAShapeLayer *)self->_secondaryHighlightLayer setDelegate:0];
  secondaryHighlightLayer = self->_secondaryHighlightLayer;
  self->_secondaryHighlightLayer = 0;

  [(CAShapeLayer *)self->_dragAndDropCaretLayer setDelegate:0];
  dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
  self->_dragAndDropCaretLayer = 0;

  [(CALayer *)self->_dragAndDropTopicLayer setDelegate:0];
  dragAndDropTopicLayer = self->_dragAndDropTopicLayer;
  self->_dragAndDropTopicLayer = 0;

  dragAndDropTopicIndentLayer = self->_dragAndDropTopicIndentLayer;
  self->_dragAndDropTopicIndentLayer = 0;

  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(unint64_t)a7 suppressInvisibles:(BOOL)a8
{
  id v63 = a3;
  id v51 = a5;
  uint64_t v43 = sub_100457AE4((uint64_t)a4);
  [v43 beginTextStorageChunk:self limitSelection:v51];
  v68 = self;
  NSUInteger v11 = [(CRLCanvasRep *)self canvas];
  double v62 = [v11 textRendererForLayer:v63 context:a4];

  NSRange v12 = [(CRLCanvasRep *)self canvas];
  NSUInteger v13 = [v12 canvasController];
  NSRange v14 = [v13 freehandDrawingToolkit];
  unsigned __int8 v48 = [v14 isInDrawingMode];

  CGFloat v15 = [(CRLCanvasRep *)v68 canvas];
  if (![v15 isCanvasInteractive])
  {

    goto LABEL_5;
  }
  BOOL v16 = [(CRLWPRep *)v68 textEditor];

  if (!v16)
  {
LABEL_5:
    NSUInteger v19 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  id v17 = [v16 markedRange];
  uint64_t v46 = v18;
  uint64_t v47 = (uint64_t)v17;
  NSUInteger v19 = v16;
LABEL_6:
  double v42 = v19;
  NSRange v52 = [v19 markedText];
  CGFloat v53 = 0;
  if ([(CRLWPRep *)v68 p_spellCheckingEnabled] && !a8)
  {
    CGFloat v53 = v68->_spellChecker;
    if (v53)
    {
      NSUInteger v20 = [(CRLWPRep *)v68 layout];
      if (([v20 isInstructional] & 1) == 0)
      {
        NSUInteger v21 = [(CRLWPRep *)v68 storage];
        if ([v21 length])
        {
          NSUInteger v22 = [(CRLWPRep *)v68 storage];
          NSRange v23 = [v22 markedTextRange];

          if (v23) {
            goto LABEL_16;
          }
          NSUInteger v20 = [(CRLWPRep *)v68 columns];
          id v24 = +[CRLWPColumn rangeOfColumns:v20];
          -[CRLWPStorageSpellChecker checkRange:synchronously:](v53, "checkRange:synchronously:", v24, v25, 1);
        }
        else
        {
        }
      }
    }
    else
    {
      CGFloat v53 = 0;
    }
  }
LABEL_16:
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [(CRLWPRep *)v68 columns];
  id v54 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v54)
  {
    uint64_t v45 = *(void *)v71;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v71 != v45) {
          objc_enumerationMutation(obj);
        }
        NSRange v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        unint64_t v27 = [(CRLWPRep *)v68 layout];
        uint64_t v28 = [v27 interiorClippingPath];
        id v67 = [v28 copy];

        if (v26) {
          [v26 transformToWP];
        }
        else {
          memset(v69, 0, sizeof(v69));
        }
        [v67 transformUsingAffineTransform:v69];
        [v62 setInteriorClippingPath:v67];
        double v64 = +[CRLWPRangeArray rangeArray];
        double v65 = +[CRLWPRangeArray rangeArray];
        double v61 = v26;
        if (v63)
        {
          CGFloat v55 = [(CRLWPRep *)v68 selection];
          double v60 = v55;
        }
        else
        {
          double v60 = 0;
        }
        NSUInteger length = v68->_dragRange.length;
        NSUInteger location = v68->_dragRange.location;
        double v58 = [(CRLCanvasRep *)v68 canvas];
        unsigned __int8 v30 = [v58 isCanvasInteractive];
        NSUInteger v31 = v68->_suppressedMisspellingRange.location;
        NSUInteger v32 = v68->_suppressedMisspellingRange.length;
        double v57 = [(CRLCanvasRep *)v68 canvas];
        unsigned __int8 v33 = [v57 shouldSuppressBackgrounds];
        double v56 = [(CRLWPRep *)v68 layout];
        id v34 = [v56 pageCount];
        id v35 = [(CRLCanvasRep *)v68 canvas];
        id v36 = [v35 canvasController];
        double v37 = [v36 canvasEditor];
        uint64_t v38 = [v37 canvasSelection];
        LOBYTE(v41) = a8;
        LOBYTE(v40) = ((a7 & 0x20) != 0) | v33;
        BYTE1(v39) = v48;
        LOBYTE(v39) = v30;
        objc_msgSend(v61, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:isInDrawingMode:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v62, v60, v51, location, length, a6.location, a6.length, v39, v53, v31, v32, v40, v64, v65, v47,
          v46,
          v52,
          a7,
          v34,
          v41,
          v38);

        if (v63) {
      }
        }
      id v54 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v54);
  }

  [v43 endTextStorageChunk:v68];
}

- (void)p_createLayer:(int64_t)a3
{
  textLayers = self->_textLayers;
  if (self->_textLayers[a3])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4E90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AAAD8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4EB0);
    }
    unsigned __int8 v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unsigned int v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createLayer:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:3425 isFatal:0 description:"Shouldn't be creating _textLayer again"];
  }
  id v9 = objc_alloc_init(CRLTilingLayer);
  id v10 = (id *)&textLayers[a3];
  id v11 = *v10;
  id *v10 = v9;

  [*v10 setAnchorPoint:CGPointZero.x, CGPointZero.y];
  [*v10 setEdgeAntialiasingMask:0];
  [*v10 setDelegate:self];
  [*v10 setPosition:CGPointZero.x, CGPointZero.y];
  double v12 = -3.0;
  if (a3 == 1) {
    double v12 = -2.0;
  }
  [*v10 setZPosition:v12];
  NSUInteger v13 = [(CRLCanvasRep *)self canvas];
  [v13 contentsScale];
  -[CALayer setContentsScale:](textLayers[a3], "setContentsScale:");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CALayer *)textLayers[a3] setTilingMode:[(CRLWPRep *)self tilingMode]];
  }
  if (a3 == 1) {
    [(CALayer *)textLayers[1] setDrawsAsynchronously:1];
  }
  NSRange v14 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v14 setNeedsDisplayOnLayer:textLayers[a3]];
}

- (void)p_destroyLayer:(int64_t)a3
{
  textLayers = self->_textLayers;
  [(CALayer *)self->_textLayers[a3] setDelegate:0];
  double v5 = textLayers[a3];
  textLayers[a3] = 0;
}

- (id)p_caretLayerWithZPosition:(double)a3
{
  id v5 = objc_alloc_init((Class)CAShapeLayer);
  [v5 setAnchorPoint:CGPointZero.x, CGPointZero.y];
  [v5 setFillColor:[self p_caretLayerColor]];
  [v5 setEdgeAntialiasingMask:0];
  LODWORD(v6) = 1.0;
  [v5 setOpacity:v6];
  [v5 setDelegate:self];
  [v5 setZPosition:a3];
  unsigned int v7 = [(CRLCanvasRep *)self canvas];
  [v7 contentsScale];
  [v5 setContentsScale:];

  [v5 setHidden:0];
  [v5 setName:@"Caret Layer"];

  return v5;
}

- (void)p_positionAndSizeFloatingCaret:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  -[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:](self, "p_closestCaretRectForPoint:inSelection:allowPastBreak:", 1, 1);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
  if (v15 <= 0.0 && v13 <= 0.0)
  {
    -[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:](self, "p_closestCaretRectForPoint:inSelection:allowPastBreak:", 0, 0, x, y);
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }
  if (v15 > 0.0 || v13 > 0.0)
  {
    [v7 setAnchorPoint:0.5, 0.5];
    [v7 setEdgeAntialiasingMask:0];
    NSUInteger v20 = [(CRLCanvasRep *)self canvas];
    [v20 viewScale];
    double v22 = v21;

    [(CRLWPRepHelper *)self->_repHelper floatingCaretHeightMult];
    [v7 setBounds:0.0, 0.0, 2.0 / v22, round(v15 * v23)];
  }
  long long v35 = 0uLL;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = 0uLL;
  [v7 setAffineTransform:v32];
  id v24 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v24 convertUnscaledToBoundsPoint:x, y];
  double v26 = v25;
  double v28 = v27;

  [(CRLWPRepHelper *)self->_repHelper floatingCaretLineSnapAmount];
  if (v29 > 0.0)
  {
    -[CRLWPRep p_applyLineSnappingToFloatingCaret:atPoint:withRect:](self, "p_applyLineSnappingToFloatingCaret:atPoint:withRect:", v7, x, y, v9, v11, v13, v15);
    double v26 = v30;
    double v28 = v31;
  }
  [v7 setPosition:v26, v28];
}

- (CGPoint)p_applyLineSnappingToFloatingCaret:(id)a3 atPoint:(CGPoint)a4 withRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v10, v9);
  double v14 = v13;
  double v16 = v15;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v45);
  [(CRLWPRepHelper *)self->_repHelper floatingCaretLineSnapAmount];
  double v19 = v18;
  [(CRLCanvasRep *)self naturalBounds];
  double v21 = v20;
  [v12 bounds];
  if (v22 >= v21) {
    double v23 = v21;
  }
  else {
    double v23 = v22;
  }
  [(CRLCanvasRep *)self naturalBounds];
  double v25 = v24;
  [v12 bounds];
  double v27 = v26;
  [(CRLCanvasRep *)self naturalBounds];
  if (v27 >= v25) {
    double v32 = v25;
  }
  else {
    double v32 = v27;
  }
  CGRect v46 = CGRectInset(*(CGRect *)&v28, v23 * 0.5, v32 * 0.5);
  [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:sub_1000656DC(v14, MidY + (v16 - MidY) / v19, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height)];
  double v34 = v33;
  double v36 = v35;
  double v37 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v37 convertUnscaledToBoundsPoint:v34, v36];
  double v39 = v38;
  double v41 = v40;

  double v42 = v39;
  double v43 = v41;
  result.CGFloat y = v43;
  result.CGFloat x = v42;
  return result;
}

- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(CRLWPRep *)self p_caretRectForSelection:v9];
  -[CRLWPRepHelper rectForCaretLayer:](self->_repHelper, "rectForCaretLayer:");
  double v14 = v13;
  CGFloat v15 = v12;
  BOOL v16 = v13 > 0.0 || v12 > 0.0;
  if (v16)
  {
    CGFloat v17 = v10;
    CGFloat v18 = v11;
    memset(&v71, 0, sizeof(v71));
    if (v5) {
      [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
    }
    else {
      [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
    }
    CGAffineTransform v70 = v71;
    v72.origin.double x = v17;
    v72.origin.double y = v18;
    v72.size.double width = v14;
    v72.size.double height = v15;
    CGRect v73 = CGRectApplyAffineTransform(v72, &v70);
    double x = v73.origin.x;
    double y = v73.origin.y;
    double width = v73.size.width;
    double height = v73.size.height;
    CGAffineTransform v69 = v71;
    double v23 = sub_10007F788(&v69);
    sub_100065C2C(v23);
    double v25 = fmod(360.0 - v24, 360.0);
    [(CRLWPRepHelper *)self->_repHelper anchorPointForCaretLayer:v14 > 0.0 rotated:v25 != 0.0];
    [v8 setAnchorPoint:];
    if (v25 == 0.0)
    {
      [v8 setEdgeAntialiasingMask:0];
      double v37 = x;
      double v38 = y;
      double v39 = width;
      double v40 = height;
      if (v14 <= 0.0)
      {
        CGRect v75 = CGRectInset(*(CGRect *)&v37, (width + -2.0) * 0.5, 0.0);
        double v65 = round(v75.origin.y);
        double v66 = round(v75.origin.x);
        double v36 = round(v75.size.height);
        double v35 = 2.0;
      }
      else
      {
        CGRect v74 = CGRectInset(*(CGRect *)&v37, 0.0, (height + -2.0) * 0.5);
        double v65 = round(v74.origin.y);
        double v66 = round(v74.origin.x);
        double v35 = round(v74.size.width);
        double v36 = 2.0;
      }
      double v41 = -[CRLWPRep columnForCharIndex:](self, "columnForCharIndex:", [v9 range]);
      [(CRLCanvasRep *)self naturalBounds];
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;
      CGFloat v49 = v48;
      [v41 boundsIncludingDropCapRectsForSelectionType:[v9 type]];
      v81.origin.double x = v50;
      v81.origin.double y = v51;
      v81.size.double width = v52;
      v81.size.double height = v53;
      v76.origin.double x = v43;
      v76.origin.double y = v45;
      v76.size.double width = v47;
      v76.size.double height = v49;
      CGRect v77 = CGRectUnion(v76, v81);
      CGFloat v54 = v77.origin.x;
      CGFloat v55 = v77.origin.y;
      CGFloat v56 = v77.size.width;
      CGFloat v57 = v77.size.height;
      if (v5) {
        [(CRLCanvasRep *)self transformToConvertNaturalToLayerRelative];
      }
      else {
        [(CRLWPRep *)self transformToConvertNaturalToScaledRoot];
      }
      v78.origin.double x = v54;
      v78.origin.double y = v55;
      v78.size.double width = v56;
      v78.size.double height = v57;
      CGRect v79 = CGRectApplyAffineTransform(v78, &v68);
      if (v66 >= v79.origin.x) {
        double v32 = v66;
      }
      else {
        double v32 = v79.origin.x;
      }
      if (v65 >= v79.origin.y) {
        double v34 = v65;
      }
      else {
        double v34 = v79.origin.y;
      }
    }
    else
    {
      if (v25 == 180.0 || v25 == 90.0 || v25 == 270.0) {
        uint64_t v28 = 0;
      }
      else {
        uint64_t v28 = 15;
      }
      [v8 setEdgeAntialiasingMask:v28];
      -[CRLWPRep p_convertNaturalRectToRotated:repAngle:](self, "p_convertNaturalRectToRotated:repAngle:", x, y, width, height, v25);
      double v32 = v31;
      double v34 = v33;
      if (v14 <= 0.0) {
        double v35 = 2.0;
      }
      else {
        double v35 = v29;
      }
      if (v14 <= 0.0) {
        double v36 = v30;
      }
      else {
        double v36 = 2.0;
      }
    }
    -[CRLWPRepHelper boundsForCaretLayer:](self->_repHelper, "boundsForCaretLayer:", v32, v34, v35, v36);
    [v8 setBounds:];
    -[CRLWPRepHelper positionForCaretLayer:](self->_repHelper, "positionForCaretLayer:", v32, v34, v35, v36);
    [v8 setPosition:];
    double v58 = (objc_class *)objc_opt_class();
    double v59 = sub_10024715C(v58, v8);
    CGAffineTransformMakeTranslation(&transform, 0.0, 0.0);
    if (v14 <= 0.0) {
      double v60 = v35;
    }
    else {
      double v60 = v36;
    }
    CGFloat v61 = v60 * 0.5;
    v80.origin.double x = 0.0;
    v80.origin.double y = 0.0;
    v80.size.double width = v35;
    v80.size.double height = v36;
    double v62 = CGPathCreateWithRoundedRect(v80, v61, v61, &transform);
    [v59 setPath:v62];
    CGPathRelease(v62);
    id v63 = +[NSNumber numberWithDouble:(360.0 - v25) * 3.14159265 / 180.0];
    [v8 setValue:v63 forKeyPath:@"transform.rotation.z"];
  }
  return v16;
}

- (BOOL)caretIsHidden
{
  return [(CRLWPRepCaretController *)self->_caretController caretIsHidden];
}

- (void)showCaretLayerStartingAnimation
{
}

- (void)hideCaretLayer
{
}

- (BOOL)isShowingCaret
{
  return 1;
}

- (void)i_textInputResponderDidResignFirstResponder
{
  [(CRLWPRepCaretController *)self->_caretController willEnterForeground];
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (void)i_textInputResponderDidBecomeFirstResponder
{
  [(CRLWPRepCaretController *)self->_caretController didEnterBackground];
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (void)p_createSelectionLineLayers
{
  id v3 = [(CRLWPRep *)self p_highlightLineColor];
  uint64_t v4 = 0;
  selectionLineLayers = self->_selectionLineLayers;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (selectionLineLayers[v4])
    {
      unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4ED0);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        unsigned int v18 = v8;
        __int16 v19 = 2082;
        double v20 = "-[CRLWPRep p_createSelectionLineLayers]";
        __int16 v21 = 2082;
        double v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        __int16 v23 = 1024;
        int v24 = 3662;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Shouldn't be creating _selectionLineLayers again", buf, 0x22u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F4EF0);
      }
      double v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = +[CRLAssertionHandler packedBacktraceString];
        *(_DWORD *)buf = 67109378;
        unsigned int v18 = v8;
        __int16 v19 = 2114;
        double v20 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
      }
      double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionLineLayers]");
      double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:3662 isFatal:0 description:"Shouldn't be creating _selectionLineLayers again"];
    }
    double v13 = objc_alloc_init(CRLWPSelectionHighlightLayer);
    double v14 = (id *)&selectionLineLayers[v4];
    id v15 = *v14;
    *double v14 = v13;

    [*v14 setAnchorPoint:CGPointZero.x, CGPointZero.y];
    [*v14 setEdgeAntialiasingMask:0];
    [*v14 setDelegate:self];
    [*v14 setZPosition:-1.0];
    [*v14 setFillColor:v3];
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
}

- (void)p_setSelectionLineLayersHidden:(BOOL)a3
{
  BOOL v3 = a3;
  selectionLineLayers = self->_selectionLineLayers;
  -[CAShapeLayer setHidden:](self->_selectionLineLayers[0], "setHidden:");
  BOOL v5 = selectionLineLayers[1];

  [(CAShapeLayer *)v5 setHidden:v3];
}

- (void)p_setSelectionHighlightColor
{
  BOOL v3 = [(CRLWPRep *)self selection];
  id v4 = [v3 type];

  if (v4 == (id)3
    && ![(CRLWPRep *)self usesStandardHighlightColorForReplaceSelections])
  {
    uint64_t v12 = +[CRLColor colorWithRed:0.949019611 green:0.75686276 blue:0.654901981 alpha:0.200000003];
  }
  else
  {
    BOOL v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    char v6 = [v5 layerHost];
    char v7 = [v6 asiOSCVC];
    unsigned int v8 = [v7 crl_windowWrapper];
    if ([v8 isInSplitViewMode])
    {
      id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
      double v10 = [v9 layerHost];
      unsigned __int8 v11 = [v10 isInFocusedContainer];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [(id)objc_opt_class() unfocusedHighlightColorForDarkMode:0];
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v12 = [(id)objc_opt_class() focusedHighlightColorForDarkMode:0];
  }
LABEL_9:
  double v13 = (void *)v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4F10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AAB60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4F30);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_setSelectionHighlightColor]");
    BOOL v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 3758, 0, "invalid nil value for '%{public}s'", "highlightColor");
  }
  -[CAShapeLayer setFillColor:](self->_selectionHighlightLayer, "setFillColor:", [v13 CGColor]);
}

- (void)p_createSelectionHighlightLayer
{
  if (self->_selectionHighlightLayer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4F50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AABF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4F70);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionHighlightLayer]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3764 isFatal:0 description:"Shouldn't be creating _selectionHighlightLayer again"];
  }
  char v6 = objc_alloc_init(CRLWPSelectionHighlightLayer);
  selectionHighlightLayer = self->_selectionHighlightLayer;
  self->_selectionHighlightLayer = &v6->super;

  -[CAShapeLayer setAnchorPoint:](self->_selectionHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(CAShapeLayer *)self->_selectionHighlightLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_selectionHighlightLayer setDelegate:self];
  [(CAShapeLayer *)self->_selectionHighlightLayer setZPosition:-1.79999995];
  [(CRLWPRep *)self p_setSelectionHighlightColor];
}

- (void)p_createSelectionParagraphBorderLayer
{
  if (self->_selectionParagraphBorderLayer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4F90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AAC7C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4FB0);
    }
    BOOL v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionParagraphBorderLayer]");
    BOOL v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:3778 isFatal:0 description:"Shouldn't be creating _selectionParagraphBorderLayer again"];
  }
  char v6 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  self->_selectionParagraphBorderLayer = v6;

  unsigned int v8 = [(CRLCanvasRep *)self canvas];
  [v8 contentsScale];
  -[CAShapeLayer setContentsScale:](self->_selectionParagraphBorderLayer, "setContentsScale:");

  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setHidden:0];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:0.0];
  -[CAShapeLayer setAnchorPoint:](self->_selectionParagraphBorderLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setZPosition:-1.85000002];
  id v9 = +[CRLColor colorWithRed:0.119999997 green:0.370000005 blue:0.949999988 alpha:0.550000012];
  -[CAShapeLayer setStrokeColor:](self->_selectionParagraphBorderLayer, "setStrokeColor:", [v9 CGColor]);

  p_selectionParagraphBorderLayer = &self->_selectionParagraphBorderLayer;
  [(CAShapeLayer *)*p_selectionParagraphBorderLayer setLineWidth:2.0];
  [(CAShapeLayer *)*p_selectionParagraphBorderLayer setFillColor:0];
}

- (void)p_hideSelectionHighlightLayer
{
}

- (void)p_hideSelectionParagraphBorderLayer
{
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
  if (v3 != 0.0)
  {
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer removeAllAnimations];
    id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v5 setDuration:0.15];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
    id v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v5 setFromValue:v4];

    [v5 setToValue:&off_10155E358];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:0.0];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer addAnimation:v5 forKey:@"kParagraphModeBorderFadeOutAnimation"];
  }
}

- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3
{
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setPath:a3];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
  if (v4 != 1.0)
  {
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer removeAllAnimations];
    id v7 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v7 setDuration:0.15];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
    id v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v7 setFromValue:v5];

    [v7 setToValue:&off_10155E368];
    LODWORD(v6) = 1.0;
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:v6];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer addAnimation:v7 forKey:@"kParagraphModeBorderFadeInAnimation"];
  }
}

- (void)p_createMarkHighlightLayer
{
  float v3 = objc_alloc_init(CRLWPSelectionHighlightLayer);
  markHighlightLayer = self->_markHighlightLayer;
  self->_markHighlightLayer = &v3->super;

  -[CAShapeLayer setAnchorPoint:](self->_markHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  [(CAShapeLayer *)self->_markHighlightLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_markHighlightLayer setDelegate:self];
  id v5 = +[CRLColor colorWithRed:0.0 green:0.330000013 blue:0.649999976 alpha:0.100000001];
  -[CAShapeLayer setFillColor:](self->_markHighlightLayer, "setFillColor:", [v5 CGColor]);

  double v6 = +[CRLColor colorWithRed:0.0 green:0.330000013 blue:0.649999976 alpha:0.200000003];
  -[CAShapeLayer setStrokeColor:](self->_markHighlightLayer, "setStrokeColor:", [v6 CGColor]);

  id v7 = self->_markHighlightLayer;

  [(CAShapeLayer *)v7 setZPosition:-1.9];
}

- (void)p_hideMarkHighlightLayer
{
}

- (void)p_updateMarkHighlightLayer
{
  float v3 = [(CRLWPRep *)self textEditor];
  id v4 = [v3 markedRange];
  uint64_t v6 = v5;
  unsigned int v7 = [(CRLWPRep *)self isBeingEdited];
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 == 1)
  {
    id v9 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v4, v6);
    [(CAShapeLayer *)self->_markHighlightLayer setSublayers:0];
    [(CAShapeLayer *)self->_markHighlightLayer setPath:0];
    double v10 = [v3 markedText];
    unsigned __int8 v11 = [v10 attribute:NSMarkedClauseSegmentAttributeName atIndex:0 effectiveRange:0];

    if (v11)
    {
      double v34 = v3;
      double v35 = +[NSMutableArray array];
      double v36 = (char *)[v3 markedRange];
      uint64_t v12 = [(CRLWPRep *)self storage];
      double v13 = (char *)[v12 length];

      long long v37 = xmmword_101176F58;
      unint64_t v14 = 0;
      while (v14 < (unint64_t)[v10 length])
      {
        id v15 = [v10 attribute:NSMarkedClauseSegmentAttributeName atIndex:(void)v37 effectiveRange:&v37];
        BOOL v16 = [v10 attribute:NSBackgroundColorAttributeName atIndex:(void)v37 effectiveRange:0];
        CGFloat v17 = v16;
        if (!*((void *)&v37 + 1) || (unsigned int v18 = &v36[v37], &v36[(unint64_t)v37] >= v13))
        {

          break;
        }
        if (v15)
        {
          __int16 v19 = &v18[*((void *)&v37 + 1)];
          if (v13 < &v18[*((void *)&v37 + 1)]) {
            __int16 v19 = v13;
          }
          if (v18 <= v19) {
            double v20 = v19;
          }
          else {
            double v20 = &v36[v37];
          }
          if (v18 >= v19) {
            __int16 v21 = v19;
          }
          else {
            __int16 v21 = &v36[v37];
          }
          double v22 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v21, v20 - v21);
          __int16 v23 = [(CRLWPRep *)self p_newSelectionPathForSelection:v22 transform:0 headPinRect:0 tailPinRect:0 markedText:1];
          if (v23)
          {
            int v24 = objc_alloc_init(CRLWPSelectionHighlightLayer);
            [(CRLWPSelectionHighlightLayer *)v24 setPath:v23];
            [(CRLWPSelectionHighlightLayer *)v24 setStrokeColor:0];
            if (v17) {
              -[CRLWPSelectionHighlightLayer setFillColor:](v24, "setFillColor:", [v17 CGColor]);
            }
            else {
              -[CRLWPSelectionHighlightLayer setFillColor:](v24, "setFillColor:", [(id)qword_1016A98A0 CGColor]);
            }
            CFRelease(v23);
            [v35 addObject:v24];
          }
        }

        unint64_t v14 = *((void *)&v37 + 1) + v37;
        long long v37 = (unint64_t)(*((void *)&v37 + 1) + v37);
      }
      float v3 = v34;
      if ([v35 count]) {
        [(CAShapeLayer *)self->_markHighlightLayer setSublayers:v35];
      }
    }
    double v25 = [(CAShapeLayer *)self->_markHighlightLayer sublayers];
    id v26 = [v25 count];

    if (v26) {
      double v27 = 0;
    }
    else {
      double v27 = [(CRLWPRep *)self p_newSelectionPathForSelection:v9 transform:0 headPinRect:0 tailPinRect:0 markedText:1];
    }
    uint64_t v28 = [(CRLWPRep *)self textEditor];
    double v29 = [v28 markedText];

    if (v29)
    {
      double v30 = [v29 attributesAtIndex:0 effectiveRange:0];
      double v31 = [v30 objectForKeyedSubscript:NSBackgroundColorAttributeName];
      if (v31)
      {
        double v32 = +[CRLColor colorWithUIColor:v31];
        id v33 = [v32 CGColor];
      }
      else
      {
        id v33 = 0;
      }

      if (!v33) {
        goto LABEL_42;
      }
    }
    else
    {
      id v33 = [(id)qword_1016A98A0 CGColor];
      if (!v33) {
        goto LABEL_42;
      }
    }
    [(CAShapeLayer *)self->_markHighlightLayer setFillColor:v33];
    [(CAShapeLayer *)self->_markHighlightLayer setStrokeColor:0];
    [(CAShapeLayer *)self->_markHighlightLayer setPath:v27];
    [(CAShapeLayer *)self->_markHighlightLayer setHidden:0];
LABEL_42:
    CGPathRelease(v27);

    goto LABEL_43;
  }
  [(CAShapeLayer *)self->_markHighlightLayer setHidden:1];
LABEL_43:
  self->_markChanged = 0;
}

- (CGRect)boundsForCollaboratorCursorRenderable
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)invalidateCollaboratorCursorRenderable
{
  self->_collaboratorCursorRenderableValid = 0;
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (BOOL)shouldAddCollaboratorLayerToOverlays
{
  if ([(CRLWPRep *)self shouldShowCollaboratorCursorHighlight]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPRep;
  return [(CRLCanvasRep *)&v4 shouldAddCollaboratorLayerToOverlays];
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  objc_super v4 = [v3 collaboratorCursorDelegate];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v3 currentCollaboratorPresences];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [v4 collaboratorCursorSelectionPathForRenderer:v3 collaboratorPresence:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        unsigned __int8 v10 = [(CRLWPRep *)self p_storageMatchesSelectionPath:v9];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)collaboratorCursorChangedToSelectionPath:(id)a3
{
  id v4 = a3;
  if (qword_101719BE8 != -1) {
    dispatch_once(&qword_101719BE8, &stru_1014F4FD0);
  }
  uint64_t v5 = off_10166B618;
  if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Collaborator Cursor: Selection Path Changed called for rep: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if ([(CRLWPRep *)self p_storageMatchesSelectionPath:v4])
  {
    [(CRLCanvasRep *)self invalidateKnobs];
    [(CRLWPRep *)self invalidateCollaboratorCursorRenderable];
  }
}

- (void)hideCollaboratorCursors
{
  self->_collaboratorCursorRenderableValid = 0;
  [(CRLCanvasRep *)self invalidateKnobs];
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (BOOL)p_storageMatchesSelectionPath:(id)a3
{
  id v17 = a3;
  [(CRLCanvasRep *)self interactiveCanvasController];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  unsigned int v18 = v20 = 0u;
  id v4 = [v18 modelsForSelectionPath:v17];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        unsigned __int8 v10 = sub_1002469D0(v9, v8);
        if (!v10)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          uint64_t v13 = objc_opt_class();
          long long v14 = [v8 storage];
          unsigned __int8 v10 = sub_1002469D0(v13, v14);

          if (!v10) {
            continue;
          }
        }
        BOOL v11 = [(CRLWPRep *)self storage];
        BOOL v12 = v10 == v11;

        if (v12)
        {
          BOOL v15 = 1;
          goto LABEL_14;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (double)collaborativeCursorOpacityForCaret:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1016A98B8 != -1) {
    dispatch_once(&qword_1016A98B8, &stru_1014F4FF0);
  }
  id v4 = &qword_1016A98A8;
  if (!v3) {
    id v4 = &qword_1016A98B0;
  }
  return *(double *)v4;
}

- (void)p_withCollaboratorCursorPerformBlock:(id)a3
{
  id v47 = a3;
  CGFloat v51 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v46 = [v51 currentCollaboratorPresences];
  CGFloat v52 = [v51 collaboratorCursorDelegate];
  CGFloat v55 = self;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v46;
  id v4 = [obj countByEnumeratingWithState:&v61 objects:v83 count:16];
  if (v4)
  {
    uint64_t v50 = *(void *)v62;
    do
    {
      id v53 = v4;
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v7 = [v52 collaboratorCursorSelectionPathForRenderer:v51 collaboratorPresence:v6];
        if ([(CRLWPRep *)v55 p_storageMatchesSelectionPath:v7])
        {
          uint64_t v8 = objc_opt_class();
          uint64_t v9 = [v7 orderedSelections];
          unsigned __int8 v10 = [v9 lastObject];
          CGFloat v54 = sub_1002469D0(v8, v10);

          if ([v54 isValid])
          {
            id v11 = [v54 range];
            NSUInteger v13 = v12;
            long long v14 = [(CRLWPRep *)v55 storage];
            NSUInteger v48 = (NSUInteger)v11;
            unint64_t v15 = (unint64_t)v11 + v13;
            BOOL v16 = v15 > (unint64_t)[v14 length];

            if (v16)
            {
              unsigned int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F5010);
              }
              unsigned int v18 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
              {
                v85.NSUInteger location = v48;
                v85.NSUInteger length = v13;
                NSStringFromRange(v85);
                id v42 = (id)objc_claimAutoreleasedReturnValue();
                CGFloat v43 = [(CRLWPRep *)v55 storage];
                id v44 = [v43 length];
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)&uint8_t buf[4] = v17;
                *(_WORD *)&buf[8] = 2082;
                *(void *)&buf[10] = "-[CRLWPRep p_withCollaboratorCursorPerformBlock:]";
                *(_WORD *)&buf[18] = 2082;
                *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = 4043;
                *(_WORD *)&buf[34] = 2114;
                *(void *)&buf[36] = v42;
                *(_WORD *)&buf[44] = 2048;
                *(void *)&buf[46] = v44;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d collaborator selection extends past end of storage (%{public}@ > %lu)", buf, 0x36u);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014F5030);
              }
              long long v19 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
              {
                CGFloat v45 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&uint8_t buf[4] = v17;
                *(_WORD *)&buf[8] = 2114;
                *(void *)&buf[10] = v45;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              long long v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_withCollaboratorCursorPerformBlock:]");
              long long v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
              v84.NSUInteger location = v48;
              v84.NSUInteger length = v13;
              long long v22 = NSStringFromRange(v84);
              __int16 v23 = [(CRLWPRep *)v55 storage];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 4043, 0, "collaborator selection extends past end of storage (%{public}@ > %lu)", v22, [v23 length]);
            }
            int v24 = [(CRLWPRep *)v55 storage];
            BOOL v25 = v15 > (unint64_t)[v24 length];

            if (!v25)
            {
              id v26 = [(CRLCanvasRep *)v55 canvas];
              [v26 viewScale];
              double v28 = v27;

              if (v13)
              {
                double v29 = [(CRLWPRep *)v55 p_newSelectionPathForSelection:v54 transform:0 headPinRect:0 tailPinRect:0];
                if (v29)
                {
                  long long v30 = *(_OWORD *)&CGAffineTransformIdentity.tx;
                  long long v31 = *(_OWORD *)&CGAffineTransformIdentity.a;
                  v60[1] = *(_OWORD *)&CGAffineTransformIdentity.c;
                  v60[2] = v30;
                  v60[0] = v31;
                  (*((void (**)(id, CGPath *, _OWORD *, uint64_t, void))v47 + 2))(v47, v29, v60, v6, 0);
                  CFRelease(v29);
                }
              }
              else if ([(CRLWPRep *)v55 p_allowCaretForSelection:v54])
              {
                [(CRLWPRep *)v55 p_caretRectForSelection:v54];
                double x = v86.origin.x;
                double y = v86.origin.y;
                CGFloat width = v86.size.width;
                CGFloat height = v86.size.height;
                if (!CGRectIsNull(v86))
                {
                  uint64_t v82 = 0;
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v78 = 0u;
                  long long v79 = 0u;
                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  long long v72 = 0u;
                  long long v73 = 0u;
                  long long v70 = 0u;
                  long long v71 = 0u;
                  long long v68 = 0u;
                  long long v69 = 0u;
                  long long v66 = 0u;
                  long long v67 = 0u;
                  memset(buf, 0, sizeof(buf));
                  [(CRLWPRep *)v55 lineMetricsAtCharIndex:v48];
                  double v36 = [(CRLWPRep *)v55 columnForCharIndex:v48];
                  unsigned __int8 v37 = [v36 textIsVertical];
                  if ((v37 & 1) == 0)
                  {
                    double x = sub_1000657F8(x, y, width, height);
                    double y = 4.0 / v28 + *(double *)&buf[32];
                  }
                  Mutable = CGPathCreateMutable();
                  double v39 = Mutable;
                  if (Mutable)
                  {
                    double v40 = 7.0 / v28;
                    double v41 = 14.0 / v28;
                    CGPathMoveToPoint(Mutable, 0, x, y);
                    if (v37)
                    {
                      CGPathAddLineToPoint(v39, 0, x - v40, y - v41 * 0.5);
                      CGPathAddLineToPoint(v39, 0, x - v40, v41 * 0.5 + y);
                    }
                    else
                    {
                      double y = v40 + y;
                      CGPathAddLineToPoint(v39, 0, v41 * 0.5 + x, y);
                      double x = x - v41 * 0.5;
                    }
                    CGPathAddLineToPoint(v39, 0, x, y);
                    long long v58 = 0u;
                    long long v59 = 0u;
                    long long v57 = 0u;
                    [(CRLCanvasRep *)v55 transformToConvertNaturalToLayerRelative];
                    v56[1] = v58;
                    v56[2] = v59;
                    v56[0] = v57;
                    (*((void (**)(id, CGPath *, _OWORD *, uint64_t, uint64_t))v47 + 2))(v47, v39, v56, v6, 1);
                    CFRelease(v39);
                  }
                }
              }
            }
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v61 objects:v83 count:16];
    }
    while (v4);
  }
}

- (id)collaboratorCursorRenderable
{
  if (qword_101719BE8 != -1) {
    dispatch_once(&qword_101719BE8, &stru_1014F5050);
  }
  BOOL v3 = off_10166B618;
  if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    long long v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Requesting collaborator cursor renderable for WPRep: %{public}@", buf, 0xCu);
  }
  if (self->_collaboratorCursorRenderableValid
    || ([(CRLCanvasRep *)self interactiveCanvasController],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 currentCollaboratorPresences],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [v7 count] == 0,
        v7,
        v6,
        v8))
  {
    if (qword_101719BE8 != -1) {
      dispatch_once(&qword_101719BE8, &stru_1014F50B8);
    }
    id v4 = off_10166B618;
    if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Collaborator Cursor: Not regenerating renderable, because it was considered already valid, for WPRep: %{public}@", buf, 0xCu);
    }
    id v5 = 0;
  }
  else
  {
    if (qword_101719BE8 != -1) {
      dispatch_once(&qword_101719BE8, &stru_1014F5070);
    }
    uint64_t v9 = off_10166B618;
    if (os_log_type_enabled((os_log_t)off_10166B618, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      long long v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Collaborator Cursor: Actually re-generating renderable for WPRep: %{public}@", buf, 0xCu);
    }
    unsigned __int8 v10 = +[CRLCanvasRenderable renderable];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    long long v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    BOOL v16 = sub_1003BDF3C;
    unsigned int v17 = &unk_1014F5098;
    unsigned int v18 = self;
    id v5 = v10;
    id v19 = v5;
    [(CRLWPRep *)self p_withCollaboratorCursorPerformBlock:&v14];
    +[CATransaction commit];
    self->_collaboratorCursorRenderableValid = 1;
  }
  id v11 = self;
  objc_sync_enter(v11);
  p_collaboratorCursorRenderable = (id *)&v11->_collaboratorCursorRenderable;
  if (v5) {
    objc_storeStrong(p_collaboratorCursorRenderable, v5);
  }
  else {
    id v5 = *p_collaboratorCursorRenderable;
  }
  objc_sync_exit(v11);

  return v5;
}

- (id)currentCollaboratorCursorColor
{
  return +[CRLColor magentaColor];
}

- (void)p_hideCollaboratorCursorLayer
{
  id v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v3 setDuration:0.15];
  [v3 setToValue:&off_10155E058];
  [v3 setRemovedOnCompletion:0];
  [v3 setFillMode:kCAFillModeForwards];
  [(CRLCanvasRenderable *)self->_collaboratorCursorRenderable addAnimation:v3 forKey:@"opacity"];
}

- (void)p_showCollaboratorCursorLayer
{
  id v3 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v3 setDuration:0.15];
  [v3 setToValue:&off_10155E068];
  [v3 setRemovedOnCompletion:1];
  [(CRLCanvasRenderable *)self->_collaboratorCursorRenderable addAnimation:v3 forKey:@"opacity"];
}

- (BOOL)p_spellCheckingEnabled
{
  id v3 = [(CRLCanvasRep *)self canvas];
  if ([v3 spellCheckingSuppressed])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [(CRLCanvasRep *)self canvas];
    if ([v5 isCanvasInteractive])
    {
      uint64_t v6 = +[CRLWPObjcUserDefaults sharedUserDefaults];
      unsigned __int8 v4 = [v6 spellCheckingEnabled];
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  return v4;
}

- (BOOL)p_automaticTextSubstitutionEnabled
{
  id v3 = [(CRLCanvasRep *)self canvas];
  if ([v3 isCanvasInteractive])
  {
    unsigned __int8 v4 = [(CRLCanvasRep *)self canvas];
    unsigned int v5 = [v4 spellCheckingSuppressed] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)p_needsSpellChecker
{
  BOOL v3 = [(CRLWPRep *)self p_spellCheckingEnabled]
    || [(CRLWPRep *)self p_automaticTextSubstitutionEnabled];
  unsigned __int8 v4 = [(CRLWPRep *)self storage];
  if ([v4 wpKind] != 7)
  {
    unsigned int v5 = [(CRLWPRep *)self layout];
    if (![v5 isInstructional])
    {
      uint64_t v7 = [(CRLWPRep *)self storage];
      id v8 = [v7 length];

      if (v8) {
        return v3;
      }
      return 0;
    }
  }
  return 0;
}

- (void)p_createSpellChecker
{
  if (self->_spellChecker || ![(CRLWPRep *)self p_needsSpellChecker])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F50D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AAD04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F50F8);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSpellChecker]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:4212 isFatal:0 description:"Asked to create the spell checker when we don't need one."];
  }
  else
  {
    BOOL v3 = [(CRLWPRep *)self storage];
    unsigned __int8 v4 = +[CRLWPStorageSpellChecker newSpellCheckerForStorage:v3 selectionPath:0 orSearchCanvasDelegate:0];
    spellChecker = self->_spellChecker;
    self->_spellChecker = v4;

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"p_spellcheckFinished:" name:@"CRLWPBackgroundSpellCheckCompletedNotification" object:self->_spellChecker];
  }
}

- (void)p_spellcheckFinished:(id)a3
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003BE8AC;
  v7[3] = &unk_1014F5120;
  objc_copyWeak(&v8, &location);
  unsigned __int8 v4 = objc_retainBlock(v7);
  if (a3) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = 50000000;
  }
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)p_destroySpellChecker
{
  spellChecker = self->_spellChecker;
  self->_spellChecker = 0;
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPRep;
  [(CRLCanvasRep *)&v4 didDrawInLayer:a3 context:a4];
}

- (void)p_selectionChangedNotification:(id)a3
{
  objc_super v4 = [a3 userInfo];
  if (v4)
  {
    id v15 = v4;
    int64_t v5 = [v4 objectForKeyedSubscript:@"CRLWPEditorKey"];
    dispatch_time_t v6 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v7 = [v5 interactiveCanvasController];
    if (v7 == v6)
    {
      id v8 = [v5 storage];
      id v9 = [(CRLWPRep *)self storage];

      if (v8 == v9)
      {
        self->_selectionChanged = 1;
        unsigned __int8 v10 = [v15 objectForKeyedSubscript:@"CRLWPEditorSelectionFlagsKey"];
        self->_unint64_t newSelectionFlags = (unint64_t)[v10 unsignedIntegerValue];

        unint64_t newSelectionFlags = self->_newSelectionFlags;
        if ((newSelectionFlags & 0x100) != 0)
        {
          NSUInteger v12 = [(CRLCanvasRep *)self canvas];
          [v12 invalidateReps];

          unint64_t newSelectionFlags = self->_newSelectionFlags;
        }
        self->_hudStateDirtdouble y = (newSelectionFlags & 0x800) == 0;
        NSUInteger v13 = [(CRLWPRep *)self layout];
        unsigned int v14 = [v13 layoutIsValid];

        if (v14) {
          [(CRLWPRep *)self i_setNeedsDisplayForSelectionChange];
        }
        [(CRLCanvasRep *)self invalidateKnobs];
      }
    }
    else
    {
    }
    objc_super v4 = v15;
  }
}

- (void)p_updateCaretLayerColor
{
  caretLayer = self->_caretLayer;
  if (caretLayer)
  {
    if ([(CAShapeLayer *)caretLayer fillColor])
    {
      objc_super v4 = [(CRLWPRep *)self p_caretLayerColor];
      if (v4)
      {
        int64_t v5 = v4;
        if (!CGColorEqualToColor([(CAShapeLayer *)self->_caretLayer fillColor], v4))
        {
          dispatch_time_t v6 = self->_caretLayer;
          [(CAShapeLayer *)v6 setFillColor:v5];
        }
      }
    }
  }
}

- (CGColor)p_caretLayerColor
{
  BOOL v3 = [(CRLWPRep *)self overrideCaretColor];

  if (v3)
  {
    objc_super v4 = [(CRLWPRep *)self overrideCaretColor];
    int64_t v5 = (CGColor *)[v4 CGColor];

    return v5;
  }
  else
  {
    return [(CRLWPRep *)self p_highlightLineColor];
  }
}

- (CGColor)p_highlightLineColor
{
  uint64_t v2 = +[CRLColor colorWithRed:0.0 green:0.435294118 blue:0.890196078 alpha:1.0];
  BOOL v3 = (CGColor *)[v2 CGColor];

  return v3;
}

- (CGAffineTransform)transformToConvertNaturalToScaledRoot
{
  memset(&v13, 0, sizeof(v13));
  int64_t v5 = [(CRLWPRep *)self layout];
  dispatch_time_t v6 = v5;
  if (v5) {
    [v5 transformInRoot];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }

  uint64_t v7 = [(CRLCanvasRep *)self canvas];
  [v7 viewScale];
  CGFloat v9 = v8;

  CGAffineTransform t1 = v13;
  CGAffineTransformMakeScale(&v11, v9, v9);
  return CGAffineTransformConcat(retstr, &t1, &v11);
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  dispatch_time_t v6 = [(CRLWPRep *)self storage];
  id v7 = [v6 length];

  if (v7)
  {
    unsigned __int8 v16 = 0;
    double v8 = [(CRLWPRep *)self layout];
    unint64_t v9 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:", 0, &v16, v8, x, y);

    uint64_t v10 = v16;
    CGAffineTransform v11 = [CRLWPSelection alloc];
    unint64_t v12 = v9;
    uint64_t v13 = v10;
  }
  else
  {
    CGAffineTransform v11 = [CRLWPSelection alloc];
    unint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  unsigned int v14 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:](v11, "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v12, 0, 0, v13);

  return v14;
}

- (id)textEditorForDropIntoStorage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CRLWPRep *)self textEditor];
  if (v5)
  {
    id v6 = [(CRLWPRep *)self storage];

    if (v6 != v4)
    {
      unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5140);
      }
      double v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        long long v22 = [(CRLWPRep *)self storage];
        *(_DWORD *)buf = 67110402;
        unsigned int v24 = v7;
        __int16 v25 = 2082;
        id v26 = "-[CRLWPRep textEditorForDropIntoStorage:]";
        __int16 v27 = 2082;
        double v28 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        __int16 v29 = 1024;
        int v30 = 4390;
        __int16 v31 = 2112;
        id v32 = v4;
        __int16 v33 = 2112;
        double v34 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Specified storage (%@) is not the rep storage (%@).", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5160);
      }
      unint64_t v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep textEditorForDropIntoStorage:]");
      CGAffineTransform v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      unint64_t v12 = [(CRLWPRep *)self storage];
      +[CRLAssertionHandler handleFailureInFunction:v10, v11, 4390, 0, "Specified storage (%@) is not the rep storage (%@).", v4, v12 file lineNumber isFatal description];
    }
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    unsigned int v14 = [v4 parentInfo];
    id v15 = sub_1002469D0(v13, v14);

    id v16 = objc_alloc([(CRLWPRep *)self wpEditorClass]);
    unsigned int v17 = [(CRLCanvasRep *)self interactiveCanvasController];
    unsigned int v18 = [v17 editingCoordinator];
    id v19 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v20 = [v16 initWithEditingCoordinator:v18 enclosingShape:v15 icc:v19];

    int64_t v5 = v20;
  }

  return v5;
}

- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  if ([v9 isRange])
  {
    uint64_t v10 = [(CRLWPRep *)self layout];
    unint64_t v11 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", 0, 0, 0, 0, v10, x, y);

    if (v5) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 0;
    }
    unsigned __int8 v13 = [v9 containsCharacterAtIndex:v11 withOptions:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (BOOL)allowGenericDrags
{
  return 0;
}

- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation
{
  BOOL v3 = [(CRLWPRep *)self storage];
  id v4 = [(CRLCanvasRep *)self parentRep];
  unint64_t v11 = sub_100246AC8(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLWPRepParent);

  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v12 = [v11 storageForDragDropOperation];

    BOOL v3 = (void *)v12;
  }

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (id)backgroundColorForDragPreviewOfSelection:(id)a3
{
  BOOL v3 = [(CRLWPRep *)self colorBehindLayer:self->_textLayers[1]];
  if (!v3)
  {
    BOOL v3 = +[CRLColor whiteColor];
  }

  return v3;
}

- (void)p_clearICCPrimaryFindResultSearchReference
{
  BOOL v3 = [(CRLWPRep *)self primaryFindResultSearchReference];
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v4 canvasInvalidatedForRep:self];

  uint64_t v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v6 = [v5 canvas];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003BF644;
  v8[3] = &unk_1014ECF00;
  v8[4] = self;
  id v7 = v3;
  id v9 = v7;
  [v6 performBlockAfterLayoutIfNecessary:v8];
}

- (void)pulseAnimationDidStop:(id)a3
{
  id v4 = (CRLWPHighlightArrayController *)a3;
  uint64_t v5 = v4;
  if (self->_pulseArrayController == v4)
  {
    if ([(CRLWPHighlightArrayController *)v4 autohide])
    {
      [(CRLWPRep *)self p_setPulseControllerActive:0 autohide:0];
      if (self->_pulseArrayController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5180);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AAD8C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F51A0);
        }
        uint64_t v6 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep pulseAnimationDidStop:]");
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4471, 0, "expected nil value for '%{public}s'", "_pulseArrayController");
      }
      id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
      uint64_t v10 = [v9 primaryFindResultSearchReference];
      BOOL v11 = v10 == 0;

      if (!v11)
      {
        uint64_t v12 = [(CRLCanvasRep *)self interactiveCanvasController];
        unsigned __int8 v13 = [v12 primaryFindResultSearchReference];
        unsigned int v14 = [(CRLWPRep *)self primaryFindResultSearchReference];
        unsigned int v15 = [v13 isEqual:v14];

        if (v15) {
          [(CRLWPRep *)self p_clearICCPrimaryFindResultSearchReference];
        }
      }
      [(CRLWPRep *)self p_setPrimaryFindResultSearchReference:0];
      [(CRLWPRep *)self p_updateForCurrentSelectionWithFlags:0];
      [(CRLCanvasRep *)self invalidateKnobs];
      id v16 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v16 canvasInvalidatedForRep:self];
    }
    unsigned int v17 = [(CRLWPRep *)self primaryFindResultSearchReference];
    [v17 setPulseHighlight:0];
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  id v4 = (CRLPulseAnimationController *)a3;
  if (self->_caretPulseController == v4)
  {
    self->_caretPulseController = 0;
    uint64_t v6 = v4;

    uint64_t v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v5 canvasInvalidatedForRep:self];

    id v4 = v6;
  }
}

- (unint64_t)pulseAnimationStyle:(id)a3
{
  id v4 = [(CRLWPRep *)self primaryFindResultSearchReference];

  if (v4)
  {
    uint64_t v5 = [(CRLWPRep *)self primaryFindResultSearchReference];
    id v4 = [v5 pulseAnimationStyle];
  }
  return (unint64_t)v4;
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    BOOL v6 = a4;
    if (!pulseArrayController)
    {
      id v7 = [[CRLWPHighlightArrayController alloc] initWithZOrder:self delegate:8.0];
      uint64_t v8 = self->_pulseArrayController;
      self->_pulseArrayController = v7;

      pulseArrayController = self->_pulseArrayController;
    }
    [(CRLWPHighlightArrayController *)pulseArrayController setShouldPulsate:1];
    [(CRLWPHighlightArrayController *)self->_pulseArrayController setAutohide:v6];
    id v9 = [(CRLWPRep *)self layout];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 transformInRoot];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
    }
    BOOL v11 = self->_pulseArrayController;
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    [(CRLWPHighlightArrayController *)v11 setTransform:v13];

    uint64_t v12 = [(CRLCanvasRep *)self canvas];
    [v12 viewScale];
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
  }
  else if (pulseArrayController)
  {
    self->_pulseArrayController = 0;
  }
}

- (BOOL)p_doesRepIntersectSearchReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = sub_1002469D0(v5, v4);
  id v7 = v6;
  if (v6
    && ([v6 storage],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(CRLWPRep *)self storage],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v8 == v9))
  {
    uint64_t v10 = [v7 selection];
    BOOL v11 = v10;
    if (v10)
    {
      [v10 range];
      if (v12)
      {
        self = (CRLWPRep *)[(CRLWPRep *)self range];
        NSUInteger v14 = v13;
        v18.id location = (NSUInteger)[v11 range];
        v18.NSUInteger length = v15;
        v17.id location = (NSUInteger)self;
        v17.NSUInteger length = v14;
        LOBYTE(self) = NSIntersectionRange(v17, v18).length != 0;
      }
      else
      {
        [(CRLWPRep *)self caretRectForSelection:v11];
        LODWORD(self) = !CGRectIsNull(v19);
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)i_primaryFindResultChanged:(id)a3
{
  id v5 = a3;
  if (-[CRLWPRep p_doesRepIntersectSearchReference:](self, "p_doesRepIntersectSearchReference:")
    || ([(CRLWPRep *)self primaryFindResultSearchReference],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(CRLWPRep *)self p_setPrimaryFindResultSearchReference:v5];
  }
}

- (void)p_setPrimaryFindResultSearchReference:(id)a3
{
  id v10 = a3;
  unsigned int v4 = -[CRLWPRep p_doesRepIntersectSearchReference:](self, "p_doesRepIntersectSearchReference:");
  pulseArrayController = self->_pulseArrayController;
  if (v4)
  {
    [(CRLWPHighlightArrayController *)pulseArrayController stop];
    -[CRLWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", v10 != 0, [v10 autohideHighlight]);
    uint64_t v6 = objc_opt_class();
    id v7 = sub_1002469D0(v6, v10);
    [(CRLWPRep *)self setPrimaryFindResultSearchReference:v7];
  }
  else
  {
    [(CRLWPHighlightArrayController *)pulseArrayController stop];
    [(CRLWPRep *)self p_setPulseControllerActive:0 autohide:0];
    [(CRLWPRep *)self setPrimaryFindResultSearchReference:0];
    self->_selectionChanged = 1;
  }
  self->_BOOL searchHitsAreInvalid = 1;
  uint64_t v8 = [(CRLWPRep *)self layout];
  [v8 invalidate];

  id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v9 canvasInvalidatedForRep:self];
}

- (void)i_setSearchReferencesToHighlight:(id)a3
{
  id v9 = a3;
  unsigned int v4 = [(CRLWPRep *)self storage];
  id v5 = [v9 objectForKeyedSubscript:v4];

  uint64_t v6 = [(CRLWPRep *)self searchReferences];

  if (v6 != v5)
  {
    [(CRLWPRep *)self setSearchReferences:v5];
    self->_BOOL searchHitsAreInvalid = 1;
    id v7 = [(CRLWPRep *)self layout];
    [v7 invalidate];

    uint64_t v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v8 canvasInvalidatedForRep:self];

    [(CRLCanvasRep *)self invalidateKnobs];
  }
}

- (void)prepareLayoutForImagingSearchReferencesAsActive:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void))a4;
  id v7 = [(CRLWPRep *)self storage];
  unsigned int v8 = [v7 wpKind];

  if (v8 >= 3)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [(CRLWPRep *)self layout];
    BOOL v11 = sub_1002469D0(v9, v10);

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F51C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AAEA8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F51E0);
      }
      uint64_t v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      NSUInteger v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:]");
      NSUInteger v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 4588, 0, "invalid nil value for '%{public}s'", "layout");
    }
    NSUInteger v15 = [v11 layoutController];
    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5200);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AAE20();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F5220);
      }
      long long v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      NSRange v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:]");
      NSRange v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:4590 isFatal:0 description:"Building a imageSearchReference for a layout that has no layout controller"];
    }
    if (v4) {
      CGColorRef v19 = sub_1001D0764();
    }
    else {
      CGColorRef v19 = sub_1001D0784();
    }
    id v20 = v19;
    long long v21 = +[CRLColor colorWithCGColor:v19];
    [(CRLWPRep *)self setBackgroundColor:v21];

    [v15 validateLayoutWithDependencies:v11];
    if ([v11 layoutIsValid]) {
      v6[2](v6);
    }
    [(CRLWPRep *)self setBackgroundColor:0];
    CGColorRelease(v20);
    [v15 validateLayoutWithDependencies:v11];
  }
  else
  {
    v6[2](v6);
  }
}

- (void)p_updateHighlights
{
  BOOL v3 = [(CRLWPRep *)self searchReferences];
  id v4 = [v3 count];

  highlightArrayController = self->_highlightArrayController;
  if (v4)
  {
    if (!highlightArrayController)
    {
      uint64_t v6 = [[CRLWPHighlightArrayController alloc] initWithZOrder:self delegate:3.0];
      id v7 = self->_highlightArrayController;
      self->_highlightArrayController = v6;
    }
    unsigned int v8 = [(CRLWPRep *)self layout];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 transformInRoot];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    id v10 = self->_highlightArrayController;
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    [(CRLWPHighlightArrayController *)v10 setTransform:v16];

    BOOL v11 = [(CRLCanvasRep *)self canvas];
    [v11 viewScale];
    -[CRLWPHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");

    [(CRLWPHighlightArrayController *)self->_highlightArrayController reset];
    uint64_t v12 = [(CRLWPRep *)self searchReferences];
    id v13 = [v12 count];

    if (v13)
    {
      NSUInteger v14 = sub_1001D0784();
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1003C08F0;
      v15[3] = &unk_1014F4D88;
      v15[4] = self;
      v15[5] = v14;
      [(CRLWPRep *)self prepareLayoutForImagingSearchReferencesAsActive:0 usingBlock:v15];
      CGColorRelease(v14);
    }
  }
  else if (highlightArrayController)
  {
    self->_highlightArrayController = 0;
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  id v4 = [a3 selectionPath];
  id v5 = [v4 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v5)
  {
    [v5 range];
    if (v6)
    {
      long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v39[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v39[1] = v7;
      v39[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      Mutable = [(CRLWPRep *)self p_newPathForSelection:v5 withTransform:v39 withInset:-1.0];
    }
    else
    {
      [(CRLWPRep *)self caretRectForSelection:v5];
      double v10 = v9;
      double v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v17 = [(CRLWPRep *)self columns];
      id v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v43;
LABEL_7:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
          [v21 frameBounds];
          if (sub_1000642DC(v22, v23, v24, v25, v10, v12)) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
            if (v18) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }
        id v26 = v21;

        if (!v26) {
          goto LABEL_16;
        }
        [v26 transformToWP];
        char v27 = 0;
      }
      else
      {
LABEL_13:

LABEL_16:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5240);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AAF3C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5260);
        }
        double v28 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        __int16 v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep newPathForSearchReference:]");
        int v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 4669, 0, "invalid nil value for '%{public}s'", "columnContainingRect");

        id v26 = 0;
        memset(&v41, 0, sizeof(v41));
        char v27 = 1;
      }
      v47.origin.CGFloat x = v10;
      v47.origin.CGFloat y = v12;
      v47.size.CGFloat width = v14;
      v47.size.double height = v16;
      CGRect v48 = CGRectApplyAffineTransform(v47, &v41);
      CGFloat x = v48.origin.x;
      CGFloat y = v48.origin.y;
      double height = v48.size.height;
      if (v27) {
        memset(&v40, 0, sizeof(v40));
      }
      else {
        [v26 transformFromWP];
      }
      v49.size.CGFloat width = height * 0.444444444;
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.double height = height;
      CGRect v50 = CGRectApplyAffineTransform(v49, &v40);
      CGFloat v34 = v50.origin.x;
      CGFloat v35 = v50.origin.y;
      CGFloat width = v50.size.width;
      CGFloat v37 = v50.size.height;
      if (CGRectIsEmpty(v50))
      {
        Mutable = 0;
      }
      else
      {
        Mutable = CGPathCreateMutable();
        v51.origin.CGFloat x = v34;
        v51.origin.CGFloat y = v35;
        v51.size.CGFloat width = width;
        v51.size.double height = v37;
        CGRect v52 = CGRectIntegral(v51);
        CGPathAddRect(Mutable, 0, v52);
      }
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  BOOL v5 = a5;
  long long v7 = [a3 selectionPath];
  unsigned int v8 = [v7 mostSpecificSelectionOfClass:objc_opt_class()];

  [v8 range];
  if (v9)
  {
    LOBYTE(v12) = 0;
    double v10 = [(CRLWPRep *)self textImageForSelection:v8 frame:0 usingGlyphRect:0 shouldPulsate:v5 suppressInvisibles:0 suppressChildReps:0 drawBackground:-1.0 inset:v12];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v10 = a3;
  -[CRLWPRepHelper animationDidStop:caretLayer:floatingCaretLayer:](self->_repHelper, "animationDidStop:caretLayer:floatingCaretLayer:");
  BOOL v5 = [(CRLWPRep *)self floatingCaretLayer];
  id v6 = [v5 animationForKey:@"dropAnimation"];

  long long v7 = v10;
  if (v6 == v10)
  {
    unsigned int v8 = [(CRLWPRep *)self floatingCaretLayer];
    [v8 removeFromSuperlayer];

    [(CRLWPRep *)self setFloatingCaretLayer:0];
    uint64_t v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v9 invalidateOverlayLayersForRep:self];

    long long v7 = v10;
  }
}

- (NSArray)scribbleCapableElements
{
  id v4 = self;
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

- (id)prepareForScribbleBlock
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C12DC;
  v5[3] = &unk_1014F5288;
  v5[4] = self;
  uint64_t v2 = objc_retainBlock(v5);
  BOOL v3 = objc_retainBlock(v2);

  return v3;
}

- (id)willBeginWritingBlock
{
  return 0;
}

- (id)scribbleEditingBlock
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003C13AC;
  v5[3] = &unk_1014F52B0;
  v5[4] = self;
  uint64_t v2 = objc_retainBlock(v5);
  BOOL v3 = objc_retainBlock(v2);

  return v3;
}

- (void)scribbleSetSelectionForBeginEditingWithBoundsPoint:(CGPoint)a3 tappedInRep:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unsigned int v8 = [(CRLCanvasRep *)self canvas];
  uint64_t v9 = [v8 canvasController];

  id v10 = [v9 editorController];
  double v11 = [v10 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  uint64_t v12 = [v11 storage];
  double v13 = [v7 storage];

  if (v12 != v13)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F52D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AAFD0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F52F0);
    }
    CGFloat v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep scribbleSetSelectionForBeginEditingWithBoundsPoint:tappedInRep:]");
    CGFloat v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:4761 isFatal:0 description:"Expected the tapped rep to match our storage."];
  }
  [v9 convertBoundsToUnscaledPoint:x, y];
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  double v18 = v17;
  double v20 = v19;
  unsigned __int8 v35 = 0;
  long long v21 = [v7 layout];
  LOBYTE(v32) = 0;
  unint64_t v22 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:", 0, 0, 1, 1, &v35, 0, v18, v20, v32, v21);

  unsigned int v23 = v35;
  if (-[CRLWPRep scribbleExceedsVerticalDistanceForNearestCharIndex:boundsPoint:isAtEndOfLine:](self, "scribbleExceedsVerticalDistanceForNearestCharIndex:boundsPoint:isAtEndOfLine:", v22, v35, x, y))
  {
    double v24 = [v7 layout];
    LOBYTE(v33) = 0;
    unint64_t v22 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:", 0, 0, 1, 0, &v35, 0, v18, v20, v33, v24);

    unsigned int v23 = v35;
  }
  double v25 = [CRLWPSelection alloc];
  id v26 = [v7 storage];
  LOBYTE(v34) = 1;
  char v27 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v25, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, v22, 0, 0, v23, 0x7FFFFFFFFFFFFFFFLL, 0, v34, v26);

  double v28 = [v9 selectionModelTranslator];
  __int16 v29 = [v7 storage];
  int v30 = [v28 selectionPathForSelection:v27 onStorage:v29];

  __int16 v31 = [v9 editorController];
  [v31 setSelectionPath:v30];
}

- (BOOL)scribbleExceedsVerticalDistanceForNearestCharIndex:(unint64_t)a3 boundsPoint:(CGPoint)a4 isAtEndOfLine:(BOOL)a5
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  double y = a4.y;
  -[CRLWPRep caretRectForCharIndex:caretAffinity:](self, "caretRectForCharIndex:caretAffinity:", a3, a5, a4.x);
  [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:sub_100065738(v8, v9, v10, v11)];
  double v13 = v12;
  double v15 = v14;
  CGFloat v16 = [(CRLCanvasRep *)self canvas];
  double v17 = [v16 canvasController];

  [v17 convertUnscaledToBoundsPoint:v13, v15];
  BOOL v5 = vabdd_f64(y, v18) > 100.0;

  return v5;
}

- (CGRect)scaledScribbleEditingFrame
{
  BOOL v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [(CRLCanvasRep *)self frameInUnscaledCanvas];
  [v3 convertUnscaledToBoundsRect:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)shouldDelayScribbleFocus
{
  return 0;
}

- (BOOL)scribbleElementIsFocused
{
  uint64_t v2 = [(CRLWPRep *)self textEditor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updateUniversalAccessZoomWindow
{
  if (_UIAccessibilityZoomTouchEnabled())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003C1DEC;
    v10[3] = &unk_1014F5318;
    void v10[4] = self;
    BOOL v3 = objc_retainBlock(v10);
    if (((uint64_t (*)(void *, CRLWPSelection *))v3[2])(v3, self->_lastSelection) != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v4 = self->_lastSelection;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1003C1F44;
      v6[3] = &unk_1014F5340;
      double v8 = self;
      double v9 = v3;
      double v7 = v4;
      double v5 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    }
  }
}

- (CGRect)p_convertRectIntoZoomCoordinates:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CRLCanvasRep *)self interactiveCanvasController];
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", x, y, width, height);
  [v8 convertUnscaledToBoundsRect:];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (id)p_selectionPathIncludingInfo:(id)a3 excludingInfo:(id)a4
{
  return 0;
}

- (id)p_textEditorForTextStorage:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = sub_1003C233C;
  double v17 = sub_1003C234C;
  id v18 = 0;
  double v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  double v6 = [v5 editorController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003C2354;
  v10[3] = &unk_1014F5368;
  id v7 = v4;
  id v11 = v7;
  double v12 = &v13;
  [v6 enumerateEditorsOnStackUsingBlock:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (CRLWPSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
}

- (BOOL)findIsShowing
{
  return self->_findIsShowing;
}

- (void)setFindIsShowing:(BOOL)a3
{
  self->_findIsShowing = a3;
}

- (CRLWPStorageSpellChecker)spellChecker
{
  return self->_spellChecker;
}

- (BOOL)usesStandardHighlightColorForReplaceSelections
{
  return self->_usesStandardHighlightColorForReplaceSelections;
}

- (void)setUsesStandardHighlightColorForReplaceSelections:(BOOL)a3
{
  self->_usesStandardHighlightColorForReplaceSelections = a3;
}

- (CALayer)dragAndDropTopicLayer
{
  return self->_dragAndDropTopicLayer;
}

- (void)setDragAndDropTopicLayer:(id)a3
{
}

- (CRLNoDefaultImplicitActionLayer)dragAndDropTopicIndentLayer
{
  return self->_dragAndDropTopicIndentLayer;
}

- (void)setDragAndDropTopicIndentLayer:(id)a3
{
}

- (CAShapeLayer)dragAndDropCaretLayer
{
  return self->_dragAndDropCaretLayer;
}

- (void)setDragAndDropCaretLayer:(id)a3
{
}

- (CRLColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (CRLWPSelection)dropSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropSelection);

  return (CRLWPSelection *)WeakRetained;
}

- (BOOL)dragOperationInProgress
{
  return self->_dragOperationInProgress;
}

- (void)setDragOperationInProgress:(BOOL)a3
{
  self->_dragOperationInProgress = a3;
}

- (BOOL)isSelectionHighlightSuppressed
{
  return self->_suppressSelectionHighlight;
}

- (BOOL)suppressSelectionControls
{
  return self->_suppressSelectionControls;
}

- (void)setSuppressSelectionControls:(BOOL)a3
{
  self->_suppressSelectionControls = a3;
}

- (_NSRange)dragRange
{
  p_dragRange = &self->_dragRange;
  NSUInteger location = self->_dragRange.location;
  NSUInteger length = p_dragRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)useKeyboardWhenEditing
{
  return self->_useKeyboardWhenEditing;
}

- (void)setUseKeyboardWhenEditing:(BOOL)a3
{
  self->_useKeyboardWhenEditing = a3;
}

- (BOOL)shouldIgnoreFirstRequestToShowEditMenu
{
  return self->_shouldIgnoreFirstRequestToShowEditMenu;
}

- (void)setShouldIgnoreFirstRequestToShowEditMenu:(BOOL)a3
{
  self->_shouldIgnoreFirstRequestToShowEditMenu = a3;
}

- (BOOL)hasOverflowed
{
  return self->_hasOverflowed;
}

- (void)setHasOverflowed:(BOOL)a3
{
  self->_hasOverflowed = a3;
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
}

- (CAShapeLayer)floatingCaretLayer
{
  return self->_floatingCaretLayer;
}

- (void)setFloatingCaretLayer:(id)a3
{
}

- (BOOL)dragAndDropCaretLayerIsForCaret
{
  return self->_dragAndDropCaretLayerIsForCaret;
}

- (void)setDragAndDropCaretLayerIsForCaret:(BOOL)a3
{
  self->_dragAndDropCaretLayerIsForCaret = a3;
}

- (CRLWPSelection)lastSelection
{
  return self->_lastSelection;
}

- (void)setLastSelection:(id)a3
{
}

- (double)ibeamLength
{
  return self->_ibeamLength;
}

- (void)setIbeamLength:(double)a3
{
  self->_ibeamLength = a3;
}

- (CRLColor)overrideCaretColor
{
  return self->_overrideCaretColor;
}

- (void)setOverrideCaretColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCaretColor, 0);
  objc_storeStrong((id *)&self->_floatingCaretLayer, 0);
  objc_storeStrong((id *)&self->_searchReferences, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_dragAndDropCaretLayer, 0);
  objc_storeStrong((id *)&self->_dragAndDropTopicIndentLayer, 0);
  objc_storeStrong((id *)&self->_dragAndDropTopicLayer, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_dragAndDropHelper, 0);
  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);
  objc_storeStrong((id *)&self->_repHelper, 0);
  objc_storeStrong((id *)&self->_caretController, 0);
  objc_storeStrong((id *)&self->_collaboratorCursorRenderable, 0);
  objc_destroyWeak((id *)&self->_dropSelection);
  objc_storeStrong((id *)&self->_lastSelection, 0);
  objc_storeStrong((id *)&self->_ungrammaticRanges, 0);
  objc_storeStrong((id *)&self->_misspelledRanges, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_caretPulseController, 0);
  objc_storeStrong((id *)&self->_highlightArrayController, 0);
  objc_storeStrong((id *)&self->_pulseArrayController, 0);
  objc_storeStrong((id *)&self->_secondaryHighlightLayer, 0);
  objc_storeStrong((id *)&self->_smartFieldHighlightLayer, 0);
  objc_storeStrong((id *)&self->_markHighlightLayer, 0);
  objc_storeStrong((id *)&self->_selectionParagraphBorderLayer, 0);
  objc_storeStrong((id *)&self->_selectionHighlightLayer, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_selectionLineLayers[i], 0);
  objc_storeStrong((id *)&self->_caretLayer, 0);
  textLayers = self->_textLayers;
  for (uint64_t j = 1; j != -1; --j)
    objc_storeStrong((id *)&textLayers[j], 0);
}

- (NSArray)hyperlinkRegions
{
  uint64_t v2 = self;
  CRLWPRep.hyperlinkRegions.getter();

  sub_10050BF48(0, &qword_10168C228);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (CGRect)getCurrentTextFieldBounds
{
  uint64_t v2 = self;
  sub_100A177BC();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (id)contextMenuConfigurationAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = (void *)sub_100B3CA8C(v5, x, y);

  return v6;
}

- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = self;
  id v9 = sub_100B3DE5C((uint64_t)v7, v8, x, y);

  return v9;
}

@end