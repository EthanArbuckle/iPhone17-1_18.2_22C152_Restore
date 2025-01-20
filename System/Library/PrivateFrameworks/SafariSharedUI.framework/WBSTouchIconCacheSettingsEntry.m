@interface WBSTouchIconCacheSettingsEntry
+ (id)entryWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12;
- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIconInCache;
- (BOOL)lastRequestWasInUserLoadedWebpage;
- (BOOL)requestDidSucceed;
- (NSDate)lastRequestDate;
- (NSString)UUIDString;
- (NSString)description;
- (NSString)host;
- (WBSTouchIconCacheSettingsEntry)entryWithDatabaseID:(int64_t)a3;
- (WBSTouchIconCacheSettingsEntry)entryWithTransparencyAnalysisResult:(int64_t)a3;
- (WBSTouchIconCacheSettingsEntry)init;
- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3;
- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12;
- (WBSTouchIconCacheSettingsEntry)initWithSQLiteRow:(id)a3;
- (id)entryByAddingRequestInUserLoadedWebPage:(BOOL)a3 isIconInCache:(BOOL)a4 requestDidSucceed:(BOOL)a5 lastResponseStatusCode:(int64_t)a6 transparencyAnalysisResult:(int64_t)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9;
- (int64_t)databaseID;
- (int64_t)lastResponseStatusCode;
- (int64_t)requestCount;
- (int64_t)transparencyAnalysisResult;
- (unint64_t)downloadStatusFlags;
- (unint64_t)hash;
@end

@implementation WBSTouchIconCacheSettingsEntry

- (int64_t)lastResponseStatusCode
{
  return self->_lastResponseStatusCode;
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (BOOL)isIconInCache
{
  return self->_iconInCache;
}

- (int64_t)transparencyAnalysisResult
{
  return self->_transparencyAnalysisResult;
}

- (WBSTouchIconCacheSettingsEntry)initWithSQLiteRow:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringAtIndex:1];
  v6 = [(WBSTouchIconCacheSettingsEntry *)self initWithHost:v5];
  if (v6)
  {
    v6->_databaseID = [v4 int64AtIndex:0];
    v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 doubleAtIndex:2];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    lastRequestDate = v6->_lastRequestDate;
    v6->_lastRequestDate = (NSDate *)v8;

    v6->_lastRequestWasInUserLoadedWebpage = [v4 BOOLAtIndex:3];
    v6->_requestCount = [v4 int64AtIndex:4];
    v6->_iconInCache = [v4 BOOLAtIndex:5];
    char v10 = [v4 int64AtIndex:6];
    v6->_requestDidSucceed = v10 & 1;
    v6->_higherPriorityIconDownloadFailedDueToNetworkError = (v10 & 2) != 0;
    v6->_transparencyAnalysisResult = [v4 int64AtIndex:8];
    uint64_t v11 = [v4 stringAtIndex:9];
    UUIDString = v6->_UUIDString;
    v6->_UUIDString = (NSString *)v11;

    v6->_lastResponseStatusCode = [v4 int64AtIndex:10];
    v13 = v6;
  }

  return v6;
}

- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTouchIconCacheSettingsEntry;
  v5 = [(WBSTouchIconCacheSettingsEntry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    host = v5->_host;
    v5->_host = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (NSString)host
{
  return self->_host;
}

+ (id)entryWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12
{
  BOOL v23 = a8;
  BOOL v12 = a7;
  BOOL v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a12;
  LOBYTE(v22) = a11;
  v20 = (void *)[objc_alloc((Class)a1) initWithHost:v17 lastRequestDate:v18 lastRequestWasInUserLoadedWebpage:v14 requestCount:a6 iconInCache:v12 requestDidSucceed:v23 lastResponseStatusCode:a9 transparencyAnalysisResult:a10 higherPriorityIconDownloadFailedDueToNetworkError:v22 UUIDString:v19];

  return v20;
}

- (WBSTouchIconCacheSettingsEntry)init
{
  return [(WBSTouchIconCacheSettingsEntry *)self initWithHost:&stru_1F031A860];
}

- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12
{
  id v18 = a3;
  id v26 = a4;
  id v19 = a12;
  v20 = [(WBSTouchIconCacheSettingsEntry *)self initWithHost:v18];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_lastRequestDate, a4);
    v21->_lastRequestWasInUserLoadedWebpage = a5;
    v21->_iconInCache = a7;
    v21->_requestDidSucceed = a8;
    v21->_requestCount = a6;
    v21->_transparencyAnalysisResult = a10;
    v21->_higherPriorityIconDownloadFailedDueToNetworkError = a11;
    uint64_t v22 = [v19 copy];
    UUIDString = v21->_UUIDString;
    v21->_UUIDString = (NSString *)v22;

    v21->_lastResponseStatusCode = a9;
    v24 = v21;
  }

  return v21;
}

- (WBSTouchIconCacheSettingsEntry)entryWithDatabaseID:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_higherPriorityIconDownloadFailedDueToNetworkError;
  uint64_t v6 = (void *)[v5 initWithHost:self->_host lastRequestDate:self->_lastRequestDate lastRequestWasInUserLoadedWebpage:self->_lastRequestWasInUserLoadedWebpage requestCount:self->_requestCount iconInCache:self->_iconInCache requestDidSucceed:self->_requestDidSucceed lastResponseStatusCode:self->_lastResponseStatusCode transparencyAnalysisResult:self->_transparencyAnalysisResult higherPriorityIconDownloadFailedDueToNetworkError:v8 UUIDString:self->_UUIDString];
  v6[2] = a3;
  return (WBSTouchIconCacheSettingsEntry *)v6;
}

- (unint64_t)downloadStatusFlags
{
  if (self->_higherPriorityIconDownloadFailedDueToNetworkError) {
    return self->_requestDidSucceed | 2;
  }
  else {
    return self->_requestDidSucceed;
  }
}

- (id)entryByAddingRequestInUserLoadedWebPage:(BOOL)a3 isIconInCache:(BOOL)a4 requestDidSucceed:(BOOL)a5 lastResponseStatusCode:(int64_t)a6 transparencyAnalysisResult:(int64_t)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9
{
  BOOL v22 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a9;
  id v16 = objc_alloc((Class)objc_opt_class());
  host = self->_host;
  id v18 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(v21) = a8;
  id v19 = (void *)[v16 initWithHost:host lastRequestDate:v18 lastRequestWasInUserLoadedWebpage:v13 requestCount:self->_requestCount + 1 iconInCache:v12 requestDidSucceed:v22 lastResponseStatusCode:a6 transparencyAnalysisResult:a7 higherPriorityIconDownloadFailedDueToNetworkError:v21 UUIDString:v15];

  v19[2] = self->_databaseID;
  return v19;
}

- (WBSTouchIconCacheSettingsEntry)entryWithTransparencyAnalysisResult:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_higherPriorityIconDownloadFailedDueToNetworkError;
  uint64_t v6 = (void *)[v5 initWithHost:self->_host lastRequestDate:self->_lastRequestDate lastRequestWasInUserLoadedWebpage:self->_lastRequestWasInUserLoadedWebpage requestCount:self->_requestCount iconInCache:self->_iconInCache requestDidSucceed:self->_requestDidSucceed lastResponseStatusCode:self->_lastResponseStatusCode transparencyAnalysisResult:a3 higherPriorityIconDownloadFailedDueToNetworkError:v8 UUIDString:self->_UUIDString];
  v6[2] = self->_databaseID;
  return (WBSTouchIconCacheSettingsEntry *)v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_host hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 UUIDString];
    v7 = (void *)v6;
    if (!(v6 | (uint64_t)self->_UUIDString) || (objc_msgSend((id)v6, "isEqualToString:"))
      && (int64_t databaseID = self->_databaseID, databaseID == [v5 databaseID]))
    {
      host = self->_host;
      objc_super v10 = [v5 host];
      if ([(NSString *)host isEqualToString:v10])
      {
        lastRequestDate = self->_lastRequestDate;
        BOOL v12 = [v5 lastRequestDate];
        if ([(NSDate *)lastRequestDate isEqualToDate:v12]
          && (int lastRequestWasInUserLoadedWebpage = self->_lastRequestWasInUserLoadedWebpage,
              lastRequestWasInUserLoadedWebpage == [v5 lastRequestWasInUserLoadedWebpage])
          && (int64_t requestCount = self->_requestCount,
              requestCount == [(WBSTouchIconCacheSettingsEntry *)self requestCount])
          && (int iconInCache = self->_iconInCache, iconInCache == [v5 isIconInCache])
          && (unint64_t v16 = [(WBSTouchIconCacheSettingsEntry *)self downloadStatusFlags],
              v16 == [v5 downloadStatusFlags])
          && (int64_t transparencyAnalysisResult = self->_transparencyAnalysisResult,
              transparencyAnalysisResult == [v5 transparencyAnalysisResult]))
        {
          int64_t lastResponseStatusCode = self->_lastResponseStatusCode;
          BOOL v19 = lastResponseStatusCode == [v5 lastResponseStatusCode];
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; Host = \"%@\"; Last request date = %@; User loaded page = %d; Request count = %zd; Icon in cache = %d; Request did succeed = %d; Download status code = %zd; Higher priority icon download failed = %d; UUID = %@>",
                       objc_opt_class(),
                       self,
                       self->_host,
                       self->_lastRequestDate,
                       self->_lastRequestWasInUserLoadedWebpage,
                       self->_requestCount,
                       self->_iconInCache,
                       self->_requestDidSucceed,
                       self->_lastResponseStatusCode,
                       self->_higherPriorityIconDownloadFailedDueToNetworkError,
                       self->_UUIDString);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (BOOL)lastRequestWasInUserLoadedWebpage
{
  return self->_lastRequestWasInUserLoadedWebpage;
}

- (int64_t)requestCount
{
  return self->_requestCount;
}

- (BOOL)requestDidSucceed
{
  return self->_requestDidSucceed;
}

- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError
{
  return self->_higherPriorityIconDownloadFailedDueToNetworkError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end