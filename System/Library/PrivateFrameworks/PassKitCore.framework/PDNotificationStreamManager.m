@interface PDNotificationStreamManager
- (PDNotificationStreamManager)init;
- (id)_notificationNameKeyForStream:(int64_t)a3;
- (id)_notificationStreamNameForStream:(int64_t)a3;
- (void)_queue_startObservingNotification:(id)a3 forStream:(int64_t)a4;
- (void)_queue_stopObservingNotification:(id)a3 forStream:(int64_t)a4;
- (void)_queue_updateEventStreamRegistration;
- (void)_queue_updateEventStreamRegistrationForStream:(int64_t)a3;
- (void)_scheduleEventStreamRegistrationUpdateWhileInternalQueue:(BOOL)a3;
- (void)_unregisterConsumer:(id)a3;
- (void)_updateConsumers:(id)a3 requiresRegistration:(BOOL)a4;
- (void)recalculateNotificationNames;
- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4;
- (void)registerConsumer:(id)a3;
- (void)start;
- (void)unregisterConsumer:(id)a3;
@end

@implementation PDNotificationStreamManager

- (void)receivedXPCEvent:(id)a3 forEventStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"com.apple.notifyd.matching"]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = [v6 isEqualToString:@"com.apple.distnoted.matching"];
  }
  v8 = [(PDNotificationStreamManager *)self _notificationNameKeyForStream:v7];
  v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, _xpc_event_key_name)];
  if (v8)
  {
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, (const char *)[v8 UTF8String]));
    if (v10)
    {
      v11 = v10;
      v34 = v8;
      if (![v9 length])
      {
        v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v49 = v6;
          __int16 v50 = 2112;
          v51 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDNotificationStreamManager (%{public}@): Resolved XPC wake to %@.", buf, 0x16u);
        }
      }
      id v35 = v6;
      id v36 = v5;
      os_unfair_lock_t lock = &self->_consumerLock;
      v33 = v9;
      os_unfair_lock_lock(&self->_consumerLock);
      v13 = [(NSHashTable *)self->_consumers allObjects];
      id v14 = objc_alloc_init((Class)NSMutableArray);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v15 = v13;
      id v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v43;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v43 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v21 = -[NSMapTable objectForKey:](self->_consumerRegistrationState, "objectForKey:", v20, lock);
            v22 = [v21 notificationNamesForStream:v7];

            if ([v22 containsObject:v11]) {
              [v14 addObject:v20];
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v17);
      }

      os_unfair_lock_unlock(lock);
      id v23 = [v14 count];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v24 = v14;
      id v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
      id v5 = v36;
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * (void)j), "handleNotificationWithName:event:forStream:", v11, v36, v7, lock);
          }
          id v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v26);
      }

      v29 = PKLogFacilityTypeGetObject();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (v23)
      {
        id v6 = v35;
        if (v30)
        {
          *(_DWORD *)buf = 138543618;
          id v49 = v35;
          __int16 v50 = 2112;
          v51 = v11;
          v31 = "PDNotificationStreamManager (%{public}@): Observers existed to handle notification %@.";
LABEL_33:
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);
        }
      }
      else
      {
        id v6 = v35;
        if (v30)
        {
          *(_DWORD *)buf = 138543618;
          id v49 = v35;
          __int16 v50 = 2112;
          v51 = v11;
          v31 = "PDNotificationStreamManager (%{public}@): No observers existed to handle notification %@!";
          goto LABEL_33;
        }
      }

      v9 = v33;
      v8 = v34;
      goto LABEL_35;
    }
  }
  v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v49 = v6;
    __int16 v50 = 2112;
    v51 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDNotificationStreamManager (%{public}@): WARNING RECEIVED MALFORMED NOTIFICATION EVENT %@!", buf, 0x16u);
  }
LABEL_35:
}

- (id)_notificationNameKeyForStream:(int64_t)a3
{
  CFStringRef v3 = @"Name";
  if (a3 != 1) {
    CFStringRef v3 = 0;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Notification";
  }
}

- (PDNotificationStreamManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)PDNotificationStreamManager;
  v2 = [(PDNotificationStreamManager *)&v15 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passd.notificationmanager", v5);
    internalSerialQueue = v2->_internalSerialQueue;
    v2->_internalSerialQueue = (OS_dispatch_queue *)v6;

    v2->_consumerLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    consumers = v2->_consumers;
    v2->_consumers = (NSHashTable *)v8;

    uint64_t v10 = +[NSMapTable pk_weakPointerPersonalityToStrongObjectsMapTable];
    consumerRegistrationState = v2->_consumerRegistrationState;
    v2->_consumerRegistrationState = (NSMapTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    registeredNotificationNames = v2->_registeredNotificationNames;
    v2->_registeredNotificationNames = v12;

    PDXPCEventStreamPauseEventDelivery();
  }
  return v2;
}

- (void)registerConsumer:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];

    -[PDNotificationStreamManager _updateConsumers:requiresRegistration:](self, "_updateConsumers:requiresRegistration:", v5, 1, v6);
    [(PDNotificationStreamManager *)self _scheduleEventStreamRegistrationUpdateWhileInternalQueue:0];
  }
}

- (void)unregisterConsumer:(id)a3
{
  if (a3)
  {
    -[PDNotificationStreamManager _unregisterConsumer:](self, "_unregisterConsumer:");
    [(PDNotificationStreamManager *)self _scheduleEventStreamRegistrationUpdateWhileInternalQueue:0];
  }
}

- (void)_updateConsumers:(id)a3 requiresRegistration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    if (v4)
    {
      os_unfair_lock_lock(&self->_consumerLock);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v6;
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            [(NSHashTable *)self->_consumers addObject:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          }
          id v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v9);
      }

      os_unfair_lock_unlock(&self->_consumerLock);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          id v18 = objc_msgSend(v17, "createCurrentNotificationRegistrationState", (void)v19);
          os_unfair_lock_lock(&self->_consumerLock);
          if ([(NSHashTable *)self->_consumers containsObject:v17])
          {
            if (v18)
            {
              [(NSMapTable *)self->_consumerRegistrationState setObject:v18 forKey:v17];
            }
            else if (v17)
            {
              [(NSMapTable *)self->_consumerRegistrationState removeObjectForKey:v17];
            }
          }
          os_unfair_lock_unlock(&self->_consumerLock);
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (void)_unregisterConsumer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_consumerLock);
    [(NSMapTable *)self->_consumerRegistrationState removeObjectForKey:v4];
    [(NSHashTable *)self->_consumers removeObject:v4];
    os_unfair_lock_unlock(&self->_consumerLock);
  }
}

- (void)recalculateNotificationNames
{
  group = self->_group;
  internalSerialQueue = self->_internalSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CFBE8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_group_async(group, internalSerialQueue, block);
}

- (void)start
{
  group = self->_group;
  internalSerialQueue = self->_internalSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CFCE0;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_group_async(group, internalSerialQueue, block);
}

- (void)_scheduleEventStreamRegistrationUpdateWhileInternalQueue:(BOOL)a3
{
  if (a3)
  {
    atomic_store(0, (unsigned __int8 *)&self->_needsRegistrationUpdate);
    [(PDNotificationStreamManager *)self _queue_updateEventStreamRegistration];
  }
  else
  {
    char v3 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_needsRegistrationUpdate, (unsigned __int8 *)&v3, 1u);
    if (!v3)
    {
      internalSerialQueue = self->_internalSerialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002CFE20;
      block[3] = &unk_10072E1E8;
      block[4] = self;
      dispatch_async(internalSerialQueue, block);
    }
  }
}

- (void)_queue_updateEventStreamRegistration
{
  [(PDNotificationStreamManager *)self _queue_updateEventStreamRegistrationForStream:0];
  [(PDNotificationStreamManager *)self _queue_updateEventStreamRegistrationForStream:1];
}

- (void)_queue_updateEventStreamRegistrationForStream:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_lock(&self->_consumerLock);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [(NSMapTable *)self->_consumerRegistrationState objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v33 + 1) + 8 * (void)v10) notificationNamesForStream:a3];
        if (v11) {
          [v5 unionSet:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_consumerLock);
  id v12 = +[NSNumber numberWithInteger:a3];
  id v13 = [(NSMutableDictionary *)self->_registeredNotificationNames objectForKeyedSubscript:v12];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v5;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v18);
        if (v13
          && [v13 containsObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)v18)])
        {
          [v13 removeObject:v19];
        }
        else
        {
          [(PDNotificationStreamManager *)self _queue_startObservingNotification:v19 forStream:a3];
        }
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v13;
  id v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[PDNotificationStreamManager _queue_stopObservingNotification:forStream:](self, "_queue_stopObservingNotification:forStream:", *(void *)(*((void *)&v25 + 1) + 8 * (void)v24), a3, (void)v25);
        long long v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v22);
  }

  [(NSMutableDictionary *)self->_registeredNotificationNames setObject:v14 forKeyedSubscript:v12];
}

- (id)_notificationStreamNameForStream:(int64_t)a3
{
  CFStringRef v3 = @"com.apple.distnoted.matching";
  if (a3 != 1) {
    CFStringRef v3 = 0;
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"com.apple.notifyd.matching";
  }
}

- (void)_queue_startObservingNotification:(id)a3 forStream:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = (const char *)[v6 UTF8String];
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    uint64_t v10 = [(PDNotificationStreamManager *)self _notificationNameKeyForStream:a4];
    v11 = v10;
    if (v10) {
      xpc_dictionary_set_string(v9, (const char *)[v10 UTF8String], v8);
    }
    id v12 = [(PDNotificationStreamManager *)self _notificationStreamNameForStream:a4];
    if (v12)
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        id v15 = v12;
        __int16 v16 = 2114;
        uint64_t v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDNotificationStreamManager (%{public}@): Start observing notification %{public}@.", (uint8_t *)&v14, 0x16u);
      }

      [v12 UTF8String];
      xpc_set_event();
    }
  }
}

- (void)_queue_stopObservingNotification:(id)a3 forStream:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(PDNotificationStreamManager *)self _notificationStreamNameForStream:a4];
    if (v7)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        uint64_t v10 = v7;
        __int16 v11 = 2114;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDNotificationStreamManager (%{public}@): Stop observing notification %{public}@.", (uint8_t *)&v9, 0x16u);
      }

      [v7 UTF8String];
      [v6 UTF8String];
      xpc_set_event();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredNotificationNames, 0);
  objc_storeStrong((id *)&self->_consumerRegistrationState, 0);
  objc_storeStrong((id *)&self->_consumers, 0);
  objc_storeStrong((id *)&self->_internalSerialQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end