@interface FCCKPrivateFetchDatabaseChangesSingleDestinationResult
- (BOOL)moreComing;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)changedZoneIDs;
- (NSArray)deletedZoneIDs;
- (NSError)error;
- (int64_t)destination;
- (void)setChangedZoneIDs:(id)a3;
- (void)setDeletedZoneIDs:(id)a3;
- (void)setDestination:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setServerChangeToken:(id)a3;
@end

@implementation FCCKPrivateFetchDatabaseChangesSingleDestinationResult

- (int64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(int64_t)a3
{
  self->_destination = a3;
}

- (NSArray)changedZoneIDs
{
  return self->_changedZoneIDs;
}

- (void)setChangedZoneIDs:(id)a3
{
}

- (NSArray)deletedZoneIDs
{
  return self->_deletedZoneIDs;
}

- (void)setDeletedZoneIDs:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_deletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_changedZoneIDs, 0);
}

@end