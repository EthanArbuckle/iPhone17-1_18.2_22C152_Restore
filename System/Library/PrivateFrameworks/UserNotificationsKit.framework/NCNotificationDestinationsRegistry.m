@interface NCNotificationDestinationsRegistry
- (BOOL)hasActiveDestinationsForRequest:(id)a3;
- (BOOL)isRegisteredDestination:(id)a3;
- (NCNotificationDestinationsRegistry)init;
- (NSArray)registeredDestinations;
- (NSMutableDictionary)activeDestinations;
- (NSMutableDictionary)destinations;
- (NSMutableDictionary)readyDestinations;
- (id)_destinationsForRequestDestinations:(id)a3 inDestinationDict:(id)a4;
- (id)destinationIdentifiersForRequestDestinations:(id)a3;
- (id)destinationsForRequestDestinations:(id)a3;
- (id)readyDestinationsForRequestDestinations:(id)a3;
- (unint64_t)count;
- (void)registerDestination:(id)a3;
- (void)registerDestination:(id)a3 forIdentifier:(id)a4;
- (void)setActiveDestinations:(id)a3;
- (void)setDestination:(id)a3 enabled:(BOOL)a4;
- (void)setDestination:(id)a3 ready:(BOOL)a4;
- (void)setDestinationWithIdentifier:(id)a3 enabled:(BOOL)a4;
- (void)setDestinations:(id)a3;
- (void)setReadyDestinations:(id)a3;
- (void)unregisterDestination:(id)a3;
- (void)unregisterDestinationForIdentifier:(id)a3;
@end

@implementation NCNotificationDestinationsRegistry

- (NSArray)registeredDestinations
{
  v2 = [(NCNotificationDestinationsRegistry *)self destinations];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSMutableDictionary)destinations
{
  return self->_destinations;
}

- (NCNotificationDestinationsRegistry)init
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationDestinationsRegistry;
  v2 = [(NCNotificationDestinationsRegistry *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    destinations = v2->_destinations;
    v2->_destinations = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    activeDestinations = v2->_activeDestinations;
    v2->_activeDestinations = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    readyDestinations = v2->_readyDestinations;
    v2->_readyDestinations = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)registerDestination:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  [(NCNotificationDestinationsRegistry *)self registerDestination:v4 forIdentifier:v5];
}

- (void)registerDestination:(id)a3 forIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NCNotificationDestinationsRegistry *)self destinations];
  v9 = [v8 objectForKey:v7];

  if (v9)
  {
    if (([v9 isEqual:v6] & 1) == 0)
    {
      objc_super v10 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        int v21 = 138543874;
        v22 = v13;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_22012C000, v11, OS_LOG_TYPE_DEFAULT, "Replacing destination %{public}@ for identifier %{public}@ with destination %{public}@", (uint8_t *)&v21, 0x20u);
      }
      v16 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
      v17 = [v6 identifier];
      [v16 removeObjectForKey:v17];
      goto LABEL_8;
    }
  }
  else
  {
    v18 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v18;
      v19 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v19);
      int v21 = 138543618;
      v22 = v17;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl(&dword_22012C000, v16, OS_LOG_TYPE_DEFAULT, "Registering destination %{public}@ for identifier %{public}@", (uint8_t *)&v21, 0x16u);
LABEL_8:
    }
  }
  v20 = [(NCNotificationDestinationsRegistry *)self destinations];
  [v20 setObject:v6 forKey:v7];
}

- (BOOL)isRegisteredDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationDestinationsRegistry *)self destinations];
  id v6 = [v5 allValues];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (void)unregisterDestination:(id)a3
{
  id v4 = [a3 identifier];
  [(NCNotificationDestinationsRegistry *)self unregisterDestinationForIdentifier:v4];
}

- (void)unregisterDestinationForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NCNotificationDestinationsRegistry *)self destinations];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    char v7 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      objc_super v10 = NSStringFromClass(v9);
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl(&dword_22012C000, v8, OS_LOG_TYPE_DEFAULT, "Unregistering destination %{public}@ for identifier %{public}@", (uint8_t *)&v14, 0x16u);
    }
    v11 = [(NCNotificationDestinationsRegistry *)self readyDestinations];
    [v11 removeObjectForKey:v4];

    v12 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
    [v12 removeObjectForKey:v4];

    v13 = [(NCNotificationDestinationsRegistry *)self destinations];
    [v13 removeObjectForKey:v4];
  }
}

- (BOOL)hasActiveDestinationsForRequest:(id)a3
{
  id v4 = [a3 requestDestinations];
  id v5 = [(NCNotificationDestinationsRegistry *)self destinationsForRequestDestinations:v4];

  LOBYTE(v4) = [v5 count] != 0;
  return (char)v4;
}

- (id)destinationIdentifiersForRequestDestinations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v6, "objectForKey:", v12, (void)v15);
        if (v13) {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)destinationsForRequestDestinations:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
  id v6 = [(NCNotificationDestinationsRegistry *)self _destinationsForRequestDestinations:v4 inDestinationDict:v5];

  return v6;
}

- (void)setDestination:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 identifier];
  uint64_t v8 = [(NCNotificationDestinationsRegistry *)self destinations];
  uint64_t v9 = [v8 objectForKey:v7];

  if (([v9 isEqual:v6] & 1) == 0)
  {
    uint64_t v10 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
    {
      if (v4) {
        v11 = "enable";
      }
      else {
        v11 = "disable";
      }
      uint64_t v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      long long v15 = (objc_class *)objc_opt_class();
      long long v16 = NSStringFromClass(v15);
      int v17 = 136446978;
      long long v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      v22 = v16;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_error_impl(&dword_22012C000, v12, OS_LOG_TYPE_ERROR, "Tried to %{public}s destination %{public}@ but %{public}@ is registered for identifier %{public}@", (uint8_t *)&v17, 0x2Au);
    }
  }
  [(NCNotificationDestinationsRegistry *)self setDestinationWithIdentifier:v7 enabled:v4];
}

- (void)setDestinationWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(NCNotificationDestinationsRegistry *)self destinations];
  uint64_t v8 = [v7 objectForKey:v6];

  uint64_t v9 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
  uint64_t v10 = [v9 objectForKey:v6];

  if (v10 || !v4)
  {
    if (v10)
    {
      if (!v4)
      {
        int v17 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
        [v17 removeObjectForKey:v6];

        long long v18 = (void *)NCUILogDispatch;
        if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v18;
          __int16 v19 = (objc_class *)objc_opt_class();
          long long v15 = NSStringFromClass(v19);
          int v20 = 138543362;
          __int16 v21 = v15;
          long long v16 = "Disabled destination %{public}@";
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    v11 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
    [v11 setObject:v8 forKey:v6];

    uint64_t v12 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      int v14 = (objc_class *)objc_opt_class();
      long long v15 = NSStringFromClass(v14);
      int v20 = 138543362;
      __int16 v21 = v15;
      long long v16 = "Enabled destination %{public}@";
LABEL_9:
      _os_log_impl(&dword_22012C000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);
    }
  }
}

- (unint64_t)count
{
  v2 = [(NCNotificationDestinationsRegistry *)self destinations];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setDestination:(id)a3 ready:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 identifier];
  uint64_t v8 = [(NCNotificationDestinationsRegistry *)self destinations];
  uint64_t v9 = [v8 objectForKey:v7];

  if (([v9 isEqual:v6] & 1) == 0)
  {
    uint64_t v10 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
    {
      if (v4) {
        id v24 = "set ready";
      }
      else {
        id v24 = "set not ready";
      }
      uint64_t v25 = v10;
      v26 = (objc_class *)objc_opt_class();
      uint64_t v27 = NSStringFromClass(v26);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      int v30 = 136446978;
      v31 = v24;
      __int16 v32 = 2114;
      v33 = v27;
      __int16 v34 = 2114;
      v35 = v29;
      __int16 v36 = 2114;
      v37 = v7;
      _os_log_error_impl(&dword_22012C000, v25, OS_LOG_TYPE_ERROR, "Tried to %{public}s for destination %{public}@ but %{public}@ is registered for identifier %{public}@", (uint8_t *)&v30, 0x2Au);
    }
  }
  v11 = [(NCNotificationDestinationsRegistry *)self activeDestinations];
  uint64_t v12 = [v11 objectForKey:v7];

  v13 = [(NCNotificationDestinationsRegistry *)self readyDestinations];
  int v14 = [v13 objectForKey:v7];

  if (!v14 && v4 && v12)
  {
    long long v15 = [(NCNotificationDestinationsRegistry *)self readyDestinations];
    [v15 setObject:v6 forKey:v7];

    long long v16 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = v16;
      long long v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
      int v30 = 138543362;
      v31 = v19;
      int v20 = "Destination %{public}@ set to ready";
LABEL_12:
      _os_log_impl(&dword_22012C000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v30, 0xCu);
    }
  }
  else if (v14)
  {
    if (!v4)
    {
      __int16 v21 = [(NCNotificationDestinationsRegistry *)self readyDestinations];
      [v21 removeObjectForKey:v7];

      uint64_t v22 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v22;
        __int16 v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
        int v30 = 138543362;
        v31 = v19;
        int v20 = "Destination %{public}@ set to not ready";
        goto LABEL_12;
      }
    }
  }
}

- (id)readyDestinationsForRequestDestinations:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationDestinationsRegistry *)self readyDestinations];
  id v6 = [(NCNotificationDestinationsRegistry *)self _destinationsForRequestDestinations:v4 inDestinationDict:v5];

  return v6;
}

- (id)_destinationsForRequestDestinations:(id)a3 inDestinationDict:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(v6, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)setDestinations:(id)a3
{
}

- (NSMutableDictionary)activeDestinations
{
  return self->_activeDestinations;
}

- (void)setActiveDestinations:(id)a3
{
}

- (NSMutableDictionary)readyDestinations
{
  return self->_readyDestinations;
}

- (void)setReadyDestinations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readyDestinations, 0);
  objc_storeStrong((id *)&self->_activeDestinations, 0);

  objc_storeStrong((id *)&self->_destinations, 0);
}

@end