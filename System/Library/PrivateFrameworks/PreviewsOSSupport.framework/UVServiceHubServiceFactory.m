@interface UVServiceHubServiceFactory
- (id)newAgentPipeService:(id)a3 error:(id *)a4;
- (id)newPreviewService:(id)a3 error:(id *)a4;
- (id)newShellPipeService:(id)a3 error:(id *)a4;
@end

@implementation UVServiceHubServiceFactory

- (id)newAgentPipeService:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newShellPipeService:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newPreviewService:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end