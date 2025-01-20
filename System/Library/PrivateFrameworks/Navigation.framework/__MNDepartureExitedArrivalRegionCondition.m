@interface __MNDepartureExitedArrivalRegionCondition
- (NSString)name;
- (__MNDepartureExitedArrivalRegionCondition)initWithUpdater:(id)a3 arrivalRegions:(id)a4;
- (double)scoreForLocation:(id)a3;
@end

@implementation __MNDepartureExitedArrivalRegionCondition

- (__MNDepartureExitedArrivalRegionCondition)initWithUpdater:(id)a3 arrivalRegions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)__MNDepartureExitedArrivalRegionCondition;
  v8 = [(__MNDepartureExitedArrivalRegionCondition *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_updater, v6);
    objc_storeStrong((id *)&v9->_arrivalRegions, a4);
    v9->_numHistoricalLocations = GEOConfigGetUInteger();
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9->_numHistoricalLocations];
    regionDepartureHistory = v9->_regionDepartureHistory;
    v9->_regionDepartureHistory = (NSMutableArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (double)scoreForLocation:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updater);

  if (!WeakRetained)
  {
    double v29 = -1.0;
    goto LABEL_30;
  }
  if ([(NSMutableArray *)self->_regionDepartureHistory count] > self->_numHistoricalLocations - 1) {
    [(NSMutableArray *)self->_regionDepartureHistory removeObjectAtIndex:0];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = self->_arrivalRegions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v7)
  {

LABEL_21:
    uint64_t v28 = MEMORY[0x1E4F1CC28];
    goto LABEL_22;
  }
  uint64_t v8 = v7;
  v38 = self;
  char v9 = 0;
  uint64_t v10 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      if ([v12 arrivalRegionAction] == 5
        || [v12 arrivalRegionAction] == 2)
      {
        v13 = [v4 roadMatch];

        objc_super v14 = [v12 arrivalRegion];
        if (v13)
        {
          v15 = [v4 roadMatch];
          [v15 coordinateOnRoad];
          double v17 = v16;
          double v19 = v18;
          v20 = [v4 roadMatch];
          [v20 roadWidth];
          char v22 = objc_msgSend(v14, "containsCoordinate:radius:", v17, v19, v21);
        }
        else
        {
          v15 = [v4 rawLocation];
          [v15 coordinate];
          double v24 = v23;
          double v26 = v25;
          [v4 horizontalAccuracy];
          char v22 = objc_msgSend(v14, "containsCoordinate:radius:", v24, v26, v27);
        }
        v9 |= v22 ^ 1;
      }
    }
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v8);

  self = v38;
  if ((v9 & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v28 = MEMORY[0x1E4F1CC38];
LABEL_22:
  [(NSMutableArray *)self->_regionDepartureHistory addObject:v28];
  double v30 = (double)~(-1 << LODWORD(self->_numHistoricalLocations));
  uint64_t v31 = [(NSMutableArray *)self->_regionDepartureHistory count];
  if (v31)
  {
    uint64_t v32 = v31;
    double v33 = 0.0;
    do
    {
      v34 = [(NSMutableArray *)self->_regionDepartureHistory objectAtIndex:--v32];
      int v35 = [v34 BOOLValue];

      double v36 = (double)(1 << v32);
      if (!v35) {
        double v36 = -0.0;
      }
      double v33 = v33 + v36;
    }
    while (v32);
  }
  else
  {
    double v33 = 0.0;
  }
  double v29 = v33 / v30;
LABEL_30:

  return v29;
}

- (NSString)name
{
  return (NSString *)@"__MNDepartureExitedArrivalRegionCondition";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionDepartureHistory, 0);
  objc_storeStrong((id *)&self->_arrivalRegions, 0);
  objc_destroyWeak((id *)&self->_updater);
}

@end