@interface MREOutputFormatterInMemory
- (MREOutputFormatterInMemory)init;
- (void)printGlobalAuxData:(id)a3;
- (void)printProcessAuxData:(id)a3 forProcess:(id)a4;
- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5;
- (void)printProcessHeader:(id)a3;
- (void)printProcessTotal:(id)a3 forProcess:(id)a4;
- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5;
- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7;
- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5;
- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4;
@end

@implementation MREOutputFormatterInMemory

- (MREOutputFormatterInMemory)init
{
  v17[10] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)MREOutputFormatterInMemory;
  v2 = [(MREOutputFormatterInMemory *)&v15 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    addedProcessGroups = v2->_addedProcessGroups;
    v2->_addedProcessGroups = (NSMutableSet *)v5;

    v2->_isPageSizeSet = 0;
    v7 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v8 = MEMORY[0x263EFFA78];
    v16[0] = @"total footprint";
    v16[1] = @"summary";
    v17[0] = &unk_26CFD82E8;
    v17[1] = MEMORY[0x263EFFA78];
    v17[2] = v2->_processes;
    v16[2] = @"processes";
    v16[3] = @"shared";
    v9 = [MEMORY[0x263EFF980] array];
    v17[3] = v9;
    v17[4] = v8;
    v16[4] = @"auxiliary";
    v16[5] = @"unit";
    v17[5] = @"byte";
    v17[6] = &unk_26CFD8300;
    v16[6] = @"bytes per unit";
    v16[7] = @"page size";
    v10 = [NSNumber numberWithUnsignedLong:*MEMORY[0x263EF8AE0]];
    v17[7] = v10;
    v17[8] = MEMORY[0x263EFFA68];
    v16[8] = @"errors";
    v16[9] = @"warnings";
    v17[9] = MEMORY[0x263EFFA68];
    v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:10];
    uint64_t v12 = [v7 dictionaryWithDictionary:v11];
    data = v2->_data;
    v2->_data = (NSMutableDictionary *)v12;
  }
  return v2;
}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  self->_verbose = 1;
}

- (void)printProcessHeader:(id)a3
{
  v55[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263EFF9A0];
  v54[0] = @"name";
  v6 = [v4 name];
  v55[0] = v6;
  v54[1] = @"pid";
  v7 = [NSNumber numberWithInt:[v4 pid]];
  v55[1] = v7;
  v55[2] = &unk_26CFD82E8;
  v54[2] = @"footprint";
  v54[3] = @"categories";
  v54[4] = @"auxiliary";
  v55[3] = MEMORY[0x263EFFA78];
  v55[4] = MEMORY[0x263EFFA78];
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
  uint64_t v9 = [v5 dictionaryWithDictionary:v8];

  v10 = (void *)v9;
  v11 = [v4 errors];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [v4 errors];
    [v10 setObject:v13 forKeyedSubscript:@"errors"];
  }
  v14 = [v4 warnings];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [v4 warnings];
    [v10 setObject:v16 forKeyedSubscript:@"warnings"];
  }
  if (self->_verbose)
  {
    v43 = self;
    v17 = (void *)MEMORY[0x263EFF980];
    v18 = [v4 memoryRegions];
    v19 = [v17 arrayWithCapacity:[v18 count]];

    [v10 setObject:v19 forKeyedSubscript:@"regions"];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v20 = [v4 memoryRegions];
    uint64_t v46 = [v20 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v46)
    {
      v41 = v10;
      id v42 = v4;
      uint64_t v44 = *(void *)v48;
      v45 = v20;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(v20);
          }
          v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
          v51[0] = @"id";
          v24 = [NSNumber numberWithUnsignedLongLong:[v22 object_id]];
          v52[0] = v24;
          v51[1] = @"name";
          v25 = [v22 name];
          v52[1] = v25;
          v51[2] = @"addr";
          v26 = [NSNumber numberWithUnsignedLongLong:[v22 start]];
          v52[2] = v26;
          v51[3] = @"vsize";
          v27 = [NSNumber numberWithUnsignedLongLong:[v22 size]];
          v52[3] = v27;
          v28 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
          v29 = (void *)[v23 initWithDictionary:v28];

          if ([v22 offset])
          {
            v30 = [NSNumber numberWithUnsignedLongLong:[v22 offset]];
            [v29 setObject:v30 forKeyedSubscript:@"offset"];
          }
          if (objc_msgSend(v22, "dirtySize", v41, v42))
          {
            v31 = [NSNumber numberWithUnsignedLongLong:[v22 dirtySize]];
            [v29 setObject:v31 forKeyedSubscript:@"dirty"];
          }
          if ([v22 swappedSize])
          {
            v32 = [NSNumber numberWithUnsignedLongLong:[v22 swappedSize]];
            [v29 setObject:v32 forKeyedSubscript:@"swapped"];
          }
          if ([v22 cleanSize])
          {
            v33 = [NSNumber numberWithUnsignedLongLong:[v22 cleanSize]];
            [v29 setObject:v33 forKeyedSubscript:@"clean"];
          }
          if ([v22 reclaimableSize])
          {
            v34 = [NSNumber numberWithUnsignedLongLong:[v22 reclaimableSize]];
            [v29 setObject:v34 forKeyedSubscript:@"reclaimable"];
          }
          if ([v22 wiredSize])
          {
            v35 = [NSNumber numberWithUnsignedLongLong:[v22 wiredSize]];
            [v29 setObject:v35 forKeyedSubscript:@"wired"];
          }
          v36 = (void *)[v29 copy];
          [v19 addObject:v36];

          v20 = v45;
        }
        uint64_t v46 = [v45 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v46);

      id v4 = v42;
      self = v43;
      v10 = v41;
      if (!v43)
      {
        processes = 0;
        char v38 = 1;
        goto LABEL_29;
      }
    }
    else
    {

      self = v43;
    }
  }
  char v38 = 0;
  processes = self->_processes;
LABEL_29:
  [(NSMutableArray *)processes addObject:v10];
  if (!self->_isPageSizeSet)
  {
    v39 = [NSNumber numberWithUnsignedLong:[v4 pageSize]];
    if (v38) {
      data = 0;
    }
    else {
      data = self->_data;
    }
    [(NSMutableDictionary *)data setObject:v39 forKeyedSubscript:@"page size"];

    self->_isPageSizeSet = 1;
  }
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  if (self) {
    processes = self->_processes;
  }
  else {
    processes = 0;
  }
  id v5 = a3;
  id v6 = [(NSMutableArray *)processes lastObject];
  [v6 setObject:v5 forKeyedSubscript:@"footprint"];
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  sub_21E8651F4((uint64_t)self, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    processes = self->_processes;
  }
  else {
    processes = 0;
  }
  v7 = [(NSMutableArray *)processes lastObject];
  [v7 setObject:v8 forKeyedSubscript:@"categories"];
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  BOOL v7 = a6;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v7)
  {
    if ([(NSMutableSet *)self->_addedProcessGroups containsObject:v12]) {
      goto LABEL_14;
    }
    [(NSMutableSet *)self->_addedProcessGroups addObject:v12];
  }
  v29 = v13;
  v14 = (void *)MEMORY[0x263EFF980];
  uint64_t v15 = [v12 processes];
  v16 = [v14 arrayWithCapacity:[v15 count]];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v17 = [v12 processes];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v30 + 1) + 8 * v21) asNumber];
        [v16 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v19);
  }

  id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
  v34[0] = @"pids";
  v34[1] = @"categories";
  v35[0] = v16;
  v24 = sub_21E8651F4((uint64_t)self, v11);
  v35[1] = v24;
  v25 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  v26 = (void *)[v23 initWithDictionary:v25];

  id v13 = v29;
  if (v7)
  {
    v27 = [v29 asNumber];
    [v26 setObject:v27 forKeyedSubscript:@"specific_to_pid"];
  }
  v28 = [(NSMutableDictionary *)self->_data objectForKeyedSubscript:@"shared"];
  [v28 addObject:v26];

LABEL_14:
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  [a3 fp_jsonRepresentation];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (self) {
    processes = self->_processes;
  }
  else {
    processes = 0;
  }
  id v6 = [(NSMutableArray *)processes lastObject];
  [v6 setObject:v7 forKeyedSubscript:@"auxiliary"];
}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263EFF980] arrayWithArray:a5];
  id v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v29 + 1) + 8 * v16) warnings];
        [v11 addObjectsFromArray:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = [*(id *)(*((void *)&v25 + 1) + 8 * v22) errors:v25];
        [v10 addObjectsFromArray:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  if (self)
  {
    [(NSMutableDictionary *)self->_data setObject:v10 forKeyedSubscript:@"errors"];
    data = self->_data;
  }
  else
  {
    [0 setObject:v10 forKeyedSubscript:@"errors"];
    data = 0;
  }
  [(NSMutableDictionary *)data setObject:v11, @"warnings", (void)v25 forKeyedSubscript];
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  v23[6] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = sub_21E8651F4((uint64_t)self, v7);
    if (self) {
      data = self->_data;
    }
    else {
      data = 0;
    }
    [(NSMutableDictionary *)data setObject:v8 forKeyedSubscript:@"summary"];
  }
  v22[0] = @"dirty";
  uint64_t v20 = [NSNumber numberWithUnsignedLongLong:a4->var1 + a4->var0];
  v23[0] = v20;
  v22[1] = @"swapped";
  v10 = [NSNumber numberWithUnsignedLongLong:a4->var1];
  v23[1] = v10;
  v22[2] = @"clean";
  id v11 = [NSNumber numberWithUnsignedLongLong:a4->var2];
  v23[2] = v11;
  v22[3] = @"reclaimable";
  id v12 = [NSNumber numberWithUnsignedLongLong:a4->var3];
  v23[3] = v12;
  v22[4] = @"wired";
  uint64_t v13 = [NSNumber numberWithUnsignedLongLong:a4->var4];
  v23[4] = v13;
  v22[5] = @"regions";
  uint64_t v14 = [NSNumber numberWithUnsignedInt:a4->var5];
  v23[5] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
  uint64_t v21 = v7;
  if (self) {
    uint64_t v16 = self->_data;
  }
  else {
    uint64_t v16 = 0;
  }
  v17 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:@"summary"];
  [v17 setObject:v15 forKeyedSubscript:@"total"];

  id v18 = [NSNumber numberWithUnsignedLongLong:a4->var1 + a4->var0];
  if (self) {
    uint64_t v19 = self->_data;
  }
  else {
    uint64_t v19 = 0;
  }
  [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:@"total footprint"];
}

- (void)printGlobalAuxData:(id)a3
{
  uint64_t v4 = [a3 fp_jsonRepresentation];
  if (self) {
    data = self->_data;
  }
  else {
    data = 0;
  }
  id v6 = (id)v4;
  [(NSMutableDictionary *)data setObject:v4 forKeyedSubscript:@"auxiliary"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedProcessGroups, 0);
  objc_storeStrong((id *)&self->_processes, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end