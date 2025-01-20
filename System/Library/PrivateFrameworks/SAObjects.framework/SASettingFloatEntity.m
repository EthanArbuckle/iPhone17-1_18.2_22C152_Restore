@interface SASettingFloatEntity
+ (id)floatEntity;
+ (id)floatEntityWithValue:(float)a3;
- (NSNumber)previousValue;
- (SASettingFloatEntity)initWithValue:(float)a3;
- (float)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPreviousValue:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation SASettingFloatEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"FloatEntity";
}

+ (id)floatEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)floatEntityWithValue:(float)a3
{
  v4 = [SASettingFloatEntity alloc];
  *(float *)&double v5 = a3;
  v6 = [(SASettingFloatEntity *)v4 initWithValue:v5];
  return v6;
}

- (SASettingFloatEntity)initWithValue:(float)a3
{
  v4 = [(AceObject *)self init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3;
    [(SASettingFloatEntity *)v4 setValue:v5];
  }
  return v6;
}

- (NSNumber)previousValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"previousValue"];
}

- (void)setPreviousValue:(id)a3
{
}

- (float)value
{
  return AceObjectFloatForProperty(self, @"value");
}

- (void)setValue:(float)a3
{
}

@end