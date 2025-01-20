@interface NSIndexSet
+ (id)tsu_indexSetWithIndices:(unint64_t *)a3 count:(unint64_t)a4;
- (BOOL)tsu_intersectsIndexesInIndexSet:(id)a3;
- (BOOL)tsu_isSingleContiguousRange;
- (_NSRange)tsu_boundingRange;
- (_NSRange)tsu_leadingRangeInRange:(_NSRange)a3;
- (_NSRange)tsu_trailingRangeInRange:(_NSRange)a3;
- (id)tsu_indexSetByAddingIndex:(unint64_t)a3;
- (id)tsu_indexSetByAddingIndexes:(id)a3;
- (id)tsu_indexSetByExcludingIndex:(unint64_t)a3;
- (id)tsu_indexSetByExcludingIndexes:(id)a3;
- (id)tsu_indexSetByInsertingIndexes:(id)a3 inRange:(_NSRange)a4;
- (id)tsu_indexSetByIntersectingWithIndexes:(id)a3;
- (id)tsu_indexSetByIntersectingWithRange:(_NSRange)a3;
- (id)tsu_indexSetByOutsettingRangesBy:(unint64_t)a3;
- (id)tsu_indexSetChunkIndex:(unint64_t)a3 ofChunkCount:(unint64_t)a4;
- (id)tsu_initWithIndices:(unint64_t *)a3 count:(unint64_t)a4;
- (id)tsu_localizedDescription;
- (unint64_t)tsu_firstCommonIndexWithIndexes:(id)a3;
- (unint64_t)tsu_indexAtPosition:(unint64_t)a3;
- (unint64_t)tsu_nsIndexSetConcurrencyFactor;
- (unint64_t)tsu_positionOfIndex:(unint64_t)a3;
- (void)tsu_enumerateIndexesAndPositionsUsingBlock:(id)a3;
- (void)tsu_enumeratePowerSetIncludingEmptySet:(BOOL)a3 usingBlock:(id)a4;
- (void)tsu_enumerateRangesConcurrentlyUsingBeginBlock:(id)a3 concurrentBlock:(id)a4 finalBlock:(id)a5;
- (void)tsu_enumerateSkippedIndexesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)tsu_enumerateSkippedRangesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation NSIndexSet

+ (id)tsu_indexSetWithIndices:(unint64_t *)a3 count:(unint64_t)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)NSIndexSet), "tsu_initWithIndices:count:", a3, a4);
  return v4;
}

- (id)tsu_initWithIndices:(unint64_t *)a3 count:(unint64_t)a4
{
  for (i = +[NSMutableIndexSet indexSet];
  {
    uint64_t v8 = *a3++;
    [i addIndex:v8];
  }
  v9 = self;
  v10 = [(NSIndexSet *)v9 initWithIndexSet:i];

  return v10;
}

- (id)tsu_indexSetByAddingIndex:(unint64_t)a3
{
  id v4 = [(NSIndexSet *)self mutableCopy];
  [v4 addIndex:a3];
  id v5 = [v4 copy];

  return v5;
}

- (id)tsu_indexSetByAddingIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(NSIndexSet *)self mutableCopy];
  [v5 addIndexes:v4];
  id v6 = [v5 copy];

  return v6;
}

- (BOOL)tsu_isSingleContiguousRange
{
  NSUInteger v3 = [(NSIndexSet *)self count];
  if (v3)
  {
    NSUInteger v4 = [(NSIndexSet *)self lastIndex];
    uint64_t v5 = v4 - [(NSIndexSet *)self firstIndex] + 1;
    LOBYTE(v3) = v5 == [(NSIndexSet *)self count];
  }
  return v3;
}

- (BOOL)tsu_intersectsIndexesInIndexSet:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (-[NSIndexSet count](self, "count") && [v4 count])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B1E18;
    v7[3] = &unk_1001CE7D0;
    id v8 = v4;
    v9 = &v10;
    [(NSIndexSet *)self enumerateRangesUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)tsu_indexSetByInsertingIndexes:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (v7 && length)
  {
    id v8 = [(NSIndexSet *)self mutableCopy];
    [v8 shiftIndexesStartingAtIndex:location by:length];
    id v9 = [v7 mutableCopy];
    [v9 shiftIndexesStartingAtIndex:0 by:location];
    [v8 addIndexes:v9];
  }
  else
  {
    id v8 = [(NSIndexSet *)self copy];
  }

  return v8;
}

- (id)tsu_indexSetByIntersectingWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = sub_1000B2088;
  v14 = sub_1000B2098;
  id v15 = +[NSMutableIndexSet indexSet];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B20A0;
  v9[3] = &unk_1001CE7F8;
  v9[4] = &v10;
  -[NSIndexSet enumerateRangesInRange:options:usingBlock:](self, "enumerateRangesInRange:options:usingBlock:", location, length, 0, v9);
  id v6 = objc_alloc((Class)NSIndexSet);
  id v7 = [v6 initWithIndexSet:v11[5]];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)tsu_indexSetByIntersectingWithIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000B2088;
  v20 = sub_1000B2098;
  id v21 = +[NSMutableIndexSet indexSet];
  unint64_t v5 = [(NSIndexSet *)self count];
  if (v5 >= (unint64_t)[v4 count])
  {
    NSUInteger v8 = [(NSIndexSet *)self firstIndex];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000B2388;
    v12[3] = &unk_1001CE7D0;
    v12[4] = self;
    v12[5] = &v16;
    objc_msgSend(v4, "enumerateRangesInRange:options:usingBlock:", v8, (char *)-[NSIndexSet lastIndex](self, "lastIndex") - v8 + 1, 0, v12);
  }
  else
  {
    id v6 = [v4 firstIndex];
    id v7 = (char *)((unsigned char *)[v4 lastIndex] - v6 + 1);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B22F0;
    v13[3] = &unk_1001CE7D0;
    id v14 = v4;
    id v15 = &v16;
    -[NSIndexSet enumerateRangesInRange:options:usingBlock:](self, "enumerateRangesInRange:options:usingBlock:", v6, v7, 0, v13);
  }
  id v9 = objc_alloc((Class)NSIndexSet);
  id v10 = [v9 initWithIndexSet:v17[5]];
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)tsu_indexSetByExcludingIndex:(unint64_t)a3
{
  id v4 = +[NSIndexSet indexSetWithIndex:a3];
  unint64_t v5 = [(NSIndexSet *)self tsu_indexSetByExcludingIndexes:v4];

  return v5;
}

- (id)tsu_indexSetByExcludingIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(NSIndexSet *)self mutableCopy];
  [v5 removeIndexes:v4];
  id v6 = [v5 copy];

  return v6;
}

- (unint64_t)tsu_indexAtPosition:(unint64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSIndexSet *)self count] > a3)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B2630;
    v7[3] = &unk_1001CE820;
    void v7[4] = v8;
    v7[5] = &v9;
    v7[6] = a3;
    [(NSIndexSet *)self enumerateIndexesUsingBlock:v7];
    _Block_object_dispose(v8, 8);
  }
  unint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (unint64_t)tsu_positionOfIndex:(unint64_t)a3
{
  NSUInteger v5 = [(NSIndexSet *)self count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v6 = v5;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B2758;
  v9[3] = &unk_1001CE848;
  v9[4] = &v10;
  void v9[5] = a3;
  [(NSIndexSet *)self enumerateIndexesUsingBlock:v9];
  if (v11[3] >= v6) {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)tsu_enumerateIndexesAndPositionsUsingBlock:(id)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B2864;
  v5[3] = &unk_1001CE870;
  id v6 = a3;
  unint64_t v7 = v8;
  id v4 = v6;
  [(NSIndexSet *)self enumerateIndexesUsingBlock:v5];

  _Block_object_dispose(v8, 8);
}

- (_NSRange)tsu_leadingRangeInRange:(_NSRange)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x4012000000;
  uint64_t v12 = sub_1000B29C4;
  uint64_t v13 = nullsub_1;
  id v14 = &unk_100185BE2;
  NSUInteger location = a3.location;
  uint64_t v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B29D4;
  v8[3] = &unk_1001CE7F8;
  void v8[4] = &v9;
  -[NSIndexSet enumerateRangesInRange:options:usingBlock:](self, "enumerateRangesInRange:options:usingBlock:", a3.location, a3.length, 0, v8);
  if (v10[7]) {
    NSUInteger v3 = (long long *)(v10 + 6);
  }
  else {
    NSUInteger v3 = &TSUInvalidRange;
  }
  NSUInteger v4 = *(void *)v3;
  NSUInteger v5 = *((void *)v3 + 1);
  _Block_object_dispose(&v9, 8);
  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)tsu_trailingRangeInRange:(_NSRange)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x4012000000;
  uint64_t v11 = sub_1000B29C4;
  uint64_t v12 = nullsub_1;
  uint64_t v13 = &unk_100185BE2;
  NSUInteger v14 = a3.location + a3.length;
  uint64_t v15 = 0;
  -[NSIndexSet enumerateRangesInRange:options:usingBlock:](self, "enumerateRangesInRange:options:usingBlock:");
  if (v9[7]) {
    NSUInteger v3 = (long long *)(v9 + 6);
  }
  else {
    NSUInteger v3 = &TSUInvalidRange;
  }
  NSUInteger v4 = *(void *)v3;
  NSUInteger v5 = *((void *)v3 + 1);
  _Block_object_dispose(&v8, 8);
  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (unint64_t)tsu_firstCommonIndexWithIndexes:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B2CA0;
  v7[3] = &unk_1001CE7D0;
  id v8 = a3;
  uint64_t v9 = &v10;
  id v4 = v8;
  [(NSIndexSet *)self enumerateRangesUsingBlock:v7];
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)tsu_localizedDescription
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B2E44;
  v6[3] = &unk_1001CE8C0;
  id v3 = (id)objc_opt_new();
  id v7 = v3;
  [(NSIndexSet *)self enumerateRangesUsingBlock:v6];
  id v4 = objc_msgSend(v3, "tsu_localizedList");

  return v4;
}

- (_NSRange)tsu_boundingRange
{
  if ([(NSIndexSet *)self count])
  {
    NSUInteger v3 = [(NSIndexSet *)self firstIndex];
    NSUInteger v4 = [(NSIndexSet *)self lastIndex];
    NSUInteger v5 = v4 - [(NSIndexSet *)self firstIndex] + 1;
  }
  else
  {
    NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v5 = 0;
  }
  NSUInteger v6 = v3;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (void)tsu_enumeratePowerSetIncludingEmptySet:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  NSUInteger v6 = (void (**)(id, id, unsigned char *))a4;
  NSUInteger v7 = [(NSIndexSet *)self count];
  NSUInteger v8 = v7;
  if (v7 >= 0x40)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE8E0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A368();
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSIndexSet(TSUAdditions) tsu_enumeratePowerSetIncludingEmptySet:usingBlock:]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSIndexSet_TSUAdditions.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:245 isFatal:0 description:"too many indexes!"];
    goto LABEL_23;
  }
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE900);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016A2B8();
    }
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSIndexSet(TSUAdditions) tsu_enumeratePowerSetIncludingEmptySet:usingBlock:]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSIndexSet_TSUAdditions.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 249, 0, "invalid nil value for '%{public}s'", "block");
LABEL_23:

    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_24;
  }
  unint64_t v9 = ~(-1 << v7);
  unint64_t v10 = !v4;
  if (v10 <= v9)
  {
    do
    {
      id v11 = objc_alloc_init((Class)NSMutableIndexSet);
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v10 & (1 << i)) != 0) {
            objc_msgSend(v11, "addIndex:", -[NSIndexSet tsu_indexAtPosition:](self, "tsu_indexAtPosition:", i));
          }
        }
      }
      unsigned __int8 v17 = 0;
      v6[2](v6, v11, &v17);
      int v13 = v17;

      if (v13) {
        break;
      }
    }
    while (v10++ != v9);
  }
LABEL_24:
}

- (id)tsu_indexSetChunkIndex:(unint64_t)a3 ofChunkCount:(unint64_t)a4
{
  NSUInteger v7 = [(NSIndexSet *)self firstIndex];
  unint64_t v8 = [(NSIndexSet *)self lastIndex] - v7 + 1;
  if (v8 % a4) {
    unint64_t v9 = a4 - v8 % a4;
  }
  else {
    unint64_t v9 = 0;
  }
  unint64_t v10 = v8 + v9;
  if (v10 < a4) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v10 / a4;
  }
  return [(NSIndexSet *)self tsu_indexSetByIntersectingWithRange:v7 + v11 * a3];
}

- (unint64_t)tsu_nsIndexSetConcurrencyFactor
{
  if (qword_1001EB988 != -1) {
    dispatch_once(&qword_1001EB988, &stru_1001CE920);
  }
  return qword_1001EB980;
}

- (void)tsu_enumerateRangesConcurrentlyUsingBeginBlock:(id)a3 concurrentBlock:(id)a4 finalBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = (void (**)(id, void *))a5;
  NSUInteger v11 = [(NSIndexSet *)self firstIndex];
  NSUInteger v12 = [(NSIndexSet *)self lastIndex];
  unint64_t v13 = [(NSIndexSet *)self tsu_nsIndexSetConcurrencyFactor];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x4812000000;
  v33 = sub_1000B3774;
  v34 = sub_1000B3798;
  v35 = &unk_100185BE2;
  memset(v36, 0, sizeof(v36));
  sub_1000B37C4((uint64_t)v36, v13);
  unint64_t v14 = v12 - v11 + 1;
  unint64_t v15 = v14 % v13;
  unint64_t v16 = v13 + v14 - v14 % v13;
  if (v15) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = v12 - v11 + 1;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000B384C;
  v24[3] = &unk_1001CE970;
  if (v13 > v17) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17 / v13;
  }
  NSUInteger v28 = v11;
  uint64_t v29 = v18;
  v24[4] = self;
  id v19 = v8;
  id v25 = v19;
  id v20 = v9;
  id v26 = v20;
  v27 = &v30;
  id v21 = objc_retainBlock(v24);
  dispatch_apply(v13, 0, v21);
  v22 = +[NSMutableArray arrayWithCapacity:v13];
  for (uint64_t i = 0; i != v13; ++i)
  {
    if (*(void *)(v31[6] + 8 * i)) {
      objc_msgSend(v22, "addObject:");
    }
  }
  v10[2](v10, v22);

  _Block_object_dispose(&v30, 8);
  v37 = (void **)v36;
  sub_1000B3FC8(&v37);
}

- (void)tsu_enumerateSkippedRangesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B3A54;
  v6[3] = &unk_1001CE998;
  NSUInteger v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(NSIndexSet *)v7 enumerateRangesWithOptions:a3 usingBlock:v6];
}

- (void)tsu_enumerateSkippedIndexesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B3B90;
  v6[3] = &unk_1001CE998;
  NSUInteger v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(NSIndexSet *)v7 enumerateRangesWithOptions:a3 usingBlock:v6];
}

- (id)tsu_indexSetByOutsettingRangesBy:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  NSUInteger v11 = sub_1000B2088;
  NSUInteger v12 = sub_1000B2098;
  id v13 = +[NSMutableIndexSet indexSet];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B3D50;
  v7[3] = &unk_1001CE9C0;
  void v7[4] = &v8;
  v7[5] = a3;
  [(NSIndexSet *)self enumerateRangesUsingBlock:v7];
  id v5 = [(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

@end