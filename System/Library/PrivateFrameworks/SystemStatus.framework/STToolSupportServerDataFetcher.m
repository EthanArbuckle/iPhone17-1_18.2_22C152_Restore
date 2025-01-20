@interface STToolSupportServerDataFetcher
- (id)serverDataForDomains:(id)a3;
@end

@implementation STToolSupportServerDataFetcher

- (id)serverDataForDomains:(id)a3
{
  id v3 = a3;
  v4 = +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle];
  v5 = [v4 serverDataForDomains:v3];

  return v5;
}

@end