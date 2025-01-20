@interface WatchControlSettings(GreySupportClients)
- (void)disableActiveGreySupportClients;
@end

@implementation WatchControlSettings(GreySupportClients)

- (void)disableActiveGreySupportClients
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C230000, v0, v1, "Disable AST since it is an active grey source.", v2, v3, v4, v5, v6);
}

@end