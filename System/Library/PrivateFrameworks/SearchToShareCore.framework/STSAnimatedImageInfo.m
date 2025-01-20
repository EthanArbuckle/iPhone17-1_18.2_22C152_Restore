@interface STSAnimatedImageInfo
- (CGSize)size;
- (NSArray)frames;
- (double)duration;
- (void)setDuration:(double)a3;
- (void)setFrames:(id)a3;
@end

@implementation STSAnimatedImageInfo

- (CGSize)size
{
  v2 = [(STSAnimatedImageInfo *)self frames];
  v3 = [v2 firstObject];

  if (v3)
  {
    [v3 size];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
}

@end