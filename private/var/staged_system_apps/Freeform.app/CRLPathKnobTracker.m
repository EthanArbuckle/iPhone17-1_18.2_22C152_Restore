@interface CRLPathKnobTracker
- (BOOL)constrain;
- (BOOL)createBezierNode;
- (BOOL)createdNode;
- (BOOL)didOpenGroup;
- (BOOL)isCreatingNode;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)toggleMirrorMagnitude;
- (BOOL)toggleMirrored;
- (BOOL)toggleNodeType;
- (CRLPathKnobTracker)initWithRep:(id)a3 creatingKnobAtPoint:(CGPoint)a4 initialPoint:(BOOL)a5 reversed:(BOOL)a6;
- (CRLPathKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (NSArray)decoratorOverlayRenderables;
- (id)editablePathSource;
- (int)initialReflectState;
- (int)reflectionStateForBendingNodeType:(int64_t)a3 originalReflectionState:(int)a4;
- (void)beginMovingKnob;
- (void)endMovingKnob;
- (void)moveKnobToRepPosition:(CGPoint)a3;
- (void)moveSmoothControlKnob:(id)a3 to:(CGPoint)a4;
- (void)p_closeCommandGroupIfNeeded;
- (void)setConstrain:(BOOL)a3;
- (void)setCreateBezierNode:(BOOL)a3;
- (void)setDidOpenGroup:(BOOL)a3;
- (void)setIsCreatingNode:(BOOL)a3;
- (void)setToggleMirrorMagnitude:(BOOL)a3;
- (void)setToggleMirrored:(BOOL)a3;
- (void)setToggleNodeType:(BOOL)a3;
- (void)startWithNodeCreationBlock:(id)a3;
- (void)updateKnobs;
@end

@implementation CRLPathKnobTracker

- (CRLPathKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  v41.receiver = self;
  v41.super_class = (Class)CRLPathKnobTracker;
  id v32 = a3;
  id v33 = a4;
  v5 = -[CRLCanvasKnobTracker initWithRep:knob:](&v41, "initWithRep:knob:", v32);
  if (v5)
  {
    if (([v32 conformsToProtocol:&OBJC_PROTOCOL___CRLPathEditableRep] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6718);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD4F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6738);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:48 isFatal:0 description:"reps conforming to CRLPathEditableRep protocol only valid for path node knob tracker"];
    }
    if ([v33 tag] != (id)17
      && [v33 tag] != (id)18
      && [v33 tag] != (id)19
      && [v33 tag] != (id)20
      && [v33 tag] != (id)22
      && [v33 tag] != (id)21
      && [v33 tag] != (id)23
      && [v33 tag] != (id)24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6758);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD46C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6778);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:49 isFatal:0 description:"wrong knob for path node knob tracker"];
    }
    if ([v33 tag] == (id)22 || objc_msgSend(v33, "tag") == (id)24)
    {
      v31 = [(CRLPathKnobTracker *)v5 pathKnob];
      [(CRLPathKnobTracker *)v5 p_createDelegateIfNecessary];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1003DC4FC;
      v38[3] = &unk_1014ECF00;
      v12 = v5;
      v39 = v12;
      id v13 = v31;
      id v40 = v13;
      [(CRLPathKnobTracker *)v12 startWithNodeCreationBlock:v38];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v14 = [(CRLCanvasKnobTracker *)v12 rep];
      v15 = [v14 knobs];

      id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v20 = objc_opt_class();
            v21 = sub_1002469D0(v20, v19);
            v22 = v21;
            if (v21)
            {
              v23 = (char *)[v21 nodeIndex];
              if (v23 == (char *)[v13 nodeIndex] + 1)
              {
                id v24 = [v22 subpathIndex];
                if (v24 == [v13 subpathIndex] && objc_msgSend(v22, "tag") == (id)17)
                {
                  [(CRLCanvasKnobTracker *)v12 setKnob:v22];

                  goto LABEL_44;
                }
              }
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_44:
    }
  }
  v25 = [(CRLCanvasKnobTracker *)v5 knob];
  BOOL v26 = v25 == 0;

  if (v26)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6798);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AD3E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F67B8);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]");
    v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:96 isFatal:0 description:"knob tracker should never have a null knob"];
  }
  return v5;
}

- (CRLPathKnobTracker)initWithRep:(id)a3 creatingKnobAtPoint:(CGPoint)a4 initialPoint:(BOOL)a5 reversed:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v38 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CRLPathKnobTracker;
  v11 = [(CRLCanvasKnobTracker *)&v49 init];
  v12 = v11;
  if (v11)
  {
    [(CRLCanvasKnobTracker *)v11 setRep:v38];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1003DCCF0;
    v43[3] = &unk_1014F67E0;
    id v13 = v12;
    v44 = v13;
    BOOL v47 = a5;
    CGFloat v45 = x;
    CGFloat v46 = y;
    BOOL v48 = a6;
    [(CRLPathKnobTracker *)v13 startWithNodeCreationBlock:v43];
    long long v37 = [(CRLPathKnobTracker *)v13 editablePathSource];
    v14 = [v37 subpaths];
    long long v36 = [v14 lastObject];

    v15 = [v37 subpaths];
    id v16 = (char *)[v15 count];

    if (a6)
    {
      uint64_t v17 = 0;
    }
    else
    {
      v18 = [v36 nodes];
      v19 = (char *)[v18 count];

      uint64_t v17 = v19 - 1;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v20 = [(CRLCanvasKnobTracker *)v13 rep];
    v21 = [v20 knobs];

    id v22 = [v21 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v22)
    {
      v23 = v16 - 1;
      uint64_t v24 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          BOOL v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v27 = objc_opt_class();
          v28 = sub_1002469D0(v27, v26);
          v29 = v28;
          if (v28 && [v28 subpathIndex] == v23 && objc_msgSend(v29, "nodeIndex") == v17)
          {
            [(CRLCanvasKnobTracker *)v13 setKnob:v29];

            goto LABEL_17;
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    [(CRLPathKnobTracker *)v13 setIsCreatingNode:1];
    v30 = [(CRLCanvasKnobTracker *)v13 knob];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6800);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD57C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6820);
      }
      id v32 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      id v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:creatingKnobAtPoint:initialPoint:reversed:]");
      long long v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 149, 0, "should have created a knob, but got nil");
    }
  }

  return v12;
}

- (void)startWithNodeCreationBlock:(id)a3
{
  v11 = (void (**)(void))a3;
  v4 = [(CRLCanvasKnobTracker *)self icc];
  v5 = [v4 commandController];

  if (![(CRLPathKnobTracker *)self didOpenGroup]) {
    [v5 openGroup];
  }
  [v5 enableProgressiveEnqueuingInCurrentGroup];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Add Point" value:0 table:@"UndoStrings"];
  [v5 setCurrentGroupActionString:v7];

  v8 = [(CRLPathKnobTracker *)self pathRep];
  [v8 dynamicOperationDidBeginWithRealTimeCommands:0];
  [v8 dynamicMovePathKnobDidBegin];
  v11[2]();
  [v8 dynamicMovePathKnobDidEndWithTracker:0];
  [v8 dynamicOperationDidEnd];
  [v8 invalidateKnobs];
  v9 = [v8 layout];
  [v9 invalidateFrame];

  v10 = [v8 layout];
  [v10 validate];

  [(CRLPathKnobTracker *)self setDidOpenGroup:1];
  self->mCreatedNode = 1;
}

- (id)editablePathSource
{
  v2 = [(CRLCanvasKnobTracker *)self rep];
  v3 = [v2 editablePathSource];

  return v3;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (void)updateKnobs
{
  v2 = [(CRLPathKnobTracker *)self editablePathSource];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v3 = [(CRLCanvasKnobTracker *)self rep];
  v4 = [v3 knobs];
  v5 = [(CRLCanvasKnobTracker *)self knob];
  v6 = [v4 arrayByAddingObject:v5];

  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        v12 = sub_1002469D0(v11, v10);
        if (v12)
        {
          id v13 = [v2 subpaths];
          v14 = [v13 objectAtIndex:[v12 subpathIndex]];

          v15 = [v14 nodes];
          id v16 = [v15 objectAtIndex:[v12 nodeIndex]];
          [v12 setNode:v16];

          if (([v14 isClosed] & 1) != 0
            || (uint64_t v17 = (char *)[v12 nodeIndex], v17 + 1 < objc_msgSend(v15, "count")))
          {
            v18 = objc_msgSend(v15, "objectAtIndex:", ((unint64_t)objc_msgSend(v12, "nodeIndex") + 1) % (unint64_t)objc_msgSend(v15, "count"));
            [v12 setNextNode:v18];
          }
          if (([v14 isClosed] & 1) != 0 || objc_msgSend(v12, "nodeIndex"))
          {
            if ([v12 nodeIndex]) {
              v19 = (char *)[v12 nodeIndex];
            }
            else {
              v19 = (char *)[v15 count];
            }
            uint64_t v20 = [v15 objectAtIndex:v19 - 1];
            [v12 setPrevNode:v20];
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
  }

  if ([(CRLPathKnobTracker *)self didOpenGroup]
    || [(CRLPathKnobTracker *)self isCreatingNode])
  {
    v21 = [(CRLPathKnobTracker *)self pathKnob];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = [(CRLCanvasKnobTracker *)self rep];
    v23 = [v22 knobs];

    id v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v36;
      while (2)
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          uint64_t v28 = objc_opt_class();
          v29 = sub_1002469D0(v28, v27);
          v30 = v29;
          if (v29)
          {
            id v31 = [v29 subpathIndex];
            if (v31 == [v21 subpathIndex])
            {
              id v32 = [v30 nodeIndex];
              if (v32 == [v21 nodeIndex])
              {
                id v33 = [v30 tag];
                if (v33 == [v21 tag])
                {
                  [(CRLCanvasKnobTracker *)self setKnob:v30];

                  goto LABEL_34;
                }
              }
            }
          }
        }
        id v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_34:
  }
}

- (void)beginMovingKnob
{
  v56.receiver = self;
  v56.super_class = (Class)CRLPathKnobTracker;
  [(CRLCanvasKnobTracker *)&v56 beginMovingKnob];
  [(CRLPathKnobTracker *)self p_createDelegateIfNecessary];
  CGFloat v45 = [(CRLCanvasKnobTracker *)self icc];
  BOOL v48 = [(CRLPathKnobTracker *)self pathKnob];
  BOOL v47 = [(CRLCanvasKnobTracker *)self rep];
  [v45 addDecorator:self];
  [v47 dynamicMovePathKnobDidBegin];
  [(CRLPathKnobTracker *)self updateKnobs];
  CGFloat v46 = [(CRLPathKnobTracker *)self editablePathSource];
  v3 = [[CRLEditableBezierPathSourceMorphInfo alloc] initWithEditableBezierPathSource:v46];
  mMorphInfo = self->mMorphInfo;
  self->mMorphInfo = v3;

  if (!self->mToggleNodeType) {
    goto LABEL_13;
  }
  v5 = [(CRLCanvasKnobTracker *)self icc];
  v6 = [v5 commandController];

  if (![(CRLPathKnobTracker *)self didOpenGroup]) {
    [v6 openGroup];
  }
  if ([(CRLPathKnobTracker *)self createBezierNode]
    && ([v48 node],
        id v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [v7 type] == (id)2,
        v7,
        !v8))
  {
    v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Make Bézier Point" value:0 table:@"UndoStrings"];
    [v6 setCurrentGroupActionString:v13];
    uint64_t v14 = 2;
  }
  else
  {
    v9 = [v48 node];
    if ([v9 type] == (id)3)
    {
    }
    else
    {
      v10 = [v48 node];
      BOOL v11 = [v10 type] == (id)2;

      if (!v11)
      {
        v12 = +[NSBundle mainBundle];
        id v13 = [v12 localizedStringForKey:@"Make Smooth Point" value:0 table:@"UndoStrings"];
        [v6 setCurrentGroupActionString:v13];
        uint64_t v14 = 3;
        goto LABEL_12;
      }
    }
    v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Make Sharp Point" value:0 table:@"UndoStrings"];
    [v6 setCurrentGroupActionString:v13];
    uint64_t v14 = 1;
  }
LABEL_12:

  [(CRLPathKnobTracker *)self setDidOpenGroup:1];
  v15 = [v48 node];
  id v16 = [v48 prevNode];
  uint64_t v17 = [v48 nextNode];
  [v46 toggleNode:v15 toType:v14 prevNode:v16 nextNode:v17];

LABEL_13:
  v18 = [v48 node];
  self->mInitialReflectState = [v18 reflectedState];

  v19 = [v48 prevNode];
  self->mPrevInitialReflectState = [v19 reflectedState];

  uint64_t v20 = [v48 prevNode];
  self->mPrevNodeOriginalType = (int64_t)[v20 type];

  v21 = [v48 node];
  self->mNodeOriginalType = (int64_t)[v21 type];

  id v22 = [v48 nextNode];
  self->mNextNodeOriginalType = (int64_t)[v22 type];

  memset(&v55, 0, sizeof(v55));
  v23 = [(CRLCanvasKnobTracker *)self rep];
  id v24 = [v23 layout];
  uint64_t v25 = v24;
  if (v24) {
    [v24 transformInRoot];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  BOOL v26 = [(CRLPathKnobTracker *)self pathRep];
  uint64_t v27 = v26;
  if (v26) {
    [v26 naturalToEditablePathSpaceTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  CGAffineTransformConcat(&v55, &t1, &t2);

  [v48 position];
  self->mOriginalUnscaledKnobPosition = (CGPoint)vaddq_f64(*(float64x2_t *)&v55.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v55.c, v28), *(float64x2_t *)&v55.a, v29));
  v30 = [v48 node];
  [v30 setSelected:1];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v31 = [v47 knobs];
  id v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v50;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v31);
        }
        long long v35 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v36 = objc_opt_class();
        long long v37 = sub_1002469D0(v36, v35);
        long long v38 = v37;
        if (v37)
        {
          long long v39 = [v37 node];
          long long v40 = [v48 node];
          long long v41 = v39;
          if (v39 == v40) {
            goto LABEL_30;
          }
          long long v42 = [v38 node];
          if (([v42 isSelected] & 1) == 0)
          {

            long long v41 = v40;
LABEL_30:

            goto LABEL_31;
          }
          BOOL v43 = [v38 tag] == (id)17;

          if (v43)
          {
            v44 = [v38 node];
            [v44 setSelected:0];

            [v38 updateImage];
          }
        }
LABEL_31:
      }
      id v32 = [v31 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v32);
  }

  [v47 invalidateKnobs];
  [v48 updateImage];
}

- (int)reflectionStateForBendingNodeType:(int64_t)a3 originalReflectionState:(int)a4
{
  if (a3 == 1) {
    a4 = 0;
  }
  if (a3 == 3) {
    return 1;
  }
  else {
    return a4;
  }
}

- (void)moveSmoothControlKnob:(id)a3 to:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v183 = a3;
  if ([v183 tag] == (id)21)
  {
    v5 = [v183 node];
    [v183 nextNode];
  }
  else
  {
    v5 = [v183 prevNode];
    [v183 node];
  v6 = };
  id v7 = v5;
  [v5 nodePoint];
  double v9 = v8;
  double v11 = v10;
  [v5 outControlPoint];
  if (sub_100064084(v9, v11, v12, v13))
  {
    [v6 inControlPoint];
    double v15 = v14;
    double v17 = v16;
    [v6 nodePoint];
    if (sub_100064084(v15, v17, v18, v19))
    {
      [v5 nodePoint];
      double v21 = v20;
      double v23 = v22;
      [v6 nodePoint];
      [v5 setOutControlPoint:sub_100065E00(v21, v23, v24, v25, 0.333333333)];
      [v5 nodePoint];
      double v27 = v26;
      double v29 = v28;
      [v6 nodePoint];
      [v6 setInControlPoint:sub_100065E00(v27, v29, v30, v31, 0.666666667)];
    }
  }
  [v5 nodePoint];
  double v33 = v32;
  double v35 = v34;
  [v5 outControlPoint];
  double v37 = v36;
  double v39 = v38;
  [v6 inControlPoint];
  double v41 = v40;
  double v43 = v42;
  [v6 nodePoint];
  double v45 = v44;
  double v47 = v46;
  if ([v183 tag] == (id)23)
  {
    [v183 tValue];
    if (v48 > 0.5) {
      double v49 = v35;
    }
    else {
      double v49 = v47;
    }
    if (v48 > 0.5) {
      double v50 = v33;
    }
    else {
      double v50 = v45;
    }
    double v174 = v50;
    double v177 = v49;
    if (v48 <= 0.5)
    {
      double v51 = v41;
    }
    else
    {
      double v43 = v39;
      double v51 = v37;
    }
    if (v48 <= 0.5)
    {
      double v52 = v33;
    }
    else
    {
      double v35 = v47;
      double v52 = v45;
    }
    if (v48 > 0.5) {
      double v48 = 1.0 - v48;
    }
    double v169 = v48;
    double v53 = sub_100065398(x - v52, y - v35);
    [v183 bendParameter];
    double v55 = v54;
    [v183 bendParameter];
    double v165 = v56;
    float v57 = v53;
    double v58 = v52 - v51;
    double v59 = v51 - v174;
    double v60 = v51;
    double v61 = v52;
    double v62 = v55 * v57;
    double v63 = sub_100065398(v58, v35 - v43);
    float v64 = v63 + sub_100065398(v59, v43 - v177);
    float v65 = sqrt(v62 / v64) / v165;
    float v66 = v169;
    *(float *)&double v63 = fminf(v65, fmaxf(v66, 0.33333));
    double v67 = sub_1000646A4(v61, v35, -1.0);
    double v166 = v68;
    double v170 = v67;
    double v156 = v60;
    double v157 = v43;
    double v69 = sub_1000646A4(v60, v43, 3.0);
    double v71 = v70;
    double v72 = sub_1000646A4(v61 + v69 - v174, v35 + v70 - v177, (float)(*(float *)&v63 * (float)(*(float *)&v63 * *(float *)&v63)));
    double v159 = v73;
    double v161 = v72;
    double v74 = sub_1000646A4(v61, v35, -3.0);
    double v76 = sub_1000646A4(v74 - v69, v75 - v71, (float)(*(float *)&v63 * *(float *)&v63));
    double v78 = v77;
    double v158 = v61;
    double v79 = v61;
    double v80 = v35;
    double v81 = sub_1000646A4(v79, v35, (float)(*(float *)&v63 * 3.0));
    double v83 = v82;
    id v84 = [v5 type];
    double v85 = y + v166 + v159 + v78 + v83;
    double v86 = (float)((float)(*(float *)&v63 + -1.0)
                * (float)((float)(*(float *)&v63 * 3.0) * (float)(*(float *)&v63 + -1.0)));
    double v87 = (x + v170 + v161 + v76 + v81) / v86;
    double v88 = v85 / v86;
    if (v84 == (id)1 && [v6 type] == (id)1)
    {
      double v89 = v158;
      double v90 = v80;
      double v91 = v177 - v80;
      float v92 = sub_100065398(v174 - v158, v177 - v80);
      double v93 = (v174 - v158) / v92;
      double v94 = v91 / v92;
      double v95 = sub_10006468C(v87 - v158, v88 - v90, v93, v94);
      float v96 = v95;
      double v97 = sub_1000646A4(v93, v94, v95);
      if (v96 < 0.0 || v96 > v92)
      {
        double v100 = v177;
      }
      else
      {
        double v149 = v158 + v97;
        double v150 = v90 + v98;
        double v151 = sub_100065398(v158 + v97 - v87, v90 + v98 - v88);
        v152 = [(CRLCanvasKnobTracker *)self icc];
        [v152 viewScale];
        double v154 = v151 * v153;

        BOOL v155 = v154 < 10.0;
        double v100 = v177;
        if (v155)
        {
          double v88 = v150;
          double v87 = v149;
        }
      }
    }
    else
    {
      double v100 = v177;
      double v89 = v158;
      double v90 = v80;
    }
    if (sub_100064374(v89, v90, v87, v88, v174, v100) && sub_100064374(v89, v90, v156, v157, v174, v100))
    {
      [v7 nodePoint];
      [v7 setOutControlPoint:];
      [v6 nodePoint];
      [v6 setInControlPoint:];
      goto LABEL_42;
    }
    [v183 tValue:v156, v157];
    if (v122 <= 0.5)
    {
      uint64_t v148 = [(CRLPathKnobTracker *)self reflectionStateForBendingNodeType:self->mPrevNodeOriginalType originalReflectionState:self->mPrevInitialReflectState];
      v102 = [v183 prevNode];
      [v102 setOutControlPoint:v148 reflect:0 constrain:v87, v88];
    }
    else
    {
      uint64_t v123 = [(CRLPathKnobTracker *)self reflectionStateForBendingNodeType:self->mNodeOriginalType originalReflectionState:self->mInitialReflectState];
      v102 = [v183 node];
      [v102 setInControlPoint:v123 reflect:0 constrain:v87 v88];
    }
  }
  else if ([v183 tag] == (id)21)
  {
    int64_t mNodeOriginalType = self->mNodeOriginalType;
    v102 = [v183 node];
    double v178 = sub_1000646A4(v33, v35, -1.0);
    double v175 = y + v103;
    double v104 = sub_1000646A4(v41, v43, 3.0);
    double v167 = v105;
    double v171 = v104;
    double v160 = v35 + v105 - v47;
    double v162 = v33 + v104 - v45;
    float v106 = sub_100065398(x - v33, y - v35);
    float v107 = v106 * 3.0;
    double v108 = sub_100065398(v33 - v41, v35 - v43);
    float v109 = v108 + sub_100065398(v41 - v45, v43 - v47);
    float v110 = fminf(sqrtf(v107 / v109) / 3.0, 0.5);
    double v111 = sub_1000646A4(v162, v160, (float)(v110 * (float)(v110 * v110)));
    double v113 = v175 + v112;
    double v114 = sub_1000646A4(v33, v35, -3.0);
    double v116 = sub_1000646A4(v114 - v171, v115 - v167, (float)(v110 * v110));
    double v118 = v113 + v117;
    double v119 = sub_1000646A4(v33, v35, (float)(v110 * 3.0));
    double v121 = (float)((float)(v110 + -1.0) * (float)((float)(v110 * 3.0) * (float)(v110 + -1.0)));
    [v102 setOutControlPoint:mNodeOriginalType == 3, 0, (x + v178 + v111 + v116 + v119) / v121, (v118 + v120) / v121];
  }
  else
  {
    if ([v183 tag] != (id)20) {
      goto LABEL_42;
    }
    int64_t v124 = self->mNodeOriginalType;
    v102 = [v183 node];
    double v172 = v35 - y;
    double v125 = sub_1000646A4(v33, v35, -1.0);
    double v163 = v126;
    double v127 = sub_1000646A4(v37, v39, 3.0);
    double v176 = v128;
    double v179 = v127;
    double v164 = v47 + v163 + v128;
    double v168 = v45 + v125 + v127;
    float v129 = sub_100065398(x - v45, y - v47);
    float v130 = v129 * 3.0;
    double v131 = sub_100065398(v33 - v37, v35 - v39);
    float v132 = v131 + sub_100065398(v37 - v45, v39 - v47);
    float v133 = 1.0 - fminf(sqrtf(v130 / v132) / 3.0, 0.33333);
    double v181 = sub_1000646A4(v168, v164, (float)(v133 * (float)(v133 * v133)));
    double v173 = v172 + v134;
    double v135 = sub_1000646A4(v33, v35, 3.0);
    double v137 = v136;
    double v138 = sub_1000646A4(v37, v39, 6.0);
    double v140 = sub_1000646A4(v135 - v138, v137 - v139, (float)(v133 * v133));
    double v142 = v173 + v141;
    double v143 = sub_1000646A4(v33, v35, -3.0);
    double v145 = sub_1000646A4(v179 + v143, v176 + v144, v133);
    double v147 = (float)((float)(v133 + -1.0) * (float)(v133 * (float)(v133 * 3.0)));
    [v102 setInControlPoint:v124 == 3, 0, (v33 - x + v181 + v140 + v145) / v147, (v142 + v146) / v147];
  }

LABEL_42:
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(CRLCanvasKnobTracker *)self rep];
  id v7 = [v6 interactiveCanvasController];
  double v8 = [v7 canvasBackground];

  double v9 = [v8 alignmentProvider];
  if (!v9) {
    goto LABEL_9;
  }
  double v10 = [(CRLCanvasKnobTracker *)self rep];
  double v11 = [v10 interactiveCanvasController];
  if (([v11 isCanvasBackgroundAlignmentSnappingEnabled] & 1) == 0) {
    goto LABEL_7;
  }
  double v12 = [(CRLPathKnobTracker *)self pathKnob];
  double v13 = [v12 node];
  if ([v13 type] != (id)1)
  {

LABEL_7:
    goto LABEL_8;
  }
  double v14 = [(CRLPathKnobTracker *)self pathKnob];
  id v15 = [v14 tag];

  if (v15 == (id)23) {
    goto LABEL_9;
  }
  double v16 = [(CRLCanvasKnobTracker *)self rep];
  [v16 convertKnobPositionToUnscaledCanvas:x, y];
  double v18 = v17;
  double v20 = v19;

  [v9 alignmentPointForPoint:v18, v20];
  double v22 = v21;
  double v24 = v23;
  double v10 = [(CRLCanvasKnobTracker *)self rep];
  [v10 convertKnobPositionFromUnscaledCanvas:v22, v24];
  double x = v25;
  double y = v26;
LABEL_8:

LABEL_9:
  double v27 = [(CRLPathKnobTracker *)self editablePathSource];
  double v28 = [(CRLPathKnobTracker *)self pathKnob];
  memset(&v88, 0, sizeof(v88));
  double v29 = [(CRLPathKnobTracker *)self pathRep];
  double v30 = v29;
  if (v29) {
    [v29 naturalToEditablePathSpaceTransform];
  }
  else {
    memset(&v88, 0, sizeof(v88));
  }

  CGAffineTransform v86 = v88;
  CGAffineTransformInvert(&v87, &v86);
  double v80 = v87.tx + y * v87.c + v87.a * x;
  double v78 = v87.ty + y * v87.d + v87.b * x;
  if ([(CRLPathKnobTracker *)self constrain])
  {
    memset(&v85, 0, sizeof(v85));
    double v31 = [(CRLCanvasKnobTracker *)self rep];
    double v32 = [v31 layout];
    double v33 = v32;
    if (v32) {
      [v32 transformInRoot];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    CGAffineTransform t2 = v88;
    CGAffineTransformConcat(&v85, &t1, &t2);

    CGAffineTransform v81 = v85;
    memset(&v82, 0, sizeof(v82));
    CGAffineTransformInvert(&v82, &v81);
    float64x2_t v34 = vaddq_f64(*(float64x2_t *)&v85.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v85.c, v78), *(float64x2_t *)&v85.a, v80));
    double v35 = self->mOriginalUnscaledKnobPosition.x;
    double v36 = sub_100064680(v34.f64[0], v34.f64[1], v35);
    double v38 = sub_10006631C(v36, v37);
    double v40 = sub_100064698(v38, v39, v35);
    double v78 = v82.ty + v41 * v82.d + v82.b * v40;
    double v80 = v82.tx + v41 * v82.c + v82.a * v40;
  }
  if ([(CRLPathKnobTracker *)self isCreatingNode]
    && [(CRLPathKnobTracker *)self createBezierNode])
  {
    double v42 = +[NSUserDefaults standardUserDefaults];
    if ([v42 BOOLForKey:@"TSDCreateBezierNodesByDefault"])
    {
    }
    else
    {
      unsigned __int8 v43 = [(CRLPathKnobTracker *)self toggleMirrored];

      if ((v43 & 1) == 0)
      {
        uint64_t v45 = 2;
        goto LABEL_27;
      }
    }
  }
  unsigned int v44 = [(CRLPathKnobTracker *)self initialReflectState];
  if (((v44 == 0) ^ [(CRLPathKnobTracker *)self toggleMirrored]))
  {
    uint64_t v45 = 0;
  }
  else
  {
    unsigned int v46 = [(CRLPathKnobTracker *)self initialReflectState];
    if ((v46 != 2) != [(CRLPathKnobTracker *)self toggleMirrorMagnitude]) {
      uint64_t v45 = 1;
    }
    else {
      uint64_t v45 = 2;
    }
  }
LABEL_27:
  if (![(CRLPathKnobTracker *)self isCreatingNode])
  {
    switch((unint64_t)[v28 tag])
    {
      case 0x11uLL:
        float v66 = [v28 node];
        [v66 nodePoint];
        double v68 = sub_100064680(v80, v79, v67);
        double v70 = v69;

        [v27 offsetSelectedNodesByDelta:v68, v70];
        goto LABEL_46;
      case 0x12uLL:
        double v71 = [v28 node];
        [v71 setInControlPoint:v45 reflect:[self constrain] constrain:v80 v79];
        goto LABEL_45;
      case 0x13uLL:
        double v71 = [v28 node];
        [v71 setOutControlPoint:v45 reflect:[self constrain] constrain:v80 v79];
LABEL_45:

        goto LABEL_46;
      case 0x14uLL:
      case 0x15uLL:
      case 0x17uLL:
        -[CRLPathKnobTracker moveSmoothControlKnob:to:](self, "moveSmoothControlKnob:to:", v28, v80, v79);
        goto LABEL_47;
      default:
        goto LABEL_47;
    }
  }
  double v47 = [v28 node];
  [v47 nodePoint];
  double v50 = sub_1000653B4(v80, v79, v48, v49);

  double v51 = [(CRLCanvasKnobTracker *)self icc];
  [v51 viewScale];
  double v53 = v50 * v52;

  if (v53 <= 10.0)
  {
    int64_t mNodeOriginalType = self->mNodeOriginalType;
  }
  else if ([(CRLPathKnobTracker *)self createBezierNode])
  {
    int64_t mNodeOriginalType = 2;
  }
  else
  {
    int64_t mNodeOriginalType = 3;
  }
  double v55 = [v28 node];
  id v56 = [v55 type];

  if ((id)mNodeOriginalType == v56)
  {
    BOOL v57 = 0;
  }
  else
  {
    double v58 = [v28 node];
    [v58 setType:mNodeOriginalType];

    double v59 = [(CRLCanvasKnobTracker *)self rep];
    [v59 invalidateKnobs];

    BOOL v57 = mNodeOriginalType != 2;
  }
  if (mNodeOriginalType == 2)
  {
    double v60 = [v28 node];
    [v60 setOutControlPoint:v45 reflect:[self constrain] constrain:v80 v79];

    double v61 = [(CRLCanvasKnobTracker *)self rep];
    [v61 invalidateKnobs];

    BOOL v57 = 1;
  }
  double v62 = [(CRLCanvasKnobTracker *)self icc];
  double v63 = [v62 editorController];
  float v64 = [v63 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  float v65 = [(CRLCanvasKnobTracker *)self rep];
  [v65 convertNaturalPointToUnscaledCanvas:v80, v79];
  [v64 updateGhostForNodeCreationAtPoint:];

  if (v57) {
LABEL_46:
  }
    [v27 morphWithMorphInfo:self->mMorphInfo];
LABEL_47:
  double v72 = [(CRLPathKnobTracker *)self pathRep];
  [v72 dynamicallyMovedPathKnobTo:self withTracker:v80 v79];

  double v73 = [(CRLCanvasKnobTracker *)self rep];
  double v74 = [(CRLCanvasKnobTracker *)self rep];
  double v75 = [v74 knobs];
  [v73 updatePositionsOfKnobs:v75];

  double v76 = [(CRLCanvasKnobTracker *)self rep];
  double v77 = [v76 layout];
  [v77 adjustCustomMagnetPositions];
}

- (void)endMovingKnob
{
  v22.receiver = self;
  v22.super_class = (Class)CRLPathKnobTracker;
  [(CRLCanvasKnobTracker *)&v22 endMovingKnob];
  v3 = [(CRLPathKnobTracker *)self pathRep];
  [v3 dynamicMovePathKnobDidEndWithTracker:self];

  v4 = [(CRLCanvasKnobTracker *)self rep];
  v5 = [v4 layout];
  v6 = [v5 commandsForAdjustingMagnetsFromClineLayouts];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v10);
        double v12 = [(CRLCanvasKnobTracker *)self icc];
        double v13 = [v12 commandController];
        [v13 enqueueCommand:v11];

        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  mMorphInfo = self->mMorphInfo;
  self->mMorphInfo = 0;

  [(CRLPathKnobTracker *)self p_closeCommandGroupIfNeeded];
  id v15 = [(CRLCanvasKnobTracker *)self icc];
  double v16 = [v15 editorController];
  double v17 = [v16 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if (v17) {
    [v17 endMovingKnob];
  }
}

- (void)p_closeCommandGroupIfNeeded
{
  if ([(CRLPathKnobTracker *)self didOpenGroup])
  {
    v3 = [(CRLCanvasKnobTracker *)self icc];
    v4 = [v3 commandController];

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6840);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD604();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6860);
      }
      v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker p_closeCommandGroupIfNeeded]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:647 isFatal:0 description:"Can't close command group. This is bad news."];
    }
    [v4 closeGroup];
  }
}

- (int)initialReflectState
{
  return self->mInitialReflectState;
}

- (BOOL)constrain
{
  return self->mConstrain;
}

- (void)setConstrain:(BOOL)a3
{
  self->mConstrain = a3;
}

- (BOOL)toggleMirrored
{
  return self->mToggleMirrored;
}

- (void)setToggleMirrored:(BOOL)a3
{
  self->mToggleMirrored = a3;
}

- (BOOL)toggleMirrorMagnitude
{
  return self->mToggleMirrorMagnitude;
}

- (void)setToggleMirrorMagnitude:(BOOL)a3
{
  self->mToggleMirrorMagnitude = a3;
}

- (BOOL)toggleNodeType
{
  return self->mToggleNodeType;
}

- (void)setToggleNodeType:(BOOL)a3
{
  self->mToggleNodeType = a3;
}

- (BOOL)isCreatingNode
{
  return self->mIsCreatingNode;
}

- (void)setIsCreatingNode:(BOOL)a3
{
  self->mIsCreatingNode = a3;
}

- (BOOL)createdNode
{
  return self->mCreatedNode;
}

- (BOOL)createBezierNode
{
  return self->mCreateBezierNode;
}

- (void)setCreateBezierNode:(BOOL)a3
{
  self->mCreateBezierNode = a3;
}

- (BOOL)didOpenGroup
{
  return self->mDidOpenGroup;
}

- (void)setDidOpenGroup:(BOOL)a3
{
  self->mDidOpenGroup = a3;
}

- (void).cxx_destruct
{
}

@end