@interface PGMeaningfulEventNumberTrait
- (BOOL)isActive;
- (PGMeaningfulEventNumberTrait)initWithNumberValue:(double)a3;
- (double)value;
- (id)debugDescriptionWithMomentNode:(id)a3;
@end

@implementation PGMeaningfulEventNumberTrait

- (double)value
{
  return self->_value;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGMeaningfulEventNumberTrait;
  v5 = [(PGMeaningfulEventTrait *)&v8 debugDescriptionWithMomentNode:a3];
  v6 = [v4 stringWithFormat:@"%@ %.2f", v5, *(void *)&self->_value];

  return v6;
}

- (BOOL)isActive
{
  return self->_value != 0.0;
}

- (PGMeaningfulEventNumberTrait)initWithNumberValue:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventNumberTrait;
  result = [(PGMeaningfulEventTrait *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

@end