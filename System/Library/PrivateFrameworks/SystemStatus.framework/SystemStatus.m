void _copyValuesFromDataToData(id *a1, id *a2)
{
  id *v4;
  id *v5;
  uint64_t vars8;

  objc_storeStrong(a2 + 1, a1[1]);
  v4 = a2;
  v5 = a1;
  objc_storeStrong(v4 + 2, v5[2]);
  objc_storeStrong(v4 + 3, v5[3]);
  objc_storeStrong(v4 + 4, v5[4]);
  objc_storeStrong(v4 + 5, v5[5]);
  objc_storeStrong(v4 + 6, v5[6]);
  objc_storeStrong(v4 + 7, v5[7]);
  objc_storeStrong(v4 + 8, v5[8]);
  objc_storeStrong(v4 + 9, v5[9]);
  objc_storeStrong(v4 + 10, v5[10]);
  objc_storeStrong(v4 + 11, v5[11]);
  objc_storeStrong(v4 + 12, v5[12]);
  objc_storeStrong(v4 + 13, v5[13]);
  objc_storeStrong(v4 + 14, v5[14]);
  objc_storeStrong(v4 + 15, v5[15]);
  objc_storeStrong(v4 + 16, v5[16]);
  objc_storeStrong(v4 + 17, v5[17]);
  objc_storeStrong(v4 + 18, v5[18]);
  objc_storeStrong(v4 + 19, v5[19]);
  objc_storeStrong(v4 + 20, v5[20]);
  objc_storeStrong(v4 + 21, v5[21]);
  objc_storeStrong(v4 + 22, v5[22]);
  objc_storeStrong(v4 + 23, v5[23]);
  objc_storeStrong(v4 + 24, v5[24]);
  objc_storeStrong(v4 + 25, v5[25]);
  objc_storeStrong(v4 + 26, v5[26]);
  objc_storeStrong(v4 + 27, v5[27]);
  objc_storeStrong(v4 + 28, v5[28]);
  objc_storeStrong(v4 + 29, v5[29]);
  objc_storeStrong(v4 + 30, v5[30]);
  objc_storeStrong(v4 + 31, v5[31]);
  objc_storeStrong(v4 + 32, v5[32]);
  objc_storeStrong(v4 + 33, v5[33]);
  objc_storeStrong(v4 + 34, v5[34]);
  objc_storeStrong(v4 + 35, v5[35]);
  objc_storeStrong(v4 + 36, v5[36]);
  objc_storeStrong(v4 + 37, v5[37]);
  objc_storeStrong(v4 + 38, v5[38]);
  objc_storeStrong(v4 + 39, v5[39]);
  objc_storeStrong(v4 + 40, v5[40]);
}

uint64_t __STIsValidDiffForStatusDomain_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __STIsValidDataForStatusDomain_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
}

uint64_t __STIsValidDataChangeContextForStatusDomain_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
}

id STBackgroundActivityIdentifiersDescription(void *a1)
{
  v1 = objc_msgSend(a1, "bs_map:", &__block_literal_global_7);
  v2 = [v1 allObjects];
  v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

void sub_1D951A704(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

BOOL STIsValidDiffForStatusDomain(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = STValidStatusDomainDiffTypes();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDiffForStatusDomain_block_invoke;
    v5[3] = &unk_1E6B63B80;
    id v6 = v1;
    BOOL v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDiffTypes()
{
  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

void sub_1D951C418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D951D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

id STLocationStatusDomainLocationAttributionDisplayModeMaskDescription(uint64_t a1)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend((id)v18[5], "appendString:", @"(");
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke;
  v10 = &unk_1E6B64030;
  uint64_t v11 = &v13;
  uint64_t v12 = &v17;
  uint64_t v2 = v8;
  uint64_t v3 = v2;
  if (a1) {
    __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke((uint64_t)v2, 1);
  }
  if ((a1 & 2) != 0) {
    v9((uint64_t)v3, 2);
  }
  if ((a1 & 4) != 0) {
    v9((uint64_t)v3, 4);
  }
  if ((a1 & 8) != 0) {
    v9((uint64_t)v3, 8);
  }

  if (!v14[3])
  {
    uint64_t v4 = (void *)v18[5];
    uint64_t v5 = STLocationStatusDomainLocationAttributionDisplayModeDescription(a1);
    [v4 appendString:v5];
  }
  [(id)v18[5] appendString:@""]);
  id v6 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v6;
}

void sub_1D95222CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __STLocationStatusDomainLocationAttributionDisplayModeMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = STLocationStatusDomainLocationAttributionDisplayModeDescription(a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v5 = (id)v3;
    uint64_t v4 = [NSString stringWithFormat:@", %@", v3];

    uint64_t v3 = v4;
  }
  id v6 = (id)v3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:v3];
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

__CFString *STLocationStatusDomainLocationAttributionDisplayModeDescription(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1))
  {
    uint64_t v4 = off_1E6B64050[v1];
  }
  else
  {
    uint64_t v2 = NSString;
    uint64_t v3 = [NSNumber numberWithUnsignedInteger:a1];
    uint64_t v4 = [v2 stringWithFormat:@"unknown: %@", v3];
  }

  return v4;
}

uint64_t STSystemStatusIsInternalLoggingEnabled()
{
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  return STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled;
}

__CFString *STSystemStatusDescriptionForDomain(unint64_t a1)
{
  if (a1 > 0xE) {
    return 0;
  }
  else {
    return off_1E6B641B0[a1];
  }
}

BOOL STIsValidDataChangeContextForStatusDomain(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = STValidStatusDomainDataChangeContextTypes();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDataChangeContextForStatusDomain_block_invoke;
    v5[3] = &unk_1E6B63B80;
    id v6 = v1;
    BOOL v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDataChangeContextTypes()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
}

BOOL STIsValidDataForStatusDomain(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = STValidStatusDomainDataTypes();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __STIsValidDataForStatusDomain_block_invoke;
    v5[3] = &unk_1E6B63B80;
    id v6 = v1;
    BOOL v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainDataTypes()
{
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return objc_msgSend(v15, "setWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

void sub_1D9528E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9529CD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1D952B77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogDynamicAttribution()
{
  if (qword_1EB5A3518 != -1) {
    dispatch_once(&qword_1EB5A3518, &__block_literal_global);
  }
  uint64_t v0 = (void *)_MergedGlobals_3;

  return v0;
}

uint64_t __STSystemStatusLogDynamicAttribution_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "DynamicAttribution");
  uint64_t v1 = _MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id STDynamicAttributionXPCServerInterface()
{
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F336F180];
  [v0 setClass:objc_opt_class() forSelector:sel_setCurrentAttributionKey_application_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setCurrentAttributionKey_application_reply_ argumentIndex:1 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setCurrentAttributionStringWithFormat_maskingClientAuditToken_reply_ argumentIndex:0 ofReply:0];
  [v0 setClass:objc_opt_class() forSelector:sel_setCurrentAttributionWebsiteString_maskingClientAuditToken_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id STDynamicAttributionXPCClientInterface()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3373EB0];
  [v3 setClasses:v2 forSelector:sel_currentAttributionsDidChange_ argumentIndex:0 ofReply:0];

  return v3;
}

__CFString *STStatusItemIdentifierDescription(void *a1)
{
  uint64_t v1 = [a1 stringByReplacingOccurrencesOfString:@"com.apple.systemstatus.status-item." withString:&stru_1F335AB10];
  uint64_t v2 = v1;
  if (!v1) {
    uint64_t v1 = @"(unknown)";
  }
  uint64_t v3 = v1;

  return v3;
}

id STStatusItemIdentifiersDescription(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "bs_map:", &__block_literal_global_0);
  uint64_t v2 = [v1 allObjects];
  uint64_t v3 = [v2 componentsJoinedByString:@", "];

  return v3;
}

void sub_1D952F05C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1D952FB80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D95305E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D9530884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogBundleLoading()
{
  if (STSystemStatusLogBundleLoading_onceToken != -1) {
    dispatch_once(&STSystemStatusLogBundleLoading_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)STSystemStatusLogBundleLoading___logObj;

  return v0;
}

uint64_t __STSystemStatusLogBundleLoading_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "BundleLoading");
  uint64_t v1 = STSystemStatusLogBundleLoading___logObj;
  STSystemStatusLogBundleLoading___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D9531820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogCallingDomain()
{
  if (qword_1EB5A3548 != -1) {
    dispatch_once(&qword_1EB5A3548, &__block_literal_global_6);
  }
  os_log_t v0 = (void *)_MergedGlobals_6;

  return v0;
}

uint64_t __STSystemStatusLogCallingDomain_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "CallingDomain");
  uint64_t v1 = _MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

__CFString *STDescriptionForServiceState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"No Service";
  }
  else {
    return off_1E6B63748[a1 - 1];
  }
}

__CFString *STDescriptionForDataNetworkType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF) {
    return @"Unknown";
  }
  else {
    return off_1E6B63760[a1 - 1];
  }
}

__CFString *STBackgroundActivityIdentifierDescription(void *a1)
{
  uint64_t v1 = [a1 stringByReplacingOccurrencesOfString:@"com.apple.systemstatus.background-activity." withString:&stru_1F335AB10];
  uint64_t v2 = v1;
  if (!v1) {
    uint64_t v1 = @"(unknown)";
  }
  uint64_t v3 = v1;

  return v3;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1D9535094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D9537978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STStatusDomainXPCClientInterface()
{
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F336FFA0];
  uint64_t v1 = STValidStatusDomainDataTypes();
  [v0 setClasses:v1 forSelector:sel_observeData_forDomain_withChangeContext_ argumentIndex:0 ofReply:0];

  uint64_t v2 = STValidStatusDomainDataChangeContextTypes();
  [v0 setClasses:v2 forSelector:sel_observeData_forDomain_withChangeContext_ argumentIndex:2 ofReply:0];

  uint64_t v3 = STValidStatusDomainDiffTypes();
  [v0 setClasses:v3 forSelector:sel_observeDiff_forDomain_withChangeContext_ argumentIndex:0 ofReply:0];

  uint64_t v4 = STValidStatusDomainDataChangeContextTypes();
  [v0 setClasses:v4 forSelector:sel_observeDiff_forDomain_withChangeContext_ argumentIndex:2 ofReply:0];

  return v0;
}

id STStatusDomainXPCServerInterface()
{
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3377EF8];
  uint64_t v1 = STValidStatusDomainUserInteractionTypes();
  [v0 setClasses:v1 forSelector:sel_reportUserInteraction_forDomain_ argumentIndex:0 ofReply:0];

  uint64_t v2 = STValidStatusDomainDataTypes();
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 addObject:objc_opt_class()];
  [v3 addObject:objc_opt_class()];
  [v0 setClasses:v3 forSelector:sel_serverDataForDomains_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_1D953A750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D953C2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double STActivityAttributionUnsafeAuditTokenForPID@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)a2 = -1;
  *(void *)(a2 + 8) = -1;
  *(_DWORD *)(a2 + 16) = -1;
  *(_DWORD *)(a2 + 20) = a1;
  double result = NAN;
  *(void *)(a2 + 24) = -1;
  return result;
}

BOOL STIsValidUserInteractionForStatusDomain(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = STValidStatusDomainUserInteractionTypes();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __STIsValidUserInteractionForStatusDomain_block_invoke;
    v5[3] = &unk_1E6B63B80;
    id v6 = v1;
    BOOL v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v5) != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t STValidStatusDomainUserInteractionTypes()
{
  os_log_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

uint64_t __STIsValidUserInteractionForStatusDomain_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

__CFString *_STStatusBarDataNetworkStatusDescription(unint64_t a1)
{
  if (a1 > 5) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63E50[a1];
  }
}

__CFString *_STStatusBarDataCellularTypeDescription(unint64_t a1)
{
  if (a1 > 0xF) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63DD0[a1];
  }
}

__CFString *_STStatusBarDataWifiTypeDescription(uint64_t a1)
{
  uint64_t v1 = @"(unknown)";
  if (a1 == 1) {
    uint64_t v1 = @"hotspot";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"regular";
  }
}

__CFString *_STStatusBarBatteryStateDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63E80[a1];
  }
}

__CFString *_STStatusBarBluetoothStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63EA0[a1];
  }
}

__CFString *_STStatusBarThermalColorDescription(unint64_t a1)
{
  if (a1 > 5) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63EB8[a1];
  }
}

__CFString *_STStatusBarActivityTypeDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63EE8[a1];
  }
}

__CFString *_STStatusBarLocationTypeDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63F00[a1];
  }
}

__CFString *_STStatusBarVoiceControlTypeDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63F18[a1];
  }
}

id *_STStatusBarDataMatchingMutabilityOfData(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v6 = (id *)v3;
  }
  else
  {
    uint64_t v6 = (id *)objc_alloc_init((Class)objc_opt_class());
    _copyValuesFromDataToData((id *)v3, v6);
  }

  return v6;
}

__CFString *STAirPlayStatusDomainAirPlayStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B63F30[a1];
  }
}

void sub_1D9548EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D9549058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D95491D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D95493A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D9549A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

__CFString *STVoiceControlStatusDomainListeningStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B64090[a1];
  }
}

void ___orderedDataEntryKeys_block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = +[STStatusBarData entryKeys];
  uint64_t v1 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = [v0 sortedArrayUsingDescriptors:v2];
  id v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v3;
}

id STDefaultStatusDomainServerHandle()
{
  return +[STStatusDomainXPCServerHandle sharedMachServiceServerHandle];
}

id STStatusDomainPublisherXPCServerInterface()
{
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3378080];
  uint64_t v1 = STValidStatusDomainDataTypes();
  [v0 setClasses:v1 forSelector:sel_registerToPublishDomain_fallbackData_ argumentIndex:1 ofReply:0];

  uint64_t v2 = STValidStatusDomainDataTypes();
  [v0 setClasses:v2 forSelector:sel_publishData_forDomain_withChangeContext_discardingOnExit_reply_ argumentIndex:0 ofReply:0];

  uint64_t v3 = STValidStatusDomainDataChangeContextTypes();
  [v0 setClasses:v3 forSelector:sel_publishData_forDomain_withChangeContext_discardingOnExit_reply_ argumentIndex:2 ofReply:0];

  id v4 = STValidStatusDomainDiffTypes();
  [v0 setClasses:v4 forSelector:sel_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply_ argumentIndex:0 ofReply:0];

  uint64_t v5 = STValidStatusDomainDataChangeContextTypes();
  [v0 setClasses:v5 forSelector:sel_publishDiff_forDomain_withChangeContext_replacingData_discardingOnExit_reply_ argumentIndex:2 ofReply:0];

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_replaceDataChangeRecord_discardingOnExit_reply_ argumentIndex:0 ofReply:0];

  return v0;
}

id STStatusDomainPublisherXPCClientInterface()
{
  os_log_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3374660];
  uint64_t v1 = STValidStatusDomainUserInteractionTypes();
  [v0 setClasses:v1 forSelector:sel_handleUserInteraction_forDomain_ argumentIndex:0 ofReply:0];

  return v0;
}

id STSystemStatusLogObservation()
{
  if (STSystemStatusLogObservation_onceToken != -1) {
    dispatch_once(&STSystemStatusLogObservation_onceToken, &__block_literal_global_15);
  }
  os_log_t v0 = (void *)STSystemStatusLogObservation___logObj;

  return v0;
}

uint64_t __STSystemStatusLogObservation_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "Observation");
  uint64_t v1 = STSystemStatusLogObservation___logObj;
  STSystemStatusLogObservation___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id STSystemStatusLogPublishing()
{
  if (STSystemStatusLogPublishing_onceToken != -1) {
    dispatch_once(&STSystemStatusLogPublishing_onceToken, &__block_literal_global_3_0);
  }
  os_log_t v0 = (void *)STSystemStatusLogPublishing___logObj;

  return v0;
}

uint64_t __STSystemStatusLogPublishing_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "Publishing");
  uint64_t v1 = STSystemStatusLogPublishing___logObj;
  STSystemStatusLogPublishing___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __STSystemStatusIsInternalLoggingEnabled_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled = result;
  return result;
}

void sub_1D9552908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void _copyValuesFromDescriptorToDescriptor(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[1];
  id v4 = a2;
  uint64_t v19 = a1;
  uint64_t v5 = [v3 copy];
  uint64_t v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  uint64_t v7 = [(id)v19[2] copy];
  uint64_t v8 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v7;

  uint64_t v9 = [(id)v19[3] copy];
  v10 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v9;

  uint64_t v11 = [(id)v19[4] copy];
  uint64_t v12 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v11;

  objc_storeStrong((id *)v4 + 5, (id)v19[5]);
  *((void *)v4 + 6) = v19[6];
  *((void *)v4 + 7) = v19[7];
  *((unsigned char *)v4 + 64) = *((unsigned char *)v19 + 64);
  uint64_t v13 = [(id)v19[9] copy];
  uint64_t v14 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v13;

  uint64_t v15 = [(id)v19[10] copy];
  uint64_t v16 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v15;

  uint64_t v17 = [(id)v19[11] copy];
  v18 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v17;
}

id STDefaultStatusDomainPublisherServerHandle()
{
  return +[STStatusDomainPublisherXPCServerHandle sharedMachServiceServerHandle];
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

__CFString *STBatteryStatusDomainChargingStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B64408[a1];
  }
}

__CFString *STBatteryStatusDomainChargingDescriptionTypeDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E6B64420[a1];
  }
}

void sub_1D955EA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D955FA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1D9562400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D95626A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogBackgroundActivityVisualDescriptor()
{
  if (qword_1EB5A3618 != -1) {
    dispatch_once(&qword_1EB5A3618, &__block_literal_global_22);
  }
  os_log_t v0 = (void *)_MergedGlobals_18;

  return v0;
}

uint64_t __STSystemStatusLogBackgroundActivityVisualDescriptor_block_invoke()
{
  os_log_t v0 = os_log_create(STSystemStatusLoggingSubsystem, "BackgroundActivityVisualDescriptor");
  uint64_t v1 = _MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t STBackgroundActivityIsVisualEffect(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"none";
  v6[1] = @"darkBlur";
  uint64_t v1 = (void *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  uint64_t v3 = [v1 arrayWithObjects:v6 count:2];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

uint64_t STBackgroundActivityIsContinuousAnimation(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"none";
  uint64_t v7 = @"pulseBackground";
  uint64_t v8 = @"pulseSymbol";
  uint64_t v1 = (void *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  uint64_t v3 = [v1 arrayWithObjects:&v6 count:3];
  uint64_t v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9);

  return v4;
}

void sub_1D95656A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D95657F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D95669C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSExecutablePathForAuditToken()
{
  return MEMORY[0x1F410C300]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1F410C308]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1F410C350]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1F410C4A8]();
}

uint64_t BSProcessDescriptionForAuditToken()
{
  return MEMORY[0x1F410C4F0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1F410C5E0]();
}

uint64_t BSSettingFlagIsExplicitNo()
{
  return MEMORY[0x1F410C5F0]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1F410C5F8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1F410C650]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1F410C678]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1F410C6B8]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7480](bundleURL);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}