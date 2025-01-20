@interface NRDeviceCollectionHistoryEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRDeviceCollectionDiff)diff;
- (NRDeviceCollectionHistoryEntry)initWithCoder:(id)a3;
- (NRDeviceCollectionHistoryEntry)initWithHistory:(id)a3 index:(unint64_t)a4 date:(id)a5 diff:(id)a6 switchIndex:(unsigned int)a7;
- (NRDeviceCollectionHistoryEntry)initWithProtobuf:(id)a3;
- (NRMutableDeviceCollection)state;
- (NRPBDeviceCollectionHistoryEntry)protobuf;
- (NSDate)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)index;
- (unsigned)switchIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setHistoryManager:(uint64_t)a1;
@end

@implementation NRDeviceCollectionHistoryEntry

- (NRDeviceCollectionHistoryEntry)initWithHistory:(id)a3 index:(unint64_t)a4 date:(id)a5 diff:(id)a6 switchIndex:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v16 = [(NRDeviceCollectionHistoryEntry *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_historyManager, a3);
    v17->_index = a4;
    objc_storeStrong((id *)&v17->_date, a5);
    objc_storeStrong((id *)&v17->_diff, a6);
    v17->_switchIndex = a7;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDeviceCollectionHistoryEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NRDeviceCollectionHistoryEntry *)self init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    v5->_index = [v4 decodeInt64ForKey:@"index"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diff"];
    diff = v5->_diff;
    v5->_diff = (NRDeviceCollectionDiff *)v12;

    v5->_switchIndex = [v4 decodeInt32ForKey:@"switchIndex"];
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [[NRPBDeviceCollectionHistoryEntry alloc] initWithData:v6];
  v9 = [(NRDeviceCollectionHistoryEntry *)v5 initWithProtobuf:v8];

LABEL_6:
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NRDeviceCollectionHistoryEntry *)self protobuf];
  v5 = [v6 data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (NRDeviceCollectionHistoryEntry)initWithProtobuf:(id)a3
{
  id v4 = (double *)a3;
  v5 = [(NRDeviceCollectionHistoryEntry *)self init];
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      unint64_t v7 = *((void *)v4 + 2);
      double v8 = v4[1];
    }
    else
    {
      unint64_t v7 = 0;
      double v8 = 0.0;
    }
    v5->_index = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
    date = v6->_date;
    v6->_date = (NSDate *)v9;

    v11 = [NRDeviceCollectionDiff alloc];
    if (v4) {
      uint64_t v12 = (void *)*((void *)v4 + 3);
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [(NRDeviceCollectionDiff *)v11 initWithProtobuf:v13];
    diff = v6->_diff;
    v6->_diff = (NRDeviceCollectionDiff *)v14;
  }
  return v6;
}

- (NRPBDeviceCollectionHistoryEntry)protobuf
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t index = self->_index;
    *(unsigned char *)(v3 + 32) |= 2u;
    *(void *)(v3 + 16) = index;
    [(NSDate *)self->_date timeIntervalSinceReferenceDate];
    *(unsigned char *)(v4 + 32) |= 1u;
    *(void *)(v4 + 8) = v6;
  }
  else
  {
    [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  }
  unint64_t v7 = [(NRDeviceCollectionDiff *)self->_diff protobuf];
  -[NRPBDeviceCollectionHistoryEntry setDiff:](v4, v7);

  return (NRPBDeviceCollectionHistoryEntry *)(id)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[NRDeviceCollectionHistoryEntry allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_historyManager, self->_historyManager);
  v4->_unint64_t index = self->_index;
  objc_storeStrong((id *)&v4->_date, self->_date);
  objc_storeStrong((id *)&v4->_diff, self->_diff);
  v4->_switchIndex = self->_switchIndex;
  return v4;
}

- (unint64_t)hash
{
  unint64_t index = self->_index;
  date = self->_date;
  if (index == -1) {
    uint64_t v5 = 529;
  }
  else {
    uint64_t v5 = 23 * index + 529;
  }
  uint64_t v6 = v5 + [(NSDate *)date hash];
  return self->_switchIndex + 23 * ([(NRDeviceCollectionDiff *)self->_diff hash] + 23 * v6);
}

- (NRMutableDeviceCollection)state
{
  historyManager = self->_historyManager;
  if (historyManager)
  {
    unint64_t index = self->_index;
    uint64_t v4 = (void *)MEMORY[0x1A624A5B0]();
    os_unfair_lock_lock(&historyManager->_cacheLock);
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:index];
    uint64_t v6 = [(NRDeviceCollectionHistory *)historyManager _mostRecentStateBefore:v5];
    if (!v6)
    {
      uint64_t v6 = [NSNumber numberWithLongLong:historyManager->_startIndex];
    }
    unint64_t v7 = [(NSMutableDictionary *)historyManager->_historyStateCache objectForKeyedSubscript:v6];
    if ([v6 longLongValue] != index)
    {
      uint64_t v8 = [v6 longLongValue] - historyManager->_startIndex;
      if (v7)
      {
        uint64_t v9 = [(NRMutableDeviceCollection *)v7 copyWithZone:0];

        ++v8;
        unint64_t v7 = (NRMutableDeviceCollection *)v9;
      }
      else
      {
        unint64_t v7 = objc_alloc_init(NRMutableDeviceCollection);
      }
      unint64_t v10 = index - historyManager->_startIndex;
      if (v10 >= 4 && v10 - v8 >= 4)
      {
        v22 = v4;
        do
        {
          v11 = [(NSMutableArray *)historyManager->_history objectAtIndexedSubscript:v8];
          uint64_t v12 = [v11 diff];
          id v13 = [(NRMutableStateBase *)v7 applyDiff:v12];

          ++v8;
        }
        while (historyManager->_startIndex + v8 <= index - 3);
        if (v5)
        {
          historyStateCache = historyManager->_historyStateCache;
          id v15 = [NSNumber numberWithUnsignedLongLong:index - 3];
          [(NSMutableDictionary *)historyStateCache setObject:v7 forKeyedSubscript:v15];

          v16 = [NSNumber numberWithUnsignedLongLong:index - 3];
          [(NRDeviceCollectionHistory *)historyManager _updateHistoryCachesWithIndex:v16];

          uint64_t v17 = [(NRMutableDeviceCollection *)v7 copyWithZone:0];
          unint64_t v7 = (NRMutableDeviceCollection *)v17;
        }
        uint64_t v4 = v22;
      }
      do
      {
        v18 = [(NSMutableArray *)historyManager->_history objectAtIndexedSubscript:v8];
        v19 = [v18 diff];
        id v20 = [(NRMutableStateBase *)v7 applyDiff:v19];

        ++v8;
      }
      while (historyManager->_startIndex + v8 <= index);
    }
    if (v5)
    {
      [(NSMutableDictionary *)historyManager->_historyStateCache setObject:v7 forKeyedSubscript:v5];
      [(NRDeviceCollectionHistory *)historyManager _updateHistoryCachesWithIndex:v5];
    }

    os_unfair_lock_unlock(&historyManager->_cacheLock);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  unint64_t index = self->_index;
  uint64_t v5 = +[NRTextFormattingUtilities dateFormatter:self->_date];
  uint64_t v6 = [v3 stringWithFormat:@"%06lld: %@ (switch=%u)", index, v5, self->_switchIndex];

  uint64_t v7 = [(NRDeviceCollectionDiff *)self->_diff description];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"(null)";
  }
  unint64_t v10 = +[NRTextFormattingUtilities prefixLinesWithString:v6 withText:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NRDeviceCollectionHistoryEntry *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
    BOOL v8 = 1;
    goto LABEL_14;
  }
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v8 = self->_index == v5->_index
      && ((date = self->_date, !((unint64_t)date | (unint64_t)v5->_date))
       || -[NSDate isEqual:](date, "isEqual:"))
      && ((diff = self->_diff, !((unint64_t)diff | (unint64_t)v5->_diff))
       || -[NRDeviceCollectionDiff isEqual:](diff, "isEqual:"))
      && self->_switchIndex == v5->_switchIndex;
  }
  else
  {
LABEL_10:
    BOOL v8 = 0;
  }
LABEL_14:

  return v8;
}

- (unint64_t)index
{
  return self->_index;
}

- (NSDate)date
{
  return self->_date;
}

- (NRDeviceCollectionDiff)diff
{
  return self->_diff;
}

- (unsigned)switchIndex
{
  return self->_switchIndex;
}

- (void)setHistoryManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyManager, 0);
  objc_storeStrong((id *)&self->_diff, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end