@interface MSVLyricsLine
- (BOOL)containsTimeOffset:(double)a3 withErrorMargin:(double)a4;
- (BOOL)hasBackgroundVocal;
- (BOOL)isInstrumentalBreak;
- (MSVLyricsLine)init;
- (MSVLyricsLine)nextLine;
- (MSVLyricsSection)parentSection;
- (MSVLyricsWord)backgroundVocals;
- (NSArray)words;
- (NSAttributedString)primaryVocalText;
- (NSString)translationKey;
- (id)agent;
- (id)description;
- (int64_t)lineIndex;
- (int64_t)originalLineIndex;
- (void)setBackgroundVocals:(id)a3;
- (void)setHasBackgroundVocal:(BOOL)a3;
- (void)setInstrumentalBreak:(BOOL)a3;
- (void)setLineIndex:(int64_t)a3;
- (void)setNextLine:(id)a3;
- (void)setOriginalLineIndex:(int64_t)a3;
- (void)setParentSection:(id)a3;
- (void)setPrimaryVocalText:(id)a3;
- (void)setTranslationKey:(id)a3;
- (void)setWords:(id)a3;
@end

@implementation MSVLyricsLine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryVocalText, 0);
  objc_storeStrong((id *)&self->_backgroundVocals, 0);
  objc_storeStrong((id *)&self->_translationKey, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_nextLine, 0);
  objc_destroyWeak((id *)&self->_parentSection);
}

- (void)setPrimaryVocalText:(id)a3
{
}

- (void)setBackgroundVocals:(id)a3
{
}

- (MSVLyricsWord)backgroundVocals
{
  return self->_backgroundVocals;
}

- (void)setHasBackgroundVocal:(BOOL)a3
{
  self->_hasBackgroundVocal = a3;
}

- (BOOL)hasBackgroundVocal
{
  return self->_hasBackgroundVocal;
}

- (void)setTranslationKey:(id)a3
{
}

- (NSString)translationKey
{
  return self->_translationKey;
}

- (void)setWords:(id)a3
{
}

- (NSArray)words
{
  return self->_words;
}

- (void)setNextLine:(id)a3
{
}

- (MSVLyricsLine)nextLine
{
  return self->_nextLine;
}

- (void)setParentSection:(id)a3
{
}

- (MSVLyricsSection)parentSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSection);
  return (MSVLyricsSection *)WeakRetained;
}

- (void)setOriginalLineIndex:(int64_t)a3
{
  self->_originalLineIndex = a3;
}

- (int64_t)originalLineIndex
{
  return self->_originalLineIndex;
}

- (void)setLineIndex:(int64_t)a3
{
  self->_lineIndex = a3;
}

- (int64_t)lineIndex
{
  return self->_lineIndex;
}

- (void)setInstrumentalBreak:(BOOL)a3
{
  self->_instrumentalBreak = a3;
}

- (BOOL)isInstrumentalBreak
{
  return self->_instrumentalBreak;
}

- (NSAttributedString)primaryVocalText
{
  if ([(MSVLyricsLine *)self hasBackgroundVocal])
  {
    v3 = self->_primaryVocalText;
  }
  else
  {
    v3 = [(MSVLyricsTextElement *)self lyricsText];
  }
  return v3;
}

- (id)agent
{
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsLine;
  v3 = [(MSVLyricsElement *)&v8 agent];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(MSVLyricsLine *)self parentSection];
    id v5 = [v6 agent];
  }
  return v5;
}

- (BOOL)containsTimeOffset:(double)a3 withErrorMargin:(double)a4
{
  [(MSVLyricsElement *)self startTime];
  if (v7 - a4 > a3) {
    return 0;
  }
  [(MSVLyricsElement *)self endTime];
  return v9 + a4 >= a3;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(MSVLyricsLine *)self lineIndex];
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsLine;
  id v5 = [(MSVLyricsTextElement *)&v8 description];
  v6 = [v3 stringWithFormat:@"Line index: %ld, lyrics text element: %@", v4, v5];

  return v6;
}

- (MSVLyricsLine)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSVLyricsLine;
  v2 = [(MSVLyricsTextElement *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MSVLyricsElement *)v2 setType:1];
    uint64_t v4 = objc_opt_new();
    primaryVocalText = v3->_primaryVocalText;
    v3->_primaryVocalText = (NSAttributedString *)v4;
  }
  return v3;
}

@end