@interface TISKPathEvent
- (BOOL)isMissingATouch;
- (double)countPathPauses:(id)a3;
- (id)description;
- (id)init:(id)a3 candidate:(id)a4 allTouches:(id)a5 emojiSearchMode:(BOOL)a6 order:(int64_t)a7;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
@end

@implementation TISKPathEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTouches, 0);
  objc_storeStrong((id *)&self->_pathTouchUp, 0);
  objc_storeStrong((id *)&self->_candidateString, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"path"];
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v19.receiver = self;
    v19.super_class = (Class)TISKPathEvent;
    [(TISKEvent *)&v19 reportInterKeyTiming:v6 previousEvent:v7];
    [(TISKEvent *)self touchDownTimestamp];
    double v9 = v8;
    [v7 touchDownTimestamp];
    double v11 = v9 - v10;
    int v12 = [v7 type];
    switch(v12)
    {
      case 2:
        v17 = [NSNumber numberWithDouble:v11];
        v18 = &kTISKSpaceToPathMetric;
        goto LABEL_8;
      case 3:
        v17 = [NSNumber numberWithDouble:v11];
        v18 = &kTISKDeleteToPathMetric;
        goto LABEL_8;
      case 8:
        v13 = NSNumber;
        [(TISKEvent *)self touchDownTimestamp];
        double v15 = v14;
        [v7 touchUpTimestamp];
        v17 = [v13 numberWithDouble:v15 - v16];
        v18 = &kTISKPathToPathMetric;
LABEL_8:
        [v6 addSample:v17 forKey:*v18];

        break;
    }
  }
}

- (void)reportToSession:(id)a3
{
  id v17 = a3;
  if ([(TISKEvent *)self isValidCandidate:self->_candidate])
  {
    [v17 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfWordsCounter];
    [v17 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfPaths];
    [(TISKEvent *)self touchUpTimestamp];
    double v5 = v4;
    [(TISKEvent *)self touchDownTimestamp];
    double v7 = v5 - v6;
    double v8 = [NSNumber numberWithDouble:v7];
    [v17 addSample:v8 forKey:kTISKTotalPathTime];

    if (v7 > 0.0)
    {
      NSUInteger v9 = [(NSString *)self->_candidateString length];
      [v17 addToCounterForRateMetric:v9 forKey:kTISKPathTypingSpeed];
      [v17 addToDurationForRateMetric:kTISKPathTypingSpeed forKey:v7];
      [v17 addToDurationForRateMetric:kTISKTapTypingSpeed forKey:-v7];
    }
    if (v7 > 2.0)
    {
      [(TISKPathEvent *)self countPathPauses:self->_allTouches];
      if (v10 > 0.0)
      {
        double v11 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v17 addSample:v11 forKey:kTISKMidPathPause];
      }
    }
    int v12 = NSNumber;
    v13 = [(TISKEvent *)self tap];
    [v13 totalTapDistance];
    double v14 = objc_msgSend(v12, "numberWithDouble:");
    [v17 addSample:v14 forKey:kTISKTotalPathLength];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(TIKeyboardCandidate *)self->_candidate excessPathRatio];
      if (v15 > 0.0)
      {
        double v16 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v17 addSample:v16 forKey:kTISKPathErrorDistanceMetric];
      }
    }
  }
}

- (double)countPathPauses:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 4)
  {
    unint64_t v5 = [v3 count] - 3;
    double v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    if (v5)
    {
      unint64_t v7 = 1;
      do
      {
        double v8 = NSNumber;
        NSUInteger v9 = [v3 objectAtIndexedSubscript:v7];
        double v10 = [v3 objectAtIndexedSubscript:++v7];
        id v11 = v9;
        [v10 location];
        double v13 = v12;
        [v11 location];
        *(float *)&double v13 = v13 - v14;
        [v10 location];
        double v16 = v15;
        [v11 location];
        double v18 = v17;

        float v19 = v16 - v18;
        *(float *)&double v20 = hypotf(*(float *)&v13, v19);
        v21 = [v8 numberWithFloat:v20];
        [v6 addObject:v21];
      }
      while (v7 <= v5);
    }
    double v4 = (void *)[v6 copy];
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  id v22 = v3;
  if ((unint64_t)[v22 count] >= 4)
  {
    unint64_t v24 = [v22 count] - 3;
    v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
    if (v24)
    {
      unint64_t v26 = 1;
      do
      {
        v27 = NSNumber;
        v28 = [v22 objectAtIndexedSubscript:v26];
        v29 = [v22 objectAtIndexedSubscript:++v26];
        id v30 = v28;
        [v29 timestamp];
        double v32 = v31;
        [v30 timestamp];
        double v34 = v33;

        v35 = [v27 numberWithDouble:v32 - v34];
        [v25 addObject:v35];
      }
      while (v26 <= v24);
    }
    v23 = (void *)[v25 copy];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  double v36 = 0.0;
  if ([v4 count] != 1)
  {
    unint64_t v37 = 0;
    double v38 = 0.0;
    double v39 = 0.0;
    do
    {
      v40 = [v4 objectAtIndexedSubscript:v37];
      [v40 doubleValue];
      double v39 = v39 + v41;

      v42 = [v23 objectAtIndexedSubscript:v37];
      [v42 doubleValue];
      double v38 = v38 + v43;

      if (v38 > 2.0 && v39 > 40.0) {
        double v36 = v36 + 1.0;
      }
      if (v39 > 40.0)
      {
        double v39 = 0.0;
        double v38 = 0.0;
      }
      ++v37;
    }
    while ([v4 count] - 1 > v37);
    BOOL v45 = v39 < 40.0;
    if (v38 <= 2.0) {
      BOOL v45 = 0;
    }
    if (v45) {
      double v36 = v36 + 1.0;
    }
  }

  return v36;
}

- (id)init:(id)a3 candidate:(id)a4 allTouches:(id)a5 emojiSearchMode:(BOOL)a6 order:(int64_t)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TISKPathEvent;
  double v16 = [(TISKEvent *)&v21 init:8 emojiSearchMode:v8 order:a7];
  double v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 6, a3);
    objc_storeStrong(v17 + 4, a4);
    uint64_t v18 = [v14 candidate];
    id v19 = v17[5];
    v17[5] = (id)v18;

    objc_storeStrong(v17 + 7, a5);
    [v17 setHasTimestamp:1];
  }

  return v17;
}

- (BOOL)isMissingATouch
{
  id v3 = [(TISKEvent *)self tap];
  if (v3)
  {
    double v4 = [(TISKEvent *)self tap];
    char v5 = [v4 isDownUpTap];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

@end