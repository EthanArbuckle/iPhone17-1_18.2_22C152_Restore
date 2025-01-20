@interface BKScrubberTrack
- (BOOL)modern;
- (BOOL)roundEndCaps;
- (UIColor)trackBackgroundColor;
- (UIColor)trackForegroundColor;
- (double)loadingProgress;
- (double)readingProgress;
- (double)thickness;
- (int)trackOrientation;
- (int64_t)layoutDirection;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setLoadingProgress:(double)a3;
- (void)setModern:(BOOL)a3;
- (void)setReadingProgress:(double)a3;
- (void)setRoundEndCaps:(BOOL)a3;
- (void)setThickness:(double)a3;
- (void)setTrackBackgroundColor:(id)a3;
- (void)setTrackForegroundColor:(id)a3;
- (void)setTrackOrientation:(int)a3;
@end

@implementation BKScrubberTrack

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (void)setLoadingProgress:(double)a3
{
  self->_loadingProgress = a3;
}

- (double)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(double)a3
{
  self->_readingProgress = a3;
}

- (double)thickness
{
  return self->_thickness;
}

- (void)setThickness:(double)a3
{
  self->_thickness = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (BOOL)roundEndCaps
{
  return self->_roundEndCaps;
}

- (void)setRoundEndCaps:(BOOL)a3
{
  self->_roundEndCaps = a3;
}

- (BOOL)modern
{
  return self->_modern;
}

- (void)setModern:(BOOL)a3
{
  self->_modern = a3;
}

- (int)trackOrientation
{
  return self->_trackOrientation;
}

- (void)setTrackOrientation:(int)a3
{
  self->_trackOrientation = a3;
}

- (UIColor)trackBackgroundColor
{
  return self->_trackBackgroundColor;
}

- (void)setTrackBackgroundColor:(id)a3
{
}

- (UIColor)trackForegroundColor
{
  return self->_trackForegroundColor;
}

- (void)setTrackForegroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackForegroundColor, 0);

  objc_storeStrong((id *)&self->_trackBackgroundColor, 0);
}

@end