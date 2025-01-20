@interface PLFetchRecordingIndexEntry
- (BOOL)unavailable;
- (PLFetchRecordingFileNormalizedStatementHeader)entryLocked_statementEntryFomBuffer:(void *)a3;
- (PLFetchRecordingIndexEntry)initWithOffset:(int64_t)a3;
- (int64_t)offset;
- (void)entryLocked_markUnavailable;
- (void)lock;
- (void)unlock;
@end

@implementation PLFetchRecordingIndexEntry

- (BOOL)unavailable
{
  return self->_unavailable;
}

- (int64_t)offset
{
  return self->_offset;
}

- (PLFetchRecordingFileNormalizedStatementHeader)entryLocked_statementEntryFomBuffer:(void *)a3
{
  if (!a3) {
    return 0;
  }
  if ([(PLFetchRecordingIndexEntry *)self unavailable]) {
    return 0;
  }
  return (PLFetchRecordingFileNormalizedStatementHeader *)((char *)a3
                                                         + [(PLFetchRecordingIndexEntry *)self offset]);
}

- (void)entryLocked_markUnavailable
{
  self->_unavailable = 1;
}

- (void)unlock
{
}

- (void)lock
{
}

- (PLFetchRecordingIndexEntry)initWithOffset:(int64_t)a3
{
  if (a3 <= 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLFetchRecording.m", 182, @"Invalid parameter not satisfying: %@", @"offset > 0" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)PLFetchRecordingIndexEntry;
  result = [(PLFetchRecordingIndexEntry *)&v8 init];
  if (result)
  {
    result->_entryLock._os_unfair_lock_opaque = 0;
    result->_offset = a3;
  }
  return result;
}

@end