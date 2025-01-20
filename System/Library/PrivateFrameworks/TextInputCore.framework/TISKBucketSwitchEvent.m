@interface TISKBucketSwitchEvent
- (TISKSessionStats)sessionStats;
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (id)privateDescription;
- (void)reportToSession:(id)a3;
- (void)setSessionStats:(id)a3;
@end

@implementation TISKBucketSwitchEvent

- (void).cxx_destruct
{
}

- (void)setSessionStats:(id)a3
{
}

- (TISKSessionStats)sessionStats
{
  return self->_sessionStats;
}

- (id)privateDescription
{
  return @"bs";
}

- (id)description
{
  v3 = NSString;
  v4 = [(TISKSessionStats *)self->_sessionStats layout];
  [v4 frame];
  uint64_t v6 = (int)v5;
  v7 = [(TISKSessionStats *)self->_sessionStats layout];
  [v7 frame];
  v9 = objc_msgSend(v3, "stringWithFormat:", @"bs:%d-%d", v6, (int)v8);

  return v9;
}

- (void)reportToSession:(id)a3
{
  uint64_t v3 = kTISKNumberOfTappedKeysCounter;
  id v4 = a3;
  [v4 addSample:&unk_1F3FA7D00 forKey:v3];
  [v4 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISKBucketSwitchEvent;
  v10 = [(TISKEvent *)&v13 init:14 emojiSearchMode:v6 order:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong(v10 + 4, a3);
  }

  return v11;
}

@end