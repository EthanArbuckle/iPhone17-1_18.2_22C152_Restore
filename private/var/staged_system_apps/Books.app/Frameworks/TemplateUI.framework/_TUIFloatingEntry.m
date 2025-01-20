@interface _TUIFloatingEntry
- (CGPoint)currentOffset;
- (CGPoint)defaultPosition;
- (CGPoint)sectionOffset;
- (TUIFloatingLiveTransform)floatingLiveTransform;
- (double)sectionBottomY;
- (void)setCurrentOffset:(CGPoint)a3;
- (void)setDefaultPosition:(CGPoint)a3;
- (void)setFloatingLiveTransform:(id)a3;
- (void)setSectionBottomY:(double)a3;
- (void)setSectionOffset:(CGPoint)a3;
@end

@implementation _TUIFloatingEntry

- (TUIFloatingLiveTransform)floatingLiveTransform
{
  return self->_floatingLiveTransform;
}

- (void)setFloatingLiveTransform:(id)a3
{
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

- (double)sectionBottomY
{
  return self->_sectionBottomY;
}

- (void)setSectionBottomY:(double)a3
{
  self->_sectionBottomY = a3;
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