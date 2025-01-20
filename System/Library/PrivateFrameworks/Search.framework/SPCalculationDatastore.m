@interface SPCalculationDatastore
+ (void)refreshCurrencyCache;
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPCalculationDatastore

+ (void)refreshCurrencyCache
{
  id v4 = +[Converter currencyCacheLastRefreshDate];
  [v4 timeIntervalSinceReferenceDate];
  if (CFAbsoluteTimeGetCurrent() - v2 > 86400.0)
  {
    v3 = dispatch_get_global_queue(-32768, 0);
    tracing_dispatch_async();
  }
}

- (id)performQuery:(id)a3
{
  id v3 = a3;
  uint64_t v4 = si_tracing_current_span();
  long long v5 = *(_OWORD *)(v4 + 16);
  long long v77 = *(_OWORD *)v4;
  long long v78 = v5;
  uint64_t v79 = *(void *)(v4 + 32);
  uint64_t v6 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v6;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v8;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "-[SPCalculationDatastore performQuery:]";
  si_tracing_log_span_begin();
  v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "QOS %@ performQuery: %d", buf, 0x12u);
  }
  v12 = SPLogForSPLogCategoryTelemetry();
  unsigned int v13 = [v3 externalID];
  if (v13 && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "calculationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = [v3 disabledBundles];
  unsigned __int8 v15 = [v14 containsObject:@"com.apple.calculator"];

  if ((v15 & 1) != 0
    || ([v3 isPeopleSearch] & 1) != 0
    || ([v3 isScopedAppSearch] & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    id v19 = [v3 queryIdent];
    v20 = [v3 queryContext];
    v21 = [v20 searchString];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v83 = sub_10002FEF8;
    v84 = sub_10002FF08;
    id v85 = 0;
    v45 = [[SPCalculationDatastoreToken alloc] initWithStore:self];
    [v3 externalID];
    kdebug_trace();
    id v22 = objc_alloc((Class)SFStartLocalSearchFeedback);
    v23 = [v3 queryContext];
    id v49 = objc_msgSend(v22, "initWithInput:triggerEvent:indexType:queryId:", v21, objc_msgSend(v23, "whyQuery"), 2, v19);

    v24 = +[SPFeedbackProxy sharedProxy];
    id v25 = [v3 queryIdent];
    v26 = [v3 connection];
    v27 = [v26 bundleID];
    [v24 sendFeedbackType:5 feedback:v49 queryId:v25 clientID:v27];

    __uint64_t v28 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    dispatch_group_t v29 = dispatch_group_create();
    long long v30 = *(_OWORD *)(v4 + 16);
    long long v74 = *(_OWORD *)v4;
    long long v75 = v30;
    uint64_t v76 = *(void *)(v4 + 32);
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10002FF10;
    v65[3] = &unk_100093100;
    long long v70 = v74;
    long long v71 = v30;
    uint64_t v72 = v76;
    id v47 = v21;
    id v66 = v47;
    dispatch_group_t group = v29;
    dispatch_group_t v67 = group;
    id v31 = v3;
    id v73 = v19;
    id v68 = v31;
    v69 = buf;
    v48 = objc_retainBlock(v65);
    v32 = objc_opt_new();
    v33 = +[NSLocale autoupdatingCurrentLocale];
    [v32 setLocale:v33];

    [v32 setUsesGroupingSeparator:1];
    [v32 setMaximumIntegerDigits:20];
    [v32 setMaximumFractionDigits:10];
    [v32 setNumberStyle:1];
    v80[0] = CalculateKeyAllowPartialExpressions;
    v80[1] = CalculateKeyNumberFormatter;
    v81[0] = &__kCFBooleanTrue;
    v81[1] = v32;
    v80[2] = CalculateKeyAllowConversions;
    v34 = [v31 disabledBundles];
    unsigned int v35 = [v34 containsObject:@"com.apple.conversion"];
    v36 = &__kCFBooleanFalse;
    if (!v35) {
      v36 = &__kCFBooleanTrue;
    }
    v81[2] = v36;
    v81[3] = &__kCFBooleanTrue;
    v80[3] = CalculateKeyAutoScientificNotation;
    v80[4] = CalculateKeyConvertTrivial;
    v81[4] = &__kCFBooleanTrue;
    v81[5] = &__kCFBooleanTrue;
    v80[5] = CalculateKeyIgnoreProbableSearches;
    v80[6] = CalculateKeyAllowEqualSign;
    v81[6] = &__kCFBooleanTrue;
    v46 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:7];

    dispatch_group_enter(group);
    id v37 = +[Calculate evaluate:v47 options:v46 resultHandler:v48];
    id location = 0;
    objc_initWeak(&location, v31);
    v38 = +[SDController workQueue];
    qos_class_t v39 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030748;
    block[3] = &unk_100093128;
    long long v60 = v74;
    long long v61 = v75;
    uint64_t v62 = v76;
    objc_copyWeak(&v59, &location);
    __uint64_t v63 = v28;
    v40 = v45;
    v41 = v31;
    v42 = v40;
    v54 = v40;
    v55 = self;
    v58 = buf;
    id v56 = v49;
    id v57 = v41;
    id v52 = v49;
    dispatch_block_t v43 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v39, 0, block);
    dispatch_group_notify(group, v38, v43);

    v44 = v57;
    v16 = v42;

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
  si_tracing_log_span_end();
  long long v17 = v78;
  *(_OWORD *)uint64_t v4 = v77;
  *(_OWORD *)(v4 + 16) = v17;
  *(void *)(v4 + 32) = v79;

  return v16;
}

- (unsigned)domain
{
  return 3;
}

@end