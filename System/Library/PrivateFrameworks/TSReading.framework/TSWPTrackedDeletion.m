@interface TSWPTrackedDeletion
- (TSWPTrackedDeletion)initWithRange:(_NSRange)a3 changeSession:(id)a4;
- (_NSRange)insertedRange;
- (int64_t)delta;
- (unint64_t)targetCharIndex;
- (void)dealloc;
- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6;
@end

@implementation TSWPTrackedDeletion

- (TSWPTrackedDeletion)initWithRange:(_NSRange)a3 changeSession:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v11.receiver = self;
  v11.super_class = (Class)TSWPTrackedDeletion;
  v7 = [(TSWPTrackedDeletion *)&v11 init];
  if (v7)
  {
    if (!length)
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPTrackedDeletion initWithRange:changeSession:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedDeletion.mm"), 30, @"Can't track a deletion over an empty range");
    }
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
    v7->_changeSession = (TSWPChangeSession *)a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTrackedDeletion;
  [(TSWPTrackedDeletion *)&v3 dealloc];
}

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6
{
  NSUInteger location = self->_range.location;
  if (a4)
  {
    location += a4;
    self->_range.NSUInteger location = location;
  }
  NSUInteger length = self->_range.length;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x4812000000;
  v39 = __Block_byref_object_copy__22;
  v40 = __Block_byref_object_dispose__22;
  v41 = &unk_22389B221;
  v43 = 0;
  uint64_t v44 = 0;
  v42 = 0;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke;
  v35[3] = &unk_2646B2CA8;
  v35[4] = &v36;
  objc_msgSend(a3, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 7, location, length, v35);
  v12 = (void *)v37[6];
  objc_super v11 = (void *)v37[7];
  while (v12 != v11)
  {
    objc_msgSend(a3, "removeSmartField:fromRange:undoTransaction:", *v12, v12[1], v12[2], a5);
    objc_super v11 = (void *)v37[7];
    v12 += 3;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x4812000000;
  v29 = __Block_byref_object_copy__22;
  v30 = __Block_byref_object_dispose__22;
  v31 = &unk_22389B221;
  v33 = 0;
  uint64_t v34 = 0;
  __p = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke_2;
  v25[3] = &unk_2646B2CA8;
  v25[4] = &v26;
  objc_msgSend(a3, "enumerateWithAttributeKind:inRange:usingBlock:", 14, location, length, v25);
  v13 = v27;
  for (uint64_t i = v27[6]; i != v13[7]; i += 24)
  {
    objc_msgSend(a3, "setDictationAndAutocorrection:forCharRange:undoTransaction:", 0, *(void *)(i + 8), *(void *)(i + 16), a5);
    v13 = v27;
  }
  v15 = (TSWPAttributeArray *)[a3 deletionChangesTable];
  if (v15)
  {
    [a3 range];
    v24.NSUInteger location = NSExpandedRange();
    v24.NSUInteger length = v16;
    TSWPAttributeArray::begin(v15, &v24, &v22);
    TSWPAttributeArray::end(v15, &v24, v21);
    for (unint64_t j = v23; (TSWPAttributeArray *)j != v21[1]; unint64_t j = ++v23)
    {
      if ([*((id *)v22->var4 + 2 * j + 1) canMergeWithKind:2 session:self->_changeSession])
      {
        v18 = (objc_object *)*((id *)v22->var4 + 2 * v23 + 1);
        v45.NSUInteger location = TSWPAttributeArray::rangeForAttributeIndex(v22, v23);
        v46.NSUInteger location = location;
        v46.NSUInteger length = length;
        NSRange v19 = NSUnionRange(v45, v46);
        NSUInteger location = v19.location;
        NSUInteger length = v19.length;
        if (!v18) {
          break;
        }
        if (a5)
        {
          unint64_t Object = TSWPAttributeArray::findObject(v15, v18, 0);
          TSWPStorageTransaction::appendToTransaction((uint64_t *)a5, 10, 16, Object, (NSDate *)[(objc_object *)v18 date]);
        }
        -[objc_object setDate:](v18, "setDate:", [MEMORY[0x263EFF910] date]);
        [(objc_object *)v18 trackedTextDidChange];
        goto LABEL_19;
      }
    }
  }
  v18 = -[TSWPChange initWithContext:kind:session:]([TSWPChange alloc], "initWithContext:kind:session:", [a3 context], 2, self->_changeSession);
LABEL_19:
  objc_msgSend(a3, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v18, location, length, 16, 0, a5);

  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v36, 8);
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
}

void __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v8 = (void *)v7[7];
  unint64_t v9 = v7[8];
  if ((unint64_t)v8 >= v9)
  {
    uint64_t v11 = v7[6];
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v11) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      NSUInteger v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(v7 + 8), v15);
    }
    else {
      NSUInteger v16 = 0;
    }
    v17 = &v16[24 * v12];
    v18 = &v16[24 * v15];
    *(void *)v17 = a2;
    *((void *)v17 + 1) = a3;
    *((void *)v17 + 2) = a4;
    v10 = v17 + 24;
    v20 = (char *)v7[6];
    NSRange v19 = (char *)v7[7];
    if (v19 != v20)
    {
      do
      {
        long long v21 = *(_OWORD *)(v19 - 24);
        *((void *)v17 - 1) = *((void *)v19 - 1);
        *(_OWORD *)(v17 - 24) = v21;
        v17 -= 24;
        v19 -= 24;
      }
      while (v19 != v20);
      NSRange v19 = (char *)v7[6];
    }
    v7[6] = v17;
    v7[7] = v10;
    v7[8] = v18;
    if (v19) {
      operator delete(v19);
    }
  }
  else
  {
    void *v8 = a2;
    v8[1] = a3;
    v10 = v8 + 3;
    v8[2] = a4;
  }
  v7[7] = v10;
}

void __77__TSWPTrackedDeletion_performWithStorage_delta_undoTransaction_replaceBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v8 = (void *)v7[7];
    unint64_t v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      uint64_t v11 = v7[6];
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v11) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v11) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15) {
        NSUInteger v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)(v7 + 8), v15);
      }
      else {
        NSUInteger v16 = 0;
      }
      v17 = &v16[24 * v12];
      v18 = &v16[24 * v15];
      *(void *)v17 = a2;
      *((void *)v17 + 1) = a3;
      *((void *)v17 + 2) = a4;
      v10 = v17 + 24;
      v20 = (char *)v7[6];
      NSRange v19 = (char *)v7[7];
      if (v19 != v20)
      {
        do
        {
          long long v21 = *(_OWORD *)(v19 - 24);
          *((void *)v17 - 1) = *((void *)v19 - 1);
          *(_OWORD *)(v17 - 24) = v21;
          v17 -= 24;
          v19 -= 24;
        }
        while (v19 != v20);
        NSRange v19 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      void *v8 = a2;
      v8[1] = a3;
      v10 = v8 + 3;
      v8[2] = a4;
    }
    v7[7] = v10;
  }
}

- (unint64_t)targetCharIndex
{
  return self->_range.location;
}

- (int64_t)delta
{
  return 0;
}

- (_NSRange)insertedRange
{
  NSUInteger v2 = self->_range.length + self->_range.location;
  NSUInteger v3 = 0;
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

@end