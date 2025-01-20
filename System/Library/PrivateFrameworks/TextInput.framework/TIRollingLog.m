@interface TIRollingLog
- (NSArray)currentEntries;
- (TIRollingLog)initWithMaxCount:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)maxCount;
- (void)addEntries:(id)a3;
- (void)addEntry:(id)a3;
@end

@implementation TIRollingLog

- (void).cxx_destruct
{
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)currentEntries
{
  v3 = -[NSMutableArray subarrayWithRange:](self->_entries, "subarrayWithRange:", self->_nextIndex, self->_count - self->_nextIndex);
  v4 = -[NSMutableArray subarrayWithRange:](self->_entries, "subarrayWithRange:", 0, self->_nextIndex);
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (void)addEntries:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [(TIRollingLog *)self addEntry:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addEntry:(id)a3
{
  if (a3)
  {
    [(NSMutableArray *)self->_entries setObject:a3 atIndexedSubscript:self->_nextIndex];
    unint64_t count = self->_count;
    unint64_t maxCount = self->_maxCount;
    if (count < maxCount) {
      self->_unint64_t count = count + 1;
    }
    unint64_t nextIndex = self->_nextIndex;
    if (nextIndex + 1 < maxCount) {
      unint64_t v7 = nextIndex + 1;
    }
    else {
      unint64_t v7 = 0;
    }
    self->_unint64_t nextIndex = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSMutableArray *)self->_entries copyWithZone:a3];
    unint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    v5[2] = self->_nextIndex;
    v5[3] = self->_count;
    v5[4] = self->_maxCount;
  }
  return v5;
}

- (TIRollingLog)initWithMaxCount:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TIRollingLog;
  id v4 = [(TIRollingLog *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t maxCount = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;
  }
  return v5;
}

@end