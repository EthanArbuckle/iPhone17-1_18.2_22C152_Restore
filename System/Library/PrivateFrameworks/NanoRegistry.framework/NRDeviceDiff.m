@interface NRDeviceDiff
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDeviceDiff)initWithCoder:(id)a3;
- (NRDeviceDiff)initWithDiffPropertyDiffs:(id)a3;
- (NRDeviceDiff)initWithProtobuf:(id)a3;
- (NRPBDeviceDiff)protobuf;
- (id)allPropertyNames;
- (id)description;
- (id)diffPropertyDiffForName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_createIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRDeviceDiff

- (NRDeviceDiff)initWithDiffPropertyDiffs:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRDeviceDiff;
  v6 = [(NRDeviceDiff *)&v10 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_diffPropertyDiffs, a3), ![v5 count])) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }

  return v8;
}

- (id)diffPropertyDiffForName:(id)a3
{
  return [(NSDictionary *)self->_diffPropertyDiffs objectForKeyedSubscript:a3];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSDictionary *)self->_diffPropertyDiffs countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_diffPropertyDiffs count];
}

- (id)allPropertyNames
{
  return [(NSDictionary *)self->_diffPropertyDiffs allKeys];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_createIndex
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:*(void *)(a1 + 8) name:@"device property diff type" owner:a1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v6 name:@"device property diff type key" classes:v7 owner:a1];

        v8 = [*(id *)(a1 + 8) objectForKeyedSubscript:v6];
        v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:v8 name:@"device property diff type property" classes:v9 owner:a1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

- (NRDeviceDiff)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRDeviceDiff *)self init];
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
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"properties"];
    diffPropertyDiffs = v5->_diffPropertyDiffs;
    v5->_diffPropertyDiffs = (NSDictionary *)v13;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_diffPropertyDiffs name:@"device property diff type" owner:v5];
    -[NRDeviceDiff _createIndex]((uint64_t)v5);
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [[NRPBDeviceDiff alloc] initWithData:v6];
  v9 = [(NRDeviceDiff *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRDeviceDiff *)self protobuf];
  uint64_t v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (NRDeviceDiff)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRDeviceDiff;
  uint64_t v5 = [(NRDeviceDiff *)&v21 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v7 = 0;
    if (!v4) {
      goto LABEL_10;
    }
LABEL_3:
    for (i = (void *)v4[2]; ; i = 0)
    {
      id v9 = i;
      unint64_t v10 = [v9 count];

      if (v7 >= v10) {
        break;
      }
      if (v4) {
        long long v11 = (void *)v4[2];
      }
      else {
        long long v11 = 0;
      }
      id v12 = v11;
      uint64_t v13 = [v12 objectAtIndexedSubscript:v7];

      if (v4) {
        long long v14 = (void *)v4[1];
      }
      else {
        long long v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = [v15 objectAtIndexedSubscript:v7];

      uint64_t v17 = [[NRDevicePropertyDiffType alloc] initWithProtobuf:v16];
      [v6 setObject:v17 forKeyedSubscript:v13];

      ++v7;
      if (v4) {
        goto LABEL_3;
      }
LABEL_10:
      ;
    }
    uint64_t v18 = [v6 copy];
    diffPropertyDiffs = v5->_diffPropertyDiffs;
    v5->_diffPropertyDiffs = (NSDictionary *)v18;

    -[NRDeviceDiff _createIndex]((uint64_t)v5);
  }

  return v5;
}

- (NRPBDeviceDiff)protobuf
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  -[NRPBDeviceDiff setNames:](v3, v4);

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  -[NRPBDeviceDiff setDiffs:](v3, v5);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = 8;
  id obj = self->_diffPropertyDiffs;
  uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    unint64_t v10 = @"capabilities";
    v30 = @"capabilities";
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      uint64_t v32 = v8;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "objectForKeyedSubscript:", v12, v30, v31);
        if ([v12 isEqual:v10])
        {
          uint64_t v14 = v6;
          id v15 = self;
          uint64_t v16 = [v13 diff];
          uint64_t v17 = [v16 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v19 = [v13 diff];
            v20 = [v19 value];

            objc_super v21 = [[NRMiniUUIDSet alloc] initWithUUIDSet:v20];
            v22 = [[NRDevicePropertyDiff alloc] initWithValue:v21];
            v23 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v22, [v13 changeType]);

            uint64_t v13 = v23;
          }
          self = v15;
          uint64_t v6 = v14;
          uint64_t v9 = v31;
          uint64_t v8 = v32;
          unint64_t v10 = v30;
        }
        if (v3)
        {
          id v24 = *(id *)(v3 + 16);
          [v24 addObject:v12];

          v25 = *(void **)(v3 + 8);
        }
        else
        {
          [0 addObject:v12];
          v25 = 0;
        }
        id v26 = v25;
        v27 = [v13 protobuf];
        [v26 addObject:v27];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v28 = [(NSDictionary *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v8 = v28;
    }
    while (v28);
  }

  return (NRPBDeviceDiff *)(id)v3;
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_diffPropertyDiffs;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    unint64_t v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = -[NSDictionary objectForKeyedSubscript:](self->_diffPropertyDiffs, "objectForKeyedSubscript:", v9, (void)v13);
        uint64_t v11 = [v9 hash] - v7 + 32 * v7;
        unint64_t v7 = [v10 hash] - v11 + 32 * v11;
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NRDeviceDiff;
  if ([(NRDiffBase *)&v8 isEqual:v4])
  {
    diffPropertyDiffs = self->_diffPropertyDiffs;
    if (diffPropertyDiffs == (NSDictionary *)v4[1]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSDictionary isEqual:](diffPropertyDiffs, "isEqual:");
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NSDictionary *)self->_diffPropertyDiffs allKeys];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_20];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    unint64_t v7 = &stru_1EF6CAD80;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        uint64_t v11 = [(NSDictionary *)self->_diffPropertyDiffs objectForKeyedSubscript:v10];
        id v12 = [v10 stringByPaddingToLength:30 withString:@" " startingAtIndex:0];
        long long v13 = [v11 description];
        long long v14 = +[NRTextFormattingUtilities prefixLinesWithString:v12 withText:v13];

        unint64_t v7 = [(__CFString *)v9 stringByAppendingString:v14];

        ++v8;
        uint64_t v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = &stru_1EF6CAD80;
  }

  return v7;
}

uint64_t __27__NRDeviceDiff_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:1];
}

- (void).cxx_destruct
{
}

@end