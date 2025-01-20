@interface PGCurationCropScoreTrait
- (BOOL)isActive;
- (PGCurationCropScoreTrait)initWithMinimumSquareCropScore:(double)a3;
- (double)minimumSquareCropScore;
- (void)setMinimumSquareCropScore:(double)a3;
@end

@implementation PGCurationCropScoreTrait

- (void)setMinimumSquareCropScore:(double)a3
{
  self->_minimumSquareCropScore = a3;
}

- (double)minimumSquareCropScore
{
  return self->_minimumSquareCropScore;
}

- (BOOL)isActive
{
  return 1;
}

- (PGCurationCropScoreTrait)initWithMinimumSquareCropScore:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGCurationCropScoreTrait;
  result = [(PGCurationTrait *)&v5 init];
  if (result) {
    result->_minimumSquareCropScore = a3;
  }
  return result;
}

@end