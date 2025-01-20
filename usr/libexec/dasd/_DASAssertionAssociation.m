@interface _DASAssertionAssociation
- (NSMutableSet)assertions;
- (OS_os_log)log;
- (_DASActivity)activity;
- (_DASAssertionAssociation)initWithActivity:(id)a3;
- (_DASAssertionAssociation)initWithActivity:(id)a3 assertion:(id)a4;
- (_DASAssertionAssociation)initWithActivity:(id)a3 assertions:(id)a4;
- (id)anyAssertion;
- (unint64_t)hash;
- (void)acquireAssertions;
- (void)invalidateAssertions;
- (void)setActivity:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setLog:(id)a3;
- (void)trackAssertion:(id)a3;
@end

@implementation _DASAssertionAssociation

- (_DASAssertionAssociation)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  v6 = [(_DASAssertionAssociation *)self initWithActivity:v4 assertions:v5];

  return v6;
}

- (_DASAssertionAssociation)initWithActivity:(id)a3 assertion:(id)a4
{
  id v6 = a3;
  v7 = +[NSMutableSet setWithObject:a4];
  v8 = [(_DASAssertionAssociation *)self initWithActivity:v6 assertions:v7];

  return v8;
}

- (_DASAssertionAssociation)initWithActivity:(id)a3 assertions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_DASAssertionAssociation;
  v8 = [(_DASAssertionAssociation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_activity, v6);
    v10 = (NSMutableSet *)[v7 mutableCopy];
    assertions = v9->_assertions;
    v9->_assertions = v10;

    os_log_t v12 = os_log_create("com.apple.duetactivityscheduler", "AssertionAssociation");
    log = v9->_log;
    v9->_log = (OS_os_log *)v12;
  }
  return v9;
}

- (void)trackAssertion:(id)a3
{
  id v5 = a3;
  id v4 = [(_DASAssertionAssociation *)self assertions];
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_assertions addObject:v5];
  objc_sync_exit(v4);
}

- (void)acquireAssertions
{
  id obj = [(_DASAssertionAssociation *)self assertions];
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = self->_assertions;
  uint64_t v4 = 0;
  id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        unsigned __int8 v9 = [v8 acquireWithError:&v20];
        id v10 = v20;
        if (v10) {
          unsigned __int8 v11 = 0;
        }
        else {
          unsigned __int8 v11 = v9;
        }
        if (v11)
        {
          ++v4;
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            v13 = log;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
            *(_DWORD *)buf = 138412802;
            v26 = v8;
            __int16 v27 = 2112;
            id v28 = WeakRetained;
            __int16 v29 = 2112;
            id v30 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to acquire %@ for %@ with error: %@; skipping",
              buf,
              0x20u);
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v5);
  }

  objc_super v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = +[NSNumber numberWithUnsignedInteger:v4];
    v17 = +[NSNumber numberWithUnsignedInteger:[(NSMutableSet *)self->_assertions count]];
    id v18 = objc_loadWeakRetained((id *)&self->_activity);
    *(_DWORD *)buf = 138412802;
    v26 = v16;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEBUG, "Acquired %@/%@ assertions for %@", buf, 0x20u);
  }
  objc_sync_exit(obj);
}

- (void)invalidateAssertions
{
  id obj = [(_DASAssertionAssociation *)self assertions];
  objc_sync_enter(obj);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = self->_assertions;
  uint64_t v4 = 0;
  id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        unsigned __int8 v9 = [v8 invalidateWithError:&v20];
        id v10 = v20;
        if (v10) {
          unsigned __int8 v11 = 0;
        }
        else {
          unsigned __int8 v11 = v9;
        }
        if (v11)
        {
          ++v4;
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            v13 = log;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
            *(_DWORD *)buf = 138412802;
            v26 = v8;
            __int16 v27 = 2112;
            id v28 = WeakRetained;
            __int16 v29 = 2112;
            id v30 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to invalidate %@ for %@ with error: %@; skipping",
              buf,
              0x20u);
          }
        }
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v5);
  }

  objc_super v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = +[NSNumber numberWithUnsignedInteger:v4];
    v17 = +[NSNumber numberWithUnsignedInteger:[(NSMutableSet *)self->_assertions count]];
    id v18 = objc_loadWeakRetained((id *)&self->_activity);
    *(_DWORD *)buf = 138412802;
    v26 = v16;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEBUG, "Invalidated %@/%@ assertions for %@", buf, 0x20u);
  }
  objc_sync_exit(obj);
}

- (id)anyAssertion
{
  v3 = [(_DASAssertionAssociation *)self assertions];
  objc_sync_enter(v3);
  uint64_t v4 = [(_DASAssertionAssociation *)self assertions];
  id v5 = [v4 anyObject];

  objc_sync_exit(v3);

  return v5;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);
  v3 = [WeakRetained uuid];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (_DASActivity)activity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activity);

  return (_DASActivity *)WeakRetained;
}

- (void)setActivity:(id)a3
{
}

- (NSMutableSet)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_destroyWeak((id *)&self->_activity);
}

@end