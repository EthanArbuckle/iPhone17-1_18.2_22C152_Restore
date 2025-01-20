@interface WBSHistoryServiceItem
+ (BOOL)supportsSecureCoding;
- (NSString)url;
- (WBSHistoryServiceItem)initWithCoder:(id)a3;
- (WBSHistoryServiceItem)initWithItem:(id)a3;
- (WBSHistoryServiceItem)initWithSQLRow:(id)a3;
- (int64_t)statusCode;
- (int64_t)visitCount;
- (void)encodeWithCoder:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setVisitCount:(int64_t)a3;
@end

@implementation WBSHistoryServiceItem

- (WBSHistoryServiceItem)initWithItem:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceItem;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v11, sel_initWithDatabaseID_, [v4 databaseID]);
  if (v5)
  {
    v6 = [v4 urlString];
    uint64_t v7 = [v6 copy];
    url = v5->_url;
    v5->_url = (NSString *)v7;

    v5->_statusCode = [v4 statusCode];
    v9 = v5;
  }

  return v5;
}

- (WBSHistoryServiceItem)initWithSQLRow:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceItem;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v10, sel_initWithDatabaseID_, [v4 int64AtIndex:0]);
  if (v5)
  {
    uint64_t v6 = [v4 stringAtIndex:1];
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_visitCount = [v4 int64AtIndex:3];
    v5->_statusCode = [v4 int64AtIndex:9];
    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceItem;
  v5 = [(WBSHistoryServiceObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_visitCount = [v4 decodeInt64ForKey:@"visitCount"];
    v5->_statusCode = [v4 decodeInt64ForKey:@"statusCode"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WBSHistoryServiceItem;
  [(WBSHistoryServiceObject *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_url forKey:@"url"];
  [v4 encodeInt64:self->_visitCount forKey:@"visitCount"];
  [v4 encodeInt64:self->_statusCode forKey:@"statusCode"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(int64_t)a3
{
  self->_visitCount = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end