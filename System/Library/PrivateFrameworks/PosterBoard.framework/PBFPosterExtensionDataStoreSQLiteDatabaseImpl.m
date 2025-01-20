@interface PBFPosterExtensionDataStoreSQLiteDatabaseImpl
@end

@implementation PBFPosterExtensionDataStoreSQLiteDatabaseImpl

void __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringForKey:@"tbl_name"];
  [v2 addObject:v3];
}

void __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke_250(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringForKey:@"value"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __77___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_dataStoreMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v10;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 stringForKey:@"value"];
  v9 = [v10 stringForKey:@"key"];
  [v4 setObject:v8 forKey:v9];
}

void __75___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v9 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v9;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 objectForKey:@"roleIdentifier"];
  [v4 addObject:v8];
}

void __84___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifiersForRole_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v9 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v9;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 objectForKey:@"providerId"];
  [v4 addObject:v8];
}

void __93___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeIdentifiersForPoster_roleId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v9 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v9;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 objectForKey:@"attributeIdentifier"];
  [v4 addObject:v8];
}

void __95___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_posterUUIDsForExtensionIdentifier_role_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  v8 = [v10 objectForKey:@"UUID"];
  id v9 = (void *)[v7 initWithUUIDString:v8];
  [v3 addObject:v9];
}

void __89___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifierForPosterUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringForKey:@"providerId"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __81___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_sortedPosterUUIDsForRole_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  v8 = [v10 objectForKey:@"posterUUID"];
  id v9 = (void *)[v7 initWithUUIDString:v8];
  [v3 addObject:v9];
}

void __87___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleDisplayNamesForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v10;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = [v3 stringForKey:@"displayName"];
  id v9 = [v10 stringForKey:@"roleIdentifier"];
  [v4 setObject:v8 forKey:v9];
}

void __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  [v2 addObject:v3];
}

void __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringForKey:@"posterUUID"];
  [v2 addObject:v3];
}

void __82___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_selectedPosterUUIDForRole_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 stringForKey:@"posterUUID"];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __94___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeForPoster_roleId_attributeId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dataForKey:@"attributePayload"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke(int a1, id a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"'%s'", sqlite3_mprintf("%q", objc_msgSend(a2, "UTF8String")));
}

void __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 dataForKey:@"attributePayload"];
  uint64_t v4 = [v3 stringForKey:@"attributeIdentifier"];

  if (v4 && v9)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 setObject:v9 forKeyedSubscript:v4];
  }
}

uint64_t __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 UUIDString];
  uint64_t v6 = [v4 UUIDString];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(a1[4] + 16);
  id v8 = a2;
  id v9 = [v7 prepareStatement:@"UPDATE posterRoleMembership SET roleSortKey = :roleSortKey WHERE posterUUID = :posterUUID AND roleId = :roleId"];;
  v17[0] = a1[5];
  v16[0] = @":roleId";
  v16[1] = @":posterUUID";
  id v10 = [v8 UUIDString];

  v17[1] = v10;
  v16[2] = @":roleSortKey";
  v11 = [NSNumber numberWithUnsignedInteger:a3 + 1];
  v17[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v13 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  char v14 = [v9 executeWithBindings:v12 resultRowHandler:0 error:&obj];
  objc_storeStrong(v13, obj);

  if ((v14 & 1) == 0) {
    *a4 = 1;
  }
}

@end