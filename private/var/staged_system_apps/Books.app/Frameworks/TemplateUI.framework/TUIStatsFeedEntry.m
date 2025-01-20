@interface TUIStatsFeedEntry
- (NSArray)passes;
- (TUIStatsFeedEntry)initWithCollector:(id)a3;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
- (unint64_t)numberOfFullPasses;
- (unint64_t)numberOfPartialPasses;
@end

@implementation TUIStatsFeedEntry

- (TUIStatsFeedEntry)initWithCollector:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUIStatsFeedEntry;
  v5 = [(TUIStatsFeedEntry *)&v25 init];
  if (v5)
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      [v4 elapsedTimeForPhase:i];
      v5->_elapsedTime[i] = v7;
    }
    for (uint64_t j = 0; j != 29; ++j)
      v5->_eventCount[j] = (unint64_t)[v4 countForEvent:j];
    v9 = [v4 passes];
    v10 = (NSArray *)[v9 copy];
    passes = v5->_passes;
    v5->_passes = v10;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = v5->_passes;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      unint64_t v15 = 0;
      unint64_t v16 = 0;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (k = 0; k != v14; k = (char *)k + 1)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v21 + 1) + 8 * (void)k);
          if (((unint64_t)objc_msgSend(v19, "reason", (void)v21) & 0xE) != 0) {
            ++v15;
          }
          else {
            v16 += (unint64_t)[v19 reason] & 1;
          }
        }
        id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }
    else
    {
      unint64_t v15 = 0;
      unint64_t v16 = 0;
    }

    v5->_numberOfFullPasses = v15;
    v5->_numberOfPartialPasses = v16;
  }

  return v5;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSArray)passes
{
  return self->_passes;
}

- (unint64_t)numberOfFullPasses
{
  return self->_numberOfFullPasses;
}

- (unint64_t)numberOfPartialPasses
{
  return self->_numberOfPartialPasses;
}

- (void).cxx_destruct
{
}

@end