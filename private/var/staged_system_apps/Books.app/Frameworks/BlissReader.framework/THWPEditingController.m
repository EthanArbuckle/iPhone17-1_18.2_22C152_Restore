@interface THWPEditingController
- (BOOL)canCopy;
- (BOOL)canEditTextString;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)createdFromAnnotationHUD;
- (BOOL)handleGesture:(id)a3;
- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4;
- (BOOL)p_canAddNote;
- (BOOL)p_canCopySelection:(id)a3;
- (BOOL)p_canEditNote;
- (BOOL)p_canHighlight;
- (BOOL)p_canModifyAnnotations;
- (BOOL)p_canSearchSelection:(id)a3;
- (BOOL)p_canShowDictionaryForSelection:(id)a3;
- (BOOL)p_canShowGlossaryForSelection:(id)a3;
- (BOOL)p_canTranslateSelection:(id)a3;
- (BOOL)p_selection:(id)a3 highlightMatchesStyle:(int)a4;
- (BOOL)p_selectionContainsSomeUnhighlightedText:(id)a3;
- (BOOL)p_selectionHasHighlight:(id)a3;
- (BOOL)p_selectionHasNote:(id)a3;
- (BOOL)p_selectionIsExactRangeOfHighlight:(id)a3;
- (BOOL)p_selectionIsStrictSubrangeOfHighlight:(id)a3;
- (BOOL)startingInitialSelectionDrag;
- (BOOL)wantsKeyboard;
- (BOOL)willShowMenuForSelection:(id)a3;
- (THWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4;
- (id)annotationForCurrentSelection;
- (id)annotationForUUID:(id)a3;
- (id)editingReps;
- (id)extraMenuItems;
- (id)p_activityItemProviderWithAnnotation:(id)a3;
- (id)p_activityItemProviderWithCurrentSelection;
- (id)p_annotationController;
- (id)p_annotationForSelection:(id)a3;
- (id)p_annotationFromCurrentSelection;
- (id)p_annotationUUIDFromSender:(id)a3;
- (id)p_pageRepForStorage:(id)a3 withSelection:(id)a4;
- (id)p_repsForStorage:(id)a3 range:(_NSRange)a4;
- (id)p_selectionOrAnnotation;
- (id)p_selectionOrAnnotationFromSelection:(id)a3;
- (id)repForStorage:(id)a3 range:(_NSRange)a4;
- (id)stringFromSelection;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int)currentAnnotationStyle;
- (int)p_currentNoteStyle;
- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3;
- (unsigned)knobTrackingTapCount;
- (void)addHighlightWithStyle:(int)a3 forSender:(id)a4;
- (void)addNote:(id)a3;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)didBecomeTextInputEditor;
- (void)dismissActivePopovers;
- (void)highlightWithStyle:(int)a3;
- (void)highlightWithStyle:(int)a3 annotation:(id)a4;
- (void)menuCopy:(id)a3;
- (void)p_addHighlightForSelection:(id)a3;
- (void)p_addNote:(id)a3;
- (void)p_canvasDidScroll:(id)a3;
- (void)p_canvasWillScroll:(id)a3;
- (void)p_highlight:(id)a3;
- (void)p_removeNote;
- (void)p_removeNotesFromAnnotation:(id)a3;
- (void)p_showDictionaryForAnnotation:(id)a3;
- (void)p_showDictionaryForSelection:(id)a3;
- (void)p_showGlossary:(id)a3;
- (void)p_showGlossaryForAnnotation:(id)a3;
- (void)p_showGlossaryForSelection:(id)a3;
- (void)p_showGlossaryOrDictionary:(int)a3 forAnnotation:(id)a4;
- (void)p_showGlossaryOrDictionary:(int)a3 forRange:(_NSRange)a4;
- (void)p_showGlossaryOrDictionary:(int)a3 forSelection:(id)a4;
- (void)p_showTranslationForAnnotation:(id)a3;
- (void)p_showTranslationForSelection:(id)a3;
- (void)removeNote:(id)a3;
- (void)removeNoteAndHighlight:(id)a3;
- (void)searchSelection:(id)a3;
- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4;
- (void)setCreatedFromAnnotationHUD:(BOOL)a3;
- (void)setStartingInitialSelectionDrag:(BOOL)a3;
- (void)shareAnnotation:(id)a3;
- (void)shareSelection:(id)a3;
- (void)showDictionary:(id)a3;
- (void)showDictionaryForAnnotation:(id)a3;
- (void)showTranslationForAnnotation:(id)a3;
- (void)translateSelection:(id)a3;
- (void)willResignTextInputEditor;
@end

@implementation THWPEditingController

- (THWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWPEditingController;
  v4 = -[THWPEditingController initWithStorage:interactiveCanvasController:](&v8, "initWithStorage:interactiveCanvasController:", a3);
  if (v4)
  {
    objc_opt_class();
    v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      v6 = v5;
      [v5 iTunesMobileContext];
      if (TSUProtocolCast())
      {
        [(THWPEditingController *)v4 setCreatedFromAnnotationHUD:1];
        [v6 setITunesMobileContext:0];
      }
      else
      {
        [(THWPEditingController *)v4 setCreatedFromAnnotationHUD:0];
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THWPEditingController;
  [(THWPEditingController *)&v2 dealloc];
}

- (void)p_canvasWillScroll:(id)a3
{
  objc_opt_class();
  [a3 object];
  id v5 = [(id)TSUDynamicCast() documentRoot];
  if (v5 == objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"))
  {
    [(THWPEditingController *)self p_dismissPopovers];
  }
}

- (void)p_canvasDidScroll:(id)a3
{
  objc_opt_class();
  [a3 object];
  id v5 = [(id)TSUDynamicCast() documentRoot];
  if (v5 == objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"))
  {
    [(THWPEditingController *)self p_dismissPopovers];
  }
}

- (void)didBecomeTextInputEditor
{
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  [(THWPEditingController *)&v4 didBecomeTextInputEditor];
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 addObserver:self selector:"p_canvasWillScroll:" name:TSDCanvasWillScrollNotification object:0];
  [(NSNotificationCenter *)v3 addObserver:self selector:"p_canvasWillScroll:" name:TSDCanvasWillAnimateScrollNotification object:0];
  [(NSNotificationCenter *)v3 addObserver:self selector:"p_canvasDidScroll:" name:TSDCanvasDidScrollNotification object:0];
}

- (void)willResignTextInputEditor
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:TSDCanvasWillScrollNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:TSDCanvasWillAnimateScrollNotification object:0];
  [(NSNotificationCenter *)v3 removeObserver:self name:TSDCanvasDidScrollNotification object:0];
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  [(THWPEditingController *)&v4 willResignTextInputEditor];
}

- (id)repForStorage:(id)a3 range:(_NSRange)a4
{
  id v4 = -[THWPEditingController p_repsForStorage:range:](self, "p_repsForStorage:range:", a3, a4.location, a4.length);
  objc_opt_class();
  [v4 anyObject];

  return (id)TSUDynamicCast();
}

- (id)p_repsForStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = +[NSMutableSet set];
  id v9 = [self interactiveCanvasController] layoutsForModel:a3 withSelection:[TSWPSelection selectionWithRange:location, length];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [self interactiveCanvasController] repForLayout:*(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
        if (v14) {
          [v8 addObject:v14];
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  return v8;
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  return 0;
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (id)editingReps
{
  id v3 = [(THWPEditingController *)self storage];
  id v5 = [self selection].range;

  return -[THWPEditingController p_repsForStorage:range:](self, "p_repsForStorage:range:", v3, v5, v4);
}

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  [(THWPEditingController *)&v4 selectionChangedWithFlags:a3 wpFlags:a4];
}

- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3
{
  if (a3 == 3) {
    return 3;
  }
  else {
    return 1;
  }
}

- (id)p_annotationController
{
  objc_opt_class();
  [(THWPEditingController *)self interactiveCanvasController];
  id v3 = (void *)TSUDynamicCast();

  return [v3 bookAnnotationController];
}

- (BOOL)p_canModifyAnnotations
{
  id v2 = [(THWPEditingController *)self p_annotationController];

  return [v2 canModifyAnnotations];
}

- (BOOL)p_canHighlight
{
  id v3 = [(THWPEditingController *)self selection];
  unsigned int v4 = [(THWPEditingController *)self p_canModifyAnnotations];
  LOBYTE(v5) = 0;
  if (v4 && v3)
  {
    id v6 = [(THWPEditingController *)self p_annotationForSelection:v3];
    id v7 = v6;
    if (v6) {
      id v8 = [v6 annotationStorageRange];
    }
    else {
      id v8 = [v3 range];
    }
    id v10 = v8;
    uint64_t v11 = v9;
    id v12 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", [(THWPEditingController *)self storage], v8, v9);
    if (!v12)
    {
      id v13 = [(THWPEditingController *)self storage];
      id v14 = [v3 range];
      id v12 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v13, v14, v15);
    }
    id v16 = [[-[THWPEditingController storage](self, "storage") substringWithRange:v10, v11] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    unsigned int v5 = objc_msgSend(objc_msgSend(v12, "highlightController"), "shouldAllowHighlights");
    if (!v7 && v5) {
      LOBYTE(v5) = [v16 length] != 0;
    }
  }
  return v5;
}

- (BOOL)p_canAddNote
{
  id v3 = [(THWPEditingController *)self selection];
  unsigned int v4 = [(THWPEditingController *)self p_canModifyAnnotations];
  LOBYTE(v5) = 0;
  if (v4 && v3)
  {
    id v6 = [(THWPEditingController *)self p_annotationForSelection:v3];
    if (v6)
    {
      LOBYTE(v5) = [v6 annotationNote] == 0;
    }
    else
    {
      id v7 = [v3 range];
      uint64_t v9 = v8;
      id v10 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", [(THWPEditingController *)self storage], v7, v8);
      id v11 = [[-[THWPEditingController storage](self, "storage") substringWithRange:v7, v9] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
      unsigned int v5 = objc_msgSend(objc_msgSend(v10, "highlightController"), "shouldAllowHighlights");
      if (v5) {
        LOBYTE(v5) = [v11 length] != 0;
      }
    }
  }
  return v5;
}

- (BOOL)p_canEditNote
{
  id v3 = [(THWPEditingController *)self p_annotationForSelection:[(THWPEditingController *)self selection]];
  BOOL v4 = [(THWPEditingController *)self p_canModifyAnnotations];
  if (v4) {
    LOBYTE(v4) = [v3 annotationNote] != 0;
  }
  return v4;
}

- (void)p_addHighlightForSelection:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_addHighlightForSelection:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:475 description:@"Highlighting non range selection"];
  }
  id v5 = [(THWPEditingController *)self storage];
  id v6 = [a3 range];
  id v8 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v5, v6, v7);
  objc_msgSend(objc_msgSend(v8, "highlightController"), "updateCachedAnnotations");
  id v9 = [(THWPEditingController *)self p_annotationController];
  id v10 = [(THWPEditingController *)self storage];
  id v11 = [a3 range];
  uint64_t v13 = v12;
  id v14 = [v8 storageContentNode];
  id v15 = [v9 currentAnnotationStyle];

  [v9 addAnnotationForStorage:v10 range:v11 contentNode:v13 style:v14 undoContext:0];
}

- (BOOL)p_selectionHasNote:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionHasNote:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:483 description:@"Selection is not a range"];
  }
  id v5 = [(THWPEditingController *)self p_annotationController];
  id v6 = [(THWPEditingController *)self storage];
  id v7 = [a3 range];
  id v9 = [v5 cachedAnnotationsForContentNode:[-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8) storageContentNode]];
  id v10 = [(THWPEditingController *)self storage];
  id v12 = [a3 range];

  return [v9 storage:hasAnnotationWithNoteInRange:v10, v12, v11];
}

- (BOOL)p_selectionHasHighlight:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionHasHighlight:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:490 description:@"Selection is not a range"];
  }
  id v5 = [(THWPEditingController *)self p_annotationController];
  id v6 = [(THWPEditingController *)self storage];
  id v7 = [a3 range];
  id v9 = [v5 cachedAnnotationsForContentNode:[-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8) storageContentNode]];
  id v10 = [(THWPEditingController *)self storage];
  id v12 = [a3 range];

  return [v9 storage:hasAnnotationInRange:v10, v12, v11];
}

- (BOOL)p_selectionIsStrictSubrangeOfHighlight:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWPEditingController p_selectionIsStrictSubrangeOfHighlight:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"] lineNumber:497 description:@"Selection is not a range"];
  }
  id v5 = [(THWPEditingController *)self p_annotationController];
  id v6 = [(THWPEditingController *)self storage];
  id v7 = [a3 range];
  id v9 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8);
  id v10 = [v5 cachedAnnotationsForContentNode:[v9 storageContentNode]];
  id v11 = [v9 storage];
  id v13 = [a3 range];

  return [v10 storage:hasAnnotationStrictlyContainingRange:v11, v13, v12];
}

- (BOOL)p_selectionIsExactRangeOfHighlight:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionIsExactRangeOfHighlight:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:504 description:@"Selection is not a range"];
  }
  id v5 = [(THWPEditingController *)self p_annotationController];
  id v6 = [(THWPEditingController *)self storage];
  id v7 = [a3 range];
  id v9 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8);
  id v10 = [v5 cachedAnnotationsForContentNode:[v9 storageContentNode]];
  id v11 = [v9 storage];
  id v13 = [a3 range];

  return [v10 storage:hasAnnotationWithExactRange:v11, v13, v12];
}

- (BOOL)p_selectionContainsSomeUnhighlightedText:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selectionContainsSomeUnhighlightedText:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:511 description:@"Selection is not a range"];
  }
  id v5 = [(THWPEditingController *)self p_annotationController];
  id v6 = [(THWPEditingController *)self storage];
  id v7 = [a3 range];
  id v9 = [v5 cachedAnnotationsForContentNode:[-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v6, v7, v8) storageContentNode]];
  id v10 = [(THWPEditingController *)self storage];
  id v12 = [a3 range];

  return [v9 storage:containsSomeUnhighlightedTextInRange:v10, v12, v11];
}

- (BOOL)p_selection:(id)a3 highlightMatchesStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_selection:highlightMatchesStyle:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:518 description:@"Selection is not a range"];
  }
  id v7 = [(THWPEditingController *)self p_annotationController];
  id v8 = [(THWPEditingController *)self storage];
  id v9 = [a3 range];
  id v11 = [v7 cachedAnnotationsForContentNode:[-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v8, v9, v10) storageContentNode]];
  id v12 = [(THWPEditingController *)self storage];
  id v14 = [a3 range];

  return [v11 storage:v12 hasAnnotationThatMatchesStyle:v4 inRange:v14];
}

- (BOOL)willShowMenuForSelection:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (-[THWPEditingController p_canCopySelection:](self, "p_canCopySelection:")
    || [(THWPEditingController *)self p_canShowDictionaryForSelection:a3]
    || [(THWPEditingController *)self p_canSearchSelection:a3])
  {
    return 1;
  }

  return [(THWPEditingController *)self p_canShareSelection:a3];
}

- (BOOL)p_canShowGlossaryForSelection:(id)a3
{
  [self interactiveCanvasController].delegate
  id v5 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (LODWORD(v6) = [v5 allowGlossary], v6))
  {
    id v6 = objc_msgSend(objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "glossary");
    if (v6)
    {
      id v7 = v6;
      id v8 = [(THWPEditingController *)self storage];
      id v9 = [a3 range];
      LOBYTE(v6) = [v7 entryForTerm:[v8 substringWithRange:v9, v10]] != 0;
    }
  }
  return (char)v6;
}

- (BOOL)p_canShowDictionaryForSelection:(id)a3
{
  id v5 = [(THWPEditingController *)self storage];
  id v6 = [a3 range];
  if (objc_msgSend(v5, "wordCountOfRange:", v6, v7) > 3) {
    return 0;
  }
  id v8 = [(THWPEditingController *)self storage];
  id v9 = [a3 range];
  [v8 attachmentIndexRangeForTextRange:v9];
  return v11 == 0;
}

- (void)p_showGlossaryOrDictionary:(int)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = *(void *)&a3;
  id v8 = [(THWPEditingController *)self storage];
  id v9 = objc_msgSend(objc_msgSend(v8, "substringWithRange:", location, length), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  id v10 = v9;
  if (v6 == 3)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    id v17 = 0;
    id v17 = [v9 length];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_69500;
    v12[3] = &unk_457F28;
    v12[4] = v13;
    v12[5] = &v14;
    [v10 enumerateSubstringsInRange:0 length:[v10 length] options:3 usingBlock:v12];
    id v10 = [v10 substringToIndex:v15[3]];
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v14, 8);
  }
  id v11 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v8, location, length);
  [self interactiveCanvasController].layerHost;
  [TSUProtocolCast() presentGlossaryPopoverOfType:v6 withTerm:v10 rangeInRep:location length:length rep:v11];
  [self interactiveCanvasController].endEditing;
}

- (void)p_showGlossaryOrDictionary:(int)a3 forSelection:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = [a4 range];

  -[THWPEditingController p_showGlossaryOrDictionary:forRange:](self, "p_showGlossaryOrDictionary:forRange:", v4, v7, v6);
}

- (void)p_showGlossaryOrDictionary:(int)a3 forAnnotation:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = [a4 annotationStorageRange];

  -[THWPEditingController p_showGlossaryOrDictionary:forRange:](self, "p_showGlossaryOrDictionary:forRange:", v4, v7, v6);
}

- (void)p_showDictionaryForSelection:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_showDictionaryForSelection:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:599 description:@"Showing dictionary popover from non range selection"];
  }

  [(THWPEditingController *)self p_showGlossaryOrDictionary:2 forSelection:a3];
}

- (void)p_showDictionaryForAnnotation:(id)a3
{
}

- (void)p_showGlossaryForSelection:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPEditingController p_showGlossaryForSelection:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm") lineNumber:608 description:@"Showing glossary popover from non range selection"];
  }

  [(THWPEditingController *)self p_showGlossaryOrDictionary:0 forSelection:a3];
}

- (void)p_showGlossaryForAnnotation:(id)a3
{
}

- (void)p_showTranslationForSelection:(id)a3
{
  if (([a3 isRange] & 1) == 0) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWPEditingController p_showTranslationForSelection:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPEditingController.mm"] lineNumber:618 description:@"Showing translation popover from non range selection"];
  }

  [(THWPEditingController *)self p_showGlossaryOrDictionary:3 forSelection:a3];
}

- (void)p_showTranslationForAnnotation:(id)a3
{
}

- (BOOL)canCopy
{
  id v3 = [(THWPEditingController *)self selection];

  return [(THWPEditingController *)self p_canCopySelection:v3];
}

- (BOOL)p_canCopySelection:(id)a3
{
  [self interactiveCanvasController].delegate
  id v5 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  unsigned int v6 = [v5 allowCopy];
  if (v6)
  {
    [a3 range];
    if (v7)
    {
      id v8 = [(THWPEditingController *)self storage];
      id v9 = [a3 range];
      LOBYTE(v6) = objc_msgSend(objc_msgSend(v8, "stringEquivalentFromRange:", v9, v10), "length") != 0;
      return v6;
    }
LABEL_5:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)p_canSearchSelection:(id)a3
{
  unsigned int v5 = [a3 isRange];
  if (v5)
  {
    id v6 = [(THWPEditingController *)self storage];
    id v7 = [a3 range];
    if (objc_msgSend(v6, "rangeContainsAttachment:", v7, v8))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v9 = [(THWPEditingController *)self storage];
      id v10 = [a3 range];
      [v9 paragraphIndexRangeForCharRange:v10, v11];
      LOBYTE(v5) = v12 == 1;
    }
  }
  return v5;
}

- (BOOL)p_canTranslateSelection:(id)a3
{
  unsigned int v5 = [(THWPEditingController *)self canCopy];
  if (v5)
  {
    unsigned int v5 = [a3 isRange];
    if (v5)
    {
      id v6 = [(THWPEditingController *)self storage];
      id v7 = [a3 range];
      LOBYTE(v5) = [v6 rangeContainsAttachment:v7, v8] ^ 1;
    }
  }
  return v5;
}

- (void)menuCopy:(id)a3
{
}

- (id)stringFromSelection
{
  if (!objc_msgSend(-[THWPEditingController selection](self, "selection"), "isRange")) {
    return 0;
  }
  id result = [self p_activityItemProviderWithCurrentSelection].pasteboardString;
  if (!result) {
    return &stru_46D7E8;
  }
  return result;
}

- (void)copy:(id)a3
{
  if (objc_msgSend(-[THWPEditingController selection](self, "selection", a3), "isRange"))
  {
    id v4 = [(THWPEditingController *)self stringFromSelection];
    unsigned int v5 = +[UIPasteboard generalPasteboard];
    id v6 = [UTTypeUTF8PlainText identifier];
    [(UIPasteboard *)v5 setValue:v4 forPasteboardType:v6];
  }
}

- (id)p_annotationFromCurrentSelection
{
  id v3 = [(THWPEditingController *)self storage];
  id v4 = [self selection].range;
  id v6 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", v3, v4, v5);
  [self interactiveCanvasController].delegate
  id v7 = (id)TSUProtocolCast();
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = [v7 titleOfCurrentNavigationUnit];
    }
    else {
      id v7 = 0;
    }
  }
  id v8 = [(THWPEditingController *)self p_annotationController];
  id v9 = [(THWPEditingController *)self storage];
  id v10 = [v6 storageContentNode];
  id v12 = [self selection].range;

  return [v8 temporaryAnnotationForStorage:v9 contentNode:v10 withRange:v12 style:v11 chapterTitle:0 v7];
}

- (id)p_activityItemProviderWithCurrentSelection
{
  [self interactiveCanvasController].delegate
  uint64_t v3 = TSUProtocolCast();
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  id v5 = [(THWPEditingController *)self p_annotationForSelection:[(THWPEditingController *)self selection]];
  if (!v5)
  {
    id v5 = [(THWPEditingController *)self p_annotationFromCurrentSelection];
    if (!v5) {
      return 0;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v4 activityItemProviderWithCachedAnnotation:v5];
}

- (id)p_activityItemProviderWithAnnotation:(id)a3
{
  [self interactiveCanvasController].delegate
  uint64_t v4 = TSUProtocolCast();
  if (!a3) {
    return 0;
  }
  id v5 = (void *)v4;
  if (!v4 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [v5 activityItemProviderWithCachedAnnotation:a3];
}

- (void)p_highlight:(id)a3
{
  id v5 = [(THWPEditingController *)self p_annotationController];
  if (!v5) {
    return;
  }
  id v6 = v5;
  if (objc_opt_respondsToSelector())
  {
    if ([a3 tag])
    {
LABEL_4:
      [v6 setCurrentAnnotationStyle:];
      [(THWPEditingController *)self p_addHighlightForSelection:[(THWPEditingController *)self p_selectionOrAnnotation]];
      id v7 = [(THWPEditingController *)self interactiveCanvasController];
      [v7 endEditing];
      return;
    }
  }
  else if ([v6 currentAnnotationStyle])
  {
    goto LABEL_4;
  }
  id v8 = [(THWPEditingController *)self p_annotationForSelection:[(THWPEditingController *)self selection]];
  if (v8)
  {
    [v6 destroyAnnotation:v8 undoContext:0];
  }
}

- (void)translateSelection:(id)a3
{
  id v4 = [(THWPEditingController *)self selection];

  [(THWPEditingController *)self p_showTranslationForSelection:v4];
}

- (void)p_showGlossary:(id)a3
{
  id v4 = [(THWPEditingController *)self selection];

  [(THWPEditingController *)self p_showGlossaryForSelection:v4];
}

- (void)showDictionary:(id)a3
{
  id v4 = [(THWPEditingController *)self selection];

  [(THWPEditingController *)self p_showDictionaryForSelection:v4];
}

- (void)showTranslationForAnnotation:(id)a3
{
}

- (void)showDictionaryForAnnotation:(id)a3
{
}

- (void)addNote:(id)a3
{
}

- (void)p_addNote:(id)a3
{
  id v4 = [(THWPEditingController *)self selection];
  id v5 = [(THWPEditingController *)self p_annotationController];
  if (v4)
  {
    id v6 = v5;
    if (v5)
    {
      id v7 = [(THWPEditingController *)self p_annotationForSelection:v4];
      if (v7)
      {
        id v8 = v7;
        id v9 = [v7 annotationStorageRange];
        NSUInteger v11 = v10;
        v12.NSUInteger location = (NSUInteger)[v4 range];
        if (v12.length)
        {
          v27.NSUInteger location = (NSUInteger)v9;
          v27.NSUInteger length = v11;
          NSRange v13 = NSUnionRange(v12, v27);
          NSUInteger location = v13.location;
          NSUInteger length = v13.length;
        }
        else
        {
          NSUInteger location = (NSUInteger)v9;
          NSUInteger length = v11;
        }
        id v23 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", [(THWPEditingController *)self storage], location, length);
        if ((id)location == v9 && length == v11) {
          goto LABEL_12;
        }
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_6A0BC;
        v25[3] = &unk_457F48;
        v25[4] = location;
        v25[5] = length;
        id v24 = [v6 modifyAnnotation:v8 undoContext:0 undoActionName:0 withBlock:v25];
      }
      else
      {
        uint64_t v16 = (TSWPStorage *)[(THWPEditingController *)self storage];
        id v17 = [v4 range];
        NSUInteger v19 = v18;
        v26.NSUInteger location = (NSUInteger)v17;
        v26.NSUInteger length = v19;
        NSUInteger v20 = THTrimHighlightRange(v16, v26);
        uint64_t v22 = v21;
        id v23 = -[THWPEditingController repForStorage:range:](self, "repForStorage:range:", [(THWPEditingController *)self storage], v20, v21);
        id v24 = objc_msgSend(v6, "addAnnotationForStorage:range:contentNode:style:undoContext:", -[THWPEditingController storage](self, "storage"), v20, v22, objc_msgSend(v23, "storageContentNode"), objc_msgSend(v6, "currentAnnotationStyle"), 0);
      }
      id v8 = v24;
LABEL_12:
      objc_msgSend(objc_msgSend(v23, "highlightController"), "updateCachedAnnotations");
      [self interactiveCanvasController].endEditing;
      objc_msgSend(objc_msgSend(v23, "highlightController"), "showNoteEditorForAnnotation:", v8);
    }
  }
}

- (void)p_removeNote
{
  id v3 = [(THWPEditingController *)self p_annotationForSelection:[(THWPEditingController *)self selection]];

  [(THWPEditingController *)self p_removeNotesFromAnnotation:v3];
}

- (void)p_removeNotesFromAnnotation:(id)a3
{
  id v5 = [(THWPEditingController *)self p_annotationController];
  if (a3 && v5) {
    [v5 modifyAnnotation:a3 withNoteText:0 undoContext:0];
  }
  [self interactiveCanvasController].delegate;
  id v6 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    [v6 didRemoveNoteForAnnotation:a3];
  }
}

- (id)p_pageRepForStorage:(id)a3 withSelection:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layoutForInfo:", objc_msgSend(-[THWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "infoForModel:withSelection:", a3, a4)), "pageLayout");
  id v6 = [(THWPEditingController *)self interactiveCanvasController];

  return [v6 repForLayout:v5];
}

- (void)searchSelection:(id)a3
{
  id v4 = [(THWPEditingController *)self storage];
  id v5 = [self selection].range;
  id v7 = [v4 substringWithRange:v5, v6];
  [self interactiveCanvasController].delegate;
  id v8 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector()) {
    [v8 presentSearchResultsForString:v7];
  }
  id v9 = [(THWPEditingController *)self interactiveCanvasController];

  [v9 endEditing];
}

- (void)shareSelection:(id)a3
{
  id v4 = [(THWPEditingController *)self p_activityItemProviderWithCurrentSelection];
  [(THWPEditingController *)self targetRectForSelection:[(THWPEditingController *)self selection]];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [self interactiveCanvasController].layerHost;
  NSRange v13 = (void *)TSUProtocolCast();

  [v13 presentSharePopoverWithItemProvider:v4 targetRect:v6];
}

- (void)shareAnnotation:(id)a3
{
  id v5 = -[THWPEditingController p_activityItemProviderWithAnnotation:](self, "p_activityItemProviderWithAnnotation:");
  id v6 = [a3 annotationStorageRange];
  objc_msgSend(objc_msgSend(-[THWPEditingController repForStorage:range:](self, "repForStorage:range:", -[THWPEditingController storage](self, "storage"), v6, v7), "highlightController"), "canvasRectForAnnotation:", a3);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [self interactiveCanvasController].layerHost;
  uint64_t v16 = (void *)TSUProtocolCast();

  [v16 presentSharePopoverWithItemProvider:v5 targetRect:v9 v11 v13 v15];
}

- (id)extraMenuItems
{
  return &__NSArray0__struct;
}

- (id)p_annotationForSelection:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [a3 range];
  if (v4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v4;
  }
  id v7 = +[THAnnotationCache annotationsOrderedForVisualStacking:](THAnnotationCache, "annotationsOrderedForVisualStacking:", objc_msgSend(objc_msgSend(-[THWPEditingController storage](self, "storage"), "annotationSource"), "annotationsForRange:", v5, v6));

  return [v7 lastObject];
}

- (id)p_selectionOrAnnotation
{
  id v3 = [(THWPEditingController *)self selection];

  return [(THWPEditingController *)self p_selectionOrAnnotationFromSelection:v3];
}

- (id)p_selectionOrAnnotationFromSelection:(id)a3
{
  id v4 = -[THWPEditingController p_annotationForSelection:](self, "p_annotationForSelection:");
  if (([a3 isRange] & 1) != 0 || !v4) {
    return a3;
  }
  id v6 = [v4 annotationStorageRange];

  return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v6, v5);
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v7 = [(THWPEditingController *)self selection];
  int result = +[NSThread isMainThread];
  if (result)
  {
    id v9 = [(THWPEditingController *)self p_selectionOrAnnotation];
    double v10 = v9;
    if ("p_highlight:" == a3 && [v9 isRange])
    {
      if (![(THWPEditingController *)self createdFromAnnotationHUD])
      {
        unsigned int v11 = [(THWPEditingController *)self p_canHighlight];
        goto LABEL_28;
      }
      return -1;
    }
    if ("addNote:" == a3 && [v10 isRange])
    {
      if ([(THWPEditingController *)self createdFromAnnotationHUD]) {
        return -1;
      }
      unsigned int v11 = [(THWPEditingController *)self p_canAddNote];
LABEL_28:
      if (v11) {
        return 1;
      }
      else {
        return -1;
      }
    }
    int result = [v7 isRange];
    if (!result) {
      return result;
    }
    if ("copy:" == a3)
    {
      if (!+[TSDCanvasEditor physicalKeyboardIsSender:a4])return -1; {
    }
      }
    else if ("menuCopy:" != a3)
    {
      if ("p_showGlossary:" == a3)
      {
        unsigned int v11 = [(THWPEditingController *)self p_canShowGlossaryForSelection:v7];
      }
      else if ("translateSelection:" == a3)
      {
        unsigned int v11 = [(THWPEditingController *)self p_canTranslateSelection:v7];
      }
      else if ("showDictionary:" == a3)
      {
        unsigned int v11 = [(THWPEditingController *)self p_canShowDictionaryForSelection:v7];
      }
      else if ("searchSelection:" == a3)
      {
        unsigned int v11 = [(THWPEditingController *)self p_canSearchSelection:v7];
      }
      else if ("shareSelection:" == a3)
      {
        unsigned int v11 = [(THWPEditingController *)self p_canShareSelection:v7];
      }
      else
      {
        if ("lookUp:" == a3)
        {
          v13.receiver = self;
          v13.super_class = (Class)THWPEditingController;
          return [(THWPEditingController *)&v13 canPerformEditorAction:a3 withSender:a4];
        }
        if ("selectAll:" != a3) {
          return 0;
        }
        [self interactiveCanvasController].delegate;
        double v12 = (void *)TSUProtocolCast();
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          return -1;
        }
        unsigned int v11 = [v12 allowSelectAll];
      }
      goto LABEL_28;
    }
    unsigned int v11 = [(THWPEditingController *)self p_canCopySelection:v7];
    goto LABEL_28;
  }
  return result;
}

- (void)dismissActivePopovers
{
  v3.receiver = self;
  v3.super_class = (Class)THWPEditingController;
  [(THWPEditingController *)&v3 dismissActivePopovers];
  [self interactiveCanvasController].layerHost
  [(id)TSUProtocolCast() dismissSharePopover];
}

- (void)addHighlightWithStyle:(int)a3 forSender:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = [(THWPEditingController *)self annotationForCurrentSelection];
  id v8 = [(THWPEditingController *)self p_annotationUUIDFromSender:a4];
  if ([v8 length]
    && (!v7 || (objc_msgSend(objc_msgSend(v7, "annotationUuid"), "isEqualToString:", v8) & 1) == 0))
  {
    id v7 = [(THWPEditingController *)self annotationForUUID:v8];
  }

  [(THWPEditingController *)self highlightWithStyle:v5 annotation:v7];
}

- (void)removeNote:(id)a3
{
  id v4 = [(THWPEditingController *)self p_annotationUUIDFromSender:a3];
  if (v4)
  {
    [(THWPEditingController *)self annotationForUUID:v4];
    -[THWPEditingController p_removeNotesFromAnnotation:](self, "p_removeNotesFromAnnotation:");
  }
  else
  {
    [(THWPEditingController *)self p_removeNote];
  }
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v5 = [(THWPEditingController *)self annotationForCurrentSelection];
  id v6 = [(THWPEditingController *)self p_annotationUUIDFromSender:a3];
  if ([v6 length]
    && (!v5 || (objc_msgSend(objc_msgSend(v5, "annotationUuid"), "isEqualToString:", v6) & 1) == 0))
  {
    id v5 = [(THWPEditingController *)self annotationForUUID:v6];
  }
  id v7 = [(THWPEditingController *)self p_annotationController];
  if (v7 && v5)
  {
    [v7 destroyAnnotation:v5 undoContext:0];
  }
}

- (id)p_annotationUUIDFromSender:(id)a3
{
  objc_opt_class();
  objc_super v3 = (void *)TSUDynamicCast();
  [v3 propertyList];
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  id v7 = (void *)v4;
  objc_opt_class();
  [v7 objectForKeyedSubscript:@"annotationUUID"];
  id v8 = (void *)TSUDynamicCast();
  if ([v8 length]) {
    return v8;
  }
  else {
    return 0;
  }
}

- (id)annotationForUUID:(id)a3
{
  id result = [a3 length];
  if (result)
  {
    id v6 = [(THWPEditingController *)self p_annotationController];
    return [v6 annotationWithUuid:a3];
  }
  return result;
}

- (id)annotationForCurrentSelection
{
  id v3 = [(THWPEditingController *)self selection];

  return [(THWPEditingController *)self p_annotationForSelection:v3];
}

- (unsigned)knobTrackingTapCount
{
  if ([(THWPEditingController *)self startingInitialSelectionDrag]) {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingController;
  return [(THWPEditingController *)&v4 knobTrackingTapCount];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  [a3 unscaledLocationForICC:[self interactiveCanvasController]];
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  [self interactiveCanvasController].layerHost;
  double v10 = (void *)TSUDynamicCast();
  objc_opt_class();
  if ([v10 shouldPreventGestureFromEditingController:TSUDynamicCast()]) {
    return 0;
  }
  if (v5 != (id)TSWPImmediatePress
    || (v17.receiver = self,
        v17.super_class = (Class)THWPEditingController,
        ![(THWPEditingController *)&v17 canHandleGesture:a3]))
  {
    if (v5 == (id)TSWPTapAndTouch
      || v5 == (id)TSWPLongPress
      && ![(THWPEditingController *)self startingInitialSelectionDrag])
    {
      v15.receiver = self;
      v15.super_class = (Class)THWPEditingController;
      return [(THWPEditingController *)&v15 canHandleGesture:a3];
    }
    return 0;
  }
  uint64_t v16 = 0;
  id v11 = [self interactiveCanvasController] hitKnobAtPoint:&v16 returningRep:v7 v9];
  objc_opt_class();
  double v12 = (void *)TSUDynamicCast();
  BOOL result = 0;
  if (v11 && v12)
  {
    id v14 = [v12 storage];
    if (v14 == [(THWPEditingController *)self storage]) {
      return [self selection].isRange;
    }
    return 0;
  }
  return result;
}

- (BOOL)handleGesture:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THWPEditingController;
  BOOL v5 = -[THWPEditingController handleGesture:](&v9, "handleGesture:");
  id v6 = [a3 gestureKind];
  BOOL v7 = v6 == (id)TSWPTapAndTouch && [a3 gestureState] == 1;
  [(THWPEditingController *)self setStartingInitialSelectionDrag:v7];
  return v5;
}

- (void)highlightWithStyle:(int)a3
{
}

- (void)highlightWithStyle:(int)a3 annotation:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = (unint64_t)[(THWPEditingController *)self selection];
  id v8 = [(THWPEditingController *)self p_annotationController];
  if ((unint64_t)a4 | v7)
  {
    objc_super v9 = v8;
    if (v8)
    {
      [v8 setCurrentAnnotationStyle:v5];
      unsigned int v10 = [(id)v7 isRange];
      if (a4 || !v10)
      {
        if ((a4
           || (a4 = [(THWPEditingController *)self p_annotationForSelection:v7]) != 0)
          && [a4 annotationStyle] != v5)
        {
          [v9 modifyAnnotation:a4 withStyle:v5 undoContext:0];
        }
      }
      else
      {
        [(THWPEditingController *)self p_addHighlightForSelection:v7];
      }
    }
  }
}

- (int)currentAnnotationStyle
{
  id v3 = [(THWPEditingController *)self p_annotationController];
  if (!v3) {
    return 3;
  }
  objc_super v4 = v3;
  id v5 = [(THWPEditingController *)self selection];
  id v6 = [(THWPEditingController *)self p_annotationForSelection:v5];
  id v7 = [v5 range];
  NSUInteger v9 = v8;
  v16.NSUInteger location = (NSUInteger)[v6 annotationStorageRange];
  v16.NSUInteger length = v10;
  v15.NSUInteger location = (NSUInteger)v7;
  v15.NSUInteger length = v9;
  NSRange v11 = NSUnionRange(v15, v16);
  if (v6
    && (![v5 isRange] || objc_msgSend(v5, "range") == (id)v11.location && v12 == v11.length))
  {
    return [v6 annotationStyle];
  }
  else
  {
    return [v4 currentAnnotationStyle];
  }
}

- (int)p_currentNoteStyle
{
  id v3 = [(THWPEditingController *)self p_annotationForSelection:[(THWPEditingController *)self selection]];
  if (v3)
  {
    return [v3 annotationStyle];
  }
  else
  {
    id v5 = [(THWPEditingController *)self p_annotationController];
    if (v5)
    {
      return [v5 currentAnnotationStyle];
    }
    else
    {
      return 3;
    }
  }
}

- (BOOL)canEditTextString
{
  [self interactiveCanvasController].delegate;
  uint64_t v3 = TSUProtocolCast();
  if (v3 && (objc_super v4 = (void *)v3, (objc_opt_respondsToSelector() & 1) != 0)) {
    return [v4 disallowEditingOfTextStringWithStorage:[self storage]];
  }
  else {
    return 1;
  }
}

- (BOOL)startingInitialSelectionDrag
{
  return self->mStartingInitialSelectionDrag;
}

- (void)setStartingInitialSelectionDrag:(BOOL)a3
{
  self->mStartingInitialSelectionDrag = a3;
}

- (BOOL)createdFromAnnotationHUD
{
  return self->mCreatedFromAnnotationHUD;
}

- (void)setCreatedFromAnnotationHUD:(BOOL)a3
{
  self->mCreatedFromAnnotationHUD = a3;
}

@end