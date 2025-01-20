@interface WLStatistics
+ (id)_statisticsWithContentType:(id)a3;
+ (id)aggregateContentType;
+ (id)fetchContentType;
- (BOOL)selectedForMigration;
- (NSDate)importEndDate;
- (NSDate)importStartDate;
- (NSString)contentType;
- (id)description;
- (id)fetchLogString;
- (int64_t)importBytesUsed;
- (unint64_t)downloadByteCount;
- (unint64_t)downloadBytesPerSecond;
- (unint64_t)downloadDuration;
- (unint64_t)importDuration;
- (unint64_t)importEndBytesFree;
- (unint64_t)importFailedRecordCount;
- (unint64_t)importRecordCount;
- (unint64_t)importStartBytesFree;
- (void)addToFetchByteCount:(unint64_t)a3;
- (void)incrementFetchFailedRequestCount;
- (void)incrementFetchRequestCount;
- (void)setDownloadByteCount:(unint64_t)a3;
- (void)setDownloadDuration:(unint64_t)a3;
- (void)setFetchDuration:(unint64_t)a3;
- (void)setFetchEndBytesFree:(unint64_t)a3;
- (void)setFetchStartBytesFree:(unint64_t)a3;
- (void)setImportEndBytesFree:(unint64_t)a3;
- (void)setImportEndDate:(id)a3;
- (void)setImportFailedRecordCount:(unint64_t)a3;
- (void)setImportRecordCount:(unint64_t)a3;
- (void)setImportStartBytesFree:(unint64_t)a3;
- (void)setImportStartDate:(id)a3;
- (void)setSelectedForMigration:(BOOL)a3;
@end

@implementation WLStatistics

+ (id)_statisticsWithContentType:(id)a3
{
  v3 = (NSString *)a3;
  v4 = objc_alloc_init(WLStatistics);
  contentType = v4->_contentType;
  v4->_contentType = v3;

  return v4;
}

- (unint64_t)downloadBytesPerSecond
{
  unint64_t result = [(WLStatistics *)self downloadDuration];
  if (result)
  {
    unint64_t downloadByteCount = self->_downloadByteCount;
    return (unint64_t)(double)(downloadByteCount / [(WLStatistics *)self downloadDuration]);
  }
  return result;
}

- (unint64_t)importDuration
{
  [(NSDate *)self->_importEndDate timeIntervalSinceDate:self->_importStartDate];
  return vcvtpd_u64_f64(v2);
}

- (int64_t)importBytesUsed
{
  unint64_t importStartBytesFree = self->_importStartBytesFree;
  unint64_t importEndBytesFree = self->_importEndBytesFree;
  BOOL v4 = importStartBytesFree >= importEndBytesFree;
  int64_t v5 = importStartBytesFree - importEndBytesFree;
  if (v4) {
    return v5;
  }
  else {
    return -1;
  }
}

- (id)description
{
  v14 = NSString;
  contentType = self->_contentType;
  BOOL v4 = [NSNumber numberWithBool:self->_selectedForMigration];
  int64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_downloadByteCount];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WLStatistics downloadDuration](self, "downloadDuration"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[WLStatistics downloadBytesPerSecond](self, "downloadBytesPerSecond"));
  v8 = [NSNumber numberWithUnsignedInteger:self->_importRecordCount];
  v9 = [NSNumber numberWithUnsignedInteger:self->_importFailedRecordCount];
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WLStatistics importDuration](self, "importDuration"));
  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[WLStatistics importBytesUsed](self, "importBytesUsed"));
  objc_msgSend(v14, "stringWithFormat:", @"%@ : selected %@; download bytes %@, time %@, B/s %@; records imported %@, failed %@, time %@, space used %@",
    contentType,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  v12 = v11);

  return v12;
}

+ (id)aggregateContentType
{
  return @"<aggregate>";
}

+ (id)fetchContentType
{
  return @"<fetch>";
}

- (void)setFetchDuration:(unint64_t)a3
{
  self->_downloadDuration = a3;
}

- (void)setFetchStartBytesFree:(unint64_t)a3
{
  self->_unint64_t importStartBytesFree = a3;
}

- (void)setFetchEndBytesFree:(unint64_t)a3
{
  self->_unint64_t importEndBytesFree = a3;
}

- (void)addToFetchByteCount:(unint64_t)a3
{
  self->_downloadByteCount += a3;
}

- (void)incrementFetchRequestCount
{
}

- (void)incrementFetchFailedRequestCount
{
}

- (id)fetchLogString
{
  v3 = NSString;
  contentType = self->_contentType;
  int64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_downloadByteCount];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WLStatistics downloadDuration](self, "downloadDuration"));
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[WLStatistics downloadBytesPerSecond](self, "downloadBytesPerSecond"));
  v8 = [NSNumber numberWithUnsignedInteger:self->_importRecordCount];
  v9 = [NSNumber numberWithUnsignedInteger:self->_importFailedRecordCount];
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[WLStatistics importBytesUsed](self, "importBytesUsed"));
  objc_msgSend(v3, "stringWithFormat:", @"%@ : fetch bytes %@, time %@, B/s %@; requests succeeded %@, failed %@, space used %@",
    contentType,
    v5,
    v6,
    v7,
    v8,
    v9,
  v11 = v10);

  return v11;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (BOOL)selectedForMigration
{
  return self->_selectedForMigration;
}

- (void)setSelectedForMigration:(BOOL)a3
{
  self->_selectedForMigration = a3;
}

- (unint64_t)downloadDuration
{
  return self->_downloadDuration;
}

- (void)setDownloadDuration:(unint64_t)a3
{
  self->_downloadDuration = a3;
}

- (unint64_t)downloadByteCount
{
  return self->_downloadByteCount;
}

- (void)setDownloadByteCount:(unint64_t)a3
{
  self->_unint64_t downloadByteCount = a3;
}

- (NSDate)importStartDate
{
  return self->_importStartDate;
}

- (void)setImportStartDate:(id)a3
{
}

- (NSDate)importEndDate
{
  return self->_importEndDate;
}

- (void)setImportEndDate:(id)a3
{
}

- (unint64_t)importStartBytesFree
{
  return self->_importStartBytesFree;
}

- (void)setImportStartBytesFree:(unint64_t)a3
{
  self->_unint64_t importStartBytesFree = a3;
}

- (unint64_t)importEndBytesFree
{
  return self->_importEndBytesFree;
}

- (void)setImportEndBytesFree:(unint64_t)a3
{
  self->_unint64_t importEndBytesFree = a3;
}

- (unint64_t)importRecordCount
{
  return self->_importRecordCount;
}

- (void)setImportRecordCount:(unint64_t)a3
{
  self->_importRecordCount = a3;
}

- (unint64_t)importFailedRecordCount
{
  return self->_importFailedRecordCount;
}

- (void)setImportFailedRecordCount:(unint64_t)a3
{
  self->_importFailedRecordCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importEndDate, 0);
  objc_storeStrong((id *)&self->_importStartDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end