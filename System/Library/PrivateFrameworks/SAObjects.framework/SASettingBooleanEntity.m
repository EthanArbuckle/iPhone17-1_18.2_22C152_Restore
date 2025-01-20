@interface SASettingBooleanEntity
+ (id)BOOLeanEntity;
+ (id)BOOLeanEntityWithValue:(BOOL)a3;
- (BOOL)value;
- (NSNumber)previousValue;
- (SASettingBooleanEntity)initWithValue:(BOOL)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPreviousValue:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation SASettingBooleanEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"BooleanEntity";
}

+ (id)BOOLeanEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)BOOLeanEntityWithValue:(BOOL)a3
{
  v3 = [[SASettingBooleanEntity alloc] initWithValue:a3];
  return v3;
}

- (SASettingBooleanEntity)initWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AceObject *)self init];
  v5 = v4;
  if (v4) {
    [(SASettingBooleanEntity *)v4 setValue:v3];
  }
  return v5;
}

- (NSNumber)previousValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"previousValue"];
}

- (void)setPreviousValue:(id)a3
{
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, @"value");
}

- (void)setValue:(BOOL)a3
{
}

@end