@interface PGMeaningfulEventPartOfDayTrait
- (BOOL)isActive;
- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3;
- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3 forbiddenPartOfDay:(unint64_t)a4;
- (id)debugDescriptionWithMomentNode:(id)a3;
- (unint64_t)forbiddenValue;
- (unint64_t)value;
@end

@implementation PGMeaningfulEventPartOfDayTrait

- (unint64_t)forbiddenValue
{
  return self->_forbiddenValue;
}

- (unint64_t)value
{
  return self->_value;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  unint64_t value = self->_value;
  id v5 = a3;
  v6 = +[PGGraphPartOfDayNode stringValueForPartOfDay:value];
  v7 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGMeaningfulEventPartOfDayTrait;
  v8 = [(PGMeaningfulEventTrait *)&v11 debugDescriptionWithMomentNode:v5];

  v9 = [v7 stringWithFormat:@"%@ %@", v8, v6];

  return v9;
}

- (BOOL)isActive
{
  return self->_value != 1;
}

- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3 forbiddenPartOfDay:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGMeaningfulEventPartOfDayTrait;
  result = [(PGMeaningfulEventTrait *)&v7 init];
  if (result)
  {
    result->_unint64_t value = a3;
    result->_forbiddenValue = a4;
  }
  return result;
}

- (PGMeaningfulEventPartOfDayTrait)initWithPartOfDay:(unint64_t)a3
{
  return [(PGMeaningfulEventPartOfDayTrait *)self initWithPartOfDay:a3 forbiddenPartOfDay:1];
}

@end