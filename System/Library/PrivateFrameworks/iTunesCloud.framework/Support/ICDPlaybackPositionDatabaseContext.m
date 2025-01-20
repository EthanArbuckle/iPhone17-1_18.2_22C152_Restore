@interface ICDPlaybackPositionDatabaseContext
- (ICDPlaybackPositionDatabaseContext)initWithLibrary:(id)a3;
- (NSMutableSet)ubiquitousIdentifiersToSync;
- (NSString)lastSyncedDomainVersion;
- (unint64_t)lastSyncedEntityRevision;
- (unint64_t)transactionEntityRevision;
@end

@implementation ICDPlaybackPositionDatabaseContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousIdentifiersToSync, 0);

  objc_storeStrong((id *)&self->_lastSyncedDomainVersion, 0);
}

- (NSMutableSet)ubiquitousIdentifiersToSync
{
  return self->_ubiquitousIdentifiersToSync;
}

- (NSString)lastSyncedDomainVersion
{
  return self->_lastSyncedDomainVersion;
}

- (unint64_t)transactionEntityRevision
{
  return self->_transactionEntityRevision;
}

- (unint64_t)lastSyncedEntityRevision
{
  return self->_lastSyncedEntityRevision;
}

- (ICDPlaybackPositionDatabaseContext)initWithLibrary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDPlaybackPositionDatabaseContext;
  v5 = [(ICDPlaybackPositionDatabaseContext *)&v11 init];
  if (v5)
  {
    v5->_transactionEntityRevision = (unint64_t)[v4 currentRevision];
    v5->_lastSyncedEntityRevision = (unint64_t)[v4 lastSyncedEntityRevision];
    uint64_t v6 = [v4 lastSyncedDomainVersion];
    lastSyncedDomainVersion = v5->_lastSyncedDomainVersion;
    v5->_lastSyncedDomainVersion = (NSString *)v6;

    uint64_t v8 = +[NSMutableSet set];
    ubiquitousIdentifiersToSync = v5->_ubiquitousIdentifiersToSync;
    v5->_ubiquitousIdentifiersToSync = (NSMutableSet *)v8;
  }
  return v5;
}

@end