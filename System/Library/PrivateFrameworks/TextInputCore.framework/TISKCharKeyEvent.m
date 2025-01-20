@interface TISKCharKeyEvent
- (BOOL)isShortWord;
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (id)privateDescription;
- (int64_t)_metricWordKeyPostion:(int64_t)a3;
- (int64_t)wordPosition;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
- (void)setIsShortWord:(BOOL)a3;
- (void)setWordPosition:(int64_t)a3;
@end

@implementation TISKCharKeyEvent

- (void)setIsShortWord:(BOOL)a3
{
  self->_isShortWord = a3;
}

- (BOOL)isShortWord
{
  return self->_isShortWord;
}

- (void)setWordPosition:(int64_t)a3
{
  self->_wordPosition = a3;
}

- (int64_t)wordPosition
{
  return self->_wordPosition;
}

- (id)privateDescription
{
  return @"ch";
}

- (id)description
{
  v3 = NSString;
  v4 = [(TISKInputEvent *)self input];
  uint64_t v5 = [v4 string];
  v6 = (void *)v5;
  if (self->_isShortWord) {
    v7 = &stru_1F3F7A998;
  }
  else {
    v7 = @":l";
  }
  v8 = [v3 stringWithFormat:@"%@:%ld%@", v5, self->_wordPosition, v7];

  return v8;
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_20;
  }
  v26.receiver = self;
  v26.super_class = (Class)TISKCharKeyEvent;
  [(TISKInputEvent *)&v26 reportInterKeyTiming:v6 previousEvent:v7];
  [(TISKEvent *)self touchDownTimestamp];
  double v9 = v8;
  [v7 touchDownTimestamp];
  double v11 = v9 - v10;
  [(TISKEvent *)self touchDownTimestamp];
  double v13 = v12;
  [v7 touchUpTimestamp];
  double v15 = v14;
  uint64_t v16 = [v7 tap];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [v7 tap];
    if ([v18 isDownUpTap])
    {
      int v19 = [v7 type];

      if (v19 == 10) {
        goto LABEL_8;
      }
      v17 = [NSNumber numberWithDouble:v11];
      [v6 addSample:v17 forKey:kTISKAnyTapToCharMetric];
    }
    else
    {
    }
  }
LABEL_8:
  int v20 = [v7 type];
  if (v20 > 2)
  {
    if (v20 == 3)
    {
      v21 = [NSNumber numberWithDouble:v11];
      uint64_t v22 = kTISKDeleteToCharMetric;
      goto LABEL_18;
    }
    if (v20 == 10)
    {
      v21 = [NSNumber numberWithDouble:v11];
      uint64_t v22 = kTISK123ToCharMetric;
      goto LABEL_18;
    }
  }
  else
  {
    if (!v20)
    {
      if (!self->_isShortWord)
      {
        int64_t wordPosition = self->_wordPosition;
        if (wordPosition < 1) {
          goto LABEL_20;
        }
        int64_t v24 = [(TISKCharKeyEvent *)self _metricWordKeyPostion:wordPosition - 1];
        v25 = [NSNumber numberWithDouble:v11];
        [v6 addSample:v25 forKey:kTISKLongWordTouchDownDownPositionalMetric withPosition:v24];

        v21 = [NSNumber numberWithDouble:v13 - v15];
        [v6 addSample:v21 forKey:kTISKLongWordTouchUpDownPositionalMetric withPosition:v24];
        goto LABEL_19;
      }
      v21 = [NSNumber numberWithDouble:v11];
      uint64_t v22 = kTISKShortWordCharToCharMetric;
LABEL_18:
      [v6 addSample:v21 forKey:v22];
LABEL_19:

      goto LABEL_20;
    }
    if (v20 == 2)
    {
      v21 = [NSNumber numberWithDouble:v11];
      uint64_t v22 = kTISKSpaceToCharMetric;
      goto LABEL_18;
    }
  }
LABEL_20:
}

- (void)reportToSession:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TISKCharKeyEvent;
  id v4 = a3;
  [(TISKInputEvent *)&v17 reportToSession:v4];
  if (self->_isShortWord)
  {
    uint64_t v5 = NSNumber;
    [(TISKInputEvent *)self downUpTimeDelta];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [v4 addSample:v6 forKey:kTISKShortWordCharTouchDownUpMetric];

    id v7 = NSNumber;
    [(TISKInputEvent *)self touchDownErrorDistance];
    double v8 = objc_msgSend(v7, "numberWithDouble:");
    [v4 addSample:v8 forKey:kTISKShortWordCharDownErrorDistance];

    double v9 = NSNumber;
    [(TISKInputEvent *)self touchUpErrorDistance];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
    [v4 addSample:v10 forKey:kTISKShortWordCharUpErrorDistance];
  }
  else
  {
    int64_t v11 = -[TISKCharKeyEvent _metricWordKeyPostion:](self, "_metricWordKeyPostion:", self->_wordPosition, v17.receiver, v17.super_class);
    double v12 = NSNumber;
    [(TISKInputEvent *)self downUpTimeDelta];
    double v13 = objc_msgSend(v12, "numberWithDouble:");
    [v4 addSample:v13 forKey:kTISKLongWordTouchDownUpPositionalMetric withPosition:v11];

    double v14 = NSNumber;
    [(TISKInputEvent *)self touchDownErrorDistance];
    double v15 = objc_msgSend(v14, "numberWithDouble:");
    [v4 addSample:v15 forKey:kTISKLongWordPositionalDownErrorDistance withPosition:v11];

    uint64_t v16 = NSNumber;
    [(TISKInputEvent *)self touchUpErrorDistance];
    double v10 = objc_msgSend(v16, "numberWithDouble:");
    [v4 addSample:v10 forKey:kTISKLongWordPositionalUpErrorDistance withPosition:v11];
  }
}

- (int64_t)_metricWordKeyPostion:(int64_t)a3
{
  if ((unint64_t)a3 >= 5) {
    return 5;
  }
  else {
    return a3;
  }
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKCharKeyEvent;
  id result = [(TISKInputEvent *)&v6 init:a3 type:0 emojiSearchMode:a4 order:a5];
  if (result)
  {
    *((void *)result + 9) = -1;
    *((unsigned char *)result + 64) = 1;
  }
  return result;
}

@end