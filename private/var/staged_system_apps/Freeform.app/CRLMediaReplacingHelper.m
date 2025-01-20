@interface CRLMediaReplacingHelper
- (CGPoint)p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6;
- (CRLBoardItemEditor)editor;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLMediaReplacingHelper)initWithEditor:(id)a3;
- (NSSet)boardItems;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (id)p_commandsToSwapConnectionsFromInfo:(id)a3 infoMap:(id)a4;
- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6;
- (void)p_replaceCanvasElementInfo:(id)a3 withFileAtURL:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)p_replaceCanvasElementInfo:(id)a3 withInfoFromInfoImporter:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9;
- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7;
- (void)replaceSelectedMediaWithData:(id)a3;
- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5;
- (void)setEditor:(id)a3;
- (void)showMediaReplaceUI:(id)a3;
@end

@implementation CRLMediaReplacingHelper

- (CRLMediaReplacingHelper)initWithEditor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLMediaReplacingHelper;
  v6 = [(CRLMediaReplacingHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_editor, a3);
  }

  return v7;
}

- (NSSet)boardItems
{
  return [(CRLBoardItemEditor *)self->_editor boardItems];
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return [(CRLBoardItemEditor *)self->_editor editingCoordinator];
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return [(CRLBoardItemEditor *)self->_editor interactiveCanvasController];
}

- (void)showMediaReplaceUI:(id)a3
{
  v4 = [(CRLMediaReplacingHelper *)self interactiveCanvasController];
  if ([v4 hasSelectedInfosInMultipleContainers])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7390);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010941A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E73B0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper showMediaReplaceUI:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:56 isFatal:0 description:"Cannot show media replace UI with cross-container selection!"];
  }
  [v4 endEditing];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100284FE4;
  v12[3] = &unk_1014CBE78;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  objc_super v9 = objc_retainBlock(v12);
  if (+[CRLiOSKeyboardMonitor keyboardIsVisibleAndDocked])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100285278;
    v10[3] = &unk_1014CE158;
    v11 = v9;
    +[CRLiOSKeyboardMonitor afterKeyboardAnimationPerformBlock:v10];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (id)p_commandsToSwapConnectionsFromInfo:(id)a3 infoMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLMediaReplacingHelper *)self interactiveCanvasController];
  objc_super v9 = [v8 repForInfo:v6];
  v10 = (objc_class *)objc_opt_class();
  v54 = v7;
  v11 = [v7 objectForKeyedSubscript:v6];
  uint64_t v12 = sub_10024715C(v10, v11);

  id v51 = +[NSMutableArray array];
  v53 = (void *)v12;
  if (v12)
  {
    id v13 = [v9 layout];
    v14 = [v13 connectedLayouts];
    id v15 = [v14 count];

    if (v15)
    {
      v49 = v8;
      id v50 = v6;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v16 = [v9 layout];
      v17 = [v16 connectedLayouts];

      id obj = v17;
      id v56 = [v17 countByEnumeratingWithState:&v58 objects:v64 count:16];
      v18 = 0;
      if (!v56) {
        goto LABEL_21;
      }
      uint64_t v55 = *(void *)v59;
      v57 = v9;
      while (1)
      {
        for (i = 0; i != v56; i = (char *)i + 1)
        {
          if (*(void *)v59 != v55) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v21 = [v20 connectionLineInfo];
          v22 = [(CRLMediaReplacingHelper *)self editingCoordinator];
          v23 = [v22 mainBoard];
          v24 = [v21 getConnectedFromWithBoardItemOwner:v23];

          v25 = [(CRLMediaReplacingHelper *)self editingCoordinator];
          v26 = [v25 mainBoard];
          v27 = [v21 getConnectedToWithBoardItemOwner:v26];

          v28 = [v21 connectionLinePathSource];
          v29 = [v9 info];

          if (v24 == v29)
          {
            id v31 = [v54 objectForKeyedSubscript:v27];

            if (!v31) {
              id v31 = v27;
            }
            v41 = [v57 layout];
            [(CRLMediaReplacingHelper *)self p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:v20 withOldLayout:v41 withNewInfo:v53 forLineEnd:10];
            double v43 = v42;
            double v45 = v44;
            v46 = [v28 tailMagnet];
            [v46 setMagnetNormalizedPosition:v43, v45];

            v38 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v21 connectedItem:v53 chirality:0 pathSource:v28];
            v39 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v21 connectedItem:v31 chirality:1 pathSource:v28];
            v63[0] = v38;
            v63[1] = v39;
            v40 = v63;
          }
          else
          {
            v30 = [v9 info];

            if (v27 != v30) {
              goto LABEL_19;
            }
            id v31 = [v54 objectForKeyedSubscript:v24];

            if (!v31) {
              id v31 = v24;
            }
            v32 = [v57 layout];
            [(CRLMediaReplacingHelper *)self p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:v20 withOldLayout:v32 withNewInfo:v53 forLineEnd:11];
            double v34 = v33;
            double v36 = v35;
            v37 = [v28 headMagnet];
            [v37 setMagnetNormalizedPosition:v34, v36];

            v38 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v21 connectedItem:v31 chirality:0 pathSource:v28];
            v39 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v21 connectedItem:v53 chirality:1 pathSource:v28];
            v62[0] = v38;
            v62[1] = v39;
            v40 = v62;
          }
          v18 = v31;
          v47 = +[NSArray arrayWithObjects:v40 count:2];

          if (v47)
          {
            [v51 addObjectsFromArray:v47];
          }
          objc_super v9 = v57;
LABEL_19:
        }
        id v56 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (!v56)
        {
LABEL_21:

          id v8 = v49;
          id v6 = v50;
          goto LABEL_23;
        }
      }
    }
  }
  v18 = 0;
LABEL_23:

  return v51;
}

- (CGPoint)p_getNewMagnetNormalizedPositionAfterReplacingMediaWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6 == 11) {
    id v12 = [v9 headMagnetType];
  }
  else {
    id v12 = [v9 tailMagnetType];
  }
  id v13 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3010000000;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  v35[3] = "";
  if (a6 == 11) {
    [v9 headMagnetCanvasPosition];
  }
  else {
    [v9 tailMagnetCanvasPosition];
  }
  uint64_t v36 = v14;
  uint64_t v37 = v15;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x3010000000;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  v32 = "";
  if (a6 == 11) {
    [v9 headMagnetNormalizedPosition];
  }
  else {
    [v9 tailMagnetNormalizedPosition];
  }
  uint64_t v33 = v16;
  uint64_t v34 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10028594C;
  v23[3] = &unk_1014E3198;
  id v27 = v13;
  v25 = v35;
  id v18 = v9;
  unint64_t v28 = a6;
  id v24 = v18;
  v26 = &v29;
  [v11 withTemporaryLayoutPerform:v23];
  double v19 = v30[4];
  double v20 = v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  double v21 = v19;
  double v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(void))a7;
  if ([v13 count] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7410);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010942B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7430);
    }
    uint64_t v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:]");
    double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:179 isFatal:0 description:"The URL array must only contain one object."];
  }
  double v20 = [v13 firstObject];
  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100285D44;
    v21[3] = &unk_1014E7458;
    double v22 = v16;
    [(CRLMediaReplacingHelper *)self p_replaceCanvasElementInfo:v12 withFileAtURL:v20 interactively:1 allowedTypes:v14 actionString:v15 queue:&_dispatch_main_q completion:v21];
  }
  else if (v16)
  {
    v16[2](v16);
  }
}

- (void)replaceSelectedMediaWithData:(id)a3
{
  id v6 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];

  -[CRLMediaReplacingHelper replaceSelectedMediaWithData:actionString:completion:](self, "replaceSelectedMediaWithData:actionString:completion:", v5, 0, 0, v6);
}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7478);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109433C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E7498);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper replaceSelectedMediaWithData:actionString:completion:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:197 isFatal:0 description:"The data array must only contain one object."];
  }
  id v14 = [v8 firstObject];
  if (v14)
  {
    id v15 = [(CRLMediaReplacingHelper *)self interactiveCanvasController];
    uint64_t v16 = [v15 editingCoordinator];
    uint64_t v17 = [v16 boardItemFactory];

    id v18 = [CRLBoardItemImporter alloc];
    double v19 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    double v20 = [v17 assetOwner];
    double v21 = [(CRLPreinsertionAssetWrapper *)v19 initWithAlreadyInsertedAsset:v14 owner:v20];
    double v22 = [(CRLBoardItemImporter *)v18 initWithData:v21 boardItemFactory:v17];

    if (v22)
    {
      [(CRLBoardItemImporter *)v22 setDelegate:self];
      v23 = v22;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100286260;
      v25[3] = &unk_1014E7458;
      id v26 = v10;
      if (self) {
        [(CRLMediaReplacingHelper *)self p_replaceCanvasElementInfo:0 withInfoFromInfoImporter:v23 interactively:1 allowedTypes:0 actionString:v9 queue:&_dispatch_main_q completion:v25];
      }
      else {

      }
      id v24 = v26;
    }
    else
    {
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      id v24 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v24);
    }

    goto LABEL_22;
  }
  if (v10)
  {
    id v15 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
LABEL_23:
  }
}

- (void)p_replaceCanvasElementInfo:(id)a3 withFileAtURL:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9
{
  BOOL v12 = a5;
  id v35 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  BOOL v34 = v12;
  if (v12 && v18 != &_dispatch_main_q)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E74B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010943C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E74D8);
    }
    double v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withFileAtURL:interactively:allowedTypes:actionString:queue:completion:]");
    double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:227 isFatal:0 description:"Can't replace media interactively without running completion blocks on the main queue."];
  }
  if (v16)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = v16;
    id v24 = [v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          if (objc_msgSend(v15, "crl_conformsToUTI:", *(void *)(*((void *)&v36 + 1) + 8 * i)))
          {

            goto LABEL_23;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    unint64_t v28 = 0;
  }
  else
  {
LABEL_23:
    uint64_t v29 = [CRLBoardItemImporter alloc];
    v30 = [(CRLMediaReplacingHelper *)self editingCoordinator];
    uint64_t v31 = [v30 boardItemFactory];
    unint64_t v28 = [(CRLBoardItemImporter *)v29 initWithURL:v15 boardItemFactory:v31];

    [(CRLBoardItemImporter *)v28 setDelegate:self];
  }
  v32 = v28;
  uint64_t v33 = v32;
  if (self) {
    [(CRLMediaReplacingHelper *)self p_replaceCanvasElementInfo:v35 withInfoFromInfoImporter:v32 interactively:v34 allowedTypes:v16 actionString:v17 queue:v18 completion:v19];
  }
  else {
}
  }

- (void)p_replaceCanvasElementInfo:(id)a3 withInfoFromInfoImporter:(id)a4 interactively:(BOOL)a5 allowedTypes:(id)a6 actionString:(id)a7 queue:(id)a8 completion:(id)a9
{
  BOOL v41 = a5;
  id v14 = a3;
  id v40 = a6;
  id v42 = a7;
  dispatch_queue_t queue = (dispatch_queue_t)a8;
  id v15 = a9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = [(CRLMediaReplacingHelper *)self boardItems];
    unsigned __int8 v17 = [v16 containsObject:v14];

    if ((v17 & 1) == 0)
    {
      int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E74F8);
      }
      id v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101094514((uint64_t)v14, v18, v19);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E7518);
      }
      double v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109444C(v20, v18);
      }
      double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaReplacingHelper p_replaceCanvasElementInfo:withInfoFromInfoImporter:interactively:allowedTypes:actionString:queue:completion:]");
      double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMediaReplacingHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v21, v22, 254, 0, "Invalid single info to replace: %@", v14 file lineNumber isFatal description];
    }
  }
  id v23 = [(CRLMediaReplacingHelper *)self interactiveCanvasController];
  id v24 = v23;
  if (a4)
  {
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x2810000000;
    v82[3] = "";
    int v83 = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    char v81 = 0;
    v78[0] = 0;
    v78[1] = v78;
    v78[2] = 0x2020000000;
    char v79 = 0;
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = sub_100286E5C;
    v76 = sub_100286E6C;
    id v77 = 0;
    if (v41)
    {
      id v25 = [v23 layerHost];
      uint64_t v26 = +[NSBundle mainBundle];
      id v27 = [v26 localizedStringForKey:@"Replacing Media…" value:0 table:0];
      unint64_t v28 = [a4 progress];
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      void v63[2] = sub_100286E74;
      v63[3] = &unk_1014E7588;
      v68 = v78;
      id v64 = a4;
      v69 = v82;
      id v67 = v15;
      v70 = v80;
      v65 = queue;
      v71 = &v72;
      id v66 = v24;
      uint64_t v29 = [v25 beginModalOperationWithLocalizedMessage:v27 progress:v28 cancelHandler:v63];
      v30 = (void *)v73[5];
      v73[5] = v29;
    }
    uint64_t v31 = [v24 editingCoordinator];
    [v31 suspendCollaborationWithReason:@"Importing media for replacement"];

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1002870CC;
    v49[3] = &unk_1014E7718;
    id v50 = queue;
    long long v58 = v82;
    long long v59 = &v72;
    long long v60 = v80;
    id v51 = v24;
    id v52 = a4;
    v53 = self;
    BOOL v62 = v41;
    id v57 = v15;
    long long v61 = v78;
    id v54 = v14;
    id v55 = v42;
    id v56 = @"Importing media for replacement";
    [v52 importBoardItemWithCompletionHandler:v49];

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(v78, 8);
    _Block_object_dispose(v80, 8);
    _Block_object_dispose(v82, 8);
  }
  else if (v15)
  {
    id v32 = objc_alloc((Class)NSError);
    v84[0] = NSLocalizedDescriptionKey;
    uint64_t v33 = +[NSBundle mainBundle];
    BOOL v34 = [v33 localizedStringForKey:@"Couldn’t Add Media File" value:0 table:0];
    v85[0] = v34;
    v84[1] = NSLocalizedRecoverySuggestionErrorKey;
    id v35 = +[NSBundle mainBundle];
    long long v36 = [v35 localizedStringForKey:@"Your media file wasn’t added because it’s an unsupported format." value:0 table:0];
    v85[1] = v36;
    v84[2] = @"CRLBoardItemImporterErrorMediaTypeKey";
    v85[2] = &off_10155DBC8;
    long long v37 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:3];
    id v38 = [v32 initWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:103 userInfo:v37];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002882C0;
    block[3] = &unk_1014E7760;
    BOOL v48 = v41;
    id v45 = v24;
    id v46 = v38;
    id v47 = v15;
    id v39 = v38;
    dispatch_async(queue, block);
  }
}

- (void)boardItemImporter:(id)a3 needsMediaCompatibilityFeedbackWithReasons:(int64_t)a4 forMediaType:(int64_t)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = [(CRLMediaReplacingHelper *)self interactiveCanvasController];
  id v13 = [v12 layerHost];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002884BC;
  v16[3] = &unk_1014E7788;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [v13 presentMediaCompatibilityAlertWithReasons:a4 forMediaType:a5 forSingleMediaObject:1 completionHandler:v16];
}

- (CRLBoardItemEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end