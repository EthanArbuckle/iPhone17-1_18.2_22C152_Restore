@interface TISKShiftKeyEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
@end

@implementation TISKShiftKeyEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"sft"];
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)TISKShiftKeyEvent;
    [(TISKEvent *)&v15 reportInterKeyTiming:v6 previousEvent:v7];
    [(TISKEvent *)self touchDownTimestamp];
    double v9 = v8;
    [v7 touchDownTimestamp];
    double v11 = v10;
    int v12 = [v7 type];
    switch(v12)
    {
      case 2:
        v13 = &kTISKSpaceToShiftMetric;
        goto LABEL_8;
      case 10:
        v13 = &kTISK123ToAnyTapMetric;
        goto LABEL_8;
      case 3:
        v13 = &kTISKDeleteToShiftMetric;
LABEL_8:
        v14 = [NSNumber numberWithDouble:v9 - v11];
        [v6 addSample:v14 forKey:*v13];

        break;
    }
  }
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
  v6.receiver = self;
  v6.super_class = (Class)TISKShiftKeyEvent;
  return [(TISKEvent *)&v6 init:4 emojiSearchMode:a4 order:a5 tap:a3];
}

@end