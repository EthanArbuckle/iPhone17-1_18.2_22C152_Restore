@interface TURouteController
- (BOOL)areAuxiliaryRoutesAvailable;
- (NSArray)routes;
- (NSDictionary)routesByUniqueIdentifier;
- (NSHashTable)delegates;
- (OS_dispatch_queue)queue;
- (TURoute)pickedRoute;
- (TURoute)receiverRoute;
- (TURoute)speakerRoute;
- (TURouteController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4;
- (TURouteControllerActions)actionsDelegate;
- (id)routeWithSourceIdentifier:(id)a3;
- (void)addDelegate:(id)a3;
- (void)handleRoutesByUniqueIdentifierUpdated:(id)a3;
- (void)handleServerDisconnect;
- (void)handleServerReconnect;
- (void)pickRoute:(id)a3;
- (void)pickRouteWhenAvailableWithUniqueIdentifier:(id)a3;
- (void)pickRouteWithUniqueIdentifier:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)requeryRoutes;
- (void)setRoutesByUniqueIdentifier:(id)a3;
@end

@implementation TURouteController

- (TURouteController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TURouteController;
  v8 = [(TURouteController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_actionsDelegate, v6);
    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v9->_delegates;
    v9->_delegates = (NSHashTable *)v10;
  }
  return v9;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TURouteController *)self delegates];
  [v6 addObject:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (NSArray)routes
{
  v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TURouteController *)self routesByUniqueIdentifier];
  v5 = [v4 allValues];

  return (NSArray *)v5;
}

- (TURoute)pickedRoute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(TURouteController *)self routes];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isCurrentlyPicked])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (TURoute *)v5;
}

- (TURoute)receiverRoute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(TURouteController *)self routes];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isReceiver])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (TURoute *)v5;
}

- (TURoute)speakerRoute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(TURouteController *)self routes];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isSpeaker])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (TURoute *)v5;
}

- (BOOL)areAuxiliaryRoutesAvailable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(TURouteController *)self routes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isAuxiliary])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(TURouteController *)self delegates];
  [v6 removeObject:v4];
}

- (void)pickRoute:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to pick route: %@", (uint8_t *)&v8, 0xCu);
  }

  long long v7 = [v4 uniqueIdentifier];
  [(TURouteController *)self pickRouteWithUniqueIdentifier:v7];
}

- (void)pickRouteWithUniqueIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to pick route with unique identifier: %@", (uint8_t *)&v8, 0xCu);
  }

  long long v7 = [(TURouteController *)self actionsDelegate];
  [v7 pickRouteWithUniqueIdentifier:v4 shouldWaitUntilAvailable:0 forRouteController:self];
}

- (void)pickRouteWhenAvailableWithUniqueIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Asked to pick route when available with unique identifier: %@", (uint8_t *)&v8, 0xCu);
  }

  long long v7 = [(TURouteController *)self actionsDelegate];
  [v7 pickRouteWithUniqueIdentifier:v4 shouldWaitUntilAvailable:1 forRouteController:self];
}

- (void)requeryRoutes
{
  uint64_t v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(TURouteController *)self actionsDelegate];
  id v4 = [v5 routesByUniqueIdentifierForRouteController:self];
  [(TURouteController *)self handleRoutesByUniqueIdentifierUpdated:v4];
}

- (id)routeWithSourceIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(TURouteController *)self routes];
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 uniqueIdentifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSDictionary)routesByUniqueIdentifier
{
  uint64_t v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  routesByUniqueIdentifier = self->_routesByUniqueIdentifier;
  if (!routesByUniqueIdentifier)
  {
    id v5 = [(TURouteController *)self actionsDelegate];
    id v6 = [v5 routesByUniqueIdentifierForRouteController:self];
    id v7 = self->_routesByUniqueIdentifier;
    self->_routesByUniqueIdentifier = v6;

    routesByUniqueIdentifier = self->_routesByUniqueIdentifier;
  }

  return routesByUniqueIdentifier;
}

- (void)handleRoutesByUniqueIdentifierUpdated:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(NSDictionary *)self->_routesByUniqueIdentifier isEqualToDictionary:v4])
  {
    [(TURouteController *)self setRoutesByUniqueIdentifier:v4];
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(TURouteController *)self routesByUniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Updated routes to %@", buf, 0xCu);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [(TURouteController *)self delegates];
    id v9 = [v8 allObjects];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector()) {
            [v14 routesChangedForRouteController:self];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)handleServerReconnect
{
  uint64_t v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Handling server reconnect by requesting current route list", v5, 2u);
  }

  [(TURouteController *)self requeryRoutes];
}

- (void)handleServerDisconnect
{
  uint64_t v3 = [(TURouteController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Handling server disconnect by resetting routes to an empty list", v5, 2u);
  }

  [(TURouteController *)self handleRoutesByUniqueIdentifierUpdated:MEMORY[0x1E4F1CC08]];
}

- (TURouteControllerActions)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (TURouteControllerActions *)WeakRetained;
}

- (void)setRoutesByUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end