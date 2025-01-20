@interface STUsageReport
+ (BOOL)supportsSecureCoding;
- (NSArray)appAndWebUsages;
- (NSArray)appUsages;
- (NSArray)categoryUsages;
- (NSArray)dateIntervals;
- (NSArray)notifications;
- (NSArray)pickups;
- (NSArray)webUsages;
- (NSCache)dataSetByUsageIdentifier;
- (NSDate)firstPickup;
- (NSDate)lastUpdatedDate;
- (NSDateInterval)maxPickupsDateInterval;
- (NSDateInterval)reportDateInterval;
- (NSDictionary)appUsageByStartOfDateInterval;
- (NSDictionary)applicationUsageByStartOfDateIntervalByTrustIdentifier;
- (NSDictionary)applicationUsageByTrustIdentifier;
- (NSDictionary)categoryUsageByStartOfDateInterval;
- (NSDictionary)categoryUsageByStartOfDateIntervalByTrustIdentifier;
- (NSDictionary)categoryUsageByTrustIdentifier;
- (NSDictionary)notificationsByStartOfDateInterval;
- (NSDictionary)notificationsByStartOfDateIntervalByTrustIdentifier;
- (NSDictionary)notificationsByTrustIdentifier;
- (NSDictionary)pickupsByStartOfDateInterval;
- (NSDictionary)pickupsByStartOfDateIntervalByTrustIdentifier;
- (NSDictionary)pickupsByTrustIdentifier;
- (NSDictionary)screenTimeByStartOfDateInterval;
- (NSDictionary)webUsageByStartOfDateInterval;
- (NSDictionary)webUsageByStartOfDateIntervalByTrustIdentifier;
- (NSDictionary)webUsageByTrustIdentifier;
- (NSString)displayName;
- (STUsageReport)init;
- (STUsageReport)initWithCoder:(id)a3;
- (STUsageReport)initWithReportType:(unint64_t)a3 startDate:(id)a4 lastUpdatedDate:(id)a5 firstPickup:(id)a6 usageItems:(id)a7;
- (STUsageReportGraphDataSet)categoryUsageDataSet;
- (STUsageReportGraphDataSet)notificationsDataSet;
- (STUsageReportGraphDataSet)pickupsDataSet;
- (STUsageReportGraphDataSet)screenTimeDataSet;
- (double)activePickupDateIntervals;
- (double)maxScreenTime;
- (double)notificationDeltaFromHistoricalAverage;
- (double)notificationRate;
- (double)pickupDeltaFromHistoricalAverage;
- (double)pickupRate;
- (double)screenTimeDeltaFromHistoricalAverage;
- (double)totalAppUsage;
- (double)totalCategoryUsage;
- (double)totalScreenTime;
- (double)totalWebUsage;
- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5;
- (id)_dataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5 useDarkColors:(BOOL)a6;
- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4;
- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4;
- (id)appAndWebUsageDataSetWithDarkColors:(BOOL)a3;
- (id)dataSetWithUsageItem:(id)a3;
- (id)description;
- (id)topUsageItemsWithMaxCount:(unint64_t)a3 type:(unint64_t)a4 includeAggregateItem:(BOOL)a5 nonAggregateItems:(id *)a6 darkColors:(BOOL)a7;
- (unint64_t)maxPickupDateIntervalIndex;
- (unint64_t)maxPickups;
- (unint64_t)totalNotifications;
- (unint64_t)totalPickups;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDataSetByUsageIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation STUsageReport

- (STUsageReport)initWithReportType:(unint64_t)a3 startDate:(id)a4 lastUpdatedDate:(id)a5 firstPickup:(id)a6 usageItems:(id)a7
{
  uint64_t v421 = *MEMORY[0x263EF8340];
  id v315 = a4;
  id v310 = a5;
  id v322 = a5;
  id v309 = a6;
  id v312 = a6;
  id v323 = a7;
  v402.receiver = self;
  v402.super_class = (Class)STUsageReport;
  v353 = [(STUsageReport *)&v402 init];
  if (!v353) {
    goto LABEL_184;
  }
  uint64_t v11 = objc_opt_new();
  dataSetByUsageIdentifier = v353->_dataSetByUsageIdentifier;
  v353->_dataSetByUsageIdentifier = (NSCache *)v11;

  v362 = [MEMORY[0x263EFF8F0] currentCalendar];
  if (a3)
  {
    if (a3 != 1)
    {
      uint64_t v16 = 0;
      uint64_t v15 = 0;
      v344 = 0;
      v13 = 0;
      goto LABEL_8;
    }
    v13 = [v362 startOfDayForDate:v315];
    v344 = [v362 dateByAddingUnit:16 value:1 toDate:v13 options:0];
    v14 = [v362 components:32 fromDate:v13 toDate:v344 options:0];
    uint64_t v15 = [v14 hour];
    uint64_t v16 = 32;
  }
  else
  {
    v13 = [v362 startOfDayForDate:v315];
    v344 = [v362 dateByAddingUnit:0x2000 value:1 toDate:v13 options:0];
    v14 = [v362 components:16 fromDate:v13 toDate:v344 options:0];
    uint64_t v15 = [v14 day];
    uint64_t v16 = 16;
  }

LABEL_8:
  v346 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v15];
  id v17 = v13;
  v345 = v17;
  if (v15)
  {
    v18 = v17;
    do
    {
      id v17 = [v362 dateByAddingUnit:v16 value:1 toDate:v18 options:0];
      v19 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v18 endDate:v17];
      [v346 addObject:v19];

      v18 = v17;
      --v15;
    }
    while (v15);
  }
  v308 = v17;
  id v311 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v345 endDate:v344];
  v335 = objc_opt_new();
  v330 = objc_opt_new();
  v331 = objc_opt_new();
  v334 = objc_opt_new();
  v350 = objc_opt_new();
  v325 = objc_opt_new();
  v326 = objc_opt_new();
  v324 = objc_opt_new();
  if (a3)
  {
    v321 = objc_opt_new();
    v320 = objc_opt_new();
    v319 = objc_opt_new();
    v313 = objc_opt_new();
    v314 = objc_opt_new();
    v316 = 0;
    v317 = 0;
    v318 = v326;
    v326 = 0;
  }
  else
  {
    v313 = 0;
    v314 = 0;
    v318 = 0;
    v319 = 0;
    v320 = 0;
    v321 = 0;
    v316 = v324;
    v317 = v325;
    v324 = 0;
    v325 = 0;
  }
  long long v400 = 0u;
  long long v401 = 0u;
  long long v398 = 0u;
  long long v399 = 0u;
  id obj = v323;
  uint64_t v343 = [obj countByEnumeratingWithState:&v398 objects:v420 count:16];
  if (!v343)
  {
    v328 = 0;
    v329 = 0;
    goto LABEL_84;
  }
  v328 = 0;
  v329 = 0;
  uint64_t v341 = v16 | 0x221E;
  uint64_t v342 = *(void *)v399;
  while (2)
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v399 != v342)
      {
        uint64_t v21 = v20;
        objc_enumerationMutation(obj);
        uint64_t v20 = v21;
      }
      uint64_t v351 = v20;
      v22 = *(void **)(*((void *)&v398 + 1) + 8 * v20);
      v23 = [v22 startDate];
      v360 = [v362 components:v341 fromDate:v23];

      v365 = [v362 dateFromComponents:v360];
      if ([v344 compare:v365] != 1)
      {

        goto LABEL_84;
      }
      uint64_t v24 = [v22 itemType];
      if ((unint64_t)(v24 - 1) > 5) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = (uint64_t)*(&off_264768DA0 + v24 - 1);
      }
      v356 = [v22 totalUsage];
      v363 = [NSNumber numberWithUnsignedInteger:v24];
      if ([v365 compare:v345] == -1)
      {
        switch(v24)
        {
          case 6:
            id v358 = v326;
            id v354 = v318;
            id v333 = v320;
            id v28 = v313;
            id v72 = v22;
            id v347 = v360;
            id v29 = v72;
            v73 = [v72 totalUsage];
            [v73 doubleValue];
            double v75 = v74;

            v339 = [MEMORY[0x263EFF8F0] currentCalendar];
            v76 = [v29 startDate];
            v336 = [v339 startOfDayForDate:v76];

            v337 = [v339 components:8766 fromDate:v336];
            v77 = [v358 objectForKeyedSubscript:v337];
            v78 = NSNumber;
            [v77 doubleValue];
            v37 = [v78 numberWithDouble:v75 + v79];

            [v358 setObject:v37 forKeyedSubscript:v337];
            v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v347, "weekday"));
            v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v347, "hour"));
            v43 = [v354 objectForKeyedSubscript:v38];
            if (!v43)
            {
              v43 = objc_opt_new();
              [v354 setObject:v43 forKeyedSubscript:v38];
            }
            v80 = [v43 objectForKeyedSubscript:v39];
            v81 = NSNumber;
            [v80 doubleValue];
            v44 = [v81 numberWithDouble:v75 + v82];

            [v43 setObject:v44 forKeyedSubscript:v39];
            if ([v28 containsObject:v347]) {
              goto LABEL_72;
            }
            [v28 addObject:v347];
            v46 = [v333 objectForKeyedSubscript:v38];
            if (!v46)
            {
              v46 = objc_opt_new();
              [v333 setObject:v46 forKeyedSubscript:v38];
            }
            break;
          case 5:
            id v358 = v316;
            id v354 = v324;
            id v333 = v319;
            id v28 = v314;
            id v83 = v22;
            id v347 = v360;
            id v29 = v83;
            v84 = [v83 totalUsage];
            [v84 doubleValue];
            double v86 = v85;

            v339 = [MEMORY[0x263EFF8F0] currentCalendar];
            v87 = [v29 startDate];
            v336 = [v339 startOfDayForDate:v87];

            v337 = [v339 components:8766 fromDate:v336];
            v88 = [v358 objectForKeyedSubscript:v337];
            v89 = NSNumber;
            [v88 doubleValue];
            v37 = [v89 numberWithDouble:v86 + v90];

            [v358 setObject:v37 forKeyedSubscript:v337];
            v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v347, "weekday"));
            v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v347, "hour"));
            v43 = [v354 objectForKeyedSubscript:v38];
            if (!v43)
            {
              v43 = objc_opt_new();
              [v354 setObject:v43 forKeyedSubscript:v38];
            }
            v91 = [v43 objectForKeyedSubscript:v39];
            v92 = NSNumber;
            [v91 doubleValue];
            v44 = [v92 numberWithDouble:v86 + v93];

            [v43 setObject:v44 forKeyedSubscript:v39];
            if ([v28 containsObject:v347]) {
              goto LABEL_72;
            }
            [v28 addObject:v347];
            v46 = [v333 objectForKeyedSubscript:v38];
            if (!v46)
            {
              v46 = objc_opt_new();
              [v333 setObject:v46 forKeyedSubscript:v38];
            }
            break;
          case 1:
            id v358 = v317;
            id v354 = v325;
            id v333 = v321;
            id v28 = v22;
            id v29 = v360;
            v30 = [v28 totalUsage];
            [v30 doubleValue];
            double v32 = v31;

            id v347 = [MEMORY[0x263EFF8F0] currentCalendar];
            v33 = [v28 startDate];
            v339 = [v347 startOfDayForDate:v33];

            v336 = [v347 components:8766 fromDate:v339];
            v34 = [v358 objectForKeyedSubscript:v336];
            v35 = NSNumber;
            [v34 doubleValue];
            v337 = [v35 numberWithDouble:v32 + v36];

            [v358 setObject:v337 forKeyedSubscript:v336];
            v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "weekday"));
            v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "hour"));
            v39 = [v354 objectForKeyedSubscript:v37];
            if (!v39)
            {
              v39 = objc_opt_new();
              [v354 setObject:v39 forKeyedSubscript:v37];
            }
            v40 = [v39 objectForKeyedSubscript:v38];
            v41 = NSNumber;
            [v40 doubleValue];
            v43 = [v41 numberWithDouble:v32 + v42];

            [v39 setObject:v43 forKeyedSubscript:v38];
            if ([0 containsObject:v29]) {
              goto LABEL_73;
            }
            [0 addObject:v29];
            v44 = [v333 objectForKeyedSubscript:v37];
            if (!v44)
            {
              v44 = objc_opt_new();
              [v333 setObject:v44 forKeyedSubscript:v37];
            }
            v45 = [v44 objectForKeyedSubscript:v38];
            v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "unsignedIntegerValue") + 1);

            [v44 setObject:v46 forKeyedSubscript:v38];
            goto LABEL_71;
          default:
            goto LABEL_79;
        }
        v94 = [v46 objectForKeyedSubscript:v39];
        v95 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v94, "unsignedIntegerValue") + 1);

        [v46 setObject:v95 forKeyedSubscript:v39];
LABEL_71:

LABEL_72:
LABEL_73:

        goto LABEL_78;
      }
      v26 = [v350 objectForKeyedSubscript:v363];
      (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v26, v356);
      id v358 = (id)objc_claimAutoreleasedReturnValue();

      [v350 setObject:v358 forKeyedSubscript:v363];
      if (v24 != 1)
      {
        v47 = [v335 objectForKeyedSubscript:v363];
        if (!v47)
        {
          uint64_t v48 = objc_opt_new();
          [v335 setObject:v48 forKeyedSubscript:v363];
          v47 = (void *)v48;
        }
        id v354 = v47;
        v49 = [v47 objectForKeyedSubscript:v365];
        if (!v49)
        {
          v50 = (void *)[v22 copy];
          v51 = [v22 identifier];
          v52 = [v51 componentsSeparatedByString:@"-"];
          v53 = [v52 firstObject];
          [v50 setIdentifier:v53];

          [v50 setTotalUsage:&unk_26D967498];
          [v50 setMaxUsage:&unk_26D967498];
          [v50 setMinUsage:&unk_26D967498];
          [v354 setObject:v50 forKeyedSubscript:v365];
          v49 = v50;
        }
        v340 = v49;
        v54 = [v49 totalUsage];
        v55 = [v22 totalUsage];
        v56 = (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v54, v55);
        [v340 setTotalUsage:v56];

        v348 = [v22 budgetItemIdentifier];
        if (v348)
        {
          v57 = [v331 objectForKeyedSubscript:v363];
          if (!v57)
          {
            v57 = objc_opt_new();
            [v331 setObject:v57 forKeyedSubscript:v363];
          }
          v338 = objc_msgSend(objc_alloc(MEMORY[0x263F67278]), "initWithIdentifier:usageTrusted:", v348, objc_msgSend(v22, "usageTrusted"));
          v58 = [v57 objectForKeyedSubscript:v338];
          if (!v58)
          {
            v58 = (void *)[v22 copy];
            [v58 setTotalUsage:&unk_26D967498];
            [v58 setMaxUsage:&unk_26D967498];
            [v58 setMinUsage:&unk_26D967498];
            [v57 setObject:v58 forKeyedSubscript:v338];
          }
          v59 = [v58 totalUsage];
          v60 = [v22 totalUsage];
          v61 = (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v59, v60);
          [v58 setTotalUsage:v61];

          v62 = [v330 objectForKeyedSubscript:v363];
          if (!v62)
          {
            v62 = objc_opt_new();
            [v330 setObject:v62 forKeyedSubscript:v363];
          }
          v63 = [v62 objectForKeyedSubscript:v338];
          if (!v63)
          {
            v63 = objc_opt_new();
            [v62 setObject:v63 forKeyedSubscript:v338];
          }
          v64 = [v63 objectForKeyedSubscript:v365];
          if (!v64)
          {
            v64 = (void *)[v22 copy];
            [v64 setTotalUsage:&unk_26D967498];
            [v64 setMaxUsage:&unk_26D967498];
            [v64 setMinUsage:&unk_26D967498];
            [v63 setObject:v64 forKeyedSubscript:v365];
          }
          v65 = [v64 totalUsage];
          v66 = [v22 totalUsage];
          v67 = (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v65, v66);
          [v64 setTotalUsage:v67];
        }
        if (v24 == 6)
        {
          if (v329)
          {
            uint64_t v68 = objc_msgSend(v365, "compare:");
            v71 = v328;
            v69 = v329;
            v70 = v365;
LABEL_57:
            if (v68 == -1) {
              goto LABEL_76;
            }
LABEL_77:

            goto LABEL_78;
          }
          v69 = 0;
          v71 = v328;
          v70 = v365;
        }
        else
        {
          if (v24 != 5) {
            goto LABEL_77;
          }
          if (v328)
          {
            uint64_t v68 = objc_msgSend(v365, "compare:");
            v69 = v328;
            v70 = v329;
            v71 = v365;
            goto LABEL_57;
          }
          v69 = 0;
          v71 = v365;
          v70 = v329;
        }
LABEL_76:
        id v96 = v365;

        v328 = v71;
        v329 = v70;
        goto LABEL_77;
      }
      v27 = [v334 objectForKeyedSubscript:v365];
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v356, "unsignedIntegerValue") + objc_msgSend(v27, "unsignedIntegerValue"));
      id v354 = (id)objc_claimAutoreleasedReturnValue();

      [v334 setObject:v354 forKeyedSubscript:v365];
LABEL_78:

LABEL_79:
      uint64_t v20 = v351 + 1;
    }
    while (v343 != v351 + 1);
    uint64_t v343 = [obj countByEnumeratingWithState:&v398 objects:v420 count:16];
    if (v343) {
      continue;
    }
    break;
  }
LABEL_84:

  v366 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"totalUsage" ascending:0];
  v364 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier" ascending:1];
  v419[0] = v366;
  v419[1] = v364;
  v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v419 count:2];
  v353->_type = a3;
  objc_storeStrong((id *)&v353->_reportDateInterval, v311);
  objc_storeStrong((id *)&v353->_lastUpdatedDate, v310);
  uint64_t v98 = [v346 copy];
  dateIntervals = v353->_dateIntervals;
  v353->_dateIntervals = (NSArray *)v98;

  v100 = [v350 objectForKeyedSubscript:&unk_26D9674B0];
  [v100 doubleValue];
  v353->_double totalScreenTime = v101;

  uint64_t v102 = [v334 copy];
  screenTimeByStartOfDateInterval = v353->_screenTimeByStartOfDateInterval;
  v353->_screenTimeByStartOfDateInterval = (NSDictionary *)v102;

  v104 = [(NSDictionary *)v353->_screenTimeByStartOfDateInterval allValues];
  v105 = [v104 valueForKeyPath:@"@max.self"];
  [v105 doubleValue];
  v353->_maxScreenTime = v106;

  v107 = [v350 objectForKeyedSubscript:&unk_26D9674C8];
  v353->_unint64_t totalPickups = [v107 unsignedIntegerValue];

  v108 = [v331 objectForKeyedSubscript:&unk_26D9674C8];
  uint64_t v109 = [v108 copy];
  pickupsByTrustIdentifier = v353->_pickupsByTrustIdentifier;
  v353->_pickupsByTrustIdentifier = (NSDictionary *)v109;

  v111 = [v335 objectForKeyedSubscript:&unk_26D9674C8];
  uint64_t v112 = [v111 copy];
  pickupsByStartOfDateInterval = v353->_pickupsByStartOfDateInterval;
  v353->_pickupsByStartOfDateInterval = (NSDictionary *)v112;

  v114 = [v330 objectForKeyedSubscript:&unk_26D9674C8];
  uint64_t v115 = [v114 copy];
  pickupsByStartOfDateIntervalByTrustIdentifier = v353->_pickupsByStartOfDateIntervalByTrustIdentifier;
  v353->_pickupsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v115;

  v117 = [(NSDictionary *)v353->_pickupsByTrustIdentifier allValues];
  uint64_t v118 = [v117 sortedArrayUsingDescriptors:v97];
  v119 = (void *)v118;
  v120 = (void *)MEMORY[0x263EFFA68];
  if (v118) {
    v121 = (void *)v118;
  }
  else {
    v121 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)&v353->_pickups, v121);

  uint64_t v394 = 0;
  v395 = &v394;
  uint64_t v396 = 0x2020000000;
  uint64_t v397 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v390 = 0;
  v391 = &v390;
  uint64_t v392 = 0x2020000000;
  uint64_t v393 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v386 = 0;
  v387 = &v386;
  uint64_t v388 = 0x2020000000;
  uint64_t v389 = 0;
  uint64_t v382 = 0;
  v383 = &v382;
  uint64_t v384 = 0x2020000000;
  uint64_t v385 = 0;
  v122 = v353->_pickupsByStartOfDateInterval;
  v123 = v353->_dateIntervals;
  v374[0] = MEMORY[0x263EF8330];
  v374[1] = 3221225472;
  v374[2] = __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_28;
  v374[3] = &unk_264768C90;
  id v352 = v329;
  id v375 = v352;
  v378 = &v394;
  id v124 = v322;
  id v376 = v124;
  v379 = &v390;
  v355 = v122;
  v377 = v355;
  v380 = &v386;
  v381 = &v382;
  [(NSArray *)v123 enumerateObjectsUsingBlock:v374];
  v125 = v353;
  unint64_t v126 = [(NSArray *)v353->_dateIntervals count];
  v127 = v391;
  if (v391[3] == 0x7FFFFFFFFFFFFFFFLL) {
    v391[3] = v126 - 1;
  }
  unint64_t v128 = v395[3];
  if (v128 >= v126) {
    unint64_t v128 = v126;
  }
  v395[3] = v128;
  if (v353->_type == 1)
  {
    if (v312)
    {
      objc_msgSend(v124, "timeIntervalSinceDate:");
      double activePickupDateIntervals = v129 / 3600.0;
    }
    else
    {
      uint64_t v136 = v127[3];
      unint64_t v137 = [(NSArray *)v353->_dateIntervals count];
      if (v136 + 1 < v137) {
        unint64_t v138 = v136 + 1;
      }
      else {
        unint64_t v138 = v137;
      }
      double activePickupDateIntervals = (double)(v138 - v395[3]);
    }
    v353->_double activePickupDateIntervals = activePickupDateIntervals;
  }
  else
  {
    unint64_t v131 = v127[3] + 1;
    v353->_double activePickupDateIntervals = (double)v131;
    v132 = objc_opt_new();
    v133 = v132;
    uint64_t v134 = 0x7FFFFFFFFFFFFFFFLL;
    if (v131 < 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v134 = v131;
    }
    [v132 setDay:-v134];
    v135 = [v362 dateByAddingComponents:v133 toDate:v124 options:0];
    [v124 timeIntervalSinceDate:v135];

    v125 = v353;
    double activePickupDateIntervals = v353->_activePickupDateIntervals;
  }
  double v139 = 0.0;
  if (activePickupDateIntervals > 0.0) {
    double v139 = (double)v125->_totalPickups / activePickupDateIntervals;
  }
  v125->_pickupRate = v139;
  v125->_maxPickupDateIntervalIndex = v383[3];
  objc_storeStrong((id *)&v125->_firstPickup, v309);
  v353->_maxPickups = v387[3];
  pickups = v353->_pickups;
  v141 = [NSString stringWithFormat:@"@max.%@", @"totalUsage"];
  v361 = [(NSArray *)pickups valueForKeyPath:v141];

  [(NSArray *)v353->_pickups setValue:v361 forKeyPath:@"maxUsage"];
  v142 = [v350 objectForKeyedSubscript:&unk_26D9674E0];
  v353->_unint64_t totalNotifications = [v142 unsignedIntegerValue];

  v143 = [v331 objectForKeyedSubscript:&unk_26D9674E0];
  uint64_t v144 = [v143 copy];
  v145 = (void *)v144;
  v146 = (void *)MEMORY[0x263EFFA78];
  if (v144) {
    v147 = (void *)v144;
  }
  else {
    v147 = (void *)MEMORY[0x263EFFA78];
  }
  objc_storeStrong((id *)&v353->_notificationsByTrustIdentifier, v147);

  v148 = [v335 objectForKeyedSubscript:&unk_26D9674E0];
  uint64_t v149 = [v148 copy];
  v150 = (void *)v149;
  if (v149) {
    v151 = (void *)v149;
  }
  else {
    v151 = v146;
  }
  objc_storeStrong((id *)&v353->_notificationsByStartOfDateInterval, v151);

  v152 = [v330 objectForKeyedSubscript:&unk_26D9674E0];
  uint64_t v153 = [v152 copy];
  v154 = (void *)v153;
  if (v153) {
    v155 = (void *)v153;
  }
  else {
    v155 = v146;
  }
  objc_storeStrong((id *)&v353->_notificationsByStartOfDateIntervalByTrustIdentifier, v155);

  v156 = [(NSDictionary *)v353->_notificationsByTrustIdentifier allValues];
  uint64_t v157 = [v156 sortedArrayUsingDescriptors:v97];
  v158 = (void *)v157;
  if (v157) {
    v159 = (void *)v157;
  }
  else {
    v159 = v120;
  }
  objc_storeStrong((id *)&v353->_notifications, v159);

  uint64_t v370 = 0;
  v371 = &v370;
  uint64_t v372 = 0x2020000000;
  uint64_t v373 = 0x7FFFFFFFFFFFFFFFLL;
  v160 = v353->_dateIntervals;
  v367[0] = MEMORY[0x263EF8330];
  v367[1] = 3221225472;
  v367[2] = __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_40;
  v367[3] = &unk_264768CB8;
  id v349 = v328;
  id v368 = v349;
  v369 = &v370;
  [(NSArray *)v160 enumerateObjectsUsingBlock:v367];
  unint64_t v161 = v371[3];
  unint64_t v162 = [(NSArray *)v353->_dateIntervals count];
  if (v161 >= v162) {
    unint64_t v163 = v162;
  }
  else {
    unint64_t v163 = v161;
  }
  v371[3] = v163;
  unint64_t v164 = [v346 count];
  if (v353->_type == 1)
  {
    uint64_t v165 = v391[3];
    unint64_t v166 = [(NSArray *)v353->_dateIntervals count];
    if (v165 + 1 < v166) {
      unint64_t v167 = v165 + 1;
    }
    else {
      unint64_t v167 = v166;
    }
    unint64_t v164 = v167 - v371[3];
  }
  if (v164) {
    double v168 = (double)v353->_totalNotifications / (double)v164;
  }
  else {
    double v168 = 0.0;
  }
  v353->_notificationRate = v168;
  notifications = v353->_notifications;
  v170 = [NSString stringWithFormat:@"@max.%@", @"totalUsage"];
  v359 = [(NSArray *)notifications valueForKeyPath:v170];

  [(NSArray *)v353->_notifications setValue:v359 forKeyPath:@"maxUsage"];
  v171 = [v350 objectForKeyedSubscript:&unk_26D9674F8];
  [v171 doubleValue];
  v353->_totalAppUsage = v172;

  v173 = [v331 objectForKeyedSubscript:&unk_26D9674F8];
  uint64_t v174 = [v173 copy];
  v175 = (void *)v174;
  if (v174) {
    v176 = (void *)v174;
  }
  else {
    v176 = v146;
  }
  objc_storeStrong((id *)&v353->_applicationUsageByTrustIdentifier, v176);

  v177 = [v335 objectForKeyedSubscript:&unk_26D9674F8];
  uint64_t v178 = [v177 copy];
  v179 = (void *)v178;
  if (v178) {
    v180 = (void *)v178;
  }
  else {
    v180 = v146;
  }
  objc_storeStrong((id *)&v353->_appUsageByStartOfDateInterval, v180);

  v181 = [v330 objectForKeyedSubscript:&unk_26D9674F8];
  uint64_t v182 = [v181 copy];
  v183 = (void *)v182;
  if (v182) {
    v184 = (void *)v182;
  }
  else {
    v184 = v146;
  }
  objc_storeStrong((id *)&v353->_applicationUsageByStartOfDateIntervalByTrustIdentifier, v184);

  v185 = [(NSDictionary *)v353->_applicationUsageByTrustIdentifier allValues];
  uint64_t v186 = [v185 sortedArrayUsingDescriptors:v97];
  appUsages = v353->_appUsages;
  v353->_appUsages = (NSArray *)v186;

  v188 = [v350 objectForKeyedSubscript:&unk_26D967510];
  [v188 doubleValue];
  v353->_totalWebUsage = v189;

  v190 = [v331 objectForKeyedSubscript:&unk_26D967510];
  uint64_t v191 = [v190 copy];
  v192 = (void *)v191;
  if (v191) {
    v193 = (void *)v191;
  }
  else {
    v193 = v146;
  }
  objc_storeStrong((id *)&v353->_webUsageByTrustIdentifier, v193);

  v194 = [v335 objectForKeyedSubscript:&unk_26D967510];
  uint64_t v195 = [v194 copy];
  v196 = (void *)v195;
  if (v195) {
    v197 = (void *)v195;
  }
  else {
    v197 = v146;
  }
  objc_storeStrong((id *)&v353->_webUsageByStartOfDateInterval, v197);

  v198 = [v330 objectForKeyedSubscript:&unk_26D967510];
  uint64_t v199 = [v198 copy];
  v200 = (void *)v199;
  if (v199) {
    v201 = (void *)v199;
  }
  else {
    v201 = v146;
  }
  objc_storeStrong((id *)&v353->_webUsageByStartOfDateIntervalByTrustIdentifier, v201);

  v202 = [(NSDictionary *)v353->_webUsageByTrustIdentifier allValues];
  uint64_t v203 = [v202 sortedArrayUsingDescriptors:v97];
  webUsages = v353->_webUsages;
  v353->_webUsages = (NSArray *)v203;

  v205 = objc_opt_new();
  v206 = [(NSDictionary *)v353->_applicationUsageByTrustIdentifier allValues];
  [v205 addObjectsFromArray:v206];

  v207 = [(NSDictionary *)v353->_webUsageByTrustIdentifier allValues];
  [v205 addObjectsFromArray:v207];

  uint64_t v208 = [v205 sortedArrayUsingDescriptors:v97];
  v209 = (void *)v208;
  if (v208) {
    v210 = (void *)v208;
  }
  else {
    v210 = v120;
  }
  objc_storeStrong((id *)&v353->_appAndWebUsages, v210);

  appAndWebUsages = v353->_appAndWebUsages;
  v212 = [NSString stringWithFormat:@"@max.%@", @"totalUsage"];
  v357 = [(NSArray *)appAndWebUsages valueForKeyPath:v212];

  [(NSArray *)v353->_appAndWebUsages setValue:v357 forKeyPath:@"maxUsage"];
  v213 = [v350 objectForKeyedSubscript:&unk_26D967528];
  [v213 doubleValue];
  v353->_totalCategoryUsage = v214;

  v215 = [v331 objectForKeyedSubscript:&unk_26D967528];
  uint64_t v216 = [v215 copy];
  v217 = (void *)v216;
  if (v216) {
    v218 = (void *)v216;
  }
  else {
    v218 = v146;
  }
  objc_storeStrong((id *)&v353->_categoryUsageByTrustIdentifier, v218);

  v219 = [v335 objectForKeyedSubscript:&unk_26D967528];
  uint64_t v220 = [v219 copy];
  v221 = (void *)v220;
  if (v220) {
    v222 = (void *)v220;
  }
  else {
    v222 = v146;
  }
  objc_storeStrong((id *)&v353->_categoryUsageByStartOfDateInterval, v222);

  v223 = [v330 objectForKeyedSubscript:&unk_26D967528];
  uint64_t v224 = [v223 copy];
  v225 = (void *)v224;
  if (v224) {
    v226 = (void *)v224;
  }
  else {
    v226 = v146;
  }
  objc_storeStrong((id *)&v353->_categoryUsageByStartOfDateIntervalByTrustIdentifier, v226);

  v227 = [(NSDictionary *)v353->_categoryUsageByTrustIdentifier allValues];
  uint64_t v228 = [v227 sortedArrayUsingDescriptors:v97];
  v229 = (void *)v228;
  if (v228) {
    v230 = (void *)v228;
  }
  else {
    v230 = v120;
  }
  objc_storeStrong((id *)&v353->_categoryUsages, v230);

  categoryUsages = v353->_categoryUsages;
  v232 = [NSString stringWithFormat:@"@max.%@", @"totalUsage"];
  v233 = [(NSArray *)categoryUsages valueForKeyPath:v232];

  [(NSArray *)v353->_categoryUsages setValue:v233 forKeyPath:@"maxUsage"];
  if (a3)
  {
    if (a3 == 1)
    {
      id v234 = [v362 components:544 fromDate:v345];
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v234, "weekday"));
      id v235 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v236 = [v362 rangeOfUnit:32 inUnit:16 forDate:v345];
      id v237 = objc_alloc(MEMORY[0x263F088D0]);
      v238 = objc_msgSend(v237, "initWithIndexesInRange:", v236, v391[3] + 1);
      double totalScreenTime = v353->_totalScreenTime;
      v240 = [v325 objectForKeyedSubscript:v235];
      v241 = [v321 objectForKeyedSubscript:v235];
      id v242 = v240;
      id v243 = v241;
      id v244 = v238;
      uint64_t v415 = 0;
      v416 = (double *)&v415;
      uint64_t v417 = 0x2020000000;
      uint64_t v418 = 0;
      uint64_t v403 = 0;
      v404 = &v403;
      uint64_t v405 = 0x2020000000;
      uint64_t v406 = 0;
      uint64_t v407 = MEMORY[0x263EF8330];
      uint64_t v408 = 3221225472;
      v409 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v410 = &unk_264768D58;
      v413 = &v415;
      id v245 = v242;
      id v411 = v245;
      v414 = &v403;
      id v246 = v243;
      id v412 = v246;
      [v244 enumerateIndexesUsingBlock:&v407];
      unint64_t v247 = v404[3];
      if (v247) {
        double v248 = totalScreenTime - v416[3] / (double)v247;
      }
      else {
        double v248 = 0.0;
      }

      _Block_object_dispose(&v403, 8);
      _Block_object_dispose(&v415, 8);

      v353->_screenTimeDeltaFromHistoricalAverage = v248;
      unint64_t totalPickups = v353->_totalPickups;
      v288 = [v318 objectForKeyedSubscript:v235];
      v289 = [v320 objectForKeyedSubscript:v235];
      id v290 = v288;
      id v291 = v289;
      id v292 = v244;
      uint64_t v415 = 0;
      v416 = (double *)&v415;
      uint64_t v417 = 0x2020000000;
      uint64_t v418 = 0;
      uint64_t v403 = 0;
      v404 = &v403;
      uint64_t v405 = 0x2020000000;
      uint64_t v406 = 0;
      uint64_t v407 = MEMORY[0x263EF8330];
      uint64_t v408 = 3221225472;
      v409 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v410 = &unk_264768D58;
      v413 = &v415;
      id v293 = v290;
      id v411 = v293;
      v414 = &v403;
      id v294 = v291;
      id v412 = v294;
      [v292 enumerateIndexesUsingBlock:&v407];
      unint64_t v295 = v404[3];
      if (v295) {
        double v296 = (double)totalPickups - v416[3] / (double)v295;
      }
      else {
        double v296 = 0.0;
      }

      _Block_object_dispose(&v403, 8);
      _Block_object_dispose(&v415, 8);

      v353->_pickupDeltaFromHistoricalAverage = v296;
      unint64_t totalNotifications = v353->_totalNotifications;
      v298 = [v324 objectForKeyedSubscript:v235];
      v299 = [v319 objectForKeyedSubscript:v235];
      id v300 = v298;
      id v301 = v299;
      id v302 = v292;
      uint64_t v415 = 0;
      v416 = (double *)&v415;
      uint64_t v417 = 0x2020000000;
      uint64_t v418 = 0;
      uint64_t v403 = 0;
      v404 = &v403;
      uint64_t v405 = 0x2020000000;
      uint64_t v406 = 0;
      uint64_t v407 = MEMORY[0x263EF8330];
      uint64_t v408 = 3221225472;
      v409 = __dailyUsageDeltaFromHistoricalAverageForWeekday_block_invoke;
      v410 = &unk_264768D58;
      v413 = &v415;
      id v303 = v300;
      id v411 = v303;
      v414 = &v403;
      id v304 = v301;
      id v412 = v304;
      [v302 enumerateIndexesUsingBlock:&v407];
      unint64_t v305 = v404[3];
      if (v305) {
        double v306 = (double)totalNotifications - v416[3] / (double)v305;
      }
      else {
        double v306 = 0.0;
      }

      _Block_object_dispose(&v403, 8);
      _Block_object_dispose(&v415, 8);

      v353->_notificationDeltaFromHistoricalAverage = v306;
      goto LABEL_182;
    }
  }
  else
  {
    v249 = [v311 startDate];
    v250 = [v362 startOfDayForDate:v249];

    id v251 = objc_alloc(MEMORY[0x263F088D0]);
    v252 = objc_msgSend(v251, "initWithIndexesInRange:", 0, v391[3] + 1);
    double v253 = v353->_totalScreenTime;
    id v254 = v317;
    id v255 = v250;
    id v256 = v252;
    v257 = [MEMORY[0x263EFF8F0] currentCalendar];
    v258 = [v257 dateByAddingUnit:0x2000 value:-1 toDate:v255 options:0];
    uint64_t v415 = 0;
    v416 = (double *)&v415;
    uint64_t v417 = 0x2020000000;
    uint64_t v418 = 0;
    uint64_t v407 = MEMORY[0x263EF8330];
    uint64_t v408 = 3221225472;
    v409 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v410 = &unk_264768D80;
    id v259 = v257;
    id v411 = v259;
    id v260 = v258;
    id v412 = v260;
    v414 = &v415;
    v261 = (uint64_t *)v254;
    v413 = v261;
    [v256 enumerateIndexesUsingBlock:&v407];
    unint64_t v262 = [v256 count];
    double v263 = 0.0;
    if (v262)
    {
      double v264 = v416[3] / (double)v262;
      if (v264 > 0.0) {
        double v263 = (v253 / (double)v262 - v264) / v264;
      }
    }

    _Block_object_dispose(&v415, 8);
    v353->_screenTimeDeltaFromHistoricalAverage = v263;
    unint64_t v265 = v353->_totalPickups;
    id v266 = v326;
    id v267 = v255;
    id v268 = v256;
    v269 = [MEMORY[0x263EFF8F0] currentCalendar];
    v270 = [v269 dateByAddingUnit:0x2000 value:-1 toDate:v267 options:0];
    uint64_t v415 = 0;
    v416 = (double *)&v415;
    uint64_t v417 = 0x2020000000;
    uint64_t v418 = 0;
    uint64_t v407 = MEMORY[0x263EF8330];
    uint64_t v408 = 3221225472;
    v409 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v410 = &unk_264768D80;
    id v271 = v269;
    id v411 = v271;
    id v272 = v270;
    id v412 = v272;
    v414 = &v415;
    v273 = (uint64_t *)v266;
    v413 = v273;
    [v268 enumerateIndexesUsingBlock:&v407];
    unint64_t v274 = [v268 count];
    double v275 = 0.0;
    if (v274)
    {
      double v276 = v416[3] / (double)v274;
      if (v276 > 0.0) {
        double v275 = ((double)v265 / (double)v274 - v276) / v276;
      }
    }

    _Block_object_dispose(&v415, 8);
    v353->_pickupDeltaFromHistoricalAverage = v275;
    unint64_t v277 = v353->_totalNotifications;
    id v278 = v316;
    id v234 = v267;
    id v235 = v268;
    v279 = [MEMORY[0x263EFF8F0] currentCalendar];
    v280 = [v279 dateByAddingUnit:0x2000 value:-1 toDate:v234 options:0];
    uint64_t v415 = 0;
    v416 = (double *)&v415;
    uint64_t v417 = 0x2020000000;
    uint64_t v418 = 0;
    uint64_t v407 = MEMORY[0x263EF8330];
    uint64_t v408 = 3221225472;
    v409 = __weeklyUsageDeltaFromHistoricalAverage_block_invoke;
    v410 = &unk_264768D80;
    id v281 = v279;
    id v411 = v281;
    id v282 = v280;
    id v412 = v282;
    v414 = &v415;
    v283 = (uint64_t *)v278;
    v413 = v283;
    [v235 enumerateIndexesUsingBlock:&v407];
    unint64_t v284 = [v235 count];
    double v285 = 0.0;
    if (v284)
    {
      double v286 = v416[3] / (double)v284;
      if (v286 > 0.0) {
        double v285 = ((double)v277 / (double)v284 - v286) / v286;
      }
    }

    _Block_object_dispose(&v415, 8);
    v353->_notificationDeltaFromHistoricalAverage = v285;
LABEL_182:
  }
  _Block_object_dispose(&v370, 8);

  _Block_object_dispose(&v382, 8);
  _Block_object_dispose(&v386, 8);
  _Block_object_dispose(&v390, 8);
  _Block_object_dispose(&v394, 8);

LABEL_184:
  return v353;
}

uint64_t __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;

  return [v4 numberWithDouble:v7 + v9];
}

uint64_t __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  uint64_t v7 = [v5 unsignedIntegerValue];

  return [v4 numberWithUnsignedInteger:v7 + v6];
}

void __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_28(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)a1[4];
  id v22 = v5;
  if (v6)
  {
    uint64_t v7 = [v5 startDate];
    if ([v6 compare:v7] == -1)
    {

      id v5 = v22;
    }
    else
    {
      double v8 = (void *)a1[4];
      double v9 = [v22 endDate];
      uint64_t v10 = [v8 compare:v9];

      id v5 = v22;
      if (v10 == -1) {
        *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
      }
    }
  }
  uint64_t v11 = (void *)a1[5];
  v12 = [v5 startDate];
  if ([v11 compare:v12] == -1)
  {
  }
  else
  {
    v13 = (void *)a1[5];
    v14 = [v22 endDate];
    uint64_t v15 = [v13 compare:v14];

    if (v15 == -1) {
      *(void *)(*(void *)(a1[8] + 8) + 24) = a3;
    }
  }
  uint64_t v16 = (void *)a1[6];
  id v17 = [v22 startDate];
  v18 = [v16 objectForKeyedSubscript:v17];
  v19 = [v18 totalUsage];
  unint64_t v20 = [v19 unsignedIntegerValue];

  uint64_t v21 = *(void *)(a1[9] + 8);
  if (v20 > *(void *)(v21 + 24))
  {
    *(void *)(v21 + 24) = v20;
    *(void *)(*(void *)(a1[10] + 8) + 24) = a3;
  }
}

void __85__STUsageReport_initWithReportType_startDate_lastUpdatedDate_firstPickup_usageItems___block_invoke_40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v11 = v5;
    uint64_t v7 = [v5 startDate];
    if ([v6 compare:v7] == -1)
    {

      id v5 = v11;
    }
    else
    {
      double v8 = *(void **)(a1 + 32);
      double v9 = [v11 endDate];
      uint64_t v10 = [v8 compare:v9];

      id v5 = v11;
      if (v10 == -1) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      }
    }
  }
}

- (STUsageReport)init
{
  v3.receiver = self;
  v3.super_class = (Class)STUsageReport;
  return [(STUsageReport *)&v3 init];
}

- (STUsageReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v167.receiver = self;
  v167.super_class = (Class)STUsageReport;
  id v5 = [(STUsageReport *)&v167 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    double v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    v5->_type = [v8 unsignedIntegerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_reportDateInterval"];
    reportDateInterval = v5->_reportDateInterval;
    v5->_reportDateInterval = (NSDateInterval *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_dateIntervals"];
    dateIntervals = v5->_dateIntervals;
    v5->_dateIntervals = (NSArray *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalScreenTime"];
    [v18 doubleValue];
    v5->_double totalScreenTime = v19;

    unint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxScreenTime"];
    [v20 doubleValue];
    v5->_maxScreenTime = v21;

    id v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"_screenTimeByStartOfDateInterval"];
    screenTimeByStartOfDateInterval = v5->_screenTimeByStartOfDateInterval;
    v5->_screenTimeByStartOfDateInterval = (NSDictionary *)v26;

    id v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_screenTimeDeltaFromHistoricalAverage"];
    [v28 doubleValue];
    v5->_screenTimeDeltaFromHistoricalAverage = v29;

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalPickups"];
    v5->_unint64_t totalPickups = [v30 unsignedIntegerValue];

    double v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"_pickupsByTrustIdentifier"];
    pickupsByTrustIdentifier = v5->_pickupsByTrustIdentifier;
    v5->_pickupsByTrustIdentifier = (NSDictionary *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"_pickupsByStartOfDateInterval"];
    pickupsByStartOfDateInterval = v5->_pickupsByStartOfDateInterval;
    v5->_pickupsByStartOfDateInterval = (NSDictionary *)v41;

    v43 = (void *)MEMORY[0x263EFFA08];
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v43, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"_pickupsByStartOfDateIntervalByTrustIdentifier"];
    pickupsByStartOfDateIntervalByTrustIdentifier = v5->_pickupsByStartOfDateIntervalByTrustIdentifier;
    v5->_pickupsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v48;

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pickupRate"];
    [v50 doubleValue];
    v5->_pickupRate = v51;

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_activePickupDateIntervals"];
    [v52 doubleValue];
    v5->_double activePickupDateIntervals = v53;

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxPickups"];
    v5->_maxPickups = [v54 unsignedIntegerValue];

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_maxPickupDateIntervalIndex"];
    v5->_maxPickupDateIntervalIndex = [v55 unsignedIntegerValue];

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pickupDeltaFromHistoricalAverage"];
    [v56 doubleValue];
    v5->_pickupDeltaFromHistoricalAverage = v57;

    v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalNotifications"];
    v5->_unint64_t totalNotifications = [v58 unsignedIntegerValue];

    v59 = (void *)MEMORY[0x263EFFA08];
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v59, "setWithObjects:", v60, v61, objc_opt_class(), 0);
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"_notificationsByTrustIdentifier"];
    notificationsByTrustIdentifier = v5->_notificationsByTrustIdentifier;
    v5->_notificationsByTrustIdentifier = (NSDictionary *)v63;

    v65 = (void *)MEMORY[0x263EFFA08];
    uint64_t v66 = objc_opt_class();
    uint64_t v67 = objc_opt_class();
    uint64_t v68 = objc_msgSend(v65, "setWithObjects:", v66, v67, objc_opt_class(), 0);
    uint64_t v69 = [v4 decodeObjectOfClasses:v68 forKey:@"_notificationsByStartOfDateInterval"];
    notificationsByStartOfDateInterval = v5->_notificationsByStartOfDateInterval;
    v5->_notificationsByStartOfDateInterval = (NSDictionary *)v69;

    v71 = (void *)MEMORY[0x263EFFA08];
    uint64_t v72 = objc_opt_class();
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    double v75 = objc_msgSend(v71, "setWithObjects:", v72, v73, v74, objc_opt_class(), 0);
    uint64_t v76 = [v4 decodeObjectOfClasses:v75 forKey:@"_notificationsByStartOfDateIntervalByTrustIdentifier"];
    notificationsByStartOfDateIntervalByTrustIdentifier = v5->_notificationsByStartOfDateIntervalByTrustIdentifier;
    v5->_notificationsByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v76;

    v78 = (void *)MEMORY[0x263EFFA08];
    uint64_t v79 = objc_opt_class();
    v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    uint64_t v81 = [v4 decodeObjectOfClasses:v80 forKey:@"_notifications"];
    notifications = v5->_notifications;
    v5->_notifications = (NSArray *)v81;

    id v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notificationRate"];
    [v83 doubleValue];
    v5->_notificationRate = v84;

    double v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_notificationDeltaFromHistoricalAverage"];
    [v85 doubleValue];
    v5->_notificationDeltaFromHistoricalAverage = v86;

    v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalAppUsage"];
    [v87 doubleValue];
    v5->_totalAppUsage = v88;

    v89 = (void *)MEMORY[0x263EFFA08];
    uint64_t v90 = objc_opt_class();
    uint64_t v91 = objc_opt_class();
    v92 = objc_msgSend(v89, "setWithObjects:", v90, v91, objc_opt_class(), 0);
    uint64_t v93 = [v4 decodeObjectOfClasses:v92 forKey:@"_applicationUsageByTrustIdentifier"];
    applicationUsageByTrustIdentifier = v5->_applicationUsageByTrustIdentifier;
    v5->_applicationUsageByTrustIdentifier = (NSDictionary *)v93;

    v95 = (void *)MEMORY[0x263EFFA08];
    uint64_t v96 = objc_opt_class();
    uint64_t v97 = objc_opt_class();
    uint64_t v98 = objc_msgSend(v95, "setWithObjects:", v96, v97, objc_opt_class(), 0);
    uint64_t v99 = [v4 decodeObjectOfClasses:v98 forKey:@"_appUsageByStartOfDateInterval"];
    appUsageByStartOfDateInterval = v5->_appUsageByStartOfDateInterval;
    v5->_appUsageByStartOfDateInterval = (NSDictionary *)v99;

    double v101 = (void *)MEMORY[0x263EFFA08];
    uint64_t v102 = objc_opt_class();
    uint64_t v103 = objc_opt_class();
    uint64_t v104 = objc_opt_class();
    v105 = objc_msgSend(v101, "setWithObjects:", v102, v103, v104, objc_opt_class(), 0);
    uint64_t v106 = [v4 decodeObjectOfClasses:v105 forKey:@"_applicationUsageByStartOfDateIntervalByTrustIdentifier"];
    applicationUsageByStartOfDateIntervalByTrustIdentifier = v5->_applicationUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_applicationUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v106;

    v108 = (void *)MEMORY[0x263EFFA08];
    uint64_t v109 = objc_opt_class();
    v110 = objc_msgSend(v108, "setWithObjects:", v109, objc_opt_class(), 0);
    uint64_t v111 = [v4 decodeObjectOfClasses:v110 forKey:@"_appUsages"];
    appUsages = v5->_appUsages;
    v5->_appUsages = (NSArray *)v111;

    v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalWebUsage"];
    [v113 doubleValue];
    v5->_totalWebUsage = v114;

    uint64_t v115 = (void *)MEMORY[0x263EFFA08];
    uint64_t v116 = objc_opt_class();
    uint64_t v117 = objc_opt_class();
    uint64_t v118 = objc_msgSend(v115, "setWithObjects:", v116, v117, objc_opt_class(), 0);
    uint64_t v119 = [v4 decodeObjectOfClasses:v118 forKey:@"_webUsageByTrustIdentifier"];
    webUsageByTrustIdentifier = v5->_webUsageByTrustIdentifier;
    v5->_webUsageByTrustIdentifier = (NSDictionary *)v119;

    v121 = (void *)MEMORY[0x263EFFA08];
    uint64_t v122 = objc_opt_class();
    uint64_t v123 = objc_opt_class();
    id v124 = objc_msgSend(v121, "setWithObjects:", v122, v123, objc_opt_class(), 0);
    uint64_t v125 = [v4 decodeObjectOfClasses:v124 forKey:@"_webUsageByStartOfDateInterval"];
    webUsageByStartOfDateInterval = v5->_webUsageByStartOfDateInterval;
    v5->_webUsageByStartOfDateInterval = (NSDictionary *)v125;

    v127 = (void *)MEMORY[0x263EFFA08];
    uint64_t v128 = objc_opt_class();
    uint64_t v129 = objc_opt_class();
    uint64_t v130 = objc_opt_class();
    unint64_t v131 = objc_msgSend(v127, "setWithObjects:", v128, v129, v130, objc_opt_class(), 0);
    uint64_t v132 = [v4 decodeObjectOfClasses:v131 forKey:@"_webUsageByStartOfDateIntervalByTrustIdentifier"];
    webUsageByStartOfDateIntervalByTrustIdentifier = v5->_webUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_webUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v132;

    uint64_t v134 = (void *)MEMORY[0x263EFFA08];
    uint64_t v135 = objc_opt_class();
    uint64_t v136 = objc_msgSend(v134, "setWithObjects:", v135, objc_opt_class(), 0);
    uint64_t v137 = [v4 decodeObjectOfClasses:v136 forKey:@"_appAndWebUsages"];
    appAndWebUsages = v5->_appAndWebUsages;
    v5->_appAndWebUsages = (NSArray *)v137;

    double v139 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_totalCategoryUsage"];
    [v139 doubleValue];
    v5->_totalCategoryUsage = v140;

    v141 = (void *)MEMORY[0x263EFFA08];
    uint64_t v142 = objc_opt_class();
    uint64_t v143 = objc_opt_class();
    uint64_t v144 = objc_msgSend(v141, "setWithObjects:", v142, v143, objc_opt_class(), 0);
    uint64_t v145 = [v4 decodeObjectOfClasses:v144 forKey:@"_categoryUsageByTrustIdentifier"];
    categoryUsageByTrustIdentifier = v5->_categoryUsageByTrustIdentifier;
    v5->_categoryUsageByTrustIdentifier = (NSDictionary *)v145;

    v147 = (void *)MEMORY[0x263EFFA08];
    uint64_t v148 = objc_opt_class();
    uint64_t v149 = objc_opt_class();
    uint64_t v150 = objc_opt_class();
    v151 = objc_msgSend(v147, "setWithObjects:", v148, v149, v150, objc_opt_class(), 0);
    uint64_t v152 = [v4 decodeObjectOfClasses:v151 forKey:@"_categoryUsageByStartOfDateInterval"];
    categoryUsageByStartOfDateInterval = v5->_categoryUsageByStartOfDateInterval;
    v5->_categoryUsageByStartOfDateInterval = (NSDictionary *)v152;

    v154 = (void *)MEMORY[0x263EFFA08];
    uint64_t v155 = objc_opt_class();
    uint64_t v156 = objc_opt_class();
    uint64_t v157 = objc_opt_class();
    v158 = objc_msgSend(v154, "setWithObjects:", v155, v156, v157, objc_opt_class(), 0);
    uint64_t v159 = [v4 decodeObjectOfClasses:v158 forKey:@"_categoryUsageByStartOfDateIntervalByTrustIdentifier"];
    categoryUsageByStartOfDateIntervalByTrustIdentifier = v5->_categoryUsageByStartOfDateIntervalByTrustIdentifier;
    v5->_categoryUsageByStartOfDateIntervalByTrustIdentifier = (NSDictionary *)v159;

    unint64_t v161 = (void *)MEMORY[0x263EFFA08];
    uint64_t v162 = objc_opt_class();
    unint64_t v163 = objc_msgSend(v161, "setWithObjects:", v162, objc_opt_class(), 0);
    uint64_t v164 = [v4 decodeObjectOfClasses:v163 forKey:@"_categoryUsages"];
    categoryUsages = v5->_categoryUsages;
    v5->_categoryUsages = (NSArray *)v164;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v21 = a3;
  [v21 encodeObject:displayName forKey:@"_displayName"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v21 encodeObject:v5 forKey:@"_type"];

  [v21 encodeObject:self->_reportDateInterval forKey:@"_reportDateInterval"];
  [v21 encodeObject:self->_lastUpdatedDate forKey:@"_lastUpdatedDate"];
  [v21 encodeObject:self->_dateIntervals forKey:@"_dateIntervals"];
  uint64_t v6 = [NSNumber numberWithDouble:self->_totalScreenTime];
  [v21 encodeObject:v6 forKey:@"_totalScreenTime"];

  uint64_t v7 = [NSNumber numberWithDouble:self->_maxScreenTime];
  [v21 encodeObject:v7 forKey:@"_maxScreenTime"];

  [v21 encodeObject:self->_screenTimeByStartOfDateInterval forKey:@"_screenTimeByStartOfDateInterval"];
  double v8 = [NSNumber numberWithDouble:self->_screenTimeDeltaFromHistoricalAverage];
  [v21 encodeObject:v8 forKey:@"_screenTimeDeltaFromHistoricalAverage"];

  uint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_totalPickups];
  [v21 encodeObject:v9 forKey:@"_totalPickups"];

  [v21 encodeObject:self->_pickupsByTrustIdentifier forKey:@"_pickupsByTrustIdentifier"];
  [v21 encodeObject:self->_pickupsByStartOfDateInterval forKey:@"_pickupsByStartOfDateInterval"];
  [v21 encodeObject:self->_pickupsByStartOfDateIntervalByTrustIdentifier forKey:@"_pickupsByStartOfDateIntervalByTrustIdentifier"];
  uint64_t v10 = [NSNumber numberWithDouble:self->_pickupRate];
  [v21 encodeObject:v10 forKey:@"_pickupRate"];

  uint64_t v11 = [NSNumber numberWithDouble:self->_activePickupDateIntervals];
  [v21 encodeObject:v11 forKey:@"_activePickupDateIntervals"];

  v12 = [NSNumber numberWithUnsignedInteger:self->_maxPickups];
  [v21 encodeObject:v12 forKey:@"_maxPickups"];

  v13 = [NSNumber numberWithUnsignedInteger:self->_maxPickupDateIntervalIndex];
  [v21 encodeObject:v13 forKey:@"_maxPickupDateIntervalIndex"];

  uint64_t v14 = [NSNumber numberWithDouble:self->_pickupDeltaFromHistoricalAverage];
  [v21 encodeObject:v14 forKey:@"_pickupDeltaFromHistoricalAverage"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_totalNotifications];
  [v21 encodeObject:v15 forKey:@"_totalNotifications"];

  [v21 encodeObject:self->_notificationsByTrustIdentifier forKey:@"_notificationsByTrustIdentifier"];
  [v21 encodeObject:self->_notificationsByStartOfDateInterval forKey:@"_notificationsByStartOfDateInterval"];
  [v21 encodeObject:self->_notificationsByStartOfDateIntervalByTrustIdentifier forKey:@"_notificationsByStartOfDateIntervalByTrustIdentifier"];
  [v21 encodeObject:self->_notifications forKey:@"_notifications"];
  uint64_t v16 = [NSNumber numberWithDouble:self->_notificationRate];
  [v21 encodeObject:v16 forKey:@"_notificationRate"];

  id v17 = [NSNumber numberWithDouble:self->_notificationDeltaFromHistoricalAverage];
  [v21 encodeObject:v17 forKey:@"_notificationDeltaFromHistoricalAverage"];

  v18 = [NSNumber numberWithDouble:self->_totalAppUsage];
  [v21 encodeObject:v18 forKey:@"_totalAppUsage"];

  [v21 encodeObject:self->_applicationUsageByTrustIdentifier forKey:@"_applicationUsageByTrustIdentifier"];
  [v21 encodeObject:self->_appUsageByStartOfDateInterval forKey:@"_appUsageByStartOfDateInterval"];
  [v21 encodeObject:self->_applicationUsageByStartOfDateIntervalByTrustIdentifier forKey:@"_applicationUsageByStartOfDateIntervalByTrustIdentifier"];
  [v21 encodeObject:self->_appUsages forKey:@"_appUsages"];
  double v19 = [NSNumber numberWithDouble:self->_totalWebUsage];
  [v21 encodeObject:v19 forKey:@"_totalWebUsage"];

  [v21 encodeObject:self->_webUsageByTrustIdentifier forKey:@"_webUsageByTrustIdentifier"];
  [v21 encodeObject:self->_webUsageByStartOfDateInterval forKey:@"_webUsageByStartOfDateInterval"];
  [v21 encodeObject:self->_webUsageByStartOfDateIntervalByTrustIdentifier forKey:@"_webUsageByStartOfDateIntervalByTrustIdentifier"];
  [v21 encodeObject:self->_appAndWebUsages forKey:@"_appAndWebUsages"];
  unint64_t v20 = [NSNumber numberWithDouble:self->_totalCategoryUsage];
  [v21 encodeObject:v20 forKey:@"_totalCategoryUsage"];

  [v21 encodeObject:self->_categoryUsageByTrustIdentifier forKey:@"_categoryUsageByTrustIdentifier"];
  [v21 encodeObject:self->_categoryUsageByStartOfDateInterval forKey:@"_categoryUsageByStartOfDateInterval"];
  [v21 encodeObject:self->_categoryUsageByStartOfDateIntervalByTrustIdentifier forKey:@"_categoryUsageByStartOfDateIntervalByTrustIdentifier"];
  [v21 encodeObject:self->_categoryUsages forKey:@"_categoryUsages"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v6[9] = *MEMORY[0x263EF8340];
  v6[0] = @"displayName";
  v6[1] = @"type";
  v6[2] = @"reportDateInterval";
  v6[3] = @"lastUpdatedDate";
  v6[4] = @"screenTimeDeltaFromHistoricalAverage";
  v6[5] = @"totalNotifications";
  v6[6] = @"totalPickups";
  v6[7] = @"maxPickups";
  v6[8] = @"maxPickupsDateInterval";
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  id v4 = STUIObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (NSDateInterval)maxPickupsDateInterval
{
  maxPickupsDateInterval = self->_maxPickupsDateInterval;
  if (!maxPickupsDateInterval)
  {
    unint64_t v4 = [(STUsageReport *)self maxPickupDateIntervalIndex];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = 0;
      goto LABEL_6;
    }
    unint64_t v6 = v4;
    uint64_t v7 = [(STUsageReport *)self dateIntervals];
    double v8 = [v7 objectAtIndexedSubscript:v6];
    uint64_t v9 = self->_maxPickupsDateInterval;
    self->_maxPickupsDateInterval = v8;

    maxPickupsDateInterval = self->_maxPickupsDateInterval;
  }
  id v5 = maxPickupsDateInterval;
LABEL_6:

  return v5;
}

- (id)topUsageItemsWithMaxCount:(unint64_t)a3 type:(unint64_t)a4 includeAggregateItem:(BOOL)a5 nonAggregateItems:(id *)a6 darkColors:(BOOL)a7
{
  if (a3)
  {
    BOOL v9 = a5;
    unint64_t v12 = a4 - 1;
    v13 = (void *)MEMORY[0x263EFFA68];
    switch(a4)
    {
      case 1uLL:
      case 5uLL:
      case 6uLL:
        goto LABEL_38;
      case 2uLL:
        uint64_t v14 = [(STUsageReport *)self appUsages];
        goto LABEL_8;
      case 3uLL:
        uint64_t v14 = [(STUsageReport *)self categoryUsages];
        goto LABEL_8;
      case 4uLL:
        uint64_t v14 = [(STUsageReport *)self webUsages];
LABEL_8:
        uint64_t v15 = (void *)v14;
        break;
      default:
        uint64_t v15 = 0;
        break;
    }
    unint64_t v16 = [v15 count];
    BOOL v18 = v16 >= a3 || v16 == 0;
    BOOL v19 = v9 && v18;
    if (v16 >= a3) {
      unint64_t v20 = a3;
    }
    else {
      unint64_t v20 = v16;
    }
    if (v20) {
      BOOL v21 = v19;
    }
    else {
      BOOL v21 = 0;
    }
    unint64_t v22 = v20 - v21;
    v13 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    uint64_t v23 = objc_msgSend(v15, "subarrayWithRange:", 0, v22);
    [v13 addObjectsFromArray:v23];

    uint64_t v24 = +[STUsageColors orderedUsageColors];
    uint64_t v25 = [v24 count];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __98__STUsageReport_topUsageItemsWithMaxCount_type_includeAggregateItem_nonAggregateItems_darkColors___block_invoke;
    v37[3] = &unk_264768CE0;
    id v26 = v24;
    id v38 = v26;
    uint64_t v39 = v25;
    [v13 enumerateObjectsUsingBlock:v37];
    if (a6) {
      *a6 = (id)[v13 copy];
    }
    if (v19)
    {
      v27 = objc_opt_new();
      if (a7) {
        [MEMORY[0x263F825C8] systemGrayColor];
      }
      else {
      id v28 = [MEMORY[0x263F825C8] systemGray4Color];
      }
      [v27 setColor:v28];

      double v29 = [NSString stringWithFormat:@"@sum.%@", @"totalUsage"];
      v30 = [v13 valueForKeyPath:v29];

      switch(v12)
      {
        case 0uLL:
          double v31 = NSNumber;
          [(STUsageReport *)self totalScreenTime];
          goto LABEL_35;
        case 1uLL:
          double v31 = NSNumber;
          [(STUsageReport *)self totalAppUsage];
          goto LABEL_35;
        case 2uLL:
          double v31 = NSNumber;
          [(STUsageReport *)self totalCategoryUsage];
          goto LABEL_35;
        case 3uLL:
          double v31 = NSNumber;
          [(STUsageReport *)self totalWebUsage];
LABEL_35:
          double v33 = v32;
          [v30 doubleValue];
          uint64_t v35 = [v31 numberWithDouble:v33 - v34];
          [v27 setTotalUsage:v35];

          break;
        default:
          break;
      }
      [v13 addObject:v27];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_38:

  return v13;
}

void __98__STUsageReport_topUsageItemsWithMaxCount_type_includeAggregateItem_nonAggregateItems_darkColors___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  objc_super v3 = *(void **)(a1 + 32);
  unint64_t v4 = a3 % *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 objectAtIndexedSubscript:v4];
  [v5 setColor:v6];
}

- (STUsageReportGraphDataSet)screenTimeDataSet
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(STUsageReport *)self type];
  [(STUsageReport *)self maxScreenTime];
  double v5 = v4;
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v6 maximumRangeOfUnit:128];
  double v8 = (double)v7;
  [v6 maximumRangeOfUnit:64];
  double v10 = v8 * (double)v9;
  double v11 = v10 * (double)2uLL;
  if (!v3 || (double v12 = 0.0, v3 == 1) && (double v12 = v10, v10 < v5))
  {
    double v13 = v11 * ceil(v5 / v11);
    if (v13 >= v11) {
      double v12 = v13;
    }
    else {
      double v12 = v11;
    }
  }

  uint64_t v14 = 2 * (v3 == 0);
  if (v3 == 1) {
    uint64_t v14 = 1;
  }
  uint64_t v48 = v14;
  v49 = [(STUsageReport *)self screenTimeByStartOfDateInterval];
  uint64_t v45 = self;
  uint64_t v15 = [(STUsageReport *)self dateIntervals];
  unint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    BOOL v19 = (void *)MEMORY[0x263EFFA68];
    uint64_t v20 = *(void *)v51;
    do
    {
      uint64_t v21 = 0;
      uint64_t v46 = v18;
      do
      {
        if (*(void *)v51 != v20) {
          objc_enumerationMutation(obj);
        }
        unint64_t v22 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
        uint64_t v23 = [v22 startDate];
        uint64_t v24 = [v49 objectForKeyedSubscript:v23];
        [v24 doubleValue];
        double v26 = v25;
        v27 = v19;
        if (v25 > 0.0)
        {
          id v28 = [STUsageReportGraphSegment alloc];
          double v29 = [MEMORY[0x263F825C8] systemTealColor];
          uint64_t v30 = v20;
          double v31 = v16;
          double v32 = v19;
          double v33 = [(STUsageReportGraphSegment *)v28 initWithAmount:v24 amountAsPercentageOfDataPointTotal:v29 color:1.0];

          v54 = v33;
          v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];

          BOOL v19 = v32;
          unint64_t v16 = v31;
          uint64_t v20 = v30;
          uint64_t v18 = v46;
        }
        double v34 = [[STUsageReportGraphDataPoint alloc] initWithTimePeriod:v48 itemType:1 dateInterval:v22 total:v24 totalAsPercentageOfMax:v27 segments:0.0];
        [(STUsageReportGraphDataPoint *)v34 setTotalAsPercentageOfMax:v26 / v12];
        [v16 addObject:v34];

        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v18);
  }

  [(STUsageReport *)v45 totalScreenTime];
  double v36 = v35;
  [(STUsageReport *)v45 activePickupDateIntervals];
  if (v37 <= 0.0) {
    double v38 = 0.0;
  }
  else {
    double v38 = v36 / v37;
  }
  uint64_t v39 = [STUsageReportGraphDataSet alloc];
  v40 = [NSNumber numberWithDouble:v36];
  uint64_t v41 = [NSNumber numberWithDouble:v12];
  double v42 = [NSNumber numberWithDouble:v38];
  v43 = [(STUsageReportGraphDataSet *)v39 initWithTimePeriod:v48 itemType:1 total:v40 max:v41 average:v42 averageAsPercentageOfMax:v16 dataPoints:v38 / v12];

  return v43;
}

- (STUsageReportGraphDataSet)notificationsDataSet
{
  return (STUsageReportGraphDataSet *)[(STUsageReport *)self _dataSetForItemType:5 trustIdentifier:0 includeIndicatorImageName:1 useDarkColors:0];
}

- (STUsageReportGraphDataSet)pickupsDataSet
{
  BOOL v3 = [(STUsageReport *)self type] == 1;

  return (STUsageReportGraphDataSet *)[(STUsageReport *)self _dataSetForItemType:6 trustIdentifier:0 includeIndicatorImageName:v3 useDarkColors:0];
}

- (id)appAndWebUsageDataSetWithDarkColors:(BOOL)a3
{
  return [(STUsageReport *)self _dataSetForItemType:2 trustIdentifier:0 includeIndicatorImageName:1 useDarkColors:a3];
}

- (STUsageReportGraphDataSet)categoryUsageDataSet
{
  return (STUsageReportGraphDataSet *)[(STUsageReport *)self _dataSetForItemType:3 trustIdentifier:0 includeIndicatorImageName:1 useDarkColors:0];
}

- (id)dataSetWithUsageItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 itemType];
  id v6 = [v4 trustIdentifier];

  unint64_t v7 = [(STUsageReport *)self _dataSetForItemType:v5 trustIdentifier:v6 includeIndicatorImageName:0 useDarkColors:0];

  return v7;
}

- (id)_dataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5 useDarkColors:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = a4;
  if (a3 == 1)
  {
    BOOL v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"STUsageReport.m", 804, @"Cannot generate data set for just screen time, you need to specify app or category" object file lineNumber description];
  }
  double v12 = [NSString stringWithFormat:@"%lu-%@", a3, v11];
  double v13 = [(STUsageReport *)self dataSetByUsageIdentifier];
  uint64_t v14 = [v13 objectForKey:v12];

  if (v14)
  {
    id v15 = v14;
    goto LABEL_17;
  }
  if (a3 - 2 < 3)
  {
    if (v11) {
      [(STUsageReport *)self _timedDataSetForItemType:a3 trustIdentifier:v11];
    }
    else {
    uint64_t v16 = [(STUsageReport *)self _timedDataSetForItemType:a3 useDarkColors:v6];
    }
    goto LABEL_14;
  }
  if (a3 - 5 < 2)
  {
    uint64_t v16 = [(STUsageReport *)self _countedDataSetForItemType:a3 trustIdentifier:v11 includeIndicatorImageName:v7];
LABEL_14:
    id v15 = (id)v16;
    if (!v16) {
      goto LABEL_17;
    }
    uint64_t v17 = [(STUsageReport *)self dataSetByUsageIdentifier];
    [v17 setObject:v15 forKey:v12];
    goto LABEL_16;
  }
  if (a3 == 1)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STUsageReport.m", 815, @"Cannot generate data set for %ld", 1);
    id v15 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (a3 - 1 < 4)
  {
    double v10 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STUsageReport.m", 877, @"Cannot generate counted data set for %ld", a3);

LABEL_3:
    v70 = 0;
    v71 = 0;
    id v11 = 0;
    uint64_t v68 = 0;
    unint64_t v12 = 0;
    goto LABEL_4;
  }
  if (a3 == 6)
  {
    v71 = [MEMORY[0x263F825C8] systemTealColor];
    if (v9)
    {
      uint64_t v56 = [(STUsageReport *)self pickupsByTrustIdentifier];
      double v57 = [v56 objectForKeyedSubscript:v9];
      v58 = [v57 totalUsage];
      unint64_t v12 = [v58 unsignedIntegerValue];
    }
    else
    {
      unint64_t v12 = [(STUsageReport *)self totalPickups];
    }
    v59 = @"PickupArrowSmall";
    if (!v5) {
      v59 = 0;
    }
    uint64_t v68 = v59;
    id v11 = [MEMORY[0x263F825C8] systemGrayColor];
    if (v9)
    {
      uint64_t v60 = [(STUsageReport *)self pickupsByStartOfDateIntervalByTrustIdentifier];
      v70 = [v60 objectForKeyedSubscript:v9];
    }
    else
    {
      v70 = [(STUsageReport *)self pickupsByStartOfDateInterval];
    }
  }
  else
  {
    if (a3 != 5) {
      goto LABEL_3;
    }
    v71 = [MEMORY[0x263F825C8] systemRedColor];
    if (v9)
    {
      id v15 = [(STUsageReport *)self notificationsByTrustIdentifier];
      uint64_t v16 = [v15 objectForKeyedSubscript:v9];
      uint64_t v17 = [v16 totalUsage];
      unint64_t v12 = [v17 unsignedIntegerValue];

      uint64_t v18 = [(STUsageReport *)self notificationsByStartOfDateIntervalByTrustIdentifier];
      v70 = [v18 objectForKeyedSubscript:v9];
    }
    else
    {
      unint64_t v12 = [(STUsageReport *)self totalNotifications];
      v70 = [(STUsageReport *)self notificationsByStartOfDateInterval];
    }
    id v11 = 0;
    uint64_t v68 = 0;
  }
LABEL_4:
  unint64_t v13 = [(STUsageReport *)self type];
  if (v13)
  {
    if (v13 != 1)
    {
      char v66 = 0;
      uint64_t v69 = 0;
      int v65 = 1;
      goto LABEL_14;
    }
    int v65 = 0;
    char v66 = 1;
    uint64_t v14 = 1;
  }
  else
  {
    char v66 = 0;
    int v65 = 1;
    uint64_t v14 = 2;
  }
  uint64_t v69 = v14;
LABEL_14:
  BOOL v19 = [(STUsageReport *)self dateIntervals];
  uint64_t v73 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v84 count:16];
  unint64_t v72 = a3;
  id obj = v20;
  if (!v21)
  {
    unint64_t v40 = 10;
    id v36 = v20;
    goto LABEL_47;
  }
  uint64_t v22 = v21;
  uint64_t v61 = v11;
  unint64_t v62 = v12;
  uint64_t v63 = self;
  id v64 = v9;
  unint64_t v23 = 0;
  uint64_t v24 = *(void *)v79;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v79 != v24) {
        objc_enumerationMutation(obj);
      }
      double v26 = *(void **)(*((void *)&v78 + 1) + 8 * i);
      v27 = [v26 startDate];
      id v28 = [v70 objectForKeyedSubscript:v27];
      double v29 = [v28 totalUsage];
      unint64_t v30 = [v29 unsignedIntegerValue];

      double v31 = [NSNumber numberWithUnsignedInteger:v30];
      if (v23 <= v30) {
        unint64_t v23 = v30;
      }
      double v32 = [[STUsageReportGraphSegment alloc] initWithAmount:v31 amountAsPercentageOfDataPointTotal:v71 color:1.0];
      double v33 = [STUsageReportGraphDataPoint alloc];
      id v83 = v32;
      double v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
      double v35 = [(STUsageReportGraphDataPoint *)v33 initWithTimePeriod:v69 itemType:v72 dateInterval:v26 total:v31 totalAsPercentageOfMax:v34 segments:0.0];

      [v73 addObject:v35];
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
  }
  while (v22);

  if (!v23)
  {
    unint64_t v40 = 10;
    self = v63;
    id v9 = v64;
    id v11 = v61;
    unint64_t v12 = v62;
    goto LABEL_48;
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v36 = v73;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v74 objects:v82 count:16];
  self = v63;
  id v11 = v61;
  if (!v37)
  {
    unint64_t v40 = 10 * (v23 / 0xA) + 10;
    goto LABEL_46;
  }
  uint64_t v38 = v37;
  uint64_t v39 = *(void *)v75;
  unint64_t v40 = 10 * (v23 / 0xA) + 10;
  do
  {
    for (uint64_t j = 0; j != v38; ++j)
    {
      if (*(void *)v75 != v39) {
        objc_enumerationMutation(v36);
      }
      double v42 = *(void **)(*((void *)&v74 + 1) + 8 * j);
      v43 = [v42 total];
      unint64_t v44 = [v43 unsignedIntegerValue];

      [v42 setTotalAsPercentageOfMax:(double)v44 / (double)v40];
      if (!v68) {
        goto LABEL_39;
      }
      if (v44) {
        char v45 = v66;
      }
      else {
        char v45 = 0;
      }
      if (v44 == v40) {
        int v46 = v65;
      }
      else {
        int v46 = 0;
      }
      if ((v45 & 1) != 0 || v46)
      {
        [v42 setIndicatorImageName:v68];

        [v42 setIndicatorImageColor:v11];
        id v11 = 0;
LABEL_39:
        uint64_t v68 = 0;
        continue;
      }
    }
    uint64_t v38 = [v36 countByEnumeratingWithState:&v74 objects:v82 count:16];
  }
  while (v38);
LABEL_46:
  id v9 = v64;
  unint64_t v12 = v62;
LABEL_47:

LABEL_48:
  [(STUsageReport *)self activePickupDateIntervals];
  double v48 = 0.0;
  double v49 = 0.0;
  if (v47 > 0.0) {
    double v49 = (double)v12 / v47;
  }
  if (v40) {
    double v48 = v49 / (double)v40;
  }
  long long v50 = [STUsageReportGraphDataSet alloc];
  long long v51 = [NSNumber numberWithUnsignedInteger:v12];
  long long v52 = [NSNumber numberWithUnsignedInteger:v40];
  long long v53 = [NSNumber numberWithDouble:v49];
  v54 = [(STUsageReportGraphDataSet *)v50 initWithTimePeriod:v69 itemType:v72 total:v51 max:v52 average:v53 averageAsPercentageOfMax:v73 dataPoints:v48];

  return v54;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4
{
  BOOL v69 = a4;
  id v4 = self;
  uint64_t v73 = 0;
  v112[2] = *MEMORY[0x263EF8340];
  if (a3 > 6)
  {
    long long v77 = 0;
  }
  else
  {
    if (((1 << a3) & 0x62) != 0)
    {
      uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
      id v4 = self;
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STUsageReport.m", 958, @"Cannot generate timed data set for %ld", a3);

      uint64_t v73 = 0;
      long long v77 = 0;
      goto LABEL_33;
    }
    if (((1 << a3) & 0x14) != 0)
    {
      v111[0] = &unk_26D9674F8;
      BOOL v5 = [(STUsageReport *)self appUsageByStartOfDateInterval];
      BOOL v6 = v5;
      if (!v5) {
        BOOL v6 = objc_opt_new();
      }
      v111[1] = &unk_26D967510;
      v112[0] = v6;
      BOOL v7 = [(STUsageReport *)self webUsageByStartOfDateInterval];
      double v8 = v7;
      if (!v7) {
        double v8 = objc_opt_new();
      }
      v112[1] = v8;
      long long v77 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
      if (!v7) {

      }
      if (!v5) {
      v109[0] = &unk_26D9674F8;
      }
      id v9 = [(STUsageReport *)self applicationUsageByStartOfDateIntervalByTrustIdentifier];
      double v10 = v9;
      if (!v9) {
        double v10 = objc_opt_new();
      }
      v109[1] = &unk_26D967510;
      v110[0] = v10;
      id v11 = [(STUsageReport *)self webUsageByStartOfDateIntervalByTrustIdentifier];
      unint64_t v12 = v11;
      if (!v11) {
        unint64_t v12 = objc_opt_new();
      }
      v110[1] = v12;
      uint64_t v73 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
      if (!v11) {

      }
      if (!v9) {
    }
      }
    else
    {
      long long v77 = 0;
      if (a3 != 3) {
        goto LABEL_33;
      }
      v107 = &unk_26D967528;
      id v15 = [(STUsageReport *)self categoryUsageByStartOfDateInterval];
      uint64_t v16 = v15;
      if (!v15) {
        uint64_t v16 = objc_opt_new();
      }
      v108 = v16;
      long long v77 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      if (!v15) {

      }
      v105 = &unk_26D967528;
      uint64_t v17 = [(STUsageReport *)self categoryUsageByStartOfDateIntervalByTrustIdentifier];
      uint64_t v18 = v17;
      if (!v17) {
        uint64_t v18 = objc_opt_new();
      }
      uint64_t v106 = v18;
      uint64_t v73 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      if (!v17) {
    }
      }
    id v4 = self;
  }
LABEL_33:
  uint64_t v19 = [(STUsageReport *)v4 type];
  uint64_t v20 = 2 * (v19 == 0);
  if (v19 == 1) {
    uint64_t v20 = 1;
  }
  uint64_t v76 = v20;
  unint64_t v72 = +[STUsageColors orderedUsageColors];
  v71 = [(STUsageReport *)self topUsageItemsWithMaxCount:3 type:a3 includeAggregateItem:0 nonAggregateItems:0 darkColors:v69];
  unint64_t v21 = [v71 count];
  unint64_t v22 = [v72 count];
  if (v21 >= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v23 <= 1) {
    unint64_t v23 = 1;
  }
  unint64_t v70 = v23;
  uint64_t v24 = [(STUsageReport *)self dateIntervals];
  long long v78 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v24, "count"));
  [(STUsageReport *)self maxScreenTime];
  double v26 = v25;
  unint64_t v27 = [(STUsageReport *)self type];
  id v28 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v28 maximumRangeOfUnit:128];
  unint64_t v30 = v29;
  [v28 maximumRangeOfUnit:64];
  double v32 = (double)v30 * (double)v31;
  double v33 = v32 * (double)2uLL;
  if (!v27 || (double v34 = 0.0, v27 == 1) && (double v34 = (double)v30 * (double)v31, v32 < v26))
  {
    double v35 = v33 * ceil(v26 / v33);
    if (v35 >= v33) {
      double v34 = v35;
    }
    else {
      double v34 = v33;
    }
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = v24;
  uint64_t v36 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
  if (v36)
  {
    uint64_t v75 = *(void *)v101;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v101 != v75) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        uint64_t v39 = [v38 startDate];
        unint64_t v40 = [(STUsageReport *)self screenTimeByStartOfDateInterval];
        uint64_t v41 = [v40 objectForKeyedSubscript:v39];
        [v41 doubleValue];
        double v43 = v42;

        uint64_t v96 = 0;
        uint64_t v97 = (double *)&v96;
        uint64_t v98 = 0x2020000000;
        uint64_t v99 = 0;
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke;
        v93[3] = &unk_264768D08;
        v95 = &v96;
        id v44 = v39;
        id v94 = v44;
        [v77 enumerateKeysAndObjectsUsingBlock:v93];
        double v45 = v97[3];
        if (v45 < v43) {
          double v45 = v43;
        }
        v97[3] = v45;
        int v46 = objc_opt_new();
        if (v97[3] > 0.0)
        {
          uint64_t v89 = 0;
          uint64_t v90 = (double *)&v89;
          uint64_t v91 = 0x2020000000;
          uint64_t v92 = 0;
          v81[0] = MEMORY[0x263EF8330];
          v81[1] = 3221225472;
          v81[2] = __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke_2;
          v81[3] = &unk_264768D30;
          id v82 = v73;
          id v83 = v44;
          id v84 = v72;
          double v86 = &v89;
          v87 = &v96;
          unint64_t v88 = v70;
          id v47 = v46;
          id v85 = v47;
          [v71 enumerateObjectsUsingBlock:v81];
          double v48 = v90[3];
          double v49 = v97[3];
          if (v48 < v49)
          {
            double v50 = v49 - v48;
            long long v51 = [NSNumber numberWithDouble:v49 - v48];
            if (v69) {
              [MEMORY[0x263F825C8] systemGrayColor];
            }
            else {
            long long v52 = [MEMORY[0x263F825C8] systemGray4Color];
            }
            long long v53 = [[STUsageReportGraphSegment alloc] initWithAmount:v51 amountAsPercentageOfDataPointTotal:v52 color:v50 / v97[3]];
            [v47 addObject:v53];
          }
          _Block_object_dispose(&v89, 8);
        }
        if (v34 <= 0.0) {
          double v54 = 0.0;
        }
        else {
          double v54 = v43 / v34;
        }
        v55 = [STUsageReportGraphDataPoint alloc];
        uint64_t v56 = [NSNumber numberWithDouble:v43];
        double v57 = [(STUsageReportGraphDataPoint *)v55 initWithTimePeriod:v76 itemType:a3 dateInterval:v38 total:v56 totalAsPercentageOfMax:v46 segments:v54];

        [v78 addObject:v57];
        _Block_object_dispose(&v96, 8);
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v100 objects:v104 count:16];
    }
    while (v36);
  }

  [(STUsageReport *)self totalScreenTime];
  double v59 = v58;
  [(STUsageReport *)self activePickupDateIntervals];
  if (v60 <= 0.0) {
    double v61 = 0.0;
  }
  else {
    double v61 = v59 / v60;
  }
  if (v34 <= 0.0) {
    double v62 = 0.0;
  }
  else {
    double v62 = v61 / v34;
  }
  uint64_t v63 = [STUsageReportGraphDataSet alloc];
  id v64 = [NSNumber numberWithDouble:v59];
  int v65 = [NSNumber numberWithDouble:v34];
  char v66 = [NSNumber numberWithDouble:v61];
  uint64_t v67 = [(STUsageReportGraphDataSet *)v63 initWithTimePeriod:v76 itemType:a3 total:v64 max:v65 average:v66 averageAsPercentageOfMax:v78 dataPoints:v62];

  return v67;
}

void __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = [v6 totalUsage];
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

void __56__STUsageReport__timedDataSetForItemType_useDarkColors___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = NSNumber;
  id v7 = a2;
  double v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "itemType"));
  id v9 = [v5 objectForKeyedSubscript:v8];
  double v10 = [v7 trustIdentifier];

  id v11 = [v9 objectForKeyedSubscript:v10];
  unint64_t v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v20 = [v12 totalUsage];

  [v20 doubleValue];
  if (v13 > 0.0)
  {
    double v14 = v13;
    id v15 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 % *(void *)(a1 + 80)];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [MEMORY[0x263F825C8] systemTealColor];
    }
    uint64_t v18 = v17;

    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    uint64_t v19 = [[STUsageReportGraphSegment alloc] initWithAmount:v20 amountAsPercentageOfDataPointTotal:v18 color:v14 / *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [*(id *)(a1 + 56) addObject:v19];
  }
}

- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v73 = a4;
  unint64_t v75 = a3;
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
    case 6uLL:
      id v7 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STUsageReport.m", 1071, @"Cannot generate timed data set for %ld", a3);

      goto LABEL_3;
    case 2uLL:
      double v8 = [(STUsageReport *)self applicationUsageByTrustIdentifier];
      uint64_t v9 = [(STUsageReport *)self applicationUsageByStartOfDateIntervalByTrustIdentifier];
      goto LABEL_7;
    case 3uLL:
      double v8 = [(STUsageReport *)self categoryUsageByTrustIdentifier];
      uint64_t v9 = [(STUsageReport *)self categoryUsageByStartOfDateIntervalByTrustIdentifier];
      goto LABEL_7;
    case 4uLL:
      double v8 = [(STUsageReport *)self webUsageByTrustIdentifier];
      uint64_t v9 = [(STUsageReport *)self webUsageByStartOfDateIntervalByTrustIdentifier];
LABEL_7:
      unint64_t v72 = (void *)v9;
      break;
    default:
LABEL_3:
      unint64_t v72 = 0;
      double v8 = 0;
      break;
  }
  unint64_t v10 = [(STUsageReport *)self type];
  uint64_t v11 = 2 * (v10 == 0);
  if (v10 == 1) {
    uint64_t v11 = 1;
  }
  uint64_t v71 = v11;
  unint64_t v70 = [MEMORY[0x263F825C8] systemBlueColor];
  unint64_t v12 = [(STUsageReport *)self dateIntervals];
  long long v74 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    BOOL v69 = self;
    uint64_t v16 = *(void *)v81;
    double v17 = 0.0;
    do
    {
      uint64_t v18 = v13;
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v81 != v16) {
          objc_enumerationMutation(v18);
        }
        id v20 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        unint64_t v21 = [v20 startDate];
        unint64_t v22 = [v72 objectForKeyedSubscript:v73];
        unint64_t v23 = [v22 objectForKeyedSubscript:v21];
        uint64_t v24 = [v23 totalUsage];

        [v24 doubleValue];
        double v26 = v25;
        if (v17 < v25) {
          double v17 = v25;
        }
        unint64_t v27 = objc_opt_new();
        if (v26 > 0.0)
        {
          id v28 = [[STUsageReportGraphSegment alloc] initWithAmount:v24 amountAsPercentageOfDataPointTotal:v70 color:1.0];
          [v27 addObject:v28];
        }
        unint64_t v29 = [[STUsageReportGraphDataPoint alloc] initWithTimePeriod:v71 itemType:v75 dateInterval:v20 total:v24 totalAsPercentageOfMax:v27 segments:0.0];
        [v74 addObject:v29];
      }
      id v13 = v18;
      uint64_t v15 = [v18 countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v15);

    if (v17 != 0.0)
    {
      self = v69;
      uint64_t v39 = [(STUsageReport *)v69 type];
      unint64_t v40 = [MEMORY[0x263EFF8F0] currentCalendar];
      [v40 maximumRangeOfUnit:128];
      double v42 = (double)v41;
      [v40 maximumRangeOfUnit:64];
      double v44 = v42 * (double)v43;
      double v45 = v44 * (double)2uLL;
      if (v39)
      {
        double v37 = 0.0;
        if (v39 == 1)
        {
          double v37 = v44;
          if (v44 < v17)
          {
            double v46 = v45 * ceil(v17 / v45);
            if (v46 >= v45) {
              double v37 = v46;
            }
            else {
              double v37 = v45;
            }
          }
        }
      }
      else
      {
        double v47 = v45 * ceil(v17 / v45);
        if (v47 >= v45) {
          double v37 = v47;
        }
        else {
          double v37 = v45;
        }
      }

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v31 = v74;
      uint64_t v48 = [v31 countByEnumeratingWithState:&v76 objects:v84 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v77 != v50) {
              objc_enumerationMutation(v31);
            }
            long long v52 = *(void **)(*((void *)&v76 + 1) + 8 * j);
            long long v53 = [v52 total];
            [v53 doubleValue];
            double v55 = v54;

            [v52 setTotalAsPercentageOfMax:v55 / v37];
          }
          uint64_t v49 = [v31 countByEnumeratingWithState:&v76 objects:v84 count:16];
        }
        while (v49);
      }
      goto LABEL_47;
    }
    self = v69;
  }
  else
  {

    double v17 = 0.0;
  }
  unint64_t v30 = [(STUsageReport *)self type];
  id v31 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v31 maximumRangeOfUnit:128];
  double v33 = (double)v32;
  [v31 maximumRangeOfUnit:64];
  double v35 = v33 * (double)v34;
  double v36 = v35 * (double)2uLL;
  if (!v30) {
    goto LABEL_27;
  }
  double v37 = 0.0;
  if (v30 == 1)
  {
    if (v35 < v17)
    {
LABEL_27:
      double v38 = v36 * ceil(v17 / v36);
      if (v38 >= v36) {
        double v37 = v38;
      }
      else {
        double v37 = v36;
      }
      goto LABEL_47;
    }
    double v37 = v35;
  }
LABEL_47:

  uint64_t v56 = [v8 objectForKeyedSubscript:v73];
  double v57 = [v56 totalUsage];
  [v57 doubleValue];
  double v59 = v58;

  [(STUsageReport *)self activePickupDateIntervals];
  if (v60 <= 0.0) {
    double v61 = 0.0;
  }
  else {
    double v61 = v59 / v60;
  }
  if (v37 <= 0.0) {
    double v62 = 0.0;
  }
  else {
    double v62 = v61 / v37;
  }
  uint64_t v63 = [STUsageReportGraphDataSet alloc];
  id v64 = [NSNumber numberWithDouble:v59];
  int v65 = [NSNumber numberWithDouble:v37];
  char v66 = [NSNumber numberWithDouble:v61];
  uint64_t v67 = [(STUsageReportGraphDataSet *)v63 initWithTimePeriod:v71 itemType:v75 total:v64 max:v65 average:v66 averageAsPercentageOfMax:v74 dataPoints:v62];

  return v67;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDateInterval)reportDateInterval
{
  return self->_reportDateInterval;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSArray)dateIntervals
{
  return self->_dateIntervals;
}

- (double)totalScreenTime
{
  return self->_totalScreenTime;
}

- (double)screenTimeDeltaFromHistoricalAverage
{
  return self->_screenTimeDeltaFromHistoricalAverage;
}

- (unint64_t)totalPickups
{
  return self->_totalPickups;
}

- (NSDictionary)pickupsByTrustIdentifier
{
  return self->_pickupsByTrustIdentifier;
}

- (NSArray)pickups
{
  return self->_pickups;
}

- (double)pickupRate
{
  return self->_pickupRate;
}

- (double)activePickupDateIntervals
{
  return self->_activePickupDateIntervals;
}

- (unint64_t)maxPickups
{
  return self->_maxPickups;
}

- (unint64_t)maxPickupDateIntervalIndex
{
  return self->_maxPickupDateIntervalIndex;
}

- (NSDate)firstPickup
{
  return self->_firstPickup;
}

- (double)pickupDeltaFromHistoricalAverage
{
  return self->_pickupDeltaFromHistoricalAverage;
}

- (unint64_t)totalNotifications
{
  return self->_totalNotifications;
}

- (NSDictionary)notificationsByTrustIdentifier
{
  return self->_notificationsByTrustIdentifier;
}

- (NSArray)notifications
{
  return self->_notifications;
}

- (double)notificationRate
{
  return self->_notificationRate;
}

- (double)notificationDeltaFromHistoricalAverage
{
  return self->_notificationDeltaFromHistoricalAverage;
}

- (NSDictionary)applicationUsageByTrustIdentifier
{
  return self->_applicationUsageByTrustIdentifier;
}

- (NSDictionary)webUsageByTrustIdentifier
{
  return self->_webUsageByTrustIdentifier;
}

- (NSArray)appAndWebUsages
{
  return self->_appAndWebUsages;
}

- (NSDictionary)categoryUsageByTrustIdentifier
{
  return self->_categoryUsageByTrustIdentifier;
}

- (NSArray)categoryUsages
{
  return self->_categoryUsages;
}

- (double)maxScreenTime
{
  return self->_maxScreenTime;
}

- (NSDictionary)screenTimeByStartOfDateInterval
{
  return self->_screenTimeByStartOfDateInterval;
}

- (NSDictionary)pickupsByStartOfDateInterval
{
  return self->_pickupsByStartOfDateInterval;
}

- (NSDictionary)pickupsByStartOfDateIntervalByTrustIdentifier
{
  return self->_pickupsByStartOfDateIntervalByTrustIdentifier;
}

- (NSDictionary)notificationsByStartOfDateInterval
{
  return self->_notificationsByStartOfDateInterval;
}

- (NSDictionary)notificationsByStartOfDateIntervalByTrustIdentifier
{
  return self->_notificationsByStartOfDateIntervalByTrustIdentifier;
}

- (double)totalAppUsage
{
  return self->_totalAppUsage;
}

- (NSDictionary)appUsageByStartOfDateInterval
{
  return self->_appUsageByStartOfDateInterval;
}

- (NSDictionary)applicationUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_applicationUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSArray)appUsages
{
  return self->_appUsages;
}

- (double)totalWebUsage
{
  return self->_totalWebUsage;
}

- (NSDictionary)webUsageByStartOfDateInterval
{
  return self->_webUsageByStartOfDateInterval;
}

- (NSDictionary)webUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_webUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSArray)webUsages
{
  return self->_webUsages;
}

- (double)totalCategoryUsage
{
  return self->_totalCategoryUsage;
}

- (NSDictionary)categoryUsageByStartOfDateInterval
{
  return self->_categoryUsageByStartOfDateInterval;
}

- (NSDictionary)categoryUsageByStartOfDateIntervalByTrustIdentifier
{
  return self->_categoryUsageByStartOfDateIntervalByTrustIdentifier;
}

- (NSCache)dataSetByUsageIdentifier
{
  return self->_dataSetByUsageIdentifier;
}

- (void)setDataSetByUsageIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSetByUsageIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_webUsages, 0);
  objc_storeStrong((id *)&self->_webUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_webUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_appUsages, 0);
  objc_storeStrong((id *)&self->_applicationUsageByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_appUsageByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_notificationsByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationsByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_pickupsByStartOfDateIntervalByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_pickupsByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_screenTimeByStartOfDateInterval, 0);
  objc_storeStrong((id *)&self->_categoryUsages, 0);
  objc_storeStrong((id *)&self->_categoryUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_appAndWebUsages, 0);
  objc_storeStrong((id *)&self->_webUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationUsageByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_notificationsByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_firstPickup, 0);
  objc_storeStrong((id *)&self->_pickups, 0);
  objc_storeStrong((id *)&self->_pickupsByTrustIdentifier, 0);
  objc_storeStrong((id *)&self->_dateIntervals, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_reportDateInterval, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_maxPickupsDateInterval, 0);
}

@end