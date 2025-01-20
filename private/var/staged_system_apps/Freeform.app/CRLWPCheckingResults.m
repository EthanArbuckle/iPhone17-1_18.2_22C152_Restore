@interface CRLWPCheckingResults
- (BOOL)isEqual:(id)a3;
- (CRLWPCheckingResults)init;
- (CRLWPRangeArray)ranges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)results;
- (unint64_t)hash;
- (void)addResult:(id)a3 forRange:(_NSRange)a4;
- (void)clear;
- (void)removeResultsForRanges:(id)a3;
- (void)replacedTextAtRange:(_NSRange)a3 amount:(int64_t)a4;
@end

@implementation CRLWPCheckingResults

- (CRLWPCheckingResults)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLWPCheckingResults;
  v2 = [(CRLWPCheckingResults *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRLWPMutableRangeArray);
    ranges = v2->_ranges;
    v2->_ranges = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    results = v2->_results;
    v2->_results = v5;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(CRLWPRangeArray *)self->_ranges mutableCopyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSMutableArray *)self->_results mutableCopyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  id v6 = (CRLWPMutableRangeArray **)objc_claimAutoreleasedReturnValue();

  if (v6) {
    BOOL v7 = self->_ranges == v6[1];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = 0xCBF29CE484222325;
  if ([(CRLWPRangeArray *)self->_ranges rangeCount])
  {
    unint64_t v4 = 0;
    do
    {
      id v7 = 0;
      uint64_t v8 = 0;
      id v7 = -[CRLWPRangeArray rangeAtIndex:](self->_ranges, "rangeAtIndex:", v4, 0, 0);
      uint64_t v8 = v5;
      uint64_t v3 = sub_1000C8080((char *)&v7, 16, v3);
      ++v4;
    }
    while (v4 < [(CRLWPRangeArray *)self->_ranges rangeCount]);
  }
  return v3;
}

- (id)results
{
  return self->_results;
}

- (void)clear
{
  [(NSMutableArray *)self->_results removeAllObjects];
  ranges = self->_ranges;

  [(CRLWPMutableRangeArray *)ranges clear];
}

- (void)removeResultsForRanges:(id)a3
{
  id v16 = a3;
  unint64_t v4 = [(CRLWPRangeArray *)self->_ranges rangeCount];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      while (1)
      {
        unint64_t v8 = v5--;
        id v9 = [(CRLWPRangeArray *)self->_ranges rangeAtIndex:v5];
        if (!objc_msgSend(v16, "intersectsRange:", v9, v10)) {
          break;
        }
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v7 = v8;
        }
        unint64_t v6 = v5;
        if (!v5) {
          goto LABEL_16;
        }
      }
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v6 <= v7) {
          unint64_t v11 = v7;
        }
        else {
          unint64_t v11 = v6;
        }
        if (v6 < v7) {
          unint64_t v7 = v6;
        }
        unint64_t v12 = v11 - v7;
        -[NSMutableArray removeObjectsInRange:](self->_results, "removeObjectsInRange:", v7, v11 - v7);
        -[CRLWPMutableRangeArray removeRangesInRange:](self->_ranges, "removeRangesInRange:", v7, v12);
        unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    while (v5);
LABEL_16:
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6 <= v7) {
        unint64_t v13 = v7;
      }
      else {
        unint64_t v13 = v6;
      }
      if (v6 >= v7) {
        unint64_t v14 = v7;
      }
      else {
        unint64_t v14 = v6;
      }
      unint64_t v15 = v13 - v14;
      -[NSMutableArray removeObjectsInRange:](self->_results, "removeObjectsInRange:", v14, v13 - v14);
      -[CRLWPMutableRangeArray removeRangesInRange:](self->_ranges, "removeRangesInRange:", v14, v15);
    }
  }
}

- (void)replacedTextAtRange:(_NSRange)a3 amount:(int64_t)a4
{
  id v5 = -[CRLWPMutableRangeArray replacedTextAtRange:delta:](self->_ranges, "replacedTextAtRange:delta:", a3.location, a3.length, a4);
  if (v6)
  {
    id v7 = v5;
    results = self->_results;
    -[NSMutableArray removeObjectsInRange:](results, "removeObjectsInRange:", v7, v6);
  }
}

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  ranges = self->_ranges;
  id v9 = a3;
  id v8 = -[CRLWPRangeArray indexForRange:](ranges, "indexForRange:", location, length);
  -[CRLWPMutableRangeArray insertRange:atIndex:](self->_ranges, "insertRange:atIndex:", location, length, v8);
  [(NSMutableArray *)self->_results insertObject:v9 atIndex:v8];
}

- (CRLWPRangeArray)ranges
{
  return &self->_ranges->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_ranges, 0);
}

@end