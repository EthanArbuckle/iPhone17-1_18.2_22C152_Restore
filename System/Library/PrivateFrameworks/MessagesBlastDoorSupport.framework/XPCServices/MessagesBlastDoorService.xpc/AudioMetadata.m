@interface AudioMetadata
- (NSArray)powerLevels;
- (double)duration;
- (void)setDuration:(double)a3;
- (void)setPowerLevels:(id)a3;
@end

@implementation AudioMetadata

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSArray)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end