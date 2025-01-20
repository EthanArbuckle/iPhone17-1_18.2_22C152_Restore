@interface TISKEmojiSwitchEvent
- (id)description;
- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (void)reportToSession:(id)a3;
@end

@implementation TISKEmojiSwitchEvent

- (id)description
{
  if ([(TISKEvent *)self emojiSearchMode]) {
    v2 = @"es:1";
  }
  else {
    v2 = @"es:0";
  }

  return v2;
}

- (void)reportToSession:(id)a3
{
  uint64_t v3 = kTISKNumberOfTappedKeysCounter;
  id v4 = a3;
  [v4 addSample:&unk_1F3FA7D00 forKey:v3];
  [v4 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
}

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKEmojiSwitchEvent;
  return [(TISKTimestampEvent *)&v6 init:18 timestamp:a4 emojiSearchMode:a5 order:a3];
}

@end