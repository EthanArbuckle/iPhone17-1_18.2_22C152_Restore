@interface CRLPKCompressedStrokePointArray
- (CRLPKCompressedStrokePointArray)initWithStroke:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation CRLPKCompressedStrokePointArray

- (CRLPKCompressedStrokePointArray)initWithStroke:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLPKCompressedStrokePointArray;
  v5 = [(CRLPKCompressedStrokePointArray *)&v7 init];
  objc_storeWeak((id *)&v5->_stroke, v4);

  return v5;
}

- (unint64_t)count
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  id v3 = [WeakRetained _pointsCount];

  return (unint64_t)v3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  p_stroke = &self->_stroke;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  id v7 = [WeakRetained _pointsCount];

  if ((unint64_t)v7 <= a3)
  {
    unsigned int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9900);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110658;
      unsigned int v22 = v8;
      __int16 v23 = 2082;
      v24 = "-[CRLPKCompressedStrokePointArray objectAtIndex:]";
      __int16 v25 = 2082;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm";
      __int16 v27 = 1024;
      int v28 = 562;
      __int16 v29 = 2080;
      v30 = "-[CRLPKCompressedStrokePointArray objectAtIndex:]";
      __int16 v31 = 2048;
      unint64_t v32 = a3;
      __int16 v33 = 2048;
      unint64_t v34 = [(CRLPKCompressedStrokePointArray *)self count];
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d *** %s: index %lu beyond bounds [0 .. %lu]", buf, 0x40u);
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9920);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray objectAtIndex:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 562, 0, "*** %s: index %lu beyond bounds [0 .. %lu]", "-[CRLPKCompressedStrokePointArray objectAtIndex:]", a3, [(CRLPKCompressedStrokePointArray *)self count]);
  }
  id v13 = objc_loadWeakRetained((id *)p_stroke);
  id v14 = [v13 _strokePointAtIndex:a3];

  id v15 = objc_loadWeakRetained((id *)p_stroke);
  id v16 = [v15 _inflight];

  v17 = [CRLPKStrokePoint alloc];
  id v18 = objc_loadWeakRetained((id *)p_stroke);
  v19 = [(CRLPKStrokePoint *)v17 initWithStroke:v18 strokePoint:v14 inflight:v16];

  return v19;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9940);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B26DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9960);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unsigned int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray insertObject:atIndex:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:570 isFatal:0 description:"Only CRLPKStrokePoint instances can be added to a stroke's point array"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  [WeakRetained _insertStrokePoint:[v6 _strokePoint] atIndex:a4];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  [WeakRetained _removeStrokePointAtIndex:a3];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F9980);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2764();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F99A0);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray addObject:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:580 isFatal:0 description:"Only CRLPKStrokePoint instances can be added to a stroke's point array"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  [WeakRetained _addStrokePoint:[v4 _strokePoint]];
}

- (void)removeLastObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  [WeakRetained _removeLastStrokePoint];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  if (([v6 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F99C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B27EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F99E0);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unsigned int v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKCompressedStrokePointArray replaceObjectAtIndex:withObject:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:590 isFatal:0 description:"Only CRLPKStrokePoint instances can be added to a stroke's point array"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stroke);
  [WeakRetained _replaceStrokePointAtIndex:a3 withStrokePoint:[v6 _strokePoint]];
}

- (void).cxx_destruct
{
}

@end