@interface TSUSparseArray
+ (id)array;
- (BOOL)hasObjectForKey:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)maxIndexForCurrentDepth;
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
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  id v11 = [NSString stringWithFormat:@"<%@: %p>:", objc_opt_class(), self];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSUSparseArray_description__block_invoke;
  v5[3] = &unk_264D61338;
  v5[4] = &v6;
  [(TSUSparseArray *)self foreach:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__TSUSparseArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [NSString stringWithFormat:@"%@\n   [%lu] = %@", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3, v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
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
    objc_super v4 = [NSString stringWithUTF8String:"-[TSUSparseArray maxIndexForCurrentDepth]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSparseArray.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:215 isFatal:0 description:"Not expecting a shiftedDepth larger than 32"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return ~(-1 << v3);
}

- (id)objectForKey:(unint64_t)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t depth = self->_depth;
  if (depth && (unint64_t v6 = [(TSUSparseArray *)self maxIndexForCurrentDepth], v6 >= a3))
  {
    MEMORY[0x270FA5388](v6);
    v9 = (char *)v18 - v8;
    topPage = self->_topPage;
    uint64_t v11 = depth;
    do
    {
      uint64_t v12 = a3;
      a3 >>= 8;
      *(void *)&v9[8 * --v11] = v12;
    }
    while (v11);
    uint64_t v13 = (depth - 1);
    if (depth == 1)
    {
      uint64_t v13 = 0;
LABEL_12:
      v7 = topPage[*(void *)&v9[8 * v13] + 1].var0;
    }
    else
    {
      uint64_t v14 = (depth - 1);
      v15 = (uint64_t *)v9;
      while (1)
      {
        uint64_t v16 = *v15++;
        topPage = (tsuSaPage *)topPage[v16 + 1].var0;
        if (!topPage) {
          break;
        }
        if (!--v14) {
          goto LABEL_12;
        }
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)increaseDepth
{
  unsigned int depth = self->_depth;
  if (depth)
  {
    if (depth >= 4)
    {
      char v3 = [NSString stringWithUTF8String:"-[TSUSparseArray increaseDepth]"];
      objc_super v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSparseArray.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:249 isFatal:1 description:"TSUSparseArray - getting too deep"];

      TSUCrash((uint64_t)"TSUSparseArray - getting too deep", v5, v6, v7, v8, v9, v10, v11, v12);
    }
    operator new();
  }
  operator new();
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v16 = (objc_object *)a3;
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
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v16 - v7;
  unsigned int depth = self->_depth;
  if (depth)
  {
    uint64_t v10 = self->_depth;
    do
    {
      uint64_t v11 = a4;
      a4 >>= 8;
      *(void *)&v8[8 * --v10] = v11;
    }
    while (v10);
    topPage = self->_topPage;
    if (depth == 1)
    {
      unint64_t v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    topPage = self->_topPage;
  }
  unint64_t v14 = 0;
  do
  {
    topPage = (tsuSaPage *)topPage[*(void *)&v8[8 * v14] + 1].var0;
    if (!topPage)
    {
      if (v14 == depth - 2) {
        operator new();
      }
      operator new();
    }
    ++v14;
    unint64_t v13 = depth - 1;
  }
  while (v14 < v13);
LABEL_17:
  self->_nonNilCount += (int)tsuSaObjectPage::setObjectAtIndex((tsuSaObjectPage *)topPage, v16, *(void *)&v8[8 * v13]);
  v15 = v16;
}

- (BOOL)hasObjectForKey:(unint64_t)a3
{
  char v3 = [(TSUSparseArray *)self objectForKey:a3];
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
    (*((void (**)(tsuSaPage *, id, void, char *))topPage->var0 + 2))(topPage, v4, 0, &v6);
  }
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  *(_DWORD *)(v4 + 24) = self->_depth;
  topPage = self->_topPage;
  *(void *)(v4 + 16) = self->_nonNilCount;
  if (topPage) {
    topPage = (tsuSaPage *)(*((uint64_t (**)(tsuSaPage *))topPage->var0 + 3))(topPage);
  }
  *(void *)(v4 + 8) = topPage;
  return (id)v4;
}

@end