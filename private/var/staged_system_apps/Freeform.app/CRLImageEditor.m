@interface CRLImageEditor
+ (id)keyPathsForValuesAffectingSelectedImageObjects;
- (BOOL)canToggleMaskEditMode;
- (BOOL)p_allImagesAreSupportedTypes;
- (BOOL)p_canBeginEditingMask;
- (BOOL)p_canHandleInsertNewline;
- (BOOL)p_canRemoveImageBackground;
- (BOOL)p_canResetMask;
- (BOOL)p_canResetMaskForImageInfo:(id)a3;
- (BOOL)p_canSaveDefaultImagePreset;
- (BOOL)p_isEditingMask;
- (BOOL)shouldSuppressMiniFormatter;
- (_TtC8Freeform12CRLImageItem)firstImageItem;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)beginEditingMask:(id)a3;
- (void)hideMaskControl:(id)a3;
- (void)insertNewline:(id)a3;
- (void)removeImageBackground:(id)a3;
- (void)resetMask:(id)a3;
- (void)saveDefaultInsertionPreset:(id)a3;
- (void)toggleMaskEditMode:(id)a3;
@end

@implementation CRLImageEditor

+ (id)keyPathsForValuesAffectingSelectedImageObjects
{
  return +[NSSet setWithObject:@"infos"];
}

- (_TtC8Freeform12CRLImageItem)firstImageItem
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLBoardItemEditor *)self boardItems];
  v5 = [v4 anyObject];
  v6 = sub_1002469D0(v3, v5);

  return (_TtC8Freeform12CRLImageItem *)v6;
}

- (BOOL)p_canHandleInsertNewline
{
  uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned __int8 v4 = [v3 hasSelectedInfosInMultipleContainers];

  if (v4) {
    return 0;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = [(CRLImageEditor *)self selectedImageObjects];
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v10);
        uint64_t v12 = objc_opt_class();
        v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        v14 = [v13 repForInfo:v11];
        v15 = sub_1002469D0(v12, v14);

        if (!v15)
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E95E0);
          }
          v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v31 = v16;
            __int16 v32 = 2082;
            v33 = "-[CRLImageEditor p_canHandleInsertNewline]";
            __int16 v34 = 2082;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m";
            __int16 v36 = 1024;
            int v37 = 56;
            __int16 v38 = 2082;
            v39 = "imageRep";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E9600);
          }
          v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v23 = v18;
            v24 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v31 = v16;
            __int16 v32 = 2114;
            v33 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canHandleInsertNewline]");
          v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 56, 0, "invalid nil value for '%{public}s'", "imageRep");
        }
        v21 = [v15 imageLayout];
        unsigned __int8 v22 = [v21 isInMaskEditMode];

        if (v22)
        {
          BOOL v5 = 1;
          goto LABEL_23;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v40 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_23:

  return v5;
}

- (void)insertNewline:(id)a3
{
  unsigned __int8 v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  v6 = &qword_101719A70;
  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9620);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010974E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9640);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor insertNewline:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:67 isFatal:0 description:"Cannot insert newline with cross-container selection!"];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v10 = [(CRLImageEditor *)self selectedImageObjects];
  id v11 = [v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v14);
        uint64_t v16 = objc_opt_class();
        v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
        v18 = [v17 repForInfo:v15];
        v19 = sub_1002469D0(v16, v18);

        if (!v19)
        {
          unsigned int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (*v6 != -1) {
            dispatch_once(v6, &stru_1014E9660);
          }
          v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v35 = v20;
            __int16 v36 = 2082;
            int v37 = "-[CRLImageEditor insertNewline:]";
            __int16 v38 = 2082;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m";
            __int16 v40 = 1024;
            int v41 = 71;
            __int16 v42 = 2082;
            v43 = "imageRep";
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (*v6 != -1) {
            dispatch_once(v6, &stru_1014E9680);
          }
          unsigned __int8 v22 = v6;
          v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            long long v28 = v23;
            long long v29 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v35 = v20;
            __int16 v36 = 2114;
            int v37 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor insertNewline:]");
          v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 71, 0, "invalid nil value for '%{public}s'", "imageRep");

          v6 = v22;
        }
        long long v26 = [v19 imageLayout];
        unsigned int v27 = [v26 isInMaskEditMode];

        if (v27) {
          [v19 endEditingMask];
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v12);
  }
}

- (BOOL)p_allImagesAreSupportedTypes
{
  uint64_t v3 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v4 = [v3 hasSelectedInfosInMultipleContainers];

  if (v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E96A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097568();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E96C0);
    }
    unsigned int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_allImagesAreSupportedTypes]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:79 isFatal:0 description:"Cannot check that all images are supported types with cross-container selection!"];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [(CRLBoardItemEditor *)self boardItems];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v26;
LABEL_13:
    uint64_t v13 = 0;
    v14 = v11;
    while (1)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
      uint64_t v16 = objc_opt_class();
      v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      v18 = [v17 repForInfo:v15 createIfNeeded:1];
      id v11 = sub_1002469D0(v16, v18);

      v19 = +[CRLImageProviderPool sharedPool];
      unsigned int v20 = [v11 imageDataForRendering];
      v21 = [v19 providerForAsset:v20 shouldValidate:1];

      unsigned __int8 v22 = [v21 isError];
      if (v22) {
        break;
      }
      uint64_t v13 = (char *)v13 + 1;
      v14 = v11;
      if (v10 == v13)
      {
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v10) {
          goto LABEL_13;
        }
        break;
      }
    }
    char v23 = v22 ^ 1;
  }
  else
  {
    char v23 = 1;
  }

  return v23;
}

- (BOOL)p_canResetMask
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(CRLImageEditor *)self selectedImageObjects];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(CRLImageEditor *)self p_canResetMaskForImageInfo:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)p_canResetMaskForImageInfo:(id)a3
{
  return [a3 maskCanBeReset];
}

- (void)resetMask:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v5 = [v4 commandController];

  uint64_t v6 = [CRLCanvasCommandSelectionBehavior alloc];
  id v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v8 = [v7 canvasEditor];
  id v9 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v8];

  [v5 openGroupWithSelectionBehavior:v9];
  long long v10 = +[NSBundle mainBundle];
  long long v11 = [v10 localizedStringForKey:@"Reset Mask" value:0 table:@"UndoStrings"];
  [v5 setCurrentGroupActionString:v11];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v12 = [(CRLBoardItemEditor *)self boardItems];
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v16);
        v18 = (objc_class *)objc_opt_class();
        v19 = sub_10024715C(v18, v17);
        if ([(CRLImageEditor *)self p_canResetMaskForImageInfo:v19])
        {
          unsigned int v20 = [v19 commandToResetMask];
          [v5 enqueueCommand:v20];
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [v5 closeGroup];
}

- (BOOL)shouldSuppressMiniFormatter
{
  return [(CRLImageEditor *)self p_isEditingMask];
}

- (BOOL)canToggleMaskEditMode
{
  uint64_t v3 = [(CRLBoardItemEditor *)self boardItems];
  if ([v3 count] == (id)1)
  {
    id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    if ([v4 hasSelectedInfosInMultipleContainers]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = [(CRLImageEditor *)self p_allImagesAreSupportedTypes];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)toggleMaskEditMode:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v5 = [v4 hasSelectedInfosInMultipleContainers];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E96E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097684();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9700);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor toggleMaskEditMode:]");
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:139 isFatal:0 description:"Cannot toggle mask edit mode with cross-container selection!"];
  }
  id v9 = [(CRLImageEditor *)self selectedImageObjects];
  long long v10 = [v9 anyObject];

  uint64_t v11 = objc_opt_class();
  long long v12 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v13 = [v12 repForInfo:v10];
  id v14 = sub_1002469D0(v11, v13);

  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9720);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010975F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9740);
    }
    uint64_t v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor toggleMaskEditMode:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 142, 0, "invalid nil value for '%{public}s'", "imageRep");
  }
  v18 = [v14 imageLayout];
  if ([v18 isInMaskEditMode])
  {
    [v14 endEditingMask];
  }
  else
  {
    v19 = [v14 imageInfo];
    unsigned int v20 = [v19 maskInfo];

    if (v20) {
      [v14 editMaskWithHUD:1];
    }
    else {
      [v14 maskWithHUD:1];
    }
    long long v21 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    long long v22 = [v21 layerHost];
    long long v23 = [v22 miniFormatterPresenter];
    [v23 dismissMiniFormatter];
  }
}

- (BOOL)p_canBeginEditingMask
{
  if ([(CRLImageEditor *)self canToggleMaskEditMode])
  {
    uint64_t v3 = [(CRLImageEditor *)self selectedImageObjects];
    id v4 = [v3 anyObject];

    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    id v7 = [v6 repForInfo:v4];
    BOOL v8 = sub_1002469D0(v5, v7);

    id v9 = [v8 imageLayout];
    unsigned int v10 = [v9 isInMaskEditMode] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)beginEditingMask:(id)a3
{
}

- (void)removeImageBackground:(id)a3
{
  id v4 = [(CRLImageEditor *)self selectedImageObjects];
  uint64_t v5 = [v4 anyObject];

  uint64_t v6 = objc_opt_class();
  id v7 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  BOOL v8 = [v7 repForInfo:v5];
  id v9 = sub_1002469D0(v6, v8);

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9760);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109770C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9780);
    }
    unsigned int v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor removeImageBackground:]");
    long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 186, 0, "invalid nil value for '%{public}s'", "imageRep");
  }
  [v9 removeBackgroundFromImage];
  id v13 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v14 = [v13 layerHost];
  uint64_t v15 = [v14 asiOSCVC];

  uint64_t v16 = [v15 miniFormatterPresenter];
  [v16 dismissMiniFormatter];
}

- (BOOL)p_canRemoveImageBackground
{
  uint64_t v3 = [(CRLImageEditor *)self selectedImageObjects];
  id v4 = [v3 anyObject];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E97A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101097834();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E97C0);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canRemoveImageBackground]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 202, 0, "invalid nil value for '%{public}s'", "imageInfo");
  }
  uint64_t v8 = objc_opt_class();
  id v9 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  unsigned int v10 = [v9 repForInfo:v4];
  uint64_t v11 = sub_1002469D0(v8, v10);

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E97E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010977A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9800);
    }
    long long v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor p_canRemoveImageBackground]");
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 204, 0, "invalid nil value for '%{public}s'", "imageRep");
  }
  unsigned __int8 v15 = [v11 canRemoveBackgroundFromImage];
  if (!+[VKCRemoveBackgroundRequestHandler isSupported](VKCRemoveBackgroundRequestHandler, "isSupported")|| (v15 & (((unint64_t)+[VKCImageAnalyzer supportedAnalysisTypes] & 0x20) != 0)) != 1)
  {
    goto LABEL_27;
  }
  uint64_t v16 = [(CRLBoardItemEditor *)self boardItems];
  if ([v16 count] != (id)1)
  {
LABEL_26:

LABEL_27:
    LOBYTE(v18) = 0;
    goto LABEL_28;
  }
  v17 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  if ([v17 hasSelectedInfosInMultipleContainers])
  {

    goto LABEL_26;
  }
  unsigned int v18 = [(CRLImageEditor *)self p_allImagesAreSupportedTypes];

  if (v18) {
    unsigned int v18 = [v4 isBackgroundRemoved] ^ 1;
  }
LABEL_28:

  return v18;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("insertNewline:" == a3)
  {
    unsigned int v7 = [(CRLImageEditor *)self p_canHandleInsertNewline];
    goto LABEL_18;
  }
  if ("toggleMaskEditMode:" == a3)
  {
    unsigned int v7 = [(CRLImageEditor *)self canToggleMaskEditMode];
    goto LABEL_18;
  }
  if ("beginEditingMask:" == a3)
  {
    unsigned int v7 = [(CRLImageEditor *)self p_canBeginEditingMask];
    goto LABEL_18;
  }
  if (sel_isEqual(a3, "resetMask:"))
  {
    unsigned int v7 = [(CRLImageEditor *)self p_canResetMask];
    goto LABEL_18;
  }
  if (sel_isEqual(a3, "saveDefaultInsertionPreset:"))
  {
    unsigned int v7 = [(CRLImageEditor *)self p_canSaveDefaultImagePreset];
    goto LABEL_18;
  }
  if ("removeImageBackground:" == a3)
  {
    unsigned int v7 = [(CRLImageEditor *)self p_canRemoveImageBackground];
LABEL_18:
    if (v7) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = -1;
    }
    goto LABEL_21;
  }
  if (sel_isEqual(a3, "hideMaskControl:"))
  {
    uint64_t v8 = [(CRLImageEditor *)self firstImageItem];
    uint64_t v9 = objc_opt_class();
    unsigned int v10 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    uint64_t v11 = [v10 repForInfo:v8];
    long long v12 = sub_1002469D0(v9, v11);

    id v13 = [v12 imageLayout];
    if ([v13 isInMaskEditMode]) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = -1;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLImageEditor;
    int64_t v14 = [(CRLMediaEditor *)&v16 canPerformEditorAction:a3 withSender:v6];
  }
LABEL_21:

  return v14;
}

- (BOOL)p_isEditingMask
{
  uint64_t v3 = [(CRLImageEditor *)self firstImageItem];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 repForInfo:v3];
  unsigned int v7 = sub_1002469D0(v4, v6);

  uint64_t v8 = [v7 imageLayout];
  LOBYTE(v6) = [v8 isInMaskEditMode];

  return (char)v6;
}

- (BOOL)p_canSaveDefaultImagePreset
{
  v2 = [(CRLBoardItemEditor *)self boardItems];
  BOOL v3 = [v2 count] == (id)1;

  return v3;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self boardItems];
  id v5 = [v4 count];

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9820);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010978C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9840);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    unsigned int v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageEditor saveDefaultInsertionPreset:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageEditor.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:266 isFatal:0 description:"Only should save default style with a single object selected!"];
  }
  uint64_t v9 = (objc_class *)objc_opt_class();
  unsigned int v10 = [(CRLBoardItemEditor *)self boardItems];
  uint64_t v11 = [v10 anyObject];
  long long v12 = sub_10024715C(v9, v11);

  if (v12)
  {
    id v13 = [[_TtC8Freeform40CRLCommandSetDefaultImageInsertionPreset alloc] initWithImageItem:v12];
    int64_t v14 = [(CRLBoardItemEditor *)self interactiveCanvasController];
    unsigned __int8 v15 = [v14 commandController];
    [v15 enqueueCommand:v13];
  }
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLImageEditor;
  -[CRLMediaEditor addContextualMenuElementsToArray:atPoint:](&v20, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  if ([v7 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = objc_opt_class();
      unsigned int v10 = [v7 objectAtIndexedSubscript:v8];
      uint64_t v11 = sub_1002469D0(v9, v10);

      long long v12 = [v11 identifier];
      unsigned __int8 v13 = [v12 isEqualToString:@"CRLShadowAndRoundCornersMenuIdentifier"];

      if (v13) {
        break;
      }
      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v14 = +[NSBundle mainBundle];
  unsigned __int8 v15 = [v14 localizedStringForKey:@"Reset Mask" value:0 table:0];
  objc_super v16 = +[UIImage systemImageNamed:@"crop"];
  v17 = +[UICommand commandWithTitle:v15 image:v16 action:"resetMask:" propertyList:0];

  long long v21 = v17;
  unsigned int v18 = +[NSArray arrayWithObjects:&v21 count:1];
  v19 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:0 options:1 children:v18];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    [v7 addObject:v19];
  }
  else {
    [v7 insertObject:v19 atIndex:v8];
  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRLImageEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v34, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  uint64_t v8 = (char *)[v7 count];
  uint64_t v9 = [(CRLBoardItemEditor *)self boardItems];
  id v10 = [v9 count];

  if ((unint64_t)v10 <= 1)
  {
    uint64_t v11 = +[NSBundle mainBundle];
    long long v12 = [v11 localizedStringForKey:@"Modify Image" value:0 table:0];
    unsigned __int8 v13 = +[CRLImage crl_quickInspectorImageNamed:@"photo"];
    int64_t v14 = +[CRLQuickInspectorElement elementWithName:v12 image:v13 type:2 options:128];

    [v14 setTag:8];
    unsigned __int8 v15 = +[NSBundle mainBundle];
    objc_super v16 = [v15 localizedStringForKey:@"Replace this photo, reset to original size, or remove background", 0, 0 value table];
    [v14 setToolTip:v16];

    [v7 insertObject:v14 atIndex:v8];
    v17 = v8 + 1;
    if ([(CRLImageEditor *)self p_canBeginEditingMask])
    {
      unsigned int v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:@"Crop Mask" value:0 table:0];
      objc_super v20 = +[CRLImage crl_quickInspectorImageNamed:@"crop"];
      long long v21 = +[CRLQuickInspectorElement elementWithName:v19 image:v20 type:2 action:"beginEditingMask:" parent:0 children:0];

      [v21 setTag:17];
      long long v22 = +[NSBundle mainBundle];
      long long v23 = [v22 localizedStringForKey:@"Crop and scale" value:0 table:0];
      [v21 setToolTip:v23];

      [v7 insertObject:v21 atIndex:v8 + 1];
      v17 = v8 + 2;
    }
    if ([(CRLImageEditor *)self p_canResetMask])
    {
      long long v24 = +[NSBundle mainBundle];
      long long v25 = [v24 localizedStringForKey:@"Reset Mask" value:0 table:0];
      long long v26 = +[CRLImage crl_quickInspectorImageNamed:@"crop.rotate"];
      long long v27 = +[CRLQuickInspectorElement elementWithName:v25 image:v26 type:1 action:"resetMask:" parent:0 children:0];

      [v27 setTag:18];
      [v7 insertObject:v27 atIndex:v17];
    }
    if ([(CRLBoardItemEditor *)self canShowPreview])
    {
      long long v28 = +[NSBundle mainBundle];
      long long v29 = [v28 localizedStringForKey:@"Preview" value:0 table:0];
      long long v30 = +[CRLImage crl_quickInspectorImageNamed:@"eye"];
      long long v31 = +[CRLQuickInspectorElement elementWithName:v29 image:v30 type:2 action:"showPreview:"];

      [v31 setTag:19];
      long long v32 = [(CRLImageEditor *)self firstImageItem];
      long long v33 = [v32 previewTooltip];
      [v31 setToolTip:v33];

      [v7 addObject:v31];
    }
  }
}

- (void)hideMaskControl:(id)a3
{
  id v8 = [(CRLImageEditor *)self firstImageItem];
  uint64_t v4 = objc_opt_class();
  id v5 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  id v6 = [v5 repForInfo:v8 createIfNeeded:0];
  id v7 = sub_1002469D0(v4, v6);

  [v7 endEditingMask];
}

@end