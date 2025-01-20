@interface WBSHistoryTagsPredicate
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)identifiers;
- (WBSHistoryTagsPredicate)initWithCoder:(id)a3;
- (WBSHistoryTagsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 tagType:(unint64_t)a5;
- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6;
- (int64_t)sortOrder;
- (unint64_t)limit;
- (unint64_t)minimumItemCount;
- (unint64_t)tagType;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setMinimumItemCount:(unint64_t)a3;
- (void)setSortOrder:(int64_t)a3;
@end

@implementation WBSHistoryTagsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryTagsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 tagType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryTagsPredicate;
  v11 = [(WBSHistoryTagsPredicate *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_storeStrong((id *)&v12->_endDate, a4);
    v12->_tagType = a5;
    v13 = v12;
  }

  return v12;
}

- (WBSHistoryTagsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSHistoryTagsPredicate;
  v5 = [(WBSHistoryTagsPredicate *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_tagType = [v4 decodeIntegerForKey:@"tagType"];
    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
    v5->_minimumItemCount = [v4 decodeIntegerForKey:@"minimumItemCount"];
    unint64_t v10 = [v4 decodeIntegerForKey:@"sortOrder"];
    if (v10 >= 3) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = v10;
    }
    v5->_sortOrder = v11;
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    objc_super v15 = [v4 decodeObjectOfClasses:v14 forKey:@"identifiers"];

    if (v15) {
      objc_storeStrong((id *)&v5->_identifiers, v15);
    }
    v16 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_tagType forKey:@"tagType"];
  [v5 encodeInteger:self->_limit forKey:@"limit"];
  [v5 encodeInteger:self->_minimumItemCount forKey:@"minimumItemCount"];
  [v5 encodeInteger:self->_sortOrder forKey:@"sortOrder"];
  identifiers = self->_identifiers;
  if (identifiers) {
    [v5 encodeObject:identifiers forKey:@"identifiers"];
  }
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)[@"SELECT * FROM history_tags" mutableCopy];
  [v9 appendString:@" WHERE type & ? AND modification_timestamp > ? AND modification_timestamp < ? AND item_count >= ?"];
  if ([(NSSet *)self->_identifiers count])
  {
    objc_msgSend(v9, "appendString:", @" AND identifier IN (");
    unint64_t v10 = objc_msgSend(@"?", "safari_stringByRepeatingWithCount:joinedByString:", -[NSSet count](self->_identifiers, "count"), @",");
    [v9 appendString:v10];

    [v9 appendString:@""]);
  }
  int64_t sortOrder = self->_sortOrder;
  if (sortOrder == 1)
  {
    v12 = @" ORDER BY modification_timestamp DESC";
  }
  else
  {
    if (sortOrder != 2) {
      goto LABEL_8;
    }
    v12 = @" ORDER BY safari_history_tag_compute_frecency_score(item_count, modification_timestamp) DESC";
  }
  [v9 appendString:v12];
LABEL_8:
  if (self->_limit) {
    [v9 appendString:@" LIMIT ?"];
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v8 query:v9];
  [v13 bindInt64:self->_tagType atParameterIndex:1];
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  objc_msgSend(v13, "bindDouble:atParameterIndex:", 2);
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  objc_msgSend(v13, "bindDouble:atParameterIndex:", 3);
  [v13 bindInt64:self->_minimumItemCount atParameterIndex:4];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v14 = self->_identifiers;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    uint64_t v18 = 4;
    do
    {
      for (uint64_t i = 0; i != v16; objc_msgSend(v13, "bindString:atParameterIndex:", v20, i + v18, (void)v25))
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i++);
      }
      uint64_t v16 = [(NSSet *)v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      v18 += i;
    }
    while (v16);
    uint64_t v21 = v18 + 1;
  }
  else
  {
    uint64_t v21 = 5;
  }

  unint64_t limit = self->_limit;
  if (limit) {
    [v13 bindInt64:limit atParameterIndex:v21];
  }
  if (!a6 || v13)
  {
    id v23 = v13;
  }
  else
  {
    *a6 = [v8 lastErrorWithMethodName:"-[WBSHistoryTagsPredicate statementForDatabase:cache:fetchOptions:error:]"];
  }

  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)tagType
{
  return self->_tagType;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_unint64_t limit = a3;
}

- (unint64_t)minimumItemCount
{
  return self->_minimumItemCount;
}

- (void)setMinimumItemCount:(unint64_t)a3
{
  self->_minimumItemCount = a3;
}

- (int64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int64_t)a3
{
  self->_int64_t sortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end