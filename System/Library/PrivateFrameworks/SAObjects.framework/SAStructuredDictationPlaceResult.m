@interface SAStructuredDictationPlaceResult
+ (id)structuredDictationPlaceResult;
- (NSData)resultData;
- (NSString)placeResultType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPlaceResultType:(id)a3;
- (void)setResultData:(id)a3;
@end

@implementation SAStructuredDictationPlaceResult

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"StructuredDictationPlaceResult";
}

+ (id)structuredDictationPlaceResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)placeResultType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"placeResultType"];
}

- (void)setPlaceResultType:(id)a3
{
}

- (NSData)resultData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"resultData"];
}

- (void)setResultData:(id)a3
{
}

@end