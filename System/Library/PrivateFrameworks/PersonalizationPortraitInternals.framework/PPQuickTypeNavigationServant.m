@interface PPQuickTypeNavigationServant
- (PPQuickTypeNavigationServant)init;
- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5;
- (uint64_t)_waitForSummary;
- (void)dealloc;
- (void)navigationListener:(id)a3 didUpdateCurrentRoadName:(id)a4;
- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4;
- (void)navigationListener:(id)a3 didUpdatePositionFromDestination:(id)a4;
- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4;
@end

@implementation PPQuickTypeNavigationServant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySemaphore, 0);
  objc_storeStrong((id *)&self->_streetSemaphore, 0);
  objc_storeStrong((id *)&self->_stateSemaphore, 0);
  objc_storeStrong((id *)&self->_streetName, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

- (void)navigationListener:(id)a3 didUpdatePositionFromDestination:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = [NSString stringWithFormat:@"{%.3f meters, %.3f seconds}", *(void *)&var1, *(void *)&var0];
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdatePositionFromDestination: %@", buf, 0xCu);
  }
  v8 = self;
  objc_sync_enter(v8);
  v8->_remainingTimeToDestination = var0;
  v8->_remainingDistanceToDestination = var1;
  objc_sync_exit(v8);
}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateGuidanceState: %@", (uint8_t *)&v18, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if ([v7 hasNavigationState]) {
    int v10 = [v7 navigationState];
  }
  else {
    int v10 = 0;
  }
  v9->_navigationState = v10;
  if (![v7 navigationState])
  {
    streetName = v9->_streetName;
    v9->_streetName = 0;

    destinationName = v9->_destinationName;
    v9->_destinationName = 0;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v9->_remainingTimeToDestination = _Q0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_stateSemaphore);
  objc_sync_exit(v9);
}

- (void)navigationListener:(id)a3 didUpdateCurrentRoadName:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    v14 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateCurrentRoadName: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  p_streetName = (NSObject **)&v9->_streetName;
  if ([v7 length])
  {
    objc_storeStrong((id *)&v9->_streetName, a4);
    v11 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *p_streetName;
      int v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "_streetName = %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v11 = *p_streetName;
    *p_streetName = 0;
  }

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_streetSemaphore);
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (NSString *)a4;
  v8 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412290;
    uint64_t v20 = v7;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateRouteSummary: %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if ([(NSString *)v7 hasDestination])
  {
    int v10 = [(NSString *)v7 destinationName];

    if (v10)
    {
      uint64_t v11 = [(NSString *)v7 destinationName];
      destinationName = v9->_destinationName;
      v9->_destinationName = (NSString *)v11;
    }
    else
    {
      destinationName = [(NSString *)v7 destination];
      v14 = [destinationName waypoint];
      uint64_t v15 = [v14 waypointId];
      uint64_t v16 = [v15 placeNameHint];
      v17 = v9->_destinationName;
      v9->_destinationName = (NSString *)v16;
    }
    int v13 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v18 = v9->_destinationName;
      int v19 = 138412290;
      uint64_t v20 = v18;
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "_destinationName = %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    int v13 = v9->_destinationName;
    v9->_destinationName = 0;
  }

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_summarySemaphore);
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [v7 type] == 4;
  int v10 = pp_quicktype_log_handle();
  uint64_t v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPQuickTypeNavigationServant ignoring request since it doesn't ask for navigation", buf, 2u);
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeNavigationServant", buf, 2u);
  }

  if (!+[PPQuickTypeSettings servantShouldRespondToQuery:self])
  {
    v28 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Navigation due to settings", buf, 2u);
    }

    [v8 push:47];
LABEL_21:
    id v29 = 0;
    goto LABEL_95;
  }
  if (self)
  {
    [(GEONavigationListener *)self->_navigationListener requestGuidanceState];
    [(GEONavigationListener *)self->_navigationListener requestRouteSummary];
    [(GEONavigationListener *)self->_navigationListener requestPositionFromDestination];
  }
  uint64_t v12 = objc_opt_new();
  int v13 = +[PPQuickTypeFormatter formatterWithQuery:v7];
  if ([v7 subtype] == 10)
  {
    -[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self);
    v14 = self;
    objc_sync_enter(v14);
    double remainingTimeToDestination = v14->_remainingTimeToDestination;
    uint64_t v16 = +[PPConfiguration sharedInstance];
    [v16 navigationMinimumTimeInterval];
    BOOL v18 = remainingTimeToDestination > v17;

    if (v18)
    {
      if (([v7 fields] & 0x800000) != 0)
      {
        int v19 = [v13 etaLabel];
        uint64_t v20 = [v13 navigationItemLabelForTypeLabel:v19 destination:v14->_destinationName];

        uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v14->_remainingTimeToDestination];
        v22 = [v13 formattedEventTime:v21];

        BYTE2(v76) = 4;
        LOWORD(v76) = 0;
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v20, v22, 0, 0, 0x800000, 0, 1.0, 0, 0, v76, 0);
        [v12 addObject:v23];
      }
      if (([v7 fields] & 0x1000000) != 0)
      {
        v24 = [v13 timeLeftLabel];
        v25 = [v13 navigationItemLabelForTypeLabel:v24 destination:v14->_destinationName];

        v26 = [v13 formattedTimeInterval:v14->_remainingTimeToDestination];
        if ([v26 length])
        {
          BYTE2(v76) = 4;
          LOWORD(v76) = 0;
          v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v25, v26, 0, 0, 0x1000000, 0, 1.0, 0, 0, v76, 0);
          [v12 addObject:v27];
        }
      }
    }
    else if (v14->_remainingTimeToDestination <= 0.0)
    {
      v31 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "got ETA request but don't have time data", buf, 2u);
      }

      [v8 push:33];
      +[PPQuickTypeMetrics frameworkError:@"GEONoData" errorCode:1];
    }
    else
    {
      v30 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_DEFAULT, "got ETA request but too close to destination", buf, 2u);
      }

      [v8 push:48];
    }
    objc_sync_exit(v14);
  }
  if ([v7 subtype] == 8)
  {
    -[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self);
    v32 = self;
    objc_sync_enter(v32);
    double remainingDistanceToDestination = v32->_remainingDistanceToDestination;
    v34 = +[PPConfiguration sharedInstance];
    BOOL v35 = remainingDistanceToDestination > (double)[v34 navigationMinimumDistanceInMeters];

    if (v35)
    {
      v36 = [v13 distanceLabel];
      v37 = [v13 navigationItemLabelForTypeLabel:v36 destination:v32->_destinationName];

      v38 = [v13 formattedLengthInMeters:v32->_remainingDistanceToDestination];
      BYTE2(v76) = 4;
      LOWORD(v76) = 0;
      v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v37, v38, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
      [v12 addObject:v39];
    }
    else if (v32->_remainingDistanceToDestination <= 0.0)
    {
      v41 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEFAULT, "got distance request but don't have distance data", buf, 2u);
      }

      [v8 push:34];
      +[PPQuickTypeMetrics frameworkError:@"GEONoData" errorCode:2];
    }
    else
    {
      v40 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_DEFAULT, "got distance request but too close to destination", buf, 2u);
      }

      [v8 push:48];
    }
    double v42 = v32->_remainingTimeToDestination;
    v43 = +[PPConfiguration sharedInstance];
    [v43 navigationMinimumTimeInterval];
    BOOL v45 = v42 > v44;

    if (v45)
    {
      v46 = [v13 timeLeftLabel];
      v47 = [v13 navigationItemLabelForTypeLabel:v46 destination:v32->_destinationName];

      v48 = [v13 formattedTimeInterval:v32->_remainingTimeToDestination];
      if ([v48 length])
      {
        BYTE2(v76) = 4;
        LOWORD(v76) = 0;
        v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v47, v48, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
        [v12 addObject:v49];
      }
    }
    else if (v32->_remainingTimeToDestination <= 0.0)
    {
      v51 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v51, OS_LOG_TYPE_DEFAULT, "got ETA request but don't have time data", buf, 2u);
      }

      [v8 push:33];
      +[PPQuickTypeMetrics frameworkError:@"GEONoData" errorCode:3];
    }
    else
    {
      v50 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_DEFAULT, "got ETA request but too close to destination", buf, 2u);
      }

      [v8 push:48];
    }
    objc_sync_exit(v32);
  }
  if ([v7 subtype] == 9)
  {
    v52 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEBUG, "got a destination request", buf, 2u);
    }

    if ((-[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self) & 1) == 0)
    {
      [v8 push:32];
LABEL_93:
      id v29 = 0;
      goto LABEL_94;
    }
    v53 = self;
    objc_sync_enter(v53);
    if (v53->_destinationName)
    {
      v54 = [v13 destinationLabel];
      v55 = [v13 navigationItemLabelForTypeLabel:v54 destination:0];

      v56 = v53->_destinationName;
      BYTE2(v76) = 4;
      LOWORD(v76) = 0;
      v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v55, v56, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
      v58 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v74 = [v57 value];
        *(_DWORD *)buf = 138412290;
        uint64_t v80 = v74;
        v77 = (void *)v74;
        _os_log_debug_impl(&dword_1CA9A8000, v58, OS_LOG_TYPE_DEBUG, "destination name: %@", buf, 0xCu);
      }
      [v12 addObject:v57];
    }
    else
    {
      v59 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_DEFAULT, "got Destination request but don't have destination data", buf, 2u);
      }

      [v8 push:35];
      +[PPQuickTypeMetrics frameworkError:@"GEONoData" errorCode:4];
    }
    objc_sync_exit(v53);
  }
  if ([v7 subtype] == 11)
  {
    v60 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_DEBUG, "got a street request", buf, 2u);
    }

    if (!self) {
      goto LABEL_73;
    }
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:self->_streetSemaphore timeoutSeconds:0.05] == 1)
    {
      v61 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v61, OS_LOG_TYPE_DEBUG, "timed out waiting on street.", buf, 2u);
      }

      +[PPQuickTypeMetrics frameworkError:@"GEOTimeout" errorCode:2];
LABEL_73:
      [v8 push:31];
      goto LABEL_93;
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_streetSemaphore);
    v62 = self;
    objc_sync_enter(v62);
    if (v62->_streetName)
    {
      v63 = [v13 streetLabel];
      v64 = [v13 navigationItemLabelForTypeLabel:v63 destination:0];

      v65 = v62->_streetName;
      BYTE2(v76) = 4;
      LOWORD(v76) = 0;
      v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v64, v65, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
      v67 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v75 = [v66 value];
        *(_DWORD *)buf = 138412290;
        uint64_t v80 = v75;
        v78 = (void *)v75;
        _os_log_debug_impl(&dword_1CA9A8000, v67, OS_LOG_TYPE_DEBUG, "street name: %@", buf, 0xCu);
      }
      [v12 addObject:v66];
    }
    else
    {
      v68 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v68, OS_LOG_TYPE_DEFAULT, "got Street request but don't have street data", buf, 2u);
      }

      [v8 push:36];
      +[PPQuickTypeMetrics frameworkError:@"GEONoData" errorCode:5];
    }
    objc_sync_exit(v62);
  }
  v69 = self;
  objc_sync_enter(v69);
  if (![v12 count])
  {
    int navigationState = v69->_navigationState;
    if ((navigationState - 6) >= 2)
    {
      if (navigationState) {
        goto LABEL_83;
      }
      v71 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_DEBUG, "navigation request when not navigating", buf, 2u);
      }
      uint64_t v72 = 37;
    }
    else
    {
      v71 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_DEBUG, "navigation request when navigation has ended", buf, 2u);
      }
      uint64_t v72 = 38;
    }

    [v8 push:v72];
    objc_sync_exit(v69);

    goto LABEL_93;
  }
LABEL_83:
  objc_sync_exit(v69);

  id v29 = v12;
LABEL_94:

LABEL_95:
  return v29;
}

- (uint64_t)_waitForSummary
{
  if (result)
  {
    uint64_t v1 = result;
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:*(void *)(result + 72) timeoutSeconds:0.05] == 1)
    {
      v2 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEBUG, "timed out waiting on summary.", v3, 2u);
      }

      +[PPQuickTypeMetrics frameworkError:@"GEOTimeout" errorCode:3];
      return 0;
    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 72));
      return 1;
    }
  }
  return result;
}

- (void)dealloc
{
  if (self)
  {
    v3 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "_stopListeningToNavigationUpdate", buf, 2u);
    }

    v4 = self;
    objc_sync_enter(v4);
    navigationListener = v4->_navigationListener;
    v4->_navigationListener = 0;

    destinationName = v4->_destinationName;
    v4->_destinationName = 0;

    streetName = v4->_streetName;
    v4->_streetName = 0;

    objc_sync_exit(v4);
  }
  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeNavigationServant;
  [(PPQuickTypeNavigationServant *)&v8 dealloc];
}

- (PPQuickTypeNavigationServant)init
{
  v31.receiver = self;
  v31.super_class = (Class)PPQuickTypeNavigationServant;
  v2 = [(PPQuickTypeNavigationServant *)&v31 init];
  if (v2)
  {
    v3 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeNavigationServant initializing", buf, 2u);
    }

    uint64_t v4 = newGEONavigationListener();
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    [*((id *)v2 + 1) setDelegate:v2];
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 40) = _Q0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    uint64_t v12 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v16 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v15;

    [*((id *)v2 + 1) requestGuidanceState];
    [*((id *)v2 + 1) requestRouteSummary];
    [*((id *)v2 + 1) requestPositionFromDestination];
    double v17 = (void *)MEMORY[0x1E4F89EE8];
    BOOL v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v19 = [v18 localeIdentifier];
    uint64_t v20 = [v17 quickTypeQueryWithType:0 subtype:0 semanticTag:0 fields:0 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v19 bundleIdentifier:0 recipients:0];

    uint64_t v21 = +[PPQuickTypeFormatter formatterWithQuery:v20];
    id v22 = (id)[v21 makeShortEventFormatter];
    id v23 = (id)[v21 makeLongEventFormatter];
    id v24 = (id)[v21 makeDateComponentFormatter];
    id v25 = (id)[v21 makeLengthFormatter];
    v26 = [v21 etaLabel];
    id v27 = (id)[v21 navigationItemLabelForTypeLabel:v26 destination:@"warmup"];

    v28 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_INFO, "PPQuickTypeNavigationServant initialization complete", buf, 2u);
    }
  }
  return (PPQuickTypeNavigationServant *)v2;
}

@end