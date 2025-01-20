@interface OITSUCFSetEnumerator
- (OITSUCFSetEnumerator)initWithCFSet:(__CFSet *)a3;
- (id)allObjects;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OITSUCFSetEnumerator

- (void)dealloc
{
  mObjects = (void **)self->mObjects;
  if (mObjects) {
    BOOL v4 = mObjects == self->mInlineObjects;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    free(mObjects);
  }
  v5.receiver = self;
  v5.super_class = (Class)OITSUCFSetEnumerator;
  [(OITSUCFSetEnumerator *)&v5 dealloc];
}

- (OITSUCFSetEnumerator)initWithCFSet:(__CFSet *)a3
{
  BOOL v4 = [(OITSUCFSetEnumerator *)self init];
  objc_super v5 = v4;
  if (v4)
  {
    if (a3)
    {
      CFIndex Count = CFSetGetCount(a3);
      v5->mCFIndex Count = Count;
      if (Count > 15) {
        mInlineObjects = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      }
      else {
        mInlineObjects = (const void **)v5->mInlineObjects;
      }
      v5->mObjects = mInlineObjects;
      CFSetGetValues(a3, mInlineObjects);
    }
    else
    {
      v4->mCFIndex Count = 0;
    }
  }
  return v5;
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
  mObjects = self->mObjects;
  a3->var0 = 1;
  a3->var1 = (id *)mObjects;
  a3->var2 = a3->var3;
  return self->mCount;
}

@end