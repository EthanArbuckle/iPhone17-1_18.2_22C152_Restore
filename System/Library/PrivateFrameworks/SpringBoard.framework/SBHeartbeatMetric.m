@interface SBHeartbeatMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (SBHeartbeatMetric)initWithPersistence:(id)a3;
- (SBHeartbeatMetricPersistence)heartbeatMetricPersistence;
- (id)_makePayloadFromMetricsByDatestamp:(id)a3;
- (id)calendar;
- (id)dateFormatter;
@end

@implementation SBHeartbeatMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  if (a3 == 11)
  {
    v6 = [(SBHeartbeatMetricPersistence *)self->_heartbeatMetricPersistence metricsByDatestamp];
    v7 = [(SBHeartbeatMetric *)self _makePayloadFromMetricsByDatestamp:v6];
    [(SBHeartbeatMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.Heartbeat" payload:v7];
  }
  return a3 == 11;
}

- (SBHeartbeatMetric)initWithPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHeartbeatMetric;
  v6 = [(SBHeartbeatMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heartbeatMetricPersistence, a3);
  }

  return v7;
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __60__SBHeartbeatMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_makePayloadFromMetricsByDatestamp:(id)a3
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(SBHeartbeatMetric *)self calendar];
  v102 = [(SBHeartbeatMetric *)self dateFormatter];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 startOfDayForDate:v6];

  v113 = [v5 dateByAddingUnit:16 value:-1 toDate:v7 options:0];
  v112 = [v5 dateByAddingUnit:16 value:-7 toDate:v7 options:0];
  v97 = v5;
  v111 = [v5 dateByAddingUnit:16 value:-30 toDate:v7 options:0];
  id v109 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v105 = v4;
  obuint64_t j = [v4 allKeys];
  uint64_t v9 = [obj countByEnumeratingWithState:&v139 objects:v149 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v140 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = [v105 objectForKey:*(void *)(*((void *)&v139 + 1) + 8 * i)];
        v14 = [v13 objectForKey:@"Counts"];
        v15 = [v13 objectForKey:@"Durations"];
        v16 = [v14 allKeys];
        [v109 addObjectsFromArray:v16];

        v17 = [v15 allKeys];
        [v8 addObjectsFromArray:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v139 objects:v149 count:16];
    }
    while (v10);
  }

  id v114 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v100 = v109;
  uint64_t v18 = [v100 countByEnumeratingWithState:&v135 objects:v148 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v136;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v136 != v20) {
          objc_enumerationMutation(v100);
        }
        uint64_t v22 = *(void *)(*((void *)&v135 + 1) + 8 * j);
        v23 = [NSString stringWithFormat:@"%@CountTrailing1Day", v22];
        [v114 setObject:&unk_1F334A6B8 forKey:v23];

        v24 = [NSString stringWithFormat:@"%@CountTrailing7Days", v22];
        [v114 setObject:&unk_1F334A6B8 forKey:v24];

        v25 = [NSString stringWithFormat:@"%@CountTrailing30Days", v22];
        [v114 setObject:&unk_1F334A6B8 forKey:v25];
      }
      uint64_t v19 = [v100 countByEnumeratingWithState:&v135 objects:v148 count:16];
    }
    while (v19);
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v99 = v8;
  uint64_t v26 = [v99 countByEnumeratingWithState:&v131 objects:v147 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v132;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v132 != v28) {
          objc_enumerationMutation(v99);
        }
        uint64_t v30 = *(void *)(*((void *)&v131 + 1) + 8 * k);
        v31 = [NSString stringWithFormat:@"%@DurationTrailing1Day", v30];
        [v114 setObject:&unk_1F3348C28 forKey:v31];

        v32 = [NSString stringWithFormat:@"%@DurationTrailing7Days", v30];
        [v114 setObject:&unk_1F3348C28 forKey:v32];

        v33 = [NSString stringWithFormat:@"%@DurationTrailing30Days", v30];
        [v114 setObject:&unk_1F3348C28 forKey:v33];
      }
      uint64_t v27 = [v99 countByEnumeratingWithState:&v131 objects:v147 count:16];
    }
    while (v27);
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v98 = [v105 allKeys];
  uint64_t v103 = [v98 countByEnumeratingWithState:&v127 objects:v146 count:16];
  if (v103)
  {
    uint64_t v101 = *(void *)v128;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v128 != v101) {
          objc_enumerationMutation(v98);
        }
        uint64_t v104 = v34;
        uint64_t v35 = *(void *)(*((void *)&v127 + 1) + 8 * v34);
        v36 = [v105 objectForKey:v35];
        v37 = [v102 dateFromString:v35];
        v106 = v36;
        v38 = [v36 objectForKey:@"Counts"];
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v123 objects:v145 count:16];
        v110 = v38;
        if (v39)
        {
          uint64_t v40 = v39;
          id v41 = *(id *)v124;
          id obja = *(id *)v124;
          do
          {
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(id *)v124 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v123 + 1) + 8 * m);
              v44 = [v38 objectForKey:v43];
              uint64_t v45 = [v44 integerValue];

              if ([v37 compare:v7] == -1 && !objc_msgSend(v37, "compare:", v113))
              {
                v46 = [NSString stringWithFormat:@"%@CountTrailing1Day", v43];
                v47 = [v114 objectForKey:v46];
                uint64_t v48 = [v47 integerValue];

                uint64_t v49 = v48 + v45;
                v38 = v110;
                v50 = [NSNumber numberWithInteger:v49];
                id v41 = obja;
                [v114 setObject:v50 forKey:v46];
              }
              if ([v37 compare:v7] == -1 && objc_msgSend(v37, "compare:", v112) != -1)
              {
                v51 = [NSString stringWithFormat:@"%@CountTrailing7Days", v43];
                v52 = [v114 objectForKey:v51];
                uint64_t v53 = [v52 integerValue];

                uint64_t v54 = v53 + v45;
                v38 = v110;
                v55 = [NSNumber numberWithInteger:v54];
                id v41 = obja;
                [v114 setObject:v55 forKey:v51];
              }
              if ([v37 compare:v7] == -1 && objc_msgSend(v37, "compare:", v111) != -1)
              {
                v56 = [NSString stringWithFormat:@"%@CountTrailing30Days", v43];
                v57 = [v114 objectForKey:v56];
                uint64_t v58 = [v57 integerValue];

                v59 = [NSNumber numberWithInteger:v58 + v45];
                v38 = v110;
                [v114 setObject:v59 forKey:v56];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v123 objects:v145 count:16];
          }
          while (v40);
        }
        v60 = [v106 objectForKey:@"Durations"];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v61 = [v60 countByEnumeratingWithState:&v119 objects:v144 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v120;
          do
          {
            for (uint64_t n = 0; n != v62; ++n)
            {
              if (*(void *)v120 != v63) {
                objc_enumerationMutation(v60);
              }
              uint64_t v65 = *(void *)(*((void *)&v119 + 1) + 8 * n);
              v66 = [v60 objectForKey:v65];
              [v66 doubleValue];
              double v68 = v67;

              if ([v37 compare:v7] == -1 && !objc_msgSend(v37, "compare:", v113))
              {
                v69 = [NSString stringWithFormat:@"%@DurationTrailing1Day", v65];
                v70 = [v114 objectForKey:v69];
                [v70 doubleValue];
                double v72 = v71;

                v73 = [NSNumber numberWithDouble:v68 + v72];
                [v114 setObject:v73 forKey:v69];
              }
              if ([v37 compare:v7] == -1 && objc_msgSend(v37, "compare:", v112) != -1)
              {
                v74 = [NSString stringWithFormat:@"%@DurationTrailing7Days", v65];
                v75 = [v114 objectForKey:v74];
                [v75 doubleValue];
                double v77 = v76;

                v78 = [NSNumber numberWithDouble:v68 + v77];
                [v114 setObject:v78 forKey:v74];
              }
              if ([v37 compare:v7] == -1 && objc_msgSend(v37, "compare:", v111) != -1)
              {
                v79 = [NSString stringWithFormat:@"%@DurationTrailing30Days", v65];
                v80 = [v114 objectForKey:v79];
                [v80 doubleValue];
                double v82 = v81;

                v83 = [NSNumber numberWithDouble:v68 + v82];
                [v114 setObject:v83 forKey:v79];
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v119 objects:v144 count:16];
          }
          while (v62);
        }

        uint64_t v34 = v104 + 1;
      }
      while (v104 + 1 != v103);
      uint64_t v103 = [v98 countByEnumeratingWithState:&v127 objects:v146 count:16];
    }
    while (v103);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v84 = [v114 allKeys];
  uint64_t v85 = [v84 countByEnumeratingWithState:&v115 objects:v143 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v116;
    do
    {
      for (iuint64_t i = 0; ii != v86; ++ii)
      {
        if (*(void *)v116 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v115 + 1) + 8 * ii);
        if ([v89 containsString:@"Duration"])
        {
          v90 = [v114 objectForKey:v89];
          [v90 doubleValue];
          double v92 = v91;

          uint64_t v93 = 0;
          while (v92 >= dbl_1D8FD1E70[v93])
          {
            if (++v93 == 50)
            {
              double v94 = 300000.0;
              goto LABEL_74;
            }
          }
          if ((int)v93 <= 1) {
            LODWORD(v93) = 1;
          }
          double v94 = dbl_1D8FD1E70[(v93 - 1)];
LABEL_74:
          v95 = [NSNumber numberWithDouble:v94];
          [v114 setObject:v95 forKey:v89];
        }
      }
      uint64_t v86 = [v84 countByEnumeratingWithState:&v115 objects:v143 count:16];
    }
    while (v86);
  }

  return v114;
}

- (id)calendar
{
  calendar = self->_calendar;
  if (!calendar)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    char v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
    [(NSCalendar *)v4 setTimeZone:v5];

    v6 = self->_calendar;
    self->_calendar = v4;

    calendar = self->_calendar;
  }
  return calendar;
}

- (id)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    char v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (SBHeartbeatMetricPersistence)heartbeatMetricPersistence
{
  return self->_heartbeatMetricPersistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatMetricPersistence, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end