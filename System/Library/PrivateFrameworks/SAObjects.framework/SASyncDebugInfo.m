@interface SASyncDebugInfo
+ (id)debugInfo;
- (NSArray)objectIds;
- (SASyncAnchor)syncAnchor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjectIds:(id)a3;
- (void)setSyncAnchor:(id)a3;
@end

@implementation SASyncDebugInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"DebugInfo";
}

+ (id)debugInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objectIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"objectIds");
}

- (void)setObjectIds:(id)a3
{
}

- (SASyncAnchor)syncAnchor
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, @"syncAnchor");
}

- (void)setSyncAnchor:(id)a3
{
}

@end