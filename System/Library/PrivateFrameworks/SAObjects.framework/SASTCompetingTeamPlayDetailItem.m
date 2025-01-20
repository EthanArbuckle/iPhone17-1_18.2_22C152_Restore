@interface SASTCompetingTeamPlayDetailItem
+ (id)competingTeamPlayDetailItem;
- (BOOL)firstEntity;
- (SAUIDecoratedText)playDetail;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFirstEntity:(BOOL)a3;
- (void)setPlayDetail:(id)a3;
@end

@implementation SASTCompetingTeamPlayDetailItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"CompetingTeamPlayDetailItem";
}

+ (id)competingTeamPlayDetailItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)firstEntity
{
  return AceObjectBoolForProperty(self, @"firstEntity");
}

- (void)setFirstEntity:(BOOL)a3
{
}

- (SAUIDecoratedText)playDetail
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"playDetail");
}

- (void)setPlayDetail:(id)a3
{
}

@end