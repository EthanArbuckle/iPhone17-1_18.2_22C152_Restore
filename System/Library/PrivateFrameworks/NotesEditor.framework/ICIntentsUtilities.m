@interface ICIntentsUtilities
+ (id)interactionForAppendToNote:(id)a3 withAppendedText:(id)a4;
+ (id)interactionForCreateNote:(id)a3;
+ (id)interactionForDeleteNote:(id)a3;
+ (id)interactionForSearchString:(id)a3;
+ (void)donateInteraction:(id)a3;
@end

@implementation ICIntentsUtilities

+ (id)interactionForCreateNote:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentIdentifier];
  v5 = [v3 title];
  id v6 = objc_alloc(MEMORY[0x263F0FA28]);
  v7 = (void *)[objc_alloc(MEMORY[0x263F0FFA0]) initWithSpokenPhrase:v5];
  v8 = (void *)[v6 initWithTitle:v7 content:0 groupName:0];

  v9 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v8 response:0];
  v10 = [v3 identifier];

  [v9 setGroupIdentifier:v10];
  v11 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[ICIntentsUtilities interactionForCreateNote:](v9);
  }

  return v9;
}

+ (id)interactionForAppendToNote:(id)a3 withAppendedText:(id)a4
{
  id v27 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 contentIdentifier];
  uint64_t v7 = [v5 title];
  uint64_t v8 = [v5 creationDate];
  uint64_t v9 = [v5 modificationDate];
  uint64_t v10 = [v5 folderName];
  id v11 = objc_alloc(MEMORY[0x263F0FC88]);
  v31 = (void *)v7;
  v12 = (void *)[objc_alloc(MEMORY[0x263F0FFA0]) initWithSpokenPhrase:v7];
  v28 = (void *)v10;
  v13 = (void *)[objc_alloc(MEMORY[0x263F0FFA0]) initWithSpokenPhrase:v10];
  v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  v30 = (void *)v8;
  v15 = [v14 components:64 fromDate:v8];
  v16 = [MEMORY[0x263EFF8F0] currentCalendar];
  v29 = (void *)v9;
  v17 = [v16 components:64 fromDate:v9];
  v18 = (void *)v6;
  v19 = (void *)[v11 initWithTitle:v12 contents:MEMORY[0x263EFFA68] groupName:v13 createdDateComponents:v15 modifiedDateComponents:v17 identifier:v6];

  id v20 = objc_alloc(MEMORY[0x263F0F9C0]);
  v21 = (void *)[objc_alloc(MEMORY[0x263F10060]) initWithText:v27];

  v22 = (void *)[v20 initWithTargetNote:v19 content:v21];
  v23 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v22 response:0];
  v24 = [v5 identifier];

  [v23 setGroupIdentifier:v24];
  v25 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    +[ICIntentsUtilities interactionForAppendToNote:withAppendedText:](v23);
  }

  return v23;
}

+ (id)interactionForSearchString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F0FE90];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F0FFA0]) initWithSpokenPhrase:v4];
  uint64_t v7 = (void *)[v5 initWithTitle:v6 content:v4 itemType:1 status:0 location:0 locationSearchType:0 dateTime:0 dateSearchType:0 temporalEventTriggerTypes:1 taskPriority:0 notebookItemIdentifier:0];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v7 response:0];
  uint64_t v9 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[ICIntentsUtilities interactionForSearchString:](v8, v9);
  }

  return v8;
}

+ (id)interactionForDeleteNote:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contentIdentifier];
  id v5 = [v3 title];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v6 setObject:v4 forKeyedSubscript:@"identifier"];
  [v6 setObject:v5 forKeyedSubscript:@"title"];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F0FBB0]) initWithDomain:@"Notes" verb:@"DeleteNote" parametersByName:v6];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0FBD8]) initWithIntent:v7 response:0];
  uint64_t v9 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[ICIntentsUtilities interactionForDeleteNote:](v8);
  }

  if (v4)
  {
    uint64_t v10 = (void *)MEMORY[0x263F0FBD8];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke;
    v13[3] = &unk_2640BAB38;
    v14 = v4;
    [v10 deleteInteractionsWithGroupIdentifier:v14 completion:v13];
    id v11 = v14;
  }
  else
  {
    id v11 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICIntentsUtilities interactionForDeleteNote:](v3, v11);
    }
  }

  return v8;
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Intents");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_2((uint64_t)v3, a1, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_1(a1, v5);
  }
}

+ (void)donateInteraction:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ICIntentsUtilities_donateInteraction___block_invoke;
  v6[3] = &unk_2640BAB38;
  id v7 = v4;
  id v5 = v4;
  [v3 donateInteractionWithCompletion:v6];
}

void __40__ICIntentsUtilities_donateInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Intents");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_2(a1, (uint64_t)v3, v4);
    }
  }
  else if (v5)
  {
    __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_1(a1, v4);
  }
}

+ (void)interactionForCreateNote:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v2, v3, "Created interaction %@ from INCreateNoteIntent with note identifier %@.", v4, v5, v6, v7, v8);
}

+ (void)interactionForAppendToNote:(void *)a1 withAppendedText:.cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v2, v3, "Created interaction %@ from INAppendToNoteIntent with note identifier %@.", v4, v5, v6, v7, v8);
}

+ (void)interactionForSearchString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Created interaction %@ from INSearchForNotebookItemsIntent.", (uint8_t *)&v4, 0xCu);
}

+ (void)interactionForDeleteNote:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 searchIndexingIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Received a note without contentIdentifier when creating a delete intent. Its searchIndexingIdentifier is %@", (uint8_t *)&v4, 0xCu);
}

+ (void)interactionForDeleteNote:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0(&dword_20BE60000, v2, v3, "Created interaction %@ from DeleteNote intent with note identifier %@.", v4, v5, v6, v7, v8);
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Success deleting an interaction for note %@", (uint8_t *)&v3, 0xCu);
}

void __47__ICIntentsUtilities_interactionForDeleteNote___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Error deleting an interaction %@ for note %@", (uint8_t *)&v4, 0x16u);
}

void __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Successfully donated interaction %@.", (uint8_t *)&v3, 0xCu);
}

void __40__ICIntentsUtilities_donateInteraction___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Failed to donate interaction %@, error: %@", (uint8_t *)&v4, 0x16u);
}

@end