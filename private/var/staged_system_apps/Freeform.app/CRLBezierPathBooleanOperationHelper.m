@interface CRLBezierPathBooleanOperationHelper
+ (BOOL)hasAnyCrossingBetweenPath:(id)a3 andPath:(id)a4;
+ (BOOL)hasAtLeastTwoVisuallyDistinctSubregionsInPath:(id)a3;
+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4;
+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4 outMapToInputPaths:(id *)a5;
+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4;
+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4 outMapToInputPaths:(id *)a5;
+ (id)pathByFloodFillingPaths:(id)a3 atFillPoint:(CGPoint)a4;
+ (id)pathByNormalizingPath:(id)a3;
+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4;
+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4 outMapToInputPaths:(id *)a5;
+ (id)pathsBySeparatingVisuallyDistinctSubregionsOfPath:(id)a3;
@end

@implementation CRLBezierPathBooleanOperationHelper

+ (id)pathByNormalizingPath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 containsElementsOtherThanMoveAndClose])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
      [v4 controlPointBounds];
      sub_1003553A8((uint64_t)&v13, v5);
      memset(v12, 0, sizeof(v12));
      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      sub_10035551C(v12, v4, v11, 1, 0);
      sub_1003561E0();
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0AB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A312C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0AD0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 817, 0, "invalid nil value for '%{public}s'", "inputPath");
  }
  v9 = +[CRLBezierPath bezierPath];
  [v4 copyPathAttributesTo:v9];

  return v9;
}

+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4
{
  v4 = [a1 pathByPerformingBooleanOperation:a3 onPaths:a4 outMapToInputPaths:0];

  return v4;
}

+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4 outMapToInputPaths:(id *)a5
{
  id v8 = a4;
  v9 = v8;
  if (a5)
  {
    v10 = objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap);
    *a5 = v10;
    if (v9) {
      goto LABEL_3;
    }
LABEL_9:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0AF0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A31C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0B10);
    }
    long long v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]");
    long long v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 868, 0, "invalid nil value for '%{public}s'", "inputPaths");

    goto LABEL_18;
  }
  v10 = 0;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_3:
  if (![v9 count])
  {
LABEL_18:
    v11 = +[CRLBezierPath bezierPath];
    goto LABEL_67;
  }
  if (a3 >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0B30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A32DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0B50);
    }
    v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 883, 0, "Unsupported BOOLean operation type: %zu", a3);

    v11 = +[CRLBezierPath bezierPath];
    v19 = [v9 objectAtIndexedSubscript:0];
    [v19 copyPathAttributesTo:v11];
  }
  else
  {
    if (a3 == 3 && (unint64_t)[v9 count] >= 3)
    {
      v11 = +[CRLBezierPath bezierPath];
      v12 = [v9 objectAtIndexedSubscript:0];
      [v12 copyPathAttributesTo:v11];

      goto LABEL_67;
    }
    double x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v24 = v9;
    id v25 = [v24 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v50;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (([v28 isEmpty] & 1) == 0)
          {
            [v28 controlPointBounds];
            v61.origin.double x = v29;
            v61.origin.CGFloat y = v30;
            v61.size.CGFloat width = v31;
            v61.size.CGFloat height = v32;
            v58.origin.double x = x;
            v58.origin.CGFloat y = y;
            v58.size.CGFloat width = width;
            v58.size.CGFloat height = height;
            CGRect v59 = CGRectUnion(v58, v61);
            double x = v59.origin.x;
            CGFloat y = v59.origin.y;
            CGFloat width = v59.size.width;
            CGFloat height = v59.size.height;
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v25);
    }

    if ([v24 count] == (id)1
      || (v60.origin.double x = x, v60.origin.y = y, v60.size.width = width, v60.size.height = height, CGRectIsNull(v60)))
    {
      if (a3 - 2 < 2 || !a3)
      {
        v34 = [v24 objectAtIndexedSubscript:0];
        v11 = [a1 pathByNormalizingPath:v34];

        goto LABEL_67;
      }
      if (a3 == 1)
      {
        v11 = +[CRLBezierPath bezierPath];
        v33 = [v24 objectAtIndexedSubscript:0];
        [v33 copyPathAttributesTo:v11];

        goto LABEL_67;
      }
    }
    v35 = +[NSMutableArray array];
    for (unint64_t j = 0; j < (unint64_t)[v24 count]; ++j)
    {
      v37 = [v24 objectAtIndexedSubscript:j];
      if (a3 == 1 || j <= 1)
      {
        v38 = +[NSMutableArray array];
        [v35 addObject:v38];
      }
      v39 = [v35 lastObject];
      [v39 addObject:v37];
    }
    if (a3 - 1 > 2) {
      uint64_t v40 = 2;
    }
    else {
      uint64_t v40 = dword_101178000[a3 - 1];
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
    double v41 = sub_1003553A8((uint64_t)&v53, x);
    if (v10 && (unint64_t)objc_msgSend(v35, "count", v41) >= 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0B70);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A3254();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0B90);
      }
      v42 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]");
      v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v43 file:v44 lineNumber:952 isFatal:0 description:"Unable to generate an accurate input path map when performing multiple BOOLean operations. Skipping populating it."];

      v10 = 0;
    }
    v45 = [v35 objectAtIndexedSubscript:0];
    v11 = [v45 objectAtIndexedSubscript:0];

    if ((unint64_t)[v35 count] > 1)
    {
      v46 = [v35 objectAtIndexedSubscript:1];
      v48[0] = v53;
      v48[1] = v54;
      v48[2] = v55;
      sub_1003576EC(v11, 1, v46, v40, v48, v10);
    }
  }
LABEL_67:

  return v11;
}

+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4
{
  v4 = [a1 linePathWithLinePath:a3 subtractingFilledPath:a4 outMapToInputPaths:0];

  return v4;
}

+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4 outMapToInputPaths:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    v9 = objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap);
    *a5 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = sub_100358868(3, v7, v8, v9);

  return v10;
}

+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4
{
  v4 = [a1 linePathWithLinePath:a3 intersectedWithFilledPath:a4 outMapToInputPaths:0];

  return v4;
}

+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4 outMapToInputPaths:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    v9 = objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap);
    *a5 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = sub_100358868(1, v7, v8, v9);

  return v10;
}

+ (BOOL)hasAnyCrossingBetweenPath:(id)a3 andPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v99[0] = v7;
      v99[1] = v8;
      v10 = +[NSArray arrayWithObjects:v99 count:2];
      CGFloat x = CGRectNull.origin.x;
      CGFloat y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v15 = v10;
      id v16 = [v15 countByEnumeratingWithState:&v72 objects:v98 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v73;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v73 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if (([v19 isEmpty] & 1) == 0)
            {
              [v19 controlPointBounds];
              v104.origin.CGFloat x = v20;
              v104.origin.CGFloat y = v21;
              v104.size.CGFloat width = v22;
              v104.size.CGFloat height = v23;
              v100.origin.CGFloat x = x;
              v100.origin.CGFloat y = y;
              v100.size.CGFloat width = width;
              v100.size.CGFloat height = height;
              CGRect v101 = CGRectUnion(v100, v104);
              CGFloat x = v101.origin.x;
              CGFloat y = v101.origin.y;
              CGFloat width = v101.size.width;
              CGFloat height = v101.size.height;
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v72 objects:v98 count:16];
        }
        while (v16);
      }

      v102.origin.CGFloat x = x;
      v102.origin.CGFloat y = y;
      v102.size.CGFloat width = width;
      v102.size.CGFloat height = height;
      if (!CGRectIsNull(v102))
      {
        v103.origin.CGFloat x = x;
        v103.origin.CGFloat y = y;
        v103.size.CGFloat width = width;
        v103.size.CGFloat height = height;
        *(void *)&double v24 = (unint64_t)CGRectInset(v103, -3.0, -3.0);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v69 = 0u;
        sub_1003553A8((uint64_t)&v69, v24);
        v78[1] = 0;
        int v79 = 2;
        uint64_t v80 = 0;
        __int16 v81 = 0;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        memset(v91, 0, 29);
        v91[29] = 1;
        uint64_t v92 = 0;
        uint64_t v93 = 0;
        uint64_t v94 = 0;
        uint64_t v95 = 0;
        __int16 v96 = 1;
        uint64_t v97 = 0;
        v78[0] = &off_1014F0DA8;
        memset(v68, 0, sizeof(v68));
        uint64_t v65 = 0;
        uint64_t v66 = 0;
        uint64_t v67 = 0;
        memset(v64, 0, sizeof(v64));
        id v25 = v15;
        if ([v25 countByEnumeratingWithState:v64 objects:v77 count:16])
        {
          uint64_t v26 = (void *)**((void **)&v64[0] + 1);
          v63[0] = v69;
          v63[1] = v70;
          v63[2] = v71;
          sub_10035551C(v68, v26, v63, 0, 0);
          long long v60 = v69;
          long long v61 = v70;
          long long v62 = v71;
          sub_1003561E0();
        }

        long long v52 = 0;
        long long v53 = &v52;
        uint64_t v54 = 0x5812000000;
        long long v55 = sub_10035FDEC;
        memset(v57, 0, sizeof(v57));
        v56 = sub_10035FDF8;
        uint64_t v58 = 0;
        int v59 = 1065353216;
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x3812000000;
        v50[3] = sub_10035FE00;
        v50[4] = nullsub_40;
        v50[5] = "";
        int v51 = 0;
        __dmb(0xBu);
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v66 - v65) >> 3);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3321888768;
        block[2] = sub_10035FE10;
        block[3] = &unk_1014F0FF8;
        memset(v49, 0, sizeof(v49));
        sub_100360F94(v49, v65, v66, v27);
        block[4] = v50;
        block[5] = &v52;
        dispatch_apply(v27, 0, block);
        v45 = 0;
        v46 = 0;
        uint64_t v47 = 0;
        v42 = 0;
        v43 = 0;
        uint64_t v44 = 0;
        unint64_t v39 = 0;
        if (v66 != v65)
        {
          do
          {
            v76 = &v39;
            v28 = sub_1003608F4((uint64_t)(v53 + 6), &v39, (uint64_t)&unk_101174E70, (uint64_t **)&v76);
            uint64_t v29 = v28[3];
            uint64_t v30 = v28[4];
            uint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((v30 - v29) >> 3);
            if (v39) {
              sub_1003601E8((uint64_t *)&v42, v43, v29, v30, v31);
            }
            else {
              sub_1003601E8((uint64_t *)&v45, v46, v29, v30, v31);
            }
            ++v39;
          }
          while (v39 < 0xAAAAAAAAAAAAAAABLL * ((v66 - v65) >> 3));
        }
        sub_1004122C4((uint64_t)v78, &v45, 0, 0);
        sub_1004122C4((uint64_t)v78, (uint64_t **)&v42, 1, 0);
        unint64_t v39 = 0;
        unint64_t v40 = 0;
        uint64_t v41 = 0;
        sub_10035654C((uint64_t)v78, 1, 1, (uint64_t *)&v39);
        BOOL v32 = v40 != v39;
        v76 = &v39;
        sub_100134888((void ***)&v76);
        unint64_t v39 = (unint64_t)&v42;
        sub_100134888((void ***)&v39);
        v42 = &v45;
        sub_100134888((void ***)&v42);
        v45 = v49;
        sub_100134888((void ***)&v45);
        _Block_object_dispose(v50, 8);
        _Block_object_dispose(&v52, 8);
        sub_100360864((uint64_t)&v57[8]);
        long long v52 = (void **)&v65;
        sub_100134888(&v52);
        long long v52 = (void **)v68;
        sub_10035CFD8(&v52);
        sub_100411F00((uint64_t)v78);
        id v15 = v25;
        goto LABEL_37;
      }
LABEL_36:
      BOOL v32 = 0;
LABEL_37:

      goto LABEL_38;
    }
LABEL_29:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0F70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A35B0();
    }
    v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v15 = +[NSString stringWithUTF8String:"BOOL _hasAnyIntersectionBetweenPaths(CRLBezierPath *const  _Nonnull __strong, CRLBezierPath *const  _Nonnull __strong)"];
    v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v37, 1431, 0, "invalid nil value for '%{public}s'", "inputPath2");

    goto LABEL_36;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F0F30);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A3678();
  }
  v33 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  v34 = +[NSString stringWithUTF8String:"BOOL _hasAnyIntersectionBetweenPaths(CRLBezierPath *const  _Nonnull __strong, CRLBezierPath *const  _Nonnull __strong)"];
  v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 1430, 0, "invalid nil value for '%{public}s'", "inputPath1");

  if (!v9) {
    goto LABEL_29;
  }
  BOOL v32 = 0;
LABEL_38:

  return v32;
}

+ (BOOL)hasAtLeastTwoVisuallyDistinctSubregionsInPath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = sub_100359CEC(v3, 2uLL);
    if ((unint64_t)[v5 count] >= 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0BF0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010A37D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F0C10);
      }
      id v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:]");
      id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1018 isFatal:0 description:"We asked to stop after finding 2 paths."];
    }
    BOOL v9 = (unint64_t)[v5 count] > 1;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0BB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3740();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0BD0);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v11, 1011, 0, "invalid nil value for '%{public}s'", "inputPath");

    BOOL v9 = 0;
  }

  return v9;
}

+ (id)pathsBySeparatingVisuallyDistinctSubregionsOfPath:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = sub_100359CEC(v3, 0);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0C30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A38E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0C50);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathsBySeparatingVisuallyDistinctSubregionsOfPath:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1024, 0, "invalid nil value for '%{public}s'", "inputPath");

    id v5 = &__NSArray0__struct;
  }

  return v5;
}

+ (id)pathByFloodFillingPaths:(id)a3 atFillPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v4 = a3;
  BOOL v32 = v4;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0C70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3974();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0C90);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1035, 0, "invalid nil value for '%{public}s'", "inputPaths");
    goto LABEL_22;
  }
  if ([v4 count])
  {
    if (!sub_100065BF8(x, y))
    {
      id v11 = v32;
      CGFloat v12 = CGRectNull.origin.x;
      CGFloat v13 = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v16 = v11;
      id v17 = [v16 countByEnumeratingWithState:&v38 objects:v62 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v39;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v16);
            }
            CGFloat v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (([v20 isEmpty] & 1) == 0)
            {
              [v20 controlPointBounds];
              v68.origin.double x = v21;
              v68.origin.double y = v22;
              v68.size.CGFloat width = v23;
              v68.size.CGFloat height = v24;
              v64.origin.double x = v12;
              v64.origin.double y = v13;
              v64.size.CGFloat width = width;
              v64.size.CGFloat height = height;
              CGRect v65 = CGRectUnion(v64, v68);
              CGFloat v12 = v65.origin.x;
              CGFloat v13 = v65.origin.y;
              CGFloat width = v65.size.width;
              CGFloat height = v65.size.height;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v38 objects:v62 count:16];
        }
        while (v17);
      }

      v66.origin.double x = v12;
      v66.origin.double y = v13;
      v66.size.CGFloat width = width;
      v66.size.CGFloat height = height;
      if (!CGRectIsNull(v66))
      {
        v67.origin.double x = v12;
        v67.origin.double y = v13;
        v67.size.CGFloat width = width;
        v67.size.CGFloat height = height;
        *(void *)&double v25 = (unint64_t)CGRectInset(v67, -3.0, -3.0);
        +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v29 = v35 = 0u;
        sub_1003553A8((uint64_t)&v35, v25);
        v42[5] = 0;
        int v43 = 2;
        uint64_t v44 = 0;
        __int16 v45 = 0;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        memset(v55, 0, 29);
        v55[29] = 1;
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        uint64_t v58 = 0;
        v59[3] = 0;
        uint64_t v61 = 0;
        v42[4] = &off_1014F0DA8;
        __int16 v60 = 1;
        v42[0] = off_1014F1208;
        v42[1] = sub_1003563AC;
        v42[3] = v42;
        sub_10035C810(v59, (uint64_t)v42);
        sub_10036371C(v42);
        memset(v34, 0, sizeof(v34));
        v33[0] = v35;
        v33[1] = v36;
        v33[2] = v37;
        sub_10035551C(v34, v29, v33, 1, 0);
        sub_1003561E0();
      }
      id v6 = &__NSArray0__struct;

      if ((unint64_t)[&__NSArray0__struct count] >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F0CF0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010A3A90();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F0D10);
        }
        uint64_t v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        unint64_t v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]");
        v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:1049 isFatal:0 description:"Should never get more than one path back with a non-null fill point."];
      }
      if ([&__NSArray0__struct count])
      {
        BOOL v9 = [&__NSArray0__struct objectAtIndexedSubscript:0];
        goto LABEL_24;
      }
LABEL_23:
      BOOL v9 = 0;
LABEL_24:

      goto LABEL_26;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0CB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3A08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F0CD0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1044 isFatal:0 description:"Unable to fill path at null point."];
LABEL_22:

    goto LABEL_23;
  }
  BOOL v9 = 0;
LABEL_26:

  return v9;
}

@end