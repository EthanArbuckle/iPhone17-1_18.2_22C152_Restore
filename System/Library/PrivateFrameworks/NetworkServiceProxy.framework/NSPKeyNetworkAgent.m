@interface NSPKeyNetworkAgent
+ (id)agentType;
@end

@implementation NSPKeyNetworkAgent

+ (id)agentType
{
  return @"Key";
}

@end