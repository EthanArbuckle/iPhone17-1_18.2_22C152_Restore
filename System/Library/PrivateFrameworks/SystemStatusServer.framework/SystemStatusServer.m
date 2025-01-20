id _STExecutableIdentityResolvedIdentityForIdentity(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  uint64_t vars8;

  v5 = a1;
  v6 = v5;
  v36 = 0u;
  v37 = 0u;
  if (v5) {
    [v5 auditToken];
  }
  v7 = [v6 hasAuditToken];
  v8 = [v6 executablePath];
  v9 = [v6 bundlePath];
  v10 = [v6 bundleIdentifier];
  v11 = [v6 personaUniqueString];
  if (a2 && v7)
  {
    v34 = v36;
    v35 = v37;
    v12 = BSPIDForAuditToken();
    v13 = (void *)MEMORY[0x1E4F963E8];
    v14 = [MEMORY[0x1E4F963F8] identifierWithPid:v12];
    v15 = [v13 handleForIdentifier:v14 error:0];

    v16 = [v15 hostProcess];
    v17 = v16;
    if (v16)
    {
      [v16 auditToken];
    }
    else
    {
      v38 = v34;
      v39 = v35;
    }

    v36 = v38;
    v37 = v39;
  }
  if (v7)
  {
    v38 = v36;
    v39 = v37;
    v18 = (unint64_t)BSVersionedPIDForAuditToken() < 0xFFFFFFFF00000000;
    if (v9) {
      goto LABEL_18;
    }
  }
  else
  {
    v18 = 0;
    if (v9) {
      goto LABEL_18;
    }
  }
  if (v10)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
    v20 = v19;
    if (v19)
    {
      v21 = [v19 URL];
      v9 = [v21 path];
    }
    else
    {
      v9 = 0;
    }
  }
LABEL_18:
  if (v8 | v9) {
    v22 = 0;
  }
  else {
    v22 = v7;
  }
  if (v8 | v9) {
    v23 = (void *)v8;
  }
  else {
    v23 = 0;
  }
  if (v22 == 1)
  {
    if (v18)
    {
      v38 = v36;
      v39 = v37;
      BSExecutablePathForAuditToken();
    }
    else
    {
      BSPIDForAuditToken();
      BSExecutablePathForPID();
    v23 = };
  }
  if (v23)
  {
    if (!v9)
    {
      v9 = BSBundlePathForExecutablePath();
      if (!v9)
      {
        if (a3)
        {
          v24 = [v23 rangeOfString:@".framework/"];
          if (v24 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = 0;
            v9 = 0;
            goto LABEL_39;
          }
          v9 = [v23 substringToIndex:v24 + v25];
        }
      }
    }
  }
  v26 = v9 != 0;
  if (!v10 && v9)
  {
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithPath:v9];
    v10 = [v27 bundleIdentifier];

    v26 = 1;
  }
LABEL_39:
  if (v23 && !v10)
  {
    v10 = BSBundleIDForExecutablePath();
  }
  if (v26) {
    v28 = (void *)v9;
  }
  else {
    v28 = v23;
  }
  v29 = v28;
  if (v29) {
    v30 = BSPathExistsOnSystemPartition();
  }
  else {
    v30 = 0;
  }
  v38 = 0u;
  v39 = 0u;
  if (v18)
  {
    v38 = v36;
    v39 = v37;
  }
  else if (v6)
  {
    [v6 auditToken];
  }
  v31 = objc_alloc(MEMORY[0x1E4FA9390]);
  v34 = v38;
  v35 = v39;
  v32 = (void *)[v31 initWithAuditToken:&v34 bundlePath:v9 executablePath:v23 bundleIdentifier:v10 personaUniqueString:v11 systemExecutable:v30];

  return v32;
}

id STAttributedEntityResolverLocalizedStringFromTableInCFBundle(void *a1, __CFBundle *a2, void *a3, void *a4)
{
  v7 = a1;
  v8 = a3;
  CFArrayRef v9 = a4;
  CFArrayRef v10 = CFBundleCopyBundleLocalizations(a2);
  CFArrayRef v11 = CFBundleCopyLocalizationsForPreferences(v10, v9);

  v12 = [(__CFArray *)v11 firstObject];
  if (!v12 || (v13 = (void *)CFBundleCopyLocalizedStringForLocalization()) == 0) {
    v13 = (void *)CFBundleCopyLocalizedString(a2, v7, v8, @"InfoPlist");
  }

  return v13;
}

BOOL __STTelephonyArrayContainsCTContextForSlot_block_invoke(uint64_t a1, void *a2)
{
  return [a2 slotID] == *(void *)(a1 + 32);
}

id STSystemStatusLogTelephonyState()
{
  if (qword_1EBDFC7E8 != -1) {
    dispatch_once(&qword_1EBDFC7E8, &__block_literal_global_4);
  }
  v0 = (void *)_MergedGlobals_3;
  return v0;
}

id STSystemStatusLogServer()
{
  if (qword_1EBDFC7A8 != -1) {
    dispatch_once(&qword_1EBDFC7A8, &__block_literal_global_0);
  }
  v0 = (void *)_MergedGlobals_0;
  return v0;
}

uint64_t __STSystemStatusLogServer_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA9910], "Server");
  uint64_t v1 = _MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
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

void sub_1D832AD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D832B35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STSystemStatusLogEntityResolving()
{
  if (qword_1EBDFC7B8 != -1) {
    dispatch_once(&qword_1EBDFC7B8, &__block_literal_global_1);
  }
  os_log_t v0 = (void *)_MergedGlobals_1;
  return v0;
}

uint64_t __STSystemStatusLogEntityResolving_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA9910], "EntityResolving");
  uint64_t v1 = _MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D832E41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D832E560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t __STSystemStatusLogTelephonyState_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x1E4FA9910], "TelephonyState");
  uint64_t v1 = _MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D832F094(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
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

uint64_t STTelephonyRegistrationStatusForStatus(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_10;
  }
  uint64_t v3 = *MEMORY[0x1E4F241B0];
  if ([v1 isEqualToString:*MEMORY[0x1E4F241B0]])
  {

LABEL_5:
    uint64_t v6 = 1;
    goto LABEL_14;
  }
  uint64_t v4 = *MEMORY[0x1E4F241A8];
  char v5 = [v2 isEqualToString:*MEMORY[0x1E4F241A8]];

  if (v5) {
    goto LABEL_5;
  }
  id v7 = v2;
  if (([v7 isEqualToString:*MEMORY[0x1E4F24180]] & 1) != 0
    || ([v7 isEqualToString:v4] & 1) != 0
    || ([v7 isEqualToString:v3] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F24190]])
  {
LABEL_10:

    uint64_t v8 = *MEMORY[0x1E4F24188];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x1E4F24188];
    int v10 = [v7 isEqualToString:*MEMORY[0x1E4F24188]];

    if (!v10)
    {
      uint64_t v6 = 2;
      goto LABEL_14;
    }
  }
  if ([v2 isEqualToString:v8]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 3;
  }
LABEL_14:

  return v6;
}

__CFString *STTelephonyCachedBooleanDebugName(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6AD2828[a1 + 2];
  }
  return v1;
}

void sub_1D8333A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  _Block_object_dispose(&a17, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8334510(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t STTelephonyDataConnectionTypeForIndicatorNameAndRadioTechnology(int a1, int a2)
{
  int v2 = a1 - 1;
  uint64_t result = 3;
  switch(v2)
  {
    case 0:
      if ((a2 - 3) < 3) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = 2;
      }
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 4;
      break;
    case 3:
    case 4:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 7;
      break;
    case 7:
      uint64_t result = 11;
      break;
    case 12:
      uint64_t result = 10;
      break;
    case 13:
      uint64_t result = 8;
      break;
    case 14:
      uint64_t result = 9;
      break;
    case 15:
      uint64_t result = 12;
      break;
    case 16:
      uint64_t result = 13;
      break;
    case 17:
      uint64_t result = 14;
      break;
    case 18:
      uint64_t result = 16;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_1D833640C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D8337500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D8338928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t STStatusDomainNameForEntitlementValue(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x1E4FA9830]])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9838]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9840]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9848]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9850]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9858]])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9860]])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9868]])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9888]])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9890]])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9898]])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA98A0]])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9870]])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9878]])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4FA9880]])
  {
    uint64_t v2 = 14;
  }
  else
  {
    uint64_t v2 = -1;
  }

  return v2;
}

id STEntitledDomainsForEntitlementValue(void *a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  objc_opt_class();
  v21 = v1;
  if (objc_opt_isKindOfClass())
  {
    v32[0] = v1;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v1;
      uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v27 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v3 addObject:v10];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v7);
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if ([v16 isEqualToString:@"data-access"])
        {
          [v2 addObject:&unk_1F3015388];
          [v2 addObject:&unk_1F30153A0];
        }
        else
        {
          uint64_t v17 = STStatusDomainNameForEntitlementValue(v16);
          if (v17 != -1)
          {
            v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v17];
            [v2 addObject:v18];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v13);
  }

  v19 = (void *)[v2 copy];
  return v19;
}

__CFString *STTelephonyDataConnectionTypeDebugName(unint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6AD29F8[a1];
  }
  return v1;
}

__CFString *STTelephonyRegistrationStatusDebugName(unint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6AD2A88[a1];
  }
  return v1;
}

__CFString *STTelephonyCallForwardingIndicatorDebugName(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(%i)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6AD2AB0[a1];
  }
  return v1;
}

uint64_t BSBundleIDForExecutablePath()
{
  return MEMORY[0x1F410C178]();
}

uint64_t BSBundlePathForExecutablePath()
{
  return MEMORY[0x1F410C188]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1F410C270]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSExecutablePathForAuditToken()
{
  return MEMORY[0x1F410C300]();
}

uint64_t BSExecutablePathForPID()
{
  return MEMORY[0x1F410C308]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1F410C420]();
}

uint64_t BSPIDForAuditToken()
{
  return MEMORY[0x1F410C4A8]();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return MEMORY[0x1F410C4C0]();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return MEMORY[0x1F410C6B8]();
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t STDefaultStatusDomainPublisherServerHandle()
{
  return MEMORY[0x1F415CAC0]();
}

uint64_t STDefaultStatusDomainServerHandle()
{
  return MEMORY[0x1F415CAC8]();
}

uint64_t STIsValidDataChangeContextForStatusDomain()
{
  return MEMORY[0x1F415CAD0]();
}

uint64_t STIsValidDataForStatusDomain()
{
  return MEMORY[0x1F415CAD8]();
}

uint64_t STIsValidDiffForStatusDomain()
{
  return MEMORY[0x1F415CAE0]();
}

uint64_t STIsValidUserInteractionForStatusDomain()
{
  return MEMORY[0x1F415CAE8]();
}

uint64_t STStatusDomainPublisherXPCClientInterface()
{
  return MEMORY[0x1F415CAF0]();
}

uint64_t STStatusDomainPublisherXPCServerInterface()
{
  return MEMORY[0x1F415CAF8]();
}

uint64_t STStatusDomainXPCClientInterface()
{
  return MEMORY[0x1F415CB00]();
}

uint64_t STStatusDomainXPCServerInterface()
{
  return MEMORY[0x1F415CB08]();
}

uint64_t STSystemStatusDescriptionForDomain()
{
  return MEMORY[0x1F415CB18]();
}

uint64_t STSystemStatusIsInternalLoggingEnabled()
{
  return MEMORY[0x1F415CB20]();
}

uint64_t STSystemStatusLogBundleLoading()
{
  return MEMORY[0x1F415CB28]();
}

uint64_t TUISOCountryCodeForMCC()
{
  return MEMORY[0x1F4163A50]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionGetRadioModuleIsDead()
{
  return MEMORY[0x1F40DF168]();
}

uint64_t _CTServerConnectionHideDataIndicator()
{
  return MEMORY[0x1F40DF188]();
}

uint64_t _CTServerConnectionHideRatIndicator()
{
  return MEMORY[0x1F40DF190]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1F40DF1B0]();
}

uint64_t _CTServerConnectionRegisterBlockForNotification()
{
  return MEMORY[0x1F40DF1C8]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x1F40DF230]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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