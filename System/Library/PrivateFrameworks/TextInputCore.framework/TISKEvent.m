@interface TISKEvent
- (BOOL)emojiSearchMode;
- (BOOL)hasTimestamp;
- (BOOL)isMissingATouch;
- (BOOL)isValidCandidate:(id)a3;
- (TISKTap)tap;
- (double)touchDownTimestamp;
- (double)touchUpTimestamp;
- (id)description;
- (id)downTouchEvent;
- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 tap:(id)a6;
- (id)upTouchEvent;
- (int)type;
- (unint64_t)order;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)setEmojiSearchMode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setTap:(id)a3;
- (void)setType:(int)a3;
@end

@implementation TISKEvent

- (void).cxx_destruct
{
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_hasTimestamp = a3;
}

- (BOOL)hasTimestamp
{
  return self->_hasTimestamp;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setTap:(id)a3
{
}

- (TISKTap)tap
{
  return self->_tap;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setEmojiSearchMode:(BOOL)a3
{
  self->_emojiSearchMode = a3;
}

- (BOOL)emojiSearchMode
{
  return self->_emojiSearchMode;
}

- (BOOL)isValidCandidate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && ([v3 candidate],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v6))
  {
    v7 = [v4 candidate];
    v8 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    BOOL v9 = [v7 rangeOfCharacterFromSet:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isMissingATouch
{
  return 0;
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v6) {
    goto LABEL_17;
  }
  int v8 = [v6 type];
  int type = self->_type;
  if (v8 == 12)
  {
    if (type != 12)
    {
      [v17 startTypingTimerWithEvent:self];
      goto LABEL_17;
    }
LABEL_6:
    if ([v7 type] != 12)
    {
      [v17 haltTypingTimerWithEvent:v7];
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (type == 12) {
    goto LABEL_6;
  }
LABEL_7:
  if (([v17 isTypingTimerHalted] & 1) == 0)
  {
    [(TISKEvent *)self touchDownTimestamp];
    double v11 = v10;
    [v7 touchUpTimestamp];
    double v13 = v11 - v12;
    if (v13 <= 5.0)
    {
      int v15 = [v7 type];
      if (v13 >= 0.0 && v15 == 8)
      {
        [v17 addToDurationForRateMetric:kTISKTapTypingSpeed forKey:-v13];
        [v17 addToDurationForRateMetric:kTISKPathTypingSpeed forKey:v13];
      }
    }
    else
    {
      v14 = [NSNumber numberWithDouble:v13];
      [v17 addSample:v14 forKey:kTISKTypingPauses];

      [v17 haltTypingTimerWithEvent:v7];
      [v17 startTypingTimerWithEvent:self];
      [v17 addSample:&unk_1F3FA7D00 forKey:kTISKEpisodeCount];
    }
  }
LABEL_17:
}

- (id)description
{
  return &stru_1F3F7A998;
}

- (double)touchUpTimestamp
{
  tap = self->_tap;
  if (!tap || ![(TISKTap *)tap isDownUpTap]) {
    return 0.0;
  }
  v4 = [(TISKTap *)self->_tap lastTouch];
  [v4 timestamp];
  double v6 = v5;

  return v6;
}

- (double)touchDownTimestamp
{
  tap = self->_tap;
  if (!tap || ![(TISKTap *)tap isDownUpTap]) {
    return 0.0;
  }
  v4 = [(TISKTap *)self->_tap firstTouch];
  [v4 timestamp];
  double v6 = v5;

  return v6;
}

- (id)downTouchEvent
{
  tap = self->_tap;
  if (tap)
  {
    if ([tap isDownUpTap])
    {
      tap = [(TISKTap *)self->_tap firstTouch];
    }
    else
    {
      tap = 0;
    }
  }

  return tap;
}

- (id)upTouchEvent
{
  tap = self->_tap;
  if (tap)
  {
    if ([tap isDownUpTap])
    {
      tap = [(TISKTap *)self->_tap lastTouch];
    }
    else
    {
      tap = 0;
    }
  }

  return tap;
}

- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 tap:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TISKEvent;
  double v12 = [(TISKEvent *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    v12->_int type = a3;
    v12->_emojiSearchMode = a4;
    v12->_order = a5;
    objc_storeStrong((id *)&v12->_tap, a6);
    v13->_hasTimestamp = v11 != 0;
  }

  return v13;
}

- (id)init:(int)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  return [(TISKEvent *)self init:*(void *)&a3 emojiSearchMode:a4 order:a5 tap:0];
}

@end