@interface APOdmlVectorBuilder
- (APOdmlUnfairLock)setVectorAndWeightLock;
- (APOdmlVector)vector;
- (APOdmlVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9;
- (APOdmlXpcLifecycleHandler)task;
- (BOOL)assetManagerIsCounterfactual;
- (BOOL)shouldDefer;
- (BOOL)weightByDuration;
- (NSArray)events;
- (NSMutableDictionary)adamIDtoBundleID;
- (NSString)version;
- (double)exponentialDecayConstant;
- (double)lookbackPeriod;
- (double)vectorWeightTotal;
- (double)weightForEvents:(id)a3;
- (id)adamIDForBundleID:(id)a3;
- (id)eventName;
- (id)eventsBetween:(id)a3 and:(id)a4;
- (id)eventsForLookbackPeriod:(double)a3;
- (id)pullEvents;
- (id)retrieveFilteredEvents:(id)a3;
- (id)retrieveVector:(id *)a3;
- (id)updateVector:(id)a3 withVector:(id)a4 usingWeight:(double)a5;
- (int64_t)maxQueryElements;
- (void)addAppVector:(id)a3;
- (void)buildBundleIDtoAdamIDCache:(id)a3;
- (void)setAdamIDtoBundleID:(id)a3;
- (void)setAssetManagerIsCounterfactual:(BOOL)a3;
- (void)setEvents:(id)a3;
- (void)setExponentialDecayConstant:(double)a3;
- (void)setLookbackPeriod:(double)a3;
- (void)setMaxQueryElements:(int64_t)a3;
- (void)setSetVectorAndWeightLock:(id)a3;
- (void)setTask:(id)a3;
- (void)setVector:(id)a3;
- (void)setVectorWeightTotal:(double)a3;
- (void)setVersion:(id)a3;
- (void)setWeightByDuration:(BOOL)a3;
@end

@implementation APOdmlVectorBuilder

- (APOdmlVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v46.receiver = self;
  v46.super_class = (Class)APOdmlVectorBuilder;
  v22 = [(APOdmlVectorBuilder *)&v46 init];
  v23 = v22;
  if (!v22) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v22->_version, a3);
  v24 = [APOdmlVector alloc];
  uint64_t v26 = objc_msgSend_initWithVersion_andArray_(v24, v25, (uint64_t)v16, 0);
  vector = v23->_vector;
  v23->_vector = (APOdmlVector *)v26;

  v23->_vectorWeightTotal = 0.0;
  v28 = [APOdmlUnfairLock alloc];
  uint64_t v30 = objc_msgSend_initWithOptions_(v28, v29, 1);
  setVectorAndWeightLock = v23->_setVectorAndWeightLock;
  v23->_setVectorAndWeightLock = (APOdmlUnfairLock *)v30;

  uint64_t v34 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v32, v33);
  adamIDtoBundleID = v23->_adamIDtoBundleID;
  v23->_adamIDtoBundleID = (NSMutableDictionary *)v34;

  objc_storeStrong((id *)&v23->_task, a6);
  if (v17) {
    objc_msgSend_doubleValue(v17, v36, v37);
  }
  else {
    uint64_t v38 = 0x4122750000000000;
  }
  *(void *)&v23->_lookbackPeriod = v38;
  uint64_t v39 = v18 ? objc_msgSend_longValue(v18, v36, v37) : 1000;
  v23->_maxQueryElements = v39;
  if (v20) {
    objc_msgSend_doubleValue(v20, v36, v37);
  }
  else {
    double v40 = 0.0;
  }
  v23->_exponentialDecayConstant = v40;
  char v41 = v21 ? objc_msgSend_BOOLValue(v21, v36, v37) : 0;
  v23->_weightByDuration = v41;
  v23->_assetManagerIsCounterfactual = a9;
  uint64_t v42 = objc_msgSend_pullEvents(v23, v36, v37);
  events = v23->_events;
  v23->_events = (NSArray *)v42;

  if (!v23->_events) {
    v44 = 0;
  }
  else {
LABEL_15:
  }
    v44 = v23;

  return v44;
}

- (void)addAppVector:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = v4;
  if (v4)
  {
    v8 = NSNumber;
    uint64_t v9 = objc_msgSend_adamID(v4, v5, v6);
    v11 = objc_msgSend_numberWithUnsignedLongLong_(v8, v10, v9);
    v14 = objc_msgSend_adamIDtoBundleID(self, v12, v13);
    objc_msgSend_objectForKey_(v14, v15, (uint64_t)v11);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      id v17 = OdmlLogForCategory(2uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v56 = 138412290;
        id v57 = (id)objc_opt_class();
        id v18 = v57;
        _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%@]: App vector found; updating.",
          (uint8_t *)&v56,
          0xCu);
      }
      id v20 = objc_msgSend_retrieveFilteredEvents_(self, v19, (uint64_t)v16);
      if (objc_msgSend_count(v20, v21, v22))
      {
        objc_msgSend_weightForEvents_(self, v23, (uint64_t)v20);
        double v25 = v24;
        v28 = objc_msgSend_vector(self, v26, v27);
        uint64_t v30 = objc_msgSend_updateVector_withVector_usingWeight_(self, v29, (uint64_t)v28, v7, v25);

        uint64_t v33 = objc_msgSend_setVectorAndWeightLock(self, v31, v32);
        objc_msgSend_lock(v33, v34, v35);

        objc_msgSend_setVector_(self, v36, (uint64_t)v30);
        objc_msgSend_vectorWeightTotal(self, v37, v38);
        objc_msgSend_setVectorWeightTotal_(self, v40, v41, v25 + v39);
        v44 = objc_msgSend_setVectorAndWeightLock(self, v42, v43);
        objc_msgSend_unlock(v44, v45, v46);

        v47 = OdmlLogForCategory(2uLL);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = objc_opt_class();
          id v49 = v48;
          uint64_t v52 = objc_msgSend_count(v20, v50, v51);
          objc_msgSend_vectorWeightTotal(self, v53, v54);
          int v56 = 138413314;
          id v57 = v48;
          __int16 v58 = 2112;
          id v59 = v16;
          __int16 v60 = 2048;
          uint64_t v61 = v52;
          __int16 v62 = 2048;
          double v63 = v25;
          __int16 v64 = 2048;
          uint64_t v65 = v55;
          _os_log_impl(&dword_1BBC44000, v47, OS_LOG_TYPE_DEFAULT, "[%@]: Vector updated for bundleID %@ with %lu events for a weight of %f. Vector weight total: %f", (uint8_t *)&v56, 0x34u);
        }
      }
    }
    goto LABEL_12;
  }
  v11 = OdmlLogForCategory(2uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v56 = 138412290;
    id v57 = (id)objc_opt_class();
    id v16 = v57;
    _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "[%@] ERROR: We cannot update the vector with a nil vector.", (uint8_t *)&v56, 0xCu);
LABEL_12:
  }
}

- (id)retrieveVector:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = OdmlLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v35 = 138412290;
    *(void *)&v35[4] = objc_opt_class();
    id v6 = *(id *)&v35[4];
    _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_DEFAULT, "[%@]: Retrieving normalized app vectors.", v35, 0xCu);
  }
  uint64_t v9 = objc_msgSend_vector(self, v7, v8);

  if (v9)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v22 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      *(_DWORD *)uint64_t v35 = 138412290;
      *(void *)&v35[4] = v23;
      id v24 = v23;
      _os_log_impl(&dword_1BBC44000, v22, OS_LOG_TYPE_ERROR, "[%@]: Vector is not found.", v35, 0xCu);
    }
    id v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v25, @"APOdmlFeatureCalculatorErrorDomain", 1006, 0);
    id v12 = v21;
    if (a3 && v21) {
      goto LABEL_15;
    }
  }
  objc_msgSend_vectorWeightTotal(self, v10, v11, *(_OWORD *)v35);
  if (v15 <= 0.0)
  {
    id v16 = OdmlLogForCategory(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_opt_class();
      *(_DWORD *)uint64_t v35 = 138412290;
      *(void *)&v35[4] = v17;
      id v18 = v17;
      _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, "[%@]: Vector weight total not greater than 0.", v35, 0xCu);
    }
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v19, @"APOdmlFeatureCalculatorErrorDomain", 1005, 0);

    if (a3 && v20)
    {
      id v21 = (void *)v20;
LABEL_15:
      id v12 = v21;
      uint64_t v26 = 0;
      *a3 = v12;
      goto LABEL_18;
    }
    id v12 = (id)v20;
  }
  uint64_t v27 = objc_msgSend_vector(self, v13, v14);
  objc_msgSend_vectorWeightTotal(self, v28, v29);
  double v31 = 1.0 / v30;
  *(float *)&double v31 = v31;
  uint64_t v26 = objc_msgSend_scalarMultiply_(v27, v32, v33, v31);

LABEL_18:

  return v26;
}

- (id)eventsBetween:(id)a3 and:(id)a4
{
  return 0;
}

- (id)eventName
{
  return @"Unknown vector builder.";
}

- (id)retrieveFilteredEvents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = objc_msgSend_events(self, v8, v9, 0);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v22, v26, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v10);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v18 = objc_msgSend_objectForKey_(v17, v13, @"bundleID");
        int isEqualToString = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)v4);

        if (isEqualToString) {
          objc_msgSend_addObject_(v7, v13, (uint64_t)v17);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v22, v26, 16);
    }
    while (v14);
  }

  return v7;
}

- (id)pullEvents
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_shouldDefer(self, a2, v2))
  {
    uint64_t v6 = 0;
  }
  else
  {
    objc_msgSend_lookbackPeriod(self, v4, v5);
    uint64_t v6 = objc_msgSend_eventsForLookbackPeriod_(self, v7, v8);
    if (v6)
    {
      objc_msgSend_buildBundleIDtoAdamIDCache_(self, v9, (uint64_t)v6);
      id v10 = v6;
    }
    else
    {
      uint64_t v11 = OdmlLogForCategory(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = (id)objc_opt_class();
        id v12 = v27;
        _os_log_impl(&dword_1BBC44000, v11, OS_LOG_TYPE_ERROR, "[%@] ERROR: No usage events found.", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, @"APOdmlFeatureCalculatorErrorDomain", 1004, 0);
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = objc_msgSend_eventName(self, v16, v17);
      uint64_t v20 = objc_msgSend_dictionaryWithObject_forKey_(v15, v19, (uint64_t)v18, @"featureName");

      uint64_t IsCounterfactual = objc_msgSend_assetManagerIsCounterfactual(self, v21, v22);
      objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v24, (uint64_t)v14, v20, IsCounterfactual);
    }
  }

  return v6;
}

- (id)eventsForLookbackPeriod:(double)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v3);
  uint64_t v9 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v7, v8);
  objc_msgSend_timeIntervalSince1970(v9, v10, v11);
  double v13 = v12;

  double v17 = v13 - a3;
  if (v13 >= v13 - a3)
  {
    uint64_t v18 = 0;
    *(void *)&long long v16 = 138412290;
    long long v35 = v16;
    do
    {
      if (v18 > objc_msgSend_maxQueryElements(self, v14, v15, v35)) {
        break;
      }
      double v20 = v13 + -43200.0;
      id v21 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v14, v19, v13 + -43200.0);
      long long v24 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E4F1C9C8], v22, v23, v13);
      int v26 = objc_msgSend_eventsBetween_and_(self, v25, (uint64_t)v21, v24);

      if (v26)
      {
        objc_msgSend_addObjectsFromArray_(v6, v27, (uint64_t)v26);
        v18 += objc_msgSend_count(v26, v28, v29);
      }
      else
      {
        double v30 = OdmlLogForCategory(2uLL);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          double v31 = objc_opt_class();
          *(_DWORD *)buf = v35;
          uint64_t v37 = v31;
          id v32 = v31;
          _os_log_impl(&dword_1BBC44000, v30, OS_LOG_TYPE_DEFAULT, "[%@] No events found in date range.", buf, 0xCu);
        }
      }

      double v13 = v13 + -43200.0;
    }
    while (v20 >= v17);
  }
  uint64_t v33 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v14, (uint64_t)v6);

  return v33;
}

- (double)weightForEvents:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v43, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v40;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v8);
        }
        double v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        double v19 = 1.0;
        if (objc_msgSend_weightByDuration(self, v11, v12, (void)v39))
        {
          double v20 = objc_msgSend_objectForKey_(v17, v18, @"duration");
          uint64_t v23 = v20;
          if (v20)
          {
            objc_msgSend_doubleValue(v20, v21, v22);
            double v19 = v24;
          }
        }
        long long v25 = objc_msgSend_objectForKey_(v17, v18, @"absoluteTimestamp");
        int v26 = (void *)MEMORY[0x1E4F1C9C8];
        objc_msgSend_doubleValue(v25, v27, v28);
        double v31 = objc_msgSend_dateWithTimeIntervalSince1970_(v26, v29, v30);
        objc_msgSend_timeIntervalSinceDate_(v7, v32, (uint64_t)v31);
        double v34 = v33;

        objc_msgSend_exponentialDecayConstant(self, v35, v36);
        double v15 = v15 + v19 * exp(v34 / -86400.0 * v37);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v43, 16);
    }
    while (v13);
  }
  else
  {
    double v15 = 0.0;
  }

  return v15;
}

- (id)updateVector:(id)a3 withVector:(id)a4 usingWeight:(double)a5
{
  id v7 = a3;
  *(float *)&double v8 = a5;
  uint64_t v11 = objc_msgSend_scalarMultiply_(a4, v9, v10, v8);
  if (objc_msgSend_length(v7, v12, v13))
  {
    objc_msgSend_vectorAdd_(v7, v14, (uint64_t)v11);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v17 = objc_msgSend_version(v7, v14, v15);

    if (v17)
    {
      double v20 = objc_msgSend_version(v7, v18, v19);
      objc_msgSend_setVersion_(v11, v21, (uint64_t)v20);
    }
    id v16 = v11;
  }
  uint64_t v22 = v16;

  return v22;
}

- (void)buildBundleIDtoAdamIDCache:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        uint64_t v15 = (void *)MEMORY[0x1C1864650]();
        if (objc_msgSend_shouldDefer(self, v16, v17))
        {

          goto LABEL_16;
        }
        uint64_t v19 = objc_msgSend_objectForKey_(v14, v18, @"bundleID");
        id v21 = objc_msgSend_objectForKey_(v7, v20, (uint64_t)v19);

        if (!v21)
        {
          uint64_t v23 = objc_msgSend_adamIDForBundleID_(self, v22, (uint64_t)v19);
          int v26 = v23;
          if (v23 && objc_msgSend_intValue(v23, v24, v25)) {
            objc_msgSend_setObject_forKey_(v7, v27, (uint64_t)v26, v19);
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v28, (uint64_t)&v31, v35, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1BBC596AC;
  v30[3] = &unk_1E624A918;
  v30[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v29, (uint64_t)v30);
LABEL_16:
}

- (id)adamIDForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1C1864650]();
  id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v19 = 0;
  id v7 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v5, v6, (uint64_t)v3, 0, &v19);
  uint64_t v10 = v7;
  if (v7)
  {
    uint64_t v11 = NSNumber;
    uint64_t v12 = objc_msgSend_iTunesMetadata(v7, v8, v9);
    uint64_t v15 = objc_msgSend_storeItemIdentifier(v12, v13, v14);
    uint64_t v17 = objc_msgSend_numberWithUnsignedLongLong_(v11, v16, v15);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)shouldDefer
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_task(self, a2, v2);
  if (v6)
  {
    id v7 = objc_msgSend_task(self, v4, v5);
    int shouldDefer = objc_msgSend_shouldDefer(v7, v8, v9);

    if (shouldDefer)
    {
      uint64_t v13 = objc_msgSend_task(self, v11, v12);
      LODWORD(v6) = objc_msgSend_deferTask(v13, v14, v15);

      id v16 = OdmlLogForCategory(2uLL);
      uint64_t v17 = v16;
      if (v6)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 138412290;
          id v33 = (id)objc_opt_class();
          id v18 = v33;
          _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%@] We are no longer in an acceptable state to continue processing. Bailing out...", (uint8_t *)&v32, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v32 = 138412290;
          id v33 = (id)objc_opt_class();
          id v19 = v33;
          _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_ERROR, "[%@] Unable to successfully defer task.", (uint8_t *)&v32, 0xCu);
        }
        uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v20, @"APOdmlFeatureCalculatorErrorDomain", 1003, 0);
        id v21 = (void *)MEMORY[0x1E4F1C9E8];
        double v24 = objc_msgSend_eventName(self, v22, v23);
        int v26 = objc_msgSend_dictionaryWithObject_forKey_(v21, v25, (uint64_t)v24, @"featureName");

        uint64_t IsCounterfactual = objc_msgSend_assetManagerIsCounterfactual(self, v27, v28);
        objc_msgSend_sendEvent_additionalDetails_isCounterfactual_(APOdmlAnalyticsFeatureCalculation, v30, (uint64_t)v17, v26, IsCounterfactual);
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return (char)v6;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (APOdmlVector)vector
{
  return self->_vector;
}

- (void)setVector:(id)a3
{
}

- (double)vectorWeightTotal
{
  return self->_vectorWeightTotal;
}

- (void)setVectorWeightTotal:(double)a3
{
  self->_vectorWeightTotal = a3;
}

- (APOdmlUnfairLock)setVectorAndWeightLock
{
  return self->_setVectorAndWeightLock;
}

- (void)setSetVectorAndWeightLock:(id)a3
{
}

- (NSMutableDictionary)adamIDtoBundleID
{
  return self->_adamIDtoBundleID;
}

- (void)setAdamIDtoBundleID:(id)a3
{
}

- (APOdmlXpcLifecycleHandler)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (double)lookbackPeriod
{
  return self->_lookbackPeriod;
}

- (void)setLookbackPeriod:(double)a3
{
  self->_lookbackPeriod = a3;
}

- (int64_t)maxQueryElements
{
  return self->_maxQueryElements;
}

- (void)setMaxQueryElements:(int64_t)a3
{
  self->_maxQueryElements = a3;
}

- (double)exponentialDecayConstant
{
  return self->_exponentialDecayConstant;
}

- (void)setExponentialDecayConstant:(double)a3
{
  self->_exponentialDecayConstant = a3;
}

- (BOOL)weightByDuration
{
  return self->_weightByDuration;
}

- (void)setWeightByDuration:(BOOL)a3
{
  self->_weightByDuration = a3;
}

- (BOOL)assetManagerIsCounterfactual
{
  return self->_assetManagerIsCounterfactual;
}

- (void)setAssetManagerIsCounterfactual:(BOOL)a3
{
  self->_assetManageruint64_t IsCounterfactual = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_adamIDtoBundleID, 0);
  objc_storeStrong((id *)&self->_setVectorAndWeightLock, 0);
  objc_storeStrong((id *)&self->_vector, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end