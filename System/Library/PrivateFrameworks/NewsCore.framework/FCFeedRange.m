@interface FCFeedRange
+ (BOOL)supportsSecureCoding;
+ (FCFeedRange)feedRangeWithMaxOrder:(unint64_t)a3 minOrder:(unint64_t)a4;
+ (FCFeedRange)feedRangeWithTop:(id)a3 bottom:(id)a4;
+ (id)feedRangeByMergingRange:(id)a3 withRange:(id)a4;
+ (id)feedRangeFromDate:(id)a3 toDate:(id)a4;
+ (id)feedRangeFromDateRange:(id)a3;
- (BOOL)containsCursor:(id)a3;
- (BOOL)containsFeedRange:(id)a3;
- (BOOL)containsOrder:(unint64_t)a3;
- (BOOL)intersectsOrAdjoinsRange:(id)a3;
- (BOOL)intersectsRange:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)reachesBottomOfFeed;
- (BOOL)reachesTopOfFeed;
- (FCDateRange)dateRange;
- (FCFeedCursor)bottom;
- (FCFeedCursor)middle;
- (FCFeedCursor)top;
- (FCFeedRange)initWithCoder:(id)a3;
- (_NSRange)nsRange;
- (double)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)feedRangeByIntersectingWithRange:(id)a3;
- (id)feedRangeByUnioningWithRange:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBottom:(id)a3;
- (void)setTop:(id)a3;
@end

@implementation FCFeedRange

+ (FCFeedRange)feedRangeWithTop:(id)a3 bottom:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 order];
  if (v7 < [v5 order] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"inverted feed range"];
    int v11 = 136315906;
    v12 = "+[FCFeedRange feedRangeWithTop:bottom:]";
    __int16 v13 = 2080;
    v14 = "FCFeedRange.m";
    __int16 v15 = 1024;
    int v16 = 26;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  v8 = objc_alloc_init(FCFeedRange);
  [(FCFeedRange *)v8 setTop:v6];

  [(FCFeedRange *)v8 setBottom:v5];
  return v8;
}

+ (FCFeedRange)feedRangeWithMaxOrder:(unint64_t)a3 minOrder:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 < a4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"inverted feed range"];
    int v11 = 136315906;
    v12 = "+[FCFeedRange feedRangeWithMaxOrder:minOrder:]";
    __int16 v13 = 2080;
    v14 = "FCFeedRange.m";
    __int16 v15 = 1024;
    int v16 = 36;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  id v6 = objc_alloc_init(FCFeedRange);
  unint64_t v7 = +[FCFeedCursor cursorForOrder:a3];
  [(FCFeedRange *)v6 setTop:v7];

  v8 = +[FCFeedCursor cursorForOrder:a4];
  [(FCFeedRange *)v6 setBottom:v8];

  return v6;
}

+ (id)feedRangeFromDate:(id)a3 toDate:(id)a4
{
  id v5 = +[FCDateRange dateRangeWithStartDate:a3 endDate:a4];
  id v6 = [a1 feedRangeFromDateRange:v5];

  return v6;
}

+ (id)feedRangeFromDateRange:(id)a3
{
  id v4 = a3;
  if ([v4 isFromInfinity])
  {
    id v5 = +[FCFeedCursor cursorForTopOfFeed];
  }
  else
  {
    id v6 = [v4 startDate];
    id v5 = +[FCFeedCursor cursorForDate:v6];
  }
  if ([v4 isToInfinity])
  {
    unint64_t v7 = +[FCFeedCursor cursorForBottomOfFeed];
  }
  else
  {
    v8 = [v4 endDate];
    unint64_t v7 = +[FCFeedCursor cursorForDate:v8];
  }
  v9 = [a1 feedRangeWithTop:v5 bottom:v7];

  return v9;
}

+ (id)feedRangeByMergingRange:(id)a3 withRange:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (v5 && v6)
  {
    v8 = [v5 top];
    unint64_t v9 = [v8 order];

    v10 = [v7 top];
    unint64_t v11 = [v10 order];

    if (v9 <= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v9;
    }
    __int16 v13 = +[FCFeedCursor cursorForOrder:v12];
    v14 = [v5 bottom];
    unint64_t v15 = [v14 order];

    int v16 = [v7 bottom];
    unint64_t v17 = [v16 order];

    if (v15 >= v17) {
      unint64_t v18 = v17;
    }
    else {
      unint64_t v18 = v15;
    }
    uint64_t v19 = +[FCFeedCursor cursorForOrder:v18];
    v20 = +[FCFeedRange feedRangeWithTop:v13 bottom:v19];
  }
  else
  {
    if (v5) {
      id v21 = v5;
    }
    else {
      id v21 = v6;
    }
    v20 = v21;
  }

  return v20;
}

- (FCFeedRange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FCFeedRange);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"top"];
  [(FCFeedRange *)v5 setTop:v6];

  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bottom"];

  [(FCFeedRange *)v5 setBottom:v7];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCFeedRange *)self top];
  [v4 encodeObject:v5 forKey:@"top"];

  id v6 = [(FCFeedRange *)self bottom];
  [v4 encodeObject:v6 forKey:@"bottom"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(FCFeedRange);
  id v5 = [(FCFeedRange *)self top];
  [(FCFeedRange *)v4 setTop:v5];

  id v6 = [(FCFeedRange *)self bottom];
  [(FCFeedRange *)v4 setBottom:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  unint64_t v7 = [(FCFeedRange *)self top];
  v8 = [v6 top];
  if ([v7 isEqualToCursor:v8])
  {
    unint64_t v9 = [(FCFeedRange *)self bottom];
    v10 = [v6 bottom];
    char v11 = [v9 isEqualToCursor:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(FCFeedRange *)self top];
  uint64_t v4 = [v3 hash];
  id v5 = [(FCFeedRange *)self bottom];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (FCFeedCursor)middle
{
  v3 = [(FCFeedRange *)self bottom];
  uint64_t v4 = [v3 order];
  id v5 = [(FCFeedRange *)self top];
  uint64_t v6 = [v5 order];
  unint64_t v7 = [(FCFeedRange *)self bottom];
  v8 = +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", v4 + ((unint64_t)(v6 - [v7 order]) >> 1));

  return (FCFeedCursor *)v8;
}

- (BOOL)reachesTopOfFeed
{
  v2 = [(FCFeedRange *)self top];
  char v3 = [v2 isTopOfFeed];

  return v3;
}

- (BOOL)reachesBottomOfFeed
{
  v2 = [(FCFeedRange *)self bottom];
  char v3 = [v2 isBottomOfFeed];

  return v3;
}

- (BOOL)isEmpty
{
  char v3 = [(FCFeedRange *)self top];
  uint64_t v4 = [(FCFeedRange *)self bottom];
  BOOL v5 = [v3 compareToCursor:v4] != 1;

  return v5;
}

- (FCDateRange)dateRange
{
  char v3 = [(FCFeedRange *)self top];
  uint64_t v4 = [v3 date];
  BOOL v5 = [(FCFeedRange *)self bottom];
  uint64_t v6 = [v5 date];
  unint64_t v7 = +[FCDateRange dateRangeWithStartDate:v4 endDate:v6];

  return (FCDateRange *)v7;
}

- (_NSRange)nsRange
{
  char v3 = [(FCFeedRange *)self bottom];
  uint64_t v4 = [v3 order] + 1;
  BOOL v5 = [(FCFeedRange *)self top];
  uint64_t v6 = [v5 order];
  unint64_t v7 = [(FCFeedRange *)self bottom];
  NSUInteger v8 = v6 - [v7 order];

  NSUInteger v9 = v4;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (double)timeInterval
{
  char v3 = [(FCFeedRange *)self top];
  uint64_t v4 = [v3 order];
  BOOL v5 = [(FCFeedRange *)self bottom];
  double v6 = (double)(unint64_t)(v4 - [v5 order]) / 1000.0;

  return v6;
}

- (BOOL)containsOrder:(unint64_t)a3
{
  BOOL v5 = [(FCFeedRange *)self top];
  if ([v5 order] >= a3)
  {
    unint64_t v7 = [(FCFeedRange *)self bottom];
    BOOL v6 = [v7 order] < a3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)containsCursor:(id)a3
{
  uint64_t v4 = [a3 order];
  return [(FCFeedRange *)self containsOrder:v4];
}

- (BOOL)containsFeedRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = [v5 order];
  unint64_t v7 = [v4 top];
  if (v6 >= [v7 order])
  {
    NSUInteger v9 = [(FCFeedRange *)self bottom];
    unint64_t v10 = [v9 order];
    char v11 = [v4 bottom];
    BOOL v8 = v10 <= [v11 order];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)intersectsRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = [v5 order];
  unint64_t v7 = [v4 bottom];
  if (v6 <= [v7 order])
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v8 = [(FCFeedRange *)self bottom];
    unint64_t v9 = [v8 order];
    unint64_t v10 = [v4 top];
    BOOL v11 = v9 < [v10 order];
  }
  return v11;
}

- (BOOL)intersectsOrAdjoinsRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = [v5 order];
  unint64_t v7 = [v4 bottom];
  if (v6 >= [v7 order])
  {
    unint64_t v9 = [(FCFeedRange *)self bottom];
    unint64_t v10 = [v9 order];
    BOOL v11 = [v4 top];
    BOOL v8 = v10 <= [v11 order];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)feedRangeByIntersectingWithRange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "range != nil");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCFeedRange feedRangeByIntersectingWithRange:]";
    __int16 v23 = 2080;
    v24 = "FCFeedRange.m";
    __int16 v25 = 1024;
    int v26 = 179;
    __int16 v27 = 2114;
    v28 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = [v5 order];

  unint64_t v7 = [v4 top];
  unint64_t v8 = [v7 order];

  if (v6 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  unint64_t v10 = [(FCFeedRange *)self bottom];
  unint64_t v11 = [v10 order];

  unint64_t v12 = [v4 bottom];
  unint64_t v13 = [v12 order];

  if (v11 <= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v11;
  }
  if (v14 >= v9) {
    unint64_t v15 = v9;
  }
  else {
    unint64_t v15 = v14;
  }
  int v16 = +[FCFeedCursor cursorForOrder:v9];
  unint64_t v17 = +[FCFeedCursor cursorForOrder:v15];
  unint64_t v18 = +[FCFeedRange feedRangeWithTop:v16 bottom:v17];

  return v18;
}

- (id)feedRangeByUnioningWithRange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "range != nil");
    *(_DWORD *)buf = 136315906;
    id v21 = "-[FCFeedRange feedRangeByUnioningWithRange:]";
    __int16 v22 = 2080;
    __int16 v23 = "FCFeedRange.m";
    __int16 v24 = 1024;
    int v25 = 191;
    __int16 v26 = 2114;
    __int16 v27 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = [v5 order];

  unint64_t v7 = [v4 top];
  unint64_t v8 = [v7 order];

  if (v6 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  unint64_t v10 = [(FCFeedRange *)self bottom];
  unint64_t v11 = [v10 order];

  unint64_t v12 = [v4 bottom];
  unint64_t v13 = [v12 order];

  if (v11 >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v11;
  }
  unint64_t v15 = +[FCFeedCursor cursorForOrder:v9];
  int v16 = +[FCFeedCursor cursorForOrder:v14];
  unint64_t v17 = +[FCFeedRange feedRangeWithTop:v15 bottom:v16];

  return v17;
}

- (id)description
{
  char v3 = NSString;
  id v4 = NSNumber;
  BOOL v5 = [(FCFeedRange *)self top];
  unint64_t v6 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "order"));
  unint64_t v7 = NSNumber;
  unint64_t v8 = [(FCFeedRange *)self bottom];
  unint64_t v9 = objc_msgSend(v7, "numberWithUnsignedLongLong:", objc_msgSend(v8, "order"));
  unint64_t v10 = [v3 stringWithFormat:@"%@ - %@", v6, v9];

  return v10;
}

- (FCFeedCursor)top
{
  return self->_top;
}

- (void)setTop:(id)a3
{
}

- (FCFeedCursor)bottom
{
  return self->_bottom;
}

- (void)setBottom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);
}

@end