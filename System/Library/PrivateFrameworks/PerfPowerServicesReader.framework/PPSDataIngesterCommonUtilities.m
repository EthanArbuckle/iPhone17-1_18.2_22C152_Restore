@interface PPSDataIngesterCommonUtilities
+ (BOOL)isMetricStorageFilepath:(id)a3;
+ (id)allTableNamesForMetadataHistory:(id)a3 withEntryKey:(id)a4;
+ (id)columnNamesForFilepath:(id)a3 dataSource:(id)a4;
+ (id)dataSourceForMetricDefinition:(id)a3;
+ (int64_t)fileTypeForFilepath:(id)a3;
+ (unint64_t)directionalityForMetricDefinition:(id)a3;
@end

@implementation PPSDataIngesterCommonUtilities

+ (id)columnNamesForFilepath:(id)a3 dataSource:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x25A2D4DD0]();
  v8 = [[PPSSQLiteDatabase alloc] initWithDatabaseURL:v5];
  uint64_t v11 = 0;
  [(PPSSQLiteDatabase *)v8 openForReadingWithError:&v11];
  v9 = [(PPSSQLiteDatabase *)v8 columnNamesForTable:v6];
  [(PPSSQLiteDatabase *)v8 close];

  return v9;
}

+ (unint64_t)directionalityForMetricDefinition:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (unsigned int v5 = [v3 directionality] - 3, v5 <= 3)) {
    unint64_t v6 = qword_258FB0710[v5];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)dataSourceForMetricDefinition:(id)a3
{
  if (a3)
  {
    id v3 = NSString;
    id v4 = a3;
    unsigned int v5 = [v4 subsystem];
    unint64_t v6 = [v4 category];
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "timeToLive"));
    v8 = NSNumber;
    uint64_t v9 = [v4 storage];

    v10 = [v8 numberWithInt:v9];
    uint64_t v11 = [v3 stringWithFormat:@"%@_%@_%@_%@", v5, v6, v7, v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

+ (id)allTableNamesForMetadataHistory:(id)a3 withEntryKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    unint64_t v12 = 0x263F08000uLL;
    v24 = v7;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * v13)];
        v15 = [v14 lastObject];
        if ([v15 auxiliaryType] == 2)
        {
          v16 = [*(id *)(v12 + 2880) stringWithFormat:@"%@_Dynamic", v6];
LABEL_8:
          [v7 addObject:v16];

          goto LABEL_11;
        }
        if ([v15 auxiliaryType] == 3 && !objc_msgSend(v15, "fixedArraySize"))
        {
          v17 = *(void **)(v12 + 2880);
          [v15 name];
          v19 = unint64_t v18 = v12;
          v16 = [v17 stringWithFormat:@"%@_Array_%@", v6, v19];

          unint64_t v12 = v18;
          v7 = v24;
          goto LABEL_8;
        }
LABEL_11:

        ++v13;
      }
      while (v10 != v13);
      uint64_t v20 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v10 = v20;
    }
    while (v20);
  }

  v21 = [v7 allObjects];
  v22 = (void *)[v21 copy];

  return v22;
}

+ (int64_t)fileTypeForFilepath:(id)a3
{
  id v3 = [a3 pathExtension];
  if ([v3 isEqualToString:@"EPSQL"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"CESQL"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"XCSQL"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"BGSQL"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = ([v3 isEqualToString:@"PLSQL"] & 1) != 0
      || [v3 isEqualToString:@"powerlog"];
  }

  return v4;
}

+ (BOOL)isMetricStorageFilepath:(id)a3
{
  id v3 = [a3 pathExtension];
  if (([v3 isEqualToString:@"PLSQL"] & 1) != 0
    || ([v3 isEqualToString:@"EPSQL"] & 1) != 0
    || ([v3 isEqualToString:@"CESQL"] & 1) != 0
    || ([v3 isEqualToString:@"XCSQL"] & 1) != 0
    || ([v3 isEqualToString:@"BGSQL"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"powerlog"];
  }

  return v4;
}

@end