@interface CRLMediaEditor
+ (id)keyPathsForValuesAffectingMediaItems;
+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReplacement;
- (BOOL)anySelectedObjectsHaveLooping;
- (BOOL)anySelectedObjectsHaveRoundCorners;
- (BOOL)anySelectedObjectsHaveShadow;
- (BOOL)p_allSelectedObjectsAllowTogglingOfLoop;
- (BOOL)p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow;
- (BOOL)p_boardItemsAreImageAndMovieOnly;
- (BOOL)p_repCanResetMediaSize;
- (CRLPlatformControlState)roundCornersToggledControlState;
- (CRLPlatformControlState)shadowToggledControlState;
- (id)loopToggledControlState;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7;
- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5;
- (void)resetSelectionToNaturalDataSize:(id)a3;
- (void)showMediaReplaceUI:(id)a3;
- (void)toggleLoop:(id)a3;
- (void)toggleRoundCorners:(id)a3;
- (void)toggleShadow:(id)a3;
@end

@implementation CRLMediaEditor

+ (id)keyPathsForValuesAffectingMediaItems
{
  return +[NSSet setWithObject:@"boardItems"];
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReplacement
{
  return +[NSSet setWithObject:@"boardItems"];
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if ("replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:" != a3)
  {
    if ("resetSelectionToNaturalDataSize:" == a3)
    {
      unsigned int v20 = [(CRLMediaEditor *)self p_repCanResetMediaSize];
    }
    else
    {
      if (sel_isEqual(a3, "showMediaReplaceUI:"))
      {
        v8 = [(CRLBoardItemEditor *)self boardItems];
        if ([v8 count] == (id)1) {
          int64_t v9 = 1;
        }
        else {
          int64_t v9 = -1;
        }

        goto LABEL_29;
      }
      if ("toggleShadow:" == a3 || "toggleRoundCorners:" == a3)
      {
        unsigned int v20 = [(CRLMediaEditor *)self p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow];
      }
      else
      {
        if ("toggleLoop:" != a3)
        {
          v23.receiver = self;
          v23.super_class = (Class)CRLMediaEditor;
          int64_t v9 = [(CRLStyledEditor *)&v23 canPerformEditorAction:a3 withSender:v7];
          goto LABEL_29;
        }
        unsigned int v20 = [(CRLMediaEditor *)self p_allSelectedObjectsAllowTogglingOfLoop];
      }
    }
    if (v20) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = -1;
    }
    goto LABEL_29;
  }
  id v22 = v6;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(CRLMediaEditor *)self mediaItems];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    int64_t v9 = -1;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      if (![v15 canBeReplaced]) {
        break;
      }
      v16 = [(CRLBoardItemEditor *)self interactiveCanvasController];
      v17 = [v16 canvasEditor];
      v18 = [v17 canvasEditorHelper];
      unsigned int v19 = [v18 canReplaceBoardItem:v15];

      if (v19) {
        int64_t v9 = 1;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          goto LABEL_10;
        }

        v7 = v22;
        goto LABEL_29;
      }
    }
  }

  int64_t v9 = -1;
  v7 = v22;
LABEL_29:

  return v9;
}

- (BOOL)p_repCanResetMediaSize
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CRLMediaEditor *)self mediaItems];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) canResetMediaSize])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)resetSelectionToNaturalDataSize:(id)a3
{
  id v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v5 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(CRLMediaEditor *)self mediaItems];
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 canResetMediaSize])
        {
          long long v12 = [v4 canvasEditor];
          uint64_t v13 = [v12 selectionPathWithInfo:v11];

          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1001114A4;
          v24[3] = &unk_1014D6E80;
          long long v25 = v5;
          uint64_t v14 = objc_retainBlock(v24);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1001114FC;
          v22[3] = &unk_1014D6EA8;
          id v23 = v14;
          v15 = v14;
          [v4 forLayoutNearestVisibleRectForInfosForSelectionPath:v13 performBlock:v22];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Original Size" value:0 table:@"UndoStrings"];
  [(CRLCommandGroup *)v5 setActionString:v17];

  if (![(CRLCommandGroup *)v5 isEmpty])
  {
    v18 = [v4 commandController];
    unsigned int v19 = [CRLCanvasCommandSelectionBehavior alloc];
    unsigned int v20 = [v4 canvasEditor];
    v21 = [(CRLCanvasCommandSelectionBehavior *)v19 initWithCanvasEditor:v20 type:2 constructedInfos:0];

    [v18 openGroupWithSelectionBehavior:v21];
    [v18 enqueueCommand:v5];
    [v18 closeGroup];
  }
}

- (BOOL)p_boardItemsAreImageAndMovieOnly
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v8 = objc_opt_class();
          uint64_t v9 = sub_1002469D0(v8, v7);
          unsigned __int8 v10 = [v9 isAudioOnly];

          if ((v10 & 1) == 0) {
            continue;
          }
        }
        BOOL v11 = 0;
        goto LABEL_14;
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CRLMediaEditor *)self mediaItems];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) supportsTogglingShadowAndRoundedCorners])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)p_allSelectedObjectsAllowTogglingOfLoop
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CRLMediaEditor *)self mediaItems];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) supportsTogglingLooping])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)anySelectedObjectsHaveShadow
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = sub_1002469D0(v7, v6);
        if (v8)
        {
          long long v9 = v8;
          long long v10 = [v8 shadow];

          if (v10)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)anySelectedObjectsHaveRoundCorners
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = sub_1002469D0(v7, v6);
        long long v9 = v8;
        if (v8 && [v8 hasRoundedCorners])
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)anySelectedObjectsHaveLooping
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = sub_1002469D0(v7, v6);
        long long v9 = v8;
        if (v8 && [v8 isLooping])
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)toggleShadow:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v5 = [v4 commandController];
  id v6 = [CRLCanvasCommandSelectionBehavior alloc];
  uint64_t v7 = [v4 canvasEditor];
  uint64_t v8 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v7 type:2 constructedInfos:0];

  long long v9 = 0;
  if (![(CRLMediaEditor *)self anySelectedObjectsHaveShadow])
  {
    long long v9 = +[CRLShadow defaultShadow];
  }
  [v5 openGroupWithSelectionBehavior:v8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  id v12 = v11;
  v21 = v8;
  id v22 = v4;
  char v13 = 0;
  uint64_t v14 = *(void *)v24;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v24 != v14) {
        objc_enumerationMutation(v10);
      }
      long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      uint64_t v17 = objc_opt_class();
      v18 = sub_1002469D0(v17, v16);
      if (v18)
      {
        unsigned int v19 = [[_TtC8Freeform19CRLCommandSetShadow alloc] initWithBoardItem:v18 shadow:v9];
        [v5 enqueueCommand:v19];

        char v13 = 1;
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v12);

  uint64_t v4 = v22;
  if (v13)
  {
    long long v10 = +[NSBundle mainBundle];
    unsigned int v20 = [v10 localizedStringForKey:@"Shadow Setting" value:0 table:0];
    [v5 setCurrentGroupActionString:v20];

LABEL_14:
  }
  [v5 closeGroup:v21, v22];
}

- (void)toggleRoundCorners:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v5 = [v4 commandController];
  id v6 = [CRLCanvasCommandSelectionBehavior alloc];
  uint64_t v7 = [v4 canvasEditor];
  uint64_t v8 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v7 type:2 constructedInfos:0];

  unsigned int v9 = [(CRLMediaEditor *)self anySelectedObjectsHaveRoundCorners];
  [v5 openGroupWithSelectionBehavior:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  id v12 = v11;
  long long v23 = v8;
  long long v24 = v4;
  char v13 = 0;
  uint64_t v14 = *(void *)v26;
  uint64_t v15 = v9 ^ 1;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v18 = objc_opt_class();
      unsigned int v19 = sub_1002469D0(v18, v17);
      unsigned int v20 = v19;
      if (v19)
      {
        v21 = [v19 commandToSetRoundedCornersEnabled:v15];
        if (v21)
        {
          [v5 enqueueCommand:v21];
          char v13 = 1;
        }
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v12);

  uint64_t v4 = v24;
  if (v13)
  {
    id v22 = +[NSBundle mainBundle];
    long long v10 = [v22 localizedStringForKey:@"Round Corners Setting" value:0 table:0];

    [v5 setCurrentGroupActionString:v10];
LABEL_14:
  }
  [v5 closeGroup:v23, v24];
}

- (void)toggleLoop:(id)a3
{
  uint64_t v4 = [(CRLBoardItemEditor *)self interactiveCanvasController];
  uint64_t v5 = [v4 commandController];
  id v6 = [CRLCanvasCommandSelectionBehavior alloc];
  uint64_t v7 = [v4 canvasEditor];
  uint64_t v8 = [(CRLCanvasCommandSelectionBehavior *)v6 initWithCanvasEditor:v7 type:2 constructedInfos:0];

  unsigned int v9 = [(CRLMediaEditor *)self anySelectedObjectsHaveLooping];
  [v5 openGroupWithSelectionBehavior:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v10 = [(CRLBoardItemEditor *)self boardItems];
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  id v12 = v11;
  long long v23 = v8;
  long long v24 = v4;
  char v13 = 0;
  uint64_t v14 = *(void *)v26;
  uint64_t v15 = v9 ^ 1;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v26 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v18 = objc_opt_class();
      unsigned int v19 = sub_1002469D0(v18, v17);
      unsigned int v20 = v19;
      if (v19)
      {
        v21 = [v19 commandToSetLoopingEnabled:v15];
        if (v21)
        {
          [v5 enqueueCommand:v21];
          char v13 = 1;
        }
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v12);

  uint64_t v4 = v24;
  if (v13)
  {
    id v22 = +[NSBundle mainBundle];
    long long v10 = [v22 localizedStringForKey:@"Loop Setting" value:0 table:0];

    [v5 setCurrentGroupActionString:v10];
LABEL_14:
  }
  [v5 closeGroup:v23, v24];
}

- (CRLPlatformControlState)shadowToggledControlState
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v3)
  {

LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  id v4 = v3;
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = *(void *)v20;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v2);
      }
      unsigned int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v10 = objc_opt_class();
      id v11 = sub_1002469D0(v10, v9);
      id v12 = v11;
      if (v11)
      {
        char v13 = [v11 shadow];
        BOOL v14 = v13 != 0;
        BOOL v15 = v13 == 0;

        v5 |= v15;
        v6 |= v14;
      }
      else
      {
        int v5 = 1;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v4);

  if (v6 & v5)
  {
    uint64_t v16 = 2;
    goto LABEL_17;
  }
  if (v5 & 1 | ((v6 & 1) == 0)) {
    goto LABEL_15;
  }
  uint64_t v16 = 1;
LABEL_17:
  uint64_t v17 = +[CRLPlatformControlState stateWithValue:v16];

  return (CRLPlatformControlState *)v17;
}

- (CRLPlatformControlState)roundCornersToggledControlState
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v3)
  {

LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  id v4 = v3;
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v2);
      }
      unsigned int v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v10 = objc_opt_class();
      id v11 = sub_1002469D0(v10, v9);
      id v12 = v11;
      if (v11)
      {
        unsigned int v13 = [v11 hasRoundedCorners];
        v5 |= v13 ^ 1;
        v6 |= v13;
      }
      else
      {
        int v5 = 1;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v4);

  if (v6 & v5)
  {
    uint64_t v14 = 2;
    goto LABEL_17;
  }
  if (v5 & 1 | ((v6 & 1) == 0)) {
    goto LABEL_15;
  }
  uint64_t v14 = 1;
LABEL_17:
  BOOL v15 = +[CRLPlatformControlState stateWithValue:v14];

  return (CRLPlatformControlState *)v15;
}

- (id)loopToggledControlState
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(CRLBoardItemEditor *)self boardItems];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v3)
  {

LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  id v4 = v3;
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v2);
      }
      unsigned int v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      uint64_t v10 = objc_opt_class();
      id v11 = sub_1002469D0(v10, v9);
      id v12 = v11;
      if (v11)
      {
        unsigned int v13 = [v11 isLooping];
        v5 |= v13 ^ 1;
        v6 |= v13;
      }
      else
      {
        int v5 = 1;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v4);

  if (v6 & v5)
  {
    uint64_t v14 = 2;
    goto LABEL_17;
  }
  if (v5 & 1 | ((v6 & 1) == 0)) {
    goto LABEL_15;
  }
  uint64_t v14 = 1;
LABEL_17:
  BOOL v15 = +[CRLPlatformControlState stateWithValue:v14];

  return v15;
}

- (void)showMediaReplaceUI:(id)a3
{
  id v4 = a3;
  int v5 = [[CRLMediaReplacingHelper alloc] initWithEditor:self];
  [(CRLMediaReplacingHelper *)v5 showMediaReplaceUI:v4];
}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CRLMediaReplacingHelper alloc] initWithEditor:self];
  [(CRLMediaReplacingHelper *)v11 replaceSelectedMediaWithData:v10 actionString:v9 completion:v8];
}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  long long v17 = [[CRLMediaReplacingHelper alloc] initWithEditor:self];
  [(CRLMediaReplacingHelper *)v17 replaceCanvasElementInfo:v16 withFilesAtURLs:v15 allowedTypes:v14 actionString:v13 completion:v12];
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  int v6 = [(CRLMediaEditor *)self mediaItems];
  id v7 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v56;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v55 + 1) + 8 * i) supportsTogglingShadowAndRoundedCorners])
        {
          int v11 = 0;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v11 = 1;
LABEL_11:

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v12 = [(CRLMediaEditor *)self mediaItems];
  id v13 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v52;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        if (![*(id *)(*((void *)&v51 + 1) + 8 * (void)j) supportsTogglingLooping])
        {
          int v17 = 0;
          goto LABEL_21;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  int v17 = 1;
LABEL_21:

  if (v11)
  {
    int v50 = v17;
    long long v18 = +[NSBundle mainBundle];
    long long v19 = [v18 localizedStringForKey:@"Shadow" value:0 table:0];
    long long v20 = +[UIImage systemImageNamed:@"shadow"];
    long long v21 = +[UICommand commandWithTitle:v19 image:v20 action:"toggleShadow:" propertyList:0];

    v48 = [(CRLMediaEditor *)self shadowToggledControlState];
    [v21 setState:[v48 stateValue]];
    long long v22 = +[NSBundle mainBundle];
    long long v23 = [v22 localizedStringForKey:@"Round Corners" value:0 table:0];
    long long v24 = +[UIImage systemImageNamed:@"rectangle.roundedtop"];
    long long v25 = +[UICommand commandWithTitle:v23 image:v24 action:"toggleRoundCorners:" propertyList:0];

    long long v26 = [(CRLMediaEditor *)self roundCornersToggledControlState];
    [v25 setState:[v26 stateValue]];
    v49 = v21;
    v60[0] = v21;
    v60[1] = v25;
    long long v27 = +[NSArray arrayWithObjects:v60 count:2];
    long long v28 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLShadowAndRoundCornersMenuIdentifier" options:1 children:v27];

    if ([v5 count])
    {
      unint64_t v29 = 1;
      while (1)
      {
        uint64_t v30 = objc_opt_class();
        v31 = [v5 objectAtIndexedSubscript:v29 - 1];
        v32 = sub_1002469D0(v30, v31);

        if (v32)
        {
          v33 = [v32 identifier];

          if (v33 == @"CRLCutCopyPasteMenuIdentifier") {
            break;
          }
        }
        BOOL v34 = v29++ >= (unint64_t)[v5 count];
        if (v34) {
          goto LABEL_28;
        }
      }
      v35 = v48;
      if (v29 - 1 < (unint64_t)[v5 count]) {
        [v5 insertObject:v28 atIndex:v29];
      }
    }
    else
    {
LABEL_28:
      [v5 addObject:v28];
      v35 = v48;
    }

    int v17 = v50;
  }
  if (v17)
  {
    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"Loop" value:0 table:0];
    v38 = +[UIImage systemImageNamed:@"repeat"];
    v39 = +[UICommand commandWithTitle:v37 image:v38 action:"toggleLoop:" propertyList:0];

    v40 = [(CRLMediaEditor *)self loopToggledControlState];
    [v39 setState:[v40 stateValue]];
    v59 = v39;
    v41 = +[NSArray arrayWithObjects:&v59 count:1];
    v42 = +[UIMenu menuWithTitle:&stru_101538650 image:0 identifier:@"CRLLoopMenuIdentifier" options:1 children:v41];

    if ([v5 count])
    {
      unint64_t v43 = 1;
      while (1)
      {
        uint64_t v44 = objc_opt_class();
        v45 = [v5 objectAtIndexedSubscript:v43 - 1];
        v46 = sub_1002469D0(v44, v45);

        if (v46)
        {
          v47 = [v46 identifier];

          if (v47 == @"CRLCutCopyPasteMenuIdentifier") {
            break;
          }
        }
        BOOL v34 = v43++ >= (unint64_t)[v5 count];
        if (v34) {
          goto LABEL_37;
        }
      }
      if (v43 - 1 < (unint64_t)[v5 count]) {
        [v5 insertObject:v42 atIndex:v43];
      }
    }
    else
    {
LABEL_37:
      [v5 addObject:v42];
    }
  }
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  -[CRLMediaEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    uint64_t v24 = *(void *)v32;
    do
    {
      id v12 = 0;
      id v25 = v10;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v12);
        id v14 = [v13 crlaxValueForKey:@"children"];
        if ([v14 count])
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v15 = v14;
          id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (!v16) {
            goto LABEL_22;
          }
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (1)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              long long v21 = [v20 title];
              if ([v21 length])
              {
                id v22 = [v20 state];

                if (v22 != (id)1) {
                  continue;
                }
                long long v21 = [v20 title];
                [v7 addObject:v21];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (!v17)
            {
              uint64_t v11 = v24;
              id v10 = v25;
              goto LABEL_22;
            }
          }
        }
        id v15 = [v13 title];
        if ([v15 length])
        {
          id v23 = [v13 state];

          if (v23 != (id)1) {
            goto LABEL_23;
          }
          id v15 = [v13 title];
          [v7 addObject:v15];
        }
LABEL_22:

LABEL_23:
        id v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }
}

@end