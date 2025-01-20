@interface PETEventProperty
+ (id)freeValuedPropertyWithName:(id)a3;
+ (id)propertyWithName:(id)a3 enumMapping:(id)a4;
+ (id)propertyWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5;
+ (id)propertyWithName:(id)a3 possibleValues:(id)a4;
+ (id)propertyWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5;
+ (id)propertyWithName:(id)a3 range:(_NSRange)a4;
+ (id)propertyWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5;
+ (id)propertyWithName:(id)a3 rangeMin:(unint64_t)a4 rangeMax:(unint64_t)a5;
- (BOOL)isValidValue:(id)a3;
- (NSString)longestValueString;
- (NSString)name;
- (PETEventProperty)initWithName:(id)a3;
- (_NSRange)validRange;
- (id)_loggingKeyStringRepresentationForValue:(id)a3;
- (id)possibleValues;
- (unint64_t)cardinality;
@end

@implementation PETEventProperty

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

- (_NSRange)validRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)possibleValues
{
  return 0;
}

- (NSString)longestValueString
{
  return 0;
}

- (unint64_t)cardinality
{
  return 1000;
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  return 0;
}

- (BOOL)isValidValue:(id)a3
{
  return 0;
}

- (PETEventProperty)initWithName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PETEventProperty;
  v5 = [(PETEventProperty *)&v12 init];
  if (v5)
  {
    if (!+[PETEventStringValidator stringIsValid:v4])
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      v7 = [NSString stringWithFormat:@"property name may only contain [a-zA-Z0-9_] and may not be prefixed with _: %@", v4];
      v8 = [v6 exceptionWithName:@"PETEventTrackingException" reason:v7 userInfo:0];

      [v8 raise];
    }
    uint64_t v9 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v9;
  }
  return v5;
}

+ (id)freeValuedPropertyWithName:(id)a3
{
  id v3 = a3;
  id v4 = [[PETEventFreeValuedProperty alloc] initWithName:v3];

  return v4;
}

+ (id)propertyWithName:(id)a3 rangeMin:(unint64_t)a4 rangeMax:(unint64_t)a5
{
  id v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(), "propertyWithName:range:clampValues:", v7, a4, a5 - a4 + 1, 0);

  return v8;
}

+ (id)propertyWithName:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = objc_msgSend((id)objc_opt_class(), "propertyWithName:range:clampValues:", v6, location, length, 0);

  return v7;
}

+ (id)propertyWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  uint64_t v9 = -[PETEventNumericalProperty initWithName:range:clampValues:]([PETEventNumericalProperty alloc], "initWithName:range:clampValues:", v8, location, length, v5);

  return v9;
}

+ (id)propertyWithName:(id)a3 enumMapping:(id)a4 autoSanitizeValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[PETEventEnumMappedProperty alloc] initWithName:v8 enumMapping:v7 autoSanitizeValues:v5];

  return v9;
}

+ (id)propertyWithName:(id)a3 enumMapping:(id)a4
{
  return +[PETEventProperty propertyWithName:a3 enumMapping:a4 autoSanitizeValues:1];
}

+ (id)propertyWithName:(id)a3 possibleValues:(id)a4 autoSanitizeValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [PETEventStringValuedProperty alloc];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];

  v11 = [(PETEventStringValuedProperty *)v9 initWithName:v8 possibleValues:v10 autoSanitizeValues:v5];

  return v11;
}

+ (id)propertyWithName:(id)a3 possibleValues:(id)a4
{
  return +[PETEventProperty propertyWithName:a3 possibleValues:a4 autoSanitizeValues:1];
}

@end