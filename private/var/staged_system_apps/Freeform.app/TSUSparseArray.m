@interface TSUSparseArray
+ (id)array;
- (BOOL)hasObjectForKey:(unint64_t)a3;
- (NSIndexSet)populatedKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxIndexForCurrentDepth;
- (unint64_t)maxKey;
- (unint64_t)minKey;
- (void)addObjectsFromArray:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)foreach:(id)a3;
- (void)increaseDepth;
- (void)removeObjectForKey:(unint64_t)a3;
- (void)setObject:(id)a3 forKey:(unint64_t)a4;
@end

@implementation TSUSparseArray

+ (id)array
{
  objc_opt_class();
  v2 = objc_opt_new();

  return v2;
}

- (void)dealloc
{
  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUSparseArray;
  [(TSUSparseArray *)&v4 dealloc];
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001D7888;
  v10 = sub_1001D7898;
  id v11 = +[NSString stringWithFormat:@"<%@: %p>:", objc_opt_class(), self];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001D78A0;
  v5[3] = &unk_1014E0268;
  v5[4] = &v6;
  [(TSUSparseArray *)self foreach:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)maxIndexForCurrentDepth
{
  unsigned int depth = self->_depth;
  if (!depth) {
    return 0;
  }
  char v3 = 8 * depth;
  if (8 * depth >= 0x21)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0288);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101087F8C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E02A8);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v6, (uint64_t)&v10, v4);
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUSparseArray maxIndexForCurrentDepth]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSparseArray.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:301 isFatal:0 description:"Not expecting a shiftedDepth larger than 32"];
  }
  return ~(-1 << v3);
}

- (id)objectForKey:(unint64_t)a3
{
  uint64_t depth = self->_depth;
  if (depth && (unint64_t v6 = [(TSUSparseArray *)self maxIndexForCurrentDepth], v6 >= a3))
  {
    __chkstk_darwin(v6, v7);
    uint64_t v10 = (char *)&v19 - v9;
    topPage = self->_topPage;
    uint64_t v12 = depth;
    do
    {
      uint64_t v13 = a3;
      a3 >>= 8;
      *(void *)&v10[8 * --v12] = v13;
    }
    while (v12);
    uint64_t v14 = (depth - 1);
    if (depth == 1)
    {
      uint64_t v14 = 0;
LABEL_12:
      uint64_t v8 = topPage[*(void *)&v10[8 * v14] + 1].var0;
    }
    else
    {
      uint64_t v15 = (depth - 1);
      v16 = (uint64_t *)v10;
      while (1)
      {
        uint64_t v17 = *v16++;
        topPage = (tsuSaPage *)topPage[v17 + 1].var0;
        if (!topPage) {
          break;
        }
        if (!--v15) {
          goto LABEL_12;
        }
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)increaseDepth
{
  unsigned int depth = self->_depth;
  if (depth)
  {
    if (depth >= 4)
    {
      int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E02C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101088020();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E02E8);
      }
      int v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        v5 = +[CRLAssertionHandler packedBacktraceString];
        sub_101069C40(v5, (uint64_t)&v8, v3);
      }

      unint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUSparseArray increaseDepth]");
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLSparseArray.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:335 isFatal:0 description:"TSUSparseArray - getting too deep"];
    }
    operator new();
  }
  operator new();
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  id v17 = a3;
  while (1)
  {
    unint64_t v6 = [(TSUSparseArray *)self maxIndexForCurrentDepth];
    if (v6 >= a4)
    {
      if (self->_depth) {
        break;
      }
    }
    [(TSUSparseArray *)self increaseDepth];
  }
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v17 - v8;
  unsigned int depth = self->_depth;
  if (depth)
  {
    uint64_t v11 = self->_depth;
    do
    {
      uint64_t v12 = a4;
      a4 >>= 8;
      *(void *)&v9[8 * --v11] = v12;
    }
    while (v11);
    topPage = self->_topPage;
    if (depth == 1)
    {
      unint64_t v14 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    topPage = self->_topPage;
  }
  unint64_t v15 = 0;
  do
  {
    topPage = (tsuSaPage *)topPage[*(void *)&v9[8 * v15] + 1].var0;
    if (!topPage)
    {
      if (v15 == depth - 2) {
        operator new();
      }
      operator new();
    }
    ++v15;
    unint64_t v14 = depth - 1;
  }
  while (v15 < v14);
LABEL_17:
  self->_nonNilCount += (int)sub_1001D81A0((uint64_t)topPage, v17, *(void *)&v9[8 * v14]);
  v16 = v17;
}

- (BOOL)hasObjectForKey:(unint64_t)a3
{
  int v3 = [(TSUSparseArray *)self objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)removeObjectForKey:(unint64_t)a3
{
}

- (void)foreach:(id)a3
{
  id v4 = a3;
  topPage = self->_topPage;
  if (topPage)
  {
    char v6 = 0;
    (*((void (**)(tsuSaPage *, id, void, char *))topPage->var0 + 5))(topPage, v4, 0, &v6);
  }
}

- (void)addObjectsFromArray:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001D8324;
  v3[3] = &unk_1014E0310;
  v3[4] = self;
  [a3 foreach:v3];
}

- (void)clear
{
  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
    self->_unsigned int depth = 0;
  }
}

- (unint64_t)count
{
  return self->_nonNilCount;
}

- (unint64_t)minKey
{
  topPage = self->_topPage;
  if (topPage) {
    return (*((uint64_t (**)(tsuSaPage *, void))topPage->var0 + 2))(topPage, 0);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)maxKey
{
  topPage = self->_topPage;
  if (topPage) {
    return (*((uint64_t (**)(tsuSaPage *, void))topPage->var0 + 3))(topPage, 0);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (NSIndexSet)populatedKeys
{
  topPage = self->_topPage;
  if (topPage) {
    (*((void (**)(tsuSaPage *, void))topPage->var0 + 4))(topPage, 0);
  }
  else {
  int v3 = +[NSIndexSet indexSet];
  }

  return (NSIndexSet *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  *(_DWORD *)(v4 + 24) = self->_depth;
  topPage = self->_topPage;
  *(void *)(v4 + 16) = self->_nonNilCount;
  if (topPage) {
    topPage = (tsuSaPage *)(*((uint64_t (**)(tsuSaPage *))topPage->var0 + 6))(topPage);
  }
  *(void *)(v4 + 8) = topPage;
  return (id)v4;
}

@end