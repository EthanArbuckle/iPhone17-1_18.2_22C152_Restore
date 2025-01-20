@interface TUIStatsFeedPass
- (NSArray)entryPasses;
- (NSString)description;
- (TUIStatsFeedPass)initWithMode:(unint64_t)a3 timingCollector:(id)a4 passes:(id)a5;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
- (unint64_t)reason;
@end

@implementation TUIStatsFeedPass

- (TUIStatsFeedPass)initWithMode:(unint64_t)a3 timingCollector:(id)a4 passes:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUIStatsFeedPass;
  v10 = [(TUIStatsFeedPass *)&v25 init];
  v11 = v10;
  if (v10)
  {
    v10->_reason = 0;
    for (uint64_t i = 1; i != 6; ++i)
    {
      [v8 elapsedTimeForPhase:i - 1];
      *((void *)&v11->super.isa + i) = v13;
    }
    v11->_eventCount[28] = 0;
    *(_OWORD *)&v11->_eventCount[24] = 0u;
    *(_OWORD *)&v11->_eventCount[26] = 0u;
    *(_OWORD *)&v11->_eventCount[20] = 0u;
    *(_OWORD *)&v11->_eventCount[22] = 0u;
    *(_OWORD *)&v11->_eventCount[16] = 0u;
    *(_OWORD *)&v11->_eventCount[18] = 0u;
    *(_OWORD *)&v11->_eventCount[12] = 0u;
    *(_OWORD *)&v11->_eventCount[14] = 0u;
    *(_OWORD *)&v11->_eventCount[8] = 0u;
    *(_OWORD *)&v11->_eventCount[10] = 0u;
    *(_OWORD *)&v11->_eventCount[4] = 0u;
    *(_OWORD *)&v11->_eventCount[6] = 0u;
    *(_OWORD *)v11->_eventCount = 0u;
    *(_OWORD *)&v11->_eventCount[2] = 0u;
    if ((v6 & 8) != 0)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_5BFC4;
      v23[3] = &unk_2530F0;
      v24 = v11;
      [v9 enumerateObjectsUsingBlock:v23];
    }
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_5C01C;
    v21 = &unk_2530F0;
    v14 = v11;
    v22 = v14;
    [v9 enumerateObjectsUsingBlock:&v18];
    if ((v6 & 2) != 0)
    {
      v15 = [v9 copy:v18, v19, v20, v21];
      entryPasses = v14->_entryPasses;
      v14->_entryPasses = v15;
    }
  }

  return v11;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSString)description
{
  v3 = objc_opt_new();
  sub_5B188(v3, self, @"\n");
  [v3 appendString:@"\n"];
  sub_5B2B8(v3, self, @"\n");
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSArray)entryPasses
{
  return self->_entryPasses;
}

- (void).cxx_destruct
{
}

@end