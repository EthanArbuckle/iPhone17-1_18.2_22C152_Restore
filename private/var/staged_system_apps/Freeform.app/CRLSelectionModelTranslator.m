@interface CRLSelectionModelTranslator
- (BOOL)isSelectionPathUserSelectable:(id)a3 isInCollaborationMode:(BOOL)a4;
- (id)boardItemsForSelectionPath:(id)a3;
- (id)containerToInsertIntoForSelectionPath:(id)a3;
- (id)infoForSelectionPath:(id)a3;
- (id)infosForSelectionPath:(id)a3;
- (id)selectionPathForInfos:(id)a3;
- (id)selectionPathForNothingSelectedInsideGroup:(id)a3;
- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4;
- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4 headCursorAffinity:(unint64_t)a5 tailCursorAffinity:(unint64_t)a6;
- (id)selectionPathForSelection:(id)a3 onStorage:(id)a4;
- (id)selectionPathForTextRange:(id)a3 onStorage:(id)a4;
- (id)selectionPathRemovingCrossContainerSelectionsForSelectionPath:(id)a3;
- (id)unlockedBoardItemsForSelectionPath:(id)a3;
- (id)visualSelectionPathForRange:(_NSRange)a3 onStorage:(id)a4;
- (id)visualSelectionPathForTextRange:(id)a3 onStorage:(id)a4;
@end

@implementation CRLSelectionModelTranslator

- (id)infoForSelectionPath:(id)a3
{
  v3 = [(CRLSelectionModelTranslator *)self infosForSelectionPath:a3];
  if ([v3 count] == (id)1)
  {
    v4 = [v3 anyObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)infosForSelectionPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSSet set];
  v5 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 boardItems];

    if ([v6 itemCount] == (id)1)
    {
      v8 = [v6 boardItems];
      v9 = [v8 anyObject];

      if ([v9 conformsToProtocol:&OBJC_PROTOCOL___CRLContainerInfo])
      {
        v10 = [v9 infoForSelectionPath:v3];
        if (v10)
        {
          uint64_t v11 = +[NSSet setWithObject:v10];

          v7 = (void *)v11;
        }
      }
    }
    v4 = v7;
  }

  return v4;
}

- (id)selectionPathForInfos:(id)a3
{
  id v3 = a3;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v99 objects:v116 count:16];
  id obj = v3;
  if (v4)
  {
    id v11 = v4;
    uint64_t v12 = *(void *)v100;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v100 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v13);
        v15 = sub_100246AC8(v14, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
        v16 = v15;
        if (v15)
        {
          if ([v15 isSelectable]) {
            goto LABEL_27;
          }
          unsigned int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EFDD0);
          }
          v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v107 = v17;
            __int16 v108 = 2082;
            v109 = "-[CRLSelectionModelTranslator selectionPathForInfos:]";
            __int16 v110 = 2082;
            v111 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m";
            __int16 v112 = 1024;
            int v113 = 53;
            __int16 v114 = 2112;
            v115 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Only selectable infos should be used to make a selection path (%@)", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EFDF0);
          }
          v19 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v27 = v19;
            v28 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v107 = v17;
            __int16 v108 = 2114;
            v109 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]");
          v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
          +[CRLAssertionHandler handleFailureInFunction:v20, v21, 53, 0, "Only selectable infos should be used to make a selection path (%@)", v14 file lineNumber isFatal description];
        }
        else
        {
          unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EFD90);
          }
          v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v107 = v22;
            __int16 v108 = 2082;
            v109 = "-[CRLSelectionModelTranslator selectionPathForInfos:]";
            __int16 v110 = 2082;
            v111 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m";
            __int16 v112 = 1024;
            int v113 = 51;
            __int16 v114 = 2112;
            v115 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", buf, 0x2Cu);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EFDB0);
          }
          v24 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v25 = v24;
            v26 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v107 = v22;
            __int16 v108 = 2114;
            v109 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]");
          v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
          +[CRLAssertionHandler handleFailureInFunction:v20, v21, 51, 0, "Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", v14 file lineNumber isFatal description];
        }

LABEL_27:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v3 = obj;
      id v11 = [obj countByEnumeratingWithState:&v99 objects:v116 count:16];
    }
    while (v11);
  }
  v29 = objc_alloc_init(_TtC8Freeform17CRLBoardSelection);
  v30 = objc_alloc_init(CRLCanvasSelection);
  v31 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v29, v30, 0);
  if ([v3 count])
  {
    v83 = v29;
    v84 = v31;
    v82 = v30;
    v85 = +[NSMutableSet set];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v32 = v3;
    id v33 = [v32 countByEnumeratingWithState:&v95 objects:v105 count:16];
    if (v33)
    {
      id v40 = v33;
      char v41 = 0;
      uint64_t v42 = *(void *)v96;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v96 != v42) {
            objc_enumerationMutation(v32);
          }
          v44 = sub_100246AC8(*(void **)(*((void *)&v95 + 1) + 8 * i), 1, v34, v35, v36, v37, v38, v39, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
          if (v44)
          {
            uint64_t v45 = objc_opt_class();
            v46 = [v44 parentInfo];
            v47 = sub_1002469D0(v45, v46);

            if (v47) {
              [v85 addObject:v47];
            }
            else {
              char v41 = 1;
            }
          }
        }
        id v40 = [v32 countByEnumeratingWithState:&v95 objects:v105 count:16];
      }
      while (v40);
    }
    else
    {
      char v41 = 0;
    }

    v48 = v85;
    if ((unint64_t)[v85 count] > 1
      || (([v85 count] == (id)1) & v41) == 1)
    {
      v49 = [[_TtC8Freeform17CRLGroupSelection alloc] initWithContainerGroups:v85 hasSelectedItemsInNonGroupContainer:v41 & 1];
      [v84 addObject:v49];
      v50 = +[NSMutableSet set];
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v51 = v32;
      id v52 = [v51 countByEnumeratingWithState:&v91 objects:v104 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v92;
        do
        {
          for (j = 0; j != v53; j = (char *)j + 1)
          {
            if (*(void *)v92 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
            uint64_t v57 = objc_opt_class();
            v58 = sub_1002469D0(v57, v56);
            v59 = v58;
            if (v58)
            {
              v60 = [v58 allNestedChildrenItemsIncludingGroups];
              [v50 addObjectsFromArray:v60];
            }
          }
          id v53 = [v51 countByEnumeratingWithState:&v91 objects:v104 count:16];
        }
        while (v53);
      }

      v31 = v84;
      if ([v50 intersectsSet:v51])
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EFE10);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A1C40();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EFE30);
        }
        v61 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v61);
        }
        v62 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]");
        v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
        +[CRLAssertionHandler handleFailureInFunction:v62 file:v63 lineNumber:86 isFatal:0 description:"Cannot select a parent and child simultaneously!"];
      }
      v48 = v85;
    }
    else
    {
      v31 = v84;
      if ([v85 count] == (id)1)
      {
        uint64_t v76 = [v85 anyObject];
        if (v76)
        {
          v77 = (void *)v76;
          do
          {
            v78 = [[_TtC8Freeform17CRLGroupSelection alloc] initWithGroupItem:v77];
            [v84 insertObject:v78 atIndex:2];
            uint64_t v79 = objc_opt_class();
            v80 = [v77 parentInfo];
            uint64_t v81 = sub_1002469D0(v79, v80);

            v77 = (void *)v81;
          }
          while (v81);
        }
      }
    }
    v64 = +[NSMutableSet set];
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v65 = v32;
    id v66 = [v65 countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v66)
    {
      id v67 = v66;
      uint64_t v68 = *(void *)v88;
      do
      {
        for (k = 0; k != v67; k = (char *)k + 1)
        {
          if (*(void *)v88 != v68) {
            objc_enumerationMutation(v65);
          }
          v70 = *(void **)(*((void *)&v87 + 1) + 8 * (void)k);
          v71 = (objc_class *)objc_opt_class();
          v72 = sub_10024715C(v71, v70);
          [v64 crl_addNonNilObject:v72];
        }
        id v67 = [v65 countByEnumeratingWithState:&v87 objects:v103 count:16];
      }
      while (v67);
    }

    v73 = [[_TtC8Freeform21CRLBoardItemSelection alloc] initWithBoardItems:v64];
    [v31 addObject:v73];

    id v3 = obj;
    v30 = v82;
    v29 = v83;
  }
  v74 = +[CRLSelectionPath selectionPathWithSelectionArray:v31];

  return v74;
}

- (id)selectionPathForTextRange:(id)a3 onStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v7 parentInfo];
  uint64_t v10 = sub_1002469D0(v8, v9);

  if (v10)
  {
    id v11 = +[NSSet setWithObject:v10];
    uint64_t v12 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v11];

    v13 = [CRLWPSelection alloc];
    id v14 = [v6 nsRange];
    LOBYTE(v22) = 1;
    v16 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v13, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, v14, v15, 0, [v6 caretAffinity], 0x7FFFFFFFFFFFFFFFLL, 0, v22, v7);
    unsigned int v17 = [v12 selectionPathWithAppendedSelection:v16];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFE50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1CD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFE70);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForTextRange:onStorage:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 112, 0, "invalid nil value for '%{public}s'", "parentInfo");

    unsigned int v17 = 0;
  }

  return v17;
}

- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = +[CRLTextRange textRangeWith:](_TtC8Freeform12CRLTextRange, "textRangeWith:", location, length);
  uint64_t v9 = [(CRLSelectionModelTranslator *)self selectionPathForTextRange:v8 onStorage:v7];

  return v9;
}

- (id)visualSelectionPathForTextRange:(id)a3 onStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v7 parentInfo];
  uint64_t v10 = sub_1002469D0(v8, v9);

  if (v10)
  {
    id v11 = +[NSSet setWithObject:v10];
    uint64_t v12 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v11];

    v13 = [CRLWPSelection alloc];
    id v14 = [v6 nsRange];
    uint64_t v16 = v15;
    id v17 = [v6 caretAffinity];
    LOBYTE(v24) = [v6 insertionEdge] == 0;
    v18 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v13, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v14, v16, 0, v17, 0x7FFFFFFFFFFFFFFFLL, 0, v24, v7);
    v19 = [v12 selectionPathWithAppendedSelection:v18];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFE90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1D68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFEB0);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator visualSelectionPathForTextRange:onStorage:]");
    uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 130, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v19 = 0;
  }

  return v19;
}

- (id)visualSelectionPathForRange:(_NSRange)a3 onStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = +[CRLTextRange textRangeWith:](_TtC8Freeform12CRLTextRange, "textRangeWith:", location, length);
  uint64_t v9 = [(CRLSelectionModelTranslator *)self visualSelectionPathForTextRange:v8 onStorage:v7];

  return v9;
}

- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4 headCursorAffinity:(unint64_t)a5 tailCursorAffinity:(unint64_t)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  v13 = [v11 parentInfo];
  id v14 = sub_1002469D0(v12, v13);

  if (v14)
  {
    uint64_t v15 = +[NSSet setWithObject:v14];
    uint64_t v16 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v15];

    id v17 = +[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", location, length, 0, 1, v11);
    [v17 setHeadCursorAffinity:a5];
    [v17 setTailCursorAffinity:a6];
    v18 = [v16 selectionPathWithAppendedSelection:v17];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFED0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1DFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFEF0);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForRange:onStorage:headCursorAffinity:tailCursorAffinity:]");
    v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 148, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v18 = 0;
  }

  return v18;
}

- (id)selectionPathForSelection:(id)a3 onStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v7 parentInfo];

  uint64_t v10 = sub_1002469D0(v8, v9);

  if (v10)
  {
    id v11 = +[NSSet setWithObject:v10];
    uint64_t v12 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v11];

    v13 = [v12 selectionPathWithAppendedSelection:v6];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFF10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1E90();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFF30);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForSelection:onStorage:]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 164, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v13 = 0;
  }

  return v13;
}

- (id)selectionPathForNothingSelectedInsideGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSSet setWithObject:v4];
  id v6 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v5];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 mostSpecificSelectionOfClass:0];
  uint64_t v9 = sub_1002469D0(v7, v8);

  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFF50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A1F24();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFF70);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForNothingSelectedInsideGroup:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 180, 0, "We expect this selection to be a plain board item selection, not one for editing in a group.");
  }
  v13 = [[_TtC8Freeform17CRLGroupSelection alloc] initWithGroupItem:v4];

  id v14 = [v6 selectionPathReplacingMostSpecificLocationOfSelection:v9 withSelection:v13];

  return v14;
}

- (id)boardItemsForSelectionPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = [v4 boardItems];
  }
  else
  {
    uint64_t v5 = +[NSSet set];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)unlockedBoardItemsForSelectionPath:(id)a3
{
  id v3 = [(CRLSelectionModelTranslator *)self boardItemsForSelectionPath:a3];
  id v4 = [v3 objectsPassingTest:&stru_1014EFF90];

  return v4;
}

- (id)containerToInsertIntoForSelectionPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mostSpecificSelectionOfClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (v4 && ([v4 hasSelectedItemsInNonGroupContainer] & 1) == 0)
  {
    id v32 = v3;
    uint64_t v7 = &off_1014C1000;
    uint64_t v8 = +[NSMutableArray array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v5 containerGroups];
    id v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v35)
    {
      uint64_t v9 = *(void *)v42;
      char v10 = 1;
      uint64_t v33 = *(void *)v42;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v11;
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        v13 = [(__objc2_class *)v7[76] array];
        [v13 addObject:v12];
        id v14 = [v12 parentInfo];
        do
        {
          uint64_t v15 = objc_opt_class();
          v21 = sub_100246DEC(v14, v15, 1, v16, v17, v18, v19, v20, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
          [v13 crl_addNonNilObject:v21];
          uint64_t v22 = [v14 parentInfo];

          id v14 = (void *)v22;
        }
        while (v22);
        if (v10)
        {
          [v8 addObjectsFromArray:v13];
        }
        else
        {
          v23 = +[NSSet setWithArray:v13];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v24 = [v8 copy];
          id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v38;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v38 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                if (([v23 containsObject:v29] & 1) == 0) {
                  [v8 removeObject:v29];
                }
              }
              id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v26);
          }

          uint64_t v7 = &off_1014C1000;
          uint64_t v9 = v33;
        }
        id v30 = [v8 count];

        if (!v30) {
          break;
        }
        char v10 = 0;
        uint64_t v11 = v36 + 1;
        if ((id)(v36 + 1) == v35)
        {
          char v10 = 0;
          id v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v35) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    if ([v8 count])
    {
      id v6 = [v8 firstObject];
    }
    else
    {
      id v6 = 0;
    }
    id v3 = v32;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)selectionPathRemovingCrossContainerSelectionsForSelectionPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLSelectionModelTranslator *)self infosForSelectionPath:v4];
  id v6 = +[NSMutableSet set];
  uint64_t v7 = [v4 mostSpecificSelectionOfClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (!v7 || ([v7 isCrossContainerSelection] & 1) == 0)
  {
    id v18 = v4;
    goto LABEL_55;
  }
  v62 = v8;
  v63 = self;
  if ([v8 hasSelectedItemsInNonGroupContainer])
  {
    uint64_t v57 = v5;
    id v58 = v4;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v9 = [v5 allObjects];
    id v10 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v78;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v78 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = [v14 parentInfo];
          uint64_t v17 = sub_1002469D0(v15, v16);

          if (v17) {
            [v6 crl_addNonNilObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
      }
      while (v11);
    }

    uint64_t v5 = v57;
    id v4 = v58;
    self = v63;
  }
  else
  {
    uint64_t v19 = [v5 allObjects];
    [v6 addObjectsFromArray:v19];
  }
  v61 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v6];
  -[CRLSelectionModelTranslator containerToInsertIntoForSelectionPath:](self, "containerToInsertIntoForSelectionPath:");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = +[NSMutableSet set];
  if (!v20 || ([v20 isSelectable] & 1) == 0)
  {
    v60 = v6;
    id v22 = +[NSMutableSet set];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v43 = v5;
    id v44 = v5;
    id v45 = [v44 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v74;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(void *)v74 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = sub_10006B444(*(void **)(*((void *)&v73 + 1) + 8 * (void)j));
          [v22 crl_addNonNilObject:v49];
        }
        id v46 = [v44 countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v46);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v50 = [v20 childInfos];
    id v51 = [v50 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v70;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(void *)v70 != v53) {
            objc_enumerationMutation(v50);
          }
          uint64_t v55 = *(void *)(*((void *)&v69 + 1) + 8 * (void)k);
          if ([v22 containsObject:v55]) {
            [v21 addObject:v55];
          }
        }
        id v52 = [v50 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (v52);
    }

    uint64_t v5 = v43;
LABEL_53:
    id v6 = v60;
    self = v63;
    goto LABEL_54;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v22 = v5;
  id v23 = [v22 countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v23)
  {
    id v24 = v23;
    id v59 = v4;
    v60 = v6;
    uint64_t v64 = *(void *)v66;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(void *)v66 != v64) {
          objc_enumerationMutation(v22);
        }
        id v26 = *(id *)(*((void *)&v65 + 1) + 8 * (void)m);
        uint64_t v27 = [v26 parentInfo];
        uint64_t v28 = objc_opt_class();
        sub_100246DEC(v27, v28, 1, v29, v30, v31, v32, v33, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
        id v34 = (id)objc_claimAutoreleasedReturnValue();

        while (1)
        {
          if (v34 == v20)
          {
            id v34 = v20;

            id v26 = v34;
            goto LABEL_33;
          }
          if ([v34 isSelectable])
          {
            id v35 = v34;

            uint64_t v36 = [v35 parentInfo];
            uint64_t v37 = objc_opt_class();
            sub_100246DEC(v36, v37, 1, v38, v39, v40, v41, v42, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
            id v34 = (id)objc_claimAutoreleasedReturnValue();

            id v26 = v35;
          }
          if (!v34) {
            goto LABEL_33;
          }
          if (v34 == v20) {
            break;
          }
          if (([v34 isSelectable] & 1) == 0) {
            goto LABEL_33;
          }
        }
        id v34 = v20;
LABEL_33:
        [v21 crl_addNonNilObject:v26];
      }
      id v24 = [v22 countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v24);
    id v4 = v59;
    goto LABEL_53;
  }
LABEL_54:

  id v18 = [(CRLSelectionModelTranslator *)self selectionPathForInfos:v21];

  uint64_t v8 = v62;
LABEL_55:

  return v18;
}

- (BOOL)isSelectionPathUserSelectable:(id)a3 isInCollaborationMode:(BOOL)a4
{
  id v5 = a3;
  id v6 = [v5 mostSpecificSelectionOfClass:objc_opt_class()];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v7 = [v6 containerGroups];
  id v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v42 != v10) {
        objc_enumerationMutation(v7);
      }
      if ([*(id *)(*((void *)&v41 + 1) + 8 * v11) isEffectivelyEmpty]) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    char v12 = 0;
    BOOL v13 = 0;
    if (v6) {
      goto LABEL_44;
    }
  }
  else
  {
LABEL_9:

    if (v6)
    {

      goto LABEL_24;
    }
    char v12 = 1;
  }
  [(CRLSelectionModelTranslator *)self boardItemsForSelectionPath:v5];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v20 = objc_opt_class();
        v21 = sub_1002469D0(v20, v19);
        id v22 = v21;
        if (v21 && ([v21 isEffectivelyEmpty] & 1) != 0)
        {
          BOOL v13 = 0;
          id v6 = v14;
          goto LABEL_43;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  if ((v12 & 1) == 0)
  {
    BOOL v13 = 0;
    goto LABEL_45;
  }
LABEL_24:
  id v23 = [(CRLSelectionModelTranslator *)self infosForSelectionPath:v5];
  id v14 = [v5 mostSpecificSelectionOfClass:0];
  objc_opt_class();
  BOOL v24 = (objc_opt_isKindOfClass() & 1) == 0 && [v23 count] == (id)1;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v23;
  id v25 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v34;
    while (2)
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v22);
        }
        uint64_t v29 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
        uint64_t v30 = sub_10006B444(v29);
        int v31 = v29 != v30 || v24;

        if (v31 == 1 && (sub_10006B53C(v29) & 1) != 0)
        {
          BOOL v13 = 0;
          goto LABEL_42;
        }
      }
      id v26 = [v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_42:
  id v6 = v22;
LABEL_43:

LABEL_44:
LABEL_45:

  return v13;
}

@end