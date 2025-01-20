@interface SATimerObject
+ (id)object;
- (NSNumber)isFiring;
- (NSNumber)timerValue;
- (NSString)state;
- (NSString)title;
- (NSString)type;
- (SADataSourceInfo)dataSourceInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDataSourceInfo:(id)a3;
- (void)setIsFiring:(id)a3;
- (void)setState:(id)a3;
- (void)setTimerValue:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SATimerObject

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADataSourceInfo)dataSourceInfo
{
  return (SADataSourceInfo *)AceObjectAceObjectForProperty(self, @"dataSourceInfo");
}

- (void)setDataSourceInfo:(id)a3
{
}

- (NSNumber)isFiring
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isFiring"];
}

- (void)setIsFiring:(id)a3
{
}

- (NSString)state
{
  return (NSString *)[(AceObject *)self propertyForKey:@"state"];
}

- (void)setState:(id)a3
{
}

- (NSNumber)timerValue
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timerValue"];
}

- (void)setTimerValue:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end