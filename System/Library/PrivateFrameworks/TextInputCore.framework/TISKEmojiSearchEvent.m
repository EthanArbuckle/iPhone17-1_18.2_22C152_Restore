@interface TISKEmojiSearchEvent
- (BOOL)engaged;
- (id)description;
- (id)init:(double)a3 engaged:(BOOL)a4 order:(int64_t)a5;
- (void)reportToSession:(id)a3;
- (void)setEngaged:(BOOL)a3;
@end

@implementation TISKEmojiSearchEvent

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (id)description
{
  if (self->_engaged) {
    return @"ef:1";
  }
  else {
    return @"ef:0";
  }
}

- (void)reportToSession:(id)a3
{
  uint64_t v3 = kTISKNumberOfTappedKeysCounter;
  id v4 = a3;
  [v4 addSample:&unk_1F3FA7D00 forKey:v3];
  [v4 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
}

- (id)init:(double)a3 engaged:(BOOL)a4 order:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)TISKEmojiSearchEvent;
  id result = [(TISKTimestampEvent *)&v7 init:19 timestamp:1 emojiSearchMode:a5 order:a3];
  if (result) {
    *((unsigned char *)result + 40) = a4;
  }
  return result;
}

@end