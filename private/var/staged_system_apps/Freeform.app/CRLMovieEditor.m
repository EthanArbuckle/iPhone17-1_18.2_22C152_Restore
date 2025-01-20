@interface CRLMovieEditor
+ (id)keyPathsForValuesAffectingPlayableBoardItems;
- (BOOL)p_canSaveDefaultMoviePreset;
- (_TtC8Freeform12CRLMovieItem)anyMovieItem;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)didEndChangingTimePropertyForMovieItem:(id)a3 withCommand:(id)a4 error:(id)a5;
- (void)saveDefaultInsertionPreset:(id)a3;
- (void)setMovieVolume:(double)a3;
- (void)setPropertyValue:(id)a3 forMovieProperty:(unint64_t)a4;
- (void)willBeginChangingTimePropertyForMovieItem:(id)a3 withLocalizedMessage:(id)a4 cancelHandler:(id)a5;
@end

@implementation CRLMovieEditor

+ (id)keyPathsForValuesAffectingPlayableBoardItems
{
  return +[NSSet setWithObject:@"boardItems"];
}

- (_TtC8Freeform12CRLMovieItem)anyMovieItem
{
  v3 = self;
  v4 = [(CRLBoardItemEditor *)self sortedBoardItemsOfClass:v3];
  v5 = [v4 firstObject];

  return (_TtC8Freeform12CRLMovieItem *)v5;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_isEqual(a3, "saveDefaultInsertionPreset:"))
  {
    if ([(CRLMovieEditor *)self p_canSaveDefaultMoviePreset]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLMovieEditor;
    int64_t v7 = [(CRLMediaEditor *)&v9 canPerformEditorAction:a3 withSender:v6];
  }

  return v7;
}

- (void)setMovieVolume:(double)a3
{
  v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 commandController];

  int64_t v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  objc_super v9 = [v8 canvasEditor];
  v10 = [(CRLCanvasCommandSelectionBehavior *)v7 initWithCanvasEditor:v9];

  [v6 openGroupWithSelectionBehavior:v10];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = [(CRLBoardItemEditor *)self boardItems];
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    float v15 = a3;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v16);
        v18 = [_TtC8Freeform24CRLCommandSetMovieVolume alloc];
        *(float *)&double v19 = v15;
        v20 = [(CRLCommandSetMovieVolume *)v18 initWithMovieItem:v17 volume:v19];
        [v6 enqueueCommand:v20];

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [v6 closeGroup];
}

- (void)setPropertyValue:(id)a3 forMovieProperty:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 43 || a4 == 40)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA390);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B31D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA3B0);
    }
    int64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor setPropertyValue:forMovieProperty:]");
    objc_super v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 105, 0, "We need to set the poster time and the poster image together. The poster image is a board item asset so it is async so we'll have to wait until we have both, then use CRLCommandSetMoviePosterTime.");
  }
  else
  {
    v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    v8 = [v10 commandController];

    v11 = [CRLCanvasCommandSelectionBehavior alloc];
    id v12 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v13 = [v12 canvasEditor];
    objc_super v9 = [(CRLCanvasCommandSelectionBehavior *)v11 initWithCanvasEditor:v13];

    [v8 openGroupWithSelectionBehavior:v9];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = [(CRLBoardItemEditor *)self boardItems];
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = +[CRLCommandSetMovieValue movieSetValueCommandWithMovie:*(void *)(*((void *)&v20 + 1) + 8 * i) property:a4 boxedValue:v6];
          [v8 enqueueCommand:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }

    [v8 closeGroup];
  }
}

- (void)willBeginChangingTimePropertyForMovieItem:(id)a3 withLocalizedMessage:(id)a4 cancelHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA3D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3310();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA3F0);
    }
    objc_super v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor willBeginChangingTimePropertyForMovieItem:withLocalizedMessage:cancelHandler:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:125 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  uint64_t v12 = *(void *)(&self->super.super.mIsChangingStrokeWidth + 1);
  if (!v12)
  {
    id v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA410);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3260();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA430);
      }
      uint64_t v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor willBeginChangingTimePropertyForMovieItem:withLocalizedMessage:cancelHandler:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 130, 0, "expected nil value for '%{public}s'", "_modalOperationToken");
    }
    uint64_t v17 = [v13 layerHost];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100447830;
    v25[3] = &unk_1014CBBB0;
    v25[4] = self;
    uint64_t v18 = [v17 beginModalOperationWithLocalizedMessage:v7 progress:0 cancelHandler:v25];
    double v19 = *(void **)((char *)&self->_timePropertyUpdatingCount + 1);
    *(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1) = v18;

    uint64_t v12 = *(void *)(&self->super.super.mIsChangingStrokeWidth + 1);
  }
  *(void *)(&self->super.super.mIsChangingStrokeWidth + 1) = v12 + 1;
  if (v8)
  {
    long long v20 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
    if (!v20)
    {
      long long v21 = (CRLModalOperationToken *)objc_alloc_init((Class)NSMutableArray);
      long long v22 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
      *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1) = v21;

      long long v20 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
    }
    id v23 = [v8 copy];
    id v24 = objc_retainBlock(v23);
    [v20 addObject:v24];
  }
}

- (void)didEndChangingTimePropertyForMovieItem:(id)a3 withCommand:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA450);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B34D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA470);
    }
    objc_super v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:152 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (*(void *)(&self->super.super.mIsChangingStrokeWidth + 1)) {
    goto LABEL_21;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FA490);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B3448();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014FA4B0);
  }
  uint64_t v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v12);
  }
  id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]");
  uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:154 isFatal:0 description:"didEndChangingTimePropertyForMovieItem called without matching willBeginChangingTimePropertyForMovieItem"];

  if (*(void *)(&self->super.super.mIsChangingStrokeWidth + 1))
  {
LABEL_21:
    id v15 = &OBJC_IVAR___CRLStrokePattern__phase;
    if (v7)
    {
      id v16 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
      if (!v16)
      {
        uint64_t v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        uint64_t v18 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
        *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1) = v17;

        id v16 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
      }
      [v16 addObject:v7];
    }
    if (v8)
    {
      double v19 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      if (!v19)
      {
        long long v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        long long v21 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
        *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1) = v20;

        double v19 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      }
      [v19 addObject:v8];
    }
    uint64_t v22 = *(void *)(&self->super.super.mIsChangingStrokeWidth + 1) - 1;
    *(void *)(&self->super.super.mIsChangingStrokeWidth + 1) = v22;
    if (!v22)
    {
      id v23 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1)) {
        goto LABEL_40;
      }
      LODWORD(v46) = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA4D0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B3398();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA4F0);
      }
      id v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v24);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]");
      v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 176, 0, "invalid nil value for '%{public}s'", "_modalOperationToken", v46);

      if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1))
      {
LABEL_40:
        v27 = [v23 layerHost];
        [v27 endModalOperationWithToken:*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1)];

        v28 = *(void **)((char *)&self->_timePropertyUpdatingCount + 1);
        *(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1) = 0;
      }
      if (!BYTE1(self->_timePropertyUpdatingErrors))
      {
        v36 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
        if (v36)
        {
          id v37 = [v36 count];
          if (v37)
          {
            id v38 = v37;
            v39 = [v23 commandController];
            v40 = v39;
            id v47 = v38;
            if (v38 != (id)1) {
              [v39 openGroup];
            }
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v41 = *(id *)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
            id v42 = [v41 countByEnumeratingWithState:&v50 objects:v54 count:16];
            if (v42)
            {
              id v43 = v42;
              uint64_t v44 = *(void *)v51;
              do
              {
                for (i = 0; i != v43; i = (char *)i + 1)
                {
                  if (*(void *)v51 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  [v40 enqueueCommand:*(void *)(*((void *)&v50 + 1) + 8 * i)];
                }
                id v43 = [v41 countByEnumeratingWithState:&v50 objects:v54 count:16];
              }
              while (v43);
            }

            if (v47 != (id)1) {
              [v40 closeGroup];
            }

            id v15 = &OBJC_IVAR___CRLStrokePattern__phase;
          }
        }
      }
      v29 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      if (v29 && [v29 count])
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100448178;
        v48[3] = &unk_1014CBE78;
        v48[4] = self;
        id v49 = v23;
        v30 = v48;
        Main = CFRunLoopGetMain();
        CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v30);
        CFRunLoopWakeUp(Main);
      }
      v32 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
      *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1) = 0;

      uint64_t v33 = v15[823];
      v34 = *(Class *)((char *)&self->super.super.super.super.isa + v33);
      *(Class *)((char *)&self->super.super.super.super.isa + v33) = 0;

      v35 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1) = 0;

      BYTE1(self->_timePropertyUpdatingErrors) = 0;
    }
  }
}

- (BOOL)p_canSaveDefaultMoviePreset
{
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLBoardItemEditor *)self boardItems];
  v5 = [v4 anyObject];
  id v6 = sub_10024715C(v3, v5);

  id v7 = [(CRLBoardItemEditor *)self boardItems];
  if ([v7 count] == (id)1) {
    unsigned int v8 = [v6 isAudioOnly] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 count];

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA510);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B3558();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA530);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor saveDefaultInsertionPreset:]");
    unsigned int v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:227 isFatal:0 description:"Only should save default style with a single object selected!"];
  }
  objc_super v9 = (objc_class *)objc_opt_class();
  v10 = [(CRLBoardItemEditor *)self boardItems];
  v11 = [v10 anyObject];
  uint64_t v12 = sub_10024715C(v9, v11);

  if (v12)
  {
    id v13 = [[_TtC8Freeform40CRLCommandSetDefaultMovieInsertionPreset alloc] initWithMovieItem:v12];
    uint64_t v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v15 = [v14 commandController];
    [v15 enqueueCommand:v13];
  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLMovieEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v29, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  unsigned int v8 = [(CRLBoardItemEditor *)self boardItems];
  id v9 = [v8 count];

  if ((unint64_t)v9 <= 1)
  {
    v10 = [(CRLMovieEditor *)self anyMovieItem];
    unsigned int v11 = [v10 isAudioOnly];

    uint64_t v12 = +[NSBundle mainBundle];
    id v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 localizedStringForKey:@"Modify Audio" value:0 table:0];
      id v15 = +[CRLImage crl_quickInspectorImageNamed:@"speaker.wave.2"];
      id v16 = +[CRLQuickInspectorElement elementWithName:v14 image:v15 type:2 options:256];

      [v16 setTag:9];
      uint64_t v17 = +[NSBundle mainBundle];
      uint64_t v18 = v17;
      CFStringRef v19 = @"Replace this audio file";
    }
    else
    {
      long long v20 = [v12 localizedStringForKey:@"Modify Movie" value:0 table:0];
      long long v21 = +[CRLImage crl_quickInspectorImageNamed:@"film"];
      id v16 = +[CRLQuickInspectorElement elementWithName:v20 image:v21 type:2 options:512];

      [v16 setTag:10];
      uint64_t v17 = +[NSBundle mainBundle];
      uint64_t v18 = v17;
      CFStringRef v19 = @"Replace this video or reset to original size";
    }
    uint64_t v22 = [v17 localizedStringForKey:v19 value:0 table:0];
    [v16 setToolTip:v22];

    [v7 insertObject:v16 atIndex:[v7 count]];
    if ([(CRLBoardItemEditor *)self canShowPreview])
    {
      id v23 = +[NSBundle mainBundle];
      id v24 = [v23 localizedStringForKey:@"Preview" value:0 table:0];
      v25 = +[CRLImage crl_quickInspectorImageNamed:@"eye"];
      v26 = +[CRLQuickInspectorElement elementWithName:v24 image:v25 type:2 action:"showPreview:"];

      [v26 setTag:19];
      v27 = [(CRLMovieEditor *)self anyMovieItem];
      v28 = [v27 previewTooltip];
      [v26 setToolTip:v28];

      [v7 addObject:v26];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCommands + 1), 0);
  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCancelHandlers + 1), 0);
  objc_storeStrong((id *)((char *)&self->_modalOperationToken + 1), 0);

  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCount + 1), 0);
}

@end