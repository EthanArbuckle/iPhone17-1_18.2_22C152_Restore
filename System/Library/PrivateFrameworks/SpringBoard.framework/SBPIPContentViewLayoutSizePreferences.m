@interface SBPIPContentViewLayoutSizePreferences
- (SBPIPContentViewLayoutSizePreferences)initWithLongSideMinimumSize:(double)a3 longSideDefaultSize:(double)a4 longSideMaximumSize:(double)a5 shortSideMinimumSize:(double)a6;
- (double)longSideDefaultSize;
- (double)longSideMaximumSize;
- (double)longSideMinimumSize;
- (double)shortSideMinimumSize;
- (void)setLongSideDefaultSize:(double)a3;
- (void)setLongSideMaximumSize:(double)a3;
- (void)setLongSideMinimumSize:(double)a3;
- (void)setShortSideMinimumSize:(double)a3;
@end

@implementation SBPIPContentViewLayoutSizePreferences

- (SBPIPContentViewLayoutSizePreferences)initWithLongSideMinimumSize:(double)a3 longSideDefaultSize:(double)a4 longSideMaximumSize:(double)a5 shortSideMinimumSize:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SBPIPContentViewLayoutSizePreferences;
  result = [(SBPIPContentViewLayoutSizePreferences *)&v11 init];
  if (result)
  {
    result->_longSideMinimumSize = a3;
    result->_longSideDefaultSize = a4;
    result->_longSideMaximumSize = a5;
    result->_shortSideMinimumSize = a6;
  }
  return result;
}

- (double)longSideMinimumSize
{
  return self->_longSideMinimumSize;
}

- (void)setLongSideMinimumSize:(double)a3
{
  self->_longSideMinimumSize = a3;
}

- (double)longSideDefaultSize
{
  return self->_longSideDefaultSize;
}

- (void)setLongSideDefaultSize:(double)a3
{
  self->_longSideDefaultSize = a3;
}

- (double)longSideMaximumSize
{
  return self->_longSideMaximumSize;
}

- (void)setLongSideMaximumSize:(double)a3
{
  self->_longSideMaximumSize = a3;
}

- (double)shortSideMinimumSize
{
  return self->_shortSideMinimumSize;
}

- (void)setShortSideMinimumSize:(double)a3
{
  self->_shortSideMinimumSize = a3;
}

@end