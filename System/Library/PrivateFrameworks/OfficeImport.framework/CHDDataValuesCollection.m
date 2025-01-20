@interface CHDDataValuesCollection
- (BOOL)addDataPoint:(CHDDataPoint *)a3;
- (BOOL)addDataValue:(id)a3;
- (BOOL)containsStringValue;
- (CHDDataPoint)dataPointAtIndex:(unint64_t)a3;
- (CHDDataPoint)dataPointWithIndex:(unint64_t)a3;
- (CHDDataValuesCollection)init;
- (CHDDataValuesCollection)initWithDataPointCount:(unint64_t)a3;
- (id)contentFormatAtIndex:(unint64_t)a3 resources:(id)a4;
- (id)dataValueAtIndex:(unint64_t)a3;
- (id)dataValueWithIndex:(unint64_t)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)maxDataPointIndex;
- (void)cleanup;
- (void)dealloc;
- (void)finishReading;
- (void)resetWithDataPointCount:(unint64_t)a3;
- (void)setupBufferForValues:(unint64_t)a3;
@end

@implementation CHDDataValuesCollection

- (CHDDataValuesCollection)init
{
  v5.receiver = self;
  v5.super_class = (Class)CHDDataValuesCollection;
  v2 = [(CHDDataValuesCollection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->mContainsStringValue = 0;
    v2->mDataValueCount = 0;
    [(CHDDataValuesCollection *)v2 setupBufferForValues:0];
  }
  return v3;
}

- (void)setupBufferForValues:(unint64_t)a3
{
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  self->mPackedValues = Mutable;
  if (Mutable)
  {
    CFDataIncreaseLength(Mutable, 32 * a3);
  }
}

- (unint64_t)count
{
  return self->mDataValueCount;
}

- (CHDDataValuesCollection)initWithDataPointCount:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CHDDataValuesCollection;
  v4 = [(CHDDataValuesCollection *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->mContainsStringValue = 0;
    v4->mDataValueCount = 0;
    [(CHDDataValuesCollection *)v4 setupBufferForValues:a3];
  }
  return v5;
}

- (BOOL)addDataPoint:(CHDDataPoint *)a3
{
  MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedValues);
  if (MutableBytePtr)
  {
    unint64_t v6 = 32 * self->mDataValueCount + 32;
    unint64_t Length = CFDataGetLength(self->mPackedValues);
    v8 = MutableBytePtr;
    if (v6 > Length)
    {
      CFDataIncreaseLength(self->mPackedValues, 32);
      v8 = CFDataGetMutableBytePtr(self->mPackedValues);
    }
    v9 = (unint64_t *)&v8[32 * self->mDataValueCount];
    unint64_t *v9 = a3->index;
    EDValue::operator=((uint64_t)(v9 + 1), &a3->value.type);
    v9[3] = a3->contentFormatId;
    ++self->mDataValueCount;
    if (!self->mContainsStringValue && EDValue::isStringType(&a3->value)) {
      self->mContainsStringValue = 1;
    }
  }
  return MutableBytePtr != 0;
}

- (void)finishReading
{
  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    CFRelease(mIndexToDataValueMap);
    self->mIndexToDataValueMap = 0;
  }
  Mutable = CFDictionaryCreateMutable(0, self->mDataValueCount, 0, 0);
  self->mIndexToDataValueMap = Mutable;
  if (Mutable && self->mDataValueCount)
  {
    objc_super v5 = 0;
    do
    {
      unint64_t v6 = [(CHDDataValuesCollection *)self dataPointAtIndex:v5];
      if (v6) {
        CFDictionarySetValue(self->mIndexToDataValueMap, (const void *)v6->index, v5);
      }
      ++v5;
    }
    while ((unint64_t)v5 < self->mDataValueCount);
  }
}

- (CHDDataPoint)dataPointAtIndex:(unint64_t)a3
{
  MutableBytePtr = CFDataGetMutableBytePtr(self->mPackedValues);
  if (MutableBytePtr) {
    BOOL v6 = self->mDataValueCount > a3;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return (CHDDataPoint *)&MutableBytePtr[32 * a3];
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  [(CHDDataValuesCollection *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)CHDDataValuesCollection;
  [(CHDDataValuesCollection *)&v3 dealloc];
}

- (void)cleanup
{
  mPackedValues = self->mPackedValues;
  if (mPackedValues)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedValues);
    if (self->mDataValueCount)
    {
      unint64_t v5 = 0;
      BOOL v6 = (EDValue *)(MutableBytePtr + 8);
      do
      {
        EDValue::~EDValue(v6);
        ++v5;
        BOOL v6 = v7 + 2;
      }
      while (v5 < self->mDataValueCount);
    }
    CFRelease(self->mPackedValues);
    self->mPackedValues = 0;
  }
  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    CFRelease(mIndexToDataValueMap);
    self->mIndexToDataValueMap = 0;
  }
}

- (id)dataValueAtIndex:(unint64_t)a3
{
  objc_super v3 = [(CHDDataValuesCollection *)self dataPointAtIndex:a3];
  if (v3)
  {
    v4 = v3;
    unint64_t v5 = +[CHDDataValue dataValueWithIndex:v4->index value:&v4->value];
    [v5 setContentFormatId:v4->contentFormatId];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)containsStringValue
{
  return self->mContainsStringValue;
}

- (BOOL)addDataValue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4) {
    BOOL v6 = -[CHDDataValuesCollection addDataPoint:](self, "addDataPoint:", [v4 dataPoint]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)dataValueWithIndex:(unint64_t)a3
{
  objc_super v3 = [(CHDDataValuesCollection *)self dataPointWithIndex:a3];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = +[CHDDataValue dataValueWithIndex:v4->index value:&v4->value];
    [v5 setContentFormatId:v4->contentFormatId];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (CHDDataPoint)dataPointWithIndex:(unint64_t)a3
{
  mIndexToDataValueMap = self->mIndexToDataValueMap;
  if (mIndexToDataValueMap)
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent(mIndexToDataValueMap, (const void *)a3, (const void **)&value)) {
      return [(CHDDataValuesCollection *)self dataPointAtIndex:value];
    }
    return 0;
  }
  if (!self->mDataValueCount) {
    return 0;
  }
  uint64_t v7 = 0;
  while (1)
  {
    result = [(CHDDataValuesCollection *)self dataPointAtIndex:v7];
    if (result)
    {
      if (result->index == a3) {
        break;
      }
    }
    if (++v7 >= self->mDataValueCount) {
      return 0;
    }
  }
  return result;
}

- (void)resetWithDataPointCount:(unint64_t)a3
{
  if (self->mDataValueCount == a3)
  {
    [(CHDDataValuesCollection *)self cleanup];
    [(CHDDataValuesCollection *)self setupBufferForValues:a3];
  }
  self->mContainsStringValue = 0;
  self->mDataValueCount = 0;
}

- (id)contentFormatAtIndex:(unint64_t)a3 resources:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CHDDataValuesCollection *)self dataPointAtIndex:a3];
  if (v7)
  {
    v8 = [v6 contentFormats];
    uint64_t v7 = [v8 objectWithKey:v7->contentFormatId];
  }
  return v7;
}

- (unint64_t)maxDataPointIndex
{
  unint64_t mDataValueCount = self->mDataValueCount;
  if (!mDataValueCount) {
    return 0;
  }
  unint64_t result = [(CHDDataValuesCollection *)self dataPointAtIndex:mDataValueCount - 1];
  if (result) {
    return *(void *)result;
  }
  return result;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDDataValuesCollection;
  v2 = [(CHDDataValuesCollection *)&v4 description];
  return v2;
}

@end