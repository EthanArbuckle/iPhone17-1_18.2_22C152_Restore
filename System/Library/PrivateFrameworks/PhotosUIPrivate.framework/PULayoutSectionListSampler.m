@interface PULayoutSectionListSampler
- (PULayoutSectionListSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4;
- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4;
- (int64_t)unsampledIndexForIndex:(int64_t)a3;
- (int64_t)visibleItemIndexes;
- (void)dealloc;
- (void)dumpInternalMemory;
- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4;
@end

@implementation PULayoutSectionListSampler

- (void)dumpInternalMemory
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexes:self->_visibleItemIndexes count:self->_numberOfVisibleItems];
  int64_t numberOfVisibleItems = self->_numberOfVisibleItems;
  int64_t numberOfRealItems = self->_numberOfRealItems;
  v5 = [v6 description];
  NSLog(&cfstr_SpreadLdItemsO_0.isa, numberOfVisibleItems, numberOfRealItems, v5);
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  char v9 = 0;
  if ((uint64_t)a3.location < (int64_t)(a3.location + a3.length))
  {
    NSUInteger location = a3.location;
    NSUInteger v7 = a3.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, int64_t, char *))a4 + 2))(a4, location, self->_visibleItemIndexes[location], &v9);
      ++location;
      if (v9) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v7 == 0;
      }
      --v7;
    }
    while (!v8);
  }
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  return self->_visibleItemIndexes[a3];
}

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  if (a3 < 0 || self->_numberOfRealItems <= a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 656, @"Invalid unsampled index %ld for %ld real items", a3, self->_numberOfRealItems);
  }
  visibleItemIndexes = self->_visibleItemIndexes;
  int64_t v9 = *visibleItemIndexes;
  if (*visibleItemIndexes >= a3)
  {
    int64_t result = 0;
LABEL_8:
    if (a4) {
      *a4 = v9 == a3;
    }
    return result;
  }
  int64_t result = self->_numberOfVisibleItems - 1;
  int64_t v9 = visibleItemIndexes[result];
  if (v9 <= a3) {
    goto LABEL_8;
  }
  int64_t lastSeenUnsampledIndex = self->_lastSeenUnsampledIndex;
  if (lastSeenUnsampledIndex > a3)
  {
LABEL_6:
    int64_t result = 0;
    goto LABEL_16;
  }
  int64_t result = self->_lastSeenSampledIndex;
  if (self->_lastSeenTopUnsampledIndex > a3)
  {
    if (a4) {
      *a4 = lastSeenUnsampledIndex == a3;
    }
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    goto LABEL_6;
  }
  ++result;
LABEL_16:
  self->_lastSeenTopUnsampledIndex = 0;
  while (1)
  {
    if (result >= self->_numberOfVisibleItems)
    {
      int64_t result = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_27;
    }
    int64_t v12 = visibleItemIndexes[result];
    if (v12 == a3)
    {
      self->_int64_t lastSeenUnsampledIndex = a3;
      self->_lastSeenTopUnsampledIndex = visibleItemIndexes[result + 1];
      if (!a4) {
        goto LABEL_27;
      }
      BOOL v13 = 1;
      goto LABEL_26;
    }
    if (v12 > a3) {
      break;
    }
    self->_int64_t lastSeenUnsampledIndex = v12;
    ++result;
  }
  self->_lastSeenTopUnsampledIndex = v12;
  --result;
  if (!a4) {
    goto LABEL_27;
  }
  BOOL v13 = 0;
LABEL_26:
  *a4 = v13;
LABEL_27:
  self->_lastSeenSampledIndex = result;
  return result;
}

- (int64_t)visibleItemIndexes
{
  return self->_visibleItemIndexes;
}

- (void)dealloc
{
  free(self->_visibleItemIndexes);
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSectionListSampler;
  [(PULayoutSectionListSampler *)&v3 dealloc];
}

- (PULayoutSectionListSampler)initWithNumberOfVisibleItems:(int64_t)a3 numberOfRealItems:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PULayoutSectionListSampler;
  id v6 = [(PULayoutSectionListSampler *)&v9 init];
  NSUInteger v7 = v6;
  if (v6)
  {
    v6->_int64_t numberOfVisibleItems = a3;
    v6->_int64_t numberOfRealItems = a4;
    v6->_visibleItemIndexes = (int64_t *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v7->_int64_t lastSeenUnsampledIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_lastSeenTopUnsampledIndex = 0;
  }
  return v7;
}

@end