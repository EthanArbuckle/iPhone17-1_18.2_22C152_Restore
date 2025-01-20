@interface TISKLayoutSwitchEvent
- (TIKeyboardLayout)layout;
- (double)touchDownTimestamp;
- (double)touchUpTimestamp;
- (id)description;
- (id)init:(double)a3 layout:(id)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6;
- (void)reportToSession:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation TISKLayoutSwitchEvent

- (void).cxx_destruct
{
}

- (void)setLayout:(id)a3
{
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ls"];
}

- (void)reportToSession:(id)a3
{
  uint64_t v3 = kTISKNumberOfTappedKeysCounter;
  id v4 = a3;
  [v4 addSample:&unk_1F3FA7D00 forKey:v3];
  [v4 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
}

- (double)touchUpTimestamp
{
  uint64_t v3 = [(TISKEvent *)self tap];

  if (v3)
  {
    id v4 = [(TISKEvent *)self tap];
    v5 = [v4 lastTouch];
    [v5 timestamp];
    double v7 = v6;

    return v7;
  }
  else
  {
    [(TISKTimestampEvent *)self timestamp];
  }
  return result;
}

- (double)touchDownTimestamp
{
  uint64_t v3 = [(TISKEvent *)self tap];

  if (v3)
  {
    id v4 = [(TISKEvent *)self tap];
    v5 = [v4 firstTouch];
    [v5 timestamp];
    double v7 = v6;

    return v7;
  }
  else
  {
    [(TISKTimestampEvent *)self timestamp];
  }
  return result;
}

- (id)init:(double)a3 layout:(id)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  BOOL v7 = a5;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISKLayoutSwitchEvent;
  v12 = [(TISKTimestampEvent *)&v15 init:10 timestamp:v7 emojiSearchMode:a6 order:a3];
  v13 = v12;
  if (v12) {
    objc_storeStrong(v12 + 5, a4);
  }

  return v13;
}

@end