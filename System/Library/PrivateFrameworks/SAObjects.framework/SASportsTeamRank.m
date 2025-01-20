@interface SASportsTeamRank
+ (id)teamRank;
- (NSNumber)position;
- (NSNumber)primary;
- (NSString)source;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPosition:(id)a3;
- (void)setPrimary:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SASportsTeamRank

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"TeamRank";
}

+ (id)teamRank
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)position
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

- (NSNumber)primary
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"primary"];
}

- (void)setPrimary:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

@end