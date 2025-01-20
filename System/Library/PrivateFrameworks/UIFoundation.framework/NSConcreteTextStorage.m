@interface NSConcreteTextStorage
+ (unint64_t)_writerCountTSDKey;
- (BOOL)_attributeFixingInProgress;
- (BOOL)_forceFixAttributes;
- (BOOL)_lockForReading;
- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3;
- (BOOL)_mayRequireIntentResolution;
- (BOOL)fixesAttributesLazily;
- (Class)classForCoder;
- (NSConcreteTextStorage)init;
- (NSConcreteTextStorage)initWithAttributedString:(id)a3;
- (NSConcreteTextStorage)initWithString:(id)a3;
- (NSConcreteTextStorage)initWithString:(id)a3 attributes:(id)a4;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)string;
- (unint64_t)length;
- (void)_initLocks;
- (void)_markIntentsResolved;
- (void)_setAttributeFixingInProgress:(BOOL)a3;
- (void)_setForceFixAttributes:(BOOL)a3;
- (void)_unlock;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)addAttributes:(id)a3 range:(_NSRange)a4;
- (void)dealloc;
- (void)removeAttribute:(id)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation NSConcreteTextStorage

- (id)string
{
  return [(NSConcreteMutableAttributedString *)self->_contents string];
}

- (unint64_t)length
{
  return [(NSConcreteMutableAttributedString *)self->_contents length];
}

- (void)dealloc
{
  contents = self->_contents;
  if ((*(unsigned char *)&self->_pFlags & 4) != 0)
  {
    pthread_rwlock_destroy(&self->_lock);
    *(_DWORD *)&self->_pFlags &= ~4u;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSConcreteTextStorage;
  [(NSTextStorage *)&v4 dealloc];
}

- (NSConcreteTextStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteTextStorage;
  v2 = [(NSTextStorage *)&v7 init];
  v3 = v2;
  if (v2)
  {
    objc_super v4 = [(NSConcreteMutableAttributedString *)+[NSConcreteNotifyingMutableAttributedString allocWithZone:[(NSConcreteTextStorage *)v2 zone]] initWithString:&stru_1EDD49F70];
    v3->_contents = v4;
    [(NSConcreteNotifyingMutableAttributedString *)v4 setDelegate:v3];
    [(NSConcreteTextStorage *)v3 _initLocks];
    uint64_t v5 = [(NSConcreteTextStorage *)v3 length];
    if (v5) {
      -[NSTextStorage edited:range:changeInLength:](v3, "edited:range:changeInLength:", 3, 0, 0, v5);
    }
  }
  return v3;
}

- (void)_initLocks
{
  if (![(NSAttributedString *)self _isStringDrawingTextStorage])
  {
    if ((*(unsigned char *)&self->_pFlags & 4) != 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextStorage.m", 934, @"Lock is initialized!");
    }
    pthread_rwlock_init(&self->_lock, 0);
    pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey], 0);
    *(_DWORD *)&self->_pFlags |= 4u;
  }
}

- (void)_setForceFixAttributes:(BOOL)a3
{
  self->_pFlags = ($E9BC4BBA338FE356C86766C4523490AC)(*(_DWORD *)&self->_pFlags & 0xFFFFFFFE | a3);
}

- (BOOL)_lockForReading
{
  if ((*(unsigned char *)&self->_pFlags & 4) == 0
    || [(NSAttributedString *)self _isStringDrawingTextStorage])
  {
    return 0;
  }
  pthread_rwlock_rdlock(&self->_lock);
  return 1;
}

- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3
{
  if ((*(unsigned char *)&self->_pFlags & 4) == 0
    || [(NSAttributedString *)self _isStringDrawingTextStorage])
  {
    return 0;
  }
  int v4 = pthread_rwlock_trywrlock(&self->_lock);
  if (v4 != 11 && v4 != 0) {
    return 0;
  }
  int v6 = v4;
  objc_super v7 = (char *)pthread_getspecific(+[NSConcreteTextStorage _writerCountTSDKey]);
  pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey], v7 + 1);
  return v6 == 11 || v6 == 0;
}

- (void)_unlock
{
  if ((*(unsigned char *)&self->_pFlags & 4) != 0
    && ![(NSAttributedString *)self _isStringDrawingTextStorage])
  {
    v3 = (char *)pthread_getspecific(+[NSConcreteTextStorage _writerCountTSDKey]);
    if (!v3
      || (int v4 = v3 - 1,
          pthread_setspecific(+[NSConcreteTextStorage _writerCountTSDKey], v3 - 1), !v4))
    {
      pthread_rwlock_unlock(&self->_lock);
    }
  }
}

+ (unint64_t)_writerCountTSDKey
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NSConcreteTextStorage__writerCountTSDKey__block_invoke;
  v3[3] = &unk_1E55C7AB0;
  v3[4] = a1;
  v3[5] = a2;
  if (_writerCountTSDKey_onceToken != -1) {
    dispatch_once(&_writerCountTSDKey_onceToken, v3);
  }
  return _writerCountTSDKey_key;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if ([(NSConcreteMutableAttributedString *)self->_contents length] <= a4)
  {
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], objc_msgSend(NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem()), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4, 1);
  }
  id v12 = -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, location, length);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a5 || (*(_DWORD *)&self->_pFlags & 1) == 0) {
      return v12;
    }
  }
  else if (!a5)
  {
    return v12;
  }
  if (*((void *)self->super._sideData + 2) == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange()) {
    return v12;
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a5->location, a5->length);
  }
  contents = self->_contents;

  return -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, location, length);
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  if ([(NSConcreteMutableAttributedString *)self->_contents length] <= a3)
  {
    id v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], objc_msgSend(NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem()), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a3, 1);
  }
  id v7 = [(NSConcreteMutableAttributedString *)self->_contents attributesAtIndex:a3 effectiveRange:a4];
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a4 || (*(_DWORD *)&self->_pFlags & 1) == 0) {
      return v7;
    }
  }
  else if (!a4)
  {
    return v7;
  }
  if (*((void *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
  {
    sideData = self->super._sideData;
    unint64_t v9 = sideData[2];
    if (v9 <= a3)
    {
      unint64_t v10 = sideData[3] + v9;
      if (v10 <= a3)
      {
        a4->length += a4->location - v10;
        a4->NSUInteger location = *((void *)self->super._sideData + 3) + *((void *)self->super._sideData + 2);
      }
    }
    else
    {
      a4->NSUInteger length = v9 - a4->location;
    }
  }
  return v7;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  if ([(NSConcreteMutableAttributedString *)self->_contents length] <= a4)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], objc_msgSend(NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem()), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4, 1);
  }
  id v9 = [(NSConcreteMutableAttributedString *)self->_contents attribute:a3 atIndex:a4 effectiveRange:a5];
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a5 || (*(_DWORD *)&self->_pFlags & 1) == 0) {
      return v9;
    }
  }
  else if (!a5)
  {
    return v9;
  }
  if (*((void *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
  {
    sideData = self->super._sideData;
    unint64_t v11 = sideData[2];
    if (v11 <= a4)
    {
      unint64_t v12 = sideData[3] + v11;
      if (v12 <= a4)
      {
        a5->length += a5->location - v12;
        a5->NSUInteger location = *((void *)self->super._sideData + 3) + *((void *)self->super._sideData + 2);
      }
    }
    else
    {
      a5->NSUInteger length = v11 - a5->location;
    }
  }
  return v9;
}

- (BOOL)_forceFixAttributes
{
  return *(_DWORD *)&self->_pFlags & 1;
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NSConcreteTextStorage_addAttribute_value_range___block_invoke;
  v5[3] = &unk_1E55C7B28;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  _NSRange v6 = a5;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v5);
}

uint64_t __50__NSConcreteTextStorage_addAttribute_value_range___block_invoke(uint64_t a1)
{
  v2 = *(__CFString **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) _attributeFixingInProgress];
  if ((v3 & 1) == 0 && [(__CFString *)v2 isEqualToString:@"NSOriginalFont"]) {
    v2 = @"NSFont";
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "addAttribute:value:range:", v2, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  if ((v3 & 1) == 0)
  {
    uint64_t result = [(__CFString *)v2 isEqualToString:@"NSFont"];
    if (result)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 104);
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 64);
      return objc_msgSend(v5, "removeAttribute:range:", @"NSOriginalFont", v6, v7);
    }
  }
  return result;
}

- (BOOL)_attributeFixingInProgress
{
  return (*(unsigned char *)&self->_pFlags >> 3) & 1;
}

- (BOOL)_mayRequireIntentResolution
{
  return [(NSConcreteMutableAttributedString *)self->_contents _mayRequireIntentResolution];
}

- (void)_setAttributeFixingInProgress:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_pFlags = ($E9BC4BBA338FE356C86766C4523490AC)(*(_DWORD *)&self->_pFlags & 0xFFFFFFF7 | v3);
}

uint64_t __45__NSConcreteTextStorage_setAttributes_range___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _attributeFixingInProgress] & 1) != 0
    || (uint64_t v2 = [*(id *)(a1 + 40) objectForKey:@"NSOriginalFont"]) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = *(void **)(*(void *)(a1 + 32) + 104);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    return objc_msgSend(v10, "setAttributes:range:", v9, v11, v12);
  }
  else
  {
    uint64_t v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"NSFont"];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 104);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__NSConcreteTextStorage_setAttributes_range___block_invoke_2;
    v13[3] = &unk_1E55C7B00;
    uint64_t v7 = *(void *)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    v13[5] = v3;
    v13[6] = v4;
    v13[7] = v5;
    return objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", v7, *(void *)(a1 + 56), 0x100000, v13);
  }
}

- (BOOL)fixesAttributesLazily
{
  if ((fixesAttributesLazily_readDefault & 1) == 0)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v3 objectForKey:@"NSAlwaysFixAttributesLazily"]) {
      fixesAttributesLazily_alwaysFixAttributesLazily = [v3 BOOLForKey:@"NSAlwaysFixAttributesLazily"];
    }
    fixesAttributesLazily_readDefault = 1;
  }
  return fixesAttributesLazily_alwaysFixAttributesLazily
      || *((void *)self->super._sideData + 2) != 0x7FFFFFFFFFFFFFFFLL
      || self->super._editedRange.location == 0x7FFFFFFFFFFFFFFFLL
      || (self->super._editedRange.length & 0xFFFFFFFFFFFF0000) != 0;
}

void __71__NSConcreteTextStorage_replaceCharactersInRange_withAttributedString___block_invoke(void *a1)
{
  objc_msgSend(*(id *)(a1[5] + 104), "replaceCharactersInRange:withAttributedString:", a1[6], a1[7], a1[4]);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NSConcreteTextStorage_setAttributes_range___block_invoke;
  v4[3] = &unk_1E55C7AD8;
  v4[4] = self;
  v4[5] = a3;
  _NSRange v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __43__NSConcreteTextStorage__writerCountTSDKey__block_invoke(uint64_t a1)
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_writerCountTSDKey_key, 0);
  if (result)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 handleFailureInMethod:v4 object:v5 file:@"NSTextStorage.m" lineNumber:878 description:@"Unable to create TL key for r/w lock!"];
  }
  return result;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__NSConcreteTextStorage_replaceCharactersInRange_withAttributedString___block_invoke;
  v4[3] = &unk_1E55C7AD8;
  v4[4] = a4;
  v4[5] = self;
  _NSRange v5 = a3;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSConcreteTextStorage)initWithAttributedString:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteTextStorage;
  uint64_t v4 = [(NSTextStorage *)&v9 init];
  _NSRange v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSConcreteMutableAttributedString *)+[NSConcreteNotifyingMutableAttributedString allocWithZone:[(NSConcreteTextStorage *)v4 zone]] initWithAttributedString:a3];
    v5->_contents = v6;
    [(NSConcreteNotifyingMutableAttributedString *)v6 setDelegate:v5];
    [(NSConcreteTextStorage *)v5 _initLocks];
    uint64_t v7 = [(NSConcreteTextStorage *)v5 length];
    if (v7) {
      -[NSTextStorage edited:range:changeInLength:](v5, "edited:range:changeInLength:", 3, 0, 0, v7);
    }
  }
  return v5;
}

- (NSConcreteTextStorage)initWithString:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSConcreteTextStorage;
  uint64_t v4 = [(NSTextStorage *)&v9 init];
  _NSRange v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NSConcreteMutableAttributedString *)+[NSConcreteNotifyingMutableAttributedString allocWithZone:[(NSConcreteTextStorage *)v4 zone]] initWithString:a3];
    v5->_contents = v6;
    [(NSConcreteNotifyingMutableAttributedString *)v6 setDelegate:v5];
    [(NSConcreteTextStorage *)v5 _initLocks];
    uint64_t v7 = [(NSConcreteTextStorage *)v5 length];
    if (v7) {
      -[NSTextStorage edited:range:changeInLength:](v5, "edited:range:changeInLength:", 3, 0, 0, v7);
    }
  }
  return v5;
}

- (NSConcreteTextStorage)initWithString:(id)a3 attributes:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NSConcreteTextStorage;
  uint64_t v6 = [(NSTextStorage *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [(NSConcreteMutableAttributedString *)+[NSConcreteNotifyingMutableAttributedString allocWithZone:[(NSConcreteTextStorage *)v6 zone]] initWithString:a3 attributes:a4];
    v7->_contents = v8;
    [(NSConcreteNotifyingMutableAttributedString *)v8 setDelegate:v7];
    [(NSConcreteTextStorage *)v7 _initLocks];
    uint64_t v9 = [(NSConcreteTextStorage *)v7 length];
    if (v9) {
      -[NSTextStorage edited:range:changeInLength:](v7, "edited:range:changeInLength:", 3, 0, 0, v9);
    }
  }
  return v7;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if ([(NSConcreteMutableAttributedString *)self->_contents length] <= a3)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], objc_msgSend(NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem()), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a3, 1);
  }
  unint64_t v10 = (void *)-[NSConcreteNotifyingMutableAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);
  if (*(_DWORD *)&self->super._flags >= 0x10000u)
  {
    if (!a4 || (*(_DWORD *)&self->_pFlags & 1) == 0) {
      return v10;
    }
  }
  else if (!a4)
  {
    return v10;
  }
  if (*((void *)self->super._sideData + 2) == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange()) {
    return v10;
  }
  if ([(NSTextStorage *)self ensuresFixingAttributes]) {
    -[NSTextStorage ensureAttributesAreFixedInRange:](self, "ensureAttributesAreFixedInRange:", a4->location, a4->length);
  }
  contents = self->_contents;

  return (id)-[NSConcreteNotifyingMutableAttributedString attributesAtIndex:longestEffectiveRange:inRange:](contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NSConcreteTextStorage_replaceCharactersInRange_withString___block_invoke;
  v4[3] = &unk_1E55C7AD8;
  _NSRange v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __61__NSConcreteTextStorage_replaceCharactersInRange_withString___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 104), "replaceCharactersInRange:withString:", a1[6], a1[7], a1[5]);
}

void __45__NSConcreteTextStorage_setAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = [a2 objectForKey:@"NSFont"];
  if objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(a2, "objectForKey:", @"NSOriginalFont"))&& ((unint64_t v10 = *(void **)(a1 + 48), v10 == (void *)v9) || (objc_msgSend(v10, "isEqual:", v9)))
  {
    id v11 = 0;
  }
  else
  {
    v8 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v8 removeObjectForKey:@"NSOriginalFont"];
    id v11 = v8;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 56) + 104), "setAttributes:range:", v8, a3, a4);
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__NSConcreteTextStorage_removeAttribute_range___block_invoke;
  v4[3] = &unk_1E55C7AD8;
  v4[4] = self;
  v4[5] = a3;
  _NSRange v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __47__NSConcreteTextStorage_removeAttribute_range___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) _attributeFixingInProgress]
    && [*(id *)(a1 + 40) isEqualToString:@"NSFont"])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "removeAttribute:range:", @"NSOriginalFont", *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 104);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);

  return objc_msgSend(v3, "removeAttribute:range:", v2, v4, v5);
}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NSConcreteTextStorage_addAttributes_range___block_invoke;
  v4[3] = &unk_1E55C7AD8;
  v4[4] = self;
  v4[5] = a3;
  _NSRange v5 = a4;
  __NSConcreteTextStorageLockedForwarding((id *)&self->super.super.super.super.isa, (uint64_t)v4);
}

uint64_t __45__NSConcreteTextStorage_addAttributes_range___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _attributeFixingInProgress] & 1) != 0
    || (uint64_t v2 = [*(id *)(a1 + 40) objectForKey:@"NSOriginalFont"]) == 0)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "addAttributes:range:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else
  {
    uint64_t v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"NSFont"];
    long long v5 = *(_OWORD *)(a1 + 32);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 104);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__NSConcreteTextStorage_addAttributes_range___block_invoke_2;
    v11[3] = &unk_1E55C7B00;
    v11[4] = v3;
    v11[5] = v4;
    long long v12 = v5;
    objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", *(void *)(a1 + 48), *(void *)(a1 + 56), 0x100000, v11);
  }
  id v7 = *(id *)(a1 + 40);
  if (([*(id *)(a1 + 32) _attributeFixingInProgress] & 1) == 0)
  {
    uint64_t v8 = [v7 objectForKey:@"NSOriginalFont"];
    if (v8)
    {
      uint64_t v9 = v8;
      id v7 = (id)[v7 mutableCopy];
      [v7 setObject:v9 forKey:@"NSFont"];
      [v7 removeObjectForKey:@"NSOriginalFont"];
LABEL_9:
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "removeAttribute:range:", @"NSOriginalFont", *(void *)(a1 + 48), *(void *)(a1 + 56));
      return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "addAttributes:range:", v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
    if ([v7 objectForKey:@"NSFont"]) {
      goto LABEL_9;
    }
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "addAttributes:range:", v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t __45__NSConcreteTextStorage_addAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = [a2 objectForKey:@"NSFont"];
  BOOL v10 = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "objectForKey:", @"NSOriginalFont")))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9 == (void *)v8 || ([v9 isEqual:v8] & 1) != 0) {
      BOOL v10 = 0;
    }
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 104), "addAttributes:range:", *(void *)(a1 + 56), a3, a4);
  if (v10)
  {
    long long v12 = *(void **)(*(void *)(a1 + 48) + 104);
    return objc_msgSend(v12, "removeAttribute:range:", @"NSOriginalFont", a3, a4);
  }
  return result;
}

- (void)_markIntentsResolved
{
}

@end