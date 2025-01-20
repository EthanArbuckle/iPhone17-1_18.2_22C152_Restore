@interface DNSHeuristics
+ (BOOL)clearNetworkAsFiltered:(id)a3;
+ (BOOL)countersExceedThreshold:(unint64_t)a3 burstCounter:(unint64_t)a4;
+ (BOOL)getNetworkFilteredFlag:(id)a3;
+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4;
+ (BOOL)setNetworkAsFiltered:(id)a3;
+ (BOOL)setNetworkAsFiltered:(id)a3 filtered:(BOOL)a4;
+ (BOOL)setNetworkSettings:(id)a3 value:(id)a4;
+ (BOOL)updateHeuristicState:(BOOL)a3 isTimeout:(BOOL)a4;
+ (id)copyEmptyHeuristicState;
+ (id)copyNetworkSettings:(id)a3;
+ (unint64_t)currentTimeMs;
@end

@implementation DNSHeuristics

+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4
{
  return +[DNSHeuristics updateHeuristicState:0 isTimeout:a4];
}

+ (BOOL)updateHeuristicState:(BOOL)a3 isTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  v6 = objc_opt_new();
  [v6 activate];
  uint64_t v48 = [v6 currentKnownNetworkProfile];
  id v7 = +[DNSHeuristics copyNetworkSettings:v48];
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = (void *)MEMORY[0x263EFFA78];
  }
  v9 = [v8 objectForKey:@"LastFailureTimestamp"];

  if (!v9)
  {
    id v10 = +[DNSHeuristics copyEmptyHeuristicState];

    v8 = v10;
  }
  unint64_t v11 = +[DNSHeuristics currentTimeMs];
  v12 = [v8 objectForKeyedSubscript:@"LastFailureTimestamp"];
  unint64_t v13 = [v12 unsignedIntegerValue];

  v14 = [v8 objectForKeyedSubscript:@"LongCount"];
  uint64_t v15 = [v14 unsignedIntegerValue];

  v16 = [v8 objectForKeyedSubscript:@"BurstCount"];
  uint64_t v17 = [v16 unsignedIntegerValue];

  v18 = (void *)v48;
  BOOL v19 = +[DNSHeuristics getNetworkFilteredFlag:v48];
  if (!v5)
  {
    BOOL v24 = v4;
    if (v4 && (unint64_t v25 = v11 - v13, v11 > v13) && v13 + 30000 > v11)
    {
      v20 = _mdns_heuristics_log();
      LOBYTE(v26) = 1;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v52 = (const char *)v25;
        _os_log_impl(&dword_23814D000, v20, OS_LOG_TYPE_INFO, "Logging DoH timeout failure after only %llums, not incrementing failure counter", buf, 0xCu);
      }
      v18 = (void *)v48;
    }
    else
    {
      uint64_t v27 = v15 + 1;
      unint64_t v28 = v17 + (v11 - v13) / 0x1D4C0;
      if (v28 >= 0xA) {
        unint64_t v28 = 10;
      }
      BOOL v29 = v28 != 0;
      unint64_t v30 = v28 - 1;
      if (v29) {
        unint64_t v31 = v30;
      }
      else {
        unint64_t v31 = 0;
      }
      if (v19)
      {
        v32 = _mdns_heuristics_log();
        uint64_t v33 = 1;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v34 = "";
          *(_DWORD *)buf = 136315650;
          if (v24) {
            v34 = "timeout ";
          }
          v52 = v34;
          __int16 v53 = 2048;
          uint64_t v54 = v15 + 1;
          __int16 v55 = 2048;
          unint64_t v56 = v31;
          _os_log_impl(&dword_23814D000, v32, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping filtered state", buf, 0x20u);
        }
      }
      else
      {
        BOOL v37 = +[DNSHeuristics countersExceedThreshold:v15 + 1 burstCounter:v31];
        v38 = _mdns_heuristics_log();
        v32 = v38;
        if (v37)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = "";
            *(_DWORD *)buf = 136315650;
            if (v24) {
              v39 = "timeout ";
            }
            v52 = v39;
            __int16 v53 = 2048;
            uint64_t v54 = v27;
            __int16 v55 = 2048;
            unint64_t v56 = v31;
            _os_log_impl(&dword_23814D000, v32, OS_LOG_TYPE_DEFAULT, "Logging DoH %sfailure %llu (bucket %llu), moving into filtered state", buf, 0x20u);
          }
          uint64_t v33 = 1;
        }
        else
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v42 = "";
            *(_DWORD *)buf = 136315650;
            if (v24) {
              v42 = "timeout ";
            }
            v52 = v42;
            __int16 v53 = 2048;
            uint64_t v54 = v27;
            __int16 v55 = 2048;
            unint64_t v56 = v31;
            _os_log_impl(&dword_23814D000, v32, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping unfiltered state", buf, 0x20u);
          }
          uint64_t v33 = 0;
        }
      }

      v49[0] = @"LastFailureTimestamp";
      uint64_t v43 = +[NSNumber numberWithUnsignedInteger:v11];
      v50[0] = v43;
      v49[1] = @"LongCount";
      v44 = +[NSNumber numberWithUnsignedInteger:v27];
      v50[1] = v44;
      v49[2] = @"BurstCount";
      v45 = +[NSNumber numberWithUnsignedInteger:v31];
      v50[2] = v45;
      v20 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];

      v18 = (void *)v48;
      LODWORD(v43) = +[DNSHeuristics setNetworkSettings:v48 value:v20];
      BOOL v26 = v43 & +[DNSHeuristics setNetworkAsFiltered:v48 filtered:v33];
      v46 = +[NSSet setWithObjects:](&off_26EB1FB40, "setWithObjects:", &unk_26EB1B240, &unk_26EB1B258, 0);
      [v6 updateKnownNetworkProfile:v48 properties:v46 error:0];
    }
    goto LABEL_47;
  }
  if (v19)
  {
    if (v13 + 86400000 >= v11)
    {
      v35 = _mdns_heuristics_log();
      v20 = v35;
      unint64_t v36 = v11 - v13;
      if (v11 > v13)
      {
        LOBYTE(v26) = 1;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v52 = (const char *)v36;
          _os_log_impl(&dword_23814D000, v20, OS_LOG_TYPE_INFO, "Logging DoH success after %llums, keeping filtered state", buf, 0xCu);
        }
        goto LABEL_47;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "Logging DoH success, invalid last failure, clearing filtered state";
        v22 = v20;
        uint32_t v23 = 2;
        goto LABEL_39;
      }
    }
    else
    {
      v20 = _mdns_heuristics_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v52 = (const char *)(v11 - v13);
        v21 = "Logging DoH success after %llums, clearing filtered state";
        v22 = v20;
        uint32_t v23 = 12;
LABEL_39:
        _os_log_impl(&dword_23814D000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }

    id v40 = +[DNSHeuristics copyEmptyHeuristicState];
    BOOL v41 = +[DNSHeuristics setNetworkSettings:v48 value:v40];

    BOOL v26 = v41 & +[DNSHeuristics setNetworkAsFiltered:v48 filtered:0];
    v20 = +[NSSet setWithObjects:](&off_26EB1FB40, "setWithObjects:", &unk_26EB1B240, &unk_26EB1B258, 0);
    [v6 updateKnownNetworkProfile:v48 properties:v20 error:0];
LABEL_47:

    goto LABEL_48;
  }
  LOBYTE(v26) = 1;
LABEL_48:
  [v6 invalidate];

  return v26;
}

+ (id)copyEmptyHeuristicState
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"LastFailureTimestamp";
  v2 = +[NSNumber numberWithUnsignedInteger:0];
  v8[0] = v2;
  v7[1] = @"LongCount";
  v3 = +[NSNumber numberWithUnsignedInteger:0];
  v8[1] = v3;
  v7[2] = @"BurstCount";
  BOOL v4 = +[NSNumber numberWithUnsignedInteger:10];
  v8[2] = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (unint64_t)currentTimeMs
{
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  unint64_t v4 = (unint64_t)(v3 * 1000.0);

  return v4;
}

+ (BOOL)countersExceedThreshold:(unint64_t)a3 burstCounter:(unint64_t)a4
{
  return !a4 || a3 > 0xA;
}

+ (BOOL)setNetworkAsFiltered:(id)a3 filtered:(BOOL)a4
{
  if (a4) {
    return +[DNSHeuristics setNetworkAsFiltered:a3];
  }
  else {
    return +[DNSHeuristics clearNetworkAsFiltered:a3];
  }
}

+ (BOOL)clearNetworkAsFiltered:(id)a3
{
  return 1;
}

+ (BOOL)setNetworkAsFiltered:(id)a3
{
  return 1;
}

+ (BOOL)getNetworkFilteredFlag:(id)a3
{
  return [a3 isDNSHeuristicsFilteredNetwork];
}

+ (BOOL)setNetworkSettings:(id)a3 value:(id)a4
{
  return 1;
}

+ (id)copyNetworkSettings:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end