@interface SALocalSearchRating
+ (id)rating;
- (NSString)providerId;
- (double)maxValue;
- (double)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setMaxValue:(double)a3;
- (void)setProviderId:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation SALocalSearchRating

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Rating";
}

+ (id)rating
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, @"count");
}

- (void)setCount:(int64_t)a3
{
}

- (double)maxValue
{
  return AceObjectDoubleForProperty(self, @"maxValue");
}

- (void)setMaxValue:(double)a3
{
}

- (NSString)providerId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId"];
}

- (void)setProviderId:(id)a3
{
}

- (double)value
{
  return AceObjectDoubleForProperty(self, @"value");
}

- (void)setValue:(double)a3
{
}

@end