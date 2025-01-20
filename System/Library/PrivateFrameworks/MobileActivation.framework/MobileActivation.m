void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id MAEGetActivationStateWithError()
{
  return (id)getActivationStateThroughMAD();
}

id getActivationState(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = (id)[v2 getActivationState:a1];

  return v3;
}

void sub_1DD6B51CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  id v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

void __copy_helper_block_e8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

uint64_t createTunnel1SessionRequestFromMAD(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
  if (v6)
  {
    v7 = v6;
    id v8 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
    id v9 = isNSNumber(v8);

    if (!v9)
    {
      id v18 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
      id MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 192, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"BasebandWaitCount", v18);
      goto LABEL_11;
    }
  }
  id v10 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if (v10)
  {
    v11 = v10;
    id v12 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
    id v13 = isNSNumber(v12);

    if (!v13)
    {
      id v22 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
      id v20 = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 197, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"WaitForBasebandReady", v22);
      v21 = v22;
      goto LABEL_13;
    }
  }
  id v14 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if ([v14 BOOLValue])
  {
  }
  else
  {
    id v15 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
    int v16 = [v15 BOOLValue];

    if (!v16)
    {
      id v18 = 0;
      goto LABEL_17;
    }
  }
  id v33 = 0;
  char v17 = waitForBaseband(&v33);
  id v18 = v33;
  if ((v17 & 1) == 0)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 204, @"com.apple.MobileActivation.ErrorDomain", -12, v18, @"Waiting for baseband failed.");
LABEL_11:
    id v20 = MobileActivationError;
    v21 = v18;
LABEL_13:

    id v23 = 0;
    goto LABEL_14;
  }
LABEL_17:
  id v32 = v18;
  id v23 = createTunnel1SessionInfo((uint64_t)&v32);
  id v20 = v32;

  if (!v23)
  {
LABEL_14:
    id v24 = 0;
    if (a3)
    {
LABEL_15:
      id v25 = v20;
      uint64_t v26 = 0;
      *a3 = v25;
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v26 = 0;
    id v25 = v20;
    goto LABEL_24;
  }
  id v30 = v20;
  id v31 = 0;
  int v27 = createXMLRequest(v23, &v31, &v30);
  id v24 = v31;
  id v25 = v30;

  if (!v27)
  {
    id v20 = v25;
    if (a3) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
  [v24 setValue:@"iOS Device Activator (MobileActivation-1015.60.1)" forHTTPHeaderField:@"User-Agent"];
  [v24 setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
  id v28 = (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://albert.apple.com/deviceservices/drmHandshake"];
  [v24 setURL:v28];

  if (a1)
  {
    id v24 = v24;
    *a1 = v24;
  }
  uint64_t v26 = 1;
LABEL_24:

  return v26;
}

uint64_t waitForBaseband(void *a1)
{
  id v2 = +[GestaltHlprMobileActivation getSharedInstance];
  id v3 = (void *)[v2 copyAnswer:@"HasBaseband"];

  id v4 = isNSNumber(v3);
  if (!v4)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"waitForBaseband", 145, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve HasBaseband.");
LABEL_12:
    id v9 = MobileActivationError;
    if (a1)
    {
LABEL_13:
      id v9 = v9;
      uint64_t v10 = 0;
      *a1 = v9;
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if ([v3 BOOLValue])
  {
    id v4 = 0;
    int v5 = 30;
    do
    {
      id v6 = v4;
      id v7 = +[GestaltHlprMobileActivation getSharedInstance];
      id v4 = (id)[v7 copyAnswer:@"BasebandStatus"];

      id v8 = isNSString(v4);
      if (!v8)
      {
        id MobileActivationError = createMobileActivationError((uint64_t)"waitForBaseband", 157, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to retrieve BasebandStatus.");
        goto LABEL_12;
      }
      if (![v4 isEqualToString:@"BBNotReady"])
      {
        id v9 = 0;
        goto LABEL_15;
      }
      sleep(2u);
      --v5;
    }
    while (v5);
    id v9 = 0;
    if (a1) {
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  id v9 = 0;
  id v4 = 0;
LABEL_15:
  uint64_t v10 = 1;
LABEL_16:

  return v10;
}

uint64_t createTunnel1ActivationRequestFromMAD(void *a1, id a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (id)[v8 objectForKeyedSubscript:@"BasebandWaitCount"];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = (id)[v8 objectForKeyedSubscript:@"BasebandWaitCount"];
    id v12 = isNSNumber(v11);

    if (!v12)
    {
      id v21 = (id)[v8 objectForKeyedSubscript:@"BasebandWaitCount"];
      id MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 246, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"BasebandWaitCount", v21);
      goto LABEL_11;
    }
  }
  id v13 = (id)[v8 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if (v13)
  {
    id v14 = v13;
    id v15 = (id)[v8 objectForKeyedSubscript:@"WaitForBasebandReady"];
    id v16 = isNSNumber(v15);

    if (!v16)
    {
      id v25 = (id)[v8 objectForKeyedSubscript:@"WaitForBasebandReady"];
      id v23 = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 251, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"WaitForBasebandReady", v25);
      id v24 = v25;
      goto LABEL_13;
    }
  }
  id v17 = (id)[v8 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if ([v17 BOOLValue])
  {
  }
  else
  {
    id v18 = (id)[v8 objectForKeyedSubscript:@"BasebandWaitCount"];
    int v19 = [v18 BOOLValue];

    if (!v19)
    {
      id v21 = 0;
      goto LABEL_17;
    }
  }
  id v35 = 0;
  char v20 = waitForBaseband(&v35);
  id v21 = v35;
  if ((v20 & 1) == 0)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 258, @"com.apple.MobileActivation.ErrorDomain", -12, v21, @"Waiting for baseband failed.");
LABEL_11:
    id v23 = MobileActivationError;
    id v24 = v21;
LABEL_13:

    id v26 = 0;
    goto LABEL_14;
  }
LABEL_17:
  id v34 = v21;
  id v26 = createTunnel1ActivationInfo(v7, v8, (uint64_t)&v34);
  id v23 = v34;

  if (!v26)
  {
LABEL_14:
    id v27 = 0;
    if (a4)
    {
LABEL_15:
      id v28 = v23;
      uint64_t v29 = 0;
      *a4 = v28;
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v29 = 0;
    id v28 = v23;
    goto LABEL_24;
  }
  id v32 = v23;
  id v33 = 0;
  int v30 = createActivationRequest(v26, &v33, 0, &v32);
  id v27 = v33;
  id v28 = v32;

  if (!v30)
  {
    id v23 = v28;
    if (a4) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
  if (a1)
  {
    id v27 = v27;
    *a1 = v27;
  }
  uint64_t v29 = 1;
LABEL_24:

  return v29;
}

uint64_t createFactoryActivationRequestFromMAD(void *a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
  if (v6)
  {
    id v7 = v6;
    id v8 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
    id v9 = isNSNumber(v8);

    if (!v9)
    {
      id v18 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
      id MobileActivationError = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 296, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"BasebandWaitCount", v18);
      goto LABEL_11;
    }
  }
  id v10 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if (v10)
  {
    id v11 = v10;
    id v12 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
    id v13 = isNSNumber(v12);

    if (!v13)
    {
      id v22 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
      id v20 = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 301, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid value for option (%@): %@", @"WaitForBasebandReady", v22);
      id v21 = v22;
      goto LABEL_13;
    }
  }
  id v14 = (id)[v5 objectForKeyedSubscript:@"WaitForBasebandReady"];
  if ([v14 BOOLValue])
  {
  }
  else
  {
    id v15 = (id)[v5 objectForKeyedSubscript:@"BasebandWaitCount"];
    int v16 = [v15 BOOLValue];

    if (!v16)
    {
      id v18 = 0;
      goto LABEL_17;
    }
  }
  id v33 = 0;
  char v17 = waitForBaseband(&v33);
  id v18 = v33;
  if ((v17 & 1) == 0)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 308, @"com.apple.MobileActivation.ErrorDomain", -12, v18, @"Waiting for baseband failed.");
LABEL_11:
    id v20 = MobileActivationError;
    id v21 = v18;
LABEL_13:

    id v23 = 0;
    goto LABEL_14;
  }
LABEL_17:
  id v32 = v18;
  id v23 = createActivationInfo((uint64_t)&v32);
  id v20 = v32;

  if (!v23)
  {
LABEL_14:
    id v24 = 0;
    if (a3)
    {
LABEL_15:
      id v25 = v20;
      uint64_t v26 = 0;
      *a3 = v25;
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v26 = 0;
    id v25 = v20;
    goto LABEL_24;
  }
  id v30 = v20;
  id v31 = 0;
  int v27 = createXMLRequest(v23, &v31, &v30);
  id v24 = v31;
  id v25 = v30;

  if (!v27)
  {
    id v20 = v25;
    if (a3) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
  [v24 setValue:@"iOS Device Activator (MobileActivation-1015.60.1)" forHTTPHeaderField:@"User-Agent"];
  id v28 = (id)[MEMORY[0x1E4F1CB10] URLWithString:@"http://raptor-dr.apple.com:8080/raptor/processor"];
  [v24 setURL:v28];

  if (a1)
  {
    id v24 = v24;
    *a1 = v24;
  }
  uint64_t v26 = 1;
LABEL_24:

  return v26;
}

uint64_t deactivateThroughMAD(void *a1)
{
  id v6 = 0;
  uint64_t v2 = deactivateDevice((uint64_t)&v6);
  id v3 = v6;
  id v4 = v3;
  if (a1 && (v2 & 1) == 0) {
    *a1 = v3;
  }

  return v2;
}

uint64_t activateThroughMAD(void *a1, void *a2, void *a3)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  id v28 = a3;
  if (!v5)
  {
    id v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 373, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    id v16 = 0;
    id v14 = 0;
    id v9 = 0;
LABEL_18:
    id v20 = 0;
    int v19 = 0;
    goto LABEL_26;
  }
  id v8 = (id)[v6 objectForKeyedSubscript:@"ActivationResponseHeaders"];
  id v9 = v8;
  if (v8)
  {
    id v10 = isNSDictionary(v8);

    if (!v10)
    {
      id v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 379, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
      id v16 = 0;
      id v14 = 0;
      goto LABEL_18;
    }
  }
  int v27 = v7;
  id v32 = 0;
  id v11 = getActivationRecordFromData((uint64_t)v5, &v32);
  id v12 = v32;
  id v13 = v12;
  if (v11)
  {
    id v14 = v11;
  }
  else
  {
    id v31 = v12;
    id v14 = getSessionActivationRecordFromData(v5, &v31);
    id v17 = v31;

    if (!v14)
    {
      id v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 387, @"com.apple.MobileActivation.ErrorDomain", -1, v17, @"Failed to extract activation record.");

      id v16 = 0;
      id v20 = 0;
      int v19 = 0;
      goto LABEL_25;
    }
    id v13 = v17;
  }
  id v18 = (id)[v9 objectForCaseInsensitiveKey:@"ARS"];
  int v19 = v18;
  if (!v18)
  {
    id v20 = 0;
    goto LABEL_14;
  }
  id v20 = isNSString(v18);

  if (!v20)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"activateThroughMAD", 400, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid activation signature");
    goto LABEL_20;
  }
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v19 options:1];
  if (v20)
  {
LABEL_14:
    if (v11)
    {
      id v33 = @"ActivationRecord";
      v34[0] = v14;
      uint64_t v22 = 1;
      id v16 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      id v29 = v13;
      char v23 = handleActivationInfo(v16, (uint64_t)&v29);
      id v15 = v29;

      id v7 = v27;
      if (v23) {
        goto LABEL_29;
      }
      goto LABEL_26;
    }
    id v30 = v13;
    uint64_t v24 = handleActivationInfoWithSession(v5, v20, (uint64_t)&v30);
    id v15 = v30;

    if (v24)
    {
      id v16 = 0;
      uint64_t v22 = 1;
      id v7 = v27;
      goto LABEL_29;
    }
    id v25 = createMobileActivationError((uint64_t)"activateThroughMAD", 415, @"com.apple.MobileActivation.ErrorDomain", -1, v15, @"Failed to activate device.");

    id v16 = 0;
    id v15 = v25;
    goto LABEL_25;
  }
  id MobileActivationError = createMobileActivationError((uint64_t)"activateThroughMAD", 406, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Invalid activation signature");
LABEL_20:
  id v15 = MobileActivationError;

  id v16 = 0;
LABEL_25:
  id v7 = v27;
LABEL_26:
  if (v28)
  {
    id v15 = v15;
    uint64_t v22 = 0;
    *id v28 = v15;
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_29:

  return v22;
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    do
    {
      id v10 = (id)[v5 domain];
      if ([v10 isEqualToString:v7])
      {
        uint64_t v11 = [v5 code];

        if (v11 == a3)
        {
          uint64_t v8 = 1;
          goto LABEL_10;
        }
      }
      else
      {
      }
      id v12 = (id)[v5 userInfo];
      id v13 = (id)[v12 objectForKeyedSubscript:v9];

      id v5 = v13;
    }
    while (v13);
    uint64_t v8 = 0;
  }
LABEL_10:

  return v8;
}

BOOL is_virtual_machine()
{
  int v3 = 0;
  size_t v2 = 4;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0) && v3 == 1;
}

uint64_t createActivationRequest(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a1;
  if (!v7)
  {
    id v9 = createMobileActivationError((uint64_t)"createActivationRequest", 36, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    id v8 = 0;
    id v10 = 0;
    id v16 = 0;
    id v17 = 0;
    id v11 = 0;
    if (a4)
    {
LABEL_18:
      id v9 = v9;
      uint64_t v23 = 0;
      id v19 = 0;
      *a4 = v9;
      goto LABEL_19;
    }
LABEL_13:
    uint64_t v23 = 0;
    id v19 = 0;
    goto LABEL_19;
  }
  id v27 = 0;
  id v8 = (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:&v27];
  id v9 = v27;
  if (!v8)
  {
    id v24 = createMobileActivationError((uint64_t)"createActivationRequest", 45, @"com.apple.MobileActivation.ErrorDomain", -1, v9, @"Failed to convert dictionary to data.");

    id v10 = 0;
LABEL_16:
    id v16 = 0;
    id v17 = 0;
    id v11 = 0;
    goto LABEL_17;
  }
  id v10 = (id)[[NSString alloc] initWithData:v8 encoding:4];
  if (!v10)
  {
    id v24 = createMobileActivationError((uint64_t)"createActivationRequest", 51, @"com.apple.MobileActivation.ErrorDomain", -1, v9, @"Failed to convert data to string.");

    goto LABEL_16;
  }
  id v11 = (id)[MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  [v11 addCharactersInString:@"*-._"];
  [v11 addCharactersInString:@" "];
  id v12 = (id)[v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];

  id v10 = (id)[v12 stringByReplacingOccurrencesOfString:@" " withString:@"+"];
  id v13 = [NSString alloc];
  id v14 = @"activation-info";
  if (a3) {
    id v14 = @"certify-me-info";
  }
  id v15 = (void *)[v13 initWithFormat:@"%@=%@", v14, v10];
  id v16 = v15;
  if (!v15)
  {
    id v24 = createMobileActivationError((uint64_t)"createActivationRequest", 64, @"com.apple.MobileActivation.ErrorDomain", -1, v9, @"Failed to convert dictionary to URL encoding.");

    id v17 = 0;
    goto LABEL_17;
  }
  id v17 = (id)[v15 dataUsingEncoding:4 allowLossyConversion:0];
  if (!v17)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createActivationRequest", 70, @"com.apple.MobileActivation.ErrorDomain", -1, v9, @"Failed to convert string to data.");
LABEL_23:
    id v24 = MobileActivationError;

LABEL_17:
    id v9 = v24;
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  if (!v18)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createActivationRequest", 76, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate request.");
    goto LABEL_23;
  }
  id v19 = v18;
  [v18 setCachePolicy:0];
  [v19 setTimeoutInterval:60.0];
  [v19 setHTTPMethod:@"POST"];
  id v20 = (id)[NSString stringWithFormat:@"application/x-www-form-urlencoded"];
  [v19 setValue:v20 forHTTPHeaderField:@"Content-Type"];

  id v21 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v17, "length"));
  [v19 setValue:v21 forHTTPHeaderField:@"Content-Length"];

  [v19 setHTTPBody:v17];
  [v19 setValue:@"iOS Device Activator (MobileActivation-1015.60.1)" forHTTPHeaderField:@"User-Agent"];
  id v22 = (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://albert.apple.com/deviceservices/deviceActivation"];
  [v19 setURL:v22];

  if (a2)
  {
    id v19 = v19;
    *a2 = v19;
  }
  uint64_t v23 = 1;
LABEL_19:

  return v23;
}

id getSessionActivationRecordFromData(void *a1, void *a2)
{
  id v3 = a1;
  if (v3)
  {
    id v11 = 0;
    id v4 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v11];
    id v5 = v11;
    id v6 = isNSDictionary(v4);

    if (v6)
    {
      id v6 = (id)[v4 objectForKeyedSubscript:@"ActivationRecord"];
      id v7 = isNSDictionary(v6);

      if (v7)
      {
        id v7 = v6;
        id v6 = v7;
        if (!a2) {
          goto LABEL_13;
        }
      }
      else
      {
        id v8 = createMobileActivationError((uint64_t)"getSessionActivationRecordFromData", 124, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Input data is missing activation record.");

        id v5 = v8;
        if (!a2) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v7 = 0;
      if (!a2) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v5 = createMobileActivationError((uint64_t)"getSessionActivationRecordFromData", 113, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    id v7 = 0;
    id v4 = 0;
    id v6 = 0;
    if (!a2) {
      goto LABEL_13;
    }
  }
  if (!v7) {
    *a2 = v5;
  }
LABEL_13:
  id v9 = v7;

  return v9;
}

id getActivationRecordFromData(uint64_t a1, void *a2)
{
  id v22 = 0;
  id v3 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:a1 options:0 format:0 error:&v22];
  id v4 = v22;
  id v5 = isNSDictionary(v3);

  if (v5)
  {
    id v6 = (id)[v3 objectForKeyedSubscript:@"AccountToken"];
    if (v6)
    {
      id v7 = v6;
      id v8 = (id)[v3 objectForKeyedSubscript:@"AccountTokenSignature"];
      if (v8)
      {
        id v9 = v8;
        id v10 = (id)[v3 objectForKeyedSubscript:@"DeviceCertificate"];

        if (v10)
        {
          id v11 = v3;
          id v5 = 0;
          if (!a2) {
            goto LABEL_22;
          }
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    id v12 = @"device-activation";
    id v13 = (id)[v3 objectForKeyedSubscript:@"device-activation"];

    if (v13
      || (id v12 = @"iphone-activation",
          id v14 = (id)[v3 objectForKeyedSubscript:@"iphone-activation"], v14, v14))
    {
      id v5 = (id)[v3 objectForKeyedSubscript:v12];
    }
    else
    {
      id v5 = 0;
    }
    id v15 = isNSDictionary(v5);

    if (v15)
    {
      id v16 = (id)[v5 objectForKeyedSubscript:@"activation-record"];

      id v17 = isNSDictionary(v16);
      if (v17)
      {
        id v11 = v16;
        id v5 = v11;
        if (!a2) {
          goto LABEL_22;
        }
      }
      else
      {
        id v19 = createMobileActivationError((uint64_t)"getActivationRecordFromData", 173, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Input data is missing activation record.");

        id v11 = 0;
        id v4 = v19;
        id v5 = v16;
        if (!a2) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      id v18 = createMobileActivationError((uint64_t)"getActivationRecordFromData", 167, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Input data is missing activation ticket.");

      id v11 = 0;
      id v4 = v18;
      if (!a2) {
        goto LABEL_22;
      }
    }
  }
  else
  {
    id v11 = 0;
    if (!a2) {
      goto LABEL_22;
    }
  }
LABEL_20:
  if (!v11) {
    *a2 = v4;
  }
LABEL_22:
  id v20 = v11;

  return v20;
}

id createMobileActivationError(uint64_t a1, uint64_t a2, id a3, uint64_t a4, void *a5, void *a6, ...)
{
  va_start(va, a6);
  id v11 = a3;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F28E78];
  id v14 = a6;
  id v15 = (void *)[[v13 alloc] initWithFormat:v14 arguments:va];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v17 = v16;
  if (v15) {
    [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  if (v12) {
    [v17 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      id v18 = (id)[NSString stringWithUTF8String:a1];
      [v17 setObject:v18 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      id v19 = (id)[NSNumber numberWithUnsignedInt:a2];
      [v17 setObject:v19 forKeyedSubscript:@"SourceLine"];
    }
  }
  id v20 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:v11 code:a4 userInfo:v17];

  return v20;
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_1DD6B8018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B83EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B8798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B8B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B8F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B9344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DD6B96D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B9A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B9D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6B9FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BA25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BA568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BA884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BAB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BAE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DD6BB1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BB7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  id v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_e8_32s40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  id v2 = *(void **)(a1 + 32);
}

void __copy_helper_block_e8_32s40b48r(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 32);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
  id v5 = *(const void **)(a2 + 48);

  _Block_object_assign((void *)(a1 + 48), v5, 8);
}

void __destroy_helper_block_e8_32s40s48r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 8);

  id v2 = *(void **)(a1 + 32);
}

void sub_1DD6BBE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DD6BC23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DD6BC5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32s40b48r56r(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 32);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
  id v5 = *(const void **)(a2 + 56);

  _Block_object_assign((void *)(a1 + 56), v5, 8);
}

void __destroy_helper_block_e8_32s40s48r56r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);

  id v2 = *(void **)(a1 + 32);
}

void sub_1DD6BCBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BCE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BD110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BD75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r48r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  id v4 = *(const void **)(a2 + 48);

  _Block_object_assign((void *)(a1 + 48), v4, 8);
}

void __destroy_helper_block_e8_32r40r48r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  id v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

void sub_1DD6BDC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD6BDF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t isInFieldCollected(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 isInFieldCollected:a1];

  return v3;
}

uint64_t isUCRTAvailable(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 isUCRTAvailable:a1];

  return v3;
}

id copyPCRTToken(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = (void *)[v2 copyPCRTToken:a1];

  return v3;
}

uint64_t isDeviceABrick(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 isDeviceABrick:a1];

  return v3;
}

id getUCRTActivationLockState(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = (id)[v2 getUCRTActivationLockState:a1];

  return v3;
}

id getActivationBuild(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = (id)[v2 getActivationBuild:a1];

  return v3;
}

id createTunnel1SessionInfo(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = (id)[v2 createTunnel1SessionInfo:a1];

  return v3;
}

id createTunnel1ActivationInfo(void *a1, id a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = objc_opt_new();
  id v8 = (id)[v7 createTunnel1ActivationInfo:v6 options:v5 error:a3];

  return v8;
}

id createActivationInfo(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = (id)[v2 createActivationInfo:a1];

  return v3;
}

uint64_t handleActivationInfo(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  uint64_t v5 = [v4 handleActivationInfo:v3 withError:a2];

  return v5;
}

uint64_t handleActivationInfoWithSession(void *a1, id a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = objc_opt_new();
  uint64_t v8 = [v7 handleActivationInfoWithSession:v6 activationSignature:v5 error:a3];

  return v8;
}

uint64_t deactivateDevice(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 deactivateDevice:a1];

  return v3;
}

uint64_t reactivateDevice(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 reactivateDevice:a1];

  return v3;
}

uint64_t unbrickDevice(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 unbrickDevice:a1];

  return v3;
}

uint64_t recertifyDevice(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 recertifyDeviceWithError:a1];

  return v3;
}

id copyActivationRecord(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = (void *)[v2 copyActivationRecord:a1];

  return v3;
}

id issueClientCertificateLegacy(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  id v5 = (id)[v4 issueClientCertificateLegacy:v3 error:a2];

  return v5;
}

void updateBasebandTicket(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a6;
  id v13 = a5;
  id v14 = objc_opt_new();
  if (!v11) {
    id v11 = dispatch_get_global_queue(0, 0);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3254779904;
  v17[2] = __updateBasebandTicket_block_invoke;
  v17[3] = &__block_descriptor_48_e8_32s40bs_e34_v24__0__NSDictionary_8__NSError_16l;
  id v18 = v11;
  id v19 = v12;
  id v15 = v12;
  id v16 = v11;
  [v14 updateBasebandTicket:a2 baaCert:a3 baaIntermediateCert:a4 options:v13 withCompletion:v17];
}

void __updateBasebandTicket_block_invoke(uint64_t a1, int a2, id a3)
{
  id v4 = a3;
  id v6 = *(NSObject **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3254779904;
  v8[2] = __updateBasebandTicket_block_invoke_2;
  v8[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  id v9 = v4;
  id v10 = v5;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __updateBasebandTicket_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __copy_helper_block_e8_32s40b(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 32);
  id v5 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v5, 7);
}

void __destroy_helper_block_e8_32s40s(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

id getDCRTState(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  id v5 = (id)[v4 getDCRTState:v3 withError:a2];

  return v5;
}

id copyDCRT(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  id v5 = (void *)[v4 copyDCRT:v3 withError:a2];

  return v5;
}

void issueDCRT(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_opt_new();
  if (!v5) {
    id v5 = dispatch_get_global_queue(0, 0);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __issueDCRT_block_invoke;
  v11[3] = &__block_descriptor_48_e8_32s40bs_e28_v24__0__NSData_8__NSError_16l;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 issueDCRT:v7 withCompletion:v11];
}

void __issueDCRT_block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = *(NSObject **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3254779904;
  block[2] = __issueDCRT_block_invoke_2;
  block[3] = &__block_descriptor_56_e8_32s40s48bs_e5_v8__0l;
  id v13 = v6;
  id v14 = v7;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

uint64_t __issueDCRT_block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __copy_helper_block_e8_32s40s48b(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 32);
  id v5 = *(id *)(a2 + 40);
  id v6 = *(const void **)(a2 + 48);

  _Block_object_assign((void *)(a1 + 48), v6, 7);
}

void __destroy_helper_block_e8_32s40s48s(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
}

uint64_t issueUCRT(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_opt_new();
  uint64_t v5 = [v4 issueUCRT:v3 withError:a2];

  return v5;
}

void issueCollection(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_opt_new();
  if (!v5) {
    uint64_t v5 = dispatch_get_global_queue(0, 0);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3254779904;
  v11[2] = __issueCollection_block_invoke;
  v11[3] = &__block_descriptor_48_e8_32s40bs_e17_v16__0__NSError_8l;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 issueCollection:v7 withCompletion:v11];
}

void __issueCollection_block_invoke(uint64_t a1, id a2)
{
  id v3 = a2;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3254779904;
  v7[2] = __issueCollection_block_invoke_2;
  v7[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __issueCollection_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t ucrtUpgradeRequired(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 ucrtUpgradeRequired:a1];

  return v3;
}

uint64_t copyLegacyDeviceIdentity(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 copyLegacyDeviceIdentity:a1];

  return v3;
}

uint64_t deleteLegacyDeviceIdentity(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = [v2 deleteLegacyDeviceIdentity:a1];

  return v3;
}

id copyUCRTVersionInfo(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = (void *)[v2 copyUCRTVersionInfo:a1];

  return v3;
}

uint64_t MAGetActivationState()
{
  id v0 = getActivationState(0);
  if ([v0 isEqual:@"Activated"]) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = [v0 isEqual:@"FactoryActivated"];
  }

  return v1;
}

uint64_t MARequestReactivation()
{
  return reactivateDevice(0);
}

uint64_t MAUnbrickDevice()
{
  return unbrickDevice(0);
}

uint64_t MAUCRTActivationLocked()
{
  id v0 = getUCRTActivationLockState(0);
  uint64_t v1 = [v0 isEqualToString:@"UCRTActivationLocked"];

  return v1;
}

id parseDERCertificatesFromChain(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  memset(v16, 0, sizeof(v16));
  unint64_t v15 = 0;
  if (!v3)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", 106, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    goto LABEL_13;
  }
  id v5 = v3;
  unint64_t v6 = [v5 bytes];
  CTParseCertificateSet(v6, v6 + [v5 length], v16, 3, &v15);
  if (v7 || !v15)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", 115, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to parse certificate set: 0x%08x", v7);
LABEL_13:
    id v12 = MobileActivationError;
    id v8 = 0;
    if (!a2) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v8)
  {
    if (v15)
    {
      uint64_t v9 = 0;
      int v10 = 0;
      do
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*(void *)&v16[v9] length:*((void *)&v16[v9] + 1)];
        [v8 setObject:v11 atIndexedSubscript:v9];

        uint64_t v9 = ++v10;
      }
      while (v15 > v10);
    }
    id v8 = v8;
  }
  id v12 = 0;
  if (a2)
  {
LABEL_14:
    if (!v8) {
      *a2 = v12;
    }
  }
LABEL_16:

  return v8;
}

uint64_t MAECreateStorebagRequest(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E88]);
  id v3 = (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://init.itunes.apple.com/bag.xml?ix=5"];
  LODWORD(v4) = NETWORK_TIMEOUT_SECONDS;
  id v5 = (void *)[v2 initWithURL:v3 cachePolicy:0 timeoutInterval:(double)v4];

  if (v5)
  {
    [v5 setValue:@"iOS Device Activator (MobileActivation-1015.60.1)" forHTTPHeaderField:@"User-Agent"];
    uint64_t v6 = 0;
    if (a1) {
      *a1 = v5;
    }
  }
  else
  {
    uint64_t v6 = 0xFFFFFFFFLL;
  }

  return v6;
}

id MAEGetActivationURLFromStorebag(void *a1, void *a2)
{
  return MAEGetActivationURLFromStorebagWithError(a1, a2, 0);
}

id MAEGetActivationURLFromStorebagWithError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5)
  {
    id v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 83, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    id v13 = 0;
    id v7 = 0;
    id v9 = 0;
LABEL_10:
    id v10 = 0;
    goto LABEL_11;
  }
  id v18 = 0;
  id v7 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v18];
  id v8 = v18;
  id v9 = isNSDictionary(v7);

  if (!v9)
  {
    id v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 92, @"com.apple.MobileActivation.ErrorDomain", -1, v8, @"Failed to create dictionary from data.");

    id v13 = 0;
    goto LABEL_10;
  }
  id v9 = (id)[v7 objectForKey:@"bag"];
  id v10 = isNSData(v9);

  if (!v10)
  {
    id v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 98, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Storebag data is missing bag key.");

    id v13 = 0;
LABEL_11:
    id v12 = 0;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v17 = 0;
  id v10 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v17];
  id v11 = v17;

  id v12 = isNSDictionary(v10);
  if (v12)
  {
    id v12 = (id)[v10 objectForKey:@"device-activation"];
    id v13 = isNSString(v12);

    if (v13)
    {
      id v13 = (id)[MEMORY[0x1E4F1CB10] URLWithString:v12];
      if (!a3) {
        goto LABEL_14;
      }
      goto LABEL_12;
    }
    id v16 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 113, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Storebag data is missing device-activation key.");
  }
  else
  {
    id v16 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 107, @"com.apple.MobileActivation.ErrorDomain", -1, v11, @"Failed to create dictionary from data");

    id v13 = 0;
  }
  id v11 = v16;
  if (!a3) {
    goto LABEL_14;
  }
LABEL_12:
  if (!v13) {
    *a3 = v11;
  }
LABEL_14:
  id v14 = v13;

  return v14;
}

__CFString *MAECopyUCRTToken()
{
  return &stru_1F38DE7A8;
}

uint64_t MAEActivateDeviceWithError(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    id v10 = 0;
    uint64_t v7 = activateThroughMAD(v5, v6, &v10);
    id v8 = v10;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = createMobileActivationError((uint64_t)"MAEActivateDeviceWithError", 169, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    uint64_t v7 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if ((v7 & 1) == 0) {
    *a3 = v8;
  }
LABEL_7:

  return v7;
}

uint64_t MAETryActivate(void *a1, unsigned char *a2, void *a3)
{
  int v4 = MAEActivateDeviceWithError(a1, a3, 0);
  if (a2) {
    *a2 = v4;
  }
  return (v4 - 1);
}

uint64_t MAECreateActivationRequestWithError(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = v8;
  if (v8
    && (v10 = (id)[v8 objectForKeyedSubscript:@"FactoryActivation"], v11 = isNSNumber(v10), v11, v10, v11)&& (v12 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", @"FactoryActivation"), int v13 = objc_msgSend(v12, "BOOLValue"), v12, v13))
  {
    id v24 = 0;
    id v25 = 0;
    char v14 = createFactoryActivationRequestFromMAD(&v25, v9, &v24);
    id v15 = v25;
    id v16 = v24;
    if ((v14 & 1) == 0)
    {
      id MobileActivationError = createMobileActivationError((uint64_t)"MAECreateActivationRequestWithError", 222, @"com.apple.MobileActivation.ErrorDomain", -1, v16, @"Failed to create activation request.");
      goto LABEL_11;
    }
  }
  else
  {
    id v22 = 0;
    id v23 = 0;
    char v18 = createTunnel1ActivationRequestFromMAD(&v23, v7, v9, &v22);
    id v15 = v23;
    id v16 = v22;
    if ((v18 & 1) == 0)
    {
      id MobileActivationError = createMobileActivationError((uint64_t)"MAECreateActivationRequestWithError", 227, @"com.apple.MobileActivation.ErrorDomain", -1, v16, @"Failed to create activation request.");
LABEL_11:
      id v19 = MobileActivationError;

      if (a4)
      {
        id v19 = v19;
        uint64_t v20 = 0;
        *a4 = v19;
      }
      else
      {
        uint64_t v20 = 0;
      }
      goto LABEL_14;
    }
  }
  id v19 = v16;
  if (a2)
  {
    id v15 = v15;
    *a2 = v15;
  }
  uint64_t v20 = 1;
LABEL_14:

  return v20;
}

uint64_t MAECreateSessionRequestWithError(void *a1, void *a2, void *a3)
{
  id v10 = 0;
  id v11 = 0;
  LODWORD(v5) = createTunnel1SessionRequestFromMAD(&v11, a2, &v10);
  id v6 = v11;
  id v7 = v10;
  if (v6) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a1 && v5) {
    *a1 = v6;
  }
  if (a3) {
    char v8 = v5;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0) {
    *a3 = v7;
  }

  return v5;
}

uint64_t MAECreateActivationRequest(void *a1, id *a2, void *a3)
{
  id v5 = a1;
  if (MAECreateActivationRequestWithError(0, a2, a3, 0))
  {
    if (v5)
    {
      id v6 = MAEGetActivationURLFromStorebagWithError(v5, 0, 0);
      id v7 = v6;
      uint64_t v8 = 0;
      if (a2 && v6)
      {
        [*a2 setURL:v6];
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

uint64_t MAERecertifyDevice()
{
  return recertifyDevice(0);
}

uint64_t MAECreateActivationInfo()
{
  return 0;
}

uint64_t MAEGetBrickState()
{
  return isDeviceABrick(0);
}

BOOL MAEGetActivationBuild()
{
  id v0 = getActivationBuild(0);
  BOOL v1 = [v0 compare:@"12A" options:64] > 0;

  return v1;
}

id MAEGetActivationState()
{
  return (id)getActivationStateThroughMAD(0);
}

id MAEHandleActivationInfo(void *a1)
{
  BOOL v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  char v4 = handleActivationInfo(v2, 0);

  if ((v4 & 1) == 0) {
    [v3 setObject:@"InvalidActivationRecord" forKeyedSubscript:@"Error"];
  }
  return v3;
}

uint64_t MAEDeactivateDevice()
{
  return deactivateThroughMAD(0);
}

id MAEGetDCRTStateWithError(uint64_t a1)
{
  return getDCRTState(0, a1);
}

id MAECopyDCRTWithError(uint64_t a1)
{
  return copyDCRT(0, a1);
}

void MAEIssueDCRTWithCallback(void *a1, void *a2, id a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3254779904;
  v7[2] = __MAEIssueDCRTWithCallback_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e28_v24__0__NSData_8__NSError_16l;
  id v8 = v5;
  id v6 = v5;
  issueDCRT(a1, a2, v7);
}

uint64_t __MAEIssueDCRTWithCallback_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

void MAEIssueDCRTWithCompletion(void *a1, void *a2, id a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3254779904;
  v7[2] = __MAEIssueDCRTWithCompletion_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e28_v24__0__NSData_8__NSError_16l;
  id v8 = v5;
  id v6 = v5;
  issueDCRT(a1, a2, v7);
}

void __MAEIssueDCRTWithCompletion_block_invoke(uint64_t a1, id a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    id v9 = 0;
    id v10 = 0;
    SecCertificateRef v11 = 0;
    SecCertificateRef v12 = 0;
    goto LABEL_11;
  }
  id v17 = 0;
  id v9 = parseDERCertificatesFromChain(v5, &v17);
  id v8 = v17;
  if (!v9)
  {
    id v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 443, @"com.apple.MobileActivation.ErrorDomain", -1, v8, @"Failed to query certificate(s) from DER data.");

    id v10 = 0;
    SecCertificateRef v11 = 0;
LABEL_9:
    SecCertificateRef v12 = 0;
    goto LABEL_10;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef v14 = (const __CFData *)(id)[v9 objectAtIndexedSubscript:0];
  SecCertificateRef v11 = SecCertificateCreateWithData(v13, v14);

  if (!v11)
  {
    id v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 449, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate from pem data.");

    id v10 = 0;
    goto LABEL_9;
  }
  CFDataRef v15 = (const __CFData *)(id)[v9 objectAtIndexedSubscript:1];
  SecCertificateRef v12 = SecCertificateCreateWithData(v13, v15);

  if (v12)
  {
    v18[0] = v11;
    v18[1] = v12;
    id v10 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    goto LABEL_11;
  }
  id v16 = createMobileActivationError((uint64_t)"MAEIssueDCRTWithCompletion_block_invoke", 455, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to create certificate from pem data.");

  id v10 = 0;
LABEL_10:
  id v8 = v16;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
}

void MAEPerformCollectionWithCompletion(void *a1, void *a2, id a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3254779904;
  v7[2] = __MAEPerformCollectionWithCompletion_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e17_v16__0__NSError_8l;
  id v8 = v5;
  id v6 = v5;
  issueCollection(a1, a2, v7);
}

uint64_t __MAEPerformCollectionWithCompletion_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL MAEGetUCRTOSVersionInfoWithError(void *a1, void *a2, void *a3)
{
  id v14 = 0;
  id v6 = copyUCRTVersionInfo((uint64_t)&v14);
  id v7 = v14;
  id v8 = v7;
  if (v6)
  {
    id v9 = (id)[v6 objectForKeyedSubscript:@"ProductVersion"];
    id v10 = isNSString(v9);

    id v11 = (id)[v6 objectForKeyedSubscript:@"BuildVersion"];
    id v12 = isNSString(v11);

    if (a1 && [v10 length]) {
      *a1 = v10;
    }
    if (a2 && [v12 length])
    {
      id v12 = v12;
      *a2 = v12;
    }
  }
  else
  {
    id v12 = 0;
    id v10 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v6 != 0;
}

uint64_t createXMLRequest(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!v5)
  {
    id v7 = createMobileActivationError((uint64_t)"createXMLRequest", 57, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    id v6 = 0;
    if (!a3)
    {
LABEL_12:
      uint64_t v13 = 0;
      id v9 = 0;
      goto LABEL_13;
    }
LABEL_8:
    id v7 = v7;
    uint64_t v13 = 0;
    id v9 = 0;
    *a3 = v7;
    goto LABEL_13;
  }
  id v17 = 0;
  id v6 = (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v17];
  id v7 = v17;
  if (!v6)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createXMLRequest", 67, @"com.apple.MobileActivation.ErrorDomain", -1, v7, @"Failed to convert dictionary to data");
    goto LABEL_11;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  if (!v8)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"createXMLRequest", 74, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to allocate request.");
LABEL_11:
    id v15 = MobileActivationError;

    id v7 = v15;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  id v9 = v8;
  [v8 setCachePolicy:0];
  LODWORD(v10) = NETWORK_TIMEOUT_SECONDS;
  [v9 setTimeoutInterval:(double)v10];
  [v9 setHTTPMethod:@"POST"];
  id v11 = (id)[NSString stringWithFormat:@"application/xml"];
  [v9 setValue:v11 forHTTPHeaderField:@"Content-Type"];

  id v12 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "length"));
  [v9 setValue:v12 forHTTPHeaderField:@"Content-Length"];

  [v9 setHTTPBody:v6];
  if (a2)
  {
    id v9 = v9;
    *a2 = v9;
  }
  uint64_t v13 = 1;
LABEL_13:

  return v13;
}

id security_create_external_representation(__SecKey *a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    a2 = createMobileActivationError((uint64_t)"security_create_external_representation", 328, @"com.apple.MobileActivation.ErrorDomain", -2, 0, @"Invalid input.");
    CFDictionaryRef v6 = 0;
    if (a3)
    {
LABEL_11:
      a2 = a2;
      id v11 = 0;
      *a3 = a2;
      goto LABEL_12;
    }
LABEL_7:
    id v11 = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v5 = SecKeyCopyAttributes(a1);
  CFDictionaryRef v6 = v5;
  if (!v5)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"security_create_external_representation", 334, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to copy RK attributes.");
    goto LABEL_10;
  }
  id v7 = (id)[(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F3B8B0]];
  if (!v7)
  {
    id MobileActivationError = createMobileActivationError((uint64_t)"security_create_external_representation", 340, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to encode RK as data.");
LABEL_10:
    a2 = MobileActivationError;
    if (a3) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  id v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F3BD20];
  id v10 = (id)[(__CFDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F3BD20]];

  id v11 = v8;
  if (a2)
  {
    uint64_t v15 = v9;
    id v12 = (id)[NSNumber numberWithBool:v10 != 0];
    v16[0] = v12;
    *a2 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    a2 = 0;
  }
LABEL_12:

  return v11;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

void CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    id v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      void v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      X509CertificateParse((unint64_t *)v17, &v15);
      if (v13) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      *id v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    if (a5) {
      *a5 = v6;
    }
  }
}

void X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  unint64_t v66 = 0;
  uint64_t v67 = 0;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_183;
  }
  unint64_t v64 = *a2;
  unint64_t v65 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  if (!ccder_blob_decode_tl()) {
    return;
  }
  uint64_t v10 = v67;
  unint64_t v11 = v64;
  unint64_t v12 = v67 + v64 - v4;
  if (__CFADD__(v67, v64 - v4)) {
    goto LABEL_185;
  }
  if (v12 > v5 - v4) {
    goto LABEL_183;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v12;
  unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v11, v10)) {
    goto LABEL_184;
  }
  unint64_t v13 = v11 + v10;
  if (v11 > v13 || v13 > v65) {
    goto LABEL_183;
  }
  unint64_t v62 = v11;
  unint64_t v63 = v13;
  unint64_t v60 = v11;
  unint64_t v61 = v13;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v60, v66)) {
      goto LABEL_184;
    }
    if (!ccder_blob_decode_uint64() || v60 != v60 + v66) {
      return;
    }
    if (v60 + v66 > v61) {
      goto LABEL_183;
    }
    unint64_t v62 = v60 + v66;
    unint64_t v63 = v61;
  }
  if (!ccder_blob_decode_tl()) {
    return;
  }
  unint64_t v15 = v62;
  unint64_t v14 = v63;
  if (v63 < v62) {
    goto LABEL_183;
  }
  unint64_t v16 = v66;
  if (v66 > v63 - v62) {
    goto LABEL_183;
  }
  *(void *)(a1 + 136) = v62;
  *(void *)(a1 + 144) = v16;
  if (__CFADD__(v15, v16)) {
    goto LABEL_184;
  }
  unint64_t v17 = v15 + v16;
  if (v15 > v17 || v17 > v14) {
    goto LABEL_183;
  }
  unint64_t v62 = v17;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v62, (unint64_t *)(a1 + 152))
    || !ccder_blob_decode_tl())
  {
    return;
  }
  unint64_t v19 = v62;
  unint64_t v18 = v63;
  if (v63 < v62) {
    goto LABEL_183;
  }
  unint64_t v20 = v66;
  if (v66 > v63 - v62) {
    goto LABEL_183;
  }
  *(void *)(a1 + 120) = v62;
  *(void *)(a1 + 128) = v20;
  if (__CFADD__(v19, v20)) {
    goto LABEL_184;
  }
  unint64_t v21 = v19 + v20;
  if (v19 > v21 || v21 > v18) {
    goto LABEL_183;
  }
  unint64_t v62 = v21;
  if (!ccder_blob_decode_tl()) {
    return;
  }
  unint64_t v23 = v62;
  unint64_t v22 = v63;
  if (v63 < v62) {
    goto LABEL_183;
  }
  unint64_t v24 = v66;
  if (v66 > v63 - v62) {
    goto LABEL_183;
  }
  *(void *)(a1 + 72) = v62;
  *(void *)(a1 + 80) = v24;
  if (__CFADD__(v23, v24)) {
    goto LABEL_184;
  }
  unint64_t v25 = v23 + v24;
  if (v23 > v25 || v25 > v22) {
    goto LABEL_183;
  }
  unint64_t v62 = v25;
  if (!ccder_blob_decode_tl()) {
    return;
  }
  unint64_t v26 = v62;
  unint64_t v27 = v63;
  if (v63 < v62) {
    goto LABEL_183;
  }
  unint64_t v28 = v66;
  if (v66 > v63 - v62) {
    goto LABEL_183;
  }
  *(void *)(a1 + 104) = v62;
  *(void *)(a1 + 112) = v28;
  if (__CFADD__(v26, v28)) {
    goto LABEL_184;
  }
  unint64_t v29 = v26 + v28;
  if (v26 > v26 + v28 || v29 > v27) {
    goto LABEL_183;
  }
  unint64_t v62 = v26 + v28;
  if (!ccder_blob_decode_tl()) {
    return;
  }
  unint64_t v30 = v62;
  unint64_t v31 = v66;
  unint64_t v32 = v62 - v29 + v66;
  if (__CFADD__(v62 - v29, v66)) {
    goto LABEL_185;
  }
  if (v32 > v27 - v29) {
    goto LABEL_183;
  }
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v32;
  if (__CFADD__(v30, v31)) {
    goto LABEL_184;
  }
  unint64_t v33 = v30 + v31;
  if (v30 > v33 || v33 > v63) {
    goto LABEL_183;
  }
  unint64_t v61 = v63;
  unint64_t v62 = v33;
  unint64_t v60 = v33;
  if (ccder_blob_decode_tl()) {
    return;
  }
  if (v62 > v63) {
    goto LABEL_183;
  }
  unint64_t v60 = v62;
  unint64_t v61 = v63;
  if (ccder_blob_decode_tl()) {
    return;
  }
  if (v62 > v63) {
    goto LABEL_183;
  }
  unint64_t v60 = v62;
  unint64_t v61 = v63;
  if (!ccder_blob_decode_tl())
  {
LABEL_162:
    if (*(void *)(a1 + 32) < 3uLL)
    {
      if (v62 != v63) {
        return;
      }
LABEL_167:
      if (__CFADD__(v64, v67)) {
        goto LABEL_184;
      }
      if (v64 > v64 + v67 || v64 + v67 > v65) {
        goto LABEL_183;
      }
      v64 += v67;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 40))) {
        return;
      }
      *(void *)&v68[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v68[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v58 = 0;
      if (!ccder_blob_decode_bitstring()) {
        return;
      }
      if (v58 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v68[0] + 1) >= *(void *)&v68[0])
        {
          unint64_t v49 = (v58 + 7) >> 3;
          if (v49 <= *((void *)&v68[0] + 1) - *(void *)&v68[0])
          {
            *(void *)(a1 + 56) = *(void *)&v68[0];
            *(void *)(a1 + 64) = v49;
            unint64_t v50 = v65;
            if (v64 <= v65)
            {
              *a2 = v64;
              a2[1] = v50;
              return;
            }
          }
        }
        goto LABEL_183;
      }
LABEL_185:
      __break(0x5500u);
LABEL_186:
      __break(0x5507u);
      return;
    }
    if (v63 <= a2[1] && *a2 <= v63)
    {
      *a2 = v63;
      goto LABEL_167;
    }
LABEL_183:
    __break(0x5519u);
    goto LABEL_184;
  }
  unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v60, v66)) {
    goto LABEL_184;
  }
  if (v60 > v60 + v66 || v60 + v66 > v61) {
    goto LABEL_183;
  }
  unint64_t v58 = v60;
  unint64_t v59 = v60 + v66;
  if (!ccder_blob_decode_tl() || !v66) {
    return;
  }
  unint64_t v34 = v58;
  if (__CFADD__(v58, v66)) {
LABEL_184:
  }
    __break(0x5513u);
  unint64_t v35 = v58 + v66;
  if (v58 > v58 + v66 || v35 > v59) {
    goto LABEL_183;
  }
  unint64_t v59 = v58 + v66;
  *(unsigned char *)(a1 + 266) = 0;
  memset(&v68[2], 0, 128);
  if (a3) {
    BOOL v36 = a4 == 0;
  }
  else {
    BOOL v36 = 1;
  }
  int v37 = !v36;
  memset(v68, 0, 32);
  if (v34 < v35)
  {
    unsigned __int8 v51 = 0;
    int v38 = 0;
    do
    {
      unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v57 = 0xAAAAAAAAAAAAAAAALL;
      char v55 = 0;
      uint64_t v54 = 0;
      if ((ccder_blob_decode_tl() & 1) == 0) {
        return;
      }
      unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v58, v54)) {
        goto LABEL_184;
      }
      if (v58 > v58 + v54 || v58 + v54 > v59) {
        goto LABEL_183;
      }
      unint64_t v52 = v58;
      unint64_t v53 = v58 + v54;
      if (!ccder_blob_decode_tl()) {
        return;
      }
      if (v53 < v52 || v66 > v53 - v52) {
        goto LABEL_183;
      }
      unint64_t v56 = v52;
      unint64_t v57 = v66;
      if (__CFADD__(v52, v66)) {
        goto LABEL_184;
      }
      if (v52 > v52 + v66 || v52 + v66 > v53) {
        goto LABEL_183;
      }
      v52 += v66;
      if (!der_get_BOOLean(&v52, 1, &v55) || !ccder_blob_decode_tl()) {
        return;
      }
      if (__CFADD__(v52, v66)) {
        goto LABEL_184;
      }
      if (v53 != v52 + v66) {
        return;
      }
      if (v37 && !compare_octet_string_raw((uint64_t)&v56, a3, a4))
      {
        if (v53 < v52) {
          goto LABEL_183;
        }
        unint64_t v40 = v66;
        if (v66 > v53 - v52) {
          goto LABEL_183;
        }
        *(void *)(a1 + 248) = v52;
        *(void *)(a1 + 256) = v40;
      }
      if (v57 == 3)
      {
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 15)
        {
          if ((v38 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
            return;
          }
          v38 |= 1u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 19)
        {
          if ((v38 & 2) != 0
            || (X509ExtensionParseBasicConstraints(&v52, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0)
          {
            return;
          }
          v38 |= 2u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 35)
        {
          if ((v38 & 4) != 0
            || (X509ExtensionParseAuthorityKeyIdentifier(&v52, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
          {
            return;
          }
          v38 |= 4u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 14)
        {
          if ((v38 & 8) != 0
            || (X509ExtensionParseSubjectKeyIdentifier(&v52, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
          {
            return;
          }
          v38 |= 8u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 37)
        {
          if ((v38 & 0x10) != 0
            || (X509ExtensionParseExtendedKeyUsage(&v52, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
          {
            return;
          }
          v38 |= 0x10u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(unsigned char *)(v56 + 2) == 17)
        {
          if ((v38 & 0x20) != 0
            || (X509ExtensionParseSubjectAltName(&v52, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
          {
            return;
          }
          v38 |= 0x20u;
          goto LABEL_152;
        }
      }
      else if (v57 >= 8 && *(_DWORD *)v56 == -2042067414 && *(_DWORD *)(v56 + 3) == 1684273030)
      {
        if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v56, (uint64_t)v68, v51)) {
          return;
        }
        X509ExtensionParseAppleExtension(&v52, v56, v57, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v37);
        if (!v48) {
          return;
        }
        if (v51 == 0xFF) {
          goto LABEL_186;
        }
        ++v51;
        goto LABEL_152;
      }
      if (__CFADD__(v52, v66)) {
        goto LABEL_184;
      }
      if (v52 > v52 + v66 || v52 + v66 > v53) {
        goto LABEL_183;
      }
      v52 += v66;
      if (v55) {
        *(unsigned char *)(a1 + 266) = 1;
      }
LABEL_152:
      if (v52 != v53) {
        return;
      }
      if (__CFADD__(v58, v54)) {
        goto LABEL_184;
      }
      unint64_t v34 = v58 + v54;
      if (v58 > v58 + v54) {
        goto LABEL_183;
      }
      unint64_t v35 = v59;
      if (v34 > v59) {
        goto LABEL_183;
      }
      v58 += v54;
    }
    while (v34 < v59);
  }
  if (v34 == v35)
  {
    if (v34 > v63 || v62 > v34) {
      goto LABEL_183;
    }
    unint64_t v62 = v34;
    goto LABEL_162;
  }
}

uint64_t der_get_BOOLean(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

void X509ExtensionParseAppleExtension(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      X509ExtensionParseServerAuthMarker((uint64_t)a1, a2, a3, a4, a5);
      return;
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        if (!ccder_blob_check_null()) {
          return;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        if (!ccder_blob_check_null()) {
          return;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        if (!ccder_blob_check_null()) {
          return;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        X509ExtensionParseMFI4Properties(a1, a4, a5);
        return;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *a1;
        unint64_t v51 = a1[1];
        if (a5)
        {
          if (v52 > v51)
          {
LABEL_280:
            __break(0x5519u);
            return;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *a1 = v51;
          return;
        }
        goto LABEL_280;
      }
    }
LABEL_242:
    unint64_t v52 = *a1;
    unint64_t v51 = a1[1];
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      X509ExtensionParseMFISWAuth(a1, a4, a5);
      return;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      if (!ccder_blob_check_null()) {
        return;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      X509ExtensionParseGenericSSLMarker();
      return;
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    X509ExtensionParseComponentAuth(a1, a4, a5);
    return;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    if (der_get_BOOLean(a1, 0, &v56))
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    X509ExtensionParseCertifiedChipIntermediate(a1, a4, a5);
    return;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    X509ExtensionParseMFIAuthv3Leaf(a1);
    return;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    if (!ccder_blob_check_null()) {
      return;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    if (!ccder_blob_check_null()) {
      return;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    if (!ccder_blob_check_null()) {
      return;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    if (!ccder_blob_check_null()) {
      return;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  X509ExtensionParseDeviceAttestationIdentity(a1, a4, a5);
}

void X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = a2[1];
  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = *a2;
    X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
    if (!v11)
    {
      if (v10 >= 0x5555555555555556)
      {
        __break(0x5513u);
      }
      else
      {
        if (*a2 != v10 - 0x5555555555555556) {
          return;
        }
        unint64_t v12 = v10 - v8 - 0x5555555555555556;
        if (v10 - v8 < 0x5555555555555556)
        {
          if (v9 >= v8 && v12 <= v9 - v8)
          {
            *a1 = v8;
            a1[1] = v12;
            X509PolicyCheckForBlockedKeys((uint64_t)a1);
            return;
          }
LABEL_12:
          __break(0x5519u);
          return;
        }
      }
      __break(0x5500u);
      goto LABEL_12;
    }
  }
}

void X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

void X509ExtensionParseMFI4Properties(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  if (v3 - *a1 == 32)
  {
    if (a3)
    {
      if (v4 > v3) {
        goto LABEL_12;
      }
      *a3 = v4;
      a3[1] = 32;
    }
    *a2 |= 0xC00000000uLL;
    if (v4 >= 0xFFFFFFFFFFFFFFE0)
    {
LABEL_13:
      __break(0x5513u);
      CFRelease(a1);
      return;
    }
    unint64_t v5 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v5)
    {
      *a1 = v5;
      return;
    }
LABEL_12:
    __break(0x5519u);
    goto LABEL_13;
  }
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1F40F6AD0](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1F40F6DC8]();
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1F40F6E38](key);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1F40CA820]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1F40CA848]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1F40CA850]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
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

void objc_enumerationMutation(id obj)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}