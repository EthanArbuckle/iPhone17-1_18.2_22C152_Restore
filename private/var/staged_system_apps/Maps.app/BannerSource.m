@interface BannerSource
- (BNBannerSource)carPlaySource;
- (BOOL)_isDynamicIslandTarget:(id)a3;
- (BOOL)_shouldPresentForPreviousGuidance:(id)a3 nextGuidance:(id)a4 type:(unint64_t)a5 target:(id)a6;
- (BOOL)_shouldSuppressNextGuidance:(id)a3 type:(unint64_t)a4 target:(id)a5;
- (BOOL)_shouldUseAperturePresentationForBannerItem:(id)a3 inTarget:(id)a4;
- (BOOL)updateBannerForGuidanceState:(id)a3 onTarget:(id)a4 type:(unint64_t)a5;
- (BannerSource)init;
- (id)_bannerItemForType:(unint64_t)a3 guidanceState:(id)a4;
- (id)_bannerPresentableForBannerItem:(id)a3 inTarget:(id)a4;
- (id)_bannerViewForBannerItem:(id)a3 inTarget:(id)a4;
- (id)activeBannerViewController;
- (id)activeCarPlayBannerViewController;
- (id)bannerIdForBannerItem:(id)a3;
- (void)_cleanUpType:(Class)a3 onTarget:(id)a4 animated:(BOOL)a5;
- (void)_enqueue:(id)a3 forTarget:(id)a4;
- (void)_revokeBanner:(id)a3 animated:(BOOL)a4;
- (void)_updateCarPlayBannerSource;
- (void)cleanUpCarPlayBanners;
- (void)cleanUpPhoneBanners;
- (void)dealloc;
- (void)mapsApplicationDidTerminate;
- (void)pokeTarget:(id)a3;
- (void)presentBannerItem:(id)a3 onTarget:(id)a4;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)receivedGuidanceState:(id)a3;
- (void)reset;
- (void)resetExcludingJindo;
- (void)setCarPlaySource:(id)a3;
- (void)signalTarget:(id)a3;
@end

@implementation BannerSource

- (BannerSource)init
{
  v21.receiver = self;
  v21.super_class = (Class)BannerSource;
  v2 = [(BannerSource *)&v21 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
    presentedByTarget = v2->_presentedByTarget;
    v2->_presentedByTarget = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    inAppSeenGuidanceByTarget = v2->_inAppSeenGuidanceByTarget;
    v2->_inAppSeenGuidanceByTarget = (NSMapTable *)v5;

    uint64_t v7 = +[NSMapTable weakToStrongObjectsMapTable];
    queuedItemsByTarget = v2->_queuedItemsByTarget;
    v2->_queuedItemsByTarget = (NSMapTable *)v7;

    uint64_t v9 = objc_opt_new();
    bannerIncrements = v2->_bannerIncrements;
    v2->_bannerIncrements = (NSMutableDictionary *)v9;

    uint64_t v11 = +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:MapsAppBundleId];
    mainSource = v2->_mainSource;
    v2->_mainSource = (BNBannerSource *)v11;

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"mapsApplicationDidTerminate" name:UIApplicationWillTerminateNotification object:0];

    uint64_t v14 = objc_opt_new();
    latestBannerForTarget = v2->_latestBannerForTarget;
    v2->_latestBannerForTarget = (NSMapTable *)v14;

    v16 = v2->_latestBannerForTarget;
    v17 = objc_opt_new();
    [(NSMapTable *)v16 setObject:v17 forKey:v2->_mainSource];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_updateCarPlayBannerSource" name:UISceneWillConnectNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_updateCarPlayBannerSource" name:UISceneDidDisconnectNotification object:0];
  }
  return v2;
}

- (void)receivedGuidanceState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000AD30C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 shortDescription];
    *(_DWORD *)buf = 138412290;
    v85 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received: %@", buf, 0xCu);
  }
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if ([v4 showInMainScreen])
  {
    [v7 addObject:self->_mainSource];
  }
  else
  {
    [(NSMapTable *)self->_inAppSeenGuidanceByTarget setObject:v4 forKey:self->_mainSource];
    [(BannerSource *)self cleanUpPhoneBanners];
  }
  if (self->_carPlaySource)
  {
    if ([v4 showInCarPlay])
    {
      [v7 addObject:self->_carPlaySource];
    }
    else
    {
      [(NSMapTable *)self->_inAppSeenGuidanceByTarget setObject:v4 forKey:self->_carPlaySource];
      [(BannerSource *)self cleanUpCarPlayBanners];
    }
  }
  unsigned int v8 = [v4 transportType];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v7;
  id v77 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v77)
  {
    uint64_t v75 = *(void *)v80;
    id v78 = v4;
    unsigned int v76 = v8;
    do
    {
      for (i = 0; i != v77; i = (char *)i + 1)
      {
        if (*(void *)v80 != v75) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v11 = sub_1000AD30C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ - Processing", buf, 0xCu);
        }

        if (v8 > 3 || v8 == 1)
        {
          [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
          [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
        }
        else
        {
          if (![(BannerSource *)self updateBannerForGuidanceState:v4 onTarget:v10 type:0])
          {
            [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
            if (![(BannerSource *)self _shouldSuppressNextGuidance:v4 type:0 target:v10])
            {
              v12 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:v10];
              v13 = [v12 objectForKeyedSubscript:&off_1013A7B88];

              uint64_t v14 = sub_1000AD30C();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "New guidance; removing banner. previousBanner: %@",
                  buf,
                  0xCu);
              }

              if (!v13) {
                goto LABEL_25;
              }
              v15 = [v13 bannerView];
              v16 = [v15 item];
              v17 = [v16 guidanceState];
              unsigned int v18 = [(BannerSource *)self _shouldPresentForPreviousGuidance:v17 nextGuidance:v4 type:0 target:v10];

              if (v18)
              {
LABEL_25:
                v19 = sub_1000AD30C();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  v20 = [v4 uniqueIdForBannerType:0];
                  *(_DWORD *)buf = 138412290;
                  v85 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Enqueue item for this maneuver: %@", buf, 0xCu);
                }
                objc_super v21 = [(BannerSource *)self _bannerItemForType:0 guidanceState:v4];
                [(BannerSource *)self _enqueue:v21 forTarget:v10];
              }
            }
          }
          v22 = [v4 trafficIncidentAlert];

          if (v22)
          {
            unsigned __int8 v23 = [(BannerSource *)self updateBannerForGuidanceState:v4 onTarget:v10 type:1];
            if ([(BannerSource *)self _isDynamicIslandTarget:v10])
            {
              v24 = [(NSMapTable *)self->_presentedByTarget objectForKey:v10];
              v25 = [v4 uniqueIdForBannerType:1];
              v26 = [v24 alternateBannerView];
              v27 = [v26 item];
              v28 = [v27 uniqueId];
              unsigned __int8 v29 = [v25 isEqual:v28];

              if ((v29 & 1) == 0)
              {
                v30 = [(BannerSource *)self _bannerItemForType:1 guidanceState:v78];
                v31 = [(BannerSource *)self _bannerViewForBannerItem:v30 inTarget:v10];
                [v24 postTemporaryAlternateBannerView:v31];
              }
              id v4 = v78;
            }
            else if ((v23 & 1) == 0)
            {
              v32 = sub_1000AD30C();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "New traffic alert state; removing previous maneuver",
                  buf,
                  2u);
              }

              [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
              v33 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:v10];
              v34 = [v33 objectForKeyedSubscript:&off_1013A7BA0];

              if (!v34) {
                goto LABEL_40;
              }
              v35 = [v34 bannerView];
              v36 = [v35 item];
              v37 = [v36 guidanceState];
              unsigned int v38 = [(BannerSource *)self _shouldPresentForPreviousGuidance:v37 nextGuidance:v78 type:1 target:v10];

              id v4 = v78;
              if (v38)
              {
LABEL_40:
                v39 = sub_1000AD30C();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  v40 = [v4 uniqueIdForBannerType:1];
                  *(_DWORD *)buf = 138412290;
                  v85 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Enqueuing new traffic alert: %@", buf, 0xCu);
                }
                v41 = [(BannerSource *)self _bannerItemForType:1 guidanceState:v4];
                [(BannerSource *)self _enqueue:v41 forTarget:v10];
              }
            }
          }
        }
        v42 = [v4 alightMessage];
        if (v42) {
          unsigned __int8 v43 = [v4 isMapsForegroundOnMainScreen];
        }
        else {
          unsigned __int8 v43 = 0;
        }

        if ([(BannerSource *)self _isDynamicIslandTarget:v10] && v8 == 1 && (v43 & 1) == 0)
        {
          if (![(BannerSource *)self updateBannerForGuidanceState:v4 onTarget:v10 type:3])
          {
            [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
            v44 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:v10];
            v45 = [v44 objectForKeyedSubscript:&off_1013A7BB8];

            v46 = sub_1000AD30C();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v45;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "New guidance; removing banner. previousBanner: %@",
                buf,
                0xCu);
            }

            if (!v45) {
              goto LABEL_55;
            }
            v47 = [v45 bannerView];
            v48 = [v47 item];
            v49 = [v48 guidanceState];
            unsigned int v50 = [(BannerSource *)self _shouldPresentForPreviousGuidance:v49 nextGuidance:v78 type:3 target:v10];

            id v4 = v78;
            if (v50)
            {
LABEL_55:
              v51 = sub_1000AD30C();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                v52 = [v4 uniqueIdForBannerType:3];
                *(_DWORD *)buf = 138412290;
                v85 = v52;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Enqueue item for this maneuver: %@", buf, 0xCu);
              }
              v53 = [(BannerSource *)self _bannerItemForType:3 guidanceState:v4];
              [(BannerSource *)self _enqueue:v53 forTarget:v10];
            }
          }
        }
        else
        {
          [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
          if (v8 != 1) {
            goto LABEL_76;
          }
        }
        v54 = [v4 alightMessage];

        if (v54)
        {
          v55 = [(BannerSource *)self _bannerItemForType:2 guidanceState:v4];
          unsigned int v56 = [(BannerSource *)self _shouldUseAperturePresentationForBannerItem:v55 inTarget:v10];
          v57 = sub_1000AD30C();
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_INFO);
          if (v56)
          {
            if (v58)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "New transit alight message; populating jindo",
                buf,
                2u);
            }

            v59 = [(NSMapTable *)self->_presentedByTarget objectForKey:v10];
            v60 = [v4 uniqueIdForBannerType:2];
            v61 = [v59 alternateBannerView];
            v62 = [v61 item];
            v63 = [v62 uniqueId];
            unsigned __int8 v64 = [v60 isEqual:v63];

            if ((v64 & 1) == 0)
            {
              v65 = [(BannerSource *)self _bannerViewForBannerItem:v55 inTarget:v10];
              [v59 postTemporaryAlternateBannerView:v65];
            }
            id v4 = v78;
LABEL_75:

            goto LABEL_76;
          }
          if (v58)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "New transit alight message; removing previous banner",
              buf,
              2u);
          }

          [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:v10 animated:1];
          v66 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:v10];
          v59 = [v66 objectForKeyedSubscript:&off_1013A7BD0];

          if (v59)
          {
            v67 = [v59 bannerView];
            v68 = [v67 item];
            v69 = [v68 guidanceState];
            unsigned int v70 = [(BannerSource *)self _shouldPresentForPreviousGuidance:v69 nextGuidance:v78 type:2 target:v10];

            id v4 = v78;
            if (!v70) {
              goto LABEL_75;
            }
          }
          v71 = sub_1000AD30C();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = [v4 uniqueIdForBannerType:2];
            *(_DWORD *)buf = 138412290;
            v85 = v72;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Enqueuing new transit alight: %@", buf, 0xCu);
          }
          [(BannerSource *)self _enqueue:v55 forTarget:v10];
          unsigned int v73 = [(BannerSource *)self _isDynamicIslandTarget:v10];

          if (v73)
          {
            [(BannerSource *)self signalTarget:v10];
            goto LABEL_77;
          }
        }
LABEL_76:
        [(BannerSource *)self pokeTarget:v10];
LABEL_77:
        unsigned int v8 = v76;
      }
      id v77 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v77);
  }
}

- (void)cleanUpPhoneBanners
{
  [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:self->_mainSource animated:1];
  [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:self->_mainSource animated:1];
  if (SBUIIsSystemApertureEnabled())
  {
    uint64_t v3 = objc_opt_class();
    mainSource = self->_mainSource;
    [(BannerSource *)self _cleanUpType:v3 onTarget:mainSource animated:1];
  }
}

- (void)_cleanUpType:(Class)a3 onTarget:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  queuedItemsByTarget = self->_queuedItemsByTarget;
  id v8 = a4;
  uint64_t v9 = [(NSMapTable *)queuedItemsByTarget objectForKey:v8];
  [v9 removeItemsOfType:objc_opt_class()];

  id v13 = [(NSMapTable *)self->_presentedByTarget objectForKey:v8];

  v10 = [v13 bannerView];
  uint64_t v11 = [v10 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(BannerSource *)self _revokeBanner:v13 animated:v5];
  }
}

- (void)_updateCarPlayBannerSource
{
  unsigned int v3 = +[UIApplication _maps_isAnySceneConnectedForRole:_UIWindowSceneSessionRoleCarPlay];
  carPlaySource = self->_carPlaySource;
  if (v3)
  {
    if (!carPlaySource)
    {
      BOOL v5 = sub_1000AD30C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlay connected, we can show banners there now", buf, 2u);
      }

      latestBannerForTarget = self->_latestBannerForTarget;
      id v7 = objc_opt_new();
      id v8 = [(BannerSource *)self carPlaySource];
      [(NSMapTable *)latestBannerForTarget setObject:v7 forKey:v8];
    }
  }
  else if (carPlaySource)
  {
    uint64_t v9 = sub_1000AD30C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CarPlay disconnected, tear down all banner support", v10, 2u);
    }

    [(NSMapTable *)self->_latestBannerForTarget removeObjectForKey:self->_carPlaySource];
    [(BannerSource *)self cleanUpCarPlayBanners];
    [(BannerSource *)self setCarPlaySource:0];
  }
}

- (void)dealloc
{
  [(BNBannerSource *)self->_mainSource invalidate];
  [(BNBannerSource *)self->_carPlaySource invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BannerSource;
  [(BannerSource *)&v3 dealloc];
}

- (BNBannerSource)carPlaySource
{
  carPlaySource = self->_carPlaySource;
  if (!carPlaySource)
  {
    id v4 = +[BNBannerSource bannerSourceForDestination:1 forRequesterIdentifier:MapsAppBundleId];
    BOOL v5 = self->_carPlaySource;
    self->_carPlaySource = v4;

    carPlaySource = self->_carPlaySource;
  }

  return carPlaySource;
}

- (void)setCarPlaySource:(id)a3
{
  BOOL v5 = (BNBannerSource *)a3;
  carPlaySource = self->_carPlaySource;
  p_carPlaySource = &self->_carPlaySource;
  v6 = carPlaySource;
  if (carPlaySource != v5)
  {
    uint64_t v9 = v5;
    [(BNBannerSource *)v6 invalidate];
    objc_storeStrong((id *)p_carPlaySource, a3);
    BOOL v5 = v9;
  }
}

- (id)activeCarPlayBannerViewController
{
  if (self->_carPlaySource)
  {
    v2 = -[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)activeBannerViewController
{
  return [(NSMapTable *)self->_presentedByTarget objectForKey:self->_mainSource];
}

- (void)reset
{
  objc_super v3 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:self->_mainSource];
  [v3 removeAllObjects];

  [(NSMapTable *)self->_inAppSeenGuidanceByTarget removeObjectForKey:self->_mainSource];
  [(BannerSource *)self cleanUpPhoneBanners];
  if (self->_carPlaySource)
  {
    id v4 = -[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:");
    [v4 removeAllObjects];

    [(NSMapTable *)self->_inAppSeenGuidanceByTarget removeObjectForKey:self->_carPlaySource];
    [(BannerSource *)self cleanUpCarPlayBanners];
  }
}

- (void)resetExcludingJindo
{
  if ((SBUIIsSystemApertureEnabled() & 1) == 0)
  {
    objc_super v3 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:self->_mainSource];
    [v3 removeAllObjects];

    [(BannerSource *)self cleanUpPhoneBanners];
  }
  if (self->_carPlaySource)
  {
    id v4 = -[NSMapTable objectForKey:](self->_latestBannerForTarget, "objectForKey:");
    [v4 removeAllObjects];

    [(BannerSource *)self cleanUpCarPlayBanners];
  }
}

- (BOOL)_isDynamicIslandTarget:(id)a3
{
  id v4 = (BNBannerSource *)a3;
  if (SBUIIsSystemApertureEnabled()) {
    BOOL v5 = self->_mainSource == v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldSuppressNextGuidance:(id)a3 type:(unint64_t)a4 target:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = [(BannerSource *)self _isDynamicIslandTarget:v9];
  BOOL v11 = 0;
  if (!a4 && (v10 & 1) == 0)
  {
    v12 = [(NSMapTable *)self->_inAppSeenGuidanceByTarget objectForKey:v9];
    id v13 = v12;
    if (!v12
      || ([v12 shouldPresentNextGuidanceUpdate:v8 forType:0 target:v9] & 1) != 0
      || [v9 destination] == (id)1 && (objc_msgSend(v8, "isAlerting") & 1) != 0)
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v14 = sub_1000AD30C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v13 shortDescription];
        v16 = [v8 shortDescription];
        int v18 = 138412546;
        v19 = v15;
        __int16 v20 = 2112;
        objc_super v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Suppressing alert as it is not significantly different to what was seen in app; seen: %@ vs new: %@",
          (uint8_t *)&v18,
          0x16u);
      }
      BOOL v11 = 1;
    }
  }
  return v11;
}

- (BOOL)_shouldPresentForPreviousGuidance:(id)a3 nextGuidance:(id)a4 type:(unint64_t)a5 target:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(BannerSource *)self _isDynamicIslandTarget:v12]) {
    unsigned __int8 v13 = 1;
  }
  else {
    unsigned __int8 v13 = [v10 shouldPresentNextGuidanceUpdate:v11 forType:a5 target:v12];
  }

  return v13;
}

- (BOOL)_shouldUseAperturePresentationForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6 = a3;
  if ([(BannerSource *)self _isDynamicIslandTarget:a4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 guidanceState];
      unsigned int v8 = [v7 isMapsForegroundOnMainScreen] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)_bannerViewForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v7 destination];
LABEL_4:
    unsigned int v8 = (objc_class *)objc_opt_class();
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  unsigned int v8 = 0;
LABEL_5:
  id v9 = [[v8 alloc] initWithTarget:v7 item:v6 aperturePresentation:[self _shouldUseAperturePresentationForBannerItem:v6 inTarget:v7]];

  return v9;
}

- (id)_bannerPresentableForBannerItem:(id)a3 inTarget:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(BannerSource *)self _bannerViewForBannerItem:v7 inTarget:v6];
  id v9 = [MapsBannerViewController alloc];
  id v10 = [(BannerSource *)self bannerIdForBannerItem:v7];

  id v11 = -[MapsBannerViewController initWithRequestId:target:bannerView:delegate:aperturePresentation:](v9, "initWithRequestId:target:bannerView:delegate:aperturePresentation:", v10, v6, v8, self, [v8 aperturePresentation]);

  return v11;
}

- (id)bannerIdForBannerItem:(id)a3
{
  id v4 = [a3 uniqueId];
  uint64_t v5 = [(NSMutableDictionary *)self->_bannerIncrements objectForKeyedSubscript:v4];
  id v6 = (void *)v5;
  id v7 = &off_1013A7BE8;
  if (v5) {
    id v7 = (_UNKNOWN **)v5;
  }
  unsigned int v8 = v7;

  id v9 = +[NSString stringWithFormat:@"%@-%@", v4, v8];
  id v10 = (char *)[v8 unsignedIntegerValue];

  id v11 = +[NSNumber numberWithUnsignedInteger:v10 + 1];
  [(NSMutableDictionary *)self->_bannerIncrements setObject:v11 forKeyedSubscript:v4];

  return v9;
}

- (void)pokeTarget:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_presentedByTarget, "objectForKey:");

  if (!v4) {
    [(BannerSource *)self signalTarget:v5];
  }
}

- (void)signalTarget:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMapTable objectForKey:](self->_queuedItemsByTarget, "objectForKey:");
  id v5 = [v4 popItem];
  if (v5) {
    [(BannerSource *)self presentBannerItem:v5 onTarget:v6];
  }
}

- (void)presentBannerItem:(id)a3 onTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(BannerSource *)self _bannerPresentableForBannerItem:v6 inTarget:v7];
  id v9 = [v8 bannerView];
  unsigned int v10 = [v9 aperturePresentation];

  if (v10)
  {
    uint64_t v32 = kSBUIPresentableSystemApertureSupportingUserInfoKey;
    v33 = &__kCFBooleanTrue;
    id v11 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  }
  else
  {
    id v11 = &__NSDictionary0__struct;
  }
  id v12 = sub_1000AD30C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v13 = [v8 requestIdentifier];
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Registering banner %@", buf, 0xCu);
  }
  id v25 = 0;
  unsigned __int8 v14 = [v7 postPresentable:v8 options:1 userInfo:v11 error:&v25];
  id v15 = v25;
  v16 = sub_1000AD30C();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      int v18 = "Presenting next banner: %@ (%@)";
      v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_INFO;
      uint32_t v21 = 22;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v7;
    int v18 = "Failed to add new banner: %@ error: %@ (%@)";
    v19 = v17;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    uint32_t v21 = 32;
    goto LABEL_11;
  }

  [(NSMapTable *)self->_presentedByTarget setObject:v8 forKey:v7];
  v22 = [(NSMapTable *)self->_latestBannerForTarget objectForKey:v7];
  unsigned __int8 v23 = [v8 bannerView];
  v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 bannerType]);
  [v22 setObject:v8 forKeyedSubscript:v24];
}

- (void)_revokeBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_1000AD30C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [v6 target];
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Revoking specific banner: %@ on target: %@", buf, 0x16u);
  }
  id v9 = [v6 target];
  unsigned int v10 = [v6 requestIdentifier];
  id v14 = 0;
  id v11 = [v9 revokePresentableWithRequestIdentifier:v10 reason:@"Dismissed" animated:v4 userInfo:&__NSDictionary0__struct error:&v14];
  id v12 = v14;

  if (v12)
  {
    unsigned __int8 v13 = sub_1000AD30C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error: %@ revoking specific banner: %@", buf, 0x16u);
    }

    if ([v12 code] == (id)3) {
      [(BannerSource *)self presentableDidDisappearAsBanner:v6 withReason:@"MapsRevocationReasonErrorRecovery"];
    }
  }
}

- (void)_enqueue:(id)a3 forTarget:(id)a4
{
  queuedItemsByTarget = self->_queuedItemsByTarget;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSMapTable *)queuedItemsByTarget objectForKey:v7];
  unsigned int v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  [v12 addItem:v8];
  [(NSMapTable *)self->_queuedItemsByTarget setObject:v12 forKey:v7];
}

- (id)_bannerItemForType:(unint64_t)a3 guidanceState:(id)a4
{
  id v5 = a4;
  if (a3 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = [objc_alloc(*off_1012F1818[a3]) initWithGuidanceState:v5];
  }

  return v6;
}

- (BOOL)updateBannerForGuidanceState:(id)a3 onTarget:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  presentedByTarget = self->_presentedByTarget;
  id v10 = a4;
  id v11 = [(NSMapTable *)presentedByTarget objectForKey:v10];
  id v12 = [v11 bannerView];
  unsigned __int8 v13 = [v12 aperturePresentation];
  unsigned int v14 = [(BannerSource *)self _isDynamicIslandTarget:v10];

  if (v12) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15 && (v13 & 1) != 0) {
    goto LABEL_7;
  }
  id v16 = [v8 uniqueIdForBannerType:a5];
  __int16 v17 = [v12 item];
  id v18 = [v17 uniqueId];
  unsigned int v19 = [v16 isEqual:v18];

  if (v19)
  {
LABEL_7:
    [v11 updateFromGuidanceState:v8];
    BOOL v20 = 1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)mapsApplicationDidTerminate
{
  [(BannerSource *)self cleanUpPhoneBanners];
  if (self->_carPlaySource)
  {
    [(BannerSource *)self cleanUpCarPlayBanners];
  }
}

- (void)cleanUpCarPlayBanners
{
  [(BannerSource *)self _cleanUpType:objc_opt_class() onTarget:self->_carPlaySource animated:1];
  uint64_t v3 = objc_opt_class();
  carPlaySource = self->_carPlaySource;

  [(BannerSource *)self _cleanUpType:v3 onTarget:carPlaySource animated:1];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  presentedByTarget = self->_presentedByTarget;
  id v9 = [v6 target];
  id v10 = [(NSMapTable *)presentedByTarget objectForKey:v9];

  id v11 = sub_1000AD30C();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10 == v6)
  {
    if (v12)
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finished presenting banner: %@ reason: %@", (uint8_t *)&v15, 0x16u);
    }

    unsigned __int8 v13 = self->_presentedByTarget;
    id v11 = [v6 target];
    [(NSMapTable *)v13 removeObjectForKey:v11];
  }
  else if (v12)
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BannerKit revoked banner: %@ reason: %@", (uint8_t *)&v15, 0x16u);
  }

  unsigned int v14 = [v6 target];
  [(BannerSource *)self signalTarget:v14];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlaySource, 0);
  objc_storeStrong((id *)&self->_mainSource, 0);
  objc_storeStrong((id *)&self->_bannerIncrements, 0);
  objc_storeStrong((id *)&self->_queuedItemsByTarget, 0);
  objc_storeStrong((id *)&self->_inAppSeenGuidanceByTarget, 0);
  objc_storeStrong((id *)&self->_presentedByTarget, 0);

  objc_storeStrong((id *)&self->_latestBannerForTarget, 0);
}

@end