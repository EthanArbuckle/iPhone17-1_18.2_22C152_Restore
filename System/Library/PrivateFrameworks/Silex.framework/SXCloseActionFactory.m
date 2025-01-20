@interface SXCloseActionFactory
- (id)actionForAddition:(id)a3;
- (id)actionForURL:(id)a3;
@end

@implementation SXCloseActionFactory

- (id)actionForURL:(id)a3
{
  v3 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  v4 = [v3 scheme];
  if ([v4 isEqualToString:@"action"])
  {
    v5 = [v3 host];
    int v6 = [v5 isEqualToString:@"close"];

    if (v6)
    {
      v7 = objc_alloc_init(SXCloseAction);
      goto LABEL_6;
    }
  }
  else
  {
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)actionForAddition:(id)a3
{
  return 0;
}

@end