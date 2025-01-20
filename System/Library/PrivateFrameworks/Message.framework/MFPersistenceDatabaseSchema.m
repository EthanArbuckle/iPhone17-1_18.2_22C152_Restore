@interface MFPersistenceDatabaseSchema
@end

@implementation MFPersistenceDatabaseSchema

id __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ef_map:", &__block_literal_global_58);
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

id __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:v2];

  return v3;
}

@end