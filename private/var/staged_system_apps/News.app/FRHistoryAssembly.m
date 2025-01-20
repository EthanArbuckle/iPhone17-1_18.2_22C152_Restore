@interface FRHistoryAssembly
- (FRHistoryAssembly)init;
- (void)loadInRegistry:(id)a3;
@end

@implementation FRHistoryAssembly

- (void)loadInRegistry:(id)a3
{
  id v4 = [a3 publicContainer];
  id v3 = [v4 registerProtocol:&OBJC_PROTOCOL___TSClearDataManager factory:&stru_1000C6038];
}

- (FRHistoryAssembly)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRHistoryAssembly;
  return [(FRHistoryAssembly *)&v3 init];
}

@end