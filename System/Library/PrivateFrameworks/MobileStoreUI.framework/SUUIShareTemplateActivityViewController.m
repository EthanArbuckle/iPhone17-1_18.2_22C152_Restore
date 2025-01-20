@interface SUUIShareTemplateActivityViewController
- (SUUIShareTemplateActivityViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)_activityItemsWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)_applicationActivitiesWithTemplateElement:(id)a3 clientContext:(id)a4;
- (id)_titleForActivity:(id)a3;
@end

@implementation SUUIShareTemplateActivityViewController

- (SUUIShareTemplateActivityViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  v19[6] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [(SUUIShareTemplateActivityViewController *)self _activityItemsWithTemplateElement:v7 clientContext:v8];
  v10 = [(SUUIShareTemplateActivityViewController *)self _applicationActivitiesWithTemplateElement:v7 clientContext:v8];
  v18.receiver = self;
  v18.super_class = (Class)SUUIShareTemplateActivityViewController;
  v11 = [(SUUIShareTemplateActivityViewController *)&v18 initWithActivityItems:v9 applicationActivities:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientContext, a4);
    objc_storeStrong((id *)&v12->_templateElement, a3);
    uint64_t v13 = *MEMORY[0x263F1CFA8];
    v19[0] = *MEMORY[0x263F1CF98];
    v19[1] = v13;
    uint64_t v14 = *MEMORY[0x263F1CFF8];
    v19[2] = *MEMORY[0x263F1CFE0];
    v19[3] = v14;
    uint64_t v15 = *MEMORY[0x263F1D010];
    v19[4] = *MEMORY[0x263F1D008];
    v19[5] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:6];
    [(SUUIShareTemplateActivityViewController *)v12 setExcludedActivityTypes:v16];
  }
  return v12;
}

- (id)_titleForActivity:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x263F1CFB0] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"ACTIVITY_COPY_LINK"];
    }
    else {
    v5 = +[SUUIClientContext localizedStringForKey:@"ACTIVITY_COPY_LINK" inBundles:0];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsWithTemplateElement:(id)a3 clientContext:(id)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SUUIShareTemplateImageItemProvider alloc] initWithTemplateElement:v6];
  id v8 = [[SUUIShareTemplateTextItemProvider alloc] initWithTemplateElement:v6 clientContext:v5];

  v9 = [[SUUIShareTemplateURLItemProvider alloc] initWithTemplateElement:v6];
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v7;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  return v10;
}

- (id)_applicationActivitiesWithTemplateElement:(id)a3 clientContext:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  v16[0] = @"wishlist";
  id v8 = @"gift";
  uint64_t v9 = 0;
  v16[1] = v8;
  char v10 = 1;
  do
  {
    char v11 = v10;
    v12 = [v5 activityForShareSheetActivityType:v16[v9]];
    if (v12)
    {
      uint64_t v13 = [[SUUIShareTemplateActivity alloc] initWithActivityViewElement:v12 clientContext:v6];
      [v7 addObject:v13];
    }
    char v10 = 0;
    uint64_t v9 = 1;
  }
  while ((v11 & 1) != 0);
  for (uint64_t i = 1; i != -1; --i)

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end