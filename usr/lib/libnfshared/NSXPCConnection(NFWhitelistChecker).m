@interface NSXPCConnection(NFWhitelistChecker)
- (id)NF_whitelistChecker;
@end

@implementation NSXPCConnection(NFWhitelistChecker)

- (id)NF_whitelistChecker
{
  v1 = [a1 NF_userInfo];
  v2 = [v1 objectForKeyedSubscript:@"ServiceWhitelist"];

  return v2;
}

@end