@interface NIServerClientPublisher
+ (id)publisherForClient:(id)a3;
- (NIServerClientPublisher)initWithClient:(id)a3;
- (void)addObservers:(id)a3;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)relayDCKMessage:(id)a3;
- (void)removeObservers:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NIServerClientPublisher

- (NIServerClientPublisher)initWithClient:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NIServerClientPublisher.mm", 18, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerClientPublisher;
  v7 = [(NIServerClientPublisher *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_client, a3);
    uint64_t v9 = objc_opt_new();
    observers = v8->_observers;
    v8->_observers = (NSMutableSet *)v9;
  }
  return v8;
}

+ (id)publisherForClient:(id)a3
{
  id v3 = a3;
  v4 = [[NIServerClientPublisher alloc] initWithClient:v3];

  return v4;
}

- (void)addObservers:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSMutableSet *)self->_observers addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObservers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableSet removeObject:](self->_observers, "removeObject:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client didDiscoverNearbyObject:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didDiscoverNearbyObject:v4 (void)v10];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  [(NIServerClient *)self->_client didRemoveNearbyObjects:v6 withReason:a4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) didRemoveNearbyObjects:v6 withReason:a4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  -[NIServerClient didUpdateHealthStatus:](self->_client, "didUpdateHealthStatus:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didUpdateHealthStatus:a3, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NIServerClient *)self->_client didGenerateShareableConfigurationData:v6 forObject:v7];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = self->_observers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didGenerateShareableConfigurationData:v6 forObject:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client didUpdateLocalDiscoveryToken:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didUpdateLocalDiscoveryToken:v4 (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(NIServerClient *)self->_client didReceiveRangingAuthRecommendation:v4 forObject:v6];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) didReceiveRangingAuthRecommendation:v4 forObject:v6];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client didUpdateNearbyObjects:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didUpdateNearbyObjects:v4, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NIServerClient *)self->_client object:v8 didUpdateRegion:v9 previousRegion:v10];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v12 = self->_observers;
  id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) object:v8 didUpdateRegion:v9 previousRegion:v10];
        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateMotionState:(int64_t)a3
{
  -[NIServerClient didUpdateMotionState:](self->_client, "didUpdateMotionState:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didUpdateMotionState:a3, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)relayDCKMessage:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client relayDCKMessage:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) relayDCKMessage:v4 v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client uwbSessionDidFailWithError:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) uwbSessionDidFailWithError:v4 (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client uwbSessionDidInvalidateWithError:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) uwbSessionDidInvalidateWithError:v4, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  -[NIServerClient uwbSessionInterruptedWithReason:timestamp:](self->_client, "uwbSessionInterruptedWithReason:timestamp:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) uwbSessionInterruptedWithReason:a3 timestamp:a4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  -[NIServerClient uwbSessionInterruptionReasonEnded:timestamp:](self->_client, "uwbSessionInterruptionReasonEnded:timestamp:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) uwbSessionInterruptionReasonEnded:a3 timestamp:a4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NIServerClient *)self->_client didUpdateAlgorithmState:v6 forObject:v7];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = self->_observers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didUpdateAlgorithmState:v6 forObject:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  -[NIServerClient didUpdateHomeDeviceUWBRangingAvailability:](self->_client, "didUpdateHomeDeviceUWBRangingAvailability:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didUpdateHomeDeviceUWBRangingAvailability:v3 (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NIServerClient *)self->_client didProcessAcwgM1MsgWithResponse:v6 error:v7];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = self->_observers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didProcessAcwgM1MsgWithResponse:v6 error:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NIServerClient *)self->_client didProcessAcwgM3MsgWithResponse:v6 error:v7];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = self->_observers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didProcessAcwgM3MsgWithResponse:v6 error:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NIServerClient *)self->_client didProcessAcwgRangingSessionResumeRequestMsgWithResponse:v6 error:v7];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = self->_observers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) didProcessAcwgRangingSessionResumeRequestMsgWithResponse:v6 error:v7];
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  -[NIServerClient requestAcwgRangingSessionSuspend:withSuspendTriggerReason:](self->_client, "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) requestAcwgRangingSessionSuspend:v5 withSuspendTriggerReason:a4];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  -[NIServerClient didStartAcwgRanging:](self->_client, "didStartAcwgRanging:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didStartAcwgRanging:a3, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  -[NIServerClient didSuspendAcwgRanging:](self->_client, "didSuspendAcwgRanging:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) didSuspendAcwgRanging:a3, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(NIServerClient *)self->_client didPrefetchAcwgUrsk:v4 error:v6];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) didPrefetchAcwgUrsk:v4 error:v6];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateState:(id)a3
{
  id v4 = a3;
  [(NIServerClient *)self->_client systemDidUpdateState:v4];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) systemDidUpdateState:v4, (void)v10];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(NIServerClient *)self->_client systemDidUpdateResourceUsageLimitExceeded:v4 forSessionConfigurationTypeWithName:v6];
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = self->_observers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) systemDidUpdateResourceUsageLimitExceeded:v4 forSessionConfigurationTypeWithName:v6];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end