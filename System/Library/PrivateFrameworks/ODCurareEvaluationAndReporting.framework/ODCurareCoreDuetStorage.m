@interface ODCurareCoreDuetStorage
+ (id)predicateWithIdentifier:(id)a3 withDate:(id)a4;
- (BOOL)deleteAllData;
- (BOOL)deleteData:(id)a3;
- (BOOL)deleteDataWithPredicate:(id)a3;
- (BOOL)saveDictionaries:(id)a3 date:(id)a4 eventIdentifier:(id)a5;
- (BOOL)saveMetadata:(id)a3 date:(id)a4 eventIdentifier:(id)a5;
- (NSString)name;
- (_DKEventStream)stream;
- (_DKKnowledgeSaving)knowledgeStore;
- (id)init:(id)a3;
- (id)queryDataWithPredicate:(id)a3;
- (unint64_t)deleteMultipleData:(id)a3;
- (unint64_t)deleteMultipleDataWithPredicate:(id)a3;
- (void)deleteDirectory:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setName:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation ODCurareCoreDuetStorage

- (id)init:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODCurareCoreDuetStorage;
  v5 = [(ODCurareCoreDuetStorage *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(ODCurareCoreDuetStorage *)v5 setName:v4];
    v7 = [MEMORY[0x263F35098] eventStreamWithName:v4];
    [(ODCurareCoreDuetStorage *)v6 setStream:v7];

    v8 = [MEMORY[0x263F08AB0] processInfo];
    v9 = [v8 environment];
    v10 = [v9 objectForKeyedSubscript:@"XCTestBundlePath"];

    if (v10)
    {
      NSLog(&cfstr_RunningOnTest.isa);
      v11 = [NSString stringWithFormat:@"/var/tmp/test-interactiondir/%@", v4];
      [(ODCurareCoreDuetStorage *)v6 deleteDirectory:v11];
      v12 = [MEMORY[0x263F350B0] storageWithDirectory:v11 readOnly:0];
      [(ODCurareCoreDuetStorage *)v6 setKnowledgeStore:v12];
    }
    else
    {
      v11 = [MEMORY[0x263F350B8] userKnowledgeStore];
      [(ODCurareCoreDuetStorage *)v6 setKnowledgeStore:v11];
    }
  }
  return v6;
}

- (void)deleteDirectory:(id)a3
{
  id v4 = a3;
  v3 = [MEMORY[0x263F08850] defaultManager];
  if ([v3 fileExistsAtPath:v4 isDirectory:0]) {
    [v3 removeItemAtPath:v4 error:0];
  }
}

- (BOOL)saveDictionaries:(id)a3 date:(id)a4 eventIdentifier:(id)a5
{
  v29[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v26 = @"ODCurareEvaluationAndReporting-MetadataDataKey";
    id v27 = v8;
    v11 = NSDictionary;
    v12 = &v27;
    v13 = &v26;
  }
  else
  {
    v28 = @"ODCurareEvaluationAndReporting-MetadataDataKey";
    v29[0] = MEMORY[0x263EFFA68];
    v11 = NSDictionary;
    v12 = (id *)v29;
    v13 = &v28;
  }
  objc_super v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
  v15 = (void *)MEMORY[0x263F35088];
  v16 = [(ODCurareCoreDuetStorage *)self stream];
  v17 = [v15 eventWithStream:v16 startDate:v9 endDate:v9 identifierStringValue:v10 metadata:v14];

  v18 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  v25 = v17;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  id v24 = 0;
  char v20 = [v18 saveObjects:v19 error:&v24];
  id v21 = v24;

  if ((v20 & 1) == 0)
  {
    v22 = [v21 localizedDescription];
    NSLog(&stru_26E8B4458.isa, v22);
  }
  return v20;
}

- (BOOL)saveMetadata:(id)a3 date:(id)a4 eventIdentifier:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = @"ODCurareEvaluationAndReporting-MetadataDataKey";
  v25[0] = v8;
  id v9 = NSDictionary;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v13 = (void *)MEMORY[0x263F35088];
  objc_super v14 = [(ODCurareCoreDuetStorage *)self stream];
  v15 = [v13 eventWithStream:v14 startDate:v11 endDate:v11 identifierStringValue:v10 metadata:v12];

  v16 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  v23 = v15;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  id v22 = 0;
  char v18 = [v16 saveObjects:v17 error:&v22];
  id v19 = v22;

  if ((v18 & 1) == 0)
  {
    char v20 = [v19 localizedDescription];
    NSLog(&cfstr_Odcurarecoredu.isa, v20);
  }
  return v18;
}

- (id)queryDataWithPredicate:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35090]);
  v6 = [(ODCurareCoreDuetStorage *)self stream];
  v26[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [v5 setEventStreams:v7];

  [v5 setLimit:100];
  [v5 setPredicate:v4];
  id v8 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v24 = 0;
  id v9 = [v8 executeQuery:v5 error:&v24];
  id v10 = v24;

  id v11 = 0;
  if (!v10)
  {
    id v19 = v4;
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[ODCurareDKEvent alloc] initWithDKEvent:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    id v4 = v19;
  }

  return v11;
}

+ (id)predicateWithIdentifier:(id)a3 withDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF980] array];
  if (v5)
  {
    id v8 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v5];
    [v7 addObject:v8];
  }
  if (v6)
  {
    id v9 = [MEMORY[0x263F35110] predicateForEventsWithStartInDateRangeFrom:v6 to:v6];
    [v7 addObject:v9];
  }
  if ([v7 count])
  {
    id v10 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v7];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)deleteData:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *, void *))a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35090]);
  id v6 = [(ODCurareCoreDuetStorage *)self stream];
  v34[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [v5 setEventStreams:v7];

  [v5 setLimit:100];
  id v8 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v31 = 0;
  id v9 = [v8 executeQuery:v5 error:&v31];
  id v10 = v31;

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v9;
    id v10 = (id)[obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v10)
    {
      long long v22 = self;
      long long v23 = v9;
      id v24 = v5;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (v14)
          {
            uint64_t v15 = [*(id *)(*((void *)&v27 + 1) + 8 * i) startDate];
            v16 = [v14 metadata];
            v17 = [v16 objectForKeyedSubscript:@"ODCurareEvaluationAndReporting-MetadataDataKey"];
            char v18 = v4[2](v4, v15, v17);

            if (v18)
            {
              id v19 = [(ODCurareCoreDuetStorage *)v22 knowledgeStore];
              v32 = v14;
              BOOL v11 = 1;
              long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
              id v26 = 0;
              [v19 deleteObjects:v20 error:&v26];
              id v10 = v26;

              goto LABEL_14;
            }
          }
        }
        id v10 = (id)[obj countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      BOOL v11 = 0;
LABEL_14:
      id v9 = v23;
      id v5 = v24;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (unint64_t)deleteMultipleData:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void *, void *))a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35090]);
  id v6 = [(ODCurareCoreDuetStorage *)self stream];
  v38[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  [v5 setEventStreams:v7];

  [v5 setLimit:100];
  id v8 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v35 = 0;
  id v9 = [v8 executeQuery:v5 error:&v35];
  id v10 = v35;

  if (v10)
  {
    unint64_t v11 = 0;
  }
  else
  {
    v25 = v9;
    id v26 = v5;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      long long v27 = self;
      id v10 = 0;
      uint64_t v14 = *(void *)v32;
      unint64_t v29 = 0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (v16)
          {
            v17 = [*(id *)(*((void *)&v31 + 1) + 8 * i) startDate];
            char v18 = [v16 metadata];
            id v19 = [v18 objectForKeyedSubscript:@"ODCurareEvaluationAndReporting-MetadataDataKey"];
            int v20 = v4[2](v4, v17, v19);

            if (v20)
            {
              long long v21 = [(ODCurareCoreDuetStorage *)v27 knowledgeStore];
              v36 = v16;
              long long v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
              id v30 = v10;
              [v21 deleteObjects:v22 error:&v30];
              id v23 = v30;

              ++v29;
              id v10 = v23;
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v13);
    }
    else
    {
      id v10 = 0;
      unint64_t v29 = 0;
    }

    id v9 = v25;
    id v5 = v26;
    unint64_t v11 = v29;
  }

  return v11;
}

- (BOOL)deleteDataWithPredicate:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35090]);
  id v6 = [(ODCurareCoreDuetStorage *)self stream];
  v27[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  [v5 setEventStreams:v7];

  [v5 setLimit:100];
  [v5 setPredicate:v4];
  id v8 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v24 = 0;
  id v9 = [v8 executeQuery:v5 error:&v24];
  id v10 = v24;

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v9;
    id v10 = (id)[v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v10)
    {
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (v15)
          {
            v16 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
            uint64_t v25 = v15;
            BOOL v11 = 1;
            v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
            id v19 = 0;
            [v16 deleteObjects:v17 error:&v19];
            id v10 = v19;

            goto LABEL_13;
          }
        }
        id v10 = (id)[v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  return v11;
}

- (unint64_t)deleteMultipleDataWithPredicate:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F35090]);
  id v6 = [(ODCurareCoreDuetStorage *)self stream];
  v36[0] = v6;
  unint64_t v7 = 0x263EFF000uLL;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  [v5 setEventStreams:v8];

  [v5 setLimit:100];
  [v5 setPredicate:v4];
  id v9 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v33 = 0;
  id v10 = [v9 executeQuery:v5 error:&v33];
  id v11 = v33;

  if (v11)
  {
    unint64_t v12 = 0;
  }
  else
  {
    id v25 = v5;
    id v26 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v10;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v11 = 0;
      unint64_t v12 = 0;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (v17)
          {
            char v18 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
            uint64_t v34 = v17;
            [*(id *)(v7 + 2240) arrayWithObjects:&v34 count:1];
            id v19 = self;
            v21 = unint64_t v20 = v7;
            id v28 = v11;
            [v18 deleteObjects:v21 error:&v28];
            id v22 = v28;

            unint64_t v7 = v20;
            self = v19;

            ++v12;
            id v11 = v22;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v14);
    }
    else
    {
      id v11 = 0;
      unint64_t v12 = 0;
    }

    id v5 = v25;
    id v4 = v26;
    id v10 = v24;
  }

  return v12;
}

- (BOOL)deleteAllData
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F35090]);
  id v4 = [(ODCurareCoreDuetStorage *)self stream];
  v30[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
  [v3 setEventStreams:v5];

  [v3 setLimit:100];
  id v6 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
  id v27 = 0;
  unint64_t v7 = [v6 executeQuery:v3 error:&v27];
  id v8 = v27;

  id v9 = v8;
  if (!v8)
  {
    unint64_t v20 = v7;
    id v21 = v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v9 = 0;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (v15)
          {
            v16 = [(ODCurareCoreDuetStorage *)self knowledgeStore];
            uint64_t v28 = v15;
            uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
            id v22 = v9;
            [v16 deleteObjects:v17 error:&v22];
            id v18 = v22;

            id v9 = v18;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
    }
    else
    {
      id v9 = 0;
    }

    unint64_t v7 = v20;
    id v3 = v21;
    id v8 = 0;
  }

  return v8 == 0;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (_DKEventStream)stream
{
  return (_DKEventStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStream:(id)a3
{
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return (_DKKnowledgeSaving *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKnowledgeStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end