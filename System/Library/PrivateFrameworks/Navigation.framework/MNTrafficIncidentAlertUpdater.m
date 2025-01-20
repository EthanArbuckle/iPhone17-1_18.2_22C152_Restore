@interface MNTrafficIncidentAlertUpdater
- (BOOL)useTriggerPointRangeBannerQueuing;
- (MNTrafficIncidentAlert)activeAlert;
- (MNTrafficIncidentAlertUpdater)init;
- (MNTrafficIncidentAlertUpdaterDelegate)delegate;
- (id)_nextAlert;
- (void)_activateAlert:(id)a3 forLocation:(id)a4;
- (void)_removeActiveAlert;
- (void)_updateActiveAlertForLocation:(id)a3;
- (void)_updateAlertDistanceAndETAForLocation:(id)a3;
- (void)_updateForAlertsFromResponseUsingDistancePoints:(id)a3;
- (void)_updateForLocationUsingDistancePoints:(id)a3;
- (void)clearAlerts;
- (void)dealloc;
- (void)setActiveAlert:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUseTriggerPointRangeBannerQueuing:(BOOL)a3;
- (void)updateForAlertsFromResponse:(id)a3 updatedLocation:(id)a4;
- (void)updateForLocation:(id)a3;
- (void)updateForReroute:(id)a3;
- (void)updateIncidentResultForETARequest:(id)a3;
- (void)updateIncidentResultForRerouteRequest:(id)a3;
@end

@implementation MNTrafficIncidentAlertUpdater

- (MNTrafficIncidentAlertUpdater)init
{
  v13.receiver = self;
  v13.super_class = (Class)MNTrafficIncidentAlertUpdater;
  v2 = [(MNTrafficIncidentAlertUpdater *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pendingAlerts = v2->_pendingAlerts;
    v2->_pendingAlerts = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    nextAlertDisplayTime = v2->_nextAlertDisplayTime;
    v2->_nextAlertDisplayTime = (NSDate *)v5;

    uint64_t v7 = objc_opt_new();
    displayedBannerIds = v2->_displayedBannerIds;
    v2->_displayedBannerIds = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    trackedBannerIDs = v2->_trackedBannerIDs;
    v2->_trackedBannerIDs = (NSMutableSet *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(MNTrafficIncidentAlertUpdater *)self clearAlerts];
  v3.receiver = self;
  v3.super_class = (Class)MNTrafficIncidentAlertUpdater;
  [(MNTrafficIncidentAlertUpdater *)&v3 dealloc];
}

- (void)setUseTriggerPointRangeBannerQueuing:(BOOL)a3
{
  if (self->_useTriggerPointRangeBannerQueuing != a3)
  {
    self->_useTriggerPointRangeBannerQueuing = a3;
    [(MNTrafficIncidentAlertUpdater *)self clearAlerts];
  }
}

- (MNTrafficIncidentAlert)activeAlert
{
  return self->_activeAlert;
}

- (void)setActiveAlert:(id)a3
{
  uint64_t v5 = (MNTrafficIncidentAlert *)a3;
  if (self->_activeAlert != v5)
  {
    v10 = v5;
    v6 = [MEMORY[0x1E4F1C9C8] now];
    if (v10)
    {
      activeAlertDisplayedTime = self->_activeAlertDisplayedTime;
      self->_activeAlertDisplayedTime = v6;
    }
    else
    {
      [(MNTrafficIncidentAlert *)self->_activeAlert overlapDelayTime];
      -[NSDate dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
      nextAlertDisplayTime = self->_nextAlertDisplayTime;
      self->_nextAlertDisplayTime = v8;

      activeAlertDisplayedTime = self->_activeAlertDisplayedTime;
      self->_activeAlertDisplayedTime = 0;
    }

    objc_storeStrong((id *)&self->_activeAlert, a3);
    uint64_t v5 = v10;
  }
}

- (void)updateForLocation:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 state] == 1)
  {
    objc_storeStrong((id *)&self->_lastLocation, a3);
    if (self->_useTriggerPointRangeBannerQueuing)
    {
      v6 = [(MNTrafficIncidentAlertUpdater *)self _nextAlert];
      uint64_t v7 = v6;
      if (v6)
      {
        int v8 = [v6 previousBannerChange];
        uint64_t v9 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];

        if (v9) {
          int v10 = v8;
        }
        else {
          int v10 = 0;
        }
        v11 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];
        unint64_t v12 = [v11 priority];
        unint64_t v13 = [v7 priority];

        [(NSDate *)self->_activeAlertDisplayedTime timeIntervalSinceNow];
        double v15 = v14;
        v16 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];
        [v16 minDisplayTime];
        double v18 = v17;

        switch(v10)
        {
          case 0:
            v19 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];
            if (!v19 || (v19, v12 < v13) && v18 < -v15)
            {
              v20 = [v7 triggerRange];
              v21 = [v20 showTriggerPoint];

              LODWORD(v20) = [v21 shouldActivateForLocation:v5];
              if (v20) {
                goto LABEL_16;
              }
            }
            break;
          case 1:
            if (v12 >= v13) {
              break;
            }
            uint64_t v22 = [v7 triggerRange];
            v23 = [(id)v22 showTriggerPoint];

            LOBYTE(v22) = [v23 shouldActivateForLocation:v5];
            if ((v22 & 1) == 0) {
              break;
            }
LABEL_16:
            v24 = [v7 incident];

            if (!v24) {
              goto LABEL_19;
            }
            v25 = [(MNLocation *)self->_lastLocation routeMatch];
            v26 = [v25 route];
            v27 = [v7 triggerRange];
            v28 = [v27 showTriggerPoint];
            uint64_t v29 = [v28 referenceCoordinate];

            objc_msgSend(v26, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, objc_msgSend(v25, "routeCoordinate"));
            double v31 = v30;
            objc_msgSend(v26, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, objc_msgSend(v7, "incidentCoordinate"));
            double v33 = v32;
            if (v32 <= 2.22044605e-16)
            {
            }
            else
            {
              GEOConfigGetDouble();
              double v35 = v34;

              if (v31 / v33 <= v35)
              {
LABEL_19:
                self->_trafficIncidentStatus = 0;
                [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
                [(MNTrafficIncidentAlertUpdater *)self _activateAlert:v7 forLocation:v5];
                break;
              }
            }
            v38 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              int v39 = 134218240;
              double v40 = v31;
              __int16 v41 = 2048;
              double v42 = v33;
              _os_log_impl(&dword_1B542B000, v38, OS_LOG_TYPE_DEFAULT, "Dropping dodgeball since user is too close to the incident. distanceFromAlertStartToCurrentLocation: %0.1fm | distanceFromAlertStartToIncident: %0.1fm", (uint8_t *)&v39, 0x16u);
            }

            [(NSMutableSet *)self->_pendingAlerts removeObject:v7];
            break;
          case 2:
            v36 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];

            if (v36)
            {
              v37 = [(MNTrafficIncidentAlertUpdater *)self activeAlert];
              [v7 updateAlertIDWithAlert:v37];

              [(MNTrafficIncidentAlertUpdater *)self setActiveAlert:v7];
            }
            break;
          case 3:
            [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
            break;
          default:
            break;
        }
      }
      [(MNTrafficIncidentAlertUpdater *)self _updateActiveAlertForLocation:v5];

      goto LABEL_28;
    }
    [(MNTrafficIncidentAlertUpdater *)self _updateForLocationUsingDistancePoints:v5];
  }
LABEL_28:
}

- (void)updateForReroute:(id)a3
{
  id v4 = a3;
  activeAlert = self->_activeAlert;
  if (!activeAlert
    || ([(MNTrafficIncidentAlert *)activeAlert alternateRoute],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v4))
  {
    self->_trafficIncidentStatus = 0;
  }
  else
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "Clearing traffic incident alerts because of a reroute.", v8, 2u);
    }

    [(MNTrafficIncidentAlertUpdater *)self clearAlerts];
  }
  [(NSMutableSet *)self->_pendingAlerts removeAllObjects];
}

- (void)updateIncidentResultForETARequest:(id)a3
{
  if ((self->_trafficIncidentStatus - 2) <= 2) {
    self->_trafficIncidentStatus = 0;
  }
}

- (void)updateIncidentResultForRerouteRequest:(id)a3
{
  displayedBannerIds = self->_displayedBannerIds;
  id v4 = a3;
  id v6 = [(NSMutableSet *)displayedBannerIds allObjects];
  id v5 = (void *)[v6 copy];
  [v4 setDisplayedBannerIds:v5];
}

- (void)updateForAlertsFromResponse:(id)a3 updatedLocation:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (MNLocation *)a4;
  int v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v6;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "MNTrafficIncidentAlertUpdater received alerts: %@", buf, 0xCu);
  }

  if (GEOConfigGetBOOL())
  {
    if (self->_useTriggerPointRangeBannerQueuing)
    {
      double v40 = v7;
      uint64_t v9 = objc_opt_new();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      int v10 = self->_pendingAlerts;
      uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v47 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if (objc_msgSend(v15, "persistAcrossUpdates", v40))
            {
              v16 = [v15 bannerID];
              [v9 setObject:v15 forKeyedSubscript:v16];
            }
          }
          uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v12);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v41 = v6;
      id v17 = v6;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            activeAlert = self->_activeAlert;
            if (activeAlert)
            {
              v24 = [(MNTrafficIncidentAlert *)activeAlert bannerID];
              v25 = [v22 bannerID];
              char v26 = [v24 isEqualToString:v25];

              if (v26) {
                continue;
              }
            }
            trackedBannerIDs = self->_trackedBannerIDs;
            v28 = objc_msgSend(v22, "bannerID", v40);
            LODWORD(trackedBannerIDs) = [(NSMutableSet *)trackedBannerIDs containsObject:v28];

            if (trackedBannerIDs)
            {
              uint64_t v29 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                double v30 = [v22 bannerID];
                *(_DWORD *)buf = 138412290;
                id v53 = v30;
                _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_ERROR, "Banner with ID \"%@\" was already displayed. Ignoring.", buf, 0xCu);
              }
            }
            else
            {
              double v31 = [v22 bannerID];
              [v9 setObject:v22 forKeyedSubscript:v31];

              double v32 = [v22 bannerID];

              if (!v32) {
                continue;
              }
              double v33 = self->_trackedBannerIDs;
              uint64_t v29 = [v22 bannerID];
              [(NSMutableSet *)v33 addObject:v29];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v19);
      }

      double v34 = (void *)MEMORY[0x1E4F1CA80];
      double v35 = [v9 allValues];
      v36 = [v34 setWithArray:v35];
      pendingAlerts = self->_pendingAlerts;
      self->_pendingAlerts = v36;

      uint64_t v7 = v40;
      lastLocation = v40;
      if (!v40) {
        lastLocation = self->_lastLocation;
      }
      -[MNTrafficIncidentAlertUpdater updateForLocation:](self, "updateForLocation:", lastLocation, v40);

      id v6 = v41;
    }
    else
    {
      [(MNTrafficIncidentAlertUpdater *)self _updateForAlertsFromResponseUsingDistancePoints:v6];
    }
  }
  else
  {
    int v39 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v6;
      _os_log_impl(&dword_1B542B000, v39, OS_LOG_TYPE_DEFAULT, "Dodgeball alert was found in response but EnableDodgeball is off. Ignoring %@", buf, 0xCu);
    }
  }
}

- (void)clearAlerts
{
  [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
  pendingAlerts = self->_pendingAlerts;
  [(NSMutableSet *)pendingAlerts removeAllObjects];
}

- (id)_nextAlert
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(MNLocation *)self->_lastLocation routeMatch];
  uint64_t v4 = [v3 routeCoordinate];

  pendingAlerts = self->_pendingAlerts;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke;
  v76[3] = &unk_1E60F7DA8;
  v76[4] = self;
  v76[5] = v4;
  id v6 = [(NSMutableSet *)pendingAlerts _geo_filtered:v76];
  uint64_t v7 = [v6 allObjects];
  int v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_20];
  uint64_t v9 = [v8 firstObject];

  if ((unint64_t)[(NSMutableSet *)self->_pendingAlerts count] < 2) {
    goto LABEL_33;
  }
  v60 = v6;
  int v10 = objc_opt_new();
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_3;
  v75[3] = &unk_1E60F7DF0;
  v75[4] = self;
  uint64_t v11 = (uint64_t (**)(void, void))MEMORY[0x1BA99B3A0](v75);
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v9);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v62 = self;
  uint64_t v13 = self->_pendingAlerts;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v71 objects:v78 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v72 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if (v18 != v9)
        {
          v11[2](v11, *(void *)(*((void *)&v71 + 1) + 8 * i));
          if (GEOPolylineCoordinateRangeIntersectsRange()) {
            [v10 addObject:v18];
          }
        }
      }
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v71 objects:v78 count:16];
    }
    while (v15);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v10;
  uint64_t v66 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (!v66) {
    goto LABEL_32;
  }
  uint64_t v65 = *(void *)v68;
  while (2)
  {
    for (uint64_t j = 0; j != v66; ++j)
    {
      if (*(void *)v68 != v65) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v67 + 1) + 8 * j);
      unint64_t v21 = objc_msgSend(v20, "priority", v60);
      if (v21 > [v9 priority])
      {
        uint64_t v22 = ((uint64_t (**)(void, void *))v11)[2](v11, v20);
        uint64_t v61 = v23;
        [v9 minDisplayTime];
        double v25 = v24;
        [v9 overlapDelayTime];
        double v27 = v25 + v26;
        v28 = [(MNLocation *)v62->_lastLocation routeMatch];
        uint64_t v29 = [v28 route];
        double v30 = [v20 mainRouteInfo];
        [v30 etaRoute];
        double v31 = v64 = v20;
        [v29 coordinateAtTimeInterval:v12 afterCoordinate:v31 etaRoute:v27];

        if (GEOPolylineCoordinateIsABeforeB())
        {
          double v32 = [v9 triggerRange];
          double v33 = [v32 showTriggerPoint];
          int v34 = [v33 allowsShifting];

          double v35 = [v9 triggerRange];
          uint64_t v36 = [v35 hideTriggerPoint];
          v37 = (void *)v36;
          if (v34)
          {
            if (v36)
            {
              v38 = [v9 triggerRange];
              int v39 = [v38 hideTriggerPoint];
              int v40 = [v39 allowsShifting];

              if (v40)
              {
                long long v49 = [v9 triggerRange];
                v50 = [v49 showTriggerPoint];
                [v50 setReferenceCoordinate:v61];

                v51 = [(MNLocation *)v62->_lastLocation routeMatch];
                v52 = [v51 route];
                id v53 = [v64 mainRouteInfo];
                uint64_t v54 = [v53 etaRoute];
                v55 = v52;
                double v56 = v27;
                uint64_t v57 = v61;
LABEL_34:
                uint64_t v58 = [v55 coordinateAtTimeInterval:v57 afterCoordinate:v54 etaRoute:v56];

                id v6 = v60;
                if (!GEOPolylineCoordinateIsABeforeB())
                {
LABEL_37:

                  id v46 = 0;
                  goto LABEL_38;
                }
                long long v47 = [v9 triggerRange];
                long long v48 = [v47 hideTriggerPoint];
                [v48 setReferenceCoordinate:v58];
LABEL_36:

                goto LABEL_37;
              }
            }
            else
            {
            }
            long long v44 = [v9 triggerRange];
            long long v45 = [v44 hideTriggerPoint];

            if (!v45)
            {
              long long v47 = [v9 triggerRange];
              long long v48 = [v47 showTriggerPoint];
              [v48 setReferenceCoordinate:v22];
              id v6 = v60;
              goto LABEL_36;
            }
          }
          else if (v36)
          {
            id v41 = [v9 triggerRange];
            long long v42 = [v41 hideTriggerPoint];
            int v43 = [v42 allowsShifting];

            if (v43)
            {
              v51 = [(MNLocation *)v62->_lastLocation routeMatch];
              v52 = [v51 route];
              id v53 = [v64 mainRouteInfo];
              uint64_t v54 = [v53 etaRoute];
              v55 = v52;
              double v56 = v27;
              uint64_t v57 = v61;
              goto LABEL_34;
            }
          }
          else
          {
          }
        }
      }
    }
    uint64_t v66 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (v66) {
      continue;
    }
    break;
  }
LABEL_32:

  id v6 = v60;
LABEL_33:
  id v46 = v9;
LABEL_38:

  return v46;
}

uint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) routeMatch];
  id v5 = [v4 route];

  id v6 = [v3 triggerRange];
  uint64_t v7 = [v6 showTriggerPoint];

  [v7 referenceCoordinate];
  if (GEOPolylineCoordinateIsABeforeOrEqualToB())
  {
    uint64_t v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "distanceFromPoint:toPoint:", *(void *)(a1 + 40), objc_msgSend(v7, "referenceCoordinate"));
    uint64_t v8 = v9 < 50.0;
  }
  int v10 = [v3 triggerRange];
  uint64_t v11 = [v10 hideTriggerPoint];

  if (v11)
  {
    [v3 minDisplayTime];
    double v13 = v12;
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 16) routeMatch];
    uint64_t v15 = [v14 routeCoordinate];
    uint64_t v16 = [v3 mainRouteInfo];
    id v17 = [v16 etaRoute];
    [v5 coordinateAtTimeInterval:v15 afterCoordinate:v17 etaRoute:v13];

    [v11 referenceCoordinate];
    uint64_t v8 = v8 & GEOPolylineCoordinateIsABeforeOrEqualToB();
  }

  return v8;
}

uint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 priority];
  if (v6 > [v5 priority]) {
    goto LABEL_2;
  }
  unint64_t v8 = [v4 priority];
  if (v8 < [v5 priority])
  {
LABEL_4:
    uint64_t v7 = 1;
    goto LABEL_22;
  }
  double v9 = [v4 triggerRange];
  uint64_t v10 = [v9 hideTriggerPoint];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    double v12 = [v5 triggerRange];
    double v13 = [v12 hideTriggerPoint];

    if (v13)
    {
      uint64_t v14 = [v4 triggerRange];
      uint64_t v15 = [v14 hideTriggerPoint];
      [v15 referenceCoordinate];

      uint64_t v16 = [v5 triggerRange];
      id v17 = [v16 hideTriggerPoint];
      [v17 referenceCoordinate];

      if (GEOPolylineCoordinateIsABeforeOrEqualToB()) {
        uint64_t v7 = -1;
      }
      else {
        uint64_t v7 = 1;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v18 = [v4 triggerRange];
  uint64_t v19 = [v18 hideTriggerPoint];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    unint64_t v21 = [v5 triggerRange];
    uint64_t v22 = [v21 hideTriggerPoint];

    if (!v22)
    {
LABEL_2:
      uint64_t v7 = -1;
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v23 = [v4 triggerRange];
  double v24 = [v23 hideTriggerPoint];
  if (v24)
  {
  }
  else
  {
    double v25 = [v5 triggerRange];
    double v26 = [v25 hideTriggerPoint];

    if (v26) {
      goto LABEL_4;
    }
  }
  double v27 = [v4 triggerRange];
  [v27 displayTime];
  double v29 = v28;
  double v30 = [v4 triggerRange];
  [v30 displayTime];
  if (v29 > v31) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }

LABEL_22:
  return v7;
}

unint64_t __43__MNTrafficIncidentAlertUpdater__nextAlert__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 triggerRange];
  id v5 = [v4 showTriggerPoint];
  uint64_t v6 = [v5 referenceCoordinate];

  uint64_t v7 = [v4 hideTriggerPoint];

  if (v7)
  {
    unint64_t v8 = [v4 hideTriggerPoint];
    [v8 referenceCoordinate];
  }
  else
  {
    unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) routeMatch];
    double v9 = [v8 route];
    [v4 displayTime];
    double v11 = v10;
    double v12 = [v3 mainRouteInfo];
    double v13 = [v12 etaRoute];
    [v9 coordinateAtTimeInterval:v6 afterCoordinate:v13 etaRoute:v11];
  }
  if (GEOPolylineCoordinateIsInvalid())
  {
    unsigned int v14 = *MEMORY[0x1E4F64198];
    float v15 = *(float *)(MEMORY[0x1E4F64198] + 4);
  }
  else
  {
    float v15 = *((float *)&v6 + 1) - floorf(*((float *)&v6 + 1));
    unsigned int v14 = vcvtms_u32_f32(*((float *)&v6 + 1)) + v6;
  }
  GEOPolylineCoordinateIsInvalid();

  return v14 | ((unint64_t)LODWORD(v15) << 32);
}

- (void)_updateForAlertsFromResponseUsingDistancePoints:(id)a3
{
  id v4 = a3;
  id v21 = v4;
  if (v4 && [v4 count])
  {
    id v5 = [v21 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = 0;
  }
  if ([(NSMutableSet *)self->_pendingAlerts count]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_activeAlert != 0;
  }
  uint64_t v7 = [v5 bannerID];
  if ([v7 length] && -[NSString length](self->_previousBannerID, "length"))
  {
    unint64_t v8 = [v5 bannerID];
    char v9 = [v8 isEqualToString:self->_previousBannerID];
  }
  else
  {
    char v9 = 0;
  }

  if (v5) {
    int v10 = 1;
  }
  else {
    int v10 = v6;
  }
  if (v10 != 1 || (v9 & 1) != 0) {
    goto LABEL_27;
  }
  previousBannerID = self->_previousBannerID;
  self->_previousBannerID = 0;

  int v12 = [v5 previousBannerChange];
  if (v12 == 3)
  {

LABEL_26:
    [(NSMutableSet *)self->_pendingAlerts removeAllObjects];
    id v5 = 0;
    goto LABEL_27;
  }
  if (!v5) {
    goto LABEL_26;
  }
  int v13 = v12;
  if (![(NSMutableSet *)self->_pendingAlerts count] && !self->_activeAlert) {
    goto LABEL_25;
  }
  if (v13 != 2)
  {
    if (v13 == 1)
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
      pendingAlerts = self->_pendingAlerts;
      self->_pendingAlerts = v18;

      [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
      goto LABEL_33;
    }
    if (v13) {
      goto LABEL_27;
    }
LABEL_25:
    unsigned int v14 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
    float v15 = self->_pendingAlerts;
    self->_pendingAlerts = v14;

LABEL_33:
    self->_trafficIncidentStatus = 0;
    goto LABEL_37;
  }
  if (self->_pendingAlerts)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA80] setWithObject:v5];
    activeAlert = self->_pendingAlerts;
    self->_pendingAlerts = v16;
  }
  else
  {
    if (!self->_activeAlert) {
      goto LABEL_37;
    }
    objc_msgSend(v5, "updateAlertIDWithAlert:");
    uint64_t v20 = v5;
    activeAlert = self->_activeAlert;
    self->_activeAlert = v20;
  }

LABEL_37:
  if (self->_lastLocation) {
    -[MNTrafficIncidentAlertUpdater _updateForLocationUsingDistancePoints:](self, "_updateForLocationUsingDistancePoints:");
  }
LABEL_27:
}

- (void)_updateForLocationUsingDistancePoints:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pendingAlerts = self->_pendingAlerts;
  if (pendingAlerts && [(NSMutableSet *)pendingAlerts count])
  {
    BOOL v6 = [(NSMutableSet *)self->_pendingAlerts anyObject];
  }
  else
  {
    BOOL v6 = 0;
  }
  uint64_t v7 = [v4 routeMatch];
  [v7 routeCoordinate];

  if (v6)
  {
    if (!self->_activeAlert)
    {
      [v6 startValidCoordinateRange];
      [v6 endValidCoordinateRange];
      if (GEOPolylineCoordinateWithinRange()) {
        [(MNTrafficIncidentAlertUpdater *)self _activateAlert:v6 forLocation:v4];
      }
    }
  }
  if (self->_activeAlert)
  {
    unint64_t v8 = [v4 routeMatch];
    char v9 = [v8 route];

    int v10 = [(MNTrafficIncidentAlert *)self->_activeAlert alternateRoute];

    activeAlert = self->_activeAlert;
    if (v9 == v10)
    {
      [(MNTrafficIncidentAlert *)activeAlert alternateEndValidCoordinateRange];
    }
    else
    {
      int v12 = [(MNTrafficIncidentAlert *)activeAlert originalRoute];

      if (v9 != v12)
      {
        int v13 = [NSString stringWithFormat:@"Unexpected route from route match."];
        unsigned int v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          uint64_t v20 = "-[MNTrafficIncidentAlertUpdater _updateForLocationUsingDistancePoints:]";
          __int16 v21 = 2080;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNTrafficIncidentAlertUpdater.m";
          __int16 v23 = 1024;
          int v24 = 540;
          __int16 v25 = 2080;
          double v26 = "NO";
          __int16 v27 = 2112;
          double v28 = v13;
          _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v19, 0x30u);
        }

        [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
LABEL_25:

        goto LABEL_26;
      }
      [(MNTrafficIncidentAlert *)self->_activeAlert endValidCoordinateRange];
    }
    if (GEOPolylineCoordinateCompare() == 1)
    {
      if ([(MNTrafficIncidentAlert *)self->_activeAlert isReroute]) {
        int v15 = 2;
      }
      else {
        int v15 = 0;
      }
      self->_trafficIncidentStatus = v15;
      uint64_t v16 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        GEOPolylineCoordinateAsShortString();
        id v17 = (char *)objc_claimAutoreleasedReturnValue();
        GEOPolylineCoordinateAsShortString();
        uint64_t v18 = (char *)objc_claimAutoreleasedReturnValue();
        int v19 = 138412546;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Removing traffic incident alert because the route coordinate %@ is past the valid end coordinate %@", (uint8_t *)&v19, 0x16u);
      }
      [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
    }
    [(MNTrafficIncidentAlertUpdater *)self _updateAlertDistanceAndETAForLocation:v4];
    goto LABEL_25;
  }
LABEL_26:
}

- (void)_activateAlert:(id)a3 forLocation:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(NSDate *)self->_nextAlertDisplayTime timeIntervalSinceNow];
  if (v8 <= 0.0)
  {
    char v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEBUG, "Activating traffic incident alert.", buf, 2u);
    }

    if (![(MNTrafficIncidentAlertUpdater *)self useTriggerPointRangeBannerQueuing]
      || ([v6 bannerID],
          int v10 = objc_claimAutoreleasedReturnValue(),
          BOOL v11 = v10 == 0,
          v10,
          v11))
    {
      unsigned int v14 = [v6 bannerID];
      previousBannerID = self->_previousBannerID;
      self->_previousBannerID = v14;
    }
    else
    {
      displayedBannerIds = self->_displayedBannerIds;
      previousBannerID = [v6 bannerID];
      [(NSMutableSet *)displayedBannerIds addObject:previousBannerID];
    }

    [v6 updateLocation:v7];
    int v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v6 bannerID];
      *(_DWORD *)buf = 138412290;
      int v39 = v16;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_DEFAULT, "Activating alert: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    switch([v6 alertType])
    {
      case 1:
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke;
        v35[3] = &unk_1E60F6460;
        uint64_t v18 = &v37;
        objc_copyWeak(&v37, (id *)buf);
        int v19 = &v36;
        id v36 = v6;
        __int16 v23 = MEMORY[0x1E4F14428];
        int v24 = v35;
        goto LABEL_15;
      case 2:
      case 5:
      case 6:
        [(NSMutableSet *)self->_pendingAlerts removeObject:v6];
        [(MNTrafficIncidentAlertUpdater *)self setActiveAlert:v6];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_4;
        v29[3] = &unk_1E60F7E18;
        uint64_t v18 = &v31;
        objc_copyWeak(&v31, (id *)buf);
        id v30 = v6;
        [WeakRetained trafficIncidentAlertUpdater:self receivedAlert:v30 responseCallback:v29];

        int v19 = &v30;
        goto LABEL_16;
      case 3:
      case 4:
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_3;
        v32[3] = &unk_1E60F7E18;
        uint64_t v18 = &v34;
        objc_copyWeak(&v34, (id *)buf);
        id v20 = v6;
        id v33 = v20;
        __int16 v21 = (void *)MEMORY[0x1BA99B3A0](v32);
        [(NSMutableSet *)self->_pendingAlerts removeObject:v20];
        [(MNTrafficIncidentAlertUpdater *)self setActiveAlert:v20];
        self->_trafficIncidentStatus = 1;
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 trafficIncidentAlertUpdater:self receivedAlert:self->_activeAlert responseCallback:v21];

        int v19 = &v33;
        goto LABEL_16;
      case 7:
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_5;
        v26[3] = &unk_1E60F6460;
        uint64_t v18 = &v28;
        objc_copyWeak(&v28, (id *)buf);
        int v19 = &v27;
        id v27 = v6;
        __int16 v23 = MEMORY[0x1E4F14428];
        int v24 = v26;
LABEL_15:
        dispatch_async(v23, v24);
LABEL_16:

        objc_destroyWeak(v18);
        break;
      default:
        break;
    }
    if (self->_activeAlert)
    {
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      [v25 trafficIncidentAlertUpdater:self updatedAlert:self->_activeAlert];
    }
    objc_destroyWeak((id *)buf);
  }
}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    [v3 setActiveAlert:*(void *)(a1 + 32)];
    id v4 = objc_loadWeakRetained(v3 + 1);
    id v5 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    int v10 = __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_2;
    BOOL v11 = &unk_1E60F7348;
    int v12 = v3;
    id v13 = v5;
    [v4 trafficIncidentAlertUpdater:v3 receivedAlert:v13 responseCallback:&v8];

    id v6 = objc_msgSend(*(id *)(a1 + 32), "alternateRoute", v8, v9, v10, v11, v12);
    if (v6)
    {
      id v7 = objc_loadWeakRetained(v3 + 1);
      [v7 trafficIncidentAlertUpdater:v3 didSwitchToNewRoute:v6 forAlert:*(void *)(a1 + 32)];
    }
  }
}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setActiveAlert:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained trafficIncidentAlertUpdater:*(void *)(a1 + 32) didDismissAlert:*(void *)(a1 + 40) withReroute:a2];
}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int16 v21 = WeakRetained;
    id v5 = [WeakRetained activeAlert];

    id WeakRetained = v21;
    if (v5)
    {
      id v6 = [v21 activeAlert];
      int v7 = [v6 defaultToNewRoute];

      if (v7)
      {
        if (a2)
        {
          *((_DWORD *)v21 + 14) = 4;
          uint64_t v8 = [v21 activeAlert];
          uint64_t v9 = [v8 alternateRoute];

          if (v9)
          {
            id v10 = objc_loadWeakRetained(v21 + 1);
            [v10 trafficIncidentAlertUpdater:v21 didSwitchToNewRoute:v9 forAlert:*(void *)(a1 + 32)];
          }
          BOOL v11 = v21;
        }
        else
        {
          BOOL v11 = v21;
          *((_DWORD *)v21 + 14) = 3;
        }
        [v11 setActiveAlert:0];
        id v13 = objc_loadWeakRetained(v21 + 1);
        unsigned int v14 = v13;
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = v21;
        uint64_t v17 = a2;
      }
      else
      {
        if (a2)
        {
          int v12 = v21;
          *((_DWORD *)v21 + 14) = 4;
        }
        else
        {
          *((_DWORD *)v21 + 14) = 3;
          uint64_t v18 = [v21 activeAlert];
          int v19 = [v18 alternateRoute];

          if (v19)
          {
            id v20 = objc_loadWeakRetained(v21 + 1);
            [v20 trafficIncidentAlertUpdater:v21 didSwitchToNewRoute:v19 forAlert:*(void *)(a1 + 32)];
          }
          int v12 = v21;
        }
        [v12 setActiveAlert:0];
        id v13 = objc_loadWeakRetained(v21 + 1);
        unsigned int v14 = v13;
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v17 = a2 ^ 1;
        uint64_t v16 = v21;
      }
      [v13 trafficIncidentAlertUpdater:v16 didDismissAlert:v15 withReroute:v17];

      id WeakRetained = v21;
    }
  }
}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained setActiveAlert:0];
    id v5 = objc_loadWeakRetained(v6 + 1);
    [v5 trafficIncidentAlertUpdater:v6 didDismissAlert:*(void *)(a1 + 32) withReroute:a2];

    id WeakRetained = v6;
  }
}

void __60__MNTrafficIncidentAlertUpdater__activateAlert_forLocation___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    v2 = [*(id *)(a1 + 32) alternateRoute];
    if (v2)
    {
      id v3 = objc_loadWeakRetained(WeakRetained + 1);
      [v3 trafficIncidentAlertUpdater:WeakRetained didSwitchToNewRoute:v2 forAlert:*(void *)(a1 + 32)];
    }
    [WeakRetained setActiveAlert:0];
  }
}

- (void)_removeActiveAlert
{
  activeAlert = self->_activeAlert;
  if (!activeAlert) {
    return;
  }
  id v4 = activeAlert;
  if (![(MNTrafficIncidentAlert *)v4 isReroute])
  {
    int v5 = 0;
    goto LABEL_7;
  }
  if (self->_trafficIncidentStatus == 1)
  {
    int v5 = 2;
LABEL_7:
    self->_trafficIncidentStatus = v5;
  }
  [(MNTrafficIncidentAlertUpdater *)self setActiveAlert:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained trafficIncidentAlertUpdater:self invalidatedAlert:v4];
}

- (void)_updateActiveAlertForLocation:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (self->_activeAlert)
  {
    id v6 = [v4 routeMatch];
    int v7 = [v6 route];

    uint64_t v8 = [(MNTrafficIncidentAlert *)self->_activeAlert originalRoute];
    if ((void *)v8 == v7)
    {
    }
    else
    {
      uint64_t v9 = (void *)v8;
      id v10 = [(MNTrafficIncidentAlert *)self->_activeAlert alternateRoute];

      if (v10 != v7)
      {
        BOOL v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          double v32 = [v7 name];
          id v30 = [v7 uniqueRouteID];
          id v34 = [(MNTrafficIncidentAlert *)self->_activeAlert originalRoute];
          int v12 = [v34 name];
          id v33 = [(MNTrafficIncidentAlert *)self->_activeAlert originalRoute];
          id v13 = [v33 uniqueRouteID];
          id v31 = [(MNTrafficIncidentAlert *)self->_activeAlert alternateRoute];
          unsigned int v14 = [v31 name];
          uint64_t v15 = [(MNTrafficIncidentAlert *)self->_activeAlert alternateRoute];
          uint64_t v16 = [v15 uniqueRouteID];
          *(_DWORD *)buf = 138479107;
          id v36 = v32;
          __int16 v37 = 2112;
          v38 = v30;
          __int16 v39 = 2113;
          uint64_t v40 = v12;
          __int16 v41 = 2112;
          long long v42 = v13;
          __int16 v43 = 2113;
          long long v44 = v14;
          __int16 v45 = 2112;
          id v46 = v16;
          _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Location was matched to a route that matches neither of the alert's routes! Invalidating alert.\nRoute for location: %{private}@ - %@\nAlert original route: %{private}@ - %@\nAlert new route: %{private}@ - %@", buf, 0x3Eu);
        }
        [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
        goto LABEL_32;
      }
    }
    uint64_t v17 = [(MNTrafficIncidentAlert *)self->_activeAlert progressBarTriggerRange];
    uint64_t v18 = [v17 showTriggerPoint];

    if (v18
      && ![(MNTrafficIncidentAlert *)self->_activeAlert shouldShowTimer]
      && [v18 shouldActivateForLocation:v5])
    {
      [(MNTrafficIncidentAlert *)self->_activeAlert setShouldShowTimer:1];
      int v19 = [(MNTrafficIncidentAlert *)self->_activeAlert progressBarTriggerRange];
      [v19 displayTime];
      -[MNTrafficIncidentAlert setAlertDisplayDuration:](self->_activeAlert, "setAlertDisplayDuration:");
    }
    else
    {
      if ([(MNTrafficIncidentAlert *)self->_activeAlert shouldShowTimer])
      {
LABEL_31:
        [(MNTrafficIncidentAlertUpdater *)self _updateAlertDistanceAndETAForLocation:v5];

LABEL_32:
        goto LABEL_33;
      }
      id v20 = [(MNTrafficIncidentAlert *)self->_activeAlert triggerRange];
      int v19 = [v20 hideTriggerPoint];

      if (v19) {
        int v21 = [v19 shouldActivateForLocation:v5];
      }
      else {
        int v21 = 0;
      }
      [(NSDate *)self->_activeAlertDisplayedTime timeIntervalSinceNow];
      double v23 = -v22;
      int v24 = [(MNTrafficIncidentAlert *)self->_activeAlert triggerRange];
      [v24 displayTime];
      double v26 = v25;

      if ((v21 & 1) != 0 || v26 < v23)
      {
        if (v21)
        {
          id v27 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_DEFAULT, "Active incident alert's hide trigger point has been passed.", buf, 2u);
          }
        }
        if (v26 < v23)
        {
          id v28 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B542B000, v28, OS_LOG_TYPE_DEFAULT, "Active incident alert has timed out.", buf, 2u);
          }
        }
        if ([(MNTrafficIncidentAlert *)self->_activeAlert isReroute]) {
          int v29 = 2;
        }
        else {
          int v29 = 0;
        }
        self->_trafficIncidentStatus = v29;
        [(MNTrafficIncidentAlertUpdater *)self _removeActiveAlert];
      }
    }

    goto LABEL_31;
  }
LABEL_33:
}

- (void)_updateAlertDistanceAndETAForLocation:(id)a3
{
  activeAlert = self->_activeAlert;
  if (activeAlert)
  {
    [(MNTrafficIncidentAlert *)activeAlert updateLocation:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained trafficIncidentAlertUpdater:self updatedAlert:self->_activeAlert];
  }
}

- (MNTrafficIncidentAlertUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNTrafficIncidentAlertUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useTriggerPointRangeBannerQueuing
{
  return self->_useTriggerPointRangeBannerQueuing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedBannerIDs, 0);
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_previousBannerID, 0);
  objc_storeStrong((id *)&self->_nextAlertDisplayTime, 0);
  objc_storeStrong((id *)&self->_activeAlertDisplayedTime, 0);
  objc_storeStrong((id *)&self->_activeAlert, 0);
  objc_storeStrong((id *)&self->_pendingAlerts, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end