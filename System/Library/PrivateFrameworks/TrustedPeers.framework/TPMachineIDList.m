@interface TPMachineIDList
- (NSArray)entries;
- (TPMachineIDList)initWithEntries:(id)a3;
- (id)description;
- (id)entryFor:(id)a3;
- (id)machineIDsInStatus:(unint64_t)a3;
@end

@implementation TPMachineIDList

- (void).cxx_destruct
{
}

- (NSArray)entries
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)machineIDsInStatus:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(TPMachineIDList *)self entries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 status] == a3)
        {
          v12 = [v11 machineID];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TPMachineIDList *)self entries];
  v4 = [v2 stringWithFormat:@"<TPMachineIDList: %@>", v3];

  return v4;
}

- (id)entryFor:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(TPMachineIDList *)self entries];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 machineID];
        char v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TPMachineIDList)initWithEntries:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPMachineIDList;
  id v6 = [(TPMachineIDList *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entries, a3);
  }

  return v7;
}

@end