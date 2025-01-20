@interface ICReindexAllItemsOperation
- (NSData)clientStateData;
- (void)clientStateData;
- (void)main;
@end

@implementation ICReindexAllItemsOperation

- (void)main
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Started main function of reindexing operation %@", v2, v3, v4, v5, v6);
}

void __34__ICReindexAllItemsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (ICVerboseSearchLogging())
  {
    uint64_t v4 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __34__ICReindexAllItemsOperation_main__block_invoke_cold_2(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (v3)
  {
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __34__ICReindexAllItemsOperation_main__block_invoke_cold_1();
    }
  }
}

- (NSData)clientStateData
{
  p_clientStateData = &self->_clientStateData;
  clientStateData = self->_clientStateData;
  if (!clientStateData)
  {
    uint64_t v4 = +[ICSettingsUtilities objectForKey:@"ClientStateData"];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_storeStrong((id *)p_clientStateData, v4);
LABEL_12:

      clientStateData = *p_clientStateData;
      goto LABEL_13;
    }
    id v10 = 0;
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8F8], "ic_random128BitData:", &v10);
    id v6 = v10;
    if (v6)
    {
      uint64_t v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICReindexAllItemsOperation clientStateData]();
      }

      if (!v5) {
        goto LABEL_11;
      }
    }
    else if (!v5)
    {
      uint64_t v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ICReindexAllItemsOperation clientStateData](v9);
      }

      goto LABEL_11;
    }
    objc_storeStrong((id *)p_clientStateData, v5);
    +[ICSettingsUtilities setObject:v5 forKey:@"ClientStateData"];
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  return clientStateData;
}

- (void).cxx_destruct
{
}

void __34__ICReindexAllItemsOperation_main__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Error writing client state data into CoreSpotlight %@", v1, 0xCu);
}

void __34__ICReindexAllItemsOperation_main__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clientStateData
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Error generating random NSData for CoreSpotlight client state data. %@", v1, 0xCu);
}

@end