@interface WiFiUsageLQMRollingWindow
+ (id)averageIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)getValue:(id)a3 ForField:(id)a4 ScaledByDuration:(BOOL)a5;
+ (id)maximumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)medianIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)minimumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)modeValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)modesValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (id)sumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5;
+ (void)initialize;
+ (void)updateConfig;
- (BOOL)checkCriteriaBSSIDWithSample:(id)a3;
- (BOOL)configureDataTriggeredCriteria;
- (BOOL)endOngoingCriteria;
- (BOOL)hasChanged:(id)a3;
- (NSDate)createdTimestamp;
- (NSMutableArray)preceedingTriggers;
- (NSMutableArray)samples;
- (NSMutableArray)triggerCriteriaFilterList;
- (NSMutableSet)features;
- (NSString)fgApp;
- (NSString)interfaceName;
- (NSString)label;
- (NSString)lastSampleBssid;
- (WiFiUsageInterfaceCapabilities)capabilities;
- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andDuration:(double)a4 andInterfaceCapabilities:(id)a5;
- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andInterfaceCapabilities:(id)a4;
- (double)duration;
- (id)evaluateCriteriaWithStopUponFirstMatch:(BOOL)a3;
- (id)getTriggerCriteriaList;
- (void)addSample:(id)a3;
- (void)addSamples:(id)a3;
- (void)addTrigger:(id)a3;
- (void)cleanUpStashedMedians;
- (void)clearOngoingCriteriaDates;
- (void)setCapabilities:(id)a3;
- (void)setCreatedTimestamp:(id)a3;
- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4;
- (void)setDuration:(double)a3;
- (void)setFeatures:(id)a3;
- (void)setFgApp:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLastSampleBssid:(id)a3;
- (void)setSamples:(id)a3;
- (void)setTriggerCriteriaFilterList:(id)a3;
- (void)updateWindow;
@end

@implementation WiFiUsageLQMRollingWindow

- (BOOL)checkCriteriaBSSIDWithSample:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = [a3 networkDetails];
  v5 = [v4 connectedBss];
  v6 = [v5 bssid];

  if ([(NSString *)self->_lastSampleBssid isEqualToString:v6])
  {
    char v7 = 0;
  }
  else
  {
    v22 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = self->_triggerCriteriaFilterList;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v7 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v14 = [v13 criterias];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                if ([v19 matched])
                {
                  v20 = [v19 currentSample];
                  [v19 setLastTriggered:v20];

                  char v7 = 1;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }
    else
    {
      char v7 = 0;
    }

    v6 = v22;
  }

  return v7 & 1;
}

- (id)evaluateCriteriaWithStopUponFirstMatch:(BOOL)a3
{
  BOOL v77 = a3;
  v3 = self;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  v4 = [(NSMutableArray *)self->_samples lastObject];
  v5 = [v4 networkDetails];
  v6 = [v5 connectedBss];
  uint64_t v7 = [v6 bssid];

  v78 = 0;
  v74 = v3;
  uint64_t v80 = v7;
  if ([(NSMutableArray *)v3->_samples count])
  {
    BOOL v8 = v77;
    if (!v7) {
      goto LABEL_15;
    }
    samples = v3->_samples;
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"networkDetails.connectedBss.bssid == %@", v7];
    uint64_t v11 = [(NSMutableArray *)samples filteredArrayUsingPredicate:v10];

    v78 = v11;
    unint64_t v12 = [v11 count];
    if (v12 < _config_minSamples) {
      goto LABEL_15;
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v13 = v3->_features;
    uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v94 objects:v101 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v95 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          v19 = [v18 median];

          if (!v19)
          {
            v20 = [v18 fieldName];
            v21 = +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:](WiFiUsageLQMRollingWindow, "medianIntegerValueForField:ScaledByDuration:OnSamples:", v20, [v18 isPerSecond], v78);
            [v18 setMedian:v21];
          }
        }
        uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v94 objects:v101 count:16];
      }
      while (v15);
    }

    v3 = v74;
  }
  BOOL v8 = v77;
LABEL_15:
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v3->_triggerCriteriaFilterList;
  uint64_t v71 = [(NSMutableArray *)obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  v22 = 0;
  if (!v71)
  {
    long long v23 = (NSString *)v7;
    goto LABEL_92;
  }
  long long v23 = (NSString *)v7;
  uint64_t v70 = *(void *)v91;
  if (v7) {
    BOOL v24 = v78 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  int v25 = !v24;
  int v81 = v25;
  do
  {
    for (uint64_t j = 0; j != v71; ++j)
    {
      if (*(void *)v91 != v70) {
        objc_enumerationMutation(obj);
      }
      long long v27 = *(void **)(*((void *)&v90 + 1) + 8 * j);
      if (v81
        && [v78 count]
        && ([v27 filterSamplesPredicate],
            long long v28 = objc_claimAutoreleasedReturnValue(),
            v28,
            v28))
      {
        long long v29 = [v27 filterSamplesPredicate];
        long long v30 = [v78 filteredArrayUsingPredicate:v29];

        if (v30 && [v30 count])
        {
          uint64_t v72 = j;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          v75 = v27;
          v31 = [v27 features];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v86 objects:v99 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v87;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v87 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v86 + 1) + 8 * k);
                v37 = [v36 median];

                if (!v37)
                {
                  v38 = [v36 fieldName];
                  v39 = +[WiFiUsageLQMRollingWindow medianIntegerValueForField:ScaledByDuration:OnSamples:](WiFiUsageLQMRollingWindow, "medianIntegerValueForField:ScaledByDuration:OnSamples:", v38, [v36 isPerSecond], v30);
                  [v36 setMedian:v39];
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v86 objects:v99 count:16];
            }
            while (v33);
          }

          long long v23 = (NSString *)v80;
          uint64_t j = v72;
          long long v27 = v75;
        }
      }
      else
      {
        long long v30 = 0;
      }
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v79 = [v27 criterias];
      uint64_t v40 = [v79 countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (!v40)
      {
        id v43 = 0;
        goto LABEL_87;
      }
      uint64_t v41 = v40;
      v76 = v27;
      uint64_t v73 = j;
      uint64_t v42 = *(void *)v83;
      id v43 = v22;
      while (2)
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          v45 = v43;
          if (*(void *)v83 != v42) {
            objc_enumerationMutation(v79);
          }
          id v43 = *(id *)(*((void *)&v82 + 1) + 8 * m);

          if (!v81)
          {
LABEL_54:
            uint64_t v46 = 0;
            uint64_t v47 = 0;
            goto LABEL_62;
          }
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          if ([v78 count] && v30)
          {
            if (![v30 count]) {
              goto LABEL_54;
            }
            uint64_t v48 = [v43 type];
            if (v48)
            {
              if (v48 == 1)
              {
                uint64_t v49 = [v76 features];
                goto LABEL_56;
              }
              v50 = 0;
            }
            else
            {
              uint64_t v49 = [(NSMutableArray *)v74->_samples lastObject];
LABEL_56:
              v50 = (void *)v49;
            }
            v51 = [v43 requiredFieldsValid];
            uint64_t v47 = [v51 evaluateWithObject:v50];

            if (v47)
            {
              v52 = [v43 predicate];
              uint64_t v46 = [v52 evaluateWithObject:v50];
            }
            else
            {
              uint64_t v46 = 0;
            }
            v53 = [v30 lastObject];
            v54 = [v53 timestamp];
            [v43 setCurrentSample:v54];

            BOOL v8 = v77;
            long long v23 = (NSString *)v80;
          }
LABEL_62:
          [v43 setMatched:v46];
          [v43 setValid:v47];
          v55 = [v43 firstTriggered];
          v56 = v55;
          if (v46)
          {

            if (!v56)
            {
              v57 = [v43 currentSample];
              [v43 setFirstTriggered:v57];
            }
            [v43 setBssid:v23];
            if (v8)
            {
              v22 = [v43 firstTriggered];
              v58 = [v43 currentSample];
              char v59 = [v22 isEqual:v58];

              if (v59)
              {
                long long v23 = (NSString *)v80;
                goto LABEL_86;
              }

              long long v23 = (NSString *)v80;
            }
          }
          else
          {
            if (v55)
            {
              v60 = [v43 lastTriggered];

              if (!v60)
              {
                if (v30 && (unint64_t)[v30 count] >= 2)
                {
                  v61 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v30, "count") - 2);
                  v62 = [v61 timestamp];
                  [v43 setLastTriggered:v62];
                }
                else
                {
                  v63 = [v43 currentSample];

                  if (v63) {
                    [v43 currentSample];
                  }
                  else {
                  v61 = [v43 firstTriggered];
                  }
                  [v43 setLastTriggered:v61];
                }
              }
            }
            long long v23 = (NSString *)v80;
            [v43 setBssid:v80];
            if (v8)
            {
              v64 = [v43 lastTriggered];

              if (v64)
              {
                v22 = v43;
                uint64_t j = v73;
                goto LABEL_88;
              }
            }
          }
        }
        uint64_t v41 = [v79 countByEnumeratingWithState:&v82 objects:v98 count:16];
        if (v41) {
          continue;
        }
        break;
      }
      v22 = v43;
      id v43 = 0;
LABEL_86:
      uint64_t j = v73;
LABEL_87:

      v22 = v43;
LABEL_88:
    }
    uint64_t v71 = [(NSMutableArray *)obj countByEnumeratingWithState:&v90 objects:v100 count:16];
  }
  while (v71);
LABEL_92:

  v65 = v23;
  lastSampleBssid = v74->_lastSampleBssid;
  v74->_lastSampleBssid = v65;
  v67 = v65;

  return v22;
}

+ (id)medianIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(a1, "getValue:ForField:ScaledByDuration:", *(void *)(*((void *)&v27 + 1) + 8 * i), v8, v6, (void)v27);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v13);
  }

  unint64_t v17 = [v10 count];
  if (v17 >= _config_minSamples)
  {
    unint64_t v19 = v17;
    [v10 sortUsingSelector:sel_compare_];
    if (v19)
    {
      uint64_t v25 = [v10 objectAtIndex:v19 >> 1];
    }
    else
    {
      v20 = [v10 objectAtIndex:(v19 - 1) >> 1];
      uint64_t v21 = [v20 integerValue];

      v22 = [v10 objectAtIndex:v19 >> 1];
      uint64_t v23 = [v22 integerValue];

      uint64_t v24 = v23 + v21;
      if (v23 + v21 < 0 != __OFADD__(v23, v21)) {
        ++v24;
      }
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", v24 >> 1, (void)v27);
    }
    v18 = (void *)v25;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)getValue:(id)a3 ForField:(id)a4 ScaledByDuration:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector()) {
    [v7 numberForKeyPath:v8];
  }
  else {
  id v9 = [v7 valueForKeyPath:v8];
  }

  if (v9 && ([v7 duration] || !v5))
  {
    if (v5 && [v7 duration])
    {
      id v11 = NSNumber;
      [v9 doubleValue];
      uint64_t v13 = objc_msgSend(v11, "numberWithLong:", (uint64_t)(v12 / (double)(unint64_t)objc_msgSend(v7, "duration")));

      id v9 = (void *)v13;
    }
    id v10 = v9;
    id v9 = v10;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)setCurrentApplicationName:(id)a3 withAttributes:(id)a4
{
  BOOL v6 = (NSString *)a3;
  objc_storeStrong((id *)&_current_fgApp, a3);
  fgApp = self->_fgApp;
  self->_fgApp = v6;
}

- (void)cleanUpStashedMedians
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_features setValue:0 forKey:@"median"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->_triggerCriteriaFilterList;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "features", (void)v9);
        [v8 setValue:0 forKey:@"median"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSMutableArray)triggerCriteriaFilterList
{
  return self->_triggerCriteriaFilterList;
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if (!self->_samples)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      samples = self->_samples;
      self->_samples = v5;

      id v4 = v11;
    }
    [v4 setFgApp:_current_fgApp];
    uint64_t v7 = [(NSMutableArray *)self->_samples lastObject];
    id v8 = [v7 interfaceName];

    long long v9 = [v11 interfaceName];
    int v10 = [v9 isEqualToString:v8];

    if (v10) {
      [v11 setInterfaceName:v8];
    }
    [(NSMutableArray *)self->_samples addObject:v11];
    if (self->_duration != *(double *)&_config_duration) {
      *(void *)&self->_duration = _config_duration;
    }
    [(WiFiUsageLQMRollingWindow *)self updateWindow];

    id v4 = v11;
  }
}

- (void)updateWindow
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v3 dateByAddingTimeInterval:-self->_duration];

  samples = self->_samples;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"timestamp >= %@", v8];
  [(NSMutableArray *)samples filterUsingPredicate:v5];

  preceedingTriggers = self->_preceedingTriggers;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"timestamp >= %@", v8];
  [(NSMutableArray *)preceedingTriggers filterUsingPredicate:v7];
}

- (NSMutableArray)samples
{
  return self->_samples;
}

+ (void)initialize
{
  _config_duration = 0x404E000000000000;
  _config_minSamples = 5;
  v2 = (void *)_config_criteriaList;
  _config_criteriaList = 0;

  id v3 = +[WiFiUsageLQMConfiguration getConfigForKey:@"LQMRollingWindow"];
}

+ (void)updateConfig
{
  id v10 = +[WiFiUsageLQMConfiguration getConfigForKey:@"LQMRollingWindow"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [v10 objectForKey:@"duration"];
      if (v2
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (double v3 = *(double *)&_config_duration, v3 != (double)(unint64_t)[v2 unsignedLongValue]))
      {
        [v2 floatValue];
        double v5 = v4;
      }
      else
      {
        if (arc4random_uniform(0x64u) >= 0x32) {
          int v6 = 30;
        }
        else {
          int v6 = 60;
        }
        double v5 = (double)v6;
      }
      _config_duration = *(void *)&v5;
      uint64_t v7 = [v10 objectForKey:@"minSamplesForFeatures"];

      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = _config_minSamples;
          if (v8 != [v7 unsignedLongValue]) {
            _config_minSamples = [v7 unsignedLongValue];
          }
        }
      }
      long long v9 = [v10 objectForKey:@"DataTriggeredCriteriaList"];

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([(id)_config_criteriaList isEqualToArray:v9] & 1) == 0)
        {
          objc_storeStrong((id *)&_config_criteriaList, v9);
        }
      }
    }
  }
  NSLog(&cfstr_SDurationSetTo.isa, "+[WiFiUsageLQMRollingWindow updateConfig]", _config_duration);
  NSLog(&cfstr_SMinsamplesSet.isa, "+[WiFiUsageLQMRollingWindow updateConfig]", _config_minSamples);
}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andInterfaceCapabilities:(id)a4
{
  return [(WiFiUsageLQMRollingWindow *)self initWithInterfaceName:a3 andDuration:a4 andInterfaceCapabilities:*(double *)&_config_duration];
}

- (WiFiUsageLQMRollingWindow)initWithInterfaceName:(id)a3 andDuration:(double)a4 andInterfaceCapabilities:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)WiFiUsageLQMRollingWindow;
    id v10 = [(WiFiUsageLQMRollingWindow *)&v24 init];
    uint64_t v11 = [v8 copy];
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    createdTimestamp = v10->_createdTimestamp;
    v10->_createdTimestamp = (NSDate *)v13;

    v10->_duration = a4;
    samples = v10->_samples;
    v10->_samples = 0;

    objc_storeStrong((id *)&v10->_capabilities, a5);
    uint64_t v16 = objc_opt_new();
    triggerCriteriaFilterList = v10->_triggerCriteriaFilterList;
    v10->_triggerCriteriaFilterList = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    features = v10->_features;
    v10->_features = (NSMutableSet *)v18;

    preceedingTriggers = v10->_preceedingTriggers;
    v10->_preceedingTriggers = 0;

    fgApp = v10->_fgApp;
    v10->_fgApp = 0;

    self = v10;
    v22 = self;
  }
  else
  {
    NSLog(&cfstr_SInvalidInterf.isa, "-[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:]", 0);
    v22 = 0;
  }

  return v22;
}

- (void)addSamples:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    samples = self->_samples;
    id v10 = v6;
    if (!samples)
    {
      id v8 = [MEMORY[0x1E4F1CA48] array];
      id v9 = self->_samples;
      self->_samples = v8;

      samples = self->_samples;
    }
    [(NSMutableArray *)samples addObjectsFromArray:v10];
    id v4 = (id)[(WiFiUsageLQMRollingWindow *)self updateWindow];
    id v6 = v10;
  }

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)addTrigger:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    preceedingTriggers = self->_preceedingTriggers;
    id v10 = v6;
    if (!preceedingTriggers)
    {
      id v8 = (NSMutableArray *)objc_opt_new();
      id v9 = self->_preceedingTriggers;
      self->_preceedingTriggers = v8;

      preceedingTriggers = self->_preceedingTriggers;
    }
    id v4 = (id)[(NSMutableArray *)preceedingTriggers addObject:v10];
    id v6 = v10;
  }

  MEMORY[0x1F41817F8](v4, v6, v5);
}

- (void)clearOngoingCriteriaDates
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = self->_triggerCriteriaFilterList;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v7 = [v6 criterias];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              char v13 = [v12 matched];
              if ((v13 & 1) == 0)
              {
                uint64_t v14 = [v12 firstTriggered];
                v2 = v14;
                if (v14)
                {

LABEL_17:
                  [v12 setCurrentSample:0];
                  [v12 setFirstTriggered:0];
                  [v12 setLastTriggered:0];
                  [v12 setBssid:0];
                  continue;
                }
              }
              uint64_t v15 = [v12 lastTriggered];

              if ((v13 & 1) == 0) {
              if (v15)
              }
                goto LABEL_17;
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }
}

- (BOOL)endOngoingCriteria
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_triggerCriteriaFilterList;
  uint64_t v2 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    char v4 = 0;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v7 = [v6 criterias];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              [v12 setMatched:0];
              [v12 setValid:0];
              uint64_t v13 = [v12 firstTriggered];
              if (v13)
              {
                uint64_t v14 = (void *)v13;
                uint64_t v15 = [v12 lastTriggered];

                if (!v15)
                {
                  uint64_t v16 = [v12 currentSample];

                  if (v16) {
                    [v12 currentSample];
                  }
                  else {
                  uint64_t v17 = [v12 firstTriggered];
                  }
                  [v12 setLastTriggered:v17];

                  char v4 = 1;
                }
              }
              [v12 setBssid:0];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }
      }
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v3);
  }
  else
  {
    char v4 = 0;
  }

  lastSampleBssid = self->_lastSampleBssid;
  self->_lastSampleBssid = 0;

  return v4 & 1;
}

- (id)getTriggerCriteriaList
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v4 = self->_triggerCriteriaFilterList;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v11 = objc_msgSend(v9, "criterias", (void)v14);
        long long v12 = (void *)[v10 initWithArray:v11 copyItems:1];

        [v3 addObjectsFromArray:v12];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)configureDataTriggeredCriteria
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!_config_criteriaList) {
    return 0;
  }
  [(NSMutableArray *)self->_triggerCriteriaFilterList removeAllObjects];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = (id)_config_criteriaList;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          id v10 = [WiFiUsageLQMTriggerCriteriaFilter alloc];
          uint64_t v11 = +[WiFiUsageLQMUserSample allLQMProperties];
          long long v12 = [(WiFiUsageLQMTriggerCriteriaFilter *)v10 initWith:v9 forFields:v11 andFeatures:self->_features];

          BOOL v13 = v12 == 0;
          if (v12) {
            [(NSMutableArray *)self->_triggerCriteriaFilterList addObject:v12];
          }
        }
        else
        {
          NSLog(&cfstr_SDatatriggered.isa, "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]");
          BOOL v13 = 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);

    if (v13) {
      long long v14 = @"(with errors)";
    }
    else {
      long long v14 = &stru_1F2B5AC50;
    }
  }
  else
  {

    LOBYTE(v13) = 0;
    long long v14 = &stru_1F2B5AC50;
  }
  long long v16 = NSString;
  long long v17 = [(WiFiUsageLQMRollingWindow *)self getTriggerCriteriaList];
  long long v18 = [v16 stringWithFormat:@"%s: DataTriggered criteria configured %@: %@", "-[WiFiUsageLQMRollingWindow configureDataTriggeredCriteria]", v14, v17];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v18, "UTF8String"));
    id v19 = objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v26 = v20;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return !v13;
}

+ (id)maximumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v20;
  uint64_t v13 = 0x8000000000000000;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      long long v16 = v15;
      if (v15 && [v15 integerValue] > v13) {
        uint64_t v13 = [v16 integerValue];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v11);
  if (v13 != 0x8000000000000000)
  {
    long long v17 = [NSNumber numberWithInteger:v13];
  }
  else
  {
LABEL_12:
    long long v17 = 0;
  }

  return v17;
}

+ (id)minimumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v20;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      long long v16 = v15;
      if (v15 && [v15 integerValue] < v13) {
        uint64_t v13 = [v16 integerValue];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v11);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v17 = [NSNumber numberWithInteger:v13];
  }
  else
  {
LABEL_12:
    long long v17 = 0;
  }

  return v17;
}

+ (id)averageIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = v10;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v9);
      }
      long long v16 = [a1 getValue:*(void *)(*((void *)&v20 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
      long long v17 = v16;
      if (v16)
      {
        ++v12;
        v13 += [v16 integerValue];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
  if (v12)
  {
    long long v18 = [NSNumber numberWithDouble:(double)v13 / (double)v12];
  }
  else
  {
LABEL_12:
    long long v18 = 0;
  }

  return v18;
}

+ (id)sumIntegerValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = [a1 getValue:*(void *)(*((void *)&v19 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
        long long v16 = v15;
        if (v15) {
          v12 += [v15 integerValue];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v17 = [NSNumber numberWithInteger:v12];

  return v17;
}

+ (id)modeValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  uint64_t v5 = [a1 modesValueForField:a3 ScaledByDuration:a4 OnSamples:a5];
  if ([v5 count])
  {
    BOOL v6 = [v5 lastObject];
    uint64_t v7 = [v6 value];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)modesValueForField:(id)a3 ScaledByDuration:(BOOL)a4 OnSamples:(id)a5
{
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = [a1 getValue:*(void *)(*((void *)&v39 + 1) + 8 * i) ForField:v8 ScaledByDuration:v6];
        if (v15)
        {
          long long v16 = [v10 objectForKey:v15];
          long long v17 = v16;
          if (v16) {
            uint64_t v18 = [v16 unsignedIntegerValue] + 1;
          }
          else {
            uint64_t v18 = 1;
          }
          long long v19 = [NSNumber numberWithUnsignedInteger:v18];
          [v10 setObject:v19 forKey:v15];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v12);
  }
  uint64_t v33 = v8;

  long long v20 = [v10 keysSortedByValueUsingSelector:sel_compare_];
  long long v21 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v28 = [WiFiUsageLQMModes alloc];
        long long v29 = objc_msgSend(v10, "objectForKeyedSubscript:", v27, v33);
        long long v30 = [(WiFiUsageLQMModes *)v28 initWithValue:v27 andOccurrences:v29];
        [v21 addObject:v30];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v24);
  }

  v31 = [MEMORY[0x1E4F1C978] arrayWithArray:v21];

  return v31;
}

- (BOOL)hasChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_samples;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "numberForKeyPath:", v4, (void)v13);
        uint64_t v7 = v11;
        if (v10 && ([v11 isEqual:v10] & 1) == 0)
        {

          LOBYTE(v6) = 1;
          goto LABEL_12;
        }

        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t v10 = v7;
LABEL_12:
  }
  return v6;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSDate)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setSamples:(id)a3
{
}

- (void)setCapabilities:(id)a3
{
}

- (void)setTriggerCriteriaFilterList:(id)a3
{
}

- (NSMutableSet)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (NSMutableArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
}

- (NSString)lastSampleBssid
{
  return self->_lastSampleBssid;
}

- (void)setLastSampleBssid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSampleBssid, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);
  objc_storeStrong((id *)&self->_preceedingTriggers, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_triggerCriteriaFilterList, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_createdTimestamp, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end