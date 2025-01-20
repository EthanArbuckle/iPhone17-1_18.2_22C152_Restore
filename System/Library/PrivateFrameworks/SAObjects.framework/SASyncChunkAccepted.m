@interface SASyncChunkAccepted
+ (id)chunkAccepted;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SASyncAnchor)current;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrent:(id)a3;
@end

@implementation SASyncChunkAccepted

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ChunkAccepted";
}

+ (id)chunkAccepted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASyncAnchor)current
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, @"current");
}

- (void)setCurrent:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end