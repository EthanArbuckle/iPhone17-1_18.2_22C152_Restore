@interface BKAudiobookBufferInfo
+ (id)infoWithAudiobookPositions:(id)a3 audiobookDurations:(id)a4 chapterPositions:(id)a5 chapterDurations:(id)a6;
- (NSArray)audiobookDurations;
- (NSArray)audiobookPositions;
- (NSArray)chapterDurations;
- (NSArray)chapterPositions;
- (void)setAudiobookDurations:(id)a3;
- (void)setAudiobookPositions:(id)a3;
- (void)setChapterDurations:(id)a3;
- (void)setChapterPositions:(id)a3;
@end

@implementation BKAudiobookBufferInfo

+ (id)infoWithAudiobookPositions:(id)a3 audiobookDurations:(id)a4 chapterPositions:(id)a5 chapterDurations:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setAudiobookPositions:v12];

  [v13 setAudiobookDurations:v11];
  [v13 setChapterPositions:v10];

  [v13 setChapterDurations:v9];

  return v13;
}

- (NSArray)audiobookPositions
{
  return self->_audiobookPositions;
}

- (void)setAudiobookPositions:(id)a3
{
}

- (NSArray)audiobookDurations
{
  return self->_audiobookDurations;
}

- (void)setAudiobookDurations:(id)a3
{
}

- (NSArray)chapterPositions
{
  return self->_chapterPositions;
}

- (void)setChapterPositions:(id)a3
{
}

- (NSArray)chapterDurations
{
  return self->_chapterDurations;
}

- (void)setChapterDurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterDurations, 0);
  objc_storeStrong((id *)&self->_chapterPositions, 0);
  objc_storeStrong((id *)&self->_audiobookDurations, 0);

  objc_storeStrong((id *)&self->_audiobookPositions, 0);
}

@end