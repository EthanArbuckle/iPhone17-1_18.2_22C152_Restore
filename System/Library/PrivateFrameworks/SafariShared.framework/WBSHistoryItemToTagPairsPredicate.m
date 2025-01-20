@interface WBSHistoryItemToTagPairsPredicate
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (WBSHistoryItemToTagPairsPredicate)initWithCoder:(id)a3;
- (WBSHistoryItemToTagPairsPredicate)initWithStartDate:(id)a3 endDate:(id)a4;
- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryItemToTagPairsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryItemToTagPairsPredicate)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryItemToTagPairsPredicate;
  v9 = [(WBSHistoryItemToTagPairsPredicate *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSHistoryItemToTagPairsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryItemToTagPairsPredicate;
  v5 = [(WBSHistoryItemToTagPairsPredicate *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v8 query:@"SELECT * FROM history_items_to_tags WHERE timestamp > ? AND timestamp < ?"];
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "bindDouble:atParameterIndex:", 1);
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "bindDouble:atParameterIndex:", 2);
  if (!a6 || v9)
  {
    id v10 = v9;
  }
  else
  {
    [v8 lastErrorWithMethodName:"-[WBSHistoryItemToTagPairsPredicate statementForDatabase:cache:fetchOptions:error:]"];
    id v10 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end