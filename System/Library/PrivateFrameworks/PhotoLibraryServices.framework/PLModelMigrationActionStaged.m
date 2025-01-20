@interface PLModelMigrationActionStaged
- (id)actionName;
@end

@implementation PLModelMigrationActionStaged

void __102__PLModelMigrationActionStaged_FixupExistingUserFeedback_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v7 UUIDString];
  [v6 setUuid:v8];

  if (objc_opt_respondsToSelector())
  {
    v9 = [*(id *)(a1 + 32) pathManager];
    [v6 persistMetadataToFileSystemWithPathManager:v9];
  }
  v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v10 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __122__PLModelMigrationActionStaged_FixupExistingCloudSharedAlbumInvitationRecord_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a2;
  v8 = [v6 UUID];
  v9 = [v8 UUIDString];
  [v7 setUuid:v9];

  v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  LODWORD(v7) = [v10 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __103__PLModelMigrationActionStaged_MoveLibraryScopeShareState_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 valueForKey:@"libraryScopeShareState"];
  [v6 setValue:v7 forKeyPath:@"asset.libraryScopeShareState"];

  v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __105__PLModelMigrationActionStaged_MoveLibraryScopeContributors_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 primitiveValueForKey:@"libraryScopeOriginators"];
  if ([v7 count])
  {
    v19 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 32)];
          [v15 setParticipant:v14];
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v6 = v19;
    [v19 setValue:v8 forKey:@"libraryScopeAssetContributors"];
  }
  v16 = *(void **)(a1 + 40);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v17 + 40);
  int v18 = [v16 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);
  if (v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
}

- (id)actionName
{
  return @"MigrationActionStaged";
}

@end