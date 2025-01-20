@interface TSUMutableLinkedPointerSet
- (BOOL)containsObject:(id)a3;
- (BOOL)hasObjects;
- (BOOL)isEqual:(id)a3;
- (TSUMutableLinkedPointerSet)init;
- (id)array;
- (id)firstObject;
- (id)objectEnumerator;
- (id)objectEnumeratorAfterObject:(id)a3;
- (id)reverseObjectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)insertFirstObject:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation TSUMutableLinkedPointerSet

- (TSUMutableLinkedPointerSet)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSUMutableLinkedPointerSet;
  v2 = [(TSUMutableLinkedPointerSet *)&v5 init];
  if (v2)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
    v2->mHead = 0;
    v2->mTail = 0;
    v2->mDictionary = Mutable;
  }
  return v2;
}

- (void)dealloc
{
  mDictionary = self->mDictionary;
  if (mDictionary) {
    CFRelease(mDictionary);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUMutableLinkedPointerSet;
  [(TSUMutableLinkedPointerSet *)&v4 dealloc];
}

- (id)objectEnumerator
{
  v2 = [[TSULinkedPointerSetEnumerator alloc] initWithFirstEntry:self->mHead];
  return v2;
}

- (id)reverseObjectEnumerator
{
  v2 = [[TSULinkedPointerSetReverseEnumerator alloc] initWithLastEntry:self->mTail];
  return v2;
}

- (id)objectEnumeratorAfterObject:(id)a3
{
  id result = (id)CFDictionaryGetValue(self->mDictionary, a3);
  if (result)
  {
    objc_super v4 = [[TSULinkedPointerSetEnumerator alloc] initWithFirstEntry:*((void *)result + 3)];
    return v4;
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  p_mHead = &self->mHead;
  if (a3->var0) {
    p_mHead = (TSULinkedPointerSetEntry **)(a3->var0 + 24);
  }
  v7 = *p_mHead;
  unint64_t result = 0;
  if (v7) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    do
    {
      unint64_t var0 = (unint64_t)v7;
      a4[result++] = v7->mObject;
      v7 = v7->mNext;
      if (v7) {
        BOOL v10 = result >= a5;
      }
      else {
        BOOL v10 = 1;
      }
    }
    while (!v10);
  }
  a3->unint64_t var0 = var0;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return result;
}

- (id)firstObject
{
  mHead = self->mHead;
  if (mHead) {
    return mHead->mObject;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = *((void *)a3 + 2);
      mHead = self->mHead;
      if (!mHead)
      {
LABEL_10:
        LOBYTE(v6) = v7 == 0;
        return v6;
      }
      while (v7)
      {
        id mObject = mHead->mObject;
        if (mObject != *(id *)(v7 + 8))
        {
          unsigned int v6 = objc_msgSend(mObject, "isEqual:");
          if (!v6) {
            return v6;
          }
        }
        uint64_t v7 = *(void *)(v7 + 24);
        mHead = mHead->mNext;
        if (!mHead) {
          goto LABEL_10;
        }
      }
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)containsObject:(id)a3
{
  return CFDictionaryContainsKey(self->mDictionary, a3) != 0;
}

- (BOOL)hasObjects
{
  return self->mHead != 0;
}

- (void)addObject:(id)a3
{
  if (!CFDictionaryContainsKey(self->mDictionary, a3))
  {
    uint64_t v5 = [[TSULinkedPointerSetEntry alloc] initWithObject:a3 previousEntry:self->mTail];
    v8 = v5;
    mTail = self->mTail;
    if (mTail) {
      p_mNext = &mTail->mNext;
    }
    else {
      p_mNext = &self->mHead;
    }
    *p_mNext = v5;
    self->mTail = v5;
    CFDictionarySetValue(self->mDictionary, a3, v5);
  }
}

- (void)insertFirstObject:(id)a3
{
  -[TSUMutableLinkedPointerSet removeObject:](self, "removeObject:");
  uint64_t v5 = [[TSULinkedPointerSetEntry alloc] initWithObject:a3 previousEntry:0];
  mHead = self->mHead;
  uint64_t v7 = self;
  v8 = v5;
  if (mHead)
  {
    mHead->mPrevious = v5;
    v8 = self->mHead;
    uint64_t v7 = (TSUMutableLinkedPointerSet *)v5;
  }
  v7->mTail = v8;
  self->mHead = v5;
  BOOL v9 = v5;
  CFDictionarySetValue(self->mDictionary, a3, v5);
}

- (void)removeObject:(id)a3
{
  Value = (TSULinkedPointerSetEntry *)CFDictionaryGetValue(self->mDictionary, a3);
  if (Value)
  {
    if (Value == self->mHead) {
      self->mHead = Value->mNext;
    }
    if (Value == self->mTail) {
      self->mTail = Value->mPrevious;
    }
    mPrevious = Value->mPrevious;
    if (mPrevious) {
      mPrevious->mNext = Value->mNext;
    }
    mNext = Value->mNext;
    if (mNext) {
      mNext->mPrevious = Value->mPrevious;
    }
    mDictionary = self->mDictionary;
    CFDictionaryRemoveValue(mDictionary, a3);
  }
}

- (void)removeAllObjects
{
  self->mHead = 0;
  self->mTail = 0;
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (id)array
{
  CFIndex Count = CFDictionaryGetCount(self->mDictionary);
  id result = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (result)
  {
    id v5 = result;
    CFDictionaryGetKeysAndValues(self->mDictionary, (const void **)result, 0);
    unsigned int v6 = +[NSArray arrayWithObjects:v5 count:Count];
    free(v5);
    return v6;
  }
  return result;
}

@end