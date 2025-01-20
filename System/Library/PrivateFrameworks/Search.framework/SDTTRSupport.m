@interface SDTTRSupport
+ (id)getSharedInstance;
- (OS_dispatch_queue)queue;
- (SDTTRSupport)init;
- (void)clearExistingFiles;
- (void)collectResultSetForQueryString:(id)a3;
- (void)dumpFeatureVectorForSections:(id)a3 query:(id)a4;
- (void)dumpTTRDebugFilesForQuery:(id)a3 sections:(id)a4 enableKeyLogRanking:(BOOL)a5;
- (void)setQueue:(id)a3;
@end

@implementation SDTTRSupport

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1) {
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance;

  return v2;
}

void __33__SDTTRSupport_getSharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance;
  sharedInstance = v0;

  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 createDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search" withIntermediateDirectories:0 attributes:0 error:0];
  }
}

- (SDTTRSupport)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDTTRSupport;
  v2 = [(SDTTRSupport *)&v7 init];
  if (v2)
  {
    char v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchd.ttr", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dumpTTRDebugFilesForQuery:(id)a3 sections:(id)a4 enableKeyLogRanking:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__SDTTRSupport_dumpTTRDebugFilesForQuery_sections_enableKeyLogRanking___block_invoke;
  v13[3] = &unk_2644B28C8;
  BOOL v16 = a5;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, v13);
}

uint64_t __71__SDTTRSupport_dumpTTRDebugFilesForQuery_sections_enableKeyLogRanking___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearExistingFiles];
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) collectResultSetForQueryString:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  dispatch_queue_t v4 = *(void **)(a1 + 32);

  return [v4 dumpFeatureVectorForSections:v2 query:v3];
}

- (void)clearExistingFiles
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [v2 contentsOfDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search" error:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v8 hasPrefix:@"Spotlight_Ranking_Diagnostic_Dump_L"])
        {
          id v9 = [NSString stringWithFormat:@"%@/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search", v8];
          [v2 removeItemAtPath:v9 error:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  v10 = [NSString stringWithFormat:@"%@/Ranking/", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"];
  id v11 = [v2 contentsOfDirectoryAtPath:v10 error:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [NSString stringWithFormat:@"%@/Ranking/%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18];
        [v2 removeItemAtPath:v17 error:0];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)dumpFeatureVectorForSections:(id)a3 query:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [NSString stringWithFormat:@"%@/Spotlight_Ranking_Diagnostic_Dump_L2_%@.log", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search", v6];
    [v7 UTF8String];
    uint64_t v8 = json_writer_create_with_path();
    if (v8)
    {
      uint64_t v9 = v8;
      id v23 = v7;
      id v24 = v6;
      json_writer_begin_array();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v25 = v5;
      obuint64_t j = v5;
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v27 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v14 = [v13 arrayOfRankingItems];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v29 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                  long long v20 = [v19 identifier];
                  long long v21 = [v19 L2FeatureVector];
                  if ([v20 length]) {
                    BOOL v22 = v21 == 0;
                  }
                  else {
                    BOOL v22 = 1;
                  }
                  if (!v22)
                  {
                    json_writer_begin_dictionary();
                    json_writer_add_key();
                    [v20 UTF8String];
                    json_writer_add_string();
                    [v21 serializeToJSON:v9 options:2];
                    json_writer_end_dictionary();
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v16);
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v11);
      }

      json_writer_end_array();
      json_writer_dispose();
      id v6 = v24;
      id v5 = v25;
      id v7 = v23;
    }
  }
}

- (void)collectResultSetForQueryString:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x223C2BE00]();
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  if (([v5 containsObject:@"_kMDItemSDBInfo"] & 1) == 0) {
    [v5 insertObject:@"_kMDItemSDBInfo" atIndex:0];
  }
  id v7 = objc_opt_new();
  if ([v5 count]) {
    [v7 setFetchAttributes:v5];
  }
  uint64_t v8 = *MEMORY[0x263F08088];
  v16[0] = *MEMORY[0x263F08080];
  v16[1] = v8;
  uint64_t v9 = *MEMORY[0x263F08098];
  v16[2] = *MEMORY[0x263F080A0];
  v16[3] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
  [v7 setProtectionClasses:v10];

  uint64_t v11 = (void *)[v7 copy];
  id v12 = (void *)MEMORY[0x223C2BE00]([v11 setFetchAttributes:&unk_26CF8F1A0]);
  if ([v3 length])
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@/TTR_allResults_%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search", v3];
    uint64_t v14 = [NSString stringWithFormat:@"/%@/Spotlight_Ranking_Diagnostic_Dump_Filtered_%@", @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search", v3];
    uint64_t v15 = [NSString stringWithFormat:@"**=\"%@*\"cdwt", v3];
    runQuery(v15, v6, v7, 1, v13);
    runQuery(v3, v6, v11, 0, v14);
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end