@interface MTMetricsUtils
- (id)metricsBuyParamsStringWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 callerSuppliedBuyParams:(id)a6;
@end

@implementation MTMetricsUtils

- (id)metricsBuyParamsStringWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 callerSuppliedBuyParams:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MTObject *)self metricsKit];
  v15 = [v14 config];
  v16 = [v15 sources];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke;
  v23[3] = &unk_264310BB0;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  v27 = self;
  id v28 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  v21 = [v16 thenWithBlock:v23];

  return v21;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke(id *a1)
{
  v2 = [[MTCallerSuppliedFields alloc] initWithPageId:a1[4] pageType:a1[5] pageContext:a1[6] eventData:0];
  v3 = [a1[7] metricsKit];
  v4 = [v3 eventHandlers];
  v5 = [v4 page];

  uint64_t v6 = [v5 pageHistory:v2];
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
  }
  else
  {
    id v10 = +[MTPromise promiseWithResult:v9];
  }
  id v11 = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_2;
  v15[3] = &unk_264310B88;
  v15[4] = a1[7];
  v16 = v2;
  id v17 = a1[4];
  id v18 = a1[5];
  id v19 = a1[6];
  id v20 = a1[8];
  id v12 = v2;
  id v13 = [v11 thenWithBlock:v15];

  return v13;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_2(uint64_t a1, void *a2)
{
  v66[16] = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 count];
  v62 = v3;
  if (v4 > 1) {
    [v3 objectAtIndexedSubscript:v4 - 2];
  }
  else {
  v63 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = [*(id *)(a1 + 32) metricsKit];
  uint64_t v6 = [v5 eventHandlers];
  v7 = [v6 base];

  v65[0] = @"mtApp";
  uint64_t v8 = [v7 app:*(void *)(a1 + 40)];
  id v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  }
  v50 = (void *)v8;
  v66[0] = v8;
  v65[1] = @"mtEventTime";
  v59 = objc_msgSend(MEMORY[0x263EFF910], "mt_millisecondsSince1970");
  v66[1] = v59;
  v65[2] = @"mtHardwareFamily";
  uint64_t v10 = [v7 hardwareFamily:*(void *)(a1 + 40)];
  id v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  }
  v49 = (void *)v10;
  v66[2] = v10;
  v65[3] = @"mtHardwareModel";
  uint64_t v12 = [v7 hardwareModel:*(void *)(a1 + 40)];
  id v13 = (void *)v12;
  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
  }
  v48 = (void *)v12;
  v66[3] = v12;
  v65[4] = @"mtHostApp";
  uint64_t v14 = [v7 hostApp:*(void *)(a1 + 40)];
  v15 = (void *)v14;
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  }
  v47 = (void *)v14;
  v66[4] = v14;
  v65[5] = @"mtHostAppVersion";
  uint64_t v16 = [v7 hostAppVersion:*(void *)(a1 + 40)];
  v55 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
  }
  v46 = (void *)v16;
  v66[5] = v16;
  v65[6] = @"mtOs";
  uint64_t v17 = [v7 os:*(void *)(a1 + 40)];
  id v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
  }
  v57 = v13;
  v45 = (void *)v17;
  v66[6] = v17;
  v65[7] = @"mtOsBuildNumber";
  uint64_t v19 = [v7 osBuildNumber:*(void *)(a1 + 40)];
  v53 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  v44 = (void *)v19;
  v66[7] = v19;
  v65[8] = @"mtOsVersion";
  uint64_t v20 = [v7 osVersion:*(void *)(a1 + 40)];
  v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  v56 = v15;
  v43 = (void *)v20;
  v66[8] = v20;
  v65[9] = @"mtPageId";
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v51 = v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x263EFF9D0] null];
  }
  v42 = (void *)v22;
  v66[9] = v22;
  v65[10] = @"mtPageType";
  uint64_t v23 = *(void *)(a1 + 56);
  uint64_t v24 = v23;
  if (!v23)
  {
    uint64_t v24 = [MEMORY[0x263EFF9D0] null];
  }
  v54 = v18;
  v58 = v11;
  v60 = v9;
  v41 = (void *)v24;
  v66[10] = v24;
  v65[11] = @"mtPageContext";
  uint64_t v25 = *(void *)(a1 + 64);
  uint64_t v26 = v25;
  if (!v25)
  {
    uint64_t v26 = [MEMORY[0x263EFF9D0] null];
  }
  v40 = (void *)v26;
  v66[11] = v26;
  v65[12] = @"mtTopic";
  v27 = [*(id *)(a1 + 32) metricsKit];
  uint64_t v28 = [v27 topic];
  v29 = (void *)v28;
  v30 = @"xp_its_main";
  if (v28) {
    v30 = (__CFString *)v28;
  }
  v66[12] = v30;
  v65[13] = @"mtRequestId";
  v31 = [MEMORY[0x263F08C38] UUID];
  v32 = [v31 UUIDString];
  v66[13] = v32;
  v65[14] = @"mtClientId";
  v61 = v7;
  v33 = [v7 clientId:*(void *)(a1 + 40)];
  v34 = v33;
  if (!v33)
  {
    v34 = [MEMORY[0x263EFF9D0] null];
  }
  v65[15] = @"mtPrevPage";
  v66[14] = v34;
  v66[15] = v63;
  v52 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:16];
  if (!v33) {

  }
  if (!v25) {
  if (!v23)
  }

  if (!v51) {
  if (!v21)
  }

  if (!v53) {
  if (!v54)
  }

  if (!v55) {
  if (!v56)
  }

  if (!v57) {
  if (!v58)
  }

  if (!v60) {
  v64 = v52;
  }
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  v36 = [v35 arrayByAddingObjectsFromArray:*(void *)(a1 + 72)];
  v37 = +[MTPromise promiseWithComposition:v36];
  v38 = [v37 thenWithBlock:&__block_literal_global_16];

  return v38;
}

id __96__MTMetricsUtils_metricsBuyParamsStringWithPageId_pageType_pageContext_callerSuppliedBuyParams___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = +[MTReflectUtil mergeAndCleanDictionaries:a2];
  id v3 = objc_msgSend(MEMORY[0x263F08BA0], "mt_queryParameterStringForDictionary:", v2);
  unint64_t v4 = +[MTPromise promiseWithResult:v3];

  return v4;
}

@end