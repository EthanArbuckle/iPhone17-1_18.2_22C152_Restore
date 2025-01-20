@interface TISKEmojiInputEvent
- (NSString)emojiBucketCategory;
- (id)description;
- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 emojiBucketCategory:(id)a6;
- (void)reportToSession:(id)a3;
- (void)setEmojiBucketCategory:(id)a3;
@end

@implementation TISKEmojiInputEvent

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

- (id)description
{
  return @"em";
}

- (void)reportToSession:(id)a3
{
  id v20 = a3;
  [v20 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfEmojiCounter];
  [v20 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfTappedKeysCounter];
  [v20 addToCounterForRateMetric:1 forKey:kTISKTapTypingSpeed];
  v4 = [(TISKEmojiInputEvent *)self emojiBucketCategory];

  v5 = v20;
  if (v4)
  {
    v6 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v7 = [v6 isEqualToString:@"PositiveEmoji"];

    if (v7) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalPositiveEmoji];
    }
    v8 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v9 = [v8 isEqualToString:@"SadEmoji"];

    if (v9) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalSadEmoji];
    }
    v10 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v11 = [v10 isEqualToString:@"AnxietyEmoji"];

    if (v11) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalAnxietyEmoji];
    }
    v12 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v13 = [v12 isEqualToString:@"AngerEmoji"];

    if (v13) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalAngerEmoji];
    }
    v14 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v15 = [v14 isEqualToString:@"LowEnergyEmoji"];

    if (v15) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalLowEnergyEmoji];
    }
    v16 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v17 = [v16 isEqualToString:@"FeelEmoji"];

    if (v17) {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalFeelEmoji];
    }
    v18 = [(TISKEmojiInputEvent *)self emojiBucketCategory];
    int v19 = [v18 isEqualToString:@"ConfusedEmoji"];

    v5 = v20;
    if (v19)
    {
      [v20 addSample:&unk_1F3FA7D00 forKey:kTISKtotalConfusedEmoji];
      v5 = v20;
    }
  }
}

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 emojiBucketCategory:(id)a6
{
  BOOL v8 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TISKEmojiInputEvent;
  v12 = [(TISKTimestampEvent *)&v15 init:17 timestamp:v8 emojiSearchMode:a5 order:a3];
  int v13 = v12;
  if (v12) {
    objc_storeStrong(v12 + 5, a6);
  }

  return v13;
}

@end