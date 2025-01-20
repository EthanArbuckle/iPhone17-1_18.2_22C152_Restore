@interface SAKnowledgeGraphTriple
+ (id)graphTriple;
- (NSString)object;
- (NSString)predicate;
- (NSString)storeName;
- (NSString)subject;
- (float)confidence;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfidence:(float)a3;
- (void)setObject:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setStoreName:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation SAKnowledgeGraphTriple

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"GraphTriple";
}

+ (id)graphTriple
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (float)confidence
{
  return AceObjectFloatForProperty(self, @"confidence");
}

- (void)setConfidence:(float)a3
{
}

- (NSString)object
{
  return (NSString *)[(AceObject *)self propertyForKey:@"object"];
}

- (void)setObject:(id)a3
{
}

- (NSString)predicate
{
  return (NSString *)[(AceObject *)self propertyForKey:@"predicate"];
}

- (void)setPredicate:(id)a3
{
}

- (NSString)storeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"storeName"];
}

- (void)setStoreName:(id)a3
{
}

- (NSString)subject
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subject"];
}

- (void)setSubject:(id)a3
{
}

@end