@interface PPStringDonationDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PPStringDonationDelegate)init;
@end

@implementation PPStringDonationDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29280];
  id v5 = a4;
  v6 = [v4 interfaceWithProtocol:&unk_1F2578040];
  v7 = objc_opt_new();
  BOOL v8 = +[PPXPCServerHelper shouldAcceptConnection:v5 serviceName:@"com.apple.suggestd.PersonalizationPortrait.StringDonation" allowedServerInterface:v6 allowedClientInterface:0 requestHandler:v7 validateConnection:&__block_literal_global_21575 setupClientProxy:0 interruptionHandler:&__block_literal_global_62 invalidationHandler:&__block_literal_global_64_21580];

  return v8;
}

BOOL __63__PPStringDonationDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.NamedEntity.readWrite" connection:v2 serviceName:@"com.apple.suggestd.PersonalizationPortrait.StringDonation"])
  {
    BOOL v3 = +[PPXPCServerHelper checkForAndLogTrueBooleanEntitlement:@"com.apple.proactive.PersonalizationPortrait.Topic.readWrite" connection:v2 serviceName:@"com.apple.suggestd.PersonalizationPortrait.StringDonation"];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (PPStringDonationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPStringDonationDelegate;
  return [(PPStringDonationDelegate *)&v3 init];
}

@end