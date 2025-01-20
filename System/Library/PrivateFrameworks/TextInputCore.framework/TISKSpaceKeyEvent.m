@interface TISKSpaceKeyEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
@end

@implementation TISKSpaceKeyEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"spc"];
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v20.receiver = self;
    v20.super_class = (Class)TISKSpaceKeyEvent;
    [(TISKInputEvent *)&v20 reportInterKeyTiming:v6 previousEvent:v7];
    [(TISKEvent *)self touchDownTimestamp];
    double v9 = v8;
    [v7 touchDownTimestamp];
    double v11 = v10;
    int v12 = [v7 type];
    double v13 = v9 - v11;
    switch(v12)
    {
      case 0:
        v14 = [NSNumber numberWithDouble:v13];
        v15 = &kTISKCharToSpaceMetric;
        goto LABEL_7;
      case 2:
        v14 = [NSNumber numberWithDouble:v13];
        v15 = &kTISKSpaceToSpaceMetric;
        goto LABEL_7;
      case 3:
        v14 = [NSNumber numberWithDouble:v13];
        v15 = &kTISKDeleteToSpaceMetric;
        goto LABEL_7;
      case 8:
        v16 = NSNumber;
        [(TISKEvent *)self touchDownTimestamp];
        double v18 = v17;
        [v7 touchUpTimestamp];
        v14 = [v16 numberWithDouble:v18 - v19];
        v15 = &kTISKPathSpaceMetric;
LABEL_7:
        [v6 addSample:v14 forKey:*v15];

        break;
      default:
        break;
    }
  }
}

- (void)reportToSession:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TISKSpaceKeyEvent;
  id v4 = a3;
  [(TISKInputEvent *)&v11 reportToSession:v4];
  v5 = NSNumber;
  [(TISKInputEvent *)self touchDownErrorDistance];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 addSample:v6 forKey:kTISKSpaceDownErrorDistance];

  id v7 = NSNumber;
  [(TISKInputEvent *)self touchUpErrorDistance];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 addSample:v8 forKey:kTISKSpaceUpErrorDistance];

  double v9 = NSNumber;
  [(TISKInputEvent *)self downUpTimeDelta];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 addSample:v10 forKey:kTISKSpaceTouchDownUpMetric];
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKSpaceKeyEvent;
  return [(TISKInputEvent *)&v6 init:a3 type:2 emojiSearchMode:a4 order:a5];
}

@end