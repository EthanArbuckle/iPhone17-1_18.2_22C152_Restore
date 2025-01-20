@interface PPSQLDatabaseHandlePool
@end

@implementation PPSQLDatabaseHandlePool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->availableReadOnlyHandles, 0);
  objc_storeStrong((id *)&self->readWriteHandle, 0);
}

@end