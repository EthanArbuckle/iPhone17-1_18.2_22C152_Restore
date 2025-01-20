@interface EPStaticServiceRegistry
- (EPStaticServiceRegistry)init;
- (EPStaticServiceRegistry)initWithQueue:(id)a3;
- (NSMutableDictionary)servicesByClass;
- (NSMutableDictionary)servicesByProtocol;
- (OS_dispatch_queue)queue;
- (id)instantiateServiceByClass:(Class)a3;
- (id)optionalServiceFromClass:(Class)a3;
- (id)optionalServiceFromProtocol:(id)a3;
- (id)serviceFromProtocol:(id)a3;
- (void)_removeService:(id)a3;
- (void)addService:(id)a3;
- (void)removeService:(id)a3;
- (void)setServicesByClass:(id)a3;
- (void)setServicesByProtocol:(id)a3;
@end

@implementation EPStaticServiceRegistry

- (EPStaticServiceRegistry)init
{
  v9.receiver = self;
  v9.super_class = (Class)EPStaticServiceRegistry;
  v2 = [(EPStaticServiceRegistry *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableDictionary dictionary];
    servicesByProtocol = v3->_servicesByProtocol;
    v3->_servicesByProtocol = (NSMutableDictionary *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    servicesByClass = v3->_servicesByClass;
    v3->_servicesByClass = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (EPStaticServiceRegistry)initWithQueue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(EPStaticServiceRegistry *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)optionalServiceFromClass:(Class)a3
{
  uint64_t v4 = +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:");
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_servicesByClass objectForKeyedSubscript:v4];
  if (!v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(NSMutableDictionary *)self->_servicesByClass allValues];
    id v7 = [v6 copy];

    id v5 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            id v5 = v10;
            [(NSMutableDictionary *)self->_servicesByClass setObject:v5 forKeyedSubscript:v4];
            goto LABEL_12;
          }
        }
        id v5 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)serviceFromProtocol:(id)a3
{
  return [(EPStaticServiceRegistry *)self optionalServiceFromProtocol:a3];
}

- (id)optionalServiceFromProtocol:(id)a3
{
  id v4 = a3;
  id v5 = +[NSValue valueWithNonretainedObject:v4];
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_servicesByProtocol objectForKeyedSubscript:v5];
  if (!v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(NSMutableDictionary *)self->_servicesByClass allValues];
    id v6 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 conformsToProtocol:v4])
          {
            id v6 = v10;
            [(NSMutableDictionary *)self->_servicesByProtocol setObject:v6 forKeyedSubscript:v5];
            goto LABEL_12;
          }
        }
        id v6 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void)addService:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      int v17 = 136315650;
      v18 = "-[EPStaticServiceRegistry addService:]";
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2048;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Request to add class %@[%p] to service registry", (uint8_t *)&v17, 0x20u);
    }
  }
  os_unfair_lock_lock(&self->_lock);
  v10 = +[NSValue valueWithNonretainedObject:objc_opt_class()];
  id v11 = [(NSMutableDictionary *)self->_servicesByClass objectForKeyedSubscript:v10];
  if (v11 != v4)
  {
    [(EPStaticServiceRegistry *)self _removeService:v11];
    long long v12 = sub_1000A3CF0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      long long v14 = sub_1000A3CF0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        int v17 = 138412546;
        v18 = v16;
        __int16 v19 = 2048;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding class %@[%p] to service registry", (uint8_t *)&v17, 0x16u);
      }
    }
    [(NSMutableDictionary *)self->_servicesByClass setObject:v4 forKeyedSubscript:v10];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeService:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(EPStaticServiceRegistry *)self _removeService:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_removeService:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000A3CF0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = sub_1000A3CF0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 136315650;
      v41 = "-[EPStaticServiceRegistry _removeService:]";
      __int16 v42 = 2112;
      id v43 = v9;
      __int16 v44 = 2048;
      id v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Request to remove class %@[%p] to service registry", buf, 0x20u);
    }
  }
  if (v4)
  {
    v10 = sub_1000A3CF0();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      long long v12 = sub_1000A3CF0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        long long v14 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v14;
        __int16 v42 = 2048;
        id v43 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing class %@[%p] from service registry", buf, 0x16u);
      }
    }
    id v15 = +[NSValue valueWithNonretainedObject:objc_opt_class()];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = [(NSMutableDictionary *)self->_servicesByClass copy];
    id v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        id v20 = 0;
        __int16 v21 = v15;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          id v15 = *(id *)(*((void *)&v34 + 1) + 8 * (void)v20);

          id v22 = [(NSMutableDictionary *)self->_servicesByClass objectForKeyedSubscript:v15];
          if (v22 == v4) {
            [(NSMutableDictionary *)self->_servicesByClass removeObjectForKey:v15];
          }

          id v20 = (char *)v20 + 1;
          __int16 v21 = v15;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v18);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = [(NSMutableDictionary *)self->_servicesByProtocol copy];
    id v24 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v29 = [(NSMutableDictionary *)self->_servicesByProtocol objectForKeyedSubscript:v28];
          if (v29 == v4) {
            [(NSMutableDictionary *)self->_servicesByProtocol removeObjectForKey:v28];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v25);
    }
  }
}

- (id)instantiateServiceByClass:(Class)a3
{
  if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___EPService]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [(objc_class *)a3 newService:self];
    [(EPStaticServiceRegistry *)self addService:v5];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)servicesByProtocol
{
  return self->_servicesByProtocol;
}

- (void)setServicesByProtocol:(id)a3
{
}

- (NSMutableDictionary)servicesByClass
{
  return self->_servicesByClass;
}

- (void)setServicesByClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicesByClass, 0);
  objc_storeStrong((id *)&self->_servicesByProtocol, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end