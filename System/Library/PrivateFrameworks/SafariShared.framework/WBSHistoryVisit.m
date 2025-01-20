@interface WBSHistoryVisit
+ (float)weightedVisitCountFromScore:(int)a3;
+ (id)synthesizedVisitWithHistoryItem:(id)a3 visitTime:(double)a4;
- (BOOL)didUserInteractWithPage;
- (BOOL)hasAttributes:(unint64_t)a3;
- (BOOL)isSynthesized;
- (BOOL)loadWasSuccessful;
- (BOOL)wasHTTPNonGet;
- (NSString)title;
- (WBSHistoryItem)item;
- (WBSHistoryVisit)endOfRedirectChain;
- (WBSHistoryVisit)initWithHistoryItem:(id)a3 serviceVisit:(id)a4;
- (WBSHistoryVisit)initWithHistoryItem:(id)a3 sqliteRow:(id)a4 baseColumnIndex:(unint64_t)a5;
- (WBSHistoryVisit)initWithHistoryItem:(id)a3 streamedVisit:(const _HistoryStreamedVisit *)a4;
- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4;
- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4 loadWasSuccesful:(BOOL)a5 wasHTTPNonGet:(BOOL)a6 origin:(int64_t)a7 attributes:(unint64_t)a8;
- (WBSHistoryVisit)redirectDestination;
- (WBSHistoryVisit)redirectSource;
- (double)_weight;
- (double)visitTime;
- (int64_t)databaseID;
- (int64_t)origin;
- (int64_t)redirectDestinationDatabaseID;
- (int64_t)redirectSourceDatabaseID;
- (unint64_t)attributes;
- (unint64_t)redirectSourceChainLength;
- (void)setAttributes:(unint64_t)a3;
- (void)setDatabaseID:(int64_t)a3;
- (void)setDidUserInteractWithPage:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setLoadSuccessful:(BOOL)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setRedirectDestination:(id)a3;
- (void)setRedirectDestinationDatabaseID:(int64_t)a3;
- (void)setRedirectSource:(id)a3;
- (void)setRedirectSourceDatabaseID:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBSHistoryVisit

+ (float)weightedVisitCountFromScore:(int)a3
{
  return WBSHistoryVisitWeightedVisitCountFromScore(a3);
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4 loadWasSuccesful:(BOOL)a5 wasHTTPNonGet:(BOOL)a6 origin:(int64_t)a7 attributes:(unint64_t)a8
{
  v18.receiver = self;
  v18.super_class = (Class)WBSHistoryVisit;
  v14 = [(WBSHistoryVisit *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_item, a3);
    v15->_visitTime = a4;
    v15->_loadSuccessful = a5;
    v15->_httpNonGet = a6;
    v15->_origin = a7;
    v15->_attributes = a8;
    v16 = v15;
  }

  return v15;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 visitTime:(double)a4
{
  return [(WBSHistoryVisit *)self initWithHistoryItem:a3 visitTime:1 loadWasSuccesful:0 wasHTTPNonGet:0 origin:0 attributes:a4];
}

+ (id)synthesizedVisitWithHistoryItem:(id)a3 visitTime:(double)a4
{
  v4 = (unsigned char *)[objc_alloc((Class)a1) initWithHistoryItem:a3 visitTime:a4];
  v4[10] = 1;
  return v4;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 sqliteRow:(id)a4 baseColumnIndex:(unint64_t)a5
{
  v17.receiver = self;
  v17.super_class = (Class)WBSHistoryVisit;
  v8 = [(WBSHistoryVisit *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, a3);
    v9->_databaseID = [a4 int64AtIndex:a5];
    [a4 doubleAtIndex:a5 + 2];
    v9->_visitTime = v10;
    uint64_t v11 = [a4 stringAtIndex:a5 + 3];
    title = v9->_title;
    v9->_title = (NSString *)v11;

    v9->_loadSuccessful = [a4 intAtIndex:a5 + 4] != 0;
    v9->_httpNonGet = [a4 intAtIndex:a5 + 5] != 0;
    v9->_synthesized = [a4 intAtIndex:a5 + 6] != 0;
    v9->_attributes = [a4 int64AtIndex:a5 + 11];
    v9->_redirectSourceDatabaseID = [a4 int64AtIndex:a5 + 7];
    v9->_redirectDestinationDatabaseID = [a4 int64AtIndex:a5 + 8];
    unint64_t v13 = [a4 int64AtIndex:a5 + 9];
    if (v13 >= 4)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[WBSHistoryVisit initWithHistoryItem:sqliteRow:baseColumnIndex:](v13, v14);
      }
      unint64_t v13 = 0;
    }
    v9->_origin = v13;
    v15 = v9;
  }

  return v9;
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 serviceVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSHistoryVisit;
  v8 = [(WBSHistoryVisit *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    v9->_databaseID = [v7 databaseID];
    [v7 visitTime];
    v9->_visitTime = v10;
    uint64_t v11 = [v7 title];
    uint64_t v12 = [v11 copy];
    title = v9->_title;
    v9->_title = (NSString *)v12;

    v9->_loadSuccessful = [v7 loadSuccessful];
    v9->_httpNonGet = [v7 httpNonGet];
    v9->_synthesized = [v7 synthesized];
    v9->_attributes = [v7 attributes];
    v9->_redirectSourceDatabaseID = [v7 redirectSource];
    v9->_redirectDestinationDatabaseID = [v7 redirectDestination];
    v9->_origin = [v7 origin];
    v14 = v9;
  }

  return v9;
}

- (void)setRedirectSource:(id)a3
{
  v5 = (WBSHistoryVisit *)a3;
  if (self->_redirectSource != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_redirectSource, a3);
    self->_redirectSourceDatabaseID = [(WBSHistoryVisit *)v6 databaseID];
    v5 = v6;
  }
}

- (void)setRedirectDestination:(id)a3
{
  v5 = (WBSHistoryVisit *)a3;
  if (self->_redirectDestination != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_redirectDestination, a3);
    self->_redirectDestinationDatabaseID = [(WBSHistoryVisit *)v6 databaseID];
    v5 = v6;
  }
}

- (void)setDatabaseID:(int64_t)a3
{
  if (self->_databaseID != a3)
  {
    self->_databaseID = a3;
    -[WBSHistoryVisit setRedirectDestinationDatabaseID:](self->_redirectSource, "setRedirectDestinationDatabaseID:");
    redirectDestination = self->_redirectDestination;
    [(WBSHistoryVisit *)redirectDestination setRedirectSourceDatabaseID:a3];
  }
}

- (void)setRedirectSourceDatabaseID:(int64_t)a3
{
  self->_redirectSourceDatabaseID = a3;
}

- (void)setRedirectDestinationDatabaseID:(int64_t)a3
{
  self->_redirectDestinationDatabaseID = a3;
}

- (WBSHistoryVisit)endOfRedirectChain
{
  for (i = self; ; i = (WBSHistoryVisit *)v4)
  {
    v3 = [(WBSHistoryVisit *)i redirectDestination];

    if (!v3) {
      break;
    }
    uint64_t v4 = [(WBSHistoryVisit *)i redirectDestination];
  }
  return i;
}

- (unint64_t)redirectSourceChainLength
{
  return [(WBSHistoryVisit *)self->_redirectSource redirectSourceChainLength] + 1;
}

- (WBSHistoryItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (WBSHistoryItem *)WeakRetained;
}

- (void)setAttributes:(unint64_t)a3
{
  if (self->_attributes != a3) {
    self->_attributes = a3;
  }
}

- (BOOL)hasAttributes:(unint64_t)a3
{
  return (a3 & ~self->_attributes) == 0;
}

- (double)_weight
{
  return WBHistoryVisitWeightForAttributesAndOrigin(self->_attributes, self->_origin);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (int64_t)redirectSourceDatabaseID
{
  return self->_redirectSourceDatabaseID;
}

- (int64_t)redirectDestinationDatabaseID
{
  return self->_redirectDestinationDatabaseID;
}

- (void)setItem:(id)a3
{
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (double)visitTime
{
  return self->_visitTime;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (BOOL)loadWasSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (BOOL)wasHTTPNonGet
{
  return self->_httpNonGet;
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (WBSHistoryVisit)redirectSource
{
  return self->_redirectSource;
}

- (WBSHistoryVisit)redirectDestination
{
  return self->_redirectDestination;
}

- (BOOL)didUserInteractWithPage
{
  return self->_didUserInteractWithPage;
}

- (void)setDidUserInteractWithPage:(BOOL)a3
{
  self->_didUserInteractWithPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectDestination, 0);
  objc_storeStrong((id *)&self->_redirectSource, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_item);
}

- (WBSHistoryVisit)initWithHistoryItem:(id)a3 streamedVisit:(const _HistoryStreamedVisit *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryVisit;
  id v7 = [(WBSHistoryVisit *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_item, v6);
    v8->_databaseID = a4->var1;
    v8->_visitTime = a4->var3;
    if (a4->var13)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:");
      title = v8->_title;
      v8->_title = (NSString *)v9;
    }
    else
    {
      title = v8->_title;
      v8->_title = 0;
    }

    v8->_loadSuccessful = a4->var4 != 0;
    v8->_httpNonGet = a4->var5 != 0;
    v8->_synthesized = a4->var6 != 0;
    v8->_attributes = a4->var12;
    *(_OWORD *)&v8->_redirectSourceDatabaseID = *(_OWORD *)&a4->var8;
    unint64_t var10 = a4->var10;
    if (var10 >= 4)
    {
      uint64_t v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WBSHistoryVisit initWithHistoryItem:sqliteRow:baseColumnIndex:](var10, v12);
      }
      unint64_t var10 = 0;
    }
    v8->_origin = var10;
    unint64_t v13 = v8;
  }

  return v8;
}

- (void)initWithHistoryItem:(uint64_t)a1 sqliteRow:(NSObject *)a2 baseColumnIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Encountered unexpected visit of origin %ld, treating as WBSHistoryVisitOriginNormal", (uint8_t *)&v2, 0xCu);
}

@end