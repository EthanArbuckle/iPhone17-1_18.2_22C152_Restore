@interface PGCurationPartOfDayTrait
- (BOOL)isActive;
- (PGCurationPartOfDayTrait)initWithPartOfDay:(unint64_t)a3;
- (id)debugDescription;
- (id)niceDescription;
- (unint64_t)value;
@end

@implementation PGCurationPartOfDayTrait

- (unint64_t)value
{
  return self->_value;
}

- (id)debugDescription
{
  v3 = +[PGGraphPartOfDayNode stringValueForPartOfDay:self->_value];
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PGCurationPartOfDayTrait;
  v5 = [(PGCurationTrait *)&v8 debugDescription];
  v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (id)niceDescription
{
  return +[PGGraphPartOfDayNode stringValueForPartOfDay:self->_value];
}

- (BOOL)isActive
{
  return self->_value != 1;
}

- (PGCurationPartOfDayTrait)initWithPartOfDay:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGCurationPartOfDayTrait;
  result = [(PGCurationTrait *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

@end