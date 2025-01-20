@interface NSMutableIndexSet
- (void)tsu_intersectionWithIndexSet:(id)a3;
- (void)tsu_moveIndexesInRange:(_NSRange)a3 toOffset:(unint64_t)a4;
@end

@implementation NSMutableIndexSet

- (void)tsu_moveIndexesInRange:(_NSRange)a3 toOffset:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a4 < a3.location || a4 - a3.location >= a3.length)
  {
    unint64_t v8 = a3.location + a3.length;
    if (a3.location + a3.length != a4
      && [(NSMutableIndexSet *)self firstIndex] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8 >= a4) {
        NSUInteger v9 = 0;
      }
      else {
        NSUInteger v9 = length;
      }
      unint64_t v10 = a4 - v9;
      v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      v14 = sub_1000B3ED0;
      v15 = &unk_1001CE9E8;
      id v11 = objc_alloc_init((Class)NSMutableIndexSet);
      id v16 = v11;
      NSUInteger v17 = location;
      NSUInteger v18 = length;
      unint64_t v19 = v10;
      -[NSMutableIndexSet enumerateRangesInRange:options:usingBlock:](self, "enumerateRangesInRange:options:usingBlock:", location, length, 0, &v12);
      -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self, "shiftIndexesStartingAtIndex:by:", location + length, -(uint64_t)length, v12, v13, v14, v15);
      [(NSMutableIndexSet *)self shiftIndexesStartingAtIndex:v10 by:length];
      [(NSMutableIndexSet *)self addIndexes:v11];
    }
  }
}

- (void)tsu_intersectionWithIndexSet:(id)a3
{
  id v5 = a3;
  if ([(NSMutableIndexSet *)self count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableIndexSet), "initWithIndexesInRange:", -[NSMutableIndexSet firstIndex](self, "firstIndex"), (unsigned char *)-[NSMutableIndexSet lastIndex](self, "lastIndex")- (unsigned char *)-[NSMutableIndexSet firstIndex](self, "firstIndex")+ 1);
    [v4 removeIndexes:v5];
    [(NSMutableIndexSet *)self removeIndexes:v4];
  }
}

@end