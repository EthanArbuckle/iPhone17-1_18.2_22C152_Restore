@interface TISKPredictionBarEvent
- (BOOL)emojiPrediction;
- (NSString)emojiBucketCategory;
- (id)description;
- (id)init:(double)a3 emojiPrediction:(BOOL)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6 emojiBucketCategory:(id)a7;
- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4;
- (void)reportToSession:(id)a3;
- (void)setEmojiBucketCategory:(id)a3;
- (void)setEmojiPrediction:(BOOL)a3;
@end

@implementation TISKPredictionBarEvent

- (void).cxx_destruct
{
}

- (void)setEmojiBucketCategory:(id)a3
{
}

- (NSString)emojiBucketCategory
{
  return self->_emojiBucketCategory;
}

- (void)setEmojiPrediction:(BOOL)a3
{
  self->_emojiPrediction = a3;
}

- (BOOL)emojiPrediction
{
  return self->_emojiPrediction;
}

- (id)description
{
  if (self->_emojiPrediction) {
    return @"ep";
  }
  else {
    return @"pb";
  }
}

- (void)reportInterKeyTiming:(id)a3 previousEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)TISKPredictionBarEvent;
    [(TISKEvent *)&v15 reportInterKeyTiming:v6 previousEvent:v7];
    [(TISKTimestampEvent *)self touchDownTimestamp];
    double v9 = v8;
    [v7 touchDownTimestamp];
    double v11 = v10;
    int v12 = [v7 type];
    if (!v12)
    {
      v13 = &kTISKCharToPredictionMetric;
      goto LABEL_6;
    }
    if (v12 == 2)
    {
      v13 = &kTISKSpaceToPredictionMetric;
LABEL_6:
      v14 = [NSNumber numberWithDouble:v9 - v11];
      [v6 addSample:v14 forKey:*v13];
    }
  }
}

- (void)reportToSession:(id)a3
{
  id v19 = a3;
  [v19 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfTappedKeysCounter];
  [v19 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
  if (self->_emojiPrediction)
  {
    [v19 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfEmojiCounter];
    v4 = [(TISKPredictionBarEvent *)self emojiBucketCategory];

    if (v4)
    {
      v5 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v6 = [v5 isEqualToString:@"PositiveEmoji"];

      if (v6) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalPositiveEmoji];
      }
      id v7 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v8 = [v7 isEqualToString:@"SadEmoji"];

      if (v8) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalSadEmoji];
      }
      double v9 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v10 = [v9 isEqualToString:@"AnxietyEmoji"];

      if (v10) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalAnxietyEmoji];
      }
      double v11 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v12 = [v11 isEqualToString:@"AngerEmoji"];

      if (v12) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalAngerEmoji];
      }
      v13 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v14 = [v13 isEqualToString:@"LowEnergyEmoji"];

      if (v14) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalLowEnergyEmoji];
      }
      objc_super v15 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v16 = [v15 isEqualToString:@"FeelEmoji"];

      if (v16) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalFeelEmoji];
      }
      v17 = [(TISKPredictionBarEvent *)self emojiBucketCategory];
      int v18 = [v17 isEqualToString:@"ConfusedEmoji"];

      if (v18) {
        [v19 addSample:&unk_1F3FA7D00 forKey:kTISKtotalConfusedEmoji];
      }
    }
  }
}

- (id)init:(double)a3 emojiPrediction:(BOOL)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6 emojiBucketCategory:(id)a7
{
  BOOL v9 = a5;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)TISKPredictionBarEvent;
  int v14 = [(TISKTimestampEvent *)&v17 init:9 timestamp:v9 emojiSearchMode:a6 order:a3];
  objc_super v15 = v14;
  if (v14)
  {
    *((unsigned char *)v14 + 40) = a4;
    objc_storeStrong(v14 + 6, a7);
  }

  return v15;
}

@end