@interface ICRemoteRequestOperationExecuting
+ (NSString)machServiceName;
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation ICRemoteRequestOperationExecuting

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.itunescloud.remote-request-execution-service";
}

+ (id)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67BAE0];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_performRemoteRequestOperationWithExecutionContext_completionHandler_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_performRemoteRequestOperationWithExecutionContext_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67BA80];
}

@end