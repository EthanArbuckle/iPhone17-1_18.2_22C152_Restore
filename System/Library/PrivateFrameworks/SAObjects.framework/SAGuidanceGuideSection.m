@interface SAGuidanceGuideSection
+ (id)guideSection;
- (NSArray)guideUtterances;
- (NSString)sectionName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGuideUtterances:(id)a3;
- (void)setSectionName:(id)a3;
@end

@implementation SAGuidanceGuideSection

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"GuideSection";
}

+ (id)guideSection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)guideUtterances
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"guideUtterances"];
}

- (void)setGuideUtterances:(id)a3
{
}

- (NSString)sectionName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sectionName"];
}

- (void)setSectionName:(id)a3
{
}

@end