@interface MBCacheRefreshSummary
- (BOOL)journalReplaySucceeded;
- (MBCacheRefreshSummary)initWithDictionaryRepresentation:(id)a3;
- (NSMutableOrderedSet)verificationFailures;
- (id)description;
- (id)dictionaryRepresentation;
- (id)verificationFailureStrings;
- (unint64_t)cacheOnlySnapshotCount;
- (unint64_t)cachedSnapshotCount;
- (unint64_t)downloadedSnapshotCount;
- (unint64_t)downloadedSnapshotVerificationFailureCount;
- (unint64_t)journalActionCount;
- (unint64_t)journalVerificationErrorCount;
- (unint64_t)serverSnapshotCount;
- (void)setCacheOnlySnapshotCount:(unint64_t)a3;
- (void)setCachedSnapshotCount:(unint64_t)a3;
- (void)setDownloadedSnapshotCount:(unint64_t)a3;
- (void)setDownloadedSnapshotVerificationFailureCount:(unint64_t)a3;
- (void)setJournalActionCount:(unint64_t)a3;
- (void)setJournalReplaySucceeded:(BOOL)a3;
- (void)setJournalVerificationErrorCount:(unint64_t)a3;
- (void)setServerSnapshotCount:(unint64_t)a3;
- (void)setVerificationFailures:(id)a3;
- (void)trackVerificationFailureForSnapshot:(id)a3 manifestID:(id)a4 domain:(id)a5 serverChecksum:(unint64_t)a6 localChecksum:(unint64_t)a7 localFileCount:(unint64_t)a8;
@end

@implementation MBCacheRefreshSummary

- (MBCacheRefreshSummary)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MBCacheRefreshSummary;
  v5 = [(MBCacheRefreshSummary *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cacheSnapshotCount"];
    -[MBCacheRefreshSummary setCachedSnapshotCount:](v5, "setCachedSnapshotCount:", [v6 unsignedLongLongValue]);

    v7 = [v4 objectForKeyedSubscript:@"serverSnapshotCount"];
    -[MBCacheRefreshSummary setServerSnapshotCount:](v5, "setServerSnapshotCount:", [v7 BOOLValue]);

    v8 = [v4 objectForKeyedSubscript:@"journalActionCount"];
    -[MBCacheRefreshSummary setJournalActionCount:](v5, "setJournalActionCount:", [v8 unsignedLongLongValue]);

    v9 = [v4 objectForKeyedSubscript:@"journalReplaySucceeded"];
    -[MBCacheRefreshSummary setJournalReplaySucceeded:](v5, "setJournalReplaySucceeded:", [v9 BOOLValue]);

    v10 = [v4 objectForKeyedSubscript:@"journalVerificationErrorCount"];
    -[MBCacheRefreshSummary setJournalVerificationErrorCount:](v5, "setJournalVerificationErrorCount:", [v10 unsignedLongLongValue]);

    v11 = [v4 objectForKeyedSubscript:@"cacheOnlySnapshotCount"];
    -[MBCacheRefreshSummary setCacheOnlySnapshotCount:](v5, "setCacheOnlySnapshotCount:", [v11 unsignedLongLongValue]);

    v12 = [v4 objectForKeyedSubscript:@"downloadedSnapshotCount"];
    -[MBCacheRefreshSummary setDownloadedSnapshotCount:](v5, "setDownloadedSnapshotCount:", [v12 unsignedLongLongValue]);

    v13 = [v4 objectForKeyedSubscript:@"downloadedSnapshotVerificationFailureCount"];
    -[MBCacheRefreshSummary setDownloadedSnapshotVerificationFailureCount:](v5, "setDownloadedSnapshotVerificationFailureCount:", [v13 unsignedLongLongValue]);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self cachedSnapshotCount]];
  [v3 setObject:v4 forKeyedSubscript:@"cacheSnapshotCount"];

  v5 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self serverSnapshotCount]];
  [v3 setObject:v5 forKeyedSubscript:@"serverSnapshotCount"];

  v6 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self journalActionCount]];
  [v3 setObject:v6 forKeyedSubscript:@"journalActionCount"];

  v7 = +[NSNumber numberWithBool:[(MBCacheRefreshSummary *)self journalReplaySucceeded]];
  [v3 setObject:v7 forKeyedSubscript:@"journalReplaySucceeded"];

  v8 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self journalVerificationErrorCount]];
  [v3 setObject:v8 forKeyedSubscript:@"journalVerificationErrorCount"];

  v9 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self cacheOnlySnapshotCount]];
  [v3 setObject:v9 forKeyedSubscript:@"cacheOnlySnapshotCount"];

  v10 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self downloadedSnapshotCount]];
  [v3 setObject:v10 forKeyedSubscript:@"downloadedSnapshotCount"];

  v11 = +[NSNumber numberWithUnsignedLongLong:[(MBCacheRefreshSummary *)self downloadedSnapshotVerificationFailureCount]];
  [v3 setObject:v11 forKeyedSubscript:@"downloadedSnapshotVerificationFailureCount"];

  return v3;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: c_count=%llu s_count=%llu j_count=%llu j_success=%d j_failures=%llu co_count=%llu s_downloaded=%llu s_failures=%llu>", objc_opt_class(), [(MBCacheRefreshSummary *)self cachedSnapshotCount], [(MBCacheRefreshSummary *)self serverSnapshotCount], [(MBCacheRefreshSummary *)self journalActionCount], [(MBCacheRefreshSummary *)self journalReplaySucceeded], [(MBCacheRefreshSummary *)self journalVerificationErrorCount], [(MBCacheRefreshSummary *)self cacheOnlySnapshotCount], [(MBCacheRefreshSummary *)self downloadedSnapshotCount], [(MBCacheRefreshSummary *)self downloadedSnapshotVerificationFailureCount]];
}

- (void)trackVerificationFailureForSnapshot:(id)a3 manifestID:(id)a4 domain:(id)a5 serverChecksum:(unint64_t)a6 localChecksum:(unint64_t)a7 localFileCount:(unint64_t)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  verificationFailures = self->_verificationFailures;
  if (!verificationFailures)
  {
    v17 = (NSMutableOrderedSet *)objc_opt_new();
    v18 = self->_verificationFailures;
    self->_verificationFailures = v17;

    verificationFailures = self->_verificationFailures;
  }
  if ((unint64_t)[(NSMutableOrderedSet *)verificationFailures count] <= 2)
  {
    v19 = +[NSString stringWithFormat:@"%@|%@|%@|%llx|%llx|%llu", v20, v14, v15, a7, a6, a8];
    [(NSMutableOrderedSet *)self->_verificationFailures addObject:v19];
  }
}

- (id)verificationFailureStrings
{
  return [(NSMutableOrderedSet *)self->_verificationFailures array];
}

- (unint64_t)cachedSnapshotCount
{
  return self->_cachedSnapshotCount;
}

- (void)setCachedSnapshotCount:(unint64_t)a3
{
  self->_cachedSnapshotCount = a3;
}

- (unint64_t)serverSnapshotCount
{
  return self->_serverSnapshotCount;
}

- (void)setServerSnapshotCount:(unint64_t)a3
{
  self->_serverSnapshotCount = a3;
}

- (unint64_t)journalActionCount
{
  return self->_journalActionCount;
}

- (void)setJournalActionCount:(unint64_t)a3
{
  self->_journalActionCount = a3;
}

- (BOOL)journalReplaySucceeded
{
  return self->_journalReplaySucceeded;
}

- (void)setJournalReplaySucceeded:(BOOL)a3
{
  self->_journalReplaySucceeded = a3;
}

- (unint64_t)cacheOnlySnapshotCount
{
  return self->_cacheOnlySnapshotCount;
}

- (void)setCacheOnlySnapshotCount:(unint64_t)a3
{
  self->_cacheOnlySnapshotCount = a3;
}

- (unint64_t)journalVerificationErrorCount
{
  return self->_journalVerificationErrorCount;
}

- (void)setJournalVerificationErrorCount:(unint64_t)a3
{
  self->_journalVerificationErrorCount = a3;
}

- (unint64_t)downloadedSnapshotCount
{
  return self->_downloadedSnapshotCount;
}

- (void)setDownloadedSnapshotCount:(unint64_t)a3
{
  self->_downloadedSnapshotCount = a3;
}

- (unint64_t)downloadedSnapshotVerificationFailureCount
{
  return self->_downloadedSnapshotVerificationFailureCount;
}

- (void)setDownloadedSnapshotVerificationFailureCount:(unint64_t)a3
{
  self->_downloadedSnapshotVerificationFailureCount = a3;
}

- (NSMutableOrderedSet)verificationFailures
{
  return self->_verificationFailures;
}

- (void)setVerificationFailures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end