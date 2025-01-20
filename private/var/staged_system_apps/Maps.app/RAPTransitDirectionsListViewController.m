@interface RAPTransitDirectionsListViewController
+ (Class)dataSourceClass;
- (BOOL)RAPTransitDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5;
- (BOOL)_shouldReloadForReferenceDateUpdates;
- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate;
- (RAPTransitDirectionsListViewController)init;
- (void)_prepareForUpdatedRoute;
- (void)setInstructionDelegate:(id)a3;
@end

@implementation RAPTransitDirectionsListViewController

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (RAPTransitDirectionsListViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAPTransitDirectionsListViewController;
  v2 = [(TransitDirectionsListViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(TransitDirectionsListViewController *)v2 dataSource];
    [v4 setOptions:0];
    [v4 setRapDelegate:v3];
  }
  return v3;
}

- (void)_prepareForUpdatedRoute
{
  v29.receiver = self;
  v29.super_class = (Class)RAPTransitDirectionsListViewController;
  [(TransitDirectionsListViewController *)&v29 _prepareForUpdatedRoute];
  v3 = [(TransitDirectionsListViewController *)self dataSource];
  v4 = [v3 _transitDirectionsListItems];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = [v9 footerItems];
        id v11 = [v10 count];

        if (v11)
        {
          v12 = [v9 footerItems];
          id v13 = [v12 mutableCopy];

          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          v14 = [v9 footerItems];
          id v15 = [v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
                if ([v19 type] == (id)13 || objc_msgSend(v19, "type") == (id)7) {
                  [v13 removeObject:v19];
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v21 objects:v30 count:16];
            }
            while (v16);
          }

          [v9 setFooterItems:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldReloadForReferenceDateUpdates
{
  return 0;
}

- (BOOL)RAPTransitDirectionsStepsList:(id)a3 shouldShowFlagForStep:(id)a4 listItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(RAPTransitDirectionsListViewController *)self instructionDelegate];
  LOBYTE(self) = [v9 viewController:self shouldShowFlagForStep:v8 listItem:v7];

  return (char)self;
}

- (RAPDirectionsStepsTableViewControllerDelegate)instructionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instructionDelegate);

  return (RAPDirectionsStepsTableViewControllerDelegate *)WeakRetained;
}

- (void)setInstructionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end