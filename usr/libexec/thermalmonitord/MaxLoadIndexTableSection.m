@interface MaxLoadIndexTableSection
- (MaxLoadIndexTableSection)init;
- (MaxLoadIndexTableSection)initWithConstantMaxLI:(unint64_t)a3;
- (unint64_t)getMaxLI:(unint64_t)a3;
- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4;
@end

@implementation MaxLoadIndexTableSection

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  if (a4 == 999)
  {
    unint64_t maxLI = self->_maxLI;
  }
  else
  {
    unint64_t maxLI = self->_releaseMaxLI;
    if (!a3) {
      maxLI += a4;
    }
    if (maxLI >= self->_maxLI) {
      unint64_t maxLI = self->_maxLI;
    }
  }
  self->_releaseMaxLI = maxLI;
  return maxLI;
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  unint64_t constantMaxLI = self->_constantMaxLI;
  self->_unint64_t maxLI = constantMaxLI;
  return constantMaxLI;
}

- (MaxLoadIndexTableSection)initWithConstantMaxLI:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSection;
  result = [(MaxLoadIndexTableSection *)&v5 init];
  if (result)
  {
    result->_unint64_t constantMaxLI = a3;
    result->_releaseMaxLI = a3;
    result->_releaseRate = 0;
  }
  return result;
}

- (MaxLoadIndexTableSection)init
{
  return [(MaxLoadIndexTableSection *)self initWithConstantMaxLI:101];
}

@end