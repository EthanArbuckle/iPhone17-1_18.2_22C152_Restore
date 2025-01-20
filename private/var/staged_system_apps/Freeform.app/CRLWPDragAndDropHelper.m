@interface CRLWPDragAndDropHelper
- (BOOL)dragIsStorageLocal;
- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5;
- (BOOL)p_allowedToHandleDragInfo:(id)a3;
- (BOOL)p_importingDrawablesOrMoviesFromDragInfo:(id)a3;
- (BOOL)p_insertPanelIsDragSourceFromDragInfo:(id)a3;
- (BOOL)p_wantsToPreventDragOperationForDragInfo:(id)a3 atPoint:(CGPoint)a4;
- (CGPoint)adjustedUnscaledPoint:(CGPoint)a3;
- (CGPoint)dragAndDropNaturalPoint;
- (CRLWPDragAndDropHelper)initWithOwningRep:(id)a3;
- (CRLWPDragAndDropHelperOwning)owningRep;
- (id)p_itemSourceForDragInfo:(id)a3;
- (id)p_sourceTextEditorForDragInfo:(id)a3;
- (id)sourceSelectionForDragInfo:(id)a3;
- (id)sourceSelectionPathForDragInfo:(id)a3;
- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4;
- (unint64_t)p_resolveDragOperationFromMask:(unint64_t)a3;
- (unint64_t)sourceChangeCountForDragInfo:(id)a3;
- (void)setDragAndDropNaturalPoint:(CGPoint)a3;
- (void)setDragIsStorageLocal:(BOOL)a3;
@end

@implementation CRLWPDragAndDropHelper

- (CRLWPDragAndDropHelper)initWithOwningRep:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLWPDragAndDropHelper;
  v5 = [(CRLWPDragAndDropHelper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningRep, v4);
    v6->_dragAndDropNaturalPoint = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v6;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unint64_t v8 = (unint64_t)[v7 dragOperationMask];
  -[CRLWPDragAndDropHelper adjustedUnscaledPoint:](self, "adjustedUnscaledPoint:", x, y);
  double v10 = v9;
  double v12 = v11;
  v13 = [(CRLWPDragAndDropHelper *)self owningRep];
  [v13 convertNaturalPointFromUnscaledCanvas:v10, v12];
  double v15 = v14;
  double v17 = v16;

  unint64_t v18 = 0;
  if (![(CRLWPDragAndDropHelper *)self p_allowedToHandleDragInfo:v7] || !v8) {
    goto LABEL_64;
  }
  v19 = [(CRLWPDragAndDropHelper *)self p_itemSourceForDragInfo:v7];
  uint64_t v20 = objc_opt_class();
  v21 = [v7 inProcessDraggingSources];
  v22 = [v21 firstObject];
  v23 = sub_1002469D0(v20, v22);

  v24 = [(CRLWPDragAndDropHelper *)self owningRep];
  v25 = [v24 storage];
  v26 = [v23 storage];
  if (v25 == v26)
  {
    v74 = v23;
    unint64_t v28 = v8;
    v29 = v19;
    v30 = [(CRLWPDragAndDropHelper *)self owningRep];
    v31 = [v30 storage];
    id v32 = [v31 changeCount];
    unint64_t v33 = [(CRLWPDragAndDropHelper *)self sourceChangeCountForDragInfo:v7];

    if (v32 == (id)v33)
    {
      v27 = [(CRLWPDragAndDropHelper *)self sourceSelectionForDragInfo:v7];
    }
    else
    {
      v27 = 0;
    }
    v19 = v29;
    unint64_t v8 = v28;
    v23 = v74;
  }
  else
  {

    v27 = 0;
  }
  id v34 = v27;
  if ([(CRLWPDragAndDropHelper *)self p_insertPanelIsDragSourceFromDragInfo:v7])
  {
    unint64_t v35 = 0;
    goto LABEL_48;
  }
  v75 = v19;
  v36 = [v23 storage];
  v37 = [(CRLWPDragAndDropHelper *)self owningRep];
  v38 = [v37 storage];
  if (v36 != v38 || !v34)
  {

    goto LABEL_16;
  }
  v39 = [(CRLWPDragAndDropHelper *)self owningRep];
  unsigned __int8 v40 = [v39 isDragPoint:v34 inSelection:1 includeEndpoints:v15, v17];

  if ((v40 & 1) == 0)
  {
LABEL_16:
    v41 = [v23 storage];
    v42 = [(CRLWPDragAndDropHelper *)self owningRep];
    v43 = [v42 storage];
    v44 = v43;
    if (v41 == v43 && v34)
    {
      v45 = [(CRLWPDragAndDropHelper *)self owningRep];
      unsigned __int8 v46 = [v45 isDragPoint:v34 inSelection:0 includeEndpoints:v15, v17];

      if (v46)
      {
LABEL_19:
        unint64_t v35 = 0;
        goto LABEL_20;
      }
    }
    else
    {

      if (v41 == v44) {
        goto LABEL_19;
      }
    }
    v47 = [(CRLWPDragAndDropHelper *)self owningRep];
    v48 = [v47 storageForDragDropOperation];

    if (v48)
    {
      v49 = [(CRLWPDragAndDropHelper *)self owningRep];
      v50 = [v49 storage];

      if (v50 == v48)
      {
        v54 = [(CRLWPDragAndDropHelper *)self owningRep];
        uint64_t v53 = [v54 selectionForDragAndDropNaturalPoint:v15, v17];
      }
      else
      {
        id v51 = [v48 range];
        uint64_t v53 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v51, v52);
      }
      v55 = [(CRLWPDragAndDropHelper *)self owningRep];
      v73 = v48;
      v56 = [v55 textEditorForDropIntoStorage:v48];

      if (!v56)
      {
        uint64_t v72 = v53;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1B28);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101071934();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1B48);
        }
        v57 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v57);
        }
        v58 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]");
        v59 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v58, v59, 146, 0, "invalid nil value for '%{public}s'", "targetTextEditor");

        uint64_t v53 = v72;
      }
      v60 = [v7 platformDraggingInfo];
      v61 = v56;
      v62 = (void *)v53;
      unsigned int v63 = [v56 canPasteWithItemSource:v75 selection:v53 sender:v60];

      if (v63)
      {
        if ((v8 & 2) != 0 && v23 == 0) {
          unint64_t v65 = v8 & 0xFFFFFFFFFFFFFFFDLL;
        }
        else {
          unint64_t v65 = v8;
        }
        unint64_t v35 = [(CRLWPDragAndDropHelper *)self p_resolveDragOperationFromMask:v65];
      }
      else
      {
        unint64_t v35 = 0;
      }

      v48 = v73;
      v19 = v75;
    }
    else
    {
      unint64_t v35 = 0;
      v19 = v75;
    }

    goto LABEL_48;
  }
  unint64_t v35 = 64;
LABEL_20:
  v19 = v75;
LABEL_48:

  if (v35)
  {
    if (-[CRLWPDragAndDropHelper p_wantsToPreventDragOperationForDragInfo:atPoint:](self, "p_wantsToPreventDragOperationForDragInfo:atPoint:", v7, v15, v17))
    {
      unint64_t v18 = 64;
    }
    else
    {
      unint64_t v18 = v35;
    }
    if ((v18 & 0xFFFFFFFFFFFFFFBFLL) != 0 && (v18 & v8) == 0)
    {
      unsigned int v66 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1B68);
      }
      v67 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v77 = v66;
        __int16 v78 = 2082;
        v79 = "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]";
        __int16 v80 = 2082;
        v81 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m";
        __int16 v82 = 1024;
        int v83 = 179;
        __int16 v84 = 2048;
        unint64_t v85 = v18;
        __int16 v86 = 2048;
        unint64_t v87 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Drag operation %zi not supported by the sender with mask %zi.", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1B88);
      }
      v68 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v68);
      }
      v69 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper dragOperationForDragInfo:atUnscaledPoint:]");
      v70 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v69, v70, 179, 0, "Drag operation %zi not supported by the sender with mask %zi.", v18, v8);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
LABEL_64:

  return v18;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  -[CRLWPDragAndDropHelper adjustedUnscaledPoint:](self, "adjustedUnscaledPoint:", x, y);
  double v10 = v9;
  double v12 = v11;
  v13 = [(CRLWPDragAndDropHelper *)self owningRep];
  [v13 convertNaturalPointFromUnscaledCanvas:v10, v12];
  double v15 = v14;
  double v17 = v16;

  unint64_t v18 = [(CRLWPDragAndDropHelper *)self owningRep];
  v19 = [v18 interactiveCanvasController];

  uint64_t v20 = [v19 editorController];
  v21 = [v20 selectionPath];

  uint64_t v122 = [(CRLWPDragAndDropHelper *)self p_itemSourceForDragInfo:v8];
  v22 = [(CRLWPDragAndDropHelper *)self owningRep];
  v23 = [v22 textEditor];

  if (v23)
  {
    v24 = [(CRLWPDragAndDropHelper *)self owningRep];
    v25 = [v24 textEditor];
  }
  else
  {
    v25 = [(CRLWPDragAndDropHelper *)self p_sourceTextEditorForDragInfo:v8];
  }
  v123 = v8;
  if (v25)
  {
    v26 = [(CRLWPDragAndDropHelper *)self sourceSelectionForDragInfo:v8];
    if (!v26)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1BA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101071BB4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1BC8);
      }
      v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v27);
      }
      unint64_t v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]");
      v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 234, 0, "invalid nil value for '%{public}s'", "dragSelection");

      v26 = 0;
    }
    if (([v26 isRange] & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      v30 = v26;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1BE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101071B14();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1C08);
      }
      v31 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v31);
      }
      id v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]");
      unint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v32 file:v33 lineNumber:235 isFatal:0 description:"Invalid drag selection"];

      v26 = v30;
    }
  }
  else
  {
    v26 = 0;
  }
  if ([(CRLWPDragAndDropHelper *)self dragIsStorageLocal]
    && -[CRLWPDragAndDropHelper p_wantsToPreventDragOperationForDragInfo:atPoint:](self, "p_wantsToPreventDragOperationForDragInfo:atPoint:", v8, v15, v17))
  {
    BOOL v34 = 0;
    unint64_t v35 = (void *)v122;
  }
  else
  {
    v36 = [(CRLWPDragAndDropHelper *)self owningRep];
    v37 = [v36 storageForDragDropOperation];

    v38 = [(CRLWPDragAndDropHelper *)self owningRep];
    v39 = [v38 storage];

    if (v39 == v37)
    {
      v42 = [(CRLWPDragAndDropHelper *)self owningRep];
      v121 = [v42 selectionForDragAndDropNaturalPoint:v15, v17];
    }
    else
    {
      id v40 = [v37 range];
      v121 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v40, v41);
    }
    v43 = [(CRLWPDragAndDropHelper *)self owningRep];
    uint64_t v44 = [v43 textEditorForDropIntoStorage:v37];

    v120 = v21;
    v117 = (void *)v44;
    if (!v44)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1C28);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101071A80();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D1C48);
      }
      v45 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v45);
      }
      unsigned __int8 v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]");
      v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v46, v47, 267, 0, "invalid nil value for '%{public}s'", "targetTextEditor");

      v21 = v120;
    }
    v48 = [v25 interactiveCanvasController];

    v118 = v25;
    v119 = v37;
    if (v25
      && v48 == v19
      && (id)-[CRLWPDragAndDropHelper p_resolveDragOperationFromMask:](self, "p_resolveDragOperationFromMask:", [v8 dragOperationMask]) == (id)2)
    {
      v49 = [v8 platformDraggingInfo];
      v50 = [v49 items];

      v113 = v50;
      id v51 = [v50 firstObject];
      uint64_t v52 = objc_opt_class();
      v112 = v51;
      uint64_t v53 = [v51 localObject];
      v54 = sub_1002469D0(v52, v53);

      v116 = [v54 reverseSelectionPath];
      v55 = [(CRLWPDragAndDropHelper *)self owningRep];
      v56 = [v55 commandController];
      [v56 openGroup];

      v57 = [(CRLWPDragAndDropHelper *)self owningRep];
      v58 = [v57 commandController];
      [v58 enableProgressiveEnqueuingInCurrentGroup];

      if (([v26 isRange] & 1) == 0)
      {
        int v59 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1C68);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010719C8((uint64_t)v26, v59);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1C88);
        }
        v60 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v60);
        }
        v61 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper handleDragOperation:withDragInfo:atUnscaledPoint:]");
        v62 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
        +[CRLAssertionHandler handleFailureInFunction:v61, v62, 298, 0, "source selection %@ is not a range", v26 file lineNumber isFatal description];
      }
      unsigned int v63 = [v26 range];
      v64 = [v121 range];
      uint64_t v111 = v65;
      v114 = v64;
      if ([(CRLWPDragAndDropHelper *)self dragIsStorageLocal]
        && ([v26 containsCharacterAtIndex:v64 withOptions:3] & 1) != 0)
      {
        unsigned int v66 = v120;
      }
      else
      {
        v81 = [v25 storage];
        v109 = [v81 length];

        v127[0] = _NSConcreteStackBlock;
        v127[1] = 3221225472;
        v127[2] = sub_1000A77F0;
        v127[3] = &unk_1014CBE78;
        id v82 = v25;
        id v128 = v82;
        v129 = v54;
        int v83 = objc_retainBlock(v127);
        ((void (*)(void))v83[2])();
        __int16 v84 = [v82 storage];

        if (v37 == v84)
        {
          if (v63 < v114)
          {
            unint64_t v85 = [v82 storage];
            __int16 v86 = (char *)[v85 length];

            id v87 = [v121 copyWithNewRange:&v86[v114 - v109] v111];
            v121 = v87;
          }
          unsigned int v66 = v120;
        }
        else
        {
          unsigned int v66 = v120;
        }
      }
      v88 = [(CRLWPDragAndDropHelper *)self owningRep];
      v89 = [v88 textEditor];
      uint64_t v110 = 2 * (v25 == v89);

      if (([v66 isEqual:v116] & 1) == 0)
      {
        v90 = [v25 storage];

        if (v37 != v90)
        {
          v91 = [(CRLWPDragAndDropHelper *)self owningRep];
          v92 = [v91 interactiveCanvasController];
          v93 = [v92 editorController];
          [v93 setSelectionPath:v120];
        }
      }
      v94 = [v25 storage];

      v95 = [v19 selectionModelTranslator];
      if (v37 == v94)
      {
        v101 = [v95 selectionPathForRange:[v121 range] onStorage:0 headCursorAffinity:1 tailCursorAffinity:2];

        id v99 = v63;
      }
      else
      {
        unsigned int v96 = [(CRLWPDragAndDropHelper *)self dragIsStorageLocal];
        if (v96) {
          id v97 = v114;
        }
        else {
          id v97 = v63;
        }
        if (v96) {
          uint64_t v98 = v111;
        }
        else {
          uint64_t v98 = 0;
        }
        [v25 storage];
        v100 = id v99 = v63;
        v101 = [v95 selectionPathForRange:v97 onStorage:v98];
      }
      v102 = [v19 selectionModelTranslator];
      v103 = [v25 storage];
      [v102 selectionPathForRange:v99 headCursorAffinity:1 tailCursorAffinity:2];
      v104 = v115 = v19;

      v105 = [[CRLCommandSelectionBehavior alloc] initWithCommitSelectionPath:v101 forwardSelectionPath:v101 reverseSelectionPath:v104 usePersistableCommitSelectionPath:1];
      v126[0] = _NSConcreteStackBlock;
      v126[1] = 3221225472;
      v126[2] = sub_1000A78B8;
      v126[3] = &unk_1014CBE78;
      v126[4] = self;
      v126[5] = v105;
      v106 = objc_retainBlock(v126);
      v107 = [v123 platformDraggingInfo];
      v79 = v117;
      __int16 v80 = v121;
      [v117 pasteWithItemSource:v122 selection:v121 sender:v107 selectRange:v110 dragBlock:v106];

      unint64_t v35 = (void *)v122;
      id v8 = v123;

      v19 = v115;
      v21 = v120;
    }
    else
    {
      v67 = v26;
      v68 = v19;
      v69 = [(CRLWPDragAndDropHelper *)self owningRep];
      v70 = [v69 textEditor];
      BOOL v71 = v70 != 0;

      if (!v70)
      {
        uint64_t v72 = [v68 editorController];
        v73 = [v72 selectionPath];

        v74 = [[CRLCommandSelectionBehavior alloc] initWithForwardSelectionPath:v73 reverseSelectionPath:v73];
        v75 = [(CRLWPDragAndDropHelper *)self owningRep];
        v76 = [v75 commandController];
        [v76 openGroupWithSelectionBehavior:v74];

        v21 = v120;
        id v8 = v123;
      }
      BOOL v77 = v70 != 0;
      __int16 v78 = [v8 platformDraggingInfo];
      v124[0] = _NSConcreteStackBlock;
      v124[1] = 3221225472;
      v124[2] = sub_1000A791C;
      v124[3] = &unk_1014CD3B8;
      BOOL v125 = v71;
      v124[4] = self;
      v79 = v117;
      __int16 v80 = v121;
      unint64_t v35 = (void *)v122;
      [v117 pasteWithItemSource:v122 selection:v121 sender:v78 selectRange:v77 dragBlock:v124];

      v19 = v68;
      v26 = v67;
    }

    BOOL v34 = 1;
    v25 = v118;
  }

  return v34;
}

- (unint64_t)sourceChangeCountForDragInfo:(id)a3
{
  v3 = [a3 platformDraggingInfo];
  id v4 = [v3 items];
  v5 = [v4 firstObject];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 localObject];
  id v8 = sub_1002469D0(v6, v7);

  id v9 = [v8 changeCount];
  return (unint64_t)v9;
}

- (id)sourceSelectionForDragInfo:(id)a3
{
  v3 = [(CRLWPDragAndDropHelper *)self sourceSelectionPathForDragInfo:a3];
  id v4 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];

  return v4;
}

- (id)sourceSelectionPathForDragInfo:(id)a3
{
  v3 = [a3 platformDraggingInfo];
  id v4 = [v3 items];
  v5 = [v4 firstObject];
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 localObject];
  id v8 = sub_1002469D0(v6, v7);

  id v9 = [v8 sourceSelectionPath];

  return v9;
}

- (CGPoint)adjustedUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  v5 = [(CRLWPDragAndDropHelper *)self owningRep];
  uint64_t v6 = [v5 interactiveCanvasController];
  [v6 viewScale];
  double v8 = y + -27.0 / v7;

  double v9 = x;
  double v10 = v8;
  result.double y = v10;
  result.CGFloat x = v9;
  return result;
}

- (BOOL)p_allowedToHandleDragInfo:(id)a3
{
  id v4 = a3;
  if ([(CRLWPDragAndDropHelper *)self p_insertPanelIsDragSourceFromDragInfo:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unsigned int v5 = ![(CRLWPDragAndDropHelper *)self p_importingDrawablesOrMoviesFromDragInfo:v4];
  }

  return v5;
}

- (id)p_itemSourceForDragInfo:(id)a3
{
  return [a3 itemSource];
}

- (BOOL)p_insertPanelIsDragSourceFromDragInfo:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [a3 inProcessDraggingSources];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          double v9 = [v8 objectForKey:@"TIAMediaBrowserCollectionViewDragSessionIdentifier"];

          if (v9)
          {
            BOOL v10 = 1;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)p_resolveDragOperationFromMask:(unint64_t)a3
{
  if ((a3 & 2) != 0) {
    return 2;
  }
  else {
    return a3 & 1;
  }
}

- (BOOL)p_wantsToPreventDragOperationForDragInfo:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (![(CRLWPDragAndDropHelper *)self p_allowedToHandleDragInfo:v7]) {
    goto LABEL_11;
  }
  uint64_t v8 = [(CRLWPDragAndDropHelper *)self owningRep];
  if (!v8) {
    goto LABEL_15;
  }
  double v9 = (void *)v8;
  int v10 = 0;
  do
  {
    v10 |= [v9 isLocked];
    uint64_t v11 = [v9 parentRep];

    double v9 = (void *)v11;
  }
  while (v11);
  if ((v10 & 1) == 0)
  {
LABEL_15:
    if ([(CRLWPDragAndDropHelper *)self dragIsStorageLocal])
    {
      long long v13 = [(CRLWPDragAndDropHelper *)self owningRep];
      long long v14 = [v13 storage];
      id v15 = [v14 changeCount];
      unint64_t v16 = [(CRLWPDragAndDropHelper *)self sourceChangeCountForDragInfo:v7];

      if (v15 == (id)v16)
      {
        id v17 = [(CRLWPDragAndDropHelper *)self sourceSelectionForDragInfo:v7];
        if (v17)
        {
          unint64_t v18 = v17;
          v19 = [(CRLWPDragAndDropHelper *)self owningRep];
          unsigned __int8 v12 = [v19 isDragPoint:v18 inSelection:0 includeEndpoints:x, y];

          goto LABEL_12;
        }
      }
    }
LABEL_11:
    unsigned __int8 v12 = 0;
    goto LABEL_12;
  }
  unsigned __int8 v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)p_importingDrawablesOrMoviesFromDragInfo:(id)a3
{
  v3 = [a3 itemSource];
  unint64_t v4 = (unint64_t)[v3 preferredImportableDataTypeDetectingImportableURLsInText:0];
  LOBYTE(v5) = 0;
  if (([v3 hasNativeBoardItems] & 1) == 0) {
    unsigned int v5 = ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) & ~[v3 hasNativeText];
  }

  return v5;
}

- (id)p_sourceTextEditorForDragInfo:(id)a3
{
  unint64_t v4 = [a3 platformDraggingInfo];
  unsigned int v5 = [v4 items];

  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 localObject];
  double v9 = sub_1002469D0(v7, v8);

  if (!v9)
  {
    uint64_t v20 = 0;
    goto LABEL_22;
  }
  unint64_t v33 = [v9 editorController];
  int v10 = [v9 sourceSelectionPath];
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1CA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101071C48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D1CC8);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    unsigned __int8 v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPDragAndDropHelper p_sourceTextEditorForDragInfo:]");
    long long v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPDragAndDropHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 706, 0, "invalid nil value for '%{public}s'", "sourceSelectionPath");
  }
  long long v14 = [(CRLWPDragAndDropHelper *)self owningRep];
  id v15 = [v14 interactiveCanvasController];

  unint64_t v16 = [v15 infosForSelectionPath:v10];
  if ([v16 count] != (id)1)
  {
    v19 = 0;
    goto LABEL_20;
  }
  uint64_t v17 = objc_opt_class();
  unint64_t v18 = [v16 anyObject];
  v19 = sub_1002469D0(v17, v18);

  uint64_t v20 = 0;
  if (!v10 || !v19) {
    goto LABEL_21;
  }
  v21 = [(CRLWPDragAndDropHelper *)self owningRep];
  v22 = [v21 storage];
  if (v19 == v22)
  {
    id v32 = [v9 changeCount];
    v24 = [(CRLWPDragAndDropHelper *)self owningRep];
    v25 = [v24 storage];
    id v31 = [v25 changeCount];

    if (v32 == v31)
    {
      v26 = [v9 sourceSelectionPath];
      [v33 setSelectionPath:v26];

      v27 = [v33 selectionPath];
      unint64_t v28 = [v9 sourceSelectionPath];
      unsigned int v29 = [v27 isEqual:v28];

      if (v29)
      {
        v30 = (objc_class *)objc_opt_class();
        v21 = [v33 textInputEditor];
        uint64_t v20 = sub_10024715C(v30, v21);
        goto LABEL_17;
      }
    }
LABEL_20:
    uint64_t v20 = 0;
    goto LABEL_21;
  }

  uint64_t v20 = 0;
LABEL_17:

LABEL_21:
LABEL_22:

  return v20;
}

- (CRLWPDragAndDropHelperOwning)owningRep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningRep);

  return (CRLWPDragAndDropHelperOwning *)WeakRetained;
}

- (CGPoint)dragAndDropNaturalPoint
{
  double x = self->_dragAndDropNaturalPoint.x;
  double y = self->_dragAndDropNaturalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragAndDropNaturalPoint:(CGPoint)a3
{
  self->_dragAndDropNaturalPoint = a3;
}

- (BOOL)dragIsStorageLocal
{
  return self->_dragIsStorageLocal;
}

- (void)setDragIsStorageLocal:(BOOL)a3
{
  self->_dragIsStorageLocal = a3;
}

- (void).cxx_destruct
{
}

@end