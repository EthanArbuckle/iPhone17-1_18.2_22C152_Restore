@interface _NSTextRunStorage
- (BOOL)isEmpty;
- (NSCountableTextLocation)_createLocationFromOffset:(uint64_t)a1;
- (NSCountableTextLocation)_locationFromLocation:(uint64_t)a3 withOffset:;
- (NSTextLocation)baseLocation;
- (NSTextRange)contentRange;
- (_NSTextRunStorage)initWithDataSource:(id)a3;
- (__NSTextRunStorageDataSource)dataSource;
- (id)description;
- (id)enumerateObjectsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5;
- (int64_t)baseIndex;
- (uint64_t)_createTextRangeFromRange:(uint64_t)a3;
- (uint64_t)_indexFromTextLocation:(uint64_t)result;
- (uint64_t)_rangeFromTextRange:(uint64_t)a1;
- (void)_performCountableRunStorageOperation:(uint64_t)a1;
- (void)dealloc;
- (void)invalidateElementsInRange:(id)a3 delta:(int64_t)a4;
- (void)setObject:(id)a3 forRange:(id)a4;
@end

@implementation _NSTextRunStorage

- (void)_performCountableRunStorageOperation:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 57)) {
      id v4 = (id)[*(id *)(a1 + 8) baseLocation];
    }
    else {
      id v4 = 0;
    }
    *(void *)(a1 + 64) = v4;
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);

    *(void *)(a1 + 64) = 0;
  }
}

- (int64_t)baseIndex
{
  if (!self->_isCountable) {
    return 0;
  }
  v2 = [(_NSTextRunStorage *)self baseLocation];

  return [(NSTextLocation *)v2 characterIndex];
}

- (NSTextLocation)baseLocation
{
  return self->_baseLocation;
}

- (uint64_t)_indexFromTextLocation:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    if (*(unsigned char *)(result + 56))
    {
      uint64_t v4 = [a2 characterIndex];
      return v4 - [v3 baseIndex];
    }
    else if (*(unsigned char *)(result + 58))
    {
      v5 = *(void **)(result + 8);
      uint64_t v6 = [(id)result baseLocation];
      return [v5 offsetFromLocation:v6 toLocation:a2];
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (NSCountableTextLocation)_createLocationFromOffset:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [(id)a1 baseIndex] + a2;
    if (v2 >= 0)
    {
      v3 = [NSCountableTextLocation alloc];
      return [(NSCountableTextLocation *)v3 initWithIndex:v2];
    }
    return 0;
  }
  if (!*(unsigned char *)(a1 + 58)) {
    return 0;
  }
  v5 = objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2);

  return (NSCountableTextLocation *)v5;
}

- (_NSTextRunStorage)initWithDataSource:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_NSTextRunStorage;
  uint64_t v4 = [(_NSTextRunStorage *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_dataSource = (__NSTextRunStorageDataSource *)a3;
    v4->_isCountable = [a3 isCountableDataSource];
    char v6 = objc_opt_respondsToSelector();
    v5->_hasBaseLocation = v6 & 1;
    if (v6 & 1) != 0 && (objc_opt_respondsToSelector()) {
      char v7 = objc_opt_respondsToSelector();
    }
    else {
      char v7 = 0;
    }
    v5->_mapsLocationOffset = v7 & 1;
    if (v5->_isCountable || (v7 & 1) != 0)
    {
      v8 = (NSStorage *)[objc_allocWithZone(MEMORY[0x1E4F28E68]) init];
      uint64_t v9 = 16;
    }
    else
    {
      v8 = [[NSStorage alloc] initWithElementSize:16 capacity:0];
      uint64_t v9 = 24;
    }
    *(Class *)((char *)&v5->super.isa + v9) = (Class)v8;
  }
  return v5;
}

- (__NSTextRunStorageDataSource)dataSource
{
  return self->_dataSource;
}

- (uint64_t)_rangeFromTextRange:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = [a2 range];
    return v4 - [(id)a1 baseIndex];
  }
  else if (*(unsigned char *)(a1 + 58))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 8), "offsetFromLocation:toLocation:", objc_msgSend((id)a1, "baseLocation"), objc_msgSend(a2, "location"));
    if (([a2 isEmpty] & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 8), "offsetFromLocation:toLocation:", objc_msgSend(a2, "location"), objc_msgSend(a2, "endLocation"));
    }
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)enumerateObjectsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  objc_sync_enter(self);
  uint64_t v9 = v6 & 1;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__14;
  v23 = __Block_byref_object_dispose__14;
  uint64_t v24 = 0;
  if (self->_RLEArray)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke_2;
    v15[3] = &unk_1E55C7C18;
    v15[4] = a3;
    v15[5] = self;
    char v16 = v6 & 1;
    BOOL v17 = (v6 & 2) != 0;
    v15[6] = a5;
    v15[7] = &v19;
    -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v15);
  }
  else
  {
    uint64_t v10 = [(NSStorage *)self->_elements count];
    uint64_t v11 = v10;
    if (a3 || !v9 || (NSUInteger ElementIndexForTextLocation = v10 - 1, v10 < 1)) {
      NSUInteger ElementIndexForTextLocation = __NSTextRunStorageGetElementIndexForTextLocation((uint64_t)self, a3, 0);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69___NSTextRunStorage_enumerateObjectsFromLocation_options_usingBlock___block_invoke;
    v18[3] = &unk_1E55C7BF0;
    v18[4] = a5;
    v18[5] = &v19;
    __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, ElementIndexForTextLocation, v11 - ElementIndexForTextLocation, v9, (uint64_t)v18);
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);
  objc_sync_exit(self);
  return v13;
}

- (void)setObject:(id)a3 forRange:(id)a4
{
  objc_sync_enter(self);
  if (a3)
  {
    if (self->_RLEArray)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40___NSTextRunStorage_setObject_forRange___block_invoke;
      v10[3] = &unk_1E55C7C40;
      v10[4] = a4;
      v10[5] = self;
      v10[6] = a3;
      -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v10);
    }
    else
    {
      NSUInteger ElementIndexForTextRange = __NSTextRunStorageGetElementIndexForTextRange((NSUInteger)self, a4, 0);
      if (ElementIndexForTextRange != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = [(NSStorage *)self->_elements elementAtIndex:ElementIndexForTextRange];
        uint64_t v9 = v8;
        if (v8)
        {

          v9[1] = a3;
          *uint64_t v9 = a4;
        }
      }
    }
  }
  else
  {
    [(_NSTextRunStorage *)self invalidateElementsInRange:a4 delta:0];
  }

  self->_contentRange = 0;
  objc_sync_exit(self);
}

- (BOOL)isEmpty
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28___NSTextRunStorage_isEmpty__block_invoke;
  v4[3] = &unk_1E55C7B78;
  v4[4] = &v5;
  [(_NSTextRunStorage *)self enumerateObjectsFromLocation:0 options:2 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)dealloc
{
  __NSTextRunStorageReleaseElementContentsInRange((NSUInteger)self, 0x7FFFFFFFFFFFFFFFuLL, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSTextRunStorage;
  [(_NSTextRunStorage *)&v3 dealloc];
}

- (NSTextRange)contentRange
{
  objc_sync_enter(self);
  objc_super v3 = (NSTextRange *)[MEMORY[0x1E4F1CA98] null];
  contentRange = self->_contentRange;
  if (!contentRange)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__14;
    char v16 = __Block_byref_object_dispose__14;
    uint64_t v17 = 0;
    if (self->_RLEArray)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __33___NSTextRunStorage_contentRange__block_invoke_3;
      v9[3] = &unk_1E55C7BC8;
      v9[4] = self;
      v9[5] = &v12;
      -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v9);
    }
    else
    {
      uint64_t v8 = [(NSStorage *)self->_elements count];
      if (v8 >= 1)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __33___NSTextRunStorage_contentRange__block_invoke;
        v11[3] = &unk_1E55C7BA0;
        v11[4] = &v12;
        __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, 0, 1uLL, 0, (uint64_t)v11);
        if (v13[5])
        {
          if ((unint64_t)v8 >= 2)
          {
            v10[0] = MEMORY[0x1E4F143A8];
            v10[1] = 3221225472;
            v10[2] = __33___NSTextRunStorage_contentRange__block_invoke_2;
            v10[3] = &unk_1E55C7BA0;
            v10[4] = &v12;
            __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, v8 - 1, 1uLL, 0, (uint64_t)v10);
          }
        }
      }
    }
    uint64_t v5 = (NSTextRange *)v13[5];
    if (!v5)
    {
      uint64_t v5 = v3;
      v13[5] = (uint64_t)v5;
    }
    self->_contentRange = v5;
    _Block_object_dispose(&v12, 8);
    contentRange = self->_contentRange;
  }
  if (v3 == contentRange) {
    char v6 = 0;
  }
  else {
    char v6 = contentRange;
  }
  objc_sync_exit(self);
  return v6;
}

- (void)invalidateElementsInRange:(id)a3 delta:(int64_t)a4
{
  objc_sync_enter(self);
  if (self->_RLEArray)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke_2;
    v9[3] = &unk_1E55C7C90;
    v9[4] = a3;
    v9[5] = self;
    void v9[6] = a4;
    -[_NSTextRunStorage _performCountableRunStorageOperation:]((uint64_t)self, (uint64_t)v9);
  }
  else
  {
    int64_t ElementIndexForTextRange = __NSTextRunStorageGetElementIndexForTextRange((NSUInteger)self, a3, 1);
    int64_t v8 = [(NSStorage *)self->_elements count];
    if (ElementIndexForTextRange != 0x7FFFFFFFFFFFFFFFLL && v8 > ElementIndexForTextRange)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53___NSTextRunStorage_invalidateElementsInRange_delta___block_invoke;
      v10[3] = &unk_1E55C7C68;
      v10[4] = self;
      void v10[5] = a4;
      __NSTextRunStorageEnumerateElementsInRange((NSUInteger)self, ElementIndexForTextRange, v8 - ElementIndexForTextRange, 0, (uint64_t)v10);
    }
  }

  self->_contentRange = 0;
  objc_sync_exit(self);
}

- (uint64_t)_createTextRangeFromRange:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v6 = [(id)a1 baseIndex] + a2;
    uint64_t v7 = [NSCountableTextRange alloc];
    return (uint64_t)-[NSCountableTextRange initWithRange:](v7, "initWithRange:", v6, a3);
  }
  if (!*(unsigned char *)(a1 + 58)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2);
  if (a3) {
    a3 = objc_msgSend(*(id *)(a1 + 8), "locationFromLocation:withOffset:", objc_msgSend((id)a1, "baseLocation"), a2 + a3);
  }
  uint64_t v10 = [NSTextRange alloc];

  return (uint64_t)[(NSTextRange *)v10 initWithLocation:v9 endLocation:a3];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"<%@ %p>(\n"), objc_opt_class(), self;
  uint64_t v4 = [(_NSTextRunStorage *)self baseLocation];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32___NSTextRunStorage_description__block_invoke;
  v6[3] = &unk_1E55C7B50;
  v6[4] = v3;
  [(_NSTextRunStorage *)self enumerateObjectsFromLocation:v4 options:0 usingBlock:v6];
  [v3 appendFormat:@""]);
  return v3;
}

- (NSCountableTextLocation)_locationFromLocation:(uint64_t)a3 withOffset:
{
  if (result)
  {
    if (LOBYTE(result[3]._characterIndex))
    {
      objc_super v3 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", [a2 characterIndex] + a3);
      return v3;
    }
    else
    {
      characterIndex = (void *)result->_characterIndex;
      return (NSCountableTextLocation *)[characterIndex locationFromLocation:a2 withOffset:a3];
    }
  }
  return result;
}

@end