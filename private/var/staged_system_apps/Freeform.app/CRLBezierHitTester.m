@interface CRLBezierHitTester
- (BOOL)allowsLargeCrawlingDistances;
- (BOOL)isAnyPathNearPoint:(CGPoint)a3 withSearchThreshold:(double)a4;
- (CRLBezierHitTester)initWithBucketSize:(double)a3;
- (id).cxx_construct;
- (id)p_bucketPointValueForPoint:(CGPoint)a3;
- (id)p_wrapHitInfos:()vector<CRLBezierHitTesterHitInfo;
- (id)pathsCrossingPath:(id)a3 withSearchThreshold:(double)a4;
- (id)pathsWithPercentage:(double)a3 approximatelyInsidePath:(id)a4 requiringPercentForFilledEdges:(BOOL)a5;
- (id)wrappedAllHitsAlongPath:(id)a3 withSearchThreshold:(double)a4;
- (id)wrappedClosestHitsTo:(CGPoint)a3 withSearchThreshold:(double)a4 passingTest:(id)a5;
- (unint64_t)pathCount;
- (vector<CRLBezierHitTesterHitInfo,)allHitsAlongPath:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3;
- (vector<CRLBezierHitTesterHitInfo,)closestHitsTo:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3 passingTest:(CGPoint)a4;
- (void)addPath:(id)a3 filled:(BOOL)a4;
- (void)addPath:(id)a3 filled:(BOOL)a4 clippedToRect:(CGRect)a5;
- (void)addPath:(id)a3 filled:(BOOL)a4 crawlingDistance:(double)a5;
- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5;
- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6;
- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6 clippedToRect:(CGRect)a7;
- (void)p_addFilledPathToGrid:(id)a3 withPathId:(unint64_t)a4 clippedToRect:(CGRect)a5;
- (void)p_addOpenPathToGrid:(id)a3 withPathId:(unint64_t)a4 crawlingDistance:(double)a5 clippedToRect:(CGRect)a6;
- (void)p_addPointInfoStruct:(id *)a3;
- (void)p_iterateOverEveryBucketPointInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)p_iterateOverEveryExistingBucketPointInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)p_iterateOverEveryNonEmptyBucketInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)p_iterateOverEveryNonEmptyBucketNear:(CGPoint)a3 withSearchThreshold:(double)a4 usingBlock:(id)a5;
- (void)removePath:(id)a3;
- (void)setAllowsLargeCrawlingDistances:(BOOL)a3;
@end

@implementation CRLBezierHitTester

- (CRLBezierHitTester)initWithBucketSize:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRLBezierHitTester;
  v4 = [(CRLBezierHitTester *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_bucketSize = (unint64_t)a3;
    v4->_nextPathIdForInsertion = 0;
    uint64_t v6 = +[NSHashTable hashTableWithOptions:512];
    allPathTable = v5->_allPathTable;
    v5->_allPathTable = (NSHashTable *)v6;
  }
  return v5;
}

- (unint64_t)pathCount
{
  return [(NSHashTable *)self->_allPathTable count];
}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6 clippedToRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  BOOL v12 = a4;
  unint64_t v23 = a5;
  id v24 = a3;
  if (a6 > 1.0 && !self->_allowsLargeCrawlingDistances)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBBD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067810();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBBF0);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:153 isFatal:0 description:"Passing a crawlingDistance greater than the default may cause unexpected problems hit testing with some methods."];
  }
  if (sub_10001B6C8(&self->_allPathMap.__table_.__bucket_list_.__ptr_.__value_, &v23))
  {
    int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBC10);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067750((uint64_t *)&v23, v18, v19);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBC30);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester addPath:filled:pathID:crawlingDistance:clippedToRect:]");
    v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 178, 0, "Tried to add a path with pathID that already exists (%lu)", v23);
  }
  else
  {
    sub_10001B77C((uint64_t)&self->_allPathMap, &v23, &v23, &v24);
    [(NSHashTable *)self->_allPathTable addObject:v24];
    v26 = 0;
    uint64_t v27 = 0;
    v25 = &v26;
    sub_10001BCCC((uint64_t)&self->_allNonFilledPointInfosForPathMap, (unint64_t *)&v24, &v24, (uint64_t *)&v25);
    sub_10001BC78((uint64_t)&v25, v26);
    v26 = 0;
    uint64_t v27 = 0;
    v25 = &v26;
    sub_10001BCCC((uint64_t)&self->_allFilledPointInfosForPathMap, (unint64_t *)&v24, &v24, (uint64_t *)&v25);
    sub_10001BC78((uint64_t)&v25, v26);
    if (v12)
    {
      self->_hasAtLeastOneFilledPath = 1;
      -[CRLBezierHitTester p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:](self, "p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:", v24, v23, a6, x, y, width, height);
      -[CRLBezierHitTester p_addFilledPathToGrid:withPathId:clippedToRect:](self, "p_addFilledPathToGrid:withPathId:clippedToRect:", v24, v23, x, y, width, height);
    }
    else
    {
      self->_hasAtLeastOneOpenPath = 1;
      -[CRLBezierHitTester p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:](self, "p_addOpenPathToGrid:withPathId:crawlingDistance:clippedToRect:", v24, v23, a6, x, y, width, height);
    }
    if (v23 == self->_nextPathIdForInsertion) {
      self->_nextPathIdForInsertion = v23 + 1;
    }
  }
}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5 crawlingDistance:(double)a6
{
}

- (void)addPath:(id)a3 filled:(BOOL)a4 crawlingDistance:(double)a5
{
}

- (void)addPath:(id)a3 filled:(BOOL)a4 pathID:(unint64_t)a5
{
}

- (void)addPath:(id)a3 filled:(BOOL)a4 clippedToRect:(CGRect)a5
{
}

- (void)addPath:(id)a3 filled:(BOOL)a4
{
}

- (void)removePath:(id)a3
{
  id v4 = a3;
  id v28 = v4;
  p_p1 = &self->_allPathMap.__table_.__p1_;
  do
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long, CRLBezierPath *>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      goto LABEL_5;
    }
  }
  while (p_p1[3].__value_.__next_ != v4);
  next = p_p1[2].__value_.__next_;
  if (next == (void *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBC50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067898();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBC70);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester removePath:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:212 isFatal:0 description:"Tried to remove a path that is not in the hit tester."];

    goto LABEL_24;
  }
  *((void *)&v29 + 1) = 0;
  uint64_t v30 = 0;
  *(void *)&long long v29 = (char *)&v29 + 8;
  unint64_t v23 = &v28;
  objc_super v9 = sub_10001BFE8((uint64_t)&self->_allNonFilledPointInfosForPathMap, (unint64_t *)&v28, (uint64_t)&unk_101174E70, &v23);
  sub_10001C244((uint64_t)&v25, (uint64_t)(v9 + 3));
  double v21 = COERCE_DOUBLE(&v28);
  v10 = sub_10001BFE8((uint64_t)&self->_allFilledPointInfosForPathMap, (unint64_t *)&v28, (uint64_t)&unk_101174E70, (id **)&v21);
  sub_10001C244((uint64_t)&v23, (uint64_t)(v10 + 3));
  sub_1000191DC(&v29, v25, &v26);
  sub_1000191DC(&v29, v23, &v24);
  v11 = (double *)v29;
  if ((long long *)v29 != (long long *)((char *)&v29 + 8))
  {
    do
    {
      double v12 = v11[4];
      double v13 = v11[5];
      double v21 = 0.0;
      double v22 = 0.0;
      double bucketSize = (double)self->_bucketSize;
      double v15 = sub_100407E0C(v12, bucketSize);
      double v16 = sub_100407E0C(v13, bucketSize);
      double v21 = v15;
      double v22 = v16;
      v17 = sub_10001C7D0(&self->_pointInfoGridMap.__table_.__bucket_list_.__ptr_.__value_, &v21);
      if (v17) {
        sub_10001C8A4((uint64_t **)v17 + 4, (uint64_t)(v11 + 4));
      }
      int v18 = (double *)*((void *)v11 + 1);
      if (v18)
      {
        do
        {
          v19 = v18;
          int v18 = *(double **)v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (double *)*((void *)v11 + 2);
          BOOL v20 = *(void *)v19 == (void)v11;
          v11 = v19;
        }
        while (!v20);
      }
      v11 = v19;
    }
    while (v19 != (double *)((char *)&v29 + 8));
  }
  sub_10001CD80(&self->_allPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&next);
  [(NSHashTable *)self->_allPathTable removeObject:v28];
  sub_10001CFF8(&self->_allNonFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v28);
  sub_10001CFF8(&self->_allFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v28);
  sub_10001BC78((uint64_t)&v23, v24);
  sub_10001BC78((uint64_t)&v25, v26);
  sub_10001BC78((uint64_t)&v29, *((void **)&v29 + 1));
LABEL_24:
}

- (vector<CRLBezierHitTesterHitInfo,)closestHitsTo:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3 passingTest:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a6;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x5812000000;
  v38 = sub_10001958C;
  memset(v40, 0, sizeof(v40));
  v39 = sub_100019598;
  uint64_t v41 = 0;
  int v42 = 1065353216;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000195A0;
  v29[3] = &unk_1014CBC98;
  double v32 = x;
  double v33 = y;
  double v34 = a5;
  id v27 = v11;
  id v30 = v27;
  v31 = &v35;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketNear:withSearchThreshold:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketNear:withSearchThreshold:usingBlock:", v29, x, y, a5);
  double v12 = (uint64_t *)v36[8];
  if (v12)
  {
    var1 = 0;
    p_var2 = &retstr->var2;
    do
    {
      *(_OWORD *)id v28 = *((_OWORD *)v12 + 1);
      *(_OWORD *)&v28[16] = *((_OWORD *)v12 + 2);
      *(_OWORD *)&v28[32] = *((_OWORD *)v12 + 3);
      *(_OWORD *)&v28[48] = *((_OWORD *)v12 + 4);
      if (var1 >= p_var2->var0)
      {
        var0 = retstr->var0;
        uint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((var1 - retstr->var0) >> 3);
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) > 0x492492492492492) {
          sub_100004E40();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((p_var2->var0 - var0) >> 3) > v17) {
          unint64_t v17 = 0xDB6DB6DB6DB6DB6ELL * ((p_var2->var0 - var0) >> 3);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((p_var2->var0 - var0) >> 3)) >= 0x249249249249249) {
          unint64_t v18 = 0x492492492492492;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          v19 = (char *)sub_10001D4D0((uint64_t)&retstr->var2, v18);
          var0 = retstr->var0;
          var1 = retstr->var1;
        }
        else
        {
          v19 = 0;
        }
        BOOL v20 = &v19[56 * v16];
        *(_OWORD *)BOOL v20 = *(_OWORD *)&v28[8];
        *((_OWORD *)v20 + 1) = *(_OWORD *)&v28[24];
        *((_OWORD *)v20 + 2) = *(_OWORD *)&v28[40];
        *((void *)v20 + 6) = *(void *)&v28[56];
        if (var1 == var0)
        {
          v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[56 * v16];
        }
        else
        {
          double v21 = &v19[56 * v16];
          do
          {
            long long v22 = *(_OWORD *)((char *)var1 - 56);
            long long v23 = *(_OWORD *)((char *)var1 - 40);
            long long v24 = *(_OWORD *)((char *)var1 - 24);
            v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v21 - 56);
            *((void *)v21 - 1) = *((void *)var1 - 1);
            *(_OWORD *)(v21 - 24) = v24;
            *(_OWORD *)(v21 - 40) = v23;
            *(_OWORD *)(v21 - 56) = v22;
            var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var1 - 56);
            v21 -= 56;
          }
          while (var1 != var0);
        }
        var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 56);
        retstr->var0 = v25;
        retstr->var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 56);
        retstr->var2.var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[56 * v18];
        if (var0) {
          operator delete(var0);
        }
      }
      else
      {
        *((void *)var1 + 6) = *(void *)&v28[56];
        *((_OWORD *)var1 + 1) = *(_OWORD *)&v28[24];
        *((_OWORD *)var1 + 2) = *(_OWORD *)&v28[40];
        *(_OWORD *)var1 = *(_OWORD *)&v28[8];
        var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var1 + 56);
      }
      retstr->var1 = var1;
      double v12 = (uint64_t *)*v12;
    }
    while (v12);
  }

  _Block_object_dispose(&v35, 8);
  sub_10001D134((uint64_t)&v40[8]);

  return result;
}

- (id)wrappedClosestHitsTo:(CGPoint)a3 withSearchThreshold:(double)a4 passingTest:(id)a5
{
  -[CRLBezierHitTester closestHitsTo:withSearchThreshold:passingTest:](self, "closestHitsTo:withSearchThreshold:passingTest:", a5, a3.x, a3.y, a4);
  uint64_t v6 = [(CRLBezierHitTester *)self p_wrapHitInfos:__p];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v6;
}

- (vector<CRLBezierHitTesterHitInfo,)allHitsAlongPath:(CRLBezierHitTester *)self withSearchThreshold:(SEL)a3
{
  id v8 = a4;
  if (self->_hasAtLeastOneFilledPath)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBCB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067920();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBCD8);
    }
    objc_super v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester allHitsAlongPath:withSearchThreshold:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:265 isFatal:0 description:"This method was not designed for use with filled paths."];
  }
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x4812000000;
  v26 = sub_100019BA4;
  id v27 = sub_100019BC8;
  id v28 = "";
  id v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  [v8 bounds];
  CGRect v33 = CGRectInset(v32, -a5, -a5);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100019BE0;
  v19[3] = &unk_1014CBD00;
  id v16 = v8;
  double v22 = a5;
  id v20 = v16;
  double v21 = &v23;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", v19, x, y, width, height);
  unint64_t v17 = v24;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  sub_10001D58C(retstr, (const void *)v17[6], v17[7], 0x6DB6DB6DB6DB6DB7 * ((v17[7] - v17[6]) >> 3));

  _Block_object_dispose(&v23, 8);
  if (__p)
  {
    id v30 = __p;
    operator delete(__p);
  }

  return result;
}

- (id)wrappedAllHitsAlongPath:(id)a3 withSearchThreshold:(double)a4
{
  [(CRLBezierHitTester *)self allHitsAlongPath:a3 withSearchThreshold:a4];
  v5 = [(CRLBezierHitTester *)self p_wrapHitInfos:__p];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v5;
}

- (BOOL)isAnyPathNearPoint:(CGPoint)a3 withSearchThreshold:(double)a4
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019FA8;
  v6[3] = &unk_1014CBD28;
  CGPoint v7 = a3;
  double v8 = a4 * a4;
  v6[4] = &v9;
  [(CRLBezierHitTester *)self p_iterateOverEveryNonEmptyBucketInRect:v6 usingBlock:sub_10006402C(a3.x, a3.y, a4 + a4)];
  char v4 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)pathsCrossingPath:(id)a3 withSearchThreshold:(double)a4
{
  id v6 = a3;
  if (self->_allowsLargeCrawlingDistances)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBD48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010679A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBD68);
    }
    CGPoint v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierHitTester.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:309 isFatal:0 description:"-pathsCrossingPath:withSearchThreshold: does not support large crawling distances."];
  }
  v10 = +[NSHashTable hashTableWithOptions:512];
  if ((float)((float)((float)self->_bucketSize * 0.5) * 1.4142) <= a4) {
    double v11 = a4;
  }
  else {
    double v11 = (float)((float)((float)self->_bucketSize * 0.5) * 1.4142);
  }
  char v12 = [[CRLBezierHitTester alloc] initWithBucketSize:(double)self->_bucketSize];
  [(CRLBezierHitTester *)v12 addPath:v6 filled:0];
  [v6 bounds];
  CGRect v29 = CGRectInset(v28, -v11, -v11);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001A458;
  v22[3] = &unk_1014CBD90;
  v22[4] = self;
  double v26 = v11;
  double v27 = a4;
  id v17 = v10;
  id v23 = v17;
  long long v24 = v12;
  id v18 = v6;
  id v25 = v18;
  -[CRLBezierHitTester p_iterateOverEveryNonEmptyBucketInRect:usingBlock:](self, "p_iterateOverEveryNonEmptyBucketInRect:usingBlock:", v22, x, y, width, height);
  v19 = v25;
  id v20 = v17;

  return v20;
}

- (id)pathsWithPercentage:(double)a3 approximatelyInsidePath:(id)a4 requiringPercentForFilledEdges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:self->_allPathMap.__table_.__p2_.__value_];
  id v10 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:self->_allPathMap.__table_.__p2_.__value_];
  for (i = (id *)self->_allPathMap.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v12 = i[3];
    [v9 setObject:&off_10155D0B8 forKeyedSubscript:v12];
    [v10 setObject:&off_10155D0B8 forKeyedSubscript:v12];
  }
  [v8 bounds];
  v44 = self;
  next = (double *)self->_pointInfoGridMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    CGFloat v18 = v13;
    CGFloat v19 = v14;
    CGFloat v20 = v15;
    CGFloat v21 = v16;
    p_allPathMap = &self->_allPathMap;
    id v45 = v8;
    do
    {
      double v23 = next[2];
      double v24 = next[3];
      v55.origin.double x = v18;
      v55.origin.double y = v19;
      v55.size.double width = v20;
      v55.size.double height = v21;
      v54.double x = v23;
      v54.double y = v24;
      if (CGRectContainsPoint(v55, v54) && objc_msgSend(v8, "containsPoint:", v23, v24))
      {
        sub_10001C244((uint64_t)&v50, (uint64_t)(next + 4));
        id v25 = v50;
        if (v50 != (unint64_t *)&v51)
        {
          do
          {
            double v26 = sub_10001CDB8(p_allPathMap, v25 + 6);
            if (v26)
            {
              id v27 = (id)v26[3];
              if (*((unsigned char *)v25 + 64))
              {
                CGRect v28 = [v10 objectForKeyedSubscript:v27];
                CGRect v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 intValue] + 1);
                [v10 setObject:v29 forKeyedSubscript:v27];
              }
              else
              {
                CGRect v28 = [v9 objectForKeyedSubscript:v27];
                CGRect v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 intValue] + 1);
                [v9 setObject:v29 forKeyedSubscript:v27];
              }
            }
            id v30 = (unint64_t *)v25[1];
            if (v30)
            {
              do
              {
                uint64_t v31 = v30;
                id v30 = (unint64_t *)*v30;
              }
              while (v30);
            }
            else
            {
              do
              {
                uint64_t v31 = (unint64_t *)v25[2];
                BOOL v32 = *v31 == (void)v25;
                id v25 = v31;
              }
              while (!v32);
            }
            id v25 = v31;
          }
          while (v31 != (unint64_t *)&v51);
        }
        sub_10001BC78((uint64_t)&v50, v51);
        id v8 = v45;
      }
      next = *(double **)next;
    }
    while (next);
  }
  CGRect v33 = +[NSHashTable hashTableWithOptions:512];
  for (j = (id *)v44->_allPathMap.__table_.__p1_.__value_.__next_; j; j = (id *)*j)
  {
    id v49 = j[3];
    uint64_t v35 = sub_10001D030(&v44->_allNonFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v49);
    sub_10001C244((uint64_t)&v50, (uint64_t)(v35 + 3));
    v36 = sub_10001D030(&v44->_allFilledPointInfosForPathMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v49);
    sub_10001C244((uint64_t)v46, (uint64_t)(v36 + 3));
    uint64_t v37 = [v9 objectForKeyedSubscript:v49];
    v38 = [v10 objectForKeyedSubscript:v49];
    v39 = v38;
    if (v52 >= 2)
    {
      if (v48)
      {
        [v38 crl_CGFloatValue];
        if (v40 / (double)v48 < a3) {
          goto LABEL_30;
        }
        if (v5)
        {
          [v37 crl_CGFloatValue];
          if (v41 / (double)v52 < a3) {
            goto LABEL_30;
          }
        }
LABEL_29:
        [v33 addObject:v49];
        goto LABEL_30;
      }
      [v37 crl_CGFloatValue];
      if (v42 / (double)v52 >= a3) {
        goto LABEL_29;
      }
    }
LABEL_30:

    sub_10001BC78((uint64_t)v46, v47);
    sub_10001BC78((uint64_t)&v50, v51);
  }

  return v33;
}

- (id)p_bucketPointValueForPoint:(CGPoint)a3
{
  double y = a3.y;
  double bucketSize = (double)self->_bucketSize;
  double v5 = sub_100407E0C(a3.x, bucketSize);
  double v6 = sub_100407E0C(y, bucketSize);

  return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v5, v6);
}

- (id)p_wrapHitInfos:()vector<CRLBezierHitTesterHitInfo
{
  double v5 = +[NSMutableSet set];
  var0 = a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    p_allPathMap = &self->_allPathMap;
    do
    {
      long long v9 = *(_OWORD *)var0;
      long long v10 = *((_OWORD *)var0 + 1);
      long long v11 = *((_OWORD *)var0 + 2);
      uint64_t v21 = *((void *)var0 + 6);
      long long v19 = v10;
      long long v20 = v11;
      long long v18 = v9;
      id v12 = [CRLBezierHitTesterHitInfoWrapper alloc];
      v16[0] = v18;
      v16[1] = v19;
      v16[2] = v20;
      uint64_t v17 = v21;
      double v13 = sub_10001CDB8(p_allPathMap, (unint64_t *)&v20);
      if (!v13) {
        sub_10001D180("unordered_map::at: key not found");
      }
      double v14 = [(CRLBezierHitTesterHitInfoWrapper *)v12 initWithHitInfo:v16 hitPath:v13[3]];
      [v5 addObject:v14];

      var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)var0 + 56);
    }
    while (var0 != var1);
  }

  return v5;
}

- (void)p_addPointInfoStruct:(id *)a3
{
  double y = a3->var0.y;
  double bucketSize = (double)self->_bucketSize;
  v14.double x = sub_100407E0C(a3->var0.x, bucketSize);
  v14.double y = sub_100407E0C(y, bucketSize);
  CGPoint v7 = sub_10001C7D0(&self->_pointInfoGridMap.__table_.__bucket_list_.__ptr_.__value_, &v14.x);
  if (v7)
  {
    sub_10001D660((uint64_t **)v7 + 4, (uint64_t)a3, (uint64_t)a3);
  }
  else
  {
    long long v8 = *(_OWORD *)&a3->var1;
    CGPoint var0 = a3->var0;
    long long v16 = v8;
    uint64_t v17 = *(void *)&a3->var3;
    sub_10001D6EC((uint64_t)v12, (uint64_t)&var0, 1);
    CGPoint var0 = v14;
    sub_10001C244((uint64_t)&v16, (uint64_t)v12);
    sub_10001D770((uint64_t)&self->_pointInfoGridMap, &var0.x, (uint64_t)&var0);
    sub_10001BC78((uint64_t)&v16, *((void **)&v16 + 1));
    sub_10001BC78((uint64_t)v12, v13);
  }
  p_allPathMap = &self->_allPathMap;
  p_var1 = &a3->var1;
  if (a3->var3)
  {
    *(void *)&var0.double x = &a3->var1;
    *(void *)&var0.double x = sub_10001DAB0((uint64_t)p_allPathMap, p_var1, (uint64_t)&unk_101174E70, &var0) + 3;
    long long v11 = (uint64_t **)sub_10001BFE8((uint64_t)&self->_allFilledPointInfosForPathMap, *(unint64_t **)&var0.x, (uint64_t)&unk_101174E70, (id **)&var0);
  }
  else
  {
    *(void *)&var0.double x = &a3->var1;
    *(void *)&var0.double x = sub_10001DAB0((uint64_t)p_allPathMap, p_var1, (uint64_t)&unk_101174E70, &var0) + 3;
    long long v11 = (uint64_t **)sub_10001BFE8((uint64_t)&self->_allNonFilledPointInfosForPathMap, *(unint64_t **)&var0.x, (uint64_t)&unk_101174E70, (id **)&var0);
  }
  sub_10001D660(v11 + 3, (uint64_t)a3, (uint64_t)a3);
}

- (void)p_addOpenPathToGrid:(id)a3 withPathId:(unint64_t)a4 crawlingDistance:(double)a5 clippedToRect:(CGRect)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AEA8;
  v6[3] = &unk_1014CBDB8;
  CGRect v7 = a6;
  unint64_t v8 = a4;
  v6[4] = self;
  [a3 iterateOverPathWithPointDistancePerIteration:v6 usingBlock:a5];
}

- (void)p_addFilledPathToGrid:(id)a3 withPathId:(unint64_t)a4 clippedToRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  [v11 bounds];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v22 = CGRectIntersection(v21, v23);
  double v12 = v22.origin.x;
  double v13 = v22.origin.y;
  double v14 = v22.size.width;
  double v15 = v22.size.height;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B044;
  v17[3] = &unk_1014CBDE0;
  id v16 = v11;
  long long v19 = self;
  unint64_t v20 = a4;
  id v18 = v16;
  -[CRLBezierHitTester p_iterateOverEveryBucketPointInRect:usingBlock:](self, "p_iterateOverEveryBucketPointInRect:usingBlock:", v17, v12, v13, v14, v15);
}

- (void)p_iterateOverEveryBucketPointInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v21 = (void (**)(double, double))a4;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (!CGRectIsNull(v23))
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v24);
    double v10 = sub_100407E0C(MinX, (double)self->_bucketSize);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v25);
    double v12 = sub_100407E0C(MaxX, (double)self->_bucketSize);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v26);
    double v14 = sub_100407E0C(MinY, (double)self->_bucketSize);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v27);
    double v16 = sub_100407E0C(MaxY, (double)self->_bucketSize);
    uint64_t v17 = (uint64_t)v10;
    if ((uint64_t)v10 <= (uint64_t)v12)
    {
      uint64_t v18 = (uint64_t)v16;
      do
      {
        if ((uint64_t)v14 <= v18)
        {
          uint64_t v20 = (uint64_t)v14;
          do
          {
            v21[2]((double)v17, (double)v20);
            unint64_t bucketSize = self->_bucketSize;
            v20 += bucketSize;
          }
          while (v20 <= v18);
        }
        else
        {
          unint64_t bucketSize = self->_bucketSize;
        }
        v17 += bucketSize;
      }
      while (v17 <= (uint64_t)v12);
    }
  }
}

- (void)p_iterateOverEveryExistingBucketPointInRect:(CGRect)a3 usingBlock:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  long long v9 = (void (**)(id, unsigned char *, double, double))a4;
  char v29 = 0;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v30);
  unint64_t bucketSize = self->_bucketSize;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v31);
  unint64_t v27 = self->_bucketSize;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v32);
  unint64_t v13 = self->_bucketSize;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v33);
  uint64_t v15 = (uint64_t)(floor(MinX / (double)bucketSize) * (double)bucketSize);
  uint64_t v16 = (uint64_t)(ceil(MaxX / (double)v27) * (double)v27);
  uint64_t v17 = (uint64_t)(floor(MinY / (double)v13) * (double)v13);
  unint64_t v18 = self->_bucketSize;
  uint64_t v19 = (uint64_t)(ceil(MaxY / (double)v18) * (double)v18);
  if ((v19 - v17) / v18 * ((v16 - v15) / v18) <= self->_pointInfoGridMap.__table_.__p2_.__value_)
  {
    if (v16 >= v15)
    {
      while (v19 < v17)
      {
LABEL_22:
        v15 += v18;
        if (v15 > v16) {
          goto LABEL_17;
        }
      }
      uint64_t v26 = v17;
      while (1)
      {
        v9[2](v9, &v29, (double)v15, (double)v26);
        if (v29) {
          break;
        }
        unint64_t v18 = self->_bucketSize;
        v26 += v18;
        if (v26 > v19) {
          goto LABEL_22;
        }
      }
    }
  }
  else
  {
    for (i = (double *)self->_pointInfoGridMap.__table_.__p1_.__value_.__next_; i; i = *(double **)i)
    {
      double v21 = i[2];
      double v22 = i[3];
      if (v21 >= (double)v15 && v21 <= (double)v16 && v22 >= (double)v17 && v22 <= (double)v19)
      {
        ((void (*)(void (**)(id, unsigned char *, double, double), char *))v9[2])(v9, &v29);
        if (v29) {
          break;
        }
      }
    }
  }
LABEL_17:
}

- (void)p_iterateOverEveryNonEmptyBucketInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B580;
  v9[3] = &unk_1014CBE08;
  double v10 = self;
  id v11 = a4;
  id v8 = v11;
  -[CRLBezierHitTester p_iterateOverEveryExistingBucketPointInRect:usingBlock:](v10, "p_iterateOverEveryExistingBucketPointInRect:usingBlock:", v9, x, y, width, height);
}

- (void)p_iterateOverEveryNonEmptyBucketNear:(CGPoint)a3 withSearchThreshold:(double)a4 usingBlock:(id)a5
{
  double v7 = sub_10006402C(a3.x, a3.y, a4 + a4);

  [(CRLBezierHitTester *)self p_iterateOverEveryNonEmptyBucketInRect:a5 usingBlock:v7];
}

- (BOOL)allowsLargeCrawlingDistances
{
  return self->_allowsLargeCrawlingDistances;
}

- (void)setAllowsLargeCrawlingDistances:(BOOL)a3
{
  self->_allowsLargeCrawlingDistances = a3;
}

- (void).cxx_destruct
{
  sub_10001DE00((uint64_t)&self->_allFilledPointInfosForPathMap);
  sub_10001DE00((uint64_t)&self->_allNonFilledPointInfosForPathMap);
  sub_10001DD80((uint64_t)&self->_allPathMap);
  objc_storeStrong((id *)&self->_allPathTable, 0);

  sub_10001DCFC((uint64_t)&self->_pointInfoGridMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end