@interface PKCacheScoreItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExpired;
- (BOOL)isNewerThan:(id)a3;
- (PKCacheScoreItem)init;
- (PKCacheScoreItem)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCacheScoreItem

- (PKCacheScoreItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKCacheScoreItem;
  v2 = [(PKCacheScoreItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    insertDate = v2->_insertDate;
    v2->_insertDate = (NSDate *)v3;
  }
  return v2;
}

- (BOOL)hasExpired
{
  v2 = [(NSDate *)self->_insertDate dateByAddingTimeInterval:10368000.0];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

- (BOOL)isNewerThan:(id)a3
{
  return [(NSDate *)self->_insertDate compare:*((void *)a3 + 1)] != NSOrderedAscending;
}

- (PKCacheScoreItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCacheScoreItem;
  v5 = [(PKCacheScoreItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    insertDate = v5->_insertDate;
    v5->_insertDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end