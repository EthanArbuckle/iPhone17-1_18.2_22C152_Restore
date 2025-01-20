@interface NRDeviceCollectionDiff
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDeviceCollectionDiff)initWithCoder:(id)a3;
- (NRDeviceCollectionDiff)initWithDeviceCollectionDiffDeviceDiffs:(id)a3;
- (NRDeviceCollectionDiff)initWithProtobuf:(id)a3;
- (NRPBDeviceCollectionDiff)protobuf;
- (id)allPairingIDs;
- (id)description;
- (id)diffCollectionDiffForPairingID:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_createIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDeviceCollectionDiff

- (void).cxx_destruct
{
}

- (NRDeviceCollectionDiff)initWithDeviceCollectionDiffDeviceDiffs:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRDeviceCollectionDiff;
  v6 = [(NRDeviceCollectionDiff *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_diffDeviceDiffs, a3), ![v5 count])) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (id)diffCollectionDiffForPairingID:(id)a3
{
  return [(NSDictionary *)self->_diffDeviceDiffs objectForKeyedSubscript:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSDictionary *)self->_diffDeviceDiffs countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_diffDeviceDiffs count];
}

- (id)allPairingIDs
{
  return [(NSDictionary *)self->_diffDeviceDiffs allKeys];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createIndex
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = *(id *)(a1 + 8);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * v5);
        v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v6 name:@"device collection diff type key" classes:v7 owner:a1];

        v8 = [*(id *)(a1 + 8) objectForKeyedSubscript:v6];
        v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v8 name:@"device collection diff type value" classes:v9 owner:a1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

- (NRDeviceCollectionDiff)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRDeviceCollectionDiff *)self init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:3];
    long long v12 = objc_msgSend(v10, "setWithArray:", v11, v16, v17);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"devices"];
    diffDeviceDiffs = v5->_diffDeviceDiffs;
    v5->_diffDeviceDiffs = (NSDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_diffDeviceDiffs name:@"device collection diff type" owner:v5];
    -[NRDeviceCollectionDiff _createIndex]((uint64_t)v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [[NRPBDeviceCollectionDiff alloc] initWithData:v6];
  v9 = [(NRDeviceCollectionDiff *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRDeviceCollectionDiff *)self protobuf];
  uint64_t v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (NRDeviceCollectionDiff)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NRDeviceCollectionDiff;
  uint64_t v5 = [(NRDeviceCollectionDiff *)&v25 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v24 = (uint64_t)v5;
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v8 = 0;
    if (!v4) {
      goto LABEL_12;
    }
LABEL_3:
    for (i = (void *)v4[2]; ; i = 0)
    {
      id v10 = i;
      unint64_t v11 = [v10 count];

      if (v8 >= v11) {
        break;
      }
      if (v4) {
        long long v12 = (void *)v4[2];
      }
      else {
        long long v12 = 0;
      }
      id v13 = v12;
      long long v14 = [v13 objectAtIndexedSubscript:v8];

      if ([v14 length] == 16)
      {
        v15 = [v14 toUUID];
        uint64_t v16 = [NRDeviceDiffType alloc];
        if (v4) {
          uint64_t v17 = (void *)v4[1];
        }
        else {
          uint64_t v17 = 0;
        }
        id v18 = v17;
        uint64_t v19 = [v18 objectAtIndexedSubscript:v8];
        v20 = [(NRDeviceDiffType *)v16 initWithProtobuf:v19];
        [v7 setObject:v20 forKeyedSubscript:v15];
      }
      ++v8;
      if (v4) {
        goto LABEL_3;
      }
LABEL_12:
      ;
    }
    uint64_t v21 = [v7 copy];
    id v6 = (NRDeviceCollectionDiff *)v24;
    v22 = *(void **)(v24 + 8);
    *(void *)(v24 + 8) = v21;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v6->_diffDeviceDiffs name:@"device collection diff type" owner:v6];
    -[NRDeviceCollectionDiff _createIndex](v24);
  }
  return v6;
}

- (NRPBDeviceCollectionDiff)protobuf
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  -[NRPBDeviceCollectionDiff setPairingIDs:](v3, v4);

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  -[NRPBDeviceCollectionDiff setDiffs:](v3, v5);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = self->_diffDeviceDiffs;
  uint64_t v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        unint64_t v11 = [(NSDictionary *)self->_diffDeviceDiffs objectForKeyedSubscript:v10];
        if (v3)
        {
          id v12 = *(id *)(v3 + 16);
          id v13 = [MEMORY[0x1E4F1C9B8] fromUUID:v10];
          [v12 addObject:v13];

          long long v14 = *(void **)(v3 + 8);
        }
        else
        {
          uint64_t v17 = [MEMORY[0x1E4F1C9B8] fromUUID:v10];
          [0 addObject:v17];

          long long v14 = 0;
        }
        id v15 = v14;
        uint64_t v16 = [v11 protobuf];
        [v15 addObject:v16];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v18 = [(NSDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }

  return (NRPBDeviceCollectionDiff *)(id)v3;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_diffDeviceDiffs;
  uint64_t v3 = [(NSDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
      uint64_t v4 = [(NSDictionary *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  uint64_t v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NRDeviceCollectionDiff;
  if ([(NRDiffBase *)&v8 isEqual:v4])
  {
    diffDeviceDiffs = self->_diffDeviceDiffs;
    if (diffDeviceDiffs == (NSDictionary *)v4[1]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSDictionary isEqual:](diffDeviceDiffs, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NSDictionary *)self->_diffDeviceDiffs allKeys];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_10];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = &stru_1EF6CAD80;
    do
    {
      uint64_t v8 = 0;
      long long v9 = v7;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        long long v11 = [(NSDictionary *)self->_diffDeviceDiffs objectForKeyedSubscript:v10];
        long long v12 = [v10 UUIDString];
        id v13 = [v12 stringByPaddingToLength:36 withString:@" " startingAtIndex:0];

        uint64_t v14 = [v11 description];
        id v15 = +[NRTextFormattingUtilities prefixLinesWithString:v13 withText:v14];

        uint64_t v7 = [(__CFString *)v9 stringByAppendingString:v15];

        ++v8;
        long long v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = &stru_1EF6CAD80;
  }

  return v7;
}

uint64_t __37__NRDeviceCollectionDiff_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 UUIDString];
  uint64_t v6 = [v4 UUIDString];

  uint64_t v7 = [v5 compare:v6 options:0];
  return v7;
}

@end