@interface BKHIDUISensorServiceMatchingWrapper
- (BKHIDUISensorServiceMatchingWrapper)init;
- (BKHIDUISensorServiceMatchingWrapper)initWithMatchingDictionary:(id)a3 instantiateWrapperUsingBlock:(id)a4;
- (BKIOHIDServiceMatcher)serviceMatcher;
- (BOOL)supportsProximityLPAEventTransitions;
- (id)instantiateWrapperBlock;
- (void)_lock_applyUIMode:(id)a3 toWrappers:(id)a4;
- (void)applyUIMode:(id)a3;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)proximityDidUnoccludeAfterScreenWake;
- (void)resetCalibration;
- (void)serviceDidDisappear:(id)a3;
- (void)setInstantiateWrapperBlock:(id)a3;
- (void)setServiceMatcher:(id)a3;
- (void)updateCharacteristics:(id)a3;
@end

@implementation BKHIDUISensorServiceMatchingWrapper

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000656C;
  v13[3] = &unk_1000F8230;
  v13[4] = self;
  v7 = [v6 bs_map:v13];

  lock_serviceWrappers = self->_lock_serviceWrappers;
  if (lock_serviceWrappers)
  {
    v9 = [(NSArray *)lock_serviceWrappers arrayByAddingObjectsFromArray:v7];
  }
  else
  {
    v9 = v7;
  }
  v10 = self->_lock_serviceWrappers;
  self->_lock_serviceWrappers = v9;

  id v11 = [(BKSHIDUISensorMode *)self->_lock_activeMode copy];
  id v12 = [(NSArray *)self->_lock_serviceWrappers copy];
  if (v11) {
    [(BKHIDUISensorServiceMatchingWrapper *)self _lock_applyUIMode:v11 toWrappers:v12];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSArray *)self->_lock_serviceWrappers mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  id v6 = self->_lock_serviceWrappers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [v11 service:lock];
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          v14 = BKLogUISensor();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v11;
            __int16 v25 = 2114;
            id v26 = v4;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "removed %{public}@ for service:%{public}@", buf, 0x16u);
          }

          [v5 removeObject:v11];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v8);
  }

  v15 = (NSArray *)[v5 copy];
  lock_serviceWrappers = v18->_lock_serviceWrappers;
  v18->_lock_serviceWrappers = v15;

  os_unfair_lock_unlock(lock);
}

- (void)_lock_applyUIMode:(id)a3 toWrappers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) applyUIMode:v6 (void)v13];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_instantiateWrapperBlock, 0);
  objc_storeStrong((id *)&self->_serviceMatcher, 0);
  objc_storeStrong((id *)&self->_lock_activeMode, 0);

  objc_storeStrong((id *)&self->_lock_serviceWrappers, 0);
}

- (void)setInstantiateWrapperBlock:(id)a3
{
}

- (id)instantiateWrapperBlock
{
  return self->_instantiateWrapperBlock;
}

- (void)setServiceMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)serviceMatcher
{
  return self->_serviceMatcher;
}

- (BOOL)supportsProximityLPAEventTransitions
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_lock_serviceWrappers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "supportsProximityLPAEventTransitions", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

- (void)updateCharacteristics:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_lock_serviceWrappers;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) updateCharacteristics:v4, (void)v11];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)applyUIMode:(id)a3
{
  id v4 = (BKSHIDUISensorMode *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_activeMode = self->_lock_activeMode;
  self->_lock_activeMode = v4;
  uint64_t v6 = v4;

  [(BKHIDUISensorServiceMatchingWrapper *)self _lock_applyUIMode:v6 toWrappers:self->_lock_serviceWrappers];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)proximityDidUnoccludeAfterScreenWake
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_lock_serviceWrappers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) proximityDidUnoccludeAfterScreenWake:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)resetCalibration
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_lock_serviceWrappers;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) resetCalibration:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BKHIDUISensorServiceMatchingWrapper)initWithMatchingDictionary:(id)a3 instantiateWrapperUsingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKHIDUISensorServiceMatchingWrapper;
  id v8 = [(BKHIDUISensorServiceMatchingWrapper *)&v17 init];
  long long v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    id v10 = [v7 copy];
    instantiateWrapperBos_unfair_lock_t lock = v9->_instantiateWrapperBlock;
    v9->_instantiateWrapperBos_unfair_lock_t lock = v10;

    id v12 = objc_alloc((Class)BKIOHIDServiceMatcher);
    long long v13 = +[BKHIDSystemInterface sharedInstance];
    long long v14 = (BKIOHIDServiceMatcher *)[v12 initWithMatchingDictionary:v6 dataProvider:v13];
    serviceMatcher = v9->_serviceMatcher;
    v9->_serviceMatcher = v14;

    [(BKIOHIDServiceMatcher *)v9->_serviceMatcher startObserving:v9 queue:&_dispatch_main_q];
  }

  return v9;
}

- (BKHIDUISensorServiceMatchingWrapper)init
{
  id v4 = +[NSString stringWithFormat:@"nope"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    long long v14 = self;
    __int16 v15 = 2114;
    CFStringRef v16 = @"BKHIDUISensorServiceMatchingWrapper.m";
    __int16 v17 = 1024;
    int v18 = 37;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKHIDUISensorServiceMatchingWrapper *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end