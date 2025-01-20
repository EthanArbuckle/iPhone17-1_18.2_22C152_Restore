@interface SKADatabasePublishedLocalStatusDevice
- (NSArray)deliveredStatuses;
- (NSArray)pendingStatuses;
- (NSString)idsIdentifier;
- (SKADatabasePublishedLocalStatusDevice)initWithCoreDataPulishedLocalStatusDevice:(id)a3;
- (SKADatabasePublishedLocalStatusDevice)initWithIDSIdentifier:(id)a3 pendingStatuses:(id)a4 deliveredStatuses:(id)a5;
- (void)setDeliveredStatuses:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setPendingStatuses:(id)a3;
@end

@implementation SKADatabasePublishedLocalStatusDevice

- (SKADatabasePublishedLocalStatusDevice)initWithCoreDataPulishedLocalStatusDevice:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v7 = [v4 pendingStatuses];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[SKADatabasePublishedLocalStatus alloc] initWithCoreDataPublishedLocalStatus:*(void *)(*((void *)&v26 + 1) + 8 * v11)];
        [v5 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = objc_msgSend(v4, "deliveredStatuses", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [[SKADatabasePublishedLocalStatus alloc] initWithCoreDataPublishedLocalStatus:*(void *)(*((void *)&v22 + 1) + 8 * v17)];
        [v6 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  v19 = [v4 idsIdentifier];
  v20 = [(SKADatabasePublishedLocalStatusDevice *)self initWithIDSIdentifier:v19 pendingStatuses:v5 deliveredStatuses:v6];

  return v20;
}

- (SKADatabasePublishedLocalStatusDevice)initWithIDSIdentifier:(id)a3 pendingStatuses:(id)a4 deliveredStatuses:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKADatabasePublishedLocalStatusDevice;
  v12 = [(SKADatabasePublishedLocalStatusDevice *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsIdentifier, a3);
    objc_storeStrong((id *)&v13->_pendingStatuses, a4);
    objc_storeStrong((id *)&v13->_deliveredStatuses, a5);
  }

  return v13;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSArray)pendingStatuses
{
  return self->_pendingStatuses;
}

- (void)setPendingStatuses:(id)a3
{
}

- (NSArray)deliveredStatuses
{
  return self->_deliveredStatuses;
}

- (void)setDeliveredStatuses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveredStatuses, 0);
  objc_storeStrong((id *)&self->_pendingStatuses, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end