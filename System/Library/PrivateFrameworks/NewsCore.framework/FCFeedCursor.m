@interface FCFeedCursor
+ (BOOL)supportsSecureCoding;
+ (id)cursorForBottomOfFeed;
+ (id)cursorForCurrentDate;
+ (id)cursorForDate:(id)a3;
+ (id)cursorForOrder:(unint64_t)a3;
+ (id)cursorForTimeIntervalBeforeNow:(double)a3;
+ (id)cursorForTopOfFeed;
- (BOOL)hasReachedCursor:(id)a3;
- (BOOL)isBottomOfFeed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCursor:(id)a3;
- (BOOL)isTopOfFeed;
- (FCFeedCursor)initWithCoder:(id)a3;
- (NSDate)date;
- (id)bottommostCursor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)topmostCursor:(id)a3;
- (int64_t)compareToCursor:(id)a3;
- (unint64_t)hash;
- (unint64_t)order;
- (void)encodeWithCoder:(id)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation FCFeedCursor

+ (id)cursorForOrder:(unint64_t)a3
{
  v4 = objc_alloc_init(FCFeedCursor);
  [(FCFeedCursor *)v4 setOrder:a3];
  return v4;
}

+ (id)cursorForDate:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "fc_millisecondTimeIntervalSince1970");
  return (id)[a1 cursorForOrder:v4];
}

+ (id)cursorForCurrentDate
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [a1 cursorForDate:v3];

  return v4;
}

+ (id)cursorForTimeIntervalBeforeNow:(double)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = objc_msgSend(v5, "fc_dateBySubtractingTimeInterval:", a3);
  v7 = [a1 cursorForDate:v6];

  return v7;
}

+ (id)cursorForBottomOfFeed
{
  return (id)[a1 cursorForOrder:0];
}

+ (id)cursorForTopOfFeed
{
  return (id)[a1 cursorForOrder:-1];
}

- (FCFeedCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(FCFeedCursor);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"order"];

  -[FCFeedCursor setOrder:](v5, "setOrder:", [v6 unsignedLongLongValue]);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"order"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(FCFeedCursor);
  [(FCFeedCursor *)v4 setOrder:[(FCFeedCursor *)self order]];
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

  unint64_t v7 = [(FCFeedCursor *)self order];
  LOBYTE(v7) = v7 == [v6 order];

  return v7;
}

- (BOOL)isEqualToCursor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FCFeedCursor *)self order];
  uint64_t v6 = [v4 order];

  return v5 == v6;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compareToCursor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FCFeedCursor *)self order];
  unint64_t v6 = [v4 order];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (BOOL)isTopOfFeed
{
  return [(FCFeedCursor *)self order] == -1;
}

- (BOOL)isBottomOfFeed
{
  return [(FCFeedCursor *)self order] == 0;
}

- (NSDate)date
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  unint64_t v3 = [(FCFeedCursor *)self order];
  return (NSDate *)objc_msgSend(v2, "fc_dateWithMillisecondTimeIntervalSince1970:", v3);
}

- (BOOL)hasReachedCursor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    unint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"other cursor must be non-nil"];
    int v8 = 136315906;
    v9 = "-[FCFeedCursor hasReachedCursor:]";
    __int16 v10 = 2080;
    v11 = "FCFeedCursor.m";
    __int16 v12 = 1024;
    int v13 = 116;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
  }
  BOOL v5 = [(FCFeedCursor *)self compareToCursor:v4] != 1;

  return v5;
}

- (id)topmostCursor:(id)a3
{
  id v4 = (FCFeedCursor *)a3;
  if (v4 && [(FCFeedCursor *)self compareToCursor:v4] != 1) {
    self = v4;
  }
  BOOL v5 = self;

  return v5;
}

- (id)bottommostCursor:(id)a3
{
  id v4 = (FCFeedCursor *)a3;
  if (v4 && [(FCFeedCursor *)self compareToCursor:v4] == 1) {
    self = v4;
  }
  BOOL v5 = self;

  return v5;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[FCFeedCursor order](self, "order"));
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

@end