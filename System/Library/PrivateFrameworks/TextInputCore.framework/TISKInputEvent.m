@interface TISKInputEvent
+ (id)makeInputEvent:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordSeparator:(id)a6 accentedLanguage:(BOOL)a7;
- (BOOL)ignoreTapData;
- (BOOL)isMissingATouch;
- (TIKeyboardInput)input;
- (double)downUpTimeDelta;
- (double)touchDownErrorDistance;
- (double)touchUpErrorDistance;
- (id)init:(id)a3 type:(int)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6;
- (id)upTouchEvent;
- (void)_computeErrorDistance;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
- (void)setIgnoreTapData:(BOOL)a3;
- (void)setInput:(id)a3;
@end

@implementation TISKInputEvent

- (void).cxx_destruct
{
}

- (void)setIgnoreTapData:(BOOL)a3
{
  self->_ignoreTapData = a3;
}

- (BOOL)ignoreTapData
{
  return self->_ignoreTapData;
}

- (void)setInput:(id)a3
{
}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v23.receiver = self;
    v23.super_class = (Class)TISKInputEvent;
    [(TISKEvent *)&v23 reportInterKeyTiming:v6 previousEvent:v7];
    if ([v7 type] == 10
      || ([v7 tap], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v9 = (void *)v8,
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      [(TISKEvent *)self touchDownTimestamp];
      double v12 = v11;
      [v7 touchDownTimestamp];
      double v14 = v12 - v13;
      [(TISKEvent *)self touchDownTimestamp];
      double v16 = v15;
      [v7 touchUpTimestamp];
      v18 = [NSNumber numberWithDouble:v16 - v17];
      [v6 addSample:v18 forKey:kTISKTouchUpDownMetric];

      int v19 = [v7 type];
      if (v19 == 10)
      {
        v21 = &kTISK123ToAnyTapMetric;
      }
      else
      {
        if (!v19)
        {
          v20 = [NSNumber numberWithDouble:v14];
          [v6 addSample:v20 forKey:kTISKCharToAnyTapMetric];
        }
        v21 = &kTISKTouchDownDownMetric;
      }
      v22 = [NSNumber numberWithDouble:v14];
      [v6 addSample:v22 forKey:*v21];
    }
  }
}

- (void)reportToSession:(id)a3
{
  id v13 = a3;
  [v13 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfTappedKeysCounter];
  [v13 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
  v4 = NSNumber;
  v5 = [(TISKEvent *)self tap];
  id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "numberOfDrags"));
  [v13 addSample:v6 forKey:kTISKNumberOfDragsCounter];

  if (!self->_ignoreTapData)
  {
    id v7 = NSNumber;
    [(TISKInputEvent *)self downUpTimeDelta];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    [v13 addSample:v8 forKey:kTISKTouchDownUpMetric];

    [(TISKInputEvent *)self _computeErrorDistance];
    if (self->_canComputeErrorDistance)
    {
      v9 = NSNumber;
      [(TISKInputEvent *)self touchDownErrorDistance];
      v10 = objc_msgSend(v9, "numberWithDouble:");
      [v13 addSample:v10 forKey:kTISKDownErrorDistance];

      double v11 = NSNumber;
      [(TISKInputEvent *)self touchUpErrorDistance];
      double v12 = objc_msgSend(v11, "numberWithDouble:");
      [v13 addSample:v12 forKey:kTISKUpErrorDistance];
    }
  }
}

- (double)touchUpErrorDistance
{
  return self->_upErrorDistance;
}

- (double)touchDownErrorDistance
{
  return self->_downErrorDistance;
}

- (void)_computeErrorDistance
{
  v3 = [(TISKInputEvent *)self input];
  int v19 = [v3 string];

  if (!v19)
  {
    v4 = [(TISKInputEvent *)self input];
    char v5 = [v4 isBackspace];

    if ((v5 & 1) == 0)
    {
      self->_canComputeErrorDistance = 0;
      return;
    }
    int v19 = @"delete";
  }
  id v6 = [(TISKEvent *)self tap];
  [v6 getFrameForKey:v19];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  if (CGRectEqualToRect(v21, *MEMORY[0x1E4F1DB20]))
  {
    self->_canComputeErrorDistance = 0;
  }
  else
  {
    double v15 = [(TISKEvent *)self tap];
    objc_msgSend(v15, "downErrorDistance:", v8, v10, v12, v14);
    self->_downErrorDistance = v16;

    double v17 = [(TISKEvent *)self tap];
    objc_msgSend(v17, "upErrorDistance:", v8, v10, v12, v14);
    self->_upErrorDistance = v18;
  }
}

- (double)downUpTimeDelta
{
  v3 = [(TISKEvent *)self tap];
  v4 = [v3 lastTouch];
  [v4 timestamp];
  double v6 = v5;
  double v7 = [(TISKEvent *)self tap];
  double v8 = [v7 firstTouch];
  [v8 timestamp];
  double v10 = v6 - v9;

  return v10;
}

- (id)upTouchEvent
{
  return (id)[(TIKeyboardInput *)self->_input touchEvent];
}

- (BOOL)isMissingATouch
{
  v3 = [(TISKEvent *)self tap];
  if (v3)
  {
    v4 = [(TISKEvent *)self tap];
    char v5 = [v4 isDownUpTap];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)init:(id)a3 type:(int)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TISKInputEvent;
  double v12 = [(TISKEvent *)&v15 init:v8 emojiSearchMode:v7 order:a6];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 7, a3);
    v13[4] = (id)0xBFF0000000000000;
    v13[5] = (id)0xBFF0000000000000;
    *((unsigned char *)v13 + 48) = 1;
    *((unsigned char *)v13 + 49) = 0;
    [v13 setHasTimestamp:1];
  }

  return v13;
}

+ (id)makeInputEvent:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordSeparator:(id)a6 accentedLanguage:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  if (([v11 isFlick] & 1) != 0
    || ([v11 isGesture] & 1) != 0
    || ([v11 isSynthesizedByAcceptingCandidate] & 1) != 0)
  {
    double v13 = off_1E6E280C0;
    goto LABEL_5;
  }
  if ([v11 isPopupVariant])
  {
    double v13 = off_1E6E280E8;
    goto LABEL_5;
  }
  char v16 = [v11 isBackspace];
  double v13 = off_1E6E28098;
  if (v16) {
    goto LABEL_5;
  }
  double v17 = [v11 string];
  uint64_t v18 = [v17 length];

  double v13 = off_1E6E28128;
  if (v18 != 1) {
    goto LABEL_5;
  }
  int v19 = [v11 string];
  v20 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v21 = [v19 rangeOfCharacterFromSet:v20];

  if (v21 && v7)
  {
    v22 = [v11 string];
    UChar32 v23 = [v22 _firstChar];

    if (!KB::character_is_letter_modifier(v23))
    {
      double v13 = off_1E6E28088;
      if (v23 == 39 || v23 == 8217) {
        goto LABEL_5;
      }
      goto LABEL_19;
    }
LABEL_21:
    double v13 = off_1E6E28088;
    goto LABEL_5;
  }
  if (!v21) {
    goto LABEL_21;
  }
LABEL_19:
  v24 = [v11 string];
  if ([v24 isEqualToString:@" "])
  {

LABEL_23:
    double v13 = off_1E6E28120;
    goto LABEL_5;
  }
  v25 = [v11 string];
  char v26 = [v25 isEqualToString:v12];

  if (v26) {
    goto LABEL_23;
  }
  if ([v11 isBackspace]) {
    double v13 = off_1E6E28098;
  }
  else {
    double v13 = off_1E6E28128;
  }
LABEL_5:
  double v14 = (void *)[objc_alloc(*v13) init:v11 emojiSearchMode:v10 order:a5];

  return v14;
}

@end