@interface NRMutableDeviceCollection
+ (BOOL)supportsSecureCoding;
+ (id)diffFrom:(id)a3 to:(id)a4;
+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5;
- (BOOL)allAltAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)paired;
- (NRMutableDevice)activeDevice;
- (NRMutableDeviceCollection)init;
- (NRMutableDeviceCollection)initWithCoder:(id)a3;
- (NRMutableDeviceCollection)initWithProtobuf:(id)a3;
- (NRPBMutableDeviceCollection)protobuf;
- (NSUUID)activeDeviceID;
- (id)_diffsToChangeActiveDeviceToDeviceID:(id)a3;
- (id)allPairingIDs;
- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceForPairingID:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_createIndex;
- (void)child:(id)a3 didApplyDiff:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)removeDeviceForPairingID:(id)a3;
- (void)setActiveDeviceID:(id)a3;
- (void)setDevice:(id)a3 forPairingID:(id)a4;
- (void)setProtobuf:(id)a3;
@end

@implementation NRMutableDeviceCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childMap, 0);
  objc_storeStrong((id *)&self->_deviceCollection, 0);

  objc_storeStrong((id *)&self->_protobuf, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self;
  uint64_t v6 = [(NRMutableDeviceCollection *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [(NRMutableDeviceCollection *)v5 objectForKeyedSubscript:v10];
        v12 = +[NRMutableDevice diffFrom:0 to:v11];
        v13 = [[NRDeviceDiffType alloc] initWithDiff:v12 andChangeType:0];
        [v4 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NRMutableDeviceCollection *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v14 = [[NRDeviceCollectionDiff alloc] initWithDeviceCollectionDiffDeviceDiffs:v4];
  id v15 = (id)[v17 applyDiff:v14 upOnly:0 notifyParent:0 unconditional:1];

  return v17;
}

- (NRMutableDeviceCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRMutableDeviceCollection;
  v2 = [(NRMutableStateBase *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    deviceCollection = v2->_deviceCollection;
    v2->_deviceCollection = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    childMap = v2->_childMap;
    v2->_childMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  objc_super v8 = (void *)[(NSMutableDictionary *)self->_deviceCollection copy];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (![v10 count])
  {
    v30 = 0;
    id v31 = v10;
    goto LABEL_28;
  }
  BOOL v35 = v7;
  context = (void *)MEMORY[0x1A624A5B0]();
  v11 = self;
  v12 = v11;
  uint64_t v13 = (uint64_t)v11;
  if (!v6)
  {
    uint64_t v13 = [(NRMutableDeviceCollection *)v11 copyWithZone:0];
  }
  v36 = (void *)v13;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v38 = v10;
  id v14 = v10;
  uint64_t v42 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v42)
  {
    id v40 = v14;
    uint64_t v41 = *(void *)v44;
    v39 = v12;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v14);
        }
        uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v17 = [v14 objectForKeyedSubscript:v16];
        long long v18 = [v17 diff];
        long long v19 = [(NSMutableDictionary *)v12->_deviceCollection objectForKeyedSubscript:v16];
        long long v20 = v19;
        if (!v18)
        {
LABEL_13:
          [v20 setParentDelegate:0];
          [(NSMutableDictionary *)v12->_deviceCollection removeObjectForKey:v16];
          childMap = v12->_childMap;
          uint64_t v23 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v20];
          [(NSMutableDictionary *)childMap removeObjectForKey:v23];
LABEL_16:

          id v14 = v40;
          goto LABEL_17;
        }
        if (!v19)
        {
          uint64_t v23 = objc_alloc_init(NRMutableDevice);
          id v24 = [(NRMutableDevice *)v23 applyDiff:v18 upOnly:0 notifyParent:0 unconditional:1];
          if ([(NRMutableDevice *)v23 count])
          {
            [(NSMutableDictionary *)v12->_deviceCollection setObject:v23 forKeyedSubscript:v16];
            v25 = v12->_childMap;
            [MEMORY[0x1E4F29238] valueWithNonretainedObject:v23];
            BOOL v26 = v8;
            v28 = BOOL v27 = v6;
            [(NSMutableDictionary *)v25 setObject:v16 forKeyedSubscript:v28];

            BOOL v6 = v27;
            BOOL v8 = v26;
            v12 = v39;
            [(NRMutableStateBase *)v23 setParentDelegate:v39];
          }
          goto LABEL_16;
        }
        if (!v8)
        {
          id v21 = (id)[v19 applyDiff:v18 upOnly:0 notifyParent:0 unconditional:v6];
          if (![v20 count]) {
            goto LABEL_13;
          }
        }
LABEL_17:
      }
      uint64_t v42 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v42);
  }

  if (v6)
  {
    id v10 = v38;
    v29 = v36;
    if (!v14) {
      goto LABEL_27;
    }
LABEL_24:
    if (v35) {
      [(NRMutableStateBase *)v12 notifyParentWithDiff:v14];
    }
    [(NRMutableStateBase *)v12 notifyObserversWithDiff:v14];
    goto LABEL_27;
  }
  v29 = v36;
  uint64_t v32 = [(id)objc_opt_class() diffFrom:v36 to:v12];
  v33 = v14;
  id v14 = (id)v32;

  id v10 = v38;
  if (v14) {
    goto LABEL_24;
  }
LABEL_27:

  id v31 = v14;
  v30 = v31;
LABEL_28:

  return v30;
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (id *)v5;
  BOOL v8 = (id *)v6;
  unint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v10 = 0x1EB30A000uLL;
  id v40 = v8;
  if ([v7 count])
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [v7[5] allKeys];
    uint64_t v13 = [v11 setWithArray:v12];
    id v14 = (void *)[v13 mutableCopy];

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [v8[5] allKeys];
    v17 = [v15 setWithArray:v16];

    [v14 minusSet:v17];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v24 = [[NRDeviceDiffType alloc] initWithDiff:0 andChangeType:2];
          [v9 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v20);
    }

    unint64_t v10 = 0x1EB30A000uLL;
  }
  if ([v8 count])
  {
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v26 = [v8[5] allKeys];
    BOOL v27 = [v25 setWithArray:v26];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v27;
    uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          if (v7)
          {
            v33 = [*(id *)((char *)v7 + *(int *)(v10 + 440)) objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * j)];
          }
          else
          {
            v33 = 0;
          }
          v34 = [*(id *)((char *)v8 + *(int *)(v10 + 440)) objectForKeyedSubscript:v32];
          BOOL v35 = +[NRMutableDevice diffFrom:v33 to:v34];
          if (v35)
          {
            v36 = [[NRDeviceDiffType alloc] initWithDiff:v35 andChangeType:v33 != 0];
            [v9 setObject:v36 forKeyedSubscript:v32];

            BOOL v8 = v40;
          }

          unint64_t v10 = 0x1EB30A000;
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v29);
    }
  }
  if ([v9 count]) {
    v37 = [[NRDeviceCollectionDiff alloc] initWithDeviceCollectionDiffDeviceDiffs:v9];
  }
  else {
    v37 = 0;
  }

  return v37;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_deviceCollection count];
}

- (id)allPairingIDs
{
  return (id)[(NSMutableDictionary *)self->_deviceCollection allKeys];
}

- (void)setDevice:(id)a3 forPairingID:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  deviceCollection = self->_deviceCollection;
  id v8 = a3;
  unint64_t v9 = [(NSMutableDictionary *)deviceCollection objectForKeyedSubscript:v6];
  unint64_t v10 = +[NRMutableDevice diffFrom:v9 to:v8];

  if (v10)
  {
    v11 = [[NRDeviceDiffType alloc] initWithDiff:v10 andChangeType:1];
    v12 = [NRDeviceCollectionDiff alloc];
    id v16 = v6;
    v17[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v14 = [(NRDeviceCollectionDiff *)v12 initWithDeviceCollectionDiffDeviceDiffs:v13];

    id v15 = [(NRMutableStateBase *)self applyDiff:v14];
  }
}

- (void)removeDeviceForPairingID:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[NRDeviceDiffType alloc] initWithDiff:0 andChangeType:2];
  id v6 = [NRDeviceCollectionDiff alloc];
  id v10 = v4;
  v11[0] = v5;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v8 = [(NRDeviceCollectionDiff *)v6 initWithDeviceCollectionDiffDeviceDiffs:v7];
  id v9 = [(NRMutableStateBase *)self applyDiff:v8];
}

- (id)deviceForPairingID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_deviceCollection objectForKeyedSubscript:a3];
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)NRMutableDeviceCollection;
  [(NRMutableStateBase *)&v13 invalidate];
  [(NSMutableDictionary *)self->_childMap removeAllObjects];
  uint64_t v3 = [(NSMutableDictionary *)self->_deviceCollection allValues];
  [(NSMutableDictionary *)self->_deviceCollection removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "invalidate", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)child:(id)a3 didApplyDiff:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 count];
  long long v9 = [NRDeviceDiffType alloc];
  if (v8)
  {
    id v10 = v6;
    uint64_t v11 = 1;
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 2;
  }
  long long v12 = [(NRDeviceDiffType *)v9 initWithDiff:v10 andChangeType:v11];
  childMap = self->_childMap;
  id v14 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v7];

  uint64_t v15 = [(NSMutableDictionary *)childMap objectForKeyedSubscript:v14];

  id v16 = [NRDeviceCollectionDiff alloc];
  uint64_t v19 = v15;
  v20[0] = v12;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v18 = [(NRDeviceCollectionDiff *)v16 initWithDeviceCollectionDiffDeviceDiffs:v17];

  if (v18)
  {
    [(NRMutableStateBase *)self notifyParentWithDiff:v18];
    [(NRMutableStateBase *)self notifyObserversWithDiff:v18];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createIndex
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = self->_deviceCollection;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v7 name:@"device collection dictionary key" classes:v8 owner:self];

        long long v9 = [(NSMutableDictionary *)self->_deviceCollection objectForKeyedSubscript:v7];
        id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v9 name:@"device collection dictionary value" classes:v10 owner:self];

        [v9 setParentDelegate:self];
        childMap = self->_childMap;
        long long v12 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v9];
        [(NSMutableDictionary *)childMap setObject:v7 forKeyedSubscript:v12];
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (NRMutableDeviceCollection)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRMutableDeviceCollection *)self init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:3];
    long long v12 = objc_msgSend(v10, "setWithArray:", v11, v16, v17);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"devices"];
    deviceCollection = v5->_deviceCollection;
    v5->_deviceCollection = (NSMutableDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_deviceCollection name:@"device collection dictionary" owner:v5];
    [(NRMutableDeviceCollection *)v5 _createIndex];
LABEL_5:
    long long v9 = v5;
    goto LABEL_6;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [[NRPBMutableDeviceCollection alloc] initWithData:v6];
  long long v9 = [(NRMutableDeviceCollection *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (NRMutableDeviceCollection)initWithProtobuf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRMutableDeviceCollection *)self init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = [v4 pairingIDs];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = [v4 pairingIDs];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

        if ([v11 length] == 16)
        {
          long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v11, "bytes"));
          uint64_t v13 = [v4 devices];
          long long v14 = [v13 objectAtIndexedSubscript:v9];

          long long v15 = [[NRMutableDevice alloc] initWithProtobuf:v14];
          [(NSMutableDictionary *)v6 setObject:v15 forKeyedSubscript:v12];
        }
        ++v9;
        uint64_t v16 = [v4 pairingIDs];
        unint64_t v17 = [v16 count];
      }
      while (v9 < v17);
    }
    deviceCollection = v5->_deviceCollection;
    v5->_deviceCollection = v6;

    [(NRMutableDeviceCollection *)v5 _createIndex];
  }

  return v5;
}

- (NRPBMutableDeviceCollection)protobuf
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v3 setPairingIDs:v4];

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  [v3 setDevices:v5];

  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_deviceCollection copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v19);
        long long v14 = [v3 pairingIDs];
        long long v15 = [MEMORY[0x1E4F1C9B8] fromUUID:v12];
        [v14 addObject:v15];

        uint64_t v16 = [v3 devices];
        unint64_t v17 = [v13 protobuf];
        [v16 addObject:v17];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return (NRPBMutableDeviceCollection *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRMutableDeviceCollection *)self protobuf];
  uint64_t v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_deviceCollection;
  uint64_t v3 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    unint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash", (void)v9) - v6 + 32 * v6;
      }
      uint64_t v4 = [(NSMutableDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NRMutableDeviceCollection *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    goto LABEL_6;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v7 = 0;
    goto LABEL_8;
  }
  deviceCollection = self->_deviceCollection;
  if (deviceCollection == v5->_deviceCollection) {
LABEL_6:
  }
    char v7 = 1;
  else {
    char v7 = -[NSMutableDictionary isEqual:](deviceCollection, "isEqual:");
  }
LABEL_8:

  return v7;
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableDictionary *)self->_deviceCollection allKeys];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_13];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    char v7 = &stru_1EF6CAD80;
    do
    {
      uint64_t v8 = 0;
      long long v9 = v7;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        long long v11 = (void *)MEMORY[0x1A624A5B0]();
        long long v12 = [(NSMutableDictionary *)self->_deviceCollection objectForKeyedSubscript:v10];
        uint64_t v13 = [v10 UUIDString];
        uint64_t v14 = [v13 stringByPaddingToLength:36 withString:@" " startingAtIndex:0];

        long long v15 = [v12 description];
        uint64_t v16 = +[NRTextFormattingUtilities prefixLinesWithString:v14 withText:v15];

        char v7 = [(__CFString *)v9 stringByAppendingString:v16];

        ++v8;
        long long v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = &stru_1EF6CAD80;
  }

  return v7;
}

uint64_t __40__NRMutableDeviceCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 UUIDString];
  uint64_t v6 = [v4 UUIDString];

  uint64_t v7 = [v5 compare:v6 options:0];
  return v7;
}

- (void)setProtobuf:(id)a3
{
}

- (NRMutableDevice)activeDevice
{
  uint64_t v3 = [(NRMutableDeviceCollection *)self activeDeviceID];
  id v4 = [(NRMutableDeviceCollection *)self objectForKeyedSubscript:v3];

  return (NRMutableDevice *)v4;
}

- (NSUUID)activeDeviceID
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self;
  uint64_t v3 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", v7, (void)v13);
        long long v9 = [v8 objectForKeyedSubscript:@"isActive"];
        long long v10 = [v9 value];
        if ([v10 BOOLValue])
        {
          id v11 = v7;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return (NSUUID *)v11;
}

- (void)setActiveDeviceID:(id)a3
{
  id v6 = [(NRMutableDeviceCollection *)self _diffsToChangeActiveDeviceToDeviceID:a3];
  if (v6)
  {
    uint64_t v4 = [[NRDeviceCollectionDiff alloc] initWithDeviceCollectionDiffDeviceDiffs:v6];
    id v5 = [(NRMutableStateBase *)self applyDiff:v4];
  }
}

- (id)_diffsToChangeActiveDeviceToDeviceID:(id)a3
{
  id v4 = a3;
  id v5 = [(NRMutableDeviceCollection *)self activeDeviceID];
  id v6 = v5;
  if (v5 == v4 || ([v5 isEqual:v4] & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    if (v6)
    {
      long long v9 = [NRDeviceDiff alloc];
      long long v10 = +[NRMutableDevice diffsToActivate:0 withDate:v8];
      id v11 = [(NRDeviceDiff *)v9 initWithDiffPropertyDiffs:v10];

      long long v12 = [[NRDeviceDiffType alloc] initWithDiff:v11 andChangeType:1];
      [v7 setObject:v12 forKeyedSubscript:v6];
    }
    if (v4)
    {
      long long v13 = [NRDeviceDiff alloc];
      long long v14 = +[NRMutableDevice diffsToActivate:1 withDate:v8];
      long long v15 = [(NRDeviceDiff *)v13 initWithDiffPropertyDiffs:v14];

      long long v16 = [[NRDeviceDiffType alloc] initWithDiff:v15 andChangeType:1];
      [v7 setObject:v16 forKeyedSubscript:v4];
    }
  }

  return v7;
}

- (BOOL)paired
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self;
  uint64_t v3 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        char v7 = [v6 isPaired];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)allAltAccount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self;
  uint64_t v3 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        long long v9 = -[NRMutableDeviceCollection objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if ([v9 isPaired] && (objc_msgSend(v9, "isArchived") & 1) == 0)
        {
          char v10 = [v9 isAltAccount];
          v5 |= v10;
          v6 |= v10 ^ 1;
        }
      }
      uint64_t v4 = [(NRMutableDeviceCollection *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
    char v6 = 0;
  }

  return v5 & ~v6 & 1;
}

+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  long long v20 = (char *)a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v21 = *(void *)v24;
    long long v19 = v20 + 16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v12 = objc_msgSend(v7, "objectForKeyedSubscript:", v11, v19);
        long long v13 = [v12 diff];
        long long v14 = [v13 objectForKeyedSubscript:v22];
        long long v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 changeType];
          uint64_t v17 = [v15 diff];
          uint64_t v18 = [v17 value];
          (*((void (**)(char *, uint64_t, uint64_t, void *))v20 + 2))(v20, v11, v16, v18);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
}

@end