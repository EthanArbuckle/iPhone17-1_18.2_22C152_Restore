@interface PPSClientInterface
+ (id)getAllFrameworkSubsystem;
+ (id)getAllSubsystem;
+ (id)getMetadataByCategoryForSubsystem:(id)a3;
+ (id)getMetadataByNameForSubsystem:(id)a3 category:(id)a4;
+ (id)getMetadataForSubsystem:(id)a3;
+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4;
+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (id)getSubsystemsForFilepath:(id)a3;
+ (void)buildDeviceMetadata;
@end

@implementation PPSClientInterface

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PPSMetadataStore sharedStore];
  v8 = [v7 getMetadataForSubsystem:v6 category:v5];

  v9 = [v8 allValues];

  return v9;
}

+ (id)getMetadataByNameForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = +[PPSMetadataStore sharedStore];
    v9 = [v8 getMetadataForSubsystem:v5 category:v7];
  }
  else
  {
    v10 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getMetadataByNameForSubsystem:category:]((uint64_t)v5, (uint64_t)v7, v10);
    }

    v9 = 0;
  }

  return v9;
}

+ (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    v11 = +[PPSMetadataStore sharedStore];
    v12 = [v11 getMetadataForSubsystem:v7 category:v8 name:v10];
  }
  else
  {
    v13 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_258ED8000, v13, OS_LOG_TYPE_ERROR, "Invalid Input: subsystem=%@, category=%@, name=%@", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)getAllSubsystem
{
  v2 = +[PPSMetadataStore sharedStore];
  v3 = [v2 getAllSubsystem];

  return v3;
}

+ (id)getAllFrameworkSubsystem
{
  v2 = +[PPSMetadataStore sharedStore];
  v3 = [v2 getAllFrameworkSubsystem];

  return v3;
}

+ (id)getMetadataForSubsystem:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[PPSMetadataStore sharedStore];
    id v5 = [v4 getMetadataForSubsystem:v3];

    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = [v5 allValues];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__PPSClientInterface_getMetadataForSubsystem___block_invoke;
    v11[3] = &unk_265440CF8;
    id v8 = v6;
    id v12 = v8;
    [v7 enumerateObjectsUsingBlock:v11];

    if ([v8 count]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v5 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getMetadataForSubsystem:](v5);
    }
    id v9 = 0;
  }

  return v9;
}

void __46__PPSClientInterface_getMetadataForSubsystem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 allValues];
  [v2 addObjectsFromArray:v3];
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v9 && v10 && v11 && v12)
  {
    v14 = [v9 path];
    int v15 = +[PPSMetadataStore getMetadataHistoryForFilepath:v14 subsystem:v10 category:v11 name:v13];
  }
  else
  {
    id v16 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138413058;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_error_impl(&dword_258ED8000, v16, OS_LOG_TYPE_ERROR, "Invalid Input: filepath=%@, subsystem=%@, category=%@, name=%@", (uint8_t *)&v18, 0x2Au);
    }

    int v15 = 0;
  }

  return v15;
}

+ (id)getSubsystemsForFilepath:(id)a3
{
  if (a3)
  {
    id v3 = [a3 path];
    v4 = +[PPSSQLMetadataStore querySubsystemsForFilepath:v3];
  }
  else
  {
    id v5 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSClientInterface getSubsystemsForFilepath:](v5);
    }

    v4 = 0;
  }
  return v4;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7 && v8 && v9)
  {
    id v11 = [v7 path];
    id v12 = +[PPSMetadataStore getMetadataHistoryForFilepath:v11 subsystem:v8 category:v10];
  }
  else
  {
    v13 = PPSClientInterfaceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_error_impl(&dword_258ED8000, v13, OS_LOG_TYPE_ERROR, "Invalid Input: filepath=%@, subsystem=%@, category=%@", (uint8_t *)&v15, 0x20u);
    }

    id v12 = 0;
  }

  return v12;
}

+ (void)buildDeviceMetadata
{
  id v2 = +[PPSMetadataStore sharedStore];
  [v2 buildDeviceMetadata];
}

+ (id)getMetadataByCategoryForSubsystem:(id)a3
{
  id v3 = a3;
  v4 = +[PPSMetadataStore sharedStore];
  id v5 = [v4 getMetadataForSubsystem:v3];

  return v5;
}

+ (void)getMetadataForSubsystem:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_258ED8000, log, OS_LOG_TYPE_ERROR, "Invalid Input: subsystem=%@", (uint8_t *)&v1, 0xCu);
}

+ (void)getMetadataByNameForSubsystem:(os_log_t)log category:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_258ED8000, log, OS_LOG_TYPE_ERROR, "Invalid Input: subsystem=%@, category=%@", (uint8_t *)&v3, 0x16u);
}

+ (void)getSubsystemsForFilepath:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_258ED8000, log, OS_LOG_TYPE_ERROR, "Invalid Input: filepath=%@", (uint8_t *)&v1, 0xCu);
}

@end