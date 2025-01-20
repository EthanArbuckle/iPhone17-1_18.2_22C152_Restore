@interface WBSHistoryServiceVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)httpNonGet;
- (BOOL)loadSuccessful;
- (BOOL)synthesized;
- (NSString)title;
- (WBSHistoryServiceVisit)initWithCoder:(id)a3;
- (WBSHistoryServiceVisit)initWithSQLRow:(id)a3;
- (WBSHistoryServiceVisit)initWithVisit:(id)a3;
- (WBSHistoryServiceVisit)visitWithUpdatedID:(int64_t)a3 updatedItemID:(int64_t)a4;
- (double)visitTime;
- (id)_initWithDatabaseID:(int64_t)a3 serviceVisit:(id)a4;
- (int)score;
- (int64_t)attributes;
- (int64_t)itemID;
- (int64_t)origin;
- (int64_t)redirectDestination;
- (int64_t)redirectSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(int64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setRedirectDestination:(int64_t)a3;
- (void)setRedirectSource:(int64_t)a3;
- (void)setScore:(int)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBSHistoryServiceVisit

- (WBSHistoryServiceVisit)initWithVisit:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceVisit;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v14, sel_initWithDatabaseID_, [v4 databaseID]);
  if (v5)
  {
    v6 = [v4 item];
    v5->_itemID = [v6 databaseID];

    uint64_t v7 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    [v4 visitTime];
    v5->_visitTime = v9;
    v5->_loadSuccessful = [v4 loadWasSuccessful];
    v5->_httpNonGet = [v4 wasHTTPNonGet];
    v5->_synthesized = [v4 isSynthesized];
    v10 = [v4 redirectSource];
    v5->_redirectSource = [v10 databaseID];

    v11 = [v4 redirectDestination];
    v5->_redirectDestination = [v11 databaseID];

    v5->_origin = [v4 origin];
    v5->_attributes = [v4 attributes];
    v12 = v5;
  }

  return v5;
}

- (WBSHistoryServiceVisit)initWithSQLRow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceVisit;
  v5 = -[WBSHistoryServiceObject initWithDatabaseID:](&v11, sel_initWithDatabaseID_, [v4 int64AtIndex:0]);
  if (v5)
  {
    v5->_itemID = [v4 int64AtIndex:1];
    [v4 doubleAtIndex:2];
    v5->_visitTime = v6;
    uint64_t v7 = [v4 stringAtIndex:3];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v5->_loadSuccessful = [v4 BOOLAtIndex:4];
    v5->_httpNonGet = [v4 BOOLAtIndex:5];
    v5->_synthesized = [v4 BOOLAtIndex:6];
    v5->_redirectSource = [v4 int64AtIndex:7];
    v5->_redirectDestination = [v4 int64AtIndex:8];
    v5->_origin = [v4 int64AtIndex:9];
    v5->_attributes = [v4 int64AtIndex:11];
    v5->_score = [v4 intAtIndex:12];
    double v9 = v5;
  }

  return v5;
}

- (id)_initWithDatabaseID:(int64_t)a3 serviceVisit:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceVisit;
  uint64_t v7 = [(WBSHistoryServiceObject *)&v14 initWithDatabaseID:a3];
  if (v7)
  {
    v7->_itemID = [v6 itemID];
    v8 = [v6 title];
    uint64_t v9 = [v8 copy];
    title = v7->_title;
    v7->_title = (NSString *)v9;

    [v6 visitTime];
    v7->_visitTime = v11;
    v7->_loadSuccessful = [v6 loadSuccessful];
    v7->_httpNonGet = [v6 httpNonGet];
    v7->_synthesized = [v6 synthesized];
    v7->_redirectSource = [v6 redirectSource];
    v7->_redirectDestination = [v6 redirectDestination];
    v7->_origin = [v6 origin];
    v7->_attributes = [v6 attributes];
    v7->_score = [v6 score];
    v12 = v7;
  }

  return v7;
}

- (WBSHistoryServiceVisit)visitWithUpdatedID:(int64_t)a3 updatedItemID:(int64_t)a4
{
  v5 = [[WBSHistoryServiceVisit alloc] _initWithDatabaseID:a3 serviceVisit:self];
  v5[3] = a4;
  return (WBSHistoryServiceVisit *)v5;
}

- (WBSHistoryServiceVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSHistoryServiceVisit;
  v5 = [(WBSHistoryServiceObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_itemID = [v4 decodeInt64ForKey:@"itemID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    [v4 decodeDoubleForKey:@"visitTime"];
    v5->_visitTime = v8;
    v5->_loadSuccessful = [v4 decodeBoolForKey:@"loadSuccessful"];
    v5->_httpNonGet = [v4 decodeBoolForKey:@"httpNonGet"];
    v5->_synthesized = [v4 decodeBoolForKey:@"synthesized"];
    v5->_redirectSource = [v4 decodeInt64ForKey:@"redirectSource"];
    v5->_redirectDestination = [v4 decodeInt64ForKey:@"redirectDestination"];
    v5->_origin = [v4 decodeInt64ForKey:@"origin"];
    v5->_attributes = [v4 decodeInt64ForKey:@"attributes"];
    v5->_score = [v4 decodeInt64ForKey:@"score"];
    uint64_t v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)WBSHistoryServiceVisit;
  [(WBSHistoryServiceObject *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_itemID forKey:@"itemID"];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeDouble:@"visitTime" forKey:self->_visitTime];
  [v4 encodeBool:self->_loadSuccessful forKey:@"loadSuccessful"];
  [v4 encodeBool:self->_httpNonGet forKey:@"httpNonGet"];
  [v4 encodeBool:self->_synthesized forKey:@"synthesized"];
  [v4 encodeInt64:self->_redirectSource forKey:@"redirectSource"];
  [v4 encodeInt64:self->_redirectDestination forKey:@"redirectDestination"];
  [v4 encodeInt64:self->_origin forKey:@"origin"];
  [v4 encodeInt64:self->_attributes forKey:@"attributes"];
  [v4 encodeInt64:self->_score forKey:@"score"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)itemID
{
  return self->_itemID;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (double)visitTime
{
  return self->_visitTime;
}

- (BOOL)loadSuccessful
{
  return self->_loadSuccessful;
}

- (BOOL)httpNonGet
{
  return self->_httpNonGet;
}

- (BOOL)synthesized
{
  return self->_synthesized;
}

- (int64_t)redirectSource
{
  return self->_redirectSource;
}

- (void)setRedirectSource:(int64_t)a3
{
  self->_redirectSource = a3;
}

- (int64_t)redirectDestination
{
  return self->_redirectDestination;
}

- (void)setRedirectDestination:(int64_t)a3
{
  self->_redirectDestination = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(int64_t)a3
{
  self->_attributes = a3;
}

- (int)score
{
  return self->_score;
}

- (void)setScore:(int)a3
{
  self->_score = a3;
}

- (void).cxx_destruct
{
}

@end