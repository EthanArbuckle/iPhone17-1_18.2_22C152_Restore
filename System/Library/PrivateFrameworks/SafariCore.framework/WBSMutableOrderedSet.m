@interface WBSMutableOrderedSet
- (BOOL)containsObject:(id)a3;
- (NSArray)array;
- (WBSMutableOrderedSet)init;
- (WBSMutableOrderedSet)initWithMaximumCount:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexWithoutAffectingRecency:(unint64_t)a3;
- (void)_moveObjectAtIndexToLast:(unint64_t)a3;
- (void)addObject:(id)a3;
- (void)markObjectAsRecentlyUsed:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObjectsInArray:(id)a3;
@end

@implementation WBSMutableOrderedSet

- (void)addObject:(id)a3
{
  id v4 = a3;
  mutableOrderedSet = self->_mutableOrderedSet;
  id v10 = v4;
  if (!mutableOrderedSet)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v7 = self->_mutableOrderedSet;
    self->_mutableOrderedSet = v6;

    id v4 = v10;
    mutableOrderedSet = self->_mutableOrderedSet;
  }
  if (self->_maximumCount)
  {
    unint64_t v8 = [(NSMutableOrderedSet *)mutableOrderedSet count];
    mutableOrderedSet = self->_mutableOrderedSet;
    if (v8 > self->_maximumCount)
    {
      [(NSMutableOrderedSet *)mutableOrderedSet removeObjectAtIndex:0];
      mutableOrderedSet = self->_mutableOrderedSet;
    }
    id v4 = v10;
  }
  uint64_t v9 = [(NSMutableOrderedSet *)mutableOrderedSet indexOfObject:v4];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableOrderedSet *)self->_mutableOrderedSet addObject:v10];
  }
  else {
    [(WBSMutableOrderedSet *)self _moveObjectAtIndexToLast:v9];
  }
}

- (WBSMutableOrderedSet)initWithMaximumCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WBSMutableOrderedSet;
  id v4 = [(WBSMutableOrderedSet *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_maximumCount = a3;
    v6 = v4;
  }

  return v5;
}

- (NSArray)array
{
  v2 = [(NSMutableOrderedSet *)self->_mutableOrderedSet array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (WBSMutableOrderedSet)init
{
  return [(WBSMutableOrderedSet *)self initWithMaximumCount:0];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(NSMutableOrderedSet *)self->_mutableOrderedSet count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    [(WBSMutableOrderedSet *)self _moveObjectAtIndexToLast:a3];
    v5 = [(NSMutableOrderedSet *)self->_mutableOrderedSet objectAtIndex:a3];
  }
  return v5;
}

- (id)objectAtIndexWithoutAffectingRecency:(unint64_t)a3
{
  if ([(NSMutableOrderedSet *)self->_mutableOrderedSet count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableOrderedSet *)self->_mutableOrderedSet objectAtIndex:a3];
  }
  return v5;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableOrderedSet *)self->_mutableOrderedSet containsObject:v4];
  if (v5) {
    [(WBSMutableOrderedSet *)self _moveObjectAtIndexToLast:[(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:v4]];
  }

  return v5;
}

- (void)removeObject:(id)a3
{
}

- (void)removeObjectsInArray:(id)a3
{
}

- (void)markObjectAsRecentlyUsed:(id)a3
{
  uint64_t v4 = [(NSMutableOrderedSet *)self->_mutableOrderedSet indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(WBSMutableOrderedSet *)self _moveObjectAtIndexToLast:v4];
  }
}

- (void)_moveObjectAtIndexToLast:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableOrderedSet *)self->_mutableOrderedSet count] - 1;
  if (v5 != a3)
  {
    id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    [(NSMutableOrderedSet *)self->_mutableOrderedSet moveObjectsAtIndexes:v6 toIndex:v5];
  }
}

- (void).cxx_destruct
{
}

@end