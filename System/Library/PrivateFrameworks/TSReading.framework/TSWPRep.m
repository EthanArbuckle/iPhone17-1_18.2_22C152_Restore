@interface TSWPRep
- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3;
- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtPoint:(SEL)a3;
- ($739D45CC02FBFC6E8CDDA7A2D0BB8DAA)wordMetricsAtCharIndex:(SEL)a3;
- (BOOL)canEditWithEditor:(id)a3;
- (BOOL)containsText;
- (BOOL)directlyManagesLayerContent;
- (BOOL)doesNeedDisplayOnEditingDidEnd;
- (BOOL)findIsShowing;
- (BOOL)forceTiling;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)handlesEditMenu;
- (BOOL)isEditing;
- (BOOL)isOverflowing;
- (BOOL)isPointInSelectedArea:(CGPoint)a3;
- (BOOL)isSelectionHighlightSuppressed;
- (BOOL)p_canRepBeginEditingOnDoubleTap;
- (BOOL)p_canShowSelectionAndCaretLayers;
- (BOOL)p_hasEmptyList;
- (BOOL)p_hasVisibleContents;
- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment;
- (BOOL)p_paragraphModeBorderNeededForColumn:(id)a3 dragCharIndex:(unint64_t)a4 knobTag:(unint64_t)a5;
- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5;
- (BOOL)p_shouldDisplaySelectionControls;
- (BOOL)p_spellCheckingEnabled;
- (BOOL)preventClipToColumn;
- (BOOL)shouldAlwaysAutoHide;
- (BOOL)shouldBeginEditingWithGesture:(id)a3;
- (BOOL)shouldCreateCommentKnobs;
- (BOOL)shouldCreateLockedKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldCreateTextKnobs;
- (BOOL)shouldHideSelectionControls;
- (BOOL)shouldShowKnobs;
- (BOOL)textIsVertical;
- (BOOL)useDynamicTiling;
- (BOOL)useKeyboardWhenEditing;
- (BOOL)wantsToHandleTapsOnContainingGroup;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGAffineTransform)transformToConvertNaturalToScaledRoot;
- (CGColor)p_caretLayerColor;
- (CGPath)newPathForSearchReference:(id)a3;
- (CGPath)p_createPathForParagraphSelection:(id)a3 needsParagraphBorder:(BOOL)a4;
- (CGPath)p_newSelectionPathForRange:(_NSRange)a3 headKnobRect:(CGRect *)a4 tailKnobRect:(CGRect *)a5 selectionType:(int)a6 selection:(id)a7;
- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4;
- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4;
- (CGPoint)pinToClosestColumn:(CGPoint)a3;
- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4;
- (CGRect)caretRect;
- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(int)a4;
- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(int)a5;
- (CGRect)clipRect;
- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4;
- (CGRect)columnRectForRange:(_NSRange)a3;
- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4;
- (CGRect)labelRectForCharIndex:(unint64_t)a3;
- (CGRect)naturalBoundsRectForHyperlinkField:(id)a3;
- (CGRect)newTextLayerUnscaledBounds:(CGRect)a3 forNewTextBounds:(CGRect)a4;
- (CGRect)p_caretRectForSelection:(id)a3;
- (CGRect)p_clipRect:(CGRect)a3;
- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4;
- (CGRect)p_paragraphModeRectangleForColumn:(id)a3 selection:(id)a4;
- (CGRect)p_topicDragRectForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3;
- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4;
- (CGRect)selectionRect;
- (Class)layerClass;
- (Class)wpEditorClass;
- (NSArray)columns;
- (NSArray)searchReferences;
- (TSWPEditingController)textEditor;
- (TSWPRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSWPSearchReference)activeSearchReference;
- (TSWPSelection)dropSelection;
- (TSWPSelection)selection;
- (TSWPStorage)storage;
- (_NSRange)dragRange;
- (_NSRange)range;
- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3;
- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)beginEditing;
- (id)closestColumnForPoint:(CGPoint)a3;
- (id)columnForCharIndex:(unint64_t)a3;
- (id)decoratorOverlayLayers;
- (id)footnoteMarkAttachmentAtPoint:(CGPoint)a3;
- (id)footnoteReferenceAttachmentAtPoint:(CGPoint)a3;
- (id)hyperlinkContainerRep;
- (id)hyperlinkRegions;
- (id)hyperlinkRegionsConstrainedToLineAtPoint:(CGPoint)a3;
- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5;
- (id)lineSearchReferencesForSearchReference:(id)a3;
- (id)newTrackerForKnob:(id)a3;
- (id)overlayLayers;
- (id)p_annotationAtPoint:(CGPoint)a3 outRange:(_NSRange *)a4;
- (id)p_hyperlinkAtPoint:(CGPoint)a3;
- (id)p_hyperlinkWithTouch:(id)a3;
- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 drawBackground:(BOOL)a5 shouldPulsate:(BOOL)a6 forCaret:(BOOL)a7 drawSelection:(id)a8 suppressInvisibles:(BOOL)a9;
- (id)p_lineSelectionsForSelection:(id)a3;
- (id)p_newCaretLayerWithZPosition:(double)a3;
- (id)p_smartFieldWithTouch:(id)a3;
- (id)repForDragging;
- (id)rubyFieldAtPoint:(CGPoint)a3;
- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3 dragIsTopicSelection:(BOOL)a4;
- (id)selectionRects;
- (id)siblings;
- (id)smartFieldAtPoint:(CGPoint)a3;
- (id)textBackgroundLayer;
- (id)textImageForRect:(CGRect)a3;
- (id)textImageForSelection:(id)a3;
- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 suppressInvisibles:(BOOL)a8;
- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7;
- (id)textLayer;
- (int)dragTypeAtCanvasPoint:(CGPoint)a3;
- (int)tilingMode;
- (unint64_t)charCountOfGlyphStartingAtCharIndex:(unint64_t)a3;
- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3;
- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5;
- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)addKnobsToArray:(id)a3;
- (void)animateIndent:(int64_t)a3 target:(id)a4 action:(SEL)a5;
- (void)canvasDidBeginFreeTransform;
- (void)clearSecondaryHighlight;
- (void)dealloc;
- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4;
- (void)didEndZooming;
- (void)didEnterBackground;
- (void)didUpdateLayer:(id)a3;
- (void)disableCaretAnimation;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5;
- (void)editingDidEnd;
- (void)enableCaretAnimation;
- (void)i_setNeedsDisplayForSelectionChange;
- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3;
- (void)invalidateAnnotationColor;
- (void)invalidateHUDState;
- (void)invalidateKnobs;
- (void)p_activeFindHighlightChangedNotification:(id)a3;
- (void)p_addRectToContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5;
- (void)p_createLayer:(int)a3;
- (void)p_createMarkHighlightLayer;
- (void)p_createSelectionHighlightLayer;
- (void)p_createSelectionLineLayers;
- (void)p_createSelectionParagraphBorderLayer;
- (void)p_createSmartFieldHighlightLayer;
- (void)p_destroyLayer:(int)a3;
- (void)p_didDismissPopover:(id)a3;
- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3;
- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(int)a7 suppressInvisibles:(BOOL)a8;
- (void)p_drawTextLayerInContext:(CGContext *)a3;
- (void)p_editingDidEndNotification:(id)a3;
- (void)p_findUIStateChangedNotification:(id)a3;
- (void)p_hideCaretLayer;
- (void)p_hideMarkHighlightLayer;
- (void)p_hideSelectionHighlightLayer;
- (void)p_hideSelectionLayers;
- (void)p_hideSelectionParagraphBorderLayer;
- (void)p_hideSmartFieldHighlightLayer;
- (void)p_indentAfterAnimationWithOptions:(id)a3;
- (void)p_invalidateCommentKnobs;
- (void)p_invalidateSuppressedMisspellingRange;
- (void)p_markChangedNotification:(id)a3;
- (void)p_selectionChangedNotification:(id)a3;
- (void)p_setActiveSearchReference:(id)a3;
- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4;
- (void)p_setSearchReferencesToHighlight:(id)a3;
- (void)p_setSelectionHighlightColor;
- (void)p_setSelectionLineLayersHidden:(BOOL)a3;
- (void)p_setSuppressedMisspellingRange:(_NSRange)a3;
- (void)p_showCaretLayer;
- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3;
- (void)p_spellCheckerLanguageDidChangeNotification:(id)a3;
- (void)p_startCaretLayerAnimation;
- (void)p_stopCaretLayerAnimation;
- (void)p_teardown;
- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3;
- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3;
- (void)p_updateHighlights;
- (void)p_updateLayersForInsertionPointSelection:(id)a3;
- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4;
- (void)p_updateMarkHighlightLayer;
- (void)p_updateSecondaryHighlightLayer;
- (void)p_updateSmartFieldHighlightLayer;
- (void)p_updateSuppressedSpellingRange;
- (void)performBlockOnTextLayers:(id)a3;
- (void)processFindUIStateChangedNotificationUserInfo:(id)a3;
- (void)pulseAnimationDidStop:(id)a3;
- (void)pulseAnimationDidStopForPulse:(id)a3;
- (void)pulseCaret;
- (void)screenScaleDidChange;
- (void)setActiveSearchReference:(id)a3;
- (void)setDragRange:(_NSRange)a3;
- (void)setDropSelection:(id)a3;
- (void)setFindIsShowing:(BOOL)a3;
- (void)setHighlightedHyperlinkField:(id)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRange:(_NSRange)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setSearchReferences:(id)a3;
- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5;
- (void)setShouldHideSelectionControls:(BOOL)a3;
- (void)setSuppressSelectionHighlight:(BOOL)a3;
- (void)setUseKeyboardWhenEditing:(BOOL)a3;
- (void)tilingLayerWillSetNeedsDisplay:(id)a3;
- (void)tilingLayerWillSetNeedsDisplayForDirtyTiles:(id)a3;
- (void)tilingLayerWillSetNeedsLayout:(id)a3;
- (void)updateFromLayout;
- (void)updatePositionsOfKnobs:(id)a3;
- (void)verticalTextPropertyChanged;
- (void)viewScaleDidChange;
- (void)willBeRemoved;
- (void)willBeginZooming;
- (void)willDisplayEditHyperlinkUIForHyperlinkField:(id)a3 beginEditing:(BOOL)a4;
- (void)willEnterForeground;
@end

@implementation TSWPRep

- (void)setSuppressSelectionHighlight:(BOOL)a3
{
  if (self->_suppressSelectionHighlight != a3)
  {
    self->_suppressSelectionHighlight = a3;
    if (a3) {
      [(TSWPRep *)self p_hideSelectionLayers];
    }
  }
}

- (void)setShouldHideSelectionControls:(BOOL)a3
{
  if (self->_shouldHideSelectionControls != a3)
  {
    self->_shouldHideSelectionControls = a3;
    v3 = [(TSDRep *)self canvas];
    [(TSDCanvas *)v3 invalidateLayers];
  }
}

- (BOOL)p_shouldDisplaySelectionControls
{
  if ([(TSWPRep *)self shouldHideSelectionControls]) {
    return 0;
  }
  else {
    return objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") ^ 1;
  }
}

- (BOOL)shouldShowKnobs
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPRep;
  BOOL v3 = [(TSDRep *)&v5 shouldShowKnobs];
  if (v3) {
    LOBYTE(v3) = [(TSWPRep *)self p_shouldDisplaySelectionControls];
  }
  return v3;
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
  -[TSWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", location, length);
}

- (void)setDropSelection:(id)a3
{
  if (self->_dropSelection != a3)
  {
    self->_dropSelection = (TSWPSelection *)a3;
    [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] invalidateLayers];
    if (self->_dropSelection)
    {
      [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layoutIfNeeded];
      dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
      [(CALayer *)dragAndDropCaretLayer setHidden:0];
    }
    else
    {
      [(CALayer *)self->_dragAndDropCaretLayer setDelegate:0];

      self->_dragAndDropCaretLayer = 0;
    }
  }
}

- (TSWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSWPRep;
  objc_super v5 = -[TSDRep initWithLayout:canvas:](&v12, sel_initWithLayout_canvas_, a3);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(TSWPRep *)v5 storage];
    if (v7)
    {
      uint64_t v8 = v7;
      if ([a4 isCanvasInteractive])
      {
        v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
        [v9 addObserver:v6 selector:sel_p_selectionChangedNotification_ name:@"TSWPEditingControllerSelectionChanged" object:v8];
        [v9 addObserver:v6 selector:sel_p_selectionContentsChangedNotification_ name:@"TSWPEditingControllerSelectionContentsChanged" object:v8];
        [v9 addObserver:v6 selector:sel_p_markChangedNotification_ name:@"TSWPEditingControllerMarkChanged" object:v8];
        [v9 addObserver:v6 selector:sel_p_editingDidEndNotification_ name:@"TSWPEditingControllerEditingDidEnd" object:v8];
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_activeFindHighlightChangedNotification_, @"TSKActiveFindHighlightChangedNotification", -[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"));
        objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_p_findUIStateChangedNotification_, @"TSKFindUIStateChanged", -[TSDRep interactiveCanvasController](v6, "interactiveCanvasController"));
        [v9 addObserver:v6 selector:sel_p_didDismissPopover_ name:@"TSKDidDismissPopover" object:0];
        [v9 addObserver:v6 selector:sel_p_renderingOptionsDidChangeNotification_ name:TSWPRenderingOptionsDidChangeNotification object:0];
        objc_opt_class();
        [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)v6 interactiveCanvasController] documentRoot] activeSearchReference];
        [(TSWPRep *)v6 p_setActiveSearchReference:TSUDynamicCast()];
        [(TSWPRep *)v6 p_setSearchReferencesToHighlight:[(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)v6 interactiveCanvasController] documentRoot] searchReferencesToHighlight]];
      }
      v10 = (_NSRange *)MEMORY[0x263F7C7C8];
      v6->_suppressedMisspellingRange = (_NSRange)*MEMORY[0x263F7C7C8];
      v6->_dragRange = *v10;
      v6->_useKeyboardWhenEditing = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  [(TSWPRep *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  [(TSDContainerRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  [(TSWPRep *)self p_teardown];
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  [(TSDRep *)&v3 willBeRemoved];
}

- (_NSRange)range
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(TSWPRep *)self columns];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    NSUInteger v5 = 0;
    uint64_t v6 = *(void *)v16;
    NSUInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t location = [*(id *)(*((void *)&v15 + 1) + 8 * i) range];
        v11.uint64_t location = location;
        v11.NSUInteger length = length;
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21.uint64_t location = v7;
          v21.NSUInteger length = v5;
          NSRange v12 = NSUnionRange(v21, v11);
          NSUInteger length = v12.length;
          uint64_t location = v12.location;
        }
        NSUInteger v7 = location;
        NSUInteger v5 = length;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    NSUInteger v5 = 0;
    NSUInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v13 = v7;
  NSUInteger v14 = v5;
  result.NSUInteger length = v14;
  result.uint64_t location = v13;
  return result;
}

- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v66 = *MEMORY[0x263EF8340];
  [(TSDRep *)self naturalBounds];
  -[TSWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
  double v13 = v12;
  double v15 = v14;
  if (v4)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v16 = [(TSWPRep *)self columns];
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v62;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v62 != v19) {
            objc_enumerationMutation(v16);
          }
          NSRange v21 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          [v21 frameBounds];
          v68.double x = v13;
          v68.double y = v15;
          if (CGRectContainsPoint(v69, v68))
          {
            uint64_t v22 = [v21 countLines];
            if (v22)
            {
              [v21 boundsOfLineFragmentAtIndex:v22 - 1];
              CGFloat v24 = v23;
              CGFloat v26 = v25;
              CGFloat v28 = v27;
              CGFloat v30 = v29;
              if (v21)
              {
                [v21 transformToWP];
                double v31 = v56;
                double v32 = v58;
                double v33 = v57;
                double v47 = v59;
                double v48 = v55;
                double v34 = v60;
              }
              else
              {
                double v34 = 0.0;
                double v32 = 0.0;
                double v31 = 0.0;
                double v47 = 0.0;
                double v48 = 0.0;
                double v33 = 0.0;
              }
              double v35 = v34 + v15 * v32 + v31 * v13;
              v70.origin.double x = v24;
              v70.origin.double y = v26;
              v70.size.width = v28;
              v70.size.height = v30;
              double MaxY = CGRectGetMaxY(v70);
              if (v35 > MaxY)
              {
                double v37 = MaxY;
                double v38 = v47 + v15 * v33 + v48 * v13;
                if (v21)
                {
                  [v21 transformFromWP];
                  double v40 = v49;
                  double v39 = v50;
                  double v42 = v51;
                  double v41 = v52;
                  double v44 = v53;
                  double v43 = v54;
                }
                else
                {
                  double v43 = 0.0;
                  double v41 = 0.0;
                  double v39 = 0.0;
                  double v44 = 0.0;
                  double v42 = 0.0;
                  double v40 = 0.0;
                }
                double v13 = v44 + v37 * v42 + v40 * v38;
                double v15 = v43 + v37 * v41 + v39 * v38;
              }
            }
            goto LABEL_20;
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
LABEL_20:
  double v45 = v13;
  double v46 = v15;
  result.double y = v46;
  result.double x = v45;
  return result;
}

- (CGPoint)pinToClosestColumn:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:");
  if (v6)
  {
    [v6 frameBounds];
    -[TSWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v7, v8, v9, v10);
    double x = v11;
    double y = v12;
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)caretRect
{
  uint64_t v3 = [(TSWPRep *)self selection];

  [(TSWPRep *)self caretRectForSelection:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)selectionRect
{
  uint64_t v3 = [(TSWPRep *)self selection];

  [(TSWPRep *)self rectForSelection:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)selectionRects
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  if ([(TSWPRep *)self selection])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v4 = [(TSWPRep *)self columns];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(v4);
          }
          double v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "rectsForSelection:", -[TSWPRep selection](self, "selection"));
          if ([v9 count]) {
            [v3 addObjectsFromArray:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  return (id)[v3 copy];
}

- (BOOL)isPointInSelectedArea:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(TSWPRep *)self selection];
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [(TSWPRep *)self columns];
    uint64_t v6 = (TSWPSelection *)[(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = (uint64_t)v6;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "rectsForSelection:", -[TSWPRep selection](self, "selection"));
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v18;
            while (2)
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(*((void *)&v17 + 1) + 8 * v15) CGRectValue];
                v28.CGFloat x = x;
                v28.CGFloat y = y;
                if (CGRectContainsPoint(v29, v28))
                {
                  LOBYTE(v6) = 1;
                  return (char)v6;
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        LOBYTE(v6) = 0;
      }
      while (v8);
    }
  }
  return (char)v6;
}

- (CGRect)rectForSelection:(id)a3
{
  double v4 = [(TSWPRep *)self columns];

  +[TSWPColumn boundsRectForSelection:a3 columnArray:v4 includeRuby:0];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(TSWPRep *)self columns];

  +[TSWPColumn boundsRectForSelection:a3 columnArray:v6 includeRuby:v4];
  result.size.height = v10;
  result.size.width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)naturalBoundsRectForHyperlinkField:(id)a3
{
  uint64_t v4 = [a3 range];
  double v6 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5);

  [(TSWPRep *)self rectForSelection:v6];
  result.size.height = v10;
  result.size.width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(int)a4
{
  uint64_t v5 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, *(void *)&a4);
  [(TSWPRep *)self p_caretRectForSelection:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double v9 = [TSWPSelection alloc];
  LOBYTE(v23) = a4;
  double v10 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, a3, 0, 0, v5, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v23, [(TSWPRep *)self storage]);
  [(TSWPRep *)self p_caretRectForSelection:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtPoint:(SEL)a3
{
  double y = a4.y;
  double x = a4.x;
  id v7 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:");
  __int16 v9 = 0;
  CGRect result = ($67DC2B40F188BF54E27CB16063B1C8C0 *)objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 1, 0, (char *)&v9 + 1, &v9, x, y);
  if (v7) {
    return ($67DC2B40F188BF54E27CB16063B1C8C0 *)[v7 lineMetricsAtCharIndex:result allowEndOfLine:HIBYTE(v9)];
  }
  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3
{
  CGRect result = -[TSWPRep columnForCharIndex:](self, "columnForCharIndex:");
  if (result)
  {
    return ($67DC2B40F188BF54E27CB16063B1C8C0 *)[($67DC2B40F188BF54E27CB16063B1C8C0 *)result lineMetricsAtCharIndex:a4 allowEndOfLine:0];
  }
  else
  {
    *(_OWORD *)&retstr->var1 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
  }
  return result;
}

- ($739D45CC02FBFC6E8CDDA7A2D0BB8DAA)wordMetricsAtCharIndex:(SEL)a3
{
  *(_OWORD *)&retstr->var1 = xmmword_22383AE38;
  *(_OWORD *)&retstr->var3 = unk_22383AE48;
  *(void *)&retstr->var5 = 0;
  retstr->var0.origin = (CGPoint)TSWPEmptyWordMetrics;
  retstr->var0.size = (CGSize)unk_22383AE28;
  uint64_t v7 = [(TSWPStorage *)[(TSWPRep *)self storage] wordAtCharIndex:a4 includePreviousWord:0];
  [(TSWPRep *)self rectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7, v8)];
  retstr->var0.origin.double x = v9;
  retstr->var0.origin.double y = v10;
  retstr->var0.size.width = v11;
  retstr->var0.size.height = v12;
  CGRect result = [(TSWPStorage *)[(TSWPRep *)self storage] attachmentAtCharIndex:a4];
  retstr->var5 = result != 0;
  long long v14 = 0uLL;
  if (self)
  {
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    CGRect result = -[TSWPRep lineMetricsAtCharIndex:](self, "lineMetricsAtCharIndex:", a4, 0, 0, 0, 0);
    long long v14 = v16;
    long long v15 = v17;
  }
  else
  {
    long long v15 = 0uLL;
  }
  *(_OWORD *)&retstr->var1 = v14;
  *(_OWORD *)&retstr->var3 = v15;
  return result;
}

- (CGRect)p_caretRectForSelection:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CGFloat v5 = *MEMORY[0x263F001A0];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 24);
  if ([a3 type] != 3 && objc_msgSend(a3, "type") != 5)
  {
    CGFloat v9 = [(TSWPRep *)self textEditor];
    if (v9)
    {
      [(TSWPEditingController *)v9 overrideCaretRectForSelection:a3];
      CGFloat v5 = v10;
      CGFloat v6 = v11;
      CGFloat v7 = v12;
      CGFloat v8 = v13;
    }
    v33.origin.double x = v5;
    v33.origin.double y = v6;
    v33.size.width = v7;
    v33.size.height = v8;
    if (CGRectIsNull(v33))
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v14 = [(TSWPRep *)self columns];
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) caretRectForSelection:a3];
            if (v22 > 0.0 || v21 > 0.0)
            {
              CGFloat v5 = v19;
              CGFloat v6 = v20;
              CGFloat v7 = v21;
              CGFloat v8 = v22;
              goto LABEL_17;
            }
          }
          uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_17:
  double v23 = v5;
  double v24 = v6;
  double v25 = v7;
  double v26 = v8;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGRect)p_topicDragRectForSelection:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  double v6 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  if (!a3)
  {
    CGFloat v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPRep p_topicDragRectForSelection:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 715, @"invalid nil value for '%s'", "sel");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v11 = [(TSWPRep *)self columns];
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v15 caretRectForSelection:a3];
        CGFloat v18 = v17;
        CGFloat MaxY = v19;
        CGFloat v21 = v16;
        CGFloat v23 = v22;
        if (v22 > 0.0 || v16 > 0.0)
        {
          [v15 frameBounds];
          CGFloat v25 = v24;
          [v15 frameBounds];
          CGFloat v27 = v26;
          NSUInteger v28 = [a3 range];
          long long v29 = [(TSWPRep *)self storage];
          if (v29) {
            [(TSWPStorage *)v29 paragraphEnumeratorAtCharIndex:v28 styleProvider:0];
          }
          else {
            memset(&v36, 0, sizeof(v36));
          }
          long long v30 = (void *)TSWPParagraphEnumerator::paragraphString(&v36);
          if (TSWPParagraphEnumerator::isLastParagraph(&v36)
            && [v30 length]
            && v28 > TSWPParagraphEnumerator::paragraphTextRange(&v36))
          {
            v43.origin.CGFloat x = v18;
            v43.origin.double y = MaxY;
            v43.size.CGFloat width = v21;
            v43.size.height = v23;
            CGFloat MaxY = CGRectGetMaxY(v43);
          }
          if (self) {
            [(TSWPRep *)self transformToConvertNaturalToScaledRoot];
          }
          else {
            memset(&v35, 0, sizeof(v35));
          }
          double v7 = 1.0;
          v44.size.height = 1.0;
          v44.origin.CGFloat x = v25;
          v44.origin.double y = MaxY;
          v44.size.CGFloat width = v27;
          CGRect v45 = CGRectApplyAffineTransform(v44, &v35);
          CGFloat x = v45.origin.x;
          CGFloat width = v45.size.width;
          double v6 = rint(v45.origin.y);
          TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v36);
          goto LABEL_24;
        }
      }
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_24:
  double v31 = x;
  double v32 = v6;
  double v33 = width;
  double v34 = v7;
  result.size.height = v34;
  result.size.CGFloat width = v33;
  result.origin.double y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4
{
  BOOL v4 = a4;
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  unint64_t v6 = -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0);
  if (v4)
  {
    unint64_t v7 = [(TSWPSelection *)[(TSWPRep *)self selection] start];
    CGFloat v8 = [(TSWPRep *)self selection];
    if (v6 >= v7)
    {
      if (v6 <= [(TSWPSelection *)v8 end]) {
        goto LABEL_7;
      }
      uint64_t v9 = [(TSWPSelection *)[(TSWPRep *)self selection] end];
    }
    else
    {
      uint64_t v9 = [(TSWPSelection *)v8 start];
    }
    unint64_t v6 = v9;
  }
LABEL_7:
  BOOL v10 = v6 >= [(TSWPSelection *)[(TSWPRep *)self selection] end];

  [(TSWPRep *)self caretRectForCharIndex:v6 caretAffinity:v10];
  result.size.height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)invalidateAnnotationColor
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  [(TSDRep *)&v3 invalidateAnnotationColor];
  [(TSWPRep *)self setNeedsDisplay];
}

- (BOOL)shouldCreateCommentKnobs
{
  objc_super v3 = [(TSDRep *)self interactiveCanvasController];
  id v4 = [[(TSDRep *)self parentRep] info];

  return [(TSDInteractiveCanvasController *)v3 shouldDisplayCommentUIForInfo:v4];
}

- (id)newTrackerForKnob:(id)a3
{
  if (!a3)
  {
    CGFloat v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPRep newTrackerForKnob:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 814, @"invalid nil value for '%s'", "knob");
  }
  if ([a3 tag] == 32) {
    return 0;
  }
  CGFloat v8 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] delegate];
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = (objc_class *)[(TSDInteractiveCanvasControllerDelegate *)v8 wpTrackerClassOverride];
  }
  else {
    uint64_t v9 = (objc_class *)objc_opt_class();
  }
  id v10 = [v9 alloc];

  return (id)[v10 initWithRep:self knob:a3];
}

- (id)p_annotationAtPoint:(CGPoint)a3 outRange:(_NSRange *)a4
{
  unint64_t v6 = +[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", [(TSDLayout *)[(TSDRep *)self layout] columns], 1, 1, 1, 0, 0, a3.x, a3.y);
  unint64_t v7 = [(TSWPRep *)self storage];
  CGFloat v8 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v6, 0);
  BOOL v9 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] showsComments];

  return [(TSWPStorage *)v7 editableAnnotationForInsertionPointSelection:v8 includeComments:v9 withOutRange:a4 selectionIsOnEdge:0];
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v4 = a4;
  uint64_t v143 = *MEMORY[0x263EF8340];
  double v7 = *MEMORY[0x263F001A0];
  double v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  uint64_t v11 = [a4 tag];
  double v12 = [(TSWPRep *)self textEditor];
  uint64_t v13 = [(TSWPEditingController *)v12 isParagraphModeWithSelection:a3 onStorage:[(TSWPRep *)self storage]];
  double v14 = *MEMORY[0x263F00148];
  double v15 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v13
    && [(TSWPEditingController *)v12 knobTracking]
    && (double v16 = [(TSDRep *)self interactiveCanvasController],
        [(TSWPEditingController *)v12 knobTrackingDragPoint],
        (TSWPRep *)-[TSDInteractiveCanvasController closestRepToPoint:forStorage:](v16, "closestRepToPoint:forStorage:", -[TSWPRep storage](self, "storage"), v17, v18) == self)&& (-[TSWPEditingController knobTrackingDragPoint](v12, "knobTrackingDragPoint"), -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:"), double v14 = v19, v15 = v20, [(TSWPEditingController *)v12 knobTag] == v11))
  {
    id v21 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:", v14, v15);
  }
  else
  {
    id v21 = 0;
  }
  BOOL v118 = [(TSWPRep *)self textIsVertical];
  if (((v13 | [a3 isVisual] ^ 1) & 1) == 0)
  {
    if (v11 == 11) {
      uint64_t v31 = [a3 headChar];
    }
    else {
      uint64_t v31 = [a3 tailChar];
    }
    unint64_t v32 = v31;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    double v33 = [(TSWPRep *)self columns];
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v135 objects:v142 count:16];
    if (!v34) {
      goto LABEL_93;
    }
    uint64_t v35 = v34;
    id v116 = v4;
    v117 = self;
    uint64_t v36 = *(void *)v136;
    while (1)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v136 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        uint64_t v39 = objc_msgSend(v38, "lineFragmentForCharIndex:knobTag:selectionType:", v32, v11, objc_msgSend(a3, "type"));
        if (v39)
        {
          long long v40 = (TSWPLineFragment *)v39;
          unsigned int v41 = *(_DWORD *)(v39 + 24);
          if (v11 == 11 && (v41 & 0x200) != 0)
          {
            uint64_t v141 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *(double *)(v39 + 48), *(double *)(v39 + 56), *(double *)(v39 + 64), *(double *)(v39 + 72));
            uint64_t v42 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:&v141 count:1];
          }
          else
          {
            uint64_t v42 = objc_msgSend(v38, "rectsForSelectionRange:selectionType:", *(void *)v39, *(void *)(v39 + 8), objc_msgSend(a3, "type"));
          }
          double v57 = v42;
          id v4 = v116;
          if ([v42 count])
          {
            BOOL v59 = (v41 & 0x1000) == 0 && v11 == 11;
            if (((v11 == 10) & (v41 >> 12)) != 0 || v59) {
              double v60 = (void *)[v57 firstObject];
            }
            else {
              double v60 = (void *)[v57 lastObject];
            }
            [v60 CGRectValue];
            CGFloat v62 = v61;
            CGFloat v64 = v63;
            CGFloat v66 = v65;
            CGFloat v68 = v67;
            if (v38) {
              [v38 transformToWP];
            }
            else {
              memset(&v134, 0, sizeof(v134));
            }
            v147.origin.CGFloat x = v62;
            v147.origin.CGFloat y = v64;
            v147.size.CGFloat width = v66;
            v147.size.CGFloat height = v68;
            CGRect v148 = CGRectApplyAffineTransform(v147, &v134);
            CGFloat x = v148.origin.x;
            CGFloat y = v148.origin.y;
            CGFloat width = v148.size.width;
            CGFloat height = v148.size.height;
            [v38 wpBounds];
            v163.origin.CGFloat x = v75;
            v163.origin.CGFloat y = v76;
            v163.size.CGFloat width = v77;
            v163.size.CGFloat height = v78;
            v149.origin.CGFloat x = x;
            v149.origin.CGFloat y = y;
            v149.size.CGFloat width = width;
            v149.size.CGFloat height = height;
            CGRect v150 = CGRectIntersection(v149, v163);
            double v8 = v150.origin.y;
            double v9 = v150.size.height;
            double v7 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v40, v32, v11 == 11);
            double v10 = 0.0;
          }
          if (v38) {
            [v38 transformFromWP];
          }
          else {
            memset(v133, 0, sizeof(v133));
          }
          self = v117;
          v79 = (CGAffineTransform *)v133;
LABEL_92:
          v159.origin.CGFloat x = v7;
          v159.origin.CGFloat y = v8;
          v159.size.CGFloat width = v10;
          v159.size.CGFloat height = v9;
          CGRect v160 = CGRectApplyAffineTransform(v159, v79);
          double v7 = v160.origin.x;
          double v8 = v160.origin.y;
          double v10 = v160.size.width;
          double v9 = v160.size.height;
          goto LABEL_93;
        }
      }
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v135 objects:v142 count:16];
      if (!v35) {
        goto LABEL_34;
      }
    }
  }
  if (v11 == 11) {
    uint64_t v22 = [a3 start];
  }
  else {
    uint64_t v22 = [a3 end];
  }
  unint64_t v23 = v22;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  double v24 = [(TSWPRep *)self columns];
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v129 objects:v140 count:16];
  if (!v25) {
    goto LABEL_93;
  }
  uint64_t v26 = v25;
  id v115 = v21;
  id v116 = v4;
  v117 = self;
  uint64_t v27 = *(void *)v130;
  while (2)
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(void *)v130 != v27) {
        objc_enumerationMutation(v24);
      }
      long long v29 = *(void **)(*((void *)&v129 + 1) + 8 * j);
      if (v13)
      {
        if ([*(id *)(*((void *)&v129 + 1) + 8 * j) lineFragmentForCharIndex:v23 knobTag:v11 selectionType:0])
        {
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          uint64_t v43 = [a3 range];
          CGRect v45 = objc_msgSend(v29, "rectsForSelectionRange:selectionType:forParagraphMode:", v43, v44, objc_msgSend(a3, "type"), 1);
          uint64_t v46 = [v45 countByEnumeratingWithState:&v124 objects:v139 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v125;
            id v4 = v116;
            self = v117;
            double v49 = v115;
            do
            {
              for (uint64_t k = 0; k != v47; ++k)
              {
                if (*(void *)v125 != v48) {
                  objc_enumerationMutation(v45);
                }
                objc_msgSend(*(id *)(*((void *)&v124 + 1) + 8 * k), "CGRectValue", v115);
                v162.origin.CGFloat x = v51;
                v162.origin.CGFloat y = v52;
                v162.size.CGFloat width = v53;
                v162.size.CGFloat height = v54;
                v145.origin.CGFloat x = v7;
                v145.origin.CGFloat y = v8;
                v145.size.CGFloat width = v10;
                v145.size.CGFloat height = v9;
                CGRect v146 = CGRectUnion(v145, v162);
                double v7 = v146.origin.x;
                double v8 = v146.origin.y;
                double v10 = v146.size.width;
                double v9 = v146.size.height;
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v124 objects:v139 count:16];
            }
            while (v47);
            if (v29) {
              goto LABEL_46;
            }
          }
          else
          {
            id v4 = v116;
            self = v117;
            double v49 = v115;
            if (v29)
            {
LABEL_46:
              objc_msgSend(v29, "transformToWP", v115);
              goto LABEL_76;
            }
          }
          memset(&v123, 0, sizeof(v123));
LABEL_76:
          v151.origin.CGFloat x = v7;
          v151.origin.CGFloat y = v8;
          v151.size.CGFloat width = v10;
          v151.size.CGFloat height = v9;
          CGRect v152 = CGRectApplyAffineTransform(v151, &v123);
          CGFloat v80 = v152.origin.x;
          CGFloat v81 = v152.origin.y;
          CGFloat v82 = v152.size.width;
          CGFloat v83 = v152.size.height;
          [v29 wpBounds];
          v164.origin.CGFloat x = v84;
          v164.origin.CGFloat y = v85;
          v164.size.CGFloat width = v86;
          v164.size.CGFloat height = v87;
          v153.origin.CGFloat x = v80;
          v153.origin.CGFloat y = v81;
          v153.size.CGFloat width = v82;
          v153.size.CGFloat height = v83;
          CGRect v154 = CGRectIntersection(v153, v164);
          double v8 = v154.origin.y;
          double v7 = v154.origin.x + v154.size.width * 0.5;
          if (v49 == v29)
          {
            if (v29)
            {
              [v49 transformToWP];
              double v88 = *((double *)&v120 + 1);
              double v89 = *((double *)&v121 + 1);
              double v90 = *((double *)&v122 + 1);
            }
            else
            {
              long long v121 = 0u;
              long long v122 = 0u;
              long long v120 = 0u;
              double v90 = 0.0;
              double v89 = 0.0;
              double v88 = 0.0;
            }
            double v8 = v90 + v15 * v89 + v88 * v14;
            double v10 = 0.0;
            long long v29 = v49;
            double v9 = 0.0;
            if (!v49) {
              goto LABEL_90;
            }
          }
          else
          {
            double v9 = v154.size.height;
            double v10 = 0.0;
            if (!v29)
            {
LABEL_90:
              memset(&v119, 0, sizeof(v119));
              goto LABEL_91;
            }
          }
LABEL_87:
          objc_msgSend(v29, "transformFromWP", v115);
LABEL_91:
          v79 = &v119;
          goto LABEL_92;
        }
      }
      else
      {
        uint64_t v30 = objc_msgSend(v29, "lineFragmentForCharIndex:knobTag:selectionType:", v23, v11, objc_msgSend(a3, "type"));
        if (v30)
        {
          double v55 = (TSWPLineFragment *)v30;
          if (v11 == 11 && (*(_DWORD *)(v30 + 24) & 0x200) != 0) {
            double v56 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *(double *)(v30 + 48), *(double *)(v30 + 56), *(double *)(v30 + 64), *(double *)(v30 + 72)));
          }
          else {
            double v56 = objc_msgSend(v29, "rectsForSelectionRange:selectionType:", *(void *)v30, *(void *)(v30 + 8), objc_msgSend(a3, "type", v115));
          }
          CGRect v69 = v56;
          id v4 = v116;
          self = v117;
          if (objc_msgSend(v56, "count", v115))
          {
            if (v11 == 11) {
              CGRect v70 = (void *)[v69 firstObject];
            }
            else {
              CGRect v70 = (void *)[v69 lastObject];
            }
            [v70 CGRectValue];
            CGFloat v92 = v91;
            CGFloat v94 = v93;
            CGFloat v96 = v95;
            CGFloat v98 = v97;
            if (v29) {
              [v29 transformToWP];
            }
            else {
              memset(&v128, 0, sizeof(v128));
            }
            v155.origin.CGFloat x = v92;
            v155.origin.CGFloat y = v94;
            v155.size.CGFloat width = v96;
            v155.size.CGFloat height = v98;
            CGRect v156 = CGRectApplyAffineTransform(v155, &v128);
            CGFloat v99 = v156.origin.x;
            CGFloat v100 = v156.origin.y;
            CGFloat v101 = v156.size.width;
            CGFloat v102 = v156.size.height;
            [v29 wpBounds];
            v165.origin.CGFloat x = v103;
            v165.origin.CGFloat y = v104;
            v165.size.CGFloat width = v105;
            v165.size.CGFloat height = v106;
            v157.origin.CGFloat x = v99;
            v157.origin.CGFloat y = v100;
            v157.size.CGFloat width = v101;
            v157.size.CGFloat height = v102;
            CGRect v158 = CGRectIntersection(v157, v165);
            double v8 = v158.origin.y;
            double v9 = v158.size.height;
            double v7 = TSWPLineFragment::wpOffsetForCharIndex(v55, v23, v11 == 11);
            double v10 = 0.0;
          }
          if (!v29) {
            goto LABEL_90;
          }
          goto LABEL_87;
        }
      }
    }
    uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v129 objects:v140 count:16];
    if (v26) {
      continue;
    }
    break;
  }
LABEL_34:
  id v4 = v116;
  self = v117;
LABEL_93:
  v161.origin.CGFloat x = v7;
  v161.origin.CGFloat y = v8;
  v161.size.CGFloat width = v10;
  v161.size.CGFloat height = v9;
  if (!CGRectIsNull(v161))
  {
    BOOL v107 = v11 == 11 && v118;
    double v108 = -0.0;
    if (!v118) {
      double v108 = v9;
    }
    double v109 = v8 + v108;
    if (v11 != 10) {
      double v109 = v8;
    }
    if (v107) {
      double v7 = v7 + v10;
    }
    else {
      double v8 = v109;
    }
    -[TSWPRep knobOffsetForKnob:paragraphMode:](self, "knobOffsetForKnob:paragraphMode:", v4, v13, v115);
    double v111 = v8 + v110;
    double v112 = v7 - v110;
    if (v118) {
      double v7 = v112;
    }
    else {
      double v8 = v111;
    }
  }
  double v113 = v7;
  double v114 = v8;
  result.CGFloat y = v114;
  result.CGFloat x = v113;
  return result;
}

- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4
{
  objc_msgSend((id)objc_msgSend(a3, "layer"), "bounds");
  double v7 = CGRectGetHeight(v12) * 0.5;
  [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] viewScale];
  double v9 = v8;
  uint64_t v10 = [a3 tag];
  double result = 0.0;
  if (v10 == 11)
  {
    if (!a4) {
      return 0.0 - (v7 / v9 + -1.0);
    }
  }
  else if (!a4)
  {
    return v7 / v9 + -1.0;
  }
  return result;
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3
{
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);

  return -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0);
}

- (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(int)a5
{
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  -[TSWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1);
  id v12 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", [(TSDLayout *)[(TSDRep *)self layout] columns], 0, 1, v10, v11);
  if (v12) {
    unint64_t v13 = objc_msgSend(v12, "charIndexForSelectionFromPoint:isTail:", v6, x, y);
  }
  else {
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a5 == 7 || !v6) {
    return v13;
  }
  double v14 = [(TSWPRep *)self storage];

  return [(TSWPStorage *)v14 nextCharacterIndex:v13];
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5
{
  return -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a4, 0, a5, 0, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  return -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a4, a5, 1, a6, a7, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  double y = a3.y;
  double x = a3.x;
  if (!a5 && ([(TSDLayout *)[(TSDRep *)self layout] layoutIsValid] & 1) == 0)
  {
    double v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 1215, @"Should not call when layout has not been validated");
  }
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v18 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", v18, v12, v11, v10, a7, a8, x, y);
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)forceTiling
{
  return 0;
}

- (BOOL)useDynamicTiling
{
  return 1;
}

- (int)tilingMode
{
  BOOL v3 = [(TSWPRep *)self textIsVertical];
  if (v3) {
    int v4 = 5;
  }
  else {
    int v4 = 4;
  }
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    int v5 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] textRepsShouldTileAggressively];
    if (v3) {
      int v6 = 3;
    }
    else {
      int v6 = 2;
    }
    if (v5) {
      return v6;
    }
  }
  return v4;
}

- (void)verticalTextPropertyChanged
{
  [(TSWPRep *)self p_destroyLayer:1];
  [(TSWPRep *)self p_destroyLayer:0];
  [(TSWPRep *)self p_createLayer:1];

  [(TSWPRep *)self p_createLayer:0];
}

- (id)p_hyperlinkAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", x, y);

  return (id)TSUDynamicCast();
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPRep;
  int v4 = -[TSDRep dragTypeAtCanvasPoint:](&v6, sel_dragTypeAtCanvasPoint_, a3.x, a3.y);
  if ([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] inReadMode])
  {
    return 2;
  }
  else
  {
    return v4;
  }
}

- (void)performBlockOnTextLayers:(id)a3
{
  uint64_t v4 = 0;
  textLayers = self->_textLayers;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (textLayers[v4]) {
      (*((void (**)(id))a3 + 2))(a3);
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
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
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    if ([(TSWPRep *)self p_hasVisibleContents])
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __26__TSWPRep_setNeedsDisplay__block_invoke;
      v3[3] = &unk_2646B3148;
      v3[4] = self;
      [(TSWPRep *)self performBlockOnTextLayers:v3];
      objc_opt_class();
      [(TSDRep *)self parentRep];
      [(id)TSUDynamicCast() invalidateEffectLayersForChildren];
    }
  }
}

uint64_t __26__TSWPRep_setNeedsDisplay__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (void *)[*(id *)(a1 + 32) interactiveCanvasController];

  return [v3 setNeedsDisplayOnLayer:a2];
}

- (void)setNeedsDisplayInRange:(_NSRange)a3
{
  [(TSWPRep *)self rectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length)];

  -[TSWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3) && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    if ([(TSWPRep *)self p_hasVisibleContents])
    {
      -[TSDRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __33__TSWPRep_setNeedsDisplayInRect___block_invoke;
      v12[3] = &unk_2646B3170;
      v12[4] = self;
      v12[5] = v8;
      v12[6] = v9;
      v12[7] = v10;
      v12[8] = v11;
      [(TSWPRep *)self performBlockOnTextLayers:v12];
      objc_opt_class();
      [(TSDRep *)self parentRep];
      [(id)TSUDynamicCast() invalidateEffectLayersForChildren];
    }
  }
}

uint64_t __33__TSWPRep_setNeedsDisplayInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[*(id *)(a1 + 32) interactiveCanvasController];
  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);

  return objc_msgSend(v4, "setNeedsDisplayInRect:onLayer:", a2, v5, v6, v7, v8);
}

- (void)drawInLayerContext:(CGContext *)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPRep drawInLayerContext:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"];

  [v3 handleFailureInFunction:v4, v5, 1408, @"this method should never be called, and WP reps should never get a bitmap allocated" file lineNumber description];
}

- (void)drawInContext:(CGContext *)a3
{
}

- (void)drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
  CGContextSaveGState(a3);
  LOBYTE(v9) = a5;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, a4, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), 3, v9);

  CGContextRestoreGState(a3);
}

- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  [(TSWPStorage *)[(TSWPRep *)self storage] smartFieldAtCharIndex:a4 attributeKind:7 effectiveRange:&v12];
  if (v13)
  {
    CGContextSaveGState(a3);
    uint64_t v9 = [TSWPSelection alloc];
    uint64_t v10 = -[TSWPSelection initWithRange:](v9, "initWithRange:", v12, v13);
    LOBYTE(v11) = 0;
    -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v10, location, length, 3, v11);

    CGContextRestoreGState(a3);
  }
}

- (id)overlayLayers
{
  v25.receiver = self;
  v25.super_class = (Class)TSWPRep;
  BOOL v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDRep overlayLayers](&v25, sel_overlayLayers));
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvas] contentsScale];
  double v5 = v4;
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    selectionLineLayers = self->_selectionLineLayers;
    if (!self->_selectionLineLayers[0]) {
      [(TSWPRep *)self p_createSelectionLineLayers];
    }
    uint64_t v7 = 0;
    char v8 = 1;
    do
    {
      char v9 = v8;
      if (([(CAShapeLayer *)selectionLineLayers[v7] isHidden] & 1) == 0) {
        [v3 addObject:selectionLineLayers[v7]];
      }
      char v8 = 0;
      uint64_t v7 = 1;
    }
    while ((v9 & 1) != 0);
  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    uint64_t v11 = [(TSKHighlightArrayController *)pulseArrayController layers];
    if ([(NSArray *)v11 count])
    {
      [(NSArray *)v11 makeObjectsPerformSelector:sel_setDelegate_ withObject:[(TSDRep *)self interactiveCanvasController]];
      [v3 addObjectsFromArray:v11];
    }
  }
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    uint64_t v13 = [(TSKHighlightArrayController *)highlightArrayController layers];
    if ([(NSArray *)v13 count])
    {
      [(NSArray *)v13 makeObjectsPerformSelector:sel_setDelegate_ withObject:[(TSDRep *)self interactiveCanvasController]];
      [v3 addObjectsFromArray:v13];
    }
  }
  if (self->_caretPulseController)
  {
    [(CALayer *)[(TSKHighlightController *)self->_caretPulseController layer] setDelegate:[(TSDRep *)self interactiveCanvasController]];
    objc_msgSend(v3, "addObject:", -[TSKHighlightController layer](self->_caretPulseController, "layer"));
  }
  dropSelection = self->_dropSelection;
  if (dropSelection)
  {
    BOOL v15 = [(TSWPSelection *)self->_dropSelection isRange];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
    if (v15)
    {
      if (isKindOfClass)
      {
        if (dragAndDropCaretLayer)
        {
LABEL_25:
          uint64_t v19 = [(TSWPSelection *)dropSelection range];
          id v21 = +[TSDBezierPath outsideEdgeOfBezierPath:](TSDBezierPath, "outsideEdgeOfBezierPath:", +[TSWPColumn pathForHighlightWithRange:columnArray:pathStyle:](TSWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", v19, v20, [(TSWPRep *)self columns], 0));
          [(TSWPRep *)self transformToConvertNaturalToScaledRoot];
          [v21 transformUsingAffineTransform:&v24];
          -[CALayer setPath:](self->_dragAndDropCaretLayer, "setPath:", [v21 CGPath]);
LABEL_29:
          [v3 addObject:self->_dragAndDropCaretLayer];
          return v3;
        }
      }
      else
      {
        [(CALayer *)self->_dragAndDropCaretLayer setDelegate:0];

        self->_dragAndDropCaretLayer = 0;
      }
      uint64_t v18 = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
      self->_dragAndDropCaretLayer = v18;
      [(CALayer *)v18 setContentsScale:v5];
      -[CALayer setAnchorPoint:](v18, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      [(CALayer *)v18 setEdgeAntialiasingMask:0];
      [(CALayer *)v18 setDelegate:self];
      [(CALayer *)v18 setZPosition:1.0];
      [(CALayer *)v18 setFillColor:0];
      [(CALayer *)v18 setStrokeColor:[(TSWPRep *)self p_caretLayerColor]];
      goto LABEL_25;
    }
    if (isKindOfClass)
    {
      [(CALayer *)self->_dragAndDropCaretLayer setDelegate:0];

      self->_dragAndDropCaretLayer = 0;
    }
    else if (dragAndDropCaretLayer)
    {
LABEL_28:
      [(TSWPRep *)self p_positionCaretLayer:dragAndDropCaretLayer forSelection:dropSelection layerRelative:0];
      goto LABEL_29;
    }
    uint64_t v22 = [(TSWPRep *)self p_newCaretLayerWithZPosition:1.0];
    self->_dragAndDropCaretLayer = v22;
    [(CALayer *)v22 setHidden:1];
    dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
    goto LABEL_28;
  }
  return v3;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if (![(TSWPRep *)self textLayer])
  {
    [(TSWPRep *)self range];
    if (v5 || [(TSWPRep *)self p_hasEmptyList]) {
      [(TSWPRep *)self p_createLayer:1];
    }
  }
  if ([(TSWPRep *)self textLayer]) {
    objc_msgSend(a3, "insertObject:atIndex:", -[TSWPRep textLayer](self, "textLayer"), 0);
  }
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    caretLayer = self->_caretLayer;
    BOOL v7 = caretLayer == 0;
    if (!caretLayer) {
      self->_caretLayer = (CALayer *)[(TSWPRep *)self p_newCaretLayerWithZPosition:-1.0];
    }
    if (!self->_selectionHighlightLayer)
    {
      [(TSWPRep *)self p_createSelectionHighlightLayer];
      BOOL v7 = 1;
    }
    if (!self->_selectionParagraphBorderLayer) {
      [(TSWPRep *)self p_createSelectionParagraphBorderLayer];
    }
    if (!self->_markHighlightLayer) {
      [(TSWPRep *)self p_createMarkHighlightLayer];
    }
    if (self->_smartFieldHighlightLayer)
    {
      if (!v7) {
        goto LABEL_19;
      }
    }
    else
    {
      [(TSWPRep *)self p_createSmartFieldHighlightLayer];
      if (!v7)
      {
LABEL_19:
        [a3 addObject:self->_caretLayer];
        [a3 addObject:self->_selectionHighlightLayer];
        [a3 addObject:self->_selectionParagraphBorderLayer];
        [a3 addObject:self->_markHighlightLayer];
        [a3 addObject:self->_smartFieldHighlightLayer];
        if (self->_secondaryHighlightLayer)
        {
          objc_msgSend(a3, "addObject:");
        }
        return;
      }
    }
    [(TSWPRep *)self p_updateForCurrentSelectionWithFlags:0];
    goto LABEL_19;
  }
}

- (void)invalidateHUDState
{
  if (![(TSWPRep *)self isEditing]) {
    return;
  }
  self->_hudStateDirtdouble y = 1;
  if (self->_suppressCaret) {
    return;
  }
  if ([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] textGesturesInFlight])
  {
    return;
  }
  if ([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] currentlyScrolling])
  {
    return;
  }
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return;
  }
  BOOL v3 = (void *)[(TSDLayout *)[(TSDRep *)self layout] columns];
  double v4 = (void *)[v3 firstObject];
  uint64_t v5 = [v3 lastObject];
  if (!v4) {
    return;
  }
  double v6 = (void *)v5;
  if (!v5) {
    return;
  }
  NSUInteger v7 = [v4 range];
  NSUInteger v9 = v8;
  v20.NSUInteger location = [v6 range];
  v20.NSUInteger length = v10;
  v18.NSUInteger location = v7;
  v18.NSUInteger length = v9;
  NSRange v11 = NSUnionRange(v18, v20);
  NSUInteger v12 = [(TSWPSelection *)[(TSWPRep *)self selection] range];
  NSUInteger v14 = v13;
  if (![(TSWPSelection *)[(TSWPRep *)self selection] isInsertionPoint])
  {
    v19.NSUInteger location = v12;
    v19.NSUInteger length = v14;
    if (!NSIntersectionRange(v19, v11).length) {
      return;
    }
    goto LABEL_16;
  }
  BOOL v15 = v12 - v11.location < v11.length && v12 >= v11.location;
  if (v15 || v11.location + v11.length == v12)
  {
LABEL_16:
    double v16 = [(TSDRep *)self layout];
    [(TSDLayout *)v16 invalidate];
  }
}

- (void)updateFromLayout
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPRep;
  [(TSDRep *)&v11 updateFromLayout];
  [(TSWPRep *)self p_invalidateCommentKnobs];
  if (![(TSWPRep *)self p_needsSpellChecker]) {
    [(TSWPRep *)self p_destroySpellChecker];
  }
  [(TSDLayout *)[(TSDRep *)self layout] layoutIsValid];
  if (self->_selectionChanged)
  {
    [(TSWPRep *)self p_updateForCurrentSelectionWithFlags:self->_newSelectionFlags];
    [(TSWPRep *)self i_setNeedsDisplayForSelectionChange];
    self->_selectionChanged = 0;
  }
  if (self->_invalidateHUDState)
  {
    self->_invalidateHUDState = 0;
    [(TSWPRep *)self invalidateHUDState];
  }
  if (self->_hudStateDirty)
  {
    self->_hudStateDirtdouble y = 0;
    if ((TSUSupportsTextInteraction() & 1) == 0
      && [(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
      && [(TSWPRep *)self isEditing])
    {
      [(TSWPEditingController *)[(TSWPRep *)self textEditor] performSelector:sel_updateHUDState withObject:0 afterDelay:0.0];
    }
  }
  if (self->_markChanged) {
    [(TSWPRep *)self p_updateMarkHighlightLayer];
  }
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    [(TSKHighlightArrayController *)highlightArrayController viewScale];
    double v5 = v4;
    [(TSDCanvas *)self->super.super.mCanvas viewScale];
    if (v5 != v6) {
      [(TSWPRep *)self p_updateHighlights];
    }
  }
  [(TSKHighlightArrayController *)self->_pulseArrayController viewScale];
  double v8 = v7;
  [(TSDCanvas *)self->super.super.mCanvas viewScale];
  if (v8 != v9) {
    [(TSWPRep *)self p_updateAnimationWithAnimatingPulse:0];
  }
  if (self->_secondaryHighlightChanged)
  {
    [(TSWPRep *)self p_updateSecondaryHighlightLayer];
    self->_secondaryHighlightChanged = 0;
  }
  [(TSWPRep *)self range];
  if (!v10 && ![(TSWPRep *)self p_hasEmptyList])
  {
    [(TSWPRep *)self p_destroyLayer:1];
    [(TSWPRep *)self p_destroyLayer:0];
  }
}

- (CGRect)p_clipRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v8 = [(TSWPRep *)self columns];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v12) erasableBounds:0];
        v30.origin.double x = v13;
        v30.origin.double y = v14;
        v30.size.double width = v15;
        v30.size.double height = v16;
        v27.origin.double x = x;
        v27.origin.double y = y;
        v27.size.double width = width;
        v27.size.double height = height;
        CGRect v28 = CGRectUnion(v27, v30);
        double x = v28.origin.x;
        double y = v28.origin.y;
        double width = v28.size.width;
        double height = v28.size.height;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  -[TSWPRep newTextLayerUnscaledBounds:forNewTextBounds:](self, "newTextLayerUnscaledBounds:forNewTextBounds:", x, y, width, height, x, y, width, height);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)clipRect
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPRep;
  [(TSDRep *)&v7 clipRect];
  -[TSWPRep p_clipRect:](self, "p_clipRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  v42.receiver = self;
  v42.super_class = (Class)TSWPRep;
  -[TSDRep didUpdateLayer:](&v42, sel_didUpdateLayer_);
  [(TSDRep *)self layout];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  [(TSDLayout *)[(TSDRep *)self layout] maskRect];
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  if (CGRectIsNull(v43))
  {
    uint64_t v9 = 0;
  }
  else
  {
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:]([(TSDRep *)self interactiveCanvasController], "convertUnscaledToBoundsRect:", x, y, width, height);
    CGRect v45 = CGRectIntegral(v44);
    double v10 = v45.origin.x;
    double v11 = v45.origin.y;
    double v12 = v45.size.width;
    double v13 = v45.size.height;
    CGFloat v14 = (void *)[a3 mask];
    if (v14)
    {
      [v14 frame];
      v51.origin.double x = v15;
      v51.origin.double y = v16;
      v51.size.double width = v17;
      v51.size.double height = v18;
      v46.origin.double x = v10;
      v46.origin.double y = v11;
      v46.size.double width = v12;
      v46.size.double height = v13;
      if (CGRectEqualToRect(v46, v51)) {
        goto LABEL_8;
      }
    }
    uint64_t v9 = (void *)[MEMORY[0x263F157E8] layer];
    objc_msgSend(v9, "setFrame:", v10, v11, v12, v13);
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "redColor"), "CGColor"));
  }
  [a3 setMask:v9];
LABEL_8:
  BOOL v19 = [(TSWPRep *)self p_hasVisibleContents];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __26__TSWPRep_didUpdateLayer___block_invoke;
  v40[3] = &__block_descriptor_33_e17_v16__0__CALayer_8l;
  BOOL v41 = v19;
  [(TSWPRep *)self performBlockOnTextLayers:v40];
  -[TSWPRep p_clipRect:](self, "p_clipRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  double v21 = v20;
  double v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGRect v28 = [(TSDRep *)self layout];
  if (v28) {
    [(TSDAbstractLayout *)v28 transformInRoot];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }
  v47.origin.double x = v21;
  v47.origin.double y = v23;
  v47.size.double width = v25;
  v47.size.double height = v27;
  CGRect v48 = CGRectApplyAffineTransform(v47, &v39);
  double v29 = v48.size.width;
  double v30 = v48.size.height;
  uint64_t v31 = [(TSDRep *)self layout];
  if (v31) {
    [(TSDAbstractLayout *)v31 transformInRoot];
  }
  else {
    memset(v38, 0, sizeof(v38));
  }
  double v32 = TSDTransformScale((double *)v38);
  double v33 = TSDMultiplyPointScalar(v21, v23, v32);
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:]([(TSDRep *)self interactiveCanvasController], "convertUnscaledToBoundsRect:", v33, v34, v29, v30);
  CGRect v50 = CGRectIntegral(v49);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __26__TSWPRep_didUpdateLayer___block_invoke_2;
  v35[3] = &unk_2646B31B8;
  CGRect v36 = v50;
  BOOL v37 = v19;
  v35[4] = a3;
  v35[5] = self;
  [(TSWPRep *)self performBlockOnTextLayers:v35];
  if ([a3 edgeAntialiasingMask]) {
    [a3 setEdgeAntialiasingMask:0];
  }
  [(TSWPRep *)self p_updateForCurrentSelectionWithFlags:0];
}

uint64_t __26__TSWPRep_didUpdateLayer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 tilingSafeHasContents];
  if (!*(unsigned char *)(a1 + 32) || (result & 1) != 0)
  {
    if (*(unsigned char *)(a1 + 32)) {
      int v5 = 0;
    }
    else {
      int v5 = result;
    }
    if (v5 == 1)
    {
      return [a2 setContents:0];
    }
  }
  else
  {
    return [a2 setNeedsDisplay];
  }
  return result;
}

uint64_t __26__TSWPRep_didUpdateLayer___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 bounds];
  if (!CGRectEqualToRect(v10, *(CGRect *)(a1 + 48)))
  {
    objc_msgSend(a2, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(a2, "setPosition:", *(double *)(a1 + 48) - v4, *(double *)(a1 + 56) - v5);
    if (*(unsigned char *)(a1 + 80)) {
      [a2 setNeedsDisplay];
    }
  }
  uint64_t result = [a2 geometryProvider];
  if (result)
  {
    objc_super v7 = (void *)result;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "canvas"), "viewScale");
    uint64_t result = objc_msgSend(v7, "updateWithLayer:scale:columns:", a2, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "layout"), "columns"), v8);
    if (result)
    {
      return [a2 setNeedsLayout];
    }
  }
  return result;
}

- (void)screenScaleDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPRep;
  [(TSDRep *)&v9 screenScaleDidChange];
  [(TSDCanvas *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvas] contentsScale];
  double v4 = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__TSWPRep_screenScaleDidChange__block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__CALayer_8l;
  *(double *)&v8[4] = v3;
  [(TSWPRep *)self performBlockOnTextLayers:v8];
  caretLayer = self->_caretLayer;
  if (caretLayer) {
    [(CALayer *)caretLayer setContentsScale:v4];
  }
  indentAnimationLayer = self->_indentAnimationLayer;
  if (indentAnimationLayer) {
    [(CALayer *)indentAnimationLayer setContentsScale:v4];
  }
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  if (selectionParagraphBorderLayer) {
    [(CAShapeLayer *)selectionParagraphBorderLayer setContentsScale:v4];
  }
}

uint64_t __31__TSWPRep_screenScaleDidChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setContentsScale:*(double *)(a1 + 32)];
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

- (BOOL)handlesEditMenu
{
  return 1;
}

- (Class)wpEditorClass
{
  double v3 = (objc_class *)objc_opt_class();
  double v4 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v3;
  }

  return (Class)[(TSDInteractiveCanvasControllerDelegate *)v4 wpEditorClassOverride];
}

- (id)beginEditing
{
  id v3 = (id)objc_msgSend(objc_alloc(-[TSWPRep wpEditorClass](self, "wpEditorClass")), "initWithStorage:interactiveCanvasController:", -[TSWPRep storage](self, "storage"), -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_opt_class();
  [(TSDRep *)self parentRep];
  double v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    double v5 = v4;
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "shapeLayout"), "fill"), "isOpaque") & 1) == 0)
    {
      double v6 = (void *)[v5 shadow];
      if (v6) {
        uint64_t v7 = [v6 showForEditingText] ^ 1;
      }
      else {
        uint64_t v7 = 0;
      }
      [v5 setShadowOnChildrenDisabled:v7];
    }
  }
  objc_opt_class();
  double v8 = (void *)TSUDynamicCast();
  if (v8) {
    objc_msgSend(v8, "setShouldDisplayKeyboard:", -[TSWPRep useKeyboardWhenEditing](self, "useKeyboardWhenEditing"));
  }
  return v3;
}

- (BOOL)canEditWithEditor:(id)a3
{
  objc_opt_class();
  double v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    double v5 = (TSWPStorage *)[v4 storage];
    if (v5 == [(TSWPRep *)self storage])
    {
      LODWORD(v4) = [(TSDLayout *)[(TSDRep *)self layout] isInTopLevelContainerForEditing];
      if (v4) {
        LOBYTE(v4) = ![[(TSDRep *)self parentRep] isLocked];
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (BOOL)p_canRepBeginEditingOnDoubleTap
{
  [(TSDRep *)self parentRep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(TSDRep *)self parentRep];

  return [(TSDContainerRep *)v3 canBeginEditingChildRepOnDoubleTap:self];
}

- (BOOL)shouldBeginEditingWithGesture:(id)a3
{
  return 0;
}

- (id)smartFieldAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return 0;
  }
  uint64_t v6 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](TSWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 6, v6, x, y);
}

- (id)rubyFieldAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return 0;
  }
  uint64_t v6 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](TSWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 7, v6, x, y);
}

- (id)footnoteMarkAttachmentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return 0;
  }
  uint64_t v6 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn footnoteMarkAttachmentInColumnArray:atPoint:](TSWPColumn, "footnoteMarkAttachmentInColumnArray:atPoint:", v6, x, y);
}

- (id)footnoteReferenceAttachmentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(TSDLayout *)[(TSDRep *)self layout] layoutIsValid]) {
    return 0;
  }
  uint64_t v6 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn footnoteReferenceAttachmentInColumnArray:atPoint:](TSWPColumn, "footnoteReferenceAttachmentInColumnArray:atPoint:", v6, x, y);
}

- (void)p_updateSecondaryHighlightLayer
{
  if (self->_secondaryHighlightLayer)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
    {
      id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPRep p_updateSecondaryHighlightLayer]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 2333, @"This operation must only be performed on the main thread.");
    }
    id v5 = +[TSWPColumn pathForHighlightWithRange:columnArray:pathStyle:](TSWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", self->_secondaryHighlightRange.location, self->_secondaryHighlightRange.length, [(TSWPRep *)self columns], self->_secondaryHighlightPathStyle);
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
    [v5 transformUsingAffineTransform:&v6];
    -[CAShapeLayer setPath:](self->_secondaryHighlightLayer, "setPath:", [v5 CGPath]);
  }
}

- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_secondaryHighlightRange = &self->_secondaryHighlightRange;
  BOOL v11 = a3.location == self->_secondaryHighlightRange.location && a3.length == self->_secondaryHighlightRange.length;
  if (!v11 || !self->_secondaryHighlightChanged)
  {
    if (a3.length)
    {
      secondaryHighlightLayer = self->_secondaryHighlightLayer;
      if (!secondaryHighlightLayer)
      {
        double v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
        self->_secondaryHighlightLayer = v13;
        [(CAShapeLayer *)v13 setEdgeAntialiasingMask:0];
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
      [(CAShapeLayer *)self->_secondaryHighlightLayer setDelegate:0];
      [(CAShapeLayer *)self->_secondaryHighlightLayer removeFromSuperlayer];

      self->_secondaryHighlightLayer = 0;
    }
    self->_secondaryHighlightChanged = 1;
    CGFloat v14 = [(TSDRep *)self layout];
    [(TSDLayout *)v14 invalidate];
  }
}

- (void)clearSecondaryHighlight
{
}

- (void)setHighlightedHyperlinkField:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 range];
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.0, 0.300000012), "CGColor");

  -[TSWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v4, v6, v7, 2);
}

- (id)closestColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(TSDLayout *)[(TSDRep *)self layout] columns];

  return +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v5, 1, 1, x, y);
}

- (id)columnForCharIndex:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TSWPStorage *)[(TSWPRep *)self storage] selectionRangeForCharIndex:a3];
  uint64_t v7 = v6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v8 = (void *)[(TSDLayout *)[(TSDRep *)self layout] columns];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v21;
  uint64_t v12 = v5 + v7;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v21 != v11) {
      objc_enumerationMutation(v8);
    }
    CGFloat v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
    unint64_t v15 = [v14 range];
    if (a3 >= v15 && a3 - v15 < v16) {
      return v14;
    }
    if (v15 + v16 == a3 && v12 == a3) {
      return v14;
    }
    if (v10 == ++v13)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      CGFloat v14 = 0;
      if (v10) {
        goto LABEL_3;
      }
      return v14;
    }
  }
}

- (id)p_smartFieldWithTouch:(id)a3
{
  uint64_t v5 = [(TSDRep *)self interactiveCanvasController];
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v5, "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:");
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");

  return -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:");
}

- (id)p_hyperlinkWithTouch:(id)a3
{
  uint64_t v5 = [(TSDRep *)self interactiveCanvasController];
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](v5, "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:");
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");

  return -[TSWPRep p_hyperlinkAtPoint:](self, "p_hyperlinkAtPoint:");
}

- (BOOL)isEditing
{
  if (![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]) {
    return 0;
  }
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] editorController] textInputEditor];
  id v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = (TSWPStorage *)[v3 storage];
  if (v5 != [(TSWPRep *)self storage]) {
    return 0;
  }
  uint64_t v7 = (void *)[v4 selection];

  return [v7 isValid];
}

- (TSWPEditingController)textEditor
{
  if (![(TSWPRep *)self isEditing]) {
    return 0;
  }
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] editorController] textInputEditor];

  return (TSWPEditingController *)TSUDynamicCast();
}

- (void)willBeginZooming
{
  self->_suppressCaret = 1;
  [(TSWPRep *)self p_hideCaretLayer];
}

- (void)didEndZooming
{
  [(TSWPRep *)self p_updateSecondaryHighlightLayer];
  self->_suppressCaret = 0;
  [(TSWPRep *)self p_updateForCurrentSelectionWithFlags:0];

  [(TSWPRep *)self invalidateHUDState];
}

- (void)disableCaretAnimation
{
  if (!self->_caretAnimationDisabled)
  {
    self->_caretAnimationDisabled = 1;
    if (![(CALayer *)self->_caretLayer isHidden])
    {
      [(TSWPRep *)self p_stopCaretLayerAnimation];
    }
  }
}

- (void)viewScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRep;
  [(TSDRep *)&v3 viewScaleDidChange];
  [(TSWPRep *)self invalidateHUDState];
}

- (void)canvasDidBeginFreeTransform
{
  v2 = [(TSWPRep *)self textEditor];
  if (v2)
  {
    [(TSWPEditingController *)v2 cancelKnobTrackingAndMagnifying];
  }
}

- (void)enableCaretAnimation
{
  if (self->_caretAnimationDisabled)
  {
    self->_caretAnimationDisabled = 0;
    if (![(CALayer *)self->_caretLayer isHidden])
    {
      [(TSWPRep *)self p_startCaretLayerAnimation];
    }
  }
}

- (void)willEnterForeground
{
  if (![(CALayer *)self->_caretLayer isHidden])
  {
    [(TSWPRep *)self p_startCaretLayerAnimation];
  }
}

- (void)didEnterBackground
{
  if (![(CALayer *)self->_caretLayer isHidden])
  {
    [(TSWPRep *)self p_stopCaretLayerAnimation];
  }
}

- (void)pulseCaret
{
  caretPulseController = self->_caretPulseController;
  if (caretPulseController)
  {

    self->_caretPulseController = 0;
  }
  Mutable = CGPathCreateMutable();
  [(TSWPRep *)self caretRect];
  double y = v19.origin.y;
  double height = v19.size.height;
  v19.size.double width = 2.0;
  v19.origin.CGFloat x = v8 + -1.0;
  CGFloat x = v19.origin.x;
  CGPathAddRect(Mutable, 0, v19);
  id v9 = -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 1, 1, 1, 0, 0, x, y, 2.0, height);
  uint64_t v10 = [[TSKPulseAnimationController alloc] initWithDelegate:self];
  self->_caretPulseController = v10;
  [(TSKPulseAnimationController *)v10 setAutohide:1];
  uint64_t v11 = [(TSDRep *)self layout];
  if (v11)
  {
    [(TSDAbstractLayout *)v11 transformInRoot];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  uint64_t v12 = self->_caretPulseController;
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  [(TSKHighlightController *)v12 setTransform:v15];
  [(TSDCanvas *)self->super.super.mCanvas viewScale];
  -[TSKHighlightController setViewScale:](self->_caretPulseController, "setViewScale:");
  [(TSKPulseAnimationController *)self->_caretPulseController setDuration:0.05];
  [(TSKPulseAnimationController *)self->_caretPulseController setPulseOffset:4.0];
  uint64_t v13 = self->_caretPulseController;
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  [(TSKHighlightController *)v13 createLayerWithZOrder:8.0 contentsScaleForLayers:v14];
  [(TSKHighlightController *)self->_caretPulseController buildLayersForPath:Mutable withImage:v9];
  [(TSKPulseAnimationController *)self->_caretPulseController startAnimating];
  CGPathRelease(Mutable);
  [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layoutInvalidated];
}

- (id)siblings
{
  return 0;
}

- (id)repForDragging
{
  if ([(TSWPRep *)self isEditing]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPRep;
  return [(TSDRep *)&v4 repForDragging];
}

- (id)hyperlinkContainerRep
{
  [(TSDRep *)self parentRep];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPRep;
  return [(TSDRep *)&v4 repForSelecting];
}

- (void)willDisplayEditHyperlinkUIForHyperlinkField:(id)a3 beginEditing:(BOOL)a4
{
  -[TSWPRep setUseKeyboardWhenEditing:](self, "setUseKeyboardWhenEditing:", 0, a4);
  if ([(TSWPRep *)self hyperlinkContainerRep]) {
    [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] setSelectionToRep:[(TSWPRep *)self hyperlinkContainerRep]];
  }
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] beginEditingRep:self];
  uint64_t v6 = (void *)TSUDynamicCast();
  uint64_t v7 = [a3 range];
  objc_msgSend(v6, "setSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7 + v8, 0));

  [(TSWPRep *)self setUseKeyboardWhenEditing:1];
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  -[TSWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", v7, v9);
  uint64_t v10 = TSUDynamicCast();
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerHost];
  if (objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "hyperlinkGestureRecognizer"), "isEnabled")) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    int v17 = [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldRespondToTextHyperlinks];
    if (v17)
    {
      v20.receiver = self;
      v20.super_class = (Class)TSWPRep;
      unsigned __int8 v12 = -[TSDRep handleSingleTapAtPoint:](&v20, sel_handleSingleTapAtPoint_, x, y);
      uint64_t v13 = [(TSWPRep *)self textEditor];
      BOOL v16 = !v13
         || (double v14 = v13,
             objc_opt_class(),
             [(TSWPEditingController *)v14 selection],
             (unint64_t v15 = (void *)TSUDynamicCast()) == 0)
         || [v15 infoCount] == 1;
      char v18 = v16 | v12;
      if (v10) {
        LOBYTE(v17) = v18;
      }
      else {
        LOBYTE(v17) = v12;
      }
    }
  }
  else
  {
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (id)hyperlinkRegions
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)TSWPRep;
  objc_super v3 = [(TSDRep *)&v22 hyperlinkRegions];
  objc_super v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = v4;
  if (v3) {
    [v4 addObjectsFromArray:v3];
  }
  id v6 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:]([(TSWPRep *)self storage], "smartFieldsWithAttributeKind:intersectingRange:", 6, 0, [(TSWPStorage *)[(TSWPRep *)self storage] length]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        uint64_t v11 = TSUDynamicCast();
        if (v11)
        {
          unsigned __int8 v12 = (void *)v11;
          [(TSWPRep *)self naturalBoundsRectForHyperlinkField:v11];
          objc_msgSend(v5, "addObject:", +[TSDHyperlinkRegion hyperlinkRegionWithURL:bezierPath:](TSDHyperlinkRegion, "hyperlinkRegionWithURL:bezierPath:", objc_msgSend(v12, "url"), +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v13, v14, v15, v16)));
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  return 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (TSWPStorage)storage
{
  [(TSDRep *)self info];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPRep storage]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 2744, @"TSWPRep assumes its info is a storage.  Override -storage if it's not.");
  }

  return (TSWPStorage *)[(TSDRep *)self info];
}

- (NSArray)columns
{
  v2 = [(TSDRep *)self layout];

  return (NSArray *)[(TSDLayout *)v2 columns];
}

- (TSWPSelection)selection
{
  CGRect result = [(TSWPRep *)self textEditor];
  if (result)
  {
    return (TSWPSelection *)[(TSWPSelection *)result selection];
  }
  return result;
}

- (void)invalidateKnobs
{
  if (!self->_indentAnimationRunning)
  {
    v2.receiver = self;
    v2.super_class = (Class)TSWPRep;
    [(TSDRep *)&v2 invalidateKnobs];
  }
}

- (void)addKnobsToArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(TSDLayout *)[(TSDRep *)self layout] layoutIsValid])
  {
    if ([(TSWPRep *)self shouldCreateTextKnobs])
    {
      uint64_t v5 = [(TSWPRep *)self textEditor];
      BOOL v6 = [(TSWPEditingController *)v5 isInParagraphMode];
      long long v23 = v5;
      BOOL v7 = [(TSWPEditingController *)v5 knobTracking];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v8 = [(TSWPRep *)self columns];
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v25;
        char v12 = !v6;
        if (!v5) {
          char v12 = 1;
        }
        char v13 = v12 | !v7;
        double v14 = (double *)MEMORY[0x263F00148];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (objc_msgSend(v16, "lineFragmentForCharIndex:knobTag:selectionType:", -[TSWPSelection start](-[TSWPRep selection](self, "selection"), "start"), 11, -[TSWPSelection type](-[TSWPRep selection](self, "selection"), "type"))&& ((v13 & 1) != 0 || -[TSWPEditingController knobTag](v23, "knobTag") == 11))
            {
              int v17 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 3, 11, self, *v14, v14[1], 15.0);
              [a3 addObject:v17];
            }
            unint64_t v18 = [v16 range];
            if (v18 < [(TSWPSelection *)[(TSWPRep *)self selection] end])
            {
              unint64_t v19 = [(TSWPSelection *)[(TSWPRep *)self selection] end];
              uint64_t v20 = [v16 range];
              if (v19 <= v20 + v21 && ((v13 & 1) != 0 || [(TSWPEditingController *)v23 knobTag] == 10))
              {
                objc_super v22 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 3, 10, self, *v14, v14[1], 15.0);
                [a3 addObject:v22];
              }
            }
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 tag] != 32)
        {
          [(TSWPRep *)self knobCenterForSelection:[(TSWPRep *)self selection] knob:v9];
          objc_msgSend(v9, "setPosition:");
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
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
  BOOL v3 = [(TSWPRep *)self isEditing];
  if (v3)
  {
    BOOL v3 = [(TSWPSelection *)[(TSWPRep *)self selection] isRange];
    if (v3)
    {
      if ((![(TSWPSelection *)[(TSWPRep *)self selection] type]
         || [(TSWPSelection *)[(TSWPRep *)self selection] type] == 4
         || [(TSWPSelection *)[(TSWPRep *)self selection] type] == 7)
        && ![(TSWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment])
      {
        BOOL v3 = [(TSWPRep *)self p_canShowSelectionAndCaretLayers];
        if (v3) {
          LOBYTE(v3) = !self->_suppressSelectionHighlight;
        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (void)p_indentAfterAnimationWithOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  -[TSWPRep setDragRange:](self, "setDragRange:", *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8));
  [(CALayer *)self->_indentAnimationLayer removeFromSuperlayer];

  self->_indentAnimationLayer = 0;
  [(CAShapeLayer *)self->_selectionHighlightLayer removeAnimationForKey:@"position"];
  [(CAShapeLayer *)self->_selectionLineLayers[0] removeAnimationForKey:@"position"];
  [(CAShapeLayer *)self->_selectionLineLayers[1] removeAnimationForKey:@"position"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(TSDRep *)self knobs];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "layer"), "removeAnimationForKey:", @"position");
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if (self->_indentDelta)
  {
    if (self->_indentSelector) {
      SEL indentSelector = self->_indentSelector;
    }
    else {
      SEL indentSelector = 0;
    }
    objc_msgSend(self->_indentTarget, "performSelector:withObject:", indentSelector);
  }
  [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] removeDecorator:self];

  self->_indentTarget = 0;
  self->_indentDelta = 0;
  self->_indentAnimationRunning = 0;
}

- (void)animateIndent:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  self->_indentAnimationRunning = 1;
  uint64_t v7 = [(TSWPRep *)self selection];
  int64_t v8 = self->_indentDelta + a3;
  uint64_t v9 = [(TSWPSelection *)v7 start];
  long long v10 = [(TSWPRep *)self storage];
  uint64_t v11 = [(TSWPStorage *)v10 paragraphLevelAtCharIndex:v9];
  long long v12 = objc_msgSend(-[TSWPStorage listStyleAtCharIndex:effectiveRange:](v10, "listStyleAtCharIndex:effectiveRange:", v9, 0), "valueForProperty:", 177);
  long long v13 = v12;
  uint64_t v14 = v11 + v8;
  if (v11 + v8 >= 8) {
    uint64_t v14 = 8;
  }
  objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v14 & ~(v14 >> 63)), "doubleValue");
  double v16 = v15;
  objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", v11), "doubleValue");
  -[TSDCanvas convertUnscaledToBoundsSize:]([(TSDRep *)self canvas], "convertUnscaledToBoundsSize:", v16 - v17, v16 - v17);
  double v19 = v18;
  uint64_t v20 = v7;
  if ([(TSWPSelection *)v7 type] != 2)
  {
    NSUInteger v21 = [(TSWPStorage *)v10 textRangeForParagraphAtCharIndex:[(TSWPSelection *)v7 start]];
    NSUInteger v23 = v22;
    NSUInteger v25 = [(TSWPStorage *)v10 textRangeForParagraphAtCharIndex:[(TSWPSelection *)v7 end]];
    NSUInteger v26 = v24;
    if (v21 == v25 && v23 == v24)
    {
      NSUInteger v25 = v21;
      v27.NSUInteger length = v23;
    }
    else if ([(TSWPSelection *)v7 end] == v25)
    {
      v27.NSUInteger length = 0;
    }
    else
    {
      v27.NSUInteger length = v26;
    }
    v72.NSUInteger location = v21;
    v72.NSUInteger length = v23;
    v27.NSUInteger location = v25;
    uint64_t v20 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 2, NSUnionRange(v72, v27).location, v72.length, 0, 0);
    CGRect v28 = v20;
  }
  indentAnimationLayer = self->_indentAnimationLayer;
  if (indentAnimationLayer)
  {
    [[(CALayer *)indentAnimationLayer presentationLayer] frame];
    double v31 = v30;
    uint64_t v32 = [(TSWPSelection *)v20 range];
    -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v32, v33, 1);
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    objc_super v42 = [(TSDRep *)self interactiveCanvasController];
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", v35, v37, v39, v41);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v42, "convertUnscaledToBoundsRect:");
    double v19 = v19 + v43 - v31;
  }
  CGRect v44 = (CABasicAnimation *)[MEMORY[0x263F15760] animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v44 setDuration:0.15];
  -[CABasicAnimation setTimingFunction:](v44, "setTimingFunction:", [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]]);
  [(CABasicAnimation *)v44 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v44 setDelegate:self];
  [(CABasicAnimation *)v44 setFillMode:*MEMORY[0x263F15AB0]];
  if ([(TSWPSelection *)v7 isRange])
  {
    if (![(TSWPEditingController *)[(TSWPRep *)self textEditor] isParagraphModeWithSelection:v7 onStorage:[(TSWPRep *)self storage]])
    {
      pSetupIndentAnimation(v44, &self->_selectionLineLayers[0]->super, v19);
      pSetupIndentAnimation(v44, &self->_selectionLineLayers[1]->super, v19);
      pSetupIndentAnimation(v44, &self->_selectionHighlightLayer->super, v19);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      CGRect v45 = [(TSDRep *)self knobs];
      uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v67 != v48) {
              objc_enumerationMutation(v45);
            }
            pSetupIndentAnimation(v44, (CALayer *)[*(id *)(*((void *)&v66 + 1) + 8 * i) layer], v19);
          }
          uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v66 objects:v70 count:16];
        }
        while (v47);
      }
    }
  }
  else
  {
    [(TSWPRep *)self p_hideCaretLayer];
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPRep textLayer](self, "textLayer"), "delegate"), "storage"), "listStyleCount")|| (-[TSWPSelection range](v20, "range"), v50))
  {
    long long v51 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v64 = *MEMORY[0x263F001A8];
    long long v65 = v51;
    id v52 = [(TSWPRep *)self textImageForSelection:v20 frame:&v64 usingGlyphRect:1 shouldPulsate:0 suppressInvisibles:0];
    CGFloat v53 = [(TSDRep *)self interactiveCanvasController];
    -[TSDRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", v64, v65);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v53, "convertUnscaledToBoundsRect:");
    *(CGFloat *)&long long v64 = v73.origin.x;
    *((void *)&v64 + 1) = *(void *)&v73.origin.y;
    *(CGFloat *)&long long v65 = v73.size.width;
    *((void *)&v65 + 1) = *(void *)&v73.size.height;
    CGRect v74 = CGRectIntegral(v73);
    *(CGFloat *)&long long v64 = v74.origin.x;
    *((void *)&v64 + 1) = *(void *)&v74.origin.y;
    *(CGFloat *)&long long v65 = v74.size.width;
    *((void *)&v65 + 1) = *(void *)&v74.size.height;
    uint64_t v54 = [(TSWPSelection *)v20 range];
    -[TSWPRep setDragRange:](self, "setDragRange:", v54, v55);
    double v56 = self->_indentAnimationLayer;
    if (!v56)
    {
      double v57 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      self->_indentAnimationLayer = v57;
      -[CALayer setAnchorPoint:](v57, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      long long v58 = v64;
      [v52 size];
      double v60 = v59;
      [v52 size];
      -[CALayer setFrame:](self->_indentAnimationLayer, "setFrame:", v58, v60, v61);
      [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
      -[CALayer setContentsScale:](self->_indentAnimationLayer, "setContentsScale:");
      -[CALayer setContents:](self->_indentAnimationLayer, "setContents:", [v52 CGImage]);
      [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] addDecorator:self];
      double v56 = self->_indentAnimationLayer;
    }
    pSetupIndentAnimation(v44, v56, v19);
  }
  self->_indentDelta = v8;
  self->_SEL indentSelector = a5;
  if (self->_indentTarget != a4) {
    self->_indentTarget = a4;
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_indentAfterAnimationWithOptions_ object:0];
  [(TSWPRep *)self performSelector:sel_p_indentAfterAnimationWithOptions_ withObject:0 afterDelay:0.15];
}

- (id)decoratorOverlayLayers
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_indentAnimationLayer) {
    return 0;
  }
  v3[0] = self->_indentAnimationLayer;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (CGRect)labelRectForCharIndex:(unint64_t)a3
{
  -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", a3, 0, 1);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v29 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(TSWPRep *)self columns];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v30.NSUInteger location = [v14 range];
        v31.NSUInteger location = location;
        v31.NSUInteger length = length;
        NSRange v15 = NSIntersectionRange(v30, v31);
        if (v15.length)
        {
          objc_msgSend(v14, "columnRectForRange:", v15.location, v15.length);
          v35.origin.CGFloat x = v16;
          v35.origin.CGFloat y = v17;
          v35.size.CGFloat width = v18;
          v35.size.CGFloat height = v19;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [(TSWPRep *)self columns];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v14 range];
        uint64_t v15 = TSUIntersectionRangeWithEdge();
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v14, "glyphRectForRange:includingLabel:", v15, v16, v4);
          v34.origin.CGFloat x = v17;
          v34.origin.CGFloat y = v18;
          v34.size.CGFloat width = v19;
          v34.size.CGFloat height = v20;
          v31.origin.CGFloat x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          CGRect v32 = CGRectUnion(v31, v34);
          CGFloat x = v32.origin.x;
          CGFloat y = v32.origin.y;
          CGFloat width = v32.size.width;
          CGFloat height = v32.size.height;
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (unint64_t)charCountOfGlyphStartingAtCharIndex:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = [(TSWPRep *)self columns];
  unint64_t result = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (result)
  {
    unint64_t v6 = result;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        unint64_t v10 = [v9 range];
        BOOL v12 = a3 < v10 || a3 - v10 >= v11;
        if (!v12)
        {
          long long v13 = (TSWPLineFragment ****)[v9 lineFragmentArray];
          for (uint64_t i = **v13; i != (*v13)[1]; i += 2)
          {
            unint64_t v15 = *(void *)*i;
            BOOL v12 = a3 >= v15;
            unint64_t v16 = a3 - v15;
            if (v12 && v16 < *((void *)*i + 1)) {
              return TSWPLineFragment::characterCountOfGlyphAtCharIndex(*i, a3);
            }
          }
          return 0;
        }
        ++v8;
      }
      while (v6 != v8);
      unint64_t result = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      unint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(TSWPRep *)self columns];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v10 = [v9 range];
        if (a3 >= v10 && a3 - v10 < v11) {
          return [v9 glyphCountForRubyFieldAtCharIndex:a3];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v33 = *MEMORY[0x263EF8340];
  double v7 = *MEMORY[0x263F001A0];
  double v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v11 = [(TSWPRep *)self columns];
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unint64_t v17 = [v16 range];
        if (a3 >= v17 && a3 - v17 < v18)
        {
          objc_msgSend(v16, "glyphRectForRubyFieldAtCharIndex:glyphRange:", a3, location, length);
          double v7 = v20;
          double v8 = v21;
          double v9 = v22;
          double v10 = v23;
          goto LABEL_13;
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
LABEL_13:
  double v24 = v7;
  double v25 = v8;
  double v26 = v9;
  double v27 = v10;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (BOOL)containsText
{
  return [(TSWPStorage *)[(TSWPRep *)self storage] length] != 0;
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  double v3 = (uint64_t *)MEMORY[0x263F7C7C8];
  uint64_t v4 = *MEMORY[0x263F7C7C8];
  NSUInteger v5 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  if (self->_spellChecker)
  {
    if ([(TSWPRep *)self p_spellCheckingEnabled])
    {
      uint64_t v4 = [(TSWPStorageSpellChecker *)self->_spellChecker rangeOfMisspelledWordAtCharIndex:a3];
      NSUInteger v5 = v8;
      NSIntersectionRangeInclusive();
      if (v9)
      {
        uint64_t v4 = *v3;
        NSUInteger v5 = v3[1];
      }
    }
  }
  NSUInteger v10 = v4;
  NSUInteger v11 = v5;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v9 = [(TSWPRep *)self textIsVertical];
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

- (void)p_updateLayersForInsertionPointSelection:(id)a3
{
  if ((TSUSupportsTextInteraction() & 1) == 0) {
    [(TSWPRep *)self p_setSelectionLineLayersHidden:1];
  }
  [(TSWPRep *)self p_hideSelectionHighlightLayer];
  [(TSWPRep *)self p_hideSelectionParagraphBorderLayer];
  NSUInteger v5 = [(TSWPRep *)self textEditor];
  if ([(TSWPEditingController *)v5 wantsCaret])
  {
    int v6 = [(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layerHost] isInFocusedContainer];
    uint64_t v7 = [a3 range];
    if (v6)
    {
      unint64_t v8 = v7;
      if ([a3 isInsertionPoint])
      {
        if ((unint64_t v9 = [(TSWPRep *)self range], v8 >= v9) && v8 - v9 < v10
          || (uint64_t v11 = [(TSWPRep *)self range], v8 == v11 + v12))
        {
          if (v8 != -[TSWPRep range](self, "range") || ([a3 isAtEndOfLine] & 1) == 0)
          {
            uint64_t v13 = [(TSWPRep *)self range];
            if ((v8 != v13 + v14
               || ([a3 isAtEndOfLine] & 1) != 0
               || v8 == [(TSWPStorage *)[(TSWPRep *)self storage] length])
              && [(TSWPRep *)self p_positionCaretLayer:self->_caretLayer forSelection:[(TSWPEditingController *)v5 calculateVisualRunsFromSelection:a3 updateControllerSelection:1] layerRelative:1]&& [(TSWPRep *)self p_canShowSelectionAndCaretLayers])
            {
              [(TSWPRep *)self p_showCaretLayer];
              return;
            }
          }
        }
      }
    }
  }
  else
  {
    [a3 range];
  }

  [(TSWPRep *)self p_hideCaretLayer];
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGRect v12 = CGRectIntegral(a4);
  CGRect v13 = CGRectInset(v12, -1.0, -1.0);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  unint64_t v10 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, 4.0);
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, DeviceRGB);
  CGContextAddPath(a3, v10);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
  CGColorRelease(DeviceRGB);

  CGPathRelease(v10);
}

- (void)p_addRectToContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGRect v13 = CGRectIntegral(a4);
  CGRect v14 = CGRectInset(v13, -1.0, -1.0);
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  unint64_t v10 = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  v12.CGFloat width = 0.0;
  v12.CGFloat height = -1.0;
  CGContextSetShadowWithColor(a3, v12, 2.0, DeviceRGB);
  CGContextSetFillColorWithColor(a3, v10);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGContextFillRect(a3, v15);
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
  CGColorRelease(DeviceRGB);

  CGColorRelease(v10);
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5
{
  BOOL v5 = a5;
  CGRect v24 = CGRectIntegral(a4);
  double v7 = 0.100000001;
  if (!v5) {
    double v7 = 4.0;
  }
  double v8 = -v7;
  if (v5) {
    double v9 = 0.0;
  }
  else {
    double v9 = 3.0;
  }
  CGRect v25 = CGRectInset(v24, v8, v8);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  CGContextBeginTransparencyLayer(a3, 0);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGRect v15 = (CGColor *)TSUCGColorCreateDeviceRGB();
  double v16 = (CGColor *)TSUCGColorCreateDeviceRGB();
  double v17 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, v9);
  CGContextSaveGState(a3);
  v21.CGFloat width = 0.0;
  v21.CGFloat height = -1.0;
  CGContextSetShadowWithColor(a3, v21, 2.0, DeviceRGB);
  CGContextAddPath(a3, v17);
  CGContextSetFillColorWithColor(a3, v15);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  CFArrayRef v18 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v15, v16, 0);
  CGContextAddPath(a3, v17);
  CGContextClip(a3);
  double v19 = CGGradientCreateWithColors(0, v18, 0);

  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  v23.CGFloat y = CGRectGetMaxY(v26);
  v22.CGFloat x = 0.0;
  v23.CGFloat x = 0.0;
  v22.CGFloat y = y;
  CGContextDrawLinearGradient(a3, v19, v22, v23, 0);
  CGGradientRelease(v19);
  CGContextRestoreGState(a3);
  CGColorRelease(DeviceRGB);
  CGColorRelease(v16);
  CGColorRelease(v15);
  CGPathRelease(v17);

  CGContextEndTransparencyLayer(a3);
}

- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 drawBackground:(BOOL)a5 shouldPulsate:(BOOL)a6 forCaret:(BOOL)a7 drawSelection:(id)a8 suppressInvisibles:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v53 = *MEMORY[0x263EF8340];
  memset(&v51, 0, sizeof(v51));
  if (self) {
    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
  }
  CGAffineTransform v50 = v51;
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  double v45 = height;
  v54.size.CGFloat height = height;
  CGRect v55 = CGRectApplyAffineTransform(v54, &v50);
  double v19 = 0.0;
  if (v13)
  {
    if (v11)
    {
      if (v12) {
        double v19 = 0.100000001;
      }
      else {
        double v19 = 0.0;
      }
    }
    else
    {
      double v20 = &kFindSelectionPulseInset;
      if (!v12) {
        double v20 = &kFindSelectionInset;
      }
      double v19 = *(double *)v20 + 6.0;
    }
  }
  CGRect v56 = CGRectIntegral(v55);
  CGRect v57 = CGRectInset(v56, -v19, -v19);
  double v21 = v57.origin.x;
  double v22 = v57.origin.y;
  double v23 = v57.size.width;
  double v24 = v57.size.height;
  TSUScreenScale();
  CGFloat v26 = v25;
  double v27 = TSDMultiplySizeScalar(v23, v24, v25);
  long long v28 = TSDBitmapContextCreate(11, v27);
  if (!v28)
  {
    long long v30 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v31 = [NSString stringWithUTF8String:"-[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:]"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 3437, @"invalid nil value for '%s'", "ctx");
    return 0;
  }
  long long v29 = v28;
  CGContextScaleCTM(v28, v26, v26);
  CGContextTranslateCTM(v29, -v21, -v22);
  [(TSDRep *)self setupForDrawingInLayer:0 context:v29];
  CGContextSetShouldAntialias(v29, 1);
  if (!v13) {
    goto LABEL_18;
  }
  if (v12)
  {
    -[TSWPRep p_addRoundedRectToContext:rect:forCaret:](self, "p_addRoundedRectToContext:rect:forCaret:", v29, v11, x, y, width, v45);
    if (!a8) {
      goto LABEL_28;
    }
LABEL_18:
    CGContextSaveGState(v29);
    [(TSWPRep *)self drawInContext:v29 limitSelection:a8 suppressInvisibles:v9];
    CGContextRestoreGState(v29);
    uint64_t v33 = (void *)TSUProtocolCast();
    if (v33)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      CGRect v34 = (void *)[v33 childReps];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v47 != v37) {
              objc_enumerationMutation(v34);
            }
            double v39 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v39, "info"), "isInlineWithText"))
            {
              CGContextSaveGState(v29);
              [v39 recursivelyDrawInContext:v29];
              CGContextRestoreGState(v29);
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v36);
      }
    }
    goto LABEL_28;
  }
  -[TSWPRep p_addRoundedRectToContext:rect:](self, "p_addRoundedRectToContext:rect:", v29, x, y, width, v45);
  if (a8) {
    goto LABEL_18;
  }
LABEL_28:
  [(TSWPRep *)self didDrawInLayer:0 context:v29];
  CGImageRef Image = CGBitmapContextCreateImage(v29);
  if (Image)
  {
    double v41 = Image;
    CGRect v32 = (void *)[MEMORY[0x263F7C858] imageWithCGImage:Image scale:0 orientation:v26];
    CGImageRelease(v41);
  }
  else
  {
    objc_super v42 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v43 = [NSString stringWithUTF8String:"-[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:]"];
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 3488, @"invalid nil value for '%s'", "ctxImage");
    CGRect v32 = 0;
  }
  CGContextRelease(v29);
  return v32;
}

- (id)textImageForSelection:(id)a3
{
  -[TSWPRep rectForSelection:](self, "rectForSelection:");

  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 0, 0, 0, a3, 1);
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7
{
  return [(TSWPRep *)self textImageForSelection:a3 frame:a4 usingGlyphRect:a5 drawBackground:!a5 shouldPulsate:a6 suppressInvisibles:a7];
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 suppressInvisibles:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  if (!a5) {
    goto LABEL_13;
  }
  if ([a3 type] == 7 && (unint64_t)objc_msgSend(a3, "visualRangeCount") >= 2)
  {
    CGRect v14 = (void **)[a3 visualRanges];
    -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", **v14, (*v14)[1], 0);
    double x = v15;
    double y = v17;
    double width = v19;
    double height = v21;
    if ((unint64_t)[a3 visualRangeCount] >= 2)
    {
      unsigned int v23 = 2;
      uint64_t v24 = 1;
      do
      {
        double v25 = (void *)[a3 visualRanges];
        -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", *(void *)(*v25 + 16 * v24), *(void *)(*v25 + 16 * v24 + 8), 0);
        v49.origin.double x = v26;
        v49.origin.double y = v27;
        v49.size.double width = v28;
        v49.size.double height = v29;
        v46.origin.double x = x;
        v46.origin.double y = y;
        v46.size.double width = width;
        v46.size.double height = height;
        CGRect v47 = CGRectUnion(v46, v49);
        double x = v47.origin.x;
        double y = v47.origin.y;
        double width = v47.size.width;
        double height = v47.size.height;
        uint64_t v24 = v23;
      }
      while ([a3 visualRangeCount] > (unint64_t)v23++);
    }
  }
  else
  {
    uint64_t v31 = [a3 superRange];
    uint64_t v33 = v32;
    BOOL v34 = [a3 type] == 2 || (unint64_t)(objc_msgSend(a3, "type") == 1);
    -[TSWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v31, v33, v34);
    double x = v35;
    double y = v36;
    double width = v37;
    double height = v38;
  }
  v48.origin.double x = x;
  v48.origin.double y = y;
  v48.size.double width = width;
  v48.size.double height = height;
  if (CGRectIsEmpty(v48))
  {
LABEL_13:
    [(TSWPRep *)self rectForSelection:a3];
    double x = v39;
    double y = v40;
    double width = v41;
    double height = v42;
    uint64_t v43 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v43 = 1;
  if (a4)
  {
LABEL_14:
    a4->origin.double x = x;
    a4->origin.double y = y;
    a4->size.double width = width;
    a4->size.double height = height;
  }
LABEL_15:

  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", v43, v10, v9, 0, a3, v8, x, y, width, height);
}

- (id)textImageForRect:(CGRect)a3
{
  return -[TSWPRep p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:](self, "p_imageForRect:usingGlyphRect:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:", 0, 0, 0, 0, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isOverflowing
{
  double v3 = [(TSWPRep *)self storage];
  if ([(TSWPStorage *)v3 wpKind] == 3)
  {
    id v4 = [(TSWPStorage *)v3 length];
    if (v4)
    {
      id v4 = [(NSArray *)[(TSWPRep *)self columns] lastObject];
      if (v4) {
        LODWORD(v4) = ([v4 layoutResultFlags] >> 1) & 1;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)doesNeedDisplayOnEditingDidEnd
{
  return 0;
}

- (void)editingDidEnd
{
  [(TSWPRep *)self p_hideSelectionLayers];
  [(TSWPRep *)self p_hideMarkHighlightLayer];
  if ([(TSWPRep *)self doesNeedDisplayOnEditingDidEnd]) {
    [(TSWPRep *)self setNeedsDisplay];
  }
  objc_opt_class();
  [(TSDRep *)self parentRep];
  double v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    [v3 setShadowOnChildrenDisabled:0];
  }
}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  BOOL v3 = a3;
  if ((TSUSupportsTextInteraction() & 1) == 0
    && ![(TSKHighlightArrayController *)self->_pulseArrayController pulsating]
    && [(TSWPRep *)self activeSearchReference]
    && !self->_updatingHighlights)
  {
    self->_updatingHighlights = 1;
    id v5 = [(TSWPRep *)self lineSearchReferencesForSearchReference:[(TSWPRep *)self activeSearchReference]];
    [(TSDCanvas *)self->super.super.mCanvas viewScale];
    -[TSKHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
    [(TSKHighlightArrayController *)self->_pulseArrayController reset];
    pulseArrayController = self->_pulseArrayController;
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](pulseArrayController, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v5);
    if (v3) {
      [(TSKHighlightArrayController *)self->_pulseArrayController startAnimating];
    }
    [(TSWPRep *)self p_setSelectionLineLayersHidden:1];
    self->_updatingHighlights = 0;
  }
}

- (CGRect)p_paragraphModeRectangleForColumn:(id)a3 selection:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = objc_msgSend(a4, "range", 0);
  BOOL v12 = objc_msgSend(a3, "rectsForSelectionRange:selectionType:forParagraphMode:", v10, v11, objc_msgSend(a4, "type"), 1);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v16) CGRectValue];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        if (CGRectIsNull(v35))
        {
          CGFloat x = v18;
          CGFloat y = v20;
          CGFloat width = v22;
          CGFloat height = v24;
        }
        else
        {
          v36.origin.CGFloat x = v18;
          v36.origin.CGFloat y = v20;
          v36.size.CGFloat width = v22;
          v36.size.CGFloat height = v24;
          v39.origin.CGFloat x = x;
          v39.origin.CGFloat y = y;
          v39.size.CGFloat width = width;
          v39.size.CGFloat height = height;
          CGRect v37 = CGRectUnion(v36, v39);
          CGFloat x = v37.origin.x;
          CGFloat y = v37.origin.y;
          CGFloat width = v37.size.width;
          CGFloat height = v37.size.height;
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
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

- (BOOL)p_paragraphModeBorderNeededForColumn:(id)a3 dragCharIndex:(unint64_t)a4 knobTag:(unint64_t)a5
{
  if (a5 == 10) {
    return [a3 range] < a4;
  }
  if (a5 != 11) {
    return 0;
  }
  uint64_t v6 = [a3 range];
  return v6 + v7 > a4;
}

- (CGPath)p_createPathForParagraphSelection:(id)a3 needsParagraphBorder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  Mutable = 0;
  if ([a3 range] != 0x7FFFFFFFFFFFFFFFLL && v7)
  {
    if (![(TSWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment])
    {
      double v10 = *MEMORY[0x263F00148];
      double v9 = *(double *)(MEMORY[0x263F00148] + 8);
      [(TSDRep *)self naturalBounds];
      *(void *)r1 = v11;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v18 = [(TSWPRep *)self textEditor];
      if (!v4) {
        goto LABEL_8;
      }
      double v19 = v18;
      if ([(TSWPEditingController *)v18 knobTracking])
      {
        CGFloat v20 = [(TSDRep *)self interactiveCanvasController];
        [(TSWPEditingController *)v19 knobTrackingDragPoint];
        double v23 = (TSWPRep *)-[TSDInteractiveCanvasController closestRepToPoint:forStorage:](v20, "closestRepToPoint:forStorage:", [(TSWPRep *)self storage], v21, v22);
        [(TSWPEditingController *)v19 knobTrackingDragPoint];
        -[TSDRep convertNaturalPointFromUnscaledCanvas:](v23, "convertNaturalPointFromUnscaledCanvas:");
        double v10 = v24;
        double v9 = v25;
        uint64_t v54 = -[TSWPRep charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](v23, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0);
        uint64_t v55 = [(TSWPEditingController *)v19 knobTag];
        id v56 = 0;
        if (v23 == self) {
          id v56 = -[TSWPRep closestColumnForPoint:](self, "closestColumnForPoint:", v10, v9);
        }
      }
      else
      {
LABEL_8:
        uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v55 = 11;
        id v56 = 0;
      }
      objc_opt_class();
      [[(TSDRep *)self parentRep] layout];
      double v26 = (void *)TSUDynamicCast();
      if (v26)
      {
        double v27 = (void *)[v26 interiorWrapPath];
        double v28 = [v27 isRectangular] ? 0 : v27;
      }
      else
      {
        double v28 = 0;
      }
      BOOL v53 = [(TSWPRep *)self textIsVertical];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v29 = [(TSWPRep *)self columns];
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        double v52 = v9;
        Mutable = 0;
        uint64_t v32 = *(void *)v59;
        while (1)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            double v34 = v10;
            if (*(void *)v59 != v32) {
              objc_enumerationMutation(v29);
            }
            id v35 = *(id *)(*((void *)&v58 + 1) + 8 * i);
            -[TSWPRep p_paragraphModeRectangleForColumn:selection:](self, "p_paragraphModeRectangleForColumn:selection:", v35, a3, *(void *)&v52);
            double x = v36;
            double y = v37;
            double width = v38;
            double height = v39;
            if (v4 && !CGRectIsNull(*(CGRect *)&v36))
            {
              if (v56 == v35)
              {
                if (v55 == 10)
                {
                  if (v53)
                  {
                    v65.origin.double x = x;
                    v65.origin.double y = y;
                    v65.size.double width = width;
                    v65.size.double height = height;
                    double v44 = CGRectGetMaxX(v65) - v34;
                    double v45 = v34;
                    goto LABEL_31;
                  }
                  v67.origin.double x = x;
                  v67.origin.double y = y;
                  v67.size.double width = width;
                  v67.size.double height = height;
                  double v46 = v52 - CGRectGetMinY(v67);
                  double v45 = y;
                }
                else if (v55 == 11)
                {
                  if (v53)
                  {
                    v64.origin.double x = x;
                    v64.origin.double y = y;
                    v64.size.double width = width;
                    v64.size.double height = height;
                    double v44 = v34 - CGRectGetMinX(v64);
                    double v45 = x;
LABEL_31:
                    if (v44 <= 0.0) {
                      double width = 1.0;
                    }
                    else {
                      double width = v44;
                    }
                    if (v44 <= 0.0) {
                      double x = v34;
                    }
                    else {
                      double x = v45;
                    }
                    goto LABEL_45;
                  }
                  v66.origin.double x = x;
                  v66.origin.double y = y;
                  v66.size.double width = width;
                  v66.size.double height = height;
                  double v46 = CGRectGetMaxY(v66) - v52;
                  double v45 = v52;
                }
                else
                {
                  double v45 = 0.0;
                  double v44 = 0.0;
                  double v46 = 0.0;
                  if (v53) {
                    goto LABEL_31;
                  }
                }
                if (v46 <= 0.0) {
                  double height = 1.0;
                }
                else {
                  double height = v46;
                }
                if (v46 <= 0.0) {
                  double y = v52;
                }
                else {
                  double y = v45;
                }
              }
              else if (![(TSWPRep *)self p_paragraphModeBorderNeededForColumn:v35 dragCharIndex:v54 knobTag:v55])
              {
                double x = *MEMORY[0x263F001A0];
                double y = *(double *)(MEMORY[0x263F001A0] + 8);
                double width = *(double *)(MEMORY[0x263F001A0] + 16);
                double height = *(double *)(MEMORY[0x263F001A0] + 24);
              }
            }
LABEL_45:
            v68.origin.double x = x;
            v68.origin.double y = y;
            v68.size.double width = width;
            v68.size.double height = height;
            if (!CGRectIsNull(v68))
            {
              if (!Mutable) {
                Mutable = CGPathCreateMutable();
              }
              if ([(TSWPStorage *)[(TSWPRep *)self storage] wpKind])
              {
                v69.origin.double x = *(CGFloat *)r1;
                v69.origin.double y = v13;
                v69.size.double width = v15;
                v69.size.double height = v17;
                v76.origin.double x = x;
                v76.origin.double y = y;
                v76.size.double width = width;
                v76.size.double height = height;
                CGRect v70 = CGRectIntersection(v69, v76);
                double x = v70.origin.x;
                double y = v70.origin.y;
                double width = v70.size.width;
                double height = v70.size.height;
              }
              if (v4)
              {
                v71.origin.double x = x;
                v71.origin.double y = y;
                v71.size.double width = width;
                v71.size.double height = height;
                CGRect v72 = CGRectInset(v71, -1.0, -1.0);
                double x = v72.origin.x;
                double y = v72.origin.y;
                double width = v72.size.width;
                double height = v72.size.height;
              }
              v73.origin.double x = x;
              v73.origin.double y = y;
              v73.size.double width = width;
              v73.size.double height = height;
              CGRect v74 = CGRectIntegral(v73);
              double v47 = v74.origin.x;
              double v48 = v74.origin.y;
              double v49 = v74.size.width;
              double v50 = v74.size.height;
              memset(&r1[8], 0, 48);
              if (self) {
                [(TSDRep *)self transformToConvertNaturalToLayerRelative];
              }
              if (v28)
              {
                CGPathAddPath(Mutable, (const CGAffineTransform *)&r1[8], (CGPathRef)objc_msgSend((id)objc_msgSend(v28, "intersectBezierPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v47, v48, v49, v50)), "CGPath"));
              }
              else
              {
                v75.origin.double x = v47;
                v75.origin.double y = v48;
                v75.size.double width = v49;
                v75.size.double height = v50;
                CGPathAddRect(Mutable, (const CGAffineTransform *)&r1[8], v75);
              }
            }
            double v10 = v34;
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (!v31) {
            return Mutable;
          }
        }
      }
    }
    return 0;
  }
  return Mutable;
}

- (CGPath)p_newSelectionPathForRange:(_NSRange)a3 headKnobRect:(CGRect *)a4 tailKnobRect:(CGRect *)a5 selectionType:(int)a6 selection:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  r2_16 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v98 = *MEMORY[0x263EF8340];
  if (a6 == 7 && !a7)
  {
    uint64_t v10 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"];
    CGFloat v13 = (void *)v10;
    BOOL v8 = a5;
    [v13 handleFailureInFunction:v11 file:v12 lineNumber:3812 description:@"If there is a visual selection you have to pass the whole selection"];
  }
  BOOL v71 = [(TSWPRep *)self textIsVertical];
  Mutable = 0;
  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    if (![(TSWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment])
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      obuint64_t j = [(TSWPRep *)self columns];
      uint64_t v66 = [(NSArray *)obj countByEnumeratingWithState:&v92 objects:v97 count:16];
      if (v66)
      {
        Mutable = 0;
        NSUInteger v15 = location + length;
        uint64_t v65 = *(void *)v93;
        p_size = &v8->size;
        p_CGFloat height = &v8->size.height;
        while (1)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v93 != v65) {
              objc_enumerationMutation(obj);
            }
            CGFloat v17 = *(void **)(*((void *)&v92 + 1) + 8 * v16);
            [v17 frameBounds];
            CGFloat r2 = v18;
            CGFloat v20 = v19;
            CGFloat v22 = v21;
            CGFloat v24 = v23;
            if (v7 == 7) {
              uint64_t v25 = [a7 visualRangesArray];
            }
            else {
              uint64_t v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length));
            }
            uint64_t v67 = v16;
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v72 = (id)[v17 rectsForSelectionRanges:v25 selectionType:v7];
            uint64_t r2_8 = [v72 countByEnumeratingWithState:&v88 objects:v96 count:16];
            if (r2_8)
            {
              uint64_t v75 = *(void *)v89;
              do
              {
                for (uint64_t i = 0; i != r2_8; ++i)
                {
                  if (*(void *)v89 != v75) {
                    objc_enumerationMutation(v72);
                  }
                  [*(id *)(*((void *)&v88 + 1) + 8 * i) CGRectValue];
                  CGRect v100 = CGRectIntegral(v99);
                  v104.origin.CGFloat x = r2;
                  v104.origin.CGFloat y = v20;
                  v104.size.CGFloat width = v22;
                  v104.size.CGFloat height = v24;
                  CGRect v101 = CGRectIntersection(v100, v104);
                  CGFloat x = v101.origin.x;
                  CGFloat y = v101.origin.y;
                  CGFloat width = v101.size.width;
                  CGFloat height = v101.size.height;
                  if (v7 <= 7 && ((1 << v7) & 0x91) != 0)
                  {
                    unint64_t v31 = [v17 startCharIndex];
                    unint64_t v32 = [v17 characterCount];
                    unint64_t v33 = location;
                    unint64_t v34 = location + length;
                    if (v7 == 7)
                    {
                      unint64_t v33 = [a7 headChar];
                      unint64_t v34 = [a7 tailChar];
                    }
                    if (r2_16)
                    {
                      if (!Mutable)
                      {
                        id v35 = (TSWPLineFragment *)[v17 lineFragmentForCharIndex:v33 knobTag:11 selectionType:v7];
                        if (v35)
                        {
                          r2_16->origin.CGFloat x = x;
                          r2_16->origin.CGFloat y = y;
                          r2_16->size.CGFloat width = width;
                          r2_16->size.CGFloat height = height;
                          if (v7 == 7) {
                            double v36 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v35, v33, 1);
                          }
                          else {
                            double v36 = TSWPLineFragment::wpOffsetForCharIndex(v35, v33, 1);
                          }
                          double v37 = v36;
                          if (v71)
                          {
                            if (v17)
                            {
                              [v17 transformFromWP];
                              double v38 = *((double *)&v85 + 1);
                              double v39 = *((double *)&v86 + 1);
                              double v40 = *((double *)&v87 + 1);
                            }
                            else
                            {
                              long long v86 = 0u;
                              long long v87 = 0u;
                              double v40 = 0.0;
                              double v39 = 0.0;
                              double v38 = 0.0;
                              long long v85 = 0u;
                            }
                            r2_16->origin.CGFloat y = v40 + v39 * 0.0 + v38 * v37;
                            p_CGFloat width = (void *)&r2_16->size.height;
                          }
                          else
                          {
                            r2_16->origin.CGFloat x = v36;
                            p_CGFloat width = (void *)&r2_16->size.width;
                          }
                          *p_CGFloat width = 0x3FF0000000000000;
                        }
                      }
                    }
                    if (a5)
                    {
                      BOOL v42 = v15 - v31 < v32 && v15 >= v31;
                      if (v42 || v15 == v32 + v31)
                      {
                        if (v7 == 7)
                        {
                          uint64_t v43 = (TSWPLineFragment *)[v17 lineFragmentForCharIndex:location + length - 1 knobTag:10 selectionType:7];
                          if (!v43) {
                            goto LABEL_55;
                          }
                          double v44 = TSWPLineFragment::wpOffsetForCharIndexForVisualSelection(v43, v34, 0);
                        }
                        else
                        {
                          double v45 = (TSWPLineFragment *)[v17 lineFragmentForCharIndex:v15 knobTag:10 selectionType:v7];
                          if (!v45) {
                            goto LABEL_55;
                          }
                          double v44 = TSWPLineFragment::wpOffsetForCharIndex(v45, v34, 0);
                        }
                        double v46 = v44 + -1.0;
                        a5->origin.CGFloat x = x;
                        a5->origin.CGFloat y = y;
                        a5->size.CGFloat width = width;
                        a5->size.CGFloat height = height;
                        if (v71)
                        {
                          if (v17)
                          {
                            [v17 transformFromWP];
                            double v47 = *((double *)&v82 + 1);
                            double v48 = *((double *)&v83 + 1);
                            double v49 = *((double *)&v84 + 1);
                          }
                          else
                          {
                            long long v83 = 0u;
                            long long v84 = 0u;
                            double v49 = 0.0;
                            double v48 = 0.0;
                            double v47 = 0.0;
                            long long v82 = 0u;
                          }
                          a5->origin.CGFloat y = v49 + v48 * 0.0 + v47 * v46;
                          double v50 = p_height;
                        }
                        else
                        {
                          a5->origin.CGFloat x = v46;
                          double v50 = &p_size->width;
                        }
                        *double v50 = 1.0;
                      }
                    }
                  }
LABEL_55:
                  if (!Mutable) {
                    Mutable = CGPathCreateMutable();
                  }
                  memset(&m, 0, sizeof(m));
                  if (self) {
                    [(TSDRep *)self transformToConvertNaturalToLayerRelative];
                  }
                  CGAffineTransform v80 = m;
                  if (TSDIsTransformAxisAligned(&v80.a))
                  {
                    CGAffineTransform r2_24 = m;
                    v102.origin.CGFloat x = x;
                    v102.origin.CGFloat y = y;
                    v102.size.CGFloat width = width;
                    v102.size.CGFloat height = height;
                    CGRect v103 = CGRectApplyAffineTransform(v102, &r2_24);
                    double v51 = v103.origin.x;
                    CGFloat v52 = v103.origin.y;
                    CGFloat v53 = v103.size.width;
                    CGFloat v54 = v103.size.height;
                    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
                    double v56 = TSDRoundedRectForScale(v51, v52, v53, v54, v55);
                    long long v60 = Mutable;
                    p_CGAffineTransform m = 0;
                  }
                  else
                  {
                    p_CGAffineTransform m = &m;
                    long long v60 = Mutable;
                    double v56 = x;
                    CGFloat v57 = y;
                    CGFloat v58 = width;
                    CGFloat v59 = height;
                  }
                  CGPathAddRect(v60, p_m, *(CGRect *)&v56);
                }
                uint64_t r2_8 = [v72 countByEnumeratingWithState:&v88 objects:v96 count:16];
              }
              while (r2_8);
            }
            uint64_t v16 = v67 + 1;
          }
          while (v67 + 1 != v66);
          uint64_t v66 = [(NSArray *)obj countByEnumeratingWithState:&v92 objects:v97 count:16];
          if (!v66) {
            return Mutable;
          }
        }
      }
    }
    return 0;
  }
  return Mutable;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (![a3 isRange]) {
    return 0;
  }
  if ([(TSWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment]) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(TSWPRep *)self columns];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  BOOL v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) lineSelectionsForSelection:a3];
      if (v11)
      {
        uint64_t v12 = v11;
        if (!v8) {
          BOOL v8 = (void *)[MEMORY[0x263EFF980] array];
        }
        [v8 addObjectsFromArray:v12];
      }
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v7);
  return v8;
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = -[TSWPRep p_lineSelectionsForSelection:](self, "p_lineSelectionsForSelection:", [a3 selection]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (!v7) {
        uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
      }
      uint64_t v11 = (void *)[a3 copy];
      uint64_t v12 = [v10 range];
      objc_msgSend(v11, "setRange:", v12, v13);
      [v7 addObject:v11];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);
  return v7;
}

- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4 = TSDClampPointInRect();
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4
{
  int v4 = a4;
  BOOL v7 = [(TSWPRep *)self p_canShowSelectionAndCaretLayers];
  [(TSWPRep *)self p_hideCaretLayer];
  if ((v4 & 4) != 0)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"path"];
    [v8 setDuration:0.100000001];
    [(CAShapeLayer *)self->_selectionHighlightLayer addAnimation:v8 forKey:@"selectionHighlightPathAnimation"];
    if ([(TSWPRep *)self p_shouldDisplaySelectionControls])
    {
      [(CAShapeLayer *)self->_selectionLineLayers[0] addAnimation:v8 forKey:@"leftSelectionLinePositionAnimation"];
      [(CAShapeLayer *)self->_selectionLineLayers[1] addAnimation:v8 forKey:@"rightSelectionLinePositionAnimation"];
    }
  }
  CGSize v9 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  v50.origin = (CGPoint)*MEMORY[0x263F001A0];
  v50.size = v9;
  v49.origin = v50.origin;
  v49.size = v9;
  if (!v7)
  {
    [(TSWPRep *)self p_hideSelectionParagraphBorderLayer];
    [(CAShapeLayer *)self->_selectionHighlightLayer setHidden:1];
    [(CAShapeLayer *)self->_selectionHighlightLayer setPath:0];
    goto LABEL_34;
  }
  uint64_t v10 = [(TSWPRep *)self textEditor];
  BOOL v11 = [(TSWPEditingController *)v10 isParagraphModeWithSelection:a3 onStorage:[(TSWPRep *)self storage]];
  int v12 = [a3 type];
  if ((v4 & 0x800000) != 0 && !v12)
  {
    a3 = [(TSWPEditingController *)v10 logicalToVisualSelection:a3];
    [(TSWPEditingController *)v10 setSelection:a3 withFlags:0];
  }
  id v13 = -[TSWPEditingController calculateVisualRunsFromSelection:updateControllerSelection:](v10, "calculateVisualRunsFromSelection:updateControllerSelection:", a3, 1, *(void *)&v49.origin.x);
  a3 = v13;
  if (!v11)
  {
    if ([v13 isVisual])
    {
      unint64_t v17 = [a3 headChar];
      unint64_t v18 = [a3 tailChar];
      if (v18 >= v17) {
        unint64_t v19 = v17;
      }
      else {
        unint64_t v19 = v18;
      }
      unint64_t v20 = [a3 headChar];
      unint64_t v21 = [a3 tailChar];
      if (v20 <= v21) {
        unint64_t v22 = v21;
      }
      else {
        unint64_t v22 = v20;
      }
      if (v19 <= v22 + 1) {
        unint64_t v23 = v22 + 1;
      }
      else {
        unint64_t v23 = v19;
      }
      if (v19 >= v22 + 1) {
        unint64_t v24 = v22 + 1;
      }
      else {
        unint64_t v24 = v19;
      }
      unint64_t v25 = v23 - v24;
      double v26 = self;
      uint64_t v27 = 7;
      id v28 = a3;
    }
    else
    {
      uint64_t v29 = [a3 range];
      unint64_t v31 = v30;
      uint64_t v27 = [a3 type];
      double v26 = self;
      unint64_t v24 = v29;
      unint64_t v25 = v31;
      id v28 = 0;
    }
    long long v14 = -[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:](v26, "p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:", v24, v25, &v50, &v49, v27, v28);
    goto LABEL_29;
  }
  long long v14 = [(TSWPRep *)self p_createPathForParagraphSelection:v13 needsParagraphBorder:0];
  if (![(TSWPEditingController *)v10 knobTracking]
    || (long long v15 = [(TSWPRep *)self p_createPathForParagraphSelection:a3 needsParagraphBorder:1]) == 0)
  {
LABEL_29:
    [(TSWPRep *)self p_hideSelectionParagraphBorderLayer];
    long long v16 = 0;
    goto LABEL_30;
  }
  long long v16 = v15;
  [(TSWPRep *)self p_showSelectionParagraphBorderLayerWithPath:v15];
LABEL_30:
  selectionHighlightLayer = self->_selectionHighlightLayer;
  if (v14)
  {
    [(CAShapeLayer *)selectionHighlightLayer setPath:v14];
    [(CAShapeLayer *)self->_selectionHighlightLayer setHidden:0];
  }
  else
  {
    [(CAShapeLayer *)selectionHighlightLayer setHidden:1];
    [(CAShapeLayer *)self->_selectionHighlightLayer setPath:0];
  }
  CGPathRelease(v16);
  CGPathRelease(v14);
  [(TSWPRep *)self p_setSelectionHighlightColor];
LABEL_34:
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v34 = v33;
  BOOL v35 = [(TSWPRep *)self textIsVertical];
  BOOL v36 = [a3 type] == 3 || objc_msgSend(a3, "type") == 5;
  if ([(TSWPRep *)self p_shouldDisplaySelectionControls] && v7)
  {
    IsEmptCGFloat y = CGRectIsEmpty(v50);
    double v38 = 0;
    uint64_t v39 = 1;
    if (!IsEmpty && v34 != 0.0 && !v36)
    {
      double v40 = 1.0 / v34;
      if (v35)
      {
        double x = v50.origin.x;
        v50.size.CGFloat height = 2.0 / v34;
        v50.origin.CGFloat y = v50.origin.y - v40;
      }
      else
      {
        double x = v50.origin.x - v40;
        v50.size.CGFloat width = 2.0 / v34;
        v50.origin.double x = v50.origin.x - v40;
      }
      double v38 = -[TSDRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", 1, x);
      uint64_t v39 = 0;
    }
  }
  else
  {
    double v38 = 0;
    uint64_t v39 = 1;
  }
  [(CAShapeLayer *)self->_selectionLineLayers[0] setHidden:v39];
  [(CAShapeLayer *)self->_selectionLineLayers[0] setPath:v38];
  if ([(TSWPRep *)self p_shouldDisplaySelectionControls] && v7)
  {
    BOOL v42 = CGRectIsEmpty(v49);
    uint64_t v43 = 0;
    uint64_t v44 = 1;
    if (!v42 && v34 != 0.0 && !v36)
    {
      CGRect v45 = v49;
      double v46 = 1.0 / v34;
      double v47 = 2.0 / v34;
      if (v35)
      {
        v49.origin.CGFloat y = CGRectGetMaxY(v45) - v46;
        v49.size.CGFloat height = v47;
        double v48 = v49.origin.x;
      }
      else
      {
        double v48 = CGRectGetMaxX(v45) - v46;
        v49.origin.double x = v48;
        v49.size.CGFloat width = v47;
      }
      uint64_t v43 = -[TSDRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", v48, *(_OWORD *)&v49.origin, *(_OWORD *)&v49.size, *(_OWORD *)&v50.origin, *(_OWORD *)&v50.size);
      uint64_t v44 = 0;
    }
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v44 = 1;
  }
  [(CAShapeLayer *)self->_selectionLineLayers[1] setHidden:v44];
  [(CAShapeLayer *)self->_selectionLineLayers[1] setPath:v43];
  CGPathRelease(v38);
  CGPathRelease(v43);
}

- (BOOL)p_canShowSelectionAndCaretLayers
{
  char v3 = TSUSupportsTextInteraction();
  if ([(TSWPSelection *)[(TSWPRep *)self selection] isRange])
  {
    NSUInteger v4 = [(TSWPRep *)self range];
    NSUInteger v6 = v5;
    v12.NSUInteger location = [(TSWPSelection *)[(TSWPRep *)self selection] range];
    v12.NSUInteger length = v7;
    v11.NSUInteger location = v4;
    v11.NSUInteger length = v6;
    BOOL v8 = NSIntersectionRange(v11, v12).length != 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  if (self->_pulseArrayController
    || [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] documentRoot] isFindActive])
  {
    LOBYTE(v9) = 0;
  }
  else if (!self->_indentAnimationLayer {
         || (BOOL v9 = [(TSWPSelection *)[(TSWPRep *)self selection] isRange]))
  }
  {
    LOBYTE(v9) = (self->_secondaryHighlightLayer == 0) & ~v3 & v8;
  }
  return v9;
}

- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment
{
  objc_super v2 = [(TSWPRep *)self textEditor];

  return [(TSWPEditingController *)v2 isSelectionSingleAnchoredDrawableAttachment];
}

- (void)p_hideSelectionLayers
{
  [(TSWPRep *)self p_hideCaretLayer];
  if ((TSUSupportsTextInteraction() & 1) == 0) {
    [(TSWPRep *)self p_setSelectionLineLayersHidden:1];
  }
  [(TSWPRep *)self p_hideSelectionHighlightLayer];

  [(TSWPRep *)self p_hideSelectionParagraphBorderLayer];
}

- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v24 = *MEMORY[0x263EF8340];
  double x = *MEMORY[0x263F001A0];
  double y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [(TSWPRep *)self columns];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "erasableRectForSelectionRange:", location, length);
        v28.origin.double x = v15;
        v28.origin.double y = v16;
        v28.size.double width = v17;
        v28.size.double height = v18;
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        double x = v26.origin.x;
        double y = v26.origin.y;
        double width = v26.size.width;
        double height = v26.size.height;
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  if (!CGRectIsEmpty(v27)) {
    -[TSWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", x, y, width, height);
  }
}

- (void)p_spellCheckerLanguageDidChangeNotification:(id)a3
{
  [(TSWPRep *)self p_destroySpellChecker];

  [(TSWPRep *)self setNeedsDisplay];
}

- (void)p_invalidateSuppressedMisspellingRange
{
  NSUInteger location = self->_suppressedMisspellingRange.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL) {
    -[TSWPRep setNeedsDisplayInRange:](self, "setNeedsDisplayInRange:", location, self->_suppressedMisspellingRange.length);
  }
}

- (void)p_setSuppressedMisspellingRange:(_NSRange)a3
{
  p_suppressedMisspellingRange = &self->_suppressedMisspellingRange;
  if (a3.location != self->_suppressedMisspellingRange.location
    || a3.length != self->_suppressedMisspellingRange.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    [(TSWPRep *)self p_invalidateSuppressedMisspellingRange];
    p_suppressedMisspellingRange->NSUInteger location = location;
    p_suppressedMisspellingRange->NSUInteger length = length;
    [(TSWPRep *)self p_invalidateSuppressedMisspellingRange];
  }
}

- (void)p_updateSuppressedSpellingRange
{
  char v3 = (uint64_t *)MEMORY[0x263F7C7C8];
  uint64_t v4 = *MEMORY[0x263F7C7C8];
  uint64_t v5 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  BOOL v6 = [(TSWPSelection *)[(TSWPRep *)self selection] isValid];
  if (v6) {
    uint64_t v7 = *v3;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v6) {
    uint64_t v8 = v3[1];
  }
  else {
    uint64_t v8 = v5;
  }

  -[TSWPRep p_setSuppressedMisspellingRange:](self, "p_setSuppressedMisspellingRange:", v7, v8);
}

- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3
{
  uint64_t v5 = [(TSWPRep *)self selection];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPRep p_updateForCurrentSelectionWithFlags:]"];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"];
      BOOL v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = (objc_class *)objc_opt_class();
      [v6 handleFailureInFunction:v7, v8, 4310, @"%s expected %@, got %@", "-[TSWPRep p_updateForCurrentSelectionWithFlags:]", v10, NSStringFromClass(v11) file lineNumber description];
    }
  }
  if (self->_caretLayer && !self->_suppressSelectionHighlight)
  {
    [(TSDLayout *)[(TSDRep *)self layout] validate];
    [(TSWPRep *)self p_updateSuppressedSpellingRange];
    if ([(TSWPSelection *)v5 isInsertionPoint])
    {
      [(TSWPRep *)self p_updateLayersForInsertionPointSelection:v5];
    }
    else if ([(TSWPSelection *)v5 isRange] {
           && ([(TSWPEditingController *)[(TSWPRep *)self textEditor] markedRange], !v12))
    }
    {
      [(TSWPRep *)self p_updateLayersForRangeSelection:v5 selectionFlags:a3];
    }
    else if (!self->_pulseArrayController)
    {
      [(TSWPRep *)self p_hideSelectionLayers];
    }
    [(TSWPRep *)self p_updateMarkHighlightLayer];
    [(TSWPRep *)self p_updateSmartFieldHighlightLayer];
  }
}

- (void)i_setNeedsDisplayForSelectionChange
{
  if (!self->_lastSelection
    || ([(TSWPStorage *)[(TSWPRep *)self storage] parentInfo],
        (objc_opt_respondsToSelector() & 1) != 0)
    && [(TSDContainerInfo *)[(TSWPStorage *)[(TSWPRep *)self storage] parentInfo] shouldHideEmptyBullets])
  {
    [(TSWPRep *)self setNeedsDisplay];
  }
  else
  {
    char v3 = [(TSWPRep *)self selection];
    if (![(TSWPSelection *)self->_lastSelection isEqual:v3]
      && ([(TSWPSelection *)v3 isRange] || [(TSWPSelection *)self->_lastSelection isRange]))
    {
      if (v3)
      {
        NSUInteger v4 = [(TSWPSelection *)v3 range];
        NSUInteger v6 = v5;
        v38.NSUInteger location = [(TSWPStorage *)[(TSWPRep *)self storage] range];
        v38.NSUInteger length = v7;
        v35.NSUInteger location = v4;
        v35.NSUInteger length = v6;
        NSRange v8 = NSIntersectionRange(v35, v38);
        NSUInteger location = v8.location;
        NSUInteger length = v8.length;
      }
      else
      {
        NSUInteger location = 0;
        NSUInteger length = 0;
      }
      NSUInteger v11 = [(TSWPSelection *)self->_lastSelection range];
      NSUInteger v13 = v12;
      v39.NSUInteger location = [(TSWPStorage *)[(TSWPRep *)self storage] range];
      v39.NSUInteger length = v14;
      v36.NSUInteger location = v11;
      v36.NSUInteger length = v13;
      NSRange v15 = NSIntersectionRange(v36, v39);
      id v16 = objc_alloc_init(MEMORY[0x263F089C8]);
      CGFloat v17 = v16;
      if (length)
      {
        objc_msgSend(v16, "addIndexesInRange:", location, length);
        if (v15.length)
        {
          objc_msgSend(v17, "addIndexesInRange:", v15.location, v15.length);
          v37.NSUInteger location = location;
          v37.NSUInteger length = length;
          NSRange v18 = NSIntersectionRange(v37, v15);
          objc_msgSend(v17, "removeIndexesInRange:", v18.location, v18.length);
        }
      }
      else if (v15.length)
      {
        objc_msgSend(v16, "addIndexesInRange:", v15.location, v15.length);
      }
      uint64_t v31 = 0;
      unint64_t v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke;
      v30[3] = &unk_2646B3200;
      v30[4] = self;
      v30[5] = &v31;
      [v17 enumerateIndexesUsingBlock:v30];
      uint64_t v26 = 0;
      CGRect v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v32[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke_2;
        v25[3] = &unk_2646B3200;
        v25[4] = self;
        v25[5] = &v26;
        [v17 enumerateIndexesWithOptions:2 usingBlock:v25];
      }

      unint64_t v19 = v32[3];
      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v20 = v27[3];
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v22 = [NSString stringWithUTF8String:"-[TSWPRep i_setNeedsDisplayForSelectionChange]"];
          [v21 handleFailureInFunction:v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4392, @"If there is a invisible char, we should have found it going backwards." file lineNumber description];
          unint64_t v19 = v32[3];
          uint64_t v20 = v27[3];
        }
        if (v19 <= v20 + 1) {
          unint64_t v23 = v20 + 1;
        }
        else {
          unint64_t v23 = v19;
        }
        if (v19 >= v20 + 1) {
          unint64_t v24 = v20 + 1;
        }
        else {
          unint64_t v24 = v19;
        }
        -[TSWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", v24, v23 - v24);
      }
      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v31, 8);
    }
  }

  self->_lastSelection = 0;
  self->_lastSelection = (TSWPSelection *)[(TSWPSelection *)[(TSWPRep *)self selection] copy];
}

uint64_t __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "storage"), "characterAtIndex:", a2);
  if (result <= 0xD && ((1 << result) & 0x3C30) != 0 || (result - 8232) < 2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __46__TSWPRep_i_setNeedsDisplayForSelectionChange__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "storage"), "characterAtIndex:", a2);
  if (result <= 0xD && ((1 << result) & 0x3C30) != 0 || (result - 8232) < 2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (void)p_drawTextLayerInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(TSDRep *)self setupForDrawingInLayer:[(TSWPRep *)self textLayer] context:a3];
  if ([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldDisplayCommentUIForInfo:[[(TSDRep *)self parentRep] info]])
  {
    uint64_t v5 = 7;
  }
  else
  {
    uint64_t v5 = 3;
  }
  id v6 = [(TSWPRep *)self textLayer];
  LOBYTE(v7) = 0;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v5, v7);
  [(TSWPRep *)self didDrawInLayer:[(TSWPRep *)self textLayer] context:a3];

  CGContextRestoreGState(a3);
}

- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(TSDRep *)self setupForDrawingInLayer:[(TSWPRep *)self textBackgroundLayer] context:a3];
  if ([(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] shouldDisplayCommentUIForInfo:[[(TSDRep *)self parentRep] info]])
  {
    uint64_t v5 = 6;
  }
  else
  {
    uint64_t v5 = 2;
  }
  id v6 = [(TSWPRep *)self textBackgroundLayer];
  LOBYTE(v7) = 0;
  -[TSWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v5, v7);
  [(TSWPRep *)self didDrawInLayer:[(TSWPRep *)self textBackgroundLayer] context:a3];

  CGContextRestoreGState(a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  int v7 = [MEMORY[0x263F08B88] isMainThread];
  if (v7 == [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] currentlyWaitingOnThreadedLayoutAndRender]&& ![(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] nestedCanvasAllowLayoutAndRenderOnThread])
  {
    NSRange v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPRep drawLayer:inContext:]"];
    [v8 handleFailureInFunction:v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4460, @"rendering on MT while waiting for secondary thread layout / render, or rendering on secondary thread when not waiting on a secondary thread layout / render and not eligible for background drawing" file lineNumber description];
  }
  if ([(TSWPRep *)self textLayer] == a3)
  {
    uint64_t v10 = &selRef_p_drawTextLayerInContext_;
  }
  else
  {
    if ([(TSWPRep *)self textBackgroundLayer] != a3) {
      return;
    }
    uint64_t v10 = &selRef_p_drawTextBackgroundLayerInContext_;
  }
  NSUInteger v11 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] documentRoot] accessController];
  NSUInteger v12 = *v10;

  [(TSKAccessController *)v11 performRead:v12 withTarget:self argument:a4];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)tilingLayerWillSetNeedsDisplay:(id)a3
{
  [(TSDRep *)self interactiveCanvasController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v5 tilingLayerWillSetNeedsDisplay:a3];
  }
}

- (void)tilingLayerWillSetNeedsLayout:(id)a3
{
  [(TSDRep *)self interactiveCanvasController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v5 tilingLayerWillSetNeedsLayout:a3];
  }
}

- (void)tilingLayerWillSetNeedsDisplayForDirtyTiles:(id)a3
{
  [(TSDRep *)self interactiveCanvasController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v5 tilingLayerWillSetNeedsDisplayForDirtyTiles:a3];
  }
}

- (BOOL)textIsVertical
{
  objc_super v2 = [(TSDRep *)self layout];

  return [(TSDLayout *)v2 textIsVertical];
}

- (void)p_teardown
{
  self->_searchReferences = 0;
  self->_activeSearchReference = 0;
  [(CAShapeLayer *)self->_selectionHighlightLayer setDelegate:0];

  self->_selectionHighlightLayer = 0;
  self->_selectionParagraphBorderLayer = 0;

  self->_lastSelection = 0;
  [(CAShapeLayer *)self->_markHighlightLayer setDelegate:0];

  self->_markHighlightLayer = 0;
  [(CAShapeLayer *)self->_smartFieldHighlightLayer setDelegate:0];

  self->_smartFieldHighlightLayer = 0;
  self->_caretPulseController = 0;

  self->_pulseArrayController = 0;
  self->_highlightArrayController = 0;
  [(CAShapeLayer *)self->_selectionLineLayers[0] setDelegate:0];

  self->_selectionLineLayers[0] = 0;
  [(CAShapeLayer *)self->_selectionLineLayers[1] setDelegate:0];

  self->_selectionLineLayers[1] = 0;
  [(CALayer *)self->_caretLayer setDelegate:0];

  self->_caretLayer = 0;
  [(TSWPRep *)self p_destroyLayer:1];
  [(TSWPRep *)self p_destroyLayer:0];
  [(CAShapeLayer *)self->_secondaryHighlightLayer setDelegate:0];

  self->_secondaryHighlightLayer = 0;
  self->_indentAnimationLayer = 0;

  self->_indentTarget = 0;
  [(TSWPRep *)self p_destroySpellChecker];
  [(CALayer *)self->_dragAndDropCaretLayer setDelegate:0];

  self->_dragAndDropCaretLayer = 0;
}

- (BOOL)preventClipToColumn
{
  return 0;
}

- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(int)a7 suppressInvisibles:(BOOL)a8
{
  NSRange v8 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v40 = [(TSDCanvas *)[(TSDRep *)self canvas] textRendererForLayer:a3 context:a4];
  objc_msgSend(v40, "setPreventClipToColumn:", -[TSWPRep preventClipToColumn](v8, "preventClipToColumn"));
  [(TSDRep *)v8 layout];
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [(TSDLayout *)[(TSDRep *)v8 layout] interiorClippingPath];
  }
  else {
    uint64_t v9 = 0;
  }
  [v40 setInteriorClippingPath:v9];
  if ([(TSDCanvas *)[(TSDRep *)v8 canvas] isCanvasInteractive]
    && (uint64_t v10 = [(TSWPRep *)v8 textEditor]) != 0)
  {
    NSUInteger v11 = v10;
    uint64_t v12 = [(TSWPEditingController *)v10 markedRange];
    uint64_t v34 = v13;
    uint64_t v35 = v12;
    NSUInteger v14 = v11;
  }
  else
  {
    NSUInteger v14 = 0;
    uint64_t v34 = *(void *)(MEMORY[0x263F7C7C8] + 8);
    uint64_t v35 = *MEMORY[0x263F7C7C8];
  }
  unint64_t v30 = v14;
  uint64_t v33 = [(TSWPEditingController *)v14 markedText];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [(TSWPRep *)v8 columns];
  uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v41)
  {
    uint64_t v32 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v46 = 0;
        double v47 = 0;
        uint64_t v48 = 0;
        __p = 0;
        uint64_t v44 = 0;
        uint64_t v45 = 0;
        CGFloat v17 = v8;
        if ([(TSDCanvas *)[(TSDRep *)v8 canvas] isCanvasInteractive])
        {
          uint64_t v18 = [v16 range];
          -[TSWPEditingController addAllDictationInterpretationRangesInRange:toRanges:](v30, "addAllDictationInterpretationRangesInRange:toRanges:", v18, v19, &v46);
        }
        if (a3) {
          uint64_t v42 = [(TSWPRep *)v8 selection];
        }
        else {
          uint64_t v42 = 0;
        }
        uint64_t v20 = v8;
        NSUInteger location = v8->_dragRange.location;
        NSUInteger length = v17->_dragRange.length;
        BOOL v23 = [(TSDCanvas *)[(TSDRep *)v20 canvas] isCanvasInteractive];
        NSUInteger v24 = v17->_suppressedMisspellingRange.location;
        NSUInteger v25 = v17->_suppressedMisspellingRange.length;
        LOBYTE(v29) = a8;
        LODWORD(v28) = a7;
        LOBYTE(v27) = [(TSDCanvas *)[(TSDRep *)v17 canvas] shouldSuppressBackgrounds];
        LOBYTE(v26) = v23;
        objc_msgSend(v16, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v40, v42, a5, location, length, a6.location, a6.length, v26, 0, v24, v25, v27, &v46, &__p, v35,
          v34,
          v33,
          v28,
          [(TSDLayout *)[(TSDRep *)v17 layout] pageCount],
          v29,
          [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDCanvas *)[(TSDRep *)v17 canvas] canvasController] canvasEditor] canvasSelection]);
        if (__p)
        {
          uint64_t v44 = __p;
          operator delete(__p);
        }
        NSRange v8 = v17;
        if (v46)
        {
          double v47 = v46;
          operator delete(v46);
        }
      }
      uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v41);
  }
}

- (void)p_createLayer:(int)a3
{
  textLayers = self->_textLayers;
  uint64_t v6 = a3;
  if (self->_textLayers[a3])
  {
    int v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPRep p_createLayer:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 4813, @"Shouldn't be creating _textLayer again");
  }
  uint64_t v9 = objc_alloc_init(TSDTilingLayer);
  textLayers[v6] = v9;
  uint64_t v10 = (double *)MEMORY[0x263F00148];
  -[TSDTilingLayer setAnchorPoint:](v9, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(TSDTilingLayer *)textLayers[v6] setEdgeAntialiasingMask:0];
  [(TSDTilingLayer *)textLayers[v6] setDelegate:self];
  -[TSDTilingLayer setPosition:](textLayers[v6], "setPosition:", *v10, v10[1]);
  double v11 = -3.0;
  if (a3 == 1) {
    double v11 = -2.0;
  }
  [(TSDTilingLayer *)textLayers[v6] setZPosition:v11];
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  -[TSDTilingLayer setContentsScale:](textLayers[v6], "setContentsScale:");
  if (a3 == 1)
  {
    [(TSDTilingLayer *)textLayers[v6] setEnableContext:1];
    if ([(TSWPRep *)self useDynamicTiling])
    {
      uint64_t v12 = objc_alloc_init(TSWPRepTileGeometry);
      +[TSDTilingLayer defaultTileSize];
      -[TSWPRepTileGeometry setMaxTileSize:](v12, "setMaxTileSize:");
      [(TSDTilingLayer *)textLayers[v6] setGeometryProvider:v12];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TSDTilingLayer *)textLayers[v6] setTilingMode:[(TSWPRep *)self tilingMode]];
    [(TSDTilingLayer *)textLayers[v6] setForceTiling:[(TSWPRep *)self forceTiling]];
  }
  if ([(TSWPRep *)self p_hasVisibleContents])
  {
    uint64_t v13 = [(TSDRep *)self interactiveCanvasController];
    NSUInteger v14 = textLayers[v6];
    [(TSDInteractiveCanvasController *)v13 setNeedsDisplayOnLayer:v14];
  }
}

- (void)p_destroyLayer:(int)a3
{
  textLayers = self->_textLayers;
  [(TSDTilingLayer *)self->_textLayers[a3] setDelegate:0];

  textLayers[a3] = 0;
}

- (id)p_newCaretLayerWithZPosition:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F157E8]);
  objc_msgSend(v5, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  objc_msgSend(v5, "setBackgroundColor:", -[TSWPRep p_caretLayerColor](self, "p_caretLayerColor"));
  [v5 setEdgeAntialiasingMask:0];
  [v5 setDelegate:self];
  [v5 setZPosition:a3];
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  objc_msgSend(v5, "setContentsScale:");
  [v5 setHidden:0];
  return v5;
}

- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5
{
  BOOL v5 = a5;
  [(TSWPRep *)self p_caretRectForSelection:a4];
  BOOL v12 = v10 > 0.0 || v11 > 0.0;
  if (v12)
  {
    CGFloat v13 = v8;
    CGFloat v14 = v9;
    double v15 = v10;
    CGFloat v16 = v11;
    memset(&v55, 0, sizeof(v55));
    if (v5)
    {
      if (self) {
        [(TSDRep *)self transformToConvertNaturalToLayerRelative];
      }
    }
    else if (self)
    {
      [(TSWPRep *)self transformToConvertNaturalToScaledRoot];
    }
    CGAffineTransform v54 = v55;
    v56.origin.double x = v13;
    v56.origin.double y = v14;
    v56.size.double width = v15;
    v56.size.double height = v16;
    CGRect v57 = CGRectApplyAffineTransform(v56, &v54);
    double x = v57.origin.x;
    double y = v57.origin.y;
    double width = v57.size.width;
    double height = v57.size.height;
    CGAffineTransform v53 = v55;
    long double v21 = TSDTransformAngle(&v53.a);
    TSDNormalizeAngleInDegrees(v21);
    double v23 = fmod(360.0 - v22, 360.0);
    if (v23 != 0.0)
    {
      double v24 = 1.0;
      if (v15 <= 0.0) {
        double v24 = 0.5;
      }
      [a3 setAnchorPoint:v24];
      if (v23 == 180.0 || v23 == 90.0 || v23 == 270.0) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = 15;
      }
      [a3 setEdgeAntialiasingMask:v27];
      -[TSWPRep p_convertNaturalRectToRotated:repAngle:](self, "p_convertNaturalRectToRotated:repAngle:", x, y, width, height, v23);
      double v31 = v30;
      double v33 = v32;
      BOOL v34 = v15 <= 0.0;
      if (v15 <= 0.0) {
        double v35 = 2.0;
      }
      else {
        double v35 = v28;
      }
      if (v34) {
        double v36 = v29;
      }
      else {
        double v36 = 2.0;
      }
LABEL_42:
      objc_msgSend(a3, "setBounds:", 0.0, 0.0, v35, v36);
      objc_msgSend(a3, "setPosition:", v31, v33);
      objc_msgSend(a3, "setValue:forKeyPath:", objc_msgSend(NSNumber, "numberWithDouble:", (360.0 - v23) * 3.14159265 / 180.0), @"transform.rotation.z");
      return v12;
    }
    objc_msgSend(a3, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    [a3 setEdgeAntialiasingMask:0];
    double v37 = x;
    double v38 = y;
    double v39 = width;
    double v40 = height;
    if (v15 <= 0.0)
    {
      CGRect v59 = CGRectInset(*(CGRect *)&v37, (width + -2.0) * 0.5, 0.0);
      double v31 = round(v59.origin.x);
      double v33 = round(v59.origin.y);
      double v36 = round(v59.size.height);
      double v35 = 2.0;
    }
    else
    {
      CGRect v58 = CGRectInset(*(CGRect *)&v37, 0.0, (height + -2.0) * 0.5);
      double v31 = round(v58.origin.x);
      double v33 = round(v58.origin.y);
      double v35 = round(v58.size.width);
      double v36 = 2.0;
    }
    [(TSDRep *)self naturalBounds];
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    if (v5)
    {
      if (self)
      {
        uint64_t v50 = v42;
        uint64_t v51 = v41;
        [(TSDRep *)self transformToConvertNaturalToLayerRelative];
LABEL_36:
        uint64_t v42 = v50;
        uint64_t v41 = v51;
LABEL_38:
        uint64_t v47 = v44;
        uint64_t v48 = v46;
        CGRect v60 = CGRectApplyAffineTransform(*(CGRect *)&v41, &v52);
        if (v31 < v60.origin.x) {
          double v31 = v60.origin.x;
        }
        if (v33 < v60.origin.y) {
          double v33 = v60.origin.y;
        }
        goto LABEL_42;
      }
    }
    else if (self)
    {
      uint64_t v50 = v42;
      uint64_t v51 = v41;
      [(TSWPRep *)self transformToConvertNaturalToScaledRoot];
      goto LABEL_36;
    }
    memset(&v52, 0, sizeof(v52));
    goto LABEL_38;
  }
  return v12;
}

- (void)p_showCaretLayer
{
  if (!self->_caretAnimationDisabled
    && (self->_selectionChanged
     || ![(CALayer *)self->_caretLayer animationForKey:@"caretBlink"]))
  {
    [(TSWPRep *)self p_startCaretLayerAnimation];
  }
  if (!self->_suppressCaret)
  {
    caretLayer = self->_caretLayer;
    [(CALayer *)caretLayer setHidden:0];
  }
}

- (void)p_hideCaretLayer
{
  if (!self->_caretAnimationDisabled) {
    [(TSWPRep *)self p_stopCaretLayerAnimation];
  }
  caretLayer = self->_caretLayer;

  [(CALayer *)caretLayer setHidden:1];
}

- (void)p_startCaretLayerAnimation
{
  block[6] = *MEMORY[0x263EF8340];
  if (!-[TSWPRep p_startCaretLayerAnimation]::sKeyFrames)
  {
    for (uint64_t i = 0; i != 20; ++i)
      *(void *)&v5[i * 8] = [NSNumber numberWithDouble:*(double *)&caretKeyValues[i]];
    -[TSWPRep p_startCaretLayerAnimation]::sKeyFrames = [objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:v5 count:20];
  }
  NSUInteger v4 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v4 setCalculationMode:*MEMORY[0x263F15970]];
  [v4 setValues:-[TSWPRep p_startCaretLayerAnimation]::sKeyFrames];
  [v4 setDuration:1.0];
  [v4 setRepeatDuration:INFINITY];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TSWPRep_p_startCaretLayerAnimation__block_invoke;
  block[3] = &unk_2646B0750;
  block[4] = self;
  block[5] = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __37__TSWPRep_p_startCaretLayerAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 296) addAnimation:*(void *)(a1 + 40) forKey:@"caretBlink"];
}

- (void)p_stopCaretLayerAnimation
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__TSWPRep_p_stopCaretLayerAnimation__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__TSWPRep_p_stopCaretLayerAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 296) removeAnimationForKey:@"caretBlink"];
}

- (void)p_createSelectionLineLayers
{
  char v3 = [(TSWPRep *)self p_caretLayerColor];
  uint64_t v4 = 0;
  selectionLineLayers = self->_selectionLineLayers;
  char v6 = 1;
  int v7 = (double *)MEMORY[0x263F00148];
  do
  {
    char v8 = v6;
    if (selectionLineLayers[v4])
    {
      double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPRep p_createSelectionLineLayers]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5044, @"Shouldn't be creating _selectionLineLayers again");
    }
    double v11 = objc_alloc_init(TSWPSelectionHighlightLayer);
    selectionLineLayers[v4] = &v11->super;
    -[TSWPSelectionHighlightLayer setAnchorPoint:](v11, "setAnchorPoint:", *v7, v7[1]);
    [(CAShapeLayer *)selectionLineLayers[v4] setEdgeAntialiasingMask:0];
    [(CAShapeLayer *)selectionLineLayers[v4] setDelegate:self];
    [(CAShapeLayer *)selectionLineLayers[v4] setZPosition:-1.0];
    [(CAShapeLayer *)selectionLineLayers[v4] setFillColor:v3];
    [(CAShapeLayer *)selectionLineLayers[v4] setHidden:1];
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v8 & 1) != 0);
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
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor");
  selectionHighlightLayer = self->_selectionHighlightLayer;

  [(CAShapeLayer *)selectionHighlightLayer setFillColor:v3];
}

- (void)p_createSelectionHighlightLayer
{
  if (self->_selectionHighlightLayer)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPRep p_createSelectionHighlightLayer]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5111, @"Shouldn't be creating _selectionHighlightLayer again");
  }
  BOOL v5 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_selectionHighlightLayer = &v5->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v5, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CAShapeLayer *)self->_selectionHighlightLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_selectionHighlightLayer setDelegate:self];
  [(CAShapeLayer *)self->_selectionHighlightLayer setZPosition:-1.79999995];

  [(TSWPRep *)self p_setSelectionHighlightColor];
}

- (void)p_createSelectionParagraphBorderLayer
{
  if (self->_selectionParagraphBorderLayer)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPRep p_createSelectionParagraphBorderLayer]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRep.mm"), 5126, @"Shouldn't be creating _selectionParagraphBorderLayer again");
  }
  self->_selectionParagraphBorderLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  -[CAShapeLayer setContentsScale:](self->_selectionParagraphBorderLayer, "setContentsScale:");
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setHidden:0];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:0.0];
  -[CAShapeLayer setAnchorPoint:](self->_selectionParagraphBorderLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setZPosition:-1.85000002];
  -[CAShapeLayer setStrokeColor:](self->_selectionParagraphBorderLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.119999997, 0.370000005, 0.949999988, 0.550000012), "CGColor"));
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setLineWidth:2.0];
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;

  [(CAShapeLayer *)selectionParagraphBorderLayer setFillColor:0];
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
    uint64_t v4 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v4 setDuration:0.15];
    BOOL v5 = NSNumber;
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
    objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "numberWithFloat:"));
    [v4 setToValue:&unk_26D73A928];
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:0.0];
    selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
    [(CAShapeLayer *)selectionParagraphBorderLayer addAnimation:v4 forKey:@"kParagraphModeBorderFadeOutAnimation"];
  }
}

- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3
{
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer setPath:a3];
  [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
  if (v4 != 1.0)
  {
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer removeAllAnimations];
    BOOL v5 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v5 setDuration:0.15];
    char v6 = NSNumber;
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer opacity];
    objc_msgSend(v5, "setFromValue:", objc_msgSend(v6, "numberWithFloat:"));
    [v5 setToValue:&unk_26D73A938];
    LODWORD(v7) = 1.0;
    [(CAShapeLayer *)self->_selectionParagraphBorderLayer setOpacity:v7];
    selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
    [(CAShapeLayer *)selectionParagraphBorderLayer addAnimation:v5 forKey:@"kParagraphModeBorderFadeInAnimation"];
  }
}

- (void)p_createMarkHighlightLayer
{
  float v3 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_markHighlightLayer = &v3->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v3, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CAShapeLayer *)self->_markHighlightLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_markHighlightLayer setDelegate:self];
  -[CAShapeLayer setFillColor:](self->_markHighlightLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.100000001), "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_markHighlightLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor"));
  markHighlightLayer = self->_markHighlightLayer;

  [(CAShapeLayer *)markHighlightLayer setZPosition:-1.89999998];
}

- (void)p_hideMarkHighlightLayer
{
}

- (void)p_updateMarkHighlightLayer
{
  if ([(TSWPRep *)self isEditing]
    && (uint64_t v3 = [(TSWPEditingController *)[(TSWPRep *)self textEditor] markedRange],
        (BOOL v5 = -[TSWPRep p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:](self, "p_newSelectionPathForRange:headKnobRect:tailKnobRect:selectionType:selection:", v3, v4, 0, 0, 0, 0)) != 0))
  {
    char v6 = v5;
    [(CAShapeLayer *)self->_markHighlightLayer setPath:v5];
    [(CAShapeLayer *)self->_markHighlightLayer setHidden:0];
    CGPathRelease(v6);
  }
  else
  {
    [(CAShapeLayer *)self->_markHighlightLayer setHidden:1];
  }
  self->_markChanged = 0;
}

- (BOOL)p_spellCheckingEnabled
{
  if ([(TSDCanvas *)[(TSDRep *)self canvas] spellCheckingSuppressed]
    || ![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    return 0;
  }

  return +[TSWPUserDefaults spellCheckingEnabled];
}

- (void)p_createSmartFieldHighlightLayer
{
  uint64_t v3 = objc_alloc_init(TSWPSelectionHighlightLayer);
  self->_smartFieldHighlightLayer = &v3->super;
  -[TSWPSelectionHighlightLayer setAnchorPoint:](v3, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CAShapeLayer *)self->_smartFieldHighlightLayer setEdgeAntialiasingMask:0];
  [(CAShapeLayer *)self->_smartFieldHighlightLayer setDelegate:self];
  -[CAShapeLayer setFillColor:](self->_smartFieldHighlightLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.0500000007), "CGColor"));
  -[CAShapeLayer setStrokeColor:](self->_smartFieldHighlightLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.899999976), "CGColor"));
  smartFieldHighlightLayer = self->_smartFieldHighlightLayer;

  [(CAShapeLayer *)smartFieldHighlightLayer setZPosition:-1.89999998];
}

- (void)p_hideSmartFieldHighlightLayer
{
}

- (void)p_updateSmartFieldHighlightLayer
{
  char v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"ShowInvisibles");
  [(TSWPRep *)self range];
  if ([(TSWPRep *)self isEditing])
  {
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = [(TSWPRep *)self textEditor];
      if (v4) {
        [(TSWPSelection *)[(TSWPEditingController *)v4 selection] range];
      }
    }
  }
  smartFieldHighlightLayer = self->_smartFieldHighlightLayer;

  [(CAShapeLayer *)smartFieldHighlightLayer setHidden:1];
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPRep;
  [(TSDRep *)&v5 didDrawInLayer:a3 context:a4];
  [(TSWPRep *)self p_updateSmartFieldHighlightLayer];
}

- (void)p_invalidateCommentKnobs
{
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    && [(TSWPStorage *)[(TSWPRep *)self storage] highlightsAllowed])
  {
    [(TSWPRep *)self invalidateKnobs];
  }
}

- (void)p_selectionChangedNotification:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  if (v4)
  {
    objc_super v5 = v4;
    char v6 = (void *)[v4 objectForKeyedSubscript:@"TSWPEditingControllerEditor"];
    double v7 = [(TSDRep *)self interactiveCanvasController];
    if ((TSDInteractiveCanvasController *)[v6 interactiveCanvasController] == v7)
    {
      char v8 = (TSWPStorage *)[v6 storage];
      if (v8 == [(TSWPRep *)self storage])
      {
        self->_hudStateDirtdouble y = 1;
        self->_selectionChanged = 1;
        self->_newSelectionFlags = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"TSWPEditingControllerSelectionFlagsKey"), "unsignedIntegerValue");
        id v9 = [(TSDLayout *)[(TSDRep *)self layout] layoutController];
        uint64_t v10 = [(TSDRep *)self layout];
        [v9 invalidateLayout:v10];
      }
    }
  }
}

- (void)p_markChangedNotification:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  if (v4)
  {
    objc_super v5 = (void *)[v4 objectForKeyedSubscript:@"TSWPEditingControllerEditor"];
    char v6 = (TSDInteractiveCanvasController *)[v5 interactiveCanvasController];
    if (v6 == [(TSDRep *)self interactiveCanvasController])
    {
      double v7 = (TSWPStorage *)[v5 storage];
      if (v7 == [(TSWPRep *)self storage])
      {
        self->_markChanged = 1;
        char v8 = [(TSDRep *)self layout];
        [(TSDLayout *)v8 invalidate];
      }
    }
  }
}

- (void)p_editingDidEndNotification:(id)a3
{
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"TSWPEditingControllerEditor");
  objc_super v5 = (TSWPStorage *)[(id)TSUDynamicCast() storage];
  if (v5 == [(TSWPRep *)self storage])
  {
    [(TSWPRep *)self editingDidEnd];
  }
}

- (BOOL)p_hasVisibleContents
{
  if ([(TSWPStorage *)[(TSWPRep *)self storage] length]) {
    return 1;
  }

  return [(TSWPRep *)self isEditing];
}

- (BOOL)p_hasEmptyList
{
  uint64_t v3 = [(TSWPRep *)self range];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v4) {
    return 0;
  }
  uint64_t v5 = v3;
  char v6 = [(TSWPRep *)self storage];

  return [(TSWPStorage *)v6 paragraphHasListLabelAtCharIndex:v5];
}

- (CGColor)p_caretLayerColor
{
  objc_super v2 = (void *)[MEMORY[0x263F7C808] colorWithRed:0.0 green:0.435294118 blue:0.890196078 alpha:1.0];

  return (CGColor *)[v2 CGColor];
}

- (CGAffineTransform)transformToConvertNaturalToScaledRoot
{
  memset(&v10, 0, sizeof(v10));
  uint64_t v5 = [(TSDRep *)self layout];
  if (v5) {
    [(TSDAbstractLayout *)v5 transformInRoot];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  [(TSDCanvas *)self->super.super.mCanvas viewScale];
  CGAffineTransform t1 = v10;
  CGAffineTransformMakeScale(&v8, v6, v6);
  return CGAffineTransformConcat(retstr, &t1, &v8);
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3 dragIsTopicSelection:(BOOL)a4
{
  unsigned __int8 v19 = 0;
  if (a4)
  {
    unint64_t v5 = +[TSWPColumn charIndexForTopicDragAtPoint:inColumnsArray:](TSWPColumn, "charIndexForTopicDragAtPoint:inColumnsArray:", [(TSWPRep *)self columns], a3.x, a3.y);
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v5 = -[TSWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:](self, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", a4, &v19, a3.x, a3.y);
    uint64_t v6 = v19;
  }
  id v7 = -[TSWPStorage extendSelectionToIncludeSmartFields:](-[TSWPRep storage](self, "storage"), "extendSelectionToIncludeSmartFields:", -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v5, 0, 0, v6));
  if ([v7 isRange])
  {
    CGAffineTransform v8 = [(TSWPRep *)self storage];
    uint64_t v9 = [v7 range];
    id v11 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](v8, "smartFieldsWithAttributeKind:intersectingRange:", 6, v9, v10);
    if ([v11 count] == 1
      && (objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", 0), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      uint64_t v12 = [v7 range];
      unint64_t v14 = v12 + (v13 >> 1);
      uint64_t v15 = [v7 range];
      if (v5 <= v14) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = v16;
      }
      return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v15 + v17, 0);
    }
  }
  return v7;
}

- (void)pulseAnimationDidStop:(id)a3
{
  if (self->_pulseArrayController == a3)
  {
    if ([a3 autohide])
    {
      [(TSWPRep *)self p_setPulseControllerActive:0 autohide:0];
      [(TSWPRep *)self p_updateForCurrentSelectionWithFlags:0];
      [(TSWPRep *)self invalidateKnobs];
      [(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] layoutInvalidated];
    }
    uint64_t v4 = [(TSWPRep *)self activeSearchReference];
    [(TSWPSearchReference *)v4 setPulseHighlight:0];
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  if (self->_caretPulseController == a3)
  {

    self->_caretPulseController = 0;
    uint64_t v4 = [(TSDRep *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v4 layoutInvalidated];
  }
}

- (BOOL)shouldAlwaysAutoHide
{
  return 0;
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    BOOL v6 = a4;
    if (!pulseArrayController)
    {
      pulseArrayController = [[TSKHighlightArrayController alloc] initWithZOrder:self delegate:8.0];
      self->_pulseArrayController = pulseArrayController;
    }
    [(TSKHighlightArrayController *)pulseArrayController setShouldPulsate:1];
    [(TSKHighlightArrayController *)self->_pulseArrayController setAutohide:[(TSWPRep *)self shouldAlwaysAutoHide] | v6];
    id v7 = [(TSDRep *)self layout];
    if (v7)
    {
      [(TSDAbstractLayout *)v7 transformInRoot];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v10 = 0u;
    }
    CGAffineTransform v8 = self->_pulseArrayController;
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    [(TSKHighlightArrayController *)v8 setTransform:v9];
    [(TSDCanvas *)self->super.super.mCanvas viewScale];
    -[TSKHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");
  }
  else if (pulseArrayController)
  {

    self->_pulseArrayController = 0;
  }
}

- (void)p_activeFindHighlightChangedNotification:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  objc_opt_class();
  [v4 objectForKeyedSubscript:@"TSKActiveSearchReferenceKey"];
  unint64_t v5 = (void *)TSUDynamicCast();
  BOOL v6 = (TSWPStorage *)[v5 storage];
  if (v6 == [(TSWPRep *)self storage]
    && (NSUInteger v7 = [(TSWPRep *)self range],
        NSUInteger v9 = v8,
        v14.NSUInteger location = objc_msgSend((id)objc_msgSend(v5, "selection"), "range"),
        v14.NSUInteger length = v10,
        v13.NSUInteger location = v7,
        v13.NSUInteger length = v9,
        NSIntersectionRange(v13, v14).length)
    || [(TSWPRep *)self activeSearchReference])
  {
    [(TSWPRep *)self p_setActiveSearchReference:v5];
    long long v11 = [(TSDRep *)self canvas];
    [(TSDCanvas *)v11 invalidateLayers];
  }
}

- (void)p_setActiveSearchReference:(id)a3
{
  unint64_t v5 = [(TSWPRep *)self storage];
  if (v5 == (TSWPStorage *)[a3 storage])
  {
    if (!objc_msgSend(a3, "isEqual:", -[TSWPRep activeSearchReference](self, "activeSearchReference"))
      || [a3 autohideHighlight])
    {
      [(TSKHighlightArrayController *)self->_pulseArrayController stop];
      -[TSWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", a3 != 0, [a3 autohideHighlight]);
      [(TSWPRep *)self setActiveSearchReference:a3];
      uint64_t v6 = [a3 pulseHighlight];
      [(TSWPRep *)self p_updateAnimationWithAnimatingPulse:v6];
    }
  }
  else
  {
    [(TSKHighlightArrayController *)self->_pulseArrayController stop];
    [(TSWPRep *)self p_setPulseControllerActive:0 autohide:0];
    [(TSWPRep *)self setActiveSearchReference:0];
  }
}

- (void)processFindUIStateChangedNotificationUserInfo:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"TSWPSearchReferencesToHighlightKey"];

  [(TSWPRep *)self p_setSearchReferencesToHighlight:v4];
}

- (void)p_findUIStateChangedNotification:(id)a3
{
  uint64_t v4 = [a3 userInfo];

  [(TSWPRep *)self processFindUIStateChangedNotificationUserInfo:v4];
}

- (void)p_setSearchReferencesToHighlight:(id)a3
{
  uint64_t v4 = (NSArray *)objc_msgSend(a3, "objectForKeyedSubscript:", -[TSWPRep storage](self, "storage"));
  if ([(TSWPRep *)self searchReferences] != v4)
  {
    [(TSWPRep *)self setSearchReferences:v4];
    [(TSWPRep *)self p_updateHighlights];
    [(TSDCanvas *)[(TSDRep *)self canvas] invalidateLayers];
  }

  [(TSWPRep *)self invalidateKnobs];
}

- (void)p_didDismissPopover:(id)a3
{
  self->_invalidateHUDState = 1;
  uint64_t v3 = [(TSDRep *)self layout];

  [(TSDLayout *)v3 invalidate];
}

- (void)p_updateHighlights
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSArray *)[(TSWPRep *)self searchReferences] count];
  highlightArrayController = self->_highlightArrayController;
  if (v3)
  {
    if (!highlightArrayController) {
      self->_highlightArrayController = [[TSKHighlightArrayController alloc] initWithZOrder:self delegate:3.0];
    }
    unint64_t v5 = [(TSDRep *)self layout];
    if (v5)
    {
      [(TSDAbstractLayout *)v5 transformInRoot];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
    }
    uint64_t v6 = self->_highlightArrayController;
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    [(TSKHighlightArrayController *)v6 setTransform:v19];
    [(TSDCanvas *)self->super.super.mCanvas viewScale];
    -[TSKHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");
    [(TSKHighlightArrayController *)self->_highlightArrayController reset];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    NSUInteger v7 = [(TSWPRep *)self searchReferences];
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [(TSWPRep *)self lineSearchReferencesForSearchReference:v12];
          if ([v13 count])
          {
            NSRange v14 = self->_highlightArrayController;
            [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
            objc_msgSend(v12, "setFindHighlights:", -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v14, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v13));
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v9);
    }
  }
  else if (highlightArrayController)
  {

    self->_highlightArrayController = 0;
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_opt_class();
  [a3 selection];
  unint64_t v5 = (void *)TSUDynamicCast();
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  if ([v5 isRange])
  {
    if (![(TSWPRep *)self p_isSelectionSingleAnchoredDrawableAttachment])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v10 = [(TSWPRep *)self columns];
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v16 = objc_msgSend(v15, "rectsForSelection:", v5, 0);
            uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v32;
              do
              {
                uint64_t v20 = 0;
                do
                {
                  if (*(void *)v32 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  [*(id *)(*((void *)&v31 + 1) + 8 * v20) CGRectValue];
                  CGFloat v22 = v21;
                  CGFloat v24 = v23;
                  CGFloat v26 = v25;
                  CGFloat v28 = v27;
                  v42.origin.CGFloat x = x;
                  v42.origin.CGFloat y = y;
                  v42.size.CGFloat width = width;
                  v42.size.CGFloat height = height;
                  if (CGRectIsEmpty(v42))
                  {
                    CGFloat x = v22;
                    CGFloat y = v24;
                    CGFloat width = v26;
                    CGFloat height = v28;
                  }
                  else
                  {
                    v43.origin.CGFloat x = x;
                    v43.origin.CGFloat y = y;
                    v43.size.CGFloat width = width;
                    v43.size.CGFloat height = height;
                    v48.origin.CGFloat x = v22;
                    v48.origin.CGFloat y = v24;
                    v48.size.CGFloat width = v26;
                    v48.size.CGFloat height = v28;
                    CGRect v44 = CGRectUnion(v43, v48);
                    CGFloat x = v44.origin.x;
                    CGFloat y = v44.origin.y;
                    CGFloat width = v44.size.width;
                    CGFloat height = v44.size.height;
                  }
                  ++v20;
                }
                while (v18 != v20);
                uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v18);
            }
            ++v14;
          }
          while (v14 != v12);
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v12);
      }
    }
  }
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  if (CGRectIsEmpty(v45)) {
    return 0;
  }
  Mutable = CGPathCreateMutable();
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGRect v47 = CGRectIntegral(v46);
  CGPathAddRect(Mutable, 0, v47);
  return Mutable;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  BOOL v5 = a5;
  objc_opt_class();
  [a3 selection];
  uint64_t v8 = TSUDynamicCast();

  return [(TSWPRep *)self textImageForSelection:v8 frame:0 usingGlyphRect:0 shouldPulsate:v5 suppressInvisibles:0];
}

- (id)hyperlinkRegionsConstrainedToLineAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", [(TSWPRep *)self columns], 0, 1, a3.x, a3.y);
  if (!v6) {
    return 0;
  }
  NSUInteger v7 = v6;
  [v6 frameBounds];
  v35.double x = x;
  v35.double y = y;
  if (!CGRectContainsPoint(v36, v35)) {
    return 0;
  }
  double v25 = v7;
  uint64_t v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y);
  uint64_t v9 = 0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return v9;
  }
  uint64_t v10 = (NSUInteger *)[v7 lineFragmentForCharIndex:v8 knobTag:0 selectionType:0];
  if (!v10) {
    return 0;
  }
  NSUInteger v11 = *v10;
  NSUInteger v12 = v10[1];
  id v13 = -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:]([(TSWPRep *)self storage], "smartFieldsWithAttributeKind:intersectingRange:", 6, *v10, v12);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v14) {
    return 0;
  }
  uint64_t v15 = v14;
  uint64_t v9 = 0;
  uint64_t v16 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      objc_opt_class();
      uint64_t v19 = TSUDynamicCast();
      v34.NSUInteger location = [v18 range];
      v34.NSUInteger length = v20;
      v33.NSUInteger location = v11;
      v33.NSUInteger length = v12;
      NSRange v21 = NSIntersectionRange(v33, v34);
      if (v19) {
        BOOL v22 = v21.location == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22 && v21.length != 0)
      {
        if (!v9) {
          uint64_t v9 = objc_opt_new();
        }
        objc_msgSend(v9, "addObjectsFromArray:", objc_msgSend(v25, "rectsForSelectionRange:", v21.location, v21.length));
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v15);
  return v9;
}

- (BOOL)useKeyboardWhenEditing
{
  return self->_useKeyboardWhenEditing;
}

- (void)setUseKeyboardWhenEditing:(BOOL)a3
{
  self->_useKeyboardWhenEditing = a3;
}

- (BOOL)isSelectionHighlightSuppressed
{
  return self->_suppressSelectionHighlight;
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

- (TSWPSelection)dropSelection
{
  return self->_dropSelection;
}

- (TSWPSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
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

- (BOOL)shouldHideSelectionControls
{
  return self->_shouldHideSelectionControls;
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
}

@end