@interface PULayoutSectionSimpleSampler
- (PULayoutSectionSimpleSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4;
- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4;
- (int64_t)unsampledIndexForIndex:(int64_t)a3;
- (void)dumpInternalMemory;
- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4;
@end

@implementation PULayoutSectionSimpleSampler

- (void)dumpInternalMemory
{
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  v7 = (void (**)(id, int64_t, uint64_t, unsigned char *))a4;
  char v15 = 0;
  if (location < (uint64_t)(location + length))
  {
    NSUInteger v8 = length - 1;
    do
    {
      NSUInteger v9 = v8;
      int64_t numberOfVisibleItems = self->_numberOfVisibleItems;
      int64_t numberOfRealItems = self->_numberOfRealItems;
      if (numberOfRealItems <= numberOfVisibleItems)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
        [v14 handleFailureInFunction:v13 file:@"PULayoutSectioning.m" lineNumber:374 description:@"Invalid use"];
      }
      if (numberOfVisibleItems - 1 <= location) {
        uint64_t v12 = numberOfRealItems - 1;
      }
      else {
        uint64_t v12 = (numberOfVisibleItems - 1 + numberOfRealItems * location) / numberOfVisibleItems;
      }
      v7[2](v7, location, v12, &v15);
      if (v15) {
        break;
      }
      ++location;
      NSUInteger v8 = v9 - 1;
    }
    while (v9);
  }
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  int64_t numberOfVisibleItems = self->_numberOfVisibleItems;
  int64_t numberOfRealItems = self->_numberOfRealItems;
  if (numberOfRealItems <= numberOfVisibleItems)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
    [v7 handleFailureInFunction:v8 file:@"PULayoutSectioning.m" lineNumber:374 description:@"Invalid use"];
  }
  if (numberOfVisibleItems - 1 <= a3) {
    return numberOfRealItems - 1;
  }
  else {
    return (numberOfVisibleItems - 1 + numberOfRealItems * a3) / numberOfVisibleItems;
  }
}

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  int64_t numberOfVisibleItems = self->_numberOfVisibleItems;
  int64_t numberOfRealItems = self->_numberOfRealItems;
  if (numberOfRealItems <= numberOfVisibleItems)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    char v15 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _indexForUnsampledIndex(NSInteger, NSInteger, NSInteger)");
    [v14 handleFailureInFunction:v15 file:@"PULayoutSectioning.m" lineNumber:366 description:@"Invalid use"];
  }
  int64_t v9 = numberOfVisibleItems * a3 / numberOfRealItems;
  if (a4)
  {
    int64_t v10 = self->_numberOfVisibleItems;
    int64_t v11 = self->_numberOfRealItems;
    if (v11 <= v10)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
      [v16 handleFailureInFunction:v17 file:@"PULayoutSectioning.m" lineNumber:374 description:@"Invalid use"];
    }
    if (v10 - 1 <= v9) {
      uint64_t v12 = v11 - 1;
    }
    else {
      uint64_t v12 = (v10 - 1 + v11 * v9) / v10;
    }
    *a4 = v12 == a3;
  }
  return numberOfVisibleItems * a3 / numberOfRealItems;
}

- (PULayoutSectionSimpleSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PULayoutSectionSimpleSampler;
  result = [(PULayoutSectionSimpleSampler *)&v7 init];
  if (result)
  {
    result->_int64_t numberOfVisibleItems = a3;
    result->_int64_t numberOfRealItems = a4;
  }
  return result;
}

@end