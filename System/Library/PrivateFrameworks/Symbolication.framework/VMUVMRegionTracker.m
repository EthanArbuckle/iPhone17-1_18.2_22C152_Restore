@interface VMUVMRegionTracker
+ (BOOL)supportsSecureCoding;
- (VMUVMRegionTracker)init;
- (VMUVMRegionTracker)initWithCoder:(id)a3;
- (VMUVMRegionTracker)initWithStackLogReader:(id)a3;
- (id)vmRegionRangeInfoForRange:(_VMURange)a3;
- (int64_t)regionCount;
- (unint64_t)_regionIndexForAddress:(unint64_t)a3;
- (unint64_t)handleStackLogType:(unsigned int)a3 address:(unint64_t)a4 size:(unint64_t)a5 stackID:(unint64_t)a6;
- (void)convertStackIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMUVMRegionTracker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUVMRegionTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMUVMRegionTracker;
  v2 = [(VMUVMRegionTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    regionInfoArray = v2->_regionInfoArray;
    v2->_regionInfoArray = v3;
  }
  return v2;
}

- (VMUVMRegionTracker)initWithStackLogReader:(id)a3
{
  id v4 = a3;
  v5 = [(VMUVMRegionTracker *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_stackLogReader, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke;
    v9[3] = &unk_1E5D237E8;
    v10 = v6;
    [v4 enumerateMSLRecordsAndPayloads:v9];
  }
  return v6;
}

uint64_t __45__VMUVMRegionTracker_initWithStackLogReader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
  v9 = *(void **)(a1 + 32);

  return [v9 handleStackLogType:a2 address:a3 size:a4 stackID:uniquing_table_index];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [NSNumber numberWithUnsignedInt:1];
  [v4 encodeObject:v5 forKey:@"classVersion"];

  objc_super v6 = objc_opt_new();
  [v6 serialize32:-[VMUVMRegionTracker regionCount](self, "regionCount")];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_regionInfoArray;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v6 serialize64:[v12 address]];
        [v6 serialize64:[v12 size]];
        [v6 serialize32:[v12 stackIdentifier]];
        [v6 serialize32:[v12 userTag]];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copyContiguousData];
  [v4 encodeObject:v13 forKey:@"simpleSerializerData"];
}

- (VMUVMRegionTracker)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VMUVMRegionTracker;
  v5 = [(VMUVMRegionTracker *)&v26 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
    int v7 = [v6 unsignedIntValue];

    if (v7 != 1)
    {
LABEL_14:
      uint64_t v19 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
    uint64_t v9 = [[VMUSimpleDeserializer alloc] initWithData:v8];
    id v25 = 0;
    unsigned int v10 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v25];
    id v11 = v25;
    if (v11)
    {
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
    regionInfoArray = v5->_regionInfoArray;
    v5->_regionInfoArray = (NSMutableArray *)v12;

    if (v10)
    {
      while (1)
      {
        long long v14 = objc_opt_new();
        id v24 = 0;
        uint64_t v15 = [(VMUSimpleDeserializer *)v9 deserialize64WithError:&v24];
        id v11 = v24;
        [v14 setAddress:v15];
        if (v11) {
          break;
        }
        id v23 = 0;
        uint64_t v16 = [(VMUSimpleDeserializer *)v9 deserialize64WithError:&v23];
        id v11 = v23;
        [v14 setSize:v16];
        if (v11) {
          break;
        }
        id v22 = 0;
        unsigned int v17 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v22];
        id v11 = v22;
        [v14 setStackIdentifier:v17];
        if (v11) {
          break;
        }
        id v21 = 0;
        uint64_t v18 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v21];
        id v11 = v21;
        [v14 setUserTag:v18];
        if (v11) {
          break;
        }
        [(NSMutableArray *)v5->_regionInfoArray addObject:v14];

        if (!--v10) {
          goto LABEL_10;
        }
      }

      goto LABEL_13;
    }
LABEL_10:
  }
  uint64_t v19 = v5;
LABEL_15:

  return v19;
}

- (int64_t)regionCount
{
  return [(NSMutableArray *)self->_regionInfoArray count];
}

- (unint64_t)_regionIndexForAddress:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableArray *)self->_regionInfoArray count];
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5;
  int v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = v7;
    int v7 = [(NSMutableArray *)self->_regionInfoArray objectAtIndexedSubscript:v8 + (v6 >> 1)];

    unint64_t v10 = [v7 range];
    if (a3 - v10 < v11) {
      break;
    }
    if (a3 < v10)
    {
      v6 >>= 1;
    }
    else
    {
      v8 += (v6 >> 1) + 1;
      v6 += ~(v6 >> 1);
    }
    if (!v6) {
      goto LABEL_11;
    }
  }
  v8 += v6 >> 1;
LABEL_11:

  return v8;
}

- (unint64_t)handleStackLogType:(unsigned int)a3 address:(unint64_t)a4 size:(unint64_t)a5 stackID:(unint64_t)a6
{
  if ((a3 & 0x30) == 0) {
    return 0;
  }
  unint64_t v7 = a5;
  if (a5 % *MEMORY[0x1E4F14B00]) {
    unint64_t v7 = ~*MEMORY[0x1E4F14AF0] & (*MEMORY[0x1E4F14AF0] + a5);
  }
  unint64_t v11 = [(VMUVMRegionTracker *)self _regionIndexForAddress:a4];
  if (v11 >= [(NSMutableArray *)self->_regionInfoArray count])
  {
    long long v14 = 0;
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = v7 + a4;
    while (1)
    {
      long long v14 = [(NSMutableArray *)self->_regionInfoArray objectAtIndex:v11];
      unint64_t v15 = [v14 range];
      BOOL v17 = VMURangeContainsRange(a4, v7, v15, v16);
      unint64_t v18 = [v14 range];
      if (!v17) {
        break;
      }
      v12 -= v19;

      [(NSMutableArray *)self->_regionInfoArray removeObjectAtIndex:v11];
      if (v11 >= [(NSMutableArray *)self->_regionInfoArray count])
      {
        long long v14 = 0;
        goto LABEL_11;
      }
    }
    if (VMURangeIntersectsRange(a4, v7, v18, v19))
    {
      unint64_t v22 = [v14 range] - a4;
      uint64_t v23 = [v14 range];
      if (v22 >= v7)
      {
        if (v24 + ~a4 + v23 >= v7)
        {
          v28 = objc_alloc_init(VMUVMRegionRangeInfo);
          [(VMUVMRegionRangeInfo *)v28 setAddress:v7 + a4];
          uint64_t v29 = [v14 range];
          [(VMUVMRegionRangeInfo *)v28 setSize:v30 - v13 + v29];
          -[VMUVMRegionRangeInfo setStackIdentifier:](v28, "setStackIdentifier:", [v14 stackIdentifier]);
          -[VMUVMRegionRangeInfo setUserTag:](v28, "setUserTag:", [v14 userTag]);
          [(NSMutableArray *)self->_regionInfoArray insertObject:v28 atIndex:++v11];
          [v14 setSize:([v14 range] - a4 + [v14 size])];

          unint64_t v25 = v7;
        }
        else
        {
          uint64_t v26 = [v14 range];
          unint64_t v25 = v27 - a4 + v26;
          [v14 setSize:[v14 size] - v25];
          ++v11;
        }
      }
      else
      {
        unint64_t v25 = v13 - v23;
        [v14 setAddress:v25 + [v14 address]];
        [v14 setSize:[v14 size] - v25];
      }
      v12 -= v25;
    }
  }
LABEL_11:
  if ((a3 & 0x10) != 0)
  {
    v20 = objc_alloc_init(VMUVMRegionRangeInfo);

    [(VMUVMRegionRangeInfo *)v20 setAddress:a4];
    [(VMUVMRegionRangeInfo *)v20 setSize:v7];
    [(VMUVMRegionRangeInfo *)v20 setStackIdentifier:a6];
    [(VMUVMRegionRangeInfo *)v20 setUserTag:HIBYTE(a3)];
    [(NSMutableArray *)self->_regionInfoArray insertObject:v20 atIndex:v11];
    v12 += v7;
    long long v14 = v20;
  }

  return v12;
}

- (void)convertStackIDs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, uint64_t))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_regionInfoArray;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9) setStackIdentifier:v4[2](v4, [*(id *)(*((void *)&v10 + 1) + 8 * v9) stackIdentifier])];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)vmRegionRangeInfoForRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  unint64_t v6 = -[VMUVMRegionTracker _regionIndexForAddress:](self, "_regionIndexForAddress:");
  if (v6 >= [(NSMutableArray *)self->_regionInfoArray count])
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_regionInfoArray objectAtIndexedSubscript:v6];
    unint64_t v8 = [v7 range];
    if (VMURangeContainsRange(v8, v9, location, length)
      || (unint64_t v10 = [v7 range], VMURangeIntersectsRange(v10, v11, location, length)))
    {
      id v12 = v7;
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfoArray, 0);

  objc_destroyWeak((id *)&self->_stackLogReader);
}

@end