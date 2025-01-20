@interface BKButtonHapticsController
+ (id)sharedInstance;
- (BKButtonHapticsController)init;
- (BKButtonHapticsController)initWithBHButtonHapticsController:(id)a3;
- (BKSButtonHapticsDefinition)homeButtonDefinition;
- (BRButtonResolverController)BRController;
- (OS_dispatch_group)controllerReadyGroup;
- (OS_dispatch_queue)queue;
- (double)longPressTimeInterval;
- (double)multiplePressTimeInterval;
- (id)_queue_assetOfType:(int64_t)a3 parameters:(id)a4;
- (id)description;
- (int64_t)maximumPressCount;
- (int64_t)maximumTapCount;
- (void)_configureAsyncWithBlock:(id)a3;
- (void)_configureSyncWithBlock:(id)a3;
- (void)_queue_addChangesForPendingState:(id)a3 configuredState:(id)a4 toStates:(id)a5 configs:(id)a6 assets:(id)a7 enable:(id)a8 disable:(id)a9;
- (void)_queue_addConfigsAndAssetsForClickState:(id)a3 toStates:(id)a4 configs:(id)a5 assets:(id)a6;
- (void)_queue_applyConfigurationChanges;
- (void)_queue_applyDefinitions:(id)a3;
- (void)_queue_getSlowHapticType:(int64_t *)a3 getMediumHapticType:(int64_t *)a4 getFastHapticType:(int64_t *)a5 fromAssetType:(int64_t)a6 clickCount:(int64_t)a7;
- (void)applyDefinitions:(id)a3;
- (void)playHapticForClickState:(unint64_t)a3 clickSpeed:(unint64_t)a4;
- (void)removeAllHaptics;
- (void)setBRController:(id)a3;
- (void)setControllerReadyGroup:(id)a3;
- (void)setHomeButtonDefinition:(id)a3;
- (void)setLongPressTimeInterval:(double)a3;
- (void)setMaximumPressCount:(int64_t)a3;
- (void)setMaximumTapCount:(int64_t)a3;
- (void)setMultiplePressTimeInterval:(double)a3;
- (void)setQueue:(id)a3;
@end

@implementation BKButtonHapticsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerReadyGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_BRController, 0);
  objc_storeStrong((id *)&self->_homeButtonDefinition, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_clickStatesPending, 0);

  objc_storeStrong((id *)&self->_clickStatesConfigured, 0);
}

- (void)setLongPressTimeInterval:(double)a3
{
  self->_longPressTimeInterval = a3;
}

- (double)longPressTimeInterval
{
  return self->_longPressTimeInterval;
}

- (void)setMultiplePressTimeInterval:(double)a3
{
  self->_multiplePressTimeInterval = a3;
}

- (double)multiplePressTimeInterval
{
  return self->_multiplePressTimeInterval;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  self->_maximumTapCount = a3;
}

- (int64_t)maximumTapCount
{
  return self->_maximumTapCount;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  self->_maximumPressCount = a3;
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (void)setControllerReadyGroup:(id)a3
{
}

- (OS_dispatch_group)controllerReadyGroup
{
  return self->_controllerReadyGroup;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setBRController:(id)a3
{
}

- (BRButtonResolverController)BRController
{
  return self->_BRController;
}

- (void)setHomeButtonDefinition:(id)a3
{
}

- (BKSButtonHapticsDefinition)homeButtonDefinition
{
  return self->_homeButtonDefinition;
}

- (void)playHapticForClickState:(unint64_t)a3 clickSpeed:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100032354;
  v4[3] = &unk_1000F6388;
  v4[5] = a3;
  v4[6] = a4;
  v4[4] = self;
  [(BKButtonHapticsController *)self _configureSyncWithBlock:v4];
}

- (void)removeAllHaptics
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000325A8;
  v2[3] = &unk_1000F62B0;
  v2[4] = self;
  [(BKButtonHapticsController *)self _configureAsyncWithBlock:v2];
}

- (void)applyDefinitions:(id)a3
{
  id v4 = a3;
  v5 = +[BSPlatform sharedInstance];
  id v6 = [v5 homeButtonType];

  if (v6 == (id)2)
  {
    v7 = sub_10005FA78();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "not configuring SSHB because we don't have a real home button", buf, 2u);
    }
  }
  else
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000327BC;
    v9[3] = &unk_1000F8E50;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(queue, v9);
  }
}

- (void)_queue_applyDefinitions:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v7 = 138543362;
    long long v13 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "representsHomeButton", v13))
        {
          homeButtonDefinition = self->_homeButtonDefinition;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100032A44;
          v14[3] = &unk_1000F6360;
          v14[4] = self;
          v14[5] = v10;
          v14[6] = &v19;
          [(BKSButtonHapticsDefinition *)homeButtonDefinition updateFromDefinition:v10 withChangeInspectorBlock:v14];
        }
        else
        {
          v12 = sub_10005FA78();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v24 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ignoring definition for unsupported button:%{public}@", buf, 0xCu);
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v6);
  }

  if (*((unsigned char *)v20 + 24)) {
    [(BKButtonHapticsController *)self _queue_applyConfigurationChanges];
  }
  _Block_object_dispose(&v19, 8);
}

- (void)_queue_applyConfigurationChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v36 = +[NSMutableArray array];
  v3 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  v38 = +[NSMutableArray array];
  v37 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = self->_clickStatesPending;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v11 = [v10 clickState];
        v12 = [(NSMutableArray *)self->_clickStatesConfigured objectAtIndexedSubscript:v11];
        [(BKButtonHapticsController *)self _queue_addChangesForPendingState:v10 configuredState:v12 toStates:v4 configs:v36 assets:v3 enable:v38 disable:v37];
        if ([v10 isEnabled])
        {
          id v13 = [v10 copy];
          [(NSMutableArray *)self->_clickStatesConfigured setObject:v13 atIndexedSubscript:v11];
        }
        else
        {
          id v13 = [(NSMutableArray *)self->_clickStatesConfigured objectAtIndexedSubscript:v11];
          [v13 setEnabled:0];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v7);
  }

  if ([v37 count])
  {
    v14 = sub_10005FA78();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = [v37 bs_map:&stru_1000F62F8];
      *(_DWORD *)buf = 138543362;
      v47 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "disabling states %{public}@", buf, 0xCu);
    }
    BRController = self->_BRController;
    id v41 = 0;
    [(BRButtonResolverController *)BRController disableStates:v37 clearAsset:1 error:&v41];
    id v17 = v41;
    if (v17)
    {
      long long v18 = sub_10005FA78();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = v37;
        __int16 v48 = 2114;
        id v49 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "error disabling states %{public}@:%{public}@", buf, 0x16u);
      }
    }
  }
  if ([v4 count])
  {
    uint64_t v19 = sub_10005FA78();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = +[NSOrderedSet orderedSetWithArray:v4];
      uint64_t v21 = [v20 array];
      char v22 = [v21 bs_map:&stru_1000F6318];
      unsigned int v23 = [(BRButtonResolverController *)self->_BRController unusedAssetSlots];
      *(_DWORD *)buf = 138543618;
      v47 = v22;
      __int16 v48 = 1024;
      LODWORD(v49) = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "configuring %{public}@ unusedAssetSlots:%d", buf, 0x12u);
    }
    id v24 = [v36 count];
    if (v24 != [v3 count] || (id v25 = objc_msgSend(v3, "count"), v25 != objc_msgSend(v4, "count")))
    {
      v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 584, @"must have same length configs:%@ assets:%@ states:%@", v36, v3, v4 object file lineNumber description];
    }
    v26 = self->_BRController;
    id v40 = 0;
    [(BRButtonResolverController *)v26 setConfigs:v36 withAssets:v3 forStates:v4 error:&v40];
    id v27 = v40;
    if (v27)
    {
      v28 = sub_10005FA78();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        __int16 v48 = 2114;
        id v49 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "error configuring states:%{public}@ error:%{public}@", buf, 0x16u);
      }
    }
  }
  if ([v38 count])
  {
    v29 = sub_10005FA78();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v38 bs_map:&stru_1000F6338];
      *(_DWORD *)buf = 138543362;
      v47 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "enabling states %{public}@", buf, 0xCu);
    }
    v31 = self->_BRController;
    id v39 = 0;
    [(BRButtonResolverController *)v31 enableStates:v38 error:&v39];
    id v32 = v39;
    if (v32)
    {
      v33 = sub_10005FA78();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        __int16 v48 = 2114;
        id v49 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "error enabling states %{public}@:%{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_queue_addChangesForPendingState:(id)a3 configuredState:(id)a4 toStates:(id)a5 configs:(id)a6 assets:(id)a7 enable:(id)a8 disable:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000338F0;
  v25[3] = &unk_1000F62D8;
  id v27 = &v34;
  v28 = &v38;
  id v22 = v15;
  id v26 = v22;
  v29 = &v30;
  +[BKButtonHapticsClickState inspectChangesFromState:v16 toState:v22 withBlock:v25];
  if ([v22 isEnabled])
  {
    if (*((unsigned char *)v39 + 24))
    {
      unsigned int v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 clickState]);
      [v21 addObject:v23];

LABEL_8:
      [(BKButtonHapticsController *)self _queue_addConfigsAndAssetsForClickState:v22 toStates:v17 configs:v18 assets:v19];
      goto LABEL_9;
    }
    if (*((unsigned char *)v31 + 24)) {
      goto LABEL_8;
    }
    if (!*((unsigned char *)v35 + 24)) {
      goto LABEL_9;
    }
    id v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 clickState]);
    [v20 addObject:v24];
    goto LABEL_6;
  }
  if (*((unsigned char *)v35 + 24))
  {
    id v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 clickState]);
    [v21 addObject:v24];
LABEL_6:
  }
LABEL_9:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_queue_addConfigsAndAssetsForClickState:(id)a3 toStates:(id)a4 configs:(id)a5 assets:(id)a6
{
  id v11 = a3;
  id v51 = a6;
  id v12 = a5;
  id v13 = a4;
  unint64_t v14 = (unint64_t)[v11 clickState];
  unsigned int v15 = [v11 shouldUseHaptic];
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v52 = 0;
  if (v14 == 16)
  {
    uint64_t v53 = 100;
    uint64_t v54 = 100;
    uint64_t v52 = 100;
  }
  else
  {
    if (v15)
    {
      unint64_t v16 = v14;
      id v17 = [v11 hapticClickCount];
      id v18 = [v11 assetType];
      id v19 = v17;
      unint64_t v14 = v16;
      [(BKButtonHapticsController *)self _queue_getSlowHapticType:&v54 getMediumHapticType:&v53 getFastHapticType:&v52 fromAssetType:v18 clickCount:v19];
    }
    if (v14 >= 0x11)
    {
      +[NSAssertionHandler currentHandler];
      v40 = unint64_t v39 = v14;
      [v40 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 454, @"Invalid parameter not satisfying: %@", @"bhClickState < BRClickStateCount" object file lineNumber description];

      unint64_t v14 = v39;
    }
    if (v54 < 0)
    {
      +[NSAssertionHandler currentHandler];
      v42 = unint64_t v41 = v14;
      [v42 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 455, @"Invalid parameter not satisfying: %@", @"slowHapticType >= HAButtonHapticType_Default" object file lineNumber description];

      unint64_t v14 = v41;
    }
    if (v53 < 0)
    {
      +[NSAssertionHandler currentHandler];
      v44 = unint64_t v43 = v14;
      [v44 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 456, @"Invalid parameter not satisfying: %@", @"mediumHapticType >= HAButtonHapticType_Default" object file lineNumber description];

      unint64_t v14 = v43;
    }
    if (v52 < 0)
    {
      +[NSAssertionHandler currentHandler];
      v46 = unint64_t v45 = v14;
      [v46 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 457, @"Invalid parameter not satisfying: %@", @"fastHapticType >= HAButtonHapticType_Default" object file lineNumber description];

      unint64_t v14 = v45;
    }
  }
  SEL v50 = a2;
  id v20 = [(BKButtonHapticsController *)self _queue_assetOfType:v54 parameters:0];
  id v21 = [(BKButtonHapticsController *)self _queue_assetOfType:v53 parameters:0];
  id v22 = [(BKButtonHapticsController *)self _queue_assetOfType:v52 parameters:0];
  unsigned int v23 = sub_10005FA78();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v48 = v14;
    id v49 = v12;
    v47 = self;
    if (v14 > 0x10) {
      id v24 = @"<unknown>";
    }
    else {
      id v24 = off_1000F63A8[v14];
    }
    id v25 = v24;
    id v26 = sub_100033F78(v54);
    id v27 = sub_100033F78(v53);
    v28 = sub_100033F78(v52);
    *(_DWORD *)buf = 138544130;
    v56 = v25;
    __int16 v57 = 2114;
    v58 = v26;
    __int16 v59 = 2114;
    v60 = v27;
    __int16 v61 = 2114;
    v62 = v28;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "state:%{public}@ haptics: %{public}@,%{public}@,%{public}@", buf, 0x2Au);

    unint64_t v14 = v48;
    id v12 = v49;
    self = v47;
  }

  if (v20)
  {
    if (v21) {
      goto LABEL_20;
    }
LABEL_23:
    +[NSAssertionHandler currentHandler];
    uint64_t v36 = v35 = v14;
    [v36 handleFailureInMethod:v50 object:self file:@"BKButtonHapticsController.m" lineNumber:470 description:@"nope"];

    unint64_t v14 = v35;
    if (v22) {
      goto LABEL_21;
    }
LABEL_24:
    +[NSAssertionHandler currentHandler];
    v38 = unint64_t v37 = v14;
    [v38 handleFailureInMethod:v50 object:self file:@"BKButtonHapticsController.m" lineNumber:471 description:@"nope"];

    unint64_t v14 = v37;
    goto LABEL_21;
  }
  +[NSAssertionHandler currentHandler];
  v34 = unint64_t v33 = v14;
  [v34 handleFailureInMethod:v50 object:self file:@"BKButtonHapticsController.m" lineNumber:469 description:@"nope"];

  unint64_t v14 = v33;
  if (!v21) {
    goto LABEL_23;
  }
LABEL_20:
  if (!v22) {
    goto LABEL_24;
  }
LABEL_21:
  v29 = [v11 slowConfigDictionaryForHAButtonHapticType:v54];
  uint64_t v30 = [v11 normalConfigDictionaryForHAButtonHapticType:v53];
  v31 = [v11 fastConfigDictionaryForHAButtonHapticType:v52];
  uint64_t v32 = +[NSNumber numberWithUnsignedInteger:v14];
  [v13 addObject:v32];
  [v13 addObject:v32];
  [v13 addObject:v32];

  [v12 addObject:v29];
  [v12 addObject:v30];
  [v12 addObject:v31];

  [v51 addObject:v20];
  [v51 addObject:v21];
  [v51 addObject:v22];
}

- (void)_queue_getSlowHapticType:(int64_t *)a3 getMediumHapticType:(int64_t *)a4 getFastHapticType:(int64_t *)a5 fromAssetType:(int64_t)a6 clickCount:(int64_t)a7
{
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  if (a6) {
    unint64_t v13 = a6;
  }
  else {
    unint64_t v13 = 2;
  }
  if (v13 >= 4)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"BKButtonHapticsController.m" lineNumber:280 description:@"unexpected assetType"];
  }
  if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"BKButtonHapticsController.m" lineNumber:281 description:@"unexpected hapticClickCount"];
  }
  uint64_t v14 = (uint64_t)[(BRButtonResolverController *)self->_BRController maxAssetSlots];
  if (v14 >= 4)
  {
    unsigned int v15 = &unk_1000BF6C0;
    if ((unint64_t)v14 > 5) {
      unsigned int v15 = &unk_1000BF750;
    }
    int64_t v16 = (int64_t)v15 + 72 * a7 + 8 * v13;
    *a3 = *(void *)(v16 - 80);
    *a4 = *(void *)(v16 - 56);
    *a5 = *(void *)(v16 - 32);
  }
}

- (id)_queue_assetOfType:(int64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    if (!self->_assetCache)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      assetCache = self->_assetCache;
      self->_assetCache = v7;
    }
    v9 = +[NSNumber numberWithInteger:a3];
    id v10 = [(NSMutableDictionary *)self->_assetCache objectForKey:v9];
    if (!v10)
    {
      id v10 = +[BRAsset withType:a3 andParameters:v6];
      [(NSMutableDictionary *)self->_assetCache setObject:v10 forKey:v9];
    }
  }
  else
  {
    id v10 = +[BRAsset nullAsset];
  }

  return v10;
}

- (void)_configureSyncWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000343B4;
  v7[3] = &unk_1000F7FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_configureAsyncWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BKButtonHapticsController.m", 233, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000344F8;
  block[3] = &unk_1000F7FC8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendArraySection:self->_clickStatesPending withName:@"clickStatesPending" multilinePrefix:@" " skipIfEmpty:0];
  [v3 appendArraySection:self->_clickStatesConfigured withName:@"clickStatesConfigured" multilinePrefix:@" " skipIfEmpty:0];
  id v4 = [v3 build];

  return v4;
}

- (BKButtonHapticsController)initWithBHButtonHapticsController:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BKButtonHapticsController;
  id v6 = [(BKButtonHapticsController *)&v33 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_BRController, a3);
    dispatch_group_t v8 = dispatch_group_create();
    controllerReadyGroup = v7->_controllerReadyGroup;
    v7->_controllerReadyGroup = (OS_dispatch_group *)v8;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v12 = +[BKSButtonHapticsDefinition definitionForHomeButton];
    homeButtonDefinition = v7->_homeButtonDefinition;
    v7->_homeButtonDefinition = (BKSButtonHapticsDefinition *)v12;

    uint64_t v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clickStatesConfigured = v7->_clickStatesConfigured;
    v7->_clickStatesConfigured = v14;

    int64_t v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clickStatesPending = v7->_clickStatesPending;
    v7->_clickStatesPending = v16;

    for (uint64_t i = 0; i != 17; ++i)
    {
      id v19 = +[BKButtonHapticsClickState clickStateWithState:i];
      [(NSMutableArray *)v7->_clickStatesConfigured addObject:v19];
      id v20 = [v19 copy];
      [(NSMutableArray *)v7->_clickStatesPending addObject:v20];
    }
    dispatch_group_enter((dispatch_group_t)v7->_controllerReadyGroup);
    BRController = v7->_BRController;
    id v22 = dispatch_get_global_queue(21, 0);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100034904;
    v31[3] = &unk_1000F8E78;
    unsigned int v23 = v7;
    uint64_t v32 = v23;
    [(BRButtonResolverController *)BRController scheduleReadyNotificationOnDispatchQueue:v22 withBlock:v31];

    id v24 = +[BSPlatform sharedInstance];
    id v25 = [v24 homeButtonType];

    if (v25 == (id)2)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000349C4;
      v29[3] = &unk_1000F62B0;
      uint64_t v30 = v23;
      [(BKButtonHapticsController *)v30 _configureAsyncWithBlock:v29];
      id v26 = v30;
    }
    else
    {
      id v26 = +[BKSButtonHapticsDefinition definitionForHomeButton];
      [v26 setClickHapticAssetType:2];
      [v26 setMinimumMultiplePressTimeInterval:2.0];
      [v26 setMaximumMultiplePressTimeInterval:2.0];
      [v26 setMinimumLongPressTimeInterval:6.0];
      [v26 setMaximumLongPressTimeInterval:6.0];
      [v26 setMaximumPressCount:3];
      [v26 setMaximumTapCount:0];
      id v34 = v26;
      id v27 = +[NSArray arrayWithObjects:&v34 count:1];
      [(BKButtonHapticsController *)v23 applyDefinitions:v27];
    }
  }

  return v7;
}

- (BKButtonHapticsController)init
{
  v3 = +[BRButtonResolverController sharedInstance];
  id v4 = [(BKButtonHapticsController *)self initWithBHButtonHapticsController:v3];

  return v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034B14;
  block[3] = &unk_1000F7D08;
  block[4] = a1;
  if (qword_100122DF0 != -1) {
    dispatch_once(&qword_100122DF0, block);
  }
  v2 = (void *)qword_100122DF8;

  return v2;
}

@end