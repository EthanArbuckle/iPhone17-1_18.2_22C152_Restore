@interface PGMeaningfulEventLocationMobilityTrait
- (BOOL)isActive;
- (PGMeaningfulEventLocationMobilityTrait)initWithMobility:(unint64_t)a3;
- (id)debugDescriptionWithMomentNode:(id)a3;
- (unint64_t)value;
@end

@implementation PGMeaningfulEventLocationMobilityTrait

- (unint64_t)value
{
  return self->_value;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  unint64_t value = self->_value;
  id v5 = a3;
  if (value > 4) {
    v6 = 0;
  }
  else {
    v6 = off_1E68E4F68[value];
  }
  v7 = v6;
  v8 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PGMeaningfulEventLocationMobilityTrait;
  v9 = [(PGMeaningfulEventTrait *)&v12 debugDescriptionWithMomentNode:v5];

  v10 = [v8 stringWithFormat:@"%@ %@", v9, v7];

  return v10;
}

- (BOOL)isActive
{
  return self->_value != 0;
}

- (PGMeaningfulEventLocationMobilityTrait)initWithMobility:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventLocationMobilityTrait;
  result = [(PGMeaningfulEventTrait *)&v5 init];
  if (result) {
    result->_unint64_t value = a3;
  }
  return result;
}

@end