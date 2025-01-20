@interface CRLWPShapeRep
- (BOOL)allowDraggingShape;
- (BOOL)allowGenericDrags;
- (BOOL)beginEditingAtPoint:(CGPoint)a3;
- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3;
- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3 ignoreSelectionState:(BOOL)a4;
- (BOOL)canMakePathEditable;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)hasTextOverflowGlyph;
- (BOOL)i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:(id)a3;
- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5;
- (BOOL)isEditingChildRep;
- (BOOL)isReadOnlyAndInstructional;
- (BOOL)scribbleElementIsFocused;
- (BOOL)shouldCreateLockedKnobs;
- (BOOL)shouldCreateSelectionKnobs;
- (BOOL)shouldDelayScribbleFocus;
- (BOOL)shouldHitTestWithFill;
- (BOOL)shouldRenderableBeDirectAncestorOfRenderableForChild:(id)a3;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3;
- (CGPoint)originalAutosizePositionOffset;
- (CGRect)scaledScribbleEditingFrame;
- (CRLCanvasRenderable)overflowGlyphRenderable;
- (CRLContainerInfo)containerInfo;
- (CRLWPDragAndDropHelper)dragAndDropHelper;
- (CRLWPRep)textRep;
- (CRLWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4;
- (NSArray)scribbleCapableElements;
- (NSTimer)hyperlinkTimer;
- (NSUUID)scribbleIdentifier;
- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3;
- (_TtC8Freeform11CRLWPEditor)textEditor;
- (_TtC8Freeform12CRLWPStorage)storage;
- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation;
- (double)pParagraphAlignmentOffset;
- (id)additionalRenderablesOverRenderable;
- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3;
- (id)dynamicResizeDidBegin;
- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4;
- (id)overlayRenderables;
- (id)p_hyperlinkAtUnscaledPoint:(CGPoint)a3;
- (id)p_overflowKnobImage;
- (id)prepareForScribbleBlock;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (id)scribbleEditingBlock;
- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3;
- (id)shapeItem;
- (id)textEditorForDropIntoStorage:(id)a3;
- (id)willBeginWritingBlock;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)enabledKnobMask;
- (unint64_t)overflowKnobTag;
- (void)beginEditingAtBeginningOfText;
- (void)beginEditingAtRange:(id)a3;
- (void)dynamicOperationDidEnd;
- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (void)p_prepareForScribble;
- (void)p_resetOverflowGlyphRenderableIfNecessary;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setHyperlinkTimer:(id)a3;
- (void)setOriginalAutosizePositionOffset:(CGPoint)a3;
- (void)setOverflowGlyphRenderable:(id)a3;
- (void)updateChildrenFromLayout;
- (void)willBeginEditingContainedInfo:(id)a3;
- (void)willEndEditingContainedInfo:(id)a3;
@end

@implementation CRLWPShapeRep

- (CRLWPDragAndDropHelper)dragAndDropHelper
{
  if (self->_dragAndDropHelper) {
    goto LABEL_2;
  }
  v8 = [(CRLWPShapeRep *)self containedRep];

  if (!v8)
  {
    v7 = [[CRLWPDragAndDropHelper alloc] initWithOwningRep:self];
    goto LABEL_9;
  }
  if (self->_dragAndDropHelper)
  {
LABEL_2:
    uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = [(CRLCanvasRep *)self layout];
      unsigned __int8 v6 = [v5 supportsInstructionalText];

      if ((v6 & 1) == 0)
      {
        v7 = 0;
LABEL_9:
        dragAndDropHelper = self->_dragAndDropHelper;
        self->_dragAndDropHelper = v7;
      }
    }
  }
  v10 = self->_dragAndDropHelper;

  return v10;
}

- (CRLWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v9 = sub_1002469D0(v8, v6);

  if (!v9)
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFAF8);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106DD84(v10, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFB18);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeRep initWithLayout:canvas:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:56 isFatal:0 description:"bad layout class"];
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLWPShapeRep;
  v15 = [(CRLShapeRep *)&v19 initWithLayout:v6 canvas:v7];
  if (v15)
  {
    uint64_t v16 = +[NSUUID UUID];
    scribbleIdentifier = v15->_scribbleIdentifier;
    v15->_scribbleIdentifier = (NSUUID *)v16;
  }
  return v15;
}

- (CRLWPRep)textRep
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self childReps];
  v5 = [v4 crl_firstObjectPassingTest:&stru_1014CFB58];
  id v6 = sub_1002469D0(v3, v5);

  return (CRLWPRep *)v6;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPShapeRep;
  -[CRLShapeRep processChangedProperty:](&v6, "processChangedProperty:");
  v5 = [(CRLWPShapeRep *)self textRep];
  [v5 processChangedProperty:a3];
}

- (BOOL)isEditingChildRep
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  unsigned int v4 = [v3 isCanvasInteractive];

  if (v4)
  {
    v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    objc_super v6 = [v5 editorController];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007251C;
    v9[3] = &unk_1014CFB80;
    v9[4] = self;
    v9[5] = &v10;
    [v6 enumerateEditorsOnStackUsingBlock:v9];
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)shouldCreateSelectionKnobs
{
  if ([(CRLWPShapeRep *)self isEditingChildRep]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return [(CRLCanvasRep *)&v4 shouldCreateSelectionKnobs];
}

- (BOOL)shouldCreateLockedKnobs
{
  if ([(CRLWPShapeRep *)self isEditingChildRep]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return [(CRLCanvasRep *)&v4 shouldCreateLockedKnobs];
}

- (unint64_t)enabledKnobMask
{
  uint64_t v3 = [(CRLCanvasRep *)self layout];
  unsigned int v4 = [v3 autosizes];

  if (v4)
  {
    v5 = [(CRLCanvasRep *)self info];
    unsigned int v6 = [v5 textIsVertical];

    if (v6) {
      return 772;
    }
    else {
      return 592;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLWPShapeRep;
    return [(CRLShapeRep *)&v8 enabledKnobMask];
  }
}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  char v7 = [(CRLCanvasRep *)self layout];
  if (![v7 autosizes])
  {

    goto LABEL_7;
  }
  BOOL v8 = sub_100289AF0(a4);

  if (!v8)
  {
LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)CRLWPShapeRep;
    return [(CRLCanvasRep *)&v12 newSelectionKnobForType:a3 tag:a4];
  }
  v9 = [CRLCanvasKnob alloc];
  double y = CGPointZero.y;

  return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v9, "initWithType:position:radius:tag:onRep:", 3, a4, self, CGPointZero.x, y, 15.0);
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3
{
  return [(CRLWPShapeRep *)self canBeginEditingChildRepOnDoubleTap:a3 ignoreSelectionState:0];
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3 ignoreSelectionState:(BOOL)a4
{
  id v6 = a3;
  char v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v8 = [v7 editorController];
  v9 = [v8 currentEditors];

  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    BOOL v26 = a4;
    objc_super v12 = v7;
    id v13 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![v16 canBeginEditingRepOnDoubleTap:self])
        {
          int v17 = 0;
          goto LABEL_12;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    int v17 = 1;
LABEL_12:
    id v6 = v13;
    char v7 = v12;
    a4 = v26;
  }
  else
  {
    int v17 = 1;
  }

  v18 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v19 = [v18 editingDisabled];

  if (v17
    && !a4
    && [(CRLWPShapeRep *)self i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:v6])
  {
    int v17 = v19;
  }
  if (((v17 ^ 1 | v19) & 1) != 0 || a4)
  {
    if (!v17) {
      goto LABEL_21;
    }
  }
  else
  {
    v20 = [(CRLCanvasRep *)self layout];
    unsigned __int8 v21 = [v20 isInTopLevelContainerForEditing];

    if ((v21 & 1) == 0)
    {
LABEL_21:
      LOBYTE(v22) = 0;
      goto LABEL_30;
    }
  }
  id v23 = [(CRLWPShapeRep *)self containedRep];
  if (v23 == v6)
  {
    v24 = [(CRLShapeRep *)self shapeLayout];
    if ([v24 pathIsLineSegment]) {
      LOBYTE(v22) = 0;
    }
    else {
      unsigned int v22 = ![(CRLCanvasRep *)self isLocked];
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }

LABEL_30:
  return v22;
}

- (void)updateChildrenFromLayout
{
  v13.receiver = self;
  v13.super_class = (Class)CRLWPShapeRep;
  [(CRLCanvasRep *)&v13 updateChildrenFromLayout];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  unsigned int v4 = [v3 layout];
  v5 = [(CRLCanvasRep *)self layout];
  id v6 = [v5 textLayout];

  if (v4 != v6)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFBA0);
    }
    BOOL v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106DE30(v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFBC0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeRep updateChildrenFromLayout]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 180, 0, "expected equality between %{public}s and %{public}s", "self.containedRep.layout", "self.layout.textLayout");
  }
  objc_super v12 = [(CRLWPShapeRep *)self containedRep];
  [v12 updateChildrenFromLayout];
}

- (BOOL)beginEditingAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLWPShapeRep *)self shapeItem];
  int v7 = [(CRLCanvasRep *)self interactiveCanvasController];
  BOOL v8 = +[CRLWPEditor canEditTextIn:v6 using:v7];

  if (v8)
  {
    v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v10 = [v9 hitRep:x, y];
    id v11 = [v10 repForSelecting];
    objc_super v12 = v11;
    if (!v11 || v11 == self)
    {
      int v17 = [(CRLCanvasRep *)self info];
      v18 = [v17 text];
      id v19 = [v18 length];

      if (v19)
      {
        uint64_t v20 = objc_opt_class();
        unsigned __int8 v21 = [(CRLCanvasRep *)self layout];
        v36 = sub_1002469D0(v20, v21);

        uint64_t v22 = objc_opt_class();
        id v23 = [v36 textLayout];
        v24 = sub_1002469D0(v22, v23);

        [v24 convertNaturalPointFromUnscaledCanvas:x, y];
        v35 = [v24 closestPositionTo:];
        v25 = [(CRLWPShapeRep *)self storage];
        id v26 = [v25 findRangeOfWordBackwardFromCharIndex:[v35 location] expandingRangeToEndOfWord:1];
        uint64_t v28 = v27;

        long long v29 = [(CRLCanvasRep *)self info];
        long long v30 = [v29 text];
        [(CRLWPShapeRep *)self willBeginEditingContainedInfo:v30];

        v31 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v26, v28);
        [(CRLWPShapeRep *)self beginEditingAtRange:v31];
      }
      else
      {
        v32 = [(CRLCanvasRep *)self info];
        v33 = [v32 text];
        [(CRLWPShapeRep *)self willBeginEditingContainedInfo:v33];

        [(CRLWPShapeRep *)self beginEditingAtBeginningOfText];
      }
    }
    else
    {
      objc_super v13 = [v9 canvasEditor];
      uint64_t v14 = [(CRLCanvasRep *)v12 info];
      v15 = [v13 selectionPathWithInfo:v14];
      uint64_t v16 = [v9 editorController];
      [v16 setSelectionPath:v15];
    }
  }
  return v8;
}

- (void)beginEditingAtBeginningOfText
{
  id v5 = [(CRLCanvasRep *)self info];
  uint64_t v3 = [v5 text];
  unsigned int v4 = +[CRLTextRange textRangeForStartOf:v3];
  [(CRLWPShapeRep *)self beginEditingAtRange:v4];
}

- (void)beginEditingAtRange:(id)a3
{
  id v21 = a3;
  unsigned int v4 = [(CRLWPShapeRep *)self shapeItem];
  id v5 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v6 = +[CRLWPEditor canEditTextIn:v4 using:v5];

  if (v6)
  {
    int v7 = [(CRLCanvasRep *)self info];
    BOOL v8 = +[NSSet setWithObject:v7];

    v9 = [(CRLCanvasRep *)self interactiveCanvasController];
    id v10 = [v9 selectionModelTranslator];
    id v11 = [v10 selectionPathForInfos:v8];

    id v12 = [v21 nsRange];
    uint64_t v14 = v13;
    v15 = [(CRLCanvasRep *)self info];
    uint64_t v16 = [v15 text];
    int v17 = +[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", v12, v14, 7, 1, v16);

    v18 = [v11 selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:v17];
    id v19 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v20 = [v19 editorController];
    [v20 setSelectionPath:v18 withFlags:8710];
  }
}

- (BOOL)shouldHitTestWithFill
{
  uint64_t v3 = [(CRLCanvasRep *)self info];
  if (([v3 isAutogrowingTextBox] & 1) != 0
    || (v8.receiver = self,
        v8.super_class = (Class)CRLWPShapeRep,
        [(CRLShapeRep *)&v8 shouldHitTestWithFill]))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CRLCanvasRep *)self info];
    unsigned int v6 = [v5 textStorage];
    BOOL v4 = [v6 length] != 0;
  }
  return v4;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  uint64_t v3 = -[CRLWPShapeRep p_hyperlinkAtUnscaledPoint:](self, "p_hyperlinkAtUnscaledPoint:", a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)handleEditMenuTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  -[CRLWPShapeRep p_hyperlinkAtUnscaledPoint:](self, "p_hyperlinkAtUnscaledPoint:", a4, a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v5 url];
  if (v4 && +[CRLURLLauncher canOpenURL:v4]) {
    +[CRLURLLauncher openURL:v4];
  }
}

- (id)p_hyperlinkAtUnscaledPoint:(CGPoint)a3
{
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = objc_opt_class();
  v9 = [(CRLWPShapeRep *)self textRep];
  id v10 = [v9 smartFieldAtPoint:v5, v7];
  id v11 = sub_1002469D0(v8, v10);

  return v11;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return -[CRLWPShapeRep beginEditingAtPoint:](self, "beginEditingAtPoint:", a4, a3.x, a3.y);
}

- (void)willBeginEditingContainedInfo:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLCanvasRep *)self info];
  id v6 = [v5 text];

  if (v6 == v4)
  {
    double v7 = [(CRLCanvasRep *)self layout];
    [v7 createTextLayout];

    [(CRLWPShapeRep *)self updateChildrenFromLayout];
    [(CRLCanvasRep *)self invalidateKnobs];
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (void)willEndEditingContainedInfo:(id)a3
{
  id v4 = [(CRLCanvasRep *)self info];
  id v5 = [v4 text];

  [v5 length];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (BOOL)i_currentSelectionPathPreventsEditingChildRepOnDoubleTap:(id)a3
{
  id v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = [(CRLCanvasRep *)self info];
  char v6 = [v4 currentSelectionPathContainsInfo:v5] ^ 1;

  return v6;
}

- (void)p_resetOverflowGlyphRenderableIfNecessary
{
  if (!self->_overflowGlyphRenderable) {
    goto LABEL_5;
  }
  uint64_t v3 = [(CRLCanvasRep *)self canvas];
  [v3 contentsScale];
  double v5 = v4;
  [(CRLCanvasRenderable *)self->_overflowGlyphRenderable contentsScale];
  double v7 = v6;

  if (v5 != v7)
  {
    [(CRLCanvasRenderable *)self->_overflowGlyphRenderable setDelegate:0];
    overflowGlyphRenderable = self->_overflowGlyphRenderable;
    self->_overflowGlyphRenderable = 0;
  }
  if (!self->_overflowGlyphRenderable)
  {
LABEL_5:
    id v12 = [(CRLWPShapeRep *)self p_overflowKnobImage];
    v9 = +[CRLCanvasRenderable renderable];
    id v10 = self->_overflowGlyphRenderable;
    self->_overflowGlyphRenderable = v9;

    id v11 = [(CRLCanvasRep *)self canvas];
    [v11 contentsScale];
    [self->_overflowGlyphRenderable setContents:[v12 CGImageForContentsScale:]];

    [v12 size];
    [(CRLCanvasRenderable *)self->_overflowGlyphRenderable setBounds:sub_100064070()];
    [(CRLCanvasRenderable *)self->_overflowGlyphRenderable setDelegate:self];
  }
}

- (id)p_overflowKnobImage
{
  return +[CRLImage imageNamed:@"ios-canvas-handle-overflow"];
}

- (unint64_t)overflowKnobTag
{
  v2 = [(CRLCanvasRep *)self info];
  if ([v2 textIsVertical]) {
    unint64_t v3 = 4;
  }
  else {
    unint64_t v3 = 8;
  }

  return v3;
}

- (BOOL)hasTextOverflowGlyph
{
  unint64_t v3 = [(CRLCanvasRep *)self canvas];
  if ([v3 shouldShowTextOverflowGlyphs]
    && ![(CRLShapeRep *)self isEditingPath])
  {
    double v5 = [(CRLWPShapeRep *)self textRep];
    if ([v5 isOverflowing])
    {
      v7.receiver = self;
      v7.super_class = (Class)CRLWPShapeRep;
      BOOL v4 = [(CRLShapeRep *)&v7 shouldShowKnobs];
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowSelectionHighlight
{
  if ([(CRLWPShapeRep *)self isEditingChildRep]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRep;
  return [(CRLShapeRep *)&v4 shouldShowSelectionHighlight];
}

- (id)overlayRenderables
{
  uint64_t v3 = [(CRLWPShapeRep *)self overflowKnobTag];
  objc_super v4 = [(CRLCanvasRep *)self knobForTag:v3];
  BOOL v5 = [(CRLWPShapeRep *)self hasTextOverflowGlyph];
  double v6 = [v4 renderable];
  [v6 setHidden:v5];

  v34.receiver = self;
  v34.super_class = (Class)CRLWPShapeRep;
  objc_super v7 = [(CRLShapeRep *)&v34 overlayRenderables];
  if ([(CRLWPShapeRep *)self hasTextOverflowGlyph]
    && [(CRLCanvasRep *)self isSelectedIgnoringLocking])
  {
    [(CRLWPShapeRep *)self p_resetOverflowGlyphRenderableIfNecessary];
    uint64_t v8 = [(CRLCanvasRep *)self interactiveCanvasController];
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:sub_100289A18(v3, v9, v10, v11, v12)];
    [v8 convertUnscaledToBoundsPoint:];
    double v14 = v13;
    double v16 = v15;
    [(CRLCanvasRenderable *)self->_overflowGlyphRenderable bounds];
    double v21 = sub_100065738(v17, v18, v19, v20);
    double v22 = sub_100064680(v14, v16, v21);
    double v24 = v23;
    v25 = [v8 canvas];
    [v25 contentsScale];
    double v27 = sub_100067528(v22, v24, v26);
    double v29 = sub_100064698(v27, v28, v21);
    double v31 = v30;

    -[CRLCanvasRenderable setPosition:](self->_overflowGlyphRenderable, "setPosition:", v29, v31);
    uint64_t v32 = [v7 arrayByAddingObject:self->_overflowGlyphRenderable];

    objc_super v7 = (void *)v32;
  }

  return v7;
}

- (id)additionalRenderablesOverRenderable
{
  v35.receiver = self;
  v35.super_class = (Class)CRLWPShapeRep;
  uint64_t v3 = [(CRLShapeRep *)&v35 additionalRenderablesOverRenderable];
  if ([(CRLWPShapeRep *)self hasTextOverflowGlyph]
    && ![(CRLCanvasRep *)self isSelectedIgnoringLocking])
  {
    [(CRLWPShapeRep *)self p_resetOverflowGlyphRenderableIfNecessary];
    objc_super v4 = [(CRLCanvasRep *)self interactiveCanvasController];
    uint64_t v5 = [(CRLWPShapeRep *)self overflowKnobTag];
    [(CRLCanvasRep *)self boundsForStandardKnobs];
    [(CRLCanvasRep *)self convertNaturalPointToUnscaledCanvas:sub_100289A18(v5, v6, v7, v8, v9)];
    [v4 convertUnscaledToBoundsPoint:];
    double v11 = v10;
    double v13 = v12;
    [(CRLCanvasRenderable *)self->_overflowGlyphRenderable bounds];
    double v18 = sub_100065738(v14, v15, v16, v17);
    double v19 = sub_100064680(v11, v13, v18);
    double v21 = v20;
    double v22 = [(CRLCanvasRep *)self parentRep];

    if (v22)
    {
      double v23 = [(CRLCanvasRep *)self parentRep];
      [v23 layerFrameInScaledCanvas];
      double v19 = sub_100064680(v19, v21, v24);
      double v21 = v25;
    }
    double v26 = [v4 canvas];
    [v26 contentsScale];
    double v28 = sub_100067528(v19, v21, v27);
    double v30 = sub_100064698(v28, v29, v18);
    double v32 = v31;

    -[CRLCanvasRenderable setPosition:](self->_overflowGlyphRenderable, "setPosition:", v30, v32);
    uint64_t v33 = [v3 arrayByAddingObject:self->_overflowGlyphRenderable];

    uint64_t v3 = (void *)v33;
  }

  return v3;
}

- (double)pParagraphAlignmentOffset
{
  uint64_t v3 = [(CRLWPShapeRep *)self shapeItem];
  objc_super v4 = [v3 text];
  uint64_t v5 = [v4 paragraphStyleAtParIndex:0 effectiveRange:0];

  unsigned int v6 = [v5 intValueForProperty:29];
  if (v6 == 1)
  {
    double v7 = 1.0;
  }
  else if (v6 == 2)
  {
    double v7 = 0.5;
  }
  else
  {
    double v7 = 0.0;
    if (v6 == 4)
    {
      double v8 = [(CRLWPShapeRep *)self shapeItem];
      double v9 = [v8 text];
      unsigned int v10 = [v9 isWritingDirectionRightToLeftForParagraphAtParIndex:0];

      if (v10) {
        double v7 = 1.0;
      }
      else {
        double v7 = 0.0;
      }
    }
  }

  return v7;
}

- (id)dynamicResizeDidBegin
{
  v11.receiver = self;
  v11.super_class = (Class)CRLWPShapeRep;
  uint64_t v3 = [(CRLShapeRep *)&v11 dynamicResizeDidBegin];
  objc_super v4 = [(CRLCanvasRep *)self layout];
  if ([v4 autosizes])
  {
    uint64_t v5 = [(CRLCanvasRep *)self info];
    unsigned int v6 = [v5 geometry];
    unsigned __int8 v7 = [v6 widthValid];

    if (v7) {
      goto LABEL_5;
    }
    objc_super v4 = [(CRLCanvasRep *)self layout];
    [v4 autosizePositionOffsetForFixedWidth:1 height:1];
    self->_originalAutosizePositionOffset.double x = v8;
    self->_originalAutosizePositionOffset.double y = v9;
  }

LABEL_5:

  return v3;
}

- (void)dynamicOperationDidEnd
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPShapeRep;
  [(CRLShapeRep *)&v3 dynamicOperationDidEnd];
  [(CRLCanvasRep *)self recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  uint64_t v5 = [(CRLCanvasRep *)self info];
  unsigned int v6 = [v5 geometry];

  memset(&v39, 0, sizeof(v39));
  unsigned __int8 v7 = [(CRLCanvasRep *)self layout];
  CGFloat v8 = [v7 originalPureGeometry];
  CGFloat v9 = v8;
  if (v8) {
    [v8 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v39, &t1, &t2);

  objc_super v11 = [(CRLCanvasRep *)self info];
  unsigned int v12 = [v11 textIsVertical];

  if (v12)
  {
    if ([v6 widthValid]) {
      goto LABEL_26;
    }
    double v13 = [(CRLCanvasRep *)self info];
    id v14 = [v13 verticalAlignment];

    double v15 = 0.5;
    double v16 = 0.0;
    if (v14 == (id)2) {
      double v15 = 0.0;
    }
    if (v14) {
      double v17 = v15;
    }
    else {
      double v17 = 1.0;
    }
    if ([(CRLCanvasRep *)self isBeingRotated]
      && ([v6 heightValid] & 1) == 0)
    {
      [(CRLWPShapeRep *)self pParagraphAlignmentOffset];
      double v16 = v18;
    }
    memset(&t2, 0, sizeof(t2));
    CGFloat v19 = v17;
    CGFloat v20 = v16;
  }
  else
  {
    if ([v6 heightValid]) {
      goto LABEL_26;
    }
    double v21 = [(CRLCanvasRep *)self info];
    id v22 = [v21 verticalAlignment];

    double v23 = 0.5;
    if (v22 == (id)2) {
      double v23 = 1.0;
    }
    double v24 = 0.0;
    if (v22) {
      double v25 = v23;
    }
    else {
      double v25 = 0.0;
    }
    if ([(CRLCanvasRep *)self isBeingRotated]
      && ([v6 widthValid] & 1) == 0)
    {
      [(CRLWPShapeRep *)self pParagraphAlignmentOffset];
      double v24 = v26;
    }
    memset(&t2, 0, sizeof(t2));
    CGFloat v19 = v24;
    CGFloat v20 = v25;
  }
  CGAffineTransformMakeTranslation(&t2, v19, v20);
  CGAffineTransform v35 = t2;
  CGAffineTransform v34 = v39;
  CGAffineTransformConcat(&v36, &v35, &v34);
  CGAffineTransform v39 = v36;
LABEL_26:
  unsigned int v27 = [v6 widthValid];
  unsigned int v28 = [v6 heightValid];
  unsigned __int8 v29 = [(CRLCanvasRep *)self isBeingRotated];
  if (v29) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = v12 ^ 1 | v27;
  }
  if (v29) {
    uint64_t v31 = v28;
  }
  else {
    uint64_t v31 = v12 | v28;
  }
  CGAffineTransform t2 = v39;
  double v32 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&t2 widthValid:v30 heightValid:v31];

  return v32;
}

- (BOOL)canMakePathEditable
{
  objc_super v3 = [(CRLCanvasRep *)self info];
  unsigned int v4 = [v3 isAutogrowingTextBox];

  if (v4)
  {
    uint64_t v5 = [(CRLCanvasRep *)self info];
    unsigned int v6 = [v5 text];

    BOOL v7 = [v6 length] != 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLWPShapeRep;
    return [(CRLShapeRep *)&v9 canMakePathEditable];
  }
  return v7;
}

- (CRLContainerInfo)containerInfo
{
  v2 = [(CRLCanvasRep *)self info];
  objc_super v9 = sub_100246AC8(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);

  return (CRLContainerInfo *)v9;
}

- (id)shapeItem
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CRLCanvasRep *)self info];
  uint64_t v5 = sub_1002469D0(v3, v4);

  return v5;
}

- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation
{
  v2 = [(CRLCanvasRep *)self info];
  if (sub_10006B53C(v2))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 textStorage];
  }

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (BOOL)shouldRenderableBeDirectAncestorOfRenderableForChild:(id)a3
{
  return 1;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPShapeRep;
  id v8 = -[CRLShapeRep dragOperationForDragInfo:atUnscaledPoint:](&v12, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);
  if (!v8)
  {
    objc_super v9 = [(CRLWPShapeRep *)self textRep];

    if (v9)
    {
      id v8 = 0;
    }
    else
    {
      long long v10 = [(CRLWPShapeRep *)self dragAndDropHelper];
      id v8 = [v10 dragOperationForDragInfo:v7 atUnscaledPoint:x, y];
    }
  }

  return (unint64_t)v8;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CRLWPShapeRep;
  if (-[CRLShapeRep dragOperationForDragInfo:atUnscaledPoint:](&v18, "dragOperationForDragInfo:atUnscaledPoint:", v9, x, y))
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLWPShapeRep;
    unsigned __int8 v10 = -[CRLShapeRep handleDragOperation:withDragInfo:atUnscaledPoint:](&v17, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);
  }
  else
  {
    uint64_t v11 = [(CRLWPShapeRep *)self textRep];
    if (v11
      && (objc_super v12 = (void *)v11,
          [(CRLCanvasRep *)self layout],
          double v13 = objc_claimAutoreleasedReturnValue(),
          unsigned int v14 = [v13 supportsInstructionalText],
          v13,
          v12,
          !v14))
    {
      unsigned __int8 v10 = 0;
    }
    else
    {
      double v15 = [(CRLWPShapeRep *)self dragAndDropHelper];
      unsigned __int8 v10 = [v15 handleDragOperation:a3 withDragInfo:v9 atUnscaledPoint:x, y];
    }
  }

  return v10;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  v2 = [(CRLCanvasRep *)self info];
  uint64_t v3 = [v2 textStorage];

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (BOOL)allowGenericDrags
{
  return 0;
}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  return 0;
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3
{
  uint64_t v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v5 = [(CRLCanvasRep *)self info];
  uint64_t v6 = [v5 textStorage];
  id v7 = [v4 wpSelectionClassForStorage:v6];

  return [v7 selectionWithRange:0, 0];
}

- (id)textEditorForDropIntoStorage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = [v4 parentInfo];

  id v8 = sub_1002469D0(v6, v7);

  id v9 = [v5 alloc];
  unsigned __int8 v10 = [(CRLCanvasRep *)self interactiveCanvasController];
  uint64_t v11 = [v10 editingCoordinator];
  objc_super v12 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v13 = [v9 initWithEditingCoordinator:v11 enclosingShape:v8 icc:v12];

  return v13;
}

- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5
{
  return 0;
}

- (NSArray)scribbleCapableElements
{
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  if (v3
    && (id v4 = (void *)v3,
        [(CRLWPShapeRep *)self containedRep],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [(CRLWPShapeRep *)self canBeginEditingChildRepOnDoubleTap:v5 ignoreSelectionState:1], v5, v4, !v6))
  {
    id v7 = &__NSArray0__struct;
  }
  else
  {
    id v9 = self;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }

  return (NSArray *)v7;
}

- (void)p_prepareForScribble
{
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];

  if (!v3)
  {
    id v4 = [(CRLCanvasRep *)self layout];
    [v4 createTextLayoutForScribble:1];

    [(CRLWPShapeRep *)self updateChildrenFromLayout];
    [(CRLCanvasRep *)self invalidateKnobs];
    [(CRLShapeRep *)self setNeedsDisplay];
  }
}

- (id)prepareForScribbleBlock
{
  [(CRLWPShapeRep *)self p_prepareForScribble];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  id v4 = [v3 prepareForScribbleBlock];

  return v4;
}

- (id)willBeginWritingBlock
{
  return 0;
}

- (id)scribbleEditingBlock
{
  [(CRLWPShapeRep *)self p_prepareForScribble];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  id v4 = [v3 scribbleEditingBlock];

  return v4;
}

- (CGRect)scaledScribbleEditingFrame
{
  [(CRLWPShapeRep *)self p_prepareForScribble];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  [v3 scaledScribbleEditingFrame];
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

- (BOOL)shouldDelayScribbleFocus
{
  [(CRLWPShapeRep *)self p_prepareForScribble];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  unsigned __int8 v4 = [v3 shouldDelayScribbleFocus];

  return v4;
}

- (BOOL)scribbleElementIsFocused
{
  [(CRLWPShapeRep *)self p_prepareForScribble];
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  unsigned __int8 v4 = [v3 scribbleElementIsFocused];

  return v4;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CRLWPShapeRep *)self p_prepareForScribble];
  double v8 = [(CRLWPShapeRep *)self containedRep];
  [v8 hitToleranceInsetsWithDefaultInsets:top, left, bottom, right];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.double right = v20;
  result.double bottom = v19;
  result.double left = v18;
  result.double top = v17;
  return result;
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(CRLWPShapeRep *)self allowDraggingShape])
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLWPShapeRep;
    double v6 = -[CRLCanvasRep dragItemsForBeginningDragAtPoint:](&v8, "dragItemsForBeginningDragAtPoint:", x, y);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)allowDraggingShape
{
  uint64_t v3 = [(CRLWPShapeRep *)self containedRep];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    if ([v3 isBeingEdited]) {
      LOBYTE(v5) = 0;
    }
    else {
      unsigned int v5 = ![(CRLWPShapeRep *)self isReadOnlyAndInstructional];
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isReadOnlyAndInstructional
{
  uint64_t v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 editingDisabled])
  {
    unsigned __int8 v4 = [(CRLWPShapeRep *)self containedRep];
    unsigned int v5 = [v4 layout];
    unsigned __int8 v6 = [v5 isInstructional];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (CRLCanvasRenderable)overflowGlyphRenderable
{
  return self->_overflowGlyphRenderable;
}

- (void)setOverflowGlyphRenderable:(id)a3
{
}

- (CGPoint)originalAutosizePositionOffset
{
  double x = self->_originalAutosizePositionOffset.x;
  double y = self->_originalAutosizePositionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalAutosizePositionOffset:(CGPoint)a3
{
  self->_originalAutosizePositionOffset = a3;
}

- (NSTimer)hyperlinkTimer
{
  return self->_hyperlinkTimer;
}

- (void)setHyperlinkTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinkTimer, 0);
  objc_storeStrong((id *)&self->_overflowGlyphRenderable, 0);
  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);

  objc_storeStrong((id *)&self->_dragAndDropHelper, 0);
}

@end