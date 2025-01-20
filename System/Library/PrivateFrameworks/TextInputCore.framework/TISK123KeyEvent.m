@interface TISK123KeyEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
@end

@implementation TISK123KeyEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"123"];
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)TISK123KeyEvent;
  [(TISKEvent *)&v16 reportInterKeyTiming:v6 previousEvent:v7];
  [(TISKEvent *)self touchDownTimestamp];
  double v9 = v8;
  [v7 touchDownTimestamp];
  double v11 = v9 - v10;
  int v12 = [v7 type];
  if (v12)
  {
    if (v12 == 2)
    {
      v13 = &kTISKSpaceTo123Metric;
    }
    else
    {
      if (v12 != 3) {
        goto LABEL_9;
      }
      v13 = &kTISKDeleteTo123Metric;
    }
  }
  else
  {
    v13 = &kTISKCharTo123Metric;
  }
  v14 = [NSNumber numberWithDouble:v11];
  [v6 addSample:v14 forKey:*v13];

LABEL_9:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [NSNumber numberWithDouble:v11];
    [v6 addSample:v15 forKey:kTISKAnyTapTo123Metric];
  }
LABEL_11:
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISK123KeyEvent;
  return [(TISKEvent *)&v6 init:5 emojiSearchMode:a4 order:a5 tap:a3];
}

@end