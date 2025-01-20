@interface SWActionFactory
- (SWActionFactory)initWithNavigationManager:(id)a3;
- (SWNavigationManager)navigationManager;
- (id)actionForDictionary:(id)a3;
@end

@implementation SWActionFactory

- (SWActionFactory)initWithNavigationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWActionFactory;
  v6 = [(SWActionFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationManager, a3);
  }

  return v7;
}

- (id)actionForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"type"];
  int v6 = [v5 isEqualToString:@"url"];
  if (v6)
  {
    uint64_t v7 = 1;
  }
  else if ([v5 isEqualToString:@"share"])
  {
    uint64_t v7 = 2;
  }
  else if ([v5 isEqualToString:@"close"])
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [v4 objectForKey:@"info"];
  objc_super v9 = v8;
  if (v6)
  {
    v10 = [v8 objectForKey:@"URL"];
    if (v10
      && ([NSURL URLWithString:v10], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      v13 = [SWURLAction alloc];
      v14 = [(SWActionFactory *)self navigationManager];
      v15 = [(SWURLAction *)v13 initWithURL:v12 navigationManager:v14];
    }
    else
    {
      v15 = [[SWEmbedAction alloc] initWithType:0 info:v9];
    }
  }
  else
  {
    v15 = [[SWEmbedAction alloc] initWithType:v7 info:v8];
  }

  return v15;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
}

@end