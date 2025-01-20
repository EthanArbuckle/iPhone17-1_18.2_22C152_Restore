@interface PSUSummarizationXPCServer
+ (void)start;
- (PSUSummarizationXPCServer)init;
@end

@implementation PSUSummarizationXPCServer

+ (void)start
{
}

- (PSUSummarizationXPCServer)init
{
  return (PSUSummarizationXPCServer *)PSUSummarizationXPCServer.init()();
}

@end