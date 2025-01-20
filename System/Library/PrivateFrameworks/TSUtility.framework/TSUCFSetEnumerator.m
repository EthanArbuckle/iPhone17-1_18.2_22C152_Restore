@interface TSUCFSetEnumerator
- (TSUCFSetEnumerator)initWithCFSet:(__CFSet *)a3;
- (id)allObjects;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation TSUCFSetEnumerator

- (void)dealloc
{
  mObjects = (TSUCFSetEnumerator *)self->mObjects;
  if (mObjects != (TSUCFSetEnumerator *)self->mInlineObjects) {
    free(mObjects);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUCFSetEnumerator;
  [(TSUCFSetEnumerator *)&v4 dealloc];
}

- (TSUCFSetEnumerator)initWithCFSet:(__CFSet *)a3
{
  objc_super v4 = [(TSUCFSetEnumerator *)self init];
  if (v4)
  {
    CFIndex Count = CFSetGetCount(a3);
    v4->mCFIndex Count = Count;
    if (Count > 15) {
      mInlineObjects = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    }
    else {
      mInlineObjects = (const void **)v4->mInlineObjects;
    }
    v4->mObjects = mInlineObjects;
    CFSetGetValues(a3, mInlineObjects);
  }
  return v4;
}

- (id)nextObject
{
  int64_t mIndex = self->mIndex;
  if (mIndex >= self->mCount) {
    return 0;
  }
  v3 = (void *)self->mObjects[mIndex];
  self->int64_t mIndex = mIndex + 1;
  return v3;
}

- (id)allObjects
{
  CFArrayRef v2 = CFArrayCreate(0, &self->mObjects[self->mIndex], self->mCount - self->mIndex, 0);
  v3 = (void *)CFMakeCollectable(v2);
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var0 = 1;
  mObjects = self->mObjects;
  unint64_t result = self->mCount;
  a3->var1 = (id *)mObjects;
  a3->var2 = a3->var3;
  return result;
}

@end