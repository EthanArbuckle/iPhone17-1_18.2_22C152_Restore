@interface MFPersistenceDatabaseConnection
@end

@implementation MFPersistenceDatabaseConnection

uint64_t __61__MFPersistenceDatabaseConnection_iOS__handleCorruptDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __58__MFPersistenceDatabaseConnection_iOS__handleFullDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __68__MFPersistenceDatabaseConnection_iOS__handleInvalidDatabaseIOError__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __53__MFPersistenceDatabaseConnection_iOS__handleIOError__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __55__MFPersistenceDatabaseConnection_iOS__handleBusyError__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

@end