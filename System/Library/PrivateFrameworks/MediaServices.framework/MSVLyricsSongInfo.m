@interface MSVLyricsSongInfo
+ (id)_descriptionForLyricsInfoType:(int64_t)a3;
+ (id)_elementsInArray:(id)a3 atTimeOffset:(double)a4 errorMargin:(double)a5;
- (MSVLyricsAudioAttributes)audioAttributes;
- (MSVLyricsSongInfo)init;
- (NSArray)agents;
- (NSArray)availableTranslations;
- (NSArray)lyricsLines;
- (NSArray)lyricsSections;
- (NSArray)songwriters;
- (NSDictionary)translationsMap;
- (NSString)language;
- (NSString)lyricGenId;
- (double)leadingSilence;
- (double)songDuration;
- (id)_sortLyricsLinesByStartTime:(id)a3;
- (id)description;
- (id)lyricsLineStartingBeforeTimeOffset:(double)a3;
- (id)lyricsLinesAtTimeOffset:(double)a3 errorMargin:(double)a4;
- (id)lyricsWordsAtTimeOffset:(double)a3 errorMargin:(double)a4;
- (id)translatedTextForLyricsLine:(id)a3 language:(id)a4;
- (int64_t)type;
- (void)setAgents:(id)a3;
- (void)setAudioAttributes:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLeadingSilence:(double)a3;
- (void)setLyricGenId:(id)a3;
- (void)setLyricsLines:(id)a3;
- (void)setLyricsLinesSortedByStartTime:(id)a3;
- (void)setLyricsSections:(id)a3;
- (void)setSongDuration:(double)a3;
- (void)setSongwriters:(id)a3;
- (void)setTranslationsMap:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MSVLyricsSongInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationsMap, 0);
  objc_storeStrong((id *)&self->_lyricsSections, 0);
  objc_storeStrong((id *)&self->_audioAttributes, 0);
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_lyricsLines, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyricGenId, 0);
  objc_storeStrong((id *)&self->_songwriters, 0);
}

- (void)setTranslationsMap:(id)a3
{
}

- (NSDictionary)translationsMap
{
  return self->_translationsMap;
}

- (void)setLyricsSections:(id)a3
{
}

- (NSArray)lyricsSections
{
  return self->_lyricsSections;
}

- (void)setAudioAttributes:(id)a3
{
}

- (MSVLyricsAudioAttributes)audioAttributes
{
  return self->_audioAttributes;
}

- (void)setAgents:(id)a3
{
}

- (NSArray)agents
{
  return self->_agents;
}

- (NSArray)lyricsLines
{
  return self->_lyricsLines;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLyricGenId:(id)a3
{
}

- (NSString)lyricGenId
{
  return self->_lyricGenId;
}

- (void)setSongwriters:(id)a3
{
}

- (NSArray)songwriters
{
  return self->_songwriters;
}

- (void)setLeadingSilence:(double)a3
{
  self->_leadingSilence = a3;
}

- (double)leadingSilence
{
  return self->_leadingSilence;
}

- (void)setSongDuration:(double)a3
{
  self->_songDuration = a3;
}

- (double)songDuration
{
  return self->_songDuration;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_sortLyricsLinesByStartTime:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_938];
}

uint64_t __49__MSVLyricsSongInfo__sortLyricsLinesByStartTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 startTime];
  double v7 = v6;
  [v5 startTime];
  if (v7 >= v8)
  {
    [v4 startTime];
    double v11 = v10;
    [v5 startTime];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)setLyricsLines:(id)a3
{
  id v4 = [(MSVLyricsSongInfo *)self _sortLyricsLinesByStartTime:a3];
  lyricsLines = self->_lyricsLines;
  self->_lyricsLines = v4;

  if ([(NSArray *)self->_lyricsLines count])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = v6;
      double v8 = [(NSArray *)self->_lyricsLines objectAtIndexedSubscript:v6];
      [v8 setLineIndex:v6++];
      if ([(NSArray *)self->_lyricsLines count] - 1 <= v7)
      {
        [v8 setNextLine:0];
      }
      else
      {
        uint64_t v9 = [(NSArray *)self->_lyricsLines objectAtIndexedSubscript:v6];
        [v8 setNextLine:v9];
      }
    }
    while ([(NSArray *)self->_lyricsLines count] > v6);
  }
}

- (void)setLyricsLinesSortedByStartTime:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = +[MSVLyricsSongInfo _descriptionForLyricsInfoType:[(MSVLyricsSongInfo *)self type]];
  [(MSVLyricsSongInfo *)self songDuration];
  uint64_t v6 = v5;
  unint64_t v7 = [(MSVLyricsSongInfo *)self lyricsSections];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [(MSVLyricsSongInfo *)self lyricsLines];
  uint64_t v10 = [v9 count];
  double v11 = [(MSVLyricsSongInfo *)self songwriters];
  double v12 = [(MSVLyricsSongInfo *)self availableTranslations];
  v13 = [v3 stringWithFormat:@"Type: %@, duration: %g, %ld sections, %ld lines, songwriters: %@, translations: %@", v4, v6, v8, v10, v11, v12];

  return v13;
}

- (id)translatedTextForLyricsLine:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSVLyricsSongInfo *)self translationsMap];
  if (![v8 count] || !objc_msgSend(v7, "length"))
  {
    v14 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [v6 translationKey];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v8 = [(MSVLyricsSongInfo *)self translationsMap];
    double v11 = [v8 objectForKeyedSubscript:v7];
    double v12 = [v6 translationKey];
    v13 = [v11 objectForKeyedSubscript:v12];
    v14 = [v13 lyricsText];

LABEL_6:
    goto LABEL_7;
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (NSArray)availableTranslations
{
  v2 = [(MSVLyricsSongInfo *)self translationsMap];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (id)lyricsLineStartingBeforeTimeOffset:(double)a3
{
  uint64_t v5 = [(MSVLyricsSongInfo *)self lyricsLines];
  if ([(MSVLyricsSongInfo *)self type])
  {
    id v6 = [(MSVLyricsSongInfo *)self lyricsLines];
    id v7 = [v6 firstObject];
    [v7 startTime];
    double v9 = v8;

    if (v9 <= a3)
    {
      uint64_t v10 = [v5 count] - 1;
      if (v10 >= 0)
      {
        int64_t v11 = 0;
        do
        {
          uint64_t v12 = v10 - v11;
          if (v10 < v11) {
            ++v12;
          }
          unint64_t v13 = v11 + (v12 >> 1);
          v14 = [v5 objectAtIndexedSubscript:v13];
          [v14 startTime];
          double v16 = v15;
          if (v13 >= [v5 count] - 1)
          {
            double v19 = 1.79769313e308;
          }
          else
          {
            v17 = [v5 objectAtIndexedSubscript:v13 + 1];
            [v17 startTime];
            double v19 = v18;
          }
          if (v16 <= a3)
          {
            if (v19 >= a3) {
              goto LABEL_16;
            }
            int64_t v11 = v13 + 1;
          }
          else
          {
            uint64_t v10 = v13 - 1;
          }
        }
        while (v11 <= v10);
      }
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)lyricsWordsAtTimeOffset:(double)a3 errorMargin:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = [(MSVLyricsSongInfo *)self lyricsLines];
  id v7 = +[MSVLyricsSongInfo _elementsInArray:v6 atTimeOffset:a3 errorMargin:a4];

  double v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "words", (void)v17);
        double v15 = +[MSVLyricsSongInfo _elementsInArray:v14 atTimeOffset:a3 errorMargin:a4];
        [v8 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)lyricsLinesAtTimeOffset:(double)a3 errorMargin:(double)a4
{
  id v6 = [(MSVLyricsSongInfo *)self lyricsLines];
  id v7 = +[MSVLyricsSongInfo _elementsInArray:v6 atTimeOffset:a3 errorMargin:a4];

  return v7;
}

- (MSVLyricsSongInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSVLyricsSongInfo;
  v2 = [(MSVLyricsSongInfo *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    songwriters = v2->_songwriters;
    uint64_t v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_songwriters = (NSArray *)MEMORY[0x1E4F1CBF0];

    lyricsLines = v3->_lyricsLines;
    v3->_lyricsLines = v5;

    lyricsSections = v3->_lyricsSections;
    v3->_lyricsSections = v5;

    translationsMap = v3->_translationsMap;
    v3->_translationsMap = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

+ (id)_descriptionForLyricsInfoType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5AD9868[a3];
  }
}

+ (id)_elementsInArray:(id)a3 atTimeOffset:(double)a4 errorMargin:(double)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = a4 - a5;
    double v13 = a4 + a5;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v9);
        }
        double v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "startTime", (void)v21);
        if (v13 >= v17 && ([v16 endTime], v12 <= v18))
        {
          [v8 addObject:v16];
        }
        else
        {
          [v16 startTime];
          if (v13 < v19) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
LABEL_13:

  return v8;
}

@end