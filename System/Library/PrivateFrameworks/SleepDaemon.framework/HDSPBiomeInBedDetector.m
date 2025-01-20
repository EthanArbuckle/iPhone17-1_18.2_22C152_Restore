@interface HDSPBiomeInBedDetector
+ (double)hoursOfSleepForResult:(id)a3;
+ (id)inBedDetector;
- (id)_findLastTimeDeviceLockChangedDuringInterval:(id)a3 isLocked:(BOOL)a4 error:(id *)a5;
- (id)detectInBedTimesDuringInterval:(id)a3;
- (id)detectInBedTimesHelperDuringInterval:(id)a3;
- (id)findLastTimeDeviceWasLockedDuringInterval:(id)a3 error:(id *)a4;
- (id)findLastTimeDeviceWasPluggedInDuringInterval:(id)a3 error:(id *)a4;
- (id)findLastTimeDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4;
- (id)findLatestEndOfMovementDuringInterval:(id)a3 error:(id *)a4;
- (id)findMotionTerminusDuringInterval:(id)a3 latest:(BOOL)a4 error:(id *)a5;
- (id)findTimesDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4;
- (id)lockedTimesDuringInterval:(id)a3 error:(id *)a4;
@end

@implementation HDSPBiomeInBedDetector

+ (id)inBedDetector
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (double)hoursOfSleepForResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) duration];
        double v7 = v7 + v9 / 3600.0;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedTimesDuringInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223C8D6C0]();
  uint64_t v6 = [(HDSPBiomeInBedDetector *)self detectInBedTimesHelperDuringInterval:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPBiomeInBedDetector_detectInBedTimesDuringInterval___block_invoke;
  v9[3] = &unk_2645D9770;
  v9[4] = self;
  id v7 = (id)[v6 addSuccessBlock:v9];

  return v6;
}

void __57__HDSPBiomeInBedDetector_detectInBedTimesDuringInterval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    [(id)objc_opt_class() hoursOfSleepForResult:v2];
    int v7 = 138543618;
    v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] calculated time in bed hours: %f", (uint8_t *)&v7, 0x16u);
  }
}

- (id)detectInBedTimesHelperDuringInterval:(id)a3
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 startDate];
  uint64_t v6 = [v4 endDate];

  int v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v122 = (id)objc_opt_class();
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v5;
    __int16 v125 = 2112;
    id v126 = v6;
    id v8 = v122;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for in-bed intervals between %@ and %@", buf, 0x20u);
  }
  __int16 v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v122 = v10;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Establishing night start..", buf, 0xCu);
  }
  long long v12 = [v5 dateByAddingTimeInterval:14400.0];
  uint64_t v13 = [v6 dateByAddingTimeInterval:-60.0];
  id v14 = objc_alloc(MEMORY[0x263F08798]);
  v107 = v12;
  v15 = [v12 earlierDate:v13];
  uint64_t v16 = [v14 initWithStartDate:v5 endDate:v15];

  id v120 = 0;
  v105 = (void *)v16;
  v17 = [(HDSPBiomeInBedDetector *)self findLatestEndOfMovementDuringInterval:v16 error:&v120];
  v18 = v120;
  if (v18)
  {
    v19 = v18;
    v20 = HKSPLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v85 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v122 = v85;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v19;
      id v86 = v85;
      _os_log_error_impl(&dword_221A52000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last end of movement: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  v59 = HKSPLogForCategory();
  v19 = v59;
  if (v17)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v122 = v60;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v17;
      v20 = v60;
      _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Night start is %@", buf, 0x16u);
LABEL_8:
    }
  }
  else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    v64 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v122 = v64;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v5;
    v20 = v64;
    _os_log_error_impl(&dword_221A52000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find last end of movement. Falling back to provided start time (%@).", buf, 0x16u);
    goto LABEL_8;
  }

  if (v17) {
    v21 = v17;
  }
  else {
    v21 = v5;
  }
  id v22 = v21;

  v23 = HKSPLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v122 = v24;
    id v25 = v24;
    _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Establishing final bedtime..", buf, 0xCu);
  }
  id v26 = v22;
  v104 = [v26 dateByAddingTimeInterval:5400.0];
  v111 = [v104 earlierDate:v13];
  v119[1] = 0;
  v113 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v26 endDate:v111];
  v27 = -[HDSPBiomeInBedDetector findLastTimeDeviceWasLockedDuringInterval:error:](self, "findLastTimeDeviceWasLockedDuringInterval:error:");
  id v28 = 0;
  v114 = v27;
  if (v28)
  {
    v29 = v28;
    v30 = HKSPLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v87 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      id v122 = v87;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v26;
      __int16 v125 = 2112;
      id v126 = v111;
      __int16 v127 = 2112;
      id v128 = v29;
      id v88 = v26;
      id v89 = v87;
      _os_log_error_impl(&dword_221A52000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last lock date between %@ and %@: %@", buf, 0x2Au);

      id v26 = v88;
      v27 = v114;
    }
  }
  v31 = HKSPLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v122 = v32;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v27;
    id v33 = v32;
    _os_log_impl(&dword_221A52000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last lock was %@", buf, 0x16u);
  }
  v116 = v26;
  if (v27)
  {
    v116 = [v26 laterDate:v27];
  }
  v119[0] = 0;
  v115 = [(HDSPBiomeInBedDetector *)self findLastTimeDeviceWasPluggedInDuringInterval:v113 error:v119];
  id v34 = v119[0];
  if (v34)
  {
    v35 = v34;
    v36 = HKSPLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v90 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      id v122 = v90;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v26;
      __int16 v125 = 2112;
      id v126 = v111;
      __int16 v127 = 2112;
      id v128 = v35;
      id v91 = v26;
      id v92 = v90;
      _os_log_error_impl(&dword_221A52000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last date device was plugged in between %@ and %@: %@", buf, 0x2Au);

      id v26 = v91;
      v27 = v114;
    }
  }
  v37 = HKSPLogForCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v122 = v38;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v115;
    id v39 = v38;
    _os_log_impl(&dword_221A52000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last plugin was %@", buf, 0x16u);
  }
  if (v115)
  {
    uint64_t v40 = objc_msgSend(v116, "laterDate:");

    v116 = (void *)v40;
  }
  v41 = HKSPLogForCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v122 = v42;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v116;
    id v43 = v42;
    _os_log_impl(&dword_221A52000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Final bedtime is %@", buf, 0x16u);
  }
  v44 = [v6 dateByAddingTimeInterval:-3600.0];
  [v44 timeIntervalSinceReferenceDate];
  double v46 = v45;
  [v116 timeIntervalSinceReferenceDate];
  double v48 = v47;
  v49 = HKSPLogForCategory();
  BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  v106 = (void *)v13;
  v112 = v44;
  if (v46 <= v48)
  {
    if (!v50)
    {
LABEL_53:
      uint64_t v53 = 0;
      goto LABEL_54;
    }
    v57 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v122 = v57;
    v58 = v57;
    _os_log_impl(&dword_221A52000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime started less than an hour before end date, not performing further movement based changes on end date.", buf, 0xCu);
LABEL_52:

    goto LABEL_53;
  }
  if (v50)
  {
    v51 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v122 = v51;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v44;
    __int16 v125 = 2112;
    id v126 = v6;
    id v52 = v51;
    _os_log_impl(&dword_221A52000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for latest end of movement between %@ and %@", buf, 0x20u);

    v44 = v112;
  }

  v49 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v44 endDate:v6];
  id v118 = 0;
  uint64_t v53 = [(HDSPBiomeInBedDetector *)self findMotionTerminusDuringInterval:v49 latest:0 error:&v118];
  id v54 = v118;
  if (v54)
  {
    v55 = v54;
    v56 = HKSPLogForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v96 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v122 = v96;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v55;
      uint64_t v110 = v53;
      id v97 = v96;
      _os_log_error_impl(&dword_221A52000, v56, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding first start of movement: %@", buf, 0x16u);

      uint64_t v53 = v110;
    }

    v27 = v114;
    goto LABEL_54;
  }
  v61 = HKSPLogForCategory();
  v58 = v61;
  if (!v53)
  {
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v98 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v122 = v98;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v6;
      id v99 = v26;
      id v100 = v98;
      _os_log_error_impl(&dword_221A52000, v58, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find first start of movement. Falling back to provided end time (%@).", buf, 0x16u);

      id v26 = v99;
      v27 = v114;
    }
    goto LABEL_52;
  }
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v122 = v62;
    __int16 v123 = 2112;
    uint64_t v124 = v53;
    id v63 = v62;
    _os_log_impl(&dword_221A52000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] Night end is %@", buf, 0x16u);

    v27 = v114;
  }

LABEL_54:
  v108 = v5;

  if (v53) {
    v65 = (void *)v53;
  }
  else {
    v65 = v6;
  }
  id v66 = v65;

  v67 = HKSPLogForCategory();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v122 = v68;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v116;
    __int16 v125 = 2112;
    id v126 = v66;
    id v69 = v68;
    _os_log_impl(&dword_221A52000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detecting in-bed intervals between %@ and %@", buf, 0x20u);

    v27 = v114;
  }

  v70 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v116 endDate:v66];
  id v117 = 0;
  v71 = [(HDSPBiomeInBedDetector *)self lockedTimesDuringInterval:v70 error:&v117];
  id v72 = v117;
  if (v72)
  {
    v73 = HKSPLogForCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v93 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      id v122 = v93;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v116;
      __int16 v125 = 2112;
      id v126 = v66;
      __int16 v127 = 2112;
      id v128 = v72;
      uint64_t v94 = v53;
      id v95 = v93;
      _os_log_error_impl(&dword_221A52000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] Error identifying locked times between %@ and %@: %@", buf, 0x2Au);

      uint64_t v53 = v94;
    }

    v27 = v114;
  }
  v109 = (void *)v53;
  v74 = HKSPLogForCategory();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v75 = objc_opt_class();
    v76 = NSNumber;
    id v101 = v75;
    objc_msgSend(v76, "numberWithUnsignedInteger:", objc_msgSend(v71, "count"));
    v77 = v102 = v70;
    v78 = [v71 firstObject];
    [v78 startDate];
    id v103 = v66;
    v80 = id v79 = v26;
    v81 = [v71 lastObject];
    v82 = [v81 endDate];
    *(_DWORD *)buf = 138544130;
    id v122 = v75;
    __int16 v123 = 2112;
    uint64_t v124 = (uint64_t)v77;
    __int16 v125 = 2112;
    id v126 = v80;
    __int16 v127 = 2112;
    id v128 = v82;
    _os_log_impl(&dword_221A52000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %@ in-bed intervals between %@ & %@", buf, 0x2Au);

    id v26 = v79;
    id v66 = v103;

    v27 = v114;
    v70 = v102;
  }
  if (v72) {
    [MEMORY[0x263F58190] futureWithError:v72];
  }
  else {
  v83 = [MEMORY[0x263F58190] futureWithResult:v71];
  }

  return v83;
}

- (id)lockedTimesDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [v6 startDate];
  id v8 = [v6 endDate];
  id v74 = 0;
  id v66 = self;
  __int16 v9 = [(HDSPBiomeInBedDetector *)self findTimesDeviceWasUnlockedDuringInterval:v6 error:&v74];
  id v10 = v74;
  id v11 = v10;
  if (a4 && v10)
  {
    id v12 = v10;
    id v62 = 0;
    *a4 = v12;
  }
  else
  {
    id v73 = v10;
    uint64_t v13 = [(HDSPBiomeInBedDetector *)v66 findLastTimeDeviceWasUnlockedDuringInterval:v6 error:&v73];
    id v12 = v73;

    if (a4 && v12)
    {
      id v62 = 0;
      *a4 = v12;
    }
    else
    {
      if (v13)
      {
        if (![v9 count]
          || ([v9 lastObject],
              id v14 = objc_claimAutoreleasedReturnValue(),
              [v14 endDate],
              v15 = objc_claimAutoreleasedReturnValue(),
              uint64_t v16 = [v15 compare:v13],
              v15,
              v14,
              v16 == -1))
        {
          id v17 = v13;

          id v8 = v17;
        }
      }
      if ([v9 count])
      {
        id v58 = v6;
        id v59 = v12;
        v56 = v8;
        id v62 = [MEMORY[0x263EFF980] array];
        v57 = v7;
        id v18 = v7;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        v60 = v9;
        id obj = v9;
        unint64_t v19 = 0x263F08000uLL;
        uint64_t v67 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        v55 = v13;
        if (v67)
        {
          uint64_t v65 = *(void *)v70;
          v20 = v18;
          do
          {
            uint64_t v21 = 0;
            id v22 = v20;
            do
            {
              if (*(void *)v70 != v65) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v69 + 1) + 8 * v21);
              v24 = HKSPLogForCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                id v25 = objc_opt_class();
                id v26 = v25;
                v27 = [v23 startDate];
                id v28 = [v23 endDate];
                *(_DWORD *)buf = 138543874;
                v78 = v25;
                __int16 v79 = 2112;
                v80 = v27;
                __int16 v81 = 2112;
                v82 = v28;
                _os_log_impl(&dword_221A52000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] found not locked event between %@ and %@", buf, 0x20u);
              }
              id v29 = objc_alloc(*(Class *)(v19 + 1944));
              v30 = [v23 startDate];
              v31 = [v30 laterDate:v18];
              v32 = (void *)[v29 initWithStartDate:v22 endDate:v31];

              id v33 = HKSPLogForCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                id v34 = objc_opt_class();
                id v64 = v34;
                v35 = [v32 startDate];
                [v32 endDate];
                id v36 = v18;
                v38 = unint64_t v37 = v19;
                *(_DWORD *)buf = 138543874;
                v78 = v34;
                __int16 v79 = 2112;
                v80 = v35;
                __int16 v81 = 2112;
                v82 = v38;
                _os_log_impl(&dword_221A52000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] inferring locked event between %@ and %@", buf, 0x20u);

                unint64_t v19 = v37;
                id v18 = v36;
              }
              [v32 duration];
              if (v39 > 0.0) {
                [v62 addObject:v32];
              }
              v20 = [v23 endDate];

              ++v21;
              id v22 = v20;
            }
            while (v67 != v21);
            uint64_t v67 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
          }
          while (v67);
        }
        else
        {
          v20 = v18;
        }

        id v8 = v56;
        double v46 = [v20 earlierDate:v56];
        int v47 = [v46 isEqualToDate:v20];

        id v6 = v58;
        id v12 = v59;
        if (v47)
        {
          double v48 = (void *)[objc_alloc(*(Class *)(v19 + 1944)) initWithStartDate:v20 endDate:v56];
          v49 = HKSPLogForCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v50 = objc_opt_class();
            id v51 = v50;
            id v52 = [v48 startDate];
            uint64_t v53 = [v48 endDate];
            *(_DWORD *)buf = 138543874;
            v78 = v50;
            __int16 v79 = 2112;
            v80 = v52;
            __int16 v81 = 2112;
            v82 = v53;
            _os_log_impl(&dword_221A52000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding last locked event between %@ and %@", buf, 0x20u);

            id v12 = v59;
          }

          [v62 addObject:v48];
        }

        int v7 = v57;
        __int16 v9 = v60;
        uint64_t v13 = v55;
      }
      else
      {
        uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v8];
        v41 = HKSPLogForCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_opt_class();
          id v68 = v42;
          [v40 startDate];
          id v43 = v61 = v9;
          [v40 endDate];
          double v45 = v44 = v12;
          *(_DWORD *)buf = 138543874;
          v78 = v42;
          __int16 v79 = 2112;
          v80 = v43;
          __int16 v81 = 2112;
          v82 = v45;
          _os_log_impl(&dword_221A52000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] no unlocked events, device was locked between %@ and %@", buf, 0x20u);

          id v12 = v44;
          __int16 v9 = v61;
        }
        v76 = v40;
        id v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
      }
    }
  }

  return v62;
}

- (id)findLatestEndOfMovementDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v6 startDate];
    id v11 = [v6 endDate];
    int v14 = 138543874;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for latest end of movement between %@ and %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(HDSPBiomeInBedDetector *)self findMotionTerminusDuringInterval:v6 latest:1 error:a4];

  return v12;
}

- (id)findMotionTerminusDuringInterval:(id)a3 latest:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = [MEMORY[0x263F01780] isActivityAvailable];
  id v8 = HKSPLogForCategory();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Querying CoreMotion..", (uint8_t *)&buf, 0xCu);
    }
    id v9 = objc_alloc_init(MEMORY[0x263F01780]);
    id v40 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v40 setName:@"com.apple.coreduet.inbed.coremotion"];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x3032000000;
    uint64_t v67 = __Block_byref_object_copy__10;
    id v68 = __Block_byref_object_dispose__10;
    id v69 = 0;
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__10;
    v57 = __Block_byref_object_dispose__10;
    id v58 = 0;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    id v12 = [v6 startDate];
    uint64_t v13 = [v6 endDate];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __72__HDSPBiomeInBedDetector_findMotionTerminusDuringInterval_latest_error___block_invoke;
    v49[3] = &unk_2645DA180;
    v49[4] = self;
    p_long long buf = &buf;
    id v52 = &v53;
    dispatch_semaphore_t dsema = v11;
    dispatch_semaphore_t v50 = dsema;
    [v9 queryActivityStartingFromDate:v12 toDate:v13 toQueue:v40 withHandler:v49];

    dispatch_time_t v14 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(dsema, v14))
    {
      v15 = HKSPLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v35 = objc_opt_class();
        *(_DWORD *)id v59 = 138543362;
        v60 = v35;
        id v36 = v35;
        _os_log_error_impl(&dword_221A52000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Timeout during queryActivityStartingFromDate.", v59, 0xCu);
      }
      [v40 cancelAllOperations];
    }
    __int16 v16 = [v6 endDate];
    id v17 = [v6 endDate];
    if (v5)
    {
      long long v47 = 0uLL;
      long long v48 = 0uLL;
      long long v45 = 0uLL;
      long long v46 = 0uLL;
      __int16 v18 = [(id)v54[5] reverseObjectEnumerator];
      unint64_t v19 = (void *)[v18 countByEnumeratingWithState:&v45 objects:v64 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v46;
        while (2)
        {
          uint64_t v21 = 0;
          id v22 = v16;
          v23 = v17;
          do
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v21);
            if (([v24 stationary] & 1) == 0 && objc_msgSend(v24, "confidence") == 1)
            {
              id v28 = v23;
              id v17 = v28;
              __int16 v16 = v22;
              goto LABEL_34;
            }
            __int16 v16 = [v24 startDate];

            id v17 = [v24 startDate];

            uint64_t v21 = (char *)v21 + 1;
            id v22 = v16;
            v23 = v17;
          }
          while (v19 != v21);
          unint64_t v19 = (void *)[v18 countByEnumeratingWithState:&v45 objects:v64 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      long long v43 = 0uLL;
      long long v44 = 0uLL;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
      __int16 v18 = [(id)v54[5] objectEnumerator];
      unint64_t v19 = (void *)[v18 countByEnumeratingWithState:&v41 objects:v63 count:16];
      if (v19)
      {
        uint64_t v25 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v18);
            }
            v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (([v27 stationary] & 1) == 0 && objc_msgSend(v27, "confidence") == 1)
            {
              id v28 = [v27 startDate];
LABEL_34:
              unint64_t v19 = v28;
              goto LABEL_35;
            }
          }
          unint64_t v19 = (void *)[v18 countByEnumeratingWithState:&v41 objects:v63 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
LABEL_35:

    if (a5)
    {
      id v29 = *(void **)(*((void *)&buf + 1) + 40);
      if (v29) {
        *a5 = v29;
      }
    }
    v30 = HKSPLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_opt_class();
      *(_DWORD *)id v59 = 138543618;
      v60 = v31;
      __int16 v61 = 2112;
      id v62 = v19;
      id v32 = v31;
      _os_log_impl(&dword_221A52000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last motion was %@", v59, 0x16u);
    }
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = objc_opt_class();
      id v34 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Motion activity is not available for in bed detection", (uint8_t *)&buf, 0xCu);
    }
    unint64_t v19 = 0;
  }

  return v19;
}

void __72__HDSPBiomeInBedDetector_findMotionTerminusDuringInterval_latest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v17 = 138543618;
      *(void *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2112;
      *(void *)&v17[14] = v6;
      id v16 = *(id *)&v17[4];
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Querying CoreMotion failed with error: %@", v17, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  uint64_t v8 = objc_msgSend(v5, "copy", *(_OWORD *)v17, *(void *)&v17[16], v18);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_semaphore_t v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v14 = v12;
    uint64_t v15 = [v13 count];
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v12;
    *(_WORD *)&v17[12] = 2048;
    *(void *)&v17[14] = v15;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld activities", v17, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)findLastTimeDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v6 startDate];
    dispatch_semaphore_t v11 = [v6 endDate];
    int v14 = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was unlocked between %@ and %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(HDSPBiomeInBedDetector *)self _findLastTimeDeviceLockChangedDuringInterval:v6 isLocked:0 error:a4];

  return v12;
}

- (id)findLastTimeDeviceWasLockedDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v6 startDate];
    dispatch_semaphore_t v11 = [v6 endDate];
    int v14 = 138543874;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    unint64_t v19 = v11;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was locked between %@ and %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(HDSPBiomeInBedDetector *)self _findLastTimeDeviceLockChangedDuringInterval:v6 isLocked:1 error:a4];

  return v12;
}

- (id)_findLastTimeDeviceLockChangedDuringInterval:(id)a3 isLocked:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = BiomeLibrary();
  id v9 = [v8 Device];
  id v10 = [v9 ScreenLocked];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  id v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__10;
  id v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  dispatch_semaphore_t v11 = objc_msgSend(MEMORY[0x263F2A8B0], "hdsp_optionsForDateInterval:reversed:", v7, 1);
  id v12 = [v10 publisherWithUseCase:@"com.apple.sleepd.inBedDetection" options:v11];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke;
  v20[3] = &__block_descriptor_33_e22_B16__0__BMStoreEvent_8l;
  BOOL v21 = a4;
  uint64_t v13 = [v12 filterWithIsIncluded:v20];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_2;
  v19[3] = &unk_2645DA1C8;
  v19[4] = &v22;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_3;
  v18[3] = &unk_2645DA1F0;
  v18[4] = &v28;
  id v14 = (id)[v13 sinkWithCompletion:v19 shouldContinue:v18];

  uint64_t v15 = (void *)v23[5];
  if (v15)
  {
    id v16 = 0;
    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    id v16 = (id)v29[5];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

BOOL __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  BOOL v4 = *(unsigned __int8 *)(a1 + 32) == [v3 starting];

  return v4;
}

uint64_t __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];

  return MEMORY[0x270F9A758]();
}

uint64_t __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  [a2 timestamp];
  uint64_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

- (id)findLastTimeDeviceWasPluggedInDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v5 startDate];
    id v10 = [v5 endDate];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v31 = v10;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was plugged in between %@ and %@", buf, 0x20u);
  }
  dispatch_semaphore_t v11 = BiomeLibrary();
  id v12 = [v11 Device];
  uint64_t v13 = [v12 Power];
  id v14 = [v13 PluggedIn];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  id v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__10;
  uint64_t v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  uint64_t v15 = objc_msgSend(MEMORY[0x263F2A8B0], "hdsp_optionsForDateInterval:reversed:", v5, 1);
  id v16 = [v14 publisherWithUseCase:@"com.apple.sleepd.inBedDetection" options:v15];
  id v17 = [v16 filterWithIsIncluded:&__block_literal_global_11];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_2;
  v23[3] = &unk_2645DA1C8;
  v23[4] = &v24;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_3;
  v22[3] = &unk_2645DA1F0;
  v22[4] = buf;
  id v18 = (id)[v17 sinkWithCompletion:v23 shouldContinue:v22];

  unint64_t v19 = (void *)v25[5];
  if (v19)
  {
    id v20 = 0;
    if (a4) {
      *a4 = v19;
    }
  }
  else
  {
    id v20 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

uint64_t __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

uint64_t __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];

  return MEMORY[0x270F9A758]();
}

uint64_t __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  [a2 timestamp];
  uint64_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

- (id)findTimesDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v5 startDate];
    id v10 = [v5 endDate];
    *(_DWORD *)long long buf = 138543874;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v31 = v10;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for times device was unlocked in between %@ and %@", buf, 0x20u);
  }
  dispatch_semaphore_t v11 = BiomeLibrary();
  id v12 = [v11 Device];
  uint64_t v13 = [v12 ScreenLocked];

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  id v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__10;
  uint64_t v28 = __Block_byref_object_dispose__10;
  id v29 = 0;
  id v14 = objc_msgSend(MEMORY[0x263F2A8B0], "hdsp_optionsForDateInterval:", v5);
  uint64_t v15 = [v13 publisherWithUseCase:@"com.apple.sleepd.inBedDetection" options:v14];
  id v16 = objc_opt_new();
  id v17 = [v15 reduceWithInitial:v16 nextPartialResult:&__block_literal_global_297];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_2;
  v23[3] = &unk_2645DA1C8;
  v23[4] = &v24;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_3;
  v22[3] = &unk_2645DA258;
  v22[4] = buf;
  id v18 = (id)[v17 sinkWithCompletion:v23 receiveInput:v22];

  unint64_t v19 = (void *)v25[5];
  if (v19)
  {
    id v20 = 0;
    if (a4) {
      *a4 = v19;
    }
  }
  else
  {
    id v20 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

id __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 eventBody];
  int v7 = [v6 starting];

  if (v7)
  {
    id v8 = [v4 lastObject];
    if (!v8) {
      goto LABEL_6;
    }
    [v4 removeLastObject];
    id v9 = (void *)MEMORY[0x263EFF910];
    [v5 timestamp];
    id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    id v11 = objc_alloc(MEMORY[0x263F08798]);
    id v12 = [v8 startDate];
    uint64_t v13 = (void *)[v11 initWithStartDate:v12 endDate:v10];

    [v4 addObject:v13];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263EFF910];
    [v5 timestamp];
    id v8 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 duration:0.0];
    [v4 addObject:v10];
  }

LABEL_6:

  return v4;
}

uint64_t __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];

  return MEMORY[0x270F9A758]();
}

void __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

@end