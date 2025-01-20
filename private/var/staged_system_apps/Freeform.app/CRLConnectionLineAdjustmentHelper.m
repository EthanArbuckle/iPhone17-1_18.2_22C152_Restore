@interface CRLConnectionLineAdjustmentHelper
+ (id)commandsForAdjustingConnectionLines:(id)a3 infosToRemove:(id)a4 editingCoordinator:(id)a5 withIcc:(id)a6;
+ (id)infosForAdjustingConnectionLinesAfterRemove:(id)a3;
+ (id)p_commandsForUpdateConnectionLineInfoGeometry:(id)a3 withBoardItemOwner:(id)a4 withNewPathSource:(id *)a5;
+ (id)p_getUpdatedMagnetForClineItem:(id)a3 forHeadMagnet:(BOOL)a4 withOriginalLayout:(id)a5 withIcc:(id)a6 newConnectedInfo:(id *)a7;
+ (unint64_t)p_getUpdatedMagnetTypeWithPosition:(CGPoint)a3 inLayout:(id)a4;
+ (void)p_computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4 forConnectionLine:(id)a5 withBoardItemOwner:(id)a6;
+ (void)transferLaidOutInfoGeometryAndPathSourceFrom:(id)a3 to:(id)a4 withBoardItemOwner:(id)a5;
@end

@implementation CRLConnectionLineAdjustmentHelper

+ (id)infosForAdjustingConnectionLinesAfterRemove:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableSet set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        v11 = [v9 parentInfo];
        v12 = sub_1002469D0(v10, v11);

        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E7280);
          }
          v14 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v40 = v13;
            __int16 v41 = 2082;
            v42 = "+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:]";
            __int16 v43 = 2082;
            v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m";
            __int16 v45 = 1024;
            int v46 = 24;
            __int16 v47 = 2082;
            v48 = "currentParent";
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E72A0);
          }
          v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v18 = v15;
            v19 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v40 = v13;
            __int16 v41 = 2114;
            v42 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:]");
          v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m"];
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 24, 0, "invalid nil value for '%{public}s'", "currentParent");
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v49 count:16];
    }
    while (v6);
  }

  v20 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = v4;
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v30 + 1) + 8 * i) childInfos];
        [v20 addObjectsFromArray:v26];
      }
      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }

  v27 = [v20 crl_setBySubtractingSet:obj];

  return v27;
}

+ (id)commandsForAdjustingConnectionLines:(id)a3 infosToRemove:(id)a4 editingCoordinator:(id)a5 withIcc:(id)a6
{
  id v9 = a3;
  id v60 = a4;
  id v10 = a5;
  id v57 = a6;
  id v67 = +[NSMutableArray array];
  v56 = v10;
  v11 = [v10 mainBoard];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v76 objects:v81 count:16];
  v59 = v12;
  v65 = v11;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v77;
    uint64_t v58 = *(void *)v77;
    do
    {
      v16 = 0;
      id v61 = v14;
      do
      {
        if (*(void *)v77 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v16);
        if ([v17 isMemberOfClass:objc_opt_class()])
        {
          id v18 = v17;
          uint64_t v19 = [v18 getConnectedFromWithBoardItemOwner:v11];
          uint64_t v20 = [v18 getConnectedToWithBoardItemOwner:v11];
          if (v19 | v20)
          {
            id v75 = 0;
            uint64_t v21 = [a1 p_commandsForUpdateConnectionLineInfoGeometry:v18 withBoardItemOwner:v11 withNewPathSource:&v75];
            id v22 = v75;
            [v67 addObjectsFromArray:v21];
            uint64_t v23 = objc_opt_class();
            v62 = v22;
            uint64_t v24 = sub_1002469D0(v23, v22);
            id v25 = (id)v20;
            v26 = [v18 connectionLinePathSource];
            uint64_t v27 = [v26 headMagnet];
            if (!v27) {
              goto LABEL_11;
            }
            v28 = (void *)v27;
            unsigned int v29 = [v60 containsObject:v25];

            if (v29)
            {

              v26 = [v57 layoutForInfo:v25];
              id v74 = 0;
              long long v30 = [a1 p_getUpdatedMagnetForClineItem:v18 forHeadMagnet:1 withOriginalLayout:v26 withIcc:v57 newConnectedInfo:&v74];
              id v25 = v74;
              [v24 setHeadMagnet:v30];

LABEL_11:
            }
            id v31 = (id)v19;
            v63 = (void *)v21;
            if (v19)
            {
              id v32 = v31;
              long long v33 = [v18 connectionLinePathSource];
              uint64_t v34 = [v33 tailMagnet];
              if (!v34) {
                goto LABEL_16;
              }
              long long v35 = (void *)v34;
              unsigned int v36 = [v60 containsObject:v32];

              if (v36)
              {

                long long v33 = [v57 layoutForInfo:v32];
                id v73 = 0;
                long long v37 = [a1 p_getUpdatedMagnetForClineItem:v18 forHeadMagnet:0 withOriginalLayout:v33 withIcc:v57 newConnectedInfo:&v73];
                id v32 = v73;
                [v24 setTailMagnet:v37];

LABEL_16:
              }
            }
            else
            {
              id v32 = 0;
            }
            v38 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v18 connectedItem:v25 chirality:1 pathSource:v24];
            [v67 addObject:v38];
            v39 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v18 connectedItem:v32 chirality:0 pathSource:v24];
            [v67 addObject:v39];

            uint64_t v15 = v58;
            id v12 = v59;
            v11 = v65;
            id v14 = v61;
          }
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v14);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v40 = v60;
  id v41 = [v40 countByEnumeratingWithState:&v69 objects:v80 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v70;
    id v64 = v40;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v70 != v43) {
          objc_enumerationMutation(v40);
        }
        __int16 v45 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if ([v45 isMemberOfClass:objc_opt_class()])
        {
          id v46 = v45;
          uint64_t v47 = [v46 getConnectedFromWithBoardItemOwner:v11];
          uint64_t v48 = [v46 getConnectedToWithBoardItemOwner:v11];
          if (v47 | v48)
          {
            id v68 = 0;
            v49 = [a1 p_commandsForUpdateConnectionLineInfoGeometry:v46 withBoardItemOwner:v11 withNewPathSource:&v68];
            id v50 = v68;
            [v67 addObjectsFromArray:v49];
            uint64_t v51 = objc_opt_class();
            v52 = sub_1002469D0(v51, v50);
            if (!v47 || ([v40 containsObject:v47] & 1) == 0)
            {
              [v52 setTailMagnet:0];
              v53 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v46 connectedItem:0 chirality:0 pathSource:v52];
              [v67 addObject:v53];

              id v40 = v64;
            }
            if (!v48 || ([v40 containsObject:v48] & 1) == 0)
            {
              [v52 setHeadMagnet:0];
              v54 = [[_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc] initWithConnectionLine:v46 connectedItem:0 chirality:1 pathSource:v52];
              [v67 addObject:v54];

              id v40 = v64;
            }

            v11 = v65;
          }
        }
      }
      id v42 = [v40 countByEnumeratingWithState:&v69 objects:v80 count:16];
    }
    while (v42);
  }

  return v67;
}

+ (id)p_getUpdatedMagnetForClineItem:(id)a3 forHeadMagnet:(BOOL)a4 withOriginalLayout:(id)a5 withIcc:(id)a6 newConnectedInfo:(id *)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E72C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101094044();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E72E0);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v14);
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLConnectionLineAdjustmentHelper p_getUpdatedMagnetForClineItem:forHeadMagnet:withOriginalLayout:withIcc:newConnectedInfo:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 132, 0, "invalid nil value for '%{public}s'", "originalLayout");
  }
  v17 = [v11 connectionLinePathSource];
  id v18 = v17;
  if (v10) {
    [v17 headMagnet];
  }
  else {
  uint64_t v19 = [v17 tailMagnet];
  }
  [v19 magnetNormalizedPosition];
  double v41 = v21;
  double v42 = v20;

  id v22 = [v12 pureGeometry];
  uint64_t v23 = v22;
  if (v22)
  {
    [v22 fullTransform];
    float64x2_t v24 = v47;
    float64x2_t v25 = v48;
    float64x2_t v26 = v49;
  }
  else
  {
    float64x2_t v26 = 0uLL;
    float64x2_t v48 = 0u;
    float64x2_t v49 = 0u;
    float64x2_t v47 = 0u;
    float64x2_t v24 = 0uLL;
    float64x2_t v25 = 0uLL;
  }
  float64x2_t v43 = vaddq_f64(v26, vmlaq_n_f64(vmulq_n_f64(v25, v41), v24, v42));

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1002843A4;
  v44[3] = &unk_1014E7308;
  id v27 = v12;
  id v45 = v27;
  id v28 = v11;
  id v46 = v28;
  unsigned int v29 = [v13 hitRep:v44];
  long long v30 = [v29 repForSelecting];
  id v31 = [v30 layout];

  if (v31)
  {
    uint64_t v32 = objc_opt_class();
    long long v33 = [v31 info];
    uint64_t v34 = sub_1002469D0(v32, v33);

    [v18 getNewNormalizedPositionForMagnet:v10 withPreviousLayout:v27 onNewLayout:v31];
    long long v37 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", objc_msgSend(a1, "p_getUpdatedMagnetTypeWithPosition:inLayout:", v31, *(_OWORD *)&v43), v35, v36);
  }
  else
  {
    long long v37 = 0;
    uint64_t v34 = 0;
  }
  id v38 = v34;
  *a7 = v38;

  return v37;
}

+ (unint64_t)p_getUpdatedMagnetTypeWithPosition:(CGPoint)a3 inLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v7 = 7;
  for (uint64_t i = 2; i != 6; ++i)
  {
    [a4 getCardinalPositionFromType:i];
    if (sub_1000653B4(v9, v10, x, y) < 10.0) {
      unint64_t v7 = i;
    }
  }
  return v7;
}

+ (id)p_commandsForUpdateConnectionLineInfoGeometry:(id)a3 withBoardItemOwner:(id)a4 withNewPathSource:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = +[NSMutableArray array];
  id v17 = 0;
  id v18 = 0;
  [a1 p_computeLayoutInfoGeometry:&v18 andPathSource:&v17 forConnectionLine:v9 withBoardItemOwner:v8];

  id v11 = v18;
  id v12 = v17;
  id v13 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v9 geometry:v11];
  [v10 addObject:v13];
  id v14 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v9 pathSource:v12];

  [v10 addObject:v14];
  id v15 = v12;

  *a5 = v15;

  return v10;
}

+ (void)transferLaidOutInfoGeometryAndPathSourceFrom:(id)a3 to:(id)a4 withBoardItemOwner:(id)a5
{
  id v11 = 0;
  id v12 = 0;
  id v8 = a4;
  [a1 p_computeLayoutInfoGeometry:&v12 andPathSource:&v11 forConnectionLine:a3 withBoardItemOwner:a5];
  id v9 = v12;
  id v10 = v11;
  [v8 setGeometry:v9];
  [v8 setPathSource:v10];
}

+ (void)p_computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4 forConnectionLine:(id)a5 withBoardItemOwner:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [v9 getConnectedFromWithBoardItemOwner:v10];
  uint64_t v12 = [v9 getConnectedToWithBoardItemOwner:v10];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1002849D4;
  id v40 = sub_1002849E4;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_1002849D4;
  uint64_t v34 = sub_1002849E4;
  id v35 = 0;
  if (v11 | v12)
  {
    float64x2_t v25 = a4;
    id v17 = +[NSMutableArray arrayWithObject:v9];
    v16 = v17;
    if (v11) {
      [v17 addObject:v11];
    }
    if (v12) {
      [v16 addObject:v12];
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1002849EC;
    v26[3] = &unk_1014E7370;
    id v18 = v9;
    id v27 = v18;
    id v28 = &v36;
    unsigned int v29 = &v30;
    +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:v16 useInBlock:v26];
    uint64_t v19 = objc_opt_class();
    double v20 = sub_1002469D0(v19, (void *)v31[5]);
    double v21 = [v18 connectionLinePathSource];
    id v22 = [v21 headMagnet];
    [v20 setHeadMagnet:v22];

    uint64_t v23 = [v18 connectionLinePathSource];
    float64x2_t v24 = [v23 tailMagnet];
    [v20 setTailMagnet:v24];

    a4 = v25;
  }
  else
  {
    uint64_t v13 = [v9 geometry];
    id v14 = (void *)v37[5];
    v37[5] = v13;

    uint64_t v15 = [v9 pathSource];
    v16 = (void *)v31[5];
    v31[5] = v15;
  }

  if (a3) {
    *a3 = (id) v37[5];
  }
  if (a4) {
    *a4 = (id) v31[5];
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

@end