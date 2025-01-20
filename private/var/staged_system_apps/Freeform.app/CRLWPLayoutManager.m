@interface CRLWPLayoutManager
+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10;
+ (void)setTransformForColumn:(id)a3 andInvalidateWPRect:(CGRect)a4 inTarget:(id)a5;
+ (void)setTransformForColumn:(id)a3 inTarget:(id)a4 metrics:(id)a5;
- (BOOL)isLayingOut;
- (BOOL)layoutFinished;
- (BOOL)wantsToProvideStylesForTextLayout:(id)a3;
- (CRLWPCTTypesetterCache)typesetterCache;
- (CRLWPDirtyRangeArray)dirtyRanges;
- (CRLWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4;
- (CRLWPLayoutOwner)owner;
- (_TtC8Freeform12CRLWPStorage)storage;
- (_TtC8Freeform17CRLWPTopicNumbers)topicNumbers;
- (id)layoutMetricsCache;
- (id)styleProvider;
- (id)styleProviderForTextLayout:(id)a3;
- (unint64_t)p_layoutConfigFlagsForTarget:(id)a3;
- (void)clearOwner;
- (void)clearTypesetterCache;
- (void)dealloc;
- (void)destroyLayoutState:(void *)a3;
- (void)initialLayoutStateForLayout:(id)a3;
- (void)layOutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5;
- (void)p_clearTypesetterCacheForNotification:(id)a3;
- (void)removeDirtyRange:(_NSRange)a3;
- (void)resetDirtyRange;
@end

@implementation CRLWPLayoutManager

- (CRLWPLayoutManager)initWithStorage:(id)a3 owner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CRLWPLayoutManager;
  v9 = [(CRLWPLayoutManager *)&v34 init];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB1C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010663F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB1E0);
      }
      v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Cannot initialize with a nil storage.", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLWPLayoutManager initWithStorage:owner:]");
      v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager initWithStorage:owner:]");
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:95 isFatal:1 description:"Cannot initialize with a nil storage."];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
      abort();
    }
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeWeak((id *)&v10->_owner, v8);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v8 topicNumbersForStorage:v7];
      topicNumbers = v11->_topicNumbers;
      v11->_topicNumbers = (_TtC8Freeform17CRLWPTopicNumbers *)v12;
    }
    if (!v11->_topicNumbers)
    {
      v14 = [[_TtC8Freeform17CRLWPTopicNumbers alloc] initWithStorage:v10->_storage];
      v15 = v11->_topicNumbers;
      v11->_topicNumbers = v14;

      if (!v11->_topicNumbers)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CB200);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106647C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CB220);
        }
        v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager initWithStorage:owner:]");
        v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 110, 0, "invalid nil value for '%{public}s'", "_topicNumbers");
      }
    }
    uint64_t v19 = objc_opt_new();
    dirtyRanges = v11->_dirtyRanges;
    v11->_dirtyRanges = (CRLWPMutableDirtyRangeArray *)v19;
  }
  return v11;
}

- (void)dealloc
{
  [(CRLWPLayoutManager *)self clearOwner];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPLayoutManager;
  [(CRLWPLayoutManager *)&v3 dealloc];
}

- (id)styleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v10 = sub_100246AC8(WeakRetained, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLWPStyleProviding);

  if (v10)
  {
    if ([v10 wantsToProvideStylesForTextLayout:0])
    {
      v11 = [v10 styleProvider];

      goto LABEL_6;
    }
  }
  v11 = +[CRLWPStorageStyleProvider styleProviderForStorage:self->_storage];
LABEL_6:

  return v11;
}

- (id)styleProviderForTextLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsToProvideStylesForTextLayout:(id)a3
{
  return 1;
}

- (void)clearOwner
{
}

- (void)clearTypesetterCache
{
}

- (void)resetDirtyRange
{
}

- (void)removeDirtyRange:(_NSRange)a3
{
}

- (id)layoutMetricsCache
{
  return 0;
}

- (void)layOutIntoTarget:(id)a3 withLayoutState:(void *)a4 outSync:(BOOL *)a5
{
  id v7 = a3;
  if (!a4)
  {
    [(CRLWPLayoutManager *)self p_layoutConfigFlagsForTarget:v7];
    operator new();
  }
  self->_layoutFinished = 0;
  self->_isLayingOut = 1;
  v45 = (CRLWPLayoutManager *)*((id *)a4 + 3);
  if (v45 != self)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB240);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010665B4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB260);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager layOutIntoTarget:withLayoutState:outSync:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:404 isFatal:0 description:"Layout manager mismatch"];
  }
  char v11 = sub_10013B0A4((uint64_t)a4, v7, 3670017);
  dirtyRanges = self->_dirtyRanges;
  v13 = [v7 columns];
  id v14 = +[CRLWPColumn rangeOfColumns:v13];
  v16 = -[CRLWPDirtyRangeArray dirtyRangesIntersecting:](dirtyRanges, "dirtyRangesIntersecting:", v14, v15);

  if (([v16 isEmpty] & 1) == 0)
  {
    v17 = (char *)[v16 superRange];
    uint64_t v19 = v18;
    v20 = [v7 columns];
    v21 = [v20 lastObject];

    if (v21)
    {
      v22 = (char *)[v21 range];
      uint64_t v24 = &v22[v23];
      if (&v22[v23] > v17)
      {
        uint64_t v25 = &v17[v19];
        if (v24 >= v25)
        {
          [(CRLWPMutableDirtyRangeArray *)self->_dirtyRanges subtract:v16];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          [WeakRetained layoutManager:self didClearDirtyRangeWithDelta:[v16 delta] afterCharIndex:v25];
        }
        else
        {
          id v26 = [v16 delta];
          [(CRLWPMutableDirtyRangeArray *)self->_dirtyRanges subtract:v16];
          uint64_t v27 = self->_dirtyRanges;
          if (v24 <= v25) {
            uint64_t v28 = v25;
          }
          else {
            uint64_t v28 = v24;
          }
          if (v24 >= v25) {
            uint64_t v29 = (uint64_t)v25;
          }
          else {
            uint64_t v29 = (uint64_t)v24;
          }
          sub_100082E00(v29, (uint64_t)&v28[-v29], (uint64_t)v26, v47);
          [(CRLWPMutableDirtyRangeArray *)v27 addRange:v47];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
          [WeakRetained didLayoutChangingDirtyRanges];
        }

        v31 = self->_dirtyRanges;
        id v32 = [(CRLWPMutableDirtyRangeArray *)v31 copy];
        Swift::String v33 = (void *)*((void *)a4 + 104);
        *((void *)a4 + 104) = v32;

        if (*((unsigned char *)a4 + 840)) {
          char v34 = 1;
        }
        else {
          char v34 = ![(CRLWPDirtyRangeArray *)v31 isEmpty];
        }
        *((unsigned char *)a4 + 840) = v34;
      }
    }
  }
  if ((v11 & 1) == 0)
  {
    (*(void (**)(void *))(*(void *)a4 + 8))(a4);
    [(CRLWPLayoutManager *)self resetDirtyRange];
    a4 = 0;
  }
  if (objc_msgSend(v7, "textIsVertical", v45)
    && ((unint64_t)[v7 autosizeFlags] & 3) != 0)
  {
    v35 = [v7 columns];
    if ([v35 count] != (id)1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB280);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106652C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CB2A0);
      }
      v36 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPLayoutManager layOutIntoTarget:withLayoutState:outSync:]");
      v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:496 isFatal:0 description:"Autogrow with multiple columns is not supported"];
    }
    v39 = [v35 firstObject];
    v40 = [v7 columnMetricsForCharIndex:[v39 range] outRange:0];
    +[CRLWPLayoutManager setTransformForColumn:v39 inTarget:v7 metrics:v40];
  }
  id v41 = objc_loadWeakRetained((id *)&self->_owner);
  char v42 = objc_opt_respondsToSelector();

  if (v42)
  {
    id v43 = objc_loadWeakRetained((id *)&self->_owner);
    [v43 didLayoutWithLayoutManager:self];
  }
  self->_layoutFinished = v11 ^ 1;
  self->_isLayingOut = 0;

  return a4;
}

+ (void)fixColumnBoundsForTarget:(id)a3 storage:(id)a4 charIndex:(unint64_t)a5 firstColumnIndex:(unint64_t)a6 precedingHeight:(double)a7 height:(double)a8 alreadyHasMargins:(BOOL)a9 styleProvider:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v98 = a10;
  long long v116 = xmmword_101176F48;
  uint64_t v18 = [v16 columnMetricsForCharIndex:a5 outRange:&v116];
  unsigned int v109 = [v18 columnsAreLeftToRight];
  if (v18) {
    unint64_t v19 = (unint64_t)[v18 columnCount];
  }
  else {
    unint64_t v19 = 1;
  }
  unint64_t v95 = v19 + a6;
  if (!(v19 + a6))
  {
    int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB2C0);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      sub_1010666C4(v22, (uint64_t)v117, v20, v21);
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB2E0);
    }
    uint64_t v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:]");
    uint64_t v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 562, 0, "newColumnCount shouldn't be 0. %{public}@", objc_opt_class());
  }
  unsigned int v26 = [v16 textIsVertical];
  BOOL v27 = (unint64_t)v116 < a5 || a9;
  BOOL v107 = v27;
  v96 = +[CRLWPPadding padding];
  [v16 columns];
  v108 = unint64_t v28 = a6;
  if (!v108)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB300);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106663C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB320);
    }
    uint64_t v29 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPLayoutManager fixColumnBoundsForTarget:storage:charIndex:firstColumnIndex:precedingHeight:height:alreadyHasMargins:styleProvider:]");
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPLayoutManager.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:573 isFatal:0 description:"invalid nil value for 'columnsArray'"];

    unint64_t v28 = a6;
  }
  [v16 currentSize];
  double v34 = v32;
  double v100 = v33;
  if (v26) {
    double v35 = v33;
  }
  else {
    double v35 = v32;
  }
  if (v18)
  {
    [v18 adjustedInsetsForTarget:v16];
    double top = v36;
    double left = v38;
    double bottom = v40;
    double right = v42;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  id v105 = [v108 count];
  double v102 = v35;
  double v99 = v34;
  id v103 = [v16 pageNumber];
  double v44 = top + a7;
  double v45 = v35 - (right + left);
  double v46 = a8 - (bottom + top);
  if (v45 >= 0.0) {
    double v47 = v35 - (right + left);
  }
  else {
    double v47 = 0.0;
  }
  CGFloat rect = v47;
  if (((v45 < 0.0) & v26) != 0) {
    double v48 = v35 - (right + left);
  }
  else {
    double v48 = -0.0;
  }
  if (v46 >= 0.0) {
    double v49 = v46;
  }
  else {
    double v49 = 0.0;
  }
  if (!v28)
  {
    double v101 = 0.0;
    goto LABEL_59;
  }
  if (!v107)
  {
    unint64_t v54 = v28 - 1;
    while (1)
    {
      uint64_t v55 = objc_opt_class();
      v56 = [v16 columns];
      v57 = [v56 objectAtIndexedSubscript:v54];
      v50 = sub_1002469D0(v55, v57);

      id v58 = [v50 range];
      if (v59) {
        break;
      }

      if (--v54 == -1)
      {
        double v101 = 0.0;
        goto LABEL_58;
      }
    }
    v51 = [v16 columnMetricsForCharIndex:v58 outRange:0];
    v60 = [v51 layoutMargins];
    v61 = v60;
    if (v60)
    {
      [v60 bottomInset];
      double v101 = v62;
    }
    else
    {
      double v101 = 0.0;
    }

    goto LABEL_56;
  }
  v50 = [v16 columns];
  double v101 = 0.0;
  if ((unint64_t)[v50 count] > a6)
  {
    v51 = [v50 objectAtIndexedSubscript:];
    if (v51)
    {
      v118.origin.x = left + 0.0 + v48;
      v118.origin.y = top + a7;
      v118.size.width = rect;
      v118.size.height = v49;
      double MaxY = CGRectGetMaxY(v118);
      [v51 frameBounds];
      double v44 = v53;
      double v49 = MaxY - v53;
      double v101 = 0.0;
LABEL_56:
    }
  }

LABEL_58:
  unint64_t v28 = a6;
LABEL_59:
  if (objc_opt_respondsToSelector()) {
    [v18 layoutMarginsForTarget:v16];
  }
  else {
  v97 = [v18 layoutMargins];
  }
  v63 = v96;
  if (v97) {
    v63 = v97;
  }
  id v64 = v63;
  v65 = v64;
  if (v26)
  {
    [v64 topInset];
  }
  else if (v109)
  {
    [v64 leftInset];
  }
  else
  {
    [v64 rightInset];
  }
  double v67 = v66;
  if (v95 > v28)
  {
    uint64_t v68 = 0;
    do
    {
      double v115 = rect;
      uint64_t v114 = 0;
      if (v26)
      {
        [v65 topInset];
        double v70 = v69;
        [v65 bottomInset];
        double v72 = v100;
      }
      else
      {
        [v65 leftInset];
        double v70 = v73;
        [v65 rightInset];
        double v72 = v99;
      }
      double v74 = v72 - v70 - v71;
      if (![v17 wpKind] || objc_msgSend(v17, "wpKind") == 7) {
        double v74 = fmax(v74, 36.0);
      }
      if (v18) {
        [v18 positionForColumnIndex:v68 bodyWidth:v16 target:&v115 outWidth:&v114 outGap:v74];
      }
      else {
        double v75 = 0.0;
      }
      if (v109) {
        double v76 = v67 + v75;
      }
      else {
        double v76 = v74 - v67 - v75 - v115;
      }
      double v113 = v76;
      if ([v17 wpKind] && objc_msgSend(v17, "wpKind") != 7)
      {
        double v77 = v115;
      }
      else
      {
        double v77 = fmax(v115, 18.0);
        double v115 = v77;
        double v78 = v102 + (float)((float)v19 * -18.0);
        double v112 = v78;
        if (v109)
        {
          BOOL v79 = v78 < v76;
          v80 = &v113;
          v81 = &v112;
        }
        else
        {
          double v111 = v102 - v78 + -18.0;
          BOOL v79 = v76 < v111;
          v80 = &v113;
          v81 = &v111;
        }
        if (v79) {
          v80 = v81;
        }
        double v76 = *v80;
        double v113 = *v80;
      }
      double v82 = v49;
      double v83 = v44;
      if (!v107)
      {
        if (v26)
        {
          [v65 rightInset];
          double v85 = v84;
          [v16 maxSize];
          double v87 = v86;
        }
        else
        {
          [v65 topInset];
          double v85 = v88;
          [v16 maxSize];
          double v87 = v89;
        }
        double v83 = v44 + v101 + v85;
        v119.origin.x = v76;
        v119.origin.y = v83;
        v119.size.width = v77;
        v119.size.height = v49;
        double v90 = CGRectGetMaxY(v119);
        if (a6 || v90 <= v87)
        {
          double v82 = v49;
        }
        else
        {
          double v82 = v87 - v83;
          if ([v17 wpKind] && objc_msgSend(v17, "wpKind") != 7
            || v82 >= 36.0)
          {
            if (v82 < 1.0)
            {
              double v83 = v87 + -1.0;
              double v82 = 1.0;
            }
          }
          else
          {
            double v83 = v87 + -36.0;
            double v82 = 36.0;
          }
        }
      }
      if (a6 + v68 >= (unint64_t)v105)
      {
        if (v108)
        {
          v92 = -[CRLWPColumn initWithStorage:frameBounds:]([CRLWPColumn alloc], "initWithStorage:frameBounds:", v17, v76, v83, v77, v82);
          [(CRLWPColumn *)v92 setStyleProvider:v98];
          [(CRLWPColumn *)v92 setColumnIndex:a6 + v68];
          v91 = v92;
          [v108 addObject:v92];
        }
        else
        {
          v91 = 0;
        }
      }
      else
      {
        v91 = [v108 objectAtIndexedSubscript:a6 + v68];
        [v91 setFrameBounds:v76, v83, v77, v82];
      }
      [v91 setTextIsVertical:[v16 textIsVertical]];
      [v91 setPageNumber:v103];
      [a1 setTransformForColumn:v91 inTarget:v16 metrics:v18];

      ++v68;
      --v19;
    }
    while (v19);
  }
  unsigned int v93 = [v17 wpKind];
  if (!a6)
  {
    if (v93)
    {
      v94 = (char *)[v108 count];
      if ((unint64_t)v94 > v95) {
        [v108 removeObjectsInRange:v95, &v94[-v95]];
      }
    }
  }
}

+ (void)setTransformForColumn:(id)a3 inTarget:(id)a4 metrics:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 textIsVertical])
  {
    if (((unint64_t)[v8 autosizeFlags] & 3) != 0)
    {
      [v9 adjustedInsetsForTarget:v8];
      double v11 = v10;
      [v7 frameBounds];
      double v12 = v11 + CGRectGetMaxY(v19);
    }
    else
    {
      [v8 currentSize];
    }
    CGAffineTransformMakeTranslation(&v18, v12, 0.0);
    CGAffineTransform v16 = v18;
    CGAffineTransformRotate(&v17, &v16, 1.57079633);
    *(_OWORD *)&v18.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v18.c = *(_OWORD *)&v17.c;
    long long v14 = *(_OWORD *)&v17.tx;
  }
  else
  {
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v18.c = v13;
    long long v14 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  *(_OWORD *)&v18.tx = v14;
  v15[0] = *(_OWORD *)&v18.a;
  v15[1] = *(_OWORD *)&v18.c;
  v15[2] = v14;
  [v7 setTransformFromWP:v15];
}

+ (void)setTransformForColumn:(id)a3 andInvalidateWPRect:(CGRect)a4 inTarget:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  id v11 = a5;
  double v12 = [v11 columnMetricsForCharIndex:[v10 range] outRange:0];
  +[CRLWPLayoutManager setTransformForColumn:v10 inTarget:v11 metrics:v12];
  if (v10) {
    [v10 transformFromWP];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect v15 = CGRectApplyAffineTransform(v14, &v13);
  [v11 setNeedsDisplayInTargetRect:CGRectMake(v15.origin.x, v15.origin.y, v15.size.width, v15.size.height)];
}

- (CRLWPCTTypesetterCache)typesetterCache
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_useLigatures || v2->_shouldClearTypesetterCache)
  {
    [(CRLWPLayoutManager *)v2 clearTypesetterCache];
    v2->_useLigatures = 1;
    v2->_shouldClearTypesetterCache = 0;
  }
  objc_sync_exit(v2);

  typesetterCache = v2->_typesetterCache;
  if (!typesetterCache)
  {
    uint64_t v4 = objc_alloc_init(CRLWPCTTypesetterCache);
    uint64_t v5 = v2->_typesetterCache;
    v2->_typesetterCache = v4;

    typesetterCache = v2->_typesetterCache;
  }

  return typesetterCache;
}

- (unint64_t)p_layoutConfigFlagsForTarget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 descendersCannotClip]) {
      unint64_t v6 = 4;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else if ([(CRLWPStorage *)self->_storage wpKind] && [(CRLWPStorage *)self->_storage wpKind] != 7)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = 4;
  }
  if ([v5 textIsVertical]) {
    unint64_t v6 = 20;
  }

  return v6;
}

- (void)p_clearTypesetterCacheForNotification:(id)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_shouldClearTypesetterCache = 1;
  objc_sync_exit(obj);
}

- (void)initialLayoutStateForLayout:(id)a3
{
  id v3 = a3;
  long long v5 = 0uLL;
  uint64_t v6 = 0;
  sub_100082E00(0x7FFFFFFFFFFFFFFFLL, 0, 0, &v5);
  operator new();
}

- (void)destroyLayoutState:(void *)a3
{
  if (a3) {
    (*(void (**)(void *))(*(void *)a3 + 8))(a3);
  }
}

- (CRLWPLayoutOwner)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (CRLWPLayoutOwner *)WeakRetained;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (CRLWPDirtyRangeArray)dirtyRanges
{
  return &self->_dirtyRanges->super;
}

- (BOOL)layoutFinished
{
  return self->_layoutFinished;
}

- (BOOL)isLayingOut
{
  return self->_isLayingOut;
}

- (_TtC8Freeform17CRLWPTopicNumbers)topicNumbers
{
  return self->_topicNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicNumbers, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_typesetterCache, 0);
  objc_storeStrong((id *)&self->_dirtyRanges, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end