@interface UISplitViewController(PXProgrammaticNavigation)
- (id)_participantForDestination:()PXProgrammaticNavigation routingOptions:;
- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation;
- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation;
- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:;
@end

@implementation UISplitViewController(PXProgrammaticNavigation)

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v23 = 0;
  v11 = [a1 _participantForDestination:v9 routingOptions:&v23];
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"UIViewController+PXProgrammaticNavigation.m", 430, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  uint64_t v12 = v23;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__UISplitViewController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v17[3] = &unk_1E5DC7190;
  v17[4] = a1;
  id v18 = v11;
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  objc_msgSend(a1, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", a1, v12, a4, v17);
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4 = a3;
  v5 = [a1 _participantForDestination:v4 routingOptions:0];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 nextExistingParticipantOnRouteToDestination:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation
{
  uint64_t v6 = 0;
  v3 = [a1 _participantForDestination:a3 routingOptions:&v6];
  if (v3) {
    uint64_t v4 = v6;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_participantForDestination:()PXProgrammaticNavigation routingOptions:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = [v12 routingOptionsForDestination:v6];
        if (v13)
        {
          uint64_t v15 = v13;
          id v14 = v12;

          if (a4 && v14) {
            *a4 = v15;
          }
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_13:

  return v14;
}

@end