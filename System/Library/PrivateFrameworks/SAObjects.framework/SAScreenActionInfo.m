@interface SAScreenActionInfo
+ (id)info;
- (NSArray)examples;
- (NSString)elementId;
- (NSString)language;
- (NSString)semanticData;
- (NSString)value;
- (NSURL)semanticId;
- (NSURL)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setElementId:(id)a3;
- (void)setExamples:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setSemanticData:(id)a3;
- (void)setSemanticId:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SAScreenActionInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.onscreenaction";
}

- (id)encodedClassName
{
  return @"Info";
}

+ (id)info
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)elementId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"elementId"];
}

- (void)setElementId:(id)a3
{
}

- (NSArray)examples
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"examples"];
}

- (void)setExamples:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)semanticData
{
  return (NSString *)[(AceObject *)self propertyForKey:@"semanticData"];
}

- (void)setSemanticData:(id)a3
{
}

- (NSURL)semanticId
{
  return (NSURL *)AceObjectURLForProperty(self, @"semanticId");
}

- (void)setSemanticId:(id)a3
{
}

- (NSURL)type
{
  return (NSURL *)AceObjectURLForProperty(self, @"type");
}

- (void)setType:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end