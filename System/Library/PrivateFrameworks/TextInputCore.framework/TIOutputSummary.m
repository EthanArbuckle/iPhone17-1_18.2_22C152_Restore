@interface TIOutputSummary
- (int)char1WordsOutput;
- (int)char2WordsOutput;
- (int)char3WordsOutput;
- (int)char4WordsOutput;
- (int)char5WordsOutput;
- (int)char6WordsOutput;
- (int)char7WordsOutput;
- (int)char8WordsOutput;
- (int)char9PlusWordsOutput;
- (int)charactersOutput;
- (int)emojisOutput;
- (int)wordsOutput;
- (void)setChar1WordsOutput:(int)a3;
- (void)setChar2WordsOutput:(int)a3;
- (void)setChar3WordsOutput:(int)a3;
- (void)setChar4WordsOutput:(int)a3;
- (void)setChar5WordsOutput:(int)a3;
- (void)setChar6WordsOutput:(int)a3;
- (void)setChar7WordsOutput:(int)a3;
- (void)setChar8WordsOutput:(int)a3;
- (void)setChar9PlusWordsOutput:(int)a3;
- (void)setCharactersOutput:(int)a3;
- (void)setEmojisOutput:(int)a3;
- (void)setWordsOutput:(int)a3;
@end

@implementation TIOutputSummary

- (void)setChar9PlusWordsOutput:(int)a3
{
  self->_char9PlusWordsOutput = a3;
}

- (int)char9PlusWordsOutput
{
  return self->_char9PlusWordsOutput;
}

- (void)setChar8WordsOutput:(int)a3
{
  self->_char8WordsOutput = a3;
}

- (int)char8WordsOutput
{
  return self->_char8WordsOutput;
}

- (void)setChar7WordsOutput:(int)a3
{
  self->_char7WordsOutput = a3;
}

- (int)char7WordsOutput
{
  return self->_char7WordsOutput;
}

- (void)setChar6WordsOutput:(int)a3
{
  self->_char6WordsOutput = a3;
}

- (int)char6WordsOutput
{
  return self->_char6WordsOutput;
}

- (void)setChar5WordsOutput:(int)a3
{
  self->_char5WordsOutput = a3;
}

- (int)char5WordsOutput
{
  return self->_char5WordsOutput;
}

- (void)setChar4WordsOutput:(int)a3
{
  self->_char4WordsOutput = a3;
}

- (int)char4WordsOutput
{
  return self->_char4WordsOutput;
}

- (void)setChar3WordsOutput:(int)a3
{
  self->_char3WordsOutput = a3;
}

- (int)char3WordsOutput
{
  return self->_char3WordsOutput;
}

- (void)setChar2WordsOutput:(int)a3
{
  self->_char2WordsOutput = a3;
}

- (int)char2WordsOutput
{
  return self->_char2WordsOutput;
}

- (void)setChar1WordsOutput:(int)a3
{
  self->_char1WordsOutput = a3;
}

- (int)char1WordsOutput
{
  return self->_char1WordsOutput;
}

- (void)setCharactersOutput:(int)a3
{
  self->_charactersOutput = a3;
}

- (int)charactersOutput
{
  return self->_charactersOutput;
}

- (void)setWordsOutput:(int)a3
{
  self->_wordsOutput = a3;
}

- (int)wordsOutput
{
  return self->_wordsOutput;
}

- (void)setEmojisOutput:(int)a3
{
  self->_emojisOutput = a3;
}

- (int)emojisOutput
{
  return self->_emojisOutput;
}

@end