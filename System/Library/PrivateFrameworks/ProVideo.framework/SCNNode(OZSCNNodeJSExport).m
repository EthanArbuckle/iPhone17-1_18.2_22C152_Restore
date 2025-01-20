@interface SCNNode(OZSCNNodeJSExport)
- (uint64_t)firstChildNodeWithGeometry;
@end

@implementation SCNNode(OZSCNNodeJSExport)

- (uint64_t)firstChildNodeWithGeometry
{
  v1 = (void *)[a1 childNodesPassingTest:&__block_literal_global_75];
  uint64_t result = [v1 count];
  if (result)
  {
    return [v1 objectAtIndexedSubscript:0];
  }
  return result;
}

@end