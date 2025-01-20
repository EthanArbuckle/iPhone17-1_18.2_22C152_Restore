@interface ATXLocationManagerState
+ (BOOL)supportsSecureCoding;
+ (id)merge:(id)a3 with:(id)a4;
- (ATXLocationManagerKnownLOIs)locationsOfInterest;
- (ATXLocationManagerState)init;
- (ATXLocationManagerState)initWithCoder:(id)a3;
- (ATXLocationOfInterest)currentLOI;
- (ATXLocationOfInterest)previousLOI;
- (CLLocation)gymLOI;
- (CLLocation)homeLOI;
- (CLLocation)schoolLOI;
- (CLLocation)workLOI;
- (NSArray)predictedExitTimes;
- (NSArray)predictedNextLOIs;
- (NSDate)lastUpdateDate;
- (void)encodeWithCoder:(id)a3;
- (void)expirePreviousLOIBefore:(id)a3;
- (void)setCurrentLOI:(id)a3;
- (void)setLastUpdateDate:(id)a3;
- (void)setPredictedExitTimes:(id)a3;
- (void)setPredictedNextLOIs:(id)a3;
- (void)setPreviousLOI:(id)a3;
@end

@implementation ATXLocationManagerState

- (ATXLocationManagerState)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXLocationManagerState;
  v2 = [(ATXLocationManagerState *)&v13 init];
  v3 = v2;
  if (v2)
  {
    previousLOI = v2->_previousLOI;
    v2->_previousLOI = 0;

    currentLOI = v3->_currentLOI;
    v3->_currentLOI = 0;

    predictedNextLOIs = v3->_predictedNextLOIs;
    v3->_predictedNextLOIs = 0;

    predictedExitTimes = v3->_predictedExitTimes;
    v3->_predictedExitTimes = 0;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastUpdateDate = v3->_lastUpdateDate;
    v3->_lastUpdateDate = (NSDate *)v8;

    uint64_t v10 = objc_opt_new();
    locationsOfInterest = v3->_locationsOfInterest;
    v3->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v10;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  currentLOI = self->_currentLOI;
  id v5 = a3;
  [v5 encodeObject:currentLOI forKey:@"currentLOI"];
  [v5 encodeObject:self->_previousLOI forKey:@"previousLOI"];
  [v5 encodeObject:self->_lastUpdateDate forKey:@"lastUpdateDate"];
  [v5 encodeObject:self->_predictedNextLOIs forKey:@"predictedNextLOIs"];
  [v5 encodeObject:self->_predictedExitTimes forKey:@"predictedExitTimes"];
  [v5 encodeObject:self->_locationsOfInterest forKey:@"locationsOfInterest"];
}

- (ATXLocationManagerState)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ATXLocationManagerState;
  id v5 = [(ATXLocationManagerState *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentLOI"];
    currentLOI = v5->_currentLOI;
    v5->_currentLOI = (ATXLocationOfInterest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousLOI"];
    previousLOI = v5->_previousLOI;
    v5->_previousLOI = (ATXLocationOfInterest *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdateDate"];
    lastUpdateDate = v5->_lastUpdateDate;
    v5->_lastUpdateDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationsOfInterest"];
    locationsOfInterest = v5->_locationsOfInterest;
    v5->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v12;

    if (!v5->_locationsOfInterest)
    {
      uint64_t v14 = objc_opt_new();
      v15 = v5->_locationsOfInterest;
      v5->_locationsOfInterest = (ATXLocationManagerKnownLOIs *)v14;
    }
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v18 = [v16 setWithArray:v17];

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v21 = [v19 setWithArray:v20];

    uint64_t v22 = [v4 decodeObjectOfClasses:v18 forKey:@"predictedNextLOIs"];
    predictedNextLOIs = v5->_predictedNextLOIs;
    v5->_predictedNextLOIs = (NSArray *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v21 forKey:@"predictedExitTimes"];
    predictedExitTimes = v5->_predictedExitTimes;
    v5->_predictedExitTimes = (NSArray *)v24;
  }
  return v5;
}

+ (id)merge:(id)a3 with:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 lastUpdateDate];
  uint64_t v8 = [v6 lastUpdateDate];
  v9 = [v7 earlierDate:v8];
  uint64_t v10 = [v6 lastUpdateDate];
  int v11 = [v9 isEqualToDate:v10];

  if (v11) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v6;
  }
  if (v11) {
    id v13 = v6;
  }
  else {
    id v13 = v5;
  }
  v51 = v13;
  uint64_t v14 = objc_opt_new();
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy_;
  v59[4] = __Block_byref_object_dispose_;
  id v60 = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __38__ATXLocationManagerState_merge_with___block_invoke;
  v56[3] = &unk_1E6BE6918;
  v58 = v59;
  id v49 = v14;
  id v57 = v49;
  v50 = (void (**)(void, void))MEMORY[0x1E0187570](v56);
  v15 = [v51 previousLOI];
  ((void (**)(void, void *))v50)[2](v50, v15);

  v16 = [v51 currentLOI];
  ((void (**)(void, void *))v50)[2](v50, v16);

  v17 = [v12 previousLOI];
  ((void (**)(void, void *))v50)[2](v50, v17);

  v18 = [v12 currentLOI];
  ((void (**)(void, void *))v50)[2](v50, v18);

  v19 = objc_opt_new();
  if ([v49 count])
  {
    v20 = [v12 currentLOI];
    BOOL v21 = v20 == 0;

    if (!v21)
    {
      uint64_t v22 = [v49 lastObject];
      [v19 setCurrentLOI:v22];

      [v49 removeLastObject];
    }
  }
  if ([v49 count])
  {
    v23 = [v49 lastObject];
    [v19 setPreviousLOI:v23];
  }
  uint64_t v24 = [v12 predictedNextLOIs];

  if (v24) {
    [v12 predictedNextLOIs];
  }
  else {
  v25 = [v51 predictedNextLOIs];
  }
  [v19 setPredictedNextLOIs:v25];

  v26 = [v12 predictedExitTimes];

  if (v26) {
    [v12 predictedExitTimes];
  }
  else {
  objc_super v27 = [v51 predictedExitTimes];
  }
  [v19 setPredictedExitTimes:v27];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v61[0] = @"Home";
  v61[1] = @"Work";
  v61[2] = @"School";
  v61[3] = @"Gym";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v53 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        v33 = [v12 locationsOfInterest];
        v34 = [v33 valueForKey:v32];

        [v19 locationsOfInterest];
        if (v34) {
          v35 = {;
        }
          [v12 locationsOfInterest];
        }
        else {
          v35 = {;
        }
          [v51 locationsOfInterest];
        v36 = };
        v37 = [v36 valueForKey:v32];
        [v35 setValue:v37 forKey:v32];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v29);
  }

  v38 = [v19 currentLOI];
  v39 = [v51 currentLOI];
  if (v38 != v39) {
    goto LABEL_35;
  }
  v40 = [v19 previousLOI];
  v41 = [v51 previousLOI];
  if (v40 != v41)
  {
LABEL_34:

    v39 = v38;
LABEL_35:

    goto LABEL_36;
  }
  v42 = [v19 predictedNextLOIs];
  v43 = [v51 predictedNextLOIs];
  if (!arraysAreEqual(v42, v43))
  {

    v41 = v40;
    goto LABEL_34;
  }
  v44 = [v19 predictedExitTimes];
  v45 = [v51 predictedExitTimes];
  int v46 = arraysAreEqual(v44, v45);

  if (v46)
  {
    v47 = [v51 lastUpdateDate];
    [v19 setLastUpdateDate:v47];
    goto LABEL_37;
  }
LABEL_36:
  v47 = [v12 lastUpdateDate];
  [v19 setLastUpdateDate:v47];
LABEL_37:

  _Block_object_dispose(v59, 8);

  return v19;
}

void __38__ATXLocationManagerState_merge_with___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v4 = a2;
    id v5 = [v4 uuid];
    LODWORD(v3) = [v3 isEqual:v5];

    if (v3) {
      [*(id *)(a1 + 32) removeLastObject];
    }
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v6 = [v4 uuid];

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)expirePreviousLOIBefore:(id)a3
{
  id v4 = [(NSDate *)self->_lastUpdateDate earlierDate:a3];
  int v5 = [v4 isEqualToDate:self->_lastUpdateDate];

  if (v5)
  {
    previousLOI = self->_previousLOI;
    self->_previousLOI = 0;
  }
}

- (CLLocation)homeLOI
{
  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest) {
    return locationsOfInterest->Home;
  }
  else {
    return (CLLocation *)0;
  }
}

- (CLLocation)workLOI
{
  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest) {
    return locationsOfInterest->Work;
  }
  else {
    return (CLLocation *)0;
  }
}

- (CLLocation)schoolLOI
{
  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest) {
    return locationsOfInterest->School;
  }
  else {
    return (CLLocation *)0;
  }
}

- (CLLocation)gymLOI
{
  locationsOfInterest = self->_locationsOfInterest;
  if (locationsOfInterest) {
    return locationsOfInterest->Gym;
  }
  else {
    return (CLLocation *)0;
  }
}

- (ATXLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (void)setCurrentLOI:(id)a3
{
}

- (ATXLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (void)setPreviousLOI:(id)a3
{
}

- (NSArray)predictedNextLOIs
{
  return self->_predictedNextLOIs;
}

- (void)setPredictedNextLOIs:(id)a3
{
}

- (NSArray)predictedExitTimes
{
  return self->_predictedExitTimes;
}

- (void)setPredictedExitTimes:(id)a3
{
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (ATXLocationManagerKnownLOIs)locationsOfInterest
{
  return self->_locationsOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsOfInterest, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_predictedExitTimes, 0);
  objc_storeStrong((id *)&self->_predictedNextLOIs, 0);
  objc_storeStrong((id *)&self->_previousLOI, 0);

  objc_storeStrong((id *)&self->_currentLOI, 0);
}

@end