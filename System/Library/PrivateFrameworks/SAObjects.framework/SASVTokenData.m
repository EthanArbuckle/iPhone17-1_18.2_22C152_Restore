@interface SASVTokenData
+ (id)tokenData;
- (NSNumber)endTimeMillis;
- (NSNumber)startTimeMillis;
- (NSString)text;
- (float)score;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndTimeMillis:(id)a3;
- (void)setScore:(float)a3;
- (void)setStartTimeMillis:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SASVTokenData

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"TokenData";
}

+ (id)tokenData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)endTimeMillis
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"endTimeMillis"];
}

- (void)setEndTimeMillis:(id)a3
{
}

- (float)score
{
  return AceObjectFloatForProperty(self, @"score");
}

- (void)setScore:(float)a3
{
}

- (NSNumber)startTimeMillis
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startTimeMillis"];
}

- (void)setStartTimeMillis:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end