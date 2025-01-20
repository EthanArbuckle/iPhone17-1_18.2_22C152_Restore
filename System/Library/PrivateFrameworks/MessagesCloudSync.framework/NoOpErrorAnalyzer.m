@interface NoOpErrorAnalyzer
- (BOOL)isCKErrorPartialFailure:(id)a3;
- (BOOL)wasAssetNotAvailable:(id)a3;
- (BOOL)wasBatchFailure:(id)a3;
- (BOOL)wasBatchSizeFailure:(id)a3;
- (BOOL)wasDuplicateRecordFound:(id)a3;
- (BOOL)wasMissingKeys:(id)a3;
- (BOOL)wasOutOfSyncConditionsInError:(id)a3;
- (BOOL)wasQuotaExceededInError:(id)a3;
- (BOOL)wasRecordAlreadyChanged:(id)a3;
- (BOOL)wasRecordArchived:(id)a3;
- (BOOL)wasRecordSizeFailure:(id)a3;
- (BOOL)wasTokenExpired:(id)a3;
- (BOOL)wasUnknownItem:(id)a3;
- (BOOL)wasZoneDeletedByUserInError:(id)a3;
- (BOOL)wasZoneNotCreated:(id)a3;
- (BOOL)wasZoneNotFound:(id)a3;
- (id)errorsFromPartialFailure:(id)a3;
- (int64_t)responseForError:(id)a3 attempt:(int64_t)a4 retryInterval:(id *)a5;
@end

@implementation NoOpErrorAnalyzer

- (BOOL)wasOutOfSyncConditionsInError:(id)a3
{
  return 0;
}

- (BOOL)wasQuotaExceededInError:(id)a3
{
  return 0;
}

- (BOOL)wasZoneDeletedByUserInError:(id)a3
{
  return 0;
}

- (BOOL)wasZoneNotCreated:(id)a3
{
  return 0;
}

- (BOOL)wasTokenExpired:(id)a3
{
  return 0;
}

- (BOOL)wasMissingKeys:(id)a3
{
  return 0;
}

- (BOOL)wasBatchFailure:(id)a3
{
  return 0;
}

- (BOOL)wasRecordArchived:(id)a3
{
  return 0;
}

- (BOOL)wasDuplicateRecordFound:(id)a3
{
  return 0;
}

- (BOOL)wasAssetNotAvailable:(id)a3
{
  return 0;
}

- (BOOL)wasRecordAlreadyChanged:(id)a3
{
  return 0;
}

- (BOOL)wasUnknownItem:(id)a3
{
  return 0;
}

- (BOOL)wasBatchSizeFailure:(id)a3
{
  return 0;
}

- (BOOL)wasRecordSizeFailure:(id)a3
{
  return 0;
}

- (BOOL)wasZoneNotFound:(id)a3
{
  return 0;
}

- (int64_t)responseForError:(id)a3 attempt:(int64_t)a4 retryInterval:(id *)a5
{
  return 0;
}

- (BOOL)isCKErrorPartialFailure:(id)a3
{
  return 0;
}

- (id)errorsFromPartialFailure:(id)a3
{
  return 0;
}

@end