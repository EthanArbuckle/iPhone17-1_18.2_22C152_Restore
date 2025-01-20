@interface THWPHighlightController
+ (id)activePopoverEditor;
+ (void)dismissActivePopoverEditor;
+ (void)p_forgetActivePopover:(id)a3;
+ (void)p_hideAndReleasePopover:(id)a3;
- (AEAnnotationEditor)noteEditorController;
- (AEHighlightColorEditorController)highlightColorEditorController;
- (BOOL)editorController:(id)a3 canSelectThemeWithIdentifier:(id)a4;
- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4;
- (BOOL)isCanvasPointOnHighlight:(CGPoint)a3;
- (BOOL)needsToRedrawForVisibleBounds:(CGRect)a3;
- (BOOL)ownsMarginNote:(id)a3;
- (BOOL)p_alwaysShowSheetNoteEditor;
- (BOOL)p_isCompactHeight;
- (BOOL)p_isCompactWidth;
- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5;
- (BOOL)p_shouldDrawMarginNoteForCachedCachedAnnotation:(id)a3;
- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5;
- (BOOL)shouldAllowHighlights;
- (BOOL)shouldBeginDragHighlightAtPoint:(CGPoint)a3;
- (BOOL)trackingDrag;
- (CGPoint)dragStartPoint;
- (CGRect)canvasRectForAnnotation:(id)a3;
- (CGRect)highlightRectForAnnotation:(id)a3;
- (CGRect)p_marginNotePresentationRectForCachedAnnotation:(id)a3;
- (CGRect)p_repRectForHighlight:(_NSRange)a3;
- (CGRect)p_repRectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4;
- (CGRect)p_repRectForPoint:(CGPoint)a3;
- (NSMutableDictionary)annotationCache;
- (THAnnotation)currentDragAnnotation;
- (THMarginNotesController)marginNotesController;
- (THWPHighlightController)initWithParentRep:(id)a3;
- (THWPRep)parentRep;
- (_NSRange)p_rangeOfHighlight:(id)a3;
- (_NSRange)p_trimHighlightRange:(_NSRange)a3;
- (_NSRange)rangeOfInterest;
- (_NSRange)selectionRangeForStartPoint:(CGPoint)a3 currentPoint:(CGPoint)a4;
- (id)annotationAtUnscaledPoint:(CGPoint)a3;
- (id)annotationController;
- (id)annotationEditorForAnnotation:(id)a3;
- (id)annotationEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4;
- (id)annotationForRange:(_NSRange)a3;
- (id)annotationsForRange:(_NSRange)a3;
- (id)editMenuForHighlightAtPoint:(CGPoint)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)highlightAtCanvasPoint:(CGPoint)a3;
- (id)highlightLayersInCanvasUnscaledRect:(CGRect)a3 scale:(double)a4;
- (id)p_annotationSource;
- (id)p_annotationsAtRepPoint:(CGPoint)a3;
- (id)p_annotationsInRepRect:(CGRect)a3;
- (id)p_cachedAnnotationForAnnotation:(id)a3;
- (id)p_drawHighlightLine:(id)a3 forAnnotation:(id)a4 scale:(double)a5;
- (id)p_editMenuForAnnotationUUID:(id)a3;
- (id)p_highlightFromAnnotation:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5;
- (id)p_highlightLineFromLineSelection:(id)a3 isUnderline:(BOOL)a4;
- (int)p_blendModeForCachedAnnotation:(id)a3;
- (int64_t)pageTheme;
- (void)beginDragHighlightAtPoint:(CGPoint)a3;
- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3;
- (void)createHighlightForSelectionWithStyle:(int)a3;
- (void)dealloc;
- (void)didHideAnnotationEditor:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editorController:(id)a3 deleteAnnotation:(id)a4;
- (void)editorController:(id)a3 editNote:(id)a4;
- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5;
- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5;
- (void)editorController:(id)a3 showEditMenuForAnnotation:(id)a4;
- (void)endDragHighlightAtPoint:(CGPoint)a3 accept:(BOOL)a4;
- (void)hidePopoverEditor;
- (void)moveDragHighlightToPoint:(CGPoint)a3;
- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4;
- (void)p_clearAnnotationCache;
- (void)p_drawMarginNoteIfNeeded:(id)a3;
- (void)p_removeCachedAnnotation:(id)a3;
- (void)p_removeHighlightForCachedAnnotation:(id)a3;
- (void)p_removeNoteForCachedAnnotation:(id)a3;
- (void)p_showEditor:(id)a3 forRange:(_NSRange)a4;
- (void)p_showEditorForHighlight:(id)a3;
- (void)p_showHighlightEditorForCachedAnnotation:(id)a3;
- (void)p_showHighlightMenuForCachedAnnotation:(id)a3;
- (void)p_showMenuForHighlight:(id)a3;
- (void)p_updateMarginNoteForCachedAnnotation:(id)a3;
- (void)p_updateMarginNoteForHighlight:(id)a3;
- (void)parentWillBeRemovedFromCanvas:(id)a3;
- (void)setAnnotationCache:(id)a3;
- (void)setCurrentDragAnnotation:(id)a3;
- (void)setDragStartPoint:(CGPoint)a3;
- (void)setHighlightColorEditorController:(id)a3;
- (void)setMarginNotesController:(id)a3;
- (void)setNoteEditorController:(id)a3;
- (void)setParentRep:(id)a3;
- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4;
- (void)setTrackingDrag:(BOOL)a3;
- (void)showHighlightEditorForAnnotation:(id)a3;
- (void)showHighlightEditorForHighlightAtPoint:(CGPoint)a3;
- (void)showHighlightMenuForAnnotation:(id)a3;
- (void)showHighlightMenuForHighlightAtPoint:(CGPoint)a3;
- (void)showNoteEditorForAnnotation:(id)a3;
- (void)showNoteEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4;
- (void)showNoteEditorForMarginNote:(id)a3;
- (void)updateCachedAnnotations;
- (void)updateFromLayout;
- (void)willHideAnnotationEditor:(id)a3;
@end

@implementation THWPHighlightController

- (THWPHighlightController)initWithParentRep:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWPHighlightController;
  v4 = [(THWPHighlightController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THWPHighlightController *)v4 setParentRep:a3];
    [(THWPHighlightController *)v5 setAnnotationCache:+[NSMutableDictionary dictionary]];
    [(THWPHighlightController *)v5 setHighlightColorEditorController:0];
    [(THWPHighlightController *)v5 setNoteEditorController:0];
    [(THWPHighlightController *)v5 updateCachedAnnotations];
  }
  return v5;
}

+ (void)p_hideAndReleasePopover:(id)a3
{
  [a1 p_forgetActivePopover:];
  if ([a3 isViewLoaded] && objc_msgSend(objc_msgSend(a3, "view"), "superview"))
  {
    [a3 hide];
    objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
  }
}

- (void)dealloc
{
  mNoteEditorController = self->mNoteEditorController;
  if (mNoteEditorController)
  {
    [(AEAnnotationEditor *)mNoteEditorController setDelegate:0];
    [(id)objc_opt_class() performSelectorOnMainThread:"p_hideAndReleasePopover:" withObject:self->mNoteEditorController waitUntilDone:0];
    self->mNoteEditorController = 0;
  }
  mHighlightColorEditorController = self->mHighlightColorEditorController;
  if (mHighlightColorEditorController)
  {
    [(AEHighlightColorEditorController *)mHighlightColorEditorController setDelegate:0];
    [(id)objc_opt_class() performSelectorOnMainThread:"p_hideAndReleasePopover:" withObject:self->mHighlightColorEditorController waitUntilDone:0];
    self->mHighlightColorEditorController = 0;
  }
  [(THWPHighlightController *)self p_clearAnnotationCache];

  self->mAnnotationCache = 0;
  self->mMarginNotesController = 0;
  [(THWPAnnotationSource *)self->mAnnotationSource removeInterest:self];

  self->mAnnotationSource = 0;
  self->mCurrentDragAnnotation = 0;
  v5.receiver = self;
  v5.super_class = (Class)THWPHighlightController;
  [(THWPHighlightController *)&v5 dealloc];
}

- (void)parentWillBeRemovedFromCanvas:(id)a3
{
  [(THWPHighlightController *)self setParentRep:0];

  [(THWPHighlightController *)self hidePopoverEditor];
}

- (id)annotationController
{
  if (!self->mAnnotationsController)
  {
    if (objc_msgSend(-[THWPRep canvas](-[THWPHighlightController parentRep](self, "parentRep"), "canvas"), "isCanvasInteractive"))
    {
      if (+[NSThread isMainThread])
      {
        [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
        if (objc_opt_respondsToSelector())
        {
          objc_opt_class();
          [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController documentRoot];
          self->mAnnotationsController = (THAnnotationStorageController *)[(id)TSUDynamicCast() annotationController];
        }
      }
    }
  }
  return self->mAnnotationsController;
}

- (void)p_removeHighlightForCachedAnnotation:(id)a3
{
  [a3 setHighlight:0];

  [(THWPHighlightController *)self p_removeNoteForCachedAnnotation:a3];
}

- (id)p_annotationSource
{
  id result = self->mAnnotationSource;
  if (!result)
  {
    v4 = [-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage") annotationSource];
    self->mAnnotationSource = v4;
    [(THWPAnnotationSource *)v4 addInterest:self];
    return self->mAnnotationSource;
  }
  return result;
}

- (void)updateCachedAnnotations
{
  if (![(THWPHighlightController *)self parentRep]) {
    return;
  }
  if (+[NSThread isMainThread])
  {
    if (!+[NSThread isMainThread]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController updateCachedAnnotations]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:371 description:@"This operation must only be performed on the main thread."];
    }
    v2 = [(THWPHighlightController *)self annotationCache];
    id v3 = +[NSMutableDictionary dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = [(THWPHighlightController *)self p_annotationSource];
    id v5 = [(THWPHighlightController *)self rangeOfInterest];
    id v7 = [v4 annotationsForRange:v5, v6];
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v8)
    {
      char v22 = 0;
      goto LABEL_25;
    }
    char v22 = 0;
    uint64_t v9 = *(void *)v30;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(THAnnotation **)(*((void *)&v29 + 1) + 8 * i);
        v12 = (THHighlightControllerCachedAnnotation *)[(NSMutableDictionary *)v2 objectForKey:[(THAnnotation *)v11 annotationUuid]];
        v13 = (char *)[(THAnnotation *)v11 annotationStorageRange];
        if (&v13[v14] <= objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterCount"))
        {
          if (v12)
          {
            if ([(THHighlightControllerCachedAnnotation *)v12 annotation] != v11)
            {
              [(THHighlightControllerCachedAnnotation *)v12 updateAnnotation:v11];
              if ([(THHighlightControllerCachedAnnotation *)v12 needsMarginNoteUpdate]) {
                [(THWPHighlightController *)self p_updateMarginNoteForCachedAnnotation:v12];
              }
LABEL_16:
              char v22 = 1;
            }
            [v3 setObject:v12 forKey:[v11 annotationUuid]];
            continue;
          }
          v12 = [[THHighlightControllerCachedAnnotation alloc] initWithAnnotation:v11];
          goto LABEL_16;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (!v8)
      {
LABEL_25:
        id v15 = [(NSMutableDictionary *)v2 count];
        if (v15 == [v3 count]) {
          char v16 = v22;
        }
        else {
          char v16 = 1;
        }
        char v23 = v16;
        [(THWPHighlightController *)self setAnnotationCache:v3];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v17 = [(NSMutableDictionary *)v2 allKeys];
        id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v26;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v26 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
              if (![v3 objectForKey:v21]) {
                [(THWPHighlightController *)self p_removeHighlightForCachedAnnotation:[(NSMutableDictionary *)v2 objectForKey:v21]];
              }
            }
            id v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v18);
        }

        if ((v23 & 1) != 0
          && (objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
        {
          [(THWPRep *)[(THWPHighlightController *)self parentRep] setNeedsDisplay];
          [(-[THWPHighlightController parentRep](self, "parentRep")) canvas] invalidateLayers;
        }
        return;
      }
    }
  }

  [(THWPHighlightController *)self performSelectorOnMainThread:"updateCachedAnnotations" withObject:self waitUntilDone:0];
}

- (void)p_clearAnnotationCache
{
  id v3 = [(THWPHighlightController *)self annotationCache];
  [(THWPHighlightController *)self setAnnotationCache:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(NSMutableDictionary *)v3 allValues];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(THWPHighlightController *)self p_removeHighlightForCachedAnnotation:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (_NSRange)p_trimHighlightRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = (TSWPStorage *)[(THWPRep *)[(THWPHighlightController *)self parentRep] storage];
  v6.NSUInteger location = location;
  v6.NSUInteger length = length;

  NSUInteger v7 = THTrimHighlightRange(v5, v6);
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (id)p_cachedAnnotationForAnnotation:(id)a3
{
  id v4 = [(THWPHighlightController *)self annotationCache];
  id v5 = [a3 annotationUuid];

  return [(NSMutableDictionary *)v4 objectForKey:v5];
}

- (void)p_removeCachedAnnotation:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:] file:+[NSString stringWithUTF8String:] lineNumber:463 description:@"This operation must only be performed on the main thread."];
  }
  [(THWPHighlightController *)self p_removeHighlightForCachedAnnotation:a3];
  id v5 = [(THWPHighlightController *)self annotationCache];
  id v6 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationUuid");

  [(NSMutableDictionary *)v5 removeObjectForKey:v6];
}

- (CGRect)p_repRectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[THWPRep rectForHighlight:lineHasAttachment:]([(THWPHighlightController *)self parentRep], "rectForHighlight:lineHasAttachment:", a3.location, a3.length, a4);
  double v11 = v10;
  double v13 = v12;
  if (!a4)
  {
    uint64_t v14 = [(THWPHighlightController *)self parentRep];
    if (v14) {
      [(THWPRep *)v14 lineMetricsAtCharIndex:location + (length >> 1)];
    }
    double v8 = 0.0 - 0.0;
    double v9 = 0.0 + 0.0;
  }
  double v15 = v11;
  double v16 = v13;
  result.size.height = v9;
  result.size.width = v16;
  result.origin.y = v8;
  result.origin.x = v15;
  return result;
}

- (CGRect)p_repRectForHighlight:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!a3.length) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWPHighlightController p_repRectForHighlight:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"] lineNumber:496 description:@"Invalid parameter not satisfying: %s", @"range.length > 0"];
  }
  id v6 = +[TSWPColumn columnForCharIndex:location + (length >> 1) eol:1 withColumns:[(THWPRep *)[(THWPHighlightController *)self parentRep] columns]];
  id v7 = (id)location;
  NSUInteger v8 = length;
  if ([v6 lineIndexForCharIndex:location + (length >> 1) eol:1] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [v6 rangeOfLineFragmentAtIndex:];
    NSUInteger v8 = v9;
  }
  id v10 = [(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) rangeContainsAttachment:v7, v8];

  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", location, length, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (!a4.length) {
    [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:NSString stringWithUTF8String:@"-[THWPHighlightController p_setLineProperties:fromRange:isUnderline:]" file:NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm" lineNumber:519 description:@"Invalid parameter not satisfying: %s", @"range.length > 0"];
  }
  id v9 = +[TSWPColumn columnForCharIndex:location + (length >> 1) eol:1 withColumns:[(THWPRep *)[(THWPHighlightController *)self parentRep] columns]];
  id v10 = [v9 lineIndexForCharIndex:location + (length >> 1) eol:1];
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v12 = v10;
  v44.NSUInteger location = (NSUInteger)[v9 rangeOfLineFragmentAtIndex:v10];
  NSUInteger v13 = v44.location;
  NSUInteger v14 = v44.length;
  v45.NSUInteger location = location;
  v45.NSUInteger length = length;
  if (NSIntersectionRange(v44, v45).length)
  {
    NSUInteger v15 = v13;
  }
  else
  {
    NSUInteger v14 = length;
    NSUInteger v15 = location;
  }
  id v16 = [(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) rangeContainsAttachment:v15, v14];
  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", v15, v14, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  -[THWPHighlightController p_repRectForHighlight:lineHasAttachment:](self, "p_repRectForHighlight:lineHasAttachment:", location, length, v16);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  [a3 currentLineRect];
  char v33 = TSDNearlyEqualRects();
  [a3 setFullLineRect:v18, v20, v22, v24];
  [a3 setCurrentLineRect:v26, v28, v30, v32];
  v34 = (double *)[v9 lineFragmentAtIndex:v12];
  if (v34)
  {
    double v35 = v34[4] + v34[5];
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THWPHighlightController p_setLineProperties:fromRange:isUnderline:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"] lineNumber:548 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"fragment"]];
    double v35 = 0.0;
  }
  char v11 = v33 ^ 1;
  [a3 setBaseline:v35];
  double v36 = 1.0;
  if (v16)
  {
    [a3 baseline];
    double v38 = v37;
    v46.origin.x = v26;
    v46.origin.y = v28;
    v46.size.width = v30;
    v46.size.height = v32;
    if (v38 < CGRectGetMinY(v46)
      || ([a3 baseline],
          double v40 = v39,
          v47.origin.x = v26,
          v47.origin.y = v28,
          v47.size.width = v30,
          v47.size.height = v32,
          v40 > CGRectGetMaxY(v47)))
    {
      v48.origin.x = v26;
      v48.origin.y = v28;
      v48.size.width = v30;
      v48.size.height = v32;
      CGFloat v41 = CGRectGetMaxY(v48) + -4.0;
      [a3 baseline];
      double v36 = v41 - v42 + 1.0;
    }
  }
  [a3 setUnderlineOffset:v36];
  [a3 setContentLayer:[THHighlightContentLayer layer]];
  objc_msgSend(objc_msgSend(a3, "contentLayer"), "setContentsGravity:", kCAGravityBottom);
  return v11;
}

- (id)p_highlightLineFromLineSelection:(id)a3 isUnderline:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 range];
  id v8 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v6, v7);
  if (!v9) {
    return 0;
  }
  id v10 = v8;
  uint64_t v11 = v9;
  id v12 = objc_alloc_init(THHighlightLine);
  -[THWPHighlightController p_setLineProperties:fromRange:isUnderline:](self, "p_setLineProperties:fromRange:isUnderline:", v12, v10, v11, v4);
  return v12;
}

- (id)p_highlightFromAnnotation:(id)a3 range:(_NSRange)a4 rect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v13 = objc_alloc_init(THHighlight);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = [(THWPRep *)[(THWPHighlightController *)self parentRep] lineSelectionsForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      double v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = -[THWPHighlightController p_highlightLineFromLineSelection:isUnderline:](self, "p_highlightLineFromLineSelection:isUnderline:", *(void *)(*((void *)&v23 + 1) + 8 * (void)v19), [a3 annotationIsUnderline]);
        if (v20)
        {
          id v21 = v20;
          [v20 fullLineRect];
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          if (CGRectIntersectsRect(v28, v29)) {
            [v14 addObject:v21];
          }
        }
        double v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
  [(THHighlight *)v13 setLines:v14];
  [(THHighlight *)v13 setAnnotation:a3];

  return v13;
}

- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4
{
  [(THWPHighlightController *)self p_removeHighlightForCachedAnnotation:a4];
  [a4 setHighlight:a3];

  [(THWPHighlightController *)self p_drawMarginNoteIfNeeded:a4];
}

- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5
{
  CGFloat rect2 = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", a4.location, a4.length);
  id v12 = [(THWPRep *)[(THWPHighlightController *)self parentRep] lineSelectionsForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v10, v11)];
  id v50 = +[NSMutableArray array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v12;
  id v13 = [v12 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (!v13) {
    goto LABEL_26;
  }
  id v14 = v13;
  int v15 = 0;
  uint64_t v16 = *(void *)v59;
  uint64_t v48 = *(void *)v59;
  id v49 = a3;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v59 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      id v19 = [v18 range:v48, v49];
      id v21 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v19, v20);
      if (v22)
      {
        -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v21, v22);
        CGFloat v23 = v64.origin.x;
        double v24 = v64.origin.y;
        CGFloat v25 = v64.size.width;
        CGFloat height = v64.size.height;
        v66.origin.CGFloat x = x;
        v66.origin.CGFloat y = y;
        v66.size.CGFloat width = width;
        v66.size.CGFloat height = rect2;
        if (CGRectIntersectsRect(v64, v66))
        {
          int v51 = v15;
          id v27 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationIsUnderline");
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v28 = [a3 lines];
          id v29 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v55;
LABEL_10:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v55 != v31) {
                objc_enumerationMutation(v28);
              }
              id v33 = *(id *)(*((void *)&v54 + 1) + 8 * v32);
              [v33 fullLineRect];
              uint64_t v38 = v37;
              if (vabdd_f64(v24, v34) < 0.5)
              {
                double v39 = v34;
                uint64_t v40 = v35;
                uint64_t v41 = v36;
                v65.origin.CGFloat x = v23;
                v65.origin.CGFloat y = v24;
                v65.size.CGFloat width = v25;
                v65.size.CGFloat height = height;
                if (CGRectIntersectsRect(v65, *(CGRect *)&v38)) {
                  break;
                }
              }
              if (v30 == (id)++v32)
              {
                id v30 = [v28 countByEnumeratingWithState:&v54 objects:v62 count:16];
                if (v30) {
                  goto LABEL_10;
                }
                goto LABEL_20;
              }
            }
            id v42 = [v18 range];
            unsigned int v44 = -[THWPHighlightController p_setLineProperties:fromRange:isUnderline:](self, "p_setLineProperties:fromRange:isUnderline:", v33, v42, v43, v27);
            if (!v33) {
              goto LABEL_20;
            }
            int v15 = v44 | v51;
          }
          else
          {
LABEL_20:
            id v33 = [(THWPHighlightController *)self p_highlightLineFromLineSelection:v18 isUnderline:v27];
            int v15 = 1;
          }
          [v50 addObject:v33];
          uint64_t v16 = v48;
          a3 = v49;
        }
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  }
  while (v14);
  if (v15)
  {
    [a3 setLines:v50];
  }
  else
  {
LABEL_26:
    id v45 = [v50 count];
    id v46 = objc_msgSend(objc_msgSend(a3, "lines"), "count");
    [a3 setLines:v50];
    if (v45 == v46) {
      return 0;
    }
  }
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] layoutInvalidated;
  [(THWPHighlightController *)self p_updateMarginNoteForHighlight:a3];
  return 1;
}

- (BOOL)needsToRedrawForVisibleBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  -[THWPRep convertNaturalRectFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalRectFromUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGRect v37 = CGRectInset(v36, width * -0.5, height * -0.5);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat v8 = v37.size.width;
  CGFloat v9 = v37.size.height;
  [(THWPRep *)[(THWPHighlightController *)self parentRep] frameInUnscaledCanvas];
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.double width = v8;
  v40.size.double height = v9;
  if (!CGRectIntersectsRect(v38, v40)) {
    return 0;
  }
  id v10 = [(THWPHighlightController *)self annotationCache];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [(NSMutableDictionary *)v10 allValues];
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v17 = objc_msgSend(objc_msgSend(v16, "annotation"), "annotationStorageRange");
        [(THWPRep *)[(THWPHighlightController *)self parentRep] rectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v17, v18)];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        id v27 = [v16 highlight];
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.double width = v8;
        v39.size.double height = v9;
        v41.origin.CGFloat x = v20;
        v41.origin.CGFloat y = v22;
        v41.size.double width = v24;
        v41.size.double height = v26;
        if (CGRectIntersectsRect(v39, v41) && v27 == 0)
        {
          BOOL v29 = 1;
          goto LABEL_16;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v29 = 0;
LABEL_16:

  return v29;
}

- (id)p_drawHighlightLine:(id)a3 forAnnotation:(id)a4 scale:(double)a5
{
  int64_t v8 = [(THWPHighlightController *)self pageTheme];
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController documentRoot];
  CGFloat v9 = (void *)TSUDynamicCast();
  id v10 = [TSUColor whiteColor].CGColor;
  if ([v9 themeProvider]) {
    id v10 = [[v9 themeProvider] backgroundColor];
  }
  id v11 = objc_msgSend(objc_msgSend(a4, "annotation"), "annotationStyle");
  id v12 = [[[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v11, v8, v11 == 6) highlightColor] CGColor];
  [(-[THWPHighlightController parentRep](self, "parentRep")) canvas].contentsScale;
  double v14 = v13;
  [a3 currentLineRect];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [a3 baseline];
  double v50 = v23;
  memset(&v52, 0, sizeof(v52));
  CGFloat v24 = [(THWPHighlightController *)self parentRep];
  if (v24)
  {
    [(THWPRep *)v24 transformToConvertNaturalToLayerRelative];
    double b = v52.b;
    double d = v52.d;
    tCGFloat y = v52.ty;
  }
  else
  {
    tCGFloat y = 0.0;
    double d = 0.0;
    double b = 0.0;
    memset(&v52, 0, sizeof(v52));
  }
  CGAffineTransform v51 = v52;
  v53.origin.CGFloat x = v16;
  v53.origin.CGFloat y = v18;
  v53.size.CGFloat width = v20;
  v53.size.CGFloat height = v22;
  CGRect v54 = CGRectApplyAffineTransform(v53, &v51);
  CGFloat x = v54.origin.x;
  CGFloat y = v54.origin.y;
  CGFloat width = v54.size.width;
  v54.origin.CGFloat y = v16;
  CGFloat height = v54.size.height;
  double v32 = ty + v50 * d + b * v54.origin.y;
  v54.origin.CGFloat y = y;
  double MinY = CGRectGetMinY(v54);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v55);
  if (v11 == 6)
  {
    [a3 underlineOffset];
    TSDRoundForScale();
    double v36 = v35;
    double v37 = 2.0;
    if (v14 > 1.0) {
      double v37 = 1.5;
    }
    double v38 = ceil(v14 * (v37 * a5)) / v14;
  }
  else
  {
    double v39 = MaxY - v32;
    double v40 = 1.0;
    if (v14 != 0.0) {
      double v40 = v14;
    }
    double v41 = ceil(v40 * (v32 - MinY)) / v40;
    double v36 = ceil(v40 * v32) / v40 - v41;
    double v38 = v41 + ceil(v40 * v39) / v40;
  }
  TSDRoundedRectForScale();
  double v43 = v42;
  double v45 = v44;
  id v46 = [a3 contentLayer];
  [v46 setHidden:0];
  [v46 setFrame:v43, v36, v45, v38];
  LODWORD(v47) = 1.0;
  [v46 setOpacity:v47];
  [v46 setBackgroundColor:v10];
  [v46 setHighlightColor:v12];
  [v46 setBlendMode:[self p_blendModeForCachedAnnotation:a4]];
  [v46 setNeedsDisplay];
  return v46;
}

- (int)p_blendModeForCachedAnnotation:(id)a3
{
  objc_opt_class();
  [THWPRep interactiveCanvasController][THWPHighlightController parentRep][self parentRep]documentRoot;
  id v5 = (void *)TSUDynamicCast();
  if (![v5 themeProvider]
    || objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStyle") == 6)
  {
    return 0;
  }
  id v7 = [v5 themeProvider];

  return [v7 annotationBlendMode];
}

- (id)p_annotationsAtRepPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v34 = +[NSMutableArray array];
  double v36 = self;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v32 = [(THWPHighlightController *)self annotationCache];
  id obj = [(NSMutableDictionary *)v32 allValues];
  id v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v49;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(obj);
        }
        double v38 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        uint64_t v39 = v6;
        id v7 = objc_msgSend(objc_msgSend(v38, "annotation"), "annotationStorageRange");
        CGFloat v9 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v7, v8);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v10 = [(THWPRep *)[(THWPHighlightController *)v36 parentRep] columns];
        id v11 = [v10 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v45;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v45 != v13) {
                objc_enumerationMutation(v10);
              }
              double v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              CGFloat v16 = CGRectNull.origin.x;
              CGFloat v17 = CGRectNull.origin.y;
              CGFloat width = CGRectNull.size.width;
              CGFloat height = CGRectNull.size.height;
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              id v20 = [(TSWPSelection *)v9 range];
              id v22 = [v15 rectsForSelectionRange:v20 selectionType:v21 forParagraphMode:[TSWPSelection type](v9, "type") includeRuby:0 0];
              id v23 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
              if (v23)
              {
                id v24 = v23;
                uint64_t v25 = *(void *)v41;
                do
                {
                  for (j = 0; j != v24; j = (char *)j + 1)
                  {
                    if (*(void *)v41 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    [*(id *)(*((void *)&v40 + 1) + 8 * (void)j) CGRectValue];
                    v59.origin.CGFloat x = v27;
                    v59.origin.CGFloat y = v28;
                    v59.size.CGFloat width = v29;
                    v59.size.CGFloat height = v30;
                    v56.origin.CGFloat x = v16;
                    v56.origin.CGFloat y = v17;
                    v56.size.CGFloat width = width;
                    v56.size.CGFloat height = height;
                    CGRect v57 = CGRectUnion(v56, v59);
                    CGFloat v16 = v57.origin.x;
                    CGFloat v17 = v57.origin.y;
                    CGFloat width = v57.size.width;
                    CGFloat height = v57.size.height;
                  }
                  id v24 = [v22 countByEnumeratingWithState:&v40 objects:v52 count:16];
                }
                while (v24);
              }
              v58.origin.CGFloat x = v16;
              v58.origin.CGFloat y = v17;
              v58.size.CGFloat width = width;
              v58.size.CGFloat height = height;
              v55.CGFloat x = x;
              v55.CGFloat y = y;
              if (CGRectContainsPoint(v58, v55))
              {
                [v34 addObject:[v38 annotation]];
                goto LABEL_23;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_23:
        uint64_t v6 = v39 + 1;
      }
      while ((id)(v39 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v37);
  }

  return v34;
}

- (id)p_annotationsInRepRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = +[NSMutableArray array];
  CGFloat v9 = [(THWPHighlightController *)self annotationCache];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [(NSMutableDictionary *)v9 allValues];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v16 = objc_msgSend(objc_msgSend(v15, "annotation"), "annotationStorageRange");
        [(THWPRep *)[(THWPHighlightController *)self parentRep] rectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v16, v17)];
        v29.origin.CGFloat x = v18;
        v29.origin.CGFloat y = v19;
        v29.size.CGFloat width = v20;
        v29.size.CGFloat height = v21;
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        if (CGRectIntersectsRect(v28, v29)) {
          [v8 addObject:[v15 annotation]];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v8;
}

- (id)highlightLayersInCanvasUnscaledRect:(CGRect)a3 scale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = +[NSMutableArray array];
  -[THWPRep convertNaturalRectFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalRectFromUnscaledCanvas:", x, y, width, height);
  CGRect v46 = CGRectInset(v45, -width, -height);
  double v11 = v46.origin.x;
  double v12 = v46.origin.y;
  double v13 = v46.size.width;
  double v14 = v46.size.height;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPHighlightController p_annotationsInRepRect:](self, "p_annotationsInRepRect:"));
  id v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v40;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v17 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:v16];
        id v18 = [v17 highlight];
        if (v18)
        {
          id v19 = v18;
          id v20 = [[v17 annotation] annotationStorageRange];
          -[THWPHighlightController p_updateHighlight:toRange:rect:](self, "p_updateHighlight:toRange:rect:", v19, v20, v21, v11, v12, v13, v14);
          [(THWPHighlightController *)self p_updateMarginNoteForCachedAnnotation:v17];
        }
        else
        {
          id v22 = [v16 annotationStorageRange];
          id v19 = -[THWPHighlightController p_highlightFromAnnotation:range:rect:](self, "p_highlightFromAnnotation:range:rect:", v16, v22, v23, v11, v12, v13, v14);
          [(THWPHighlightController *)self p_addHighlight:v19 forCachedAnnotation:v17];
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v24 = [v19 lines];
        id v25 = [v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v36;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v24);
              }
              CGRect v29 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
              if ([v29 contentLayer])
              {
                id v30 = [(THWPHighlightController *)self p_drawHighlightLine:v29 forAnnotation:v17 scale:a4];
                if (v30) {
                  [v10 addObject:v30];
                }
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v26);
        }
        [v17 setLastRenderedStyle:[v16 annotationStyle]];
      }
      id v34 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v34);
  }
  return v10;
}

- (int64_t)pageTheme
{
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] documentRoot;
  id v3 = (void *)TSUDynamicCast();
  if (![v3 themeProvider]) {
    return 4;
  }
  id v4 = [v3 themeProvider];

  return (int64_t)[v4 annotationPageTheme];
}

- (void)updateFromLayout
{
  [(THMarginNotesController *)[(THWPHighlightController *)self marginNotesController] setPageTheme:[(THWPHighlightController *)self pageTheme]];
  id v3 = [(THWPHighlightController *)self annotationCache];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMutableDictionary *)v3 allValues];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(THWPHighlightController *)self p_updateMarginNoteForCachedAnnotation:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (_NSRange)rangeOfInterest
{
  v2 = [(THWPHighlightController *)self parentRep];

  id v3 = [(THWPRep *)v2 range];
  result.NSUInteger length = v4;
  result.NSUInteger location = (NSUInteger)v3;
  return result;
}

- (_NSRange)selectionRangeForStartPoint:(CGPoint)a3 currentPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  id v9 = [(-[THWPHighlightController parentRep](self, "parentRep")) storage length];
  if (!v9)
  {
    NSUInteger v25 = 0;
    goto LABEL_39;
  }
  long long v10 = [(THWPHighlightController *)self parentRep];
  -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalPointFromUnscaledCanvas:", v7, v6);
  -[THWPRep pinToNaturalBounds:andLastLineFragment:](v10, "pinToNaturalBounds:andLastLineFragment:", 1);
  double v12 = v11;
  double v14 = v13;
  double v15 = [(THWPHighlightController *)self parentRep];
  -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalPointFromUnscaledCanvas:", x, y);
  -[THWPRep pinToNaturalBounds:andLastLineFragment:](v15, "pinToNaturalBounds:andLastLineFragment:", 1);
  double v17 = v16;
  double v19 = v18;
  id v20 = -[THWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:]([(THWPHighlightController *)self parentRep], "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v12, v14);
  id v21 = -[THWPRep charIndexFromPoint:allowPastBreak:isAtEndOfLine:]([(THWPHighlightController *)self parentRep], "charIndexFromPoint:allowPastBreak:isAtEndOfLine:", 1, 0, v17, v19);
  id v22 = [(THWPHighlightController *)self parentRep];
  if (v20 >= v21)
  {
    id v26 = (char *)-[THWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](v22, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0, 0, v17, v19);
    uint64_t v23 = v26;
    if (v20) {
      unint64_t v24 = (unint64_t)v20 - 1;
    }
    else {
      unint64_t v24 = 0;
    }
    if (!v26) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v27 = v23 - 1;
    if ([-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage") characterAtIndex:v23 - 1] == 65532)goto LABEL_14; {
    goto LABEL_11;
    }
  }
  uint64_t v23 = (char *)-[THWPRep charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:](v22, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", 1, 0, 0, 0, 0, v12, v14);
  unint64_t v24 = (unint64_t)v21 - 1;
  if (v23) {
    goto LABEL_10;
  }
LABEL_11:
  if (v23 >= objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "length")|| objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterAtIndex:", v23) != 65532)
  {
    CGRect v29 = [(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) wordAtCharIndex:v23 includePreviousWord:0];
    uint64_t v28 = v30;
    goto LABEL_17;
  }
  uint64_t v27 = v23;
LABEL_14:
  if (v24 > (unint64_t)v27)
  {
    uint64_t v28 = 1;
    CGRect v29 = v27;
    uint64_t v23 = v27;
LABEL_17:
    if (v29 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      CGRect v29 = [(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) whiteSpaceRangeAtCharIndex:v23 includingBreaks:0];
      uint64_t v28 = v31;
    }
    if (v29 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v27 = v23;
    }
    else {
      uint64_t v27 = v29;
    }
    if (v24 < (unint64_t)objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "length")&& objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "characterAtIndex:", v24) == 65532)
    {
      uint64_t v32 = 1;
      id v33 = (id)v24;
    }
    else
    {
      id v33 = [(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) wordAtCharIndex:v24 includePreviousWord:0];
    }
    if (v33 != (id)0x7FFFFFFFFFFFFFFFLL
      || (id v33 = objc_msgSend(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), "whiteSpaceRangeAtCharIndex:includingBreaks:", v24, 0), v33 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t v24 = (unint64_t)v33 + v32;
    }
    id v34 = &v29[v28];
    if ((unint64_t)&v29[v28] <= v24 || v29 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      id v34 = (char *)v24;
    }
    goto LABEL_36;
  }
  id v34 = v27 + 1;
LABEL_36:

  id v9 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v27, v34 - v27);
LABEL_39:
  result.NSUInteger length = v25;
  result.NSUInteger location = (NSUInteger)v9;
  return result;
}

- (CGRect)p_repRectForPoint:(CGPoint)a3
{
  id v4 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:", a3.x, a3.y, a3.x, a3.y);
  id v6 = [(THWPRep *)[(THWPHighlightController *)self parentRep] lineSelectionsForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v4, v5)];
  id v7 = [v6 count];
  if (v7 && (unint64_t v8 = (unint64_t)v7, v9 = [v6 objectAtIndex:0], objc_msgSend(v9, "range"), v10))
  {
    id v11 = [v9 range];
    -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v11, v12);
    CGFloat x = v13;
    CGFloat y = v15;
    CGFloat width = v17;
    CGFloat height = v19;
    if (v8 >= 2)
    {
      for (uint64_t i = 1; i != v8; ++i)
      {
        id v22 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", i), "range");
        -[THWPHighlightController p_repRectForHighlight:](self, "p_repRectForHighlight:", v22, v23);
        v35.origin.CGFloat x = v24;
        v35.origin.CGFloat y = v25;
        v35.size.CGFloat width = v26;
        v35.size.CGFloat height = v27;
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
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (BOOL)shouldAllowHighlights
{
  id v2 = [-[THWPHighlightController parentRep](self, "parentRep") layout].geometryInRoot;
  if (v2)
  {
    [v2 fullTransform];
    LOBYTE(v2) = 0;
    if (0.0 >= 1.0e-11) {
      LOBYTE(v2) = fabs(0.0) + fabs(0.0) <= 1.0e-11;
    }
  }
  return (char)v2;
}

- (BOOL)shouldBeginDragHighlightAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(THWPHighlightController *)self shouldAllowHighlights]) {
    return 0;
  }
  -[THWPHighlightController p_repRectForPoint:](self, "p_repRectForPoint:", x, y);
  CGFloat v6 = v18.origin.x;
  CGFloat v7 = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  if (CGRectIsNull(v18)) {
    return 0;
  }
  -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalPointFromUnscaledCanvas:", x, y);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  v19.origin.double x = v6;
  v19.origin.double y = v7;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectInset(v19, -20.0, -20.0);
  uint64_t v15 = v12;
  uint64_t v16 = v14;

  return CGRectContainsPoint(v20, *(CGPoint *)&v15);
}

- (void)beginDragHighlightAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] layoutIfNeeded];
  id v6 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:", x, y, x, y);
  id v8 = objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "temporaryAnnotationForStorage:contentNode:withRange:style:", -[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage"), -[THWPRep storageContentNode](-[THWPHighlightController parentRep](self, "parentRep"), "storageContentNode"), v6, v7, objc_msgSend(-[THWPHighlightController annotationController](self, "annotationController"), "currentAnnotationStyle"));
  [(THWPAnnotationSource *)self->mAnnotationSource setTemporaryAnnotation:v8];
  [(THWPHighlightController *)self setCurrentDragAnnotation:v8];
  [(THWPHighlightController *)self setTrackingDrag:1];

  -[THWPHighlightController setDragStartPoint:](self, "setDragStartPoint:", x, y);
}

- (id)highlightAtCanvasPoint:(CGPoint)a3
{
  -[THWPRep convertNaturalPointFromUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  id v4 = -[THWPHighlightController p_cachedAnnotationForAnnotation:](self, "p_cachedAnnotationForAnnotation:", objc_msgSend(+[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPHighlightController p_annotationsAtRepPoint:](self, "p_annotationsAtRepPoint:")), "lastObject"));

  return [v4 highlight];
}

- (id)annotationAtUnscaledPoint:(CGPoint)a3
{
  id v3 = -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y);

  return [v3 annotation];
}

- (id)annotationForRange:(_NSRange)a3
{
  id v3 = +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", -[THWPAnnotationSource annotationsForRange:](self->mAnnotationSource, "annotationsForRange:", a3.location, a3.length));

  return [v3 lastObject];
}

- (id)annotationsForRange:(_NSRange)a3
{
  id v3 = -[THWPAnnotationSource annotationsForRange:](self->mAnnotationSource, "annotationsForRange:", a3.location, a3.length);

  return +[THAnnotationCache annotationsOrderedForVisualStacking:v3];
}

- (BOOL)isCanvasPointOnHighlight:(CGPoint)a3
{
  return -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y) != 0;
}

- (_NSRange)p_rangeOfHighlight:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)[(THWPHighlightController *)self annotationCache] allValues];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 highlight] == a3)
        {
          id v10 = objc_msgSend(objc_msgSend(v9, "annotation"), "annotationStorageRange");
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController p_rangeOfHighlight:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:1148 description:@"Couldn't find range of highlight"];
  id v10 = NSInvalidRange[0];
  id v11 = NSInvalidRange[1];
LABEL_11:
  result.NSUInteger length = (NSUInteger)v11;
  result.NSUInteger location = (NSUInteger)v10;
  return result;
}

- (void)moveDragHighlightToPoint:(CGPoint)a3
{
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] layoutIfNeeded;
  if (![(THWPHighlightController *)self currentDragAnnotation]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController moveDragHighlightToPoint:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:1163 description:@"moving drag, but have no highlight"];
  }
  [(THWPHighlightController *)self dragStartPoint];
  id v4 = -[THWPHighlightController selectionRangeForStartPoint:currentPoint:](self, "selectionRangeForStartPoint:currentPoint:");
  id v6 = -[THWPHighlightController p_trimHighlightRange:](self, "p_trimHighlightRange:", v4, v5);
  uint64_t v8 = v7;
  if ([(THAnnotation *)[(THWPHighlightController *)self currentDragAnnotation] annotationStorageRange] != v6|| v9 != v8)
  {
    [self setCurrentDragAnnotation:[-[THWPHighlightController annotationController](self, "annotationController") temporaryAnnotationForStorage:(-[THWPRep storage](-[THWPHighlightController parentRep](self, "parentRep"), "storage")) contentNode:(-[THWPRep storageContentNode](-[THWPHighlightController parentRep](self, "parentRep"), "storageContentNode")) range:v6 style:(-[THAnnotation annotationStyle](-[THWPHighlightController currentDragAnnotation](self, "currentDragAnnotation"), "annotationStyle"))];
    id v10 = [(THWPHighlightController *)self currentDragAnnotation];
    mAnnotationSource = self->mAnnotationSource;
    [(THWPAnnotationSource *)mAnnotationSource setTemporaryAnnotation:v10];
  }
}

- (void)endDragHighlightAtPoint:(CGPoint)a3 accept:(BOOL)a4
{
  if (a4 && [(THWPHighlightController *)self currentDragAnnotation])
  {
    id v5 = [(THWPHighlightController *)self annotationController];
    id v6 = [(THWPRep *)[(THWPHighlightController *)self parentRep] storage];
    id v7 = [(THAnnotation *)[(THWPHighlightController *)self currentDragAnnotation] annotationStorageRange];
    [v5 addAnnotationForStorage:v6 range:v7 contentNode:[-[THWPHighlightController parentRep](self, "parentRep") storageContentNode] style:[-[THWPHighlightController annotationController](self, "annotationController") currentAnnotationStyle] undoContext:0];
  }
  -[THWPHighlightController setTrackingDrag:](self, "setTrackingDrag:", 0, a3.x, a3.y);
  [(THWPHighlightController *)self setCurrentDragAnnotation:0];
  mAnnotationSource = self->mAnnotationSource;

  [(THWPAnnotationSource *)mAnnotationSource setTemporaryAnnotation:0];
}

+ (id)activePopoverEditor
{
  return (id)qword_573220;
}

+ (void)dismissActivePopoverEditor
{
  if (qword_573220)
  {
    [(id)qword_573220 hide];
    qword_573220 = 0;
  }
}

- (CGRect)highlightRectForAnnotation:(id)a3
{
  id v3 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = objc_msgSend(objc_msgSend(v3, "highlight", 0), "lines");
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v12);
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        IsEmptCGFloat y = CGRectIsEmpty(v28);
        [v13 fullLineRect];
        if (!IsEmpty)
        {
          v30.origin.CGFloat x = x;
          v30.origin.CGFloat y = y;
          v30.size.CGFloat width = width;
          v30.size.CGFloat height = height;
          *(CGRect *)&CGFloat v15 = CGRectUnion(*(CGRect *)&v15, v30);
        }
        CGFloat x = v15;
        CGFloat y = v16;
        CGFloat width = v17;
        CGFloat height = v18;
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)p_showEditor:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = [[[THWPRep interactiveCanvasController][THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"] canvasView][enclosingScrollView][superview];
  -[THWPRep popoverPresentationRectForRange:]([(THWPHighlightController *)self parentRep], "popoverPresentationRectForRange:", location, length);
  -[THWPRep convertNaturalRectToUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalRectToUnscaledCanvas:", v9, v10, v11, v12);
  [(-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController") convertUnscaledToBoundsRect:v13, v14, v15, v16];
  objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "convertRect:toView:", v8, v17, v18, v19, v20);
  [a3 presentFromRect:v8 view:nil];
  qword_573220 = (uint64_t)a3;
}

+ (void)p_forgetActivePopover:(id)a3
{
  if ((id)qword_573220 == a3) {
    qword_573220 = 0;
  }
}

- (void)hidePopoverEditor
{
  [objc_opt_class() p_forgetActivePopover:[self noteEditorController]];
  [objc_opt_class() p_forgetActivePopover:[self highlightColorEditorController]];
  [(AEAnnotationEditor *)[(THWPHighlightController *)self noteEditorController] hide];
  id v3 = [(THWPHighlightController *)self highlightColorEditorController];

  [(AEHighlightColorEditorController *)v3 hide];
}

- (BOOL)p_alwaysShowSheetNoteEditor
{
  return 0;
}

- (void)p_showHighlightEditorForCachedAnnotation:(id)a3
{
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] delegate;
  id v5 = (void *)TSUDynamicCast();
  if (a3)
  {
    id v6 = v5;
    if (([v5 showingExpandedWidgetView] & 1) == 0)
    {
      id v10 = [objc_alloc((Class)AEHighlightColorEditorController) initWithNibName:0 bundle:0];
      if (objc_msgSend(objc_msgSend(v6, "documentRoot"), "themeProvider")) {
        id v7 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "documentRoot"), "themeProvider"), "annotationPageTheme");
      }
      else {
        id v7 = &dword_4;
      }
      [v10 setPageTheme:v7];
      [v10 setDelegate:self];
      [v10 setAnnotation:[a3 annotation]];
      objc_msgSend(v10, "setAnnotationTheme:", objc_msgSend(objc_msgSend(a3, "annotation"), "theme"));
      [v6 addChildViewController:v10];
      id v8 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
      -[THWPHighlightController p_showEditor:forRange:](self, "p_showEditor:forRange:", v10, v8, v9);
      [(THWPHighlightController *)self setHighlightColorEditorController:v10];
    }
  }
}

- (CGRect)canvasRectForAnnotation:(id)a3
{
  id v4 = [a3 annotationStorageRange];
  -[THWPRep popoverPresentationRectForRange:]([(THWPHighlightController *)self parentRep], "popoverPresentationRectForRange:", v4, v5);
  -[THWPRep convertNaturalRectToUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalRectToUnscaledCanvas:", v6, v7, v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];

  [v18 convertUnscaledToBoundsRect:v11, v13, v15, v17];
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)p_showHighlightMenuForCachedAnnotation:(id)a3
{
  id v5 = [[[[-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"], "canvasView"], "enclosingScrollView"], "superview"];
  id v6 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
  -[THWPRep popoverPresentationRectForRange:]([(THWPHighlightController *)self parentRep], "popoverPresentationRectForRange:", v6, v7);
  -[THWPRep convertNaturalRectToUnscaledCanvas:]([(THWPHighlightController *)self parentRep], "convertNaturalRectToUnscaledCanvas:", v8, v9, v10, v11);
  [(-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController") convertUnscaledToBoundsRect:v12, v13, v14, v15];
  objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "canvasView"), "convertRect:toView:", v5, v16, v17, v18, v19);
  double y = v25.origin.y;
  double MidX = CGRectGetMidX(v25);
  double v22 = -[THHighlightMenuInteraction initWithAnnotationUUID:delegate:]([THHighlightMenuInteraction alloc], "initWithAnnotationUUID:delegate:", objc_msgSend(objc_msgSend(a3, "annotation"), "annotationUuid"), self);
  [v5 addInteraction:v22];
  long long v23 = +[UIEditMenuConfiguration configurationWithIdentifier:@"com.apple.iBooks.HighlightMenu", MidX, y sourcePoint];

  [(THHighlightMenuInteraction *)v22 presentEditMenuWithConfiguration:v23];
}

- (id)p_editMenuForAnnotationUUID:(id)a3
{
  id v5 = [(THWPHighlightController *)self annotationController];
  id v6 = [v5 annotationWithUuid:a3];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_B9558;
  v21[3] = &unk_458DA8;
  v21[4] = v6;
  long long v24 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", [(id)THBundle() localizedStringForKey:@"Copy" value:&stru_46D7E8 table:0], +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"copy"), 0, v21);
  double v14 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_46D7E8, 0, @"com.apple.iBooks.EditMenuGroup", 17, +[NSArray arrayWithObjects:&v24 count:1]);
  id v7 = +[_TtC8BookCore23BECustomViewMenuElement createHighlightMenuElementFor:4 annotationUUID:a3 delegate:self];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_B95C0;
  v20[3] = &unk_458DF8;
  v20[4] = v6;
  v20[5] = v5;
  v20[6] = self;
  double v8 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", [(id)THBundle() localizedStringForKey:@"Remove" value:&stru_46D7E8 table:0], +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"trash"), 0, v20);
  [(UIAction *)v8 setAttributes:2];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_B97AC;
  v19[3] = &unk_458E20;
  v19[4] = self;
  v19[5] = v6;
  double v9 = +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", [(id)THBundle() localizedStringForKey:@"Add Note" value:&stru_46D7E8 table:0], +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"note.text"), 0, v19);
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  double v10 = +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_46D7E8, 0, @"com.apple.iBooks.AnnotationMenuGroup", 17, +[NSArray arrayWithObjects:v23 count:3]);
  id v11 = +[NSMutableArray array];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_B97B8;
  v18[3] = &unk_458E20;
  v18[4] = self;
  v18[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Look Up", &stru_46D7E8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"magnifyingglass.circle"), 0, v18));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_B9834;
  v17[3] = &unk_458E20;
  v17[4] = self;
  v17[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Translate", &stru_46D7E8, 0), +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", @"translate"), 0, v17));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_B98B0;
  v16[3] = &unk_458E20;
  v16[4] = self;
  v16[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Search", &stru_46D7E8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"doc.text.magnifyingglass"), 0, v16));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_B9920;
  v15[3] = &unk_458E20;
  v15[4] = self;
  v15[5] = v6;
  objc_msgSend(v11, "addObject:", +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Share", &stru_46D7E8, 0), +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", @"square.and.arrow.up"), 0, v15));
  double v12 = +[UIMenu menuWithTitle:&stru_46D7E8 image:0 identifier:@"com.apple.iBooks.OtherMenuGroup" options:17 children:v11];
  v22[0] = v14;
  v22[1] = v10;
  v22[2] = v12;
  return +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_46D7E8, 0, 0, 17, +[NSArray arrayWithObjects:v22 count:3]);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  objc_opt_class();
  id v6 = (void *)TSUDynamicCast();
  if (v6)
  {
    id v7 = [v6 annotationUUID];
    return [(THWPHighlightController *)self p_editMenuForAnnotationUUID:v7];
  }
  else
  {
    double v8 = THLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2A0B54(v8);
    }
    return 0;
  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [a3 view];

  [v6 removeInteraction:a3];
}

- (void)createHighlightForSelectionWithCurrentThemeWithCompletion:(id)a3
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController createHighlightForSelectionWithCurrentThemeWithCompletion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:1438 description:@"THWPHighlightController createHighlightForSelectionWithCurrentTheme not implemented"];
  if (a3)
  {
    id v4 = (void (*)(id, void))*((void *)a3 + 2);
    v4(a3, 0);
  }
}

- (void)createHighlightForSelectionWithStyle:(int)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController createHighlightForSelectionWithStyle:]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:1447 description:@"THWPHighlightController createHighlightForSelectionWithStyle: not implemented"];
}

- (void)setStyleOfExistingHighlight:(id)a3 to:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
  objc_opt_class();
  [v7 beginEditingRep:[self parentRep]];
  if (TSUDynamicCast())
  {
    id v8 = [(THWPHighlightController *)self annotationController];
    id v9 = [v8 annotationWithUuid:a3];
    if (![(THWPHighlightController *)self p_cachedAnnotationForAnnotation:v9]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController setStyleOfExistingHighlight:to:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:1464 description:@"Could not find annotation in database."];
    }
    [v8 modifyAnnotation:v9 withStyle:v4 undoContext:0];
    [v8 setCurrentAnnotationStyle:v4];
  }
  else
  {
    double v10 = THLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2A0B98(v10);
    }
  }
}

- (void)p_showEditorForHighlight:(id)a3
{
  [a3 annotation];
  id v4 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];

  [(THWPHighlightController *)self p_showHighlightEditorForCachedAnnotation:v4];
}

- (void)p_showMenuForHighlight:(id)a3
{
  [a3 annotation];
  id v4 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];

  [(THWPHighlightController *)self p_showHighlightMenuForCachedAnnotation:v4];
}

- (void)showHighlightEditorForAnnotation:(id)a3
{
  id v5 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];
  if (!v5)
  {
    [(THWPHighlightController *)self updateCachedAnnotations];
    id v5 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:a3];
  }

  [(THWPHighlightController *)self p_showHighlightEditorForCachedAnnotation:v5];
}

- (void)showHighlightMenuForAnnotation:(id)a3
{
  id v5 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];
  if (!v5)
  {
    [(THWPHighlightController *)self updateCachedAnnotations];
    id v5 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:a3];
  }

  [(THWPHighlightController *)self p_showHighlightMenuForCachedAnnotation:v5];
}

- (void)showHighlightEditorForHighlightAtPoint:(CGPoint)a3
{
  id v4 = -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y);

  [(THWPHighlightController *)self p_showEditorForHighlight:v4];
}

- (void)showHighlightMenuForHighlightAtPoint:(CGPoint)a3
{
  id v4 = -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y);

  [(THWPHighlightController *)self p_showMenuForHighlight:v4];
}

- (id)editMenuForHighlightAtPoint:(CGPoint)a3
{
  id result = -[THWPHighlightController highlightAtCanvasPoint:](self, "highlightAtCanvasPoint:", a3.x, a3.y);
  if (result)
  {
    id v5 = [[result annotation] annotationUuid];
    return [(THWPHighlightController *)self p_editMenuForAnnotationUUID:v5];
  }
  return result;
}

- (void)p_removeNoteForCachedAnnotation:(id)a3
{
  if (a3)
  {
    id v5 = [a3 marginNote];
    if (v5)
    {
      [(THMarginNotesController *)[(THWPHighlightController *)self marginNotesController] removeMarginNote:v5];
      [a3 setMarginNote:0];
    }
  }
}

- (BOOL)p_shouldDrawMarginNoteForCachedCachedAnnotation:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationNote");
  if (v5)
  {
    id v6 = [[a3 annotation] annotationStorageRange];
    LOBYTE(v5) = v6 >= [(THWPRep *)[(THWPHighlightController *)self parentRep] range];
  }
  return (char)v5;
}

- (CGRect)p_marginNotePresentationRectForCachedAnnotation:(id)a3
{
  id v5 = [a3 highlight];
  if (v5 && (id v6 = v5, objc_msgSend(objc_msgSend(v5, "lines"), "count")))
  {
    id v7 = objc_msgSend(objc_msgSend(v6, "lines"), "objectAtIndex:", 0);
    if (objc_msgSend(-[THWPRep columns](-[THWPHighlightController parentRep](self, "parentRep"), "columns"), "count") == (char *)&dword_0 + 1)
    {
      [v7 currentLineRect];
      double v11 = 1.0;
    }
    else
    {
      [v7 fullLineRect];
    }
  }
  else
  {
    double v12 = [(THWPHighlightController *)self parentRep];
    id v13 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
    -[THWPRep popoverPresentationRectForRange:](v12, "popoverPresentationRectForRange:", v13, v14);
  }
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v11;
  result.origin.double y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)p_drawMarginNoteIfNeeded:(id)a3
{
  if (!-[THWPHighlightController p_shouldDrawMarginNoteForCachedCachedAnnotation:](self, "p_shouldDrawMarginNoteForCachedCachedAnnotation:"))return; {
  double top = UIEdgeInsetsZero.top;
  }
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  [(THWPHighlightController *)self p_marginNotePresentationRectForCachedAnnotation:a3];
  id v13 = [[-[THWPRep marginNotesOwner](-[THWPHighlightController parentRep](self, "parentRep"), "marginNotesOwner") marginNoteForAnnotation:[a3 annotation] inRep:[self parentRep] highlightBounds:v9, v10, v11, v12];
  [a3 setMarginNote:v13];
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] delegate;
  uint64_t v14 = (void *)TSUDynamicCast();
  if (objc_msgSend(objc_msgSend(v14, "documentRoot"), "isEPUB"))
  {
    if (([v14 inFlowMode] & 1) != 0
      || objc_msgSend(objc_msgSend(v14, "documentRoot"), "isEPUB"))
    {
      id v15 = [v14 configuration];
      [(-[THWPHighlightController parentRep](self, "parentRep")) canvas].contentsScale;
      [v15 noteEdgeInsetsAtScale:];
      double top = v16;
      double left = v17;
      double bottom = v18;
      double right = v19;
    }
    if (v13)
    {
LABEL_7:
      double v20 = [(THWPHighlightController *)self marginNotesController];
      -[THMarginNotesController addMarginNote:edgeInsets:](v20, "addMarginNote:edgeInsets:", v13, top, left, bottom, right);
    }
  }
  else
  {
    if ([(THMarginNotesController *)[(THWPHighlightController *)self marginNotesController] compactPresentation])double v21 = 4.0; {
    else
    }
      double v21 = 10.0;
    objc_msgSend(objc_msgSend(v14, "view"), "safeAreaInsets");
    double top = v22;
    double v24 = v23;
    double bottom = v25;
    double v27 = v26;
    unsigned int v28 = [v14 inFlowMode];
    double v29 = -0.0;
    if (v28) {
      double v30 = v24;
    }
    else {
      double v30 = -0.0;
    }
    double left = v21 + v30;
    if (v28) {
      double v29 = v27;
    }
    double right = v21 + v29;
    if (v13) {
      goto LABEL_7;
    }
  }
}

- (void)p_updateMarginNoteForCachedAnnotation:(id)a3
{
  -[THWPHighlightController p_removeNoteForCachedAnnotation:](self, "p_removeNoteForCachedAnnotation:");

  [(THWPHighlightController *)self p_drawMarginNoteIfNeeded:a3];
}

- (void)p_updateMarginNoteForHighlight:(id)a3
{
  [a3 annotation];
  id v4 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:TSUProtocolCast()];
  if (v4)
  {
    [(THWPHighlightController *)self p_updateMarginNoteForCachedAnnotation:v4];
  }
}

- (id)annotationEditorForAnnotation:(id)a3
{
  BOOL v5 = [[a3 annotationNote] length] == 0;

  return [(THWPHighlightController *)self annotationEditorForAnnotation:a3 editsOnLaunch:v5];
}

- (id)annotationEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] documentRoot;
  id v7 = (void *)TSUDynamicCast();
  id v8 = [v7 annotationController];
  if ([(THWPHighlightController *)self p_alwaysShowSheetNoteEditor])
  {
    double v9 = (Class *)AENoteFullscreenEditorController_ptr;
  }
  else
  {
    double v9 = (Class *)AENoteFullscreenEditorController_ptr;
    if (![(THWPHighlightController *)self p_isCompactWidth]
      && ![(THWPHighlightController *)self p_isCompactHeight])
    {
      double v9 = (Class *)AENotePopoverEditorController_ptr;
    }
  }
  id v10 = objc_alloc_init(*v9);
  [v10 setAnnotation:a3];
  if (v4) {
    id v11 = [v8 canModifyAnnotations];
  }
  else {
    id v11 = 0;
  }
  [v10 setEditsOnLaunch:v11];
  [v10 setDelegate:self];
  objc_opt_class();
  [v7 themeProvider];
  id v12 = [(id)BUDynamicCast() themeIdentifier];
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = (id)kIMThemeIdentifierDynamicTheme;
  }
  [v10 setTheme:[IMThemePage themeWithIdentifier:v13]];
  [v10 setAnnotationTheme:[AEAnnotationTheme themeForAnnotationStyle:[a3 annotationStyle] pageTheme:[self pageTheme] isUnderline:[a3 annotationIsUnderline]]];
  objc_opt_class();
  objc_msgSend(objc_msgSend(objc_msgSend((id)BUDynamicCast(), "noteEditorViewController"), "textView"), "setEditable:", objc_msgSend(v8, "canModifyAnnotations"));

  return v10;
}

- (void)showNoteEditorForAnnotation:(id)a3 editsOnLaunch:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController layerHost];
  if (([(id)TSUDynamicCast() showingExpandedWidgetView] & 1) == 0)
  {
    id v7 = [(THWPHighlightController *)self annotationEditorForAnnotation:a3 editsOnLaunch:v4];
    [(THWPHighlightController *)self setNoteEditorController:v7];
    if ([(THWPHighlightController *)self p_isCompactWidth]
      || [(THWPHighlightController *)self p_isCompactHeight]
      || [(THWPHighlightController *)self p_alwaysShowSheetNoteEditor])
    {
      objc_opt_class();
      uint64_t v8 = BUDynamicCast();
      if (!v8) {
        BCReportAssertionFailureWithMessage();
      }
      objc_msgSend(objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "presentViewController:animated:completion:", v8, 1, 0);
      qword_573220 = (uint64_t)v7;
    }
    else
    {
      objc_opt_class();
      uint64_t v9 = BUDynamicCast();
      if (!v9) {
        BCReportAssertionFailureWithMessage();
      }
      id v11 = [a3 annotationStorageRange];
      -[THWPHighlightController p_showEditor:forRange:](self, "p_showEditor:forRange:", v9, v11, v10);
    }
  }
}

- (void)showNoteEditorForAnnotation:(id)a3
{
  BOOL v5 = [[a3 annotationNote] length] == 0;

  [(THWPHighlightController *)self showNoteEditorForAnnotation:a3 editsOnLaunch:v5];
}

- (void)showNoteEditorForMarginNote:(id)a3
{
  [a3 annotation];
  uint64_t v4 = TSUProtocolCast();

  [(THWPHighlightController *)self showNoteEditorForAnnotation:v4];
}

- (BOOL)ownsMarginNote:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)[(THWPHighlightController *)self annotationCache] allValues];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) marginNote] == a3)
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  objc_opt_class();
  [THWPRep interactiveCanvasController][THWPHighlightController parentRep][self parentRep]documentRoot];
  id v8 = [(id)TSUDynamicCast() annotationController];
  if ([a5 length]) {
    id v9 = a5;
  }
  else {
    id v9 = 0;
  }

  [v8 modifyAnnotation:a4 withNoteText:v9 undoContext:0];
}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  if ([(THWPHighlightController *)self p_cachedAnnotationForAnnotation:a5])
  {
    if (a4)
    {
LABEL_3:
      unsigned int v9 = [a4 annotationStyle];
      goto LABEL_6;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPHighlightController editorController:setTheme:forAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm") lineNumber:1755 description:@"Could not find annotation in database."];
    if (a4) {
      goto LABEL_3;
    }
  }
  unsigned int v9 = 0;
LABEL_6:
  if ([a4 isUnderline]) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = [(THWPHighlightController *)self annotationController];
  id v12 = [v11 modifyAnnotation:a5 withStyle:v10 undoContext:0];
  if (v12) {
    [a3 setAnnotation:v12];
  }

  [v11 setCurrentAnnotationStyle:v10];
}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  id v5 = [(THWPHighlightController *)self p_cachedAnnotationForAnnotation:a4];
  if (v5) {
    [self annotationController]->destroyAnnotation:[v5 annotation] undoContext:0;
  }
}

- (void)editorController:(id)a3 editNote:(id)a4
{
}

- (void)editorController:(id)a3 showEditMenuForAnnotation:(id)a4
{
  id v6 = [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
  objc_opt_class();
  [(id)TSUDynamicCast() setITunesMobileContext:a4];
  objc_opt_class();
  [v6 beginEditingRep:[self parentRep]];
  uint64_t v7 = (void *)TSUDynamicCast();
  id v8 = [a4 annotationStorageRange];
  uint64_t v10 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v8, v9);

  [v7 setSelection:v10];
}

- (BOOL)p_isCompactWidth
{
  [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();

  return [v2 isCompactWidth];
}

- (BOOL)p_isCompactHeight
{
  [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
  objc_opt_class();
  id v2 = (void *)TSUDynamicCast();

  return [v2 isCompactHeight];
}

- (BOOL)editorController:(id)a3 isRightArrowEnabledForAnnotation:(id)a4
{
  id v6 = [(THWPRep *)[(THWPHighlightController *)self parentRep] interactiveCanvasController];
  objc_opt_class();
  uint64_t v7 = (void *)TSUDynamicCast();
  [v7 setITunesMobileContext:a4];
  objc_opt_class();
  [v6 beginEditingRep:[self parentRep]];
  uint64_t v8 = TSUDynamicCast();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [a4 annotationStorageRange];
    unsigned __int8 v12 = [v9 willShowMenuForSelection:[TSWPSelection selectionWithRange:v10, v11]];
  }
  else
  {
    unsigned __int8 v12 = 1;
  }
  [v7 setITunesMobileContext:0];
  return v12;
}

- (void)willHideAnnotationEditor:(id)a3
{
  if ((id)qword_573220 == a3) {
    qword_573220 = 0;
  }
  [(-[THWPHighlightController parentRep](self, "parentRep"), "interactiveCanvasController") endEditing];
  id v4 = [(THWPRep *)[(THWPHighlightController *)self parentRep] layout];

  [v4 validate];
}

- (void)didHideAnnotationEditor:(id)a3
{
  if ([(THWPHighlightController *)self noteEditorController] == a3)
  {
    [(AEAnnotationEditor *)[(THWPHighlightController *)self noteEditorController] setDelegate:0];
    [(THWPHighlightController *)self setNoteEditorController:0];
  }
  else if ([(THWPHighlightController *)self highlightColorEditorController] == a3)
  {
    [(AEHighlightColorEditorController *)[(THWPHighlightController *)self highlightColorEditorController] removeFromParentViewController];
    [(-[THWPHighlightController highlightColorEditorController](self, "highlightColorEditorController"), "view") removeFromSuperview];
  }
  objc_opt_class();
  [(-[THWPHighlightController parentRep](self, "parentRep")) interactiveCanvasController] layerHost];
  id v5 = (void *)TSUDynamicCast();

  [v5 becomeFirstResponder];
}

- (BOOL)editorController:(id)a3 canSelectThemeWithIdentifier:(id)a4
{
  return 1;
}

- (NSMutableDictionary)annotationCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAnnotationCache:(id)a3
{
}

- (THWPRep)parentRep
{
  return self->mParentRep;
}

- (void)setParentRep:(id)a3
{
  self->mParentRep = (THWPRep *)a3;
}

- (THMarginNotesController)marginNotesController
{
  return self->mMarginNotesController;
}

- (void)setMarginNotesController:(id)a3
{
}

- (THAnnotation)currentDragAnnotation
{
  return self->mCurrentDragAnnotation;
}

- (void)setCurrentDragAnnotation:(id)a3
{
}

- (CGPoint)dragStartPoint
{
  double x = self->mDragStartPoint.x;
  double y = self->mDragStartPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragStartPoint:(CGPoint)a3
{
  self->mDragStartPoint = a3;
}

- (BOOL)trackingDrag
{
  return self->mTrackingDrag;
}

- (void)setTrackingDrag:(BOOL)a3
{
  self->mTrackingDrag = a3;
}

- (AEHighlightColorEditorController)highlightColorEditorController
{
  return self->mHighlightColorEditorController;
}

- (void)setHighlightColorEditorController:(id)a3
{
}

- (AEAnnotationEditor)noteEditorController
{
  return self->mNoteEditorController;
}

- (void)setNoteEditorController:(id)a3
{
}

@end