@interface SPCalculatorQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
+ (void)enableCalculator:(BOOL)a3;
+ (void)enableConversion:(BOOL)a3;
- (BOOL)isCalculatorQuery;
- (SPCalculatorQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6;
- (void)start;
@end

@implementation SPCalculatorQuery

+ (unsigned)searchDomain
{
  return 3;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return (enableCalculator | enableConversion) != 0;
}

+ (void)enableConversion:(BOOL)a3
{
  enableConversion = a3;
}

+ (void)enableCalculator:(BOOL)a3
{
  enableCalculator = a3;
}

- (SPCalculatorQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)SPCalculatorQuery;
  v6 = [(SPKQuery *)&v12 initWithUserQuery:a3 queryGroupId:a4 options:0 queryContext:a6];
  if (v6)
  {
    qos_class_t v7 = qos_class_self();
    v8 = dispatch_get_global_queue(v7, 2uLL);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("Calculator", 0, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (void)start
{
  v19.receiver = self;
  v19.super_class = (Class)SPCalculatorQuery;
  [(SPKQuery *)&v19 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    v3 = [(SPKQuery *)self userQueryString];
    v4 = [(SPKQuery *)self queryContext];
    v5 = [(SPKQuery *)self delegate];
    uint64_t v6 = [v5 queryIdent];
    qos_class_t v7 = [v5 clientBundleID];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x263F67A58]), "initWithInput:triggerEvent:indexType:queryId:", v3, objc_msgSend(v4, "whyQuery"), 2, v6);
    dispatch_queue_t v9 = [MEMORY[0x263F674B0] sharedProxy];
    [v9 sendFeedbackType:5 feedback:v8 queryId:v6 clientID:v7];

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__SPCalculatorQuery_start__block_invoke;
    block[3] = &unk_264C76868;
    block[4] = self;
    id v15 = v3;
    id v17 = v7;
    uint64_t v18 = v6;
    id v16 = v8;
    id v11 = v7;
    id v12 = v8;
    id v13 = v3;
    dispatch_async(queue, block);
  }
}

void __26__SPCalculatorQuery_start__block_invoke(uint64_t a1)
{
  v30[7] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  [v2 setUsesGroupingSeparator:1];
  [v2 setMaximumIntegerDigits:20];
  [v2 setMaximumFractionDigits:10];
  [v2 setNumberStyle:1];
  uint64_t v3 = MEMORY[0x263EFFA88];
  uint64_t v4 = *MEMORY[0x263F2FCE8];
  v29[0] = *MEMORY[0x263F2FCB0];
  v29[1] = v4;
  v30[0] = MEMORY[0x263EFFA88];
  v30[1] = v2;
  v29[2] = *MEMORY[0x263F2FCA0];
  v5 = [NSNumber numberWithBool:enableConversion];
  v30[2] = v5;
  uint64_t v6 = *MEMORY[0x263F2FCC8];
  v29[3] = *MEMORY[0x263F2FCC0];
  v29[4] = v6;
  v30[3] = v3;
  v30[4] = v3;
  uint64_t v7 = *MEMORY[0x263F2FCA8];
  v29[5] = *MEMORY[0x263F2FCD8];
  v29[6] = v7;
  v30[5] = v3;
  v30[6] = v3;
  v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];

  id location = 0;
  dispatch_queue_t v9 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __26__SPCalculatorQuery_start__block_invoke_2;
  v22 = &unk_264C76840;
  objc_copyWeak(v27, &location);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v23 = v10;
  uint64_t v24 = v11;
  id v12 = *(id *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  id v13 = *(void **)(a1 + 64);
  id v25 = v12;
  v27[1] = v13;
  id v26 = v14;
  id v15 = (void *)MEMORY[0x237DF3D40](&v19);
  id v16 = (void *)MEMORY[0x263F2FD08];
  id v17 = objc_msgSend(*v9, "userQueryString", v19, v20, v21, v22);
  id v18 = (id)[v16 evaluate:v17 options:v8 resultHandler:v15];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

void __26__SPCalculatorQuery_start__block_invoke_2(uint64_t a1, void *a2)
{
  v51[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v5 = [v3 formattedResult];
    if ([v5 length])
    {
      char v6 = [v3 isTrivial];

      if ((v6 & 1) == 0)
      {
        id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
        v8 = [MEMORY[0x263EFF960] systemLocale];
        [v7 setLocale:v8];

        [v7 setNumberStyle:1];
        [v7 setMaximumFractionDigits:10];
        dispatch_queue_t v9 = [v3 formattedResult];
        id v10 = [v7 numberFromString:v9];

        uint64_t v11 = [v7 numberFromString:*(void *)(a1 + 32)];
        id v12 = [v3 formattedResult];
        if (([v12 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
          || ([v10 isEqual:v11] & 1) != 0)
        {

LABEL_7:
          id v13 = [WeakRetained responseHandler];
          v13[2](v13, 0);

LABEL_8:
LABEL_11:

          goto LABEL_12;
        }
        unint64_t v14 = [*(id *)(a1 + 32) length];

        if (v14 < 2) {
          goto LABEL_7;
        }
        uint64_t v15 = [v3 unitType];
        id v16 = [v3 conversions];
        v48 = v10;
        if ([v16 count])
        {
        }
        else
        {
          id v17 = [v3 inputValueAndUnit];

          if (!v17)
          {
            int v19 = 1;
            goto LABEL_18;
          }
        }
        id v18 = objc_opt_new();
        [v18 setNumberStyle:1];
        [v18 setUsesGroupingSeparator:1];
        [v18 setMaximumFractionDigits:2];
        [v3 setNumberFormatter:v18];

        int v19 = 0;
LABEL_18:
        uint64_t v20 = objc_opt_new();
        [v20 beginDictionary];
        v21 = [v3 formattedExpression];
        [v20 encodeObject:v21 withKey:@"SSAttributeCalculatorInput"];

        v22 = [v3 formattedResult];
        v49 = v20;
        [v20 encodeObject:v22 withKey:@"SSAttributeCalculatorOutput"];

        if (v19)
        {
          id v23 = [NSNumber numberWithBool:1];
          [v20 encodeObject:v23 withKey:@"SSAttributeIsCalculation"];
        }
        LODWORD(v45) = v19;
        if (v15 == 16)
        {
          uint64_t v24 = [NSNumber numberWithBool:1];
          [v20 encodeObject:v24 withKey:@"SSAttributeIsCurrencyConversion"];
        }
        objc_msgSend(v20, "endDictionary", v45);
        id v25 = objc_alloc_init(MEMORY[0x263F67480]);
        id v26 = [*(id *)(a1 + 40) queryContext];
        v27 = [v26 getTrimmedSearchString];
        v28 = [@"calculation-" stringByAppendingString:v27];
        [v25 setIdentifier:v28];

        v29 = [*(id *)(a1 + 40) queryContext];
        objc_msgSend(v25, "setQueryId:", objc_msgSend(v29, "queryIdent"));

        [v25 setUserInput:*(void *)(a1 + 32)];
        [v25 setPlacement:3];
        objc_msgSend(v25, "setScore:", 9, 0);
        v30 = [v20 data];
        v31 = (void *)[v30 copy];
        [v25 setAttributeData:v31];

        [v25 setSectionBundleIdentifier:*MEMORY[0x263F78E98]];
        v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v33 = v32;
        if (v46)
        {
          v34 = [v32 localizedStringForKey:@"CALCULATION_SECTION_TITLE" value:&stru_26E92AFF0 table:@"SpotlightServices"];
          [v25 setSectionHeader:v34];

          uint64_t v35 = SSSetTopHitWithReasonString();
          v36 = @"com.apple.calculation";
        }
        else
        {
          v37 = [v32 localizedStringForKey:@"CONVERSION_SECTION_TITLE" value:&stru_26E92AFF0 table:@"SpotlightServices"];
          [v25 setSectionHeader:v37];

          uint64_t v35 = SSSetTopHitWithReasonString();
          v36 = @"com.apple.conversion";
        }
        [v25 setTopHit:v35];
        id v38 = objc_alloc_init(MEMORY[0x263F78D70]);
        [v38 setBundleIdentifier:v36];
        v39 = [v25 sectionHeader];
        [v38 setTitle:v39];

        v51[0] = v25;
        v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
        [v38 setResults:v40];

        id v50 = v38;
        v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
        v41 = objc_msgSend(objc_alloc(MEMORY[0x263F78D80]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 40), "queryGroupId"), v47);
        [v41 setTopHitIsIn:1];
        v42 = [WeakRetained responseHandler];
        ((void (**)(void, void *))v42)[2](v42, v41);

        v43 = (void *)[objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:*(void *)(a1 + 48)];
        v44 = [MEMORY[0x263F674B0] sharedProxy];
        [v44 sendFeedbackType:6 feedback:v43 queryId:*(void *)(a1 + 72) clientID:*(void *)(a1 + 56)];

        id v10 = v48;
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v7 = [WeakRetained responseHandler];
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)isCalculatorQuery
{
  return 1;
}

- (void).cxx_destruct
{
}

@end