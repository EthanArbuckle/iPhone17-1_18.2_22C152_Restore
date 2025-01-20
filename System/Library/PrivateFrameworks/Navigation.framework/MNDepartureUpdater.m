@interface MNDepartureUpdater
- (BOOL)allowDepartureForLocation:(id)a3;
- (GEOComposedRoute)route;
- (GEOComposedRouteLeg)arrivalLeg;
- (MNDepartureUpdater)initWithRoute:(id)a3 arrivalLegIndex:(unint64_t)a4;
- (id)_arrivalRegionsDepartureConditions;
- (id)_defaultDepartureConditions;
- (id)_descriptionForSubScores;
- (unint64_t)arrivalWaypointLegIndex;
- (void)_initConditions;
@end

@implementation MNDepartureUpdater

- (MNDepartureUpdater)initWithRoute:(id)a3 arrivalLegIndex:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNDepartureUpdater;
  v8 = [(MNDepartureUpdater *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v10 = [v7 legs];
    uint64_t v11 = [v10 objectAtIndexedSubscript:a4];
    arrivalLeg = v9->_arrivalLeg;
    v9->_arrivalLeg = (GEOComposedRouteLeg *)v11;

    [(MNDepartureUpdater *)v9 _initConditions];
    uint64_t v13 = objc_opt_new();
    conditionScores = v9->_conditionScores;
    v9->_conditionScores = (NSMutableDictionary *)v13;

    v15 = v9;
  }

  return v9;
}

- (unint64_t)arrivalWaypointLegIndex
{
  return [(GEOComposedRouteLeg *)self->_arrivalLeg legIndex];
}

- (BOOL)allowDepartureForLocation:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_conditionScores)
  {
    BOOL v29 = 0;
    goto LABEL_34;
  }
  uint64_t UInteger = GEOConfigGetUInteger();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v5 = self->_conditions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v42 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      [v10 scoreForLocation:v4];
      double v12 = v11;
      conditionScores = self->_conditionScores;
      v14 = [v10 name];
      v15 = [(NSMutableDictionary *)conditionScores objectForKey:v14];
      [v15 doubleValue];
      double v17 = v16;

      if (v17 == -1.0)
      {
        v18 = self->_conditionScores;
        v19 = [v10 name];
        [(NSMutableDictionary *)v18 removeObjectForKey:v19];
      }
      else
      {
        if (v12 <= v17) {
          continue;
        }
        v20 = self->_conditionScores;
        v19 = [NSNumber numberWithDouble:v12];
        v21 = [v10 name];
        [(NSMutableDictionary *)v20 setObject:v19 forKey:v21];
      }
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v52 count:16];
  }
  while (v7);
LABEL_14:

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v22 = [(NSMutableDictionary *)self->_conditionScores allValues];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    double v26 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * j) doubleValue];
        double v26 = v26 + v28;
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v24);
  }
  else
  {
    double v26 = 0.0;
  }

  if ([(NSMutableDictionary *)self->_conditionScores count])
  {
    double v30 = v26 / (double)(unint64_t)[(NSMutableDictionary *)self->_conditionScores count];
    v31 = MNGetMNDepartureUpdaterLog();
    v32 = v31;
    if (v30 <= (double)(unint64_t)UInteger / 100.0)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v34 = [(MNDepartureUpdater *)self _descriptionForSubScores];
        *(_DWORD *)buf = 134218498;
        double v46 = v30;
        __int16 v47 = 2048;
        double v48 = (double)(unint64_t)UInteger / 100.0;
        __int16 v49 = 2112;
        v50 = v34;
        _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_INFO, "Not allowing departure yet because score (%0.2f) is below the minimum score (%g). Sub scores:%@", buf, 0x20u);
      }
      BOOL v29 = 0;
    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v46 = v30;
        __int16 v47 = 2048;
        double v48 = (double)(unint64_t)UInteger / 100.0;
        _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_DEFAULT, "Allow departure because score (%0.2f) is above the minimum score (%g).", buf, 0x16u);
      }
      BOOL v29 = 1;
    }
  }
  else
  {
    v32 = [v4 routeMatch];
    unint64_t v33 = [v32 legIndex];
    BOOL v29 = v33 > [(MNDepartureUpdater *)self arrivalWaypointLegIndex];
  }

LABEL_34:
  return v29;
}

- (void)_initConditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
    conditions = [v4 arrivalMapRegions];

    uint64_t v6 = [conditions countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(conditions);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 arrivalRegionAction] == 5
            || [v10 arrivalRegionAction] == 2)
          {

            double v11 = [(MNDepartureUpdater *)self _arrivalRegionsDepartureConditions];
            conditions = self->_conditions;
            self->_conditions = v11;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [conditions countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  if (!self->_conditions)
  {
    double v12 = [(MNDepartureUpdater *)self _defaultDepartureConditions];
    uint64_t v13 = self->_conditions;
    self->_conditions = v12;
  }
}

- (id)_defaultDepartureConditions
{
  v27[1] = *MEMORY[0x1E4F143B8];
  char BOOL = GEOConfigGetBOOL();
  id v4 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
  v5 = [v4 arrivalPoints];

  if (BOOL)
  {
    uint64_t v6 = [__MNDepartureTimeSpentCondition alloc];
    GEOConfigGetDouble();
    uint64_t v7 = -[__MNDepartureTimeSpentCondition initWithUpdater:timeThreshold:](v6, "initWithUpdater:timeThreshold:", self);
    uint64_t v8 = (__MNDepartureMinimumDepartureDistanceCondition *)v7;
    if (v5)
    {
      v25[0] = v7;
      v9 = [__MNDepartureMinimumArrivalDistanceCondition alloc];
      GEOConfigGetDouble();
      v10 = -[__MNDepartureMinimumArrivalDistanceCondition initWithUpdater:distanceThreshold:](v9, "initWithUpdater:distanceThreshold:", self);
      v25[1] = v10;
      double v11 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
      double v12 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
      uint64_t v13 = [v12 arrivalPoints];
      GEOConfigGetDouble();
      long long v14 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:arrivalPoints:distanceThreshold:](v11, "initWithUpdater:arrivalPoints:distanceThreshold:", self, v13);
      v25[2] = v14;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];

LABEL_8:
      goto LABEL_9;
    }
    v24[0] = v7;
    v21 = [__MNDepartureMinimumArrivalDistanceCondition alloc];
    GEOConfigGetDouble();
    v10 = -[__MNDepartureMinimumArrivalDistanceCondition initWithUpdater:distanceThreshold:](v21, "initWithUpdater:distanceThreshold:", self);
    v24[1] = v10;
    v22 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
    GEOConfigGetDouble();
    long long v17 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:distanceThreshold:](v22, "initWithUpdater:distanceThreshold:", self);
    v24[2] = v17;
    v18 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v19 = v24;
    uint64_t v20 = 3;
LABEL_7:
    long long v15 = [v18 arrayWithObjects:v19 count:v20];

    goto LABEL_8;
  }
  long long v16 = [__MNDepartureMinimumDepartureDistanceCondition alloc];
  if (v5)
  {
    uint64_t v8 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
    v10 = [(__MNDepartureMinimumDepartureDistanceCondition *)v8 arrivalPoints];
    GEOConfigGetDouble();
    long long v17 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:arrivalPoints:distanceThreshold:](v16, "initWithUpdater:arrivalPoints:distanceThreshold:", self, v10);
    v27[0] = v17;
    v18 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v19 = v27;
    uint64_t v20 = 1;
    goto LABEL_7;
  }
  GEOConfigGetDouble();
  uint64_t v8 = -[__MNDepartureMinimumDepartureDistanceCondition initWithUpdater:distanceThreshold:](v16, "initWithUpdater:distanceThreshold:", self);
  double v26 = v8;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
LABEL_9:

  return v15;
}

- (id)_arrivalRegionsDepartureConditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
  id v4 = [v3 arrivalMapRegions];

  if (!v4)
  {
    double v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v14 = "-[MNDepartureUpdater _arrivalRegionsDepartureConditions]";
      __int16 v15 = 2080;
      long long v16 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/LocationTracking/MNDepartureUpdater.m";
      __int16 v17 = 1024;
      int v18 = 481;
      __int16 v19 = 2080;
      uint64_t v20 = "_arrivalLeg.arrivalParameters.arrivalMapRegions != nil";
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
  v5 = [__MNDepartureExitedArrivalRegionCondition alloc];
  uint64_t v6 = [(GEOComposedRouteLeg *)self->_arrivalLeg arrivalParameters];
  uint64_t v7 = [v6 arrivalMapRegions];
  uint64_t v8 = [(__MNDepartureExitedArrivalRegionCondition *)v5 initWithUpdater:self arrivalRegions:v7];
  double v12 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  return v9;
}

- (id)_descriptionForSubScores
{
  v3 = [(NSMutableDictionary *)self->_conditionScores allKeys];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__MNDepartureUpdater__descriptionForSubScores__block_invoke;
  v9[3] = &unk_1E60FBAB8;
  v9[4] = self;
  id v4 = objc_msgSend(v3, "_geo_map:", v9);

  v5 = NSString;
  uint64_t v6 = [v4 componentsJoinedByString:@"\n\t"];
  uint64_t v7 = [v5 stringWithFormat:@"\n\t%@", v6];

  return v7;
}

id __46__MNDepartureUpdater__descriptionForSubScores__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = a2;
  id v4 = [v2 objectForKeyedSubscript:v3];
  v5 = NSString;
  [v4 doubleValue];
  uint64_t v7 = [v5 stringWithFormat:@"%@: %0.2f", v3, v6];

  return v7;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOComposedRouteLeg)arrivalLeg
{
  return self->_arrivalLeg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalLeg, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_conditionScores, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end