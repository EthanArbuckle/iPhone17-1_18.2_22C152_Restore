@interface PGCurationContentOrAestheticScoreTrait
- (BOOL)isActive;
- (PGCurationContentOrAestheticScoreTrait)initWithMinimumContentScore:(double)a3 minimumAestheticScore:(double)a4;
- (double)minimumAestheticScore;
- (void)setMinimumAestheticScore:(double)a3;
@end

@implementation PGCurationContentOrAestheticScoreTrait

- (void)setMinimumAestheticScore:(double)a3
{
  self->_minimumAestheticScore = a3;
}

- (double)minimumAestheticScore
{
  return self->_minimumAestheticScore;
}

- (BOOL)isActive
{
  return 1;
}

- (PGCurationContentOrAestheticScoreTrait)initWithMinimumContentScore:(double)a3 minimumAestheticScore:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGCurationContentOrAestheticScoreTrait;
  v6 = [(PGCurationTrait *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(PGCurationTrait *)v6 setMinimumScore:a3];
    v7->_minimumAestheticScore = a4;
  }
  return v7;
}

@end