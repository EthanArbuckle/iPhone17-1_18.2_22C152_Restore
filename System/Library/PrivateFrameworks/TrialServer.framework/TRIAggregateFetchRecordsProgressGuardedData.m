@interface TRIAggregateFetchRecordsProgressGuardedData
@end

@implementation TRIAggregateFetchRecordsProgressGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->perMARecordProgress, 0);
  objc_storeStrong((id *)&self->perCKRecordProgress, 0);
}

@end