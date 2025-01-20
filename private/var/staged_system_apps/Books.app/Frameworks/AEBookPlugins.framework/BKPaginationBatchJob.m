@interface BKPaginationBatchJob
+ (id)jobName;
- (BKFlowingBookLayoutConfiguration)configuration;
- (BKPaginationBatchJob)init;
- (CGSize)pageSize;
- (ContentStyle)style;
- (NSArray)historyEntities;
- (NSString)bookDatabaseKey;
- (NSString)lookupKey;
- (void)copyState:(id)a3;
- (void)setBookDatabaseKey:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setHistoryEntities:(id)a3;
- (void)setLookupKey:(id)a3;
- (void)setPageSize:(CGSize)a3;
- (void)setStyle:(id)a3;
@end

@implementation BKPaginationBatchJob

+ (id)jobName
{
  return @"Paginate-One";
}

- (BKPaginationBatchJob)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPaginationBatchJob;
  v2 = [(BKJob *)&v5 init];
  if (v2)
  {
    v3 = +[BKPaginationBatchJob jobName];
    [(BKJob *)v2 setName:v3];
  }
  return v2;
}

- (void)copyState:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKPaginationBatchJob;
  id v4 = a3;
  [(BKPaginationJob *)&v10 copyState:v4];
  objc_super v5 = objc_msgSend(v4, "bookDatabaseKey", v10.receiver, v10.super_class);
  [(BKPaginationBatchJob *)self setBookDatabaseKey:v5];

  v6 = [v4 lookupKey];
  [(BKPaginationBatchJob *)self setLookupKey:v6];

  v7 = [v4 style];
  [(BKPaginationBatchJob *)self setStyle:v7];

  [v4 pageSize];
  -[BKPaginationBatchJob setPageSize:](self, "setPageSize:");
  v8 = [v4 historyEntities];
  [(BKPaginationBatchJob *)self setHistoryEntities:v8];

  v9 = [v4 configuration];

  [(BKPaginationBatchJob *)self setConfiguration:v9];
}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (void)setBookDatabaseKey:(id)a3
{
}

- (NSString)lookupKey
{
  return self->_lookupKey;
}

- (void)setLookupKey:(id)a3
{
}

- (ContentStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (NSArray)historyEntities
{
  return self->_historyEntities;
}

- (void)setHistoryEntities:(id)a3
{
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_historyEntities, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);

  objc_storeStrong((id *)&self->_lookupKey, 0);
}

@end