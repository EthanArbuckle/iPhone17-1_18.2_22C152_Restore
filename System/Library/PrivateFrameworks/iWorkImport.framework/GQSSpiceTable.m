@interface GQSSpiceTable
- (GQSSpiceTable)init;
- (float)alongValueForVectorUid:(const char *)a3;
- (void)aboutToReadCells;
- (void)aboutToReadColumnVectors;
- (void)aboutToReadRowVectors;
- (void)dealloc;
- (void)setAlongValue:(float)a3 forOwnedVectorUid:(char *)a4;
@end

@implementation GQSSpiceTable

- (GQSSpiceTable)init
{
  v4.receiver = self;
  v4.super_class = (Class)GQSSpiceTable;
  v2 = [(GQSSpiceTable *)&v4 init];
  if (v2)
  {
    v2->mVectorUidToAlongMap = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_85110, &kCFTypeDictionaryValueCallBacks);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mVectorUidToAlongMap = self->mVectorUidToAlongMap;
  if (mVectorUidToAlongMap) {
    CFRelease(mVectorUidToAlongMap);
  }
  mRowPositions = (void **)self->mRowPositions;
  if (mRowPositions)
  {
    v5 = *mRowPositions;
    if (*mRowPositions)
    {
      mRowPositions[1] = v5;
      operator delete(v5);
    }
    operator delete();
  }
  mColumnPositions = (void **)self->mColumnPositions;
  if (mColumnPositions)
  {
    v7 = *mColumnPositions;
    if (*mColumnPositions)
    {
      mColumnPositions[1] = v7;
      operator delete(v7);
    }
    operator delete();
  }
  v8.receiver = self;
  v8.super_class = (Class)GQSSpiceTable;
  [(GQSTable *)&v8 dealloc];
}

- (void)aboutToReadRowVectors
{
  self->mReadingRowVectors = 1;
}

- (void)aboutToReadColumnVectors
{
  self->mReadingRowVectors = 0;
}

- (void)aboutToReadCells
{
}

- (float)alongValueForVectorUid:(const char *)a3
{
  float valuePtr = 0.0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(self->mVectorUidToAlongMap, a3);
  if (!Value) {
    return 0.0;
  }
  CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
  return valuePtr;
}

- (void)setAlongValue:(float)a3 forOwnedVectorUid:(char *)a4
{
  float valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  CFDictionarySetValue(self->mVectorUidToAlongMap, a4, v6);
  CFRelease(v6);
  if (self->mReadingRowVectors) {
    v7 = &OBJC_IVAR___GQSSpiceTable_mRowPositions;
  }
  else {
    v7 = &OBJC_IVAR___GQSSpiceTable_mColumnPositions;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.isa + *v7);
  v9 = *(char **)v8;
  v10 = *(char **)(v8 + 8);
  if (*(char **)v8 == v10 || vabds_f32(*((float *)v10 - 1), valuePtr) >= 1.0)
  {
    unint64_t v11 = *(void *)(v8 + 16);
    if ((unint64_t)v10 >= v11)
    {
      uint64_t v13 = (v10 - v9) >> 2;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 62) {
        sub_A594();
      }
      uint64_t v15 = v11 - (void)v9;
      if (v15 >> 1 > v14) {
        unint64_t v14 = v15 >> 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16)
      {
        v17 = (char *)sub_A8A0(v8 + 16, v16);
        v9 = *(char **)v8;
        v10 = *(char **)(v8 + 8);
      }
      else
      {
        v17 = 0;
      }
      v18 = (float *)&v17[4 * v13];
      v19 = &v17[4 * v16];
      float *v18 = valuePtr;
      v12 = v18 + 1;
      while (v10 != v9)
      {
        int v20 = *((_DWORD *)v10 - 1);
        v10 -= 4;
        *((_DWORD *)v18-- - 1) = v20;
      }
      *(void *)uint64_t v8 = v18;
      *(void *)(v8 + 8) = v12;
      *(void *)(v8 + 16) = v19;
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      *(float *)v10 = valuePtr;
      v12 = v10 + 4;
    }
    *(void *)(v8 + 8) = v12;
  }
}

@end