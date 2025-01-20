@interface SLLRNNFeatures
- (BOOL)lrnnProcessed;
- (float)lrnnScore;
- (void)setLrnnProcessed:(BOOL)a3;
- (void)setLrnnScore:(float)a3;
@end

@implementation SLLRNNFeatures

- (void)setLrnnProcessed:(BOOL)a3
{
  self->_lrnnProcessed = a3;
}

- (BOOL)lrnnProcessed
{
  return self->_lrnnProcessed;
}

- (void)setLrnnScore:(float)a3
{
  self->_lrnnScore = a3;
}

- (float)lrnnScore
{
  return self->_lrnnScore;
}

@end