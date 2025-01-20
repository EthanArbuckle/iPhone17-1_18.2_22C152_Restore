@interface WRDiagnostic
+ (id)diagnosticsForWorkflowName:(void *)a3 signpostName:(void *)a4 diagnosticDicts:(char)a5 diagnosticsEnabled:(int)a6 checkForOverrides:(uint64_t *)a7 error:;
+ (id)diagnosticsWithDict:(void *)a3 backupName:(uint64_t *)a4 error:;
- (BOOL)gatherTailspin;
- (BOOL)hasAnySpindumpReports;
- (BOOL)hasTriggerThresholdCount;
- (BOOL)hasTriggerThresholdDurationSingle;
- (BOOL)hasTriggerThresholdDurationSum;
- (BOOL)hasTriggerThresholdDurationUnion;
- (BOOL)isEqual:(id)a3;
- (BOOL)reportOmittingNetworkBoundIntervals;
- (BOOL)reportSpindumpForMainThread;
- (BOOL)reportSpindumpForThisDispatchQueue;
- (BOOL)reportSpindumpForThisThread;
- (BOOL)tailspinIncludeOSLogs;
- (BOOL)triggerEventTimeout;
- (NSString)name;
- (NSString)reportOtherSignpostWithName;
- (NSString)reportProcessesWithName;
- (NSString)reportSpindumpForDispatchQueueWithLabel;
- (NSString)reportSpindumpForThreadWithName;
- (WRDiagnostic)initWithEncodedDict:(id)a3 error:(id *)a4;
- (double)triggerThresholdDurationSingle;
- (double)triggerThresholdDurationSum;
- (double)triggerThresholdDurationUnion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)encodedDict;
- (id)initWithDict:(void *)a3 backupName:(uint64_t *)a4 error:;
- (id)isValidForSignpost;
- (id)isValidForWorkflow;
- (id)validate;
- (uint64_t)applyDict:(uint64_t *)a3 error:;
- (unint64_t)hash;
- (unsigned)triggerThresholdCount;
@end

@implementation WRDiagnostic

- (id)initWithDict:(void *)a3 backupName:(uint64_t *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_11;
  }
  uint64_t v30 = 0;
  if (a4) {
    *a4 = 0;
  }
  else {
    a4 = &v30;
  }
  v29.receiver = a1;
  v29.super_class = (Class)WRDiagnostic;
  v15 = (id *)objc_msgSendSuper2(&v29, sel_init);
  if (!v15)
  {
    WRMakeError(2, @"Unable to init", v9, v10, v11, v12, v13, v14, v28);
    goto LABEL_9;
  }
  WRCheckForBadDiagnosticDict(v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v19 = [v7 objectForKeyedSubscript:@"name"];
    id v20 = v15[3];
    v15[3] = (id)v19;

    if (v15[3])
    {
LABEL_13:
      if (-[WRDiagnostic applyDict:error:]((uint64_t)v15, v7, a4))
      {
        -[WRDiagnostic validate](v15);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = (uint64_t)v27;
        if (!v27)
        {
          v17 = v15;
          goto LABEL_10;
        }
      }
      goto LABEL_7;
    }
    if (*a4) {
      goto LABEL_7;
    }
    if (v8)
    {
      objc_storeStrong(v15 + 3, a3);
      goto LABEL_13;
    }
    WRMakeError(7, @"Mutiple diagnostic dictionaries in array, but no name: %@", v21, v22, v23, v24, v25, v26, (uint64_t)v7);
LABEL_9:
    v17 = 0;
    *a4 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_7:
  v17 = 0;
LABEL_10:

LABEL_11:
  return v17;
}

- (uint64_t)applyDict:(uint64_t *)a3 error:
{
  id v5 = a2;
  v6 = v5;
  if (a1)
  {
    uint64_t v60 = 0;
    if (a3) {
      *a3 = 0;
    }
    else {
      a3 = &v60;
    }
    id v7 = @"trigger_threshold_duration_sum";
    id v8 = DictGetNumber(v5, @"trigger_threshold_duration_sum", a3);
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 doubleValue];
      if (v16 < 0.0) {
        goto LABEL_15;
      }
      *(double *)(a1 + 40) = v16;
    }
    else if (*a3)
    {
      goto LABEL_86;
    }

    id v7 = @"trigger_threshold_duration_union";
    v17 = DictGetNumber(v6, @"trigger_threshold_duration_union", a3);
    uint64_t v9 = v17;
    if (!v17)
    {
      if (*a3) {
        goto LABEL_86;
      }
LABEL_13:

      id v7 = @"trigger_threshold_duration_single";
      uint64_t v19 = DictGetNumber(v6, @"trigger_threshold_duration_single", a3);
      uint64_t v9 = v19;
      if (v19)
      {
        [v19 doubleValue];
        if (v20 < 0.0) {
          goto LABEL_15;
        }
        *(double *)(a1 + 32) = v20;
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v21 = DictGetNumber(v6, @"trigger_threshold_count", a3);
      uint64_t v22 = v21;
      if (v21)
      {
        *(_DWORD *)(a1 + 16) = [v21 unsignedIntValue];
      }
      else if (*a3)
      {
        goto LABEL_27;
      }

      uint64_t v23 = @"trigger_event_timeout";
      uint64_t v24 = DictGetNumber(v6, @"trigger_event_timeout", a3);
      uint64_t v9 = v24;
      if (v24)
      {
        if ([v24 intValue] && objc_msgSend(v9, "intValue") != 1) {
          goto LABEL_59;
        }
        *(unsigned char *)(a1 + 8) = [v9 BOOLValue];
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v23 = @"gather_tailspin";
      uint64_t v25 = DictGetNumber(v6, @"gather_tailspin", a3);
      uint64_t v9 = v25;
      if (v25)
      {
        if ([v25 intValue] && objc_msgSend(v9, "intValue") != 1) {
          goto LABEL_59;
        }
        *(unsigned char *)(a1 + 9) = [v9 BOOLValue];
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v23 = @"option_tailspin_includes_oslogs";
      uint64_t v26 = DictGetNumber(v6, @"option_tailspin_includes_oslogs", a3);
      uint64_t v9 = v26;
      if (v26)
      {
        if ([v26 intValue] && objc_msgSend(v9, "intValue") != 1) {
          goto LABEL_59;
        }
        *(unsigned char *)(a1 + 10) = [v9 BOOLValue];
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v23 = @"report_spindump_this_thread";
      id v27 = DictGetNumber(v6, @"report_spindump_this_thread", a3);
      uint64_t v9 = v27;
      if (v27)
      {
        if ([v27 intValue] && objc_msgSend(v9, "intValue") != 1) {
          goto LABEL_59;
        }
        *(unsigned char *)(a1 + 11) = [v9 BOOLValue];
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v28 = DictGetString(v6, @"report_spindump_thread_name", a3);
      objc_super v29 = v28;
      if (v28)
      {
        id v30 = (id)[v28 length];
        if (v30) {
          id v30 = v29;
        }
        v31 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v30;
      }
      else if (*a3)
      {
        goto LABEL_27;
      }

      uint64_t v23 = @"report_spindump_main_thread";
      v32 = DictGetNumber(v6, @"report_spindump_main_thread", a3);
      uint64_t v9 = v32;
      if (v32)
      {
        if ([v32 intValue] && objc_msgSend(v9, "intValue") != 1) {
          goto LABEL_59;
        }
        *(unsigned char *)(a1 + 12) = [v9 BOOLValue];
      }
      else if (*a3)
      {
        goto LABEL_86;
      }

      uint64_t v23 = @"report_spindump_this_dispatchqueue";
      v33 = DictGetNumber(v6, @"report_spindump_this_dispatchqueue", a3);
      uint64_t v9 = v33;
      if (!v33)
      {
        if (*a3) {
          goto LABEL_86;
        }
        goto LABEL_61;
      }
      if (![v33 intValue] || objc_msgSend(v9, "intValue") == 1)
      {
        *(unsigned char *)(a1 + 13) = [v9 BOOLValue];
LABEL_61:

        v40 = DictGetString(v6, @"report_spindump_dispatchqueue_label", a3);
        v41 = v40;
        if (v40)
        {
          id v42 = (id)[v40 length];
          if (v42) {
            id v42 = v41;
          }
          v43 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = v42;
        }
        else if (*a3)
        {
          goto LABEL_27;
        }

        v44 = DictGetString(v6, @"option_report_other_signpost", a3);
        v45 = v44;
        if (v44)
        {
          id v46 = (id)[v44 length];
          if (v46) {
            id v46 = v45;
          }
          v47 = *(void **)(a1 + 72);
          *(void *)(a1 + 72) = v46;

          goto LABEL_69;
        }
        if (!*a3)
        {
LABEL_69:

          v48 = DictGetString(v6, @"option_report_other_processes", a3);
          v49 = v48;
          if (v48)
          {
            id v50 = (id)[v48 length];
            if (v50) {
              id v50 = v49;
            }
            v51 = *(void **)(a1 + 80);
            *(void *)(a1 + 80) = v50;

LABEL_73:
            v52 = DictGetNumber(v6, @"option_report_omit_network_bound_intervals", a3);
            uint64_t v9 = v52;
            if (v52)
            {
              if (![v52 intValue] || objc_msgSend(v9, "intValue") == 1)
              {
                *(unsigned char *)(a1 + 14) = [v9 BOOLValue];
LABEL_84:
                a1 = 1;
                goto LABEL_87;
              }
              [v9 intValue];
              WRMakeError(8, @"Bad BOOL for %@: %d", v53, v54, v55, v56, v57, v58, @"option_report_omit_network_bound_intervals");
              *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
            }
            else if (!*a3)
            {
              goto LABEL_84;
            }
LABEL_86:
            a1 = 0;
            goto LABEL_87;
          }
          if (!*a3) {
            goto LABEL_73;
          }
        }
LABEL_27:
        a1 = 0;
        goto LABEL_88;
      }
LABEL_59:
      [v9 intValue];
      WRMakeError(8, @"Bad BOOL for %@: %d", v34, v35, v36, v37, v38, v39, (uint64_t)v23);
      goto LABEL_16;
    }
    [v17 doubleValue];
    if (v18 >= 0.0)
    {
      *(double *)(a1 + 48) = v18;
      goto LABEL_13;
    }
LABEL_15:
    WRMakeError(8, @"Bad num for %@: %f", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_16:
    a1 = 0;
    *a3 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_87:
  }
LABEL_88:

  return a1;
}

- (id)validate
{
  id v1 = a1;
  if (a1)
  {
    int v2 = [a1 reportSpindumpForThisThread];
    v3 = [v1 reportSpindumpForThreadWithName];

    if (v2) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
    if (v3) {
      int v5 = v4;
    }
    else {
      int v5 = v2;
    }
    int v6 = [v1 reportSpindumpForMainThread];
    unsigned int v7 = v5 + v6 + [v1 reportSpindumpForThisDispatchQueue];
    id v8 = [v1 reportSpindumpForDispatchQueueWithLabel];

    if (v8) {
      unsigned int v15 = v7 + 1;
    }
    else {
      unsigned int v15 = v7;
    }
    if (v15 >= 2)
    {
      double v16 = @"reporting multiple spindumps from a single diagnostic";
LABEL_19:
      WRMakeError(8, v16, v9, v10, v11, v12, v13, v14, v57);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    if (v15 == 1 && ([v1 gatherTailspin] & 1) == 0)
    {
      double v16 = @"reporting spindump, but not gathering tailspin";
      goto LABEL_19;
    }
    v17 = [v1 reportProcessesWithName];

    if (v17)
    {
      if ([v1 reportSpindumpForThisThread])
      {
        double v18 = [v1 reportProcessesWithName];
        WRMakeError(8, @"Cannot report spindump for this thread, but in a specified process %@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
LABEL_22:
        id v1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

        goto LABEL_45;
      }
      if ([v1 reportSpindumpForThisDispatchQueue])
      {
        double v18 = [v1 reportProcessesWithName];
        WRMakeError(8, @"Cannot report spindump for this dispatch queue, but in a specified process %@", v25, v26, v27, v28, v29, v30, (uint64_t)v18);
        goto LABEL_22;
      }
    }
    v31 = [v1 reportSpindumpForThreadWithName];
    double v18 = v31;
    if (v31
      && [v31 hasPrefix:@"^"]
      && [v18 hasSuffix:@"$"])
    {
      id v59 = 0;
      v32 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v18 options:0 error:&v59];
      id v39 = v59;
      if (!v32)
      {
        WRMakeError(8, @"Invalid thread name regex \"%@\": %@", v33, v34, v35, v36, v37, v38, (uint64_t)v18);
        goto LABEL_42;
      }
    }
    v40 = [v1 reportSpindumpForDispatchQueueWithLabel];
    id v39 = v40;
    if (v40
      && [v40 hasPrefix:@"^"]
      && [v39 hasSuffix:@"$"])
    {
      id v58 = 0;
      v41 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v39 options:0 error:&v58];
      id v48 = v58;
      if (!v41)
      {
        WRMakeError(8, @"Invalid dispatch queue label regex \"%@\": %@", v42, v43, v44, v45, v46, v47, (uint64_t)v39);
        id v1 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_43;
      }
    }
    if ([v1 gatherTailspin])
    {
      if (([v1 hasTriggerThresholdDurationSum] & 1) != 0
        || ([v1 hasTriggerThresholdDurationUnion] & 1) != 0
        || ([v1 hasTriggerThresholdDurationSingle] & 1) != 0
        || ([v1 hasTriggerThresholdCount] & 1) != 0
        || ([v1 triggerEventTimeout] & 1) != 0)
      {
        id v1 = 0;
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v55 = @"no threshold for diagnostic";
    }
    else
    {
      uint64_t v55 = @"no diagnostics enabled";
    }
    WRMakeError(3, v55, v49, v50, v51, v52, v53, v54, v57);
LABEL_42:
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
LABEL_45:

  return v1;
}

+ (id)diagnosticsWithDict:(void *)a3 backupName:(uint64_t *)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = -[WRDiagnostic initWithDict:backupName:error:]([WRDiagnostic alloc], v7, v6, a4);

  return v8;
}

- (WRDiagnostic)initWithEncodedDict:(id)a3 error:(id *)a4
{
  return (WRDiagnostic *)-[WRDiagnostic initWithDict:backupName:error:](self, a3, 0, (uint64_t *)a4);
}

- (id)encodedDict
{
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  int v4 = [(WRDiagnostic *)self name];
  int v5 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"name", 0);

  if ([(WRDiagnostic *)self hasTriggerThresholdCount])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[WRDiagnostic triggerThresholdCount](self, "triggerThresholdCount"));
    [v5 setObject:v6 forKeyedSubscript:@"trigger_threshold_count"];
  }
  if ([(WRDiagnostic *)self hasTriggerThresholdDurationUnion])
  {
    id v7 = NSNumber;
    [(WRDiagnostic *)self triggerThresholdDurationUnion];
    id v8 = objc_msgSend(v7, "numberWithDouble:");
    [v5 setObject:v8 forKeyedSubscript:@"trigger_threshold_duration_union"];
  }
  if ([(WRDiagnostic *)self hasTriggerThresholdDurationUnion])
  {
    uint64_t v9 = NSNumber;
    [(WRDiagnostic *)self triggerThresholdDurationUnion];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    [v5 setObject:v10 forKeyedSubscript:@"trigger_threshold_duration_union"];
  }
  if ([(WRDiagnostic *)self hasTriggerThresholdDurationSingle])
  {
    uint64_t v11 = NSNumber;
    [(WRDiagnostic *)self triggerThresholdDurationSingle];
    uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
    [v5 setObject:v12 forKeyedSubscript:@"trigger_threshold_duration_single"];
  }
  if ([(WRDiagnostic *)self triggerEventTimeout]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"trigger_event_timeout"];
  }
  if ([(WRDiagnostic *)self gatherTailspin]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"gather_tailspin"];
  }
  if ([(WRDiagnostic *)self tailspinIncludeOSLogs]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"option_tailspin_includes_oslogs"];
  }
  if ([(WRDiagnostic *)self reportSpindumpForThisThread]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"report_spindump_this_thread"];
  }
  uint64_t v13 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];

  if (v13)
  {
    uint64_t v14 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];
    [v5 setObject:v14 forKeyedSubscript:@"report_spindump_thread_name"];
  }
  if ([(WRDiagnostic *)self reportSpindumpForMainThread]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"report_spindump_main_thread"];
  }
  if ([(WRDiagnostic *)self reportSpindumpForThisDispatchQueue]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"report_spindump_this_dispatchqueue"];
  }
  unsigned int v15 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];

  if (v15)
  {
    double v16 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];
    [v5 setObject:v16 forKeyedSubscript:@"report_spindump_dispatchqueue_label"];
  }
  v17 = [(WRDiagnostic *)self reportOtherSignpostWithName];

  if (v17)
  {
    double v18 = [(WRDiagnostic *)self reportOtherSignpostWithName];
    [v5 setObject:v18 forKeyedSubscript:@"option_report_other_signpost"];
  }
  uint64_t v19 = [(WRDiagnostic *)self reportProcessesWithName];

  if (v19)
  {
    uint64_t v20 = [(WRDiagnostic *)self reportProcessesWithName];
    [v5 setObject:v20 forKeyedSubscript:@"option_report_other_processes"];
  }
  if ([(WRDiagnostic *)self reportOmittingNetworkBoundIntervals]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"option_report_omit_network_bound_intervals"];
  }
  uint64_t v21 = (void *)[v5 copy];

  return v21;
}

- (BOOL)hasAnySpindumpReports
{
  if ([(WRDiagnostic *)self reportSpindumpForThisThread]) {
    return 1;
  }
  int v4 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];
  if (v4
    || [(WRDiagnostic *)self reportSpindumpForMainThread]
    || [(WRDiagnostic *)self reportSpindumpForThisDispatchQueue])
  {
    BOOL v3 = 1;
  }
  else
  {
    id v6 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];
    BOOL v3 = v6 != 0;
  }
  return v3;
}

- (id)isValidForWorkflow
{
  if (a1)
  {
    int v2 = a1;
    if ([a1 hasTriggerThresholdCount])
    {
      uint64_t v9 = @"diagnostic count threshold is invalid for the workflow";
    }
    else if ([v2 hasTriggerThresholdDurationSum])
    {
      uint64_t v9 = @"diagnostic interval sum threshold is invalid for the workflow";
    }
    else
    {
      if (![v2 hasTriggerThresholdDurationUnion])
      {
        a1 = -[WRDiagnostic validate](v2);
        goto LABEL_9;
      }
      uint64_t v9 = @"diagnostic interval union threshold is invalid for the workflow";
    }
    a1 = WRMakeError(8, v9, v3, v4, v5, v6, v7, v8, v11);
LABEL_9:
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)isValidForSignpost
{
  if (a1)
  {
    int v2 = a1;
    if ([a1 triggerEventTimeout])
    {
      uint64_t v9 = @"diagnostic event timeout threshold is invalid for signposts";
    }
    else
    {
      if (![v2 reportOmittingNetworkBoundIntervals])
      {
        a1 = -[WRDiagnostic validate](v2);
        goto LABEL_8;
      }
      uint64_t v9 = @"omitting network bound intervals is invalid for signposts";
    }
    a1 = WRMakeError(8, v9, v3, v4, v5, v6, v7, v8, v11);
LABEL_8:
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)diagnosticsForWorkflowName:(void *)a3 signpostName:(void *)a4 diagnosticDicts:(char)a5 diagnosticsEnabled:(int)a6 checkForOverrides:(uint64_t *)a7 error:
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v141 = a2;
  id v11 = a3;
  id v12 = a4;
  self;
  uint64_t v156 = 0;
  if (a7) {
    *a7 = 0;
  }
  else {
    a7 = &v156;
  }
  if ([v12 count] == 1)
  {
    uint64_t v13 = v141;
    if (v11) {
      uint64_t v13 = v11;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v152 objects:v168 count:16];
  v139 = v16;
  id v140 = v14;
  if (v17)
  {
    uint64_t v18 = v17;
    unint64_t v19 = 0x265589000uLL;
    uint64_t v20 = *(void *)v153;
    v138 = a7;
    int v134 = a6;
    uint64_t v132 = *(void *)v153;
    do
    {
      uint64_t v21 = 0;
      uint64_t v133 = v18;
      do
      {
        if (*(void *)v153 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v137 = v21;
        uint64_t v22 = +[WRDiagnostic diagnosticsWithDict:backupName:error:](*(void *)(v19 + 640), *(void **)(*((void *)&v152 + 1) + 8 * v21), v14, a7);
        uint64_t v23 = v22;
        if (!v22) {
          goto LABEL_112;
        }
        if (v11) {
          -[WRDiagnostic isValidForSignpost](v22);
        }
        else {
          -[WRDiagnostic isValidForWorkflow](v22);
        }
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        *a7 = (uint64_t)v24;
        if (v24) {
          goto LABEL_112;
        }
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v25 = v15;
        id v26 = v15;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v148 objects:v167 count:16];
        if (!v27) {
          goto LABEL_27;
        }
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v149;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v149 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = [*(id *)(*((void *)&v148 + 1) + 8 * i) name];
            v32 = [v23 name];
            int v33 = [v31 isEqualToString:v32];

            if (v33)
            {
              v117 = [v23 name];
              WRMakeError(8, @"Multiple diagnostics with name %@", v118, v119, v120, v121, v122, v123, (uint64_t)v117);
              uint64_t *v138 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

              id v16 = v139;
              id v14 = v140;
              id v15 = v25;
LABEL_112:

              v124 = 0;
              goto LABEL_118;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v148 objects:v167 count:16];
        }
        while (v28);
LABEL_27:

        a6 = v134;
        if (!v134) {
          goto LABEL_41;
        }
        uint64_t v34 = [v23 name];
        if (v11)
        {
          uint64_t v147 = 0;
          uint64_t v35 = (id *)&v147;
          WROverrideDiagnosticForSignpost(v141, v11, v34, &v147);
        }
        else
        {
          uint64_t v146 = 0;
          uint64_t v35 = (id *)&v146;
          WROverrideDiagnosticForWorkflow(v141, v34, &v146);
        uint64_t v36 = };
        id v37 = *v35;

        if (!v36)
        {
          if (v37)
          {
            id v51 = v11;
            int v52 = *__error();
            uint64_t v53 = _wrlog();
            BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_FAULT);
            if (v11)
            {
              if (v54)
              {
                uint64_t v55 = [v23 name];
                uint64_t v56 = [v37 description];
                *(_DWORD *)buf = 138544130;
                id v158 = v141;
                __int16 v159 = 2114;
                id v160 = v11;
                __int16 v161 = 2114;
                v162 = v55;
                __int16 v163 = 2114;
                v164 = v56;
                uint64_t v57 = v53;
                id v58 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override settings: %{public}@";
                uint32_t v59 = 42;
                goto LABEL_82;
              }
            }
            else if (v54)
            {
              uint64_t v55 = [v23 name];
              uint64_t v56 = [v37 description];
              *(_DWORD *)buf = 138543874;
              id v158 = v141;
              __int16 v159 = 2114;
              id v160 = v55;
              __int16 v161 = 2114;
              v162 = v56;
              uint64_t v57 = v53;
              id v58 = "%{public}@: diagnostic %{public}@: invalid override settings: %{public}@";
              uint32_t v59 = 32;
LABEL_82:
              _os_log_fault_impl(&dword_261964000, v57, OS_LOG_TYPE_FAULT, v58, buf, v59);

              a6 = v134;
            }

            *__error() = v52;
            uint64_t v23 = 0;
          }
          else
          {
LABEL_41:
            if (a5)
            {
              uint64_t v36 = 0;
              id v37 = 0;
              id v15 = v25;
              a7 = v138;
              goto LABEL_71;
            }

            uint64_t v23 = 0;
            id v37 = 0;
          }
          uint64_t v36 = 0;
          id v15 = v25;
          a7 = v138;
          uint64_t v91 = v133;
          goto LABEL_73;
        }
        uint64_t v38 = (void *)[v23 copy];
        id v145 = v37;
        int v39 = -[WRDiagnostic applyDict:error:]((uint64_t)v38, v36, (uint64_t *)&v145);
        id v130 = v145;

        if (!v39)
        {
          v129 = v38;
          id v60 = v11;
          int v61 = *__error();
          v62 = _wrlog();
          BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_FAULT);
          id v15 = v25;
          if (v11)
          {
            a7 = v138;
            if (v63)
            {
              [v23 name];
              v64 = v127 = v36;
              v65 = [v130 description];
              *(_DWORD *)buf = 138544386;
              id v158 = v141;
              __int16 v159 = 2114;
              id v160 = v11;
              __int16 v161 = 2114;
              v162 = v64;
              __int16 v163 = 2114;
              v164 = v65;
              __int16 v165 = 2114;
              v166 = v127;
              v66 = v62;
              v67 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
              uint32_t v68 = 52;
              goto LABEL_80;
            }
          }
          else
          {
            a7 = v138;
            if (v63)
            {
              [v23 name];
              v64 = v127 = v36;
              v65 = [v130 description];
              *(_DWORD *)buf = 138544130;
              id v158 = v141;
              __int16 v159 = 2114;
              id v160 = v64;
              __int16 v161 = 2114;
              v162 = v65;
              __int16 v163 = 2114;
              v164 = v127;
              v66 = v62;
              v67 = "%{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
              uint32_t v68 = 42;
LABEL_80:
              _os_log_fault_impl(&dword_261964000, v66, OS_LOG_TYPE_FAULT, v67, buf, v68);

              a6 = v134;
              uint64_t v36 = v127;
            }
          }

          *__error() = v61;
          id v82 = 0;
LABEL_56:
          uint64_t v38 = v129;
          id v37 = v130;
          goto LABEL_70;
        }
        id v15 = v25;
        if (!v11)
        {
          uint64_t v69 = -[WRDiagnostic isValidForWorkflow](v38);

          v41 = (void *)v69;
          a7 = v138;
          if (v69) {
            goto LABEL_48;
          }
          int v43 = *__error();
          uint64_t v44 = _wrlog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            [v23 name];
            uint64_t v45 = v131 = v43;
            [v23 debugDescription];
            uint64_t v46 = v126 = v36;
            uint64_t v47 = [v38 debugDescription];
            *(_DWORD *)buf = 138544130;
            id v158 = v141;
            __int16 v159 = 2114;
            id v160 = v45;
            __int16 v161 = 2114;
            v162 = v46;
            __int16 v163 = 2114;
            v164 = v47;
            id v48 = v44;
            uint64_t v49 = "%{public}@: diagnostic %{public}@: applied override: %{public}@ -> %{public}@";
            uint32_t v50 = 42;
LABEL_68:
            _os_log_impl(&dword_261964000, v48, OS_LOG_TYPE_INFO, v49, buf, v50);

            a6 = v134;
            uint64_t v36 = v126;

            int v43 = v131;
          }
LABEL_69:

          *__error() = v43;
          id v82 = v38;
          id v37 = 0;
          goto LABEL_70;
        }
        uint64_t v40 = -[WRDiagnostic isValidForSignpost](v38);

        v41 = (void *)v40;
        a7 = v138;
        if (!v40)
        {
          id v42 = v11;
          int v43 = *__error();
          uint64_t v44 = _wrlog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            [v23 name];
            uint64_t v45 = v131 = v43;
            [v23 debugDescription];
            uint64_t v46 = v126 = v36;
            uint64_t v47 = [v38 debugDescription];
            *(_DWORD *)buf = 138544386;
            id v158 = v141;
            __int16 v159 = 2114;
            id v160 = v11;
            __int16 v161 = 2114;
            v162 = v45;
            __int16 v163 = 2114;
            v164 = v46;
            __int16 v165 = 2114;
            v166 = v47;
            id v48 = v44;
            uint64_t v49 = "%{public}@: %{public}@: diagnostic %{public}@: applied override: %{public}@ -> %{public}@";
            uint32_t v50 = 52;
            goto LABEL_68;
          }
          goto LABEL_69;
        }
LABEL_48:
        v70 = [v41 domain];
        v129 = v38;
        id v130 = v41;
        if (![v70 isEqualToString:@"WorkflowResponsivenessError"])
        {

          goto LABEL_58;
        }
        uint64_t v71 = [v41 code];
        v72 = v36;
        uint64_t v73 = v71;

        BOOL v74 = v73 == 3;
        uint64_t v36 = v72;
        if (v74)
        {
          int v75 = *__error();
          v76 = _wrlog();
          BOOL v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v77)
            {
              v78 = [v23 name];
              *(_DWORD *)buf = 138543874;
              id v158 = v141;
              __int16 v159 = 2114;
              id v160 = v11;
              __int16 v161 = 2114;
              v162 = v78;
              v79 = v76;
              v80 = "%{public}@: %{public}@: diagnostic %{public}@: disabled via override";
              uint32_t v81 = 32;
              goto LABEL_77;
            }
          }
          else if (v77)
          {
            v78 = [v23 name];
            *(_DWORD *)buf = 138543618;
            id v158 = v141;
            __int16 v159 = 2114;
            id v160 = v78;
            v79 = v76;
            v80 = "%{public}@: diagnostic %{public}@: disabled via override";
            uint32_t v81 = 22;
LABEL_77:
            _os_log_impl(&dword_261964000, v79, OS_LOG_TYPE_DEFAULT, v80, buf, v81);

            uint64_t v36 = v72;
          }

          id v82 = 0;
          *__error() = v75;
          goto LABEL_56;
        }
LABEL_58:
        int v83 = *__error();
        v84 = _wrlog();
        BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_FAULT);
        if (v11)
        {
          id v37 = v130;
          if (v85)
          {
            [v23 name];
            v86 = v128 = v36;
            v87 = [v130 description];
            *(_DWORD *)buf = 138544386;
            id v158 = v141;
            __int16 v159 = 2114;
            id v160 = v11;
            __int16 v161 = 2114;
            v162 = v86;
            __int16 v163 = 2114;
            v164 = v87;
            __int16 v165 = 2114;
            v166 = v128;
            v88 = v84;
            v89 = "%{public}@: %{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
            uint32_t v90 = 52;
            goto LABEL_84;
          }
        }
        else
        {
          id v37 = v130;
          if (v85)
          {
            [v23 name];
            v86 = v128 = v36;
            v87 = [v130 description];
            *(_DWORD *)buf = 138544130;
            id v158 = v141;
            __int16 v159 = 2114;
            id v160 = v86;
            __int16 v161 = 2114;
            v162 = v87;
            __int16 v163 = 2114;
            v164 = v128;
            v88 = v84;
            v89 = "%{public}@: diagnostic %{public}@: invalid override dict: %{public}@\n%{public}@";
            uint32_t v90 = 42;
LABEL_84:
            _os_log_fault_impl(&dword_261964000, v88, OS_LOG_TYPE_FAULT, v89, buf, v90);

            id v37 = v130;
            uint64_t v36 = v128;
          }
        }

        id v82 = 0;
        *__error() = v83;
        uint64_t v38 = v129;
LABEL_70:

        uint64_t v23 = v82;
LABEL_71:
        uint64_t v91 = v133;
        if (v23) {
          [v26 addObject:v23];
        }
LABEL_73:

        uint64_t v21 = v137 + 1;
        id v16 = v139;
        id v14 = v140;
        unint64_t v19 = 0x265589000;
        uint64_t v20 = v132;
      }
      while (v137 + 1 != v91);
      uint64_t v92 = [v139 countByEnumeratingWithState:&v152 objects:v168 count:16];
      uint64_t v18 = v92;
    }
    while (v92);
  }
  v93 = v15;

  if (!a6) {
    goto LABEL_114;
  }
  uint64_t v94 = 1;
  unint64_t v95 = 0x263F08000uLL;
  while (1)
  {
    v96 = objc_msgSend(objc_alloc(*(Class *)(v95 + 2880)), "initWithFormat:", @"%u", v94);
    if (v11)
    {
      uint64_t v144 = 0;
      v97 = (id *)&v144;
      WROverrideDiagnosticForSignpost(v141, v11, v96, &v144);
    }
    else
    {
      uint64_t v143 = 0;
      v97 = (id *)&v143;
      WROverrideDiagnosticForWorkflow(v141, v96, &v143);
    v98 = };
    id v99 = *v97;
    v100 = v99;
    if (!v98) {
      break;
    }
    id v142 = v99;
    +[WRDiagnostic diagnosticsWithDict:backupName:error:]((uint64_t)WRDiagnostic, v98, v96, (uint64_t *)&v142);
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    id v102 = v142;

    if (!v101)
    {
      id v110 = v11;
      int v111 = *__error();
      v112 = _wrlog();
      BOOL v113 = os_log_type_enabled(v112, OS_LOG_TYPE_FAULT);
      if (v11)
      {
        if (v113)
        {
          v135 = [v102 description];
          *(_DWORD *)buf = 138544386;
          id v158 = v141;
          __int16 v159 = 2114;
          id v160 = v11;
          __int16 v161 = 2114;
          v162 = v96;
          __int16 v163 = 2114;
          v164 = v135;
          __int16 v165 = 2114;
          v166 = v98;
          v114 = v112;
          v115 = "%{public}@: %{public}@: diagnostic %{public}@: invalid new dict: %{public}@\n%{public}@";
          uint32_t v116 = 52;
          goto LABEL_110;
        }
      }
      else if (v113)
      {
        v135 = [v102 description];
        *(_DWORD *)buf = 138544130;
        id v158 = v141;
        __int16 v159 = 2114;
        id v160 = v96;
        __int16 v161 = 2114;
        v162 = v135;
        __int16 v163 = 2114;
        v164 = v98;
        v114 = v112;
        v115 = "%{public}@: diagnostic %{public}@: invalid new dict: %{public}@\n%{public}@";
        uint32_t v116 = 42;
LABEL_110:
        _os_log_fault_impl(&dword_261964000, v114, OS_LOG_TYPE_FAULT, v115, buf, v116);
      }
      *__error() = v111;

      unint64_t v95 = 0x263F08000;
      goto LABEL_105;
    }
    [v93 addObject:v101];
LABEL_105:

    uint64_t v94 = (v94 + 1);
    if (v94 == 100) {
      goto LABEL_114;
    }
  }
  if (v99)
  {
    id v101 = v11;
    int v103 = *__error();
    v104 = _wrlog();
    BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_FAULT);
    if (v11)
    {
      if (v105)
      {
        v106 = [v100 description];
        *(_DWORD *)buf = 138544130;
        id v158 = v141;
        __int16 v159 = 2114;
        id v160 = v11;
        __int16 v161 = 2114;
        v162 = v96;
        __int16 v163 = 2114;
        v164 = v106;
        v107 = v104;
        v108 = "%{public}@: %{public}@: diagnostic %{public}@: invalid new settings: %{public}@";
        uint32_t v109 = 42;
LABEL_108:
        _os_log_fault_impl(&dword_261964000, v107, OS_LOG_TYPE_FAULT, v108, buf, v109);

        unint64_t v95 = 0x263F08000;
      }
    }
    else if (v105)
    {
      v106 = [v100 description];
      *(_DWORD *)buf = 138543874;
      id v158 = v141;
      __int16 v159 = 2114;
      id v160 = v96;
      __int16 v161 = 2114;
      v162 = v106;
      v107 = v104;
      v108 = "%{public}@: diagnostic %{public}@: invalid new settings: %{public}@";
      uint32_t v109 = 32;
      goto LABEL_108;
    }

    *__error() = v103;
    id v102 = v100;
    goto LABEL_105;
  }

LABEL_114:
  id v15 = v93;
  if ([v93 count])
  {
    [v93 sortUsingComparator:&__block_literal_global_3];
    v124 = (void *)[v93 copy];
  }
  else
  {
    v124 = 0;
  }
  id v16 = v139;
  id v14 = v140;
LABEL_118:

  return v124;
}

uint64_t __115__WRDiagnostic_diagnosticsForWorkflowName_signpostName_diagnosticDicts_diagnosticsEnabled_checkForOverrides_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[WRDiagnostic allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_name copy];
  name = v4->_name;
  v4->_name = (NSString *)v5;

  v4->_triggerThresholdDurationSum = self->_triggerThresholdDurationSum;
  v4->_triggerThresholdDurationUnion = self->_triggerThresholdDurationUnion;
  v4->_triggerThresholdDurationSingle = self->_triggerThresholdDurationSingle;
  v4->_triggerThresholdCount = self->_triggerThresholdCount;
  v4->_triggerEventTimeout = self->_triggerEventTimeout;
  v4->_gatherTailspin = self->_gatherTailspin;
  v4->_tailspinIncludeOSLogs = self->_tailspinIncludeOSLogs;
  v4->_reportSpindumpForThisThread = self->_reportSpindumpForThisThread;
  uint64_t v7 = [(NSString *)self->_reportSpindumpForThreadWithName copy];
  reportSpindumpForThreadWithName = v4->_reportSpindumpForThreadWithName;
  v4->_reportSpindumpForThreadWithName = (NSString *)v7;

  v4->_reportSpindumpForMainThread = self->_reportSpindumpForMainThread;
  v4->_reportSpindumpForThisDispatchQueue = self->_reportSpindumpForThisDispatchQueue;
  uint64_t v9 = [(NSString *)self->_reportSpindumpForDispatchQueueWithLabel copy];
  reportSpindumpForDispatchQueueWithLabel = v4->_reportSpindumpForDispatchQueueWithLabel;
  v4->_reportSpindumpForDispatchQueueWithLabel = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_reportOtherSignpostWithName copy];
  reportOtherSignpostWithName = v4->_reportOtherSignpostWithName;
  v4->_reportOtherSignpostWithName = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_reportProcessesWithName copy];
  reportProcessesWithName = v4->_reportProcessesWithName;
  v4->_reportProcessesWithName = (NSString *)v13;

  v4->_reportOmittingNetworkBoundIntervals = self->_reportOmittingNetworkBoundIntervals;
  return v4;
}

- (BOOL)hasTriggerThresholdDurationSum
{
  [(WRDiagnostic *)self triggerThresholdDurationSum];
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdDurationUnion
{
  [(WRDiagnostic *)self triggerThresholdDurationUnion];
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdDurationSingle
{
  [(WRDiagnostic *)self triggerThresholdDurationSingle];
  return v2 != 0.0;
}

- (BOOL)hasTriggerThresholdCount
{
  return [(WRDiagnostic *)self triggerThresholdCount] != 0;
}

- (id)debugDescription
{
  double v2 = (void *)[[NSString alloc] initWithFormat:@"name:%@\ntriggerThresholdDurationSum:%f\ntriggerThresholdDurationUnion:%f\ntriggerThresholdDurationSingle:%f\ntriggerThresholdCount:%u\ntriggerEventTimeout:%u\ngatherTailspin:%u\ntailspinIncludeOSLogs:%u\nreportSpindumpForThisThread:%u\nreportSpindumpForThreadWithName:%@\nreportSpindumpForMainThread:%u\nreportSpindumpForThisDispatchQueue:%u\nreportSpindumpForDispatchQueueWithLabel:%@\nreportOtherSignpostWithName:%@\nreportProcessesWithName:%@\nreportOmittingNetworkBoundIntervals:%u\n", self->_name, *(void *)&self->_triggerThresholdDurationSum, *(void *)&self->_triggerThresholdDurationUnion, *(void *)&self->_triggerThresholdDurationSingle, self->_triggerThresholdCount, self->_triggerEventTimeout, self->_gatherTailspin, self->_tailspinIncludeOSLogs, self->_reportSpindumpForThisThread, self->_reportSpindumpForThreadWithName, self->_reportSpindumpForMainThread, self->_reportSpindumpForThisDispatchQueue, self->_reportSpindumpForDispatchQueueWithLabel, self->_reportOtherSignpostWithName, self->_reportProcessesWithName, self->_reportOmittingNetworkBoundIntervals];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (WRDiagnostic *)a3;
  if (self == v6)
  {
    char v25 = 1;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v25 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  [(WRDiagnostic *)self triggerThresholdDurationSum];
  double v9 = v8;
  [(WRDiagnostic *)v7 triggerThresholdDurationSum];
  if (v9 == v10)
  {
    [(WRDiagnostic *)self triggerThresholdDurationUnion];
    double v12 = v11;
    [(WRDiagnostic *)v7 triggerThresholdDurationUnion];
    if (v12 == v13)
    {
      [(WRDiagnostic *)self triggerThresholdDurationSingle];
      double v15 = v14;
      [(WRDiagnostic *)v7 triggerThresholdDurationSingle];
      if (v15 == v16)
      {
        unsigned int v17 = [(WRDiagnostic *)self triggerThresholdCount];
        if (v17 == [(WRDiagnostic *)v7 triggerThresholdCount])
        {
          BOOL v18 = [(WRDiagnostic *)self triggerEventTimeout];
          if (v18 == [(WRDiagnostic *)v7 triggerEventTimeout])
          {
            BOOL v19 = [(WRDiagnostic *)self gatherTailspin];
            if (v19 == [(WRDiagnostic *)v7 gatherTailspin])
            {
              BOOL v20 = [(WRDiagnostic *)self tailspinIncludeOSLogs];
              if (v20 == [(WRDiagnostic *)v7 tailspinIncludeOSLogs])
              {
                BOOL v21 = [(WRDiagnostic *)self reportSpindumpForThisThread];
                if (v21 == [(WRDiagnostic *)v7 reportSpindumpForThisThread])
                {
                  BOOL v22 = [(WRDiagnostic *)self reportSpindumpForMainThread];
                  if (v22 == [(WRDiagnostic *)v7 reportSpindumpForMainThread])
                  {
                    BOOL v23 = [(WRDiagnostic *)self reportSpindumpForThisDispatchQueue];
                    if (v23 == [(WRDiagnostic *)v7 reportSpindumpForThisDispatchQueue])
                    {
                      BOOL v24 = [(WRDiagnostic *)self reportOmittingNetworkBoundIntervals];
                      if (v24 == [(WRDiagnostic *)v7 reportOmittingNetworkBoundIntervals])
                      {
                        uint64_t v27 = [(WRDiagnostic *)self name];
                        uint64_t v28 = [(WRDiagnostic *)v7 name];
                        if (![v27 isEqualToString:v28])
                        {
                          char v25 = 0;
LABEL_68:

                          goto LABEL_15;
                        }
                        uint64_t v29 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];
                        if (v29
                          || ([(WRDiagnostic *)v7 reportSpindumpForThreadWithName],
                              (int v61 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          uint64_t v30 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];
                          if (!v30) {
                            goto LABEL_64;
                          }
                          uint64_t v3 = (void *)v30;
                          uint64_t v31 = [(WRDiagnostic *)v7 reportSpindumpForThreadWithName];
                          if (!v31)
                          {
LABEL_63:

                            goto LABEL_64;
                          }
                          id v4 = (void *)v31;
                          v32 = [(WRDiagnostic *)self reportSpindumpForThreadWithName];
                          uint32_t v59 = [(WRDiagnostic *)v7 reportSpindumpForThreadWithName];
                          id v60 = v32;
                          if ((objc_msgSend(v32, "isEqualToString:") & 1) == 0)
                          {
LABEL_62:

                            goto LABEL_63;
                          }
                          char v58 = 1;
                        }
                        else
                        {
                          int v61 = 0;
                          char v58 = 0;
                        }
                        int v33 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];
                        if (v33
                          || ([(WRDiagnostic *)v7 reportSpindumpForDispatchQueueWithLabel], (uint64_t v56 = objc_claimAutoreleasedReturnValue()) != 0))
                        {
                          uint64_t v57 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];
                          if (!v57)
                          {
                            char v25 = 0;
LABEL_83:
                            if (!v33) {

                            }
                            if (v58)
                            {
                            }
                            goto LABEL_65;
                          }
                          uint64_t v55 = [(WRDiagnostic *)v7 reportSpindumpForDispatchQueueWithLabel];
                          if (v55)
                          {
                            uint64_t v34 = [(WRDiagnostic *)self reportSpindumpForDispatchQueueWithLabel];
                            int v52 = [(WRDiagnostic *)v7 reportSpindumpForDispatchQueueWithLabel];
                            uint64_t v53 = v34;
                            if (objc_msgSend(v34, "isEqualToString:"))
                            {
                              char v51 = 1;
                              goto LABEL_39;
                            }
                          }
                          if (!v33)
                          {

                            goto LABEL_61;
                          }
LABEL_60:

LABEL_61:
                          if (v58) {
                            goto LABEL_62;
                          }
LABEL_64:
                          char v25 = 0;
LABEL_65:
                          if (!v29) {

                          }
                          goto LABEL_68;
                        }
                        uint64_t v56 = 0;
                        char v51 = 0;
LABEL_39:
                        uint64_t v54 = [(WRDiagnostic *)self reportOtherSignpostWithName];
                        if (!v54)
                        {
                          id v48 = [(WRDiagnostic *)v7 reportOtherSignpostWithName];
                          if (!v48)
                          {
                            id v48 = 0;
                            char v44 = 0;
                            goto LABEL_50;
                          }
                        }
                        uint32_t v50 = [(WRDiagnostic *)self reportOtherSignpostWithName];
                        if (!v50)
                        {
                          char v25 = 0;
                          goto LABEL_77;
                        }
                        uint64_t v49 = [(WRDiagnostic *)v7 reportOtherSignpostWithName];
                        if (v49)
                        {
                          uint64_t v35 = [(WRDiagnostic *)self reportOtherSignpostWithName];
                          uint64_t v45 = [(WRDiagnostic *)v7 reportOtherSignpostWithName];
                          uint64_t v46 = v35;
                          if (objc_msgSend(v35, "isEqualToString:"))
                          {
                            char v44 = 1;
LABEL_50:
                            uint64_t v47 = [(WRDiagnostic *)self reportProcessesWithName];
                            if (!v47)
                            {
                              uint64_t v42 = [(WRDiagnostic *)v7 reportProcessesWithName];
                              if (!v42)
                              {
                                uint64_t v42 = 0;
                                char v25 = 1;
                                goto LABEL_74;
                              }
                            }
                            int v43 = [(WRDiagnostic *)self reportProcessesWithName];
                            if (v43)
                            {
                              v41 = [(WRDiagnostic *)v7 reportProcessesWithName];
                              if (v41)
                              {
                                uint64_t v40 = [(WRDiagnostic *)self reportProcessesWithName];
                                id v37 = [(WRDiagnostic *)v7 reportProcessesWithName];
                                char v25 = [v40 isEqualToString:v37];

                                goto LABEL_71;
                              }
                            }
                            char v25 = 0;
LABEL_71:
                            if (v47)
                            {
                              uint64_t v38 = (void *)v47;
LABEL_75:

                              if ((v44 & 1) == 0)
                              {
                                if (!v54)
                                {
                                  int v39 = v48;
LABEL_81:

                                  if (v51)
                                  {
                                  }
                                  goto LABEL_83;
                                }
LABEL_80:
                                int v39 = (void *)v54;
                                goto LABEL_81;
                              }

LABEL_77:
                              if (!v54) {

                              }
                              goto LABEL_80;
                            }
LABEL_74:
                            uint64_t v38 = (void *)v42;
                            goto LABEL_75;
                          }
                        }
                        if (v54) {
                          uint64_t v36 = (void *)v54;
                        }
                        else {
                          uint64_t v36 = v48;
                        }

                        if (v51)
                        {
                        }
                        if (!v33) {

                        }
                        goto LABEL_60;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  char v25 = 0;
LABEL_15:

LABEL_18:
  return v25;
}

- (unint64_t)hash
{
  double v2 = [(WRDiagnostic *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)triggerThresholdDurationSingle
{
  return self->_triggerThresholdDurationSingle;
}

- (BOOL)triggerEventTimeout
{
  return self->_triggerEventTimeout;
}

- (double)triggerThresholdDurationSum
{
  return self->_triggerThresholdDurationSum;
}

- (double)triggerThresholdDurationUnion
{
  return self->_triggerThresholdDurationUnion;
}

- (unsigned)triggerThresholdCount
{
  return self->_triggerThresholdCount;
}

- (BOOL)gatherTailspin
{
  return self->_gatherTailspin;
}

- (BOOL)tailspinIncludeOSLogs
{
  return self->_tailspinIncludeOSLogs;
}

- (BOOL)reportSpindumpForThisThread
{
  return self->_reportSpindumpForThisThread;
}

- (NSString)reportSpindumpForThreadWithName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)reportSpindumpForMainThread
{
  return self->_reportSpindumpForMainThread;
}

- (BOOL)reportSpindumpForThisDispatchQueue
{
  return self->_reportSpindumpForThisDispatchQueue;
}

- (NSString)reportSpindumpForDispatchQueueWithLabel
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)reportOtherSignpostWithName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)reportProcessesWithName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)reportOmittingNetworkBoundIntervals
{
  return self->_reportOmittingNetworkBoundIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportProcessesWithName, 0);
  objc_storeStrong((id *)&self->_reportOtherSignpostWithName, 0);
  objc_storeStrong((id *)&self->_reportSpindumpForDispatchQueueWithLabel, 0);
  objc_storeStrong((id *)&self->_reportSpindumpForThreadWithName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end