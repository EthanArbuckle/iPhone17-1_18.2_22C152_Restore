@interface TUIStatsFeedEntryCollector
- (NSMutableArray)passes;
- (NSString)uid;
- (TUIStatsFeedEntryCollector)initWithMode:(unint64_t)a3 uid:(id)a4;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
- (unint64_t)mode;
- (void)updateWithPass:(id)a3;
@end

@implementation TUIStatsFeedEntryCollector

- (TUIStatsFeedEntryCollector)initWithMode:(unint64_t)a3 uid:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIStatsFeedEntryCollector;
  v7 = [(TUIStatsFeedEntryCollector *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = a3;
    v9 = (NSString *)[v6 copy];
    uid = v8->_uid;
    v8->_uid = v9;

    v8->_eventCount[28] = 0;
    *(_OWORD *)&v8->_eventCount[24] = 0u;
    *(_OWORD *)&v8->_eventCount[26] = 0u;
    *(_OWORD *)&v8->_eventCount[20] = 0u;
    *(_OWORD *)&v8->_eventCount[22] = 0u;
    *(_OWORD *)&v8->_eventCount[16] = 0u;
    *(_OWORD *)&v8->_eventCount[18] = 0u;
    *(_OWORD *)&v8->_eventCount[12] = 0u;
    *(_OWORD *)&v8->_eventCount[14] = 0u;
    *(_OWORD *)&v8->_eventCount[8] = 0u;
    *(_OWORD *)&v8->_eventCount[10] = 0u;
    *(_OWORD *)&v8->_eventCount[4] = 0u;
    *(_OWORD *)&v8->_eventCount[6] = 0u;
    *(_OWORD *)v8->_eventCount = 0u;
    *(_OWORD *)&v8->_eventCount[2] = 0u;
    *(_OWORD *)v8->_elapsedTime = 0u;
    *(_OWORD *)&v8->_elapsedTime[2] = 0u;
    v8->_elapsedTime[4] = 0.0;
    if ((v8->_mode & 2) != 0)
    {
      uint64_t v11 = objc_opt_new();
      passes = v8->_passes;
      v8->_passes = (NSMutableArray *)v11;
    }
  }

  return v8;
}

- (void)updateWithPass:(id)a3
{
  id v4 = a3;
  unint64_t mode = self->_mode;
  id v10 = v4;
  if ((mode & 4) != 0)
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      [v4 elapsedTimeForPhase:i];
      id v4 = v10;
      self->_elapsedTime[i] = v7 + self->_elapsedTime[i];
    }
    unint64_t mode = self->_mode;
    if ((mode & 8) == 0)
    {
LABEL_3:
      if ((mode & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((mode & 8) == 0)
  {
    goto LABEL_3;
  }
  for (uint64_t j = 0; j != 29; ++j)
  {
    id v9 = [v4 countForEvent:j];
    id v4 = v10;
    self->_eventCount[j] += (unint64_t)v9;
  }
  if ((self->_mode & 2) != 0)
  {
LABEL_4:
    [(NSMutableArray *)self->_passes addObject:v10];
    id v4 = v10;
  }
LABEL_5:
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSMutableArray)passes
{
  return self->_passes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passes, 0);

  objc_storeStrong((id *)&self->_uid, 0);
}

@end