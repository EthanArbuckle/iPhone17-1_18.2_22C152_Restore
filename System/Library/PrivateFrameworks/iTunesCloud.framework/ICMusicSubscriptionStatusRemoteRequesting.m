@interface ICMusicSubscriptionStatusRemoteRequesting
+ (NSString)machServiceName;
+ (id)clientInterface;
+ (id)serviceInterface;
@end

@implementation ICMusicSubscriptionStatusRemoteRequesting

+ (NSString)machServiceName
{
  return (NSString *)@"com.apple.itunescloud.music-subscription-status-service";
}

+ (id)serviceInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67BB40];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_performSubscriptionStatusRequest_forUniqueIdentifier_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_performSubscriptionStatusRequest_forUniqueIdentifier_ argumentIndex:1 ofReply:0];

  return v2;
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF664F08];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error_ argumentIndex:1 ofReply:0];

  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_deliverSubscriptionStatusResponse_forRemoteRequestWithUniqueIdentifier_error_ argumentIndex:2 ofReply:0];

  return v2;
}

@end