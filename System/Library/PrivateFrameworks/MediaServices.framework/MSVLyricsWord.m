@interface MSVLyricsWord
- (MSVLyricsLine)parentLine;
- (MSVLyricsWord)init;
- (MSVLyricsWord)nextWord;
- (MSVLyricsWord)parentWord;
- (NSArray)subwords;
- (_NSRange)characterRange;
- (id)agent;
- (int64_t)wordIndex;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setNextWord:(id)a3;
- (void)setParentLine:(id)a3;
- (void)setParentWord:(id)a3;
- (void)setSubwords:(id)a3;
- (void)setWordIndex:(int64_t)a3;
@end

@implementation MSVLyricsWord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subwords, 0);
  objc_destroyWeak((id *)&self->_parentWord);
  objc_storeStrong((id *)&self->_nextWord, 0);
  objc_destroyWeak((id *)&self->_parentLine);
}

- (void)setWordIndex:(int64_t)a3
{
  self->_wordIndex = a3;
}

- (int64_t)wordIndex
{
  return self->_wordIndex;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (_NSRange)characterRange
{
  p_characterRange = &self->_characterRange;
  NSUInteger location = self->_characterRange.location;
  NSUInteger length = p_characterRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSubwords:(id)a3
{
}

- (NSArray)subwords
{
  return self->_subwords;
}

- (void)setParentWord:(id)a3
{
}

- (MSVLyricsWord)parentWord
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentWord);
  return (MSVLyricsWord *)WeakRetained;
}

- (void)setNextWord:(id)a3
{
}

- (MSVLyricsWord)nextWord
{
  return self->_nextWord;
}

- (void)setParentLine:(id)a3
{
}

- (MSVLyricsLine)parentLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLine);
  return (MSVLyricsLine *)WeakRetained;
}

- (id)agent
{
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsWord;
  v3 = [(MSVLyricsElement *)&v8 agent];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(MSVLyricsWord *)self parentLine];
    id v5 = [v6 agent];
  }
  return v5;
}

- (MSVLyricsWord)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsWord;
  v2 = [(MSVLyricsTextElement *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSVLyricsElement *)v2 setType:2];
  }
  return v3;
}

@end