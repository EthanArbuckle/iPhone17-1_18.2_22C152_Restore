@interface CRLPathEditor
+ (void)initialize;
- (BOOL)canAddKnobsForRep:(id)a3;
- (BOOL)canBeginEditingRepOnDoubleTap:(id)a3;
- (BOOL)canClosePathToKnob:(id)a3;
- (BOOL)canContinuePathFromKnob:(id)a3 reversed:(BOOL *)a4;
- (BOOL)canEndPathCreationWithKnob:(id)a3;
- (BOOL)canRemainDuringDragInsert;
- (BOOL)canRemainDuringSharedReadOnlyMode;
- (BOOL)canRemainDuringUserInitiatedSave;
- (BOOL)canSaveSelectionToArchivedViewState;
- (BOOL)currentCommandsPathRelated;
- (BOOL)currentShapeIsValid;
- (BOOL)handlesSpacebar;
- (BOOL)isCreatingPath;
- (BOOL)isCreatingReversed;
- (BOOL)p_shouldKeepEditingInfos:(id)a3;
- (BOOL)pathHasSelectedNodes:(unint64_t)a3;
- (BOOL)pathReturnsTrueForSelector:(SEL)a3;
- (BOOL)resetAfterRebase;
- (BOOL)resignFirstResponderWhenKeyboardHides;
- (BOOL)shouldBecomeTextInputEditor;
- (BOOL)shouldBeginTextInputWith:(id)a3;
- (BOOL)shouldCreateNewPath;
- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5;
- (BOOL)wantsDoneButtonWhenEditing;
- (BOOL)wantsRawArrowKeyEvents;
- (BOOL)wantsToInterceptDeleteEvents;
- (BOOL)wantsToReceiveTextInput;
- (BOOL)wantsVisibleKeyboard;
- (CGPoint)constrainedUnscaledPointForPathCreation:(CGPoint)a3;
- (CGPoint)p_snappedPointForCanvasBackgroundAlignmentProvider:(CGPoint)a3;
- (CRLPathEditableRep)creatingRep;
- (CRLTextInputReceiving)textInputReceiver;
- (CRLTextSelecting)textSelectionDelegate;
- (NSArray)decoratorOverlayRenderables;
- (NSArray)leadingBarButtonGroups;
- (NSArray)trailingBarButtonGroups;
- (UIInputViewController)inputAccessoryViewController;
- (_TtP8Freeform20CRLKeyInputReceiving_)keyInputReceiver;
- (id)newTrackerForKnob:(id)a3 forRep:(id)a4;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_ghostRenderable;
- (id)pathCreateBlock;
- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addKnobsForRep:(id)a3 toArray:(id)a4;
- (void)alignDrawablesByBottomEdge:(id)a3;
- (void)alignDrawablesByHorizontalCenter:(id)a3;
- (void)alignDrawablesByLeftEdge:(id)a3;
- (void)alignDrawablesByRightEdge:(id)a3;
- (void)alignDrawablesByTopEdge:(id)a3;
- (void)alignDrawablesByVerticalCenter:(id)a3;
- (void)alignNodesByEdge:(int)a3;
- (void)close:(id)a3;
- (void)closeLastSubpath;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deselectAll:(id)a3;
- (void)didBecomeCurrentEditorForEditorController:(id)a3;
- (void)didResignTextInputEditor;
- (void)distributeDrawablesHorizontally:(id)a3;
- (void)distributeDrawablesVertically:(id)a3;
- (void)distributeNodesByEdge:(int)a3;
- (void)editPathsOnPathEditableRepsWithActionString:(id)a3 usingBlock:(id)a4 filterWithBlock:(id)a5;
- (void)endMovingKnob;
- (void)endPathEditing;
- (void)insertBacktab:(id)a3;
- (void)insertTab:(id)a3;
- (void)invalidateKnobs;
- (void)join:(id)a3;
- (void)makeBezier:(id)a3;
- (void)makeSharp:(id)a3;
- (void)makeSmooth:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveDownAndModifySelection:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftAndModifySelection:(id)a3;
- (void)moveRight:(id)a3;
- (void)moveRightAndModifySelection:(id)a3;
- (void)moveUp:(id)a3;
- (void)moveUpAndModifySelection:(id)a3;
- (void)nudgeByDelta:(CGPoint)a3;
- (void)p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications;
- (void)p_commandGroupSafeEndEditing;
- (void)p_commandWillBeEnqueued:(id)a3;
- (void)p_didScroll:(id)a3;
- (void)p_groupWillBeOpened:(id)a3;
- (void)p_openCommandGroupBookkeepingAndRegisterForOpenGroupNotifications;
- (void)p_resetAfterRebase;
- (void)p_selectNextNode:(int64_t)a3;
- (void)p_setGhostStrokeColor;
- (void)selectAll:(id)a3;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)setCreatingRep:(id)a3;
- (void)setCurrentCommandsPathRelated:(BOOL)a3;
- (void)setIsCreatingPath:(BOOL)a3;
- (void)setIsCreatingReversed:(BOOL)a3;
- (void)setPathCreateBlock:(id)a3;
- (void)setResetAfterRebase:(BOOL)a3;
- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3;
- (void)setShouldCreateNewPath:(BOOL)a3;
- (void)split:(id)a3;
- (void)toggleSelectedNodeToType:(int64_t)a3;
- (void)updateGhost;
- (void)updateGhostForNodeCreationAtPoint:(CGPoint)a3;
- (void)updatePositionsOfKnobs:(id)a3 forRep:(id)a4;
- (void)willResignCurrentEditor;
@end

@implementation CRLPathEditor

+ (void)initialize
{
}

- (void)dealloc
{
  [(CRLPathEditor *)self p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CRLPathEditor;
  [(CRLPathEditor *)&v3 dealloc];
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4 = a3;
  [(CRLPathEditor *)self invalidateKnobs];
  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  [v5 addDecorator:self];

  if ([(CRLPathEditor *)self isCreatingPath])
  {
    v6 = +[NSNotificationCenter defaultCenter];
    v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    [v6 addObserver:self selector:"p_didScroll:" name:@"CRLCanvasDidScrollNotification" object:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)CRLPathEditor;
  [(CRLBoardItemEditor *)&v8 didBecomeCurrentEditorForEditorController:v4];
}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 0;
}

- (_TtP8Freeform20CRLKeyInputReceiving_)keyInputReceiver
{
  return (_TtP8Freeform20CRLKeyInputReceiving_ *)sub_100246B08(self, 1, v2, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL____TtP8Freeform20CRLKeyInputReceiving_);
}

- (CRLTextInputReceiving)textInputReceiver
{
  return 0;
}

- (BOOL)wantsVisibleKeyboard
{
  return 0;
}

- (CRLTextSelecting)textSelectionDelegate
{
  return 0;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  return 0;
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 1;
}

- (BOOL)wantsToReceiveTextInput
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 0;
}

- (BOOL)handlesSpacebar
{
  return 0;
}

- (void)willResignCurrentEditor
{
  v2.receiver = self;
  v2.super_class = (Class)CRLPathEditor;
  [(CRLBoardItemEditor *)&v2 willResignCurrentEditor];
}

- (void)didResignTextInputEditor
{
  if (BYTE1(self->_lastGhostPosition.y))
  {
    uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    uint64_t v4 = [v3 commandController];

    [(CRLPathEditor *)self p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications];
    [*(id *)(&self->_willBecomeCurrentEditorAgain + 1) setCommitSelectionPath:0];
    [*(id *)(&self->_willBecomeCurrentEditorAgain + 1) setPersistableForwardSelectionPath:0];
    [v4 closeGroup];
  }
  [(CRLPathEditor *)self invalidateKnobs];
  uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  [v5 removeDecorator:self];

  if (!BYTE1(self->_creatingInfo))
  {
    uint64_t v6 = *(void **)(&self->_willBecomeCurrentEditorAgain + 1);
    *(void *)(&self->_willBecomeCurrentEditorAgain + 1) = 0;
  }
  if ([(CRLPathEditor *)self isCreatingPath])
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    [v8 removeObserver:self name:@"CRLCanvasDidScrollNotification" object:v7];
  }
}

- (void)invalidateKnobs
{
  uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v10 = [v3 repsForInfo:v9];
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) invalidateKnobs];
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (BOOL)canAddKnobsForRep:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLBoardItemEditor *)self boardItems];
  id v6 = [v4 info];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)addKnobsForRep:(id)a3 toArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 editablePathSource];
  if (v7)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v39 = v7;
    id obj = [v7 subpaths];
    id v42 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v42)
    {
      uint64_t v8 = 0;
      uint64_t v41 = *(void *)v62;
      id v49 = v5;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v62 != v41) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v61 + 1) + 8 * v9);
          id v11 = [v10 nodes];
          v46 = v10;
          uint64_t v43 = v9;
          if ([v10 isClosed])
          {
            id v12 = [v11 lastObject];
          }
          else
          {
            id v12 = 0;
          }
          long long v60 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v57 = 0u;
          id v13 = v11;
          id v47 = [v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v47)
          {
            uint64_t v48 = 0;
            uint64_t v45 = *(void *)v58;
            do
            {
              for (i = 0; i != v47; i = (char *)i + 1)
              {
                if (*(void *)v58 != v45) {
                  objc_enumerationMutation(v13);
                }
                long long v15 = (char *)i + v48;
                long long v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                long long v17 = [[CRLPathKnob alloc] initWithNode:v16 onRep:v5];
                [(CRLPathKnob *)v17 setNodeIndex:(char *)i + v48];
                [(CRLPathKnob *)v17 setSubpathIndex:v8];
                [v6 addObject:v17];
                unint64_t v18 = (unint64_t)i + v48 + 1;
                if (([v46 isClosed] & 1) != 0
                  || v18 < (unint64_t)[v13 count])
                {
                  long long v19 = objc_msgSend(v13, "objectAtIndex:", v18 % (unint64_t)objc_msgSend(v13, "count"));
                }
                else
                {
                  long long v19 = 0;
                }
                if ([v16 isSelected] && objc_msgSend(v16, "type") == (id)2)
                {
                  if (v12)
                  {
                    [v16 nodePoint];
                    double v21 = v20;
                    double v23 = v22;
                    [v16 inControlPoint];
                    if (v21 != v25 || v23 != v24)
                    {
                      v26 = [[CRLPathKnob alloc] initWithInControlForNode:v16 onRep:v5];

                      [(CRLPathKnob *)v26 setNodeIndex:v15];
                      [(CRLPathKnob *)v26 setSubpathIndex:v8];
                      [v6 addObject:v26];
                      long long v17 = v26;
                      id v5 = v49;
                    }
                  }
                  if ([(CRLPathEditor *)self isCreatingPath] || v19)
                  {
                    [v16 nodePoint];
                    double v28 = v27;
                    double v30 = v29;
                    [v16 outControlPoint];
                    if (v28 != v32 || v30 != v31)
                    {
                      v33 = [[CRLPathKnob alloc] initWithOutControlForNode:v16 onRep:v5];

                      [(CRLPathKnob *)v33 setNodeIndex:v15];
                      [(CRLPathKnob *)v33 setSubpathIndex:v8];
                      [v6 addObject:v33];
                      long long v17 = v33;
                      id v5 = v49;
                    }
                  }
                }
                v50[0] = _NSConcreteStackBlock;
                v50[1] = 3221225472;
                v50[2] = sub_1001C1A78;
                v50[3] = &unk_1014DECA8;
                v50[4] = v16;
                id v51 = v5;
                id v52 = v19;
                id v34 = v12;
                id v53 = v34;
                v55 = (char *)i + v48;
                uint64_t v56 = v8;
                id v54 = v6;
                id v35 = v19;
                v36 = objc_retainBlock(v50);
                v37 = v36;
                if (v35)
                {
                  v38 = ((void (*)(void *, uint64_t))v36[2])(v36, 22);
                  [v38 setTValue:0.5];
                }
                id v12 = v16;

                id v5 = v49;
              }
              id v47 = [v13 countByEnumeratingWithState:&v57 objects:v65 count:16];
              v48 += (uint64_t)i;
            }
            while (v47);
          }

          ++v8;
          uint64_t v9 = v43 + 1;
        }
        while ((id)(v43 + 1) != v42);
        id v42 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v42);
    }

    [(CRLPathEditor *)self updatePositionsOfKnobs:v6 forRep:v5];
    uint64_t v7 = v39;
  }
}

- (void)updatePositionsOfKnobs:(id)a3 forRep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  long long v8 = 0uLL;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v6)
  {
    [v6 naturalToEditablePathSpaceTransform];
    long long v8 = 0uLL;
  }
  long long v21 = v8;
  long long v22 = v8;
  long long v19 = v8;
  long long v20 = v8;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v13);
        uint64_t v15 = objc_opt_class();
        long long v16 = sub_1002469D0(v15, v14);
        long long v17 = v16;
        if (v16)
        {
          v18[0] = v23;
          v18[1] = v24;
          v18[2] = v25;
          [v16 updatePositionWithTransform:v18];
        }

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v11);
  }
}

- (id)newTrackerForKnob:(id)a3 forRep:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CRLPathKnobTracker alloc] initWithRep:v5 knob:v6];

  return v7;
}

- (void)editPathsOnPathEditableRepsWithActionString:(id)a3 usingBlock:(id)a4 filterWithBlock:(id)a5
{
  id v8 = a3;
  double v29 = (void (**)(id, void *))a4;
  id v9 = (unsigned int (**)(id, void *))a5;
  [(CRLPathEditor *)self setCurrentCommandsPathRelated:1];
  id v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v11 = [v10 commandController];

  [v11 openGroup];
  double v28 = v11;
  [v11 setCurrentGroupActionString:v8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(CRLBoardItemEditor *)self boardItems];
  id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        long long v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        unint64_t v18 = [v17 repForInfo:v16];
        uint64_t v19 = objc_opt_class();
        long long v25 = sub_100246DEC(v18, v19, 1, v20, v21, v22, v23, v24, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);

        if (v25 && v9[2](v9, v25))
        {
          [v25 dynamicOperationDidBeginWithRealTimeCommands:0];
          [v25 dynamicMovePathKnobDidBegin];
          v26 = [v25 editablePathSource];
          double v27 = [[CRLEditableBezierPathSourceMorphInfo alloc] initWithEditableBezierPathSource:v26];
          v29[2](v29, v25);
          [v26 morphWithMorphInfo:v27];
          [v25 dynamicMovePathKnobDidEndWithTracker:0];
          [v25 dynamicOperationDidEnd];
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }

  [v28 closeGroup];
  [(CRLPathEditor *)self setCurrentCommandsPathRelated:0];
}

- (void)selectAll:(id)a3
{
  id v5 = +[NSBundle mainBundle];
  id v4 = [v5 localizedStringForKey:@"Select All" value:0 table:@"UndoStrings"];
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v4 usingBlock:&stru_1014DECE8 filterWithBlock:&stru_1014DED28];
}

- (void)deselectAll:(id)a3
{
  id v5 = +[NSBundle mainBundle];
  id v4 = [v5 localizedStringForKey:@"Deselect All" value:0 table:@"UndoStrings"];
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v4 usingBlock:&stru_1014DED48 filterWithBlock:&stru_1014DED68];
}

- (id)p_ghostRenderable
{
  uint64_t v3 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  if (!v3)
  {
    uint64_t v4 = +[CRLCanvasShapeRenderable renderable];
    id v5 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
    *(void *)(&self->super.mIsChangingStrokeWidth + 1) = v4;

    [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setLineWidth:2.0];
    id v6 = +[CRLColor colorWithWhite:0.0 alpha:0.3];
    [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setStrokeColor:[v6 CGColor]];

    [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setFillColor:0];
    [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setZPosition:-1.0];
    uint64_t v3 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  }

  return v3;
}

- (void)p_setGhostStrokeColor
{
  uint64_t v3 = [(CRLPathEditor *)self creatingRep];
  uint64_t v4 = [v3 layout];
  id v10 = [v4 stroke];

  if (v10)
  {
    id v5 = [v10 color];
    [v5 alphaComponent];
    uint64_t v7 = [v5 colorWithAlphaComponent:v6 * 0.3];
  }
  else
  {
    uint64_t v7 = +[CRLColor colorWithWhite:0.0 alpha:0.3];
  }
  id v8 = [v7 CGColor];
  id v9 = [(CRLPathEditor *)self p_ghostRenderable];
  [v9 setStrokeColor:v8];
}

- (NSArray)decoratorOverlayRenderables
{
  [(CRLPathEditor *)self p_setGhostStrokeColor];
  uint64_t v3 = [(CRLPathEditor *)self p_ghostRenderable];
  double v6 = v3;
  uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return (NSArray *)v4;
}

- (CRLPathEditableRep)creatingRep
{
  if (*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
  {
    uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    uint64_t v4 = [v3 repForInfo:*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) createIfNeeded:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (CRLPathEditableRep *)v4;
}

- (void)setCreatingRep:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 info];

  sub_1002469D0(v5, v6);
  id obj = (CRLPathKnob *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = obj;
  if (obj != *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
  {
    objc_storeStrong((id *)((char *)&self->_hoveringKnob + 1), obj);
    uint64_t v7 = obj;
  }
}

- (void)setIsCreatingPath:(BOOL)a3
{
  if (BYTE1(self->_insertSelectionBehavior) != a3)
  {
    BOOL v3 = a3;
    BYTE1(self->_insertSelectionBehavior) = a3;
    id v6 = +[NSNotificationCenter defaultCenter];
    [(CRLBoardItemEditor *)self interactiveCanvasController];
    if (v3) {
      uint64_t v5 = {;
    }
      [v6 addObserver:self selector:"p_didScroll:" name:@"CRLCanvasDidScrollNotification" object:v5];
    }
    else {
      uint64_t v5 = {;
    }
      [v6 removeObserver:self name:@"CRLCanvasDidScrollNotification" object:v5];
    }
  }
}

- (void)p_didScroll:(id)a3
{
  if ([(CRLPathEditor *)self isCreatingPath])
  {
    if (*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1))
    {
      id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      uint64_t v5 = [v4 repForInfo:*(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) createIfNeeded:0];

      if (!v5)
      {
        if (!+[NSThread isMainThread])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DED88);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010860BC();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DEDA8);
          }
          id v6 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v6);
          }
          uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_didScroll:]");
          id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:499 isFatal:0 description:"This operation must only be performed on the main thread."];
        }
        [(CRLPathEditor *)self endPathEditing];
      }
    }
  }
}

- (CGPoint)constrainedUnscaledPointForPathCreation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v29 = 0;
  id v8 = [v7 hitKnobAtPoint:1 inputType:&v29 returningRep:x y];
  id v9 = sub_1002469D0(v6, v8);

  if (!v9)
  {
    id v10 = [(CRLPathEditor *)self creatingRep];
    id v11 = [v10 editablePathSource];

    id v12 = [v11 nodes];
    if ([v12 count])
    {
      id v13 = [(CRLPathEditor *)self creatingRep];
      [v13 convertNaturalPointFromUnscaledCanvas:x y];
      double v15 = v14;
      double v17 = v16;
      if ([(CRLPathEditor *)self isCreatingReversed]) {
        [v12 objectAtIndexedSubscript:0];
      }
      else {
      unint64_t v18 = [v12 lastObject];
      }
      [v18 nodePoint];
      double v20 = v19;
      double v21 = sub_100064680(v15, v17, v19);
      double v23 = sub_10006631C(v21, v22);
      [v13 convertNaturalPointToUnscaledCanvas:sub_100064698(v23, v24, v20)];
      double x = v25;
      double y = v26;
    }
  }
  -[CRLPathEditor p_snappedPointForCanvasBackgroundAlignmentProvider:](self, "p_snappedPointForCanvasBackgroundAlignmentProvider:", x, y);
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (void)endMovingKnob
{
  if (BYTE1(self->_lastGhostPosition.y) && [(CRLPathEditor *)self isCreatingPath])
  {
    BOOL v3 = [(CRLPathEditor *)self creatingRep];
    id v9 = [v3 editablePathSource];

    id v4 = [v9 nodes];
    id v5 = [v4 count];

    if ((unint64_t)v5 >= 2)
    {
      uint64_t v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      uint64_t v7 = [v6 commandController];

      [(CRLPathEditor *)self p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications];
      [v7 closeGroup];
      id v8 = *(void **)(&self->_willBecomeCurrentEditorAgain + 1);
      *(void *)(&self->_willBecomeCurrentEditorAgain + 1) = 0;
    }
  }
}

- (void)p_resetAfterRebase
{
  [(CRLPathEditor *)self setResetAfterRebase:0];
  BOOL v3 = [(CRLBoardItemEditor *)self boardItems];
  id v4 = [v3 count];

  if (v4 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEDC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101086144();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEDE8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_resetAfterRebase]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:741 isFatal:0 description:"Can only reset editing state if we have a single info selected"];
  }
  id v8 = [(CRLBoardItemEditor *)self boardItems];
  id v9 = [v8 anyObject];
  id v10 = *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1);
  *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) = v9;

  BYTE1(self->_insertSelectionBehavior) = 1;
}

- (void)updateGhostForNodeCreationAtPoint:(CGPoint)a3
{
  -[CRLPathEditor p_snappedPointForCanvasBackgroundAlignmentProvider:](self, "p_snappedPointForCanvasBackgroundAlignmentProvider:", a3.x, a3.y);
  if (*(void *)(&self->super.mIsChangingStrokeWidth + 1))
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    if ([(CRLPathEditor *)self isCreatingPath])
    {
      if ([(CRLPathEditor *)self resetAfterRebase]) {
        [(CRLPathEditor *)self p_resetAfterRebase];
      }
      *(CRLCanvasShapeRenderable **)((char *)&self->_ghostPathRenderable + 1) = v6;
      *(void *)((char *)&self->_lastGhostPosition.x + 1) = v7;
      [(CRLPathEditor *)self updateGhost];
    }
  }
}

- (void)updateGhost
{
  BOOL v3 = [(CRLPathEditor *)self creatingRep];
  if (!v3 || ![(CRLPathEditor *)self isCreatingPath])
  {
    id v4 = 0;
    goto LABEL_7;
  }
  id v4 = [v3 editablePathSource];
  uint64_t v5 = [v4 bezierPath];
  uint64_t v6 = (uint64_t)[v5 elementCount];

  if (v6 < 1)
  {
LABEL_7:
    id v11 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = objc_opt_class();
  id v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v9 = (double *)((char *)&self->_ghostPathRenderable + 1);
  uint64_t v54 = 0;
  id v10 = [v8 hitKnobAtPoint:1 inputType:&v54 returningRep:*(double *)((char *)&self->_ghostPathRenderable + 1) *(double *)((char *)&self->_lastGhostPosition.x + 1)];
  id v11 = sub_1002469D0(v7, v10);

  id v12 = [v4 subpaths];
  id v13 = [v12 lastObject];

  if (([v13 isClosed] & 1) == 0)
  {
    double v16 = [v13 nodes];
    if ([v16 count])
    {
    }
    else
    {
      double v17 = [v4 subpaths];
      id v18 = [v17 count];

      if ((unint64_t)v18 >= 2)
      {
        double v19 = [v4 subpaths];
        double v20 = [v4 subpaths];
        double v21 = [v19 objectAtIndex:[v20 count] - 2];

        unsigned int v14 = [v21 isClosed] ^ 1;
        id v13 = v21;
        goto LABEL_15;
      }
    }
    unsigned int v14 = 1;
    goto LABEL_15;
  }
  unsigned int v14 = 0;
LABEL_15:
  if (v11 && ![(CRLPathEditor *)self canClosePathToKnob:v11])
  {

    goto LABEL_8;
  }

  if (!v14)
  {
LABEL_8:
    +[CATransaction begin];
    +[CATransaction setAnimationDuration:0.0];
    [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setPath:0];
    +[CATransaction commit];
    id v15 = v4;
    goto LABEL_9;
  }
  id v15 = [v4 copy];

  long double v22 = [v15 subpaths];
  double v23 = [v22 lastObject];

  double v24 = [[CRLEditableBezierPathSourceMorphInfo alloc] initWithEditableBezierPathSource:v15];
  if (v11 && [(CRLPathEditor *)self canClosePathToKnob:v11])
  {
    id v25 = [v15 firstNode];
    if ([v25 type] == (id)3) {
      [v25 setType:1];
    }
    [v15 closePath];
  }
  else if ([(CRLPathEditor *)self isCreatingReversed])
  {
    double v26 = [v23 nodes];
    id v25 = [v26 mutableCopy];

    [v3 convertNaturalPointFromUnscaledCanvas:*v9, *(double *)((char *)&self->_lastGhostPosition.x + 1)];
    double v27 = +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:");
    [v25 insertObject:v27 atIndex:0];

    [v23 setNodes:v25];
  }
  else
  {
    [v3 convertNaturalPointFromUnscaledCanvas:*v9, *(double *)((char *)&self->_lastGhostPosition.x + 1)];
    +[CRLBezierNode bezierNodeWithPoint:](CRLBezierNode, "bezierNodeWithPoint:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    [v23 addNode:v25];
  }

  [v15 morphWithMorphInfo:v24];
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:0.0];
  double v28 = +[CRLBezierPath bezierPath];
  uint64_t v29 = [v23 nodes];
  double v30 = (char *)[v29 count] - 1;

  long long v31 = [v23 nodes];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1001C335C;
  v53[3] = &unk_1014DEE08;
  v53[4] = v30;
  id v32 = [v31 indexOfObjectWithOptions:2 passingTest:v53];

  if (v32 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v33 = 0;
  }
  else {
    id v33 = v32;
  }
  [v23 appendToBezierPath:v28 selectedNodesOnly:0 fromIndex:v33];
  id v34 = [v28 elementCount];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = 0;
    while (1)
    {
      id v37 = [v28 elementAtIndex:v36 associatedPoints:&v55];
      if ((unint64_t)v37 < 2) {
        break;
      }
      if (v37 == (id)2)
      {
        double v40 = (double)rand() * 4.65661288e-15;
        rand();
        double v57 = sub_100064698(v57, v58, v40);
        double v58 = v41;
        goto LABEL_36;
      }
LABEL_37:
      if (v35 == (id)++v36) {
        goto LABEL_38;
      }
    }
    double v38 = (double)rand() * 4.65661288e-15;
    rand();
    double v55 = sub_100064698(v55, v56, v38);
    double v56 = v39;
LABEL_36:
    [v28 setAssociatedPoints:&v55 atIndex:v36];
    goto LABEL_37;
  }
LABEL_38:
  id v42 = v28;
  [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setPath:[v42 CGPath]];
  uint64_t v43 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  [v43 viewScale];
  CGFloat v45 = v44;

  v46 = [v3 layout];
  id v47 = v46;
  if (v46) {
    [v46 pureTransformInRoot];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransformMakeScale(&t2, v45, v45);
  CGAffineTransformConcat(&v52, &t1, &t2);
  uint64_t v48 = *(void **)(&self->super.mIsChangingStrokeWidth + 1);
  CGAffineTransform v49 = v52;
  [v48 setAffineTransform:&v49];

  [*(id *)(&self->super.mIsChangingStrokeWidth + 1) setLineWidth:2.0 / v45];
  +[CATransaction commit];

LABEL_9:
}

- (void)closeLastSubpath
{
  if ([(CRLPathEditor *)self isCreatingPath])
  {
    BOOL v3 = [(CRLPathEditor *)self creatingRep];
    id v4 = +[NSBundle mainBundle];
    uint64_t v5 = [v4 localizedStringForKey:@"Close Path" value:0 table:@"UndoStrings"];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001C3504;
    v7[3] = &unk_1014DEE50;
    id v8 = v3;
    id v6 = v3;
    [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v5 usingBlock:&stru_1014DEE28 filterWithBlock:v7];
  }
}

- (BOOL)canContinuePathFromKnob:(id)a3 reversed:(BOOL *)a4
{
  id v5 = a3;
  if ([v5 tag] == (id)17)
  {
    id v6 = [v5 pathEditableRep];
    uint64_t v7 = [v6 editablePathSource];

    id v8 = [v7 subpaths];
    id v9 = [v8 objectAtIndexedSubscript:[v5 subpathIndex]];

    id v10 = [v5 nodeIndex];
    id v11 = [v9 nodes];
    BOOL v12 = v10 == (char *)[v11 count] - 1 || [v5 nodeIndex] == 0;

    if (a4) {
      *a4 = [v5 nodeIndex] == 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)canClosePathToKnob:(id)a3
{
  id v4 = a3;
  if ([(CRLPathEditor *)self isCreatingPath])
  {
    if ([v4 tag] == (id)17)
    {
      id v5 = [v4 pathEditableRep];
      id v6 = [(CRLPathEditor *)self creatingRep];

      if (v5 == v6)
      {
        id v9 = [v4 pathEditableRep];
        id v10 = [v9 editablePathSource];

        id v11 = (char *)[v4 subpathIndex];
        BOOL v12 = [v10 subpaths];
        id v13 = (char *)[v12 count] - 1;

        if (v11 != v13)
        {
          BOOL v7 = 0;
LABEL_16:

          goto LABEL_5;
        }
        unsigned int v14 = [v10 subpaths];
        id v15 = [v14 lastObject];

        LODWORD(v14) = [(CRLPathEditor *)self isCreatingReversed];
        double v16 = (char *)[v4 nodeIndex];
        double v17 = v16;
        if (v14)
        {
          id v18 = [v15 nodes];
          double v19 = (char *)[v18 count] - 1;

          if (v17 != v19) {
            goto LABEL_13;
          }
        }
        else if (v16)
        {
          goto LABEL_13;
        }
        if (([v15 isClosed] & 1) == 0)
        {
          double v20 = [v15 nodes];
          BOOL v7 = (unint64_t)[v20 count] > 1;

          goto LABEL_15;
        }
LABEL_13:
        BOOL v7 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
  }
  BOOL v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)canEndPathCreationWithKnob:(id)a3
{
  id v4 = a3;
  if ([(CRLPathEditor *)self isCreatingPath])
  {
    if ([v4 tag] == (id)17)
    {
      id v5 = [v4 pathEditableRep];
      id v6 = [(CRLPathEditor *)self creatingRep];

      if (v5 == v6)
      {
        id v9 = [v4 pathEditableRep];
        id v10 = [v9 editablePathSource];

        id v11 = (char *)[v4 subpathIndex];
        BOOL v12 = [v10 subpaths];
        id v13 = (char *)[v12 count] - 1;

        if (v11 != v13)
        {
          LOBYTE(v7) = 0;
LABEL_14:

          goto LABEL_5;
        }
        unsigned int v14 = [v10 subpaths];
        id v15 = [v14 lastObject];

        LODWORD(v14) = [(CRLPathEditor *)self isCreatingReversed];
        double v16 = (char *)[v4 nodeIndex];
        double v17 = v16;
        if (v14)
        {
          if (v16)
          {
LABEL_9:
            LOBYTE(v7) = 0;
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          id v18 = [v15 nodes];
          double v19 = (char *)[v18 count] - 1;

          if (v17 != v19) {
            goto LABEL_9;
          }
        }
        unsigned int v7 = [v15 isClosed] ^ 1;
        goto LABEL_13;
      }
    }
  }
  LOBYTE(v7) = 0;
LABEL_5:

  return v7;
}

- (BOOL)currentShapeIsValid
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = objc_opt_class();
  double v17 = sub_1002469D0(v16, v13);
  if (v17)
  {
    id v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLPathEditor;
    id v18 = [(CRLBoardItemEditor *)&v20 selectionWillChangeFromSelection:v12 toSelection:v13 withFlags:a5 inSelectionPath:v14 withNewEditors:v15];
  }

  return v18;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  id v11 = sub_1002469D0(v10, v9);
  if (!v11)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLPathEditor;
    [(CRLBoardItemEditor *)&v12 selectionDidChangeFromSelection:v8 toSelection:v9 withFlags:a5];
  }
}

- (BOOL)p_shouldKeepEditingInfos:(id)a3
{
  id v4 = a3;
  id v6 = [(CRLBoardItemEditor *)self boardItems];
  unsigned __int8 v5 = [v6 isEqual:v4];

  LOBYTE(v6) = 1;
  if (v4 && (v5 & 1) == 0 && [v4 count])
  {
    if ([v4 count] == (id)1
      && ([(CRLBoardItemEditor *)self boardItems],
          unsigned int v7 = objc_claimAutoreleasedReturnValue(),
          id v8 = [v7 count],
          v7,
          v8 == (id)1))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = [v4 anyObject];
      id v11 = sub_10024715C(v9, v10);

      id v6 = [(CRLBoardItemEditor *)self boardItems];
      objc_super v12 = [v6 anyObject];

      id v13 = [v11 id];
      id v14 = [v12 id];
      LODWORD(v6) = [v13 isEqual:v14];

      if (v6)
      {
        id v15 = +[NSSet setWithObject:v11];
        [(CRLBoardItemEditor *)self setBoardItems:v15];

        if (BYTE1(self->_insertSelectionBehavior)) {
          [(CRLPathEditor *)self setResetAfterRebase:1];
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return (char)v6;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CRLPathEditor *)self isMemberOfClass:objc_opt_class()])
  {
    id v11 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    objc_super v12 = [v11 infosForSelectionPath:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v13 = [(CRLPathEditor *)self p_shouldKeepEditingInfos:v12];
    }
    else {
      BOOL v13 = 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLPathEditor;
    BOOL v13 = [(CRLBoardItemEditor *)&v15 shouldRemainOnEditorStackForSelection:v8 inSelectionPath:v9 withNewEditors:v10];
  }

  return v13;
}

- (BOOL)canRemainDuringDragInsert
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (BOOL)canRemainDuringUserInitiatedSave
{
  return BYTE1(self->_lastGhostPosition.y) == 0;
}

- (BOOL)canRemainDuringSharedReadOnlyMode
{
  return 0;
}

- (BOOL)canSaveSelectionToArchivedViewState
{
  return 0;
}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
}

- (void)p_openCommandGroupBookkeepingAndRegisterForOpenGroupNotifications
{
  BYTE1(self->_lastGhostPosition.y) = 1;
}

- (void)p_closeCommandGroupBookkeepingAndUnregisterForOpenGroupNotifications
{
  BYTE1(self->_lastGhostPosition.y) = 0;
}

- (void)p_commandWillBeEnqueued:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_lastGhostPosition.y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEE70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010861CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEE90);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_commandWillBeEnqueued:]");
    unsigned int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1210 isFatal:0 description:"Listening to command notifications when we don't care!"];
  }
  if (![(CRLPathEditor *)self currentCommandsPathRelated]) {
    [(CRLPathEditor *)self p_commandGroupSafeEndEditing];
  }
}

- (void)p_groupWillBeOpened:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_lastGhostPosition.y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEEB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101086254();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DEED0);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_groupWillBeOpened:]");
    unsigned int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1217 isFatal:0 description:"Listening to command notifications when we don't care!"];
  }
  if (![(CRLPathEditor *)self currentCommandsPathRelated]
    && BYTE1(self->_lastGhostPosition.y))
  {
    [(CRLPathEditor *)self p_commandGroupSafeEndEditing];
  }
}

- (void)endPathEditing
{
  if ([(CRLPathEditor *)self isCreatingPath] && !BYTE1(self->_lastGhostPosition.y))
  {
    [(CRLPathEditor *)self setIsCreatingPath:0];
    BOOL v3 = *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1);
    *(CRLPathKnob **)((char *)&self->_hoveringKnob + 1) = 0;

    [(CRLPathEditor *)self updateGhost];
  }
  else
  {
    [(CRLPathEditor *)self p_commandGroupSafeEndEditing];
  }
}

- (void)p_commandGroupSafeEndEditing
{
  BOOL v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v7 = v3;
  if (BYTE1(self->_lastGhostPosition.y))
  {
    id v4 = [v3 canvasEditor];
    unsigned __int8 v5 = [v4 selectionPathWithInfos:0];
    id v6 = [v7 editorController];
    [v6 setSelectionPath:v5];
  }
  else
  {
    [v3 endEditing];
  }
}

- (void)toggleSelectedNodeToType:(int64_t)a3
{
  uint64_t v16 = v4;
  uint64_t v17 = v3;
  uint64_t v18 = v5;
  uint64_t v19 = v6;
  switch(a3)
  {
    case 0:
    case 4:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DEEF0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010862DC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DEF10);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor toggleSelectedNodeToType:]");
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1343, 0, "Unexpected node type %li", a3);

      goto LABEL_16;
    case 1:
      objc_super v12 = +[NSBundle mainBundle];
      BOOL v13 = v12;
      CFStringRef v14 = @"Make Sharp Point";
      goto LABEL_14;
    case 2:
      objc_super v12 = +[NSBundle mainBundle];
      BOOL v13 = v12;
      CFStringRef v14 = @"Make Bézier Point";
      goto LABEL_14;
    case 3:
      objc_super v12 = +[NSBundle mainBundle];
      BOOL v13 = v12;
      CFStringRef v14 = @"Make Smooth Point";
LABEL_14:
      id v10 = [v12 localizedStringForKey:v14 value:0 table:@"UndoStrings"];

      if (v10)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1001C4634;
        v15[3] = &unk_1014DEF30;
        v15[4] = a3;
        [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v10 usingBlock:v15 filterWithBlock:&stru_1014DEF50];
        [(CRLPathEditor *)self invalidateKnobs];
LABEL_16:
      }
      break;
    default:
      return;
  }
}

- (void)makeSharp:(id)a3
{
}

- (void)makeSmooth:(id)a3
{
}

- (void)makeBezier:(id)a3
{
}

- (void)split:(id)a3
{
  uint64_t v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Divide Path" value:0 table:@"UndoStrings"];
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v5 usingBlock:&stru_1014DEF70 filterWithBlock:&stru_1014DEF90];

  [(CRLPathEditor *)self invalidateKnobs];
}

- (void)join:(id)a3
{
  uint64_t v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Join" value:0 table:@"UndoStrings"];
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v5 usingBlock:&stru_1014DEFB0 filterWithBlock:&stru_1014DEFD0];

  [(CRLPathEditor *)self invalidateKnobs];
}

- (void)close:(id)a3
{
  uint64_t v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"Close Path" value:0 table:@"UndoStrings"];
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v5 usingBlock:&stru_1014DEFF0 filterWithBlock:&stru_1014DF010];

  [(CRLPathEditor *)self invalidateKnobs];
}

- (void)alignDrawablesByLeftEdge:(id)a3
{
}

- (void)alignDrawablesByRightEdge:(id)a3
{
}

- (void)alignDrawablesByVerticalCenter:(id)a3
{
}

- (void)alignDrawablesByTopEdge:(id)a3
{
}

- (void)alignDrawablesByBottomEdge:(id)a3
{
}

- (void)alignDrawablesByHorizontalCenter:(id)a3
{
}

- (void)distributeDrawablesHorizontally:(id)a3
{
}

- (void)distributeDrawablesVertically:(id)a3
{
}

- (BOOL)pathHasSelectedNodes:(unint64_t)a3
{
  uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v4 = [v3 infosForCurrentSelectionPath];
  id v33 = [v4 countByEnumeratingWithState:&v39 objects:v54 count:16];
  if (v33)
  {
    uint64_t v5 = &off_101557000;
    uint64_t v6 = *(void *)v40;
    uint64_t v32 = *(void *)v40;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [v3 repForInfo:*(void *)(*((void *)&v39 + 1) + 8 * (void)v7)];
        uint64_t v9 = objc_opt_class();
        objc_super v15 = sub_100246DEC(v8, v9, 1, v10, v11, v12, v13, v14, (uint64_t)v5[439]);

        if (!v15)
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DF030);
          }
          uint64_t v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v45 = v16;
            __int16 v46 = 2082;
            id v47 = "-[CRLPathEditor pathHasSelectedNodes:]";
            __int16 v48 = 2082;
            CGAffineTransform v49 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m";
            __int16 v50 = 1024;
            int v51 = 1444;
            __int16 v52 = 2082;
            id v53 = "rep";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DF050);
          }
          uint64_t v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v28 = v18;
            uint64_t v29 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v45 = v16;
            __int16 v46 = 2114;
            id v47 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          uint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor pathHasSelectedNodes:]");
          objc_super v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1444, 0, "invalid nil value for '%{public}s'", "rep");
        }
        double v21 = [v15 editablePathSource];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long double v22 = [v21 nodes];
        id v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v36;
          unint64_t v26 = a3;
          while (2)
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              if ([*(id *)(*((void *)&v35 + 1) + 8 * i) isSelected])
              {
                if (!--v26)
                {

                  BOOL v30 = 1;
                  goto LABEL_30;
                }
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        id v7 = (char *)v7 + 1;
        uint64_t v6 = v32;
        uint64_t v5 = &off_101557000;
      }
      while (v7 != v33);
      BOOL v30 = 0;
      id v33 = [v4 countByEnumeratingWithState:&v39 objects:v54 count:16];
    }
    while (v33);
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_30:

  return v30;
}

- (void)alignNodesByEdge:(int)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Left";
      goto LABEL_9;
    case 1:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Center";
      goto LABEL_9;
    case 2:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Right";
      goto LABEL_9;
    case 3:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Top";
      goto LABEL_9;
    case 4:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Middle";
      goto LABEL_9;
    case 5:
      uint64_t v5 = +[NSBundle mainBundle];
      uint64_t v6 = v5;
      CFStringRef v7 = @"Align Bottom";
LABEL_9:
      id v8 = [v5 localizedStringForKey:v7 value:0 table:@"UndoStrings"];

      break;
    default:
      id v8 = 0;
      break;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C50DC;
  v9[3] = &unk_1014DF070;
  int v10 = a3;
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v8 usingBlock:v9 filterWithBlock:&stru_1014DF090];
  [(CRLPathEditor *)self invalidateKnobs];
}

- (void)distributeNodesByEdge:(int)a3
{
  if ((a3 - 3) < 3)
  {
    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"Distribute Vertically";
  }
  else
  {
    if (a3 > 2)
    {
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"Distribute Horizontally";
  }
  id v8 = [v5 localizedStringForKey:v7 value:0 table:@"UndoStrings"];

LABEL_6:
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C5600;
  v9[3] = &unk_1014DF070;
  int v10 = a3;
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v8 usingBlock:v9 filterWithBlock:&stru_1014DF0F0];
  [(CRLPathEditor *)self invalidateKnobs];
}

- (void)delete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"Delete" value:0 table:@"UndoStrings"];

  if (BYTE1(self->_lastGhostPosition.y))
  {
    [(CRLPathEditor *)self p_commandGroupSafeEndEditing];
  }
  else if ([(CRLPathEditor *)self pathHasSelectedNodes:1])
  {
    long long v36 = v4;
    CFStringRef v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v8 = [v7 commandController];

    id v33 = v8;
    [v8 openGroup];
    long long v35 = v6;
    [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v6 usingBlock:&stru_1014DF110 filterWithBlock:&stru_1014DF130];
    long long v38 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v37 = +[NSMutableSet set];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v34 = self;
    uint64_t v9 = [(CRLBoardItemEditor *)self boardItems];
    id v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v43;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          objc_super v15 = [v38 repForInfo:v14];
          uint64_t v16 = objc_opt_class();
          long double v22 = sub_100246DEC(v15, v16, 1, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);

          id v23 = [v22 editablePathSource];
          unsigned int v24 = [v23 deletingSelectedNodesWillDeleteShape];

          if (v24) {
            [v37 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v11);
    }

    if ([v37 count])
    {
      uint64_t v25 = v34;
      unint64_t v26 = [(CRLBoardItemEditor *)v34 interactiveCanvasController];
      double v27 = [v26 canvasEditor];

      double v28 = [v27 canvasEditorHelper];
      uint64_t v29 = [v28 selectionBehaviorForDeletingBoardItems:v37];

      BOOL v30 = [v27 selectionPathWithInfos:v37];
      long long v31 = [(CRLBoardItemEditor *)v34 editorController];
      [v31 setSelectionPath:v30];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1001C5F24;
      v40[3] = &unk_1014DF158;
      v40[4] = v34;
      id v4 = v36;
      id v41 = v36;
      [v31 enumerateEditorsOnStackUsingBlock:v40];
    }
    else
    {
      uint64_t v29 = 0;
      id v4 = v36;
      uint64_t v25 = v34;
    }
    [(CRLPathEditor *)v25 invalidateKnobs];
    [v33 closeGroupWithSelectionBehavior:v29];

    uint64_t v6 = v35;
  }
  else if ([(CRLPathEditor *)self isCreatingPath])
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001C5FBC;
    v39[3] = &unk_1014DF180;
    v39[4] = self;
    [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v6 usingBlock:v39 filterWithBlock:&stru_1014DF1A0];
    uint64_t v32 = [(CRLPathEditor *)self creatingRep];
    [v32 invalidateKnobs];
  }
}

- (void)nudgeByDelta:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = +[NSBundle mainBundle];
  CFStringRef v7 = [v6 localizedStringForKey:@"Move" value:0 table:@"UndoStrings"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C6138;
  v8[3] = &unk_1014DF1C0;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  [(CRLPathEditor *)self editPathsOnPathEditableRepsWithActionString:v7 usingBlock:v8 filterWithBlock:&stru_1014DF1E0];
}

- (void)moveUp:(id)a3
{
}

- (void)moveDown:(id)a3
{
}

- (void)moveLeft:(id)a3
{
}

- (void)moveRight:(id)a3
{
}

- (void)moveUpAndModifySelection:(id)a3
{
}

- (void)moveDownAndModifySelection:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (BOOL)pathReturnsTrueForSelector:(SEL)a3
{
  uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [(CRLBoardItemEditor *)self boardItems];
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = [v5 repForInfo:*(void *)(*((void *)&v23 + 1) + 8 * v10)];
      uint64_t v12 = objc_opt_class();
      BOOL v13 = 1;
      uint64_t v19 = sub_100246DEC(v11, v12, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);

      uint64_t v20 = [v19 editablePathSource];
      id v21 = [v20 performSelector:a3];

      if (v21) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v13 = 0;
  }

  return v13;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CRLPathEditor;
  id v6 = [(CRLStyledEditor *)&v21 canPerformEditorAction:a3 withSender:a4];
  if ("alignDrawablesByLeftEdge:" == a3
    || "alignDrawablesByRightEdge:" == a3
    || "alignDrawablesByTopEdge:" == a3
    || "alignDrawablesByBottomEdge:" == a3
    || "alignDrawablesByHorizontalCenter:" == a3
    || "alignDrawablesByVerticalCenter:" == a3)
  {
    uint64_t v12 = self;
    uint64_t v13 = 2;
LABEL_55:
    unsigned int v16 = [(CRLPathEditor *)v12 pathHasSelectedNodes:v13];
    goto LABEL_56;
  }
  if ("distributeDrawablesHorizontally:" == a3 || "distributeDrawablesVertically:" == a3)
  {
    uint64_t v12 = self;
    uint64_t v13 = 3;
    goto LABEL_55;
  }
  if ("makeSmooth:" == a3 || "makeSharp:" == a3 || "makeBezier:" == a3) {
    goto LABEL_60;
  }
  if ("split:" == a3)
  {
    uint64_t v18 = "canCutAtSelectedNodes";
LABEL_66:
    unsigned int v16 = [(CRLPathEditor *)self pathReturnsTrueForSelector:v18];
LABEL_56:
    if (v16) {
      return 1;
    }
    else {
      return -1;
    }
  }
  if ("join:" == a3)
  {
    uint64_t v18 = "canConnectSelectedNodes";
    goto LABEL_66;
  }
  if ("close:" == a3)
  {
    uint64_t v18 = "canCloseSelectedNodes";
    goto LABEL_66;
  }
  int64_t v14 = 1;
  if ("moveUp:" == a3) {
    return v14;
  }
  if ("moveDown:" == a3) {
    return v14;
  }
  if ("moveLeft:" == a3) {
    return v14;
  }
  if ("moveRight:" == a3) {
    return v14;
  }
  int64_t v14 = 1;
  if ("moveUpAndModifySelection:" == a3
    || "moveDownAndModifySelection:" == a3
    || "moveLeftAndModifySelection:" == a3
    || "moveRightAndModifySelection:" == a3)
  {
    return v14;
  }
  if ("deleteBackward:" == a3
    || "deleteForward:" == a3
    || "deleteToBeginningOfLine:" == a3
    || "deleteToEndOfLine:" == a3
    || "deleteToBeginningOfParagraph:" == a3
    || "deleteToEndOfParagraph:" == a3
    || "deleteWordBackward:" == a3
    || "deleteWordForward:" == a3
    || "delete:" == a3)
  {
LABEL_60:
    if ([(CRLPathEditor *)self pathHasSelectedNodes:1]) {
      return 1;
    }
    else {
      return -1;
    }
  }
  int64_t v14 = 1;
  if ("insertTab:" != a3 && "insertBacktab:" != a3)
  {
    int64_t v15 = (int64_t)v6;
    if ("selectParent:" == a3)
    {
      uint64_t v19 = [(CRLBoardItemEditor *)self editorController];
      uint64_t v20 = [v19 mostSpecificCurrentEditorOfClass:objc_opt_class()];

      if (v20) {
        int64_t v14 = 1;
      }
      else {
        int64_t v14 = v15;
      }
    }
    else
    {
      int64_t v14 = 1;
      if ("cancelOperation:" != a3 && "insertNewline:" != a3)
      {
        if ("pasteStyle:" == a3)
        {
          return -(uint64_t)SBYTE1(self->_lastGhostPosition.y);
        }
        else if ("duplicate:" == a3)
        {
          return -1;
        }
        else if (BYTE1(self->_lastGhostPosition.y))
        {
          return -1;
        }
        else
        {
          return (int64_t)v6;
        }
      }
    }
  }
  return v14;
}

- (BOOL)canBeginEditingRepOnDoubleTap:(id)a3
{
  return 0;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  return 0;
}

- (void)p_selectNextNode:(int64_t)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [(CRLBoardItemEditor *)self boardItems];
  id v7 = [v6 count];
  id v8 = v5;
  uint64_t v9 = (void *)v4;
  id v57 = [v8 initWithCapacity:v7];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v54 = self;
  uint64_t v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 countByEnumeratingWithState:&v66 objects:v82 count:16];
  double v56 = (void *)v4;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v67;
    do
    {
      int64_t v14 = 0;
      do
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(v10);
        }
        int64_t v15 = [v9 repForInfo:*(void *)(*((void *)&v66 + 1) + 8 * (void)v14)];
        uint64_t v16 = objc_opt_class();
        long double v22 = sub_100246DEC(v15, v16, 1, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLPathEditableRep);

        if (v22)
        {
          long long v23 = [v22 editablePathSource];
          [v57 addObject:v23];
        }
        else
        {
          unsigned int v24 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DF200);
          }
          long long v25 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v73 = v24;
            __int16 v74 = 2082;
            v75 = "-[CRLPathEditor p_selectNextNode:]";
            __int16 v76 = 2082;
            v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m";
            __int16 v78 = 1024;
            int v79 = 1867;
            __int16 v80 = 2082;
            v81 = "rep";
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014DF220);
          }
          long long v26 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            double v28 = v26;
            uint64_t v29 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v73 = v24;
            __int16 v74 = 2114;
            v75 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          long long v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathEditor p_selectNextNode:]");
          double v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v27, 1867, 0, "invalid nil value for '%{public}s'", "rep");

          uint64_t v9 = v56;
        }

        int64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v12);
  }

  BOOL v30 = v57;
  long long v31 = [v57 objectEnumerator];
  if (a3 == 1)
  {
    uint64_t v32 = [v57 reverseObjectEnumerator];

    long long v31 = (void *)v32;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v33 = v31;
  id v34 = [v33 countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (!v34)
  {

    __int16 v50 = v54;
LABEL_47:
    if (a3)
    {
      int v51 = [v30 lastObject];
      __int16 v52 = [v51 nodes];
      [v52 lastObject];
    }
    else
    {
      int v51 = [v30 firstObject];
      __int16 v52 = [v51 nodes];
      [v52 firstObject];
    id v53 = };

    [v53 setSelected:1];
LABEL_51:

    goto LABEL_52;
  }
  id v35 = v34;
  LOBYTE(v36) = 0;
  char v37 = 0;
  uint64_t v38 = *(void *)v63;
  while (2)
  {
    for (i = 0; i != v35; i = (char *)i + 1)
    {
      if (*(void *)v63 != v38) {
        objc_enumerationMutation(v33);
      }
      if (v36)
      {
        int v51 = v33;
        __int16 v50 = v54;
        BOOL v30 = v57;
        goto LABEL_51;
      }
      long long v40 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      id v41 = [v40 nodes];
      long long v42 = [v41 objectEnumerator];

      if (a3 == 1)
      {
        long long v43 = [v40 nodes];
        uint64_t v44 = [v43 reverseObjectEnumerator];

        long long v42 = (void *)v44;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v45 = v42;
      id v36 = [v45 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v36)
      {
        uint64_t v46 = *(void *)v59;
        while (2)
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v59 != v46) {
              objc_enumerationMutation(v45);
            }
            __int16 v48 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
            if (v37)
            {
              LOBYTE(v36) = 1;
              [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) setSelected:1];
              char v37 = 1;
              goto LABEL_41;
            }
            unsigned int v49 = [*(id *)(*((void *)&v58 + 1) + 8 * (void)j) isSelected];
            char v37 = v49;
            if (v49) {
              [v48 setSelected:0];
            }
          }
          id v36 = [v45 countByEnumeratingWithState:&v58 objects:v70 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }
LABEL_41:
    }
    id v35 = [v33 countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v35) {
      continue;
    }
    break;
  }

  __int16 v50 = v54;
  BOOL v30 = v57;
  if ((v36 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_52:
  [(CRLPathEditor *)v50 invalidateKnobs];
}

- (void)insertTab:(id)a3
{
}

- (void)insertBacktab:(id)a3
{
}

- (CGPoint)p_snappedPointForCanvasBackgroundAlignmentProvider:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v7 = [v6 canvasBackground];

  id v8 = [v7 alignmentProvider];
  if (v8)
  {
    uint64_t v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    unsigned int v10 = [v9 isCanvasBackgroundAlignmentSnappingEnabled];

    if (v10)
    {
      [v8 alignmentPointForPoint:x, y];
      double x = v11;
      double y = v12;
    }
  }

  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)pathCreateBlock
{
  return *(id *)&self->_isCreatingReversed;
}

- (void)setPathCreateBlock:(id)a3
{
}

- (BOOL)isCreatingPath
{
  return BYTE1(self->_insertSelectionBehavior);
}

- (BOOL)isCreatingReversed
{
  return BYTE2(self->_insertSelectionBehavior);
}

- (void)setIsCreatingReversed:(BOOL)a3
{
  BYTE2(self->_insertSelectionBehavior) = a3;
}

- (BOOL)shouldCreateNewPath
{
  return BYTE3(self->_insertSelectionBehavior);
}

- (void)setShouldCreateNewPath:(BOOL)a3
{
  BYTE3(self->_insertSelectionBehavior) = a3;
}

- (BOOL)resetAfterRebase
{
  return BYTE4(self->_insertSelectionBehavior);
}

- (void)setResetAfterRebase:(BOOL)a3
{
  BYTE4(self->_insertSelectionBehavior) = a3;
}

- (BOOL)currentCommandsPathRelated
{
  return BYTE5(self->_insertSelectionBehavior);
}

- (void)setCurrentCommandsPathRelated:(BOOL)a3
{
  BYTE5(self->_insertSelectionBehavior) = a3;
}

- (UIInputViewController)inputAccessoryViewController
{
  return *(UIInputViewController **)((char *)&self->_pathCreateBlock + 1);
}

- (NSArray)leadingBarButtonGroups
{
  return *(NSArray **)((char *)&self->inputAccessoryViewController + 1);
}

- (NSArray)trailingBarButtonGroups
{
  return *(NSArray **)((char *)&self->leadingBarButtonGroups + 1);
}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return BYTE6(self->_insertSelectionBehavior);
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  BYTE6(self->_insertSelectionBehavior) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->leadingBarButtonGroups + 1), 0);
  objc_storeStrong((id *)((char *)&self->inputAccessoryViewController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pathCreateBlock + 1), 0);
  objc_storeStrong((id *)&self->_isCreatingReversed, 0);
  objc_storeStrong((id *)(&self->_willBecomeCurrentEditorAgain + 1), 0);
  objc_storeStrong((id *)((char *)&self->_hoveringKnob + 1), 0);
  objc_storeStrong((id *)(&self->_isInCommandGroup + 1), 0);

  objc_storeStrong((id *)(&self->super.mIsChangingStrokeWidth + 1), 0);
}

@end