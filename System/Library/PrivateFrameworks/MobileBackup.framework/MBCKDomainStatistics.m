@interface MBCKDomainStatistics
- (MBCKDomainStatistics)initWithDomainName:(id)a3;
- (MBCKDomainStatistics)initWithSnapshotName:(id)a3;
- (NSDictionary)statistics;
- (NSString)domainName;
- (NSString)snapshotName;
- (id)description;
- (void)addValue:(id)a3 toKey:(id)a4;
- (void)analyzeChurnWithFileCount:(unint64_t)a3 withTotalFileSize:(unint64_t)a4;
- (void)updateWithFile:(id)a3;
@end

@implementation MBCKDomainStatistics

- (MBCKDomainStatistics)initWithDomainName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBCKDomainStatistics;
  v6 = [(MBCKDomainStatistics *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domainName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    statistics = v7->_statistics;
    v7->_statistics = v8;
  }
  return v7;
}

- (MBCKDomainStatistics)initWithSnapshotName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBCKDomainStatistics;
  v6 = [(MBCKDomainStatistics *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_snapshotName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    statistics = v7->_statistics;
    v7->_statistics = v8;
  }
  return v7;
}

- (void)addValue:(id)a3 toKey:(id)a4
{
  statistics = self->_statistics;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)statistics objectForKeyedSubscript:v7];
  if (!v9) {
    v9 = &off_10043A080;
  }
  id v13 = v9;
  v10 = (char *)[v9 unsignedLongLongValue];
  id v11 = [v8 unsignedLongLongValue];

  v12 = +[NSNumber numberWithUnsignedLongLong:&v10[(void)v11]];
  [(NSMutableDictionary *)self->_statistics setObject:v12 forKeyedSubscript:v7];
}

- (void)updateWithFile:(id)a3
{
  id v4 = a3;
  if ([v4 deleted])
  {
    [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"DeletionMarkerCount"];
  }
  else
  {
    if ([v4 isDirectory]) {
      [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"DirectoryCount"];
    }
    if ([v4 isRegularFile])
    {
      [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"FileCount"];
      if ([v4 hasAbsolutePath])
      {
        if ([v4 isSQLiteFile])
        {
          [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"SQLiteFileCount"];
          id v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 size]);
          [(MBCKDomainStatistics *)self addValue:v5 toKey:@"TotalSQLiteFileSize"];
        }
        int v15 = 0;
        id v6 = [v4 absolutePath];
        int v7 = fsctl((const char *)[v6 fileSystemRepresentation], 0x40044A09uLL, &v15, 0);
        int v8 = v15;

        if (!v7 && v8) {
          [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"SparseFileCount"];
        }
      }
    }
    if ([v4 isSymbolicLink]) {
      [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:@"SymLinkCount"];
    }
    unsigned __int8 v9 = [v4 protectionClass] + 1;
    if (v9 <= 8u) {
      [(MBCKDomainStatistics *)self addValue:&off_10043A098 toKey:off_100416388[(char)v9]];
    }
    if ([v4 size])
    {
      v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 size]);
      [(MBCKDomainStatistics *)self addValue:v10 toKey:@"TotalFileSize"];
    }
    if ([v4 resourcesSize])
    {
      id v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 resourcesSize]);
      [(MBCKDomainStatistics *)self addValue:v11 toKey:@"TotalResourceSize"];
    }
  }
  v12 = [v4 attributeDataWithError:0];
  id v13 = v12;
  if (v12)
  {
    v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 length]);
    [(MBCKDomainStatistics *)self addValue:v14 toKey:@"TotalAttributeSize"];
  }
}

- (void)analyzeChurnWithFileCount:(unint64_t)a3 withTotalFileSize:(unint64_t)a4
{
  id v19 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:@"DirectoryCount"];
  int v7 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:@"FileCount"];
  int v8 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:@"SymLinkCount"];
  unsigned __int8 v9 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:@"DeletionMarkerCount"];
  v10 = (char *)[v19 unsignedLongLongValue];
  id v11 = &v10[(void)[v7 unsignedLongLongValue]];
  id v12 = [v8 unsignedLongLongValue];
  double v13 = (double)(unint64_t)&v11[(unint64_t)[v9 unsignedLongLongValue] + (void)v12]
      / (double)a3
      * 100.0;
  v14 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:@"TotalFileSize", v13];
  double v15 = (double)(unint64_t)[v14 unsignedLongLongValue];

  double v16 = v15 / (double)a4 * 100.0;
  v17 = +[NSNumber numberWithDouble:v13];
  [(NSMutableDictionary *)self->_statistics setObject:v17 forKeyedSubscript:@"RecordChurnPct"];

  v18 = +[NSNumber numberWithDouble:v16];
  [(NSMutableDictionary *)self->_statistics setObject:v18 forKeyedSubscript:@"ContentChurnPct"];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  domainName = self->_domainName;
  if (!domainName) {
    domainName = self->_snapshotName;
  }
  id v5 = [v3 initWithFormat:@"%@ %@", domainName, self->_statistics];
  return v5;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)snapshotName
{
  return self->_snapshotName;
}

- (NSDictionary)statistics
{
  return &self->_statistics->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_snapshotName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
}

@end