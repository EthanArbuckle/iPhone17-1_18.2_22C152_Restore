@interface CRLWPTypesettingState
- (BOOL)oikomiSquish;
- (NSDictionary)hyphenationAttr;
- (double)endPos;
- (double)startPos;
- (unsigned)hyphenationChar;
- (void)clear;
- (void)setEndPos:(double)a3;
- (void)setHyphenationAttr:(id)a3;
- (void)setHyphenationChar:(unsigned int)a3;
- (void)setOikomiSquish:(BOOL)a3;
- (void)setStartPos:(double)a3;
@end

@implementation CRLWPTypesettingState

- (void)clear
{
  *(double *)((char *)&self->_startPos + 4) = 0.0;
  *(void *)&self->_hyphenationChar = 0;
  HIDWORD(self->_endPos) = 0;
  hyphenationAttr = self->_hyphenationAttr;
  self->_hyphenationAttr = 0;

  self->_oikomiSquish = 0;
}

- (double)startPos
{
  return self->_startPos;
}

- (void)setStartPos:(double)a3
{
  self->_startPos = a3;
}

- (double)endPos
{
  return self->_endPos;
}

- (void)setEndPos:(double)a3
{
  self->_endPos = a3;
}

- (unsigned)hyphenationChar
{
  return self->_hyphenationChar;
}

- (void)setHyphenationChar:(unsigned int)a3
{
  self->_hyphenationChar = a3;
}

- (NSDictionary)hyphenationAttr
{
  return self->_hyphenationAttr;
}

- (void)setHyphenationAttr:(id)a3
{
}

- (BOOL)oikomiSquish
{
  return self->_oikomiSquish;
}

- (void)setOikomiSquish:(BOOL)a3
{
  self->_oikomiSquish = a3;
}

- (void).cxx_destruct
{
}

@end