@interface PGGraphRemoteAddressEdge
+ (id)filter;
- (id)label;
@end

@implementation PGGraphRemoteAddressEdge

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"REMOTE_ADDRESS" domain:200];
  return v2;
}

- (id)label
{
  v2 = @"REMOTE_ADDRESS";
  return @"REMOTE_ADDRESS";
}

@end