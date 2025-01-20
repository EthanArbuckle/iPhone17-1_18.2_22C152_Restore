@interface _UIKBRTMutableOrderIndexSet
- (BOOL)reversed;
- (NSMutableIndexSet)indexSet;
- (_UIKBRTMutableOrderIndexSet)init;
- (_UIKBRTMutableOrderIndexSet)initWithIndexesInRange:(_NSRange)a3;
- (id)description;
- (unint64_t)beginningIndex;
- (unint64_t)count;
- (unint64_t)endingIndex;
- (unint64_t)highestIndex;
- (unint64_t)lowestIndex;
- (void)addIndex:(unint64_t)a3;
- (void)removeIndex:(unint64_t)a3;
- (void)removeIndexes:(id)a3;
- (void)setReversed:(BOOL)a3;
@end

@implementation _UIKBRTMutableOrderIndexSet

- (_UIKBRTMutableOrderIndexSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  v2 = [(_UIKBRTMutableOrderIndexSet *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    indexSet = v2->_indexSet;
    v2->_indexSet = v3;

    v2->_reversed = 0;
  }
  return v2;
}

- (_UIKBRTMutableOrderIndexSet)initWithIndexesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  v5 = [(_UIKBRTMutableOrderIndexSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", location, length);
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSMutableIndexSet *)v6;

    v5->_reversed = 0;
  }
  return v5;
}

- (unint64_t)count
{
  return [(NSMutableIndexSet *)self->_indexSet count];
}

- (unint64_t)lowestIndex
{
  return [(NSMutableIndexSet *)self->_indexSet firstIndex];
}

- (unint64_t)highestIndex
{
  return [(NSMutableIndexSet *)self->_indexSet lastIndex];
}

- (unint64_t)beginningIndex
{
  BOOL reversed = self->_reversed;
  indexSet = self->_indexSet;
  if (reversed) {
    return [(NSMutableIndexSet *)indexSet lastIndex];
  }
  else {
    return [(NSMutableIndexSet *)indexSet firstIndex];
  }
}

- (unint64_t)endingIndex
{
  BOOL reversed = self->_reversed;
  indexSet = self->_indexSet;
  if (reversed) {
    return [(NSMutableIndexSet *)indexSet firstIndex];
  }
  else {
    return [(NSMutableIndexSet *)indexSet lastIndex];
  }
}

- (void)addIndex:(unint64_t)a3
{
}

- (void)removeIndex:(unint64_t)a3
{
}

- (void)removeIndexes:(id)a3
{
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTMutableOrderIndexSet;
  v3 = [(_UIKBRTMutableOrderIndexSet *)&v8 description];
  v4 = v3;
  v5 = "YES";
  if (!self->_reversed) {
    v5 = "NO";
  }
  uint64_t v6 = [v3 stringByAppendingFormat:@", reversed=%s, %@", v5, self->_indexSet];

  return v6;
}

- (NSMutableIndexSet)indexSet
{
  return self->_indexSet;
}

- (BOOL)reversed
{
  return self->_reversed;
}

- (void)setReversed:(BOOL)a3
{
  self->_BOOL reversed = a3;
}

- (void).cxx_destruct
{
}

@end