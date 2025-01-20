@interface _UITraitTokenSet
+ (uint64_t)emptySet;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)setByAddingTraitToken:(id)result;
- (id)setByRemovingTraitToken:(id)result;
- (uint64_t)NSSetRepresentation;
- (uint64_t)initWithNSSetRepresentation:(void *)a1;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addTraitTokenValue:(__n128)a3;
- (void)allTraitTokens;
- (void)dealloc;
- (void)enumerateAllTraitTokenValues:(uint64_t)a1;
- (void)removeTraitTokenValue:(int8x16_t)a3;
@end

@implementation _UITraitTokenSet

- (void)enumerateAllTraitTokenValues:(uint64_t)a1
{
  if (a1)
  {
    if (!a2) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateAllTraitTokenValues_, a1, @"_UITraitTokenSet_NonARC.mm", 266, @"Invalid parameter not satisfying: %@", @"block != NULL");
    }
    _UITraitTokenSetEnumerate((uint64_t *)(a1 + 16), a2);
  }
}

+ (uint64_t)emptySet
{
  if (_MergedGlobals_1267 != -1) {
    dispatch_once(&_MergedGlobals_1267, &__block_literal_global_569);
  }
  return qword_1EB2647F8;
}

- (id)setByAddingTraitToken:(id)result
{
  if (result)
  {
    v3 = (void *)[result copy];
    if (v3)
    {
      unint64_t v4 = _UIGetTraitTokenValue(a2);
      [(_UITraitTokenSet *)(uint64_t)v3 addTraitTokenValue:v5];
    }
    return v3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(_UITraitTokenSet);
  if (v4)
  {
    v4->_cachedArrayRepresentation = self->_cachedArrayRepresentation;
    v4->_storage.set = (_UIMutableFastIndexSet *)[(_UIMutableFastIndexSet *)self->_storage.set mutableCopy];
    long long v5 = *(_OWORD *)&self->_storage.bitSet._chunks[2];
    *(_OWORD *)v4->_storage.bitSet._chunks = *(_OWORD *)self->_storage.bitSet._chunks;
    *(_OWORD *)&v4->_storage.bitSet._chunks[2] = v5;
  }
  return v4;
}

- (void)addTraitTokenValue:(__n128)a3
{
  if (a1)
  {
    if (qword_1EB2647F8 == a1) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_addTraitTokenValue_, a1, @"_UITraitTokenSet_NonARC.mm", 210, @"Cannot mutate immutable empty set");
    }
    _UITraitTokenSetInsert((uint64_t *)(a1 + 16), a2, a3);
    long long v5 = *(void **)(a1 + 8);
    if (v5)
    {

      *(void *)(a1 + 8) = 0;
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return _UITraitTokenSetIsEqualToSet((uint64_t)&self->_storage, (uint64_t)a3 + 16);
}

- (void)dealloc
{
  cachedArrayRepresentation = self->_cachedArrayRepresentation;
  if (cachedArrayRepresentation) {

  }
  set = self->_storage.set;
  if (set) {

  }
  v5.receiver = self;
  v5.super_class = (Class)_UITraitTokenSet;
  [(_UITraitTokenSet *)&v5 dealloc];
}

- (unint64_t)hash
{
  return _UITraitTokenSetHash((uint64_t)&self->_storage);
}

- (void)removeTraitTokenValue:(int8x16_t)a3
{
  if (a1)
  {
    if (qword_1EB2647F8 == a1) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_removeTraitTokenValue_, a1, @"_UITraitTokenSet_NonARC.mm", 219, @"Cannot mutate immutable empty set");
    }
    _UITraitTokenSetRemove((uint16x8_t **)(a1 + 16), a2, a3);
    objc_super v5 = *(void **)(a1 + 8);
    if (v5)
    {

      *(void *)(a1 + 8) = 0;
    }
  }
}

- (id)setByRemovingTraitToken:(id)result
{
  if (result)
  {
    v3 = (void *)[result copy];
    if (v3)
    {
      unint64_t v4 = _UIGetTraitTokenValue(a2);
      [(_UITraitTokenSet *)(uint64_t)v3 removeTraitTokenValue:v5];
    }
    return v3;
  }
  return result;
}

- (void)allTraitTokens
{
  v2 = (uint64_t *)(a1 + 16);
  v3 = _UITraitTokenSetCount(a1 + 16);
  if (!v3) {
    return (void (*)(void, void, void))MEMORY[0x1E4F1CBF0];
  }
  unint64_t v4 = *(void (**)(void, void, void))(a1 + 8);
  if (!v4)
  {
    unint64_t v4 = (void (*)(void, void, void))[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    v6[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v6[1] = (void (*)(void, void, void))3221225472;
    v6[2] = (void (*)(void, void, void))__34___UITraitTokenSet_allTraitTokens__block_invoke;
    v6[3] = (void (*)(void, void, void))&unk_1E52F2E58;
    v6[4] = v4;
    _UITraitTokenSetEnumerate(v2, v6);
    *(void *)(a1 + 8) = v4;
  }
  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!self || !_UITraitTokenSetCount((uint64_t)&self->_storage)) {
    return 0;
  }
  v9 = -[_UITraitTokenSet allTraitTokens]((uint64_t)self);
  return [v9 countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (uint64_t)initWithNSSetRepresentation:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [a1 init];
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(a2);
          }
          unint64_t v8 = _UIGetTraitTokenValue(*(const __CFNumber **)(*((void *)&v11 + 1) + 8 * v7));
          [(_UITraitTokenSet *)v3 addTraitTokenValue:v9];
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

- (uint64_t)NSSetRepresentation
{
  if (result)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    v2 = -[_UITraitTokenSet allTraitTokens](result);
    return [v1 setWithArray:v2];
  }
  return result;
}

@end