@interface TCCDEventSubscriber
- (TCCDEventSubscriber)initWithToken:(unint64_t)a3 filter:(id)a4 fromPublisher:(id)a5;
- (id)description;
- (unint64_t)token;
- (void)_addPendingEvent:(id)a3;
- (void)_checkEntitlement;
- (void)_publishPendingEvents;
- (void)_sendEvent:(id)a3;
- (void)publish:(id)a3;
@end

@implementation TCCDEventSubscriber

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_state - 1;
  if (v4 > 2) {
    v5 = "Initial";
  }
  else {
    v5 = off_100096948[v4];
  }
  return +[NSString stringWithFormat:@"<%@: token=%llu, state=%s, csid=%@>", v3, self->_token, v5, self->_codeSigningIdentity];
}

- (TCCDEventSubscriber)initWithToken:(unint64_t)a3 filter:(id)a4 fromPublisher:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TCCDEventSubscriber;
  v11 = [(TCCDEventSubscriber *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_token = a3;
    objc_storeStrong((id *)&v11->_filter, a4);
    objc_storeWeak((id *)&v12->_publisher, v10);
    v12->_lock._os_unfair_lock_opaque = 0;
    v12->_state = 0;
    uint64_t v13 = +[NSMutableArray array];
    pendingEvents = v12->_pendingEvents;
    v12->_pendingEvents = (NSMutableArray *)v13;

    codeSigningIdentity = v12->_codeSigningIdentity;
    v12->_codeSigningIdentity = 0;
  }
  return v12;
}

- (void)_checkEntitlement
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_state = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publisher);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100054E30;
  v5[3] = &unk_100096928;
  v5[4] = self;
  [WeakRetained checkEntitlementForSubscriber:self completionHandler:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_addPendingEvent:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_pendingEvents addObject:v4];
  if ((unint64_t)[(NSMutableArray *)self->_pendingEvents count] >= 0x21)
  {
    [(NSMutableArray *)self->_pendingEvents removeObjectAtIndex:0];
    v5 = tcc_events_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100055350((uint64_t)self, v5);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_publishPendingEvents
{
  os_unfair_lock_assert_owner(&self->_lock);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_pendingEvents;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TCCDEventSubscriber publish:](self, "publish:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pendingEvents removeAllObjects];
}

- (void)_sendEvent:(id)a3
{
  p_publisher = &self->_publisher;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_publisher);
  [WeakRetained sendEvent:v5 toSubscriber:self];
}

- (void)publish:(id)a3
{
  id v5 = a3;
  if ([(TCCDEventFilter *)self->_filter matches:v5])
  {
    int64_t state = self->_state;
    switch(state)
    {
      case 2:
        [(TCCDEventSubscriber *)self _sendEvent:v5];
        break;
      case 1:
        [(TCCDEventSubscriber *)self _addPendingEvent:v5];
        break;
      case 0:
        [(TCCDEventSubscriber *)self _addPendingEvent:v5];
        [(TCCDEventSubscriber *)self _checkEntitlement];
        break;
    }
  }
  _objc_release_x1();
}

- (unint64_t)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSigningIdentity, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_destroyWeak((id *)&self->_publisher);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end