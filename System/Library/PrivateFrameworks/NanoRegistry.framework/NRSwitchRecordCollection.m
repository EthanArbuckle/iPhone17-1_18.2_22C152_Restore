@interface NRSwitchRecordCollection
+ (BOOL)supportsSecureCoding;
- (void)addSwitchRecordWithHistoryEntry:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)truncateSwitchRecords;
@end

@implementation NRSwitchRecordCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addSwitchRecordWithHistoryEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v19 = v3;
    int v4 = [v3 switchIndex];
    id v5 = *(id *)(a1 + 8);
    v6 = [v5 lastObject];
    int v7 = v6 ? v6[6] : 0;

    id v3 = v19;
    if (v4 != v7)
    {
      id v8 = v19;
      self;
      v9 = [v8 state];
      v10 = [v9 activeDevice];

      v11 = [v8 state];
      v12 = [v11 activeDeviceID];

      v13 = [v10 objectForKeyedSubscript:@"lastActiveDate"];
      v14 = [v13 value];

      if (v14) {
        v15 = -[NRSwitchRecord initWithDeviceID:date:switchIndex:]([NRSwitchRecord alloc], "initWithDeviceID:date:switchIndex:", v12, v14, [v8 switchIndex]);
      }
      else {
        v15 = 0;
      }

      if (v15)
      {
        v16 = *(void **)(a1 + 8);
        if (!v16)
        {
          uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
          v18 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v17;

          v16 = *(void **)(a1 + 8);
        }
        [v16 addObject:v15];
      }

      id v3 = v19;
    }
  }
}

uint64_t __55__NRSwitchRecordCollection_deviceIDAtSwitchIndex_date___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = a2;
  id v5 = a3;
  if (v4)
  {
    int v6 = v4[6];
    if (v5)
    {
LABEL_3:
      int v7 = v5[6];
      goto LABEL_4;
    }
  }
  else
  {
    int v6 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  int v7 = 0;
LABEL_4:
  if (v6 > v7)
  {
    uint64_t v8 = 1;
    goto LABEL_12;
  }
  if (v4)
  {
    int v9 = v4[6];
    if (v5)
    {
LABEL_8:
      int v10 = v5[6];
      goto LABEL_9;
    }
  }
  else
  {
    int v9 = 0;
    if (v5) {
      goto LABEL_8;
    }
  }
  int v10 = 0;
LABEL_9:
  if (v9 >= v10) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
LABEL_12:

  return v8;
}

- (void)truncateSwitchRecords
{
  if (self) {
    records = self->super._records;
  }
  else {
    records = 0;
  }
  int v4 = records;
  unint64_t v5 = [(NSMutableArray *)v4 count];

  if (v5 >= 0x1F)
  {
    if (self) {
      int v6 = self->super._records;
    }
    else {
      int v6 = 0;
    }
    int v7 = v6;
    uint64_t v8 = [(NSMutableArray *)v7 count] - 30;

    if (self) {
      int v9 = self->super._records;
    }
    else {
      int v9 = 0;
    }
    v11 = v9;
    int v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v8);
    [(NSMutableArray *)v11 removeObjectsAtIndexes:v10];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(NRSwitchRecordCollection *)self truncateSwitchRecords];
  v5.receiver = self;
  v5.super_class = (Class)NRSwitchRecordCollection;
  [(NRSwitchRecordCollection *)&v5 encodeWithCoder:v4];
}

@end