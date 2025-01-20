@interface REActivityTracker
- (BOOL)trackingObject:(id)a3;
- (NSSet)outstandingActivities;
- (REActivityTracker)initWithDelegate:(id)a3;
- (REActivityTrackerDelegate)delegate;
- (id)outstandingActivitiesForObject:(id)a3;
- (void)beginActivity:(id)a3 forObject:(id)a4;
- (void)endActivity:(id)a3 forObject:(id)a4;
- (void)trackObject:(id)a3;
- (void)withdrawObject:(id)a3;
@end

@implementation REActivityTracker

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  v13 = [(NSMapTable *)self->_activitiesByObject objectForKey:v6];
  if (v13)
  {
    char v14 = [(NSCountedSet *)self->_activities containsObject:v18];
    [(NSCountedSet *)self->_activities addObject:v18];
    char v15 = [v13 containsObject:v18];
    [v13 addObject:v18];
    if (v14 & 1) == 0 && (*(unsigned char *)&self->delegateCallbacks)
    {
      v16 = [(REActivityTracker *)self delegate];
      [v16 activityTracker:self didBeginActivity:v18];
    }
    if ((v15 & 1) == 0 && (*(unsigned char *)&self->delegateCallbacks & 4) != 0)
    {
      v17 = [(REActivityTracker *)self delegate];
      [v17 activityTracker:self didBeginActivity:v18 forObject:v6];
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is not being tracked by activity tracker %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
}

- (void)endActivity:(id)a3 forObject:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  v13 = [(NSMapTable *)self->_activitiesByObject objectForKey:v6];
  if (v13)
  {
    if ([(NSCountedSet *)self->_activities containsObject:v29])
    {
      if ([v13 containsObject:v29])
      {
        [(NSCountedSet *)self->_activities removeObject:v29];
        char v26 = [(NSCountedSet *)self->_activities containsObject:v29];
        [v13 removeObject:v29];
        if (([v13 containsObject:v29] & 1) == 0 && (*(unsigned char *)&self->delegateCallbacks & 8) != 0)
        {
          v27 = [(REActivityTracker *)self delegate];
          [v27 activityTracker:self didEndActivity:v29 forObject:v6];
        }
        if ((v26 & 1) == 0 && (*(unsigned char *)&self->delegateCallbacks & 2) != 0)
        {
          v28 = [(REActivityTracker *)self delegate];
          [v28 activityTracker:self didEndActivity:v29];
        }
      }
      else
      {
        RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is not being tracked for activity %@ by activity tracker %@", v20, v21, v22, v23, v24, v25, (uint64_t)v6);
      }
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Activity %@ is not being tracked by activity tracker %@", v14, v15, v16, v17, v18, v19, (uint64_t)v29);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is not being tracked by activity tracker %@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
}

- (REActivityTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (REActivityTrackerDelegate *)WeakRetained;
}

- (BOOL)trackingObject:(id)a3
{
  v3 = [(NSMapTable *)self->_activitiesByObject objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)trackObject:(id)a3
{
  id v13 = a3;
  BOOL v4 = -[NSMapTable objectForKey:](self->_activitiesByObject, "objectForKey:");

  if (v4)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is already being tracked by activity tracker %@", v5, v6, v7, v8, v9, v10, (uint64_t)v13);
  }
  else
  {
    activitiesByObject = self->_activitiesByObject;
    uint64_t v12 = [MEMORY[0x263F08760] set];
    [(NSMapTable *)activitiesByObject setObject:v12 forKey:v13];
  }
}

- (REActivityTracker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REActivityTracker;
  uint64_t v5 = [(REActivityTracker *)&v15 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    *(unsigned char *)&v6->delegateCallbacks = *(unsigned char *)&v6->delegateCallbacks & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&v6->delegateCallbacks = *(unsigned char *)&v6->delegateCallbacks & 0xFD | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&v6->delegateCallbacks = *(unsigned char *)&v6->delegateCallbacks & 0xFB | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 8;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&v6->delegateCallbacks = *(unsigned char *)&v6->delegateCallbacks & 0xF7 | v9;
    uint64_t v10 = [MEMORY[0x263F08760] set];
    activities = v6->_activities;
    v6->_activities = (NSCountedSet *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:16];
    activitiesByObject = v6->_activitiesByObject;
    v6->_activitiesByObject = (NSMapTable *)v12;
  }
  return v6;
}

- (void)withdrawObject:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_activitiesByObject objectForKey:v4];

  if (v5)
  {
    uint64_t v12 = [(NSMapTable *)self->_activitiesByObject objectForKey:v4];
    if ([v12 count])
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is still being tracked by activity tracker %@", v13, v14, v15, v16, v17, v18, (uint64_t)v4);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v19 = v12;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v25 = [v19 countForObject:v24];
            if (v25)
            {
              uint64_t v26 = v25;
              do
              {
                [(REActivityTracker *)self endActivity:v24 forObject:v4];
                --v26;
              }
              while (v26);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v21);
      }
    }
    [(NSMapTable *)self->_activitiesByObject removeObjectForKey:v4];
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is not being tracked by activity tracker %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
}

- (NSSet)outstandingActivities
{
  v2 = (void *)[(NSCountedSet *)self->_activities copy];
  return (NSSet *)v2;
}

- (id)outstandingActivitiesForObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_activitiesByObject objectForKey:v4];
  uint64_t v12 = v5;
  if (v5)
  {
    uint64_t v13 = [v5 copy];
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Object %@ is not being tracked by activity tracker %@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
    uint64_t v13 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitiesByObject, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end