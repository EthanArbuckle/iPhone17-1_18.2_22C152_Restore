@interface PGFeaturedMemoryGenerator
- (BOOL)oldMemory;
- (BOOL)usesLowRequirements;
- (NSDate)upperBoundLocalDate;
- (void)setOldMemory:(BOOL)a3;
- (void)setUpperBoundLocalDate:(id)a3;
- (void)setUsesLowRequirements:(BOOL)a3;
@end

@implementation PGFeaturedMemoryGenerator

- (void).cxx_destruct
{
}

- (void)setOldMemory:(BOOL)a3
{
  self->_oldMemory = a3;
}

- (BOOL)oldMemory
{
  return self->_oldMemory;
}

- (void)setUsesLowRequirements:(BOOL)a3
{
  self->_usesLowRequirements = a3;
}

- (BOOL)usesLowRequirements
{
  return self->_usesLowRequirements;
}

- (void)setUpperBoundLocalDate:(id)a3
{
}

- (NSDate)upperBoundLocalDate
{
  return self->_upperBoundLocalDate;
}

@end