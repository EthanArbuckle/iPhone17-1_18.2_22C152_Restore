@interface RCPEventTrack
- (double)endX;
- (double)startX;
- (int64_t)trackY;
- (void)setEndX:(double)a3;
- (void)setStartX:(double)a3;
- (void)setTrackY:(int64_t)a3;
@end

@implementation RCPEventTrack

- (double)startX
{
  return self->_startX;
}

- (void)setStartX:(double)a3
{
  self->_startX = a3;
}

- (double)endX
{
  return self->_endX;
}

- (void)setEndX:(double)a3
{
  self->_endX = a3;
}

- (int64_t)trackY
{
  return self->_trackY;
}

- (void)setTrackY:(int64_t)a3
{
  self->_trackY = a3;
}

@end