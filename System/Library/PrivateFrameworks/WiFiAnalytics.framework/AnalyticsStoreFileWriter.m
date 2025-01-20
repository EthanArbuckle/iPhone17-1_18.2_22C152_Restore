@interface AnalyticsStoreFileWriter
+ (id)exportEntityToCSV:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5 toURL:(id)a6 fileDate:(id)a7 dateFormatter:(id)a8 inManagedObjectContext:(id)a9;
- (AnalyticsStoreFileWriter)init;
- (AnalyticsStoreFileWriter)initWithAnalyticsStore:(id)a3;
- (AnalyticsStoreMOHandler)managedObjectHandler;
- (id)analyticsStoreFileWriterDirectory;
- (id)analyticsStoreFileWriterFilePath;
- (id)batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4;
- (id)batchedWriteAnalyticsStoreToFile:(unint64_t)a3 maxAge:(unint64_t)a4;
- (id)batchedWriteAnalyticsStoreToFileWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4;
- (id)relationshipKeyPathsForPrefetching:(id)a3;
- (id)stringifyObjectWithPadding:(id)a3 padding:(id)a4 padToLength:(unint64_t)a5;
- (id)stringifyRelationship:(id)a3 name:(id *)a4;
- (id)stringifyValueArray:(id)a3;
- (id)writeAnalyticsStoreToFile;
- (id)writeArrayToJSONFile:(id)a3;
- (id)writeDeploymentGraphToFile;
- (id)writeDictionaryToJSONFile:(id)a3 network:(id)a4;
- (void)initDateFormatter;
- (void)setManagedObjectHandler:(id)a3;
- (void)stringifyManagedObjectsArray:(id)a3 titleString:(id *)a4 dataStringsArray:(id *)a5;
@end

@implementation AnalyticsStoreFileWriter

- (AnalyticsStoreFileWriter)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsStoreFileWriter;
  v2 = [(AnalyticsStoreFileWriter *)&v6 init];
  if (v2)
  {
    v3 = [[AnalyticsStoreMOHandler alloc] initWithType:0 options:0];
    if (v3)
    {
      objc_storeStrong((id *)&v2->_managedObjectHandler, v3);
      [(AnalyticsStoreFileWriter *)v2 initDateFormatter];
    }
    else
    {
      v5 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v8 = "-[AnalyticsStoreFileWriter init]";
        __int16 v9 = 1024;
        int v10 = 59;
        _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting managedObjectHandler", buf, 0x12u);
      }

      v2 = 0;
    }
  }
  return v2;
}

- (AnalyticsStoreFileWriter)initWithAnalyticsStore:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AnalyticsStoreFileWriter;
  objc_super v6 = [(AnalyticsStoreFileWriter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_managedObjectHandler, a3);
      [(AnalyticsStoreFileWriter *)v7 initDateFormatter];
    }
    else
    {
      __int16 v9 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[AnalyticsStoreFileWriter initWithAnalyticsStore:]";
        __int16 v13 = 1024;
        int v14 = 77;
        _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:storeMOHandler nil", buf, 0x12u);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (void)initDateFormatter
{
  v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v3;

  id v5 = self->_dateFormatter;
  [(NSDateFormatter *)v5 setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss'.'SSS"];
}

- (id)analyticsStoreFileWriterDirectory
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = +[WAUtil wifianalyticsTmpDirectory];
  v3 = v2;
  if (!v2)
  {
    uint64_t v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
      __int16 v18 = 1024;
      int v19 = 114;
      __int16 v13 = "%{public}s::%d:tmpDirectory nil";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_18:
    id v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = [v2 URLByAppendingPathComponent:@"AnalyticsStoreDump"];
  if (!v4)
  {
    uint64_t v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
      __int16 v18 = 1024;
      int v19 = 117;
      __int16 v13 = "%{public}s::%d:analyticsStoreDumpDirectory nil";
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  id v5 = v4;
  objc_super v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if ((v8 & 1) == 0)
  {
    __int16 v9 = [MEMORY[0x263F08850] defaultManager];
    id v15 = 0;
    [v9 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
    objc_super v10 = v15;

    if (v10)
    {
      int v14 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
        __int16 v18 = 1024;
        int v19 = 125;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create wifianalytics tmp directory with error %@", buf, 0x1Cu);
      }

      uint64_t v11 = v5;
      goto LABEL_18;
    }
  }
  uint64_t v11 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
    __int16 v18 = 1024;
    int v19 = 127;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:analyticsStoreDumpDirectory: %@", buf, 0x1Cu);
  }
LABEL_7:

  return v5;
}

- (id)analyticsStoreFileWriterFilePath
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  dateFormatter = self->_dateFormatter;
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  id v5 = [(NSDateFormatter *)dateFormatter stringFromDate:v4];

  objc_super v6 = [NSString stringWithFormat:@"AnalyticsStoreDump_%@.txt", v5];
  v7 = [(AnalyticsStoreFileWriter *)self analyticsStoreFileWriterDirectory];
  char v8 = [v7 URLByAppendingPathComponent:v6 isDirectory:0];

  __int16 v9 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
    __int16 v29 = 1024;
    int v30 = 147;
    __int16 v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileURL: %@", buf, 0x1Cu);
  }

  objc_super v10 = [v8 path];
  if (!v10)
  {
    int v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
      __int16 v29 = 1024;
      int v30 = 150;
      __int16 v20 = "%{public}s::%d:fileName nil";
      v21 = v14;
      uint32_t v22 = 18;
LABEL_17:
      _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    }
LABEL_21:

    id v18 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  int v12 = [v11 fileExistsAtPath:v10];

  if (v12)
  {
    __int16 v13 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    [v13 removeItemAtPath:v10 error:&v26];
    int v14 = v26;

    if (v14)
    {
      v23 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [v14 localizedDescription];
        v25 = [v14 userInfo];
        *(_DWORD *)buf = 136447234;
        v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
        __int16 v29 = 1024;
        int v30 = 155;
        __int16 v31 = 2112;
        v32 = v10;
        __int16 v33 = 2112;
        v34 = v24;
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error deleting %@ %@ %@", buf, 0x30u);
      }
      goto LABEL_21;
    }
  }
  id v15 = [MEMORY[0x263F08850] defaultManager];
  char v16 = [v15 createFileAtPath:v10 contents:0 attributes:0];

  int v14 = WALogCategoryDeviceStoreHandle();
  BOOL v17 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if ((v16 & 1) == 0)
  {
    if (v17)
    {
      *(_DWORD *)buf = 136446722;
      v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
      __int16 v29 = 1024;
      int v30 = 161;
      __int16 v31 = 2112;
      v32 = v10;
      __int16 v20 = "%{public}s::%d:Error creating %@";
      v21 = v14;
      uint32_t v22 = 28;
      goto LABEL_17;
    }
    goto LABEL_21;
  }
  if (v17)
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
    __int16 v29 = 1024;
    int v30 = 164;
    __int16 v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Will write to file: %@", buf, 0x1Cu);
  }

  id v18 = v8;
LABEL_10:

  return v18;
}

- (id)writeDictionaryToJSONFile:(id)a3 network:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x263F08900] isValidJSONObject:v6] & 1) == 0)
  {
    uint64_t v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint32_t v22 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      __int16 v23 = 1024;
      int v24 = 183;
      __int16 v25 = 2080;
      id v26 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Invalid data passed to JSON serialization", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  dateFormatter = self->_dateFormatter;
  __int16 v9 = [MEMORY[0x263EFF910] date];
  objc_super v10 = [(NSDateFormatter *)dateFormatter stringFromDate:v9];

  uint64_t v11 = [NSString stringWithFormat:@"DeploymentGraph_%@_%@.json", v7, v10];
  int v12 = [(AnalyticsStoreFileWriter *)self analyticsStoreFileWriterDirectory];
  __int16 v13 = [v12 URLByAppendingPathComponent:v11 isDirectory:0];

  id v20 = 0;
  int v14 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:3 error:&v20];
  id v15 = v20;
  if (v15
    || (char v16 = (void *)[[NSString alloc] initWithData:v14 encoding:4],
        id v19 = 0,
        [v16 writeToURL:v13 atomically:1 encoding:4 error:&v19],
        id v15 = v19,
        v16,
        v15))
  {
    BOOL v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint32_t v22 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      __int16 v23 = 1024;
      int v24 = 199;
      __int16 v25 = 2112;
      id v26 = (const char *)v11;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }

LABEL_7:
    __int16 v13 = 0;
    goto LABEL_8;
  }

LABEL_8:
  return v13;
}

- (id)writeArrayToJSONFile:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([MEMORY[0x263F08900] isValidJSONObject:v4] & 1) == 0)
  {
    char v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v19 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      __int16 v20 = 1024;
      int v21 = 221;
      __int16 v22 = 2080;
      __int16 v23 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Invalid data passed to JSON serialization", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  dateFormatter = self->_dateFormatter;
  id v6 = [MEMORY[0x263EFF910] date];
  id v7 = [(NSDateFormatter *)dateFormatter stringFromDate:v6];

  char v8 = [NSString stringWithFormat:@"DeploymentGraph_%@.json", v7];
  __int16 v9 = [(AnalyticsStoreFileWriter *)self analyticsStoreFileWriterDirectory];
  objc_super v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];

  id v17 = 0;
  uint64_t v11 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:3 error:&v17];
  id v12 = v17;
  if (v12
    || (__int16 v13 = (void *)[[NSString alloc] initWithData:v11 encoding:4],
        id v16 = 0,
        [v13 writeToURL:v10 atomically:1 encoding:4 error:&v16],
        id v12 = v16,
        v13,
        v12))
  {
    int v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      id v19 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      __int16 v20 = 1024;
      int v21 = 237;
      __int16 v22 = 2112;
      __int16 v23 = (const char *)v8;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }

LABEL_7:
    objc_super v10 = 0;
    goto LABEL_8;
  }

LABEL_8:
  return v10;
}

- (id)writeDeploymentGraphToFile
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__5;
  id v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  v3 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke;
  v7[3] = &unk_264467648;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke(uint64_t a1)
{
  v2 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "writeDeploymentGraphToFile", "", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  id v5 = +[NetworkMO copyAllSsids:v4];

  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_72;
  id v16 = &unk_264467620;
  uint64_t v17 = *(void *)(a1 + 32);
  id v7 = v6;
  id v18 = v7;
  [v5 enumerateObjectsUsingBlock:&v13];
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "writeArrayToJSONFile:", v7, v13, v14, v15, v16, v17);
  uint64_t v9 = [v8 path];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v12 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "writeDeploymentGraphToFile", "", buf, 2u);
  }
}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_72(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) managedObjectHandler];
    id v5 = [v4 managedObjectContext];
    id v6 = +[BSSMO copyDeploymentUuidsForSsid:v3 moc:v5];

    if (v6)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_2;
      v10[3] = &unk_2644675F8;
      id v7 = v3;
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(a1 + 40);
      id v11 = v7;
      uint64_t v12 = v8;
      id v13 = v9;
      [v6 enumerateObjectsUsingBlock:v10];
    }
  }
}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = v3;
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 UUIDString];

      if (v6)
      {
        id v7 = [v5 UUIDString];
        id v8 = a1[4];
        uint64_t v9 = [a1[5] managedObjectHandler];
        uint64_t v10 = [v9 managedObjectContext];
        id v11 = +[BSSMO copyBssidsForDeployment:v8 deploymentUuid:v7 moc:v10];

        if (v11)
        {
          context = (void *)MEMORY[0x223C0F2E0]();
          uint64_t v12 = [NeighborGraph alloc];
          id v13 = a1[4];
          uint64_t v14 = [a1[5] managedObjectHandler];
          id v15 = [(NeighborGraph *)v12 initWithBssidArray:v11 ssid:v13 handler:v14];

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_3;
          v34[3] = &unk_2644675F8;
          id v16 = a1[4];
          id v17 = a1[5];
          id v35 = v16;
          id v36 = v17;
          id v18 = v15;
          uint64_t v37 = v18;
          [v11 enumerateObjectsUsingBlock:v34];
          id v31 = [(NeighborGraph *)v18 copyNeighborGraphAsDictionary];
          id v19 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v31];
          __int16 v20 = NSString;
          __int16 v33 = v7;
          id v21 = a1[4];
          __int16 v22 = [v5 UUIDString];
          __int16 v23 = [v20 stringWithFormat:@"%@(%@)", v21, v22];
          [v19 setObject:v23 forKey:@"deployment"];

          id v24 = a1[4];
          id v25 = [a1[5] managedObjectHandler];
          uint64_t v26 = [v25 managedObjectContext];
          __int16 v27 = +[JoinMO mostRecentJoin:0 ssid:v24 moc:v26];

          id v28 = [v27 bss];
          uint64_t v29 = [v28 apid];

          id v7 = v33;
          if ([v5 isEqual:v29]) {
            uint64_t v30 = MEMORY[0x263EFFA88];
          }
          else {
            uint64_t v30 = MEMORY[0x263EFFA80];
          }
          [v19 setObject:v30 forKey:@"isMostRecentlyUsedDeployment"];
          [a1[6] addObject:v19];
        }
      }
    }
  }
}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) managedObjectHandler];
  id v6 = [v5 managedObjectContext];
  id v7 = +[BSSMO getInstance:v3 ssid:v4 moc:v6];

  if (v7)
  {
    BOOL v8 = (int)[v7 channel] < 15;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v7 bssid];
    id v11 = [*(id *)(a1 + 40) managedObjectHandler];
    uint64_t v12 = [v11 managedObjectContext];
    unint64_t v13 = +[RoamMO dwellTimeInBand:v9 bandIs24:v8 bssid:v10 maxAgeInDays:0 moc:v12];

    uint64_t v14 = +[BSSMO bssManagedObjectPropertyValue:v7 forKey:@"NeighborInfo"];
    [*(id *)(a1 + 48) setNeighborsForBssid:v3 dwellTime:v13 neighborInfoArray:v14];
    if (v14)
    {
      id v28 = v7;
      id v25 = v14;
      id v26 = v3;
      id v15 = v14;
      if ([v15 count])
      {
        unint64_t v16 = 0;
        id v27 = v15;
        do
        {
          id v17 = objc_msgSend(v15, "objectAtIndex:", v16, v25, v26);
          id v18 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v29 = [v28 bssid];
            uint64_t v30 = [v17 valueForKey:@"NeighborBssid"];
            id v19 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiHigh"];
            __int16 v20 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiUpperHigh"];
            id v21 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiOptimum"];
            __int16 v22 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiMid"];
            __int16 v23 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiUpperMid"];
            id v24 = [v17 valueForKey:@"NeighborBssNumRoamOriginRssiLow"];
            *(_DWORD *)buf = 136448514;
            v32 = "-[AnalyticsStoreFileWriter writeDeploymentGraphToFile]_block_invoke_3";
            __int16 v33 = 1024;
            int v34 = 309;
            __int16 v35 = 2112;
            id v36 = v29;
            __int16 v37 = 2112;
            v38 = v30;
            __int16 v39 = 2112;
            v40 = v19;
            __int16 v41 = 2112;
            v42 = v20;
            __int16 v43 = 2112;
            v44 = v21;
            __int16 v45 = 2112;
            v46 = v22;
            __int16 v47 = 2112;
            v48 = v23;
            __int16 v49 = 2112;
            v50 = v24;
            _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Source:%@ Neighbor:%@ LowRssiRoam (High:%@ UpperHigh:%@ Opt:%@ Mid:%@ UpperMid:%@ Low:%@)", buf, 0x62u);

            id v15 = v27;
          }

          ++v16;
        }
        while (v16 < [v15 count]);
      }

      uint64_t v14 = v25;
      id v3 = v26;
      id v7 = v28;
    }
  }
}

- (id)batchedWriteAnalyticsStoreToFileWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4
{
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  unint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  id v7 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
  BOOL v8 = [v7 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFileWithBatchSize_maxAge___block_invoke;
  v11[3] = &unk_264467670;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  [v8 performBlockAndWait:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __81__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFileWithBatchSize_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v109 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) analyticsStoreFileWriterFilePath];
  id v3 = v2;
  if (!v2)
  {
    v70 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      __int16 v102 = 1024;
      int v103 = 364;
LABEL_57:
      _os_log_impl(&dword_21D96D000, v70, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
    }
LABEL_58:

    id v6 = 0;
    goto LABEL_62;
  }
  uint64_t v4 = (void *)MEMORY[0x263F08840];
  id v5 = [v2 path];
  id v6 = [v4 fileHandleForWritingAtPath:v5];

  if (!v6)
  {
    v70 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      __int16 v102 = 1024;
      int v103 = 367;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  uint64_t v7 = *(void *)(v1 + 48);
  BOOL v8 = WALogCategoryDeviceStoreHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      __int16 v102 = 1024;
      int v103 = 369;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:batchSize is 0", buf, 0x12u);
    }

LABEL_62:
    id v12 = 0;
LABEL_51:
    uint64_t v69 = *(void *)(*(void *)(v1 + 40) + 8);
    v65 = *(void **)(v69 + 40);
    *(void *)(v69 + 40) = 0;
    goto LABEL_52;
  }
  if (v9)
  {
    unint64_t v10 = *(void *)(v1 + 48);
    *(_DWORD *)buf = 136446722;
    v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
    __int16 v102 = 1024;
    int v103 = 371;
    __int16 v104 = 2048;
    unint64_t v105 = v10;
    _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:batchSize is %lu", buf, 0x1Cu);
  }
  uint64_t v80 = v1;
  v72 = v3;

  v71 = (void *)MEMORY[0x223C0F2E0]();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v11 = +[AnalyticsStoreProxy analyticsStoreEntityNames];
  uint64_t v83 = [v11 countByEnumeratingWithState:&v95 objects:v108 count:16];
  id v12 = 0;
  if (v83)
  {
    uint64_t v82 = *(void *)v96;
    v73 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v96 != v82) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void **)(*((void *)&v95 + 1) + 8 * v13);
        id v15 = (void *)MEMORY[0x223C0F2E0]();
        v85 = [MEMORY[0x263F089D8] string];
        unint64_t v16 = [MEMORY[0x263F089D8] string];
        id v17 = +[GeoTagMO entityName];
        if ([v14 isEqualToString:v17])
        {

LABEL_14:
          goto LABEL_37;
        }
        +[WiFiStatMO entityName];
        id v18 = v84 = v15;
        char v19 = [v14 isEqualToString:v18];

        id v15 = v84;
        if (v19) {
          goto LABEL_14;
        }
        __int16 v20 = objc_msgSend(*(id *)(v80 + 32), "stringifyObjectWithPadding:padding:padToLength:", v85, @"-", objc_msgSend(v14, "length") + 1);
        [v16 appendFormat:@"%@", v20];

        unint64_t v81 = (unint64_t)v14;
        id v21 = [NSString stringWithFormat:@"\n%@\n%@|\n", v16, v14];
        [v6 seekToEndOfFile];
        __int16 v22 = [v21 dataUsingEncoding:4];
        id v94 = 0;
        [v6 writeData:v22 error:&v94];
        id v23 = v94;

        if (v23)
        {
          v66 = WALogCategoryDeviceStoreHandle();
          id v11 = v73;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v67 = [v23 localizedDescription];
            double v68 = [v23 userInfo];
            *(_DWORD *)buf = 136446978;
            v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
            __int16 v102 = 1024;
            int v103 = 401;
            __int16 v104 = 2112;
            unint64_t v105 = (unint64_t)v67;
            __int16 v106 = 2112;
            double v107 = v68;
            _os_log_impl(&dword_21D96D000, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

            id v11 = v73;
          }

          id v12 = v23;
LABEL_50:

          id v3 = v72;
          uint64_t v1 = v80;
          goto LABEL_51;
        }

        v79 = [MEMORY[0x263F089D8] string];

        if (*(void *)(v80 + 56))
        {
          id v24 = +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v14);
          uint64_t v25 = [v24 copy];
        }
        else
        {
          uint64_t v25 = 0;
        }
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        double v27 = v26;
        id v28 = [*(id *)(v80 + 32) managedObjectHandler];
        uint64_t v29 = [v28 managedObjectContext];
        unint64_t v30 = +[AnalyticsStoreProxy entityCount:v14 withPredicate:v25 moc:v29];

        uint64_t v76 = [*(id *)(v80 + 32) relationshipKeyPathsForPrefetching:v14];
        id v31 = +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:batchSize:prefetch:](AnalyticsStoreProxy, "fetchRequestForEntityWithBatchSize:batchSize:prefetch:", v14, *(void *)(v80 + 48));
        v32 = [*(id *)(v80 + 32) managedObjectHandler];
        __int16 v33 = [v32 managedObjectContext];
        v77 = (void *)v25;
        int v34 = +[AnalyticsStoreProxy fetch:v31 withPredicate:v25 moc:v33];

        __int16 v35 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          double v36 = COERCE_DOUBLE([v34 count]);
          *(_DWORD *)buf = 136446978;
          v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
          __int16 v102 = 1024;
          int v103 = 417;
          __int16 v104 = 2048;
          unint64_t v105 = v30;
          __int16 v106 = 2048;
          double v107 = v36;
          _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects:%lu ResultCount:%lu", buf, 0x26u);
        }

        __int16 v37 = v84;
        if (!v34)
        {
          id v41 = 0;
          v78 = 0;
          v52 = (void *)v76;
          uint64_t v51 = v77;
LABEL_33:
          v53 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
            *(_DWORD *)buf = 136446978;
            v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
            __int16 v102 = 1024;
            int v103 = 448;
            __int16 v104 = 2112;
            unint64_t v105 = v81;
            __int16 v106 = 2048;
            double v107 = v54 - v27;
            _os_log_impl(&dword_21D96D000, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ Took %fs", buf, 0x26u);
          }

          id v12 = 0;
          char v55 = 1;
          goto LABEL_36;
        }
        v38 = (void *)MEMORY[0x223C0F2E0]();
        __int16 v39 = *(void **)(v80 + 32);
        id v92 = 0;
        id v93 = 0;
        [v39 stringifyManagedObjectsArray:v34 titleString:&v93 dataStringsArray:&v92];
        id v40 = v93;
        id v41 = v92;
        v42 = objc_msgSend(*(id *)(v80 + 32), "stringifyObjectWithPadding:padding:padToLength:", v85, @"-", objc_msgSend(v40, "length"));
        [v79 appendFormat:@"%@", v42];

        __int16 v43 = [NSString stringWithFormat:@"%@\n%@\n%@\n", v79, v40, v79];

        [v6 seekToEndOfFile];
        v44 = [v43 dataUsingEncoding:4];
        id v91 = 0;
        [v6 writeData:v44 error:&v91];
        id v12 = v91;

        v78 = v43;
        if (!v12)
        {
          context = v38;
          v75 = v34;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          id v41 = v41;
          uint64_t v45 = [v41 countByEnumeratingWithState:&v87 objects:v99 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v88;
            while (2)
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v88 != v47) {
                  objc_enumerationMutation(v41);
                }
                __int16 v49 = [*(id *)(*((void *)&v87 + 1) + 8 * i) stringByAppendingString:@"\n"];
                [v6 seekToEndOfFile];
                v50 = [v49 dataUsingEncoding:4];
                id v86 = 0;
                [v6 writeData:v50 error:&v86];
                id v12 = v86;

                if (v12)
                {
                  v56 = WALogCategoryDeviceStoreHandle();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    v57 = [v12 localizedDescription];
                    double v58 = [v12 userInfo];
                    *(_DWORD *)buf = 136446978;
                    v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
                    __int16 v102 = 1024;
                    int v103 = 443;
                    __int16 v104 = 2112;
                    unint64_t v105 = (unint64_t)v57;
                    __int16 v106 = 2112;
                    double v107 = v58;
                    _os_log_impl(&dword_21D96D000, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
                  }
                  char v55 = 0;
                  __int16 v37 = v84;
                  v52 = (void *)v76;
                  uint64_t v51 = v77;
                  int v34 = v75;
                  goto LABEL_36;
                }
              }
              uint64_t v46 = [v41 countByEnumeratingWithState:&v87 objects:v99 count:16];
              if (v46) {
                continue;
              }
              break;
            }
          }

          __int16 v37 = v84;
          v52 = (void *)v76;
          uint64_t v51 = v77;
          int v34 = v75;
          goto LABEL_33;
        }
        v59 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = [v12 localizedDescription];
          double v61 = [v12 userInfo];
          *(_DWORD *)buf = 136446978;
          v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
          __int16 v102 = 1024;
          int v103 = 432;
          __int16 v104 = 2112;
          unint64_t v105 = (unint64_t)v60;
          __int16 v106 = 2112;
          double v107 = v61;
          _os_log_impl(&dword_21D96D000, v59, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
        }
        char v55 = 0;
        __int16 v37 = v84;
        v52 = (void *)v76;
        uint64_t v51 = v77;
LABEL_36:

        id v11 = v73;
        if ((v55 & 1) == 0) {
          goto LABEL_50;
        }
LABEL_37:
        ++v13;
      }
      while (v13 != v83);
      uint64_t v62 = [v11 countByEnumeratingWithState:&v95 objects:v108 count:16];
      uint64_t v83 = v62;
    }
    while (v62);
  }

  [v6 closeFile];
  uint64_t v63 = [v3 path];
  uint64_t v64 = *(void *)(*(void *)(v80 + 40) + 8);
  v65 = *(void **)(v64 + 40);
  *(void *)(v64 + 40) = v63;
LABEL_52:
}

- (id)batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  unint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
  BOOL v8 = [v7 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToCSVFilesWithBatchSize_maxAge___block_invoke;
  v11[3] = &unk_264467670;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  [v8 performBlockAndWait:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __85__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToCSVFilesWithBatchSize_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectHandler];
  id v3 = [v2 persistenceManager];
  uint64_t v4 = [v3 managedObjectModel];
  id v5 = [v4 entities];

  uint64_t v52 = a1;
  id v6 = [*(id *)(a1 + 32) analyticsStoreFileWriterFilePath];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
      __int16 v60 = 1024;
      int v61 = 480;
      v44 = "%{public}s::%d:fileURL nil";
LABEL_34:
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, v44, buf, 0x12u);
    }
LABEL_35:

    __int16 v49 = 0;
    __int16 v39 = 0;
    goto LABEL_28;
  }
  BOOL v8 = (void *)MEMORY[0x263F08840];
  id v9 = [v6 path];
  uint64_t v10 = [v8 fileHandleForWritingAtPath:v9];

  id v11 = WALogCategoryDeviceStoreHandle();
  uint64_t v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
      __int16 v60 = 1024;
      int v61 = 483;
      v44 = "%{public}s::%d:fileHandle nil";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  uint64_t v46 = (void *)v10;
  uint64_t v47 = v7;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(v52 + 48);
    uint64_t v14 = *(void *)(v52 + 56);
    *(_DWORD *)buf = 136446978;
    v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
    __int16 v60 = 1024;
    int v61 = 485;
    __int16 v62 = 2048;
    uint64_t v63 = v13;
    __int16 v64 = 2048;
    uint64_t v65 = v14;
    _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:batchSize is %lu, maxAge is %lu days ago", buf, 0x26u);
  }

  id v15 = *(void **)(*(void *)(v52 + 32) + 8);
  unint64_t v16 = [MEMORY[0x263EFF910] date];
  __int16 v49 = [v15 stringFromDate:v16];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v45 = v5;
  id obj = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v54;
    unint64_t v20 = 0x264465000uLL;
    uint64_t v48 = *(void *)v54;
    do
    {
      uint64_t v21 = 0;
      uint64_t v50 = v18;
      do
      {
        if (*(void *)v54 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v22 = *(void **)(*((void *)&v53 + 1) + 8 * v21);
        id v23 = [v22 name];
        id v24 = [*(id *)(v20 + 2576) entityName];
        char v25 = [v23 isEqualToString:v24];

        if ((v25 & 1) == 0)
        {
          double v26 = WALogCategoryDeviceStoreHandle();
          if (os_signpost_enabled(v26))
          {
            uint64_t v27 = [v23 UTF8String];
            *(_DWORD *)buf = 136315138;
            v59 = (const char *)v27;
            _os_signpost_emit_with_name_impl(&dword_21D96D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CSV Export", "%s", buf, 0xCu);
          }

          uint64_t v29 = *(void *)(v52 + 48);
          uint64_t v28 = *(void *)(v52 + 56);
          unint64_t v30 = [*(id *)(v52 + 32) analyticsStoreFileWriterDirectory];
          id v31 = *(void **)(v52 + 32);
          uint64_t v32 = v31[1];
          __int16 v33 = [v31 managedObjectHandler];
          int v34 = [v33 managedObjectContext];
          __int16 v35 = +[AnalyticsStoreFileWriter exportEntityToCSV:v22 batchSize:v29 maxAge:v28 toURL:v30 fileDate:v49 dateFormatter:v32 inManagedObjectContext:v34];

          if (v35)
          {
            double v36 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
              __int16 v60 = 1024;
              int v61 = 504;
              __int16 v62 = 2112;
              uint64_t v63 = (uint64_t)v35;
              _os_log_impl(&dword_21D96D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Wrote CSV file %@", buf, 0x1Cu);
            }

            [*(id *)(*(void *)(*(void *)(v52 + 40) + 8) + 40) addObject:v35];
          }
          __int16 v37 = WALogCategoryDeviceStoreHandle();
          uint64_t v19 = v48;
          uint64_t v18 = v50;
          unint64_t v20 = 0x264465000;
          if (os_signpost_enabled(v37))
          {
            uint64_t v38 = [v23 UTF8String];
            *(_DWORD *)buf = 136315138;
            v59 = (const char *)v38;
            _os_signpost_emit_with_name_impl(&dword_21D96D000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CSV Export", "%s", buf, 0xCu);
          }
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v18);
  }

  __int16 v39 = v46;
  [v46 closeFile];
  id v40 = *(void **)(*(void *)(*(void *)(v52 + 40) + 8) + 40);
  if (!v40)
  {
    id v5 = v45;
    uint64_t v7 = v47;
LABEL_28:
    uint64_t v43 = *(void *)(*(void *)(v52 + 40) + 8);
    id v41 = *(NSObject **)(v43 + 40);
    *(void *)(v43 + 40) = 0;
    goto LABEL_29;
  }
  uint64_t v7 = v47;
  if (![v40 count])
  {
    id v5 = v45;
    goto LABEL_28;
  }
  id v41 = WALogCategoryDeviceStoreHandle();
  id v5 = v45;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [*(id *)(*(void *)(*(void *)(v52 + 40) + 8) + 40) count];
    *(_DWORD *)buf = 136446722;
    v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
    __int16 v60 = 1024;
    int v61 = 513;
    __int16 v62 = 2048;
    uint64_t v63 = v42;
    _os_log_impl(&dword_21D96D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Total CSVs written %lu", buf, 0x1Cu);
  }
LABEL_29:
}

- (id)batchedWriteAnalyticsStoreToFile:(unint64_t)a3 maxAge:(unint64_t)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5;
  unint64_t v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  uint64_t v7 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
  BOOL v8 = [v7 managedObjectContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFile_maxAge___block_invoke;
  v11[3] = &unk_264467670;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  [v8 performBlockAndWait:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __68__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFile_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v152 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) analyticsStoreFileWriterFilePath];
  id v3 = v2;
  if (!v2)
  {
    BOOL v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 539;
LABEL_95:
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
    }
LABEL_96:
    id v6 = 0;
LABEL_97:
    id v26 = 0;
    goto LABEL_77;
  }
  uint64_t v4 = (void *)MEMORY[0x263F08840];
  id v5 = [v2 path];
  id v6 = [v4 fileHandleForWritingAtPath:v5];

  if (!v6)
  {
    BOOL v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 542;
      goto LABEL_95;
    }
    goto LABEL_96;
  }
  uint64_t v7 = *(void *)(v1 + 48);
  BOOL v8 = WALogCategoryDeviceStoreHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 544;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is 0", buf, 0x12u);
    }
    goto LABEL_97;
  }
  if (v9)
  {
    unint64_t v10 = *(void *)(v1 + 48);
    *(_DWORD *)buf = 136446722;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    __int16 v145 = 1024;
    int v146 = 546;
    __int16 v147 = 2048;
    unint64_t v148 = v10;
    _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is %lu", buf, 0x1Cu);
  }

  id v11 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreToFile", "", buf, 2u);
  }

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  uint64_t v12 = +[AnalyticsStoreProxy analyticsStoreEntityNames];
  uint64_t v109 = [v12 countByEnumeratingWithState:&v137 objects:v151 count:16];
  if (!v109)
  {
LABEL_72:

    [v6 closeFile];
    uint64_t v83 = [v3 path];
    id v26 = 0;
    uint64_t v84 = *(void *)(*(void *)(v1 + 40) + 8);
    v85 = *(void **)(v84 + 40);
    *(void *)(v84 + 40) = v83;
    goto LABEL_78;
  }
  uint64_t v110 = *(void *)v138;
  uint64_t v114 = v1;
  v100 = v3;
  __int16 v102 = v12;
LABEL_10:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v138 != v110) {
      objc_enumerationMutation(v12);
    }
    uint64_t v14 = *(void **)(*((void *)&v137 + 1) + 8 * v13);
    id v15 = [MEMORY[0x263F089D8] string];
    unint64_t v16 = [MEMORY[0x263F089D8] string];
    id v17 = +[GeoTagMO entityName];
    if ([v14 isEqualToString:v17])
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
LABEL_69:

      goto LABEL_70;
    }
    unint64_t v20 = +[WiFiStatMO entityName];
    uint64_t v21 = v14;
    char v22 = [v14 isEqualToString:v20];

    if ((v22 & 1) == 0) {
      break;
    }
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v12 = v102;
LABEL_70:

    if (++v13 == v109)
    {
      id v3 = v100;
      uint64_t v109 = [v12 countByEnumeratingWithState:&v137 objects:v151 count:16];
      if (!v109) {
        goto LABEL_72;
      }
      goto LABEL_10;
    }
  }
  __int16 v104 = v15;
  id v23 = objc_msgSend(*(id *)(v1 + 32), "stringifyObjectWithPadding:padding:padToLength:", v15, @"-", objc_msgSend(v21, "length") + 1);
  [v16 appendFormat:@"%@", v23];

  v117 = v21;
  id v24 = [NSString stringWithFormat:@"\n%@\n%@|\n", v16, v21];
  [v6 seekToEndOfFile];
  char v25 = [v24 dataUsingEncoding:4];
  id v136 = 0;
  [v6 writeData:v25 error:&v136];
  id v26 = v136;

  if (v26)
  {
    long long v95 = WALogCategoryDeviceStoreHandle();
    BOOL v8 = v102;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      long long v96 = [v26 localizedDescription];
      double v97 = [v26 userInfo];
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 573;
      __int16 v147 = 2112;
      unint64_t v148 = (unint64_t)v96;
      __int16 v149 = 2112;
      double v150 = v97;
      _os_log_impl(&dword_21D96D000, v95, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

      uint64_t v1 = v114;
    }

    id v3 = v100;
    goto LABEL_77;
  }

  int v103 = [MEMORY[0x263F089D8] string];

  if (*(void *)(v1 + 56))
  {
    unint64_t v27 = 0x264465000uLL;
    uint64_t v28 = +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v21);
    uint64_t v29 = [v28 copy];
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v27 = 0x264465000uLL;
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v31 = v30;
  uint64_t v32 = [*(id *)(v1 + 32) managedObjectHandler];
  __int16 v33 = [v32 managedObjectContext];
  unint64_t v34 = +[AnalyticsStoreProxy entityCount:v21 withPredicate:v29 moc:v33];

  unint64_t v35 = *(void *)(v1 + 48);
  unint64_t v115 = v35;
  if (v34 > v35) {
    *(void *)&double v36 = v34 % v35;
  }
  else {
    double v36 = 0.0;
  }
  __int16 v37 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    __int16 v145 = 1024;
    int v146 = 592;
    __int16 v147 = 2048;
    unint64_t v148 = v34;
    __int16 v149 = 2048;
    double v150 = v36;
    _os_log_impl(&dword_21D96D000, v37, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects:%lu Remainder:%lu", buf, 0x26u);
  }
  v111 = (void *)v29;

  uint64_t v38 = [*(id *)(v1 + 32) relationshipKeyPathsForPrefetching:v117];
  double v101 = v36;
  unint64_t v105 = v38;
  unint64_t v106 = v34 - *(void *)&v36;
  if (v34 == *(void *)&v36)
  {
    unint64_t v39 = 0;
    uint64_t v18 = 0;
    id v40 = 0;
LABEL_28:
    v112 = v40;
    id v41 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 633;
      __int16 v147 = 2112;
      unint64_t v148 = (unint64_t)v117;
      __int16 v149 = 2048;
      double v150 = v42 - v31;
      _os_log_impl(&dword_21D96D000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ Took %fs", buf, 0x26u);
    }

    uint64_t v43 = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v45 = v44;
    if (v101 == 0.0)
    {
      uint64_t v12 = v102;
    }
    else
    {
      context = (void *)MEMORY[0x223C0F2E0](v43);
      uint64_t v46 = *(void **)(v27 + 2520);
      v118 = (char *)v39;
      uint64_t v47 = [v46 fetchRequestForEntityWithOffset:v117 limit:v115 offset:v39 prefetch:v38];
      uint64_t v48 = [*(id *)(v1 + 32) managedObjectHandler];
      __int16 v49 = [v48 managedObjectContext];
      uint64_t v50 = [v46 fetch:v47 withPredicate:v111 moc:v49];

      uint64_t v51 = (void *)v50;
      if (v50)
      {
        uint64_t v52 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
          __int16 v145 = 1024;
          int v146 = 640;
          __int16 v147 = 2048;
          unint64_t v148 = (unint64_t)v118;
          __int16 v149 = 2048;
          *(void *)&double v150 = &v118[*(void *)&v101];
          _os_log_impl(&dword_21D96D000, v52, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
        }

        long long v53 = *(void **)(v1 + 32);
        v126 = v18;
        id v127 = v112;
        v108 = v51;
        [v53 stringifyManagedObjectsArray:v51 titleString:&v127 dataStringsArray:&v126];
        id v119 = v127;

        long long v54 = v126;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        uint64_t v18 = v54;
        uint64_t v55 = [v18 countByEnumeratingWithState:&v122 objects:v141 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v123;
          while (2)
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v123 != v57) {
                objc_enumerationMutation(v18);
              }
              v59 = [*(id *)(*((void *)&v122 + 1) + 8 * i) stringByAppendingString:@"\n"];
              [v6 seekToEndOfFile];
              __int16 v60 = [v59 dataUsingEncoding:4];
              id v121 = 0;
              [v6 writeData:v60 error:&v121];
              id v26 = v121;

              if (v26)
              {
                id v92 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  id v93 = [v26 localizedDescription];
                  double v94 = [v26 userInfo];
                  *(_DWORD *)buf = 136446978;
                  v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
                  __int16 v145 = 1024;
                  int v146 = 651;
                  __int16 v147 = 2112;
                  unint64_t v148 = (unint64_t)v93;
                  __int16 v149 = 2112;
                  double v150 = v94;
                  _os_log_impl(&dword_21D96D000, v92, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
                }
                v71 = v18;
                v113 = v119;
                id v3 = v100;
                uint64_t v1 = v114;
                goto LABEL_84;
              }
            }
            uint64_t v56 = [v18 countByEnumeratingWithState:&v122 objects:v141 count:16];
            if (v56) {
              continue;
            }
            break;
          }
        }

        v112 = v119;
        uint64_t v1 = v114;
        uint64_t v12 = v102;
        uint64_t v38 = v105;
        uint64_t v51 = v108;
      }
      else
      {
        uint64_t v12 = v102;
      }
    }
    id v15 = v104;
    id v17 = v111;
    unint64_t v81 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      __int16 v145 = 1024;
      int v146 = 657;
      __int16 v147 = 2112;
      unint64_t v148 = (unint64_t)v117;
      __int16 v149 = 2048;
      double v150 = v82 - v45;
      _os_log_impl(&dword_21D96D000, v81, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ reminder took %fs", buf, 0x26u);
    }

    unint64_t v16 = v103;
    uint64_t v19 = v112;
    goto LABEL_69;
  }
  int v61 = 0;
  uint64_t v18 = 0;
  char v107 = 0;
  unint64_t v39 = 0;
  while (1)
  {
    context = (void *)MEMORY[0x223C0F2E0]();
    __int16 v62 = *(void **)(v27 + 2520);
    v120 = (char *)v39;
    uint64_t v63 = [v62 fetchRequestForEntityWithOffset:v117 limit:v115 offset:v39 prefetch:v38];
    __int16 v64 = [*(id *)(v1 + 32) managedObjectHandler];
    uint64_t v65 = [v64 managedObjectContext];
    uint64_t v66 = [v62 fetch:v63 withPredicate:v111 moc:v65];

    v67 = (void *)v66;
    if (v66) {
      break;
    }
    id v40 = v61;
    unint64_t v39 = (unint64_t)v120;
LABEL_61:

    uint64_t v1 = v114;
    unint64_t v27 = 0x264465000;
    if (v39 >= v106) {
      goto LABEL_28;
    }
  }
  double v68 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    __int16 v145 = 1024;
    int v146 = 600;
    __int16 v147 = 2048;
    unint64_t v148 = (unint64_t)v120;
    __int16 v149 = 2048;
    *(void *)&double v150 = &v120[v115 - 1];
    _os_log_impl(&dword_21D96D000, v68, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
  }

  uint64_t v1 = v114;
  uint64_t v69 = *(void **)(v114 + 32);
  v134 = v18;
  id v135 = v61;
  v108 = v67;
  [v69 stringifyManagedObjectsArray:v67 titleString:&v135 dataStringsArray:&v134];
  id v70 = v135;

  v71 = v134;
  if (v107)
  {
    v113 = v70;
LABEL_52:
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v18 = v71;
    uint64_t v75 = [v18 countByEnumeratingWithState:&v129 objects:v142 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v130;
      while (2)
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v130 != v77) {
            objc_enumerationMutation(v18);
          }
          v79 = [*(id *)(*((void *)&v129 + 1) + 8 * j) stringByAppendingString:@"\n"];
          [v6 seekToEndOfFile];
          uint64_t v80 = [v79 dataUsingEncoding:4];
          id v128 = 0;
          [v6 writeData:v80 error:&v128];
          id v26 = v128;

          if (v26)
          {
            id v86 = WALogCategoryDeviceStoreHandle();
            long long v87 = v111;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              long long v88 = [v26 localizedDescription];
              double v89 = [v26 userInfo];
              *(_DWORD *)buf = 136446978;
              v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
              __int16 v145 = 1024;
              int v146 = 627;
              __int16 v147 = 2112;
              unint64_t v148 = (unint64_t)v88;
              __int16 v149 = 2112;
              double v150 = v89;
              _os_log_impl(&dword_21D96D000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
            }
            v71 = v18;
            id v3 = v100;
            uint64_t v1 = v114;
            BOOL v8 = v102;
            goto LABEL_76;
          }
        }
        uint64_t v76 = [v18 countByEnumeratingWithState:&v129 objects:v142 count:16];
        if (v76) {
          continue;
        }
        break;
      }
    }
    unint64_t v39 = (unint64_t)&v120[v115];

    char v107 = 1;
    id v40 = v113;
    int v61 = v113;
    uint64_t v38 = v105;
    v67 = v108;
    goto LABEL_61;
  }
  v72 = objc_msgSend(*(id *)(v114 + 32), "stringifyObjectWithPadding:padding:padToLength:", v104, @"-", objc_msgSend(v70, "length"));
  [v103 appendFormat:@"%@", v72];

  v73 = [NSString stringWithFormat:@"%@\n%@\n%@\n", v103, v70, v103];

  [v6 seekToEndOfFile];
  v74 = [v73 dataUsingEncoding:4];
  id v133 = 0;
  [v6 writeData:v74 error:&v133];
  id v26 = v133;

  if (!v26)
  {
    v113 = v73;
    goto LABEL_52;
  }
  uint64_t v18 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    long long v98 = [v26 localizedDescription];
    double v99 = [v26 userInfo];
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    __int16 v145 = 1024;
    int v146 = 614;
    __int16 v147 = 2112;
    unint64_t v148 = (unint64_t)v98;
    __int16 v149 = 2112;
    double v150 = v99;
    _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
  }
  v113 = v73;
  id v3 = v100;
LABEL_84:
  BOOL v8 = v102;
  long long v87 = v111;
LABEL_76:

LABEL_77:

  uint64_t v90 = *(void *)(*(void *)(v1 + 40) + 8);
  v85 = *(void **)(v90 + 40);
  *(void *)(v90 + 40) = 0;
LABEL_78:

  id v91 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v91))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v91, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreToFile", "", buf, 2u);
  }
}

- (id)writeAnalyticsStoreToFile
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__5;
  uint64_t v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  id v3 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
  uint64_t v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__AnalyticsStoreFileWriter_writeAnalyticsStoreToFile__block_invoke;
  v7[3] = &unk_264467648;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__AnalyticsStoreFileWriter_writeAnalyticsStoreToFile__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v98 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) analyticsStoreFileWriterFilePath];
  id v3 = v2;
  if (!v2)
  {
    v59 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_51;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
    __int16 v91 = 1024;
    int v92 = 688;
    goto LABEL_50;
  }
  uint64_t v4 = (void *)MEMORY[0x263F08840];
  id v5 = [v2 path];
  id v6 = [v4 fileHandleForWritingAtPath:v5];

  if (v6)
  {
    __int16 v64 = v3;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    uint64_t v7 = +[AnalyticsStoreProxy analyticsStoreEntityNames];
    uint64_t v72 = [v7 countByEnumeratingWithState:&v84 objects:v97 count:16];
    id v8 = 0;
    if (!v72) {
      goto LABEL_38;
    }
    uint64_t v71 = *(void *)v85;
    unint64_t v9 = 0x264465000uLL;
    id obj = v7;
    uint64_t v65 = v1;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v85 != v71) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = v10;
        id v11 = *(void **)(*((void *)&v84 + 1) + 8 * v10);
        uint64_t v12 = [MEMORY[0x263F089D8] string];
        id v13 = [MEMORY[0x263F089D8] string];
        uint64_t v14 = +[GeoTagMO entityName];
        if ([v11 isEqualToString:v14])
        {

LABEL_11:
          goto LABEL_32;
        }
        [*(id *)(v9 + 3568) entityName];
        id v15 = v73 = v12;
        char v16 = [v11 isEqualToString:v15];

        uint64_t v12 = v73;
        if (v16) {
          goto LABEL_11;
        }
        id v17 = objc_msgSend(*(id *)(v1 + 32), "stringifyObjectWithPadding:padding:padToLength:", v73, @"-", objc_msgSend(v11, "length") + 1);
        [v13 appendFormat:@"%@", v17];

        uint64_t v18 = v1;
        uint64_t v19 = [NSString stringWithFormat:@"\n%@\n%@|\n", v13, v11];
        [v6 seekToEndOfFile];
        unint64_t v20 = [v19 dataUsingEncoding:4];
        id v83 = 0;
        [v6 writeData:v20 error:&v83];
        id v21 = v83;

        if (v21)
        {
          int v61 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            __int16 v62 = [v21 localizedDescription];
            double v63 = [v21 userInfo];
            *(_DWORD *)buf = 136446978;
            uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            __int16 v91 = 1024;
            int v92 = 715;
            __int16 v93 = 2112;
            double v94 = v62;
            __int16 v95 = 2112;
            double v96 = v63;
            _os_log_impl(&dword_21D96D000, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
          }
          goto LABEL_40;
        }

        char v22 = [MEMORY[0x263F089D8] string];

        uint64_t v68 = MEMORY[0x223C0F2E0]();
        id v23 = *(void **)(v1 + 32);
        id v24 = [v23 managedObjectHandler];
        char v25 = [v24 managedObjectContext];
        uint64_t v66 = v11;
        id v26 = +[AnalyticsStoreProxy fetchAll:v11 moc:v25];
        id v81 = 0;
        id v82 = 0;
        [v23 stringifyManagedObjectsArray:v26 titleString:&v82 dataStringsArray:&v81];
        id v27 = v82;
        id v28 = v81;

        uint64_t v29 = objc_msgSend(*(id *)(v18 + 32), "stringifyObjectWithPadding:padding:padToLength:", v73, @"-", objc_msgSend(v27, "length"));
        [v22 appendFormat:@"%@", v29];

        uint64_t v69 = v22;
        double v30 = [NSString stringWithFormat:@"%@\n%@\n%@\n", v22, v27, v22];

        [v6 seekToEndOfFile];
        v67 = v30;
        double v31 = [v30 dataUsingEncoding:4];
        id v80 = 0;
        [v6 writeData:v31 error:&v80];
        id v8 = v80;

        id v32 = v28;
        if (v8)
        {
          uint64_t v48 = v73;
          uint64_t v1 = v18;
          unint64_t v35 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            long long v53 = [v8 localizedDescription];
            double v54 = [v8 userInfo];
            *(_DWORD *)buf = 136446978;
            uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            __int16 v91 = 1024;
            int v92 = 732;
            __int16 v93 = 2112;
            double v94 = v53;
            __int16 v95 = 2112;
            double v96 = v54;
            _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

            uint64_t v48 = v73;
          }
          int v47 = 0;
          unint64_t v9 = 0x264465000;
LABEL_30:
          __int16 v49 = (void *)v68;
          __int16 v37 = v32;
        }
        else
        {
          [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
          double v34 = v33;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          unint64_t v35 = v28;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v76 objects:v88 count:16];
          __int16 v37 = v28;
          if (v36)
          {
            uint64_t v38 = v36;
            uint64_t v39 = 0;
            uint64_t v40 = *(void *)v77;
            while (2)
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v77 != v40) {
                  objc_enumerationMutation(v35);
                }
                double v42 = [*(id *)(*((void *)&v76 + 1) + 8 * i) stringByAppendingString:@"\n"];
                uint64_t v43 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  double v44 = COERCE_DOUBLE([v35 count]);
                  *(_DWORD *)buf = 136446978;
                  uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
                  __int16 v91 = 1024;
                  int v92 = 739;
                  __int16 v93 = 2048;
                  double v94 = (void *)(v39 + i);
                  __int16 v95 = 2048;
                  double v96 = v44;
                  _os_log_impl(&dword_21D96D000, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
                }

                [v6 seekToEndOfFile];
                double v45 = [v42 dataUsingEncoding:4];
                id v75 = 0;
                [v6 writeData:v45 error:&v75];
                id v8 = v75;

                if (v8)
                {
                  uint64_t v50 = WALogCategoryDeviceStoreHandle();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v51 = [v8 localizedDescription];
                    double v52 = [v8 userInfo];
                    *(_DWORD *)buf = 136446978;
                    uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
                    __int16 v91 = 1024;
                    int v92 = 746;
                    __int16 v93 = 2112;
                    double v94 = v51;
                    __int16 v95 = 2112;
                    double v96 = v52;
                    _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);
                  }
                  int v47 = 0;
                  uint64_t v1 = v65;
                  unint64_t v9 = 0x264465000;
                  uint64_t v48 = v73;
                  goto LABEL_30;
                }
              }
              __int16 v37 = v32;
              uint64_t v38 = [v35 countByEnumeratingWithState:&v76 objects:v88 count:16];
              v39 += i;
              if (v38) {
                continue;
              }
              break;
            }
          }

          unint64_t v35 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
            *(_DWORD *)buf = 136446978;
            uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            __int16 v91 = 1024;
            int v92 = 749;
            __int16 v93 = 2112;
            double v94 = v66;
            __int16 v95 = 2048;
            double v96 = v46 - v34;
            _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ reminder took %fs", buf, 0x26u);
          }
          id v8 = 0;
          int v47 = 1;
          uint64_t v1 = v65;
          unint64_t v9 = 0x264465000;
          uint64_t v48 = v73;
          __int16 v49 = (void *)v68;
        }

        if (!v47)
        {
          id v21 = v8;
LABEL_40:
          id v3 = v64;
          v59 = obj;
          goto LABEL_41;
        }
LABEL_32:
        uint64_t v10 = v74 + 1;
      }
      while (v74 + 1 != v72);
      uint64_t v7 = obj;
      uint64_t v55 = [obj countByEnumeratingWithState:&v84 objects:v97 count:16];
      uint64_t v72 = v55;
      if (!v55)
      {
LABEL_38:

        [v6 closeFile];
        id v3 = v64;
        uint64_t v56 = [v64 path];
        uint64_t v57 = *(void *)(*(void *)(v1 + 40) + 8);
        double v58 = *(void **)(v57 + 40);
        *(void *)(v57 + 40) = v56;
        id v21 = v8;
        goto LABEL_42;
      }
    }
  }
  v59 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
    __int16 v91 = 1024;
    int v92 = 691;
LABEL_50:
    _os_log_impl(&dword_21D96D000, v59, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
  }
LABEL_51:
  id v6 = 0;
  id v21 = 0;
LABEL_41:

  uint64_t v60 = *(void *)(*(void *)(v1 + 40) + 8);
  double v58 = *(void **)(v60 + 40);
  *(void *)(v60 + 40) = 0;
LABEL_42:
}

- (id)relationshipKeyPathsForPrefetching:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = +[NetworkMO entityName];
  char v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = @"bss";
LABEL_14:
    [v4 addObject:v7];
    id v20 = v4;
    goto LABEL_15;
  }
  id v8 = +[BSSMO entityName];
  char v9 = [v3 isEqualToString:v8];

  if (v9)
  {
    uint64_t v7 = @"network";
    goto LABEL_14;
  }
  uint64_t v10 = +[LeaveMO entityName];
  char v11 = [v3 isEqualToString:v10];

  if ((v11 & 1) != 0
    || (+[JoinMO entityName],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v3 isEqualToString:v12],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v7 = @"bss.network";
    uint64_t v14 = @"bss";
LABEL_13:
    [v4 addObject:v14];
    goto LABEL_14;
  }
  id v15 = +[RoamMO entityName];
  char v16 = [v3 isEqualToString:v15];

  if (v16)
  {
    uint64_t v7 = @"target";
    uint64_t v14 = @"source.network";
    id v17 = @"source";
LABEL_12:
    [v4 addObject:v17];
    goto LABEL_13;
  }
  uint64_t v18 = +[SessionMO entityName];
  int v19 = [v3 isEqualToString:v18];

  if (v19)
  {
    [v4 addObject:@"join.bss.bssid"];
    [v4 addObject:@"leave.bss.bssid"];
    uint64_t v7 = @"roamsSet.target.bssid";
    uint64_t v14 = @"roamsSet.source.bssid";
    id v17 = @"leave.date";
    goto LABEL_12;
  }
  id v20 = 0;
LABEL_15:

  return v20;
}

- (id)stringifyRelationship:(id)a3 name:(id *)a4
{
  v110[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 ssid];
    id v8 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
    char v9 = [v8 managedObjectContext];
    id v10 = +[BSSMO allBssidsForSsid:v7 moc:v9];

    if (v10)
    {
      char v11 = @"bssids";
LABEL_7:
      *a4 = v11;
      id v15 = [v10 componentsJoinedByString:@","];
LABEL_8:

      goto LABEL_26;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v6 bssid];
    char v13 = [(AnalyticsStoreFileWriter *)self managedObjectHandler];
    uint64_t v14 = [v13 managedObjectContext];
    id v10 = +[BSSMO allSsidsForBssid:v12 moc:v14];

    if (v10)
    {
      char v11 = @"ssids";
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v6;
      id v17 = [v16 bss];
      uint64_t v18 = [v16 bss];

      int v19 = [v18 network];
    }
    else
    {
      int v19 = 0;
      id v17 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = v6;
      uint64_t v21 = [v20 bss];

      char v22 = [v20 bss];

      uint64_t v23 = [v22 network];

      int v19 = (void *)v23;
      id v17 = (void *)v21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v6;
      uint64_t v25 = [v24 bss];

      id v26 = [v24 bss];

      uint64_t v27 = [v26 network];

      int v19 = (void *)v27;
      id v17 = (void *)v25;
    }
    uint64_t v28 = [v19 ssid];
    uint64_t v29 = [v17 bssid];
    *a4 = @"ssid-bssid";
    if (v28) {
      double v30 = (__CFString *)v28;
    }
    else {
      double v30 = @"(nil)";
    }
    if (v29) {
      double v31 = (__CFString *)v29;
    }
    else {
      double v31 = @"(nil)";
    }
    id v15 = [NSString stringWithFormat:@"%@-%@", v30, v31];
  }
  else
  {
    int v103 = a4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v6;
      double v33 = [v10 source];
      double v34 = [v10 target];
      unint64_t v35 = [v10 source];
      uint64_t v36 = [v35 network];

      uint64_t v37 = [v36 ssid];
      uint64_t v38 = [v33 bssid];
      uint64_t v39 = [v34 bssid];
      if (v37) {
        uint64_t v40 = (__CFString *)v37;
      }
      else {
        uint64_t v40 = @"(nil)";
      }
      if (v38) {
        id v41 = (__CFString *)v38;
      }
      else {
        id v41 = @"(nil)";
      }
      if (v39) {
        double v42 = (__CFString *)v39;
      }
      else {
        double v42 = @"(nil)";
      }
      *int v103 = @"ssid:bssidSource->bssidTarget";
      id v15 = [NSString stringWithFormat:@"%@:%@->%@", v40, v41, v42];

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v43 = v6;
      double v44 = [v43 join];
      double v45 = [v43 leave];
      double v46 = [v43 roamsSet];
      double v99 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
      v110[0] = v99;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:1];
      uint64_t v98 = v101 = v46;
      int v47 = objc_msgSend(v46, "sortedArrayUsingDescriptors:");
      uint64_t v48 = [v44 bss];
      __int16 v49 = [v48 network];
      uint64_t v50 = [v49 ssid];

      uint64_t v51 = [v44 bss];
      uint64_t v52 = [v51 bssid];

      if (v50) {
        long long v53 = (__CFString *)v50;
      }
      else {
        long long v53 = @"(nil)";
      }
      if (v52) {
        double v54 = (__CFString *)v52;
      }
      else {
        double v54 = @"(nil)";
      }
      uint64_t v55 = [MEMORY[0x263F089D8] string];
      uint64_t v56 = v47;
      id v15 = [MEMORY[0x263F089D8] string];
      double v96 = v55;
      [v55 appendFormat:@"ssid:joinedBssid"];
      double v97 = v53;
      [v15 appendFormat:@"%@:%@", v53, v54];
      if ([v47 count])
      {
        __int16 v93 = v45;
        double v94 = v44;
        id v95 = v43;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        int v92 = v47;
        id v57 = v47;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v104 objects:v109 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v105;
          do
          {
            for (uint64_t i = 0; i != v59; ++i)
            {
              if (*(void *)v105 != v60) {
                objc_enumerationMutation(v57);
              }
              __int16 v62 = *(void **)(*((void *)&v104 + 1) + 8 * i);
              double v63 = [v62 target];
              __int16 v64 = [v63 bssid];

              if (v64)
              {
                uint64_t v65 = [v62 target];
                uint64_t v66 = [v65 bssid];

                [v15 appendFormat:@"->%@", v66];
                double v54 = (__CFString *)v66;
              }
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v104 objects:v109 count:16];
          }
          while (v59);
        }

        id v43 = v95;
        double v45 = v93;
        double v44 = v94;
        uint64_t v56 = v92;
      }
      v67 = [v45 bss];
      uint64_t v68 = [v67 bssid];

      [v96 appendFormat:@"->bssid"];
      [v15 appendFormat:@"->%@", v68];
      id v69 = v96;
      *int v103 = v69;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v102 = v6;
        id v70 = [v102 origin];
        uint64_t v71 = [v102 result];
        uint64_t v72 = v70;
        v100 = v70;
        uint64_t v73 = [v70 bssid];
        uint64_t v74 = [v71 bssid];
        if (v73) {
          id v75 = (__CFString *)v73;
        }
        else {
          id v75 = @"(nil)";
        }
        if (v74) {
          long long v76 = (__CFString *)v74;
        }
        else {
          long long v76 = @"(nil)";
        }
        *a4 = @"(origin)ssid:bssid (result)ssid:bssid";
        long long v77 = NSString;
        long long v78 = [v72 network];
        long long v79 = [v78 ssid];
        [v71 network];
        v81 = id v80 = v6;
        id v82 = [v81 ssid];
        id v15 = [v77 stringWithFormat:@"%@:%@ %@:%@", v79, v75, v82, v76];

        id v6 = v80;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_76;
        }
        id v83 = v6;
        long long v84 = [v83 bss];
        long long v85 = [v84 bssid];

        id v15 = [v83 bss];
        long long v86 = [v15 network];
        long long v87 = [v86 ssid];

        long long v88 = @"(nil)";
        if (v87) {
          double v89 = v87;
        }
        else {
          double v89 = @"(nil)";
        }
        if (v85) {
          long long v88 = v85;
        }
        v108[0] = v89;
        v108[1] = v88;
        uint64_t v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:2];
        __int16 v91 = v90;
        if (v90)
        {
          *a4 = @"ssid,bssid";
          id v15 = [v90 componentsJoinedByString:@": "];
        }

        if (!v91) {
LABEL_76:
        }
          id v15 = 0;
      }
    }
  }
LABEL_26:

  return v15;
}

- (void)stringifyManagedObjectsArray:(id)a3 titleString:(id *)a4 dataStringsArray:(id *)a5
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  id v8 = a3;
  char v9 = [MEMORY[0x263EFF980] array];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v10 = v8;
  uint64_t v72 = [v10 countByEnumeratingWithState:&v90 objects:v118 count:16];
  if (!v72)
  {

    uint64_t v74 = 0;
    goto LABEL_79;
  }
  uint64_t v66 = a4;
  v67 = a5;
  uint64_t v74 = 0;
  id obj = v10;
  uint64_t v70 = *(void *)v91;
  unint64_t v11 = 0x264465000uLL;
  uint64_t v71 = v9;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v91 != v70) {
        objc_enumerationMutation(obj);
      }
      uint64_t v73 = v12;
      char v13 = *(void **)(*((void *)&v90 + 1) + 8 * v12);
      long long v76 = [MEMORY[0x263EFF980] array];
      unsigned int outCount = 0;
      uint64_t v14 = (objc_class *)objc_opt_class();
      long long v78 = class_copyPropertyList(v14, &outCount);
      id v15 = v74;
      if (outCount)
      {
        uint64_t v16 = 0;
        id v75 = v13;
        while (1)
        {
          id v17 = (void *)MEMORY[0x223C0F2E0]();
          Name = property_getName(v78[v16]);
          if (Name) {
            break;
          }
LABEL_27:
          if (++v16 >= (unint64_t)outCount) {
            goto LABEL_56;
          }
        }
        long long v79 = v17;
        int v19 = [NSString stringWithUTF8String:Name];
        id v20 = [*(id *)(v11 + 2520) analyticsStoreEntityRelationshipNames];
        char v21 = [v20 containsObject:v19];

        if (v21)
        {
          long long v77 = v19;
          id v88 = 0;
          char v22 = [(AnalyticsStoreFileWriter *)self stringifyRelationship:v13 name:&v88];
          id v23 = v88;
          id v24 = v23;
          if (v22)
          {
            v96[0] = @"name";
            v96[1] = @"value";
            v97[0] = v23;
            v97[1] = v22;
            v96[2] = @"length";
            uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v22, "length"));
            v97[2] = v25;
            id v26 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:3];

            if (([v76 containsObject:v26] & 1) == 0) {
              [v76 addObject:v26];
            }
            unint64_t v11 = 0x264465000;
          }
          else
          {
            id v26 = 0;
          }

          char v13 = v75;
LABEL_25:

          uint64_t v28 = v77;
LABEL_26:

          id v17 = v79;
          goto LABEL_27;
        }
        uint64_t v27 = [v13 valueForKey:v19];

        uint64_t v28 = v19;
        if (v27)
        {
          if (([v19 containsString:@"hist"] & 1) != 0
            || ([v19 containsString:@"channels"] & 1) != 0
            || ([v19 containsString:@"parsedBeacon"] & 1) != 0
            || ([v19 containsString:@"unparsedBeacon"] & 1) != 0)
          {
            goto LABEL_26;
          }
          long long v77 = v19;
          if ([v19 containsString:@"ssid"])
          {
            v117[0] = v19;
            v116[0] = @"name";
            v116[1] = @"value";
            uint64_t v29 = NSString;
            double v30 = [v13 valueForKey:v19];
            uint64_t v68 = [v29 stringWithFormat:@"%@", v30];
            double v31 = [v68 redactedForWiFi];
            v117[1] = v31;
            v116[2] = @"length";
            id v32 = [NSNumber numberWithUnsignedLong:20];
            v117[2] = v32;
            double v33 = NSDictionary;
            double v34 = v117;
            unint64_t v35 = v116;
            goto LABEL_33;
          }
          if (([v19 containsString:@"date"] & 1) != 0
            || ([v19 containsString:@"lastSeen"] & 1) != 0
            || [v19 containsString:@"end"])
          {
            double v30 = [v13 valueForKey:v19];
            uint64_t v68 = [MEMORY[0x263EFFA18] defaultTimeZone];
            uint64_t v36 = [v68 secondsFromGMTForDate:v30];
            v115[0] = v28;
            v114[0] = @"name";
            v114[1] = @"value";
            double v31 = [MEMORY[0x263EFF910] dateWithTimeInterval:v30 sinceDate:(double)v36];
            v115[1] = v31;
            v114[2] = @"length";
            id v32 = [NSNumber numberWithUnsignedLong:20];
            v115[2] = v32;
            double v33 = NSDictionary;
            double v34 = v115;
            unint64_t v35 = v114;
            goto LABEL_33;
          }
          if (([v19 containsString:@"neighborChannels"] & 1) != 0
            || ([v19 containsString:@"neighborBSSIDs"] & 1) != 0
            || [v19 containsString:@"neighborCache"])
          {
            v113[0] = v19;
            v112[0] = @"name";
            v112[1] = @"value";
            double v30 = +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v13, 0, "-[AnalyticsStoreFileWriter stringifyManagedObjectsArray:titleString:dataStringsArray:]");
            uint64_t v37 = [(AnalyticsStoreFileWriter *)self stringifyValueArray:v30];
            v113[1] = v37;
            v112[2] = @"length";
            uint64_t v38 = [NSNumber numberWithUnsignedLong:20];
            v113[2] = v38;
            id v26 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:3];

            char v13 = v75;
            goto LABEL_38;
          }
          if (([v19 containsString:@"apid"] & 1) != 0
            || ([v19 containsString:@"apPhysicalScopeId"] & 1) != 0
            || ([v19 containsString:@"idUsedInMetric"] & 1) != 0
            || [v19 containsString:@"colocatedScopeId"])
          {
            v111[0] = v19;
            v110[0] = @"name";
            v110[1] = @"value";
            double v30 = [v13 valueForKey:v19];
            v111[1] = v30;
            v110[2] = @"length";
            uint64_t v37 = [NSNumber numberWithUnsignedLong:37];
            v111[2] = v37;
            uint64_t v39 = NSDictionary;
            uint64_t v40 = v111;
            id v41 = v110;
LABEL_44:
            id v26 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:3];
LABEL_38:
          }
          else
          {
            if (([v19 containsString:@"fwReason"] & 1) != 0
              || [v19 containsString:@"status"])
            {
              v109[0] = v19;
              v108[0] = @"name";
              v108[1] = @"value";
              double v30 = [v13 valueForKey:v19];
              v109[1] = v30;
              void v108[2] = @"length";
              uint64_t v37 = [NSNumber numberWithUnsignedLong:12];
              v109[2] = v37;
              uint64_t v39 = NSDictionary;
              uint64_t v40 = v109;
              id v41 = v108;
              goto LABEL_44;
            }
            if (([v19 containsString:@"ipv4Addr"] & 1) != 0
              || [v19 containsString:@"ipv4routerAddr"])
            {
              double v42 = [v13 valueForKey:v19];
              in_addr_t v43 = [v42 intValue];

              v107[0] = v19;
              v106[0] = @"name";
              v106[1] = @"value";
              v44.s_addr = v43;
              double v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s", inet_ntoa(v44));
              v107[1] = v30;
              v106[2] = @"length";
              uint64_t v37 = [NSNumber numberWithUnsignedLong:16];
              v107[2] = v37;
              uint64_t v39 = NSDictionary;
              uint64_t v40 = v107;
              id v41 = v106;
              goto LABEL_44;
            }
            if (![v19 containsString:@"routerMAC"])
            {
              if ([v19 containsString:@"type"])
              {
                v103[0] = v19;
                v102[0] = @"name";
                v102[1] = @"value";
                double v30 = [v13 valueForKey:v19];
                v103[1] = v30;
                v102[2] = @"length";
                uint64_t v37 = [NSNumber numberWithUnsignedLong:48];
                v103[2] = v37;
                uint64_t v39 = NSDictionary;
                uint64_t v40 = v103;
                id v41 = v102;
              }
              else
              {
                v101[0] = v19;
                v100[0] = @"name";
                v100[1] = @"value";
                double v30 = [v13 valueForKey:v19];
                v101[1] = v30;
                v100[2] = @"length";
                uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v28, "length"));
                v101[2] = v37;
                uint64_t v39 = NSDictionary;
                uint64_t v40 = v101;
                id v41 = v100;
              }
              goto LABEL_44;
            }
            v105[0] = v19;
            v104[0] = @"name";
            v104[1] = @"value";
            double v45 = NSString;
            double v30 = [v13 valueForKey:v19];
            uint64_t v68 = [v45 stringWithFormat:@"%@", v30];
            double v31 = [v68 redactedForWiFi];
            v105[1] = v31;
            v104[2] = @"length";
            id v32 = [NSNumber numberWithUnsignedLong:20];
            v105[2] = v32;
            double v33 = NSDictionary;
            double v34 = v105;
            unint64_t v35 = v104;
LABEL_33:
            id v26 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:3];

            char v13 = v75;
          }
        }
        else
        {
          v98[0] = @"name";
          v98[1] = @"value";
          v99[0] = v19;
          v99[1] = @"(nil)";
          v98[2] = @"length";
          long long v77 = v19;
          double v30 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v19, "length"));
          v99[2] = v30;
          id v26 = [NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:3];
        }

        [v76 addObject:v26];
        goto LABEL_25;
      }
LABEL_56:
      free(v78);
      double v46 = v76;
      if (!v74)
      {
        id v15 = [MEMORY[0x263F089D8] string];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v47 = v76;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v84 objects:v95 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v85 != v50) {
                objc_enumerationMutation(v47);
              }
              uint64_t v52 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              long long v53 = [v52 valueForKey:@"name"];
              double v54 = [v52 valueForKey:@"length"];
              uint64_t v55 = -[AnalyticsStoreFileWriter stringifyObjectWithPadding:padding:padToLength:](self, "stringifyObjectWithPadding:padding:padToLength:", v53, @" ", [v54 unsignedLongValue]);
              [v15 appendFormat:@"%@|", v55];
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v84 objects:v95 count:16];
          }
          while (v49);
        }

        double v46 = v76;
      }
      uint64_t v74 = v15;
      uint64_t v56 = [MEMORY[0x263F089D8] string];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v57 = v46;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v59; ++j)
          {
            if (*(void *)v81 != v60) {
              objc_enumerationMutation(v57);
            }
            __int16 v62 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            double v63 = [v62 valueForKey:@"value"];
            __int16 v64 = [v62 valueForKey:@"length"];
            uint64_t v65 = -[AnalyticsStoreFileWriter stringifyObjectWithPadding:padding:padToLength:](self, "stringifyObjectWithPadding:padding:padToLength:", v63, @" ", [v64 unsignedLongValue]);
            [v56 appendFormat:@"%@|", v65];
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v80 objects:v94 count:16];
        }
        while (v59);
      }

      char v9 = v71;
      [v71 addObject:v56];

      uint64_t v12 = v73 + 1;
      unint64_t v11 = 0x264465000;
    }
    while (v73 + 1 != v72);
    uint64_t v72 = [obj countByEnumeratingWithState:&v90 objects:v118 count:16];
  }
  while (v72);
  id v10 = obj;

  if (!v66)
  {
    a5 = v67;
    if (!v67) {
      goto LABEL_82;
    }
    goto LABEL_80;
  }
  a5 = v67;
  if (!v74)
  {
LABEL_79:
    if (a5) {
      goto LABEL_80;
    }
    goto LABEL_82;
  }
  objc_msgSend(NSString, "stringWithString:");
  id *v66 = (id)objc_claimAutoreleasedReturnValue();
  if (!v67) {
    goto LABEL_82;
  }
LABEL_80:
  if (v9)
  {
    *a5 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  }
LABEL_82:
}

- (id)stringifyObjectWithPadding:(id)a3 padding:(id)a4 padToLength:(unint64_t)a5
{
  uint64_t v7 = (void *)MEMORY[0x263F089D8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 string];
  [v10 appendFormat:@"%@", v9];

  unint64_t v11 = [v10 stringByPaddingToLength:a5 withString:v8 startingAtIndex:0];

  uint64_t v12 = [NSString stringWithString:v11];

  return v12;
}

- (id)stringifyValueArray:(id)a3
{
  if (a3)
  {
    id v3 = [a3 valueForKey:@"description"];
    uint64_t v4 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    uint64_t v4 = @"(nil)";
  }
  return v4;
}

+ (id)exportEntityToCSV:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5 toURL:(id)a6 fileDate:(id)a7 dateFormatter:(id)a8 inManagedObjectContext:(id)a9
{
  v94[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v80 = a8;
  id v17 = a9;
  uint64_t v18 = [v14 name];
  int v19 = [v14 attributesByName];
  id v20 = [v19 allKeys];

  uint64_t v74 = (void *)v18;
  char v21 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:v18];
  char v22 = v21;
  if (a4) {
    [v21 setFetchLimit:a4];
  }
  uint64_t v73 = v20;
  if ([v20 containsObject:@"date"])
  {
    id v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:0];
    v94[0] = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:1];
    [v22 setSortDescriptors:v24];

    id v25 = [MEMORY[0x263EFF9B0] orderedSetWithObject:@"date"];
    if (a5)
    {
      id v26 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v27 = [MEMORY[0x263EFF910] date];
      uint64_t v28 = [v26 dateByAddingUnit:16 value:-(uint64_t)a5 toDate:v27 options:0];

      uint64_t v29 = [MEMORY[0x263F08A98] predicateWithFormat:@"date >= %@", v28];
      [v22 setPredicate:v29];
    }
  }
  else
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  }
  double v30 = v73;
  double v31 = [v73 sortedArrayUsingSelector:sel_compare_];
  [v25 addObjectsFromArray:v31];
  id v91 = 0;
  id v32 = [v17 executeFetchRequest:v22 error:&v91];
  id v33 = v91;
  double v34 = v74;
  uint64_t v72 = v32;
  if (v33)
  {
    unint64_t v35 = v33;
    NSLog(&cfstr_ErrorFetchingD.isa, v74, v33);
    id v71 = 0;
    goto LABEL_39;
  }
  uint64_t v65 = v31;
  uint64_t v66 = v22;
  id v67 = v17;
  id v70 = v14;
  id v68 = v16;
  uint64_t v36 = [NSString stringWithFormat:@"Entity_%@_%@.csv", v16, v74];
  id v69 = v15;
  uint64_t v37 = [v15 path];
  __int16 v64 = (void *)v36;
  uint64_t v38 = [v37 stringByAppendingPathComponent:v36];

  id v71 = (id)v38;
  uint64_t v39 = [MEMORY[0x263EFF9E0] outputStreamToFileAtPath:v38 append:0];
  [v39 open];
  double v63 = v39;
  uint64_t v40 = [[AnalyticsCSVWriter alloc] initWithOutputStream:v39];
  [(AnalyticsCSVWriter *)v40 writeFields:v25];
  long long v82 = v40;
  [(AnalyticsCSVWriter *)v40 finishLine];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v32;
  uint64_t v78 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (!v78) {
    goto LABEL_38;
  }
  id v41 = @"date";
  uint64_t v76 = *(void *)v88;
  id v77 = v25;
  do
  {
    uint64_t v42 = 0;
    do
    {
      if (*(void *)v88 != v76) {
        objc_enumerationMutation(obj);
      }
      uint64_t v79 = v42;
      in_addr_t v43 = *(void **)(*((void *)&v87 + 1) + 8 * v42);
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v44 = v25;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v92 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v84;
        do
        {
          uint64_t v48 = 0;
          do
          {
            if (*(void *)v84 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void **)(*((void *)&v83 + 1) + 8 * v48);
            uint64_t v50 = [v43 valueForKey:v49];
            if ([v49 containsString:v41])
            {
              uint64_t v51 = [v80 stringFromDate:v50];
LABEL_22:
              uint64_t v52 = (void *)v51;
              [(AnalyticsCSVWriter *)v82 writeField:v51];
              goto LABEL_30;
            }
            if (([v49 containsString:@"bssid"] & 1) == 0
              && ([v49 containsString:@"neighborBSSIDs"] & 1) == 0
              && ([v49 containsString:@"ssid"] & 1) == 0
              && ([v49 containsString:@"routerMAC"] & 1) == 0
              && ([v49 containsString:@"parsedBeacon"] & 1) == 0
              && ![v49 containsString:@"unparsedBeacon"])
            {
              uint64_t v51 = [NSString stringWithFormat:@"%@", v50];
              goto LABEL_22;
            }
            long long v81 = v50;
            uint64_t v52 = [NSString stringWithFormat:@"%@", v50];
            long long v53 = NSString;
            [v52 redactedForWiFi];
            uint64_t v54 = v47;
            uint64_t v55 = v43;
            v57 = uint64_t v56 = v41;
            uint64_t v58 = [v53 stringWithFormat:@"%@", v57];
            [(AnalyticsCSVWriter *)v82 writeField:v58];

            id v41 = v56;
            in_addr_t v43 = v55;
            uint64_t v47 = v54;
            uint64_t v50 = v81;
LABEL_30:

            uint64_t v59 = [v44 lastObject];
            char v60 = [v59 isEqual:v49];

            if ((v60 & 1) == 0) {
              [(AnalyticsCSVWriter *)v82 writeComma];
            }

            ++v48;
          }
          while (v46 != v48);
          uint64_t v61 = [v44 countByEnumeratingWithState:&v83 objects:v92 count:16];
          uint64_t v46 = v61;
        }
        while (v61);
      }

      [(AnalyticsCSVWriter *)v82 finishLine];
      uint64_t v42 = v79 + 1;
      id v25 = v77;
    }
    while (v79 + 1 != v78);
    uint64_t v78 = [obj countByEnumeratingWithState:&v87 objects:v93 count:16];
  }
  while (v78);
LABEL_38:

  [v63 close];
  id v15 = v69;
  id v14 = v70;
  id v17 = v67;
  id v16 = v68;
  double v30 = v73;
  double v34 = v74;
  double v31 = v65;
  char v22 = v66;
  unint64_t v35 = 0;
LABEL_39:

  return v71;
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end