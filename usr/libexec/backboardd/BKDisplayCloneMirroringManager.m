@interface BKDisplayCloneMirroringManager
- (BKDisplayCloneMirroringManager)initWithDisplayProvider:(id)a3;
- (id)_lock_cloneMirroringOptionsFromSourceDisplay:(id)a3 destinationDisplay:(id)a4 virtualMode:(id)a5 isStevenote:(BOOL *)a6;
- (id)_lock_cloneMirroringOptionsSteveNote:(BOOL)a3 contextIDs:(id)a4;
- (id)_lock_virtualDisplayModeFromClientParametersForDisplay:(id)a3 shouldHide:(BOOL *)a4 shouldDisable:(BOOL *)a5;
- (void)_lock_clearWindowServerDisplayTags:(id)a3;
- (void)_lock_evaluateAllDisplaysForReason:(id)a3;
- (void)_lock_evaluateCarPlayDisplay:(id)a3 label:(id)a4;
- (void)_lock_evaluateConnectedDisplay:(id)a3 because:(id)a4;
- (void)_lock_evaluateContinuityDisplay:(id)a3 label:(id)a4;
- (void)_lock_evaluateDisplay:(id)a3 reason:(id)a4;
- (void)_lock_evaluateExistingClonesForReason:(id)a3;
- (void)_lock_recomputeTagsForDisplay:(id)a3 shouldHide:(BOOL)a4;
- (void)_lock_removeClone:(id)a3 fromWindowServerDisplay:(id)a4;
- (void)_lock_removeDisplayCloneDestination:(id)a3;
- (void)_lock_setupCloningToDestination:(id)a3 fromVirtualMode:(id)a4 hideByDefault:(BOOL)a5;
- (void)addModeRequest:(unint64_t)a3 forDisplay:(id)a4 clientPID:(int)a5;
- (void)cloneMirroringRequestsDidChange;
- (void)evaluateDisplay:(id)a3 reason:(id)a4;
- (void)removeDisplay:(id)a3;
- (void)removeModeRequestForDisplay:(id)a3 clientPID:(int)a4;
- (void)setCloneRotationDisabled:(BOOL)a3;
@end

@implementation BKDisplayCloneMirroringManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_destinationDisplayIdentifierToCloneRecord, 0);
  objc_storeStrong((id *)&self->_lock_cloneMirrorRequests, 0);

  objc_storeStrong((id *)&self->_displayProvider, 0);
}

- (void)removeModeRequestForDisplay:(id)a3 clientPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = self->_lock_cloneMirrorRequests;
  id v9 = v7;
  if (lock_cloneMirrorRequests)
  {
    v10 = BKLogDisplay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = BSProcessDescriptionForPID();
      int v16 = 138543618;
      id v17 = v9;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "clone mirror mode remove for destinationDisplay:%{public}@ from process:%{public}@", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    v12 = +[NSNumber numberWithInt:v4];
    v13 = [(NSMutableDictionary *)lock_cloneMirrorRequests->_pidToRequests objectForKey:v12];
    v14 = [v13 objectForKey:v9];
    if (v14)
    {
      [(NSMutableOrderedSet *)lock_cloneMirrorRequests->_modeRequestsInOrder removeObject:v14];
      [v13 removeObjectForKey:v9];
    }
    if (![v13 count])
    {
      [(NSMutableDictionary *)lock_cloneMirrorRequests->_pidToRequests removeObjectForKey:v12];
      v15 = [(NSMutableDictionary *)lock_cloneMirrorRequests->_pidToDeathWatcher objectForKey:v12];
      [v15 invalidate];

      [(NSMutableDictionary *)lock_cloneMirrorRequests->_pidToDeathWatcher removeObjectForKey:v12];
    }
    [(BKDisplayCloneMirrorRequestCache *)lock_cloneMirrorRequests _lock_rebuildModeCache];
    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);
  }
  [(BKDisplayCloneMirroringManager *)self _lock_evaluateAllDisplaysForReason:@"removeModeRequest"];

  os_unfair_lock_unlock(p_lock);
}

- (void)addModeRequest:(unint64_t)a3 forDisplay:(id)a4 clientPID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = self;
  p_lock = &self->_lock;
  id v10 = a4;
  os_unfair_lock_lock(p_lock);
  lock_cloneMirrorRequests = v8->_lock_cloneMirrorRequests;
  id v12 = v10;
  if (lock_cloneMirrorRequests)
  {
    v13 = BKLogDisplay();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBKSDisplayServicesCloneMirroringMode();
      v15 = v14 = v8;
      int v16 = BSProcessDescriptionForPID();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v15;
      __int16 v41 = 2114;
      id v42 = v12;
      __int16 v43 = 2114;
      v44 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "clone mirror mode request:%{public}@ destinationDisplay:%{public}@ from process:%{public}@", buf, 0x20u);

      v8 = v14;
    }

    os_unfair_lock_lock(&lock_cloneMirrorRequests->_lock);
    id v17 = objc_alloc_init(BKDisplayCloneMirrorRequestClient);
    __int16 v18 = v17;
    if (v17)
    {
      v17->_pid = v5;
      objc_storeStrong((id *)&v17->_displayUUID, a4);
      v18->_mode = a3;
    }
    if (!lock_cloneMirrorRequests->_displayUUIDToModeRequest)
    {
      v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      displayUUIDToModeRequest = lock_cloneMirrorRequests->_displayUUIDToModeRequest;
      lock_cloneMirrorRequests->_displayUUIDToModeRequest = v19;

      v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      pidToRequests = lock_cloneMirrorRequests->_pidToRequests;
      lock_cloneMirrorRequests->_pidToRequests = v21;

      v23 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
      modeRequestsInOrder = lock_cloneMirrorRequests->_modeRequestsInOrder;
      lock_cloneMirrorRequests->_modeRequestsInOrder = v23;
    }
    v25 = +[NSNumber numberWithInt:v5];
    v26 = [(NSMutableDictionary *)lock_cloneMirrorRequests->_pidToRequests objectForKey:v25];
    v27 = v26;
    if (v26)
    {
      v28 = [v26 objectForKey:v12];
      [(NSMutableOrderedSet *)lock_cloneMirrorRequests->_modeRequestsInOrder removeObject:v28];
      [v27 setObject:v18 forKey:v12];
    }
    else
    {
      v37 = lock_cloneMirrorRequests->_pidToRequests;
      id v29 = objc_alloc((Class)NSMutableDictionary);
      *(void *)buf = v18;
      +[NSArray arrayWithObjects:buf count:1];
      v38 = v8;
      v31 = v30 = p_lock;
      id v39 = v12;
      v32 = +[NSArray arrayWithObjects:&v39 count:1];
      id v33 = [v29 initWithObjects:v31 forKeys:v32];
      [(NSMutableDictionary *)v37 setObject:v33 forKey:v25];

      p_lock = v30;
      v8 = v38;
      [(BKDisplayCloneMirrorRequestCache *)lock_cloneMirrorRequests _lock_addDeathWatcherForPid:v5];
    }
    -[NSMutableOrderedSet addObject:](lock_cloneMirrorRequests->_modeRequestsInOrder, "addObject:", v18, v37);
    uint64_t v34 = [(NSMutableDictionary *)lock_cloneMirrorRequests->_displayUUIDToModeRequest objectForKey:v12];
    v35 = (void *)v34;
    if (!v34 || *(_DWORD *)(v34 + 8) == v5)
    {
      v36 = v18;

      [(NSMutableDictionary *)lock_cloneMirrorRequests->_displayUUIDToModeRequest setObject:v36 forKey:v12];
      v35 = v36;
    }
    os_unfair_lock_unlock(&lock_cloneMirrorRequests->_lock);
  }
  [(BKDisplayCloneMirroringManager *)v8 _lock_evaluateAllDisplaysForReason:@"addModeRequest"];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDisplay:(id)a3
{
  id v19 = a3;
  if (!v19)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v6];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      v21 = v8;
      __int16 v22 = 2114;
      v23 = v10;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2114;
      CFStringRef v27 = @"BKDisplayCloneMirroringManager.m";
      __int16 v28 = 1024;
      int v29 = 503;
      __int16 v30 = 2114;
      v31 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000767A0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (objc_class *)[v19 classForCoder];
    if (!v11) {
      v11 = (objc_class *)objc_opt_class();
    }
    id v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v12, v14];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v16 = NSStringFromSelector(a2);
      id v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      v21 = v16;
      __int16 v22 = 2114;
      v23 = v18;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2114;
      CFStringRef v27 = @"BKDisplayCloneMirroringManager.m";
      __int16 v28 = 1024;
      int v29 = 503;
      __int16 v30 = 2114;
      v31 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000768DCLL);
  }

  os_unfair_lock_lock(&self->_lock);
  [(BKDisplayCloneMirroringManager *)self _lock_removeDisplayCloneDestination:v19];
  [(BKDisplayCloneMirroringManager *)self _lock_clearWindowServerDisplayTags:v19];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)evaluateDisplay:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v23 = v7;
  if (!v23)
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    v11 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v10];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      __int16 v26 = 2114;
      CFStringRef v27 = v14;
      __int16 v28 = 2048;
      int v29 = self;
      __int16 v30 = 2114;
      CFStringRef v31 = @"BKDisplayCloneMirroringManager.m";
      __int16 v32 = 1024;
      int v33 = 495;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100076ADCLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (objc_class *)[v23 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    int v16 = NSStringFromClass(v15);
    id v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    id v19 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v16, v18];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      v25 = v20;
      __int16 v26 = 2114;
      CFStringRef v27 = v22;
      __int16 v28 = 2048;
      int v29 = self;
      __int16 v30 = 2114;
      CFStringRef v31 = @"BKDisplayCloneMirroringManager.m";
      __int16 v32 = 1024;
      int v33 = 495;
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100076C18);
  }

  os_unfair_lock_lock(&self->_lock);
  [(BKDisplayCloneMirroringManager *)self _lock_evaluateDisplay:v23 reason:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCloneRotationDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_cloneRotationDisabled != v3)
  {
    self->_lock_cloneRotationDisabled = v3;
    v6 = +[NSString stringWithFormat:@"setCloneRotationDisabled:%d", v3];
    [(BKDisplayCloneMirroringManager *)self _lock_evaluateExistingClonesForReason:v6];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)cloneMirroringRequestsDidChange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BKDisplayCloneMirroringManager *)self _lock_evaluateAllDisplaysForReason:@"cloneMirroringRequestsDidChange"];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_evaluateExistingClonesForReason:(id)a3
{
  id v4 = a3;
  lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100076DA0;
  v7[3] = &unk_1000F7D30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)lock_destinationDisplayIdentifierToCloneRecord enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_lock_evaluateAllDisplaysForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKDisplayCloneMirroringManagerInformationProvider *)self->_displayProvider windowServerDisplays];
  id v6 = [v5 firstObject];
  if (v6)
  {
    v14 = v6;
    v15 = v5;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ([(BKDisplayCloneMirroringManagerInformationProvider *)self->_displayProvider supportCloningToDisplay:v12])
          {
            v13 = +[NSString stringWithFormat:@"updateClonedDisplaysForSettingsChange(%@)", v4];
            [(BKDisplayCloneMirroringManager *)self _lock_evaluateDisplay:v12 reason:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v6 = v14;
    uint64_t v5 = v15;
  }
}

- (void)_lock_evaluateDisplay:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(BKDisplayCloneMirroringManagerInformationProvider *)self->_displayProvider displayIsConnected:v7])
  {
    [(BKDisplayCloneMirroringManager *)self _lock_evaluateConnectedDisplay:v7 because:v6];
  }
  else
  {
    [(BKDisplayCloneMirroringManager *)self _lock_removeDisplayCloneDestination:v7];
    [v7 setProcessId:0];
    [(BKDisplayCloneMirroringManager *)self _lock_clearWindowServerDisplayTags:v7];
  }
}

- (void)_lock_clearWindowServerDisplayTags:(id)a3
{
  id v3 = a3;
  if ([v3 tag])
  {
    id v4 = BKLogDisplay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Untagging %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [v3 setTag:0];
    [v3 setTracksCarPlayRegions:0];
  }
}

- (void)_lock_removeClone:(id)a3 fromWindowServerDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v6 && v7)
  {
    id v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v6 displayId]);
    id v9 = [(NSMutableDictionary *)self->_lock_destinationDisplayIdentifierToCloneRecord objectForKey:v8];
    [(NSMutableDictionary *)self->_lock_destinationDisplayIdentifierToCloneRecord removeObjectForKey:v8];
    uint64_t v10 = [v7 clones];
    unsigned int v11 = [v10 containsObject:v6];

    if (v11)
    {
      uint64_t v12 = BKLogDisplay();
      v13 = v12;
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138543618;
          id v16 = v6;
          __int16 v17 = 2114;
          id v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing clone %{public}@ from %{public}@", (uint8_t *)&v15, 0x16u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543618;
        id v16 = v6;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Display %{public}@ cloning from %{public}@, but we're missing a record of the clone", (uint8_t *)&v15, 0x16u);
      }

      [v7 removeClone:v6];
    }
    else if (v9)
    {
      v14 = BKLogDisplay();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543618;
        id v16 = v6;
        __int16 v17 = 2114;
        id v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Clone missing: expected to see %{public}@ cloning from %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)_lock_removeDisplayCloneDestination:(id)a3
{
  id v5 = a3;
  id v4 = [v5 cloneMaster];
  if (v4) {
    [(BKDisplayCloneMirroringManager *)self _lock_removeClone:v5 fromWindowServerDisplay:v4];
  }
}

- (void)_lock_recomputeTagsForDisplay:(id)a3 shouldHide:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unint64_t v6 = (unint64_t)[v5 tag];
  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFALL | v4 | (4 * ((v6 & 0xF8) == 0));
  id v8 = [v5 name];
  unsigned int v9 = [v8 isEqual:@"TVOut"];

  if (v9)
  {
    uint64_t v10 = +[BKSDefaults externalDefaults];
    unsigned int v11 = [v10 iapDefaults];

    uint64_t v12 = [v11 videoTVOutReservedForIPodOut];
    v13 = [v11 videoTVOutReservedForRemoteUI];
    if ([v12 isEqualToString:@"Yes"])
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 0xA;
    }
    else if ([v13 isEqualToString:@"Yes"])
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 0x12;
    }
    else
    {
      unint64_t v7 = v7 & 0xFFFFFFFFFFFFFFE5 | 2;
    }
  }
  v14 = BKLogDisplay();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = NSStringFromBKSDisplayTags();
    int v16 = 138543618;
    id v17 = v5;
    __int16 v18 = 2114;
    long long v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "tagging %{public}@ with %{public}@", (uint8_t *)&v16, 0x16u);
  }
  [v5 setTag:v7];
}

- (id)_lock_virtualDisplayModeFromClientParametersForDisplay:(id)a3 shouldHide:(BOOL *)a4 shouldDisable:(BOOL *)a5
{
  id v9 = a3;
  if (!v9)
  {
    __int16 v28 = (objc_class *)objc_opt_class();
    int v29 = NSStringFromClass(v28);
    __int16 v30 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v29];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      CFStringRef v31 = (char *)objc_claimAutoreleasedReturnValue();
      __int16 v32 = (objc_class *)objc_opt_class();
      int v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138544642;
      __int16 v43 = v31;
      __int16 v44 = 2114;
      v45 = v33;
      __int16 v46 = 2048;
      v47 = self;
      __int16 v48 = 2114;
      CFStringRef v49 = @"BKDisplayCloneMirroringManager.m";
      __int16 v50 = 1024;
      int v51 = 330;
      __int16 v52 = 2114;
      v53 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000778ACLL);
  }
  uint64_t v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v34 = (objc_class *)[v10 classForCoder];
    if (!v34) {
      __int16 v34 = (objc_class *)objc_opt_class();
    }
    v35 = NSStringFromClass(v34);
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v35, v37];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v39 = (char *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      __int16 v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138544642;
      __int16 v43 = v39;
      __int16 v44 = 2114;
      v45 = v41;
      __int16 v46 = 2048;
      v47 = self;
      __int16 v48 = 2114;
      CFStringRef v49 = @"BKDisplayCloneMirroringManager.m";
      __int16 v50 = 1024;
      int v51 = 330;
      __int16 v52 = 2114;
      v53 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000779E8);
  }

  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v12 = [v10 virtualDisplayMode];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKey:@"DisplayLabel"];
    if (v14)
    {
      [v11 setObject:v14 forKey:@"DisplayLabel"];
    }
    else
    {
      int v15 = BKLogDisplay();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v43 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "no label for mode: %{public}@", buf, 0xCu);
      }
    }
  }
  int v16 = [v10 uniqueId];
  id v17 = v16;
  lock_cloneMirrorRequests = (char *)self->_lock_cloneMirrorRequests;
  if (!lock_cloneMirrorRequests) {
    goto LABEL_36;
  }
  long long v19 = (os_unfair_lock_s *)(lock_cloneMirrorRequests + 8);
  id v20 = v16;
  os_unfair_lock_lock((os_unfair_lock_t)lock_cloneMirrorRequests + 2);
  lock_cloneMirrorRequests = [*((id *)lock_cloneMirrorRequests + 3) objectForKey:v20];

  if (!lock_cloneMirrorRequests)
  {
    self;
    if (qword_100122EE0 != -1) {
      dispatch_once(&qword_100122EE0, &stru_1000F6BE0);
    }
    lock_cloneMirrorRequests = (char *)(id)qword_100122ED8;
  }
  os_unfair_lock_unlock(v19);
  if (lock_cloneMirrorRequests) {
    uint64_t v21 = *((void *)lock_cloneMirrorRequests + 3);
  }
  else {
LABEL_36:
  }
    uint64_t v21 = 0;
  __int16 v22 = BKLogDisplay();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v43 = lock_cloneMirrorRequests;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Prevailing clone mirror mode: %{public}@ ", buf, 0xCu);
  }

  id v23 = +[BKSDefaults localDefaults];
  unsigned __int8 v24 = [v23 disableCloneMirroring];
  if (v21 == 1) {
    unsigned __int8 v25 = 1;
  }
  else {
    unsigned __int8 v25 = [v23 forceCloneMirroring];
  }
  if (v21 == 2) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v24;
  }
  *a4 = v25;
  *a5 = v26;

  return v11;
}

- (id)_lock_cloneMirroringOptionsSteveNote:(BOOL)a3 contextIDs:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = +[BKSDefaults localDefaults];
  id v8 = +[NSNumber numberWithBool:self->_lock_cloneRotationDisabled];
  id v9 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v8, kCAWindowServerClone_DisableRotation, 0);

  id v10 = [v7 disableCAOverscan];
  id v11 = v10;
  if (v4 || v10)
  {
    if (((v10 | !v4) & 1) == 0) {
      id v11 = (id)[v7 isSteveNoteOverscanEnabled:v10] ^ 1;
    }
    uint64_t v12 = +[NSNumber numberWithBool:v11];
    [v9 setObject:v12 forKey:kCAWindowServerClone_DisableOverscan];
  }
  if (objc_msgSend(v7, "disableCAScaling", v11))
  {
    v13 = +[NSNumber numberWithBool:1];
    [v9 setObject:v13 forKey:kCAWindowServerClone_DisableScaling];
  }
  unsigned int v14 = [v7 disableCAYUV];
  if (v4 || v14)
  {
    int v15 = +[NSNumber numberWithBool:1];
    [v9 setObject:v15 forKey:kCAWindowServerClone_DisableYUV];
  }
  if ([v6 count]) {
    [v9 setObject:v6 forKey:kCAWindowServerClone_ReplayContexts];
  }

  return v9;
}

- (void)_lock_evaluateConnectedDisplay:(id)a3 because:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 virtualDisplayMode];
  id v9 = [v8 objectForKey:@"MirroringMode"];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  unsigned int v14 = [v13 intValue];
  int v15 = [v6 uniqueId];
  int v16 = BKLogDisplay();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v29 = v7;
    __int16 v30 = 2114;
    CFStringRef v31 = v15;
    __int16 v32 = 2114;
    int v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "evaluateDisplay(%{public}@) incoming virtual display mode(%{public}@): %{public}@", buf, 0x20u);
  }

  if (v14 - 1 >= 2)
  {
    if (v14 == 3)
    {
      [(BKDisplayCloneMirroringManager *)self _lock_removeDisplayCloneDestination:v6];
      [(BKDisplayCloneMirroringManager *)self _lock_clearWindowServerDisplayTags:v6];
      id v17 = [v8 objectForKey:@"DisplayLabel"];
      uint64_t v18 = objc_opt_class();
      id v19 = v17;
      if (v18)
      {
        if (objc_opt_isKindOfClass()) {
          id v20 = v19;
        }
        else {
          id v20 = 0;
        }
      }
      else
      {
        id v20 = 0;
      }
      id v21 = v20;

      if ([v21 isEqual:@"Continuity"])
      {
        [v6 setProcessId:0];
        [(BKDisplayCloneMirroringManager *)self _lock_evaluateContinuityDisplay:v6 label:v21];
        goto LABEL_25;
      }
      if ([v21 hasPrefix:@"CarPlay"])
      {
        [v6 setProcessId:0];
        [(BKDisplayCloneMirroringManager *)self _lock_evaluateCarPlayDisplay:v6 label:v21];
        goto LABEL_25;
      }
      unsigned __int8 v24 = [v8 objectForKey:@"ClientPID"];
      id v25 = [v24 intValue];

      if (v25 == [v6 processId])
      {
LABEL_18:
        [(BKDisplayCloneMirroringManager *)self _lock_recomputeTagsForDisplay:v6 shouldHide:0];
LABEL_25:

        goto LABEL_26;
      }
      BOOL v26 = BKLogDisplay();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v6;
        __int16 v30 = 1024;
        LODWORD(v31) = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "setting %{public}@ processID to %d", buf, 0x12u);
      }

      __int16 v22 = v6;
      id v23 = v25;
    }
    else
    {
      buf[0] = 0;
      char v27 = 0;
      id v21 = [(BKDisplayCloneMirroringManager *)self _lock_virtualDisplayModeFromClientParametersForDisplay:v6 shouldHide:buf shouldDisable:&v27];
      if (!v27)
      {
        [(BKDisplayCloneMirroringManager *)self _lock_setupCloningToDestination:v6 fromVirtualMode:v21 hideByDefault:buf[0]];
        goto LABEL_25;
      }
      [(BKDisplayCloneMirroringManager *)self _lock_removeDisplayCloneDestination:v6];
      __int16 v22 = v6;
      id v23 = 0;
    }
    [v22 setProcessId:v23];
    goto LABEL_18;
  }
  [(BKDisplayCloneMirroringManager *)self _lock_setupCloningToDestination:v6 fromVirtualMode:v8 hideByDefault:1];
LABEL_26:
}

- (void)_lock_setupCloningToDestination:(id)a3 fromVirtualMode:(id)a4 hideByDefault:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 objectForKey:@"MirroredDisplayID"];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  unsigned int v14 = v13;

  if (v14)
  {
    id v15 = [v14 integerValue];
    int v16 = BKLogDisplay();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "mirroring source display is %{public}@", buf, 0xCu);
    }

    id v17 = [(BKDisplayCloneMirroringManagerInformationProvider *)self->_displayProvider windowServerDisplayForDisplayIdentifier:v15];
    if (v17) {
      goto LABEL_10;
    }
LABEL_18:
    id v19 = BKLogDisplay();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    id v23 = "specified source display does not exist";
    unsigned __int8 v24 = v19;
    uint32_t v25 = 2;
LABEL_22:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    goto LABEL_44;
  }
  id v21 = BKLogDisplay();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "no mirroring source display specified for %{public}@; assuming main",
      buf,
      0xCu);
  }

  __int16 v22 = [(BKDisplayCloneMirroringManagerInformationProvider *)self->_displayProvider windowServerDisplays];
  id v17 = [v22 firstObject];

  if (!v17) {
    goto LABEL_18;
  }
LABEL_10:
  if (v17 == v8)
  {
    id v19 = BKLogDisplay();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v49 = v8;
    id v23 = "cannot clone display to itself: %{public}@";
    unsigned __int8 v24 = v19;
    uint32_t v25 = 12;
    goto LABEL_22;
  }
  uint64_t v18 = [v17 cloneMaster];
  if (!v18)
  {
    char v47 = 0;
    uint64_t v26 = [(BKDisplayCloneMirroringManager *)self _lock_cloneMirroringOptionsFromSourceDisplay:v17 destinationDisplay:v8 virtualMode:v9 isStevenote:&v47];
    unsigned int v27 = [v8 displayId];
    lock_destinationDisplayIdentifierToCloneRecord = self->_lock_destinationDisplayIdentifierToCloneRecord;
    unsigned int v46 = v27;
    id v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    __int16 v30 = [(NSMutableDictionary *)lock_destinationDisplayIdentifierToCloneRecord objectForKey:v29];

    if (v30)
    {
      char v31 = BSEqualObjects();
      __int16 v32 = BKLogDisplay();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v33)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "clone settings did not change; no-op",
            buf,
            2u);
        }

LABEL_43:
        id v19 = 0;
        goto LABEL_44;
      }
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "clone settings changed; removing previous clone",
          buf,
          2u);
      }

      v37 = v30[2];
    }
    else
    {
      __int16 v34 = [v17 clones];
      unsigned int v35 = [v34 containsObject:v8];

      if (!v35)
      {
LABEL_36:
        v38 = BKLogDisplay();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          CFStringRef v49 = v17;
          __int16 v50 = 2114;
          int v51 = v8;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "cloning %{public}@ to %{public}@", buf, 0x16u);
        }

        if (v26) {
          uint64_t v39 = *(void *)(v26 + 32);
        }
        else {
          uint64_t v39 = 0;
        }
        [v17 addClone:v8 options:v39];
        v40 = [v8 name];
        unsigned int v41 = [v40 isEqualToString:@"TVOut"];

        uint64_t v42 = ((v47 == 0) | ~v41) & v5;
        __int16 v43 = self->_lock_destinationDisplayIdentifierToCloneRecord;
        __int16 v44 = +[NSNumber numberWithUnsignedInt:v46];
        [(NSMutableDictionary *)v43 setObject:v26 forKey:v44];

        if (v26) {
          uint64_t v45 = *(unsigned int *)(v26 + 8);
        }
        else {
          uint64_t v45 = 0;
        }
        [v8 setProcessId:v45];
        [(BKDisplayCloneMirroringManager *)self _lock_recomputeTagsForDisplay:v8 shouldHide:v42];
        goto LABEL_43;
      }
      v36 = BKLogDisplay();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v49 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "no record, but source display is already cloned to %{public}@ -- will remove and reapply with current settings, which may result in flicker", buf, 0xCu);
      }

      v37 = v17;
    }
    [v37 removeClone:v8];
    goto LABEL_36;
  }
  id v19 = v18;
  id v20 = BKLogDisplay();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v49 = v17;
    __int16 v50 = 2114;
    int v51 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "source display:%{public}@ is a clone of display:%{public}@; cannot clone a clone",
      buf,
      0x16u);
  }

LABEL_44:
}

- (id)_lock_cloneMirroringOptionsFromSourceDisplay:(id)a3 destinationDisplay:(id)a4 virtualMode:(id)a5 isStevenote:(BOOL *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 objectForKey:@"ContextIDs"];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      int v16 = v15;
    }
    else {
      int v16 = 0;
    }
  }
  else
  {
    int v16 = 0;
  }
  id v17 = v16;

  id obj = a4;
  if (v17)
  {
    uint64_t v18 = +[NSSet setWithArray:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = [v10 objectForKey:@"DisplayLabel"];
  uint64_t v20 = objc_opt_class();
  id v21 = v19;
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      __int16 v22 = v21;
    }
    else {
      __int16 v22 = 0;
    }
  }
  else
  {
    __int16 v22 = 0;
  }
  id v23 = v22;

  id v24 = [v23 isEqual:@"Stevenote"];
  *a6 = (char)v24;
  uint32_t v25 = [(BKDisplayCloneMirroringManager *)self _lock_cloneMirroringOptionsSteveNote:v24 contextIDs:v18];
  uint64_t v26 = [v10 objectForKey:@"ClientPID"];
  unsigned int v27 = [v26 intValue];

  __int16 v28 = [BKDisplayCloneRecord alloc];
  id v29 = v12;
  id v30 = v11;
  id v31 = v25;
  if (v28)
  {
    v35.receiver = v28;
    v35.super_class = (Class)BKDisplayCloneRecord;
    id v32 = [(BKDisplayCloneMirroringManager *)&v35 init];
    __int16 v28 = (BKDisplayCloneRecord *)v32;
    if (v32)
    {
      objc_storeStrong((id *)v32 + 2, a3);
      objc_storeStrong((id *)&v28->_destinationDisplay, obj);
      v28->_clientPID = v27;
      objc_storeStrong((id *)&v28->_options, v25);
    }
  }

  return v28;
}

- (void)_lock_evaluateContinuityDisplay:(id)a3 label:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BKLogDisplay();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 uniqueId];
    id v9 = NSStringFromBKSDisplayTags();
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tagging display %{public}@ with label %{public}@ as %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [v5 setTag:128];
}

- (void)_lock_evaluateCarPlayDisplay:(id)a3 label:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [&off_100103800 objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 integerValue];
    int v10 = BKLogDisplay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromBKSDisplayTags();
      __int16 v12 = [v5 uniqueId];
      int v19 = 138543874;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      __int16 v22 = v11;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tagging CarPlay display %{public}@ %{public}@ %{public}@", (uint8_t *)&v19, 0x20u);
    }
    [v5 setTag:v9];
    id v13 = [v5 uniqueId];
    id v14 = [objc_alloc((Class)CARSessionStatus) initWithOptions:1];
    id v15 = [v14 currentSession];

    int v16 = [v15 configuration];
    id v17 = [v16 screenInfoForScreenID:v13];

    if ([v17 supportsLayerTracking])
    {
      uint64_t v18 = BKLogDisplay();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        uint64_t v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Enabling layer tracking for CarPlay display %{public}@", (uint8_t *)&v19, 0xCu);
      }

      [v5 setTracksCarPlayRegions:1];
    }
  }
  else
  {
    id v13 = BKLogDisplay();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    id v15 = [v5 uniqueId];
    int v19 = 138543874;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unknown CarPlay display label %{public}@ for %{public}@ %{public}@", (uint8_t *)&v19, 0x20u);
  }

LABEL_11:
}

- (BKDisplayCloneMirroringManager)initWithDisplayProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKDisplayCloneMirroringManager;
  id v6 = [(BKDisplayCloneMirroringManager *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayProvider, a3);
    id v8 = objc_alloc_init(BKDisplayCloneMirrorRequestCache);
    lock_cloneMirrorRequests = v7->_lock_cloneMirrorRequests;
    v7->_lock_cloneMirrorRequests = v8;

    int v10 = v7->_lock_cloneMirrorRequests;
    if (v10) {
      objc_storeWeak((id *)&v10->_delegate, v7);
    }
    id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_destinationDisplayIdentifierToCloneRecord = v7->_lock_destinationDisplayIdentifierToCloneRecord;
    v7->_lock_destinationDisplayIdentifierToCloneRecord = v11;
  }
  return v7;
}

@end