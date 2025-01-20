@interface TSAInteractiveCanvasController
- (BOOL)hasEmptyWPSelection;
- (BOOL)hasInspectableSelection;
- (BOOL)requiresSimilarInfos;
- (BOOL)supportsAnnotations;
- (BOOL)wantsCanvasReferenceController;
- (BOOL)wantsHyperlinkGestureRecognizer;
- (TSAAnnotationController)annotationController;
- (TSDDrawableInfo)infoBeingDragInserted;
- (id)additionalVisibleInfosForCanvas:(id)a3;
- (id)p_activeTextRep;
- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)dealloc;
- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
- (void)handleHyperlinkGesture:(id)a3;
- (void)loadDocument;
- (void)selectAll:(id)a3;
- (void)setInfoBeingDragInserted:(id)a3;
- (void)teardown;
- (void)unloadDocument;
- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
@end

@implementation TSAInteractiveCanvasController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSAInteractiveCanvasController;
  [(TSWPInteractiveCanvasController *)&v3 dealloc];
}

- (void)teardown
{
  v2.receiver = self;
  v2.super_class = (Class)TSAInteractiveCanvasController;
  [(TSWPInteractiveCanvasController *)&v2 teardown];
}

- (void)loadDocument
{
  objc_super v3 = [(TSDInteractiveCanvasController *)self documentRoot];
  v4 = [(TSKDocumentRoot *)v3 changeNotifier];

  [(TSKChangeNotifier *)v4 addObserver:self forChangeSource:v3];
}

- (void)unloadDocument
{
  objc_super v3 = [(TSDInteractiveCanvasController *)self documentRoot];
  v4 = [(TSKDocumentRoot *)v3 changeNotifier];

  [(TSKChangeNotifier *)v4 removeObserver:self forChangeSource:v3];
}

- (BOOL)wantsHyperlinkGestureRecognizer
{
  return 1;
}

- (void)handleHyperlinkGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = +[TSKApplicationDelegate sharedDelegate];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "hitField"), "url");
    [v4 openURL:v5];
  }
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)TSAInteractiveCanvasController;
  -[TSDInteractiveCanvasController asyncProcessChanges:forChangeSource:](&v15, sel_asyncProcessChanges_forChangeSource_);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
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
            objc_enumerationMutation(a3);
          }
          int v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) kind];
          if (v10 == 100)
          {
            [(TSDInteractiveCanvasController *)self recreateAllLayoutsAndReps];
          }
          else if (v10 == 3)
          {
            [(TSDInteractiveCanvasController *)self setShouldAutoscrollToSelectionAfterLayout:1];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)selectAll:(id)a3
{
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self layerHost];
  uint64_t v6 = (void *)TSUDynamicCast();
  uint64_t v7 = [v6 wantsHyperlinkGestureRecognizer];
  uint64_t v8 = (void *)[v6 hyperlinkGestureRecognizer];

  [v8 setEnabled:v7];
}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  uint64_t v5 = objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3, a4, a5), "asiOSCVC"), "knobDragGestureRecognizer");

  [v5 setEnabled:1];
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSAInteractiveCanvasController;
  id v4 = [(TSDInteractiveCanvasController *)&v8 additionalVisibleInfosForCanvas:a3];
  if (!self->super.super.mCreateRepsForOffscreenLayouts)
  {
    uint64_t v5 = [(TSAInteractiveCanvasController *)self infoBeingDragInserted];
    if (v5)
    {
      if (v4) {
        return (id)[v4 setByAddingObject:v5];
      }
      else {
        return (id)[MEMORY[0x263EFFA08] setWithObject:v5];
      }
    }
  }
  return v4;
}

- (BOOL)hasEmptyWPSelection
{
  if ([(NSSet *)[(TSDCanvasSelection *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)self canvasEditor] canvasSelection] infos] count])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    objc_opt_class();
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
    id v4 = (void *)[(id)TSUDynamicCast() selection];
    if (!v4 || (int v3 = [v4 isEmpty]) != 0) {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)requiresSimilarInfos
{
  return 1;
}

- (BOOL)hasInspectableSelection
{
  id v2 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] mostSpecificCurrentEditorOfClass:0];
  char v3 = objc_opt_respondsToSelector();
  id v4 = 0;
  if (v3) {
    id v4 = (void *)[v2 topLevelInspectorViewControllers];
  }
  return [v4 count] != 0;
}

- (id)p_activeTextRep
{
  objc_opt_class();
  [(TSDEditorController *)[(TSDInteractiveCanvasController *)self editorController] textInputEditor];
  char v3 = (void *)TSUDynamicCast();
  id v4 = (void *)[v3 storage];
  uint64_t v5 = [v3 selection];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  uint64_t v7 = v5;
  [v4 parentInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  id v8 = [(TSDInteractiveCanvasController *)self layoutForModel:v4 withSelection:v7];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self repForLayout:v9];

  return (id)TSUDynamicCast();
}

- (BOOL)wantsCanvasReferenceController
{
  return 0;
}

- (TSDDrawableInfo)infoBeingDragInserted
{
  return self->mInfoBeingDragInserted;
}

- (void)setInfoBeingDragInserted:(id)a3
{
}

- (BOOL)supportsAnnotations
{
  return self->_supportsAnnotations;
}

- (TSAAnnotationController)annotationController
{
  return self->_annotationController;
}

@end