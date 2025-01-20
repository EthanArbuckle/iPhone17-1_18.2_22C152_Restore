@interface SXDataRecordStore
- (NSArray)descriptors;
- (NSArray)records;
- (SXDataRecordStore)initWithJSONObject:(id)a3 andVersion:(id)a4;
- (SXDataRecordStore)initWithRecords:(id)a3 andDescriptors:(id)a4;
- (id)recordsUsingSortDescriptors:(id)a3;
- (unint64_t)numberOfRecords;
@end

@implementation SXDataRecordStore

- (SXDataRecordStore)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:@"descriptors"];
  v26 = v5;
  v8 = [v5 objectForKey:@"records"];
  v9 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(SXJSONObject *)[SXDataDescriptor alloc] initWithJSONObject:*(void *)(*((void *)&v31 + 1) + 8 * v14) andVersion:v6];
        if ([(SXDataDescriptor *)v15 dataType]) {
          [v9 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  v16 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [(SXJSONObject *)[SXDataRecord alloc] initWithJSONObject:*(void *)(*((void *)&v27 + 1) + 8 * v21) andVersion:v6];
        [v16 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  v23 = [(SXDataRecordStore *)self initWithRecords:v16 andDescriptors:v9];
  return v23;
}

- (SXDataRecordStore)initWithRecords:(id)a3 andDescriptors:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDataRecordStore;
  v9 = [(SXDataRecordStore *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_records, a3);
    objc_storeStrong((id *)&v10->_descriptors, a4);
  }

  return v10;
}

- (unint64_t)numberOfRecords
{
  v2 = [(SXDataRecordStore *)self records];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)recordsUsingSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(SXDataRecordStore *)self records];
  id v6 = (void *)[v5 copy];

  if ([v4 count])
  {
    uint64_t v7 = [v6 sortedArrayUsingDescriptors:v4];

    id v6 = (void *)v7;
  }

  return v6;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSArray)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end