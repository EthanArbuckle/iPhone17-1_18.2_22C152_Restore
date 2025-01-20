@interface _TUIPinningEntry
- (CGPoint)currentOffset;
- (CGPoint)defaultPosition;
- (CGPoint)sectionOffset;
- (TUIPinningLiveTransform)pinningLiveTransform;
- (void)setCurrentOffset:(CGPoint)a3;
- (void)setDefaultPosition:(CGPoint)a3;
- (void)setPinningLiveTransform:(id)a3;
- (void)setSectionOffset:(CGPoint)a3;
@end

@implementation _TUIPinningEntry

- (TUIPinningLiveTransform)pinningLiveTransform
{
  return self->_pinningLiveTransform;
}

- (void)setPinningLiveTransform:(id)a3
{
}

- (CGPoint)currentOffset
{
  double x = self->_currentOffset.x;
  double y = self->_currentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentOffset:(CGPoint)a3
{
  self->_currentOffset = a3;
}

- (CGPoint)sectionOffset
{
  double x = self->_sectionOffset.x;
  double y = self->_sectionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSectionOffset:(CGPoint)a3
{
  self->_sectionOffset = a3;
}

- (CGPoint)defaultPosition
{
  double x = self->_defaultPosition.x;
  double y = self->_defaultPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDefaultPosition:(CGPoint)a3
{
  self->_defaultPosition = a3;
}

- (void).cxx_destruct
{
}

@end