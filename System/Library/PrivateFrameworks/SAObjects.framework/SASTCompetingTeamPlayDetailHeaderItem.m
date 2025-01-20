@interface SASTCompetingTeamPlayDetailHeaderItem
+ (id)competingTeamPlayDetailHeaderItem;
- (SAUIDecoratedText)firstTeam;
- (SAUIDecoratedText)secondTeam;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFirstTeam:(id)a3;
- (void)setSecondTeam:(id)a3;
@end

@implementation SASTCompetingTeamPlayDetailHeaderItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"CompetingTeamPlayDetailHeaderItem";
}

+ (id)competingTeamPlayDetailHeaderItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIDecoratedText)firstTeam
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"firstTeam");
}

- (void)setFirstTeam:(id)a3
{
}

- (SAUIDecoratedText)secondTeam
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"secondTeam");
}

- (void)setSecondTeam:(id)a3
{
}

@end