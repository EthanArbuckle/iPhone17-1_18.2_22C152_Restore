@interface DataStreamTargetControlProtocol
+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4;
@end

@implementation DataStreamTargetControlProtocol

+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  CFStringRef v8 = @"identifier";
  id v5 = a4;
  v6 = +[NSNumber numberWithUnsignedInt:v4];
  v9 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [v5 sendEventForProtocol:@"targetControl" topic:@"whoami" payload:v7 completion:&stru_100273438];
}

@end