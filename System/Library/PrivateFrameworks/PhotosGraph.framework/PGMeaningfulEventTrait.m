@interface PGMeaningfulEventTrait
- (BOOL)isActive;
- (BOOL)isMatchingRequired;
- (PGMeaningfulEventTrait)init;
- (double)minimumScore;
- (id)debugDescription;
- (id)debugDescriptionWithMomentNode:(id)a3;
- (void)setMinimumScore:(double)a3;
@end

@implementation PGMeaningfulEventTrait

- (void)setMinimumScore:(double)a3
{
  self->_minimumScore = a3;
}

- (double)minimumScore
{
  return self->_minimumScore;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"<%@: %p>", v6, self];

  return v7;
}

- (id)debugDescription
{
  return [(PGMeaningfulEventTrait *)self debugDescriptionWithMomentNode:0];
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isMatchingRequired
{
  return self->_minimumScore != 0.0 && [(PGMeaningfulEventTrait *)self isActive];
}

- (PGMeaningfulEventTrait)init
{
  v3.receiver = self;
  v3.super_class = (Class)PGMeaningfulEventTrait;
  result = [(PGMeaningfulEventTrait *)&v3 init];
  if (result) {
    result->_minimumScore = 0.0;
  }
  return result;
}

@end