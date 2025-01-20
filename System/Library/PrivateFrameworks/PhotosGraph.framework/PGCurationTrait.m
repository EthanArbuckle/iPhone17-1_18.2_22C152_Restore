@interface PGCurationTrait
- (BOOL)isActive;
- (BOOL)isMatchingRequired;
- (PGCurationTrait)init;
- (double)minimumScore;
- (id)debugDescription;
- (void)setMinimumScore:(double)a3;
@end

@implementation PGCurationTrait

- (void)setMinimumScore:(double)a3
{
  self->_minimumScore = a3;
}

- (double)minimumScore
{
  return self->_minimumScore;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return v6;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isMatchingRequired
{
  return self->_minimumScore != 0.0 && [(PGCurationTrait *)self isActive];
}

- (PGCurationTrait)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGCurationTrait;
  result = [(PGCurationTrait *)&v3 init];
  if (result) {
    result->_minimumScore = 0.0;
  }
  return result;
}

@end