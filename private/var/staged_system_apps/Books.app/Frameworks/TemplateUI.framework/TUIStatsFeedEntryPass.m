@interface TUIStatsFeedEntryPass
- (NSString)uid;
- (NSURL)url;
- (TUIStatsFeedEntryPass)initWithURL:(id)a3 uid:(id)a4 reason:(unint64_t)a5 timingCollector:(id)a6 timeBase:(mach_timebase_info)a7 eventCollector:(id)a8;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
- (unint64_t)reason;
@end

@implementation TUIStatsFeedEntryPass

- (TUIStatsFeedEntryPass)initWithURL:(id)a3 uid:(id)a4 reason:(unint64_t)a5 timingCollector:(id)a6 timeBase:(mach_timebase_info)a7 eventCollector:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)TUIStatsFeedEntryPass;
  v17 = [(TUIStatsFeedEntryPass *)&v26 init];
  if (v17)
  {
    v18 = (NSURL *)[v13 copy];
    url = v17->_url;
    v17->_url = v18;

    v20 = (NSString *)[v14 copy];
    uid = v17->_uid;
    v17->_uid = v20;

    uint64_t v22 = 0;
    v17->_reason = a5;
    do
    {
      [v15 elapsedTimeForPhase:v22];
      v17->_elapsedTime[v22++] = v23;
    }
    while (v22 != 5);
    for (uint64_t i = 0; i != 29; ++i)
      v17->_eventCount[i] = (unint64_t)[v16 countForEvent:i];
  }

  return v17;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)uid
{
  return self->_uid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end