@interface ML3MigrationMisgroupedTrack
- (ML3MigrationMisgroupedTrack)initWithPersistentID:(int64_t)a3 albumArtistPID:(int64_t)a4;
- (int64_t)albumArtistPID;
- (int64_t)persistentID;
@end

@implementation ML3MigrationMisgroupedTrack

- (int64_t)albumArtistPID
{
  return self->_albumArtistPID;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (ML3MigrationMisgroupedTrack)initWithPersistentID:(int64_t)a3 albumArtistPID:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ML3MigrationMisgroupedTrack;
  result = [(ML3MigrationMisgroupedTrack *)&v7 init];
  if (result)
  {
    result->_persistentID = a3;
    result->_albumArtistPID = a4;
  }
  return result;
}

@end