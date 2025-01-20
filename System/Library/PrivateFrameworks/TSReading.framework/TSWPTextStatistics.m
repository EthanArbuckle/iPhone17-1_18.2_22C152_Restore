@interface TSWPTextStatistics
- (BOOL)isAccurate;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)charactersNoWhiteSpace;
- (unint64_t)paragraphCount;
- (unint64_t)wordCount;
- (void)addTextStatistics:(id)a3;
- (void)removeTextStatistics:(id)a3;
- (void)resetStatistics;
- (void)setCharactersNoWhiteSpace:(unint64_t)a3;
- (void)setIsAccurate:(BOOL)a3;
- (void)setParagraphCount:(unint64_t)a3;
- (void)setTextStatistics:(id)a3;
- (void)setWordCount:(unint64_t)a3;
@end

@implementation TSWPTextStatistics

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setWordCount:self->_wordCount];
  [v4 setCharactersNoWhiteSpace:self->_charactersNoWhiteSpace];
  [v4 setParagraphCount:self->_paragraphCount];
  [v4 setIsAccurate:self->_isAccurate];
  return v4;
}

- (void)resetStatistics
{
  [(TSWPTextStatistics *)self setWordCount:0];
  [(TSWPTextStatistics *)self setCharactersNoWhiteSpace:0];
  [(TSWPTextStatistics *)self setParagraphCount:0];

  [(TSWPTextStatistics *)self setIsAccurate:0];
}

- (void)setTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", [a3 wordCount]);
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", [a3 charactersNoWhiteSpace]);
  uint64_t v5 = [a3 paragraphCount];

  [(TSWPTextStatistics *)self setParagraphCount:v5];
}

- (void)addTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", [a3 wordCount] + -[TSWPTextStatistics wordCount](self, "wordCount"));
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", [a3 charactersNoWhiteSpace]+ -[TSWPTextStatistics charactersNoWhiteSpace](self, "charactersNoWhiteSpace"));
  unint64_t v5 = [(TSWPTextStatistics *)self paragraphCount];
  unint64_t v6 = [a3 paragraphCount] + v5;

  [(TSWPTextStatistics *)self setParagraphCount:v6];
}

- (void)removeTextStatistics:(id)a3
{
  -[TSWPTextStatistics setWordCount:](self, "setWordCount:", -[TSWPTextStatistics wordCount](self, "wordCount") - [a3 wordCount]);
  -[TSWPTextStatistics setCharactersNoWhiteSpace:](self, "setCharactersNoWhiteSpace:", -[TSWPTextStatistics charactersNoWhiteSpace](self, "charactersNoWhiteSpace")- [a3 charactersNoWhiteSpace]);
  unint64_t v5 = [(TSWPTextStatistics *)self paragraphCount];
  unint64_t v6 = v5 - [a3 paragraphCount];

  [(TSWPTextStatistics *)self setParagraphCount:v6];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class()
      && self->_wordCount == *((void *)a3 + 1)
      && self->_charactersNoWhiteSpace == *((void *)a3 + 2)
      && self->_paragraphCount == *((void *)a3 + 3)
      && self->_isAccurate == *((unsigned __int8 *)a3 + 32);
}

- (unint64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(unint64_t)a3
{
  self->_wordCount = a3;
}

- (unint64_t)charactersNoWhiteSpace
{
  return self->_charactersNoWhiteSpace;
}

- (void)setCharactersNoWhiteSpace:(unint64_t)a3
{
  self->_charactersNoWhiteSpace = a3;
}

- (unint64_t)paragraphCount
{
  return self->_paragraphCount;
}

- (void)setParagraphCount:(unint64_t)a3
{
  self->_paragraphCount = a3;
}

- (BOOL)isAccurate
{
  return self->_isAccurate;
}

- (void)setIsAccurate:(BOOL)a3
{
  self->_isAccurate = a3;
}

@end