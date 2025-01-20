@interface SACallTreeNode
- (SACallTreeNode)initWithStartSampleIndex:(unint64_t)a3 sampleCount:(unint64_t)a4;
- (unint64_t)sampleCount;
- (unint64_t)startSampleIndex;
- (void)setSampleCount:(unint64_t)a3;
- (void)setStartSampleIndex:(unint64_t)a3;
@end

@implementation SACallTreeNode

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (SACallTreeNode)initWithStartSampleIndex:(unint64_t)a3 sampleCount:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SACallTreeNode;
  result = [(SACallTreeNode *)&v7 init];
  if (result)
  {
    result->_sampleCount = a4;
    result->_startSampleIndex = a3;
  }
  return result;
}

- (unint64_t)startSampleIndex
{
  return self->_startSampleIndex;
}

- (void)setStartSampleIndex:(unint64_t)a3
{
  self->_startSampleIndex = a3;
}

@end