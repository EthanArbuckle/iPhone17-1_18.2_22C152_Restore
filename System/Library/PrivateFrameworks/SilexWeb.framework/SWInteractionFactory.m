@interface SWInteractionFactory
- (SWInteractionFactory)initWithNavigationManager:(id)a3;
- (SWNavigationManager)navigationManager;
- (id)interactionForDictionary:(id)a3;
@end

@implementation SWInteractionFactory

- (SWInteractionFactory)initWithNavigationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWInteractionFactory;
  v6 = [(SWInteractionFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationManager, a3);
  }

  return v7;
}

- (id)interactionForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"type"];
  if ([v5 isEqualToString:@"interactable"])
  {
    uint64_t v6 = 1;
LABEL_8:
    v12 = [[SWInteraction alloc] initWithType:v6];
    goto LABEL_11;
  }
  if (![v5 isEqualToString:@"selectable"])
  {
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  v7 = [v4 objectForKey:@"URL"];
  if (v7 && ([NSURL URLWithString:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v9 = (void *)v8;
    v10 = [SWURLInteraction alloc];
    v11 = [(SWInteractionFactory *)self navigationManager];
    v12 = [(SWURLInteraction *)v10 initWithURL:v9 navigationManager:v11];
  }
  else
  {
    v12 = [[SWInteraction alloc] initWithType:0];
  }

LABEL_11:
  return v12;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
}

@end