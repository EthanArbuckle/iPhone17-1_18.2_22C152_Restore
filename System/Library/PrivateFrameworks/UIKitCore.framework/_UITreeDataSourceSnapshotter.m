@interface _UITreeDataSourceSnapshotter
- (BOOL)_isNodeIndexVisible:(int64_t)a3;
- (BOOL)_shouldSplitNodeAtInsertionIndex:(int64_t)a3;
- (BOOL)hasChildrenForParentAtIndex:(int64_t)a3;
- (BOOL)indexIsExpanded:(int64_t)a3;
- (BOOL)indexIsVisible:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlat;
- (_NSRange)appendChildItemsWithCount:(int64_t)a3;
- (_NSRange)appendChildItemsWithCount:(int64_t)a3 toParentIndex:(int64_t)a4;
- (_UIOutlineNode)_nextNodeForNodeIndex:(SEL)a3;
- (_UIOutlineNode)_nodeForGlobalIndex:(int64_t)a3;
- (_UITreeDataSourceSnapshotter)init;
- (_UITreeDataSourceSnapshotter)initWithNodes:()vector<_UIOutlineNode count:(std:(int64_t)a4 :(id)a5 allocator<_UIOutlineNode>> *)a3 expandedIndexes:;
- (id).cxx_construct;
- (id)_allIndexes;
- (id)_childrenForParent:(int64_t)a3;
- (id)_deleteChildNodesForParentNodeIndex:(int64_t)a3;
- (id)_snapshotterByNormalizingRangeOffsets;
- (id)_snapshotterByShiftingIndexesByCount:(int64_t)a3;
- (id)childrenForParentAtIndex:(int64_t)a3;
- (id)childrenForParentAtIndex:(int64_t)a3 recursive:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expandedIndexes;
- (id)indexesForLevel:(int64_t)a3;
- (id)rootIndexes;
- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3;
- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3 includingParent:(BOOL)a4;
- (id)visibleIndexes;
- (id)visualDescription;
- (int64_t)_binarySearchForGlobalIndex:(int64_t)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5;
- (int64_t)_childNodeIndexForGloalIndex:(int64_t)a3;
- (int64_t)_indexForInsertingAfterIndex:(int64_t)a3;
- (int64_t)_insertCount:(int64_t)a3 afterIndex:(int64_t)a4;
- (int64_t)_nodeIndexForGlobalIndex:(int64_t)a3;
- (int64_t)_parentNodeIndexForNodeIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4;
- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4 insertionMode:(int64_t)a5;
- (int64_t)insertSubtreeFromSnapshotter:(id)a3 afterIndex:(int64_t)a4;
- (int64_t)levelForIndex:(int64_t)a3;
- (int64_t)parentForChildAtIndex:(int64_t)a3;
- (void)_insertCount:(int64_t)a3 beforeIndex:(int64_t)a4;
- (void)_insertSubtreeFromSnapshotter:(id)a3 atIndex:(int64_t)a4 adjustedIndex:(int64_t)a5;
- (void)_recomputeExpandedIndexesForDeletedIndexes:(id)a3;
- (void)_recomputeExpandedIndexesForInsertedRange:(_NSRange)a3;
- (void)_recomputeRangeOffsetForGlobalIndex:(int64_t)a3;
- (void)_splitNodeAtInsertionIndex:(int64_t)a3;
- (void)collapseIndexes:(id)a3;
- (void)deleteIndexes:(id)a3;
- (void)deleteIndexes:(id)a3 orphanDisposition:(int64_t)a4;
- (void)expandIndexes:(id)a3;
- (void)insertSubtreeFromSnapshotter:(id)a3 beforeIndex:(int64_t)a4;
- (void)replaceChildItemsFromSnapshotter:(id)a3 forParentIndex:(int64_t)a4;
- (void)setCount:(int64_t)a3;
@end

@implementation _UITreeDataSourceSnapshotter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (int64_t)_childNodeIndexForGloalIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 791, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 794, @"Invalid parameter not satisfying: %@", @"nodeIndex != NSNotFound" object file lineNumber description];
  }
  begin = self->_nodes.__begin_;
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3)
    && begin[v6].var1 + 1 == begin[v6 + 1].var1)
  {
    return v6 + 1;
  }
  return result;
}

- (_NSRange)appendChildItemsWithCount:(int64_t)a3 toParentIndex:(int64_t)a4
{
  if (a3 <= 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 87, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 88, @"Invalid parameter not satisfying: %@", @"parentIndex < self.count" object file lineNumber description];
  }
  int64_t v8 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 94, @"Invalid parameter not satisfying: %@", @"parentNodeIndex != NSNotFound" object file lineNumber description];
  }
  int64_t v9 = self->_nodes.__begin_[v8].var1 + 1;
  int64_t v17 = a4 + 1;
  int64_t v18 = a3;
  int64_t v19 = v9;
  if ([(_UITreeDataSourceSnapshotter *)self _shouldSplitNodeAtInsertionIndex:a4])
  {
    [(_UITreeDataSourceSnapshotter *)self _splitNodeAtInsertionIndex:a4];
    begin = self->_nodes.__begin_;
  }
  else
  {
    int64_t v11 = [(_UITreeDataSourceSnapshotter *)self _childNodeIndexForGloalIndex:a4];
    begin = self->_nodes.__begin_;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      begin[v11].var0.length += a3;
      goto LABEL_12;
    }
  }
  std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&begin[v8 + 1], (unint64_t)&v17);
LABEL_12:
  [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + a3];
  [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:a4];
  -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v17, v18);
  NSUInteger v12 = v17;
  NSUInteger v13 = v18;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)appendChildItemsWithCount:(int64_t)a3
{
  if (a3 <= 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 78, @"Invalid parameter not satisfying: %@", @"count > 0" object file lineNumber description];
  }
  int64_t v5 = [(_UITreeDataSourceSnapshotter *)self count];
  NSUInteger v6 = v5;
  end = self->_nodes.__end_;
  value = self->_nodes.__end_cap_.__value_;
  if (end >= value)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    begin = self->_nodes.__begin_;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 < 0x555555555555555) {
      unint64_t v10 = v13;
    }
    if (v10)
    {
      unint64_t v10 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v10);
      begin = self->_nodes.__begin_;
      end = self->_nodes.__end_;
    }
    else
    {
      uint64_t v15 = 0;
    }
    v16 = (_UIOutlineNode *)(v10 + 24 * v12);
    int64_t v17 = (_UIOutlineNode *)(v10 + 24 * v15);
    v16->var0.location = v6;
    v16->var0.length = a3;
    v16->var1 = 0;
    int64_t v9 = v16 + 1;
    if (end != begin)
    {
      do
      {
        _NSRange var0 = end[-1].var0;
        v16[-1].var1 = end[-1].var1;
        v16[-1]._NSRange var0 = var0;
        --v16;
        --end;
      }
      while (end != begin);
      begin = self->_nodes.__begin_;
    }
    self->_nodes.__begin_ = v16;
    self->_nodes.__end_ = v9;
    self->_nodes.__end_cap_.__value_ = v17;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    end->var0.location = v5;
    end->var0.length = a3;
    int64_t v9 = end + 1;
    end->var1 = 0;
  }
  self->_nodes.__end_ = v9;
  [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + a3];
  NSUInteger v19 = v6;
  NSUInteger v20 = a3;
  result.length = v20;
  result.location = v19;
  return result;
}

- (int64_t)_nodeIndexForGlobalIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    int64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 642, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3);
  return [(_UITreeDataSourceSnapshotter *)self _binarySearchForGlobalIndex:a3 startIndex:0 endIndex:v6];
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (BOOL)_shouldSplitNodeAtInsertionIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] == a3 || self->_nodes.__end_ == self->_nodes.__begin_) {
    return 0;
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 779, @"Invalid parameter not satisfying: %@", @"destinationNodeIndex != NSNotFound" object file lineNumber description];
  }
  v7 = &self->_nodes.__begin_[v6];
  unint64_t location = v7->var0.location;
  unint64_t length = v7->var0.length;
  BOOL v12 = a3 < location || a3 - location >= length || length < 2;
  char v14 = location == 0x7FFFFFFFFFFFFFFFLL || length == 0 || v12;
  if (a3 + 1 < length + location) {
    return v14 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)_recomputeRangeOffsetForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6 + 1;
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITreeDataSourceSnapshotter.mm", 713, @"_UITreeDataSourceSnapshotter internal error: invalid initial or starting node index. Global index: %ld; Initial: %ld; Starting: %ld; Node count: %ld",
      a3,
      v6,
      v7,
      0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v8 = 0;
    begin = self->_nodes.__begin_;
  }
  else
  {
    begin = self->_nodes.__begin_;
    if (v6 >= 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3))
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITreeDataSourceSnapshotter.mm", 717, @"_UITreeDataSourceSnapshotter internal error: initial node index is out of bounds. initialNodeIndex: %ld; node count: %ld",
        v6,
        0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));

      begin = self->_nodes.__begin_;
    }
    NSUInteger v8 = begin[v6].var0.length + begin[v6].var0.location;
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3);
  BOOL v11 = v10 > v7;
  unint64_t v12 = v10 - v7;
  if (v11)
  {
    p_unint64_t length = &begin[v7].var0.length;
    do
    {
      NSUInteger v14 = *p_length;
      *(p_length - 1) = v8;
      v8 += v14;
      p_length += 3;
      --v12;
    }
    while (v12);
  }
}

- (int64_t)_binarySearchForGlobalIndex:(int64_t)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5
{
  if (a4 > a5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v6 = a5 + a4;
  if (a5 + a4 < 0 != __OFADD__(a5, a4)) {
    ++v6;
  }
  int64_t result = v6 >> 1;
  NSUInteger v8 = &self->_nodes.__begin_[v6 >> 1];
  unint64_t location = v8->var0.location;
  unint64_t length = v8->var0.length;
  if (a3 < location || a3 - location >= length)
  {
    if (a4 != a5) {
      return -[_UITreeDataSourceSnapshotter _binarySearchForGlobalIndex:startIndex:endIndex:](self, "_binarySearchForGlobalIndex:startIndex:endIndex:");
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)_recomputeExpandedIndexesForInsertedRange:(_NSRange)a3
{
  if (a3.length)
  {
    NSUInteger location = a3.location;
    if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = a3.length;
      if ([(NSMutableIndexSet *)self->_expandedIndexes count])
      {
        expandedIndexes = self->_expandedIndexes;
        [(NSMutableIndexSet *)expandedIndexes shiftIndexesStartingAtIndex:location by:length];
      }
    }
  }
}

- (void)replaceChildItemsFromSnapshotter:(id)a3 forParentIndex:(int64_t)a4
{
  unint64_t v7 = a3;
  if (!v7)
  {
    NSUInteger v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 406, @"Invalid parameter not satisfying: %@", @"snapshotter" object file lineNumber description];
  }
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    NSUInteger v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 407, @"Invalid parameter not satisfying: %@", @"parentIndex < self.count" object file lineNumber description];
  }
  v22 = [(_UITreeDataSourceSnapshotter *)self childrenForParentAtIndex:a4 recursive:1];
  [(_UITreeDataSourceSnapshotter *)self deleteIndexes:v22];
  int64_t v8 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 416, @"Invalid parameter not satisfying: %@", @"parentNodeIndex != NSNotFound" object file lineNumber description];
  }
  int64_t var1 = self->_nodes.__begin_[v8].var1;
  if ([(_UITreeDataSourceSnapshotter *)self _shouldSplitNodeAtInsertionIndex:a4]) {
    [(_UITreeDataSourceSnapshotter *)self _splitNodeAtInsertionIndex:a4];
  }
  int64_t v10 = a4 + 1;
  uint64_t v11 = v7[1];
  uint64_t v12 = v7[2];
  if (v11 != v12)
  {
    int64_t v13 = var1 + 1;
    uint64_t v14 = 24 * v8 + 24;
    int64_t v15 = v10;
    do
    {
      uint64_t v16 = *(void *)(v11 + 8);
      int64_t v17 = v13 + *(void *)(v11 + 16);
      v24[0] = v15;
      v24[1] = v16;
      v24[2] = v17;
      std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)self->_nodes.__begin_ + v14, (unint64_t)v24);
      v15 += v16;
      v11 += 24;
      v14 += 24;
    }
    while (v11 != v12);
  }
  self->_count += [v7 count];
  [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:0x7FFFFFFFFFFFFFFFLL];
  -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v10, [v7 count]);
  int64_t v18 = [v7 expandedIndexes];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80___UITreeDataSourceSnapshotter_replaceChildItemsFromSnapshotter_forParentIndex___block_invoke;
  v23[3] = &unk_1E52F38F8;
  v23[4] = self;
  v23[5] = v10;
  [v18 enumerateIndexesUsingBlock:v23];
}

- (id)expandedIndexes
{
  return self->_expandedIndexes;
}

- (void)deleteIndexes:(id)a3 orphanDisposition:(int64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    BOOL v8 = a4 == 0;
    BOOL v9 = a4 == 1;
    if ((unint64_t)a4 >= 2)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 179, @"Invalid parameter not satisfying: %@", @"deleteOrphans || reparentOrphans" object file lineNumber description];
    }
    int64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:v7];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64___UITreeDataSourceSnapshotter_deleteIndexes_orphanDisposition___block_invoke;
    v14[3] = &unk_1E53119F0;
    v14[4] = self;
    SEL v16 = a2;
    BOOL v17 = v8;
    id v11 = v10;
    id v15 = v11;
    BOOL v18 = v9;
    [v7 enumerateIndexesWithOptions:2 usingBlock:v14];
    if (self->_count < 0)
    {
      int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 229, @"Invalid parameter not satisfying: %@", @"_count >= 0" object file lineNumber description];
    }
    [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:0x7FFFFFFFFFFFFFFFLL];
    [(_UITreeDataSourceSnapshotter *)self _recomputeExpandedIndexesForDeletedIndexes:v11];
  }
}

- (void)deleteIndexes:(id)a3
{
}

- (id)visibleIndexes
{
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  if (self->_nodes.__end_ != self->_nodes.__begin_)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      if ([(_UITreeDataSourceSnapshotter *)self _isNodeIndexVisible:v5]) {
        objc_msgSend(v3, "addIndexesInRange:", self->_nodes.__begin_[v4].var0.location, self->_nodes.__begin_[v4].var0.length);
      }
      ++v5;
      ++v4;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3));
  }
  return v3;
}

- (BOOL)_isNodeIndexVisible:(int64_t)a3
{
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) >> 3) <= a3)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 678, @"Invalid parameter not satisfying: %@", @"nodeIndex < _nodes.size()" object file lineNumber description];
  }
  int64_t v5 = [(_UITreeDataSourceSnapshotter *)self _parentNodeIndexForNodeIndex:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    for (int64_t i = v5;
          i != 0x7FFFFFFFFFFFFFFFLL;
          int64_t i = [(_UITreeDataSourceSnapshotter *)self _parentNodeIndexForNodeIndex:i])
    {
      int v6 = [(NSMutableIndexSet *)self->_expandedIndexes containsIndex:self->_nodes.__begin_[i].var0.location + self->_nodes.__begin_[i].var0.length - 1];
      if (!v6) {
        break;
      }
    }
  }
  return v6;
}

- (int64_t)_parentNodeIndexForNodeIndex:(int64_t)a3
{
  uint64_t v3 = a3;
  begin = self->_nodes.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3) <= a3)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 693, @"Invalid parameter not satisfying: %@", @"childNodeIndex < _nodes.size()" object file lineNumber description];

    begin = self->_nodes.__begin_;
  }
  int64_t v5 = &begin[v3];
  int64_t var1 = v5->var1;
  for (int64_t i = &v5[-1].var1; v3-- >= 1; i -= 3)
  {
    int64_t v9 = *i;
    if (var1 == v9 + 1) {
      return v3;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)expandIndexes:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    if ([v6 lastIndex] >= self->_count)
    {
      int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 307, @"Invalid parameter not satisfying: %@", @"lastIndex < _count" object file lineNumber description];
    }
    [(NSMutableIndexSet *)self->_expandedIndexes addIndexes:v6];
  }
}

- (_UITreeDataSourceSnapshotter)init
{
  __p = 0;
  id v7 = 0;
  uint64_t v8 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  uint64_t v4 = [(_UITreeDataSourceSnapshotter *)self initWithNodes:&__p count:0 expandedIndexes:v3];

  if (__p)
  {
    id v7 = __p;
    operator delete(__p);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v12 = 0;
  int64_t v13 = 0;
  __p = 0;
  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  int64_t v7 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v7 >> 3) >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v7 >> 3));
    int64_t v13 = (char *)__p + 24 * v8;
    memmove(__p, begin, v7);
    uint64_t v12 = (char *)__p + 8 * (v7 >> 3);
  }
  int64_t v9 = (void *)[v4 initWithNodes:&__p count:self->_count expandedIndexes:self->_expandedIndexes];
  if (__p)
  {
    uint64_t v12 = (char *)__p;
    operator delete(__p);
  }
  return v9;
}

- (_UITreeDataSourceSnapshotter)initWithNodes:()vector<_UIOutlineNode count:(std:(int64_t)a4 :(id)a5 allocator<_UIOutlineNode>> *)a3 expandedIndexes:
{
  id v8 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_UITreeDataSourceSnapshotter;
  int64_t v9 = [(_UITreeDataSourceSnapshotter *)&v30 init];
  int64_t v10 = v9;
  if (v9)
  {
    p_nodes = &v9->_nodes;
    if (&v9->_nodes == a3)
    {
LABEL_23:
      v10->_count = a4;
      uint64_t v27 = [v8 mutableCopy];
      expandedIndexes = v10->_expandedIndexes;
      v10->_expandedIndexes = (NSMutableIndexSet *)v27;

      goto LABEL_24;
    }
    begin = a3->__begin_;
    end = a3->__end_;
    int64_t v14 = (char *)end - (char *)a3->__begin_;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
    uint64_t value = (uint64_t)v9->_nodes.__end_cap_.__value_;
    BOOL v17 = v9->_nodes.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * ((value - (uint64_t)v17) >> 3) >= v15)
    {
      p_end = (void **)&v9->_nodes.__end_;
      v23 = v9->_nodes.__end_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)v17) >> 3) < v15)
      {
        v24 = (_UIOutlineNode *)((char *)begin + 8 * (((char *)v23 - (char *)v17) >> 3));
        if (v23 != v17)
        {
          memmove(v9->_nodes.__begin_, begin, (char *)v23 - (char *)v17);
          BOOL v17 = (_UIOutlineNode *)*p_end;
        }
        int64_t v14 = (char *)end - (char *)v24;
        if (end == v24) {
          goto LABEL_22;
        }
        v25 = v17;
        v26 = v24;
        goto LABEL_21;
      }
    }
    else
    {
      if (v17)
      {
        v9->_nodes.__end_ = v17;
        operator delete(v17);
        uint64_t value = 0;
        p_nodes->__begin_ = 0;
        p_nodes->__end_ = 0;
        p_nodes->__end_cap_.__value_ = 0;
      }
      if (v15 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_25;
      }
      unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (value >> 3);
      uint64_t v19 = 2 * v18;
      if (2 * v18 <= v15) {
        uint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
      }
      unint64_t v20 = v18 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v19;
      if (v20 > 0xAAAAAAAAAAAAAAALL) {
LABEL_25:
      }
        abort();
      BOOL v17 = (_UIOutlineNode *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v20);
      v10->_nodes.__end_ = v17;
      p_end = (void **)&v10->_nodes.__end_;
      v10->_nodes.__begin_ = v17;
      v10->_nodes.__end_cap_.__value_ = &v17[v22];
    }
    if (end == begin)
    {
LABEL_22:
      *p_end = (char *)v17 + v14;
      goto LABEL_23;
    }
    v25 = v17;
    v26 = begin;
LABEL_21:
    memmove(v25, v26, v14);
    goto LABEL_22;
  }
LABEL_24:

  return v10;
}

- (id)childrenForParentAtIndex:(int64_t)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 255, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  uint64_t v13 = 0;
  int64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  SEL v16 = __Block_byref_object_copy__248;
  BOOL v17 = __Block_byref_object_dispose__248;
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v8 = [(_UITreeDataSourceSnapshotter *)self _childrenForParent:a3];
  [(id)v14[5] addIndexes:v8];
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67___UITreeDataSourceSnapshotter_childrenForParentAtIndex_recursive___block_invoke;
    v12[3] = &unk_1E5311A18;
    v12[4] = self;
    v12[5] = &v13;
    [v8 enumerateIndexesUsingBlock:v12];
  }
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (id)_childrenForParent:(int64_t)a3
{
  id v6 = [MEMORY[0x1E4F28E60] indexSet];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    begin = self->_nodes.__begin_;
    end = self->_nodes.__end_;
    while (begin != end)
    {
      if (!begin->var1) {
        objc_msgSend(v6, "addIndexesInRange:", begin->var0.location, begin->var0.length);
      }
      ++begin;
    }
  }
  else
  {
    if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
    {
      BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 623, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
    }
    int64_t v9 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
    int64_t v10 = self->_nodes.__begin_;
    if (v10[v9].var0.location + v10[v9].var0.length - 1 == a3)
    {
      unint64_t v11 = v9 + 1;
      uint64_t v12 = self->_nodes.__end_;
      if (v9 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v10) >> 3))
      {
        p_int64_t var1 = &v10[v9].var1;
        uint64_t v14 = v9;
        do
        {
          int64_t var1 = v10[v14 + 1].var1;
          if (var1 == *p_var1 + 1)
          {
            objc_msgSend(v6, "addIndexesInRange:", v10[v14 + 1].var0.location, v10[v14 + 1].var0.length);
            int64_t v10 = self->_nodes.__begin_;
            uint64_t v12 = self->_nodes.__end_;
          }
          else if (var1 <= *p_var1)
          {
            break;
          }
          ++v11;
          ++v14;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v10) >> 3));
      }
    }
  }
  return v6;
}

- (int64_t)parentForChildAtIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 272, @"Invalid parameter not satisfying: %@", @"childGlobalIndex < self.count" object file lineNumber description];
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = &self->_nodes.__begin_[v6];
    p_int64_t var1 = &v8->var1;
    int64_t v10 = v6 + 1;
    while (--v10 >= 1)
    {
      unint64_t v11 = v8 - 1;
      int64_t var1 = v8[-1].var1;
      --v8;
      if (var1 == *p_var1 - 1) {
        return v11->var0.location + v11->var0.length - 1;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedIndexes, 0);
  begin = self->_nodes.__begin_;
  if (begin)
  {
    self->_nodes.__end_ = begin;
    operator delete(begin);
  }
}

- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4
{
  return [(_UITreeDataSourceSnapshotter *)self insertCount:a3 afterIndex:a4 insertionMode:0];
}

- (int64_t)insertCount:(int64_t)a3 afterIndex:(int64_t)a4 insertionMode:(int64_t)a5
{
  if ((unint64_t)a5 >= 2)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 134, @"Invalid parameter not satisfying: %@", @"insertAfterChildren || insertAbsolute" object file lineNumber description];
  }
  if (a5 == 1)
  {
    if ([(_UITreeDataSourceSnapshotter *)self hasChildrenForParentAtIndex:a4])
    {
      int64_t v9 = a4 + 1;
      if (a4 + 1 != [(_UITreeDataSourceSnapshotter *)self count])
      {
        [(_UITreeDataSourceSnapshotter *)self insertCount:a3 beforeIndex:a4 + 1];
        return v9;
      }
    }
  }
  else if (a5)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(_UITreeDataSourceSnapshotter *)self _insertCount:a3 afterIndex:a4];
}

- (int64_t)levelForIndex:(int64_t)a3
{
  return (uint64_t)[(_UITreeDataSourceSnapshotter *)self _nodeForGlobalIndex:a3][16];
}

- (id)rootIndexes
{
  return [(_UITreeDataSourceSnapshotter *)self _childrenForParent:0x7FFFFFFFFFFFFFFFLL];
}

- (id)childrenForParentAtIndex:(int64_t)a3
{
  return [(_UITreeDataSourceSnapshotter *)self childrenForParentAtIndex:a3 recursive:0];
}

- (BOOL)indexIsExpanded:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 289, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  expandedIndexes = self->_expandedIndexes;
  return [(NSMutableIndexSet *)expandedIndexes containsIndex:a3];
}

- (BOOL)indexIsVisible:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 295, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 297, @"Invalid parameter not satisfying: %@", @"nodeIndex != NSNotFound" object file lineNumber description];
  }
  return [(_UITreeDataSourceSnapshotter *)self _isNodeIndexVisible:v6];
}

- (void)collapseIndexes:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    if ([v6 lastIndex] >= self->_count)
    {
      int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 316, @"Invalid parameter not satisfying: %@", @"lastIndex < _count" object file lineNumber description];
    }
    [(NSMutableIndexSet *)self->_expandedIndexes removeIndexes:v6];
  }
}

- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3
{
  return [(_UITreeDataSourceSnapshotter *)self snapshotterRepresentingSubtreeForIndex:a3 includingParent:0];
}

- (id)snapshotterRepresentingSubtreeForIndex:(int64_t)a3 includingParent:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_count <= a3)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 328, @"Invalid parameter not satisfying: %@", @"globalIndex < _count" object file lineNumber description];
  }
  v41 = [(_UITreeDataSourceSnapshotter *)self childrenForParentAtIndex:a3 recursive:1];
  if ([v41 count] || v4)
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (v4)
    {
      int64_t v10 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(1uLL);
      *(void *)int64_t v10 = a3;
      *(_OWORD *)(v10 + 8) = xmmword_186B852C0;
      v44 = &v10[24 * v11];
      uint64_t v12 = v10 + 24;
      if ([(_UITreeDataSourceSnapshotter *)self indexIsExpanded:a3]) {
        [v40 addIndex:a3];
      }
      uint64_t v13 = 1;
    }
    else
    {
      int64_t v10 = 0;
      uint64_t v12 = 0;
      v44 = 0;
      uint64_t v13 = 0;
    }
    if ([v41 count])
    {
      begin = self->_nodes.__begin_;
      end = self->_nodes.__end_;
      uint64_t v39 = [v41 firstIndex];
      unint64_t v42 = [v41 lastIndex];
      v43 = self;
      int64_t v16 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:v39];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = [MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInMethod:a2, v43, @"_UITreeDataSourceSnapshotter.mm", 363, @"Invalid parameter not satisfying: %@", @"firstChildNodeIndex != NSNotFound" object file lineNumber description];
      }
      uint64_t v17 = end - begin;
      if (v16 < v17)
      {
        int64_t v18 = v4 - v43->_nodes.__begin_[v16].var1;
        do
        {
          uint64_t v19 = v43->_nodes.__begin_;
          p_NSUInteger location = &v19[v16].var0.location;
          unint64_t v21 = *p_location;
          if (*p_location > v42) {
            break;
          }
          unint64_t v22 = p_location[1];
          int64_t v23 = v19[v16].var1 + v18;
          if (v12 >= v44)
          {
            unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((v12 - v10) >> 3) + 1;
            if (v24 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            uint64_t v25 = v17;
            if (0x5555555555555556 * ((v44 - v10) >> 3) > v24) {
              unint64_t v24 = 0x5555555555555556 * ((v44 - v10) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v44 - v10) >> 3) >= 0x555555555555555) {
              unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v26 = v24;
            }
            if (v26) {
              unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v26);
            }
            else {
              uint64_t v27 = 0;
            }
            v28 = (unint64_t *)(v26 + 8 * ((v12 - v10) >> 3));
            unint64_t *v28 = v21;
            v28[1] = v22;
            v28[2] = v23;
            if (v12 == v10)
            {
              v31 = (char *)(v26 + 8 * ((v12 - v10) >> 3));
            }
            else
            {
              unint64_t v29 = v26 + 8 * ((v12 - v10) >> 3);
              do
              {
                long long v30 = *(_OWORD *)(v12 - 24);
                v31 = (char *)(v29 - 24);
                *(void *)(v29 - 8) = *((void *)v12 - 1);
                *(_OWORD *)(v29 - 24) = v30;
                v12 -= 24;
                v29 -= 24;
              }
              while (v12 != v10);
            }
            v44 = (char *)(v26 + 24 * v27);
            uint64_t v12 = (char *)(v28 + 3);
            if (v10) {
              operator delete(v10);
            }
            int64_t v10 = v31;
            uint64_t v17 = v25;
          }
          else
          {
            *(void *)uint64_t v12 = v21;
            *((void *)v12 + 1) = v22;
            *((void *)v12 + 2) = v23;
            v12 += 24;
          }
          v13 += v22;
          ++v16;
        }
        while (v16 != v17);
      }
      if ([(NSMutableIndexSet *)v43->_expandedIndexes count])
      {
        v32 = -[NSMutableIndexSet indexesInRange:options:passingTest:](v43->_expandedIndexes, "indexesInRange:options:passingTest:");
        [v40 addIndexes:v32];
      }
    }
    v33 = [_UITreeDataSourceSnapshotter alloc];
    __p = 0;
    v46 = 0;
    v47 = 0;
    uint64_t v34 = v12 - v10;
    if (v12 != v10)
    {
      if (0xAAAAAAAAAAAAAAABLL * (v34 >> 3) > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v34 >> 3));
      v47 = (char *)__p + 24 * v35;
      memmove(__p, v10, v12 - v10);
      v46 = (char *)__p + 8 * (v34 >> 3);
    }
    id v8 = [(_UITreeDataSourceSnapshotter *)v33 initWithNodes:&__p count:v13 expandedIndexes:v40];
    int64_t v9 = v41;
    if (__p)
    {
      v46 = (char *)__p;
      operator delete(__p);
    }

    if (v10) {
      operator delete(v10);
    }
  }
  else
  {
    id v8 = objc_alloc_init(_UITreeDataSourceSnapshotter);
    int64_t v9 = v41;
  }

  return v8;
}

- (void)insertSubtreeFromSnapshotter:(id)a3 beforeIndex:(int64_t)a4
{
  id v8 = a3;
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    int64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 458, @"Invalid parameter not satisfying: %@", @"destinationIndex < self.count" object file lineNumber description];
  }
  if ([v8 count]) {
    [(_UITreeDataSourceSnapshotter *)self _insertSubtreeFromSnapshotter:v8 atIndex:a4 adjustedIndex:a4];
  }
}

- (int64_t)insertSubtreeFromSnapshotter:(id)a3 afterIndex:(int64_t)a4
{
  id v7 = a3;
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 466, @"Invalid parameter not satisfying: %@", @"destinationIndex < self.count" object file lineNumber description];
  }
  if ([v7 count])
  {
    int64_t v8 = [(_UITreeDataSourceSnapshotter *)self _indexForInsertingAfterIndex:a4];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 472, @"Invalid parameter not satisfying: %@", @"adjustedDestinationIndex != NSNotFound" object file lineNumber description];
    }
    [(_UITreeDataSourceSnapshotter *)self _insertSubtreeFromSnapshotter:v7 atIndex:a4 adjustedIndex:v8];
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)indexesForLevel:(int64_t)a3
{
  int64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (end != begin)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      if (begin[v8].var1 == a3)
      {
        objc_msgSend(v5, "addIndexesInRange:", begin[v8].var0.location, begin[v8].var0.length);
        begin = self->_nodes.__begin_;
        end = self->_nodes.__end_;
      }
      ++v9;
      ++v8;
    }
    while (v9 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  return v5;
}

- (BOOL)isFlat
{
  return (_UIOutlineNode *)((char *)self->_nodes.__end_ - (char *)self->_nodes.__begin_) == (_UIOutlineNode *)24;
}

- (BOOL)hasChildrenForParentAtIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 513, @"Invalid parameter not satisfying: %@", @"globalIndex < self.count" object file lineNumber description];
  }
  if ([(_UITreeDataSourceSnapshotter *)self isFlat]) {
    return 0;
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 521, @"Invalid parameter not satisfying: %@", @"nodeIndex != NSNotFound" object file lineNumber description];
  }
  begin = self->_nodes.__begin_;
  return v6 + 1 < 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3)
      && begin[v6].var0.location + begin[v6].var0.length - 1 == a3
      && begin[v6 + 1].var1 > begin[v6].var1;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  BOOL v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  int64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UITreeDataSourceSnapshotter count](self, "count"));
  id v7 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p: count=%@; expandedIndexes=%@>",
                 v5,
                 self,
                 v6,
                 self->_expandedIndexes);

  return v7;
}

- (id)visualDescription
{
  v2 = self;
  id v3 = (void *)MEMORY[0x1E4F28E78];
  BOOL v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UITreeDataSourceSnapshotter count](self, "count"));
  [v3 stringWithFormat:@"count=%@\n", v4];
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  begin = v2->_nodes.__begin_;
  if (v2->_nodes.__end_ != begin)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = &begin[v6];
      unint64_t v24 = [&stru_1ED0E84C0 stringByPaddingToLength:2 * begin[v6].var1 withString:@" " startingAtIndex:0];
      NSUInteger location = v8->var0.location;
      p_NSUInteger length = &v8->var0.length;
      NSUInteger length = v8->var0.length;
      uint64_t v10 = p_length[1];
      int v13 = [(NSMutableIndexSet *)v2->_expandedIndexes containsIndex:location];
      uint64_t v14 = v2;
      uint64_t v15 = @"-";
      if (v13) {
        uint64_t v15 = @"+";
      }
      uint64_t v25 = v15;
      int64_t v16 = NSString;
      uint64_t v17 = [NSNumber numberWithInteger:v10];
      int64_t v18 = [NSNumber numberWithInteger:v7];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:location];
      unint64_t v20 = [NSNumber numberWithUnsignedInteger:length];
      unint64_t v21 = [v16 stringWithFormat:@"%@%@[%@]%@: {%@,%@}\n", v24, v25, v17, v18, v19, v20];

      [v23 appendString:v21];
      ++v7;
      v2 = v14;
      begin = v14->_nodes.__begin_;
      ++v6;
    }
    while (v7 < 0xAAAAAAAAAAAAAAABLL * (((char *)v14->_nodes.__end_ - (char *)begin) >> 3));
  }
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_UITreeDataSourceSnapshotter *)a3;
  int64_t v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v9 = 1;
    }
    else
    {
      uint64_t v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (int64_t count = self->_count, count == [(_UITreeDataSourceSnapshotter *)v6 count])
        && [(NSMutableIndexSet *)self->_expandedIndexes isEqualToIndexSet:v6->_expandedIndexes])
      {
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        do
        {
          BOOL v8 = v19 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL;
          BOOL v9 = v8;
          if (v8) {
            break;
          }
          [(_UITreeDataSourceSnapshotter *)self _nextNodeForNodeIndex:&v19];
          [(_UITreeDataSourceSnapshotter *)v6 _nextNodeForNodeIndex:&v18];
          BOOL v10 = v15 == v12 && v16 == v13;
        }
        while (v10 && v17 == v14);
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (_UIOutlineNode)_nodeForGlobalIndex:(int64_t)a3
{
  int64_t v5 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 669, @"Invalid parameter not satisfying: %@", @"nodeIndex != NSNotFound" object file lineNumber description];
  }
  return &self->_nodes.__begin_[v5];
}

- (void)_splitNodeAtInsertionIndex:(int64_t)a3
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 807, @"Invalid parameter not satisfying: %@", @"insertionGlobalIndex < self.count" object file lineNumber description];
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 810, @"Invalid parameter not satisfying: %@", @"destinationNodeIndex != NSNotFound" object file lineNumber description];
  }
  begin = self->_nodes.__begin_;
  BOOL v8 = &begin[v6];
  NSUInteger location = v8->var0.location;
  unint64_t length = v8->var0.length;
  unint64_t v11 = a3 - v8->var0.location;
  if (a3 < v8->var0.location || v11 >= length)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v38 = objc_msgSend(NSString, "stringWithUTF8String:", "_NSRangeSplitResult _NSRangeSplit(NSRange, NSInteger)");
    v43 = (void *)v37;
    uint64_t v39 = (void *)v37;
    id v40 = (void *)v38;
    [v39 handleFailureInFunction:v38, @"_UITreeDataSourceSnapshotter.mm", 1171, @"Invalid parameter not satisfying: %@", @"NSLocationInRange(splitIndex, range)" file lineNumber description];
  }
  if (length <= 1)
  {
    unint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v41 = objc_msgSend(NSString, "stringWithUTF8String:", "_NSRangeSplitResult _NSRangeSplit(NSRange, NSInteger)");
    [v42 handleFailureInFunction:v41, @"_UITreeDataSourceSnapshotter.mm", 1172, @"Invalid parameter not satisfying: %@", @"range.length > 1" file lineNumber description];
  }
  unint64_t v13 = location - a3 + length;
  uint64_t v14 = length - (v11 + 1);
  BOOL v15 = v13 == 1;
  if (v13 == 1) {
    unint64_t v16 = length - 1;
  }
  else {
    unint64_t v16 = v11 + 1;
  }
  if (v15) {
    int64_t v17 = a3;
  }
  else {
    int64_t v17 = a3 + 1;
  }
  if (v15) {
    uint64_t v14 = 1;
  }
  v8->var0.NSUInteger location = location;
  v8->var0.unint64_t length = v16;
  int64_t var1 = begin[v6].var1;
  v44.NSUInteger location = v17;
  v44.unint64_t length = v14;
  int64_t v45 = var1;
  int64_t v19 = v6 + 1;
  unint64_t v20 = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (v6 + 1 == 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v20) >> 3))
  {
    uint64_t value = self->_nodes.__end_cap_.__value_;
    if (end >= value)
    {
      if ((unint64_t)(v6 + 2) > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v20) >> 3);
      uint64_t v26 = 2 * v25;
      if (2 * v25 <= v6 + 2) {
        uint64_t v26 = v6 + 2;
      }
      if (v25 >= 0x555555555555555) {
        unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v27 = v26;
      }
      if (v27) {
        unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v27);
      }
      else {
        uint64_t v28 = 0;
      }
      unint64_t v29 = (_UIOutlineNode *)(v27 + 24 * v19);
      long long v30 = (_UIOutlineNode *)(v27 + 24 * v28);
      _NSRange v31 = v44;
      v29->int64_t var1 = v45;
      v29->_NSRange var0 = v31;
      unint64_t v24 = v29 + 1;
      v33 = self->_nodes.__begin_;
      v32 = self->_nodes.__end_;
      if (v32 != v33)
      {
        do
        {
          _NSRange var0 = v32[-1].var0;
          v29[-1].int64_t var1 = v32[-1].var1;
          v29[-1]._NSRange var0 = var0;
          --v29;
          --v32;
        }
        while (v32 != v33);
        v32 = self->_nodes.__begin_;
      }
      self->_nodes.__begin_ = v29;
      self->_nodes.__end_ = v24;
      self->_nodes.__end_cap_.__value_ = v30;
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      _NSRange v23 = v44;
      end->int64_t var1 = v45;
      end->_NSRange var0 = v23;
      unint64_t v24 = end + 1;
    }
    self->_nodes.__end_ = v24;
  }
  else
  {
    std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&v20[v19], (unint64_t)&v44);
  }
}

- (id)_deleteChildNodesForParentNodeIndex:(int64_t)a3
{
  begin = self->_nodes.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)begin) >> 3) <= a3)
  {
    unint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 831, @"Invalid parameter not satisfying: %@", @"parentNodeIndex < _nodes.size()" object file lineNumber description];

    begin = self->_nodes.__begin_;
  }
  int64_t var1 = begin[a3].var1;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int64_t v9 = a3;
  for (unint64_t i = a3 + 1; ; ++i)
  {
    unint64_t v11 = self->_nodes.__begin_;
    if (i >= 0xAAAAAAAAAAAAAAABLL * (((char *)self->_nodes.__end_ - (char *)v11) >> 3) || v11[v9 + 1].var1 <= var1) {
      break;
    }
    [v8 addIndex:i];
    NSUInteger location = v11[v9 + 1].var0.location;
    NSUInteger length = v11[++v9].var0.length;
    objc_msgSend(v7, "addIndexesInRange:", location, length);
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68___UITreeDataSourceSnapshotter__deleteChildNodesForParentNodeIndex___block_invoke;
  v17[3] = &unk_1E5311A18;
  v17[4] = self;
  v17[5] = v18;
  [v8 enumerateIndexesWithOptions:2 usingBlock:v17];
  _Block_object_dispose(v18, 8);

  return v7;
}

- (void)_insertCount:(int64_t)a3 beforeIndex:(int64_t)a4
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 858, @"Invalid parameter not satisfying: %@", @"destinationIndex < self.count" object file lineNumber description];

    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  id v8 = [(_UITreeDataSourceSnapshotter *)self _nodeForGlobalIndex:a4];
  v8->var0.length += a3;
  [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + a3];
  [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:0x7FFFFFFFFFFFFFFFLL];
  -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", a4, a3);
}

- (int64_t)_insertCount:(int64_t)a3 afterIndex:(int64_t)a4
{
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a4)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 876, @"Invalid parameter not satisfying: %@", @"destinationIndex < self.count" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_3:
  id v8 = [(_UITreeDataSourceSnapshotter *)self childrenForParentAtIndex:a4 recursive:1];
  uint64_t v9 = [v8 count];
  int64_t v10 = a4;
  if ([v8 count]) {
    int64_t v10 = [v8 lastIndex];
  }
  int64_t v11 = v10 + 1;
  if (v11 > [(_UITreeDataSourceSnapshotter *)self count])
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 892, @"Invalid parameter not satisfying: %@", @"adjustedDestinationIndex <= self.count" object file lineNumber description];
  }
  int64_t v12 = [(_UITreeDataSourceSnapshotter *)self levelForIndex:a4];
  if (v11 == [(_UITreeDataSourceSnapshotter *)self count])
  {
    end = self->_nodes.__end_;
    uint64_t value = self->_nodes.__end_cap_.__value_;
    if (end >= value)
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
      begin = self->_nodes.__begin_;
      unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
      unint64_t v19 = v18 + 1;
      if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
      if (2 * v20 > v19) {
        unint64_t v19 = 2 * v20;
      }
      if (v20 < 0x555555555555555) {
        unint64_t v16 = v19;
      }
      if (v16)
      {
        unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v16);
        begin = self->_nodes.__begin_;
        end = self->_nodes.__end_;
      }
      else
      {
        uint64_t v21 = 0;
      }
      _NSRange v23 = (_UIOutlineNode *)(v16 + 24 * v18);
      unint64_t v24 = (_UIOutlineNode *)(v16 + 24 * v21);
      v23->var0.NSUInteger location = v11;
      v23->var0.NSUInteger length = a3;
      v23->int64_t var1 = v12;
      BOOL v15 = v23 + 1;
      if (end != begin)
      {
        do
        {
          _NSRange var0 = end[-1].var0;
          v23[-1].int64_t var1 = end[-1].var1;
          v23[-1]._NSRange var0 = var0;
          --v23;
          --end;
        }
        while (end != begin);
        begin = self->_nodes.__begin_;
      }
      self->_nodes.__begin_ = v23;
      self->_nodes.__end_ = v15;
      self->_nodes.__end_cap_.__value_ = v24;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      end->var0.NSUInteger location = v11;
      end->var0.NSUInteger length = a3;
      BOOL v15 = end + 1;
      end->int64_t var1 = v12;
    }
    self->_nodes.__end_ = v15;
    [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + a3];
  }
  else
  {
    if (v9)
    {
      v29[0] = v11;
      v29[1] = a3;
      v29[2] = v12;
      std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&self->_nodes.__begin_[[(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:v11]], (unint64_t)v29);
    }
    else
    {
      unint64_t v22 = [(_UITreeDataSourceSnapshotter *)self _nodeForGlobalIndex:a4];
      v22->var0.length += a3;
    }
    [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + a3];
    [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:0x7FFFFFFFFFFFFFFFLL];
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", v11, a3);
  }

  return v11;
}

- (void)_recomputeExpandedIndexesForDeletedIndexes:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableIndexSet count](self->_expandedIndexes, "count"))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    int64_t v6 = (void *)[(NSMutableIndexSet *)self->_expandedIndexes mutableCopy];
    [v6 removeIndexes:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75___UITreeDataSourceSnapshotter__recomputeExpandedIndexesForDeletedIndexes___block_invoke;
    v10[3] = &unk_1E5311A60;
    id v11 = v4;
    id v7 = (NSMutableIndexSet *)v5;
    int64_t v12 = v7;
    [v6 enumerateRangesUsingBlock:v10];
    expandedIndexes = self->_expandedIndexes;
    self->_expandedIndexes = v7;
    uint64_t v9 = v7;
  }
}

- (id)_snapshotterByShiftingIndexesByCount:(int64_t)a3
{
  begin = self->_nodes.__begin_;
  end = self->_nodes.__end_;
  if (begin == end)
  {
    int64_t v6 = 0;
    id v7 = 0;
  }
  else
  {
    int64_t v6 = 0;
    id v7 = 0;
    unint64_t v8 = 0;
    do
    {
      NSUInteger length = begin->var0.length;
      int64_t v10 = begin->var0.location + a3;
      int64_t var1 = begin->var1;
      if ((unint64_t)v7 >= v8)
      {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (v7 - v6) + 1;
        if (v12 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        if (0x5555555555555556 * ((uint64_t)(v8 - (void)v6) >> 3) > v12) {
          unint64_t v12 = 0x5555555555555556 * ((uint64_t)(v8 - (void)v6) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (void)v6) >> 3) >= 0x555555555555555) {
          unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v13);
        }
        else {
          uint64_t v14 = 0;
        }
        BOOL v15 = (int64_t *)(v13 + 8 * (v7 - v6));
        int64_t *v15 = v10;
        v15[1] = length;
        v15[2] = var1;
        if (v7 == v6)
        {
          unint64_t v18 = (int64_t *)(v13 + 8 * (v7 - v6));
        }
        else
        {
          unint64_t v16 = v13 + 8 * (v7 - v6);
          do
          {
            long long v17 = *(_OWORD *)(v7 - 3);
            unint64_t v18 = (int64_t *)(v16 - 24);
            *(void *)(v16 - 8) = *(v7 - 1);
            *(_OWORD *)(v16 - 24) = v17;
            v7 -= 3;
            v16 -= 24;
          }
          while (v7 != v6);
        }
        unint64_t v8 = v13 + 24 * v14;
        id v7 = v15 + 3;
        if (v6) {
          operator delete(v6);
        }
        int64_t v6 = v18;
      }
      else
      {
        int64_t *v7 = v10;
        v7[1] = length;
        v7[2] = var1;
        v7 += 3;
      }
      ++begin;
    }
    while (begin != end);
  }
  unint64_t v19 = (void *)[(NSMutableIndexSet *)self->_expandedIndexes mutableCopy];
  [v19 shiftIndexesStartingAtIndex:0 by:a3];
  unint64_t v20 = [_UITreeDataSourceSnapshotter alloc];
  __p = 0;
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  int64_t v21 = (char *)v7 - (char *)v6;
  if (v21)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v21 >> 3) > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    __p = std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(0xAAAAAAAAAAAAAAABLL * (v21 >> 3));
    unint64_t v29 = (char *)__p + 24 * v22;
    memmove(__p, v6, v21);
    uint64_t v28 = (char *)__p + 8 * (v21 >> 3);
  }
  _NSRange v23 = [(_UITreeDataSourceSnapshotter *)v20 initWithNodes:&__p count:*(void *)(v26 + 32) expandedIndexes:v19];
  if (__p)
  {
    uint64_t v28 = (char *)__p;
    operator delete(__p);
  }

  if (v6) {
    operator delete(v6);
  }
  return v23;
}

- (id)_snapshotterByNormalizingRangeOffsets
{
  id v3 = [(_UITreeDataSourceSnapshotter *)self _allIndexes];
  uint64_t v4 = [v3 firstIndex];
  if (v4)
  {
    uint64_t v5 = [(_UITreeDataSourceSnapshotter *)self _snapshotterByShiftingIndexesByCount:-v4];
  }
  else
  {
    uint64_t v5 = [(_UITreeDataSourceSnapshotter *)self copy];
  }
  int64_t v6 = (void *)v5;

  return v6;
}

- (int64_t)_indexForInsertingAfterIndex:(int64_t)a3
{
  int64_t v3 = a3;
  if ([(_UITreeDataSourceSnapshotter *)self count] <= a3)
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 1032, @"Invalid parameter not satisfying: %@", @"destinationIndex < self.count" object file lineNumber description];
  }
  int64_t v6 = [(_UITreeDataSourceSnapshotter *)self childrenForParentAtIndex:v3 recursive:1];
  if ([v6 count]) {
    int64_t v3 = [v6 lastIndex];
  }

  return v3 + 1;
}

- (id)_allIndexes
{
  if ([(_UITreeDataSourceSnapshotter *)self count])
  {
    NSUInteger location = self->_nodes.__begin_->var0.location;
    int64_t v4 = [(_UITreeDataSourceSnapshotter *)self count];
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", location, v4);
  }
  else
  {
    [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v5 = };
  return v5;
}

- (void)_insertSubtreeFromSnapshotter:(id)a3 atIndex:(int64_t)a4 adjustedIndex:(int64_t)a5
{
  uint64_t v9 = a3;
  int64_t v10 = [(_UITreeDataSourceSnapshotter *)self count];
  if (v10 <= a4)
  {
    uint64_t v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 1061, @"Invalid parameter not satisfying: %@", @"destinationIndex < count" object file lineNumber description];
  }
  if (v10 < a5)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 1062, @"Invalid parameter not satisfying: %@", @"adjustedDestinationIndex <= count" object file lineNumber description];
  }
  uint64_t v11 = [v9 count];
  int64_t v12 = [(_UITreeDataSourceSnapshotter *)self levelForIndex:a4];
  uint64_t v43 = v11;
  if (v10 == a5)
  {
    v41 = v9;
    int64_t v42 = a5;
    uint64_t v13 = v9[1];
    uint64_t v14 = v9[2];
    if (v13 != v14)
    {
      end = self->_nodes.__end_;
      NSUInteger v16 = v42;
      do
      {
        NSUInteger v17 = *(void *)(v13 + 8);
        int64_t v18 = *(void *)(v13 + 16) + v12;
        uint64_t value = self->_nodes.__end_cap_.__value_;
        if (end >= value)
        {
          begin = self->_nodes.__begin_;
          unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
          unint64_t v22 = v21 + 1;
          if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
            abort();
          }
          unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
          if (2 * v23 > v22) {
            unint64_t v22 = 2 * v23;
          }
          if (v23 >= 0x555555555555555) {
            unint64_t v24 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIOutlineNode>>(v24);
            begin = self->_nodes.__begin_;
            end = self->_nodes.__end_;
          }
          else
          {
            uint64_t v25 = 0;
          }
          uint64_t v26 = (_UIOutlineNode *)(v24 + 24 * v21);
          v26->var0.NSUInteger location = v16;
          v26->var0.NSUInteger length = v17;
          v26->int64_t var1 = v18;
          unint64_t v27 = v26;
          if (end != begin)
          {
            do
            {
              _NSRange var0 = end[-1].var0;
              v27[-1].int64_t var1 = end[-1].var1;
              v27[-1]._NSRange var0 = var0;
              --v27;
              --end;
            }
            while (end != begin);
            begin = self->_nodes.__begin_;
          }
          end = v26 + 1;
          self->_nodes.__begin_ = v27;
          self->_nodes.__end_ = v26 + 1;
          self->_nodes.__end_cap_.__value_ = (_UIOutlineNode *)(v24 + 24 * v25);
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          end->var0.NSUInteger location = v16;
          end->var0.NSUInteger length = v17;
          end->int64_t var1 = v18;
          ++end;
        }
        self->_nodes.__end_ = end;
        v16 += v17;
        v13 += 24;
      }
      while (v13 != v14);
    }
    uint64_t v9 = v41;
    a5 = v42;
    [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + v43];
  }
  else
  {
    if (a5 - a4 != 1) {
      a4 = a5;
    }
    if ([(_UITreeDataSourceSnapshotter *)self _shouldSplitNodeAtInsertionIndex:a4])
    {
      [(_UITreeDataSourceSnapshotter *)self _splitNodeAtInsertionIndex:a4];
    }
    int64_t v29 = [(_UITreeDataSourceSnapshotter *)self _nodeIndexForGlobalIndex:a5];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, self, @"_UITreeDataSourceSnapshotter.mm", 1097, @"Invalid parameter not satisfying: %@", @"nodeInsertionIndex != NSNotFound" object file lineNumber description];
    }
    uint64_t v30 = v9[1];
    uint64_t v31 = v9[2];
    if (v30 != v31)
    {
      int64_t v32 = v29;
      int64_t v33 = a5;
      do
      {
        uint64_t v34 = *(void *)(v30 + 8);
        int64_t v35 = *(void *)(v30 + 16) + v12;
        v44[0] = v33;
        v44[1] = v34;
        v44[2] = v35;
        std::vector<_UIOutlineNode>::insert((char **)&self->_nodes, (char *)&self->_nodes.__begin_[v32], (unint64_t)v44);
        v33 += v34;
        v30 += 24;
        ++v32;
      }
      while (v30 != v31);
    }
    [(_UITreeDataSourceSnapshotter *)self setCount:[(_UITreeDataSourceSnapshotter *)self count] + v43];
    [(_UITreeDataSourceSnapshotter *)self _recomputeRangeOffsetForGlobalIndex:0x7FFFFFFFFFFFFFFFLL];
    -[_UITreeDataSourceSnapshotter _recomputeExpandedIndexesForInsertedRange:](self, "_recomputeExpandedIndexesForInsertedRange:", a5, v43);
  }
  v36 = [v9 expandedIndexes];
  uint64_t v37 = (void *)[v36 mutableCopy];

  [v37 shiftIndexesStartingAtIndex:0 by:a5];
  [(NSMutableIndexSet *)self->_expandedIndexes addIndexes:v37];
}

- (_UIOutlineNode)_nextNodeForNodeIndex:(SEL)a3
{
  NSUInteger length = self->var0.length;
  int64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(self->var1 - length) >> 3);
  int64_t v6 = *a4;
  if (*a4 >= v5)
  {
    NSUInteger v8 = 0;
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v9 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v7 = (NSUInteger *)(length + 24 * v6);
    NSUInteger v9 = *v7;
    NSUInteger v8 = v7[1];
    int64_t v10 = v7[2];
    if (v6 + 1 >= v5)
    {
      int64_t v11 = 0;
    }
    else
    {
      int64_t v11 = 0;
      self = (_UIOutlineNode *)24;
      int64_t v12 = (void *)(length + 24 * v6 + 40);
      while (*v12 == v10)
      {
        v8 += *(v12 - 1);
        ++v11;
        v12 += 3;
        if (v5 + ~v6 == v11)
        {
          int64_t v11 = v5 + ~v6;
          break;
        }
      }
    }
    BOOL v14 = v11 + v6 + 1 < v5;
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14) {
      int64_t v13 = v11 + v6 + 1;
    }
  }
  *a4 = v13;
  retstr->var0.NSUInteger location = v9;
  retstr->var0.NSUInteger length = v8;
  retstr->int64_t var1 = v10;
  return self;
}

@end