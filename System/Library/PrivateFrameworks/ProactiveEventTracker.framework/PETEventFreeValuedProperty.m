@interface PETEventFreeValuedProperty
- (BOOL)isValidValue:(id)a3;
- (PETEventFreeValuedProperty)initWithName:(id)a3;
- (id)_loggingKeyStringRepresentationForValue:(id)a3;
- (id)description;
- (id)longestValueString;
- (id)possibleValues;
- (unint64_t)cardinality;
@end

@implementation PETEventFreeValuedProperty

- (id)longestValueString
{
  return &stru_1EE08A1D0;
}

- (id)possibleValues
{
  return 0;
}

- (unint64_t)cardinality
{
  return 1;
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  return +[PETEventStringValidator sanitizedString:a3];
}

- (BOOL)isValidValue:(id)a3
{
  return 1;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PETEventProperty *)self name];
  v4 = [v2 stringWithFormat:@"FreeValued: Name=%@", v3];

  return v4;
}

- (PETEventFreeValuedProperty)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PETEventFreeValuedProperty;
  return [(PETEventProperty *)&v4 initWithName:a3];
}

@end