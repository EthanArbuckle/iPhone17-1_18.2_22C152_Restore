@interface SBDPlaybackPositionTransaction
- (ML3MusicLibrary)musicLibrary;
- (NSMutableSet)ubiquitousIdentifiersToSync;
- (NSString)description;
- (NSString)lastSyncedDomainVersion;
- (unint64_t)lastSyncedEntityRevision;
- (unint64_t)transactionEntityRevision;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
- (void)setMusicLibrary:(id)a3;
- (void)setTransactionEntityRevision:(unint64_t)a3;
- (void)setUbiquitousIdentifiersToSync:(id)a3;
@end

@implementation SBDPlaybackPositionTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquitousIdentifiersToSync, 0);
  objc_storeStrong((id *)&self->_lastSyncedDomainVersion, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
}

- (void)setUbiquitousIdentifiersToSync:(id)a3
{
}

- (NSMutableSet)ubiquitousIdentifiersToSync
{
  return self->_ubiquitousIdentifiersToSync;
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (NSString)lastSyncedDomainVersion
{
  return self->_lastSyncedDomainVersion;
}

- (void)setTransactionEntityRevision:(unint64_t)a3
{
  self->_transactionEntityRevision = a3;
}

- (unint64_t)transactionEntityRevision
{
  return self->_transactionEntityRevision;
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  self->_lastSyncedEntityRevision = a3;
}

- (unint64_t)lastSyncedEntityRevision
{
  return self->_lastSyncedEntityRevision;
}

- (void)setMusicLibrary:(id)a3
{
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (NSString)description
{
  uint64_t v3 = [(SBDPlaybackPositionTransaction *)self lastSyncedDomainVersion];
  v4 = (void *)v3;
  v5 = @"<NO VERSION>";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v10.receiver = self;
  v10.super_class = (Class)SBDPlaybackPositionTransaction;
  v7 = [(SBDPlaybackPositionTransaction *)&v10 description];
  v8 = +[NSString stringWithFormat:@"%@: lastSyncedDomainVersion = %@, entityRevisions.lastSynced = %llu, entityRevisions.currentSyncTransaction = %llu"], v7, v6, self->_lastSyncedEntityRevision, self->_transactionEntityRevision);

  return (NSString *)v8;
}

@end