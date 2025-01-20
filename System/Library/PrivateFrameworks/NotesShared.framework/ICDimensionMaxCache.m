@interface ICDimensionMaxCache
- (ICDimensionMaxCache)init;
- (ICDimensionMaxCache)initWithComparator:(id)a3;
- (NSMutableArray)sortedDimensions;
- (NSMutableDictionary)dimensions;
- (double)dimensionForKey:(id)a3;
- (double)max;
- (id)comparator;
- (unint64_t)count;
- (void)removeDimensionForKey:(id)a3;
- (void)setDimension:(double)a3 forKey:(id)a4;
@end

@implementation ICDimensionMaxCache

- (double)max
{
  v2 = [(ICDimensionMaxCache *)self sortedDimensions];
  v3 = [v2 lastObject];

  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)count
{
  v2 = [(ICDimensionMaxCache *)self dimensions];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ICDimensionMaxCache)init
{
  return 0;
}

- (ICDimensionMaxCache)initWithComparator:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDimensionMaxCache;
  double v5 = [(ICDimensionMaxCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    dimensions = v5->_dimensions;
    v5->_dimensions = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    sortedDimensions = v5->_sortedDimensions;
    v5->_sortedDimensions = (NSMutableArray *)v8;

    v10 = _Block_copy(v4);
    id comparator = v5->_comparator;
    v5->_id comparator = v10;
  }
  return v5;
}

- (double)dimensionForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(ICDimensionMaxCache *)self dimensions];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setDimension:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  double v7 = [(ICDimensionMaxCache *)self dimensions];
  double v8 = [v7 objectForKey:v6];

  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  if (v8)
  {
    if ([v8 isEqual:v9]) {
      goto LABEL_9;
    }
    v10 = [(ICDimensionMaxCache *)self sortedDimensions];
    v11 = [(ICDimensionMaxCache *)self comparator];
    uint64_t v12 = objc_msgSend(v10, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v8, 0, v11);

    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"prevIndex != NSNotFound" functionName:"-[ICDimensionMaxCache setDimension:forKey:]" simulateCrash:1 showAlert:0 format:@"index of existing dimension should exist"];
    }
    objc_super v13 = [(ICDimensionMaxCache *)self sortedDimensions];
    [v13 removeObjectAtIndex:v12];
  }
  uint64_t v22 = 0;
  v14 = [(ICDimensionMaxCache *)self sortedDimensions];
  v15 = [(ICDimensionMaxCache *)self comparator];
  objc_msgSend(v14, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v9, &v22, v15);

  if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"index != NSNotFound" functionName:"-[ICDimensionMaxCache setDimension:forKey:]" simulateCrash:1 showAlert:0 format:@"insertion index should be found"];
  }
  v16 = [(ICDimensionMaxCache *)self sortedDimensions];
  [v16 insertObject:v9 atIndex:v22];

  v17 = [(ICDimensionMaxCache *)self dimensions];
  [v17 setObject:v9 forKey:v6];

LABEL_9:
  v18 = [(ICDimensionMaxCache *)self dimensions];
  uint64_t v19 = [v18 count];
  v20 = [(ICDimensionMaxCache *)self sortedDimensions];
  uint64_t v21 = [v20 count];

  if (v19 != v21) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"self.dimensions.count == self.sortedDimensions.count" functionName:"-[ICDimensionMaxCache setDimension:forKey:]" simulateCrash:1 showAlert:0 format:@"counts should match"];
  }
}

- (void)removeDimensionForKey:(id)a3
{
  id v11 = a3;
  id v4 = [(ICDimensionMaxCache *)self dimensions];
  double v5 = [v4 objectForKey:v11];

  if (v5)
  {
    id v6 = [(ICDimensionMaxCache *)self sortedDimensions];
    double v7 = [(ICDimensionMaxCache *)self comparator];
    uint64_t v8 = objc_msgSend(v6, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v5, 0, v7);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"index != NSNotFound" functionName:"-[ICDimensionMaxCache removeDimensionForKey:]" simulateCrash:1 showAlert:0 format:@"index of existing dimension should exist"];
    }
    v9 = [(ICDimensionMaxCache *)self sortedDimensions];
    [v9 removeObjectAtIndex:v8];

    v10 = [(ICDimensionMaxCache *)self dimensions];
    [v10 removeObjectForKey:v11];
  }
}

- (NSMutableDictionary)dimensions
{
  return self->_dimensions;
}

- (NSMutableArray)sortedDimensions
{
  return self->_sortedDimensions;
}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_sortedDimensions, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end