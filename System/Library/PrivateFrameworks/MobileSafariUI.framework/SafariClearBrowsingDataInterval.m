@interface SafariClearBrowsingDataInterval
- (NSString)descriptionOfInterval;
- (SafariClearBrowsingDataInterval)init;
- (SafariClearBrowsingDataInterval)initWithDescription:(id)a3 dateAfterWhichDataShouldBeClearedBlock:(id)a4;
- (id)dateAfterWhichDataShouldBeClearedBlock;
- (id)description;
- (int64_t)clearBrowsingDataInterval;
- (void)setClearBrowsingDataInterval:(int64_t)a3;
- (void)setDateAfterWhichDataShouldBeClearedBlock:(id)a3;
@end

@implementation SafariClearBrowsingDataInterval

- (SafariClearBrowsingDataInterval)initWithDescription:(id)a3 dateAfterWhichDataShouldBeClearedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SafariClearBrowsingDataInterval;
  v8 = [(SafariClearBrowsingDataInterval *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    descriptionOfInterval = v8->_descriptionOfInterval;
    v8->_descriptionOfInterval = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    id dateAfterWhichDataShouldBeClearedBlock = v8->_dateAfterWhichDataShouldBeClearedBlock;
    v8->_id dateAfterWhichDataShouldBeClearedBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (SafariClearBrowsingDataInterval)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; _descriptionOfInterval = %@>",
    v5,
    self,
  id v6 = self->_descriptionOfInterval);

  return v6;
}

- (NSString)descriptionOfInterval
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)dateAfterWhichDataShouldBeClearedBlock
{
  return self->_dateAfterWhichDataShouldBeClearedBlock;
}

- (void)setDateAfterWhichDataShouldBeClearedBlock:(id)a3
{
}

- (int64_t)clearBrowsingDataInterval
{
  return self->_clearBrowsingDataInterval;
}

- (void)setClearBrowsingDataInterval:(int64_t)a3
{
  self->_clearBrowsingDataInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateAfterWhichDataShouldBeClearedBlock, 0);
  objc_storeStrong((id *)&self->_descriptionOfInterval, 0);
}

@end