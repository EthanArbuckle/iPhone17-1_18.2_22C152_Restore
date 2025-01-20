@interface NotesAssistantUtilities
+ (id)folderForGroupName:(id)a3 withNoteContext:(id)a4 htmlNoteContext:(id)a5;
+ (id)folderOptionsForModernContext:(id)a3 htmlContext:(id)a4;
+ (id)legacyFolderForGroupName:(id)a3 withContext:(id)a4;
+ (id)modernFolderForGroupName:(id)a3 withContext:(id)a4;
+ (id)objectForIDURL:(id)a3 inContext:(id)a4;
@end

@implementation NotesAssistantUtilities

+ (id)folderOptionsForModernContext:(id)a3 htmlContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke;
  v21[3] = &unk_1E64A4218;
  id v22 = v5;
  id v8 = v7;
  id v23 = v8;
  id v9 = v5;
  [v9 performBlockAndWait:v21];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke_2;
  v18 = &unk_1E64A4218;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  [v11 performBlockAndWait:&v15];
  +[NotesAssistantFolderOption disambiguateFolderOptions:](NotesAssistantFolderOption, "disambiguateFolderOptions:", v10, v15, v16, v17, v18);
  v12 = v20;
  id v13 = v10;

  return v13;
}

void __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[ICFolder visibleFoldersInContext:*(void *)(a1 + 32)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v7 folderType])
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = [[NotesAssistantFolderOption alloc] initWithModernFolder:v7];
          [v8 addObject:v9];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __69__NotesAssistantUtilities_folderOptionsForModernContext_htmlContext___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F82D88], "ic_objectsMatchingPredicate:context:", 0, *(void *)(a1 + 32));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [v7 account];
        char v9 = [v8 didChooseToMigrate];

        if ((v9 & 1) == 0)
        {
          long long v10 = *(void **)(a1 + 40);
          long long v11 = [[NotesAssistantFolderOption alloc] initWithLegacyFolder:v7];
          [v10 addObject:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

+ (id)folderForGroupName:(id)a3 withNoteContext:(id)a4 htmlNoteContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = [a1 modernFolderForGroupName:v8 withContext:a4];
  long long v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [a1 legacyFolderForGroupName:v8 withContext:v9];
  }
  long long v13 = v12;

  return v13;
}

+ (id)legacyFolderForGroupName:(id)a3 withContext:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  v7 = [a3 vocabularyIdentifier];
  id v8 = [v5 URLWithString:v7];

  id v9 = +[NotesAssistantUtilities objectForIDURL:v8 inContext:v6];

  objc_opt_class();
  long long v10 = ICDynamicCast();

  return v10;
}

+ (id)modernFolderForGroupName:(id)a3 withContext:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a4;
  v7 = [a3 vocabularyIdentifier];
  id v8 = [v5 URLWithString:v7];

  id v9 = +[NotesAssistantUtilities objectForIDURL:v8 inContext:v6];

  if (v9)
  {
    objc_opt_class();
    long long v10 = ICDynamicCast();
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

+ (id)objectForIDURL:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__63;
  id v19 = __Block_byref_object_dispose__63;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__NotesAssistantUtilities_objectForIDURL_inContext___block_invoke;
  v11[3] = &unk_1E64A5958;
  id v7 = v6;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  long long v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __52__NotesAssistantUtilities_objectForIDURL_inContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v7 = [v2 managedObjectIDForURIRepresentation:*(void *)(a1 + 40)];

  uint64_t v3 = v7;
  if (v7)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectWithID:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v3 = v7;
  }
}

@end