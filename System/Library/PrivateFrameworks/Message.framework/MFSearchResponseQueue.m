@interface MFSearchResponseQueue
- (BOOL)addItem:(id)a3;
- (BOOL)flush;
- (MFSearchResponseQueue)init;
- (NSIndexSet)indexSet;
- (unint64_t)flagsForItem:(id)a3;
- (unint64_t)uidForItem:(id)a3;
- (void)dealloc;
@end

@implementation MFSearchResponseQueue

- (MFSearchResponseQueue)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFSearchResponseQueue;
  v2 = [(MFBaseSyncResponseQueue *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MFBufferedQueue *)v2 setMaximumLatency:60.0];
    v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    indexSet = v3->indexSet;
    v3->indexSet = v4;
  }
  return v3;
}

- (BOOL)addItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 responseType] == 14)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = objc_msgSend(v4, "searchResults", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v6) {
      goto LABEL_13;
    }
    uint64_t v7 = *(void *)v13;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue];
        if ([(NSMutableIndexSet *)self->indexSet count] >= (unint64_t)self->limit)
        {
          unint64_t v10 = [(NSMutableIndexSet *)self->indexSet firstIndex];
          if (v10 >= v9) {
            continue;
          }
          [(NSMutableIndexSet *)self->indexSet removeIndex:v10];
        }
        [(NSMutableIndexSet *)self->indexSet addIndex:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_13:

        break;
      }
    }
  }

  return 1;
}

- (BOOL)flush
{
  indexSet = self->indexSet;
  if (indexSet)
  {
    uint64_t v4 = [(NSMutableIndexSet *)indexSet lastIndex];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v4;
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = [(NSMutableIndexSet *)self->indexSet indexLessThanIndex:i])
      {
        uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        v9.receiver = self;
        v9.super_class = (Class)MFSearchResponseQueue;
        [(MFBufferedQueue *)&v9 addItem:v6];
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MFSearchResponseQueue;
  return [(MFBufferedQueue *)&v8 flush];
}

- (unint64_t)uidForItem:(id)a3
{
  return [a3 unsignedIntegerValue];
}

- (unint64_t)flagsForItem:(id)a3
{
  return 0;
}

- (void)dealloc
{
  indexSet = self->indexSet;
  self->indexSet = 0;

  v4.receiver = self;
  v4.super_class = (Class)MFSearchResponseQueue;
  [(MFSearchResponseQueue *)&v4 dealloc];
}

- (NSIndexSet)indexSet
{
  return &self->indexSet->super;
}

- (void).cxx_destruct
{
}

@end